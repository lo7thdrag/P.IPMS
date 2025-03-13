unit ufrmExpression;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Menus, ufrmLineAttribute;

type
  TfrmExpression = class(TfrmLineAttribute)
    Label1: TLabel;
    edtExpression: TEdit;
    btnSelect: TBitBtn;
    btnMenu: TBitBtn;
    pmMenu: TPopupMenu;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExpression: TfrmExpression;

implementation

{$R *.dfm}

end.
