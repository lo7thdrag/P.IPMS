unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Tlhelp32, ShellAPI, Menus,

  uTCPDatatype, uTCPServer, uNetUDPnode, uDataVoipRecord, Logger, MMSystem,
  uLoadSetting, uThreadTimer, uFastLogger;

type


  EShowDeviceFailMsgStatus = (dfShow, dfDoNotShow, dfPending);

  TRecWaveOutCaps = record
    wMid, wPid: word;
    vDriverVersion: Integer;
    szPname: string;
    dwFormat,
    dwSupport: Cardinal;
    wChannel,
    wReserved: word
  end;

  TfConnectorFrm = class(TForm)
    pnlName: TPanel;
    pnlClient: TPanel;
    Memo1: TMemo;
    ppMenu: TPopupMenu;
    miHide1: TMenuItem;
    miShow1: TMenuItem;
    miExit1: TMenuItem;
    tmrInternalRunChk: TTimer;
    tmrDeviceTender: TTimer;
    N1: TMenuItem;
    Showwarningonfaileddevicecheck1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure miHide1Click(Sender: TObject);
    procedure miShow1Click(Sender: TObject);
    procedure miExit1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pnlClientClick(Sender: TObject);
    procedure tmrInternalRunChkTimer(Sender: TObject);
    procedure tmrDeviceTenderTimer(Sender: TObject);
    procedure Showwarningonfaileddevicecheck1Click(Sender: TObject);
  protected
    procedure ICSDataPhone(apRec: PAnsiChar; aSize: Word);
    procedure ICSDataJam(apRec: PAnsiChar; aSize: Word);
    procedure ICSData(apRec: PAnsiChar; aSize: Word);
    procedure ServerRespon(apRec: PAnsiChar; aSize: Word);
  private
    { Private declarations }
    //Tray Icon
    TrayIconData: TNotifyIconData;

    { TimerNetwork }
    FNetworkTimer : TPrecisseTimer;

    DelLogsBatPath, InternalLogFilePath: string;

    FSoundDeviceCheckPassed: Boolean;
    FShowDeviceCheckFailedMsg: Boolean;

    sIniPhoneExternal,
    sIniPhoneInternal: string;

    { Network }
    procedure NetworkGetpacketOnRunning(const dt : Double);

    //Search n Kill Task
    function KillTask(ExeFileName: string): Integer;
    function processExists(exeFileName: string): Boolean;
    function KillProcess(ExeName: string): Boolean;

    //On CLient Connect (Phone)
    Procedure OnClientConnect(Const Cmd : string);
    procedure OnClientDisConnect(Const Cmd : string);

    function SoundHardwareChecks(var DevErrMsg: string): Boolean;
    procedure SendClientTerminationOnHwFail;

    //Tray Icon
    procedure SetIconTray;
    procedure TrayMessage(var Msg: TMessage); message WM_ICONTRAY;
    function CheckValidSoundDevice(IntwvIn, IntwvOut, ExtwvIn, ExtwvOut: Integer; var ErrMsg: string): Boolean;
  public
    ServerArchos : TTCPServer;
    BrigdeArchos : TNetUDPNode;

    //Logger: TLogFile;
    Logger: TFastLogger;
    Config : TIniSet;

    ShowDeviceFailMsgStat: EShowDeviceFailMsgStatus;

    { Public declarations }
  end;

var
  fConnectorFrm: TfConnectorFrm;

implementation

uses uDevErrMsg;

{$R *.dfm}

//===============================================================
//===================Kill Task===================================
procedure TfConnectorFrm.pnlClientClick(Sender: TObject);
begin

  if (MessageDlg('Kill all running voip engines?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin

    KillProcess(Config.ExternalExeName);
    KillProcess(Config.InternalExeName);
    KillProcess(Config.NoRXExeName);
    KillProcess(Config.NonHFExeName);
    KillProcess(Config.JammingPlayerExeName);

  end;

end;

function TfConnectorFrm.processExists(exeFileName: string): Boolean;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  Result := False;
  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
      UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
      UpperCase(ExeFileName))) then
    begin
      Result := True;
    end;
    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

function TfConnectorFrm.KillTask(ExeFileName: string): Integer;
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  Result := 0;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
      UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
      UpperCase(ExeFileName))) then
      Result := Integer(TerminateProcess(
                        OpenProcess(PROCESS_TERMINATE,
                                    BOOL(0),
                                    FProcessEntry32.th32ProcessID),
                                    0));
     ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

