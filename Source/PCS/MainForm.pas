unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uDataType, IniFiles, VrControls, VrTrackBar,
  ComCtrls, uListener;

type
  TForm1 = class(TForm)
    btnGeneralPanelStart: TButton;
    btnPSPanelStart: TButton;
    btnSBPanelStart: TButton;
    btnLogger: TButton;
    mmo1: TMemo;
    btnControlLever: TButton;
    btnServo: TButton;
    btnShaftDrivenPS: TButton;
    btnShaftDrivenSB: TButton;
    btnShaftStopPS: TButton;
    btnShaftStopSB: TButton;
    btnShaftTrailingPS: TButton;
    btnShaftTrailingSB: TButton;
    btnTransferOverridePS: TButton;
    btnTransferOverrideSB: TButton;
    btnEmergencyStopPS: TButton;
    btnEmergencyStopSB: TButton;
    pnlLeverControl: TPanel;
    trckbrPS: TTrackBar;
    trckbrSB: TTrackBar;
    lblAheadPS: TLabel;
    lblAheadSB: TLabel;
    lblAsternPS: TLabel;
    lblAsternSB: TLabel;
    lblLeverPS: TLabel;
    lblLeverSB: TLabel;
    tmr1: TTimer;
    btnThottlePanelTest: TButton;
    btnThrottlePanelTestOff: TButton;
    btnPCSAlarmSound: TButton;
    btn1: TButton;
    btn2: TButton;
    procedure btnGeneralPanelStartClick(Sender: TObject);
    procedure btnPSPanelStartClick(Sender: TObject);
    procedure btnSBPanelStartClick(Sender: TObject);
    procedure btnLoggerClick(Sender: TObject);
    procedure btnViewAllClick(Sender: TObject);
    procedure btnPCSPaneBridgeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnControlLeverClick(Sender: TObject);
    procedure btnServoClick(Sender: TObject);
    procedure btnPSSBClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnShaftDrivenPSClick(Sender: TObject);
    procedure btnShaftDrivenSBClick(Sender: TObject);
    procedure btnShaftStopPSClick(Sender: TObject);
    procedure btnShaftStopSBClick(Sender: TObject);
    procedure btnShaftTrailingPSClick(Sender: TObject);
    procedure btnShaftTrailingSBClick(Sender: TObject);
    procedure btnTransferOverridePSClick(Sender: TObject);
    procedure btnTransferOverrideSBClick(Sender: TObject);
    procedure btnEmergencyStopPSClick(Sender: TObject);
    procedure btnEmergencyStopSBClick(Sender: TObject);
    procedure trckbrPSChange(Sender: TObject);
    procedure trckbrSBChange(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure btnThottlePanelTestClick(Sender: TObject);
    procedure btnThrottlePanelTestOffClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnPCSAlarmSoundClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }

    FListener : TListeners;
    procedure PCSSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Boolean);overload;

    procedure EventLogStr(Sender :TObject; Props :E_PropsID; Value : string);

    procedure LoadSettingForm(filepath: string);
  public
    { Public declarations }

    counterCheck, idServoTest, idLeverTest : Integer;

    property Listener : TListeners read FListener;


  end;

var
  Form1: TForm1;

  MonitorCount : Integer;


implementation

