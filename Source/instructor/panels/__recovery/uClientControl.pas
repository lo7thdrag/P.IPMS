unit uClientControl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TFlatSpeedButtonUnit, Buttons, Mask, uDataType, ComCtrls,
  jpeg, ExtCtrls, Menus, uTCPServer, TypInfo,IniFiles;

type
  TfrmClientControl = class(TForm)
    lstLoader: TListBox;
    grpSimControl: TGroupBox;
    btn3: TFlatSpeedButton;
    btn4: TFlatSpeedButton;
    pmClient: TPopupMenu;
    mniShutdown1: TMenuItem;
    mniShutdown2: TMenuItem;
    mniShutdownAll1: TMenuItem;
    grp1: TGroupBox;
    lbl5: TLabel;
    lbl6: TLabel;
    lblLPUServer: TLabel;
    lblLPUPort: TLabel;
    lbl11: TLabel;
    lblLPUState: TLabel;
    grp2: TGroupBox;
    lbl10: TLabel;
    mmoER: TMemo;
    grp3: TGroupBox;
    imgACS: TImage;
    imgCCTV: TImage;
    imgDenahIPMS: TImage;
    imgEmergencyStop: TImage;
    imgMimicKanan: TImage;
    imgMimicKiri: TImage;
    imgMimicTengah: TImage;
    imgPCSKanan: TImage;
    imgPCSKiri: TImage;
    grp4: TGroupBox;
    lbl14: TLabel;
    mmoNetLogger: TMemo;
    lbl15: TLabel;
    mmoEvntLog: TMemo;
    lbl16: TLabel;
    mmoErrorLog: TMemo;
    chkDataLogger: TCheckBox;
    mniLoad1: TMenuItem;
    mniUnload1: TMenuItem;
    mniLoadAll1: TMenuItem;
    mniLoad2: TMenuItem;
    mniUnload2: TMenuItem;
    mniUnloadAll1: TMenuItem;
    mniRestart1: TMenuItem;
    mniRestart2: TMenuItem;
    mniRestartAll1: TMenuItem;
    N1: TMenuItem;
    lvStatusConsole: TListView;
    GroupBox1: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl7: TLabel;
    lblInsHost: TLabel;
    lblInsPort: TLabel;
    lblInsState: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    mmoInstructor: TMemo;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl9: TLabel;
    lblERServer: TLabel;
    lblERPort: TLabel;
    lblERState: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    mmoCtrl: TMemo;
    lbl12: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Panel1: TPanel;
//    procedure btn3Click(Sender: TObject);
//    procedure btn4Click(Sender: TObject);
//    procedure btn1Click(Sender: TObject);
//    procedure btn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lvStatusConsoleCustomDrawSubItem(Sender: TCustomListView;
      Item: TListItem; SubItem: Integer; State: TCustomDrawState;
      var DefaultDraw: Boolean);
    procedure lvStatusConsoleMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mniRestart1Click(Sender: TObject);
    procedure mniLoadClick(Sender: TObject);
    procedure chkDataLoggerClick(Sender: TObject);
  private
    Gedung : string;

    { Private declarations }
    function GetIPFromConsoleName(str : string): string;
    procedure LoadImageLight(aIP, imgStat : string);

    procedure UpdateClientsInfo(aServer : TTCPServer);
    procedure EventPropIntChange(Sender : TObject; PropsID : E_PropsID; Value : Integer);
    procedure EventPropObjChange(Sender : TObject; PropsID : E_PropsID; Value : TObject);

    procedure loadSettingAlarm(filepath : string);
    //data logger

    procedure EventLogger(Sender: Tobject; Props_ID: E_PropsID;
      Value: String); overload;
//    procedure EventLogger(const Value : string);overload;
    procedure AddNetLogger(const Value : string);

    procedure OnExceptionMessage(const aException : string);

  public
    { Public declarations }
    procedure UpdateClientList(aAddress : string; aRemove : boolean = false);
    procedure UpdateClientStatus(aAddress, aStatus : string);
  end;

const
  LoadLightReady = '.\Images\Light Status\READY.bmp';
  LoadLightOnline = '.\Images\Light Status\ONLINE.bmp';
  LoadLightOffline = '.\Images\Light Status\OFFLINE.bmp';

