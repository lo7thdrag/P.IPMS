unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uDataType, IniFiles, VrControls, VrTrackBar,
  ComCtrls, uListener, CPort, NLDJoystick, Math;

var
//  LeverValuesPositionManouver: array[0..21] of Double = (11,10,9,8,7,6,5,4,3.5,3,2,1,0.5,0,-0.5,-2,-4,-6,-8,-10,-11,-12);
  LeverValuesPositionManouver: array[0..21] of Double = (0,0.5,1,2,3,3.5,4,5,6,7,8,9,10,-10,-9,-8,-7,-6,-5,-4,-3,-2);
  LeverValuesPositionTransit : array[0..12] of Double = (10,9,8,7,6,5,4,3.5,3,2,1,0.5,0);

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
    mmoNetLogger: TMemo;
    mmoLogReceive: TMemo;
    btnLeverInServicePS: TButton;
    btnLeverInServiceSB: TButton;
    Memo1: TMemo;
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
    procedure btnLeverInServicePSClick(Sender: TObject);
    procedure btnLeverInServiceSBClick(Sender: TObject);
    procedure btnLeverControlClick(Sender: TObject);
  private
    { Private declarations }

    FListener : TListeners;
    FTransit, FManouvre : Boolean;

    LastLeverIndexPS : Integer;
    LastLeverIndexSB : Integer;

    procedure PCSSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Boolean);overload;
    procedure PCSSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : string);overload;
    procedure PCSSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : TObject);overload;

    procedure EventLogStr(Sender :TObject; Props :E_PropsID; Value : string);

    procedure LoadSettingForm(filepath: string);

    function TrackbarSpeed(Position: Integer): Double;
    function ThrottleValue(Position: Integer): Double;
  public
    { Public declarations }
    ComPort: TComPort;
    LeverValuesPositionManouver: array[0..21] of Double;
    LeverValuesPositionTransit : array[0..12] of Double;
    counterCheck, idServoTest, idLeverTest : Integer;
    procedure LeverValuePosition;

    property Listener : TListeners read FListener;


  end;

var
  Form1: TForm1;

  MonitorCount : Integer;
  SerialBuffer : string;


implementation

uses
  uTCPClient, uPSPanel, uSBPanel, uGeneralPanel, ufrmLogger, uPCSPanelBridge,   uPCSSystem, uLeverControl,
  ComMainForm, uAlarmPCS;

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
  if Assigned(frmLeverControl) then
  begin
//    if frmLeverControl.Showing then
//      frmLeverControl.Visible := False
//    else
      frmLeverControl.Show;
  end
  else
  begin
    frmLeverControl := TfrmLeverControl(self);
    frmLeverControl.Show;
  end;


end;

procedure TForm1.btnEmergencyStopPSClick(Sender: TObject);
begin
  PCSSystem.PanelThrottleTesting(C_ORD_BTN_EMERGENCY_STOP_PS,True);
end;

procedure TForm1.btnEmergencyStopSBClick(Sender: TObject);
begin
  PCSSystem.PanelThrottleTesting(C_ORD_BTN_EMERGENCY_STOP_SB,True);
end;

