unit ufrmLineMap;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmLineMap = class(TForm)
    lbl1: TLabel;
    cbbShowLine: TComboBox;
    lbl2: TLabel;
    mmoLine: TMemo;
    lbl3: TLabel;
    lbl4: TLabel;
    cbbXaxis: TComboBox;
    cbbYaxis: TComboBox;
    btnOk: TButton;
    btnCancel: TButton;
    btnHelp: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLineMap: TfrmLineMap;

implementation

{$R *.dfm}

end.
