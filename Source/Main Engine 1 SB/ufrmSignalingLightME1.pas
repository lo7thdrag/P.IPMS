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
    imgStartME1Shadow: TImage;
    imgStopME1Shadow: TImage;
    imgClutchME1Shadow: TImage;
    imgByPassOpenME1Shadow: TImage;
    imgDeclutchME1Shadow: TImage;
    imgByPassClosedME1Shadow: TImage;
    imgSafetiesorECResetME1Shadow: TImage;
    imgSafetiesStopOverbiddenME1Shadow: TImage;
    imgEmergencyStopME1Shadow: TImage;
    procedure btnStartClick(Sender: TObject);
    procedure btnClutchClick(Sender: TObject);
    procedure btnEmergencyStopClick(Sender: TObject);
    procedure btnSafetiesStopClick(Sender: TObject);
    procedure imgStopME1Click(Sender: TObject);
    procedure btnDeclutchClick(Sender: TObject);
    procedure btnByPassP2P4OpenClick(Sender: TObject);
    procedure btnByPassP2P4CloseClick(Sender: TObject);
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

procedure TfrmSignalingLightME1.btnByPassP2P4CloseClick(Sender: TObject);
begin
  MainEngine1System.ByPassCloseP2P4(C_PCS_ME_STARBOARD);
end;

procedure TfrmSignalingLightME1.btnByPassP2P4OpenClick(Sender: TObject);
begin
  MainEngine1System.ByPassOpenP2P4(C_PCS_ME_STARBOARD);
end;

procedure TfrmSignalingLightME1.btnClutchClick(Sender: TObject);
begin
  MainEngine1System.Clutch(C_PCS_GB_STARBOARD);
end;

procedure TfrmSignalingLightME1.btnDeclutchClick(Sender: TObject);
begin
  MainEngine1System.Declutch(C_PCS_GB_STARBOARD);
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
  MainEngine1System.StoppedStop(C_PCS_ME_STARBOARD);
end;

procedure TfrmSignalingLightME1.btnSafetiesStopClick(Sender: TObject);
begin
  MainEngine1System.SafetiesStop(C_PCS_ME_STARBOARD);
end;
end.
