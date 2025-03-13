unit ufrmProperties;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, RzBckgnd;

type
  TfrmProperts = class(TForm)
    pgc1: TPageControl;
    btnOk: TButton;
    btnCancel: TButton;
    btnApply: TButton;
    btnHelp: TButton;
    ts1: TTabSheet;
    ts2: TTabSheet;
    ts3: TTabSheet;
    ts4: TTabSheet;
    ts5: TTabSheet;
    ts7: TTabSheet;
    ts8: TTabSheet;
    ts9: TTabSheet;
    ts10: TTabSheet;
    ts11: TTabSheet;
    ts12: TTabSheet;
    ts6: TTabSheet;
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    pnl5: TPanel;
    pnl6: TPanel;
    pnl7: TPanel;
    pnl8: TPanel;
    pnl9: TPanel;
    pnl10: TPanel;
    pnl11: TPanel;
    pnl12: TPanel;
    pnlScreenSize: TPanel;
    lbl7: TLabel;
    lbl8: TLabel;
    edtTop: TEdit;
    edtLeft: TEdit;
    pnl13: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    edtHeight: TEdit;
    edtWidth: TEdit;
    pnl14: TPanel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    edtAngle: TEdit;
    edtVerti: TEdit;
    edtHoriz: TEdit;
    pnl15: TPanel;
    lbl6: TLabel;
    lbl9: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    edtName: TEdit;
    edtType: TEdit;
    lbl10: TLabel;
    lbl11: TLabel;
    pnl16: TPanel;
    lbl12: TLabel;
    rbText: TRadioButton;
    rbTextFile: TRadioButton;
    rbHelpFile: TRadioButton;
    mmoHelp: TMemo;
    pnl17: TPanel;
    lbl13: TLabel;
    edtTabOrdr: TEdit;
    pnl18: TPanel;
    pnl19: TPanel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    edtExprHM: TEdit;
    edtMinHM: TEdit;
    edtOffsetHM: TEdit;
    pnl20: TPanel;
    pnl21: TPanel;
    edtMaxHM: TEdit;
    chkSliderHM: TCheckBox;
    chkConfirmHM: TCheckBox;
    btnAdvHM: TButton;
    lbl17: TLabel;
    lbl18: TLabel;
    lbl19: TLabel;
    chkSliderVM: TCheckBox;
    chkConfirmVM: TCheckBox;
    btnAdvVM: TButton;
    edtOffsetVM: TEdit;
    edtMaxVM: TEdit;
    edtMinVM: TEdit;
    edtExprVM: TEdit;
    lbl20: TLabel;
    mmoCallable: TMemo;
    btnEdtCallable: TButton;
    RzSeparator1: TRzSeparator;
    lbl21: TLabel;
    lbl22: TLabel;
    lbl23: TLabel;
    btnNew2: TButton;
    btnDuplicate2: TButton;
    btnDel2: TButton;
    edtParam: TEdit;
    cbbAction: TComboBox;
    edtMenuText: TEdit;
    lst1: TListBox;
    btnNew1: TButton;
    btnEdt: TButton;
    btnDuplicate1: TButton;
    btnDel1: TButton;
    btnRename: TButton;
    pnl22: TPanel;
    pnl23: TPanel;
    lbl24: TLabel;
    lbl25: TLabel;
    lbl26: TLabel;
    edtExprHS: TEdit;
    edtMinHS: TEdit;
    edtPercentHS: TEdit;
    edtMaxHS: TEdit;
    pnl24: TPanel;
    pnl25: TPanel;
    lbl27: TLabel;
    lbl28: TLabel;
    lbl29: TLabel;
    edtPercentVS: TEdit;
    edtMaxVS: TEdit;
    edtMinVS: TEdit;
    edtExprVS: TEdit;
    lbl30: TLabel;
    edtFixHS: TEdit;
    lbl31: TLabel;
    edtFixVS: TEdit;
    pnl26: TPanel;
    pnl27: TPanel;
    lbl32: TLabel;
    lbl33: TLabel;
    lbl34: TLabel;
    lbl35: TLabel;
    edtExprR: TEdit;
    edtMinR: TEdit;
    edtOffsetR: TEdit;
    edtMaxR: TEdit;
    edtMinAngleR: TEdit;
    pnl28: TPanel;
    pnl29: TPanel;
    lbl36: TLabel;
    lbl37: TLabel;
    lbl38: TLabel;
    lbl39: TLabel;
    edtMaxF: TEdit;
    edtMinF: TEdit;
    edtExprF: TEdit;
    edtMaxAngleR: TEdit;
    edt12: TEdit;
    cbbDir: TComboBox;
    cbbStyle: TComboBox;
    chkBipolar: TCheckBox;
    pnl30: TPanel;
    pnl31: TPanel;
    lbl40: TLabel;
    lblCount: TLabel;
    btnEdtExprList: TButton;
    pnl32: TPanel;
    pnl33: TPanel;
    lbl41: TLabel;
    pnl34: TPanel;
    pnl35: TPanel;
    lbl43: TLabel;
    pnl36: TPanel;
    pnl37: TPanel;
    lbl42: TLabel;
    edtExprVV: TEdit;
    edtPointID: TEdit;
    edtExprCI: TEdit;
    lbl44: TLabel;
    RzSeparator2: TRzSeparator;
    cbbAction2: TComboBox;
    lbl45: TLabel;
    lbl46: TLabel;
    edtParam2: TEdit;
    btnNew3: TButton;
    btnDuplicate3: TButton;
    btnDelete3: TButton;
    RzSeparator3: TRzSeparator;
    cbbEvent: TComboBox;
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProperts: TfrmProperts;

implementation

{$R *.dfm}

procedure TfrmProperts.btnCancelClick(Sender: TObject);
begin
  frmProperts.Close;
end;

end.
