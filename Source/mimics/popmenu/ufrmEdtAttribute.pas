unit ufrmEdtAttribute;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids;

type
  TfrmEdtAttribute = class(TForm)
    lbl1: TLabel;
    edt1: TEdit;
    dbgrd1: TDBGrid;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEdtAttribute: TfrmEdtAttribute;

implementation

{$R *.dfm}

end.
