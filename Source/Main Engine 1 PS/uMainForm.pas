unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,

  uListener, uFreezeFrom, uDataType, Vcl.ExtCtrls;

type
  TfrmMainForm = class(TForm)
    tmrBlinkTimer: TTimer;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tmrBlinkMe1Timer(Sender: TObject);
  private
    FListener : TListeners;
    FIsBlinkState    : Boolean;
    FIsStartBlink    : Boolean;
    FIsStopBlink     : Boolean;
    FIsClutchBlink   : Boolean;
    FIsDeclutchBlink : Boolean;
    FBlinkCounter    : Integer;
    FIsRunning       : Boolean;
    FuelPosition     : Double;
    EngineSpeedPos   : Double;

    procedure MainEngine1SystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Integer);overload;
    procedure MainEngine1SystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Boolean);overload;
    procedure MainEngine1SystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Double);overload;
  public
    { Public declarations }
  end;

var
  frmMainForm: TfrmMainForm;

implementation

uses
  ufrmSetofPressureGaugesME1, ufrmSignalingLightME1, ufrmPMSDieselEngineSafetiesME1, uMainEngine1System;

{$R *.dfm}

procedure TfrmMainForm.FormCreate(Sender: TObject);
begin
  FListener := TListeners.Create;
  with MainEngine1System.Listener.Add('MAINENGINE 1') as TPropertyEventListener do
  begin
    OnPropertyIntChange  := MainEngine1SystemEvent;
    OnPropertyBoolChange := MainEngine1SystemEvent;
    OnPropertyDblChange  := MainEngine1SystemEvent;
  end;
end;

procedure TfrmMainForm.FormDestroy(Sender: TObject);
begin
  FListener.Free;
end;

procedure TfrmMainForm.FormShow(Sender: TObject);
begin
  if Screen.MonitorCount > MainEngine1System.IdScreenSignaling then
  begin
    with frmSignalingLightME1 do
    begin
      Left   := Screen.Monitors[MainEngine1System.IdScreenSignaling].Left;
      Top    := Screen.Monitors[MainEngine1System.IdScreenSignaling].Top;
      Width  := Screen.Monitors[MainEngine1System.IdScreenSignaling].Width;
      Height := Screen.Monitors[MainEngine1System.IdScreenSignaling].Height;
      Show;
    end;
  end;

  if Screen.MonitorCount > MainEngine1System.IdScreenPmsHmi then
  begin
    with frmPMSDieselEngineSafetiesME1 do
    begin
      Left   := Screen.Monitors[MainEngine1System.IdScreenPmsHmi].Left;
      Top    := Screen.Monitors[MainEngine1System.IdScreenPmsHmi].Top;
      Width  := Screen.Monitors[MainEngine1System.IdScreenPmsHmi].Width;
      Height := Screen.Monitors[MainEngine1System.IdScreenPmsHmi].Height;
      Show;
    end;
  end;

  if Screen.MonitorCount > MainEngine1System.IdScreenGauges then
  begin
    with frmSetofPressureGaugesME1 do
    begin
      Left   := Screen.Monitors[MainEngine1System.IdScreenGauges].Left;
      Top    := Screen.Monitors[MainEngine1System.IdScreenGauges].Top;
      Width  := Screen.Monitors[MainEngine1System.IdScreenGauges].Width;
      Height := Screen.Monitors[MainEngine1System.IdScreenGauges].Height;
      Show;
    end;
  end;
end;

procedure TfrmMainForm.MainEngine1SystemEvent(Sender: TObject; PropsID: E_PropsID; Value: Integer);
begin
  case PropsID of
    epPCSFreezed :
    begin
      if Value = 1 then
      begin
        frmSignalingLightME1.Enabled := False;
        MainEngine1System.FFormFreezed[0] := TfrmFreeze.Create(frmSignalingLightME1);
        with MainEngine1System.FFormFreezed[0] do
        begin
          Parent   := frmSignalingLightME1;
          Position := poOwnerFormCenter;
          BringToFront;
          Show;
        end;

        frmPMSDieselEngineSafetiesME1.Enabled := False;
        MainEngine1System.FFormFreezed[1] := TfrmFreeze.Create(frmPMSDieselEngineSafetiesME1);
        with MainEngine1System.FFormFreezed[1] do
        begin
          Parent   := frmPMSDieselEngineSafetiesME1;
          Position := poOwnerFormCenter;
          BringToFront;
          Show;
        end;

        frmSetofPressureGaugesME1.Enabled := False;
        MainEngine1System.FFormFreezed[2] := TfrmFreeze.Create(frmSetofPressureGaugesME1);
        with MainEngine1System.FFormFreezed[2] do
        begin
          Parent   := frmSetofPressureGaugesME1;
          Position := poOwnerFormCenter;
          BringToFront;
          Show;
        end;
      end
      else if Value = 0 then
      begin
        frmSignalingLightME1.Enabled := True;
        if Assigned(MainEngine1System.FFormFreezed[0]) then
          FreeAndNil(MainEngine1System.FFormFreezed[0]);

        frmPMSDieselEngineSafetiesME1.Enabled := True;
        if Assigned(MainEngine1System.FFormFreezed[1]) then
          FreeAndNil(MainEngine1System.FFormFreezed[1]);

        frmSetofPressureGaugesME1.Enabled := True;
        if Assigned(MainEngine1System.FFormFreezed[2]) then
          FreeAndNil(MainEngine1System.FFormFreezed[2]);
      end;
    end;
  end;
