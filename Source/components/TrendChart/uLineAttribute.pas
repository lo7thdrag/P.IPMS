unit uLineAttribute;

interface

uses Graphics, uTrendDataType, Classes,
  uAxisAttribute, SysUtils,uTrendData, Windows,DateUtils, lognya;

type

  TLineAttribute = class
  private
    FInLegend: Boolean;
    FLineID: String;
    FColor: TColor;
    FVisible: Boolean;
    FWidth: integer;
    FStyle: E_LineDispStyle;
    FExpansion: E_LineDispExpansion;
    FCompression: E_LineDispCompression;
    procedure SetColor(const Value: TColor);
    procedure SetInLegend(const Value: Boolean);
    procedure SetLineID(const Value: String);
    procedure SetVisible(const Value: Boolean);
    procedure SetWidth(const Value: integer);
    procedure SetStyle(const Value: E_LineDispStyle);
    procedure SetCompression(const Value: E_LineDispCompression);
    procedure SetExpansion(const Value: E_LineDispExpansion);
  public
    constructor Create;
    destructor Destroy;override;

    property Color    : TColor read FColor write SetColor;
    property LineID   : String read FLineID write SetLineID;
    property InLegend : Boolean read FInLegend write SetInLegend;
    property Visible  : Boolean read FVisible write SetVisible;
    property Width    : integer read FWidth write SetWidth;
    property Style    : E_LineDispStyle read FStyle write SetStyle;
    property Expansion : E_LineDispExpansion read FExpansion write SetExpansion;
    property Compression : E_LineDispCompression read FCompression write SetCompression;
  end;

  TLineData = class
  private
    FDataSource: E_DataSource;
    FUserID: String;
    FPointID: String;
    FLineType: E_LinesType;
    FTableID: String;
    FPassword: String;
    FLineAttribute: TLineAttribute;
    FAutoUpdate: Boolean;
    FPointData: TList;
    FUseXAxis: TXAxisAttribute;
    FUseYAxis: TYAxisAttribute;

    FLimLeftXIdx, FLimRightXIdx : integer;

    procedure SetDataSource(const Value: E_DataSource);
    procedure SetLineType(const Value: E_LinesType);
    procedure SetPassword(const Value: String);
    procedure SetPointID(const Value: String);
    procedure SetTableID(const Value: String);
    procedure SetUserID(const Value: String);
    procedure SetAutoUpdate(const Value: Boolean);
    procedure SetUseXAxis(const Value: TXAxisAttribute);
    procedure SetUseYAxis(const Value: TYAxisAttribute);
    procedure SetTimeChange(Sender : TObject);
    procedure Draw(aCanvas : TCanvas; aRect : TRect);
  public
//    coords : array of TPoint;
    constructor Create;
    destructor Destroy;override;

    procedure AddPointData(Value : TItemData);
    procedure ClearPointData;
    procedure UpdatePointData;

    property LineType : E_LinesType read FLineType write SetLineType;
    property LineAttribute : TLineAttribute read FLineAttribute;
    property AutoUpdate : Boolean read FAutoUpdate write SetAutoUpdate;

    { Logged Type }
    property DataSource : E_DataSource read FDataSource write SetDataSource;
    property UserID     : String read FUserID write SetUserID;
    property Password   : String read FPassword write SetPassword;
    property TableID    : String read FTableID write SetTableID;
    property PointID    : String read FPointID write SetPointID;

    { other type not implemented yet }
    { data }
    property PointData : TList read FPointData write FPointData;
    property UseXAxis : TXAxisAttribute read FUseXAxis write SetUseXAxis;
    property UseYAxis : TYAxisAttribute read FUseYAxis write SetUseYAxis;

  end;

  TLineSeries = class
  private
    FLines : TList;

  public
    constructor Create;
    destructor Destroy;override;
    procedure AddLine(Line : TLineData);
    function getLine(index : Integer) : TLineData;
    function Remove(aData : TLineData) : integer;
    procedure MoveUp(aData : TLineData);
    procedure MoveDown(aData : TLineData);
    procedure DrawAll(aCanvas : TCanvas; aRect : TRect);
    function Count : integer;
  end;

implementation

procedure FreeList(var aList : TList);
var
  i : integer;
  obj : TObject;
