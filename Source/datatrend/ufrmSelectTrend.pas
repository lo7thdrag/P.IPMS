unit ufrmSelectTrend;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmSelectTrend = class(TForm)
    lbl1: TLabel;
    cbbSignal: TComboBox;
    lst1: TListBox;
    btnCancel: TButton;
    btnOk: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelectTrend: TfrmSelectTrend;

implementation

{$R *.dfm}

end.