var
  frmClientControl: TfrmClientControl;

implementation

uses
  uInstructorSystem, uListener, uSetting,
  uNetworkManager, uERSystem,
  uControllerSystem,

  uMimicsSystem, uPCSSystem, uElementController,
  uElement, uCommonSystem;

{$R *.dfm}

procedure TfrmClientControl.AddNetLogger(const Value: string);
begin
   if mmoNetLogger.Lines.Count > 50 then
    mmoNetLogger.Lines.Delete(0);

  mmoNetLogger.Lines.Add(Value);
end;

//procedure TfrmClientControl.btn1Click(Sender: TObject);
//var
//  rec : R_Common_Instr_Command;
//begin
//  if lstLoader.ItemIndex >= 0 then
//  begin
//    rec.CommandID := C_ORD_LOAD_APP;
//    InstructorSys.Network.AsServer.SendDataToIPAddress(C_INSTRUCTOR_COMMAND,@rec,
//          lstLoader.Items[lstLoader.ItemIndex]);
//  end;
//end;

//procedure TfrmClientControl.btn2Click(Sender: TObject);
//var
//  rec : R_Common_Instr_Command;
//begin
//  if lstLoader.ItemIndex >= 0 then
//  begin
//    rec.CommandID := C_ORD_UNLOAD_APP;
//    rec.IPSender := GetIPFromConsoleName(lvStatusConsole.Selected.Caption);
//    InstructorSys.Network.AsServer.SendDataToIPAddress(C_INSTRUCTOR_COMMAND,@rec,
//          lstLoader.Items[lstLoader.ItemIndex]);
//  end;
//end;

//procedure TfrmClientControl.btn3Click(Sender: TObject);
//var
//  rec : R_Common_Instr_Command;
//begin
//  rec.CommandID := C_ORD_LOAD_APP;
//  InstructorSys.Network.AsServer.SendData(C_INSTRUCTOR_COMMAND,@rec);
//end;

//procedure TfrmClientControl.btn4Click(Sender: TObject);
//var
//  rec : R_Common_Instr_Command;
//begin
//  rec.CommandID := C_ORD_UNLOAD_APP;
//  InstructorSys.Network.AsServer.SendData(C_INSTRUCTOR_COMMAND,@rec);
//end;

procedure TfrmClientControl.chkDataLoggerClick(Sender: TObject);
begin
  if chkDataLogger.Checked then
    grp4.Visible := True
  else
    grp4.Visible := False;
end;

procedure TfrmClientControl.EventLogger(Sender: Tobject; Props_ID: E_PropsID;
  Value: String);
begin
  mmoEvntLog.Lines.Add(GetEnumName(TypeInfo(E_PropsID),integer(Props_ID)) + ' : ' + Value);
  case Props_ID of
    epNetworkDebugInfo : AddNetLogger(Value);
  end;
end;

//procedure TfrmClientControl.EventLogger(const Value: string);
//begin
//  AddNetLogger(Value);
//end;

procedure TfrmClientControl.EventPropIntChange(Sender: TObject;
  PropsID: E_PropsID; Value: Integer);
begin
  if not (Sender is TNetworkManager) then Exit;

  case PropsID of
    epNetworkStart :
      if Assigned(TNetworkManager(Sender).AsServer) then
      begin
        if TNetworkManager(Sender).AsServer.SocketIdentifier = 'AsControllerServer' then
          lblLPUState.Caption := 'Started'
        else
        if TNetworkManager(Sender).AsServer.SocketIdentifier = 'AsSimulatorServer' then
          lblERState.Caption := 'Started'
        else
        if TNetworkManager(Sender).AsServer.SocketIdentifier = 'AsInstructorServer' then
          lblInsState.Caption := 'Started'
      end;
    epNetworkStop :
      if Assigned(TNetworkManager(Sender).AsServer) then
      begin
        if TNetworkManager(Sender).AsServer.SocketIdentifier = 'AsControllerServer' then
          lblLPUState.Caption := 'Stopped'
        else
        if TNetworkManager(Sender).AsServer.SocketIdentifier = 'AsSimulatorServer' then
          lblERState.Caption := 'Stopped'
        else
        if TNetworkManager(Sender).AsServer.SocketIdentifier = 'AsInstructorServer' then
          lblInsState.Caption := 'Stopped'
      end;
  end;
