unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  VrControls, VrRotarySwitch, Vcl.StdCtrls,

  uSetting, uListener, uFreezeFrom, uDataType, Vcl.MPlayer, uGenerator;

type
  TMainForm = class(TForm)
    imgBackground: TImage;
    VrMainSwitch: TVrRotarySwitch;
    imgSupplyVoltageLow: TImage;
    imgAutomaticStartFailed: TImage;
    imgSpeedSensorFailure: TImage;
    imgLubOilPressLow: TImage;
    imgLubOilTempHigh: TImage;
    imgCoolingWaterTempHigh: TImage;
    imgCoolingWaterLevelLow: TImage;
    imgFuelOilLeakage: TImage;
    imgSpare: TImage;
    imgShutdownOverSpeed: TImage;
    imgShutdownLOPressLow: TImage;
    imgShutdownCWTempHigh: TImage;
    imgShutDownSpare: TImage;
    imgRunning: TImage;
    imgStartDisable: TImage;
    imgReset: TImage;
    imgManual: TImage;
    imgStandby: TImage;
    imgStop: TImage;
    imgStart: TImage;
    lblRunningHours: TLabel;
    imgGenSpaceHeater: TImage;
    imgJWHeater: TImage;
    mpAlarm: TMediaPlayer;
    tmrRunningHours: TTimer;
    tmrStop: TTimer;
    tmrReset: TTimer;
    mmoNetLogger: TMemo;
    mmoLogReceive: TMemo;
    pnlMainBackground: TPanel;
    btnLampTest: TImage;
    btnManual: TImage;
    btnReset: TImage;
    btnSirenOff: TImage;
    btnStandby: TImage;
    btnStart: TImage;
    btnStop: TImage;

    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnLampTestMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnLampTestMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure btnStandbyClick(Sender: TObject);
    procedure VrMainSwitchChange(Sender: TObject);
    procedure btnManualClick(Sender: TObject);
    procedure DoLampTest(OnOff : Boolean);
    procedure btnSirenOffClick(Sender: TObject);
    procedure mpAlarmNotify(Sender: TObject);
    procedure Alarm(Value: Boolean);
    procedure btnResetClick(Sender: TObject);
    procedure tmrRunningHoursTimer(Sender: TObject);
    procedure tmrResetTimer(Sender: TObject);
    procedure tmrStopTimer(Sender: TObject);

  private
//    FListener : TListeners;
    Lamps  : array of TImage;
    LampStatus  : array of Boolean;
    FRunningHourTemp : Integer;
    FRunningHour : Integer;

    procedure DieselGeneratorSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Integer);overload;
    procedure DieselGeneratorSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Boolean);overload;
    procedure DieselGeneratorSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : string);overload;
    procedure DieselGeneratorSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : TObject);overload;

  public
    { Public declarations }
    silence : Boolean;
    GeneratorTemp : TGenerator;

  end;

var
  MainForm: TMainForm;

implementation

uses
  uTCPClient, uDieselGeneratorSystem;

{$R *.dfm}

procedure EnableComposited(WinControl:TWinControl);
var
  i:Integer;
  NewExStyle:DWORD;
begin
  NewExStyle := GetWindowLong(WinControl.Handle, GWL_EXSTYLE) or WS_EX_COMPOSITED;
  SetWindowLong(WinControl.Handle, GWL_EXSTYLE, NewExStyle);

  for I := 0 to WinControl.ControlCount - 1 do
    if WinControl.Controls[i] is TWinControl then
      EnableComposited(TWinControl(WinControl.Controls[i]));
end;

{$REGION ' Form Procedure '}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  EnableComposited(pnlMainBackground);

  Setting   := TSetting.Create;
  DieselGeneratorSystem := TDieselGeneratorSystem.Create;

