unit ufrmEdtExpression;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TfrmEditExpression = class(TForm)
    mmoEdtExpression: TMemo;
    btnOk: TButton;
    btnCancel: TButton;
    btnHelp: TButton;
    btnPointID: TButton;
    btnEdtPoint: TButton;
    btnNewPoint: TButton;
    pnl1: TPanel;
    pnlMinus: TPanel;
    pnlTime: TPanel;
    pnlDevide: TPanel;
    pnlPower: TPanel;
    pnlPlus: TPanel;
    pnlA1: TPanel;
    pnlA2: TPanel;
    pnlAL2: TPanel;
    pnlABS: TPanel;
    pnlACOS: TPanel;
    pnlAH1: TPanel;
    pnlAH2: TPanel;
    pnlAL: TPanel;
    pnlAL1: TPanel;
    pnlANA: TPanel;
    pnlAND: TPanel;
    pnlASIN: TPanel;
    pnlATAN: TPanel;
    pnlBAND: TPanel;
    pnlBNOT: TPanel;
    pnlBOR: TPanel;
    pnlBXOR: TPanel;
    pnlCEIL: TPanel;
    pnlCOS: TPanel;
    pnlEQ: TPanel;
    pnlEXP: TPanel;
    pnlFLR: TPanel;
    pnlGE: TPanel;
    pnlGT: TPanel;
    pnlLE: TPanel;
    pnlLOG: TPanel;
    pnlLOG10: TPanel;
    pnlLT: TPanel;
    pnlMAX: TPanel;
    pnlMIN: TPanel;
    pnlMOD: TPanel;
    pnlBACK: TPanel;
    pnlNE: TPanel;
    pnlNOT: TPanel;
    pnlOR: TPanel;
    pnlRND: TPanel;
    pnlSHL: TPanel;
    pnlSHR: TPanel;
    pnlSIN: TPanel;
    pnlSQR: TPanel;
    pnlTAN: TPanel;
    pnlTRUNC: TPanel;
    pnlVAL: TPanel;
    pnlXOR: TPanel;
    lbl1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditExpression: TfrmEditExpression;

implementation

{$R *.dfm}

end.
