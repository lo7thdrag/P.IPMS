unit ufrmPropertiesScreen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, RzBckgnd;

type
  TfrmScreen = class(TForm)
    btnOk: TButton;
    btnCancel: TButton;
    btnApply: TButton;
    btnHelp: TButton;
    pgc1: TPageControl;
    tsColors: TTabSheet;
    tsGeometry: TTabSheet;
    tsGeneral: TTabSheet;
    tsEvents: TTabSheet;
    tsAmbient: TTabSheet;
    tsVariables: TTabSheet;
    tsProcedures: TTabSheet;
    tsScript: TTabSheet;
    tsMenus: TTabSheet;
    pnlLine: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    cbb1: TComboBox;
    cbb2: TComboBox;
    cbb3: TComboBox;
    cbb4: TComboBox;
    chk1: TCheckBox;
    cbb5: TComboBox;
    pnlFill: TPanel;
    lbl5: TLabel;
    lbl6: TLabel;
    cbb6: TComboBox;
    cbb7: TComboBox;
    pnl1: TPanel;
    pnl2: TPanel;
    pnlScreenSize: TPanel;
    pnl3: TPanel;
    lbl7: TLabel;
    lbl8: TLabel;
    edtHeight: TEdit;
    lbl9: TLabel;
    lbl10: TLabel;
    edtType: TEdit;
    edtName: TEdit;
    edtWidth: TEdit;
    pnl4: TPanel;
    lbl12: TLabel;
    pnl5: TPanel;
    rbText: TRadioButton;
    rbTextFile: TRadioButton;
    rbHelpFile: TRadioButton;
    mmoHelp: TMemo;
    lbl11: TLabel;
    lbl13: TLabel;
    cbb8: TComboBox;
    cbb9: TComboBox;
    btnFont: TButton;
    pnl6: TPanel;
    pnl7: TPanel;
    lbl14: TLabel;
    edtFont: TEdit;
    btnEdtFile: TButton;
    btnEdtText: TButton;
    pnlZbakc: TPanel;
    pnl8: TPanel;
    pnl9: TPanel;
    pnl10: TPanel;
    pnl12: TPanel;
    lst1: TListBox;
    btnNew1: TButton;
    btnEdt: TButton;
    btnDuplicate1: TButton;
    btnDel1: TButton;
    btnRename: TButton;
    pnl13: TPanel;
    btnEdtCallable: TButton;
    lbl15: TLabel;
    mmoCallable: TMemo;
    pnl15: TPanel;
    pnl11: TPanel;
    RzSeparator1: TRzSeparator;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl18: TLabel;
    btnDel2: TButton;
    btnDuplicate2: TButton;
    btnNew2: TButton;
    edtMenuText: TEdit;
    cbbAction: TComboBox;
    edtParam: TEdit;
    pnl14: TPanel;
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmScreen: TfrmScreen;

implementation

{$R *.dfm}

procedure TfrmScreen.btnCancelClick(Sender: TObject);
begin
  frmScreen.Close;
end;

end.
