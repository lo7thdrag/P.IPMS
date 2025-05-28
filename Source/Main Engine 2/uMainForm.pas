unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,

  uListener, uFreezeFrom, uDataType, Vcl.ExtCtrls;

type
  TfrmMainForm = class(TForm)
    tmrRunningMETimer1: TTimer;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tmrRunningMETimer1Timer(Sender: TObject);

  private
    FListener : TListeners;
    CurrentHourCounter: Integer;
    FIsRunningHours : Boolean;

    procedure MainEngine2SystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Integer);overload;
    procedure MainEngine2SystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Boolean);overload;
    procedure MainEngine2SystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Double);overload;

  public
    { Public declarations }
  end;

var
  frmMainForm: TfrmMainForm;

implementation

uses
  ufrmSetofPressureGaugesME2, ufrmSignalingLightME2, ufrmMenu, uMainEngine2System, ufrmSafetiesStop, ufrmAirGasCircuit, ufrmGeneralScreen;

{$R *.dfm}

procedure TfrmMainForm.FormCreate(Sender: TObject);
begin
  FListener := TListeners.Create;
  with MainEngine2System.Listener.Add('MAINENGINE 2') as TPropertyEventListener do
  begin
    OnPropertyIntChange  := MainEngine2SystemEvent;
    OnPropertyBoolChange := MainEngine2SystemEvent;
    OnPropertyDblChange  := MainEngine2SystemEvent;
  end;
end;