end;

procedure TfrmClientControl.EventPropObjChange(Sender: TObject;
  PropsID: E_PropsID; Value: TObject);
begin
  case PropsID of
    epNetworkClientConnect, epNetworkClientDisconnect :
      if Value is TTCPServer then
        UpdateClientsInfo(TTCPServer(Value))
  end;
end;

procedure TfrmClientControl.FormCreate(Sender: TObject);
var
  lCtrl, lElmt : TStrings;
  elmCtrl : TElementController;
  elmt : TElement;
  i,j : Integer;
  system : TCommonSystem;

begin
//  lvStatusConsole.Column[0].Width := 125;
//  lvStatusConsole.Column[1].Width := 99;
//  lvStatusConsole.Column[2].Width := 110;
//  lvStatusConsole.Column[3].Width := 110;

  {Prince}
  loadSettingAlarm('../Bin/setting.ini');

  lblInsHost.Caption := Setting.InstructorHost;
  lblInsPort.Caption := Setting.InstructorPort;

  lblERServer.Caption := Setting.SimEngineServer;
  lblERPort.Caption   := Setting.SimEnginePort;

  lblLPUServer.Caption := Setting.LPUServer;
  lblLPUPort.Caption   := Setting.LPUPort;


  with InstructorSys.Network.Listeners.Add('NetworkStatus') as TPropertyEventListener do begin
    OnPropertyIntChange := EventPropIntChange;
    OnPropertyObjectChange :=  EventPropObjChange;
  end;

  with ERSystem.Network.Listeners.Add('NetworkStatus') as TPropertyEventListener do begin
    OnPropertyIntChange := EventPropIntChange;
    OnPropertyObjectChange :=  EventPropObjChange;
  end;

  with CtrlSystem.Network.Listeners.Add('NetworkStatus') as TPropertyEventListener do begin
    OnPropertyIntChange := EventPropIntChange;
    OnPropertyObjectChange :=  EventPropObjChange;
  end;

  //dataLogger

  { engine room exception }
  ERSystem.Network.Listeners.OnExceptionMessage := OnExceptionMessage;
  ERSystem.Database.Listeners.OnExceptionMessage := OnExceptionMessage;
  for i := 0 to ERSystem.ERManager.EngineRoom.getSystemCount - 1 do begin
    system := ERSystem.ERManager.EngineRoom.getSystem(i);
    system.Listener.OnExceptionMessage := OnExceptionMessage;
    for j := 0 to system.Entities.getCount - 1 do
      system.Entities.Get(j).Listener.OnExceptionMessage := OnExceptionMessage;
  end;
//  ERSystem.Network.AsServer.OnlogRecv := EventLogger;
//  ERSystem.Network.AsClients.Get('AsInstructorClient').OnlogRecv := EventLogger;

  { controller exception }
  CtrlSystem.Network.Listeners.OnExceptionMessage := OnExceptionMessage;
  CtrlSystem.Database.Listeners.OnExceptionMessage := OnExceptionMessage;
  CtrlSystem.Controller.Listeners.OnExceptionMessage := OnExceptionMessage;

