unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,

  uSetting, uListener, uFreezeFrom, uDataType, Vcl.ExtCtrls, Math, Vcl.StdCtrls;

type
  TfrmMainForm = class(TForm)
    tmrRunningMETimer1: TTimer;
    mmoNetLogger: TMemo;
    mmoLogReceive: TMemo;
    tmr1: TTimer;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tmrRunningMETimer1Timer(Sender: TObject);

  private
//    FListener : TListeners;
    CurrentHourCounter : Integer;
    FRunningHourTemp   : Integer;
    FIsRunningHours    : Boolean;
    FIsImageBlink      : Boolean;
    FIsBlinkState      : Boolean;
    FBlinkCounter      : Integer;

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
  ufrmLubOilCircuit, ufrmPLCNetwork, uTCPClient, ufrmAlarms, ufrmPCOTValueHistory, ufrmCurves;

{$R *.dfm}

procedure TfrmMainForm.FormCreate(Sender: TObject);
begin
  Setting   := TSetting.Create;
  MainEngine2System := TMainEngine2System.Create;

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

  MainEngine2System.Free;
  Setting.Free;
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
          Parent   := frmSignalingLightME2;
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
      else if Trunc(Value) < Trunc(CurrentHourCounter) then
      begin
        CurrentHourCounter := Value;
        frmSignalingLightME2.lblHoorCounter.Caption := IntToStr(Value);

        if FIsRunningHours then
        begin
          tmrRunningMETimer1.Enabled := False;
          FIsRunningHours := False;
        end;
      end;
    end;
    epPCSSpeedState :
    begin
      if Assigned(frmSignalingLightME2) then
          frmSignalingLightME2.vrtryswtchSpeedPS.SwitchPosition := Value;
    end;
    epPCSMESTCInManual :
    begin
      if Assigned(frmSignalingLightME2) then
        frmSignalingLightME2.vrtryswtchSTC_PS.SwitchPosition := Value;

      if Assigned(frmAirGasCircuit) then
      begin
        frmSignalingLightME2.vrtryswtchSTC_PS.SwitchPosition := 1;
        frmAirGasCircuit.lblSTCInAutoMode.Color              := clGreen;
        frmAirGasCircuit.lblSTCInAutoMode.FontLeave.Color    := clBlack;
      end
      else
      begin
        frmAirGasCircuit.lblSTCInAutoMode.Color            := clAqua;
        frmAirGasCircuit.lblSTCInAutoMode.FontLeave.Color  := clWhite;
      end;
    end
  end;
end;