//  FListener := TListeners.Create;
  with DieselGeneratorSystem.Listener.Add('DIESELGENERATOR') as TPropertyEventListener do
  begin
    OnPropertyIntChange := DieselGeneratorSystemEvent;
    OnPropertyBoolChange := DieselGeneratorSystemEvent;
  end;

  with DieselGeneratorSystem.Network.Listeners.Add('DIESELGENERATORNETWORK') as TPropertyEventListener do
  begin
    OnPropertyStringChange:= DieselGeneratorSystemEvent;
    OnPropertyObjectChange:= DieselGeneratorSystemEvent;
  end;

  Lamps := [imgSupplyVoltageLow, imgAutomaticStartFailed, imgSpeedSensorFailure,
            imgLubOilPressLow, imgLubOilTempHigh, imgCoolingWaterTempHigh,
            imgCoolingWaterLevelLow, imgFuelOilLeakage, imgSpare,
            imgShutdownOverSpeed, imgShutdownLOPressLow, imgShutdownCWTempHigh, imgShutDownSpare,
            imgRunning, imgStartDisable,
            imgStart, imgStop, imgStandby, imgManual, imgReset ];

  SetLength(LampStatus, Length(Lamps));

  if not FileExists(ExtractFilePath(Application.Exename) + 'ACS_ALARM.mp3') then
  begin
    raise Exception.Create('ACS_ALARM.mp3 Not found');
  end
  else
    mpAlarm.FileName:= ExtractFilePath(Application.Exename) + 'ACS_ALARM.mp3';

  silence := False;

  {Create Generator Temporary}
  GeneratorTemp := TGenerator.Create;
  GeneratorTemp.Identifier := DieselGeneratorSystem.IdConsole;
  GeneratorTemp.GeneratorState := 1;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  GeneratorTemp.Destroy;
//  FListener.Free;
  DieselGeneratorSystem.Free;
  Setting.Free;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  if Screen.MonitorCount > 1 then
  begin
    DefaultMonitor := dmDesktop;

    Width := Screen.Monitors[1].Width;
    Height := Screen.Monitors[1].Height;
    Left := Screen.Monitors[1].Left;
    Top := Screen.Monitors[1].Top;
  end;
end;

{$ENDREGION}

{$REGION ' Event Procedure '}

procedure TMainForm.DieselGeneratorSystemEvent(Sender: TObject; PropsID: E_PropsID; Value: Boolean);
begin
  case PropsID of
    epPMSGeneratorEngineRun :
    begin
      GeneratorTemp.EngineRun := Value;
      imgStart.Visible := Value;
      imgStop.Visible := not Value;
      tmrRunningHours.Enabled := Value;

      imgRunning.Visible := Value;
    end;

    epPMSGeneratorSupplied : GeneratorTemp.GeneratorSupplied := Value;
    epPMSGeneratorCBClosed : GeneratorTemp.CBClosed := Value;
    epPMSGeneratorPreference : GeneratorTemp.Preference := Value;
    epPMSGeneratorBusbar : GeneratorTemp.Busbar := Value;
    epPMSGeneratorFuelRunsOut : GeneratorTemp.FuelRunsOut := Value;
    epPMSGeneratorEmergencyStop : GeneratorTemp.EmergencyStop := Value;
    epPMSShutDown : GeneratorTemp.ShutDown := Value;
    epPMSFailureCBClosed : GeneratorTemp.FailureCBClosed := Value;

    epPMSNotStandby :
    begin
      GeneratorTemp.NotStandby := Value;

      imgManual.Visible := Value;
      imgStandby.Visible := not Value
    end;

    epPMSMeasPowFailure :
    begin
      GeneratorTemp.MeasPowFailure := Value;

      if Value then
      begin
        imgSupplyVoltageLow.Visible := Value;
        Alarm(Value);
      end;
    end;

    epPMSAutStartFailure :
    begin
      GeneratorTemp.AutStartFailure := Value;

      if Value then
      begin
        imgAutomaticStartFailed.Visible := Value;
        Alarm(Value);
      end;
    end;

    epPMSSpeedSensorFailureAlrm :
    begin
      GeneratorTemp.SpeedSensorFailureAlrm := Value;

      if Value then
      begin
        imgSpeedSensorFailure.Visible := Value;
        Alarm(Value);
      end;
    end;

    epPMSLubOilPressLowAlrm :
    begin
      GeneratorTemp.LubOilPressLowAlrm := Value;

      if Value then
      begin
        imgLubOilPressLow.Visible := Value;
        Alarm(Value);
      end;
    end;

    epPMSLubOilTempHigh :
    begin
      GeneratorTemp.LubOilTempHigh := Value;

      if Value then
      begin
        imgLubOilTempHigh.Visible := Value;
        Alarm(Value);
      end;
    end;

    epPMSCoolWaterTempHighAlrm  :
    begin
      GeneratorTemp.CoolWaterTempHighAlrm := Value;

      if Value then
      begin
        imgCoolingWaterTempHigh.Visible := Value;
        Alarm(Value);
      end;
    end;

    epPMSCoolWaterLevelLow :
    begin
      GeneratorTemp.CoolWaterLevelLow := Value;

      if Value then
      begin
        imgCoolingWaterLevelLow.Visible := Value;
        Alarm(Value);
      end;
    end;

    epPMSFuelOilLeakage :
    begin
      GeneratorTemp.FuelOilLeakage := Value;

      if Value then
      begin
        imgFuelOilLeakage.Visible := Value;
        Alarm(Value);
      end;
    end;

    epPMSSpeedSensorFailureShutdown :
    begin
      GeneratorTemp.SpeedSensorFailureShutdown := Value;

      if Value then
      begin
        imgShutdownOverSpeed.Visible  := Value;
      end;
    end;

    epPMSLubOilPressLowShutdown :
    begin
      GeneratorTemp.LubOilPressLowShutdown := Value;

      if Value then
      begin
        imgShutdownLOPressLow.Visible := Value;
      end;
    end;

    epPMSCoolWaterTempHighShutdown :
    begin
      GeneratorTemp.CoolWaterTempHighShutdown := Value;

      if Value then
      begin
        imgShutdownCWTempHigh.Visible := Value;
      end;
    end;

    epPMSStartDisable : imgStartDisable.Visible := Value;
  end;
