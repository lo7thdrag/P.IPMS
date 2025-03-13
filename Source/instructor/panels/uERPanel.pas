unit uERPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls;

type
  TfrmERPanel = class(TForm)
    pgcERPAnel: TPageControl;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure AddPage(aNew : TForm);
  public
    { Public declarations }
  end;

var
  frmERPanel: TfrmERPanel;


implementation

uses uBallastSystemPanel, uPMSSystemPanel;

{$R *.dfm}

procedure TfrmERPanel.AddPage(aNew: TForm);
var
  tab : TTabSheet;
  scroll : TScrollBox;
begin
  tab := TTabSheet.Create(pgcERPAnel);
  tab.PageControl := pgcERPAnel;
  tab.Caption := aNew.Caption;

  scroll := TScrollBox.Create(tab);
  scroll.Align := alClient;
  scroll.BorderStyle := bsNone;

  aNew.Parent := tab;
  aNew.BorderStyle := bsNone;
  aNew.Align := alClient;
  aNew.Show;

end;

procedure TfrmERPanel.FormCreate(Sender: TObject);
begin
  AddPage(TfrmBallastSystemPanel.Create(Self));
  AddPage(TfrmPMSSystemPanel.Create(Self));
end;

end.
