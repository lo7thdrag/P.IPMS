unit ufrmSignalingLightME1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, VrRotarySwitch,
  VrControls, VrButtons, Vcl.Buttons, SpeedButtonImage, Vcl.ExtCtrls,
  Vcl.ComCtrls, RzBmpBtn, Vcl.Imaging.pngimage,

  uListener, uDataType, uSetting;

type
  TfrmSignalingLightME1 = class(TForm)
    pnlMain: TPanel;
    imgSignaling1: TImage;
    imgSignaling2: TImage;
    imgAirValveOpenME1: TImage;
    img24VDCSafetiesME1: TImage;
    imgGazValveOpenME1: TImage;
    imgAirValveClosedME1: TImage;
    imgGazValveClosedME1: TImage;
    img24VDCControlME1: TImage;
    imgWatchDogorMajorFaultME1: TImage;
    imgSafetiesCircuitFailureME1: TImage;
    imgManualHandletoStopME1: TImage;
    imgSafetyStopME1: TImage;
    imgOverSpeedAirLowPressureME1: TImage;
    imgStartingSequenceFailureME1: TImage;
    imgClutchGearboxFaultME1: TImage;
    imgMinorFaultME1: TImage;
    imgGovernorLimitationME1: TImage;
    imgRemotePositionME1: TImage;
    imgLocalPositionME1: TImage;
    imgTurningGearEngagedME1: TImage;
    imgSpare: TImage;
    imgStartingAllowedME1: TImage;
    imgClutchAllowedME1: TImage;
    imgStopME1: TImage;
    imgClutchME1: TImage;
    imgByPassOpenME1: TImage;
    imgStartME1: TImage;
    imgDeclutchME1: TImage;
    imgByPassClosedME1: TImage;
    imgSafetiesorECResetME1: TImage;
    imgSafetiesStopOverbiddenME1: TImage;
    imgEmergencyStopME1: TImage;
    procedure btnStartClick(Sender: TObject);
    procedure btnClutchDeclutchClick(Sender: TObject);
    procedure btnEmergencyStopClick(Sender: TObject);
    procedure btnSafetiesStopClick(Sender: TObject);

    procedure imgSTShadowMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure imgStopME1Click(Sender: TObject);
  private
    FListener : TListeners;
    FIsBlinkState : Boolean;
    FIdBlink : Integer;

    FBlinkStart   : Cardinal;
    FImageToBlink : TImage;

    Indicators : array of TImage;
    IndicatorStatus : array of Boolean;

  public
    picture_Path : string;

    fIndicatorOn, fIndicatorOff, fIndicatorFault,
    fAlarmIndicatorGreenOn, fAlarmIndicatorGreenOff, fAlarmIndicatorGreenFault,
    fAlarmIndicatorBlueOn, fAlarmIndicatorBlueOff, fAlarmIndicatorBlueFault,
    fAlarmIndicatorRedOn, fAlarmIndicatorRedOff, fAlarmIndicatorRedFault,
    fAlarmIndicatorWhiteOn, fAlarmIndicatorWhiteOff, fAlarmIndicatorWhiteFault : string;
    Start_ON : Boolean;
  end;

var
  frmSignalingLightME1: TfrmSignalingLightME1;

implementation

uses
  ufrmPMSDieselEngineSafetiesME1, ufrmSetofPressureGaugesME1, uMainEngine1System, uFreezeFrom;

{$R *.dfm}

procedure TfrmSignalingLightME1.imgSTShadowMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  imgAirValveOpenME1.Visible := True;
  imgGazValveOpenME1.Visible := True;
  img24VDCSafetiesME1.Visible := True;

  imgAirValveClosedME1.Visible := True;
  imgGazValveClosedME1.Visible := True;
  img24VDCControlME1.Visible := True;

  imgWatchDogorMajorFaultME1.Visible := True;
  imgSafetiesCircuitFailureME1.Visible := True;
  imgManualHandletoStopME1.Visible := True;

  imgSafetyStopME1.Visible := True;
  imgOverSpeedAirLowPressureME1.Visible := True;
  imgStartingSequenceFailureME1.Visible := True;

  imgClutchGearboxFaultME1.Visible := True;
  imgTurningGearEngagedME1.Visible := True;
  imgSpare.Visible := True;

  imgMinorFaultME1.Visible := True;
  imgLocalPositionME1.Visible := True;
  imgStartingAllowedME1.Visible := True;

  imgGovernorLimitationME1.Visible := True;
  imgRemotePositionME1.Visible := True;
  imgClutchAllowedME1.Visible := True;

  imgStopME1.Visible := True;
  imgClutchME1.Visible := True;
  imgByPassOpenME1.Visible := True;

  imgStartME1.Visible := True;
  imgDeclutchME1.Visible := True;
  imgByPassClosedME1.Visible := True;

  imgSafetiesorECResetME1.Visible := True;
  imgSafetiesStopOverbiddenME1.Visible := True;
  imgEmergencyStopME1.Visible := True;
end;

procedure TfrmSignalingLightME1.btnClutchDeclutchClick(Sender: TObject);
begin
  MainEngine1System.Clutch(C_PCS_ME_STARBOARD);
end;

procedure TfrmSignalingLightME1.btnEmergencyStopClick(Sender: TObject);
begin
  MainEngine1System.EmergencyStop(C_PCS_ME_STARBOARD);
end;

procedure TfrmSignalingLightME1.btnStartClick(Sender: TObject);
begin
  MainEngine1System.RunningStart(C_PCS_ME_STARBOARD);
end;

procedure TfrmSignalingLightME1.imgStopME1Click(Sender: TObject);
begin
  MainEngine1System.StoppedStop(C_PCS_STARBOARD);
end;

procedure TfrmSignalingLightME1.btnSafetiesStopClick(Sender: TObject);
begin
  MainEngine1System.SafetiesStop(C_PCS_ME_STARBOARD);
end;
end.
