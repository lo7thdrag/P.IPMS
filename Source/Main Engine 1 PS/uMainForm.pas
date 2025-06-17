unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,

  uSetting, uListener, uFreezeFrom, uDataType, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmMainForm = class(TForm)
    tmrBlinkTimer: TTimer;
    mmoNetLogger: TMemo;
    tmr1: TTimer;
    mmoLogReceive: TMemo;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tmrBlinkMe1Timer(Sender: TObject);
  private
//    FListener : TListeners;
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
    procedure MainEngine1SystemEvent(Sender : TObject;PropsID : E_PropsID;Value : string);overload;
    procedure MainEngine1SystemEvent(Sender : TObject;PropsID : E_PropsID;Value : TObject);overload;
  public
    { Public declarations }
  end;

var
  frmMainForm: TfrmMainForm;

implementation

uses
  ufrmSetofPressureGaugesME1, ufrmSignalingLightME1, ufrmPMSDieselEngineSafetiesME1, uMainEngine1System, uTCPClient;

{$R *.dfm}

procedure TfrmMainForm.FormCreate(Sender: TObject);
begin
  Setting   := TSetting.Create;
  MainEngine1System := TMainEngine1System.Create;

//  FListener := TListeners.Create;
  with MainEngine1System.Listener.Add('MAINENGINE 1') as TPropertyEventListener do
  begin
    OnPropertyIntChange  := MainEngine1SystemEvent;
    OnPropertyBoolChange := MainEngine1SystemEvent;
    OnPropertyDblChange  := MainEngine1SystemEvent;
  end;

  with MainEngine1System.Network.Listeners.Add('MAINENGINE1NETWORK') as TPropertyEventListener do
     OnPropertyStringChange := MainEngine1SystemEvent;
  with MainEngine1System.Network.Listeners.Add('MAINENGINE1NETWORK') as TPropertyEventListener do
     OnPropertyObjectChange := MainEngine1SystemEvent;
end;

procedure TfrmMainForm.FormDestroy(Sender: TObject);
begin
//  FListener.Free;

  MainEngine1System.Free;
  Setting.Free;
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

procedure TfrmMainForm.MainEngine1SystemEvent(Sender: TObject; PropsID: E_PropsID; Value: TObject);
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

