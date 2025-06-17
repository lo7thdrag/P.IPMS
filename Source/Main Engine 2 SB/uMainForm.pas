unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,

  uListener, uFreezeFrom, uDataType, Vcl.ExtCtrls, Math, Vcl.StdCtrls;

type
  TfrmMainForm = class(TForm)
    tmrRunningMETimer1: TTimer;
    mmoNetLogger: TMemo;
    tmr1: TTimer;
    mmoLogReceive: TMemo;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tmrRunningMETimer1Timer(Sender: TObject);

  private
//    FListener : TListeners;
    CurrentHourCounter: Integer;
    FIsRunningHours : Boolean;

    procedure MainEngine2SystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Integer);overload;
    procedure MainEngine2SystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Boolean);overload;
    procedure MainEngine2SystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Double);overload;
    procedure MainEngine2SystemEvent(Sender : TObject;PropsID : E_PropsID;Value : string);overload;
    procedure MainEngine2SystemEvent(Sender : TObject;PropsID : E_PropsID;Value : TObject);overload;

  public
    { Public declarations }
  end;

var
  frmMainForm: TfrmMainForm;

implementation

uses
  ufrmSetofPressureGaugesME2, ufrmSignalingLightME2, ufrmMenu, uMainEngine2System, ufrmSafetiesStop, ufrmAirGasCircuit, ufrmGeneralScreen,
  ufrmLineAExhaustGasTemperature, ufrmLineBExhaustGasTemperature, ufrmEngineBearingTemperature, ufrmPCOTFilteringDeviations,
  ufrmCrankinOilTemperature, ufrmClutchingAssitance, ufrmCompressedAirCircuit, ufrmFuelOilCircuit, ufrmFWSeaWaterCircuit,
  ufrmLubOilCircuit, ufrmPLCNetwork, uTCPClient;

{$R *.dfm}

procedure TfrmMainForm.FormCreate(Sender: TObject);
begin
//  FListener := TListeners.Create;
  with MainEngine2System.Listener.Add('MAINENGINE 2') as TPropertyEventListener do
  begin
    OnPropertyIntChange  := MainEngine2SystemEvent;
    OnPropertyBoolChange := MainEngine2SystemEvent;
    OnPropertyDblChange  := MainEngine2SystemEvent;
  end;

  with MainEngine2System.Network.Listeners.Add('MAINENGINE2NETWORK') as TPropertyEventListener do
     OnPropertyStringChange := MainEngine2SystemEvent;
  with MainEngine2System.Network.Listeners.Add('MAINENGINE2NETWORK') as TPropertyEventListener do
     OnPropertyObjectChange := MainEngine2SystemEvent;
end;

procedure TfrmMainForm.FormDestroy(Sender: TObject);
begin
//  FListener.Free;
end;

procedure TfrmMainForm.FormShow(Sender: TObject);
begin
  if Screen.MonitorCount > MainEngine2System.IdScreenSignaling then
  begin
    with frmSignalingLightME2 do
    begin
      Left   := Screen.Monitors[MainEngine2System.IdScreenSignaling].Left;
      Top    := Screen.Monitors[MainEngine2System.IdScreenSignaling].Top;
      Width  := Screen.Monitors[MainEngine2System.IdScreenSignaling].Width;
      Height := Screen.Monitors[MainEngine2System.IdScreenSignaling].Height;
      Show;
    end;
  end;

  if Screen.MonitorCount > MainEngine2System.IdScreenGauges then
  begin
    with frmSetofPressureGaugesME2 do
    begin
      Left   := Screen.Monitors[MainEngine2System.IdScreenGauges].Left;
      Top    := Screen.Monitors[MainEngine2System.IdScreenGauges].Top;
      Width  := Screen.Monitors[MainEngine2System.IdScreenGauges].Width;
      Height := Screen.Monitors[MainEngine2System.IdScreenGauges].Height;
      Show;
    end;
  end;

  if Screen.MonitorCount > MainEngine2System.IdScreenPmsHmi then
  begin
    with frmMenu do
    begin
      Left   := Screen.Monitors[MainEngine2System.IdScreenPmsHmi].Left;
      Top    := Screen.Monitors[MainEngine2System.IdScreenPmsHmi].Top;
      Width  := Screen.Monitors[MainEngine2System.IdScreenPmsHmi].Width;
      Height := Screen.Monitors[MainEngine2System.IdScreenPmsHmi].Height;
      Show;
    end;
  end;
end;

procedure TfrmMainForm.MainEngine2SystemEvent(Sender: TObject; PropsID: E_PropsID; Value: TObject);
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

procedure TfrmMainForm.MainEngine2SystemEvent(Sender: TObject; PropsID: E_PropsID; Value: string);
begin
	case PropsID of
	  epNetworkLogRcv: begin
	    if mmoLogReceive.Lines.Count>100 then
	      mmoLogReceive.Lines.Delete(0);
	    mmoLogReceive.Lines.Add(Value);
	  end;
	end;
end;

procedure TfrmMainForm.MainEngine2SystemEvent(Sender: TObject; PropsID: E_PropsID; Value: Integer);
begin
  case PropsID of
    epPCSFreezed:
    begin
      if Value = 1 then
      begin
        frmSignalingLightME2.Enabled := False;
        MainEngine2System.FFormFreezed[0] := TfrmFreeze.Create(frmSignalingLightME2);
        with MainEngine2System.FFormFreezed[0] do
        begin
          Parent := frmSignalingLightME2;
          Position := poOwnerFormCenter;
          BringToFront;
          Show;
        end;

        frmMenu.Enabled := False;

        frmSetofPressureGaugesME2.Enabled := False;
        MainEngine2System.FFormFreezed[2] := TfrmFreeze.Create(frmSetofPressureGaugesME2);
        with MainEngine2System.FFormFreezed[2] do
        begin
          Parent := frmSetofPressureGaugesME2;
          Position := poOwnerFormCenter;
          BringToFront;
          Show;
        end;
      end
      else if Value = 0 then
      begin
        frmSignalingLightME2.Enabled := True;
        if Assigned(MainEngine2System.FFormFreezed[0]) then
          FreeAndNil(MainEngine2System.FFormFreezed[0]);

        frmMenu.Enabled := True;

        frmSetofPressureGaugesME2.Enabled := True;
        if Assigned(MainEngine2System.FFormFreezed[2]) then
          FreeAndNil(MainEngine2System.FFormFreezed[2]);
      end;
    end;
    epPCSMERunningHourState :
    begin
      if Trunc(Value) > Trunc(CurrentHourCounter) then
      begin
        CurrentHourCounter := Value;
        frmSignalingLightME2.lblHoorCounter.Caption := IntToStr(Value);

        if not FIsRunningHours then
        begin
          tmrRunningMETimer1.Enabled := True;
          FIsRunningHours := True;
        end;
      end
      else
      begin
          tmrRunningMETimer1.Enabled := False;
          FIsRunningHours := False;
      end;
    end;
    epPCSSpeedState :
    begin
      if Assigned(frmSignalingLightME2) then
        frmSignalingLightME2.vrtryswtchSpeedSB.SwitchPosition := Value;
    end;
    epPCSMESTCInManual :
    begin
      if Assigned(frmSignalingLightME2) then
        frmSignalingLightME2.vrtryswtchSTC_SB.SwitchPosition := Value;
    end;
  end;
end;

