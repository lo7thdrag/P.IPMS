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
    btnStartPS: TSpeedButtonImage;
    Label1: TLabel;
    btnStopPS: TSpeedButtonImage;
    Label2: TLabel;
    procedure MenuClick(Sender: TObject);
    procedure AirValveClick(Sender: TObject);
    procedure btnStartStopClick(Sender: TObject);
    procedure btnClutchDeclutchClick(Sender: TObject);
    procedure btnEmergencyStopClick(Sender: TObject);
    procedure btnSafetiesStopClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FIsBlinkState : Boolean;
    FIdBlink : Integer;
    FListener : TListeners;

    procedure MainEngine1SystemEvent(Sender : TObject; PropsID : E_PropsID; Value : Integer);overload;
    procedure MainEngine1SystemEvent(Sender : TObject; PropsID : E_PropsID; Value : Boolean);overload;
    procedure MainEngine1SystemEvent(Sender : TObject; PropsID : E_PropsID; Value : Double);overload;

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

procedure TfrmSignalingLightME1.FormCreate(Sender: TObject);
var
  i : Integer;
begin

end;

procedure TfrmSignalingLightME1.FormShow(Sender: TObject);
begin
  DefaultMonitor := dmDesktop;

  if Screen.MonitorCount > 1 then
  begin
    Height := Screen.Monitors[MainEngine1System.IdScreenSignaling].Height;
    Top    := Screen.Monitors[MainEngine1System.IdScreenSignaling].Top;
    Left   := Screen.Monitors[MainEngine1System.IdScreenSignaling].Left;
    width  := Screen.Monitors[MainEngine1System.IdScreenSignaling].Width;
  end
  else
  begin
    Height := Screen.Height;
    Width := Screen.Width;
    Left := 0;
    Top := 0;
  end;
end;

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

procedure TfrmSignalingLightME1.MainEngine1SystemEvent(Sender: TObject;
  PropsID: E_PropsID; Value: Integer);
begin
  case PropsID of
    epPCSFreezed:
      if Value = 1 then
      begin
        frmSignalingLightME1.Enabled := False;
        MainEngine1System.FFormFreezed[1] := TfrmFreeze.Create(frmSignalingLightME1);
        with MainEngine1System.FFormFreezed[1] do
        begin
          Parent   := frmSignalingLightME1;
          Position := poOwnerFormCenter;
          BringToFront;
          Show;
        end;
      end
      else if Value = 0 then
      begin
        frmSignalingLightME1.Enabled := True;
        if Assigned(MainEngine1System.FFormFreezed[1]) then
           FreeAndNil(MainEngine1System.FFormFreezed[1]);
      end;
  end;
end;


procedure TfrmSignalingLightME1.MainEngine1SystemEvent(Sender: TObject;
  PropsID: E_PropsID; Value: Boolean);
begin

end;

procedure TfrmSignalingLightME1.MainEngine1SystemEvent(Sender: TObject;
  PropsID: E_PropsID; Value: Double);
begin

end;

procedure TfrmSignalingLightME1.MenuClick(Sender: TObject);
begin
  frmPMSDieselEngineSafetiesME1.Show;
  Self.Hide;
end;

procedure TfrmSignalingLightME1.btnClutchDeclutchClick(Sender: TObject);
begin
  MainEngine1System.Clutch(C_PCS_ME_STARBOARD);
end;

procedure TfrmSignalingLightME1.btnEmergencyStopClick(Sender: TObject);
begin
  MainEngine1System.EmergencyStop(C_PCS_ME_STARBOARD);
end;

procedure TfrmSignalingLightME1.btnStartStopClick(Sender: TObject);
begin
  MainEngine1System.RunningStart(C_PCS_ME_STARBOARD);
end;

procedure TfrmSignalingLightME1.btnSafetiesStopClick(Sender: TObject);
begin
  MainEngine1System.SafetiesStop(C_PCS_ME_STARBOARD);
end;
end.