procedure TfrmMainForm.FormDestroy(Sender: TObject);
begin
  FListener.Free;
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
      if Value >= 0 then
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
      frmSignalingLightME2.vrtryswtchSpeedPS.SwitchPosition := Value;
    end;
    epPCSMESTCInManual :
    begin
      frmSignalingLightME2.vrtryswtchSTC_PS.SwitchPosition := Value;
    end;
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
      if Value then
        frmSafetiesStop.btnPS_SS_EmergencyShutdown.Color := clRed
      else
        frmSafetiesStop.btnPS_SS_EmergencyShutdown.Color := clBtnFace;
    end;
    epPCSMEOverspeedAlarm :
    begin
      if Value then
        frmSafetiesStop.btnPS_SS_Overspeed.Color := clRed
      else
        frmSafetiesStop.btnPS_SS_Overspeed.Color := clBtnFace;
    end;
    epPCSMELOPressVeryLow :
    begin
      if Value then
        frmSafetiesStop.btnPS_SS_EngInletLubOilVeryHigh.Color := clRed
      else
        frmSafetiesStop.btnPS_SS_EngInletLubOilVeryHigh.Color := clBtnFace;
    end;
    epPCSMERedGearSafetyStop :
    begin
      if Value then
        frmSafetiesStop.btnPS_SS_RedGearSafetyStop.Color := clRed
      else
        frmSafetiesStop.btnPS_SS_RedGearSafetyStop.Color := clBtnFace;
    end;
    epPCSMEFwHtExpTkLevelVeryLow :
    begin
      if Value then
        frmSafetiesStop.btnPS_SS_FwHtExpTkLevelVeryLow.Color := clRed
      else
        frmSafetiesStop.btnPS_SS_FwHtExpTkLevelVeryLow.Color := clBtnFace;
    end;
    epPCSMEFwTempVeryHigh :
    begin
      if Value then
        frmSafetiesStop.btnPS_SS_FwTempVeryHigh.Color := clRed
      else
        frmSafetiesStop.btnPS_SS_FwTempVeryHigh.Color := clBtnFace;
    end;
    epPCSMEConRodBearingTempVeryHigh :
    begin
      if Value then
        frmSafetiesStop.btnPS_SS_ConRodBearTempVeryHigh.Color := clRed
      else
        frmSafetiesStop.btnPS_SS_ConRodBearTempVeryHigh.Color := clBtnFace;
    end;
    epPCSMEEngInletLubOilVeryHigh :
    begin
      if Value then
        frmSafetiesStop.btnPS_SS_EngInletLubOilVeryHighTemperature.Color := clRed
      else
        frmSafetiesStop.btnPS_SS_EngInletLubOilVeryHighTemperature.Color := clBtnFace;
    end;
    epPCSMEOilMistDetSafety :
    begin
      if Value then
        frmSafetiesStop.btnPS_SS_OilMistDetHigh.Color := clRed
      else
        frmSafetiesStop.btnPS_SS_OilMistDetHigh.Color := clBtnFace;
    end;
    epPCSMETurningGearEngaged :
    begin
      if Value then
        frmSafetiesStop.btnPS_SI_TurningGearDisengaged.Color := clRed
      else
        frmSafetiesStop.btnPS_SI_TurningGearDisengaged.Color := clBtnFace;
    end;
    epPCSMEManHandleAtStop :
    begin
      if Value then
        frmSafetiesStop.btnPS_SI_ManHandleAtStop.Color := clRed
      else
        frmSafetiesStop.btnPS_SI_ManHandleAtStop.Color := clBtnFace;
    end;
    epPCSMEFuelRackAtStop :
    begin
      if Value then
        frmSafetiesStop.btnPS_SI_FuelRackAtStop.Color := clRed
      else
        frmSafetiesStop.btnPS_SI_FuelRackAtStop.Color := clBtnFace;
    end;
    epPCSMEPrelubInProgress :
    begin
      if Value then
        frmSafetiesStop.btnPS_SI_PrelubeInProgress.Color := clRed
      else
        frmSafetiesStop.btnPS_SI_PrelubeInProgress.Color := clBtnFace;
    end;
    epPCSMEPrelubricationFailure :
    begin
      if Value then
        frmSafetiesStop.btnPS_SI_PrelubeFailure.Color := clRed
      else
        frmSafetiesStop.btnPS_SI_PrelubeFailure.Color := clBtnFace;
    end;
    epPCSMEStartingFault :
    begin
      if Value then
        frmSafetiesStop.btnPS_SI_StartingFailure.Color := clRed
      else
        frmSafetiesStop.btnPS_SI_StartingFailure.Color := clBtnFace;
    end;
    epPCSMESTCSequenceFail :
    begin
      if Value then
        frmSafetiesStop.btnPS_SI_STCSequenceFail.Color := clRed
      else
        frmSafetiesStop.btnPS_SI_STCSequenceFail.Color := clBtnFace;
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
        frmSafetiesStop.btnPS_SI_SlowTurningFailure.Color := clBtnFace;
        frmGeneralScreen.btnPS_SI_SlowTurningFailure.Color := clBtnFace
      end;
    end;
    epPCSMESafetyShutdown :
    begin
      if Value then
        frmSafetiesStop.btnPS_SI_SafetyStop.Color := clRed
      else
        frmSafetiesStop.btnPS_SI_SafetyStop.Color := clBtnFace;
    end;
  end;
end;

procedure TfrmMainForm.MainEngine2SystemEvent(Sender: TObject; PropsID: E_PropsID; Value: Double);
begin
  case PropsID of
    epPCSMEPressFWHTInlet :
    begin
      if Assigned(frmSetofPressureGaugesME2) then
        frmSetofPressureGaugesME2.EngineInletFWPressureMeter.Position := Value
    end;
    epPCSMEPressAirInlet :
    begin
      if Assigned(frmSetofPressureGaugesME2) then
        frmSetofPressureGaugesME2.EngineInletAirPressureMeter.Position := Value
    end;

    // HMI
    epPCSMETurboChargerSpeedA :
    begin
      if Assigned(frmAirGasCircuit) then
        frmAirGasCircuit.lblTurboCharge1.Caption := FloatToStr(Value);
    end;
    epPCSMETurboChargerSpeedB :
    begin
      if Assigned(frmAirGasCircuit) then
        frmAirGasCircuit.lblTurboCharge2.Caption := FloatToStr(Value);
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