//  CtrlSystem.Network.AsClients.Get('AsSimEngineClient').OnlogRecv := EventLogger;
//  CtrlSystem.Network.AsServer.OnlogRecv := EventLogger;

  lCtrl := CtrlSystem.Controller.getControllers;
  for I := 0 to lCtrl.Count - 1 do begin
    elmCtrl := CtrlSystem.Controller.getController(lCtrl[i]);

    if Assigned(elmCtrl) then
    begin

      lElmt := elmCtrl.getElements;

      for j := 0 to lElmt.Count - 1 do begin

        elmt := elmCtrl.getElement(lElmt[j]);
        elmt.Listeners.OnExceptionMessage := OnExceptionMessage;

      end;

      lElmt.Free;
    end;
  end;
  lCtrl.Free;

  { mimic exception }
  SysMimics.Network.Listeners.OnExceptionMessage := OnExceptionMessage;
  SysMimics.Database.Listeners.OnExceptionMessage := OnExceptionMessage;

  { instructor exception }
  InstructorSys.Network.Listeners.OnExceptionMessage := OnExceptionMessage;
  InstructorSys.Database.Listeners.OnExceptionMessage := OnExceptionMessage;
  InstructorSys.ClassAlarm.Listener.OnExceptionMessage := OnExceptionMessage;


  with ERSystem.Network.Listeners.Add('DataLogger') as TPropertyEventListener do begin
    OnPropertyStringChange := EventLogger;
    OnPropertyIntChange    := nil;
    OnPropertyDblChange    := nil;
    OnPropertyBoolChange   := nil;
    OnPropertyByteChange   := nil;
    OnPropertyObjectChange := nil;
  end;

  with CtrlSystem.Network.Listeners.Add('DataLogger') as TPropertyEventListener do begin
    OnPropertyStringChange := EventLogger;
    OnPropertyIntChange    := nil;
    OnPropertyDblChange    := nil;
    OnPropertyBoolChange   := nil;
    OnPropertyByteChange   := nil;
    OnPropertyObjectChange := nil;
  end;

  with SysMimics.Network.Listeners.Add('DataLogger') as TPropertyEventListener do begin
    OnPropertyStringChange := EventLogger;
    OnPropertyIntChange    := nil;
    OnPropertyDblChange    := nil;
    OnPropertyBoolChange   := nil;
    OnPropertyByteChange   := nil;
    OnPropertyObjectChange := nil;
  end;

  with PCSSystem.Network.Listeners.Add('DataLogger') as TPropertyEventListener do begin
    OnPropertyStringChange := EventLogger;
    OnPropertyIntChange    := nil;
    OnPropertyDblChange    := nil;
    OnPropertyBoolChange   := nil;
    OnPropertyByteChange   := nil;
    OnPropertyObjectChange := nil;
  end;

  with PCSSystem.Listener.Add('DataLogger') as TPropertyEventListener do begin
    OnPropertyStringChange := EventLogger;
    OnPropertyIntChange    := nil;
    OnPropertyDblChange    := nil;
    OnPropertyBoolChange   := nil;
    OnPropertyByteChange   := nil;
    OnPropertyObjectChange := nil;
  end;

  { elements listener }
  lCtrl := CtrlSystem.Controller.getControllers;
  for I := 0 to lCtrl.Count - 1 do begin
    elmCtrl := CtrlSystem.Controller.getController(lCtrl[i]);

    if Assigned(elmCtrl) then
    begin

      lElmt := elmCtrl.getElements;

      for j := 0 to lElmt.Count - 1 do begin

        elmt := elmCtrl.getElement(lElmt[j]);

        if Assigned(elmt) then
          with (elmt.Listeners.Add('DataLogger') as TPropertyEventListener) do
          begin
            OnPropertyDblChange     := nil;
            OnPropertyIntChange     := nil;
            OnPropertyStringChange  := EventLogger;
            OnPropertyBoolChange    := nil;
            OnPropertyByteChange    := nil;
            OnPropertyObjectChange  := nil;
          end;
      end;

      lElmt.Free;
    end;
  end;
  lCtrl.Free;

end;