end;

procedure TfrmMainForm.MainEngine1SystemEvent(Sender: TObject; PropsID: E_PropsID; Value: Boolean);
begin
  case PropsID of
    epPCSMERunning :
    begin
      FIsRunning := Value;
      FIsStartBlink := Value;
      FIsStopBlink  := not Value;
      tmrBlinkTimer.Enabled := FIsStartBlink or FIsStopBlink;
      frmSignalingLightME1.imgStartingAllowedME1.Visible := True;
      frmPMSDieselEngineSafetiesME1.imgLedGreenRunSVAE.Visible := True;
      frmPMSDieselEngineSafetiesME1.imgLedGreenRunSPH.Visible  := True;
      frmPMSDieselEngineSafetiesME1.imgLedGreenRunRGM.Visible  := True;
      frmPMSDieselEngineSafetiesME1.imgLedGreenTH1SE.Visible   := True;
      frmPMSDieselEngineSafetiesME1.imgLedGreenTH2SE.Visible   := True;
      frmPMSDieselEngineSafetiesME1.imgLedGreen1AE24.Visible   := True;
      frmPMSDieselEngineSafetiesME1.imgLedGreen1AE15.Visible   := True;
      frmPMSDieselEngineSafetiesME1.imgLedGreen1AE9.Visible    := True;
      frmPMSDieselEngineSafetiesME1.imgLedGreenRunRSP.Visible  := True;
    end;
    epPCSCtrlLocal :
    begin
      if Value then
      begin
        frmSignalingLightME1.imgLocalPositionME1.Visible  := True;
        frmSignalingLightME1.imgRemotePositionME1.Visible := False;
      end
      else
      begin
        frmSignalingLightME1.imgLocalPositionME1.Visible  := False;
        frmSignalingLightME1.imgRemotePositionME1.Visible := True;
      end;
    end;
    epPCSGBClutchAllowed :
    begin
      if Value then
        frmSignalingLightME1.imgClutchAllowedME1.Visible := True
      else
        frmSignalingLightME1.imgClutchAllowedME1.Visible := False
    end;
    epPCSLeverEmergencyStop :
    begin
      frmSignalingLightME1.imgEmergencyStopME1.Visible := True;
      frmSignalingLightME1.imgSafetiesStopOverbiddenME1.Visible := True;
    end;
    epPCSMEAirValve :
    begin
      if Value then
        frmSignalingLightME1.imgAirValveOpenME1.Visible := True
      else
        frmSignalingLightME1.imgAirValveOpenME1.Visible := False
    end;
    epPCSMEGasValve :
    begin
      if Value then
        frmSignalingLightME1.imgGazValveOpenME1.Visible := True
      else
        frmSignalingLightME1.imgGazValveOpenME1.Visible := False
    end;
    epPCSMESafetyShutdown :
    begin
      if Value then
        frmSignalingLightME1.imgSafetyStopME1.Visible := True
      else
        frmSignalingLightME1.imgSafetyStopME1.Visible := False
    end;
    epPCSMEManHandleAtStop :
    begin
      if Value then
        frmSignalingLightME1.imgManualHandletoStopME1.Visible := True
      else
        frmSignalingLightME1.imgManualHandletoStopME1.Visible := False
    end;
    epPCSMESTCSequenceFail :
    begin
      if Value then
        frmSignalingLightME1.imgStartingSequenceFailureME1.Visible := True
      else
        frmSignalingLightME1.imgStartingSequenceFailureME1.Visible := False
    end;
    epPCSGBClutchEngaged :
    begin
      FIsClutchBlink := Value;
      FIsDeclutchBlink := not Value;
      tmrBlinkTimer.Enabled := FIsClutchBlink or FIsDeclutchBlink;
    end;
  end;
  tmrBlinkTimer.Enabled := FIsStartBlink or FIsStopBlink or FIsClutchBlink or FIsDeclutchBlink;
end;

