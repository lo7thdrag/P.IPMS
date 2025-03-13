unit ufrmEdtMeasure;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls;

type
  TfrmEdtMeasure = class(TForm)
    pgc1: TPageControl;
    ts1: TTabSheet;
    pnl1: TPanel;
    edt1: TEdit;
    edt2: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEdtMeasure: TfrmEdtMeasure;

implementation

{$R *.dfm}

end.