procedure TfrmMainForm.MainEngine2SystemEvent(Sender: TObject; PropsID: E_PropsID; Value: Boolean);
begin
  case PropsID of
    epPCSCtrlMCR :
    begin
      if Value then
        frmSignalingLightME2.vrtryswtchRemoteSB.SwitchPosition := 1
      else
        frmSignalingLightME2.vrtryswtchRemoteSB.SwitchPosition := 0;
    end;
    epPCSCtrlLocal:
    begin
      if Value then
        frmSignalingLightME2.vrtryswtchRemoteSB.SwitchPosition := 0
      else
        frmSignalingLightME2.vrtryswtchRemoteSB.SwitchPosition := 1;
    end;

    epPCSMEPreStart :
    begin
      if Value then
        frmSignalingLightME2.vrtryswtchPreStartSB.SwitchPosition := 0
      else
        frmSignalingLightME2.vrtryswtchPreStartSB.SwitchPosition := 1;
    end;

    // HMI
    epPCSMEEmergencyShutdown :
    begin
      if Value then
        frmSafetiesStop.btnPS_SS_EmergencyShutdown.Color := clRed
      else
        frmSafetiesStop.btnPS_SS_EmergencyShutdown.Color := clAqua;
    end;
    epPCSMEOverspeedAlarm :
    begin
      if Value then
        frmSafetiesStop.btnPS_SS_Overspeed.Color := clRed
      else
        frmSafetiesStop.btnPS_SS_Overspeed.Color := clAqua;
    end;
    epPCSMELOPressVeryLow :
    begin
      if Value then
        frmSafetiesStop.btnPS_SS_EngInletLubOilVeryHigh.Color := clRed
      else
        frmSafetiesStop.btnPS_SS_EngInletLubOilVeryHigh.Color := clAqua;
    end;
    epPCSMERedGearSafetyStop :
    begin
      if Value then
        frmSafetiesStop.btnPS_SS_RedGearSafetyStop.Color := clRed
      else
        frmSafetiesStop.btnPS_SS_RedGearSafetyStop.Color := clAqua;
    end;
    epPCSMEFwHtExpTkLevelVeryLow :
    begin
      if Value then
        frmSafetiesStop.btnPS_SS_FwHtExpTkLevelVeryLow.Color := clRed
      else
        frmSafetiesStop.btnPS_SS_FwHtExpTkLevelVeryLow.Color := clAqua;
    end;
    epPCSMEFwTempVeryHigh :
    begin
      if Value then
        frmSafetiesStop.btnPS_SS_FwTempVeryHigh.Color := clRed
      else
        frmSafetiesStop.btnPS_SS_FwTempVeryHigh.Color := clAqua;
    end;
    epPCSMEConRodBearingTempVeryHigh :
    begin
      if Value then
        frmSafetiesStop.btnPS_SS_ConRodBearTempVeryHigh.Color := clRed
      else
        frmSafetiesStop.btnPS_SS_ConRodBearTempVeryHigh.Color := clAqua;
    end;
    epPCSMEEngInletLubOilVeryHigh :
    begin
      if Value then
        frmSafetiesStop.btnPS_SS_EngInletLubOilVeryHighTemperature.Color := clRed
      else
        frmSafetiesStop.btnPS_SS_EngInletLubOilVeryHighTemperature.Color := clAqua;
    end;
    epPCSMEOilMistDetSafety :
    begin
      if Value then
        frmSafetiesStop.btnPS_SS_OilMistDetHigh.Color := clRed
      else
        frmSafetiesStop.btnPS_SS_OilMistDetHigh.Color := clAqua;
    end;
    epPCSMETurningGearEngaged :
    begin
      if Value then
        frmSafetiesStop.btnPS_SI_TurningGearDisengaged.Color := clRed
      else
        frmSafetiesStop.btnPS_SI_TurningGearDisengaged.Color := clAqua;
    end;
    epPCSMEManHandleAtStop :
    begin
      if Value then
        frmSafetiesStop.btnPS_SI_ManHandleAtStop.Color := clRed
      else
        frmSafetiesStop.btnPS_SI_ManHandleAtStop.Color := clAqua;
    end;
    epPCSMEFuelRackAtStop :
    begin
      if Value then
        frmSafetiesStop.btnPS_SI_FuelRackAtStop.Color := clRed
      else
        frmSafetiesStop.btnPS_SI_FuelRackAtStop.Color := clAqua;
    end;
    epPCSMEPrelubInProgress :
    begin
      if Value then
        frmSafetiesStop.btnPS_SI_PrelubeInProgress.Color := clRed
      else
        frmSafetiesStop.btnPS_SI_PrelubeInProgress.Color := clAqua;
    end;
    epPCSMEPrelubricationFailure :
    begin
      if Value then
        frmSafetiesStop.btnPS_SI_PrelubeFailure.Color := clRed
      else
        frmSafetiesStop.btnPS_SI_PrelubeFailure.Color := clAqua;
    end;
    epPCSMEStartingFault :
    begin
      if Value then
      begin
        frmSafetiesStop.btnPS_SI_StartingFailure.Color  := clRed;
        frmGeneralScreen.btnPS_SI_StartingFailure.Color := clRed;
      end
      else
      begin
        frmSafetiesStop.btnPS_SI_StartingFailure.Color  := clAqua;
        frmGeneralScreen.btnPS_SI_StartingFailure.Color := clAqua;
      end;
    end;
    epPCSMESTCSequenceFail :
    begin
      if Value then
        frmSafetiesStop.btnPS_SI_STCSequenceFail.Color := clRed
      else
        frmSafetiesStop.btnPS_SI_STCSequenceFail.Color := clAqua;
    end;
    epPCSMESlowTurningFault :
    begin
      if Value then
      begin
        frmSafetiesStop.btnPS_SI_SlowTurningFailure.Color := clRed;
        frmGeneralScreen.btnPS_SI_SlowTurningFailure.Color := clRed
      end
      else
      begin
        frmSafetiesStop.btnPS_SI_SlowTurningFailure.Color  := clAqua;
        frmGeneralScreen.btnPS_SI_SlowTurningFailure.Color := clAqua
      end;
    end;
    epPCSMESafetyShutdown :
    begin
      if Value then
        frmSafetiesStop.btnPS_SI_SafetyStop.Color := clRed
      else
        frmSafetiesStop.btnPS_SI_SafetyStop.Color := clAqua;
    end;
    epPCSGBPCSClutchInterlock :
    begin
      if Value then
        frmGeneralScreen.btnPS_SS_ClutcInterlocks.Color := clRed
      else
        frmGeneralScreen.btnPS_SS_ClutcInterlocks.Color := clAqua;
    end;
  end;
end;

procedure TfrmMainForm.MainEngine2SystemEvent(Sender: TObject; PropsID: E_PropsID; Value: Double);
const
  TopZero    = 594;
  TopMin     = 848;
  TopMax     = 346;
  MaxDeviasi = 80;
  MaxHeight  = 100;

  // Engine Bearing
  TopMinTemp = 332;
  TopMaxTemp = 872;
  MaxTemp    = 150;
var
  deviasi: Integer;
  offset: Integer;
  suhu : Double;
  grafikHeight, grafikTop: Integer;
