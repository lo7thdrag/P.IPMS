unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, VrControls,
  VrRotarySwitch, RzBmpBtn, VrAngularMeter, Vcl.ExtCtrls,

  uSetting, uListener, uFreezeFrom, uDataType, uGenerator;

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

  end;

var
  frmMainForm: TfrmMainForm;

implementation

uses
  uTCPClient, uMainSwitchBoardSystem, ufrmGeneratorPanel, ufrmEmergencyPanel, ufrmShorePanel;

{$R *.dfm}

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
    OnPropertyStringChange:= MainSwitchBoardSystemEvent;
  with MainSwitchBoardSystem.Network.Listeners.Add('MAINSWITCHBOARDNETWORK') as TPropertyEventListener do
    OnPropertyObjectChange:= MainSwitchBoardSystemEvent;


  {Create Generator Temporary}
  GeneratorTemp := TGenerator.Create;
  GeneratorTemp.Identifier := MainSwitchBoardSystem.IdGenerator;
  GeneratorTemp.GeneratorState := 1;
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
    epPMSNotStandby : GeneratorTemp.NotStandby := Value;
    epPMSGeneratorFuelRunsOut : GeneratorTemp.FuelRunsOut := Value;
    epPMSGeneratorEmergencyStop : GeneratorTemp.EmergencyStop := Value;
    epPMSShutDown : GeneratorTemp.ShutDown := Value;
    epPMSFailureCBClosed : GeneratorTemp.FailureCBClosed := Value;
  end;

  if Assigned(frmGeneratorPanel) then
  begin
    frmGeneratorPanel.UpdateForm(GeneratorTemp);
  end;

  if Assigned(frmEmergencyPanel) then
  begin
    frmEmergencyPanel.UpdateForm(GeneratorTemp);
  end;

  if Assigned(frmShorePanel) then
  begin
    frmShorePanel.UpdateForm(GeneratorTemp);
  end;
end;

procedure TfrmMainForm.MainSwitchBoardSystemEvent(Sender: TObject; PropsID: E_PropsID; Value: Double);
begin
  case PropsID of
    epPMSPower:
    begin
      if Assigned(frmGeneratorPanel) then
        frmGeneratorPanel.VraPower.Position := Value;

      if Assigned(frmEmergencyPanel) then
        frmEmergencyPanel.VraPower.Position := Value;

      if Assigned(frmShorePanel) then
        frmShorePanel.VraPower.Position := Value;
    end;
    epPMSFrequency:
    begin
      if Assigned(frmGeneratorPanel) then
      begin
        frmGeneratorPanel.OrderFrequency := Value;
        frmGeneratorPanel.tmrFrequency.Enabled := True;
      end;
    end;
    epPMSVoltage:
    begin
      if Assigned(frmGeneratorPanel) then
        frmGeneratorPanel.VraV.Position := Value;

      if Assigned(frmEmergencyPanel) then
        frmEmergencyPanel.VraV.Position := Value;
    end;
    epPMSCurrent:
    begin
      if Assigned(frmGeneratorPanel) then
      begin
        frmGeneratorPanel.OrderAmpere := Value;
        frmGeneratorPanel.tmrAmpere.Enabled := True;
      end;

      if Assigned(frmEmergencyPanel) then
      begin
        frmEmergencyPanel.OrderAmpere := Value;
        frmEmergencyPanel.tmrAmpere.Enabled := True;
      end;

      if Assigned(frmShorePanel) then
      begin
        frmShorePanel.OrderAmpere := Value;
        frmShorePanel.tmrAmpere.Enabled := True;
      end;
    end;
  end;

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

procedure TfrmMainForm.MainSwitchBoardSystemEvent(Sender: TObject;
  PropsID: E_PropsID; Value: TObject);
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

end.
