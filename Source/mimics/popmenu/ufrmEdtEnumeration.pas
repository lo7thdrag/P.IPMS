unit ufrmEdtEnumeration;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls;

type
  TfrmEdtEnumeration = class(TForm)
    pgc1: TPageControl;
    ts1: TTabSheet;
    pnl1: TPanel;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    lbl1: TLabel;
    edt1: TEdit;
    dbgrd1: TDBGrid;
    btn5: TButton;
    btn6: TButton;
    btn7: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEdtEnumeration: TfrmEdtEnumeration;

implementation

{$R *.dfm}

end.
