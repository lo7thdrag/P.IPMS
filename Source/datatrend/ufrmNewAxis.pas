unit ufrmNewAxis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmNewAxis = class(TForm)
    lbl1: TLabel;
    edtAxisID: TEdit;
    btnOk: TButton;
    btnCancel: TButton;
    rg1: TRadioGroup;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    FCanClose : Boolean;
  public
    { Public declarations }
  end;

var
  frmNewAxis: TfrmNewAxis;

implementation

{$R *.dfm}

procedure TfrmNewAxis.btnCancelClick(Sender: TObject);
begin
  FCanClose := True;
end;

procedure TfrmNewAxis.btnOkClick(Sender: TObject);
begin
  if edtAxisID.Text = '' then
  begin
    FCanClose := False;
    MessageDlg('Axis ID can not empty',  mtError, [mbOK], 0);
  end
  else
    FCanClose := True;

end;

procedure TfrmNewAxis.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := FCanClose;

end;

end.