end;

procedure TMainForm.DieselGeneratorSystemEvent(Sender: TObject; PropsID: E_PropsID; Value: Integer);
begin
  case PropsID of
    epPMSFreezed:
    begin
      if Value = 1 then
      begin
        MainForm.Enabled := False;
        DieselGeneratorSystem.FFormFreezed[1] := TfrmFreeze.Create(MainForm);
        with DieselGeneratorSystem.FFormFreezed[1] do
        begin
          Parent := MainForm;
          Position := poOwnerFormCenter;
          BringToFront;
          Show;
        end;
      end
      else if Value = 0 then
      begin
        MainForm.Enabled := True;
        if Assigned(DieselGeneratorSystem.FFormFreezed[1]) then
          FreeAndNil(DieselGeneratorSystem.FFormFreezed[1]);
      end;
    end;
//    epPMSGeneratorRunningHours:
//    begin
//      lblRunningHours.Caption := IntToStr(Value);
//    end;
  end;
end;

procedure TMainForm.DieselGeneratorSystemEvent(Sender: TObject; PropsID: E_PropsID; Value: string);
begin
  case PropsID of
	  epNetworkLogRcv: begin
	    if mmoLogReceive.Lines.Count>100 then
	      mmoLogReceive.Lines.Delete(0);
	    mmoLogReceive.Lines.Add(Value);
	  end;
	end;
end;

procedure TMainForm.DieselGeneratorSystemEvent(Sender: TObject; PropsID: E_PropsID; Value: TObject);
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

{$ENDREGION}

{$REGION ' Button Handle Procedure '}

procedure TMainForm.btnStartClick(Sender: TObject);
begin
  with GeneratorTemp do
  begin
    if MeasPowFailure or AutStartFailure  or SpeedSensorFailureAlrm or LubOilPressLowAlrm or LubOilTempHigh or CoolWaterTempHighAlrm or
       CoolWaterLevelLow or FuelOilLeakage or SpeedSensorFailureShutdown or LubOilPressLowShutdown or CoolWaterTempHighShutdown or EmergencyStop then
       Exit;
  end;

  DieselGeneratorSystem.EngineRun(True);
end;

procedure TMainForm.btnStopClick(Sender: TObject);
begin
  tmrStop.Enabled := True;
  DieselGeneratorSystem.EngineStop(True);
end;

procedure TMainForm.btnStandbyClick(Sender: TObject);
begin
  DieselGeneratorSystem.GeneratorMode(3);
  DieselGeneratorSystem.EngineMode(False);