function TfrmClientControl.GetIPFromConsoleName(str: string): string;
begin
  result := '';

  if str = 'ACS' then
    result := Setting.AcsIP // '192.168.1.11'
  else if str = 'MIMIC - KIRI' then
    result := Setting.MimicKiriIP // '192.168.1.12'
  else if str = 'PCS - KIRI' then
    result := Setting.PcsKiriIP // '192.168.1.13'
  else if str = 'MIMIC - TENGAH' then
    result := Setting.MimicTengahIP // '192.168.1.14'
  else if str = 'PCS - KANAN' then
    result := Setting.PcsKananIP // '192.168.1.15'
  else if str = 'MIMIC - KANAN' then
    result := Setting.MimicKananIP // '192.168.1.16'
  else if str = 'EMERGENCY STOP' then
    result := Setting.EmergencyStopIP // '192.168.1.17'
  else if str = 'MONITORING' then
    result := Setting.CctvIP // '192.168.1.18'
  else if str = 'SERVER' then
    result := Setting.ServerIP // '192.168.1.2'
  else if str = 'GEN PS FWD' then
    result := Setting.ServerIP // '192.168.1.2'
  else if str = 'GEN SB FWD' then
    result := Setting.ServerIP // '192.168.1.2'
  else if str = 'GEN PS AFT' then
    result := Setting.ServerIP // '192.168.1.2'
  else if str = 'GEN SB AFT' then
    result := Setting.ServerIP // '192.168.1.2'
  else if str = 'GEN EMERGENCY' then
    result := Setting.ServerIP // '192.168.1.2'
  else if str = 'SHORE' then
    result := Setting.ServerIP // '192.168.1.2'
  else if str = 'MAIN ENGINE 1 PS' then
    result := Setting.ServerIP // '192.168.1.2'
  else if str = 'MAIN ENGINE 2 PS' then
    result := Setting.ServerIP // '192.168.1.2'
  else if str = 'MAIN ENGINE 1 SB' then
    result := Setting.ServerIP // '192.168.1.2'
  else if str = 'MAIN ENGINE 2 SB' then
    result := Setting.ServerIP // '192.168.1.2'
  else if str = 'AUXILIARY - 1' then
    result := Setting.ServerIP // '192.168.1.2'
  else if str = 'AUXILIARY - 2' then
    result := Setting.ServerIP // '192.168.1.2'
  else if str = 'AUXILIARY - 3' then
    result := Setting.ServerIP // '192.168.1.2'
  else if str = 'DIESEL GENERATOR - 1' then
    result := Setting.ServerIP // '192.168.1.2'
  else if str = 'DIESEL GENERATOR - 2' then
    result := Setting.ServerIP // '192.168.1.2'
  else if str = 'DIESEL GENERATOR - 3' then
    result := Setting.ServerIP // '192.168.1.2'
  else if str = 'DIESEL GENERATOR - 4' then
    result := Setting.ServerIP;
end;

procedure TfrmClientControl.LoadImageLight(aIP, imgStat: string);
begin
  if aIP = Setting.AcsIP then
    imgACS.Picture.LoadFromFile(imgStat)
  else if aIP = Setting.MimicKiriIP then
    imgMimicKiri.Picture.LoadFromFile(imgStat)
  else if aIP = Setting.PcsKiriIP then
    imgPCSKiri.Picture.LoadFromFile(imgStat)
  else if aIP = Setting.MimicTengahIP then
    imgMimicTengah.Picture.LoadFromFile(imgStat)
  else if aIP = Setting.PcsKananIP then
    imgPCSKanan.Picture.LoadFromFile(imgStat)
  else if aIP = Setting.MimicKananIP then
    imgMimicKanan.Picture.LoadFromFile(imgStat)
  else if aIP = Setting.EmergencyStopIP then
    imgEmergencyStop.Picture.LoadFromFile(imgStat)
  else if aIP = Setting.CctvIP then
    imgCCTV.Picture.LoadFromFile(imgStat);
end;

procedure TfrmClientControl.loadSettingAlarm(filepath: string);
var
    inifile : TIniFile;
    tempstring : TStringList;
begin
  inifile := TIniFile.Create(filepath);
  tempstring := TStringList.Create;

  inifile.ReadSection('HARDWARE', tempstring);
  Gedung := inifile.ReadString('HARDWARE', tempstring[3],'Default');

  inifile.Free;
  tempstring.Free;
end;