begin
  for I := 0 to aList.Count - 1 do
  begin
    obj := aList.Items[i];
    FreeAndNil(obj);
  end;

  aList.Free;
  aList := nil;
end;

{ TLineAttribute }

constructor TLineAttribute.Create;
begin
  Color := clRed;
  InLegend := True;
  Visible := True;
  Style := eldsSolid;
  Width := 0;
  Expansion := eldeStep;
  Compression := eldcNone;
end;

destructor TLineAttribute.Destroy;
begin

  inherited;
end;

procedure TLineAttribute.SetColor(const Value: TColor);
begin
  FColor := Value;
end;

procedure TLineAttribute.SetCompression(const Value: E_LineDispCompression);
begin
  FCompression := Value;
end;

procedure TLineAttribute.SetExpansion(const Value: E_LineDispExpansion);
begin
  FExpansion := Value;
end;

procedure TLineAttribute.SetInLegend(const Value: Boolean);
begin
  FInLegend := Value;
end;

procedure TLineAttribute.SetLineID(const Value: String);
begin
  FLineID := Value;
end;

procedure TLineAttribute.SetStyle(const Value: E_LineDispStyle);
begin
  FStyle := Value;
end;

procedure TLineAttribute.SetVisible(const Value: Boolean);
begin
  FVisible := Value;
end;

procedure TLineAttribute.SetWidth(const Value: integer);
begin
  FWidth := Value;
end;

{ TLineData }

procedure TLineData.AddPointData(Value: TItemData);
begin
  FPointData.Add(Value);
end;

procedure TLineData.ClearPointData;
var
  i : integer;
  obj : TObject;
begin
  for I := FPointData.Count - 1 downto 0 do
  begin
    obj := FPointData.Items[i];
    FreeAndNil(obj);
    FPointData.Delete(i);
  end;
  FPointData.Clear;
end;

constructor TLineData.Create;
begin
  FLineAttribute := TLineAttribute.Create;
  FPointData := TList.Create;
  FLimLeftXIdx := 0;
  FLimRightXIdx := 0;
end;

destructor TLineData.Destroy;
begin
  FreeList(FPointData);

  FLineAttribute.Free;
  inherited;
end;

procedure TLineData.Draw(aCanvas: TCanvas; aRect: TRect);
var
  diffX,diffY, rx,ry : double;
  counter, i, rdx, rdy : integer;
  data : TItemData;
  coords : array of TPoint;
  StartCoord, EndCoord : TPoint;
  buffCoord : TPoint;
