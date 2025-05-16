unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  VrControls, VrRotarySwitch, Vcl.StdCtrls,

  uListener, uFreezeFrom, uDataType, Vcl.MPlayer;

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

  private
    FListener : TListeners;
    Lamps  : array of TImage;
    LampStatus  : array of Boolean;

    procedure DieselGeneratorSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Integer);overload;
    procedure DieselGeneratorSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Boolean);overload;

  public
    { Public declarations }
    silence : Boolean;
  end;

var
  MainForm: TMainForm;

implementation

uses
  uDieselGeneratorSystem;

{$R *.dfm}

procedure TMainForm.DieselGeneratorSystemEvent(Sender: TObject; PropsID: E_PropsID; Value: Boolean);
begin
  case PropsID of
    epPMSGeneratorEngineRun :
    begin
      imgStart.Visible          := Value;
      imgStop.Visible           := not Value;
      imgRunning.Visible        := Value;
      imgJWHeater.Visible       := not Value;
      imgGenSpaceHeater.Visible := not Value;
    end;
    epPMSGeneratorStop:
    begin
      imgStart.Visible          := not Value;
      imgStop.Visible           := Value;
    end;
    epPMSMeasPowFailure :
    begin
      imgSupplyVoltageLow.Visible := Value;

      imgStartDisable.Visible := Value;
      imgRunning.Visible      := not Value;
      imgStart.Visible        := not Value;
      btnStart.Enabled        := not Value;

      silence := True;
      mpAlarm.OnNotify := mpAlarmNotify;
      mpAlarm.Open;
      mpAlarm.Play;
    end;
    epPMSAutStartFailure :
    begin
      imgAutomaticStartFailed.Visible := Value;

      imgStartDisable.Visible := Value;
      imgRunning.Visible      := not Value;
      imgStart.Visible        := not Value;
      btnStart.Enabled        := not Value;

      silence := True;
      mpAlarm.OnNotify := mpAlarmNotify;
      mpAlarm.Open;
      mpAlarm.Play;
    end;
    epPMSSpeedSensorFailureAlrm :
    begin
      imgSpeedSensorFailure.Visible := Value;

      imgStartDisable.Visible := Value;
      imgRunning.Visible      := not Value;
      imgStart.Visible        := not Value;
      btnStart.Enabled        := not Value;

      silence := True;
      mpAlarm.OnNotify := mpAlarmNotify;
      mpAlarm.Open;
      mpAlarm.Play;
    end;
    epPMSLubOilPressLowAlrm     :
    begin
      imgLubOilPressLow.Visible := Value;

      imgStartDisable.Visible := Value;
      imgRunning.Visible      := not Value;
      imgStart.Visible        := not Value;
      btnStart.Enabled        := not Value;

      silence := True;
      mpAlarm.OnNotify := mpAlarmNotify;
      mpAlarm.Open;
      mpAlarm.Play;
    end;
    epPMSLubOilTempHigh         :
    begin
      imgLubOilTempHigh.Visible := Value;

      imgStartDisable.Visible := Value;
      imgRunning.Visible      := not Value;
      imgStart.Visible        := not Value;
      btnStart.Enabled        := not Value;

      silence := True;
      mpAlarm.OnNotify := mpAlarmNotify;
      mpAlarm.Open;
      mpAlarm.Play;
    end;
    epPMSCoolWaterTempHighAlrm  :
    begin
      imgCoolingWaterTempHigh.Visible := Value;

      imgStartDisable.Visible := Value;
      imgRunning.Visible      := not Value;
      imgStart.Visible        := not Value;
      btnStart.Enabled        := not Value;

      silence := True;
      mpAlarm.OnNotify := mpAlarmNotify;
      mpAlarm.Open;
      mpAlarm.Play;
    end;
    epPMSCoolWaterLevelLow :
    begin
      imgCoolingWaterLevelLow.Visible := Value;

      imgStartDisable.Visible := Value;
      imgRunning.Visible      := not Value;
      imgStart.Visible        := not Value;
      btnStart.Enabled        := not Value;

      silence := True;
      mpAlarm.OnNotify := mpAlarmNotify;
      mpAlarm.Open;
      mpAlarm.Play;
    end;
    epPMSFuelOilLeakage :
    begin
      imgFuelOilLeakage.Visible := Value;

      imgStartDisable.Visible := Value;
      imgRunning.Visible      := not Value;
      imgStart.Visible        := not Value;
      btnStart.Enabled        := not Value;

      silence := True;
      mpAlarm.OnNotify := mpAlarmNotify;
      mpAlarm.Open;
      mpAlarm.Play;
    end;

    epPMSSpeedSensorFailureShutdown : imgShutdownOverSpeed.Visible := Value;
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

procedure TMainForm.btnSirenOffClick(Sender: TObject);
begin
  mpAlarm.Open;
  mpAlarm.Stop;
  mpAlarm.Notify := False;
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
  DieselGeneratorSystem.EngineStop(True);
end;

procedure TMainForm.DieselGeneratorSystemEvent(Sender: TObject; PropsID: E_PropsID; Value: Integer);
begin
  case PropsID of
    epPMSFreezed:
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
    epPMSGeneratorRunningHours:
    begin
      lblRunningHours.Caption := IntToStr(Value);
    end;

//    epPCSCtrlBackgroundLamp:
//      BackgroundLampIndicator(Value);
//
//    epPCSCtrlLamptTest:
//      LampTestIndicator(Value);
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
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

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  FListener.Free;
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
