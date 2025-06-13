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
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private

    FListener : TListeners;

    procedure MainSwitchBoardSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Integer);overload;
    procedure MainSwitchBoardSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Boolean);overload;
    procedure MainSwitchBoardSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Double);overload;

  public
    GeneratorTemp : TGenerator;

  end;

var
  frmMainForm: TfrmMainForm;

implementation

uses
  uMainSwitchBoardSystem, ufrmGeneratorPanel, ufrmEmergencyPanel, ufrmShorePanel;

{$R *.dfm}

procedure TfrmMainForm.FormCreate(Sender: TObject);
begin
  Setting   := TSetting.Create;
  MainSwitchBoardSystem := TMainSwitchBoardSystem.Create;

  FListener := TListeners.Create;
  with MainSwitchBoardSystem.Listener.Add('MAINSWITCHBOARD') as TPropertyEventListener do
  begin
    OnPropertyIntChange := MainSwitchBoardSystemEvent;
    OnPropertyBoolChange := MainSwitchBoardSystemEvent;
    OnPropertyDblChange := MainSwitchBoardSystemEvent;
  end;

  {Create Generator Temporary}
  GeneratorTemp := TGenerator.Create;
  GeneratorTemp.Identifier := MainSwitchBoardSystem.IdGenerator;
  GeneratorTemp.GeneratorState := 9;
end;

procedure TfrmMainForm.FormDestroy(Sender: TObject);
begin
  GeneratorTemp.Destroy;

  FListener.Free;
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
    epPMSMsbShoreMode:
    begin
//
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

end.
