unit uAvailableFACondition;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmAvailFACondition = class(TForm)
    lstAvail: TListBox;
    pnl2: TPanel;
    btnOK: TButton;
    btnCancel: TButton;
    procedure btnOKClick(Sender: TObject);
  private
    FFACondName: string;

    procedure SetFACondName(const Value: string);
  public
    procedure SetAvailableCondition(aList: TStrings);

    property FACondName : string read FFACondName write SetFACondName;
  end;

var
  frmAvailFACondition: TfrmAvailFACondition;

implementation

{$R *.dfm}

{ TfrmAvailFACondition }

procedure TfrmAvailFACondition.btnOKClick(Sender: TObject);
var
  i : Integer;
begin
  FFACondName := '';

  with lstAvail do
  begin
    for i := Items.Count - 1 downto 0 do
    begin
      if Selected[i] then
      begin
        FFACondName := Items[i];
        Break;
      end;
    end;
  end;
end;

procedure TfrmAvailFACondition.SetAvailableCondition(aList: TStrings);
var
  i : Integer;
begin
  if not Assigned(aList) then
    Exit;

  if lstAvail.Count > 0 then
    lstAvail.Clear;

  for i := 0 to aList.Count - 1 do
    lstAvail.Items.Add(aList[i]);
end;

procedure TfrmAvailFACondition.SetFACondName(const Value: string);
begin
  FFACondName := Value;
end;

end.
