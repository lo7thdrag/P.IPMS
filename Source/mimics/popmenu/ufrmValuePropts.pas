unit ufrmValuePropts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmValuePropts = class(TForm)
    lbl1: TLabel;
    edt1: TEdit;
    btn1: TButton;
    btn2: TButton;
    lbl2: TLabel;
    edt2: TEdit;
    chk1: TCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmValuePropts: TfrmValuePropts;

implementation

{$R *.dfm}

end.
