unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  VrControls, VrRotarySwitch, Vcl.StdCtrls,

  uSetting, uListener, uFreezeFrom, uDataType, Vcl.MPlayer;

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
    btnStart: TImage;
    btnStop: TImage;
    btnStandby: TImage;
    btnManual: TImage;
    btnReset: TImage;
    btnSirenOff: TImage;
    btnLampTest: TImage;
    lblRunningHours: TLabel;
    imgGenSpaceHeater: TImage;
    imgJWHeater: TImage;
    mpAlarm: TMediaPlayer;
    tmrRunningHours: TTimer;
    tmrStop: TTimer;
    tmrReset: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnLampTestMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnLampTestMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
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
    FListener : TListeners;
    Lamps  : array of TImage;
    LampStatus  : array of Boolean;
    FRunningHourTemp : Integer;
    FRunningHour : Integer;

    procedure DieselGeneratorSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Integer);overload;
    procedure DieselGeneratorSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Boolean);overload;

  public
    { Public declarations }
    silence : Boolean;
//    ObjectGenerator : TGenerator;
//
//    procedure UpdateForm(Generator : TGenerator);
  end;

var
  MainForm: TMainForm;

implementation

uses
  uDieselGeneratorSystem;

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Setting   := TSetting.Create;
  DieselGeneratorSystem := TDieselGeneratorSystem.Create;

  FListener := TListeners.Create;
  with DieselGeneratorSystem.Listener.Add('DIESELGENERATOR') as TPropertyEventListener do
  begin
    OnPropertyIntChange := DieselGeneratorSystemEvent;
    OnPropertyBoolChange := DieselGeneratorSystemEvent;
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
end;

procedure TMainForm.DieselGeneratorSystemEvent(Sender: TObject; PropsID: E_PropsID; Value: Boolean);
begin
  case PropsID of
    epPMSGeneratorEngineRun :
    begin
      imgStart.Visible          := Value;
      imgStop.Visible           := not Value;
      tmrRunningHours.Enabled   := Value;

      imgRunning.Visible        := Value;
    end;
    epPMSGeneratorStop:
    begin
      imgStart.Visible          := not Value;
      imgStop.Visible           := Value;
      tmrStop.Enabled           := True;
      tmrRunningHours.Enabled   := False;

      imgRunning.Visible        := not Value;
    end;
    epPMSMeasPowFailure :
    begin
      imgSupplyVoltageLow.Visible := Value;

      imgRunning.Visible      := not Value;
      imgStart.Visible        := not Value;
      btnStart.Enabled        := not Value;

      Alarm(Value);
    end;
    epPMSAutStartFailure :
    begin
      imgAutomaticStartFailed.Visible := Value;

      imgRunning.Visible      := not Value;
      imgStart.Visible        := not Value;
      btnStart.Enabled        := not Value;

      Alarm(Value);
    end;
    epPMSSpeedSensorFailureAlrm :
    begin
      imgSpeedSensorFailure.Visible := Value;

      imgRunning.Visible      := not Value;
      imgStart.Visible        := not Value;
      btnStart.Enabled        := not Value;

      Alarm(Value);
    end;
    epPMSLubOilPressLowAlrm :
    begin
      imgLubOilPressLow.Visible := Value;

      imgRunning.Visible      := not Value;
      imgStart.Visible        := not Value;
      btnStart.Enabled        := not Value;

      Alarm(Value);
    end;
    epPMSLubOilTempHigh :
    begin
      imgLubOilTempHigh.Visible := Value;

      imgRunning.Visible      := not Value;
      imgStart.Visible        := not Value;
      btnStart.Enabled        := not Value;

      Alarm(Value);
    end;
    epPMSCoolWaterTempHighAlrm  :
    begin
      imgCoolingWaterTempHigh.Visible := Value;

      imgRunning.Visible      := not Value;
      imgStart.Visible        := not Value;
      btnStart.Enabled        := not Value;

      Alarm(Value);
    end;
    epPMSCoolWaterLevelLow :
    begin
      imgCoolingWaterLevelLow.Visible := Value;

      imgRunning.Visible      := not Value;
      imgStart.Visible        := not Value;
      btnStart.Enabled        := not Value;

      Alarm(Value);
    end;
    epPMSFuelOilLeakage :
    begin
      imgFuelOilLeakage.Visible := Value;

      imgRunning.Visible      := not Value;
      imgStart.Visible        := not Value;
      btnStart.Enabled        := not Value;

      Alarm(Value);
    end;

    epPMSSpeedSensorFailureShutdown : imgShutdownOverSpeed.Visible  := Value;
    epPMSLubOilPressLowShutdown     : imgShutdownLOPressLow.Visible := Value;
    epPMSCoolWaterTempHighShutdown  : imgShutdownCWTempHigh.Visible := Value;

    epPMSNotStandby :
    begin
      imgManual.Visible := Value;
      imgStandby.Visible := not Value
    end;
    epPMSStartDisable : imgStartDisable.Visible := Value;
  end;
end;

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

procedure TMainForm.btnLampTestMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  DoLampTest(True);
end;

procedure TMainForm.btnLampTestMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  DoLampTest(False);
end;

procedure TMainForm.btnManualClick(Sender: TObject);
begin
  DieselGeneratorSystem.EngineMode(True);
end;

procedure TMainForm.btnResetClick(Sender: TObject);
begin
  imgReset.Visible := True;
  tmrReset.Enabled := True;

//  imgStart.Visible    := False;
//  imgStop.Visible     := False;
//  imgStandby.Visible  := False;
//  imgManual.Visible   := False;

  imgSupplyVoltageLow.Visible     := False;
  imgAutomaticStartFailed.Visible := False;
  imgSpeedSensorFailure.Visible   := False;
  imgLubOilPressLow.Visible       := False;
  imgLubOilTempHigh.Visible       := False;
  imgCoolingWaterTempHigh.Visible := False;
  imgCoolingWaterLevelLow.Visible := False;
  imgFuelOilLeakage.Visible       := False;

  imgShutdownOverSpeed.Visible  := False;
  imgShutdownLOPressLow.Visible := False;
  imgShutdownCWTempHigh.Visible := False;
  imgShutDownSpare.Visible      := False;
end;

procedure TMainForm.btnSirenOffClick(Sender: TObject);
begin
  Alarm(False);
end;

procedure TMainForm.btnStandbyClick(Sender: TObject);
begin
  DieselGeneratorSystem.EngineMode(False);
end;

procedure TMainForm.btnStartClick(Sender: TObject);
begin
  DieselGeneratorSystem.EngineRun(True);
end;

procedure TMainForm.btnStopClick(Sender: TObject);
begin
  tmrStop.Enabled := True;
  DieselGeneratorSystem.EngineStop(True);

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

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  FListener.Free;
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

//procedure TMainForm.UpdateForm(Generator: TGenerator);
//begin
////
//end;

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

end.