end;

procedure TMainForm.btnManualClick(Sender: TObject);
begin
  if GeneratorTemp.EngineRun then
    Exit;

  DieselGeneratorSystem.GeneratorMode(1);
  DieselGeneratorSystem.EngineMode(True);
end;

procedure TMainForm.btnResetClick(Sender: TObject);
begin
  imgReset.Visible := True;
  tmrReset.Enabled := True;

  imgSupplyVoltageLow.Visible     := GeneratorTemp.MeasPowFailure;
  imgAutomaticStartFailed.Visible := GeneratorTemp.AutStartFailure;
  imgSpeedSensorFailure.Visible   := GeneratorTemp.SpeedSensorFailureAlrm;
  imgLubOilPressLow.Visible       := GeneratorTemp.LubOilPressLowAlrm;
  imgLubOilTempHigh.Visible       := GeneratorTemp.LubOilTempHigh;
  imgCoolingWaterTempHigh.Visible := GeneratorTemp.CoolWaterTempHighAlrm;
  imgCoolingWaterLevelLow.Visible := GeneratorTemp.CoolWaterLevelLow;
  imgFuelOilLeakage.Visible       := GeneratorTemp.FuelOilLeakage;

  imgShutdownOverSpeed.Visible  := GeneratorTemp.SpeedSensorFailureShutdown;
  imgShutdownLOPressLow.Visible := GeneratorTemp.LubOilPressLowShutdown;
  imgShutdownCWTempHigh.Visible := GeneratorTemp.CoolWaterTempHighShutdown;
  imgShutDownSpare.Visible      := False;
end;

procedure TMainForm.btnLampTestMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DoLampTest(True);
end;

procedure TMainForm.btnLampTestMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DoLampTest(False);
end;

procedure TMainForm.btnSirenOffClick(Sender: TObject);
begin
  Alarm(False);
end;

{$ENDREGION}

{$REGION ' Additional Procedure '}

procedure TMainForm.DoLampTest(OnOff: Boolean);
var
  i : Integer;
begin
  if OnOff then
  begin
    for i := 0 to High(Lamps) do
    begin
      LampStatus[i] := Lamps[i].Visible;
      Lamps[i].Visible := True;
    end;
  end
  else
  begin
     for i := 0 to High(Lamps) do
    begin
      Lamps[i].Visible := LampStatus[i];
    end;
  end;

end;

procedure TMainForm.Alarm(Value: Boolean);
begin
  if Value then
  begin
    silence := True;
    mpAlarm.OnNotify := mpAlarmNotify;
    if not (mpAlarm.Mode = mpPlaying) then
    begin
      mpAlarm.Open;
      mpAlarm.Play;
    end;
  end
  else
  begin
    mpAlarm.Open;
    mpAlarm.Stop;
    mpAlarm.Notify := False;
  end;
end;

procedure TMainForm.mpAlarmNotify(Sender: TObject);
begin
  if (mpAlarm.NotifyValue = nvSuccessful) and silence then
  begin
    mpAlarm.Play;
    mpAlarm.Notify := True;
  end;
end;

procedure TMainForm.tmrResetTimer(Sender: TObject);
begin
  imgReset.Visible := False;
  tmrReset.Enabled := False;
end;

procedure TMainForm.tmrRunningHoursTimer(Sender: TObject);
begin
  FRunningHourTemp := FRunningHourTemp + 1;
  if FRunningHourTemp > 25 then
  begin
    FRunningHourTemp := 0;
    FRunningHour := FRunningHour + 1;
    lblRunningHours.Caption := IntToStr(FRunningHour);
  end;
end;

procedure TMainForm.tmrStopTimer(Sender: TObject);
begin
  imgStop.Visible := False;
  tmrStop.Enabled := False;
end;

procedure TMainForm.VrMainSwitchChange(Sender: TObject);
begin
  if VrMainSwitch.SwitchPosition = 0 then
  begin
    imgJWHeater.Visible := False;
    imgGenSpaceHeater.Visible := False;
  end
  else
  begin
    imgJWHeater.Visible := True;
    imgGenSpaceHeater.Visible := True;
  end;
end;

{$ENDREGION}

end.
