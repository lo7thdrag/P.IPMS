unit uTrendChart;

interface

uses
  Classes, Controls, Dialogs, Graphics, Messages, SysUtils, Windows, Forms,
  uTrendData, uAxisAttribute, uLineAttribute, uTrendDataType, Math,
  uGridAttribute, uLegendAttribute, StdCtrls;

type

  TSliderValues = array of TDateTime;
  TSliderAxises = array of string;
  TSliderPosition = procedure(SliderType : integer; SliderValues : TSliderValues;
    SliderAxises : TSliderAxises) of object;

  TTrendChart = class(TCustomControl)
  private

    FData : TList;
    FAxisSeries : TAxisSeries;
    FLineSeries : TLineSeries;

    FDefaultXAxis : TXAxisAttribute;
    FDefaultYAxis : TYAxisAttribute;

    FGridAttribute : TGridAttribute;
    FLegendAttribute : TLegendAttribute;

    FChartColor: TColor;
    FForegroundColor: TColor;
    FBackgroundColor: TColor;

    FSliderOffset : Double;
    F2ndSliderOffset : Double;
    FShow2ndSlider: Boolean;
    FAutoUpdateTimer: Boolean;
    FOnSliderMove: TSliderPosition;

    FBarRect : TRect;
    FZoomRect : TRect;

    F1stSliderPicked : Boolean;
    F2ndSliderPicked : Boolean;
    FOn2ndSliderMove: TSliderPosition;

    FZoomMode : Boolean;

    FButtonPosLeft, FButtonPosTop : integer;
    FShowButton: Boolean;

    procedure TextOutCustom(aCanvas : TCanvas; X,Y : Integer;
      aColor : TColor; aText : string;
      aMode : integer = 0); // 0 : horisontal

    procedure CalculateBarArea(aCanvas : TCanvas;var aBarRect : TREct);
    procedure DrawArea(aCanvas : TCanvas; var aAreaRect, aBarRect : TREct);
    procedure DrawBarArea(aCanvas : TCanvas; aBarRect : TREct);
    procedure DrawAxis(aCanvas : TCanvas; aAreaRect : TRect; var aBarRect : TREct);
    procedure DrawGrid(aCanvas : TCanvas; aBarRect : TREct);
    procedure DrawSlider(aCanvas : TCanvas; aBarRect : TREct);
    procedure Draw2ndSlider(aCanvas : TCanvas; aBarRect : TREct);
    procedure DrawInfo(aCanvas : TCanvas; aBarRect : TREct);
    procedure DrawZoomRect(aCanvas : TCanvas; aBarRect : TREct);
    procedure DrawLineSeries(aCanvas : TCanvas; aBarRect : TREct);

    { initialize }
    procedure CreateDefaultChartAxis;
    procedure OnObjectNotified(Sender : TObject);
    procedure SetBackgroundColor(const Value: TColor);
    procedure SetChartColor(const Value: TColor);
    procedure SetForegroundColor(const Value: TColor);
    procedure SetShow2ndSlider(const Value: Boolean);
    procedure SetAutoUpdateTimer(const Value: Boolean);
    procedure SetOnSliderMove(const Value: TSliderPosition);
    procedure SetOn2ndSliderMove(const Value: TSliderPosition);
    procedure SetGridColor(const Value: TColor);
    function GetGridColor: TColor;
    function GetShowGrid: Boolean;
    procedure SetShowGrid(const Value: Boolean);
    procedure SetShowButton(const Value: Boolean);
    procedure SetButtonPosInit(X,Y : Integer);

  protected
    procedure Paint; override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure DblClick; override;
  public
    procedure AddData(aData : TTrendData);
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    property AxisSeries : TAxisSeries read FAxisSeries;
    property GridAttribute : TGridAttribute read FGridAttribute;
    property Legend : TLegendAttribute read FLegendAttribute;
    property LineSeries : TLineSeries read FLineSeries;

  published
    property OnClick;
    property OnDblClick;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseMove;
    property OnMouseUp;
    property Constraints;
    property Align;
    property DoubleBuffered;

    property ForegroundColor : TColor read FForegroundColor write SetForegroundColor;
    property BackgroundColor : TColor read FBackgroundColor write SetBackgroundColor;
    property ChartColor : TColor read FChartColor write SetChartColor;
    property GridColor : TColor read GetGridColor write SetGridColor;
    property Show2ndSlider : Boolean read FShow2ndSlider write SetShow2ndSlider default False;
    property AutoUpdateTimer : Boolean read FAutoUpdateTimer write SetAutoUpdateTimer default False;
    property OnSliderMove : TSliderPosition read FOnSliderMove write SetOnSliderMove;
    property On2ndSliderMove : TSliderPosition read FOn2ndSliderMove write SetOn2ndSliderMove;
    property ShowGrid : Boolean read GetShowGrid write SetShowGrid default True;
    property ShowButton : Boolean read FShowButton write SetShowButton default True;

  end;