function TfConnectorFrm.KillProcess(ExeName: string): Boolean;
begin
  if processExists(ExeName) then
   begin
      Logger.Log(UnitName+':pnlClientClick','Killing ' + ExeName + ' ...');
      KillTask(ExeName);
      Logger.Log(UnitName+':pnlClientClick','Killing ' + ExeName + ' done.');
      Memo1.Lines.Add('Kill '+ExeName);
   end
  else
   Logger.Log(UnitName+':pnlClientClick',ExeName+' is not running ...');
end;

procedure TfConnectorFrm.NetworkGetpacketOnRunning(const dt: Double);
begin
  ServerArchos.getPacket;
end;

//===========================================================================

//===========================================================================
//==================Tray Icon================================================
procedure TfConnectorFrm.TrayMessage(var Msg: TMessage);
var
  P : Tpoint;
begin
  case Msg.lParam of
    WM_RBUTTONDOWN:
    begin
      SetForegroundWindow(Handle);
      GetCursorPos(p);
      ppMenu.Popup(p.x, p.y);
      PostMessage(Handle, WM_NULL, 0, 0);
    end;
  end;
end;

procedure TfConnectorFrm.SetIconTray;
var
  hMenuHandle: Integer;
begin
  hMenuHandle := GetSystemMenu(Handle, False);
  if (hMenuHandle <> 0) then
  begin
    DeleteMenu(hMenuHandle, SC_CLOSE, MF_BYCOMMAND);
    //DeleteMenu(hMenuHandle, SC_MINIMIZE, MF_BYCOMMAND);
    //DeleteMenu(hMenuHandle, SC_MAXIMIZE, MF_BYCOMMAND);
  end;

  Memo1.Lines.Add('Applicatin Running');

  with TrayIconData do
  begin
    //cbSize := SizeOf(TrayIconData);
    Wnd := Handle;
    uID := 0;
    uFlags := NIF_MESSAGE + NIF_ICON + NIF_TIP;
    uCallbackMessage := WM_ICONTRAY;
    hIcon := Application.Icon.Handle;
    StrPCopy(szTip, Application.Title);
  end;

  Shell_NotifyIcon(NIM_ADD, @TrayIconData);
end;

procedure TfConnectorFrm.Showwarningonfaileddevicecheck1Click(Sender: TObject);
begin
  ShowDeviceFailMsgStat := dfShow;
end;

function TfConnectorFrm.SoundHardwareChecks(var DevErrMsg: string): Boolean;
var
  s: string;
  IntwvIn, IntwvOut, ExtwvIn, ExtwvOut: Integer;
begin

  Memo1.Lines.Add('Checking minimum hardware requirement..');

  // clear previous clvoip logs
  ShellExecute (application.handle, 'open', 'cmd', PChar(DelLogsBatPath), nil, SW_MINIMIZE);

//  GetWavesDevIDSettings(Config.InternalExeName, IntwvIn, IntwvOut);
  GetWavesDevIDSettings(sIniPhoneInternal, IntwvIn, IntwvOut);
  s:= 'Internals: WaveInID: ' + IntToStr(IntwvIn) + ', WaveOutID: ' + IntToStr(IntwvOut);
  Memo1.Lines.Add(s);
//  GetWavesDevIDSettings(Config.ExternalExeName, ExtwvIn, ExtwvOut);
  GetWavesDevIDSettings(sIniPhoneExternal, ExtwvIn, ExtwvOut);
  s:= 'Externals: WaveInID: ' + IntToStr(ExtwvIn) + ', WaveOutID: ' + IntToStr(ExtwvOut);
  Memo1.Lines.Add(s);

  Result := CheckValidSoundDevice(IntwvIn, IntwvOut, ExtwvIn, ExtwvOut, s);
  DevErrMsg := s;

end;

procedure TfConnectorFrm.tmrDeviceTenderTimer(Sender: TObject);
var
  s, devErrMsg: string;
  recOrder: TRecOrder;