begin
  case PropsID of
    epPCSMEPressFWHTInlet :
    begin
      if Assigned(frmSetofPressureGaugesME2) then
        frmSetofPressureGaugesME2.EngineInletFWPressureMeter.Position := Value;

      if Assigned(frmFWSeaWaterCircuit) then
      begin
        frmFWSeaWaterCircuit.VrEngineInletFWPressSeaWater.Position := Value;
        frmFWSeaWaterCircuit.lblEngineInletFWPressSeaWater.Caption := FloatToStr(Value);
      end;
    end;
    epPCSMEPressAirInlet :
    begin
      if Assigned(frmSetofPressureGaugesME2) then
        frmSetofPressureGaugesME2.EngineInletAirPressureMeter.Position := Value;

      if Assigned(frmAirGasCircuit) then
      begin
        frmAirGasCircuit.lblEngineAirInletPressure.Caption := FloatToStr(Value);
        frmAirGasCircuit.VrEngineAirInletPressure.Position := Value;
      end;

      if Assigned(frmGeneralScreen) then
      begin
        frmGeneralScreen.VrEngineAirInletPressure.Position := Value;
        frmGeneralScreen.lblEngineAirInletPressure.Caption := FloatToStr(Value);
      end;
    end;

    // HMI
    epPCSMETurboChargerSpeedA :
    begin
      if Assigned(frmAirGasCircuit) then
      begin
        frmAirGasCircuit.VrTurboChargerA.Position := Value;
        frmAirGasCircuit.lblTurboCharge1.Caption  := FloatToStr(Value);
      end;

      if Assigned(frmGeneralScreen) then
      begin
        frmGeneralScreen.VrTCSpeedA.Position := Value;
        frmGeneralScreen.lblTCSpeedA.Caption := FloatToStr(Value);
      end;
    end;
    epPCSMETurboChargerSpeedB :
    begin
      if Assigned(frmAirGasCircuit) then
      begin
        frmAirGasCircuit.VrTurboChargerB.Position := Value;
        frmAirGasCircuit.lblTurboCharge2.Caption  := FloatToStr(Value);
      end;

      if Assigned(frmGeneralScreen) then
      begin
        frmGeneralScreen.VrTCSpeedB.Position := Value;
        frmGeneralScreen.lblTCSpeedB.Caption := FloatToStr(Value);
      end;
    end;
    epPCSMESpeed :
    begin
      if Assigned(frmClutchingAssistance) then
      begin
        frmClutchingAssistance.VrEngineSpeedClutching.Position := Value;
        frmClutchingAssistance.lblEngineSpeedClutching.Caption := FloatToStr(Value);
      end;

      if Assigned(frmGeneralScreen) then
      begin
        frmGeneralScreen.VrEngineSpeed.Position := Value;
        frmGeneralScreen.lblEngineSpeed.Caption := FloatToStr(Value);
      end;

      if Assigned(frmSafetiesStop) then
        frmSafetiesStop.lblSpeedSVAE.Caption := FloatToStr(Value);
    end;
    epPCSMEFuelRack :
    begin
      if Assigned(frmGeneralScreen) then
      begin
        frmGeneralScreen.VrFuelRack.Position := Value;
        frmGeneralScreen.lblFuelRack.Caption := FloatToStr(Value);
      end;
    end;
    epPCSMESetPointSpeed :
    begin
      if Assigned(frmGeneralScreen) then
      begin
        frmGeneralScreen.VrDigitalSpeedSetPoint.Position := Value;
        frmGeneralScreen.lblDigitalSpeedSetPoint.Caption := FloatToStr(Value);
      end;
    end;
    epPCSMELOTempInlet :
    begin
      if Assigned(frmClutchingAssistance) then
      begin
        frmClutchingAssistance.VrEngineInletLOClutching.Position := Value /10;
        frmClutchingAssistance.lblEngineInletLOClutching.Caption := FloatToStr(Value /10);
      end;

      if Assigned(frmLubOilCircuit) then
      begin
        frmLubOilCircuit.VrEngineInletLOTemp.Position := Value /10;
        frmLubOilCircuit.lblEngineInletLOTemp.Caption := FloatToStr(Value /10);

        frmLubOilCircuit.VrEngineInletLubOilTemp.Position := Value /10;
        frmLubOilCircuit.lblEngineInletLubOilTemp.Caption := FloatToStr(Value /10);
      end;
    end;
    epPCSMETempFWHTOutlet :
    begin
      if Assigned(frmClutchingAssistance) then
      begin
        frmClutchingAssistance.VrEngineOutletFWClutching.Position := Value /10;
        frmClutchingAssistance.lblEngineOutletFWClutching.Caption := FloatToStr(Value /10);
      end;
    end;
    epPCSMEControlAir :
    begin
      if Assigned(frmCompressedAirCircuit) then
      begin
        frmCompressedAirCircuit.VrControlAirCompress.Position := Value;
        frmCompressedAirCircuit.lblControlAirCompress.Caption := FloatToStr(Value);
      end;
    end;
    epPCSMEStartingAir :
    begin
      if Assigned(frmCompressedAirCircuit) then
      begin
        frmCompressedAirCircuit.VrStartingAirPressureCompress.Position := Value;
        frmCompressedAirCircuit.lblStartingAirPressureCompress.Caption := FloatToStr(Value);
      end;
    end;
    epPCSMETCAirSeal :
    begin
      if Assigned(frmCompressedAirCircuit) then
      begin
        frmCompressedAirCircuit.VrTCAirSealCompress.Position := Value;
        frmCompressedAirCircuit.lblTCAirSealCompress.Caption := FloatToStr(Value);
      end;
    end;
    epPCSMEPressFOInlet :
    begin
      if Assigned(frmFuelOilCircuit) then
      begin
        frmFuelOilCircuit.VrEngineInletFuelOilCircuit.Position := Value;
        frmFuelOilCircuit.lblEngineInletFuelOilCircuit.Caption := FloatToStr(Value);
      end;
    end;
    epPCSMETempFWHTInlet :
    begin
      if Assigned(frmFWSeaWaterCircuit) then
      begin
        frmFWSeaWaterCircuit.VrEngineInletFWTemp.Position := Value /10;
        frmFWSeaWaterCircuit.lblEngineInletFWTemp.Caption := FloatToStr(Value /10);
      end;
    end;
    epPCSMEPressSeaWaterOutlet :
    begin
      if Assigned(frmFWSeaWaterCircuit) then
      begin
        frmFWSeaWaterCircuit.VrEngineOutletSeaWaterPress.Position := Value;
        frmFWSeaWaterCircuit.lblEngineOutletSeaWaterPress.Caption := FloatToStr(Value);
      end;
    end;
    epPCSMELOPressInlet :
    begin
      if Assigned(frmLubOilCircuit) then
      begin
        frmLubOilCircuit.VrEngineAirInletPressure.Position := Value;
        frmLubOilCircuit.lblEngineAirInletPressureLO.Caption := FloatToStr(Value);
      end;
    end;
    epPCSMETCOutlLOTempA :
    begin
      if Assigned(frmLubOilCircuit) then
      begin
        frmLubOilCircuit.VrLATCOutletLOTemp.Position := Value /10;
        frmLubOilCircuit.lblLATCOutletLOTemp.Caption := FloatToStr(Value /10);
      end;
    end;
    epPCSMETCOutlLOTempB :
    begin
      if Assigned(frmLubOilCircuit) then
      begin
        frmLubOilCircuit.VrLBTCOutletLOTemp.Position := Value /10;
        frmLubOilCircuit.lblLBTCOutletLOTemp.Caption := FloatToStr(Value /10);
      end;
    end;
    epPCSMETCLOPressInlet :
    begin
      if Assigned(frmLubOilCircuit) then
      begin
        frmLubOilCircuit.VrTCInletLubOilPress.Position := Value;
        frmLubOilCircuit.lblTCInletLubOilPress.Caption := FloatToStr(Value);
      end;
    end;

    //Line Exhaust A
    epPCSMETempExhCylA1 :
    begin
      if Assigned(frmLineAExhaustGasTemperature) then
        frmLineAExhaustGasTemperature.lblB1LineA.Caption := FloatToStr(Value);
    end;
    epPCSMEDevTempExhCylA1 :
    begin
      if Assigned(frmLineAExhaustGasTemperature) then
        frmLineAExhaustGasTemperature.lblA1LineA.Caption := FloatToStr(Value / 10);

      deviasi := StrToIntDef(frmLineAExhaustGasTemperature.lblA1LineA.Caption, 0);

      if deviasi < 0 then
      begin
        offset := Round((Abs(deviasi) / MaxDeviasi) * (TopMin - TopZero));
        frmLineAExhaustGasTemperature.pnlGrafik1.Top := TopZero + offset;
        grafikHeight := Round((Abs(deviasi) / MaxDeviasi) * MaxHeight);
      end
      else if deviasi > 0 then
      begin
        offset := Round((deviasi / MaxDeviasi) * (TopZero - TopMax));
        frmLineAExhaustGasTemperature.pnlGrafik1.Top := TopZero - offset;
        grafikHeight := Round((deviasi / MaxDeviasi) * MaxHeight);
      end
      else
      begin
        frmLineAExhaustGasTemperature.pnlGrafik1.Top := TopZero;
        grafikHeight := 1;
      end;
        frmLineAExhaustGasTemperature.pnlGrafik1.Height := Max(grafikHeight, 1);
    end;
    epPCSMETempExhCylA2 :
    begin
      if Assigned(frmLineAExhaustGasTemperature) then
        frmLineAExhaustGasTemperature.lblB2LineA.Caption := FloatToStr(Value);
    end;
    epPCSMEDevTempExhCylA2 :
    begin
      if Assigned(frmLineAExhaustGasTemperature) then
        frmLineAExhaustGasTemperature.lblA2LineA.Caption := FloatToStr(Value / 10);

      deviasi := StrToIntDef(frmLineAExhaustGasTemperature.lblA2LineA.Caption, 0);

      if deviasi < 0 then
      begin
        offset := Round((Abs(deviasi) / MaxDeviasi) * (TopMin - TopZero));
        frmLineAExhaustGasTemperature.pnlGrafik2.Top := TopZero + offset;
        grafikHeight := Round((Abs(deviasi) / MaxDeviasi) * MaxHeight);
      end
      else if deviasi > 0 then
      begin
        offset := Round((deviasi / MaxDeviasi) * (TopZero - TopMax));
        frmLineAExhaustGasTemperature.pnlGrafik2.Top := TopZero - offset;
        grafikHeight := Round((deviasi / MaxDeviasi) * MaxHeight);
      end
      else
      begin
        frmLineAExhaustGasTemperature.pnlGrafik2.Top := TopZero;
        grafikHeight := 1;
      end;
        frmLineAExhaustGasTemperature.pnlGrafik2.Height := Max(grafikHeight, 1);
    end;
    epPCSMETempExhCylA3 :
    begin
      if Assigned(frmLineAExhaustGasTemperature) then
        frmLineAExhaustGasTemperature.lblB3LineA.Caption := FloatToStr(Value);
    end;
    epPCSMEDevTempExhCylA3 :
    begin
      if Assigned(frmLineAExhaustGasTemperature) then
        frmLineAExhaustGasTemperature.lblA3LineA.Caption := FloatToStr(Value / 10);

      deviasi := StrToIntDef(frmLineAExhaustGasTemperature.lblA3LineA.Caption, 0);

      if deviasi < 0 then
      begin
        offset := Round((Abs(deviasi) / MaxDeviasi) * (TopMin - TopZero));
        frmLineAExhaustGasTemperature.pnlGrafik3.Top := TopZero + offset;
        grafikHeight := Round((Abs(deviasi) / MaxDeviasi) * MaxHeight);
      end
      else if deviasi > 0 then
      begin
        offset := Round((deviasi / MaxDeviasi) * (TopZero - TopMax));
        frmLineAExhaustGasTemperature.pnlGrafik3.Top := TopZero - offset;
        grafikHeight := Round((deviasi / MaxDeviasi) * MaxHeight);
      end
      else
      begin
        frmLineAExhaustGasTemperature.pnlGrafik3.Top := TopZero;
        grafikHeight := 1;
      end;
        frmLineAExhaustGasTemperature.pnlGrafik3.Height := Max(grafikHeight, 1);
    end;
    epPCSMETempExhCylA4 :
    begin
      if Assigned(frmLineAExhaustGasTemperature) then
        frmLineAExhaustGasTemperature.lblB4LineA.Caption := FloatToStr(Value);
    end;
    epPCSMEDevTempExhCylA4 :
    begin
      if Assigned(frmLineAExhaustGasTemperature) then
        frmLineAExhaustGasTemperature.lblA4LineA.Caption := FloatToStr(Value / 10);

      deviasi := StrToIntDef(frmLineAExhaustGasTemperature.lblA4LineA.Caption, 0);

      if deviasi < 0 then
      begin
        offset := Round((Abs(deviasi) / MaxDeviasi) * (TopMin - TopZero));
        frmLineAExhaustGasTemperature.pnlGrafik4.Top := TopZero + offset;
        grafikHeight := Round((Abs(deviasi) / MaxDeviasi) * MaxHeight);
      end
      else if deviasi > 0 then
      begin
        offset := Round((deviasi / MaxDeviasi) * (TopZero - TopMax));
        frmLineAExhaustGasTemperature.pnlGrafik4.Top := TopZero - offset;
        grafikHeight := Round((deviasi / MaxDeviasi) * MaxHeight);
      end
      else
      begin
        frmLineAExhaustGasTemperature.pnlGrafik4.Top := TopZero;
        grafikHeight := 1;
      end;
        frmLineAExhaustGasTemperature.pnlGrafik4.Height := Max(grafikHeight, 1);
    end;
    epPCSMETempExhCylA5 :
    begin
      if Assigned(frmLineAExhaustGasTemperature) then
        frmLineAExhaustGasTemperature.lblB5LineA.Caption := FloatToStr(Value);
    end;
    epPCSMEDevTempExhCylA5 :
    begin
      if Assigned(frmLineAExhaustGasTemperature) then
        frmLineAExhaustGasTemperature.lblA5LineA.Caption := FloatToStr(Value / 10);

      deviasi := StrToIntDef(frmLineAExhaustGasTemperature.lblA5LineA.Caption, 0);

      if deviasi < 0 then
      begin
        offset := Round((Abs(deviasi) / MaxDeviasi) * (TopMin - TopZero));
        frmLineAExhaustGasTemperature.pnlGrafik5.Top := TopZero + offset;
        grafikHeight := Round((Abs(deviasi) / MaxDeviasi) * MaxHeight);
      end
      else if deviasi > 0 then
      begin
        offset := Round((deviasi / MaxDeviasi) * (TopZero - TopMax));
        frmLineAExhaustGasTemperature.pnlGrafik5.Top := TopZero - offset;
        grafikHeight := Round((deviasi / MaxDeviasi) * MaxHeight);
      end
      else
      begin
        frmLineAExhaustGasTemperature.pnlGrafik5.Top := TopZero;
        grafikHeight := 1;
      end;
        frmLineAExhaustGasTemperature.pnlGrafik5.Height := Max(grafikHeight, 1);
    end;
    epPCSMETempExhCylA6 :
    begin
      if Assigned(frmLineAExhaustGasTemperature) then
        frmLineAExhaustGasTemperature.lblB6LineA.Caption := FloatToStr(Value);
    end;
    epPCSMEDevTempExhCylA6 :
    begin
      if Assigned(frmLineAExhaustGasTemperature) then
        frmLineAExhaustGasTemperature.lblA6LineA.Caption := FloatToStr(Value / 10);

      deviasi := StrToIntDef(frmLineAExhaustGasTemperature.lblA6LineA.Caption, 0);

      if deviasi < 0 then
      begin
        offset := Round((Abs(deviasi) / MaxDeviasi) * (TopMin - TopZero));
        frmLineAExhaustGasTemperature.pnlGrafik6.Top := TopZero + offset;
        grafikHeight := Round((Abs(deviasi) / MaxDeviasi) * MaxHeight);
      end
      else if deviasi > 0 then
      begin
        offset := Round((deviasi / MaxDeviasi) * (TopZero - TopMax));
        frmLineAExhaustGasTemperature.pnlGrafik6.Top := TopZero - offset;
        grafikHeight := Round((deviasi / MaxDeviasi) * MaxHeight);
      end
      else
      begin
        frmLineAExhaustGasTemperature.pnlGrafik6.Top := TopZero;
        grafikHeight := 1;
      end;
        frmLineAExhaustGasTemperature.pnlGrafik6.Height := Max(grafikHeight, 1);
    end;
    epPCSMETempExhCylA7 :
    begin
      if Assigned(frmLineAExhaustGasTemperature) then
        frmLineAExhaustGasTemperature.lblB7LineA.Caption := FloatToStr(Value);
    end;
    epPCSMEDevTempExhCylA7 :
    begin
      if Assigned(frmLineAExhaustGasTemperature) then
        frmLineAExhaustGasTemperature.lblA7LineA.Caption := FloatToStr(Value / 10);

      deviasi := StrToIntDef(frmLineAExhaustGasTemperature.lblA7LineA.Caption, 0);

      if deviasi < 0 then
      begin
        offset := Round((Abs(deviasi) / MaxDeviasi) * (TopMin - TopZero));
        frmLineAExhaustGasTemperature.pnlGrafik7.Top := TopZero + offset;
        grafikHeight := Round((Abs(deviasi) / MaxDeviasi) * MaxHeight);
      end
      else if deviasi > 0 then
      begin
        offset := Round((deviasi / MaxDeviasi) * (TopZero - TopMax));
        frmLineAExhaustGasTemperature.pnlGrafik7.Top := TopZero - offset;
        grafikHeight := Round((deviasi / MaxDeviasi) * MaxHeight);
      end
      else
      begin
        frmLineAExhaustGasTemperature.pnlGrafik7.Top := TopZero;
        grafikHeight := 1;
      end;
        frmLineAExhaustGasTemperature.pnlGrafik7.Height := Max(grafikHeight, 1);
    end;
    epPCSMETempExhCylA8 :
    begin
      if Assigned(frmLineAExhaustGasTemperature) then
        frmLineAExhaustGasTemperature.lblB8LineA.Caption := FloatToStr(Value);
    end;
    epPCSMEDevTempExhCylA8 :
    begin
      if Assigned(frmLineAExhaustGasTemperature) then
        frmLineAExhaustGasTemperature.lblA8LineA.Caption := FloatToStr(Value / 10);

      deviasi := StrToIntDef(frmLineAExhaustGasTemperature.lblA8LineA.Caption, 0);

      if deviasi < 0 then
      begin
        offset := Round((Abs(deviasi) / MaxDeviasi) * (TopMin - TopZero));
        frmLineAExhaustGasTemperature.pnlGrafik8.Top := TopZero + offset;
        grafikHeight := Round((Abs(deviasi) / MaxDeviasi) * MaxHeight);
      end
      else if deviasi > 0 then
      begin
        offset := Round((deviasi / MaxDeviasi) * (TopZero - TopMax));
        frmLineAExhaustGasTemperature.pnlGrafik8.Top := TopZero - offset;
        grafikHeight := Round((deviasi / MaxDeviasi) * MaxHeight);
      end
      else
      begin
        frmLineAExhaustGasTemperature.pnlGrafik8.Top := TopZero;
        grafikHeight := 1;
      end;
        frmLineAExhaustGasTemperature.pnlGrafik8.Height := Max(grafikHeight, 1);
    end;
    epPCSMETempExhCylA9 :
    begin
      if Assigned(frmLineAExhaustGasTemperature) then
        frmLineAExhaustGasTemperature.lblB9LineA.Caption := FloatToStr(Value);
    end;
    epPCSMEDevTempExhCylA9 :
    begin
      if Assigned(frmLineAExhaustGasTemperature) then
        frmLineAExhaustGasTemperature.lblA9LineA.Caption := FloatToStr(Value / 10);

      deviasi := StrToIntDef(frmLineAExhaustGasTemperature.lblA9LineA.Caption, 0);

      if deviasi < 0 then
      begin
        offset := Round((Abs(deviasi) / MaxDeviasi) * (TopMin - TopZero));
        frmLineAExhaustGasTemperature.pnlGrafik9.Top := TopZero + offset;
        grafikHeight := Round((Abs(deviasi) / MaxDeviasi) * MaxHeight);
      end
      else if deviasi > 0 then
      begin
        offset := Round((deviasi / MaxDeviasi) * (TopZero - TopMax));
        frmLineAExhaustGasTemperature.pnlGrafik9.Top := TopZero - offset;
        grafikHeight := Round((deviasi / MaxDeviasi) * MaxHeight);
      end
      else
      begin
        frmLineAExhaustGasTemperature.pnlGrafik9.Top := TopZero;
        grafikHeight := 1;
      end;
        frmLineAExhaustGasTemperature.pnlGrafik9.Height := Max(grafikHeight, 1);
    end;
    epPCSMETempExhCylA10 :
    begin
      if Assigned(frmLineAExhaustGasTemperature) then
        frmLineAExhaustGasTemperature.lblB10LineA.Caption := FloatToStr(Value);
    end;
    epPCSMEDevTempExhCylA10 :
    begin
      if Assigned(frmLineAExhaustGasTemperature) then
        frmLineAExhaustGasTemperature.lblA10LineA.Caption := FloatToStr(Value / 10);

      deviasi := StrToIntDef(frmLineAExhaustGasTemperature.lblA10LineA.Caption, 0);

      if deviasi < 0 then
      begin
        offset := Round((Abs(deviasi) / MaxDeviasi) * (TopMin - TopZero));
        frmLineAExhaustGasTemperature.pnlGrafik10.Top := TopZero + offset;
        grafikHeight := Round((Abs(deviasi) / MaxDeviasi) * MaxHeight);
      end
      else if deviasi > 0 then
      begin
        offset := Round((deviasi / MaxDeviasi) * (TopZero - TopMax));
        frmLineAExhaustGasTemperature.pnlGrafik10.Top := TopZero - offset;
        grafikHeight := Round((deviasi / MaxDeviasi) * MaxHeight);
      end
      else
      begin
        frmLineAExhaustGasTemperature.pnlGrafik10.Top := TopZero;
        grafikHeight := 1;
      end;
        frmLineAExhaustGasTemperature.pnlGrafik10.Height := Max(grafikHeight, 1);
    end;
    epPCSMETempTCInletA :
    begin
      if Assigned(frmLineAExhaustGasTemperature) then
        frmLineAExhaustGasTemperature.lblTCInputLineA.Caption := FloatToStr(Value /10);
    end;
    epPCSMETempTCOutletA :
    begin
      if Assigned(frmLineAExhaustGasTemperature) then
        frmLineAExhaustGasTemperature.lblTCOutputLineA.Caption := FloatToStr(Value /10);
    end;
    epPCSMEAvgTempA :
    begin
      if Assigned(frmLineAExhaustGasTemperature) then
        frmLineAExhaustGasTemperature.lblCylinderAverageLineA.Caption := FloatToStr(Value /10);
    end;
    epPCSMECompProbA :
    begin
      if Assigned(frmLineAExhaustGasTemperature) then
        frmLineAExhaustGasTemperature.lblCompensationLineA.Caption := FloatToStr(Value /10);
    end;
    // Line Exhaust B
    epPCSMETempExhCylB1 :
    begin
      if Assigned(frmLineBExhaustGasTemperature) then
        frmLineBExhaustGasTemperature.lblA1LineB.Caption := FloatToStr(Value);
    end;
    epPCSMEDevTempExhCylB1 :
    begin
      if Assigned(frmLineBExhaustGasTemperature) then
        frmLineBExhaustGasTemperature.lblB1LineB.Caption := FloatToStr(Value / 10);

      deviasi := StrToIntDef(frmLineBExhaustGasTemperature.lblB1LineB.Caption, 0);

      if deviasi < 0 then
      begin
        offset := Round((Abs(deviasi) / MaxDeviasi) * (TopMin - TopZero));
        frmLineBExhaustGasTemperature.pnlGrafik1.Top := TopZero + offset;
        grafikHeight := Round((Abs(deviasi) / MaxDeviasi) * MaxHeight);
      end
      else if deviasi > 0 then
      begin
        offset := Round((deviasi / MaxDeviasi) * (TopZero - TopMax));
        frmLineBExhaustGasTemperature.pnlGrafik1.Top := TopZero - offset;
        grafikHeight := Round((deviasi / MaxDeviasi) * MaxHeight);
      end
      else
      begin
        frmLineBExhaustGasTemperature.pnlGrafik1.Top := TopZero;
        grafikHeight := 1;
      end;
        frmLineBExhaustGasTemperature.pnlGrafik1.Height := Max(grafikHeight, 1);
    end;
    epPCSMETempExhCylB2 :
    begin
      if Assigned(frmLineBExhaustGasTemperature) then
        frmLineBExhaustGasTemperature.lblA2LineB.Caption := FloatToStr(Value);
    end;
    epPCSMEDevTempExhCylB2 :
    begin
      if Assigned(frmLineBExhaustGasTemperature) then
        frmLineBExhaustGasTemperature.lblB2LineB.Caption := FloatToStr(Value / 10);

      deviasi := StrToIntDef(frmLineBExhaustGasTemperature.lblB2LineB.Caption, 0);

      if deviasi < 0 then
      begin
        offset := Round((Abs(deviasi) / MaxDeviasi) * (TopMin - TopZero));
        frmLineBExhaustGasTemperature.pnlGrafik2.Top := TopZero + offset;
        grafikHeight := Round((Abs(deviasi) / MaxDeviasi) * MaxHeight);
      end
      else if deviasi > 0 then
      begin
        offset := Round((deviasi / MaxDeviasi) * (TopZero - TopMax));
        frmLineBExhaustGasTemperature.pnlGrafik2.Top := TopZero - offset;
        grafikHeight := Round((deviasi / MaxDeviasi) * MaxHeight);
      end
      else
      begin
        frmLineBExhaustGasTemperature.pnlGrafik2.Top := TopZero;
        grafikHeight := 1;
      end;
        frmLineBExhaustGasTemperature.pnlGrafik2.Height := Max(grafikHeight, 1);
    end;
    epPCSMETempExhCylB3 :
    begin
      if Assigned(frmLineBExhaustGasTemperature) then
        frmLineBExhaustGasTemperature.lblA3LineB.Caption := FloatToStr(Value);
    end;
    epPCSMEDevTempExhCylB3 :
    begin
      if Assigned(frmLineBExhaustGasTemperature) then
        frmLineBExhaustGasTemperature.lblB3LineB.Caption := FloatToStr(Value / 10);

      deviasi := StrToIntDef(frmLineBExhaustGasTemperature.lblB3LineB.Caption, 0);

      if deviasi < 0 then
      begin
        offset := Round((Abs(deviasi) / MaxDeviasi) * (TopMin - TopZero));
        frmLineBExhaustGasTemperature.pnlGrafik3.Top := TopZero + offset;
        grafikHeight := Round((Abs(deviasi) / MaxDeviasi) * MaxHeight);
      end
      else if deviasi > 0 then
      begin
        offset := Round((deviasi / MaxDeviasi) * (TopZero - TopMax));
        frmLineBExhaustGasTemperature.pnlGrafik3.Top := TopZero - offset;
        grafikHeight := Round((deviasi / MaxDeviasi) * MaxHeight);
      end
      else
      begin
        frmLineBExhaustGasTemperature.pnlGrafik3.Top := TopZero;
        grafikHeight := 1;
      end;
        frmLineBExhaustGasTemperature.pnlGrafik3.Height := Max(grafikHeight, 1);
    end;
    epPCSMETempExhCylB4 :
    begin
      if Assigned(frmLineBExhaustGasTemperature) then
        frmLineBExhaustGasTemperature.lblA4LineB.Caption := FloatToStr(Value);
    end;
    epPCSMEDevTempExhCylB4 :
    begin
      if Assigned(frmLineBExhaustGasTemperature) then
        frmLineBExhaustGasTemperature.lblB4LineB.Caption := FloatToStr(Value / 10);

      deviasi := StrToIntDef(frmLineBExhaustGasTemperature.lblB4LineB.Caption, 0);

      if deviasi < 0 then
      begin
        offset := Round((Abs(deviasi) / MaxDeviasi) * (TopMin - TopZero));
        frmLineBExhaustGasTemperature.pnlGrafik4.Top := TopZero + offset;
        grafikHeight := Round((Abs(deviasi) / MaxDeviasi) * MaxHeight);
      end
      else if deviasi > 0 then
      begin
        offset := Round((deviasi / MaxDeviasi) * (TopZero - TopMax));
        frmLineBExhaustGasTemperature.pnlGrafik4.Top := TopZero - offset;
        grafikHeight := Round((deviasi / MaxDeviasi) * MaxHeight);
      end
      else
      begin
        frmLineBExhaustGasTemperature.pnlGrafik4.Top := TopZero;
        grafikHeight := 1;
      end;
        frmLineBExhaustGasTemperature.pnlGrafik4.Height := Max(grafikHeight, 1);
    end;
    epPCSMETempExhCylB5 :
    begin
      if Assigned(frmLineBExhaustGasTemperature) then
        frmLineBExhaustGasTemperature.lblA5LineB.Caption := FloatToStr(Value);
    end;
    epPCSMEDevTempExhCylB5 :
    begin
      if Assigned(frmLineBExhaustGasTemperature) then
        frmLineBExhaustGasTemperature.lblB5LineB.Caption := FloatToStr(Value / 10);

      deviasi := StrToIntDef(frmLineBExhaustGasTemperature.lblB5LineB.Caption, 0);

      if deviasi < 0 then
      begin
        offset := Round((Abs(deviasi) / MaxDeviasi) * (TopMin - TopZero));
        frmLineBExhaustGasTemperature.pnlGrafik5.Top := TopZero + offset;
        grafikHeight := Round((Abs(deviasi) / MaxDeviasi) * MaxHeight);
      end
      else if deviasi > 0 then
      begin
        offset := Round((deviasi / MaxDeviasi) * (TopZero - TopMax));
        frmLineBExhaustGasTemperature.pnlGrafik5.Top := TopZero - offset;
        grafikHeight := Round((deviasi / MaxDeviasi) * MaxHeight);
      end
      else
      begin
        frmLineBExhaustGasTemperature.pnlGrafik5.Top := TopZero;
        grafikHeight := 1;
      end;
        frmLineBExhaustGasTemperature.pnlGrafik5.Height := Max(grafikHeight, 1);
    end;
    epPCSMETempExhCylB6 :
    begin
      if Assigned(frmLineBExhaustGasTemperature) then
        frmLineBExhaustGasTemperature.lblA6LineB.Caption := FloatToStr(Value);
    end;
    epPCSMEDevTempExhCylB6 :
    begin
      if Assigned(frmLineBExhaustGasTemperature) then
        frmLineBExhaustGasTemperature.lblB6LineB.Caption := FloatToStr(Value / 10);

      deviasi := StrToIntDef(frmLineBExhaustGasTemperature.lblB6LineB.Caption, 0);

      if deviasi < 0 then
      begin
        offset := Round((Abs(deviasi) / MaxDeviasi) * (TopMin - TopZero));
        frmLineBExhaustGasTemperature.pnlGrafik6.Top := TopZero + offset;
        grafikHeight := Round((Abs(deviasi) / MaxDeviasi) * MaxHeight);
      end
      else if deviasi > 0 then
      begin
        offset := Round((deviasi / MaxDeviasi) * (TopZero - TopMax));
        frmLineBExhaustGasTemperature.pnlGrafik6.Top := TopZero - offset;
        grafikHeight := Round((deviasi / MaxDeviasi) * MaxHeight);
      end
      else
      begin
        frmLineBExhaustGasTemperature.pnlGrafik6.Top := TopZero;
        grafikHeight := 1;
      end;
        frmLineBExhaustGasTemperature.pnlGrafik6.Height := Max(grafikHeight, 1);
    end;
    epPCSMETempExhCylB7 :
    begin
      if Assigned(frmLineBExhaustGasTemperature) then
        frmLineBExhaustGasTemperature.lblA7LineB.Caption := FloatToStr(Value);
    end;
    epPCSMEDevTempExhCylB7 :
    begin
      if Assigned(frmLineBExhaustGasTemperature) then
        frmLineBExhaustGasTemperature.lblB7LineB.Caption := FloatToStr(Value / 10);

      deviasi := StrToIntDef(frmLineBExhaustGasTemperature.lblB7LineB.Caption, 0);

      if deviasi < 0 then
      begin
        offset := Round((Abs(deviasi) / MaxDeviasi) * (TopMin - TopZero));
        frmLineBExhaustGasTemperature.pnlGrafik7.Top := TopZero + offset;
        grafikHeight := Round((Abs(deviasi) / MaxDeviasi) * MaxHeight);
      end
      else if deviasi > 0 then
      begin
        offset := Round((deviasi / MaxDeviasi) * (TopZero - TopMax));
        frmLineBExhaustGasTemperature.pnlGrafik7.Top := TopZero - offset;
        grafikHeight := Round((deviasi / MaxDeviasi) * MaxHeight);
      end
      else
      begin
        frmLineBExhaustGasTemperature.pnlGrafik7.Top := TopZero;
        grafikHeight := 1;
      end;
        frmLineBExhaustGasTemperature.pnlGrafik7.Height := Max(grafikHeight, 1);
    end;
    epPCSMETempExhCylB8 :
    begin
     if Assigned(frmLineBExhaustGasTemperature) then
        frmLineBExhaustGasTemperature.lblA8LineB.Caption := FloatToStr(Value);
    end;
    epPCSMEDevTempExhCylB8 :
    begin
     if Assigned(frmLineBExhaustGasTemperature) then
        frmLineBExhaustGasTemperature.lblB8LineB.Caption := FloatToStr(Value / 10);

      deviasi := StrToIntDef(frmLineBExhaustGasTemperature.lblB8LineB.Caption, 0);

      if deviasi < 0 then
      begin
        offset := Round((Abs(deviasi) / MaxDeviasi) * (TopMin - TopZero));
        frmLineBExhaustGasTemperature.pnlGrafik8.Top := TopZero + offset;
        grafikHeight := Round((Abs(deviasi) / MaxDeviasi) * MaxHeight);
      end
      else if deviasi > 0 then
      begin
        offset := Round((deviasi / MaxDeviasi) * (TopZero - TopMax));
        frmLineBExhaustGasTemperature.pnlGrafik8.Top := TopZero - offset;
        grafikHeight := Round((deviasi / MaxDeviasi) * MaxHeight);
      end
      else
      begin
        frmLineBExhaustGasTemperature.pnlGrafik8.Top := TopZero;
        grafikHeight := 1;
      end;
        frmLineBExhaustGasTemperature.pnlGrafik8.Height := Max(grafikHeight, 1);
    end;
    epPCSMETempExhCylB9 :
    begin
     if Assigned(frmLineBExhaustGasTemperature) then
        frmLineBExhaustGasTemperature.lblA9LineB.Caption := FloatToStr(Value);
    end;
    epPCSMEDevTempExhCylB9 :
    begin
      if Assigned(frmLineBExhaustGasTemperature) then
        frmLineBExhaustGasTemperature.lblB9LineB.Caption := FloatToStr(Value / 10);

      deviasi := StrToIntDef(frmLineBExhaustGasTemperature.lblB9LineB.Caption, 0);

      if deviasi < 0 then
      begin
        offset := Round((Abs(deviasi) / MaxDeviasi) * (TopMin - TopZero));
        frmLineBExhaustGasTemperature.pnlGrafik9.Top := TopZero + offset;
        grafikHeight := Round((Abs(deviasi) / MaxDeviasi) * MaxHeight);
      end
      else if deviasi > 0 then
      begin
        offset := Round((deviasi / MaxDeviasi) * (TopZero - TopMax));
        frmLineBExhaustGasTemperature.pnlGrafik9.Top := TopZero - offset;
        grafikHeight := Round((deviasi / MaxDeviasi) * MaxHeight);
      end
      else
      begin
        frmLineBExhaustGasTemperature.pnlGrafik9.Top := TopZero;
        grafikHeight := 1;
      end;
        frmLineBExhaustGasTemperature.pnlGrafik9.Height := Max(grafikHeight, 1);
    end;
    epPCSMETempExhCylB10 :
    begin
      if Assigned(frmLineBExhaustGasTemperature) then
        frmLineBExhaustGasTemperature.lblA10LineB.Caption := FloatToStr(Value);
    end;
    epPCSMEDevTempExhCylB10 :
    begin
      if Assigned(frmLineBExhaustGasTemperature) then
        frmLineBExhaustGasTemperature.lblB10LineB.Caption := FloatToStr(Value / 10);

      deviasi := StrToIntDef(frmLineBExhaustGasTemperature.lblB10LineB.Caption, 0);

      if deviasi < 0 then
      begin
        offset := Round((Abs(deviasi) / MaxDeviasi) * (TopMin - TopZero));
        frmLineBExhaustGasTemperature.pnlGrafik10.Top := TopZero + offset;
        grafikHeight := Round((Abs(deviasi) / MaxDeviasi) * MaxHeight);
      end
      else if deviasi > 0 then
      begin
        offset := Round((deviasi / MaxDeviasi) * (TopZero - TopMax));
        frmLineBExhaustGasTemperature.pnlGrafik10.Top := TopZero - offset;
        grafikHeight := Round((deviasi / MaxDeviasi) * MaxHeight);
      end
      else
      begin
        frmLineBExhaustGasTemperature.pnlGrafik10.Top := TopZero;
        grafikHeight := 1;
      end;
        frmLineBExhaustGasTemperature.pnlGrafik10.Height := Max(grafikHeight, 1);
    end;
    epPCSMETempTCInletB :
    begin
      if Assigned(frmLineBExhaustGasTemperature) then
        frmLineBExhaustGasTemperature.lblTCInputLineB.Caption := FloatToStr(Value /10);
    end;
    epPCSMETempTCOutletB :
    begin
      if Assigned(frmLineBExhaustGasTemperature) then
        frmLineBExhaustGasTemperature.lblTCOutputLineB.Caption := FloatToStr(Value /10);
    end;
    epPCSMEAvgTempB :
    begin
      if Assigned(frmLineBExhaustGasTemperature) then
        frmLineBExhaustGasTemperature.lblCylinderAverageLineB.Caption := FloatToStr(Value /10);
    end;
    epPCSMECompProbB :
    begin
      if Assigned(frmLineBExhaustGasTemperature) then
        frmLineBExhaustGasTemperature.lblCompensationLineA.Caption := FloatToStr(Value /10);
    end;
    // Engine Bearing Temperature
    epPCSMETempBear1 :
    begin
      suhu := Value / 10;

      if Assigned(frmEngineBearingTemperature) then
        frmEngineBearingTemperature.lblEngineBearing1.Caption := FloatToStr(suhu);

      if suhu < 0 then suhu := 0;
      if suhu > MaxTemp then suhu := MaxTemp;

      grafikHeight := Round((suhu / MaxTemp) * (TopMaxTemp - TopMinTemp));
      grafikTop := TopMaxTemp - grafikHeight;

      frmEngineBearingTemperature.pnlGrafik1.Top    := grafikTop;
      frmEngineBearingTemperature.pnlGrafik1.Height := grafikHeight;
    end;
    epPCSMETempBear2 :
    begin
      suhu := Value / 10;

      if Assigned(frmEngineBearingTemperature) then
        frmEngineBearingTemperature.lblEngineBearing2.Caption := FloatToStr(suhu);

      if suhu < 0 then suhu := 0;
      if suhu > MaxTemp then suhu := MaxTemp;

      grafikHeight := Round((suhu / MaxTemp) * (TopMaxTemp - TopMinTemp));
      grafikTop := TopMaxTemp - grafikHeight;

      frmEngineBearingTemperature.pnlGrafik2.Top    := grafikTop;
      frmEngineBearingTemperature.pnlGrafik2.Height := grafikHeight;
    end;
    epPCSMETempBear3 :
    begin
      suhu := Value / 10;

      if Assigned(frmEngineBearingTemperature) then
        frmEngineBearingTemperature.lblEngineBearing3.Caption := FloatToStr(suhu);

      if suhu < 0 then suhu := 0;
      if suhu > MaxTemp then suhu := MaxTemp;

      grafikHeight := Round((suhu / MaxTemp) * (TopMaxTemp - TopMinTemp));
      grafikTop := TopMaxTemp - grafikHeight;

      frmEngineBearingTemperature.pnlGrafik3.Top    := grafikTop;
      frmEngineBearingTemperature.pnlGrafik3.Height := grafikHeight;
    end;
    epPCSMETempBear4 :
    begin
      suhu := Value / 10;

      if Assigned(frmEngineBearingTemperature) then
        frmEngineBearingTemperature.lblEngineBearing4.Caption := FloatToStr(suhu);

      if suhu < 0 then suhu := 0;
      if suhu > MaxTemp then suhu := MaxTemp;

      grafikHeight := Round((suhu / MaxTemp) * (TopMaxTemp - TopMinTemp));
      grafikTop := TopMaxTemp - grafikHeight;

      frmEngineBearingTemperature.pnlGrafik4.Top    := grafikTop;
      frmEngineBearingTemperature.pnlGrafik4.Height := grafikHeight;
    end;
    epPCSMETempBear5 :
    begin
      suhu := Value / 10;

      if Assigned(frmEngineBearingTemperature) then
        frmEngineBearingTemperature.lblEngineBearing5.Caption := FloatToStr(suhu);

      if suhu < 0 then suhu := 0;
      if suhu > MaxTemp then suhu := MaxTemp;

      grafikHeight := Round((suhu / MaxTemp) * (TopMaxTemp - TopMinTemp));
      grafikTop := TopMaxTemp - grafikHeight;

      frmEngineBearingTemperature.pnlGrafik5.Top    := grafikTop;
      frmEngineBearingTemperature.pnlGrafik5.Height := grafikHeight;
    end;
    epPCSMETempBear6 :
    begin
      suhu := Value / 10;

      if Assigned(frmEngineBearingTemperature) then
        frmEngineBearingTemperature.lblEngineBearing6.Caption := FloatToStr(suhu);

      if suhu < 0 then suhu := 0;
      if suhu > MaxTemp then suhu := MaxTemp;

      grafikHeight := Round((suhu / MaxTemp) * (TopMaxTemp - TopMinTemp));
      grafikTop := TopMaxTemp - grafikHeight;

      frmEngineBearingTemperature.pnlGrafik6.Top    := grafikTop;
      frmEngineBearingTemperature.pnlGrafik6.Height := grafikHeight;
    end;
    epPCSMETempBear7 :
    begin
      suhu := Value / 10;

      if Assigned(frmEngineBearingTemperature) then
        frmEngineBearingTemperature.lblEngineBearing7.Caption := FloatToStr(suhu);

      if suhu < 0 then suhu := 0;
      if suhu > MaxTemp then suhu := MaxTemp;

      grafikHeight := Round((suhu / MaxTemp) * (TopMaxTemp - TopMinTemp));
      grafikTop := TopMaxTemp - grafikHeight;

      frmEngineBearingTemperature.pnlGrafik7.Top    := grafikTop;
      frmEngineBearingTemperature.pnlGrafik7.Height := grafikHeight;
    end;
    epPCSMETempBear8 :
    begin
      suhu := Value / 10;

      if Assigned(frmEngineBearingTemperature) then
        frmEngineBearingTemperature.lblEngineBearing8.Caption := FloatToStr(suhu);

      if suhu < 0 then suhu := 0;
      if suhu > MaxTemp then suhu := MaxTemp;

      grafikHeight := Round((suhu / MaxTemp) * (TopMaxTemp - TopMinTemp));
      grafikTop := TopMaxTemp - grafikHeight;

      frmEngineBearingTemperature.pnlGrafik8.Top    := grafikTop;
      frmEngineBearingTemperature.pnlGrafik8.Height := grafikHeight;
    end;
    epPCSMETempBear9 :
    begin
      suhu := Value / 10;

      if Assigned(frmEngineBearingTemperature) then
        frmEngineBearingTemperature.lblEngineBearing9.Caption := FloatToStr(suhu);

      if suhu < 0 then suhu := 0;
      if suhu > MaxTemp then suhu := MaxTemp;

      grafikHeight := Round((suhu / MaxTemp) * (TopMaxTemp - TopMinTemp));
      grafikTop := TopMaxTemp - grafikHeight;

      frmEngineBearingTemperature.pnlGrafik9.Top    := grafikTop;
      frmEngineBearingTemperature.pnlGrafik9.Height := grafikHeight;
    end;
    epPCSMETempBear10 :
    begin
      suhu := Value / 10;

      if Assigned(frmEngineBearingTemperature) then
        frmEngineBearingTemperature.lblEngineBearing10.Caption := FloatToStr(suhu);

      if suhu < 0 then suhu := 0;
      if suhu > MaxTemp then suhu := MaxTemp;

      grafikHeight := Round((suhu / MaxTemp) * (TopMaxTemp - TopMinTemp));
      grafikTop := TopMaxTemp - grafikHeight;

      frmEngineBearingTemperature.pnlGrafik10.Top    := grafikTop;
      frmEngineBearingTemperature.pnlGrafik10.Height := grafikHeight;
    end;
    epPCSMETempBear11 :
    begin
      suhu := Value / 10;

      if Assigned(frmEngineBearingTemperature) then
        frmEngineBearingTemperature.lblEngineBearing11.Caption := FloatToStr(suhu);

      if suhu < 0 then suhu := 0;
      if suhu > MaxTemp then suhu := MaxTemp;

      grafikHeight := Round((suhu / MaxTemp) * (TopMaxTemp - TopMinTemp));
      grafikTop := TopMaxTemp - grafikHeight;

      frmEngineBearingTemperature.pnlGrafik11.Top    := grafikTop;
      frmEngineBearingTemperature.pnlGrafik11.Height := grafikHeight;
    end;
    // PCOT dan Crankin
    epPCSMETempConRodBear1 :
    begin
      if Assigned(frmCrankpinOilTemperature) then
        frmCrankpinOilTemperature.lblB1Crankpin.Caption := FloatToStr(Value /10);

      deviasi := StrToIntDef(frmCrankpinOilTemperature.lblB1Crankpin.Caption, 0);

      if deviasi < 0 then
      begin
        offset := Round((Abs(deviasi) / MaxDeviasi) * (TopMin - TopZero));
        frmCrankpinOilTemperature.pnlGrafik1.Top := TopZero + offset;
        grafikHeight := Round((Abs(deviasi) / MaxDeviasi) * MaxHeight);
      end
      else if deviasi > 0 then
      begin
        offset := Round((deviasi / MaxDeviasi) * (TopZero - TopMax));
        frmCrankpinOilTemperature.pnlGrafik1.Top := TopZero - offset;
        grafikHeight := Round((deviasi / MaxDeviasi) * MaxHeight);
      end
      else
      begin
        frmCrankpinOilTemperature.pnlGrafik1.Top := TopZero;
        grafikHeight := 1;
      end;
        frmCrankpinOilTemperature.pnlGrafik1.Height := Max(grafikHeight, 1);

      // PCOT
      if Assigned(frmCrankpinOilTemperature) then
        frmPCOTFilteringDeviations.lblB1PCOT.Caption := FloatToStr(Value /10);

      deviasi := StrToIntDef(frmPCOTFilteringDeviations.lblB1PCOT.Caption, 0);

      if deviasi < 0 then
      begin
        offset := Round((Abs(deviasi) / MaxDeviasi) * (TopMin - TopZero));
        frmPCOTFilteringDeviations.pnlGrafik1.Top := TopZero + offset;
        grafikHeight := Round((Abs(deviasi) / MaxDeviasi) * MaxHeight);
      end
      else if deviasi > 0 then
      begin
        offset := Round((deviasi / MaxDeviasi) * (TopZero - TopMax));
        frmPCOTFilteringDeviations.pnlGrafik1.Top := TopZero - offset;
        grafikHeight := Round((deviasi / MaxDeviasi) * MaxHeight);
      end
      else
      begin
        frmPCOTFilteringDeviations.pnlGrafik1.Top := TopZero;
        grafikHeight := 1;
      end;
        frmPCOTFilteringDeviations.pnlGrafik1.Height := Max(grafikHeight, 1);
    end;
    epPCSMETempConRodBear2 :
    begin
      if Assigned(frmCrankpinOilTemperature) then
        frmCrankpinOilTemperature.lblB2Crankpin.Caption := FloatToStr(Value /10);

      deviasi := StrToIntDef(frmCrankpinOilTemperature.lblB2Crankpin.Caption, 0);

      if deviasi < 0 then
      begin
        offset := Round((Abs(deviasi) / MaxDeviasi) * (TopMin - TopZero));
        frmCrankpinOilTemperature.pnlGrafik2.Top := TopZero + offset;
        grafikHeight := Round((Abs(deviasi) / MaxDeviasi) * MaxHeight);
      end
      else if deviasi > 0 then
      begin
        offset := Round((deviasi / MaxDeviasi) * (TopZero - TopMax));
        frmCrankpinOilTemperature.pnlGrafik2.Top := TopZero - offset;
        grafikHeight := Round((deviasi / MaxDeviasi) * MaxHeight);
      end
      else
      begin
        frmCrankpinOilTemperature.pnlGrafik2.Top := TopZero;
        grafikHeight := 1;
      end;
        frmCrankpinOilTemperature.pnlGrafik2.Height := Max(grafikHeight, 1);
    end;
    epPCSMETempConRodBear3 :
    begin
      if Assigned(frmCrankpinOilTemperature) then
        frmCrankpinOilTemperature.lblB3Crankpin.Caption := FloatToStr(Value /10);

      deviasi := StrToIntDef(frmCrankpinOilTemperature.lblB3Crankpin.Caption, 0);

      if deviasi < 0 then
      begin
        offset := Round((Abs(deviasi) / MaxDeviasi) * (TopMin - TopZero));
        frmCrankpinOilTemperature.pnlGrafik3.Top := TopZero + offset;
        grafikHeight := Round((Abs(deviasi) / MaxDeviasi) * MaxHeight);
      end
      else if deviasi > 0 then
      begin
        offset := Round((deviasi / MaxDeviasi) * (TopZero - TopMax));
        frmCrankpinOilTemperature.pnlGrafik3.Top := TopZero - offset;
        grafikHeight := Round((deviasi / MaxDeviasi) * MaxHeight);
      end
      else
      begin
        frmCrankpinOilTemperature.pnlGrafik3.Top := TopZero;
        grafikHeight := 1;
      end;
        frmCrankpinOilTemperature.pnlGrafik3.Height := Max(grafikHeight, 1);
    end;
    epPCSMETempConRodBear4 :
    begin
      if Assigned(frmCrankpinOilTemperature) then
        frmCrankpinOilTemperature.lblB4Crankpin.Caption := FloatToStr(Value /10);

      deviasi := StrToIntDef(frmCrankpinOilTemperature.lblB4Crankpin.Caption, 0);

      if deviasi < 0 then
      begin
        offset := Round((Abs(deviasi) / MaxDeviasi) * (TopMin - TopZero));
        frmCrankpinOilTemperature.pnlGrafik4.Top := TopZero + offset;
        grafikHeight := Round((Abs(deviasi) / MaxDeviasi) * MaxHeight);
      end
      else if deviasi > 0 then
      begin
        offset := Round((deviasi / MaxDeviasi) * (TopZero - TopMax));
        frmCrankpinOilTemperature.pnlGrafik4.Top := TopZero - offset;
        grafikHeight := Round((deviasi / MaxDeviasi) * MaxHeight);
      end
      else
      begin
        frmCrankpinOilTemperature.pnlGrafik4.Top := TopZero;
        grafikHeight := 1;
      end;
        frmCrankpinOilTemperature.pnlGrafik4.Height := Max(grafikHeight, 1);
    end;
    epPCSMETempConRodBear5 :
    begin
      if Assigned(frmCrankpinOilTemperature) then
        frmCrankpinOilTemperature.lblB5Crankpin.Caption := FloatToStr(Value /10);

      deviasi := StrToIntDef(frmCrankpinOilTemperature.lblB5Crankpin.Caption, 0);

      if deviasi < 0 then
      begin
        offset := Round((Abs(deviasi) / MaxDeviasi) * (TopMin - TopZero));
        frmCrankpinOilTemperature.pnlGrafik5.Top := TopZero + offset;
        grafikHeight := Round((Abs(deviasi) / MaxDeviasi) * MaxHeight);
      end
      else if deviasi > 0 then
      begin
        offset := Round((deviasi / MaxDeviasi) * (TopZero - TopMax));
        frmCrankpinOilTemperature.pnlGrafik5.Top := TopZero - offset;
        grafikHeight := Round((deviasi / MaxDeviasi) * MaxHeight);
      end
      else
      begin
        frmCrankpinOilTemperature.pnlGrafik5.Top := TopZero;
        grafikHeight := 1;
      end;
        frmCrankpinOilTemperature.pnlGrafik5.Height := Max(grafikHeight, 1);
    end;
    epPCSMETempConRodBear6 :
    begin
      if Assigned(frmCrankpinOilTemperature) then
        frmCrankpinOilTemperature.lblB6Crankpin.Caption := FloatToStr(Value /10);

      deviasi := StrToIntDef(frmCrankpinOilTemperature.lblB6Crankpin.Caption, 0);

      if deviasi < 0 then
      begin
        offset := Round((Abs(deviasi) / MaxDeviasi) * (TopMin - TopZero));
        frmCrankpinOilTemperature.pnlGrafik6.Top := TopZero + offset;
        grafikHeight := Round((Abs(deviasi) / MaxDeviasi) * MaxHeight);
      end
      else if deviasi > 0 then
      begin
        offset := Round((deviasi / MaxDeviasi) * (TopZero - TopMax));
        frmCrankpinOilTemperature.pnlGrafik6.Top := TopZero - offset;
        grafikHeight := Round((deviasi / MaxDeviasi) * MaxHeight);
      end
      else
      begin
        frmCrankpinOilTemperature.pnlGrafik6.Top := TopZero;
        grafikHeight := 1;
      end;
        frmCrankpinOilTemperature.pnlGrafik6.Height := Max(grafikHeight, 1);
    end;
    epPCSMETempConRodBear7 :
    begin
      if Assigned(frmCrankpinOilTemperature) then
        frmCrankpinOilTemperature.lblB7Crankpin.Caption := FloatToStr(Value /10);

      deviasi := StrToIntDef(frmCrankpinOilTemperature.lblB7Crankpin.Caption, 0);

      if deviasi < 0 then
      begin
        offset := Round((Abs(deviasi) / MaxDeviasi) * (TopMin - TopZero));
        frmCrankpinOilTemperature.pnlGrafik7.Top := TopZero + offset;
        grafikHeight := Round((Abs(deviasi) / MaxDeviasi) * MaxHeight);
      end
      else if deviasi > 0 then
      begin
        offset := Round((deviasi / MaxDeviasi) * (TopZero - TopMax));
        frmCrankpinOilTemperature.pnlGrafik7.Top := TopZero - offset;
        grafikHeight := Round((deviasi / MaxDeviasi) * MaxHeight);
      end
      else
      begin
        frmCrankpinOilTemperature.pnlGrafik7.Top := TopZero;
        grafikHeight := 1;
      end;
        frmCrankpinOilTemperature.pnlGrafik7.Height := Max(grafikHeight, 1);
    end;
    epPCSMETempConRodBear8 :
    begin
      if Assigned(frmCrankpinOilTemperature) then
        frmCrankpinOilTemperature.lblB8Crankpin.Caption := FloatToStr(Value /10);

      deviasi := StrToIntDef(frmCrankpinOilTemperature.lblB8Crankpin.Caption, 0);

      if deviasi < 0 then
      begin
        offset := Round((Abs(deviasi) / MaxDeviasi) * (TopMin - TopZero));
        frmCrankpinOilTemperature.pnlGrafik8.Top := TopZero + offset;
        grafikHeight := Round((Abs(deviasi) / MaxDeviasi) * MaxHeight);
      end
      else if deviasi > 0 then
      begin
        offset := Round((deviasi / MaxDeviasi) * (TopZero - TopMax));
        frmCrankpinOilTemperature.pnlGrafik8.Top := TopZero - offset;
        grafikHeight := Round((deviasi / MaxDeviasi) * MaxHeight);
      end
      else
      begin
        frmCrankpinOilTemperature.pnlGrafik8.Top := TopZero;
        grafikHeight := 1;
      end;
        frmCrankpinOilTemperature.pnlGrafik8.Height := Max(grafikHeight, 1);
    end;
    epPCSMETempConRodBear9 :
    begin
      if Assigned(frmCrankpinOilTemperature) then
        frmCrankpinOilTemperature.lblB9Crankpin.Caption := FloatToStr(Value /10);

      deviasi := StrToIntDef(frmCrankpinOilTemperature.lblB9Crankpin.Caption, 0);

      if deviasi < 0 then
      begin
        offset := Round((Abs(deviasi) / MaxDeviasi) * (TopMin - TopZero));
        frmCrankpinOilTemperature.pnlGrafik9.Top := TopZero + offset;
        grafikHeight := Round((Abs(deviasi) / MaxDeviasi) * MaxHeight);
      end
      else if deviasi > 0 then
      begin
        offset := Round((deviasi / MaxDeviasi) * (TopZero - TopMax));
        frmCrankpinOilTemperature.pnlGrafik9.Top := TopZero - offset;
        grafikHeight := Round((deviasi / MaxDeviasi) * MaxHeight);
      end
      else
      begin
        frmCrankpinOilTemperature.pnlGrafik9.Top := TopZero;
        grafikHeight := 1;
      end;
        frmCrankpinOilTemperature.pnlGrafik9.Height := Max(grafikHeight, 1);
    end;
    epPCSMETempConRodBear10 :
    begin
      if Assigned(frmCrankpinOilTemperature) then
        frmCrankpinOilTemperature.lblB10Crankpin.Caption := FloatToStr(Value /10);

      deviasi := StrToIntDef(frmCrankpinOilTemperature.lblB10Crankpin.Caption, 0);

      if deviasi < 0 then
      begin
        offset := Round((Abs(deviasi) / MaxDeviasi) * (TopMin - TopZero));
        frmCrankpinOilTemperature.pnlGrafik10.Top := TopZero + offset;
        grafikHeight := Round((Abs(deviasi) / MaxDeviasi) * MaxHeight);
      end
      else if deviasi > 0 then
      begin
        offset := Round((deviasi / MaxDeviasi) * (TopZero - TopMax));
        frmCrankpinOilTemperature.pnlGrafik10.Top := TopZero - offset;
        grafikHeight := Round((deviasi / MaxDeviasi) * MaxHeight);
      end
      else
      begin
        frmCrankpinOilTemperature.pnlGrafik10.Top := TopZero;
        grafikHeight := 1;
      end;
        frmCrankpinOilTemperature.pnlGrafik10.Height := Max(grafikHeight, 1);
    end;
  end;
end;

procedure TfrmMainForm.tmrRunningMETimer1Timer(Sender: TObject);
begin
  if FIsRunningHours then
    Inc(CurrentHourCounter);
    frmSignalingLightME2.lblHoorCounter.Caption := IntToStr(CurrentHourCounter);
end;

end.
