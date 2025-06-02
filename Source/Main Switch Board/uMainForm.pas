unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, VrControls,
  VrRotarySwitch, RzBmpBtn, VrAngularMeter, Vcl.ExtCtrls,

  uSetting, uListener, uFreezeFrom, uDataType;

type
  TfrmMainForm = class(TForm)
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    FListener : TListeners;

    procedure MainSwitchBoardSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Integer);overload;
    procedure MainSwitchBoardSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Boolean);overload;
    procedure MainSwitchBoardSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Double);overload;

  public
    { Public declarations }
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
end;

procedure TfrmMainForm.FormDestroy(Sender: TObject);
begin
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
    epPMSGeneratorMode:
    begin
      if Value = 1 then
      begin
        if Assigned(frmGeneratorPanel) then
        begin
          frmGeneratorPanel.ImgIndicatorMan.Visible := True;
          frmGeneratorPanel.ImgIndicatorSA.Visible := False;
          frmGeneratorPanel.ImgIndicatorAuto.Visible := False;
        end;

        if Assigned(frmEmergencyPanel) then
        begin
          frmEmergencyPanel.ImgIndicatorMan.Visible := True;
          frmEmergencyPanel.ImgIndicatorSA.Visible := False;
          frmEmergencyPanel.ImgIndicatorAuto.Visible := False;
        end;
      end
      else if Value = 2 then
      begin
        if Assigned(frmGeneratorPanel) then
        begin
          frmGeneratorPanel.ImgIndicatorMan.Visible := False;
          frmGeneratorPanel.ImgIndicatorSA.Visible := True;
          frmGeneratorPanel.ImgIndicatorAuto.Visible := False;
        end;

        if Assigned(frmEmergencyPanel) then
        begin
          frmEmergencyPanel.ImgIndicatorMan.Visible := False;
          frmEmergencyPanel.ImgIndicatorSA.Visible := True;
          frmEmergencyPanel.ImgIndicatorAuto.Visible := False;
        end;
      end
      else if Value = 3 then
      begin
        if Assigned(frmGeneratorPanel) then
        begin
          frmGeneratorPanel.ImgIndicatorMan.Visible := False;
          frmGeneratorPanel.ImgIndicatorSA.Visible := False;
          frmGeneratorPanel.ImgIndicatorAuto.Visible := True;
        end;

        if Assigned(frmEmergencyPanel) then
        begin
          frmEmergencyPanel.ImgIndicatorMan.Visible := False;
          frmEmergencyPanel.ImgIndicatorSA.Visible := False;
          frmEmergencyPanel.ImgIndicatorAuto.Visible := True;
        end;
      end;
    end;
  end;
end;

procedure TfrmMainForm.MainSwitchBoardSystemEvent(Sender: TObject; PropsID: E_PropsID; Value: Boolean);
begin
  case PropsID of
    epPMSGeneratorEngineRun :
    begin
      if Assigned(frmGeneratorPanel) then
        frmGeneratorPanel.ImgIndicatorER.Visible := Value;

      if Assigned(frmEmergencyPanel) then
        frmEmergencyPanel.ImgIndicatorER.Visible := Value;
    end;
    epPMSGeneratorStop :
    begin
      if Assigned(frmGeneratorPanel) then
        frmGeneratorPanel.ImgIndicatorER.Visible := not Value;

      if Assigned(frmEmergencyPanel) then
        frmEmergencyPanel.ImgIndicatorER.Visible := not Value;
    end;
    epPMSGeneratorSupplied :
    begin
      if Assigned(frmGeneratorPanel) then
        frmGeneratorPanel.ImgIndicatorGS.Visible := Value;

      if Assigned(frmEmergencyPanel) then
        frmEmergencyPanel.ImgIndicatorGS.Visible := Value;
    end;
    epPMSGeneratorCBClosed :
    begin
      if Assigned(frmGeneratorPanel) then
        frmGeneratorPanel.ImgIndicatorCBC.Visible := Value;

      if Assigned(frmEmergencyPanel) then
        frmEmergencyPanel.ImgIndicatorCKC.Visible := Value;
    end;
    epPMSGeneratorPreference :
    begin
      if Assigned(frmGeneratorPanel) then
        frmGeneratorPanel.ImgIndicatorPreference.Visible := Value;
    end;
    epPMSGeneratorBusbar :
    begin
      if Assigned(frmGeneratorPanel) then
        frmGeneratorPanel.ImgIndicatorBS.Visible := Value;

      if Assigned(frmEmergencyPanel) then
        frmEmergencyPanel.ImgIndicatorBS.Visible := Value;
    end;
  end;
end;

procedure TfrmMainForm.MainSwitchBoardSystemEvent(Sender: TObject; PropsID: E_PropsID; Value: Double);
begin
//  case PropsID of
//    epPMSPower:
//    begin
//      if Assigned(frmGeneratorPanel) then
//        frmGeneratorPanel.VraPower.Position := Value;
//
//      if Assigned(frmEmergencyPanel) then
//        frmEmergencyPanel.VraPower.Position := Value;
//
//      if Assigned(frmShorePanel) then
//        frmShorePanel.VraPower.Position := Value;
//    end;
//    epPMSFrequency:
//    begin
//      if Assigned(frmGeneratorPanel) then
//      begin
//        frmGeneratorPanel.OrderFrequency := Value;
//        frmGeneratorPanel.tmrFrequency.Enabled := True;
//      end;
//    end;
//    epPMSVoltage:
//    begin
//      if Assigned(frmGeneratorPanel) then
//        frmGeneratorPanel.VraV.Position := Value;
//
//      if Assigned(frmEmergencyPanel) then
//        frmEmergencyPanel.VraV.Position := Value;
//    end;
//    epPMSCurrent:
//    begin
//      if Assigned(frmGeneratorPanel) then
//      begin
//        frmGeneratorPanel.OrderAmpere := Value;
//        frmGeneratorPanel.tmrAmpere.Enabled := True;
//      end;
//
//      if Assigned(frmEmergencyPanel) then
//      begin
//        frmEmergencyPanel.OrderAmpere := Value;
//        frmEmergencyPanel.tmrAmpere.Enabled := True;
//      end;
//
//      if Assigned(frmShorePanel) then
//      begin
//        frmShorePanel.OrderAmpere := Value;
//        frmShorePanel.tmrAmpere.Enabled := True;
//      end;
//    end;
//  end;

end;

end.
