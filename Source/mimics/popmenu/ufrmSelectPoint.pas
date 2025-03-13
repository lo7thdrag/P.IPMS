unit ufrmSelectPoint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls;

type
  TForm2 = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    edtPointId: TEdit;
    edtDeviceId: TEdit;
    edtResource: TEdit;
    edtPointType: TEdit;
    cbbProject: TComboBox;
    edtDescp: TEdit;
    btnDeviceId: TButton;
    btnResource: TButton;
    btnPointType: TButton;
    btnOk: TButton;
    btnCancel: TButton;
    btnBrowse: TButton;
    mmoRecord: TMemo;
    lbl7: TLabel;
    lblRecord: TLabel;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

end.
