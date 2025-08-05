unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, VrControls,
  VrRotarySwitch, RzBmpBtn, VrAngularMeter, Vcl.ExtCtrls,

  uSetting, uListener, uFreezeFrom, uDataType, uGenerator, uSwitchboard;

type
  TfrmMainForm = class(TForm)

    tmr1: TTimer;
    mmoNetLogger: TMemo;
    mmoLogReceive: TMemo;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private

//    FListener : TListeners;

    procedure MainSwitchBoardSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Integer);overload;
    procedure MainSwitchBoardSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Boolean);overload;
    procedure MainSwitchBoardSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Double);overload;
    procedure MainSwitchBoardSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : string);overload;
    procedure MainSwitchBoardSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : TObject);overload;

  public
    GeneratorTemp : TGenerator;
    SwitchboardTemp : TSwitchboard;

  end;

var
  frmMainForm: TfrmMainForm;

implementation

uses
  uTCPClient, uMainSwitchBoardSystem, ufrmGeneratorPanel, ufrmEmergencyPanel, ufrmShorePanel;

{$R *.dfm}

{$REGION ' Form Procedure '}

procedure TfrmMainForm.FormCreate(Sender: TObject);
begin
  Setting   := TSetting.Create;
  MainSwitchBoardSystem := TMainSwitchBoardSystem.Create;

//  FListener := TListeners.Create;
  with MainSwitchBoardSystem.Listener.Add('MAINSWITCHBOARD') as TPropertyEventListener do
  begin
    OnPropertyIntChange := MainSwitchBoardSystemEvent;
    OnPropertyBoolChange := MainSwitchBoardSystemEvent;
    OnPropertyDblChange := MainSwitchBoardSystemEvent;
  end;

  with MainSwitchBoardSystem.Network.Listeners.Add('MAINSWITCHBOARDNETWORK') as TPropertyEventListener do
  begin
    OnPropertyStringChange:= MainSwitchBoardSystemEvent;
    OnPropertyObjectChange:= MainSwitchBoardSystemEvent;
  end;

  {Create Generator Temporary}
  GeneratorTemp := TGenerator.Create;
  GeneratorTemp.Identifier := MainSwitchBoardSystem.IdGenerator;
  GeneratorTemp.GeneratorState := 1;

  if MainSwitchBoardSystem.IdGenerator = 'Shore Generator' then
  begin
    SwitchboardTemp := TSwitchboard.Create;
    SwitchboardTemp.Identifier := 'Switchboard Shore';
    SwitchboardTemp.ShoreInterconnectionMode := 1;
  end;
end;

procedure TfrmMainForm.FormDestroy(Sender: TObject);
begin
  GeneratorTemp.Destroy;

//  FListener.Free;
  MainSwitchBoardSystem.Free;
  Setting.Free;
end;

procedure TfrmMainForm.FormShow(Sender: TObject);
begin
  if MainSwitchBoardSystem.IdFormGensys = 'GENSYS' then
  begin
    if not Assigned(frmGeneratorPanel) then
      frmGeneratorPanel := TfrmGeneratorPanel.Create(Self);

    frmGeneratorPanel.Show;
  end
  else
  if MainSwitchBoardSystem.IdFormGensys = 'EMERGENCY' then
  begin
    if not Assigned(frmEmergencyPanel) then
      frmEmergencyPanel := TfrmEmergencyPanel.Create(Self);

    frmEmergencyPanel.Show;
  end
  else
  if MainSwitchBoardSystem.IdFormGensys = 'SHORE' then
  begin
    if not Assigned(frmShorePanel) then
      frmShorePanel := TfrmShorePanel.Create(Self);

    frmShorePanel.Show;
  end;
end;

{$ENDREGION}

{$REGION ' Event Procedure '}

