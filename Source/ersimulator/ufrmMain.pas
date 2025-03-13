unit ufrmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, uDataType;

type
  TfrmControlPanel = class(TForm)
    pgcPCSLocalControl: TPageControl;
    tsBallastSystem: TTabSheet;
    tsPMSSystem: TTabSheet;
    scrlbxPMS: TScrollBox;
    tsPCSLocalControl: TTabSheet;
    scrlbxPCS: TScrollBox;

    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmControlPanel: TfrmControlPanel;

implementation

uses
  uBallastSystemPanel, uPMSSystemPanel, uPCSLocalControlPanel;


{$R *.dfm}

procedure TfrmControlPanel.FormCreate(Sender: TObject);
begin
  frmBallastSystemPanel := TfrmBallastSystemPanel.Create(Self);
  frmBallastSystemPanel.Parent := tsBallastSystem;
  frmBallastSystemPanel.BorderStyle := bsNone;
  frmBallastSystemPanel.Align := alClient;
  frmBallastSystemPanel.Show;

  frmPMSSystemPanel := TfrmPMSSystemPanel.Create(Self);
  frmPMSSystemPanel.Parent := scrlbxPMS;
  frmPMSSystemPanel.BorderStyle := bsNone;
  frmPMSSystemPanel.Show;

  frmPCSLocalControlPanel := TfrmPCSLocalControlPanel.Create(Self);
  frmPCSLocalControlPanel.Parent :=scrlbxPCS;
  frmPCSLocalControlPanel.BorderStyle := bsNone;
  frmPCSLocalControlPanel.Show;

end;

end.
