unit uAvailablePCSCondition;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmAvailPCSCondition = class(TForm)
    lstAvail: TListBox;
    pnl2: TPanel;
    btnOK: TButton;
    btnCancel: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
  private
    FPCSCondName : string;

    procedure SetPCSCondName(aName: string);
  public
    procedure SetAvailableCondition(aList: TStrings);

    property PCSCondName : string read FPCSCondName write SetPCSCondName;
  end;

var
  frmAvailPCSCondition: TfrmAvailPCSCondition;

implementation

{$R *.dfm}

{ TfrmAvailPCSCondition }

procedure TfrmAvailPCSCondition.btnOKClick(Sender: TObject);
var
  i : Integer;
begin
  FPCSCondName := '';

  with lstAvail do
  begin
    for i := Items.Count - 1 downto 0 do
    begin
      if Selected[i] then
      begin
        FPCSCondName := Items[i];
        Break;
      end;
    end;
  end;
end;

procedure TfrmAvailPCSCondition.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caHide;
end;

procedure TfrmAvailPCSCondition.SetAvailableCondition(aList: TStrings);
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

procedure TfrmAvailPCSCondition.SetPCSCondName(aName: string);
begin
  FPCSCondName := aName;
end;

end.