procedure Register;

implementation

Const
  AREA_WIDTH  = 600;
  AREA_HEIGTH = 320;

  AREA_OFFSET_LEFT = 20;
  AREA_OFFSET_TOP  = 20;

  TICK_LEN = 8;

  Y_DIFF_AXIS = 2;

  DEF_SLIDER_OFF = 20;  // percent

  BUTTON_WIDTH = 15;
  BUTTON_HEIGHT = 20;

procedure Register;
begin
  RegisterComponents('IPMS', [TTrendChart]);
end;

{ TIPMSTrendChart }

procedure TTrendChart.AddData(aData: TTrendData);
begin

  FData.Add(aData);
  Invalidate;

end;

procedure TTrendChart.Draw2ndSlider(aCanvas: TCanvas; aBarRect: TREct);
var
  sliderPos : double;
  w : Double;
begin
  with aCanvas  do begin

    Pen.Color := FForegroundColor;
    Pen.Style := psSolid;
    Pen.Width := 1;

    w := aBarRect.Right - aBarRect.Left;
    sliderPos := aBarRect.Left + (F2ndSliderOffset * w / 100);

    if sliderPos >= aBarRect.Right then
    begin
      sliderPos := aBarRect.Right;
      F2ndSliderOffset := 100;
    end
    else
    if sliderPos <= aBarRect.Left then
    begin
      sliderPos := aBarRect.Left;
      F2ndSliderOffset := 0;
    end;

    MoveTo(Round(sliderPos),aBarRect.Top - 10);
    LineTo(Round(sliderPos),aBarRect.Bottom);

  end;
end;

procedure TTrendChart.DrawArea(aCanvas: TCanvas; var aAreaRect, aBarRect: TREct);
begin
  with aCanvas do begin

    Pen.Style := psSolid;
    Pen.Color := clBlack;
    Pen.Width := 1;

    Brush.Style := bsSolid;
    Brush.Color := FBackgroundColor;

    { chart area }
    aAreaRect.Left := AREA_OFFSET_LEFT;
    aAreaRect.Top  := AREA_OFFSET_TOP;
//    aAreaRect.Right := AREA_WIDTH - AREA_OFFSET_LEFT;
    aAreaRect.Right := Width - AREA_OFFSET_LEFT;
//    aAreaRect.Bottom := AREA_HEIGTH - AREA_OFFSET_TOP;
    aAreaRect.Bottom := Height - AREA_OFFSET_TOP;

    FillRect(aAreaRect);
//    Rectangle(aAreaRect);

    { default bar chart area with no axis }
    aBarRect.Left := aAreaRect.Left;
    aBarRect.Top := aAreaRect.Top + 10;
    aBarRect.Bottom := aAreaRect.Bottom;
    aBarRect.Right := aAreaRect.Right;
  end;
end;