begin
  {
  FSoundDeviceCheckPassed := SoundHardwareChecks;

  if not FSoundDeviceCheckPassed then begin

    Memo1.Lines.Add(s);
    Memo1.Lines.Add('Minimum hardware requirement not met. Shutting down phone!');

    recOrder.OrderMsg := s;
    recOrder.OrderVal := 0;

    BrigdeArchos.SendData(CPID_Termination_Option, @recOrder);

    Sleep(10);

    Application.Terminate;

  end else
    Memo1.Lines.Add('Sound hardware OK.');
  }

  FSoundDeviceCheckPassed := SoundHardwareChecks(devErrMsg);

  if not FSoundDeviceCheckPassed then begin

    s := 'Minimum hardware requirement not met. Showing warning..';
    Memo1.Lines.Add(s);

    if ShowDeviceFailMsgStat = dfShow then begin

      recOrder.OrderMsg := s;
      recOrder.OrderVal := 0;
      BrigdeArchos.SendData(CPID_Termination_Option, @recOrder);
//      MessageDlg(s, mtWarning, [mbOK], 0);

      frmDeviceFailedMsg.anErrMsg := devErrMsg;
      frmDeviceFailedMsg.Show;

      ShowDeviceFailMsgStat := dfPending; // wait for user to ack the warning or disable it

    end;

  end else
    Memo1.Lines.Add('Sound hardware OK.');

end;

procedure TfConnectorFrm.tmrInternalRunChkTimer(Sender: TObject);
var
  InternalRunsOK: Boolean;
  searchResult : TSearchRec;
  fcount: Integer;
  s: String;
  recOrder: TRecOrder;
begin

  fcount := 0;
  if FindFirst(InternalLogFilePath, faAnyFile, searchResult) = 0 then begin
    repeat
      Inc(fcount);
    until FindNext(searchResult) <> 0;

    // Must free up resources used by these successful finds
    FindClose(searchResult);
  end;


  InternalRunsOK := fcount > 0;

  if InternalRunsOK then begin
    Memo1.Lines.Add('Finished checking engine. Voip engine runs OK.');
    tmrInternalRunChk.Enabled := False;
  end
  else begin
    tmrInternalRunChk.Tag := tmrInternalRunChk.Tag + 1;

    Memo1.Lines.Add('Waiting for Voip engine to run..');

    if (tmrInternalRunChk.Tag > 60) then begin

      Memo1.Lines.Add('Finished checking engine.');
      Memo1.Lines.Add('Problem running voip engine. Failed to run COMM!');

      s := 'Problem running Phone. Click OK to restart, CANCEL to shutdown Phone.';
      recOrder.OrderMsg := s;
      recOrder.OrderVal := 1;
      BrigdeArchos.SendData(CPID_Termination_Option, @recOrder);

      tmrInternalRunChk.Enabled := False;

    end;

  end;


end;

procedure TfConnectorFrm.miHide1Click(Sender: TObject);
begin
  Logger.Log(UnitName+':miHide1Click','Hiding Form ...');
  fConnectorFrm.Hide;
end;

procedure TfConnectorFrm.miShow1Click(Sender: TObject);
begin
  Logger.Log(UnitName+':miShow1Click','Showing Form ...');
  fConnectorFrm.Show;
end;

procedure TfConnectorFrm.miExit1Click(Sender: TObject);
begin
  Logger.Log(UnitName+':miExit1Click','Closing Application ...');
  Logger.Log(UnitName+':miExit1Click','Unsetting tray icon ...');
  Shell_NotifyIcon(NIM_DELETE, @TrayIconData);
  Logger.Log(UnitName+':miExit1Click','Unsetting tray icon done.');
  Close;
end;


function TfConnectorFrm.CheckValidSoundDevice(IntwvIn, IntwvOut, ExtwvIn,
  ExtwvOut: Integer; var ErrMsg: string): Boolean;

const
  C_ERR_NO_DEV = 'No soundcard present or driver error';
  C_ERR_DEV_ID_FAULT = 'Specified device ID not exists or no headset plugged in.';

var
  woCap: TRecWaveOutCaps;
  isValid: Boolean;
