unit ufrmLoggedExpression;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Menus, ufrmLineAttribute;

type
  TfrmLoggedExpression = class(TfrmLineAttribute)
    lbl2: TLabel;
    cbbDatasource: TComboBox;
    edtUserID: TEdit;
    lbl4: TLabel;
    lbl6: TLabel;
    edtTableID: TEdit;
    btnTableID: TButton;
    edtPointID: TEdit;
    lbl7: TLabel;
    lbl5: TLabel;
    edtPassword: TEdit;
    btnPickDataSource: TButton;
    btnPointID: TButton;
    lbl1: TLabel;
    edtExpression: TEdit;
    btnSelect: TBitBtn;
    btnMenu: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLoggedExpression: TfrmLoggedExpression;

implementation

{$R *.dfm}

end.