procedure TfrmMainForm.MainSwitchBoardSystemEvent(Sender: TObject; PropsID: E_PropsID; Value: Integer);
begin
  case PropsID of
    epPMSFreezed:
    begin
      if Value = 1 then
      begin
        if Assigned(frmGeneratorPanel) then
        begin
          frmGeneratorPanel.Enabled := False;
          MainSwitchBoardSystem.FFormFreezed[0] := TfrmFreeze.Create(frmGeneratorPanel);
          with MainSwitchBoardSystem.FFormFreezed[0] do
          begin
            Parent := frmGeneratorPanel;
            Position := poOwnerFormCenter;
            BringToFront;
            Show;
          end;
        end;

        if Assigned(frmEmergencyPanel) then
        begin
          frmEmergencyPanel.Enabled := False;
          MainSwitchBoardSystem.FFormFreezed[0] := TfrmFreeze.Create(frmEmergencyPanel);
          with MainSwitchBoardSystem.FFormFreezed[0] do
          begin
            Parent := frmEmergencyPanel;
            Position := poOwnerFormCenter;
            BringToFront;
            Show;
          end;
        end;

        if Assigned(frmShorePanel) then
        begin
          frmShorePanel.Enabled := False;
          MainSwitchBoardSystem.FFormFreezed[0] := TfrmFreeze.Create(frmShorePanel);
          with MainSwitchBoardSystem.FFormFreezed[0] do
          begin
            Parent := frmShorePanel;
            Position := poOwnerFormCenter;
            BringToFront;
            Show;
          end;
        end;
      end
      else if Value = 0 then
      begin
        if Assigned(frmGeneratorPanel) then
        begin
          frmGeneratorPanel.Enabled := True;
          if Assigned(MainSwitchBoardSystem.FFormFreezed[0]) then
            FreeAndNil(MainSwitchBoardSystem.FFormFreezed[0]);
        end;

        if Assigned(frmEmergencyPanel) then
        begin
          frmEmergencyPanel.Enabled := True;
          if Assigned(MainSwitchBoardSystem.FFormFreezed[0]) then
            FreeAndNil(MainSwitchBoardSystem.FFormFreezed[0]);
        end;

        if Assigned(frmShorePanel) then
        begin
          frmShorePanel.Enabled := True;
          if Assigned(MainSwitchBoardSystem.FFormFreezed[0]) then
            FreeAndNil(MainSwitchBoardSystem.FFormFreezed[0]);
        end;
      end;
    end;
    epPMSGeneratorMode:
    begin
      GeneratorTemp.GeneratorMode := Value;

      if Assigned(frmGeneratorPanel) then
      begin
        frmGeneratorPanel.UpdateForm(GeneratorTemp);
      end;

      if Assigned(frmEmergencyPanel) then
      begin
        frmEmergencyPanel.UpdateForm(GeneratorTemp);
      end;
    end;
    epPMSGeneratorState:
    begin
      GeneratorTemp.GeneratorState := Value;

      if Assigned(frmGeneratorPanel) then
      begin
        frmGeneratorPanel.UpdateForm(GeneratorTemp);
      end;

      if Assigned(frmEmergencyPanel) then
      begin
        frmEmergencyPanel.UpdateForm(GeneratorTemp);
      end;
    end;
    epPMSMsbShoreMode:
    begin
      if Assigned(SwitchboardTemp) then
      begin
        SwitchboardTemp.ShoreInterconnectionMode := Value;
        if Assigned(frmShorePanel) then
        begin
          frmShorePanel.UpdateForm(SwitchboardTemp);
        end;
      end;
    end;
  end;
end;