begin
  Result := False;

  isValid := True;
  ErrMsg := '';

  try

    // internal wavein
    case (waveInGetDevCaps(IntwvIn, @woCap, SizeOf(woCap))) of

      MMSYSERR_NODRIVER: begin
        isValid := False;
        ErrMsg := C_ERR_NO_DEV;
      end;

      MMSYSERR_BADDEVICEID: begin
        isValid := False;
        ErrMsg := C_ERR_DEV_ID_FAULT;
      end;

    end;
    // internal waveout
    case (waveOutGetDevCaps(IntwvOut, @woCap, SizeOf(woCap))) of

      MMSYSERR_NODRIVER: begin
        isValid := False;
        ErrMsg := C_ERR_NO_DEV;
      end;

      MMSYSERR_BADDEVICEID: begin
        isValid := False;
        ErrMsg := C_ERR_DEV_ID_FAULT;
      end;

    end;

    // external wavein
    case (waveInGetDevCaps(ExtwvIn, @woCap, SizeOf(woCap))) of

      MMSYSERR_NODRIVER: begin
        isValid := False;
        ErrMsg := C_ERR_NO_DEV;
      end;

      MMSYSERR_BADDEVICEID: begin
        isValid := False;
        ErrMsg := C_ERR_DEV_ID_FAULT;
      end;

    end;
    // external waveout
    case (waveInGetDevCaps(ExtwvOut, @woCap, SizeOf(woCap))) of

      MMSYSERR_NODRIVER: begin
        isValid := False;
        ErrMsg := C_ERR_NO_DEV;
      end;

      MMSYSERR_BADDEVICEID: begin
        isValid := False;
        ErrMsg := C_ERR_DEV_ID_FAULT;
      end;

    end;

    Result := isValid;

  except
    Result := False;
  end;

end;

//===========================================================================

//=================Form Create===============================================
procedure TfConnectorFrm.FormCreate(Sender: TObject);
var
//   s,
   Port : string;
//   recOrder: TRecOrder;

begin
  Config := TIniSet.Create;
  Config.Location := ExtractFileDir(Application.ExeName) + '\' + 'SettingPhone.ini';
  Config.LoadSet(Config.Location);

  DelLogsBatPath := 'c del_log.bat';// '..\Phone\del_log.bat';
  InternalLogFilePath := 'clVoip_internal*.log';

  FShowDeviceCheckFailedMsg := True;
//  FSoundDeviceCheckPassed := SoundHardwareChecks; //moved to DeviceTender timer

  Logger:= TFastLogger.Create;
  Logger.IsLog:= Config.isConnectorLog;
  Logger.FileName:= ChangeFileExt(Application.ExeName,'-'+FormatDateTime('yyyymmdd',now)+'.log');
  Logger.Init;

  Logger.Log(UnitName+':FormCreate','Log started.');

  Logger.Log(UnitName+':FormCreate','Setting tray icon ...');
  SetIconTray;
  Logger.Log(UnitName+':FormCreate','Setting tray icon done.');

  Logger.Log(UnitName+':FormCreate','Creating TCPServer object.');
  ServerArchos := TTCPServer.Create;
  ServerArchos.OnClient_Connect := OnClientConnect;
  ServerArchos.OnClient_DisConnect := OnClientDisconnect;
  ServerArchos.RegisterProcedure(CPID_ICSData, ICSData, sizeof(TICSData));
  ServerArchos.RegisterProcedure(CPID_ICSDataPhone, ICSDataPhone, sizeof(TICSDataPhone));
  ServerArchos.RegisterProcedure(CPID_ICSDataJam, ICSDataJam, sizeof(TICSDataJam));
  ServerArchos.RegisterProcedure(CPID_ResponPTT, nil, SizeOf(TICSResponPTT));

  ServerArchos.RegisterProcedure(CPID_Termination_Option, nil, SizeOf(TRecOrder));

  Logger.Log(UnitName+':FormCreate','Creating NetUDPNode object.');
  BrigdeArchos := TNetUDPNode.Create;
  BrigdeArchos.RegisterProcedure(CPID_ICSDataPhone, nil, sizeof(TICSDataPhone));
  BrigdeArchos.RegisterProcedure(CPID_ICSDataJam, nil, sizeof(TICSDataJam));

//  // moved to DeviceTender timer
//  if not FSoundDeviceCheckPassed then begin
//
//    Memo1.Lines.Add(s);
//    Memo1.Lines.Add('Minimum hardware requirement not met. Shutting down phone!');
//
//    recOrder.OrderMsg := s;
//    recOrder.OrderVal := 0;
//
//    BrigdeArchos.SendData(CPID_Termination_Option, @recOrder);
//
//    Sleep(10);
//
//    Application.Terminate;
//
//  end else
//    Memo1.Lines.Add('Sound hardware OK.');

  Logger.Log(UnitName+':FormCreate','Loading config from file ' + Config.Location);

  Port := Config.portListenConnector;

  ServerArchos.Listen(Port);

  Memo1.Lines.Add('Server Listening @ : ' + Port);
  Logger.Log(UnitName+':FormCreate','Server Listening at port ' + Port);

  Logger.Log(UnitName+':FormCreate','Creating NetworkTimer object.');
  FNetworkTimer := TPrecisseTimer.Create;
  FNetworkTimer.OnRunning := NetworkGetpacketOnRunning;
  FNetworkTimer.Enabled := True;

  sIniPhoneExternal := ExtractFilePath(Application.ExeName)+Config.ExternalIniName;
  sIniPhoneInternal := ExtractFilePath(Application.ExeName)+Config.InternalIniName;

  ShowDeviceFailMsgStat := dfShow;
  //tmrDeviceTender.Enabled := True;

