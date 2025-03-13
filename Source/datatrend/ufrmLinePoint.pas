unit ufrmLinePoint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ufrmLineAttribute;

type
  TfrmPointID = class(TfrmLineAttribute)
    Label1: TLabel;
    edtPointID: TEdit;
    btnSelect: TBitBtn;
    btnMenu: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPointID: TfrmPointID;

implementation

{$R *.dfm}

end.