procedure TfrmMainForm.MainEngine2SystemEvent(Sender: TObject; PropsID: E_PropsID; Value: Boolean);
begin
  case PropsID of
    epPCSCtrlMCR :
    begin
      if Value then
        frmSignalingLightME2.vrtryswtchRemotePS.SwitchPosition := 1
      else
        frmSignalingLightME2.vrtryswtchRemotePS.SwitchPosition := 0;
    end;
    epPCSCtrlLocal:
    begin
      if Value then
        frmSignalingLightME2.vrtryswtchRemotePS.SwitchPosition := 0
      else
        frmSignalingLightME2.vrtryswtchRemotePS.SwitchPosition := 1;
    end;

    epPCSMEPreStart :
    begin
      if Value then
        frmSignalingLightME2.vrtryswtchPreStartPS.SwitchPosition := 0
      else
        frmSignalingLightME2.vrtryswtchPreStartPS.SwitchPosition := 1;
    end;

    // HMI
    epPCSMEEmergencyShutdown :
    begin
      if Assigned(frmSafetiesStop) then
      begin
        if Value then
        begin
          frmSafetiesStop.btnPS_SS_EmergencyShutdown.Color := clRed;
          frmSafetiesStop.lblSafetiesStop.Color            := clRed;
          frmAlarms.AddAlarmToLog('EMERGENCY SHUTDOWN');
          frmAlarms.Alarm(True);

          FIsImageBlink := Value;
          tmrRunningMETimer1.Enabled := FIsImageBlink;
          frmSetofPressureGaugesME2.imgFlashLighting.Visible := True;
        end
        else
        begin
          frmSafetiesStop.btnPS_SS_EmergencyShutdown.Color := clAqua;
          frmSafetiesStop.lblSafetiesStop.Color            := clAqua;
          frmAlarms.Alarm(False);
          frmSetofPressureGaugesME2.imgFlashLighting.Visible := False;
        end;
      end;
    end;
    epPCSMEOverspeedAlarm :
    begin
      if Assigned(frmSafetiesStop) then
      begin
        if Value then
        begin
          frmSafetiesStop.btnPS_SS_Overspeed.Color := clRed;
          frmSafetiesStop.lblSafetiesStop.Color    := clRed;
          frmAlarms.AddAlarmToLog('OVERSPEED');
          frmAlarms.Alarm(True);

          FIsImageBlink := Value;
          tmrRunningMETimer1.Enabled := FIsImageBlink;
          frmSetofPressureGaugesME2.imgFlashLighting.Visible := True;
        end
        else
        begin
          frmSafetiesStop.btnPS_SS_Overspeed.Color := clAqua;
          frmSafetiesStop.lblSafetiesStop.Color    := clAqua;
          frmAlarms.Alarm(False);

          FIsImageBlink := not Value;
          tmrRunningMETimer1.Enabled := not FIsImageBlink;
          frmSetofPressureGaugesME2.imgFlashLighting.Visible := False;
        end;
      end;
    end;
    epPCSMELOPressVeryLow :
    begin
      if Assigned(frmSafetiesStop) then
      begin
        if Value then
        begin
          frmSafetiesStop.btnPS_SS_EngInletLubOilVeryHigh.Color := clRed;
          frmSafetiesStop.lblSafetiesStop.Color := clRed;
          frmAlarms.AddAlarmToLog('LO PRESSURE VERY LOW');
          frmAlarms.Alarm(True);

          FIsImageBlink := Value;
          tmrRunningMETimer1.Enabled := FIsImageBlink;
          frmSetofPressureGaugesME2.imgFlashLighting.Visible := True;
        end
        else
        begin
          frmSafetiesStop.btnPS_SS_EngInletLubOilVeryHigh.Color := clAqua;
          frmSafetiesStop.lblSafetiesStop.Color := clAqua;
          frmAlarms.Alarm(False);

          FIsImageBlink := not Value;
          tmrRunningMETimer1.Enabled := not FIsImageBlink;
          frmSetofPressureGaugesME2.imgFlashLighting.Visible := False;
        end;
      end;
    end;
    epPCSMERedGearSafetyStop :
    begin
      if Assigned(frmSafetiesStop) then
      begin
        if Value then
        begin
          frmSafetiesStop.btnPS_SS_RedGearSafetyStop.Color := clRed;
          frmSafetiesStop.lblSafetiesStop.Color := clRed;
          frmAlarms.AddAlarmToLog('RED GEAR SAFETY STOP');
          frmAlarms.Alarm(True);

          FIsImageBlink := Value;
          tmrRunningMETimer1.Enabled := FIsImageBlink;
          frmSetofPressureGaugesME2.imgFlashLighting.Visible := True;
        end
        else
        begin
          frmSafetiesStop.btnPS_SS_RedGearSafetyStop.Color := clAqua;
          frmSafetiesStop.lblSafetiesStop.Color := clAqua;
          frmAlarms.Alarm(False);

          FIsImageBlink := not Value;
          tmrRunningMETimer1.Enabled := not FIsImageBlink;
          frmSetofPressureGaugesME2.imgFlashLighting.Visible := False;
        end;
      end;
    end;
    epPCSMEFwHtExpTkLevelVeryLow :
    begin
      if Assigned(frmSafetiesStop) then
      begin
        if Value then
        begin
          frmSafetiesStop.btnPS_SS_FwHtExpTkLevelVeryLow.Color := clRed;
          frmAlarms.AddAlarmToLog('FW HT EXP TK LEVEL VERY LOW');
          frmAlarms.Alarm(True);

          FIsImageBlink := Value;
          tmrRunningMETimer1.Enabled := FIsImageBlink;
          frmSetofPressureGaugesME2.imgFlashLighting.Visible := True;
        end
        else
        begin
          frmSafetiesStop.btnPS_SS_FwHtExpTkLevelVeryLow.Color := clAqua;
          frmAlarms.Alarm(False);

          FIsImageBlink := not Value;
          tmrRunningMETimer1.Enabled := not FIsImageBlink;
          frmSetofPressureGaugesME2.imgFlashLighting.Visible := False;
        end;
      end;
    end;
    epPCSMEFwTempVeryHigh :
    begin
      if Assigned(frmSafetiesStop) then
      begin
        if Value then
        begin
          frmSafetiesStop.btnPS_SS_FwTempVeryHigh.Color := clRed;
          frmAlarms.AddAlarmToLog('FW TEMP VERY HIGH');
          frmAlarms.Alarm(True);

          FIsImageBlink := Value;
          tmrRunningMETimer1.Enabled := FIsImageBlink;
          frmSetofPressureGaugesME2.imgFlashLighting.Visible := True;
        end
        else
        begin
          frmSafetiesStop.btnPS_SS_FwTempVeryHigh.Color := clAqua;
          frmAlarms.Alarm(False);

          FIsImageBlink := not Value;
          tmrRunningMETimer1.Enabled := not FIsImageBlink;
          frmSetofPressureGaugesME2.imgFlashLighting.Visible := False;
        end;
      end;
    end;
    epPCSMEConRodBearingTempVeryHigh :
    begin
      if Assigned(frmSafetiesStop) then
      begin
        if Value then
        begin
          frmSafetiesStop.btnPS_SS_ConRodBearTempVeryHigh.Color := clRed;
          frmAlarms.AddAlarmToLog('CON ROD BEAR TEMP VERY HIGH');
          frmAlarms.Alarm(True);

          FIsImageBlink := Value;
          tmrRunningMETimer1.Enabled := FIsImageBlink;
          frmSetofPressureGaugesME2.imgFlashLighting.Visible := True;
        end
        else
        begin
          frmSafetiesStop.btnPS_SS_ConRodBearTempVeryHigh.Color := clAqua;
          frmAlarms.Alarm(False);

          FIsImageBlink := not Value;
          tmrRunningMETimer1.Enabled := not FIsImageBlink;
          frmSetofPressureGaugesME2.imgFlashLighting.Visible := False;
        end;
      end;
    end;
    epPCSMEEngInletLubOilVeryHigh :
    begin
      if Assigned(frmSafetiesStop) then
      begin
        if Value then
        begin
          frmSafetiesStop.btnPS_SS_EngInletLubOilVeryHighTemperature.Color := clRed;
          frmAlarms.AddAlarmToLog('ENG INLET LUB OIL VERY HIGH');
          frmAlarms.Alarm(True);

          FIsImageBlink := Value;
          tmrRunningMETimer1.Enabled := FIsImageBlink;
          frmSetofPressureGaugesME2.imgFlashLighting.Visible := True;
        end
        else
        begin
          frmSafetiesStop.btnPS_SS_EngInletLubOilVeryHighTemperature.Color := clAqua;
          frmAlarms.Alarm(False);

          FIsImageBlink := not Value;
          tmrRunningMETimer1.Enabled := not FIsImageBlink;
          frmSetofPressureGaugesME2.imgFlashLighting.Visible := False;
        end;
      end;
    end;
    epPCSMEOilMistDetSafety :
    begin
      if Assigned(frmSafetiesStop) then
      begin
        if Value then
        begin
          frmSafetiesStop.btnPS_SS_OilMistDetHigh.Color := clRed;
          frmAlarms.AddAlarmToLog('OIL MIST DET HIGH');
          frmAlarms.Alarm(True);

          FIsImageBlink := Value;
          tmrRunningMETimer1.Enabled := FIsImageBlink;
          frmSetofPressureGaugesME2.imgFlashLighting.Visible := True;
        end
        else
        begin
          frmSafetiesStop.btnPS_SS_OilMistDetHigh.Color := clAqua;
          frmAlarms.Alarm(False);

          FIsImageBlink := not Value;
          tmrRunningMETimer1.Enabled := not FIsImageBlink;
          frmSetofPressureGaugesME2.imgFlashLighting.Visible := False;
        end;
      end;
    end;
    epPCSMETurningGearEngaged :
    begin
      if Assigned(frmSafetiesStop) then
      begin
        if Value then
        begin
          frmSafetiesStop.btnPS_SI_TurningGearDisengaged.Color := clRed;
          frmSafetiesStop.lblStartingInterlocks.Color := clRed;
          frmAlarms.AddAlarmToLog('TURNING GEAR ENGAGED');
          frmAlarms.Alarm(True);

          FIsImageBlink := Value;
          tmrRunningMETimer1.Enabled := FIsImageBlink;
          frmSetofPressureGaugesME2.imgFlashLighting.Visible := True;
        end
        else
        begin
          frmSafetiesStop.btnPS_SI_TurningGearDisengaged.Color := clAqua;
          frmSafetiesStop.lblStartingInterlocks.Color := clAqua;
          frmAlarms.Alarm(False);

          FIsImageBlink := not Value;
          tmrRunningMETimer1.Enabled := not FIsImageBlink;
          frmSetofPressureGaugesME2.imgFlashLighting.Visible := False;
        end;
      end;
    end;
    epPCSMEManHandleAtStop :
    begin
      if Assigned(frmSafetiesStop) then
      begin
        if Value then
        begin
          frmSafetiesStop.btnPS_SI_ManHandleAtStop.Color := clRed;
          frmSafetiesStop.lblStartingInterlocks.Color    := clRed;
          frmAlarms.AddAlarmToLog('MAN HANDLE AT STOP');
          frmAlarms.Alarm(True);

          FIsImageBlink := Value;
          tmrRunningMETimer1.Enabled := FIsImageBlink;
          frmSetofPressureGaugesME2.imgFlashLighting.Visible := True;
        end
        else
        begin
          frmSafetiesStop.btnPS_SI_ManHandleAtStop.Color := clAqua;
          frmSafetiesStop.lblStartingInterlocks.Color    := clAqua;
          frmAlarms.Alarm(False);

          FIsImageBlink := not Value;
          tmrRunningMETimer1.Enabled := not FIsImageBlink;
          frmSetofPressureGaugesME2.imgFlashLighting.Visible := False;
        end;
      end;
    end;
    epPCSMEFuelRackAtStop :
    begin
      if Assigned(frmSafetiesStop) then
      begin
        if Value then
        begin
          frmSafetiesStop.btnPS_SI_FuelRackAtStop.Color := clRed;
          frmSafetiesStop.lblStartingInterlocks.Color   := clRed;
          frmAlarms.AddAlarmToLog('FUEL RACK AT STOP');
          frmAlarms.Alarm(True);

          FIsImageBlink := Value;
          tmrRunningMETimer1.Enabled := FIsImageBlink;
          frmSetofPressureGaugesME2.imgFlashLighting.Visible := True;
        end
        else
        begin
          frmSafetiesStop.btnPS_SI_FuelRackAtStop.Color := clAqua;
          frmSafetiesStop.lblStartingInterlocks.Color   := clAqua;
          frmAlarms.Alarm(False);

          FIsImageBlink := not Value;
          tmrRunningMETimer1.Enabled := not FIsImageBlink;
          frmSetofPressureGaugesME2.imgFlashLighting.Visible := False;
        end;
      end;
    end;
    epPCSGBDeclutched :
    begin
      if Assigned(frmSafetiesStop) then
      begin
        if Value then
        begin
          frmSafetiesStop.btn_Engine_Declutch.Color   := clLime;
          frmSafetiesStop.lblStartingInterlocks.Color := clLime;
          frmAlarms.AddAlarmToLog('ENGINE DECLUTCHED');
        end
        else
        begin
          frmSafetiesStop.btn_Engine_Declutch.Color   := clAqua;
          frmSafetiesStop.lblStartingInterlocks.Color := clAqua;
        end;
      end;
    end;
    epPCSMEBypassP2P4 :        // 7 Bar Control Air Low Pressure
    begin
      if Assigned(frmSafetiesStop) then
      begin
        if Value then
        begin
          frmSafetiesStop.Vr7BarControlAirLowPressure.Color := clWebOrange;
          frmSafetiesStop.lblStartingInterlocks.Color       := clWebOrange;
          frmAlarms.AddAlarmToLog('7 BAR CONTROL AIR LOW PRESSURE');
        end
        else
        begin
          frmSafetiesStop.btn_Engine_Declutch.Color   := clAqua;
          frmSafetiesStop.lblStartingInterlocks.Color := clAqua;
        end;
      end;

      if Assigned(frmAirGasCircuit) then
      begin
        if not Value then
        begin
          frmAirGasCircuit.lblByPassClosed.Color      := clGray;
        end
        else
        begin
          frmAirGasCircuit.lblByPassClosed.Color      := clAqua;
        end;
      end;
    end;
    epPCSMEPrelubInProgress :
    begin
      if Assigned(frmSafetiesStop) then
      begin
        if Value then
        begin
          frmSafetiesStop.btnPS_SI_PrelubeInProgress.Color := clRed;
          frmSafetiesStop.lblStartingInterlocks.Color      := clRed;
          frmAlarms.AddAlarmToLog('PRE LUB IN PROGRESS');
          frmAlarms.Alarm(True);

          FIsImageBlink := Value;
          tmrRunningMETimer1.Enabled := FIsImageBlink;
          frmSetofPressureGaugesME2.imgFlashLighting.Visible := True;
        end
        else
        begin
          frmSafetiesStop.btnPS_SI_PrelubeInProgress.Color := clAqua;
          frmSafetiesStop.lblStartingInterlocks.Color      := clAqua;
          frmAlarms.Alarm(False);

          FIsImageBlink := not Value;
          tmrRunningMETimer1.Enabled := not FIsImageBlink;
          frmSetofPressureGaugesME2.imgFlashLighting.Visible := False;
        end;
      end;
    end;
    epPCSMEPrelubricationFailure :
    begin
      if Assigned(frmSafetiesStop) then
      begin
        if Value then
        begin
          frmSafetiesStop.btnPS_SI_PrelubeFailure.Color := clRed;
          frmSafetiesStop.lblStartingInterlocks.Color   := clRed;
          frmAlarms.AddAlarmToLog('PRELUBRICATION FAILURE');
          frmAlarms.Alarm(True);

          FIsImageBlink := Value;
          tmrRunningMETimer1.Enabled := FIsImageBlink;
          frmSetofPressureGaugesME2.imgFlashLighting.Visible := True;
        end
        else
        begin
          frmSafetiesStop.btnPS_SI_PrelubeFailure.Color := clAqua;
          frmSafetiesStop.lblStartingInterlocks.Color   := clAqua;
          frmAlarms.Alarm(False);

          FIsImageBlink := not Value;
          tmrRunningMETimer1.Enabled := not FIsImageBlink;
          frmSetofPressureGaugesME2.imgFlashLighting.Visible := False;
        end;
      end;
    end;
    epPCSMEStartingFault :
    begin
      if Assigned(frmSafetiesStop) then
      begin
        if Value then
        begin
          frmSafetiesStop.btnPS_SI_StartingFailure.Color  := clRed;
          frmGeneralScreen.btnPS_SI_StartingFailure.Color := clRed;
          frmSafetiesStop.lblStartingInterlocks.Color     := clRed;
          frmAlarms.AddAlarmToLog('STARTING FAULT');
          frmAlarms.Alarm(True);

          FIsImageBlink := Value;
          tmrRunningMETimer1.Enabled := FIsImageBlink;
          frmSetofPressureGaugesME2.imgFlashLighting.Visible := True;
        end
        else
        begin
          frmSafetiesStop.btnPS_SI_StartingFailure.Color  := clAqua;
          frmGeneralScreen.btnPS_SI_StartingFailure.Color := clAqua;
          frmSafetiesStop.lblStartingInterlocks.Color     := clAqua;
          frmAlarms.Alarm(False);

          FIsImageBlink := not Value;
          tmrRunningMETimer1.Enabled := not FIsImageBlink;
          frmSetofPressureGaugesME2.imgFlashLighting.Visible := False;
        end;
      end;
    end;
    epPCSMESTCSequenceFail :
    begin
      if Assigned(frmSafetiesStop) then
      begin
        if Value then
        begin
          frmSafetiesStop.btnPS_SI_STCSequenceFail.Color := clRed;
          frmSafetiesStop.lblStartingInterlocks.Color    := clRed;
          frmAlarms.AddAlarmToLog('STC SEQUENCE FAIL');
          frmAlarms.Alarm(True);

          FIsImageBlink := Value;
          tmrRunningMETimer1.Enabled := FIsImageBlink;
          frmSetofPressureGaugesME2.imgFlashLighting.Visible := True;
        end
        else
        begin
          frmSafetiesStop.btnPS_SI_STCSequenceFail.Color := clAqua;
          frmSafetiesStop.lblStartingInterlocks.Color    := clAqua;
          frmAlarms.Alarm(False);

          FIsImageBlink := not Value;
          tmrRunningMETimer1.Enabled := not FIsImageBlink;
          frmSetofPressureGaugesME2.imgFlashLighting.Visible := False;
        end;
      end;
    end;
    epPCSMESlowTurningFault :
    begin
      if Assigned(frmSafetiesStop) then
      begin
        if Value then
        begin
          frmSafetiesStop.btnPS_SI_SlowTurningFailure.Color  := clRed;
          frmGeneralScreen.btnPS_SI_SlowTurningFailure.Color := clRed;
          frmSafetiesStop.lblStartingInterlocks.Color := clRed;
          frmAlarms.AddAlarmToLog('SLOW TURNING FAULT');
          frmAlarms.Alarm(True);

          FIsImageBlink := Value;
          tmrRunningMETimer1.Enabled := FIsImageBlink;
          frmSetofPressureGaugesME2.imgFlashLighting.Visible := True;
        end
        else
        begin
          frmSafetiesStop.btnPS_SI_SlowTurningFailure.Color := clAqua;
          frmGeneralScreen.btnPS_SI_SlowTurningFailure.Color := clAqua;
          frmSafetiesStop.lblStartingInterlocks.Color := clAqua;
          frmAlarms.Alarm(False);

          FIsImageBlink := not Value;
          tmrRunningMETimer1.Enabled := not FIsImageBlink;
          frmSetofPressureGaugesME2.imgFlashLighting.Visible := False;
        end;
      end;
    end;
    epPCSMESafetyShutdown :
    begin
      if Assigned(frmSafetiesStop) then
      begin
        if Value then
        begin
          frmSafetiesStop.btnPS_SI_SafetyStop.Color   := clRed;
          frmSafetiesStop.lblStartingInterlocks.Color := clRed;
          frmAlarms.AddAlarmToLog('SAFETY STOP');
          frmAlarms.Alarm(True);

          FIsImageBlink := Value;
          tmrRunningMETimer1.Enabled := FIsImageBlink;
          frmSetofPressureGaugesME2.imgFlashLighting.Visible := True;
        end
        else
        begin
          frmSafetiesStop.btnPS_SI_SafetyStop.Color   := clAqua;
          frmSafetiesStop.lblStartingInterlocks.Color := clAqua;
          frmAlarms.Alarm(False);

          FIsImageBlink := not Value;
          tmrRunningMETimer1.Enabled := not FIsImageBlink;
          frmSetofPressureGaugesME2.imgFlashLighting.Visible := False;
        end;
      end;
    end;
    epPCSGBPCSClutchInterlock :
    begin
      if Assigned(frmSafetiesStop) then
      begin
        if Value then
        begin
          frmGeneralScreen.btnPS_SS_ClutcInterlocks.Color := clRed;
          frmAlarms.AddAlarmToLog('PCS CLUTCH INTERLOCK');
          frmAlarms.Alarm(True);

          FIsImageBlink := Value;
          tmrRunningMETimer1.Enabled := FIsImageBlink;
          frmSetofPressureGaugesME2.imgFlashLighting.Visible := True;
        end
        else
        begin
          frmGeneralScreen.btnPS_SS_ClutcInterlocks.Color := clAqua;
          frmAlarms.Alarm(False);

          FIsImageBlink := not Value;
          tmrRunningMETimer1.Enabled := not FIsImageBlink;
          frmSetofPressureGaugesME2.imgFlashLighting.Visible := False;
        end;
      end;
    end;

    // Air Gas Circuit
    epPCSMEAirValve :
    begin
      if Assigned(frmAirGasCircuit) then
      begin
        if not Value then
        begin
          frmAirGasCircuit.lblAirValveClosed.Color            := clGray;
          frmAirGasCircuit.lblAirValveClosed.FontLeave.Color  := clYellow;
        end
        else
        begin
          frmAirGasCircuit.lblAirValveClosed.Color            := clAqua;
          frmAirGasCircuit.lblAirValveClosed.FontLeave.Color  := clWhite;
        end;
      end;
    end;
    epPCSMEGasValve :
    begin
      if Assigned(frmAirGasCircuit) then
      begin
        if not Value then
        begin
          frmAirGasCircuit.lblGazValveClosed.Color            := clGray;
          frmAirGasCircuit.lblGazValveClosed.FontLeave.Color  := clYellow;
        end
        else
        begin
          frmAirGasCircuit.lblGazValveClosed.Color            := clAqua;
          frmAirGasCircuit.lblGazValveClosed.FontLeave.Color  := clWhite;
        end;
      end;
    end;

    // Alarm Emergency
    epPCSMESafetyStopsOverriden :
    begin
      if Value then
      begin
        frmAlarms.AddAlarmToLog('SAFETY STOP OVERRIDEN');
        frmAlarms.Alarm(True);
      end
      else
      begin
        frmAlarms.Alarm(False);
      end;
    end;
    epPCSMELocalEmergencyStop :
    begin
      if Value then
      begin
        frmAlarms.AddAlarmToLog('EMERGECY STOP');
        frmAlarms.Alarm(True);
      end
      else
      begin
        frmAlarms.Alarm(False);
      end;
    end;
    epPCSMEResetSafetyStopPossible :
    begin
      if Value then
      begin
        frmAlarms.AddAlarmToLog('RESET SAFETY STOP POSSIBLE');
        frmAlarms.Alarm(True);
      end
      else
      begin
        frmAlarms.Alarm(False);
      end;
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

  TopZeroPCOT    = 546;
  TopMinPCOT     = 795;
  TopMaxPCOT     = 320;
  MaxDeviasiPCOT = 8;
  MaxHeightPCOT  = 10;

  // Engine Bearing
  TopMinTemp = 332;
  TopMaxTemp = 872;
  MaxTemp    = 150;
