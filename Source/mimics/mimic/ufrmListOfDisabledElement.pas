unit ufrmListOfDisabledElement;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMimics, ExtCtrls, uDatabase, jpeg, uListener, StdCtrls,
  AdvProgressBar, uDBSupportClasses, ComCtrls;

type
  TfrmListOfDisabledElement = class(TfrmMimics)
    Image1: TImage;
    pnl1: TPanel;
    lbl1: TLabel;
    ProgressBar1: TAdvProgressBar;
    btnCancel: TButton;
    btnRefresh: TButton;
    tmr1: TTimer;
    lvDisElement: TListView;
    procedure FormResize(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    aList : TList;
  public
    procedure SetListElement(aElem: TElementData);
    procedure ShowListElement;
  end;

var
  frmListOfDisabledElement: TfrmListOfDisabledElement;

implementation

{$R *.dfm}

procedure TfrmListOfDisabledElement.btnCancelClick(Sender: TObject);
begin
  inherited;

  pnl1.Visible := False;
end;

procedure TfrmListOfDisabledElement.btnRefreshClick(Sender: TObject);
begin
  inherited;

  tmr1.Enabled := True;
  tmr1.Interval := 10;
  ProgressBar1.Position := 0;
  pnl1.Visible := True;

  ShowListElement;
end;

procedure TfrmListOfDisabledElement.FormCreate(Sender: TObject);
begin
  inherited;

  tmr1.Enabled := True;
  tmr1.Interval := 10;
//  pnl1.Visible := True;
  aList := TList.Create;
end;

procedure TfrmListOfDisabledElement.FormResize(Sender: TObject);
begin
  inherited;

  Image1.Left := 0;
  Image1.Top := 0;
  Image1.Height := Height;
  Image1.Width := Width;
end;

procedure TfrmListOfDisabledElement.SetListElement(aElem: TElementData);
begin
  if Assigned(aElem) then
    aList.Add(aElem);
end;

procedure TfrmListOfDisabledElement.ShowListElement;
var
  i: Integer;
  elm: TElementData;
begin
  lvDisElement.Clear;

  for i := 0 to aList.Count - 1 do
  begin
    elm := aList.Items[i];

    with lvDisElement.Items.Add do
    begin
      Caption := elm.ElementID;
      SubItems.Add(elm.Elementname);
      SubItems.Add(IntToStr(elm.MainMimic_IDfk));
    end;
  end;
end;

procedure TfrmListOfDisabledElement.tmr1Timer(Sender: TObject);
begin
  inherited;

  if not Assigned(aList) then
    aList := TList.Create;

  ProgressBar1.Position := ProgressBar1.Position + 1;

  if ProgressBar1.Position > 50 then
    ProgressBar1.Font.Color := clWhite
  else
    ProgressBar1.Font.Color := clBlack;

  if ProgressBar1.Position = 100 then
  begin
    tmr1.Enabled := False;
    pnl1.Visible := False;
    ShowListElement;
  end;
end;

end.
