unit ufrmPointView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TfrmPointView = class(TForm)
    tv1: TTreeView;
    btnClose: TButton;
    btnHelp: TButton;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    procedure btnCloseClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPointView: TfrmPointView;

implementation

{$R *.dfm}

uses ufrmHelp;

procedure TfrmPointView.btnCloseClick(Sender: TObject);
begin
  frmPointView.Close;
end;

procedure TfrmPointView.btnHelpClick(Sender: TObject);
begin
  frmHelp.Show;
end;

end.