procedure TfrmMainForm.MainSwitchBoardSystemEvent(Sender: TObject; PropsID: E_PropsID; Value: Boolean);
begin
  case PropsID of
    epPMSGeneratorEngineRun : GeneratorTemp.EngineRun := Value;
    epPMSGeneratorSupplied : GeneratorTemp.GeneratorSupplied := Value;
    epPMSGeneratorCBClosed : GeneratorTemp.CBClosed := Value;
    epPMSGeneratorPreference : GeneratorTemp.Preference := Value;
    epPMSGeneratorBusbar : GeneratorTemp.Busbar := Value;
    epPMSNotStandby :
    begin
      GeneratorTemp.NotStandby := Value;

      if Value then
      begin
        if Assigned(frmGeneratorPanel) then
        begin
          frmGeneratorPanel.AddAlarmToLog('DG not standby');
          frmGeneratorPanel.ImgIndicatorAP.Visible := Value;
          frmGeneratorPanel.ImgIndicatorHO.Visible := Value;
        end;

        if Assigned(frmEmergencyPanel) then
        begin
          frmEmergencyPanel.AddAlarmToLog('DG not standby');
          frmEmergencyPanel.ImgIndicatorAP.Visible := Value;
          frmEmergencyPanel.ImgIndicatorHO.Visible := Value;
        end;
      end;
    end;
    epPMSGeneratorFuelRunsOut : GeneratorTemp.FuelRunsOut := Value;
    epPMSGeneratorEmergencyStop : GeneratorTemp.EmergencyStop := Value;
    epPMSShutDown : GeneratorTemp.ShutDown := Value;
    epPMSFailureCBClosed : GeneratorTemp.FailureCBClosed := Value;

    {$REGION 'log Alarm & Fault'}

    epPMSMeasPowFailure:
    begin
      GeneratorTemp.MeasPowFailure := Value;
      if Value then
      begin
        if Assigned(frmGeneratorPanel) then
        begin
          frmGeneratorPanel.AddFaultToLog('Supply Voltage Low');
          frmGeneratorPanel.ImgIndicatorFP.Visible := Value;
          frmGeneratorPanel.ImgIndicatorHO.Visible := Value;

          frmGeneratorPanel.AddAlarmToLog('Supply Voltage Low');
          frmGeneratorPanel.ImgIndicatorAP.Visible := Value;
        end;

        if Assigned(frmEmergencyPanel) then
        begin
          frmEmergencyPanel.AddFaultToLog('Supply Voltage Low');
          frmEmergencyPanel.ImgIndicatorFP.Visible := Value;
          frmEmergencyPanel.ImgIndicatorHO.Visible := Value;

          frmEmergencyPanel.AddAlarmToLog('Supply Voltage Low');
          frmEmergencyPanel.ImgIndicatorAP.Visible := Value;
        end;
      end;
    end;

    epPMSAutStartFailure:
    begin
      GeneratorTemp.AutStartFailure := Value;
      if Value then
      begin
        if Assigned(frmGeneratorPanel) then
        begin
          frmGeneratorPanel.AddFaultToLog('Automatic Start Failed');
          frmGeneratorPanel.ImgIndicatorFP.Visible := Value;
          frmGeneratorPanel.ImgIndicatorHO.Visible := Value;

          frmGeneratorPanel.AddAlarmToLog('Automatic Start Failed');
          frmGeneratorPanel.ImgIndicatorAP.Visible := Value;
        end;

        if Assigned(frmEmergencyPanel) then
        begin
          frmEmergencyPanel.AddFaultToLog('Automatic Start Failed');
          frmEmergencyPanel.ImgIndicatorFP.Visible := Value;
          frmEmergencyPanel.ImgIndicatorHO.Visible := Value;

          frmEmergencyPanel.AddAlarmToLog('Automatic Start Failed');
          frmEmergencyPanel.ImgIndicatorAP.Visible := Value;
        end;
      end;
    end;

    epPMSSpeedSensorFailureAlrm:
    begin
      GeneratorTemp.SpeedSensorFailureAlrm := Value;
      if Value then
      begin
        if Assigned(frmGeneratorPanel) then
        begin
          frmGeneratorPanel.AddFaultToLog('Speed sensor failure');
          frmGeneratorPanel.ImgIndicatorFP.Visible := Value;
          frmGeneratorPanel.ImgIndicatorHO.Visible := Value;

          frmGeneratorPanel.AddAlarmToLog('Speed sensor failure');
          frmGeneratorPanel.ImgIndicatorAP.Visible := Value;
        end;

        if Assigned(frmEmergencyPanel) then
        begin
          frmEmergencyPanel.AddFaultToLog('Speed sensor failure');
          frmEmergencyPanel.ImgIndicatorFP.Visible := Value;
          frmEmergencyPanel.ImgIndicatorHO.Visible := Value;

          frmEmergencyPanel.AddAlarmToLog('Speed sensor failure');
          frmEmergencyPanel.ImgIndicatorAP.Visible := Value;
        end;
      end;
    end;

    epPMSLubOilPressLowAlrm:
    begin
      GeneratorTemp.LubOilPressLowAlrm := Value;
      if Value then
      begin
        if Assigned(frmGeneratorPanel) then
        begin
          frmGeneratorPanel.AddFaultToLog('Lub oil press low');
          frmGeneratorPanel.ImgIndicatorFP.Visible := Value;
          frmGeneratorPanel.ImgIndicatorHO.Visible := Value;

          frmGeneratorPanel.AddAlarmToLog('Lub oil press low');
          frmGeneratorPanel.ImgIndicatorAP.Visible := Value;
        end;

        if Assigned(frmEmergencyPanel) then
        begin
          frmEmergencyPanel.AddFaultToLog('Lub oil press low');
          frmEmergencyPanel.ImgIndicatorFP.Visible := Value;
          frmEmergencyPanel.ImgIndicatorHO.Visible := Value;

          frmEmergencyPanel.AddAlarmToLog('Lub oil press low');
          frmEmergencyPanel.ImgIndicatorAP.Visible := Value;
        end;
      end;
    end;

    epPMSLubOilTempHigh:
    begin
      GeneratorTemp.LubOilTempHigh := Value;
      if Value then
      begin
        if Assigned(frmGeneratorPanel) then
        begin
          frmGeneratorPanel.AddFaultToLog('Lub oil temp high');
          frmGeneratorPanel.ImgIndicatorFP.Visible := Value;
          frmGeneratorPanel.ImgIndicatorHO.Visible := Value;

          frmGeneratorPanel.AddAlarmToLog('Lub oil temp high');
          frmGeneratorPanel.ImgIndicatorAP.Visible := Value;
        end;

        if Assigned(frmEmergencyPanel) then
        begin
          frmEmergencyPanel.AddFaultToLog('Lub oil temp high');
          frmEmergencyPanel.ImgIndicatorFP.Visible := Value;
          frmEmergencyPanel.ImgIndicatorHO.Visible := Value;

          frmEmergencyPanel.AddAlarmToLog('Lub oil temp high');
          frmEmergencyPanel.ImgIndicatorAP.Visible := Value;
        end;
      end;
    end;

    epPMSCoolWaterTempHighAlrm:
    begin
      GeneratorTemp.CoolWaterTempHighAlrm := Value;
      if Value then
      begin
        if Assigned(frmGeneratorPanel) then
        begin
          frmGeneratorPanel.AddFaultToLog('Cooling water temp high');
          frmGeneratorPanel.ImgIndicatorFP.Visible := Value;
          frmGeneratorPanel.ImgIndicatorHO.Visible := Value;

          frmGeneratorPanel.AddAlarmToLog('Cooling water temp high');
          frmGeneratorPanel.ImgIndicatorAP.Visible := Value;
        end;

        if Assigned(frmEmergencyPanel) then
        begin
          frmEmergencyPanel.AddFaultToLog('Cooling water temp high');
          frmEmergencyPanel.ImgIndicatorFP.Visible := Value;
          frmEmergencyPanel.ImgIndicatorHO.Visible := Value;

          frmEmergencyPanel.AddAlarmToLog('Cooling water temp high');
          frmEmergencyPanel.ImgIndicatorAP.Visible := Value;
        end;
      end;
    end;

    epPMSCoolWaterLevelLow:
    begin
      GeneratorTemp.CoolWaterLevelLow := Value;
      if Value then
      begin
        if Assigned(frmGeneratorPanel) then
        begin
          frmGeneratorPanel.AddFaultToLog('Cooling water level low');
          frmGeneratorPanel.ImgIndicatorFP.Visible := Value;
          frmGeneratorPanel.ImgIndicatorHO.Visible := Value;

          frmGeneratorPanel.AddAlarmToLog('Cooling water level low');
          frmGeneratorPanel.ImgIndicatorAP.Visible := Value;
        end;

        if Assigned(frmEmergencyPanel) then
        begin
          frmEmergencyPanel.AddFaultToLog('Cooling water level low');
          frmEmergencyPanel.ImgIndicatorFP.Visible := Value;
          frmEmergencyPanel.ImgIndicatorHO.Visible := Value;

          frmEmergencyPanel.AddAlarmToLog('Cooling water level low');
          frmEmergencyPanel.ImgIndicatorAP.Visible := Value;
        end;
      end;
    end;

    epPMSFuelOilLeakage:
    begin
      GeneratorTemp.FuelOilLeakage := Value;
      if Value then
      begin
        if Assigned(frmGeneratorPanel) then
        begin
          frmGeneratorPanel.AddFaultToLog('Fuel oil leakage');
          frmGeneratorPanel.ImgIndicatorFP.Visible := Value;
          frmGeneratorPanel.ImgIndicatorHO.Visible := Value;

          frmGeneratorPanel.AddFaultToLog('Fuel oil leakage');
          frmGeneratorPanel.ImgIndicatorAP.Visible := Value;
        end;

        if Assigned(frmEmergencyPanel) then
        begin
          frmEmergencyPanel.AddFaultToLog('Fuel oil leakage');
          frmEmergencyPanel.ImgIndicatorFP.Visible := Value;
          frmEmergencyPanel.ImgIndicatorHO.Visible := Value;

          frmEmergencyPanel.AddAlarmToLog('Fuel oil leakage');
          frmEmergencyPanel.ImgIndicatorAP.Visible := Value;
        end;
      end;
    end;

    epPMSSpeedSensorFailureShutdown:
    begin
      GeneratorTemp.SpeedSensorFailureShutdown := Value;
      if Value then
      begin
        if Assigned(frmGeneratorPanel) then
        begin
          frmGeneratorPanel.AddFaultToLog('Speed sensor failure shutdown');
          frmGeneratorPanel.ImgIndicatorFP.Visible := Value;
          frmGeneratorPanel.ImgIndicatorHO.Visible := Value;

          frmGeneratorPanel.AddAlarmToLog('Speed sensor failure shutdown');
          frmGeneratorPanel.ImgIndicatorAP.Visible := Value;
        end;

        if Assigned(frmEmergencyPanel) then
        begin
          frmEmergencyPanel.AddFaultToLog('Speed sensor failure shutdown');
          frmEmergencyPanel.ImgIndicatorFP.Visible := Value;
          frmEmergencyPanel.ImgIndicatorHO.Visible := Value;

          frmEmergencyPanel.AddAlarmToLog('Speed sensor failure shutdown');
          frmEmergencyPanel.ImgIndicatorAP.Visible := Value;
        end;
      end;
    end;

    epPMSLubOilPressLowShutdown:
    begin
      GeneratorTemp.LubOilPressLowShutdown := Value;
      if Value then
      begin
        if Assigned(frmGeneratorPanel) then
        begin
          frmGeneratorPanel.AddFaultToLog('Lub oil press low shutdown');
          frmGeneratorPanel.ImgIndicatorFP.Visible := Value;
          frmGeneratorPanel.ImgIndicatorHO.Visible := Value;

          frmGeneratorPanel.AddAlarmToLog('Lub oil press low shutdown');
          frmGeneratorPanel.ImgIndicatorAP.Visible := Value;
        end;

        if Assigned(frmEmergencyPanel) then
        begin
          frmEmergencyPanel.AddFaultToLog('Lub oil press low shutdown');
          frmEmergencyPanel.ImgIndicatorFP.Visible := Value;
          frmEmergencyPanel.ImgIndicatorHO.Visible := Value;

          frmEmergencyPanel.AddAlarmToLog('Lub oil press low shutdown');
          frmEmergencyPanel.ImgIndicatorAP.Visible := Value;
        end;
      end;
    end;

    epPMSCoolWaterTempHighShutdown:
    begin
      GeneratorTemp.CoolWaterTempHighShutdown := Value;
      if Value then
      begin
        if Assigned(frmGeneratorPanel) then
        begin
          frmGeneratorPanel.AddFaultToLog('Cooling water temp high shutdown');
          frmGeneratorPanel.ImgIndicatorFP.Visible := Value;
          frmGeneratorPanel.ImgIndicatorHO.Visible := Value;

          frmGeneratorPanel.AddAlarmToLog('Cooling water temp high shutdown');
          frmGeneratorPanel.ImgIndicatorAP.Visible := Value;
        end;

        if Assigned(frmEmergencyPanel) then
        begin
          frmEmergencyPanel.AddFaultToLog('Cooling water temp high shutdown');
          frmEmergencyPanel.ImgIndicatorFP.Visible := Value;
          frmEmergencyPanel.ImgIndicatorHO.Visible := Value;

          frmEmergencyPanel.AddAlarmToLog('Cooling water temp high shutdown');
          frmEmergencyPanel.ImgIndicatorAP.Visible := Value;
        end;
      end;
    end;

    {$ENDREGION}

    epPMSMsbCBShore:
    begin
      if Assigned(SwitchboardTemp) then
      begin
        SwitchboardTemp.ShoresbCircuitBreaker := Value;
      end;
    end;
  end;


  if Assigned(frmGeneratorPanel) then
  begin
    frmGeneratorPanel.Generator := GeneratorTemp;
    frmGeneratorPanel.UpdateForm(GeneratorTemp);
  end;

  if Assigned(frmEmergencyPanel) then
  begin
    frmEmergencyPanel.Generator := GeneratorTemp;
    frmEmergencyPanel.UpdateForm(GeneratorTemp);
  end;

  if Assigned(frmShorePanel) then
  begin
    frmShorePanel.Switchboard := SwitchboardTemp;
    frmShorePanel.UpdateForm(SwitchboardTemp);
  end;