procedure TfrmClientControl.lvStatusConsoleCustomDrawSubItem(
  Sender: TCustomListView; Item: TListItem; SubItem: Integer;
  State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if SubItem = 1 then begin
    if Item.SubItems[0] = 'READY' then begin
      Sender.Canvas.Brush.Color := clYellow;
    end
    else if Item.SubItems[0] = 'ONLINE' then begin
      Sender.Canvas.Brush.Color := clLime;
    end
    else begin
      Sender.Canvas.Brush.Color := clRed;
    end;

    {Prince}
    if Gedung = 'Kantor' then
    begin
      if (Item.Caption = 'SERVER') and (Item.SubItems[0] <> 'ONLINE') then
      begin
        Item.SubItems[0] := 'ONLINE';
        Sender.Canvas.Brush.Color := clLime;
      end;
    end;
  end
  else if SubItem = 2 then
  begin
    if Item.SubItems[1] = 'NOT RUNNING' then begin
      Sender.Canvas.Brush.Color := clRed;
    end
    else if Item.SubItems[1] = 'RUNNING' then begin
      Sender.Canvas.Brush.Color := clLime;
    end
    else begin
      Sender.Canvas.Brush.Color := clWhite;
    end;
  end
  else if SubItem = 3 then
  begin
    if Item.SubItems[2] = 'NOT RUNNING' then begin
      Sender.Canvas.Brush.Color := clRed;
    end
    else if Item.SubItems[2] = 'RUNNING' then begin
      Sender.Canvas.Brush.Color := clLime;
    end
    else begin
      Sender.Canvas.Brush.Color := clWhite;
    end;
  end
  else  begin
    Sender.Canvas.Brush.Color := clWhite;
  end;
end;

procedure TfrmClientControl.lvStatusConsoleMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  P : TPoint;
begin
  if lvStatusConsole.Selected = nil then
    exit;

  if lvStatusConsole.Selected.SubItems[0] = 'OFFLINE' then
    exit;

  {Prince}
  if (Gedung = 'Kodikal') or (Gedung = 'Kantor') then
  begin
    if lvStatusConsole.Selected.Caption = 'SERVER' then
      exit;
  end;

  if Button = mbRight then
  begin
    GetCursorPos(P);
    pmClient.Popup(P.X, P.Y);
  end;
end;

procedure TfrmClientControl.mniLoadClick(Sender: TObject);
var
  rec : R_Common_Instr_Command;
  IpNumber : string;
begin
  case TComponent(sender).Tag of
    1 : //Load Selected
    begin
      rec.CommandID := C_ORD_LOAD_APP;
      IpNumber := GetIPFromConsoleName(lvStatusConsole.Selected.Caption);

      InstructorSys.Network.AsServer.SendDataToIPAddress(C_INSTRUCTOR_COMMAND,@rec,IpNumber);
    end;
    2 : //Load All
    begin
      rec.CommandID := C_ORD_LOAD_APP;

      InstructorSys.Network.AsServer.SendData(C_INSTRUCTOR_COMMAND,@rec);
    end;
    3 :  //Unload Selected
    begin
      IpNumber := GetIPFromConsoleName(lvStatusConsole.Selected.Caption);

      rec.CommandID := C_ORD_CLOSE_APP;
      InstructorSys.Network.AsServer.SendDataToIPAddress(C_INSTRUCTOR_COMMAND,@rec,IpNumber);
      Sleep(5000);

      rec.CommandID := C_ORD_UNLOAD_APP;
      InstructorSys.Network.AsServer.SendDataToIPAddress(C_INSTRUCTOR_COMMAND,@rec,IpNumber);
    end;
    4 : //Unload All
    begin
      rec.CommandID := C_ORD_CLOSE_APP;
      InstructorSys.Network.AsServer.SendData(C_INSTRUCTOR_COMMAND,@rec);
      Sleep(5000);

      rec.CommandID := C_ORD_UNLOAD_APP;
      InstructorSys.Network.AsServer.SendData(C_INSTRUCTOR_COMMAND,@rec);
    end;
  end;
end;

procedure TfrmClientControl.mniRestart1Click(Sender: TObject);
var
  rec : R_Common_Instr_Command;
begin
  case TComponent(sender).Tag of
    1 : //Restart
    begin
      rec.CommandID := C_ORD_RESTART;
      rec.IPSender := GetIPFromConsoleName(lvStatusConsole.Selected.Caption);

      InstructorSys.Network.AsServer.SendData(C_INSTRUCTOR_COMMAND,@rec);
    end;
    2 : //shutdown
    begin
      rec.CommandID := C_ORD_SHUTDOWN;
      rec.IPSender := GetIPFromConsoleName(lvStatusConsole.Selected.Caption);

      InstructorSys.Network.AsServer.SendData(C_INSTRUCTOR_COMMAND,@rec);
    end;
    3 :  //Restrart All
    begin
      rec.CommandID := C_ORD_RESTART_ALL;

      InstructorSys.Network.AsServer.SendData(C_INSTRUCTOR_COMMAND,@rec);
    end;
    4 : //Shutdown All
    begin
      rec.CommandID := C_ORD_SHUTDOWN_ALL;

      InstructorSys.Network.AsServer.SendData(C_INSTRUCTOR_COMMAND,@rec);
    end;
  end;

end;

procedure TfrmClientControl.OnExceptionMessage(const aException: string);
begin
  mmoErrorLog.Lines.Add(aException);
end;

procedure TfrmClientControl.UpdateClientList(aAddress: string;
  aRemove: boolean = false);
var
  i : integer;
  s, ConsoleName, IPConsole : String;
begin
  if not aRemove then
  begin
    if lstLoader.Items.Count <= 0 then
    begin
      lstLoader.Items.Add(aAddress);

      if lvStatusConsole.Items.Count > 0 then
      begin
        for I := 0 to lvStatusConsole.Items.Count - 1 do
        begin
          ConsoleName := lvStatusConsole.Items[i].Caption;
          IPConsole := GetIPFromConsoleName(ConsoleName);

          if aAddress = IPConsole then
          begin
            lvStatusConsole.Items[i].SubItems[0] := 'READY';
            LoadImageLight(aAddress,LoadLightReady);
          end;
        end;
      end;
      Exit;
    end;


    for i := 0 to lstLoader.Items.Count - 1 do
    begin
      s := lstLoader.Items[i];
      if s = aAddress then
        Exit;
    end;

    lstLoader.Items.Add(aAddress);

    for I := 0 to lvStatusConsole.Items.Count - 1 do
    begin
      ConsoleName := lvStatusConsole.Items[i].Caption;
      IPConsole := GetIPFromConsoleName(ConsoleName);

      if aAddress = IPConsole then
      begin
        lvStatusConsole.Items[i].SubItems[0] := 'READY';
        LoadImageLight(aAddress,LoadLightReady);
      end;
    end;

  end
  else
  begin
    for i := 0 to lstLoader.Items.Count - 1 do
    begin
      s := lstLoader.Items[i];
      if s = aAddress then
      begin
        lstLoader.Items.Delete(i);
        break;
      end;
    end;

    for I := 0 to lvStatusConsole.Items.Count - 1 do
    begin
      ConsoleName := lvStatusConsole.Items[i].Caption;
      IPConsole := GetIPFromConsoleName(ConsoleName);

      if aAddress = IPConsole then
      begin
        lvStatusConsole.Items[i].SubItems[0] := 'OFFLINE';
        LoadImageLight(aAddress,LoadLightOffline);
        break;
      end;
    end;
  end;
end;

procedure TfrmClientControl.UpdateClientsInfo(aServer: TTCPServer);
var
  i : integer;
begin
  with TTCPServer(aServer) do begin

    if SocketIdentifier = 'AsInstructorServer' then begin
      mmoInstructor.Lines.Clear;
      for i := 0 to ClientCount - 1 do begin
        mmoInstructor.Lines.Add(Clients[i].ConnectedIP);
      end;
    end;
    if SocketIdentifier = 'AsSimulatorServer' then begin
      mmoER.Lines.Clear;
      for i := 0 to ClientCount - 1 do begin
        mmoER.Lines.Add(Clients[i].ConnectedIP);
      end;
    end;
    if SocketIdentifier = 'AsControllerServer' then begin
      mmoCtrl.Lines.Clear;
      for i := 0 to ClientCount - 1 do begin
        mmoCtrl.Lines.Add(Clients[i].ConnectedIP);
      end;
    end;
  end;

end;

procedure TfrmClientControl.UpdateClientStatus(aAddress, aStatus: string);
var
  i : integer;
  ConsoleName, IPConsole : String;
begin
  if lvStatusConsole.Items.Count <= 0 then
  exit;

  for I := 0 to lvStatusConsole.Items.Count - 1 do
  begin
    ConsoleName := lvStatusConsole.Items[i].Caption;
    IPConsole := GetIPFromConsoleName(ConsoleName);

    if IPConsole = aAddress then
      lvStatusConsole.Items[i].SubItems[0] := aStatus;
  end;

  if aStatus = 'READY' then
    LoadImageLight(aAddress,LoadLightReady)
  else if aStatus = 'ONLINE' then
    LoadImageLight(aAddress,LoadLightOnline)
  else if aStatus = 'OFFLINE' then
    LoadImageLight(aAddress,LoadLightOffline);

end;

end.