procedure TTrendChart.CalculateBarArea(aCanvas: TCanvas; var aBarRect: TREct);
var
  i,j, tw, ttw, th, tth  : integer;
  axis : TAxisAttribute;
  yUpper,yLower,yStick : string;
begin
  { calculate bar area first }
  with aCanvas do begin
    th := TextHeight('XXXXXX');
    tth := 0;
    ttw := 0;
    for I := 0 to FAxisSeries.Count - 1 do
    begin
      axis := FAxisSeries.GetAxis(i);

      { x axis }
      if axis.AxisType = eatXTime then
      begin
        if axis.Visible then
        begin

          tth := tth + (th * 2);

          if axis.AxisLabel <> '' then
            tth := tth + th;

        end;
      end else
      { y axis }
      begin
        if axis.Visible then
        begin
          yUpper := IntToStr(TYAxisAttribute(axis).UpperLimit);
          yLower := IntToStr(TYAxisAttribute(axis).LowerLimit);

          tw := IfThen(TextWidth(yUpper)>TextWidth(yLower),TextWidth(yUpper),TextWidth(yLower));

          if axis.Numbered then
          begin

            for j := 0 to Length(axis.TickValues) - 1 do
            begin

              yStick := FormatFloat('#.##',TYAxisAttribute(axis).TickValues[j]);
              tw := IfThen(tw<TextWidth(yStick),TextWidth(yStick),tw);

            end;

          end;

          TYAxisAttribute(axis).CanvasMaxTextWidth := tw;

          if axis.AxisLabel <> '' then
            ttw := ttw + th;

          ttw := ttw + tw + TICK_LEN;
          ttw := ttw + Y_DIFF_AXIS;
        end;

      end;
    end;

    { calculated bar rect}
    aBarRect.Bottom :=  aBarRect.Bottom - tth;
    aBarRect.Left :=  aBarRect.Left + ttw;

    if FShowButton then begin
      aBarRect.Bottom :=  aBarRect.Bottom - BUTTON_HEIGHT;
      SetButtonPosInit(aBarRect.Bottom + tth + BUTTON_HEIGHT, aBarRect.Left);
    end;

  end;
end;

constructor TTrendChart.Create(aOwner: TComponent);
  procedure SetButton(aButton : TButton);
  begin
    aButton.Width := BUTTON_WIDTH;
    aButton.Height := BUTTON_HEIGHT;
    aButton.Parent := Self;
  end;
begin
  inherited Create(aOwner);

  Width := AREA_WIDTH;
  Height := AREA_HEIGTH;
  FSliderOffset := DEF_SLIDER_OFF;
  F2ndSliderOffset := DEF_SLIDER_OFF;

  FChartColor := clgreen;
  FForegroundColor := clBtnFace;
  FBackgroundColor := clBlue;

  FData := TList.Create;
  FAxisSeries := TAxisSeries.Create;
  FAxisSeries.OnNotifyEvent := OnObjectNotified;
  FLineSeries := TLineSeries.Create;
  FGridAttribute := TGridAttribute.Create;
  FLegendAttribute := TLegendAttribute.Create;

  DoubleBuffered := True;
  FZoomMode := False;

  CreateDefaultChartAxis;

  FShowButton := True;

end;

procedure TTrendChart.DrawBarArea(aCanvas: TCanvas; aBarRect: TREct);
begin

  with aCanvas do begin

    Pen.Style := psSolid;
    Pen.Color := ForegroundColor;
    Pen.Width := 1;

    Brush.Style := bsSolid;
    Brush.Color := FChartColor;

    Rectangle(aBarRect);
  end;

end;

procedure TTrendChart.DrawGrid(aCanvas: TCanvas; aBarRect: TREct);
var
  i,w,h : integer;
  r : Double;
