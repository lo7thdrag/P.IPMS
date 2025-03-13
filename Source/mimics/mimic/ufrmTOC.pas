unit ufrmTOC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,ufrmMimics, StdCtrls, uDataType, TFlatEditUnit, ufrmMain, Menus;

type
  TOnMimicTOCCommand = procedure (Sender : TObject; CmdMimic : E_MimicType) of object;

  TfrmTOC = class(TfrmMimics)
    lblGeneral: TLabel;
    lblPropulsion: TLabel;
    lblAux: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl19: TLabel;
    lbl20: TLabel;
    lbl21: TLabel;
    lbl22: TLabel;
    lbl23: TLabel;
    lbl24: TLabel;
    lblEnergy: TLabel;
    lblSafety: TLabel;
    lblMisc: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl18: TLabel;
    lbl25: TLabel;
    lbl26: TLabel;
    lbl27: TLabel;
    lbl28: TLabel;
    pmGroup: TPopupMenu;
    PVGroup: TMenuItem;
    HlpGroup: TMenuItem;
    PropGroup: TMenuItem;
    pmTrend: TPopupMenu;
    mniPointView1: TMenuItem;
    mniHelp1: TMenuItem;
    mniProperties1: TMenuItem;
    mniAddToTrend1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure PVGroupClick(Sender: TObject);
    procedure PropGroupClick(Sender: TObject);
    procedure mniPointView1Click(Sender: TObject);
    procedure mniProperties1Click(Sender: TObject);
    procedure mniAddToTrend1Click(Sender: TObject);
  private
    FOnMimicTOCCommand: TOnMimicTOCCommand;
    procedure SetOnMimicTOCCommand(const Value: TOnMimicTOCCommand);
    procedure OnCommandClick(Sender : TObject);
    { Private declarations }
  public
    { Public declarations }
    property OnMimicTOCCommand : TOnMimicTOCCommand read FOnMimicTOCCommand
      write SetOnMimicTOCCommand;
  end;

var
  frmTOC: TfrmTOC;

implementation

uses
  uFunction, ufrmPointView, ufrmProperties, ufrmSelectTrend,
  ufrmHistoricalRealtime;

{$R *.dfm}

{ TfrmTOC }

procedure TfrmTOC.FormCreate(Sender: TObject);
var
  i : Integer;
  mt : E_MimicType;
begin
  inherited;

  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i].ClassType = TLabel) and (Components[i].Tag > 0) then
    begin
      TLabel(Components[i]).ParentColor := True;
      TLabel(Components[i]).Font.Color := clWhite;

      mt := E_MimicType(Components[i].Tag);

      TLabel(Components[i]).Caption := MimicNumber(mt) + '. ' + MimicTitle(mt);
      TLabel(Components[i]).Cursor  := crUpArrow;
      TLabel(Components[i]).OnClick := OnCommandClick;
    end;
  end;
end;

procedure TfrmTOC.mniAddToTrend1Click(Sender: TObject);
begin
  inherited;

  frmHistoricalRealtime.Show;
  frmSelectTrend.Show;
end;

procedure TfrmTOC.mniPointView1Click(Sender: TObject);
begin
  inherited;

  frmPointView.Show;
  frmPointView.Caption := 'Point View - Link Container';
end;

procedure TfrmTOC.mniProperties1Click(Sender: TObject);
begin
  inherited;

  frmProperts.Show;
  frmProperts.Caption := 'Properties - Link Container';
end;

procedure TfrmTOC.OnCommandClick(Sender: TObject);
begin
  if Assigned(FOnMimicTOCCommand) then
    FOnMimicTOCCommand(Self, E_MimicType(TLabel(Sender).Tag));
end;

procedure TfrmTOC.PVGroupClick(Sender: TObject);
begin
  inherited;

  frmPointView.Show;
  frmPointView.Caption := 'Point View - Group';
end;

procedure TfrmTOC.PropGroupClick(Sender: TObject);
begin
  inherited;

  frmProperts.Show;
  frmProperts.Caption := 'Properties - Group';
end;

procedure TfrmTOC.SetOnMimicTOCCommand(const Value: TOnMimicTOCCommand);
begin
  FOnMimicTOCCommand := Value;
end;

end.
