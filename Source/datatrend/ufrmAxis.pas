unit ufrmAxis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ToolWin, Grids, ExtCtrls, Mask, ImgList, RzCmboBx,
  uAxisAttribute, uTrendDataType, Math, uTrendChart, ufrmSetAxisProp,
  ufrmNewAxis;

type
  TfrmAxis = class(TForm)
    strngrd2: TStringGrid;
    tlb1: TToolBar;
    btnNew: TToolButton;
    btnCopy: TToolButton;
    btnDeleter: TToolButton;
    btnQuickLInes: TToolButton;
    btnLineAxisMap: TToolButton;
    il1: TImageList;
    cbbFColorBox: TRzColorComboBox;
    pnlProp: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure strngrd2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure strngrd2SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure cbbFColorBoxChange(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnDeleterClick(Sender: TObject);
  private
    { Private declarations }
    FChart : TTrendChart;
    FFormProperties : TList;
    FActiveFormProp : TfrmSetAxisProp;
    FLastShownProp : TfrmSetAxisProp;
    FDeletedData : TList;
    procedure SetActiveData(aFormProp :TfrmSetAxisProp);
  public
    { Public declarations }
    procedure SetChart(chart : TTrendChart);
    procedure Apply;
  end;

var
  frmAxis: TfrmAxis;

implementation

uses
  ufrmSetYAxisProp, ufrmSetXAxisProp, uMimicsSystem;

{$R *.dfm}

function SecondToHMS(aValue : integer):String;
  function Fill2Digit(aNum : Integer) : string;
  var
    snum : String;
  begin
    snum := IntToStr(aNum);
    if Length(snum) <= 1 then
      snum := '0' + snum;

    result := snum;
  end;
var
  s,mm,h : integer;

begin
  result := '00:00:00';

  if aValue < 60 then begin
    result := '00:00:' + Fill2Digit(aValue);
    exit;
  end;

  s := aValue mod 60;
  mm := aValue div 60;
  if mm < 60 then begin
    result := '00:' + Fill2Digit(mm) + ':' + Fill2Digit(s);
    exit;
  end;

  h := mm div 60;
  result := Fill2Digit(h)  + ':' + Fill2Digit(mm) + ':' + Fill2Digit(s);
end;

function HMSToSecond(aValue : String):integer;
var
  l : TStrings;
  h,m,s : integer;
begin
  l := TStringList.Create;

  l.Delimiter := ':';
  l.DelimitedText := aValue;

  TryStrToInt(l[0],h);
  TryStrToInt(l[1],m);
  TryStrToInt(l[2],s);

  result := h * 3600 + m * 60 + s;

  l.Free;
end;

procedure TfrmAxis.Apply;
var
  i : integer;
  frm : TfrmSetAxisProp;
  axis : TAxisAttribute;
  d,m,y,h,n,s, nh, nn, ns,nms : Word;
  l : TStrings;
  dt : TDateTime;
begin
  for I := 0 to FDeletedData.Count - 1 do
  begin
    axis := FDeletedData.Items[i];
    if Assigned(FChart) then
      FChart.AxisSeries.RemoveAxis(axis);
  end;
  FDeletedData.Clear;

  for I := 0 to FFormProperties.Count - 1 do
  begin
    frm := FFormProperties.Items[i];

    case frm.AxisType of
      eatXTime :
      begin

        with TfrmSetXAxisProp(frm) do begin
          if not Assigned(AxisData) then
          begin
            axis := TXAxisAttribute.Create;
            axis.AxisID := AxisID;
            AxisData := axis;
            FChart.AxisSeries.AddAxis(axis);
          end;

          TXAxisAttribute(AxisData).AxisLabel := edtLabelAxis.Text;
          TXAxisAttribute(AxisData).Duration  := HMSToSecond(medtDuration.Text);
          TXAxisAttribute(AxisData).Color     := AxisColor;
          TXAxisAttribute(AxisData).NoScroll  := chkNoScroll.Checked;
          TXAxisAttribute(AxisData).Visible   := AxisVisible;
          TXAxisAttribute(AxisData).Ticks     := StrToInt(edtTicks.Text);
          TXAxisAttribute(AxisData).Numbered  := chkNumbered.Checked;

          case cbbStartDay.ItemIndex of
            { most recent }
            0 :
            begin
              TXAxisAttribute(AxisData).StartDateType := exaMostRecent;
              TXAxisAttribute(AxisData).StartDate := SysMimics.Mimic.ServerRunningTime;
            end;
            { start date }
            1 :
            begin
              l := TStringList.Create;
              l.Delimiter := '/';
              l.DelimitedText := medtStartDay.Text;

              d := StrToInt(l[0]);
              m := StrToInt(l[1]);
              y := StrToInt(l[2]);

              TXAxisAttribute(AxisData).StartDateType := exaStartDate;
              dt := EncodeDate(y,m,d);

              l.Clear;
              case cbbStartTime.ItemIndex of
                { start time }
                0 :
                begin
                  TXAxisAttribute(AxisData).StartTimeType := exaStartTime;

                  l.Delimiter := ':';
                  l.DelimitedText := medtStartTime.Text;

                  h := StrToInt(l[0]);
                  n := StrToInt(l[1]);
                  s := StrToInt(l[2]);

                  dt := dt + EncodeTime(h,n,s,0);

                  TXAxisAttribute(AxisData).StartTime := EncodeTime(h,n,s,0);
                end;
                {now minus time }
                1 :
                begin
                  TXAxisAttribute(AxisData).StartTimeType := exaNowMinTime;

                  l.Delimiter := ':';
                  l.DelimitedText := medtStartTime.Text;

                  h := StrToInt(l[0]);
                  n := StrToInt(l[1]);
                  s := StrToInt(l[2]);

                  DecodeTime(Now,nh,nn,ns,nms);

                  dt := dt + EncodeTime(nh,nn,ns,nms);
                  dt := dt - EncodeTime(h,n,s,0);

                  TXAxisAttribute(AxisData).StartTime := EncodeTime(h,n,s,0);
                end;
              end;

              TXAxisAttribute(AxisData).StartDate := dt;
              l.Free;
            end;

            { now minus day }
            2 :
            begin

              TXAxisAttribute(AxisData).StartDateType := exaNowMinDays;
              TXAxisAttribute(AxisData).DiffDays := StrToInt(medtStartDay.Text);
              DecodeDate(Now - TXAxisAttribute(AxisData).DiffDays,y,m,d);
              dt := EncodeDate(y,m,d) ;

              l := TStringList.Create;
              l.Clear;
              case cbbStartTime.ItemIndex of
                { start time }
                0 :
                begin
                  TXAxisAttribute(AxisData).StartTimeType := exaStartTime;

                  l.Delimiter := ':';
                  l.DelimitedText := medtStartTime.Text;

                  h := StrToInt(l[0]);
                  n := StrToInt(l[1]);
                  s := StrToInt(l[2]);

                  dt := dt + EncodeTime(h,n,s,0);
                  TXAxisAttribute(AxisData).StartTime := EncodeTime(h,n,s,0);

                end;
                {now minus time }
                1 :
                begin
                  TXAxisAttribute(AxisData).StartTimeType := exaNowMinTime;

                  l.Delimiter := ':';
                  l.DelimitedText := medtStartTime.Text;

                  h := StrToInt(l[0]);
                  n := StrToInt(l[1]);
                  s := StrToInt(l[2]);

                  DecodeTime(Now,nh,nn,ns,nms);

                  dt := dt + EncodeTime(nh,nn,ns,nms);
                  dt := dt - EncodeTime(h,n,s,0);
                  TXAxisAttribute(AxisData).StartTime := EncodeTime(h,n,s,0);
                end;
              end;

              TXAxisAttribute(AxisData).StartDate := dt;
              l.Free;
            end;
          end;

        end

      end;
      eatY :
      begin
        with TfrmSetYAxisProp(frm) do begin
          if not Assigned(AxisData) then
          begin
            axis := TYAxisAttribute.Create;
            axis.AxisID := AxisID;
            AxisData := axis;
            FChart.AxisSeries.AddAxis(axis);
          end;

          TYAxisAttribute(AxisData).AxisLabel := edtLabelAxis.Text;
          TYAxisAttribute(AxisData).Color     := AxisColor;
          TYAxisAttribute(AxisData).Visible   := AxisVisible;
          TYAxisAttribute(AxisData).Ticks     := StrToInt(edtTicks.Text);
          TYAxisAttribute(AxisData).Numbered  := chkNumbered.Checked;
          TYAxisAttribute(AxisData).IsAutoScale := chkAutoscale.Checked;
          TYAxisAttribute(AxisData).UsePointLimit := chkUsePoint.Checked;
          TYAxisAttribute(AxisData).DefaultLowerLimit := StrToInt(edtLowerLimit.Text);
          TYAxisAttribute(AxisData).DefaultUpperLimit := StrToInt(edtUpperLimit.Text);

        end;
      end;
    end;
  end;
end;

procedure TfrmAxis.btnDeleterClick(Sender: TObject);
begin
  if Assigned(FActiveFormProp) then
  begin
    if Assigned(FActiveFormProp.AxisData) then
      FDeletedData.Add(FActiveFormProp.AxisData);

    FActiveFormProp.Free;
  end;
end;

procedure TfrmAxis.btnNewClick(Sender: TObject);
var
  frm : TfrmSetAxisProp;
begin
  frmNewAxis := TfrmNewAxis.Create(Self);

  if frmNewAxis.ShowModal = mrOk then begin
    with frmNewAxis do begin
      { new x axis }
      if rg1.ItemIndex = 0 then
      begin
        frm := TfrmSetXAxisProp.Create(Self);
      end
      else
      { new y axis }
      begin
        frm := TfrmSetYAxisProp.Create(Self);
      end;

      frm.AxisID      := edtAxisID.Text;
      frm.AxisVisible := True;
      frm.AxisColor   := RGB(Random(255),Random(255),Random(255));
      frm.AxisDefault := False;

      FFormProperties.Add(frm);
      SetActiveData(frm);

      strngrd2.RowCount := FFormProperties.Count + 1;
    end;
  end;
end;

procedure TfrmAxis.cbbFColorBoxChange(Sender: TObject);
begin
  if Assigned(FActiveFormProp) then
  begin
    FActiveFormProp.AxisColor := cbbFColorBox.SelectedColor;
  end;

end;

procedure TfrmAxis.FormCreate(Sender: TObject);
begin

  FDeletedData := TList.Create;
  FFormProperties := TList.Create;

  with strngrd2 do begin
    Cells[0,0] := 'Color';
    Cells[1,0] := 'Axis ID';
    Cells[2,0] := 'Type';
    Cells[3,0] := 'Visible';
  end;

  strngrd2.ColWidths[0] := 110;
  strngrd2.ColWidths[1] := 100;
  strngrd2.ColWidths[2] := 70;
  strngrd2.ColWidths[3] := 70;

  cbbFColorBox.Visible := false;

  strngrd2.RowCount := 2;
  FLastShownProp := nil;
  Randomize;
end;

procedure TfrmAxis.SetActiveData(aFormProp :TfrmSetAxisProp);
begin
  FActiveFormProp := aFormProp;

  if Assigned(FLastShownProp) then
    FLastShownProp.Hide;

  FLastShownProp := FActiveFormProp;
  FLastShownProp.Parent := pnlProp;
  FLastShownProp.Show;

end;

procedure TfrmAxis.SetChart(chart: TTrendChart);
  function IntTo2DgtStr(aValue : Word) : string;
  var
    s : String;
  begin
    s := IntToStr(aValue);
    if Length(s) = 1 then
      s := '0' + s;

    Result := s;
  end;
var
  i : Integer;
  axis :TAxisAttribute;
  frm : TfrmSetAxisProp;
  y,m,d,h,n,s,ms : word;
begin

  { free prop }
  for I := 0 to FFormProperties.Count - 1 do
  begin
    frm := FFormProperties.Items[i];
    frm.Free;
  end;
  FFormProperties.Clear;
  FChart := chart;

  { create prop form }
  for I := 0 to FChart.AxisSeries.Count - 1 do
  begin
    axis := FChart.AxisSeries.GetAxis(i) ;
    case axis.AxisType of
      eatXTime :
        begin
          frm := TfrmSetXAxisProp.Create(Self);
          with TfrmSetXAxisProp(frm) do begin
            AxisColor   := axis.Color;
            AxisVisible := axis.Visible;
            AxisData    := axis;
            AxisID      := axis.AxisID;
            AxisDefault := axis.DefaultAxis;

            edtLabelAxis.Text := axis.AxisLabel;
            edtTicks.Text := IntToStr(axis.Ticks);
            chkNumbered.Checked := axis.Numbered;
            medtDuration.Text := SecondToHMS(TXAxisAttribute(axis).Duration);

            case TXAxisAttribute(axis).StartDateType of

              exaMostRecent :
              begin
                cbbStartDay.ItemIndex := 0;
                cbbStartDayChange(cbbStartDay);
              end;

              exaStartDate :
              begin
                cbbStartDay.ItemIndex := 1;
                cbbStartDayChange(cbbStartDay);

                DecodeDate(TXAxisAttribute(axis).StartDate,y,m,d);
                medtStartDay.Text := IntTo2DgtStr(d) + '/' + IntTo2DgtStr(m) + '/' + IntToStr(y);

                case TXAxisAttribute(axis).StartTimeType of

                  exaStartTime :
                  begin
                    cbbStartTime.ItemIndex := 0;
                    DecodeTime(TXAxisAttribute(axis).StartTime,h,n,s,ms);
                    medtStartTime.Text := IntTo2DgtStr(h) + ':' + IntTo2DgtStr(n) + ':' + IntToStr(s);
                  end;

                  exaNowMinTime :
                  begin
                    cbbStartTime.ItemIndex := 1;
                    DecodeTime(TXAxisAttribute(axis).StartTime,h,n,s,ms);
                    medtStartTime.Text := IntTo2DgtStr(h) + ':' + IntTo2DgtStr(m) + ':' + IntToStr(s);
                  end;

                end;
              end;

              exaNowMinDays :
              begin
                cbbStartDay.ItemIndex := 2;
                cbbStartDayChange(cbbStartDay);
                medtStartDay.Text := IntToStr(TXAxisAttribute(axis).DiffDays);

                case TXAxisAttribute(axis).StartTimeType of

                  exaStartTime :
                  begin
                    cbbStartTime.ItemIndex := 0;
                    DecodeTime(TXAxisAttribute(axis).StartTime,h,n,s,ms);
                    medtStartTime.Text := IntTo2DgtStr(h) + ':' + IntTo2DgtStr(n) + ':' + IntToStr(s);
                  end;

                  exaNowMinTime :
                  begin
                    cbbStartTime.ItemIndex := 1;
                    DecodeTime(TXAxisAttribute(axis).StartTime,h,n,s,ms);
                    medtStartTime.Text := IntTo2DgtStr(h) + ':' + IntTo2DgtStr(m) + ':' + IntToStr(s);
                  end;
                end
              end;

            end;
          end;
          FFormProperties.Add(frm);
        end;
      eatY :
        begin
          frm := TfrmSetYAxisProp.Create(Self);
          with TfrmSetYAxisProp(frm) do begin
            AxisColor   := axis.Color;
            AxisVisible := axis.Visible;
            AxisData    := axis;
            AxisID      := axis.AxisID;
            AxisDefault := axis.DefaultAxis;

            edtLabelAxis.Text := axis.AxisLabel;
            edtTicks.Text := IntToStr(axis.Ticks);
            chkNumbered.Checked := axis.Numbered;
            edtLowerLimit.Text := IntToStr(TYAxisAttribute(axis).DefaultLowerLimit);
            edtUpperLimit.Text := IntToStr(TYAxisAttribute(axis).DefaultUpperLimit);
            chkAutoscale.Checked := TYAxisAttribute(axis).IsAutoScale;
            chkUsePoint.Checked := TYAxisAttribute(axis).UsePointLimit;
          end;
          FFormProperties.Add(frm);
        end;
    end;

  end;

  if FFormProperties.Count > 0 then
    SetActiveData(FFormProperties.Items[0]);

  strngrd2.RowCount := FChart.AxisSeries.Count + 1;
  strngrd2.Invalidate;
end;

procedure TfrmAxis.strngrd2DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  s: TSize;
  r: TRect;
  aForm : TfrmSetAxisProp;
begin

  if ARow > FFormProperties.Count then Exit;
  if ARow <= 0 then Exit;

//  index := ARow * strngrd2.ColCount + ACol;
  strngrd2.Canvas.Brush.Style := bsClear;
  strngrd2.Canvas.Brush.Color := clWhite;

  aForm := FFormProperties.Items[ARow - 1];
  if Assigned(aForm) then
  begin
    strngrd2.Canvas.Brush.Style := bsClear;

    if ACol = 0 then
    begin
      strngrd2.Canvas.Brush.Color := aForm.AxisColor;
      strngrd2.Canvas.Brush.Style := bsSolid;
      strngrd2.Canvas.FillRect(Rect);

      if gdSelected in State then
      begin
        cbbFColorBox.Width := Rect.Right - Rect.Left ;
        cbbFColorBox.Height := Rect.Bottom - Rect.Top;
        cbbFColorBox.Left := strngrd2.Left +  Rect.Left + 2;
        cbbFColorBox.Top := strngrd2.Top + Rect.Top;
        cbbFColorBox.Visible := True;
      end else
        cbbFColorBox.Visible := False;

    end;

    if ACol = 1 then
    begin
      strngrd2.Canvas.TextOut(Rect.Left,Rect.Top,aForm.AxisID);
    end;

    if ACol = 2 then
    begin
      case aForm.AxisType of
        eatXTime: strngrd2.Canvas.TextOut(Rect.Left,Rect.Top,'X Time');
        eatY: strngrd2.Canvas.TextOut(Rect.Left,Rect.Top,'Y');
      end;

    end;

    if ACol = 3 then
    begin
      FillRect(strngrd2.Canvas.Handle, Rect, GetStockObject(WHITE_BRUSH));
      s.cx := GetSystemMetrics(SM_CXMENUCHECK);
      s.cy := GetSystemMetrics(SM_CYMENUCHECK);

      r.Top := Rect.Top + (Rect.Bottom - Rect.Top - s.cy) div 2;
      r.Bottom := r.Top + s.cy;
      r.Left := Rect.Left + (Rect.Right - Rect.Left - s.cx) div 2;
      r.Right := r.Left + s.cx;

      if ACol = 3 then
        DrawFrameControl(strngrd2.Canvas.Handle,
          r,
          DFC_BUTTON,
          IfThen(aForm.AxisVisible, DFCS_CHECKED, DFCS_BUTTONCHECK));

    end;
  end;

end;

procedure TfrmAxis.strngrd2SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
var
  aForm : TfrmSetAxisProp;
begin

  if ARow > FFormProperties.Count  then Exit;

  aForm := FFormProperties.Items[Arow - 1];

  if Assigned(aForm) then
  begin
    SetActiveData(aForm);

    if ACol = 0 then
    begin
      cbbFColorBox.CustomColor := aForm.AxisColor;
      cbbFColorBox.ItemIndex := cbbFColorBox.Items.Count - 1;
    end;

    if ACol = 3 then begin
      aForm.AxisVisible := not aForm.AxisVisible;
    end;
  end;

end;

end.
