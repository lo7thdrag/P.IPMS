unit ufrmSelectElement;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uDBSupportClasses, uMimicsSystem;

type
  TOnSelectNewElementID = procedure(aElementID: string) of object;

  TfrmSelectElement = class(TForm)
    edtElementID: TEdit;
    lstElementID: TListBox;
    btnOK: TButton;
    btnCancel: TButton;
    grp1: TGroupBox;
    lblElementDesc: TLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure lstElementIDClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    FElementID : string;
    FOnSelectNewElementID : TOnSelectNewElementID;

    procedure SetOnSelectNewElementID(aOnSelectNewElementID: TOnSelectNewElementID);
  public
    { Public declarations }
    procedure SetListElementID(listElementID: TStrings);

    property ElementID: string read FElementID write FElementID;
    property OnSelectNewElementID : TOnSelectNewElementID read FOnSelectNewElementID write SetOnSelectNewElementID;
  end;

var
  frmSelectElement: TfrmSelectElement;

implementation

{$R *.dfm}

procedure TfrmSelectElement.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSelectElement.btnOKClick(Sender: TObject);
begin
  if Assigned(FOnSelectNewElementID) then
    FOnSelectNewElementID(ElementID);

  Close;
end;

procedure TfrmSelectElement.FormCreate(Sender: TObject);
begin
//
end;

procedure TfrmSelectElement.FormResize(Sender: TObject);
var
  l : DWORD;
begin
  l := GetWindowLong(Self.Handle, GWL_STYLE);
  l := l and not (WS_MINIMIZEBOX);
  l := l and not (WS_MAXIMIZEBOX);
  SetWindowLong(Self.Handle, GWL_STYLE, l);

  Left := (Screen.Width - Width)  div 2;
  Top := (Screen.Height - Height) div 2;
end;

procedure TfrmSelectElement.lstElementIDClick(Sender: TObject);
var
  elementData : TElementData;
begin
  ElementID := TListBox(Sender).Items[TListBox(Sender).ItemIndex];
  edtElementID.Text := ElementID;

  elementData := SysMimics.Database.GetElement(ElementID);

  if Assigned(elementData) then
    lblElementDesc.Caption := elementData.Elementname;
end;

procedure TfrmSelectElement.SetListElementID(listElementID: TStrings);
var
  i: Integer;
begin
  lstElementID.Items.Clear;

  for i := 0 to listElementID.Count - 1 do
    lstElementID.Items.Add(listElementID[i]);
end;

procedure TfrmSelectElement.SetOnSelectNewElementID(aOnSelectNewElementID: TOnSelectNewElementID);
begin
  FOnSelectNewElementID := aOnSelectNewElementID;
end;

end.
