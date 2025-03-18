unit uMainLoader;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ShellAPI, Menus, StdCtrls, TFlatButtonUnit, ExtCtrls,
  uLoaderNetwork, uFunction, uDataType, OverbyteIcsWSocket;

const
  WM_ICONTRAY = WM_USER + 1;

type
  TfrrmLoader = class(TForm)
    pmMain: TPopupMenu;
    Exit1: TMenuItem;
    lbl1: TLabel;
    lbl2: TLabel;
    edtInsServer: TEdit;
    edtInsPort: TEdit;
    edtAppName: TEdit;
    btnExecApp1: TFlatButton;
    btnSave: TFlatButton;
    dlgOpenApp: TOpenDialog;
    ShowPanel1: TMenuItem;
    N1: TMenuItem;
    tmr1: TTimer;
    lbl3: TLabel;
    lblStatus: TLabel;
    edtAppName2: TEdit;
    btnExecApp2: TFlatButton;
    edtAppName3: TEdit;
    btnExecApp3: TFlatButton;
    btn1: TFlatButton;
    btn2: TFlatButton;
    btn3: TFlatButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExecApp1Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure ShowPanel1Click(Sender: TObject);
    procedure btnExecApp2Click(Sender: TObject);
    procedure btnExecApp3Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
  private
    { Private declarations }
    TrayIconData: TNotifyIconData;
    FNetwork : TLoaderNetwork;

    function MyExitWindows(RebootParam: Longword): Boolean;
    procedure WMMYIcon(var Message: TMessage); message WM_ICONTRAY;
    procedure ShowPanel;
    procedure TrigerredEventObject(Sender : TObject;Props : E_PropsID; Value : TObject);
    procedure NetEvent(apRec: PAnsiChar; aSize: Word);
  public
    { Public declarations }
  end;

var
  frrmLoader: TfrrmLoader;

implementation

uses uSetting, uListener, uTCPDatatype;


{$R *.dfm}

function TfrrmLoader.MyExitWindows(RebootParam: Longword): Boolean;
var
  TTokenHd: THandle;
  TTokenPvg: TTokenPrivileges;
  cbtpPrevious: DWORD;
  rTTokenPvg: TTokenPrivileges;
  pcbtpPreviousRequired: DWORD;
  tpResult: Boolean;
const
  SE_SHUTDOWN_NAME = 'SeShutdownPrivilege';
begin
  if Win32Platform = VER_PLATFORM_WIN32_NT then
  begin
    tpResult := OpenProcessToken(GetCurrentProcess(),
      TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY,
      TTokenHd);
    if tpResult then
    begin
      tpResult := LookupPrivilegeValue(nil,
                                       SE_SHUTDOWN_NAME,
                                       TTokenPvg.Privileges[0].Luid);
      TTokenPvg.PrivilegeCount := 1;
      TTokenPvg.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED;
      cbtpPrevious := SizeOf(rTTokenPvg);
      pcbtpPreviousRequired := 0;
      if tpResult then
        Windows.AdjustTokenPrivileges(TTokenHd,
                                      False,
                                      TTokenPvg,
                                      cbtpPrevious,
                                      rTTokenPvg,
                                      pcbtpPreviousRequired);
    end;
  end;
  Result := ExitWindowsEx(RebootParam, 0);
end;


procedure TfrrmLoader.btn1Click(Sender: TObject);
begin
  edtAppName.Text := '';
end;

procedure TfrrmLoader.btn2Click(Sender: TObject);
begin
  edtAppName2.Text := '';

end;

procedure TfrrmLoader.btn3Click(Sender: TObject);
begin
  edtAppName3.Text := '';

end;

procedure TfrrmLoader.btnExecApp1Click(Sender: TObject);
begin

  dlgOpenApp.InitialDir := GetCurrentDir;

  if dlgOpenApp.Execute
    then edtAppName.Text := dlgOpenApp.FileName;
end;

procedure TfrrmLoader.btnExecApp2Click(Sender: TObject);
begin
  dlgOpenApp.InitialDir := GetCurrentDir;

  if dlgOpenApp.Execute
    then edtAppName2.Text := dlgOpenApp.FileName;

end;