end;

procedure TfConnectorFrm.OnClientConnect(Const Cmd: string);
begin
  Memo1.Lines.Add('Connected @' + Cmd);
  pnlClient.Caption := 'Client ' + Cmd + '  ';
  Logger.Log(UnitName+':OnClientConnect','Client Connected ' + Cmd);

  SendClientTerminationOnHwFail;

end;

procedure TfConnectorFrm.OnClientDisConnect(Const Cmd: string);
begin
  Memo1.Lines.Add('DisConnected @' + Cmd);
  pnlClient.Caption := 'Waiting  ';
  Logger.Log(UnitName+':OnClientDisConnect','Client DisConnected ' + Cmd);
end;

procedure TfConnectorFrm.FormDestroy(Sender: TObject);
begin
  Logger.Log(UnitName+':FormDestroy','Stopping server ...');
  ServerArchos.Stop;
  ServerArchos.UnregisterAllProcedure;
  Logger.Log(UnitName+':FormDestroy','Server stopped.');
  Logger.Log(UnitName+':FormDestroy','Destroying TCPServer object.');
  ServerArchos.Free;

  Logger.Log(UnitName+':FormDestroy','Destroying NetUDPNode object.');
  BrigdeArchos.Destroy;
  Logger.Log(UnitName+':FormDestroy','Destroying NetworkTimer object.');
  FNetworkTimer.Free;

  Logger.Log(UnitName+':FormDestroy','Log stopped.');
  Logger.InsertEmptyLine;
  Logger.CustomLog('================================================================================');
  Logger.InsertEmptyLine;
  Logger.Free;
  Config.Free;
end;

procedure TfConnectorFrm.ICSData(apRec: PAnsiChar; aSize: Word);
var
  RecICS : ^TICSData;

  ModeICS : integer;
  ParamPhone : string;
  ParamJam: string;
  AllExe : integer;
  ipSender: string;

  sExePhoneExternal,
  sExePhoneInternal,
  sExePhoneNoRx,
  sExePhoneNonHF,
  sExePhoneHF,
  sExePhoneUHF,
  sExePhoneUWT,
  sExePhoneFM       : string;


  sExeJamm : string;

  i : integer;
  ErrCode: Cardinal;