procedure TfrmMainForm.MainEngine1SystemEvent(Sender: TObject; PropsID: E_PropsID; Value: Double);
begin
  case PropsID of
    epPCSMEStartingAir :
    begin
      if Assigned(frmSetofPressureGaugesME1) then
        frmSetofPressureGaugesME1.StartingAirPressureMeter.Position := Value
    end;
    epPCSMELOPressInlet :
    begin
      if Assigned(frmSetofPressureGaugesME1) then
        frmSetofPressureGaugesME1.EngineInletLubOilPressureMeter.Position := Value
    end;
    epPCSMEPressFOInlet :
    begin
      if Assigned(frmSetofPressureGaugesME1) then
        frmSetofPressureGaugesME1.FuelOilPressureMeter.Position := Value
    end;

    // PMS
    epPCSMEFuelRack :
    begin
      if Assigned(frmPMSDieselEngineSafetiesME1) then
        frmPMSDieselEngineSafetiesME1.FuelRackMeter.Position := Value;
    end;
    epPCSMESpeed :
    begin
      if Assigned(frmPMSDieselEngineSafetiesME1) then
        frmPMSDieselEngineSafetiesME1.EngineSpeedMeter.Position := Value;
    end;
    // PMS ATP
    epPCSMETempBear1 :
    begin
      if Assigned(frmPMSDieselEngineSafetiesME1) then
        frmPMSDieselEngineSafetiesME1.FBearingTemperatures[8] := Value / 10;
    end;
    epPCSMETempBear2 :
    begin
      if Assigned(frmPMSDieselEngineSafetiesME1) then
        frmPMSDieselEngineSafetiesME1.FBearingTemperatures[9] := Value / 10;
    end;
    epPCSMETempBear3 :
    begin
      if Assigned(frmPMSDieselEngineSafetiesME1) then
        frmPMSDieselEngineSafetiesME1.FBearingTemperatures[10] := Value / 10;
    end;
    epPCSMETempBear4 :
    begin
      if Assigned(frmPMSDieselEngineSafetiesME1) then
        frmPMSDieselEngineSafetiesME1.FBearingTemperatures[11] := Value / 10;
    end;
    epPCSMETempBear5 :
    begin
      if Assigned(frmPMSDieselEngineSafetiesME1) then
        frmPMSDieselEngineSafetiesME1.FBearingTemperatures[12] := Value / 10;
    end;
    epPCSMETempBear6 :
    begin
      if Assigned(frmPMSDieselEngineSafetiesME1) then
        frmPMSDieselEngineSafetiesME1.FBearingTemperatures[13] := Value / 10;
    end;
    epPCSMETempBear7 :
    begin
      if Assigned(frmPMSDieselEngineSafetiesME1) then
        frmPMSDieselEngineSafetiesME1.FBearingTemperatures[14] := Value / 10;
    end;
    epPCSMETempBear8 :
    begin
      if Assigned(frmPMSDieselEngineSafetiesME1) then
        frmPMSDieselEngineSafetiesME1.FBearingTemperatures[15] := Value / 10;
    end;
    epPCSMETempBear9 :
    begin
      if Assigned(frmPMSDieselEngineSafetiesME1) then
        frmPMSDieselEngineSafetiesME1.FBearingTemperatures[0] := Value / 10;
    end;
    epPCSMETempBear10 :
    begin
      if Assigned(frmPMSDieselEngineSafetiesME1) then
        frmPMSDieselEngineSafetiesME1.FBearingTemperatures[1] := Value / 10;
    end;
    epPCSMETempBear11 :
    begin
      if Assigned(frmPMSDieselEngineSafetiesME1) then
        frmPMSDieselEngineSafetiesME1.FBearingTemperatures[2] := Value / 10;
    end;
  end;
end;

procedure TfrmMainForm.tmrBlinkMe1Timer(Sender: TObject);
begin
  FBlinkCounter := FBlinkCounter + tmrBlinkTimer.Interval;
  FIsBlinkState := not FIsBlinkState;

  if FIsStartBlink then

    frmSignalingLightME1.imgStartME1.Visible := FIsBlinkState
  else
    frmSignalingLightME1.imgStartME1.Visible := FIsRunning;

  if FIsStopBlink then
    frmSignalingLightME1.imgStopME1.Visible := FIsBlinkState
  else
    frmSignalingLightME1.imgStopME1.Visible := False;

  if FIsClutchBlink then
    frmSignalingLightME1.imgClutchME1.Visible := FIsBlinkState
  else
    frmSignalingLightME1.imgClutchME1.Visible := False;

  if FIsDeclutchBlink then
    frmSignalingLightME1.imgDeclutchME1.Visible := FIsBlinkState
  else
    frmSignalingLightME1.imgDeclutchME1.Visible := False;

  if FBlinkCounter >= 8000 then
  begin
    tmrBlinkTimer.Enabled := False;
    FBlinkCounter := 0;

    if FIsStartBlink then
      frmSignalingLightME1.imgStartME1.Visible := True;
    if FIsStopBlink then
      frmSignalingLightME1.imgStopME1.Visible := True;
    if FIsClutchBlink then
      frmSignalingLightME1.imgClutchME1.Visible := True;
    if FIsDeclutchBlink then
      frmSignalingLightME1.imgDeclutchME1.Visible := True;

    FIsStartBlink    := False;
    FIsStopBlink     := False;
    FIsClutchBlink   := False;
    FIsDeclutchBlink := False;
  end;

 if not FIsStartBlink and not FIsStopBlink and not FIsClutchBlink and not FIsDeclutchBlink then
    tmrBlinkTimer.Enabled := False;
end;

end.
