unit ufrmSignalingLightME1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, VrRotarySwitch,
  VrControls, VrButtons, Vcl.Buttons, SpeedButtonImage, Vcl.ExtCtrls,
  Vcl.ComCtrls, RzBmpBtn, Vcl.Imaging.pngimage;

type
  TfrmSignalingLightME1 = class(TForm)
    pnlMain: TPanel;
    Label19: TLabel;
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
    procedure MenuClick(Sender: TObject);
    procedure AirValveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSignalingLightME1: TfrmSignalingLightME1;

implementation

uses
  ufrmPMSDieselEngineSafetiesME1;

{$R *.dfm}

procedure TfrmSignalingLightME1.AirValveClick(Sender: TObject);
var
  VisibleState : Boolean;
begin

  imgSignaling1.Tag := 1 - imgSignaling1.Tag;

  VisibleState := imgSignaling1.Tag = 1;

  imgAirValveOpenME1.Visible := VisibleState;
  imgGazValveOpenME1.Visible := VisibleState;
  img24VDCSafetiesME1.Visible := VisibleState;

  imgAirValveClosedME1.Visible := VisibleState;
  imgGazValveClosedME1.Visible := VisibleState;
  img24VDCControlME1.Visible := VisibleState;

  imgWatchDogorMajorFaultME1.Visible := VisibleState;
  imgSafetiesCircuitFailureME1.Visible := VisibleState;
  imgManualHandletoStopME1.Visible := VisibleState;

  imgSafetyStopME1.Visible := VisibleState;
  imgOverSpeedAirLowPressureME1.Visible := VisibleState;
  imgStartingSequenceFailureME1.Visible := VisibleState;

  imgClutchGearboxFaultME1.Visible := VisibleState;
  imgTurningGearEngagedME1.Visible := VisibleState;
  imgSpare.Visible := VisibleState;

  imgMinorFaultME1.Visible := VisibleState;
  imgLocalPositionME1.Visible := VisibleState;
  imgStartingAllowedME1.Visible := VisibleState;

  imgGovernorLimitationME1.Visible := VisibleState;
  imgRemotePositionME1.Visible := VisibleState;
  imgClutchAllowedME1.Visible := VisibleState;

  imgStopME1.Visible := VisibleState;
  imgClutchME1.Visible := VisibleState;
  imgByPassOpenME1.Visible := VisibleState;

  imgStartME1.Visible := VisibleState;
  imgDeclutchME1.Visible := VisibleState;
  imgByPassClosedME1.Visible := VisibleState;

  imgSafetiesorECResetME1.Visible := VisibleState;
  imgSafetiesStopOverbiddenME1.Visible := VisibleState;
  imgEmergencyStopME1.Visible := VisibleState;
end;

procedure TfrmSignalingLightME1.MenuClick(Sender: TObject);
begin
  frmPMSDieselEngineSafetiesME1.Show;
  Self.Hide;
end;

end.