begin
  RecICS := @aprec^;

  ModeICS    := RecICS^.Mode;
  ParamPhone := RecICS^.ParamPhone;
  ParamJam   := RecICS^.ParamJam;
  ipSender   := LongIp_To_StrIp(RecICS^.PacketID.ipSender);

  sExePhoneExternal := ExtractFilePath(Application.ExeName)+Config.ExternalExeName;
  sExePhoneInternal := ExtractFilePath(Application.ExeName)+Config.InternalExeName;
  sExePhoneNoRx     := ExtractFilePath(Application.ExeName)+Config.NoRXExeName;
  sExePhoneNonHF    := ExtractFilePath(Application.ExeName)+Config.NonHFExeName;
  sExePhoneHF       := ExtractFilePath(Application.ExeName)+Config.HFExeName;
  sExePhoneUHF      := ExtractFilePath(Application.ExeName)+Config.UHFExeName;
  sExePhoneUWT      := ExtractFilePath(Application.ExeName)+Config.UWTExeName;
  sExePhoneFM       := ExtractFilePath(Application.ExeName)+Config.FMExeName;

  sExeJamm  := ExtractFilePath(Application.ExeName)+Config.JammingPlayerExeName;

  Logger.Log(UnitName+':ICSData','Received data from ' + ipSender);

  if ModeICS = 1 then
    begin
       Memo1.Lines.Add('ATTEMPTING TO RUN CLVOIP_EXTERNAL');
       //Open Phone external
       ErrCode :=
       ShellExecute(Handle,
                 nil,
                 PChar(sExePhoneExternal),
                 PChar(ParamPhone),
                 nil,
                 SW_HIDE);

       Memo1.Lines.Add('Attempted to run clvoip_EXternal with retun val: ' + IntToStr(ErrCode));
       Memo1.Lines.Add('Receive Command : Mode ' + IntToStr(ModeICS) + ' '
                                  + 'Parameter Phone ' + ParamPhone + ' ');

       Logger.Log(UnitName+':ICSData','Mode : ' + IntToStr(ModeICS) + ' '
                                      + '(Open Phone External)' + ' '
                                      + 'Param Phone ' + ParamPhone);
    end
  else
  if ModeICS = 2 then
    begin
       Memo1.Lines.Add('ATTEMPTING TO RUN CLVOIP_INTERNAL');
       //Open Phone Internal
       ErrCode :=
       ShellExecute(Handle,
                 nil,
                 PChar(sExePhoneInternal),
                 PChar(ParamPhone),
                 nil,
                 SW_HIDE);

       Memo1.Lines.Add('Attempted to run clvoip_INternal with retun val: ' + IntToStr(ErrCode));
       Memo1.Lines.Add('Receive Command : Mode ' + IntToStr(ModeICS) + ' '
                                  + 'Parameter Phone ' + ParamPhone + ' ');

       Logger.Log(UnitName+':ICSData','Mode : ' + IntToStr(ModeICS) + ' '
                                      + '(Open Phone Internal)' + ' '
                                      + 'Param Phone ' + ParamPhone);
    end
  else
  if ModeICS = 3 then
     begin
       Logger.Log(UnitName+':ICSData','Mode : ' + IntToStr(ModeICS));
       Logger.Log(UnitName+':ICSData','Killing voip engines ...');
       KillProcess(Config.ExternalExeName);
       KillProcess(Config.InternalExeName);
       KillProcess(Config.NoRXExeName);
       KillProcess(config.NonHFExeName);
       KillProcess(Config.JammingPlayerExeName);
       Logger.Log(UnitName+':ICSData','Killing voip engines done.');
     end
  else
  if ModeICS = 4 then
  begin
     //Open Jamming Player
     ShellExecute(Handle,
               nil,
               PChar(sExeJamm),
               PChar(ParamJam),
               nil,
               SW_HIDE);

     Memo1.Lines.Add('Receive Command : Mode ' + IntToStr(ModeICS) + ' '
                                  + 'Parameter Jamming ' + ParamJam);

      Logger.Log(UnitName+':ICSData','Mode : ' + IntToStr(ModeICS) + ' '
                                      + '(Open Jamming Player)' + ' '
                                      + 'Param Phone ' + ParamPhone);
  end
  else
  if ModeICS = 5 then
  begin
    //Open Phone No RX / Just TX
    ShellExecute(Handle,
             nil,
             PChar(sExePhoneNoRx),
             PChar(ParamPhone),
             nil,
             SW_HIDE);

    Memo1.Lines.Add('Receive Command : Mode ' + IntToStr(ModeICS) + ' '
                              + 'Parameter Phone ' + ParamPhone + ' ');

    Logger.Log(UnitName+':ICSData','Mode : ' + IntToStr(ModeICS) + ' '
                                      + '(Open Phone NoRX / Just TX)' + ' '
                                      + 'Param Phone ' + ParamPhone);
  end
  else
  if ModeICS = 6 then
  begin
    //Open Phone Non HF
    ShellExecute(Handle,
             nil,
             PChar(sExePhoneNonHF),
             PChar(ParamPhone),
             nil,
             SW_HIDE);

    Memo1.Lines.Add('Receive Command : Mode ' + IntToStr(ModeICS) + ' '
                              + 'Parameter Phone ' + ParamPhone + ' ');

    Logger.Log(UnitName+':ICSData','Mode : ' + IntToStr(ModeICS) + ' '
                                      + '(Open Phone Non HF)' + ' '
                                      + 'Param Phone ' + ParamPhone);
  end
  else
  if ModeICS = 7 then
  begin
    //Open Phone HF
    ShellExecute(Handle,
             nil,
             PChar(sExePhoneHF),
             PChar(ParamPhone),
             nil,
             SW_HIDE);

    Memo1.Lines.Add('Open HF Phone, Receive Command : Mode ' + IntToStr(ModeICS) + ' '
                              + 'Parameter Phone ' + ParamPhone + ' ');

    Logger.Log(UnitName+':ICSData','Mode : ' + IntToStr(ModeICS) + ' '
                                      + '(Open Phone HF)' + ' '
                                      + 'Param Phone ' + ParamPhone);
  end
  else
  if ModeICS = 8 then
  begin
    //Open Phone UHF
    ShellExecute(Handle,
             nil,
             PChar(sExePhoneUHF),
             PChar(ParamPhone),
             nil,
             SW_HIDE);

    Memo1.Lines.Add('Open UHF Phone, Receive Command : Mode ' + IntToStr(ModeICS) + ' '
                              + 'Parameter Phone ' + ParamPhone + ' ');

    Logger.Log(UnitName+':ICSData','Mode : ' + IntToStr(ModeICS) + ' '
                                      + '(Open Phone UHF)' + ' '
                                      + 'Param Phone ' + ParamPhone);
  end
  else
  if ModeICS = 9 then
  begin
    //Open Phone UWT
    ShellExecute(Handle,
             nil,
             PChar(sExePhoneUWT),
             PChar(ParamPhone),
             nil,
             SW_HIDE);

    Memo1.Lines.Add('Open UWT Phone, Receive Command : Mode ' + IntToStr(ModeICS) + ' '
                              + 'Parameter Phone ' + ParamPhone + ' ');

     Logger.Log(UnitName+':ICSData','Mode : ' + IntToStr(ModeICS) + ' '
                                      + '(Open Phone UWT)' + ' '
                                      + 'Param Phone ' + ParamPhone);
  end
  else
  if ModeICS = 10 then
  begin
    //Open Phone FM
    ShellExecute(Handle,
             nil,
             PChar(sExePhoneFM),
             PChar(ParamPhone),
             nil,
             SW_HIDE);

    Memo1.Lines.Add('Open FM Phone, Receive Command : Mode ' + IntToStr(ModeICS) + ' '
                              + 'Parameter Phone ' + ParamPhone + ' ');

    Logger.Log(UnitName+':ICSData','Mode : ' + IntToStr(ModeICS) + ' '
                                      + '(Open Phone FM)' + ' '
                                      + 'Param Phone ' + ParamPhone);
  end;


  // start
  if (ModeICS = 2) then begin
    tmrInternalRunChk.Tag := 0;
    tmrInternalRunChk.Enabled := True;
  end;

