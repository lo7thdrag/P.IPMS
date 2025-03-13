unit ufrmSelectPointType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Menus;

type
  TfrmPointType = class(TForm)
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
    edtPointType: TEdit;
    btnOk: TButton;
    btnCancel: TButton;
    btnBrowse: TButton;
    dbgrd1: TDBGrid;
    lbl7: TLabel;
    lblRecord: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPointType: TfrmPointType;

implementation

{$R *.dfm}

end.