procedure TForm1.btnLeverInServicePSClick(Sender: TObject);
begin
  PCSSystem.LeverInService(C_PCS_ME_PORTS, True);
  frmLeverControl.ComPort1.WriteStr('LeverInServicePS:1' + #10);
end;

procedure TForm1.btnLeverInServiceSBClick(Sender: TObject);
begin
  PCSSystem.LeverInService(C_PCS_ME_STARBOARD,True);
  frmLeverControl.ComPort1.WriteStr('LeverInServiceSB:1' + #10);
end;

procedure TForm1.btnGeneralPanelStartClick(Sender: TObject);
begin
  if frm_GeneralPanel.Showing then
    frm_GeneralPanel.Visible := False
  else
    frm_GeneralPanel.Show;
//  frmPCSAlarm := TfrmPCSAlarm.Create(Self);
end;

procedure TForm1.btnLeverControlClick(Sender: TObject);
begin
  if frmLeverControl.Showing then
    frmLeverControl.Visible := False
  else
    frmLeverControl.Show;
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
  PCSSystem.ShaftDriven(C_PCS_GB_PORTS, True);
end;

procedure TForm1.btnShaftDrivenSBClick(Sender: TObject);
begin
  PCSSystem.ShaftDriven(C_PCS_GB_STARBOARD, True);
end;

procedure TForm1.btnShaftStopPSClick(Sender: TObject);
begin
  PCSSystem.ShaftDriven(C_PCS_GB_PORTS, False);
end;

procedure TForm1.btnShaftStopSBClick(Sender: TObject);
begin
  PCSSystem.ShaftDriven(C_PCS_GB_STARBOARD, False);
end;

procedure TForm1.btnShaftTrailingPSClick(Sender: TObject);
var
  Value : Double;
begin
  PCSSystem.ShaftTrailing(C_PCS_GB_PORTS, 40, True);
end;

procedure TForm1.btnShaftTrailingSBClick(Sender: TObject);
var
  Value : Double;
begin
  PCSSystem.ShaftTrailing(C_PCS_GB_STARBOARD, 40, True);
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
  PCSSystem.TransferOverride(C_PCS_ME_PORTS,True);
end;

procedure TForm1.btnTransferOverrideSBClick(Sender: TObject);
begin
  PCSSystem.TransferOverride(C_PCS_ME_STARBOARD,True);
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
//  PCSSystem := TPCSSystem.Create;

  with PCSSystem.Network.Listeners.Add('Logger') as TPropertyEventListener do begin
    OnPropertyStringChange := EventLogStr;
  end;

  FListener := TListeners.Create;
  with PCSSystem.Listener.Add('Main Form') as TPropertyEventListener do begin
    OnPropertyBoolChange := PCSSystemEvent;
  end;

  with PCSSystem.Network.Listeners.Add('PCSUINETWORK') as TPropertyEventListener do
  begin
    OnPropertyStringChange:= PCSSystemEvent;
    OnPropertyObjectChange:= PCSSystemEvent;
  end;

  LoadSettingForm('..\bin\setting.ini');

  counterCheck := 0;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  frmPCSAlarm.Free;

//  PCSSystem.Free;
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
    Height := 0;
    Top := 1150;
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
    if Assigned(frmLeverControl) then
    begin
      frmLeverControl.Show;
    end
    else
    begin
      frmLeverControl := TfrmLeverControl.Create(self);
      frmLeverControl.FormStyle := fsStayOnTop;
      frmLeverControl.Show;
      frmLeverControl.BringToFront;
    end;
  end;

  if idLeverTest = 1 then
  begin
//    if Assigned(frmLeverControl) then
//    begin
//      frmLeverControl.Show;
//    end
//    else
//    begin
//      frmLeverControl := TfrmLeverControl.Create(self);
//      frmLeverControl.Show;
//    end;
  end;

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
//  Top := Screen.Monitors[i].Top;
//  Left := Screen.Monitors[i].Left;

  Top := 1930;
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

procedure TForm1.PCSSystemEvent(Sender: TObject; PropsID: E_PropsID; Value: TObject);
begin
  case PropsID of
    epNetworkConnectedToServer: begin
      if mmoNetLogger.Lines.Count>100 then
        mmoNetLogger.Lines.Delete(0);
      mmoNetLogger.Lines.Add('[' + TTCPClient(Value).SocketIdentifier + '] Connected to : ' + TTCPClient(Value).ServerAddress);
    end;
    epNetworkDisconnectedFromServer: begin
      if mmoNetLogger.Lines.Count>100 then
        mmoNetLogger.Lines.Delete(0);
      mmoNetLogger.Lines.Add('[' + TTCPClient(Value).SocketIdentifier + ']Disconnected from : ' + TTCPClient(Value).ServerAddress);
    end;
  end;
end;

procedure TForm1.PCSSystemEvent(Sender: TObject; PropsID: E_PropsID; Value: string);
begin
  case PropsID of
	  epNetworkLogRcv: begin
	    if mmoLogReceive.Lines.Count>100 then
	      mmoLogReceive.Lines.Delete(0);
	    mmoLogReceive.Lines.Add(Value);
	  end;
	end;
end;

procedure TForm1.PCSSystemEvent(Sender: TObject; PropsID: E_PropsID; Value: Boolean);
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

function TForm1.ThrottleValue(Position: Integer): Double;
begin
  Result := EnsureRange(Round(Position / 1023 * 21), 0, 21);
end;

function TForm1.TrackbarSpeed(Position: Integer): Double;
begin
  Result := LeverValuesPositionManouver[Position];
  Result := LeverValuesPositionTransit[Position];
end;

procedure TForm1.LeverValuePosition;
begin
  // Mode Manouver
//  LeverValuesPositionManouver[0]  := 11;
//  LeverValuesPositionManouver[1]  := 10;
//  LeverValuesPositionManouver[2]  := 9;
//  LeverValuesPositionManouver[3]  := 8;
//  LeverValuesPositionManouver[4]  := 7;
//  LeverValuesPositionManouver[5]  := 6;
//  LeverValuesPositionManouver[6]  := 5;
//  LeverValuesPositionManouver[7]  := 4;
//  LeverValuesPositionManouver[8]  := 3.5;
//  LeverValuesPositionManouver[9]  := 3;
//  LeverValuesPositionManouver[10] := 2;
//  LeverValuesPositionManouver[11] := 1;
//  LeverValuesPositionManouver[12] := 0.5;
//  LeverValuesPositionManouver[13] := 0;
//  LeverValuesPositionManouver[14] := -0.5;
//  LeverValuesPositionManouver[15] := -2;
//  LeverValuesPositionManouver[16] := -4;
//  LeverValuesPositionManouver[17] := -6;
//  LeverValuesPositionManouver[18] := -7;
//  LeverValuesPositionManouver[19] := -8;
//  LeverValuesPositionManouver[20] := -9;
//  LeverValuesPositionManouver[21] := -10;

  LeverValuesPositionManouver[0]  := 0;
  LeverValuesPositionManouver[1]  := 0.5;
  LeverValuesPositionManouver[2]  := 1;
  LeverValuesPositionManouver[3]  := 2;
  LeverValuesPositionManouver[4]  := 3;
  LeverValuesPositionManouver[5]  := 3.5;
  LeverValuesPositionManouver[6]  := 4;
  LeverValuesPositionManouver[7]  := 5;
  LeverValuesPositionManouver[8]  := 6;
  LeverValuesPositionManouver[9]  := 7;
  LeverValuesPositionManouver[10] := 8;
  LeverValuesPositionManouver[11] := 9;
  LeverValuesPositionManouver[12] := 10;
  LeverValuesPositionManouver[13] := -10;
  LeverValuesPositionManouver[14] := -9;
  LeverValuesPositionManouver[15] := -8;
  LeverValuesPositionManouver[16] := -7;
  LeverValuesPositionManouver[17] := -6;
  LeverValuesPositionManouver[18] := -5;
  LeverValuesPositionManouver[19] := -4;
  LeverValuesPositionManouver[20] := -3;
  LeverValuesPositionManouver[21] := -2;

  // Mode Transit
  LeverValuesPositionTransit[0]  := 10;
  LeverValuesPositionTransit[1]  := 9;
  LeverValuesPositionTransit[2]  := 8;
  LeverValuesPositionTransit[3]  := 7;
  LeverValuesPositionTransit[4]  := 6;
  LeverValuesPositionTransit[5]  := 5;
  LeverValuesPositionTransit[6]  := 4;
  LeverValuesPositionTransit[7]  := 3.5;
  LeverValuesPositionTransit[8]  := 3;
  LeverValuesPositionTransit[9]  := 2;
  LeverValuesPositionTransit[10] := 1;
  LeverValuesPositionTransit[11] := 0.5;
  LeverValuesPositionTransit[12] := 0;
end;

procedure TForm1.trckbrPSChange(Sender: TObject);
var
  LeverSpeed, LeverSpeedTransit : Double;
begin
  if PCSSystem.Manouver then
  begin
    LeverSpeed := LeverValuesPositionManouver[trckbrPS.Position];

    if LeverSpeed < 0 then
    begin
      lblAheadPS.Color  := clLime;
      lblAsternPS.Color := clWindow;
    end
    else
    if LeverSpeed > 0 then
    begin
      lblAsternPS.Color := clLime;
      lblAheadPS.Color  := clWindow;
    end
    else
    begin
      lblAheadPS.Color  := clWindow;
      lblAsternPS.Color := clWindow;
    end;

    lblLeverPS.Caption := FloatToStr(LeverSpeed);
    PCSSystem.LeverSpeed(C_PCS_ME_PORTS, LeverSpeed, True);
    PCSSystem.LeverPitch(C_PCS_CPP_PORTS, LeverSpeed, True);
    PCSSystem.LeverShaft(C_PCS_GB_PORTS, LeverSpeed, True);
  end
  else if PCSSystem.Transit then
  begin
    LeverSpeedTransit := LeverValuesPositionTransit[trckbrPS.Position];

    if LeverSpeedTransit < 0 then
    begin
      lblAheadPS.Color  := clLime;
      lblAsternPS.Color := clWindow;
    end
    else
    if LeverSpeedTransit > 0 then
    begin
      lblAsternPS.Color := clLime;
      lblAheadPS.Color  := clWindow;
    end
    else
    begin
      lblAheadPS.Color  := clWindow;
      lblAsternPS.Color := clWindow;
    end;

    lblLeverPS.Caption := FloatToStr(LeverSpeedTransit);
    PCSSystem.LeverSpeed(C_PCS_ME_PORTS, LeverSpeedTransit, False);
    PCSSystem.LeverPitch(C_PCS_CPP_PORTS, LeverSpeedTransit, False);
    PCSSystem.LeverShaft(C_PCS_GB_PORTS, LeverSpeedTransit, False);
  end;
end;

procedure TForm1.trckbrSBChange(Sender: TObject);
var
  LeverSpeed : Double;
begin
  LeverSpeed := LeverValuesPositionManouver[trckbrSB.Position];

  if LeverSpeed < 0 then
  begin
    lblAheadPS.Color  := clLime;
    lblAsternPS.Color := clWindow;
  end
  else
  if LeverSpeed > 0 then
  begin
    lblAsternPS.Color := clLime;
    lblAheadPS.Color  := clWindow;
  end
  else
  begin
    lblAheadPS.Color  := clWindow;
    lblAsternPS.Color := clWindow;
  end;

  lblLeverSB.Caption := FloatToStr(LeverSpeed);
  PCSSystem.LeverSpeed(C_PCS_ME_STARBOARD, LeverSpeed, True);
  PCSSystem.LeverPitch(C_PCS_CPP_STARBOARD, LeverSpeed, True);
  PCSSystem.LeverShaft(C_PCS_GB_STARBOARD, LeverSpeed, True);
end;

end.
