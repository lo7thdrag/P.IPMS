unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, VrControls,
  VrRotarySwitch, RzBmpBtn, VrAngularMeter, Vcl.ExtCtrls;

type
  TfrmMainForm = class(TForm)
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMainForm: TfrmMainForm;

implementation

uses
  uMainSwitchBoardSystem, ufrmGeneratorPanel, ufrmEmergencyPanel, ufrmShorePanel;

{$R *.dfm}

procedure TfrmMainForm.FormShow(Sender: TObject);
begin
  if (MainSwitchBoardSystem.IdGensys = 'GENSYS 1') or (MainSwitchBoardSystem.IdGensys = 'GENSYS 2') or
     (MainSwitchBoardSystem.IdGensys = 'GENSYS 3') or (MainSwitchBoardSystem.IdGensys = 'GENSYS 4') then
  begin
    if not Assigned(frmGeneratorPanel) then
    begin
      frmGeneratorPanel := TfrmGeneratorPanel.Create(Self);
    end;

    frmGeneratorPanel.Show;
    ShowCursor(False);
  end
  else
  if MainSwitchBoardSystem.IdGensys = 'EMERGENCY' then
  begin
    if not Assigned(frmEmergencyPanel) then
    begin
      frmEmergencyPanel := TfrmEmergencyPanel.Create(Self);
    end;

    frmEmergencyPanel.Show;
    ShowCursor(False);
  end
  else
  if MainSwitchBoardSystem.IdGensys = 'SHORE' then
  begin
    if not Assigned(frmShorePanel) then
    begin
      frmShorePanel := TfrmShorePanel.Create(Self);
    end;

    frmShorePanel.Show;
    ShowCursor(False);
  end;
end;

end.