end;

procedure TfrmMainForm.MainSwitchBoardSystemEvent(Sender: TObject; PropsID: E_PropsID; Value: Double);
begin
  case PropsID of
    epPMSPower:
    begin
      if Assigned(frmGeneratorPanel) then
      begin
        GeneratorTemp.Power := Value;
        frmGeneratorPanel.Generator := GeneratorTemp;
        frmGeneratorPanel.VraPower.Position := Value;
      end;

      if Assigned(frmEmergencyPanel) then
      begin
        GeneratorTemp.Power := Value;
        frmEmergencyPanel.Generator := GeneratorTemp;
        frmEmergencyPanel.VraPower.Position := Value;
      end;

      if Assigned(frmShorePanel) then
      begin
        SwitchboardTemp.Power := Value;
        frmShorePanel.switchboard := SwitchboardTemp;
        frmShorePanel.VraPower.Position := -Value;
      end;
    end;
    epPMSFrequency:
    begin
      if Assigned(frmGeneratorPanel) then
      begin
        GeneratorTemp.Frequency := Value;
        frmGeneratorPanel.Generator := GeneratorTemp;
        frmGeneratorPanel.OrderFrequency := Value;
        frmGeneratorPanel.VraFrequency.Position := Value;
      end;

      if Assigned(frmShorePanel) then
      begin