begin
  r := 0;
  with aCanvas do begin

    Brush.Style := bsClear;

    if FGridAttribute.ShowGrid then begin

      Pen.Color := FGridAttribute.Color;

      case FGridAttribute.Style of

        eldsSolid : Pen.Style := psSolid;
        eldsDash  : Pen.Style := psDash;
        eldsDashDot : Pen.Style := psDashDot;
        eldSmallDash : Pen.Style := psDot;
        eldsDashDotDot : Pen.Style := psDashDotDot;
        eldsNone : Pen.Style := psClear;

      end;

      if FGridAttribute.Style = eldsSolid then
        Pen.Width := FGridAttribute.Width
      else
        Pen.Width := 1;

      case FGridAttribute.TickType  of

        egtFixed :;
        egdCustom :
          { draw nearest axis, usin default axis }
          if not Assigned( FGridAttribute.UseAxisLine) then
          begin

            { x grid }
            if FDefaultXAxis.Visible then
            begin
              w := aBarRect.Right - aBarRect.Left;
              if FDefaultXAxis.Ticks > 0 then
                r := w / (FDefaultXAxis.Ticks + 1);

              for I := 1 to FDefaultXAxis.Ticks do
              begin

                MoveTo(Round(aBarRect.Left + r * i),aBarRect.Top);
                LineTo(Round(aBarRect.Left + r * i),aBarRect.Bottom);

              end;
            end;

            { y grid }
            if FDefaultYAxis.Visible then
            begin
              h := aBarRect.Bottom - aBarRect.Top;
              if FDefaultYAxis.Ticks > 0 then
                r := h / (FDefaultYAxis.Ticks + 1);

              for I := 1 to FDefaultYAxis.Ticks do
              begin

                MoveTo(aBarRect.Left, Round(aBarRect.Top + r * i));
                LineTo(aBarRect.Right,Round(aBarRect.Top + r * i));

              end;
            end;
          end
          else
          { draw with specified axis }
          begin

          end;

      end;

    end;

  end;
end;

procedure TTrendChart.DrawInfo(aCanvas: TCanvas; aBarRect: TREct);
//var
//  cx,cy : Integer;
begin
  with aCanvas do begin

//    cx := (aBarRect.Right - aBarRect.Left) div 2;
//    cy := aBarRect.Bottom + 10;
  end;
end;

procedure TTrendChart.DrawLineSeries(aCanvas: TCanvas; aBarRect: TREct);
begin
  FLineSeries.DrawAll(aCanvas,aBarRect);
end;

procedure TTrendChart.OnObjectNotified(Sender: TObject);
begin
  if Sender.ClassType = TXAxisAttribute then
  begin
    Invalidate;
  end;
end;

procedure TTrendChart.CreateDefaultChartAxis;
begin
  FDefaultXAxis := TXAxisAttribute.Create;
  FDefaultXAxis.AxisID := 'Chart X Axis';
  FDefaultXAxis.Ticks := 3;
  FDefaultXAxis.DefaultAxis := True;

  FAxisSeries.AddAxis(FDefaultXAxis);

  FDefaultYAxis := TYAxisAttribute.Create;
  FDefaultYAxis.AxisID := 'Chart Y Axis';
  FDefaultYAxis.Numbered := True;
  FDefaultYAxis.DefaultUpperLimit := 100;
  FDefaultYAxis.DefaultLowerLimit := 0;
  FDefaultYAxis.Ticks := 4;
  FDefaultYAxis.DefaultAxis := True;

  FAxisSeries.AddAxis(FDefaultYAxis);

end;

procedure TTrendChart.DrawSlider;
var
  sliderPos : double;
  w : Double;
begin
  with aCanvas  do begin

    Pen.Color := FForegroundColor;
    Pen.Style := psSolid;
    Pen.Width := 1;

    w := aBarRect.Right - aBarRect.Left;
    sliderPos := aBarRect.Left + (FSliderOffset * w / 100);

    if sliderPos >= aBarRect.Right then
    begin
      sliderPos := aBarRect.Right;
      FSliderOffset := 100;
    end
    else
    if sliderPos <= aBarRect.Left then
    begin
      sliderPos := aBarRect.Left;
      FSliderOffset := 0;
    end;

    MoveTo(Round(sliderPos),aBarRect.Top - 10);
    LineTo(Round(sliderPos),aBarRect.Bottom);

  end;
