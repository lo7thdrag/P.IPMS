unit ufrmTableSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, uDataBase, uDBSupportClasses;

type
  TfrmTableSelect = class(TForm)
    edtTableName: TEdit;
    edtColumnName: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    strngrdList: TStringGrid;
    btnOK: TButton;
    btnCancel: TButton;
    btnBrowse: TButton;
    procedure btnBrowseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure strngrdListDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure strngrdListSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FList : TList;
    FData: TFieldDataTrend;
    procedure Clearlist;
  public
    { Public declarations }
    property Data : TFieldDataTrend read FData;
  end;

var
  frmTableSelect: TfrmTableSelect;

implementation

uses uMimicsSystem;

{$R *.dfm}

procedure TfrmTableSelect.btnBrowseClick(Sender: TObject);
begin
  Clearlist;
  SysMimics.Database.getFieldsTrend(FList);
  strngrdList.RowCount := FList.Count + 2;
  strngrdList.Invalidate;
end;

procedure TfrmTableSelect.FormCreate(Sender: TObject);
begin
  FList := TList.Create;

  with strngrdList do begin
    Cells[0,0] := 'Table Name';
    Cells[1,0] := 'Column Name';
    Cells[2,0] := 'Element Index';
    Cells[3,0] := 'Table Group';
  end;
end;

procedure TfrmTableSelect.FormDestroy(Sender: TObject);
begin
  Clearlist;
  FList.Free;
end;

procedure TfrmTableSelect.Clearlist;
var
  data : TFieldDataTrend;
  i : integer;
begin
  if FList.Count > 0 then
    for I := 0 to FList.Count - 1 do
    begin
      data := FList.Items[i];
      data.Free;
    end;

  Flist.Clear;
end;

procedure TfrmTableSelect.strngrdListDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  i : integer;
  data : TFieldDataTrend;
begin
  if FList.Count <= 0 then Exit;
  if ARow = 0 then Exit;

  i := ARow - 1;
  if i >= FList.Count then Exit;

  if i <= Flist.Count - 1  then
  begin
    data := FList.Items[i];

    if ACol = 0 then
      strngrdList.Canvas.TextOut(Rect.Left + 2,Rect.Top,data.TableName);

    if ACol = 1 then
      strngrdList.Canvas.TextOut(Rect.Left + 2,Rect.Top,data.ColumnName);

    if ACol = 2 then
      strngrdList.Canvas.TextOut(Rect.Left + 2,Rect.Top,'');

    if ACol = 3 then
      strngrdList.Canvas.TextOut(Rect.Left + 2,Rect.Top,'GROUP');
  end;
end;

procedure TfrmTableSelect.strngrdListSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  i : integer;
begin
  if FList.Count <= 0 then Exit;

  i := ARow - 1;
  if i <= Flist.Count - 1  then
  begin
    FData := FList.Items[i];
    edtTableName.Text := FData.TableName;
    edtColumnName.Text := FData.ColumnName;
  end;
end;

end.