procedure TfrrmLoader.btnExecApp3Click(Sender: TObject);
begin
  dlgOpenApp.InitialDir := GetCurrentDir;

  if dlgOpenApp.Execute
    then edtAppName3.Text := dlgOpenApp.FileName;

end;

procedure TfrrmLoader.btnSaveClick(Sender: TObject);
var
  rec : R_Common_Instr_Command;
begin

  with Setting do begin
    if (edtInsServer.Text <> InstructorHost) or
       (edtInsPort.Text <> InstructorPort)  then
    begin

      rec.CommandID := C_ORD_ACK;
      rec.ValueByte := 0; // bye
      rec.ValueString := LongIp_To_StrIp(FNetwork.InstructorSocket.MyLongIP);

      FNetwork.InstructorSocket.SendData(C_INSTRUCTOR_COMMAND,@rec);

      FNetwork.StopNetwork;
      FNetwork.InstructorSocket.ServerAddress := edtInsServer.Text;
      FNetwork.InstructorSocket.ServerPort    := edtInsPort.Text;
      FNetwork.StartNetwork;

    end;

    InstructorHost := edtInsServer.Text;
    InstructorPort := edtInsPort.Text;
    ExecutedApp := edtAppName.Text;
    ExecutedApp2 := edtAppName2.Text;
    ExecutedApp3 := edtAppName3.Text;
  end;
  Hide;
end;

procedure TfrrmLoader.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrrmLoader.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caHide;
end;

procedure TfrrmLoader.FormCreate(Sender: TObject);
begin
  Setting := TSetting.create;

  edtInsServer.Text  := Setting.InstructorHost;
  edtInsPort.Text    := Setting.InstructorPort;
  edtAppName.Text    := Setting.ExecutedApp;
  edtAppName2.Text    := Setting.ExecutedApp2;
  edtAppName3.Text    := Setting.ExecutedApp3;

  with TrayIconData do
    begin
//      cbSize := SizeOf(TrayIconData);
      Wnd := Handle;
      uID := 0;
      uFlags := NIF_MESSAGE + NIF_ICON + NIF_TIP;
      uCallbackMessage := WM_ICONTRAY;
      hIcon := Application.Icon.Handle;
      StrPCopy(szTip, Application.Title);
    end;

  Shell_NotifyIcon(NIM_ADD, @TrayIconData);

  { set net event }
  FNetwork := TLoaderNetwork.Create;
  FNetwork.InstructorSocket.RegisterProcedure(C_INSTRUCTOR_COMMAND,
       NetEvent,SizeOf(R_Common_Instr_Command));

  with FNetwork.Listeners.Add('Network') as TPropertyEventListener do
    OnPropertyObjectChange := TrigerredEventObject;

  FNetwork.StartNetwork;
end;

procedure TfrrmLoader.FormDestroy(Sender: TObject);
var
  rec : R_Common_Instr_Command;
begin
  rec.CommandID := C_ORD_ACK;
  rec.ValueByte := 0; // bye
  rec.ValueString := LongIp_To_StrIp(FNetwork.InstructorSocket.MyLongIP);

  FNetwork.InstructorSocket.SendData(C_INSTRUCTOR_COMMAND,@rec);

  Setting.Free;
  FNetwork.Free;

  Shell_NotifyIcon(NIM_DELETE, @TrayIconData);
end;

procedure TfrrmLoader.NetEvent(apRec: PAnsiChar; aSize: Word);
var
  rec       : ^R_Common_Instr_Command;
  fName     : String;
  FHandle   : THandle;
  aRec      : R_Common_Instr_Command;  //buat dikirim lagi