var
  deviasi: Integer;
  dev : Double;
  offset: Integer;
  suhu : Double;
  grafikHeight, grafikTop: Integer;

  // PCOT dan Crankin
  ValueAverage, ValueDev : Double;
  Temp1, Temp2, Temp3, Temp4, Temp5, Temp6, Temp7, Temp8, Temp9, Temp10 : Double;
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
      begin
        frmSetofPressureGaugesME2.EngineInletAirPressureMeter.Position := Value;
      end;

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
    epPCSMETurboChargerSpeedB :
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

      if Assigned(frmCurves) then
      begin
        frmCurves.lblTC1Speed.Caption := FloatToStr(Value);
      end;
    end;
    epPCSMETurboChargerSpeedA :
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

      if Assigned(frmCurves) then
      begin
        frmCurves.lblTC2Speed.Caption := FloatToStr(Value);
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

      if Assigned(frmPCOTValueHistory) then
         frmPCOTValueHistory.lblSpeed.Caption := FloatToStr(Value);

      if Assigned(frmSafetiesStop) then
      begin
        if Value < 80 then
        begin
           frmSafetiesStop.btnEngineSpeed80Rpm.Color   := clRed;
           frmSafetiesStop.lblStartingInterlocks.Color := clRed;
        end
        else
        begin
           frmSafetiesStop.btnEngineSpeed80Rpm.Color   := clAqua;
           frmSafetiesStop.lblStartingInterlocks.Color := clAqua;
        end;
      end;

      if Assigned(frmCurves) then
      begin
        frmCurves.lblEngineSpeed.Caption := FloatToStr(Value);
      end;
    end;
    epPCSCPPSetPointPitch :
    begin
      if Assigned(frmCurves) then
      begin
        frmCurves.lblPitch.Caption := FloatToStr(Value);
      end;
    end;
    epPCSMEFuelRack :
    begin
      if Assigned(frmGeneralScreen) then
      begin
        frmGeneralScreen.VrFuelRack.Position := Value;
        frmGeneralScreen.lblFuelRack.Caption := FloatToStr(Value);
      end;

      if Assigned(frmCurves) then
      begin
        frmCurves.lblFuelRack.Caption := FloatToStr(Value);
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

      if Assigned(frmPCOTValueHistory) then
         frmPCOTValueHistory.lblTOil.Caption := FloatToStr(Value /10);
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
        frmLineAExhaustGasTemperature.lblB1LineA.Caption := FloatToStr(Value /10);
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
        frmLineAExhaustGasTemperature.lblB2LineA.Caption := FloatToStr(Value /10);
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
        frmLineAExhaustGasTemperature.lblB3LineA.Caption := FloatToStr(Value /10);
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
        frmLineAExhaustGasTemperature.lblB4LineA.Caption := FloatToStr(Value /10);
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
        frmLineAExhaustGasTemperature.lblB5LineA.Caption := FloatToStr(Value /10);
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
        frmLineAExhaustGasTemperature.lblB6LineA.Caption := FloatToStr(Value /10);
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
        frmLineAExhaustGasTemperature.lblB7LineA.Caption := FloatToStr(Value /10);
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
        frmLineAExhaustGasTemperature.lblB8LineA.Caption := FloatToStr(Value /10);
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
        frmLineAExhaustGasTemperature.lblB9LineA.Caption := FloatToStr(Value /10);
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
        frmLineAExhaustGasTemperature.lblB10LineA.Caption := FloatToStr(Value /10);
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
        frmLineBExhaustGasTemperature.lblA1LineB.Caption := FloatToStr(Value /10);
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
        frmLineBExhaustGasTemperature.lblA2LineB.Caption := FloatToStr(Value /10);
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
        frmLineBExhaustGasTemperature.lblA3LineB.Caption := FloatToStr(Value /10);
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
        frmLineBExhaustGasTemperature.lblA4LineB.Caption := FloatToStr(Value /10);
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
        frmLineBExhaustGasTemperature.lblA5LineB.Caption := FloatToStr(Value /10);
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
        frmLineBExhaustGasTemperature.lblA6LineB.Caption := FloatToStr(Value /10);
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
        frmLineBExhaustGasTemperature.lblA7LineB.Caption := FloatToStr(Value /10);
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
        frmLineBExhaustGasTemperature.lblA8LineB.Caption := FloatToStr(Value /10);
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
        frmLineBExhaustGasTemperature.lblA9LineB.Caption := FloatToStr(Value /10);
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
        frmLineBExhaustGasTemperature.lblA10LineB.Caption := FloatToStr(Value /10);
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

      Temp1 := Value /10;

      TryStrToFloat(frmCrankpinOilTemperature.lblB1Crankpin.Caption, Temp1);
      TryStrToFloat(frmCrankpinOilTemperature.lblB2Crankpin.Caption, Temp2);
      TryStrToFloat(frmCrankpinOilTemperature.lblB3Crankpin.Caption, Temp3);
      TryStrToFloat(frmCrankpinOilTemperature.lblB4Crankpin.Caption, Temp4);
      TryStrToFloat(frmCrankpinOilTemperature.lblB5Crankpin.Caption, Temp5);
      TryStrToFloat(frmCrankpinOilTemperature.lblB6Crankpin.Caption, Temp6);
      TryStrToFloat(frmCrankpinOilTemperature.lblB7Crankpin.Caption, Temp7);
      TryStrToFloat(frmCrankpinOilTemperature.lblB8Crankpin.Caption, Temp8);
      TryStrToFloat(frmCrankpinOilTemperature.lblB9Crankpin.Caption, Temp9);
      TryStrToFloat(frmCrankpinOilTemperature.lblB10Crankpin.Caption, Temp10);

      ValueAverage := (Temp1 + Temp2 + Temp3 + Temp4 + Temp5 + Temp6 + Temp7 + Temp8 + Temp9 + Temp10) / 10;
      frmCrankpinOilTemperature.lblAverageTempPCOT.Caption := FloatToStr(ValueDev);

      ValueDev := Temp1 - ValueAverage;
      frmCrankpinOilTemperature.lblA1Crankpin.Caption := FormatFloat('0.0', ValueDev);

      dev := StrToFloatDef(frmCrankpinOilTemperature.lblA1Crankpin.Caption, 0);

      if dev < 0 then
      begin
        offset := Round((Abs(dev) / MaxDeviasiPCOT) * (TopMinPCOT - TopZeroPCOT));
        frmCrankpinOilTemperature.pnlGrafik1.Top := TopZeroPCOT + offset;
        grafikHeight := Round((Abs(dev) / MaxDeviasiPCOT) * MaxHeightPCOT);
      end
      else if dev > 0 then
      begin
        offset := Round((dev / MaxDeviasiPCOT) * (TopZeroPCOT - TopMaxPCOT));
        frmCrankpinOilTemperature.pnlGrafik1.Top := TopZeroPCOT - offset;
        grafikHeight := Round((dev / MaxDeviasiPCOT) * MaxHeightPCOT);
      end
      else
      begin
        frmCrankpinOilTemperature.pnlGrafik1.Top := TopZeroPCOT;
        grafikHeight := 1;
      end;
        frmCrankpinOilTemperature.pnlGrafik1.Height := Max(grafikHeight, 1);

      // PCOT
      if Assigned(frmPCOTFilteringDeviations) then
        frmPCOTFilteringDeviations.lblB1PCOT.Caption := FloatToStr(Value /10);

      Temp1 := Value /10;

      TryStrToFloat(frmPCOTFilteringDeviations.lblB1PCOT.Caption, Temp1);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB2PCOT.Caption, Temp2);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB3PCOT.Caption, Temp3);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB4PCOT.Caption, Temp4);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB5PCOT.Caption, Temp5);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB6PCOT.Caption, Temp6);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB7PCOT.Caption, Temp7);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB8PCOT.Caption, Temp8);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB9PCOT.Caption, Temp9);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB10PCOT.Caption, Temp10);

      ValueAverage := (Temp1 + Temp2 + Temp3 + Temp4 + Temp5 + Temp6 + Temp7 + Temp8 + Temp9 + Temp10) / 10;
      frmPCOTFilteringDeviations.lblAverageTempPCOT.Caption := FloatToStr(ValueAverage);

      ValueDev := Temp1 - ValueAverage;
      frmPCOTFilteringDeviations.lblA1PCOT.Caption := FormatFloat('0.0', ValueDev);

      dev := StrToFloatDef(frmPCOTFilteringDeviations.lblA1PCOT.Caption, 0);

      if dev < 0 then
      begin
        offset := Round((Abs(dev) / MaxDeviasiPCOT) * (TopMinPCOT - TopZeroPCOT));
        frmPCOTFilteringDeviations.pnlGrafik1.Top := TopZeroPCOT + offset;
        grafikHeight := Round((Abs(dev) / MaxDeviasiPCOT) * MaxHeightPCOT);
      end
      else if dev > 0 then
      begin
        offset := Round((dev / MaxDeviasiPCOT) * (TopZeroPCOT - TopMaxPCOT));
        frmPCOTFilteringDeviations.pnlGrafik1.Top := TopZeroPCOT - offset;
        grafikHeight := Round((dev / MaxDeviasiPCOT) * MaxHeightPCOT);
      end
      else
      begin
        frmPCOTFilteringDeviations.pnlGrafik1.Top := TopZeroPCOT;
        grafikHeight := 1;
      end;
        frmPCOTFilteringDeviations.pnlGrafik1.Height := Max(grafikHeight, 1);

      // PCOT History
      if Assigned(frmPCOtValueHistory) then
        frmPCOtValueHistory.lblA1PCOT.Caption := FloatToStr(Value /10);
    end;
    epPCSMETempConRodBear2 :
    begin
      if Assigned(frmCrankpinOilTemperature) then
        frmCrankpinOilTemperature.lblB2Crankpin.Caption := FloatToStr(Value /10);

      Temp2 := Value /10;

      TryStrToFloat(frmCrankpinOilTemperature.lblB1Crankpin.Caption, Temp1);
      TryStrToFloat(frmCrankpinOilTemperature.lblB2Crankpin.Caption, Temp2);
      TryStrToFloat(frmCrankpinOilTemperature.lblB3Crankpin.Caption, Temp3);
      TryStrToFloat(frmCrankpinOilTemperature.lblB4Crankpin.Caption, Temp4);
      TryStrToFloat(frmCrankpinOilTemperature.lblB5Crankpin.Caption, Temp5);
      TryStrToFloat(frmCrankpinOilTemperature.lblB6Crankpin.Caption, Temp6);
      TryStrToFloat(frmCrankpinOilTemperature.lblB7Crankpin.Caption, Temp7);
      TryStrToFloat(frmCrankpinOilTemperature.lblB8Crankpin.Caption, Temp8);
      TryStrToFloat(frmCrankpinOilTemperature.lblB9Crankpin.Caption, Temp9);
      TryStrToFloat(frmCrankpinOilTemperature.lblB10Crankpin.Caption, Temp10);

      ValueAverage := (Temp1 + Temp2 + Temp3 + Temp4 + Temp5 + Temp6 + Temp7 + Temp8 + Temp9 + Temp10) / 10;
      frmCrankpinOilTemperature.lblAverageTempPCOT.Caption := FloatToStr(ValueDev);

      ValueDev := Temp2 - ValueAverage;
      frmCrankpinOilTemperature.lblA2Crankpin.Caption := FormatFloat('0.0', ValueDev);

      dev := StrToFloatDef(frmCrankpinOilTemperature.lblA2Crankpin.Caption, 0);

      if dev < 0 then
      begin
        offset := Round((Abs(dev) / MaxDeviasiPCOT) * (TopMinPCOT - TopZeroPCOT));
        frmCrankpinOilTemperature.pnlGrafik2.Top := TopZeroPCOT + offset;
        grafikHeight := Round((Abs(dev) / MaxDeviasiPCOT) * MaxHeightPCOT);
      end
      else if dev > 0 then
      begin
        offset := Round((dev / MaxDeviasiPCOT) * (TopZeroPCOT - TopMaxPCOT));
        frmCrankpinOilTemperature.pnlGrafik2.Top := TopZeroPCOT - offset;
        grafikHeight := Round((dev / MaxDeviasiPCOT) * MaxHeightPCOT);
      end
      else
      begin
        frmCrankpinOilTemperature.pnlGrafik2.Top := TopZeroPCOT;
        grafikHeight := 1;
      end;
        frmCrankpinOilTemperature.pnlGrafik2.Height := Max(grafikHeight, 1);

      // PCOT
      if Assigned(frmPCOTFilteringDeviations) then
        frmPCOTFilteringDeviations.lblB2PCOT.Caption := FloatToStr(Value /10);

      Temp2 := Value /10;

      TryStrToFloat(frmPCOTFilteringDeviations.lblB1PCOT.Caption, Temp1);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB2PCOT.Caption, Temp2);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB3PCOT.Caption, Temp3);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB4PCOT.Caption, Temp4);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB5PCOT.Caption, Temp5);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB6PCOT.Caption, Temp6);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB7PCOT.Caption, Temp7);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB8PCOT.Caption, Temp8);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB9PCOT.Caption, Temp9);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB10PCOT.Caption, Temp10);

      ValueAverage := (Temp1 + Temp2 + Temp3 + Temp4 + Temp5 + Temp6 + Temp7 + Temp8 + Temp9 + Temp10) / 10;
      frmPCOTFilteringDeviations.lblAverageTempPCOT.Caption := FloatToStr(ValueAverage);

      ValueDev := Temp2 - ValueAverage;
      frmPCOTFilteringDeviations.lblA2PCOT.Caption := FormatFloat('0.0', ValueDev);

      dev := StrToFloatDef(frmPCOTFilteringDeviations.lblA2PCOT.Caption, 0);

      if dev < 0 then
      begin
        offset := Round((Abs(dev) / MaxDeviasiPCOT) * (TopMinPCOT - TopZeroPCOT));
        frmPCOTFilteringDeviations.pnlGrafik2.Top := TopZeroPCOT + offset;
        grafikHeight := Round((Abs(dev) / MaxDeviasiPCOT) * MaxHeightPCOT);
      end
      else if dev > 0 then
      begin
        offset := Round((dev / MaxDeviasi) * (TopZero - TopMax));
        frmPCOTFilteringDeviations.pnlGrafik2.Top := TopZeroPCOT - offset;
        grafikHeight := Round((dev / MaxDeviasiPCOT) * MaxHeightPCOT);
      end
      else
      begin
        frmPCOTFilteringDeviations.pnlGrafik2.Top := TopZeroPCOT;
        grafikHeight := 1;
      end;
        frmPCOTFilteringDeviations.pnlGrafik2.Height := Max(grafikHeight, 1);

      // PCOT History
      if Assigned(frmPCOtValueHistory) then
        frmPCOtValueHistory.lblA2PCOT.Caption := FloatToStr(Value /10);
    end;
    epPCSMETempConRodBear3 :
    begin
      if Assigned(frmCrankpinOilTemperature) then
        frmCrankpinOilTemperature.lblB3Crankpin.Caption := FloatToStr(Value /10);

      Temp3 := Value /10;

      TryStrToFloat(frmCrankpinOilTemperature.lblB1Crankpin.Caption, Temp1);
      TryStrToFloat(frmCrankpinOilTemperature.lblB2Crankpin.Caption, Temp2);
      TryStrToFloat(frmCrankpinOilTemperature.lblB3Crankpin.Caption, Temp3);
      TryStrToFloat(frmCrankpinOilTemperature.lblB4Crankpin.Caption, Temp4);
      TryStrToFloat(frmCrankpinOilTemperature.lblB5Crankpin.Caption, Temp5);
      TryStrToFloat(frmCrankpinOilTemperature.lblB6Crankpin.Caption, Temp6);
      TryStrToFloat(frmCrankpinOilTemperature.lblB7Crankpin.Caption, Temp7);
      TryStrToFloat(frmCrankpinOilTemperature.lblB8Crankpin.Caption, Temp8);
      TryStrToFloat(frmCrankpinOilTemperature.lblB9Crankpin.Caption, Temp9);
      TryStrToFloat(frmCrankpinOilTemperature.lblB10Crankpin.Caption, Temp10);

      ValueAverage := (Temp1 + Temp2 + Temp3 + Temp4 + Temp5 + Temp6 + Temp7 + Temp8 + Temp9 + Temp10) / 10;
      frmCrankpinOilTemperature.lblAverageTempPCOT.Caption := FloatToStr(ValueAverage);

      ValueDev := Temp3 - ValueAverage;
      frmCrankpinOilTemperature.lblA3Crankpin.Caption := FormatFloat('0.0', ValueDev);

      dev := StrToFloatDef(frmCrankpinOilTemperature.lblA3Crankpin.Caption, 0);

      if dev < 0 then
      begin
        offset := Round((Abs(dev) / MaxDeviasiPCOT) * (TopMinPCOT - TopZeroPCOT));
        frmCrankpinOilTemperature.pnlGrafik3.Top := TopZeroPCOT + offset;
        grafikHeight := Round((Abs(dev) / MaxDeviasi) * MaxHeight);
      end
      else if dev > 0 then
      begin
        offset := Round((dev / MaxDeviasiPCOT) * (TopZeroPCOT - TopMaxPCOT));
        frmCrankpinOilTemperature.pnlGrafik3.Top := TopZeroPCOT - offset;
        grafikHeight := Round((dev / MaxDeviasi) * MaxHeight);
      end
      else
      begin
        frmCrankpinOilTemperature.pnlGrafik3.Top := TopZeroPCOT;
        grafikHeight := 1;
      end;
        frmCrankpinOilTemperature.pnlGrafik3.Height := Max(grafikHeight, 1);

      // PCOT
      if Assigned(frmPCOTFilteringDeviations) then
        frmPCOTFilteringDeviations.lblB3PCOT.Caption := FloatToStr(Value /10);

      Temp3 := Value /10;

      TryStrToFloat(frmPCOTFilteringDeviations.lblB1PCOT.Caption, Temp1);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB2PCOT.Caption, Temp2);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB3PCOT.Caption, Temp3);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB4PCOT.Caption, Temp4);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB5PCOT.Caption, Temp5);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB6PCOT.Caption, Temp6);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB7PCOT.Caption, Temp7);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB8PCOT.Caption, Temp8);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB9PCOT.Caption, Temp9);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB10PCOT.Caption, Temp10);

      ValueAverage := (Temp1 + Temp2 + Temp3 + Temp4 + Temp5 + Temp6 + Temp7 + Temp8 + Temp9 + Temp10) / 10;
      frmPCOTFilteringDeviations.lblAverageTempPCOT.Caption := FloatToStr(ValueAverage);

      ValueDev := Temp3 - ValueAverage;
      frmPCOTFilteringDeviations.lblA3PCOT.Caption := FormatFloat('0.0', ValueDev);

      dev := StrToFloatDef(frmPCOTFilteringDeviations.lblA3PCOT.Caption, 0);

      if dev < 0 then
      begin
        offset := Round((Abs(dev) / MaxDeviasiPCOT) * (TopMinPCOT - TopZeroPCOT));
        frmPCOTFilteringDeviations.pnlGrafik3.Top := TopZeroPCOT + offset;
        grafikHeight := Round((Abs(dev) / MaxDeviasiPCOT) * MaxHeightPCOT);
      end
      else if dev > 0 then
      begin
        offset := Round((dev / MaxDeviasiPCOT) * (TopZeroPCOT - TopMaxPCOT));
        frmPCOTFilteringDeviations.pnlGrafik3.Top := TopZeroPCOT - offset;
        grafikHeight := Round((dev / MaxDeviasiPCOT) * MaxHeightPCOT);
      end
      else
      begin
        frmPCOTFilteringDeviations.pnlGrafik3.Top := TopZeroPCOT;
        grafikHeight := 1;
      end;
        frmPCOTFilteringDeviations.pnlGrafik3.Height := Max(grafikHeight, 1);

      // PCOT History
      if Assigned(frmPCOtValueHistory) then
        frmPCOtValueHistory.lblA3PCOT.Caption := FloatToStr(Value /10);
    end;
    epPCSMETempConRodBear4 :
    begin
      if Assigned(frmCrankpinOilTemperature) then
        frmCrankpinOilTemperature.lblB4Crankpin.Caption := FloatToStr(Value /10);

      Temp4 := Value /10;

      TryStrToFloat(frmCrankpinOilTemperature.lblB1Crankpin.Caption, Temp1);
      TryStrToFloat(frmCrankpinOilTemperature.lblB2Crankpin.Caption, Temp2);
      TryStrToFloat(frmCrankpinOilTemperature.lblB3Crankpin.Caption, Temp3);
      TryStrToFloat(frmCrankpinOilTemperature.lblB4Crankpin.Caption, Temp4);
      TryStrToFloat(frmCrankpinOilTemperature.lblB5Crankpin.Caption, Temp5);
      TryStrToFloat(frmCrankpinOilTemperature.lblB6Crankpin.Caption, Temp6);
      TryStrToFloat(frmCrankpinOilTemperature.lblB7Crankpin.Caption, Temp7);
      TryStrToFloat(frmCrankpinOilTemperature.lblB8Crankpin.Caption, Temp8);
      TryStrToFloat(frmCrankpinOilTemperature.lblB9Crankpin.Caption, Temp9);
      TryStrToFloat(frmCrankpinOilTemperature.lblB10Crankpin.Caption, Temp10);

      ValueAverage := (Temp1 + Temp2 + Temp3 + Temp4 + Temp5 + Temp6 + Temp7 + Temp8 + Temp9 + Temp10) / 10;
      frmCrankpinOilTemperature.lblAverageTempPCOT.Caption := FloatToStr(ValueAverage);

      ValueDev := Temp4 - ValueAverage;
      frmCrankpinOilTemperature.lblA4Crankpin.Caption := FormatFloat('0.0', ValueDev);

      dev := StrToFloatDef(frmCrankpinOilTemperature.lblA4Crankpin.Caption, 0);

      if dev < 0 then
      begin
        offset := Round((Abs(dev) / MaxDeviasiPCOT) * (TopMinPCOT - TopZeroPCOT));
        frmCrankpinOilTemperature.pnlGrafik4.Top := TopZeroPCOT + offset;
        grafikHeight := Round((Abs(dev) / MaxDeviasiPCOT) * MaxHeightPCOT);
      end
      else if dev > 0 then
      begin
        offset := Round((dev / MaxDeviasi) * (TopZero - TopMax));
        frmCrankpinOilTemperature.pnlGrafik4.Top := TopZeroPCOT - offset;
        grafikHeight := Round((dev / MaxDeviasiPCOT) * MaxHeightPCOT);
      end
      else
      begin
        frmCrankpinOilTemperature.pnlGrafik4.Top := TopZeroPCOT;
        grafikHeight := 1;
      end;
        frmCrankpinOilTemperature.pnlGrafik4.Height := Max(grafikHeight, 1);

      // PCOT
      if Assigned(frmPCOTFilteringDeviations) then
        frmPCOTFilteringDeviations.lblB4PCOT.Caption := FloatToStr(Value /10);

      Temp4 := Value /10;

      TryStrToFloat(frmPCOTFilteringDeviations.lblB1PCOT.Caption, Temp1);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB2PCOT.Caption, Temp2);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB3PCOT.Caption, Temp3);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB4PCOT.Caption, Temp4);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB5PCOT.Caption, Temp5);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB6PCOT.Caption, Temp6);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB7PCOT.Caption, Temp7);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB8PCOT.Caption, Temp8);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB9PCOT.Caption, Temp9);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB10PCOT.Caption, Temp10);

      ValueAverage := (Temp1 + Temp2 + Temp3 + Temp4 + Temp5 + Temp6 + Temp7 + Temp8 + Temp9 + Temp10) / 10;
      frmPCOTFilteringDeviations.lblAverageTempPCOT.Caption := FloatToStr(ValueAverage);

      ValueDev := Temp4 - ValueAverage;
      frmPCOTFilteringDeviations.lblA4PCOT.Caption := FormatFloat('0.0', ValueDev);

      dev := StrToFloatDef(frmPCOTFilteringDeviations.lblA4PCOT.Caption, 0);

      if dev < 0 then
      begin
        offset := Round((Abs(dev) / MaxDeviasiPCOT) * (TopMinPCOT - TopZeroPCOT));
        frmPCOTFilteringDeviations.pnlGrafik4.Top := TopZeroPCOT + offset;
        grafikHeight := Round((Abs(dev) / MaxDeviasiPCOT) * MaxHeightPCOT);
      end
      else if dev > 0 then
      begin
        offset := Round((dev / MaxDeviasiPCOT) * (TopZeroPCOT - TopMaxPCOT));
        frmPCOTFilteringDeviations.pnlGrafik4.Top := TopZero - offset;
        grafikHeight := Round((dev / MaxDeviasiPCOT) * MaxHeightPCOT);
      end
      else
      begin
        frmPCOTFilteringDeviations.pnlGrafik4.Top := TopZeroPCOT;
        grafikHeight := 1;
      end;
        frmPCOTFilteringDeviations.pnlGrafik4.Height := Max(grafikHeight, 1);

      // PCOT History
      if Assigned(frmPCOtValueHistory) then
        frmPCOtValueHistory.lblA4PCOT.Caption := FloatToStr(Value /10);
    end;
    epPCSMETempConRodBear5 :
    begin
      if Assigned(frmCrankpinOilTemperature) then
        frmCrankpinOilTemperature.lblB5Crankpin.Caption := FloatToStr(Value /10);

      Temp5 := Value /10;

      TryStrToFloat(frmCrankpinOilTemperature.lblB1Crankpin.Caption, Temp1);
      TryStrToFloat(frmCrankpinOilTemperature.lblB2Crankpin.Caption, Temp2);
      TryStrToFloat(frmCrankpinOilTemperature.lblB3Crankpin.Caption, Temp3);
      TryStrToFloat(frmCrankpinOilTemperature.lblB4Crankpin.Caption, Temp4);
      TryStrToFloat(frmCrankpinOilTemperature.lblB5Crankpin.Caption, Temp5);
      TryStrToFloat(frmCrankpinOilTemperature.lblB6Crankpin.Caption, Temp6);
      TryStrToFloat(frmCrankpinOilTemperature.lblB7Crankpin.Caption, Temp7);
      TryStrToFloat(frmCrankpinOilTemperature.lblB8Crankpin.Caption, Temp8);
      TryStrToFloat(frmCrankpinOilTemperature.lblB9Crankpin.Caption, Temp9);
      TryStrToFloat(frmCrankpinOilTemperature.lblB10Crankpin.Caption, Temp10);

      ValueAverage := (Temp1 + Temp2 + Temp3 + Temp4 + Temp5 + Temp6 + Temp7 + Temp8 + Temp9 + Temp10) / 10;
      frmCrankpinOilTemperature.lblAverageTempPCOT.Caption := FloatToStr(ValueAverage);

      ValueDev := Temp5 - ValueAverage;
      frmCrankpinOilTemperature.lblA5Crankpin.Caption := FormatFloat('0.0', ValueDev);

      dev := StrToIntDef(frmCrankpinOilTemperature.lblA5Crankpin.Caption, 0);

      if dev < 0 then
      begin
        offset := Round((Abs(dev) / MaxDeviasiPCOT) * (TopMinPCOT - TopZeroPCOT));
        frmCrankpinOilTemperature.pnlGrafik5.Top := TopMinPCOT + offset;
        grafikHeight := Round((Abs(dev) / MaxDeviasi) * MaxHeight);
      end
      else if dev > 0 then
      begin
        offset := Round((dev / MaxDeviasiPCOT) * (TopZeroPCOT - TopMaxPCOT));
        frmCrankpinOilTemperature.pnlGrafik5.Top := TopMinPCOT - offset;
        grafikHeight := Round((dev / MaxDeviasiPCOT) * MaxHeightPCOT);
      end
      else
      begin
        frmCrankpinOilTemperature.pnlGrafik5.Top := TopZeroPCOT;
        grafikHeight := 1;
      end;
        frmCrankpinOilTemperature.pnlGrafik5.Height := Max(grafikHeight, 1);

      // PCOT
      if Assigned(frmPCOTFilteringDeviations) then
        frmPCOTFilteringDeviations.lblB5PCOT.Caption := FloatToStr(Value /10);

      Temp5 := Value /10;

      TryStrToFloat(frmPCOTFilteringDeviations.lblB1PCOT.Caption, Temp1);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB2PCOT.Caption, Temp2);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB3PCOT.Caption, Temp3);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB4PCOT.Caption, Temp4);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB5PCOT.Caption, Temp5);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB6PCOT.Caption, Temp6);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB7PCOT.Caption, Temp7);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB8PCOT.Caption, Temp8);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB9PCOT.Caption, Temp9);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB10PCOT.Caption, Temp10);

      ValueAverage := (Temp1 + Temp2 + Temp3 + Temp4 + Temp5 + Temp6 + Temp7 + Temp8 + Temp9 + Temp10) / 10;
      frmPCOTFilteringDeviations.lblAverageTempPCOT.Caption := FloatToStr(ValueAverage);

      ValueDev := Temp5 - ValueAverage;
      frmPCOTFilteringDeviations.lblA5PCOT.Caption := FormatFloat('0.0', ValueDev);

      dev := StrToFloatDef(frmPCOTFilteringDeviations.lblA5PCOT.Caption, 0);

      if dev < 0 then
      begin
        offset := Round((Abs(dev) / MaxDeviasiPCOT) * (TopMinPCOT - TopZeroPCOT));
        frmPCOTFilteringDeviations.pnlGrafik5.Top := TopZeroPCOT + offset;
        grafikHeight := Round((Abs(dev) / MaxDeviasiPCOT) * MaxHeightPCOT);
      end
      else if deviasi > 0 then
      begin
        offset := Round((dev / MaxDeviasiPCOT) * (TopZeroPCOT - TopMaxPCOT));
        frmPCOTFilteringDeviations.pnlGrafik5.Top := TopZeroPCOT - offset;
        grafikHeight := Round((dev / MaxDeviasiPCOT) * MaxHeightPCOT);
      end
      else
      begin
        frmPCOTFilteringDeviations.pnlGrafik5.Top := TopZeroPCOT;
        grafikHeight := 1;
      end;
        frmPCOTFilteringDeviations.pnlGrafik5.Height := Max(grafikHeight, 1);

      // PCOT History
      if Assigned(frmPCOtValueHistory) then
        frmPCOtValueHistory.lblA5PCOT.Caption := FloatToStr(Value /10);
    end;
    epPCSMETempConRodBear6 :
    begin
      if Assigned(frmCrankpinOilTemperature) then
        frmCrankpinOilTemperature.lblB6Crankpin.Caption := FloatToStr(Value /10);

      Temp6 := Value /10;

      TryStrToFloat(frmCrankpinOilTemperature.lblB1Crankpin.Caption, Temp1);
      TryStrToFloat(frmCrankpinOilTemperature.lblB2Crankpin.Caption, Temp2);
      TryStrToFloat(frmCrankpinOilTemperature.lblB3Crankpin.Caption, Temp3);
      TryStrToFloat(frmCrankpinOilTemperature.lblB4Crankpin.Caption, Temp4);
      TryStrToFloat(frmCrankpinOilTemperature.lblB5Crankpin.Caption, Temp5);
      TryStrToFloat(frmCrankpinOilTemperature.lblB6Crankpin.Caption, Temp6);
      TryStrToFloat(frmCrankpinOilTemperature.lblB7Crankpin.Caption, Temp7);
      TryStrToFloat(frmCrankpinOilTemperature.lblB8Crankpin.Caption, Temp8);
      TryStrToFloat(frmCrankpinOilTemperature.lblB9Crankpin.Caption, Temp9);
      TryStrToFloat(frmCrankpinOilTemperature.lblB10Crankpin.Caption, Temp10);

      ValueAverage := (Temp1 + Temp2 + Temp3 + Temp4 + Temp5 + Temp6 + Temp7 + Temp8 + Temp9 + Temp10) / 10;
      frmCrankpinOilTemperature.lblAverageTempPCOT.Caption := FloatToStr(ValueAverage);

      ValueDev := Temp6 - ValueAverage;
      frmCrankpinOilTemperature.lblA6Crankpin.Caption := FormatFloat('0.0', ValueDev);

      dev := StrToFloatDef(frmCrankpinOilTemperature.lblA6Crankpin.Caption, 0);

      if dev < 0 then
      begin
        offset := Round((Abs(dev) / MaxDeviasiPCOT) * (TopMinPCOT - TopZeroPCOT));
        frmCrankpinOilTemperature.pnlGrafik6.Top := TopZeroPCOT + offset;
        grafikHeight := Round((Abs(dev) / MaxDeviasiPCOT) * MaxHeightPCOT);
      end
      else if deviasi > 0 then
      begin
        offset := Round((dev / MaxDeviasiPCOT) * (TopZeroPCOT - TopMaxPCOT));
        frmCrankpinOilTemperature.pnlGrafik6.Top := TopZeroPCOT - offset;
        grafikHeight := Round((dev / MaxDeviasiPCOT) * MaxHeightPCOT);
      end
      else
      begin
        frmCrankpinOilTemperature.pnlGrafik6.Top := TopZeroPCOT;
        grafikHeight := 1;
      end;
        frmCrankpinOilTemperature.pnlGrafik6.Height := Max(grafikHeight, 1);

      // PCOT
      if Assigned(frmPCOTFilteringDeviations) then
        frmPCOTFilteringDeviations.lblB6PCOT.Caption := FloatToStr(Value /10);

      Temp6 := Value /10;

      TryStrToFloat(frmPCOTFilteringDeviations.lblB1PCOT.Caption, Temp1);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB2PCOT.Caption, Temp2);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB3PCOT.Caption, Temp3);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB4PCOT.Caption, Temp4);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB5PCOT.Caption, Temp5);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB6PCOT.Caption, Temp6);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB7PCOT.Caption, Temp7);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB8PCOT.Caption, Temp8);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB9PCOT.Caption, Temp9);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB10PCOT.Caption, Temp10);

      ValueAverage := (Temp1 + Temp2 + Temp3 + Temp4 + Temp5 + Temp6 + Temp7 + Temp8 + Temp9 + Temp10) / 10;
      frmPCOTFilteringDeviations.lblAverageTempPCOT.Caption := FloatToStr(ValueAverage);

      ValueDev := Temp6 - ValueAverage;
      frmPCOTFilteringDeviations.lblA6PCOT.Caption := FormatFloat('0.0', ValueDev);

      dev := StrToFloatDef(frmPCOTFilteringDeviations.lblA6PCOT.Caption, 0);

      if dev < 0 then
      begin
        offset := Round((Abs(dev) / MaxDeviasiPCOT) * (TopMinPCOT - TopZeroPCOT));
        frmPCOTFilteringDeviations.pnlGrafik6.Top := TopZeroPCOT + offset;
        grafikHeight := Round((Abs(dev) / MaxDeviasiPCOT) * MaxHeightPCOT);
      end
      else if deviasi > 0 then
      begin
        offset := Round((dev / MaxDeviasiPCOT) * (TopZeroPCOT - TopMaxPCOT));
        frmPCOTFilteringDeviations.pnlGrafik6.Top := TopZeroPCOT - offset;
        grafikHeight := Round((dev / MaxDeviasiPCOT) * MaxHeightPCOT);
      end
      else
      begin
        frmPCOTFilteringDeviations.pnlGrafik6.Top := TopZeroPCOT;
        grafikHeight := 1;
      end;
        frmPCOTFilteringDeviations.pnlGrafik6.Height := Max(grafikHeight, 1);

      // PCOT History
      if Assigned(frmPCOtValueHistory) then
        frmPCOtValueHistory.lblA6PCOT.Caption := FloatToStr(Value /10);
    end;
    epPCSMETempConRodBear7 :
    begin
      if Assigned(frmCrankpinOilTemperature) then
        frmCrankpinOilTemperature.lblB7Crankpin.Caption := FloatToStr(Value /10);

      Temp7 := Value /10;

      TryStrToFloat(frmCrankpinOilTemperature.lblB1Crankpin.Caption, Temp1);
      TryStrToFloat(frmCrankpinOilTemperature.lblB2Crankpin.Caption, Temp2);
      TryStrToFloat(frmCrankpinOilTemperature.lblB3Crankpin.Caption, Temp3);
      TryStrToFloat(frmCrankpinOilTemperature.lblB4Crankpin.Caption, Temp4);
      TryStrToFloat(frmCrankpinOilTemperature.lblB5Crankpin.Caption, Temp5);
      TryStrToFloat(frmCrankpinOilTemperature.lblB6Crankpin.Caption, Temp6);
      TryStrToFloat(frmCrankpinOilTemperature.lblB7Crankpin.Caption, Temp7);
      TryStrToFloat(frmCrankpinOilTemperature.lblB8Crankpin.Caption, Temp8);
      TryStrToFloat(frmCrankpinOilTemperature.lblB9Crankpin.Caption, Temp9);
      TryStrToFloat(frmCrankpinOilTemperature.lblB10Crankpin.Caption, Temp10);

      ValueAverage := (Temp1 + Temp2 + Temp3 + Temp4 + Temp5 + Temp6 + Temp7 + Temp8 + Temp9 + Temp10) / 10;
      frmCrankpinOilTemperature.lblAverageTempPCOT.Caption := FloatToStr(ValueAverage);

      ValueDev := Temp7 - ValueAverage;
      frmCrankpinOilTemperature.lblA7Crankpin.Caption := FormatFloat('0.0', ValueDev);

      dev := StrToFloatDef(frmCrankpinOilTemperature.lblA7Crankpin.Caption, 0);

      if dev < 0 then
      begin
        offset := Round((Abs(dev) / MaxDeviasiPCOT) * (TopMinPCOT - TopZeroPCOT));
        frmCrankpinOilTemperature.pnlGrafik7.Top := TopZeroPCOT + offset;
        grafikHeight := Round((Abs(dev) / MaxDeviasiPCOT) * MaxHeightPCOT);
      end
      else if deviasi > 0 then
      begin
        offset := Round((dev / MaxDeviasiPCOT) * (TopZeroPCOT - TopMaxPCOT));
        frmCrankpinOilTemperature.pnlGrafik7.Top := TopZeroPCOT - offset;
        grafikHeight := Round((dev / MaxDeviasiPCOT) * MaxHeightPCOT);
      end
      else
      begin
        frmCrankpinOilTemperature.pnlGrafik7.Top := TopZeroPCOT;
        grafikHeight := 1;
      end;
        frmCrankpinOilTemperature.pnlGrafik7.Height := Max(grafikHeight, 1);

      // PCOT
      if Assigned(frmPCOTFilteringDeviations) then
        frmPCOTFilteringDeviations.lblB7PCOT.Caption := FloatToStr(Value /10);

      Temp7 := Value /10;

      TryStrToFloat(frmPCOTFilteringDeviations.lblB1PCOT.Caption, Temp1);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB2PCOT.Caption, Temp2);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB3PCOT.Caption, Temp3);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB4PCOT.Caption, Temp4);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB5PCOT.Caption, Temp5);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB6PCOT.Caption, Temp6);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB7PCOT.Caption, Temp7);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB8PCOT.Caption, Temp8);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB9PCOT.Caption, Temp9);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB10PCOT.Caption, Temp10);

      ValueAverage := (Temp1 + Temp2 + Temp3 + Temp4 + Temp5 + Temp6 + Temp7 + Temp8 + Temp9 + Temp10) / 10;
      frmPCOTFilteringDeviations.lblAverageTempPCOT.Caption := FloatToStr(ValueAverage);

      ValueDev := Temp7 - ValueAverage;
      frmPCOTFilteringDeviations.lblA7PCOT.Caption := FormatFloat('0.0', ValueDev);

      dev := StrToFloatDef(frmPCOTFilteringDeviations.lblA7PCOT.Caption, 0);

      if dev < 0 then
      begin
        offset := Round((Abs(dev) / MaxDeviasiPCOT) * (TopMinPCOT - TopZeroPCOT));
        frmPCOTFilteringDeviations.pnlGrafik7.Top := TopZeroPCOT + offset;
        grafikHeight := Round((Abs(dev) / MaxDeviasiPCOT) * MaxHeightPCOT);
      end
      else if deviasi > 0 then
      begin
        offset := Round((dev / MaxDeviasiPCOT) * (TopZeroPCOT - TopMaxPCOT));
        frmPCOTFilteringDeviations.pnlGrafik7.Top := TopZeroPCOT - offset;
        grafikHeight := Round((dev / MaxDeviasiPCOT) * MaxHeightPCOT);
      end
      else
      begin
        frmPCOTFilteringDeviations.pnlGrafik7.Top := TopZeroPCOT;
        grafikHeight := 1;
      end;
        frmPCOTFilteringDeviations.pnlGrafik7.Height := Max(grafikHeight, 1);

      // PCOT History
      if Assigned(frmPCOtValueHistory) then
        frmPCOtValueHistory.lblA7PCOT.Caption := FloatToStr(Value /10);
    end;
    epPCSMETempConRodBear8 :
    begin
      if Assigned(frmCrankpinOilTemperature) then
        frmCrankpinOilTemperature.lblB8Crankpin.Caption := FloatToStr(Value /10);

      Temp8 := Value /10;

      TryStrToFloat(frmCrankpinOilTemperature.lblB1Crankpin.Caption, Temp1);
      TryStrToFloat(frmCrankpinOilTemperature.lblB2Crankpin.Caption, Temp2);
      TryStrToFloat(frmCrankpinOilTemperature.lblB3Crankpin.Caption, Temp3);
      TryStrToFloat(frmCrankpinOilTemperature.lblB4Crankpin.Caption, Temp4);
      TryStrToFloat(frmCrankpinOilTemperature.lblB5Crankpin.Caption, Temp5);
      TryStrToFloat(frmCrankpinOilTemperature.lblB6Crankpin.Caption, Temp6);
      TryStrToFloat(frmCrankpinOilTemperature.lblB7Crankpin.Caption, Temp7);
      TryStrToFloat(frmCrankpinOilTemperature.lblB8Crankpin.Caption, Temp8);
      TryStrToFloat(frmCrankpinOilTemperature.lblB9Crankpin.Caption, Temp9);
      TryStrToFloat(frmCrankpinOilTemperature.lblB10Crankpin.Caption, Temp10);

      ValueAverage := (Temp1 + Temp2 + Temp3 + Temp4 + Temp5 + Temp6 + Temp7 + Temp8 + Temp9 + Temp10) / 10;
      frmCrankpinOilTemperature.lblAverageTempPCOT.Caption := FloatToStr(ValueAverage);

      ValueDev := Temp8 - ValueAverage;
      frmCrankpinOilTemperature.lblA8Crankpin.Caption := FormatFloat('0.0', ValueDev);

      dev := StrToFloatDef(frmCrankpinOilTemperature.lblA8Crankpin.Caption, 0);

      if dev < 0 then
      begin
        offset := Round((Abs(dev) / MaxDeviasiPCOT) * (TopMinPCOT - TopZeroPCOT));
        frmCrankpinOilTemperature.pnlGrafik8.Top := TopZeroPCOT + offset;
        grafikHeight := Round((Abs(dev) / MaxDeviasiPCOT) * MaxHeightPCOT);
      end
      else if deviasi > 0 then
      begin
        offset := Round((dev / MaxDeviasiPCOT) * (TopZeroPCOT - TopMaxPCOT));
        frmCrankpinOilTemperature.pnlGrafik8.Top := TopZeroPCOT - offset;
        grafikHeight := Round((dev / MaxDeviasiPCOT) * MaxHeightPCOT);
      end
      else
      begin
        frmCrankpinOilTemperature.pnlGrafik8.Top := TopZeroPCOT;
        grafikHeight := 1;
      end;
        frmCrankpinOilTemperature.pnlGrafik8.Height := Max(grafikHeight, 1);

      // PCOT
      if Assigned(frmPCOTFilteringDeviations) then
        frmPCOTFilteringDeviations.lblB8PCOT.Caption := FloatToStr(Value /10);

      Temp8 := Value /10;

      TryStrToFloat(frmPCOTFilteringDeviations.lblB1PCOT.Caption, Temp1);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB2PCOT.Caption, Temp2);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB3PCOT.Caption, Temp3);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB4PCOT.Caption, Temp4);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB5PCOT.Caption, Temp5);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB6PCOT.Caption, Temp6);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB7PCOT.Caption, Temp7);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB8PCOT.Caption, Temp8);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB9PCOT.Caption, Temp9);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB10PCOT.Caption, Temp10);

      ValueAverage := (Temp1 + Temp2 + Temp3 + Temp4 + Temp5 + Temp6 + Temp7 + Temp8 + Temp9 + Temp10) / 10;
      frmPCOTFilteringDeviations.lblAverageTempPCOT.Caption := FloatToStr(ValueAverage);

      ValueDev := Temp8 - ValueAverage;
      frmPCOTFilteringDeviations.lblA8PCOT.Caption := FormatFloat('0.0', ValueDev);

      dev := StrToFloatDef(frmPCOTFilteringDeviations.lblA8PCOT.Caption, 0);

      if dev < 0 then
      begin
        offset := Round((Abs(dev) / MaxDeviasiPCOT) * (TopMinPCOT - TopZeroPCOT));
        frmPCOTFilteringDeviations.pnlGrafik8.Top := TopZeroPCOT + offset;
        grafikHeight := Round((Abs(dev) / MaxDeviasiPCOT) * MaxHeightPCOT);
      end
      else if deviasi > 0 then
      begin
        offset := Round((dev / MaxDeviasiPCOT) * (TopZeroPCOT - TopMaxPCOT));
        frmPCOTFilteringDeviations.pnlGrafik8.Top := TopZeroPCOT - offset;
        grafikHeight := Round((dev / MaxDeviasiPCOT) * MaxHeightPCOT);
      end
      else
      begin
        frmPCOTFilteringDeviations.pnlGrafik8.Top := TopZeroPCOT;
        grafikHeight := 1;
      end;
        frmPCOTFilteringDeviations.pnlGrafik8.Height := Max(grafikHeight, 1);

      // PCOT History
      if Assigned(frmPCOtValueHistory) then
        frmPCOtValueHistory.lblA8PCOT.Caption := FloatToStr(Value /10);
    end;
    epPCSMETempConRodBear9 :
    begin
      if Assigned(frmCrankpinOilTemperature) then
        frmCrankpinOilTemperature.lblB9Crankpin.Caption := FloatToStr(Value /10);

      Temp9 := Value /10;

      TryStrToFloat(frmCrankpinOilTemperature.lblB1Crankpin.Caption, Temp1);
      TryStrToFloat(frmCrankpinOilTemperature.lblB2Crankpin.Caption, Temp2);
      TryStrToFloat(frmCrankpinOilTemperature.lblB3Crankpin.Caption, Temp3);
      TryStrToFloat(frmCrankpinOilTemperature.lblB4Crankpin.Caption, Temp4);
      TryStrToFloat(frmCrankpinOilTemperature.lblB5Crankpin.Caption, Temp5);
      TryStrToFloat(frmCrankpinOilTemperature.lblB6Crankpin.Caption, Temp6);
      TryStrToFloat(frmCrankpinOilTemperature.lblB7Crankpin.Caption, Temp7);
      TryStrToFloat(frmCrankpinOilTemperature.lblB8Crankpin.Caption, Temp8);
      TryStrToFloat(frmCrankpinOilTemperature.lblB9Crankpin.Caption, Temp9);
      TryStrToFloat(frmCrankpinOilTemperature.lblB10Crankpin.Caption, Temp10);

      ValueAverage := (Temp1 + Temp2 + Temp3 + Temp4 + Temp5 + Temp6 + Temp7 + Temp8 + Temp9 + Temp10) / 10;
      frmCrankpinOilTemperature.lblAverageTempPCOT.Caption := FloatToStr(ValueAverage);

      ValueDev := Temp9 - ValueAverage;
      frmCrankpinOilTemperature.lblA9Crankpin.Caption := FormatFloat('0.0', ValueDev);

      dev := StrToFloatDef(frmCrankpinOilTemperature.lblA9Crankpin.Caption, 0);

      if dev < 0 then
      begin
        offset := Round((Abs(dev) / MaxDeviasiPCOT) * (TopMinPCOT - TopZeroPCOT));
        frmCrankpinOilTemperature.pnlGrafik9.Top := TopZeroPCOT + offset;
        grafikHeight := Round((Abs(dev) / MaxDeviasiPCOT) * MaxHeightPCOT);
      end
      else if deviasi > 0 then
      begin
        offset := Round((dev / MaxDeviasiPCOT) * (TopZeroPCOT - TopMaxPCOT));
        frmCrankpinOilTemperature.pnlGrafik9.Top := TopZeroPCOT - offset;
        grafikHeight := Round((dev / MaxDeviasiPCOT) * MaxHeightPCOT);
      end
      else
      begin
        frmCrankpinOilTemperature.pnlGrafik9.Top := TopZeroPCOT;
        grafikHeight := 1;
      end;
        frmCrankpinOilTemperature.pnlGrafik9.Height := Max(grafikHeight, 1);

      // PCOT
      if Assigned(frmPCOTFilteringDeviations) then
        frmPCOTFilteringDeviations.lblB9PCOT.Caption := FloatToStr(Value /10);

      Temp9 := Value /10;

      TryStrToFloat(frmPCOTFilteringDeviations.lblB1PCOT.Caption, Temp1);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB2PCOT.Caption, Temp2);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB3PCOT.Caption, Temp3);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB4PCOT.Caption, Temp4);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB5PCOT.Caption, Temp5);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB6PCOT.Caption, Temp6);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB7PCOT.Caption, Temp7);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB8PCOT.Caption, Temp8);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB9PCOT.Caption, Temp9);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB10PCOT.Caption, Temp10);

      ValueAverage := (Temp1 + Temp2 + Temp3 + Temp4 + Temp5 + Temp6 + Temp7 + Temp8 + Temp9 + Temp10) / 10;
      frmPCOTFilteringDeviations.lblAverageTempPCOT.Caption := FloatToStr(ValueAverage);

      ValueDev := Temp9 - ValueAverage;
      frmPCOTFilteringDeviations.lblA9PCOT.Caption := FormatFloat('0.0', ValueDev);

      dev := StrToFloatDef(frmPCOTFilteringDeviations.lblA9PCOT.Caption, 0);

      if dev < 0 then
      begin
        offset := Round((Abs(dev) / MaxDeviasiPCOT) * (TopMinPCOT - TopZeroPCOT));
        frmPCOTFilteringDeviations.pnlGrafik9.Top := TopZeroPCOT + offset;
        grafikHeight := Round((Abs(dev) / MaxDeviasiPCOT) * MaxHeightPCOT);
      end
      else if deviasi > 0 then
      begin
        offset := Round((dev / MaxDeviasiPCOT) * (TopZeroPCOT - TopMaxPCOT));
        frmPCOTFilteringDeviations.pnlGrafik9.Top := TopZeroPCOT - offset;
        grafikHeight := Round((dev / MaxDeviasiPCOT) * MaxHeightPCOT);
      end
      else
      begin
        frmPCOTFilteringDeviations.pnlGrafik9.Top := TopZeroPCOT;
        grafikHeight := 1;
      end;
        frmPCOTFilteringDeviations.pnlGrafik9.Height := Max(grafikHeight, 1);

      // PCOT History
      if Assigned(frmPCOtValueHistory) then
        frmPCOtValueHistory.lblA9PCOT.Caption := FloatToStr(Value /10);
    end;
    epPCSMETempConRodBear10 :
    begin
      if Assigned(frmCrankpinOilTemperature) then
        frmCrankpinOilTemperature.lblB10Crankpin.Caption := FloatToStr(Value /10);

      Temp10 := Value /10;

      TryStrToFloat(frmCrankpinOilTemperature.lblB1Crankpin.Caption, Temp1);
      TryStrToFloat(frmCrankpinOilTemperature.lblB2Crankpin.Caption, Temp2);
      TryStrToFloat(frmCrankpinOilTemperature.lblB3Crankpin.Caption, Temp3);
      TryStrToFloat(frmCrankpinOilTemperature.lblB4Crankpin.Caption, Temp4);
      TryStrToFloat(frmCrankpinOilTemperature.lblB5Crankpin.Caption, Temp5);
      TryStrToFloat(frmCrankpinOilTemperature.lblB6Crankpin.Caption, Temp6);
      TryStrToFloat(frmCrankpinOilTemperature.lblB7Crankpin.Caption, Temp7);
      TryStrToFloat(frmCrankpinOilTemperature.lblB8Crankpin.Caption, Temp8);
      TryStrToFloat(frmCrankpinOilTemperature.lblB9Crankpin.Caption, Temp9);
      TryStrToFloat(frmCrankpinOilTemperature.lblB10Crankpin.Caption, Temp10);

      ValueAverage := (Temp1 + Temp2 + Temp3 + Temp4 + Temp5 + Temp6 + Temp7 + Temp8 + Temp9 + Temp10) / 10;
      frmCrankpinOilTemperature.lblAverageTempPCOT.Caption := FloatToStr(ValueAverage);

      ValueDev := Temp10 - ValueAverage;
      frmCrankpinOilTemperature.lblA10Crankpin.Caption := FormatFloat('0.0', ValueDev);

      dev := StrToFloatDef(frmCrankpinOilTemperature.lblA10Crankpin.Caption, 0);

      if dev < 0 then
      begin
        offset := Round((Abs(dev) / MaxDeviasiPCOT) * (TopMinPCOT - TopZeroPCOT));
        frmCrankpinOilTemperature.pnlGrafik10.Top := TopZeroPCOT + offset;
        grafikHeight := Round((Abs(dev) / MaxDeviasiPCOT) * MaxHeightPCOT);
      end
      else if deviasi > 0 then
      begin
        offset := Round((dev / MaxDeviasiPCOT) * (TopZeroPCOT - TopMaxPCOT));
        frmCrankpinOilTemperature.pnlGrafik10.Top := TopZeroPCOT - offset;
        grafikHeight := Round((dev / MaxDeviasiPCOT) * MaxHeightPCOT);
      end
      else
      begin
        frmCrankpinOilTemperature.pnlGrafik10.Top := TopZeroPCOT;
        grafikHeight := 1;
      end;
        frmCrankpinOilTemperature.pnlGrafik10.Height := Max(grafikHeight, 1);

      // PCOT
      if Assigned(frmPCOTFilteringDeviations) then
        frmPCOTFilteringDeviations.lblB10PCOT.Caption := FloatToStr(Value /10);

      Temp10 := Value /10;

      TryStrToFloat(frmPCOTFilteringDeviations.lblB1PCOT.Caption, Temp1);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB2PCOT.Caption, Temp2);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB3PCOT.Caption, Temp3);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB4PCOT.Caption, Temp4);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB5PCOT.Caption, Temp5);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB6PCOT.Caption, Temp6);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB7PCOT.Caption, Temp7);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB8PCOT.Caption, Temp8);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB9PCOT.Caption, Temp9);
      TryStrToFloat(frmPCOTFilteringDeviations.lblB10PCOT.Caption, Temp10);

      ValueAverage := (Temp1 + Temp2 + Temp3 + Temp4 + Temp5 + Temp6 + Temp7 + Temp8 + Temp9 + Temp10) / 10;
      frmPCOTFilteringDeviations.lblAverageTempPCOT.Caption := FloatToStr(ValueAverage);

      ValueDev := Temp10 - ValueAverage;
      frmPCOTFilteringDeviations.lblA10PCOT.Caption := FormatFloat('0.0', ValueDev);

      dev := StrToFloatDef(frmPCOTFilteringDeviations.lblA10PCOT.Caption, 0);

      if dev < 0 then
      begin
        offset := Round((Abs(dev) / MaxDeviasiPCOT) * (TopMinPCOT - TopZeroPCOT));
        frmPCOTFilteringDeviations.pnlGrafik10.Top := TopZeroPCOT + offset;
        grafikHeight := Round((Abs(dev) / MaxDeviasiPCOT) * MaxHeightPCOT);
      end
      else if dev > 0 then
      begin
        offset := Round((dev / MaxDeviasiPCOT) * (TopZeroPCOT - TopMaxPCOT));
        frmPCOTFilteringDeviations.pnlGrafik10.Top := TopZeroPCOT - offset;
        grafikHeight := Round((dev / MaxDeviasiPCOT) * MaxHeight);
      end
      else
      begin
        frmPCOTFilteringDeviations.pnlGrafik10.Top := TopZeroPCOT;
        grafikHeight := 1;
      end;
        frmPCOTFilteringDeviations.pnlGrafik10.Height := Max(grafikHeight, 1);

      // PCOT History
      if Assigned(frmPCOtValueHistory) then
        frmPCOtValueHistory.lblA10PCOT.Caption := FloatToStr(Value /10);
    end;
  end;
end;

procedure TfrmMainForm.tmrRunningMETimer1Timer(Sender: TObject);
begin
  if Assigned(frmSignalingLightME2) then
  begin
    if FIsRunningHours then
    begin
      Inc(CurrentHourCounter);
      frmSignalingLightME2.lblHoorCounter.Caption := IntToStr(CurrentHourCounter);
    end;
  end;

  FBlinkCounter := FBlinkCounter + tmrRunningMETimer1.Interval;
  FIsBlinkState := not FIsBlinkState;

  if FIsImageBlink then
     frmSetofPressureGaugesME2.imgFlashLighting.Visible := FIsBlinkState
  else
     frmSetofPressureGaugesME2.imgFlashLighting.Visible := False;
end;
end.
