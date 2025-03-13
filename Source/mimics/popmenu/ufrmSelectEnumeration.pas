unit ufrmSelectEnumeration;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Menus;

type
  TfrmSelectEnumeration = class(TForm)
    mm1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    View1: TMenuItem;
    FieldChooser1: TMenuItem;
    AutoBrowse1: TMenuItem;
    LargeIcons1: TMenuItem;
    List1: TMenuItem;
    Details1: TMenuItem;
    ree1: TMenuItem;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl7: TLabel;
    lblRecord: TLabel;
    edtResource: TEdit;
    edtDescriptn: TEdit;
    btnOk: TButton;
    btnCancel: TButton;
    btnBrowse: TButton;
    dbgrd1: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelectEnumeration: TfrmSelectEnumeration;

implementation

{$R *.dfm}

end.
