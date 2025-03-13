unit ufrmSelectDevice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Menus;

type
  TfrmSelectDevice = class(TForm)
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
    lbl3: TLabel;
    edtDevice: TEdit;
    edtResource: TEdit;
    edtDescriptn: TEdit;
    btnDeviceId: TButton;
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
  frmSelectDevice: TfrmSelectDevice;

implementation

{$R *.dfm}

end.
