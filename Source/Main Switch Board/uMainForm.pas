unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, VrControls,
  VrRotarySwitch, RzBmpBtn, VrAngularMeter, Vcl.ExtCtrls,

  uListener, uFreezeFrom, uDataType;

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
end;

procedure TfrmMainForm.FormShow(Sender: TObject);
begin
  if MainSwitchBoardSystem.IdFormGensys = 'GENSYS' then
  begin
    if not Assigned(frmGeneratorPanel) then
    begin
      frmGeneratorPanel := TfrmGeneratorPanel.Create(Self);
    end;

    frmGeneratorPanel.Show;
//    ShowCursor(False);
  end
  else
  if MainSwitchBoardSystem.IdFormGensys = 'EMERGENCY' then
  begin
    if not Assigned(frmEmergencyPanel) then
    begin
      frmEmergencyPanel := TfrmEmergencyPanel.Create(Self);
    end;

    frmEmergencyPanel.Show;
//    ShowCursor(False);
  end
  else
  if MainSwitchBoardSystem.IdFormGensys = 'SHORE' then
  begin
    if not Assigned(frmShorePanel) then
    begin
      frmShorePanel := TfrmShorePanel.Create(Self);
    end;

    frmShorePanel.Show;
//    ShowCursor(False);
  end;
end;

procedure TfrmMainForm.MainSwitchBoardSystemEvent(Sender: TObject; PropsID: E_PropsID; Value: Integer);
begin
  case PropsID of
    epPMSFreezed:
      if Value = 1 then
      begin
        if MainSwitchBoardSystem.IdFormGensys = 'GENSYS' then
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
        end
        else
        if MainSwitchBoardSystem.IdFormGensys = 'EMERGENCY' then
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
        end
        else
        if MainSwitchBoardSystem.IdFormGensys = 'SHORE' then
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
        if MainSwitchBoardSystem.IdFormGensys = 'GENSYS' then
        begin
          frmGeneratorPanel.Enabled := True;
          if Assigned(MainSwitchBoardSystem.FFormFreezed[0]) then
            FreeAndNil(MainSwitchBoardSystem.FFormFreezed[0]);
        end
        else
        if MainSwitchBoardSystem.IdFormGensys = 'EMERGENCY' then
        begin
          frmEmergencyPanel.Enabled := True;
          if Assigned(MainSwitchBoardSystem.FFormFreezed[0]) then
            FreeAndNil(MainSwitchBoardSystem.FFormFreezed[0]);
        end
        else
        if MainSwitchBoardSystem.IdFormGensys = 'SHORE' then
        begin
          frmShorePanel.Enabled := True;
          if Assigned(MainSwitchBoardSystem.FFormFreezed[0]) then
            FreeAndNil(MainSwitchBoardSystem.FFormFreezed[0]);
        end;
      end;
    epPMSGeneratorMode:
    begin
      if MainSwitchBoardSystem.IdFormGensys = 'GENSYS' then
      begin
        with frmGeneratorPanel do
        begin
          if Value = 1 then
          begin
            ImgIndicatorMan.Visible := True;
            ImgIndicatorSA.Visible := False;
            ImgIndicatorAuto.Visible := False;
          end
          else if Value = 2 then
          begin
            ImgIndicatorMan.Visible := False;
            ImgIndicatorSA.Visible := True;
            ImgIndicatorAuto.Visible := False;
          end
          else if Value = 3 then
          begin
            ImgIndicatorMan.Visible := False;
            ImgIndicatorSA.Visible := False;
            ImgIndicatorAuto.Visible := True;
          end;
        end;
      end
      else if MainSwitchBoardSystem.IdFormGensys = 'EMERGENCY' then
      begin

      end
      else if MainSwitchBoardSystem.IdFormGensys = 'SHORE' then
      begin

      end;
    end;
  end;
end;

procedure TfrmMainForm.MainSwitchBoardSystemEvent(Sender: TObject; PropsID: E_PropsID; Value: Boolean);
begin
  case PropsID of
    epPMSGeneratorEngineRun :
    begin
      if MainSwitchBoardSystem.IdFormGensys = 'GENSYS' then
      begin
        with frmGeneratorPanel do
        begin
          ImgIndicatorER.Visible := Value;
        end;
      end
      else if MainSwitchBoardSystem.IdFormGensys = 'EMERGENCY' then
      begin

      end
      else if MainSwitchBoardSystem.IdFormGensys = 'SHORE' then
      begin

      end;
    end;
    epPMSGeneratorStop :
    begin
      if MainSwitchBoardSystem.IdFormGensys = 'GENSYS' then
      begin
        with frmGeneratorPanel do
        begin
          ImgIndicatorER.Visible := not Value;
        end;
      end
      else if MainSwitchBoardSystem.IdFormGensys = 'EMERGENCY' then
      begin

      end
      else if MainSwitchBoardSystem.IdFormGensys = 'SHORE' then
      begin

      end;
    end;
    epPMSGeneratorSupplied :
    begin
      if MainSwitchBoardSystem.IdFormGensys = 'GENSYS' then
      begin
        with frmGeneratorPanel do
        begin
          ImgIndicatorGS.Visible := Value;
        end;
      end
      else if MainSwitchBoardSystem.IdFormGensys = 'EMERGENCY' then
      begin

      end
      else if MainSwitchBoardSystem.IdFormGensys = 'SHORE' then
      begin

      end;
    end;
    epPMSGeneratorCBClosed :
    begin
      if MainSwitchBoardSystem.IdFormGensys = 'GENSYS' then
      begin
        with frmGeneratorPanel do
        begin
          ImgIndicatorCBC.Visible := Value;
        end;
      end
      else if MainSwitchBoardSystem.IdFormGensys = 'EMERGENCY' then
      begin

      end
      else if MainSwitchBoardSystem.IdFormGensys = 'SHORE' then
      begin

      end;
    end;
    epPMSGeneratorPreference :
    begin
      if MainSwitchBoardSystem.IdFormGensys = 'GENSYS' then
      begin
        with frmGeneratorPanel do
        begin
          ImgIndicatorPreference.Visible := Value;
        end;
      end
      else if MainSwitchBoardSystem.IdFormGensys = 'EMERGENCY' then
      begin

      end
      else if MainSwitchBoardSystem.IdFormGensys = 'SHORE' then
      begin

      end;
    end;
    epPMSGeneratorBusbar :
    begin
      if MainSwitchBoardSystem.IdFormGensys = 'GENSYS' then
      begin
        with frmGeneratorPanel do
        begin
          ImgIndicatorBS.Visible := Value;
        end;
      end
      else if MainSwitchBoardSystem.IdFormGensys = 'EMERGENCY' then
      begin

      end
      else if MainSwitchBoardSystem.IdFormGensys = 'SHORE' then
      begin

      end;
    end;
  end;
end;

procedure TfrmMainForm.MainSwitchBoardSystemEvent(Sender: TObject; PropsID: E_PropsID; Value: Double);
begin

end;

end.