uses uPSPanel, uSBPanel, uGeneralPanel, ufrmLogger, uPCSPanelBridge,
  uPCSSystem, uLeverControl, ComMainForm, uAlarmPCS;
{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
begin
  ShowCursor(True);
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
  ShowCursor(False);
end;

procedure TForm1.btnControlLeverClick(Sender: TObject);
begin
  if frmLeverControl.Showing then
    frmLeverControl.Visible := False
  else
    frmLeverControl.Show;
end;

procedure TForm1.btnEmergencyStopPSClick(Sender: TObject);
begin
  PCSSystem.PanelThrottleTesting(C_ORD_BTN_EMERGENCY_STOP_PS,True);
end;

procedure TForm1.btnEmergencyStopSBClick(Sender: TObject);
begin
  PCSSystem.PanelThrottleTesting(C_ORD_BTN_EMERGENCY_STOP_SB,True);
end;

procedure TForm1.btnGeneralPanelStartClick(Sender: TObject);
begin
  if frm_GeneralPanel.Showing then
    frm_GeneralPanel.Visible := False
  else
    frm_GeneralPanel.Show;
//  frmPCSAlarm := TfrmPCSAlarm.Create(Self);
end;

procedure TForm1.btnLoggerClick(Sender: TObject);
begin
  if not Assigned(frmLogs) then
    frmLogs := TfrmLogs.Create(nil);

  if frmLogs.Showing then
    frmLogs.Visible := False
  else
    frmLogs.Show;
end;

procedure TForm1.btnPCSAlarmSoundClick(Sender: TObject);
begin
  frmPCSAlarm := TfrmPCSAlarm.Create(Self);
  frm_GeneralPanel.FAlarmON := True;
  btnPCSAlarmSound.Font.Size := 10;
end;

procedure TForm1.btnPCSPaneBridgeClick(Sender: TObject);
begin
  frmPCSPanelBridge.Show;
end;

procedure TForm1.btnPSPanelStartClick(Sender: TObject);
begin
  if frmPSPanel.Showing then
    frmPSPanel.Visible := False
  else
    frmPSPanel.Show;
end;

procedure TForm1.btnPSSBClick(Sender: TObject);
begin
  if frmPSPanel.Showing and frmSBPanel.Showing  then
  begin
    frmPSPanel.Visible := False;
    frmSBPanel.Visible := False;
  end
  else
  begin
    frmPSPanel.Show;
    frmSBPanel.Show;
  end;
end;

procedure TForm1.btnSBPanelStartClick(Sender: TObject);
begin
  if frmSBPanel.Showing then
    frmSBPanel.Visible := False
  else
    frmSBPanel.Show;
end;

procedure TForm1.btnServoClick(Sender: TObject);
begin
  if FormServo.Showing then
    FormServo.Visible := False
  else
    FormServo.Show;
end;

procedure TForm1.btnShaftDrivenPSClick(Sender: TObject);
begin
  PCSSystem.PanelThrottleTesting(C_ORD_BTN_SHAFT_DRIVEN_PS,True);
end;

procedure TForm1.btnShaftDrivenSBClick(Sender: TObject);
begin
  PCSSystem.PanelThrottleTesting(C_ORD_BTN_SHAFT_DRIVEN_SB,True);
end;

procedure TForm1.btnShaftStopPSClick(Sender: TObject);
begin
  PCSSystem.PanelThrottleTesting(C_ORD_BTN_SHAFT_STOP_PS,True);
end;

procedure TForm1.btnShaftStopSBClick(Sender: TObject);
begin
  PCSSystem.PanelThrottleTesting(C_ORD_BTN_SHAFT_STOP_SB,True);
end;

procedure TForm1.btnShaftTrailingPSClick(Sender: TObject);
begin
  PCSSystem.PanelThrottleTesting(C_ORD_BTN_SHAFT_TRAILING_PS,True);
end;

procedure TForm1.btnShaftTrailingSBClick(Sender: TObject);
begin
  PCSSystem.PanelThrottleTesting(C_ORD_BTN_SHAFT_TRAILING_SB,True);
end;

procedure TForm1.btnThottlePanelTestClick(Sender: TObject);
begin
  PCSSystem.throttleTest := True;
  btnThottlePanelTest.Font.Size := 10;
end;

procedure TForm1.btnThrottlePanelTestOffClick(Sender: TObject);
begin
  PCSSystem.throttleTest := False;
  btnThottlePanelTest.Font.Size := 8;
end;

procedure TForm1.btnTransferOverridePSClick(Sender: TObject);
begin
  PCSSystem.PanelThrottleTesting(C_ORD_BTN_TRANSFER_OVERRIDE_PS,True);
end;

procedure TForm1.btnTransferOverrideSBClick(Sender: TObject);
begin
  PCSSystem.PanelThrottleTesting(C_ORD_BTN_TRANSFER_OVERRIDE_SB,True);
end;

procedure TForm1.btnViewAllClick(Sender: TObject);
begin
  frmPSPanel.Show;
  frmSBPanel.Show;
  frm_GeneralPanel.Show;

end;

procedure TForm1.EventLogStr(Sender: TObject; Props: E_PropsID; Value: string);
begin

  case Props of
    epNetworkDebugInfo : mmo1.Lines.Add(Value)
  end;

end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PCSSystem.sendServoLampStatus(C_ORD_SERVO_PS, False);
  PCSSystem.sendServoLampStatus(C_ORD_SERVO_SB, False);

  Sleep(5000);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  with PCSSystem.Network.Listeners.Add('Logger') as TPropertyEventListener do begin
    OnPropertyStringChange := EventLogStr;
  end;

  FListener := TListeners.Create;
  with PCSSystem.Listener.Add('Main Form') as TPropertyEventListener do begin
    OnPropertyBoolChange := PCSSystemEvent;
  end;

  LoadSettingForm('..\bin\setting.ini');

  counterCheck := 0;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  frmPCSAlarm.destroy;
end;

procedure TForm1.FormShow(Sender: TObject);
var
  i: Integer;
begin
  i := 0;
  if PCSSystem.idFormPCS = 1 then
  begin
    frm_GeneralPanel.Show;
    frmPCSAlarm := TfrmPCSAlarm.Create(Self);
    frm_GeneralPanel.FAlarmON := True;
    ShowCursor(False);
  end
  else
  if PCSSystem.idFormPCS = 2 then
  begin
    frmPSPanel.Show;
    frmSBPanel.Show;
    ShowCursor(False);
  end
  else
  if PCSSystem.idFormPCS = 3 then
  begin

  end;

  if idLeverTest = 1 then
    frmLeverControl.Show;

  if idServoTest = 1  then
    FormServo.Show;

  DefaultMonitor := dmDesktop;
  if Screen.MonitorCount = 1  then
    i := 0
  else
  if Screen.MonitorCount = 2 then
    i := 1
  else
  if Screen.MonitorCount = 3 then
    i := 2;
  Top := Screen.Monitors[i].Top;
  Left := Screen.Monitors[i].Left;
end;

procedure TForm1.LoadSettingForm(filepath: string);
var
  inifile : TIniFile;
  tempstring : TStringList;
begin
  inifile := TIniFile.Create(filepath);
  tempstring := TStringList.Create;

  inifile.ReadSection('Form PCS', tempstring);

  idLeverTest := StrToInt(inifile.ReadString('Form PCS', tempstring[4],'Default'));
  idServoTest := StrToInt(inifile.ReadString('Form PCS', tempstring[5],'Default'));

  inifile.Free;
  tempstring.Free;
end;

procedure TForm1.PCSSystemEvent(Sender: TObject; PropsID: E_PropsID;
  Value: Boolean);
begin
  case PropsID of
    epPCSLeverShaftDrivenPS:
    begin
      if Value then
        btnShaftDrivenPS.Font.Size := 12
      else
        btnShaftDrivenPS.Font.Size := 8;
    end;

    epPCSLeverShaftDrivenSB:
    begin
      if Value then
        btnShaftDrivenSB.Font.Size := 12
      else
        btnShaftDrivenSB.Font.Size := 8;
    end;

    epPCSLeverShaftStopPS:
    begin
      if Value then
        btnShaftStopPS.Font.Size := 12
      else
        btnShaftStopPS.Font.Size := 8;
    end;

    epPCSLeverShaftStopSB:
    begin
      if Value then
        btnShaftStopSB.Font.Size := 12
      else
        btnShaftStopSB.Font.Size := 8;
    end;

    epPCSLeverShaftTrailingPS:
    begin
      if Value then
        btnShaftTrailingPS.Font.Size := 12
      else
        btnShaftTrailingPS.Font.Size := 8;
    end;

    epPCSLeverShaftTrailingSB:
    begin
      if Value then
        btnShaftTrailingSB.Font.Size := 12
      else
        btnShaftTrailingSB.Font.Size := 8;
    end;

    epPCSLeverTransferOverridePS:
    begin
      if Value then
        btnTransferOverridePS.Font.Size := 12
      else
        btnTransferOverridePS.Font.Size := 8;
    end;

    epPCSLeverTransferOverrideSB:
    begin
      if Value then
        btnTransferOverrideSB.Font.Size := 12
      else
        btnTransferOverrideSB.Font.Size := 8;
    end;

    epPCSLeverEmergencyStopPS:
    begin
      if Value then
        btnEmergencyStopPS.Font.Size := 12
      else
        btnEmergencyStopPS.Font.Size := 8;
    end;

    epPCSLeverEmergencyStopSB:
    begin
      if Value then
        btnEmergencyStopSB.Font.Size := 12
      else
        btnEmergencyStopSB.Font.Size := 8;
    end;

  end;
end;


procedure TForm1.tmr1Timer(Sender: TObject);
begin
  counterCheck := counterCheck + 1;
  if counterCheck > 5 then
  begin
    counterCheck := 0;
    if PCSSystem.throttleTest then
    begin
      PCSSystem.LeverControl(C_PCS_ME_PORTS,trckbrPS.Position*-1);
      PCSSystem.LeverControl(C_PCS_ME_STARBOARD,trckbrSB.Position*-1);
    end;

  end;

  mmo1.Lines.Add('Buffer: '+ IntToStr(PCSSystem.Network.VREngineSocket.GetBufferCount));
end;

procedure TForm1.trckbrPSChange(Sender: TObject);
begin
  lblLeverPS.Caption := IntToStr(trckbrPS.Position*-1);
  if trckbrPS.Position < 0 then
  begin
    lblAheadPS.Color := clLime;
    lblAsternPS.Color := clWindow;
  end
  else
  if trckbrPS.Position > 0 then
  begin
    lblAsternPS.Color := clLime;
    lblAheadPS.Color := clWindow;
  end
  else
  begin
    lblAheadPS.Color := clWindow;
    lblAsternPS.Color := clWindow;
  end;
end;

procedure TForm1.trckbrSBChange(Sender: TObject);
begin
  lblLeverSB.Caption := IntToStr(trckbrSB.Position*-1);
  if trckbrSB.Position < 0 then
  begin
    lblAheadSB.Color := clLime;
    lblAsternSB.Color := clWindow;
  end
  else
  if trckbrSB.Position > 0 then
  begin
    lblAsternSB.Color := clLime;
    lblAheadSB.Color := clWindow;
  end
  else
  begin
    lblAheadSB.Color := clWindow;
    lblAsternSB.Color := clWindow;
  end;
end;

end.