end;

procedure TfConnectorFrm.ICSDataJam(apRec: PAnsiChar; aSize: Word);
var
  RecICSDataJam : ^TICSDataJam;

  ipSender: string;
  Cmd : string;
  Mode : integer;
  id : integer;
  volume : Integer;

  RecSendToJammer : TICSDataJam;
begin
  RecICSDataJam := @aprec^;
  ipSender   := LongIp_To_StrIp(RecICSDataJam^.PacketID.ipSender);
  Logger.Log(UnitName+':ICSDataJam','Received data from ' + ipSender);

  Memo1.Lines.Add('Receive Command: Cmd ' + RecICSDataJam^.cmd + ' '
                                  + 'Mode ' + IntToStr(RecICSDataJam^.Mode) + ' '
                                  + 'Id ' + IntToStr(RecICSDataJam^.Id) + ' '
                                  + 'Volume ' + IntToStr(RecICSDataJam^.Volume));

  Logger.Log(UnitName+':ICSDataJam','(Jamming)');
  Logger.Log(UnitName+':ICSDataJam','Cmd ' + RecICSDataJam^.cmd + ' '
                                  + 'Mode ' + IntToStr(RecICSDataJam^.Mode) + ' '
                                  + 'Id ' + IntToStr(RecICSDataJam^.Id) + ' '
                                  + 'Volume ' + IntToStr(RecICSDataJam^.Volume));

  //bridge to engine voip
  RecSendToJammer.cmd     := RecICSDataJam^.cmd;
  RecSendToJammer.Mode    := RecICSDataJam^.Mode;
  RecSendToJammer.Id      := RecICSDataJam^.Id;
  RecSendToJammer.Volume  := RecICSDataJam^.Volume;

  Logger.Log(UnitName+':ICSDataJam','Connecting to clvoip port ' + IntToStr(RecSendToJammer.Id));
  BrigdeArchos.Connect(IntToStr(RecSendToJammer.Id));//, '127.0.0.1');
  Logger.Log(UnitName+':ICSDataJam','Sending data to clvoip ...');
  BrigdeArchos.SendData(CPID_ICSDataJam, @RecSendToJammer);
  Logger.Log(UnitName+':ICSDataJam','Closing connection to clvoip ...');
  BrigdeArchos.Close;

  Memo1.Lines.Add('Send Command To Jammer');
  Memo1.Lines.Add('Send Command: Cmd ' +  RecSendToJammer.cmd + ' '
                                  + 'Mode ' + IntToStr(RecSendToJammer.Mode) + ' '
                                  + 'Id ' + IntToStr(RecSendToJammer.Id));

  Logger.Log(UnitName+':ICSDataJam','Connect to Jammer ' + IntToStr(RecSendToJammer.Id));