begin

  if not FLineAttribute.FVisible then Exit;
  if FPointData.Count <= 0 then Exit;

  with aCanvas do
  begin

    { pen properties }
    Pen.Color := FLineAttribute.Color;
    Pen.Width := FLineAttribute.Width;

    case FLineAttribute.FStyle of
      eldsNone  : Pen.Style := psClear;
      eldsSolid : Pen.Style := psSolid;
      eldsDash  : Pen.Style := psDash;
      eldSmallDash : Pen.Style := psDot;
      eldsDashDot : Pen.Style := psDashDot;
      eldsDashDotDot : Pen.Style := psDashDotDot;
    end;

    { x axis }
    if Assigned(FUseXAxis) and Assigned(FUseYAxis) then
    begin
      diffX := FUseXAxis.EndDate - FUseXAxis.StartDate;
      diffY := FUseYAxis.UpperLimit - FUseYAxis.LowerLimit;

      if FPointData.Count > 0 then
      begin
        { dont draw if.. }
        data := FPointData.Items[FLimLeftXIdx];
        if (data.Timestamp > FUseXAxis.EndDate) then Exit;
        data := FPointData.Items[FLimRightXIdx];
        if (data.Timestamp < FUseXAxis.StartDate) then Exit;
      end;

      if (FLimRightXIdx - FLimLeftXIdx) = 0 then Exit;

      SetLength(coords, FLimRightXIdx - FLimLeftXIdx + 1);

      rdx := aRect.Right - aRect.Left;
      rdy := aRect.Bottom - aRect.Top;

      Form5.Memo1.Lines.Clear;
      Form5.Memo1.Lines.Add('FLimLeftXIdx : ' + IntToStr(FLimLeftXIdx)+ ';    FLimRightXIdx : ' + IntToStr(FLimRightXIdx));
      Form5.Memo2.Lines.Clear;
      Form5.Memo2.Lines.Add('Length(coords) : ' + IntToStr(Length(coords)));

      counter := 0;
      for I := FLimLeftXIdx to FLimRightXIdx do
      begin

        data := FPointData.Items[i];
        rx := data.Timestamp - FUseXAxis.StartDate;
        rx := rdx * ( rx / diffX );

        ry := data.Value - FUseYAxis.LowerLimit;
        ry := rdy * ( ry / diffY );

        coords[counter].X := Round(rx + aRect.Left);
        coords[counter].Y := Round(aRect.Bottom - ry);

        Form5.Memo1.Lines.Add('coords['+IntToStr(counter)+'] --> X : ' + IntToStr(coords[counter].X)+
        '; Y : ' + IntToStr(coords[counter].Y));

        counter := counter+1;
      end;

      for I := 0 to counter - 2 do
      begin
        {Sumbu X}
        if coords[i].X < aRect.Left then
          StartCoord.X := aRect.Left
        else
          StartCoord.X := coords[i].X;

        if coords[i+1].X < aRect.Left then
          EndCoord.X := aRect.Left
        else
          EndCoord.X := coords[i+1].X;


        {Sumbu Y}
        if coords[i].Y > aRect.Bottom then
        begin
          StartCoord.Y := aRect.Bottom
        end
        else if coords[i].Y < aRect.Top then
        begin
          {jk titik start dan titik end melebihi batas atas tdk usah digambar}
          if coords[i+1].Y < aRect.Top then
            Continue
          else
            StartCoord.Y := aRect.Top
        end
        else
          StartCoord.Y := coords[i].Y;

        if coords[i+1].Y > aRect.Bottom then
        begin
          EndCoord.Y := aRect.Bottom
        end
        else if coords[i+1].Y < aRect.Top then
        begin
          {jk titik start dan titik end melebihi batas atas tdk usah digambar}
          if coords[i].Y < aRect.Top then
            Continue
          else
            EndCoord.Y := aRect.Top
        end
        else
          EndCoord.Y := coords[i+1].Y;

        MoveTo(StartCoord.X,StartCoord.Y);
        LineTo(EndCoord.X,EndCoord.Y);

        Form5.Memo2.Lines.Add('[i]: '+IntToStr(i)+ '     Start : [' + IntToStr(StartCoord.X)+ ']['+ IntToStr(StartCoord.Y)+']'+
        '   End : [' + IntToStr(EndCoord.X)+ ']['+ IntToStr(EndCoord.Y)+']')
      end;
      Form5.Memo1.Lines.Add('');
      Form5.Memo1.Lines.Add('Atas: '+IntToStr(aRect.Top)+';  Bawah: ' + IntToStr(aRect.Bottom)+';  Kanan: '+IntToStr(aRect.Right)+
      ';  Kiri: ' + IntToStr(aRect.Left));
    end;
  end;
end;

procedure TLineData.SetAutoUpdate(const Value: Boolean);
begin
  FAutoUpdate := Value;
end;

procedure TLineData.SetDataSource(const Value: E_DataSource);
begin
  FDataSource := Value;
end;

procedure TLineData.SetLineType(const Value: E_LinesType);
begin
  FLineType := Value;
end;

procedure TLineData.SetPassword(const Value: String);
begin
  FPassword := Value;
end;

procedure TLineData.SetPointID(const Value: String);
begin
  FPointID := Value;
end;

procedure TLineData.SetTableID(const Value: String);
begin
  FTableID := Value;
end;

procedure TLineData.SetTimeChange(Sender: TObject);
var
  i : Integer;
  data : TItemData;
  sdFound, edFound : boolean;
