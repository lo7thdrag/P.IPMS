unit ufrmLineDisplay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmLineDisplay = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    cbb1: TComboBox;
    cbb2: TComboBox;
    cbb3: TComboBox;
    cbb4: TComboBox;
    pnl1: TPanel;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    chk1: TCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLineDisplay: TfrmLineDisplay;

implementation

{$R *.dfm}

end.
