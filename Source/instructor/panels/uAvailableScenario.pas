unit uAvailableScenario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmAvailScenario = class(TForm)
    lstAvail: TListBox;
    pnl2: TPanel;
    btnOK: TButton;
    btnCancel: TButton;
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FScenarioName: String;
    procedure SetScenarioName(const Value: String);
    { Private declarations }
  public
    { Public declarations }
    procedure SetAvailableScenario(aList : TStrings);

    property ScenarioName : String read FScenarioName write SetScenarioName;
  end;

var
  frmAvailScenario: TfrmAvailScenario;

implementation

{$R *.dfm}

{ TfrmAvailScenario }

procedure TfrmAvailScenario.btnOKClick(Sender: TObject);
var
  i : Integer;
begin

  FScenarioName := '';

  with lstAvail do
  begin
    for i := -1 + Items.Count downto 0 do
      if Selected[i] then
      begin
        FScenarioName := lstAvail.Items[i];
        Break;
      end;
  end;
end;

procedure TfrmAvailScenario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caHide;
end;

procedure TfrmAvailScenario.SetAvailableScenario(aList: TStrings);
var
  i : Integer;
begin
  if not Assigned(aList) then
    Exit;

  if lstAvail.Count > 0 then
  lstAvail.Clear;

  for i := 0 to aList.Count - 1 do
  begin
    lstAvail.Items.Add(aList[i]);
  end;

end;

procedure TfrmAvailScenario.SetScenarioName(const Value: String);
begin
  FScenarioName := Value;
end;

end.
