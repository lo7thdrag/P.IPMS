unit uAvailableTanksCondition;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmTanksCondition = class(TForm)
    lstAvail: TListBox;
    pnl2: TPanel;
    btnOK: TButton;
    btnCancel: TButton;
    procedure btnOKClick(Sender: TObject);
  private
    FTanksCondName: string;
    procedure SetTanksCondName(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    procedure SetAvailableCondition(aList: TStrings);

    property TanksCondName : string read FTanksCondName write SetTanksCondName;
  end;

var
  frmTanksCondition: TfrmTanksCondition;

implementation

{$R *.dfm}

procedure TfrmTanksCondition.btnOKClick(Sender: TObject);
var
  i : Integer;
begin
  FTanksCondName := '';

  with lstAvail do
  begin
    for i := Items.Count - 1 downto 0 do
    begin
      if Selected[i] then
      begin
        FTanksCondName := Items[i];
        Break;
      end;
    end;
  end;
end;

procedure TfrmTanksCondition.SetAvailableCondition(aList: TStrings);
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

procedure TfrmTanksCondition.SetTanksCondName(const Value: string);
begin
  FTanksCondName := Value;
end;

end.