end;


procedure TfConnectorFrm.ICSDataPhone(apRec: PAnsiChar; aSize: Word);
var
  RecICSDataPhone : ^TICSDataPhone;

  ipSender: string;
  Cmd : string;
  Mode : integer;
  id : integer;

  RecSendToVoip : TICSDataPhone;
begin
  //receive from inteface
  RecICSDataPhone := @aprec^;

  ipSender   := LongIp_To_StrIp(RecICSDataPhone^.PacketID.ipSender);
  Logger.Log(UnitName+':ICSDataPhone','Received data from ' + ipSender);

  Cmd := RecICSDataPhone^.cmd;
  Mode := RecICSDataPhone^.Mode;
  Id := RecICSDataPhone^.Id;

  Memo1.Lines.Add('================================');
  Memo1.Lines.Add('Receive Command From Interface');
  Memo1.Lines.Add('Receive Command: Cmd ' + Cmd + ' '
                                  + 'Mode ' + IntToStr(mode) + ' '
                                  + 'Id ' + IntToStr(id));

  Logger.Log(UnitName+':ICSDataPhone','(Data Phone).');
  Logger.Log(UnitName+':ICSDataPhone','Cmd ' + Cmd + ' '
                                  + 'Mode ' + IntToStr(mode) + ' '
                                  + 'Id ' + IntToStr(id));

  //bridge to engine voip
  RecSendToVoip.cmd  := RecICSDataPhone^.cmd;
  RecSendToVoip.Mode := RecICSDataPhone^.Mode;
  RecSendToVoip.Id   := RecICSDataPhone^.Id;
  Logger.Log(UnitName+':ICSDataPhone','Connecting to clvoip port ' + IntToStr(RecSendToVoip.Id));
  BrigdeArchos.Connect(IntToStr(RecSendToVoip.Id));//, '127.0.0.1');
  Logger.Log(UnitName+':ICSDataPhone','Sending data to clvoip ...');
  BrigdeArchos.SendData(CPID_ICSDataPhone, @RecSendToVoip);
  Logger.Log(UnitName+':ICSDataPhone','Closing connection to clvoip.');
  BrigdeArchos.Close;

  Memo1.Lines.Add('Send Command To Engine');
  Memo1.Lines.Add('Send Command: Cmd ' +  RecSendToVoip.cmd + ' '
                                  + 'Mode ' + IntToStr(RecSendToVoip.Mode) + ' '
                                  + 'Id ' + IntToStr(RecSendToVoip.Id));

  Logger.Log(UnitName+':ICSDataPhone','Connect to ICS Phone ' + IntToStr(id));

  // start
  if (Mode = 5) then begin
    tmrInternalRunChk.Tag := 0;
    tmrInternalRunChk.Enabled := True;
    Memo1.Lines.Add('Starting engine check...');
  end;


end;


procedure TfConnectorFrm.SendClientTerminationOnHwFail;
var
  s, devErrMsg: string;
  recOrder: TRecOrder;
begin

  if (not SoundHardwareChecks(devErrMsg)) then begin

    s := 'Minimum hardware requirement not met. Client will be terminated..';
    Memo1.Lines.Add(s);

    recOrder.OrderMsg := s;
    recOrder.OrderVal := 0;
    ServerArchos.SendData(CPID_Termination_Option, @recOrder);

//    frmDeviceFailedMsg.anErrMsg := devErrMsg;
//    frmDeviceFailedMsg.Show;
  end
  else begin
    s := 'Minimum hardware requirement met. Commencing communication..';
    Memo1.Lines.Add(s);
  end;

end;

procedure TfConnectorFrm.ServerRespon(apRec: PAnsiChar; aSize: Word);
var
  RecResponServer : ^TICSRecRespon;

  Response : byte;
begin
  RecResponServer := @aprec^;

  Response := RecResponServer^.Respon;
end;

procedure TfConnectorFrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caHide;
end;

end.