//        GeneratorTemp.Frequency := Value;
//        frmShorePanel.Generator := GeneratorTemp;
        frmShorePanel.lblFrequency.Caption := FloatToStr(value) + ' Hz';
      end;
    end;
    epPMSVoltage:
    begin
      if Assigned(frmGeneratorPanel) then
      begin
        GeneratorTemp.Voltage := Value;
        frmGeneratorPanel.Generator := GeneratorTemp;
        frmGeneratorPanel.VraV.Position := Value;
      end;

      if Assigned(frmEmergencyPanel) then
      begin
        GeneratorTemp.Voltage := Value;
        frmEmergencyPanel.Generator := GeneratorTemp;
        frmEmergencyPanel.VraV.Position := Value;
      end;

      if Assigned(frmShorePanel) then
      begin
        frmShorePanel.lblVoltageBusbar.Caption := FloatToStr(value) + 'V';
      end;
    end;
    epPMSCurrent:
    begin
      if Assigned(frmGeneratorPanel) then
      begin
        GeneratorTemp.Current := Value;
        frmGeneratorPanel.Generator := GeneratorTemp;
        frmGeneratorPanel.OrderAmpere := Value;
        frmGeneratorPanel.vraAmpere1.Position := Value;
      end;

      if Assigned(frmEmergencyPanel) then
      begin
        GeneratorTemp.Current := Value;
        frmEmergencyPanel.Generator := GeneratorTemp;
        frmEmergencyPanel.OrderAmpere := Value;
        frmEmergencyPanel.tmrAmpere.Enabled := True;
      end;

      if Assigned(frmShorePanel) then
      begin
        frmShorePanel.OrderAmpere := Value;
        frmShorePanel.vraAmpere1.Position := Value;
        frmShorePanel.tmrAmpere.Enabled := True;
      end;
    end;
    epPMSCosPhi:
    begin
      if Assigned(frmGeneratorPanel) then
      begin
        GeneratorTemp.CosPhi := Value;
        frmGeneratorPanel.Generator := GeneratorTemp;
      end;

      if Assigned(frmEmergencyPanel) then
      begin
        GeneratorTemp.CosPhi := Value;
        frmEmergencyPanel.Generator := GeneratorTemp;
      end;
    end;
  end;

//  if Assigned(frmShorePanel) then
//  begin
//    frmShorePanel.Generator := GeneratorTemp;
//    frmShorePanel.UpdateForm{(GeneratorTemp)};
//  end;

end;

procedure TfrmMainForm.MainSwitchBoardSystemEvent(Sender: TObject; PropsID: E_PropsID; Value: string);
begin
	case PropsID of
	  epNetworkLogRcv: begin
	    if mmoLogReceive.Lines.Count>100 then
	      mmoLogReceive.Lines.Delete(0);
	    mmoLogReceive.Lines.Add(Value);
	  end;
	end;
end;

procedure TfrmMainForm.MainSwitchBoardSystemEvent(Sender: TObject; PropsID: E_PropsID; Value: TObject);
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

{$ENDREGION}

end.