procedure TfrmMainForm.MainEngine1SystemEvent(Sender: TObject; PropsID: E_PropsID; Value: string);
begin
	case PropsID of
	  epNetworkLogRcv: begin
	    if mmoLogReceive.Lines.Count>100 then
	      mmoLogReceive.Lines.Delete(0);
	    mmoLogReceive.Lines.Add(Value);
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

      if FIsStartBlink then
      begin
        frmSignalingLightME1.imgStartingAllowedME1.Visible := True;
        frmPMSDieselEngineSafetiesME1.imgLedGreenRunSVAE.Visible := True;
        frmPMSDieselEngineSafetiesME1.imgLedGreenRunSPH.Visible  := True;
        frmPMSDieselEngineSafetiesME1.imgLedGreenRunRGM.Visible  := True;
        frmPMSDieselEngineSafetiesME1.imgLedGreen1AE24.Visible   := True;
        frmPMSDieselEngineSafetiesME1.imgLedGreen1AE15.Visible   := True;
        frmPMSDieselEngineSafetiesME1.imgLedGreen1AE9.Visible    := True;
        frmPMSDieselEngineSafetiesME1.imgLedGreenRunRSP.Visible  := True;

        frmPMSDieselEngineSafetiesME1.imgLedRedStopSPH.Visible   := False;
        frmPMSDieselEngineSafetiesME1.imgLedRedStopRSP.Visible   := False;
        frmPMSDieselEngineSafetiesME1.imgLedRedStopRGM.Visible   := False;
      end
      else if FIsStopBlink then
      begin
        frmSignalingLightME1.imgStartingAllowedME1.Visible := False;
        frmPMSDieselEngineSafetiesME1.imgLedGreenRunSVAE.Visible := False;
        frmPMSDieselEngineSafetiesME1.imgLedGreenRunSPH.Visible  := False;
        frmPMSDieselEngineSafetiesME1.imgLedGreenRunRGM.Visible  := False;
        frmPMSDieselEngineSafetiesME1.imgLedGreenTH1SE.Visible   := False;
        frmPMSDieselEngineSafetiesME1.imgLedGreenTH2SE.Visible   := False;
        frmPMSDieselEngineSafetiesME1.imgLedGreenTH3SE.Visible   := False;
        frmPMSDieselEngineSafetiesME1.imgLedGreenTH4SE.Visible   := False;
        frmPMSDieselEngineSafetiesME1.imgLedGreen1AE24.Visible   := False;
        frmPMSDieselEngineSafetiesME1.imgLedGreen1AE15.Visible   := False;
        frmPMSDieselEngineSafetiesME1.imgLedGreen1AE9.Visible    := False;
        frmPMSDieselEngineSafetiesME1.imgLedGreenRunRSP.Visible  := False;

        frmPMSDieselEngineSafetiesME1.imgLedRedStopSPH.Visible   := True;
        frmPMSDieselEngineSafetiesME1.imgLedRedStopRSP.Visible   := True;
        frmPMSDieselEngineSafetiesME1.imgLedRedStopRGM.Visible   := True;
      end;
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
      begin
        frmSignalingLightME1.imgAirValveOpenME1.Visible   := True;
        frmSignalingLightME1.imgAirValveClosedME1.Visible := False;
      end
      else
      begin
        frmSignalingLightME1.imgAirValveClosedME1.Visible := True;
        frmSignalingLightME1.imgAirValveOpenME1.Visible   := False;
      end;
    end;
    epPCSMEGasValve :
    begin
      if Value then
      begin
        frmSignalingLightME1.imgGazValveOpenME1.Visible   := True;
        frmSignalingLightME1.imgGazValveClosedME1.Visible := False;
      end
      else
      begin
        frmSignalingLightME1.imgGazValveClosedME1.Visible := True;
        frmSignalingLightME1.imgGazValveOpenME1.Visible   := False;
      end;
    end;
    epPCSMEBypassP2P4 :
    begin
      if Value then
      begin
        frmSignalingLightME1.imgByPassOpenME1.Visible    := True;
        frmSignalingLightME1.imgByPassClosedME1.Visible  := False;
      end
      else
      begin
        frmSignalingLightME1.imgByPassClosedME1.Visible  := True;
        frmSignalingLightME1.imgByPassOpenME1.Visible    := False;
      end;
    end;
    epPCSMESafetyShutdown :
    begin
      if Assigned(frmSignalingLightME1) then
      begin
        if Value then
          frmSignalingLightME1.imgSafetyStopME1.Visible := True
        else
          frmSignalingLightME1.imgSafetyStopME1.Visible := False
      end;
    end;
    epPCSMEManHandleAtStop :
    begin
      if Assigned(frmSignalingLightME1) then
      begin
        if Value then
          frmSignalingLightME1.imgManualHandletoStopME1.Visible := True
        else
          frmSignalingLightME1.imgManualHandletoStopME1.Visible := False
      end;
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

      if Value > 80 then
         frmPMSDieselEngineSafetiesME1.imgLedGreenTH1SE.Visible := True;
         frmPMSDieselEngineSafetiesME1.imgLedGreenTH2SE.Visible := True;
      if Value > 405 then
         frmPMSDieselEngineSafetiesME1.imgLedGreenTH3SE.Visible := True;
      if Value < 405 then
         frmPMSDieselEngineSafetiesME1.imgLedGreenTH3SE.Visible := False;
      if Value > 500 then
         frmPMSDieselEngineSafetiesME1.imgLedGreenTH4SE.Visible := True;
      if Value < 500 then
         frmPMSDieselEngineSafetiesME1.imgLedGreenTH4SE.Visible := False;
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