end;

procedure TTrendChart.DrawZoomRect(aCanvas: TCanvas; aBarRect: TREct);
begin

  with aCanvas do begin
    Pen.Color := clBlack;
    Pen.Style := psSolid;
    Pen.Width := 1;

    Brush.Color := clGray;
    Brush.Style := bsSolid;

    FillRect(FZoomRect);
  end;

end;

function TTrendChart.GetGridColor: TColor;
begin
  Result := FGridAttribute.Color;
end;

function TTrendChart.GetShowGrid: Boolean;
begin
  Result := FGridAttribute.ShowGrid;
end;

procedure TTrendChart.MouseDown(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
const
  OFFSET = 2;
var
//  sliderExist : Boolean;
  off, sliderX, {percentX,}w  : double;
  barX : integer;
begin
  inherited;

  barX := X - FBarRect.Left;
  w := FBarRect.Right - FBarRect.Left;
  if w = 0 then Exit;

//  percentX := barX / w * 100;

  if (not F2ndSliderPicked) then
  begin
    sliderX := FSliderOffset * w / 100;
    off := Abs(sliderX - barX);

    if off <= OFFSET then
      F1stSliderPicked := True
    else
      F1stSliderPicked := False;
  end;

  if (not F1stSliderPicked) and (Show2ndSlider) then
  begin
    sliderX := F2ndSliderOffset * w / 100;
    off := Abs(sliderX - barX);
    if off <= OFFSET then
      F2ndSliderPicked := True
    else
      F2ndSliderPicked := False;
  end;

  if (not F1stSliderPicked) and (not F2ndSliderPicked) then
  begin
    FZoomMode := True;
    Screen.Cursor := crHandPoint;
    FZoomRect.Left := X;
    FZoomRect.Top := Y;
    FZoomRect.Right := X;
    FZoomRect.Bottom := Y;
  end;

end;

procedure TTrendChart.MouseMove(Shift: TShiftState; X, Y: Integer);
const
  OFFSET = 2;
var
//  sliderExist : Boolean;
  off, w, sliderX : double;
  barX : integer;
  percentX : Double;
begin
  inherited;

  barX := X - FBarRect.Left;
  w := FBarRect.Right - FBarRect.Left;

  if w = 0 then Exit;
  
  percentX := barX / w * 100;

  if (not F2ndSliderPicked)  then
  begin
    sliderX := FSliderOffset * w / 100;
    off := Abs(sliderX - barX);

    if off <= OFFSET then
      Screen.Cursor := crHSplit
    else
      Screen.Cursor := crDefault;
  end;

  if (not F1stSliderPicked) and (Show2ndSlider) then
  begin
    sliderX := F2ndSliderOffset * w / 100;
    off := Abs(sliderX - barX);
    if off <= OFFSET then
      Screen.Cursor := crHSplit
    else
      Screen.Cursor := crDefault;
  end;

  if F1stSliderPicked then
    FSliderOffset := percentX;

  if F2ndSliderPicked then
    F2ndSliderOffset := percentX;

  if (not F1stSliderPicked) and (not F2ndSliderPicked) and FZoomMode then
  begin
    Screen.Cursor := crHandPoint;

    FZoomRect.Right := X;
    FZoomRect.Bottom := Y;

    if FZoomRect.Right > FBarRect.Right then
      FZoomRect.Right := FBarRect.Right;

    if FZoomRect.Bottom > FBarRect.Bottom then
      FZoomRect.Bottom := FBarRect.Bottom;

    if FZoomRect.Bottom < FBarRect.Top then
      FZoomRect.Bottom := FBarRect.Top;

    if FZoomRect.Right < FBarRect.Left then
      FZoomRect.Right := FBarRect.Left;
  end;

  Invalidate;

end;

procedure TTrendChart.MouseUp(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
  F1stSliderPicked := False;
  F2ndSliderPicked := False;
  FZoomMode := False;

  Screen.Cursor := crDefault;
end;

procedure TTrendChart.DrawAxis(aCanvas: TCanvas; aAreaRect: TRect;
  var aBarRect: TREct);
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
  i,j, tw, th, rw, cx,cy, txi, tyi : integer;
  axis : TAxisAttribute;
  yUpper,yLower,yStick, dateStart, dateStop, timeStart, timeStop : string;
  tick : double;
  sy,sm,sd,ey,em,ed,
  sh,sn,ss,sms,eh,en,es,ems : word;
begin

  { calculate bar area first }
  with aCanvas do begin
    th := TextHeight('XXXXXX');

    { draw axis }
    txi := 0;
    tyi := 0;
    tick := 0;
    for I := 0 to FAxisSeries.Count - 1 do
    begin
      axis := FAxisSeries.GetAxis(i);

      if not axis.Visible then Continue;

      Pen.Style := psSolid;
      Pen.Width := 1;
      Pen.Color := axis.Color;

      { draw x axis }
      if axis.AxisType = eatXTime then
      begin

        MoveTo(aBarRect.Left,aBarRect.Bottom + th * txi);
        LineTo(aBarRect.Right,aBarRect.Bottom + th * txi);

        Font.Color := axis.Color;

        tw := TextWidth('XX/XX/XXXX');

        DecodeDate(TXAxisAttribute(axis).StartDate,sy,sm,sd);
        DecodeDate(TXAxisAttribute(axis).EndDate,ey,em,ed);

        DecodeTime(TXAxisAttribute(axis).StartDate,sh,sn,ss,sms);
        DecodeTime(TXAxisAttribute(axis).EndDate,eh,en,es,ems);

        dateStart := IntTo2DgtStr(sd) + '/' + IntTo2DgtStr(sm) + '/' + IntToStr(sy);
        dateStop  := IntTo2DgtStr(ed) + '/' + IntTo2DgtStr(em) + '/' + IntToStr(ey);

        timeStart := IntTo2DgtStr(sh) + ':' + IntTo2DgtStr(sn) + ':' + IntTo2DgtStr(ss);
        timeStop  := IntTo2DgtStr(eh) + ':' + IntTo2DgtStr(en) + ':' + IntTo2DgtStr(es);

        TextOutCustom(aCanvas, aBarRect.Left,aBarRect.Bottom + th * txi,axis.Color,dateStart);
        TextOutCustom(aCanvas, aBarRect.Right - tw,aBarRect.Bottom + th * txi,axis.Color,dateStop);

        rw := aBarRect.Right - aBarRect.Left;
        if axis.Ticks > 0 then
          tick := rw / (axis.Ticks + 1);

        for j := 1 to axis.Ticks do
        begin
          MoveTo(aBarRect.Left + Round(tick * j),aBarRect.Bottom + th * txi);
          LineTo(aBarRect.Left + Round(tick * j),aBarRect.Bottom + th * txi + TICK_LEN);
        end;

        { text out ticks date }
        if axis.Numbered then
          for j := 1 to Length(axis.TickValues)  do
          begin
            DecodeDate(axis.TickValues[j-1],sy,sm,sd);
            dateStart := IntTo2DgtStr(sd) + '/' + IntTo2DgtStr(sm) + '/' + IntToStr(sy);
//            tw := TextWidth(dateStart);

//            cy := Round(aBarRect.Left + (tick * j ) - ( tw / 2));
//            TextOutCustom(aCanvas, cy, aBarRect.Bottom + th * txi ,axis.Color,dateStart);
          end;

        Inc(txi);

        tw := TextWidth('XX:XX:XX');
        TextOutCustom(aCanvas, aBarRect.Left,aBarRect.Bottom + th * txi,axis.Color,timeStart);
        TextOutCustom(aCanvas, aBarRect.Right - tw,aBarRect.Bottom + th * txi,axis.Color,timeStop);

        { text out ticks time }
        if axis.Numbered then
          for j := 1 to Length(axis.TickValues)  do
          begin
            DecodeTime(axis.TickValues[j-1],sh,sn,ss,sms);
            timeStart := IntTo2DgtStr(sh) + ':' + IntTo2DgtStr(sn) + ':' + IntTo2DgtStr(ss);
            tw := TextWidth(timeStart);

            cy := Round(aBarRect.Left + (tick * j ) - ( tw / 2));
            TextOutCustom(aCanvas, cy, aBarRect.Bottom + th * txi ,axis.Color,timeStart);
          end;

        Inc(txi);

        if axis.AxisLabel <> '' then
        begin
          rw := aBarRect.Right - aBarRect.Left;
          tw := TextWidth(axis.AxisLabel);
          cx := Round(aBarRect.Left + ( (rw / 2) - (tw / 2)));

          TextOutCustom(aCanvas, cx,aBarRect.Bottom + th * txi,axis.Color,axis.AxisLabel);
          Inc(txi);
        end;

      end
      { draw y axis }
      else
      begin

        MoveTo(aBarRect.Left - tyi,aBarRect.Top);
        LineTo(aBarRect.Left - tyi,aBarRect.Bottom);

        { draw ticks }
        tyi := tyi + TICK_LEN;

        MoveTo(aBarRect.Left - tyi,aBarRect.Top);
        LineTo(aBarRect.Left - tyi + TICK_LEN ,aBarRect.Top);

        MoveTo(aBarRect.Left - tyi,aBarRect.Bottom);
        LineTo(aBarRect.Left - tyi + TICK_LEN ,aBarRect.Bottom);

        rw := aBarRect.Bottom - aBarRect.Top;
        if axis.Ticks > 0 then
          tick := rw / (axis.Ticks + 1);

        for j := 1 to axis.Ticks do
        begin
          MoveTo(aBarRect.Left - tyi,Round(aBarRect.Top + (tick* j)));
          LineTo(aBarRect.Left - tyi + TICK_LEN,Round(aBarRect.Top + (tick * j)));

        end;
        { end draw ticks }

        Font.Color := axis.Color;

        tyi := tyi + TYAxisAttribute(axis).CanvasMaxTextWidth;

        yUpper := IntToStr(TYAxisAttribute(axis).DefaultUpperLimit);
        yLower := IntToStr(TYAxisAttribute(axis).DefaultLowerLimit);
        th := TextHeight(yLower);

        TextOutCustom(aCanvas, aBarRect.Left - tyi,aBarRect.Top,axis.Color,yUpper);
        TextOutCustom(aCanvas, aBarRect.Left - tyi,aBarRect.Bottom - th,axis.Color,yLower);

        { text out ticks }
        if axis.Numbered then
          for j := 1 to Length(axis.TickValues)  do
          begin
            yStick := FormatFloat('#.##',TYAxisAttribute(axis).TickValues[j-1]);
            cy := Round(aBarRect.Bottom - (tick * j ) - ( th / 2));
            TextOutCustom(aCanvas, aBarRect.Left - tyi, cy ,axis.Color,yStick);
          end;

        if axis.AxisLabel <> '' then
        begin
          rw := aBarRect.Bottom - aBarRect.Top;
          tw := TextWidth(axis.AxisLabel);
          cx := Round(aBarRect.Bottom - ( (rw / 2) - (tw / 2)));

          tyi := tyi + th;

          TextOutCustom(aCanvas, aBarRect.Left - tyi,cx,axis.Color,axis.AxisLabel,1);
        end;

        // offset
        tyi := tyi + Y_DIFF_AXIS;
      end;
    end;
  end;

end;

procedure TTrendChart.DblClick;
begin
  F1stSliderPicked := False;
  F2ndSliderPicked := False;
  FZoomMode := False;

  Screen.Cursor := crDefault;

  inherited;
end;

destructor TTrendChart.Destroy;
begin

  FData.Free;
  FAxisSeries.Free;
  FLineSeries.Free;
  FGridAttribute.Free;

  inherited;
end;

procedure TTrendChart.Paint;
var
  AreaRect : TRect;
begin
  inherited;

  Font.Name := 'Arial';
  Font.Size := 10;

  DrawArea(Canvas, AreaRect, FBarRect);
  CalculateBarArea(Canvas, FBarRect);

  DrawBarArea(Canvas, FBarRect);

  DrawAxis(Canvas,AreaRect,FBarRect);

  if FZoomMode then
    DrawZoomRect(Canvas,FBarRect);

  DrawGrid(Canvas,FBarRect);
  DrawSlider(Canvas,FBarRect);

  if Show2ndSlider then
    Draw2ndSlider(Canvas,FBarRect);

  DrawLineSeries(Canvas,FBarRect);

end;

procedure TTrendChart.SetAutoUpdateTimer(const Value: Boolean);
var
  i : Integer;
  axis : TAxisAttribute;
begin
  FAutoUpdateTimer := Value;

  for I := 0 to FAxisSeries.Count - 1 do
  begin
    axis := FAxisSeries.GetAxis(i);
    if axis.AxisType = eatXTime then
    begin
      if Value then
        TXAxisAttribute(axis).EnableTimer
      else
        TXAxisAttribute(axis).DisableTimer;
    end;
  end;

  Invalidate;
end;

procedure TTrendChart.SetBackgroundColor(const Value: TColor);
begin
  FBackgroundColor := Value;
  Invalidate;
end;

procedure TTrendChart.SetButtonPosInit(X, Y: Integer);
begin
  if (FButtonPosTop <> Y) or (FButtonPosLeft <> X)  then
  begin
    FButtonPosTop := Y;
    FButtonPosLeft := X;
  end;
end;

procedure TTrendChart.SetChartColor(const Value: TColor);
begin
  FChartColor := Value;
  Invalidate;
end;

procedure TTrendChart.SetForegroundColor(const Value: TColor);
begin
  FForegroundColor := Value;
  Invalidate;
end;

procedure TTrendChart.SetGridColor(const Value: TColor);
begin
  FGridAttribute.Color := Value;
  Invalidate;
end;

procedure TTrendChart.SetOn2ndSliderMove(const Value: TSliderPosition);
begin
  FOn2ndSliderMove := Value;
end;

procedure TTrendChart.SetOnSliderMove(const Value: TSliderPosition);
begin
  FOnSliderMove := Value;
end;

procedure TTrendChart.SetShow2ndSlider(const Value: Boolean);
begin
  FShow2ndSlider := Value;
  Invalidate;
end;

procedure TTrendChart.SetShowButton(const Value: Boolean);
begin
  FShowButton := Value;
  Invalidate;
end;

procedure TTrendChart.SetShowGrid(const Value: Boolean);
begin
  FGridAttribute.ShowGrid := Value;
  Invalidate;
end;

procedure TTrendChart.TextOutCustom(aCanvas: TCanvas; X, Y : integer;
  aColor : TColor; aText : string;aMode: integer);
var
  lf: TLogFont;
  tf: TFont;
begin

  with aCanvas  do begin

    Font.Color := aColor;
    tf   := TFont.Create;

    try
      tf.Assign(Font);
      GetObject(tf.Handle, SizeOf(lf), @lf);

      if aMode = 1 then
      begin
        lf.lfEscapement  := 900;
        lf.lfOrientation := 900;
      end else
      begin
        lf.lfEscapement  := 0;
        lf.lfOrientation := 0;
      end;

      SetBkMode(Handle, TRANSPARENT);
      tf.Handle := CreateFontIndirect(lf);
      Font.Assign(tf);

    finally
      tf.Free;
    end;

    TextOut(X,Y,aText);
  end;
end;

end.
