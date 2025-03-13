unit uAvailablePMSCondition;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmAvailPMSCondition = class(TForm)
    lstAvail: TListBox;
    pnl2: TPanel;
    btnOK: TButton;
    btnCancel: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
  private
    FPMSCondName : string;

    procedure SetPMSCondName(aName: string);
  public
    procedure SetAvailableCondition(aList: TStrings);

    property PMSCondName : string read FPMSCondName write SetPMSCondName;
  end;

var
  frmAvailPMSCondition: TfrmAvailPMSCondition;

implementation

{$R *.dfm}

procedure TfrmAvailPMSCondition.btnOKClick(Sender: TObject);
var
  i : Integer;
begin
  FPMSCondName := '';

  with lstAvail do
  begin
    for i := Items.Count - 1 downto 0 do
    begin
      if Selected[i] then
      begin
        FPMSCondName := Items[i];
        Break;
      end;
    end;
  end;
end;

procedure TfrmAvailPMSCondition.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caHide;
end;

procedure TfrmAvailPMSCondition.SetAvailableCondition(aList: TStrings);
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

procedure TfrmAvailPMSCondition.SetPMSCondName(aName: string);
begin
  FPMSCondName := aName;
end;

end.
