unit uAvailableTimes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TfrmAvailTimes = class(TForm)
    lstAvail: TListBox;
    pnl2: TPanel;
    btnOK: TButton;
    btnCancel: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetAvailableTimes(aList : TStrings);
  end;

var
  frmAvailTimes: TfrmAvailTimes;

implementation

{$R *.dfm}

{ TfrmAvailTimes }

procedure TfrmAvailTimes.SetAvailableTimes(aList: TStrings);
begin
  lstAvail.Items.AddStrings(aList);
end;

end.
