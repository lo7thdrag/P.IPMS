unit ufrmAlarmString;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Menus;

type
  TfrmSelectAlarmString = class(TForm)
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
    lbl4: TLabel;
    lbl5: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    edt3: TEdit;
    edt4: TEdit;
    edt5: TEdit;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    lbl7: TLabel;
    dbgrd1: TDBGrid;
    lblRecord: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelectAlarmString: TfrmSelectAlarmString;

implementation

{$R *.dfm}

end.
