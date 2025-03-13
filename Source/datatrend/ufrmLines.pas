unit ufrmLines;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, StdCtrls, ExtCtrls, ComCtrls, ToolWin, Grids, uLineAttribute,
  RzCmboBx, Math, uTrendDataType, uTrendChart, ufrmLineAttribute, uDBSupportClasses,
  uDatabase, StrUtils, Buttons ;

type
  TCustomEdit = class(TEdit)
  public
    Data : TfrmLineAttribute;
  end;

  TfrmLines = class(TForm)
    lbl1: TLabel;
    strngrd1: TStringGrid;
    btnDisplay: TButton;
    cbbLineType: TComboBox;
    tlb1: TToolBar;
    btnNew1: TToolButton;
    btnCopy1: TToolButton;
    btnDeleter: TToolButton;
    btnQuickLInes1: TToolButton;
    btnLineAxisMap1: TToolButton;
    btnUp1: TToolButton;
    btnDown1: TToolButton;
    il1: TImageList;
    FColorBox: TRzColorComboBox;
    pnlCont: TPanel;
    btnNew: TSpeedButton;
    btnCopy: TSpeedButton;
    btnDelete: TSpeedButton;
    btnQuickLInes: TSpeedButton;
    btnLineAxisMap: TSpeedButton;
    btnUp: TSpeedButton;
    btnDown: TSpeedButton;
    pnlLogged: TPanel;
    lbl2: TLabel;
    lbl4: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl5: TLabel;
    cbbDatasource: TComboBox;
    edtUserID: TEdit;
    edtTableID: TEdit;
    btnTableID: TButton;
    edtPointID: TEdit;
    edtPassword: TEdit;
    btnPickDataSource: TButton;
    btnPointID: TButton;
    procedure FormCreate(Sender: TObject);
    procedure strngrd1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure strngrd1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FColorBoxChange(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnUpClick(Sender: TObject);
    procedure btnDownClick(Sender: TObject);
    procedure cbbLineTypeChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnQuickLInesClick(Sender: TObject);
    procedure btnLineAxisMapClick(Sender: TObject);
    procedure disablebtn(valBool : Boolean);
    procedure createNewData(var frm : TfrmLineAttribute);

    function checkNewAcces(val : Integer): Boolean;
  private
    { Private declarations }
    FDeleteFlag : Boolean;
    FIndexRow : Integer;
    FSessionID : Integer;
    FTextLineID : TCustomEdit;

    FData : TfrmLineAttribute;
    FDeletedLineData : TList;
    FBufferDeletedLine : TList;   //--> list untuk buffer LineAttribute yang didelete
    FFormLineAttr : TList;        //--> list untuk menyimpan Objek LineAttribute
    FChart : TTrendChart;
    FDatabase : TIPMSDatabase;

    procedure OnEditExit(Sender : TObject);
    procedure OnKeyPress(Sender: TObject; var Key: Char);
    procedure SetActiveData(aData :TfrmLineAttribute);
    procedure OnLineNameChange(Sender : TObject);
  public
    { Public declarations }
    procedure SetChart(aChart : TTrendChart);
    procedure SetDatabase(Value : TIPMSDatabase);
    procedure SetSession(Value : Integer);
    procedure AddElement(Value : String);
    procedure Apply;
    procedure Canceled;
  end;

var
  frmLines: TfrmLines;

implementation

uses ufrmLogged, ufrmLoggedExpression, ufrmlinePoint, ufrmTableSelect;

{$R *.dfm}

procedure TfrmLines.AddElement(Value: String);
var
  frm : TfrmLogged;
  i : integer;
  found : boolean;
  data : TLineData;
  tblName : String;
begin
  { add point type logged (default) }

  found := False;
  for i := 0 to FFormLineAttr.Count - 1 do
  begin

    frm := FFormLineAttr.Items[i];
    if frm.LineType = eltLogged then
    begin
      if Assigned(frm.LineData) then
      begin
        if ContainsStr(TLineData(frm.LineData).LineAttribute.LineID,Value) then
        begin
          found := True;
          Break;
        end;
      end;
    end
  end;

  if not found then
  begin

    frm   := TfrmLogged.Create(Self);
    data  := TLineData.Create;

    if Assigned(FDatabase) then
    begin
      tblName := FDatabase.getElementTableName(Value);
    end;

    Randomize;

    with frm do
    begin
      { frm properties }
      LineID := Value + 'VAL';
      InLegend := True;
      LineVisible := True;
      LineColor := RGB(Random(255),Random(255),Random(255));
      LineType := eltLogged;

      FColorBox.CustomColor := LineColor;
      FColorBox.ItemIndex := LineColor;
      FColorBox.Visible := False;

      cbbLineType.ItemIndex := 2; {eltLogged}
      cbbDatasource.ItemIndex := 2; {edsPrimLogPoints}

      UserId := '';
      Password := '';
      TableId := tblName;
      PointId := LineID;
      DataSource := E_DataSource(cbbDatasource.ItemIndex);
    end;

    {Menyimpan frm ke list}
    FFormLineAttr.Add(frm);

    {Menampilkan data melalui temporari FData}
    SetActiveData(frm);

    strngrd1.RowCount := strngrd1.RowCount + 1;
    if strngrd1.RowCount > 1 then
    begin
      strngrd1.FixedRows := 1;
      disablebtn(True);
    end;

    strngrd1.Invalidate;
  end;

  Apply;
end;

procedure TfrmLines.Apply;
var
  i : integer;
  data : TLineData;
  fline : TfrmLineAttribute;
begin

  { delete removeing linedata}
  for I := 0 to FDeletedLineData.Count - 1 do
  begin
    data := FDeletedLineData.Items[i];
    data.PointData.Clear;
    FChart.LineSeries.Remove(data);
    data.Free;
    data := nil
  end;
  FDeletedLineData.Clear;

  { delete buffer}
  FBufferDeletedLine.Clear;

  { applying linedata}
  for I := 0 to FFormLineAttr.Count - 1 do
  begin
    fline := FFormLineAttr.Items[i];

    if not Assigned(fline.LineData) then
    begin
      data := TLineData.Create;
      data.UseXAxis := FChart.AxisSeries.GetDefaultXAxis;
      data.UseYAxis := FChart.AxisSeries.GetDefaultYAxis;

      FChart.LineSeries.AddLine(data);
      fline.LineData := data;
    end
    else
      data := TLineData(fline.LineData);

    data.LineType := fline.LineType;
    data.LineAttribute.Color := fline.LineColor;

    if fline.LineID = '' then
      data.LineAttribute.LineID := TfrmLogged(fline).edtPointID.Text
    else
      data.LineAttribute.LineID := fline.LineID;

    data.LineAttribute.InLegend := fline.InLegend;
    data.LineAttribute.Visible := fline.LineVisible;

    case fline.LineType of
      eltPoint:
      begin
        data.PointID  := TfrmPointID(fline).edtPointID.Text;
      end;
      eltExpression:
      begin
      end;
      eltLogged:
      begin
        data.UserID   := TfrmLogged(fline).UserId;
        data.Password := TfrmLogged(fline).Password;
        data.TableID  := TfrmLogged(fline).TableId;
        data.PointID  := TfrmLogged(fline).PointId;
        data.DataSource := E_DataSource(TfrmLogged(fline).DataSource);

        if Assigned(FDatabase) then
        begin
          data.ClearPointData;
          FDatabase.getValueLogs(data.TableID,data.PointID,FSessionID,data.PointData);
          data.UpdatePointData;
        end;

      end;
      eltLoggedExpression:
      begin
        data.UserID   := TfrmLoggedExpression(fline).edtUserID.Text;
        data.Password := TfrmLoggedExpression(fline).edtPassword.Text;
        data.TableID  := TfrmLoggedExpression(fline).edtTableID.Text;
        data.PointID  := TfrmLoggedExpression(fline).edtPointID.Text;
        data.DataSource := E_DataSource(TfrmLoggedExpression(fline).cbbDatasource.ItemIndex);
      end;
      eltCSVFile: ;
      eltReferenceFile: ;
    end;
  end;
end;

procedure TfrmLines.btnCopyClick(Sender: TObject);
var
  frm : TfrmLineAttribute;
  aGridRect:TGridRect;
begin
  if checkNewAcces(2) then Exit;

  createNewData(frm);

  {Menyimpan frm ke list}
  FFormLineAttr.Add(frm);

  {Menampilkan data melalui temporari FData}
  SetActiveData(frm);

  {Menambah row stringgrid sesuai jumlah data frm di list FFormLineAttr}
  strngrd1.RowCount := FFormLineAttr.Count + 1;

  {Menghilangkan tampilan Color combo box di stringgrid}
  FColorBox.Visible := False;

  {Meletakkan select di akhir stringgrid}
  with aGridRect do begin
    Left := 0;
    Right := 3;
    Top := strngrd1.RowCount - 1;
    Bottom := strngrd1.RowCount;
  end;
  strngrd1.Selection := aGridRect;
  strngrd1.Invalidate;
end;

procedure TfrmLines.btnDeleteClick(Sender: TObject);
var
  aGridRect:TGridRect;
  frmbuffer : TfrmLineAttribute;
  i : Integer;
begin
  if checkNewAcces(3) then Exit;

  if Assigned(FData) then
  begin
    FFormLineAttr.Remove(FData);

    {Buffer dulu, takut g jadi d apply}
    createNewData(frmbuffer);
    frmbuffer.LineColor := FData.LineColor;
    FBufferDeletedLine.Add(frmbuffer);

    if Assigned(FData.LineData) then
      FDeletedLineData.Add(FData.LineData);

    FData.Free;
    FData := nil;

    strngrd1.RowCount := strngrd1.RowCount - 1;

    with aGridRect do
    begin
      Left := 0;
      Right := 3;
      Top := (strngrd1.RowCount) - 1;
      Bottom := strngrd1.RowCount;
    end;

    strngrd1.Selection := aGridRect;

    FColorBox.Visible := False;
    FTextLineID.Visible := False;

    cbbLineType.ItemIndex := 0;

    checkNewAcces(3);

    FDeleteFlag := True;
  end;
end;

procedure TfrmLines.btnDownClick(Sender: TObject);
begin
//  if Assigned(FData) then
//  begin
//    FLineSeries.MoveDown(FData);
//    strngrd1.Invalidate;
//  end;
end;

procedure TfrmLines.btnLineAxisMapClick(Sender: TObject);
begin
//       m
end;

procedure TfrmLines.btnNewClick(Sender: TObject);
var
  frm : TfrmLineAttribute;
  aGridRect:TGridRect;
begin
  if checkNewAcces(1) then Exit;

  {Merubah cbblinetype ke itemindex 0}
  cbbLineType.ItemIndex := 0;

  frm := TfrmLineAttribute.Create(Self);
  frm.LineID := '';
  frm.InLegend := True;
  frm.LineVisible := True;
  frm.LineColor := RGB(Random(255),Random(255),Random(255));

  {Menyimpan frm ke list}
  FFormLineAttr.Add(frm);

  {Menampilkan data melalui temporari FData}
  SetActiveData(frm);

  {Menambah row stringgrid sesuai jumlah data frm di list FFormLineAttr}
  strngrd1.RowCount := FFormLineAttr.Count + 1;

  {Menghilangkan tampilan Color combo box di stringgrid}
  FColorBox.Visible := False;

  if strngrd1.RowCount > 1 then
  begin
    strngrd1.FixedRows := 1;
    disablebtn(True);
  end;

  {Meletakkan select di akhir stringgrid}
  with aGridRect do begin
    Left := 0;
    Right := 3;
    Top := strngrd1.RowCount - 1;
    Bottom := strngrd1.RowCount;
  end;
  strngrd1.Selection := aGridRect;
  strngrd1.Invalidate;
end;

procedure TfrmLines.btnQuickLInesClick(Sender: TObject);
begin
  //     m
end;
procedure TfrmLines.btnUpClick(Sender: TObject);
begin
//  if Assigned(FData) then
//  begin
//    FLineSeries.MoveUp(FData);
//    strngrd1.Invalidate;
//  end;
end;

procedure TfrmLines.Canceled;
var
  i : Integer;
  aGridRect:TGridRect;
begin
  if FDeleteFlag then
  begin
    for i := 0 to FBufferDeletedLine.Count - 1 do
    begin
      FFormLineAttr.Add(FBufferDeletedLine.Items[i]);
    end;

    FBufferDeletedLine.Clear;

    strngrd1.RowCount := FFormLineAttr.Count + 1;
    if strngrd1.RowCount > 1 then
    begin
      strngrd1.FixedRows := 1;
      disablebtn(True);
    end;

    {Meletakkan select di akhir stringgrid}
    with aGridRect do begin
      Left := 0;
      Right := 3;
      Top := strngrd1.RowCount - 1;
      Bottom := strngrd1.RowCount;
    end;
    strngrd1.Selection := aGridRect;
    strngrd1.Invalidate;

    FDeleteFlag := False;
  end;
end;

procedure TfrmLines.cbbLineTypeChange(Sender: TObject);
var
  frm : TfrmLineAttribute;
  index : integer;
begin
  if not Assigned(FData) then Exit;

  if Assigned(FData) then
  begin
    if Byte(FData.LineType) = TComboBox(Sender).ItemIndex then Exit;
  end;

  index := FFormLineAttr.IndexOf(FData);
  frm := nil;

  case TComboBox(Sender).ItemIndex of
    0 :
    begin
      frm := TfrmLineAttribute.Create(Self);
      frm.LineType := eltPoint;
    end;
    1 :
    begin
      frm := TfrmLineAttribute.Create(Self);
      frm.LineType := eltExpression;
    end;
    2 :
    begin
      frm := TfrmLogged.Create(Self);
      frm.LineType := eltLogged;
    end;
    3 :
    begin
      frm := TfrmLineAttribute.Create(Self);
      frm.LineType := eltLoggedExpression
    end;
    4 :
    begin
      frm := TfrmLineAttribute.Create(Self);
      frm.LineType := eltCSVFile
    end;
    5 :
    begin
      frm := TfrmLineAttribute.Create(Self);
      frm.LineType := eltReferenceFile;
    end;
  end;

  if Assigned(frm) then
  begin
    frm.LineColor := FData.LineColor;
    frm.LineID := FData.LineID;
    frm.InLegend := FData.InLegend;
    frm.LineVisible := FData.LineVisible;
    frm.LineData := FData.LineData;

    FFormLineAttr.Delete(index);
    FFormLineAttr.Insert(index,frm);

    FData.Free;
    SetActiveData(frm);
  end;
end;

function TfrmLines.checkNewAcces(val : Integer): Boolean;
{New : 1; Copy : 2; Delete : 3}
var
  atemp : TfrmLineAttribute;
begin
  Result := False;

  if strngrd1.RowCount <= 1 then
  begin
    case val of
      2:
      begin
        Result := True;
      end;
      3:
      begin
        disablebtn(False);
        FColorBox.Visible := False;
        FTextLineID.Visible := False;
        Result := True;
      end;
    end;
  end
  else
  begin
    if val = 3 then
      Exit;

    atemp := FFormLineAttr.Items[FFormLineAttr.Count-1];
    case atemp.LineType of
      eltPoint: result := True;
      eltExpression: result := True;
      eltLogged:
      begin
        if Assigned(atemp) then
        begin
          if TfrmLogged(atemp).TableId = '' then
          begin
            MessageDlg('Table name could not be validated.', mtInformation, [mbOK], 0);
            result := True;
            exit;
          end;
          if TfrmLogged(atemp).TableId = '' then
          begin
            MessageDlg('Point name could not be validated.', mtInformation, [mbOK], 0);
            result := True;
          end
        end;
      end;
      eltLoggedExpression: result := True;
      eltCSVFile: result := True;
      eltReferenceFile: result := True;
    end;
  end;
end;

procedure TfrmLines.createNewData(var frm : TfrmLineAttribute);
begin
  case FData.LineType of
    eltPoint:;
    eltExpression: ;
    eltLogged:
    begin
      frm := TfrmLogged.Create(Self);
      {Randomize;}
      if Assigned(frm) then
      begin
        frm.LineColor := RGB(Random(255),Random(255),Random(255));
        frm.LineID := FData.LineID;
        frm.InLegend := FData.InLegend;
        frm.LineVisible := FData.LineVisible;
        frm.LineData := nil;

        TfrmLogged(frm).UserId := TfrmLogged(FData).UserId;
        TfrmLogged(frm).Password := TfrmLogged(FData).Password;
        TfrmLogged(frm).PointId := TfrmLogged(FData).PointId;
        TfrmLogged(frm).TableId := TfrmLogged(FData).TableId;
        TfrmLogged(frm).Datasource := TfrmLogged(FData).Datasource;
        TfrmLogged(frm).cbbDatasource.ItemIndex := Byte(TfrmLogged(frm).Datasource);
      end;
    end;
    eltLoggedExpression: ;
    eltCSVFile: ;
    eltReferenceFile: ;
  end;
end;

procedure TfrmLines.disablebtn(valBool : Boolean);
begin
  btnCopy.Enabled := valBool;
  btnDelete.Enabled := valBool;
  btnDisplay.Enabled := valBool;
  cbbLineType.Enabled := valBool;
  strngrd1.Enabled := valBool;
end;

procedure TfrmLines.FColorBoxChange(Sender: TObject);
begin
  if Assigned(FData) then
  begin
    FData.LineColor := FColorBox.SelectedColor;
  end;
end;

procedure TfrmLines.FormCreate(Sender: TObject);
begin
  FData := nil;
  FDeleteFlag := False;
  FDeletedLineData := TList.Create;
  FFormLineAttr := Tlist.Create;
  FBufferDeletedLine := Tlist.Create;

  with strngrd1 do begin
    Cells[0,0] := '  Color';
    Cells[1,0] := '  Line ID';
    Cells[2,0] := '  In Legend';
    Cells[3,0] := '  Visible';
  end;

  strngrd1.ColWidths[0] := 110;
  strngrd1.ColWidths[1] := 100;
  strngrd1.ColWidths[2] := 70;
  strngrd1.ColWidths[3] := 70;

  FIndexRow := 0;

  FTextLineID := TCustomEdit.Create(Self);
  FTextLineID.Visible := false;
  FTextLineID.Parent := strngrd1;
  FTextLineID.OnExit := OneditExit;
  FTextLineID.OnKeyPress := OnKeyPress;

  FSessionID := 0;
end;

procedure TfrmLines.FormDestroy(Sender: TObject);
begin
  FDeletedLineData.Free;
  FFormLineAttr.Free;
end;

procedure TfrmLines.OnEditExit(Sender: TObject);
begin
  if Assigned(TCustomEdit(Sender).Data) then
    TCustomEdit(Sender).Data.LineID := TCustomEdit(Sender).Text;

end;

procedure TfrmLines.OnKeyPress(Sender: TObject; var Key: Char);
begin
  if Assigned(TCustomEdit(Sender).Data) then
  begin
    if Key = #27 then
      TCustomEdit(Sender).Text := TCustomEdit(Sender).Data.LineID;

  end;

end;

procedure TfrmLines.OnLineNameChange(Sender : TObject);
var
  idx : Integer;
begin

  idx := FFormLineAttr.IndexOf(Sender);

  if idx >= 0 then
  begin

  end;

end;

procedure TfrmLines.SetActiveData(aData :TfrmLineAttribute);
begin
  if Assigned(Fdata) then
    FData.Hide;

  FData := aData;
  FData.Parent := pnlCont;
  FData.Align := alClient;
  FData.BorderStyle := bsNone;

  if aData.ClassType = TfrmLogged then
  begin
    with TfrmLogged(FData) do begin
      LineID := TfrmLogged(aData).PointId;
      UserId := TfrmLogged(aData).UserId;
      Password := TfrmLogged(aData).Password;
      PointId := TfrmLogged(aData).PointId;
      TableId := TfrmLogged(aData).TableId;
      Datasource := TfrmLogged(aData).Datasource;

      {Set edit text}
      cbbDatasource.ItemIndex := Byte(Datasource);
      edtUserID.Text := UserId;
      edtPassword.Text := Password;
      edtPointID.Text := PointId;
      edtTableID.Text := TableId;
    end;
  end;

  FData.Show;
end;

procedure TfrmLines.SetChart(aChart: TTrendChart);
var
  i : Integer;
  frm : TfrmLineAttribute;
  line : TLineData;
begin
  { free prop }

  for I := 0 to FFormLineAttr.Count - 1 do
  begin
    frm := FFormLineAttr.Items[i];
    frm.Free;
  end;
  FFormLineAttr.Clear;
  FChart := aChart;

  { create prop form }
  for I := 0 to FChart.LineSeries.Count - 1 do
  begin
    line := FChart.LineSeries.getLine(i);
    frm := nil;

    case line.LineType of
      eltPoint:
      begin
        frm := TfrmLineAttribute.Create(Self);
      end;
      eltExpression:
      begin
        frm := TfrmLineAttribute.Create(Self);
      end;
      eltLogged:
      begin
        frm := TfrmLogged.Create(Self);

        with TfrmLogged(frm) do begin
          UserId := line.UserID;
          Password := line.Password;
          PointId := line.PointId;
          TableId := line.TableId;
          Datasource := line.Datasource;
        end;
      end;
      eltLoggedExpression:
      begin
        frm := TfrmLineAttribute.Create(Self);
      end;
      eltCSVFile:
      begin
        frm := TfrmLineAttribute.Create(Self);
      end;
      eltReferenceFile:
      begin
        frm := TfrmLineAttribute.Create(Self);
      end;

    end;

    if Assigned(frm) then
    begin
      frm.LineType := line.LineType;
      frm.LineData := line;
      frm.LineColor := line.LineAttribute.Color;
      frm.LineVisible := line.LineAttribute.Visible;
      frm.LineID := line.LineAttribute.LineID;
      frm.InLegend := line.LineAttribute.InLegend;

      FFormLineAttr.Add(frm);
    end;

  end;

  if FFormLineAttr.Count > 0 then
    SetActiveData(FFormLineAttr.Items[0]);

  strngrd1.RowCount := FFormLineAttr.Count + 1;
  strngrd1.Invalidate;

end;

procedure TfrmLines.SetDatabase(Value: TIPMSDatabase);
begin
  FDatabase := Value;
end;

procedure TfrmLines.SetSession(Value: Integer);
begin
  FSessionID := Value;
end;

procedure TfrmLines.strngrd1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  s: TSize;
  r: TRect;
  aForm : TfrmLineAttribute;
begin
  if ARow > FFormLineAttr.Count then
  begin
    strngrd1.RowCount := FFormLineAttr.Count;
    Exit;
  end;

  if strngrd1.RowCount <= 1 then
  begin
    FTextLineID.Visible := False;
    FColorBox.Visible := False;
    Exit;
  end;

  if ARow <= 0 then Exit;

  strngrd1.Canvas.Brush.Style := bsClear;
  strngrd1.Canvas.Brush.Color := clWhite;

  aForm := FFormLineAttr.Items[ARow - 1];
  if Assigned(aForm) then
  begin
    if ACol = 0 then
    begin
      strngrd1.Canvas.Brush.Color := aForm.LineColor;
      strngrd1.Canvas.Brush.Style := bsSolid;
      strngrd1.Canvas.FillRect(Rect);

      if gdSelected in State then
      begin
        FColorBox.Width := Rect.Right - Rect.Left ;
        FColorBox.Height := Rect.Bottom - Rect.Top;
        FColorBox.Left := strngrd1.Left +  Rect.Left + 2;
        FColorBox.Top := strngrd1.Top + Rect.Top;
//        FColorBox.Visible := True;
      end else
//        FColorBox.Visible := False;

    end;
    if ACol = 1 then
    begin
      strngrd1.Canvas.TextOut(Rect.Left,Rect.Top,aForm.LineID);

      if gdSelected in State then
      begin
        FTextLineID.Width := Rect.Right - Rect.Left ;
        FTextLineID.Height := Rect.Bottom - Rect.Top;
        FTextLineID.Left := Rect.Left;
        FTextLineID.Top := Rect.Top;
        FTextLineID.Text := aForm.LineID;
        FTextLineID.Visible := True;
        FTextLineID.Data := aForm;
        FTextLineID.SelectAll;
      end else
        FTextLineID.Visible := False;

    end;

    if ACol in [2,3] then
    begin
      FillRect(strngrd1.Canvas.Handle, Rect, GetStockObject(WHITE_BRUSH));
      s.cx := GetSystemMetrics(SM_CXMENUCHECK);
      s.cy := GetSystemMetrics(SM_CYMENUCHECK);

      r.Top := Rect.Top + (Rect.Bottom - Rect.Top - s.cy) div 2;
      r.Bottom := r.Top + s.cy;
      r.Left := Rect.Left + (Rect.Right - Rect.Left - s.cx) div 2;
      r.Right := r.Left + s.cx;

      if ACol = 2 then
        DrawFrameControl(strngrd1.Canvas.Handle,
          r,
          DFC_BUTTON,
          IfThen(aForm.InLegend, DFCS_CHECKED, DFCS_BUTTONCHECK));

      if ACol = 3 then
        DrawFrameControl(strngrd1.Canvas.Handle,
          r,
          DFC_BUTTON,
          IfThen(aForm.LineVisible, DFCS_CHECKED, DFCS_BUTTONCHECK));
    end;
  end;
end;

procedure TfrmLines.strngrd1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
var
  aForm : TfrmLineAttribute;
begin
  if ARow <= 0 then Exit;

  if ARow > FFormLineAttr.Count then Exit;

  aForm := FFormLineAttr.Items[Arow - 1];

  if Assigned(aForm) then
  begin
    SetActiveData(aForm);

    {Merubah cbblinetype sesuai itemindex }
    cbbLineType.ItemIndex := Byte(aForm.LineType);
    cbbLineTypeChange(cbbLineType);

    if ACol = 0 then
    begin
      FColorBox.CustomColor := FData.LineColor;
      FColorBox.ItemIndex := FColorBox.Items.Count - 1;
      FColorBox.Visible := True;
    end;

    if ACol = 2 then
      FData.InLegend := not FData.InLegend;

    if ACol = 3 then
      FData.LineVisible := not FData.LineVisible;
  end;
end;

end.