begin

  sdFound := False;
  edFound := False;

  { left right point index  }
  if Assigned(FUseXAxis) then
  begin
                                  {Prince : ini tambahan ndeso, karena sy sdh mentok }
    if (FPointData.Count <= 0) or (FPointData.Count > 1000) then Exit;

    { update lim left idx }
    data := FPointData.Items[FLimLeftXIdx];
    if (FUseXAxis.StartDate < data.Timestamp) then
    begin
      { backward }
      for I := FLimLeftXIdx downto 0 do
      begin
        data := FPointData.Items[i];
        if data.Timestamp <= FUseXAxis.StartDate then
        begin
          FLimLeftXIdx := I;
          sdFound := True;
          Break;
        end;
      end;
    end else
    begin
      { foward }
      for I := FLimLeftXIdx to FPointData.Count - 1 do
      begin
        data := FPointData.Items[i];
        if data.Timestamp >= FUseXAxis.StartDate then
        begin
          FLimLeftXIdx := I;
          sdFound := True;
          Break;
        end;
      end;
    end;

    { update lim right idx }
    data := FPointData.Items[FLimRightXIdx];
    if (FUseXAxis.EndDate < data.Timestamp) then
    begin
      { backward }
      for I := FLimRightXIdx downto 0 do
      begin
        data := FPointData.Items[i];
        if data.Timestamp <= FUseXAxis.EndDate then
        begin
          FLimRightXIdx := I;
          edFound := True;
          Break;
        end;
      end;
    end else
    begin
      { foward }
      for I := FLimRightXIdx to FPointData.Count - 1 do
      begin
        data := FPointData.Items[i];
        if data.Timestamp >= FUseXAxis.EndDate then
        begin
          FLimRightXIdx := I;
          edFound := True;
          Break;
        end;
      end;
    end;

    if not sdFound then
      FLimLeftXIdx := 0;

    if not edFound then
      FLimRightXIdx := FPointData.Count - 1;
  end;

end;

procedure TLineData.SetUserID(const Value: String);
begin
  FUserID := Value;
end;

procedure TLineData.SetUseXAxis(const Value: TXAxisAttribute);
var
  i : Integer;
  data : TItemData;
  sdFound, edFound : boolean;
begin
  if Assigned(FUseXAxis) then
    FUseXAxis.OnNotifyTimeChange := nil;

  FUseXAxis := Value;
  FUseXAxis.OnNotifyTimeChange := SetTimeChange;

  sdFound := False;
  edFound := False;

  { left right point index  }
  if Assigned(FUseXAxis) then
  begin

    for I := 0 to FPointData.Count - 1 do
    begin
      data := FPointData.Items[i];

      if (Value.StartDate <= data.Timestamp) and not sdFound then
      begin
        FLimLeftXIdx := i;
        sdFound := True;
      end;

      if (Value.EndDate <= data.Timestamp) and not edFound then
      begin
        FLimRightXIdx := i;
        edFound := True;
      end;

      if sdFound and edFound then
        Break;

    end;

    if not sdFound then
      FLimLeftXIdx := 0;

//    if not edFound then
//    begin

//    end;
      FLimRightXIdx := FPointData.Count{ - 1};
  end;
end;

procedure TLineData.SetUseYAxis(const Value: TYAxisAttribute);
begin
  FUseYAxis := Value;
end;

procedure TLineData.UpdatePointData;
begin
  SetTimeChange(nil);
end;

{ TLineSeries }

procedure TLineSeries.AddLine(Line: TLineData);
begin
  FLines.Add(Line);
  inherited;
end;

function TLineSeries.Count: integer;
begin
  Result := FLines.Count;
end;

constructor TLineSeries.Create;
begin
  FLines := TList.Create;
end;

destructor TLineSeries.Destroy;
begin
  FLines.Free;
end;

procedure TLineSeries.DrawAll(aCanvas : TCanvas; aRect : TRect);
var
  i : integer;
  line : TLineData;
begin

  for I := 0 to FLines.Count - 1 do
  begin
    line := FLines.Items[i];
    line.Draw(aCanvas,aRect);
  end;

end;

function TLineSeries.getLine(index: Integer): TLineData;
begin
  Result := nil;

  if index > FLines.Count - 1 then
    Exit;

  if index < 0 then
    Exit;

  Result := FLines.Items[index];
end;

procedure TLineSeries.MoveDown(aData: TLineData);
var
  i : integer;
begin
  i := FLines.IndexOf(aData);

  if i < FLines.Count - 1 then
  begin
    FLines.Delete(i);
    FLines.Insert(i+1,aData);
  end;
end;

procedure TLineSeries.MoveUp(aData: TLineData);
var
  i : integer;
begin
  i := FLines.IndexOf(aData);

  if i > 0 then
  begin
    FLines.Delete(i);
    FLines.Insert(i-1,aData);
  end;

end;

function TLineSeries.Remove(aData: TLineData): integer;
begin
  Result := FLines.Remove(aData)
end;

end.
