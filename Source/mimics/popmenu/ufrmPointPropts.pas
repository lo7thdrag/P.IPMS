unit ufrmPointPropts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls;

type
  TfrmPointPropts = class(TForm)
    pgc1: TPageControl;
    ts2: TTabSheet;
    ts3: TTabSheet;
    ts1: TTabSheet;
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    edt1: TEdit;
    btn1: TButton;
    cbb1: TComboBox;
    lbl3: TLabel;
    ud1: TUpDown;
    chk1: TCheckBox;
    lbl4: TLabel;
    lbl5: TLabel;
    cbb2: TComboBox;
    cbb3: TComboBox;
    pnl4: TPanel;
    lbl6: TLabel;
    edt2: TEdit;
    btnPopExpression: TButton;
    pnl5: TPanel;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPointPropts: TfrmPointPropts;

implementation

{$R *.dfm}

end.
