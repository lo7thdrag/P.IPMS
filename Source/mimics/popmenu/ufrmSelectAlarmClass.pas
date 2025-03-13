unit ufrmSelectAlarmClass;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Menus;

type
  TfrmSelectAlarmClass = class(TForm)
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
    edt1: TEdit;
    edt2: TEdit;
    btn1: TButton;
    btn2: TButton;
    dbgrd1: TDBGrid;
    lbl7: TLabel;
    lblRecord: TLabel;
    btn3: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelectAlarmClass: TfrmSelectAlarmClass;

implementation

{$R *.dfm}

end.