begin
  rec := @apRec^;
  FHandle := 0;
  case rec.CommandID of
    C_ORD_LOAD_APP :
    begin
      if FileExists(Setting.ExecutedApp) then
      begin
        fName := ExtractFileName(Setting.ExecutedApp);
        if not processExists(fName) then
          ShellExecute(FHandle,'open',PWideChar(Setting.ExecutedApp), nil, nil, SW_SHOWNORMAL) ;
      end;
      Sleep(100);
      if FileExists(Setting.ExecutedApp2) then
      begin
        fName := ExtractFileName(Setting.ExecutedApp2);
        if not processExists(fName) then
          ShellExecute(FHandle,'open',PWideChar(Setting.ExecutedApp2), nil, nil, SW_SHOWNORMAL) ;
      end;
      Sleep(100);
      if FileExists(Setting.ExecutedApp3) then
      begin
        fName := ExtractFileName(Setting.ExecutedApp3);
        if not processExists(fName) then
          ShellExecute(FHandle,'open',PWideChar(Setting.ExecutedApp3), nil, nil, SW_SHOWNORMAL) ;
      end;

      aRec.CommandID := C_ORD_STATUS_LOAD;
      aRec.ValueString := LongIp_To_StrIp(FNetwork.InstructorSocket.MyLongIP);
      FNetwork.InstructorSocket.SendData(C_INSTRUCTOR_COMMAND,@aRec);

    end;
    C_ORD_UNLOAD_APP :
    begin
      if Setting.ExecutedApp <> '' then begin
        fName := ExtractFileName(Setting.ExecutedApp);
        processExit(fName);
      end;
      if Setting.ExecutedApp2 <> '' then begin
        fName := ExtractFileName(Setting.ExecutedApp2);
        processExit(fName);
      end;
      if Setting.ExecutedApp3 <> '' then begin
        fName := ExtractFileName(Setting.ExecutedApp3);
        processExit(fName);
      end;

      aRec.CommandID := C_ORD_STATUS_UNLOAD;
      aRec.ValueString := LongIp_To_StrIp(FNetwork.InstructorSocket.MyLongIP);
      FNetwork.InstructorSocket.SendData(C_INSTRUCTOR_COMMAND,@aRec);
    end;
    C_ORD_RESTART :
    begin
      if rec.IPSender = LocalIPList[0] then
        MyExitWindows(EWX_REBOOT or EWX_FORCE);
    end;
    C_ORD_SHUTDOWN :
    begin
      if rec.IPSender = LocalIPList[0] then
        MyExitWindows(EWX_POWEROFF or EWX_FORCE);
    end;
    C_ORD_RESTART_ALL :
    begin
      if LocalIPList[0] <> '192.168.1.1' then
       MyExitWindows(EWX_REBOOT or EWX_FORCE);
    end;
    C_ORD_SHUTDOWN_ALL :
    begin
      if LocalIPList[0] <> '192.168.1.1' then
        MyExitWindows(EWX_POWEROFF or EWX_FORCE);
    end;
  end;

end;

procedure TfrrmLoader.ShowPanel;
begin
  edtInsServer.Text  := Setting.InstructorHost;
  edtInsPort.Text    := Setting.InstructorPort;
  edtAppName.Text    := Setting.ExecutedApp;
  edtAppName2.Text    := Setting.ExecutedApp2;
  edtAppName3.Text    := Setting.ExecutedApp3;

  Show;
end;

procedure TfrrmLoader.ShowPanel1Click(Sender: TObject);
begin
  ShowPanel;
end;

procedure TfrrmLoader.tmr1Timer(Sender: TObject);
begin
  Hide;
  tmr1.Enabled := False;
end;

procedure TfrrmLoader.TrigerredEventObject(Sender: TObject; Props: E_PropsID;
  Value: TObject);
var
  rec : R_Common_Instr_Command;
begin
  case Props of
    epNetworkConnectedToServer :
    begin
      lblStatus.Caption := 'Connected';

      rec.CommandID := C_ORD_ACK;
      rec.ValueByte := 1; // hello
      rec.ValueString := LongIp_To_StrIp(FNetwork.InstructorSocket.MyLongIP);

      FNetwork.InstructorSocket.SendData(C_INSTRUCTOR_COMMAND,@rec);

    end;
    epNetworkDisconnectedFromServer : lblStatus.Caption := 'Disconnected';
  end;
end;

procedure TfrrmLoader.WMMYIcon(var Message: TMessage);
var
  pt: TPoint;
begin
  case Message.LParam of
    WM_RBUTTONUP:
    begin
      if not Visible then
      begin
        SetForegroundWindow(Handle);
        GetCursorPos(pt);
        pmMain.Popup(pt.x, pt.y);
      end else
        SetForegroundWindow(Handle);
    end;
    WM_LBUTTONDBLCLK:
      if Visible then
        SetForegroundWindow(Handle) else
        ShowPanel;
  end;

end;

end.
