unit uVerticalBar;

interface

uses
  Classes, Graphics, Windows, uBaseComponent, uIPMS_Data;

type

  TVerticalBar = class(TIPMSBaseComponent)
  private
    FArrowShape : array[0..2] of TPoint;
    FBarPos : Integer;
    FBgShape : TRect;
    FBarShape : TRect;
    FShapeCol : TColor;
    FStatus : TStatus_AS;
    FTemperature: Integer;

    procedure SetStatus(const aStatus : TStatus_AS);
    procedure SetTemperature(const aValue: Integer);
  protected
    procedure Paint; override;
  public
    constructor Create(aOwner: TComponent); override;
  published
    property Status : TStatus_AS read FStatus write SetStatus;
    property Temperature : Integer read FTemperature write SetTemperature;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('IPMS', [TVerticalBar]);
end;

{ TVerticalBar }

constructor TVerticalBar.Create(aOwner: TComponent);
begin
  inherited;

  if (csDesigning in ComponentState) and
     not (csLoading in ComponentState) then
  begin
    Height := 178;
    Width := 42;
  end;

  Status := AStaDisableUnavailable;
  Temperature := 0;
end;

procedure TVerticalBar.Paint;
var
  i : Integer;
begin
  inherited;

  with Canvas do
  begin
    { background }
    Brush.Color := colBlack;
    Pen.Color := colWhite;
    FBgShape.TopLeft := Point(9, 5);
    FBgShape.BottomRight := Point(22, Height - 6);
    Rectangle(FBgShape);

    { value line}
    Pen.Color := colWhite;
    MoveTo(22, 5); LineTo(30, 5);
      MoveTo(22, 13); LineTo(26, 13);
      MoveTo(22, 21); LineTo(26, 21);
      MoveTo(22, 30); LineTo(26, 30);
      MoveTo(22, 38); LineTo(26, 38);
    MoveTo(22, 46); LineTo(30, 46);
      MoveTo(22, 55); LineTo(26, 55);
      MoveTo(22, 63); LineTo(26, 63);
      MoveTo(22, 71); LineTo(26, 71);
      MoveTo(22, 80); LineTo(26, 80);
    MoveTo(22, 88); LineTo(32, 88);
      MoveTo(22, 96); LineTo(26, 96);
      MoveTo(22, 105); LineTo(26, 105);
      MoveTo(22, 113); LineTo(26, 113);
      MoveTo(22, 121); LineTo(26, 121);
    MoveTo(22, 130); LineTo(30, 130);
      MoveTo(22, 138); LineTo(26, 138);
      MoveTo(22, 146); LineTo(26, 146);
      MoveTo(22, 155); LineTo(26, 155);
      MoveTo(22, 163); LineTo(26, 163);
    MoveTo(22, 171); LineTo(30, 171);

    { bar }
    Brush.Color := FShapeCol;
    Pen.Color := FShapeCol;
    FBarShape.TopLeft := Point(11, 89);
    FBarShape.BottomRight := Point(20, FBarPos);
    Rectangle(FBarShape);

    { bar line}
    Pen.Color := colBlack;
    for i := 0 to 41 - 1 do
    begin
      MoveTo(10, (Height - 4) - ((i + 1) * 4));
      LineTo(21, (Height - 4) - ((i + 1) * 4));
    end;

    { arrow }
    Brush.Color := colRed;
    Pen.Color := colRed;
    FArrowShape[0] := Point(29, 38);
    FArrowShape[1] := Point(38, 38 + 4);
    FArrowShape[2] := Point(38, 38 - 4);
    Polygon(FArrowShape);
    FArrowShape[0] := Point(29, 138);
    FArrowShape[1] := Point(38, 138 + 4);
    FArrowShape[2] := Point(38, 138 - 4);
    Polygon(FArrowShape);
  end;
end;

procedure TVerticalBar.SetStatus(const aStatus: TStatus_AS);
begin
  FStatus := aStatus;

  case FStatus of
    AStaDisableUnavailable: FShapeCol := colPink;
    AStaValOK: FShapeCol := colGrey;
    AStaValHighLow,
    AStaTooLow,
    AStaTooHigh,
    AStaWireBreak: FShapeCol := colRed;
  end;

  Invalidate;
end;

procedure TVerticalBar.SetTemperature(const aValue: Integer);
begin
  if aValue > 100 then
    FTemperature := 100
  else if aValue < -100 then
    FTemperature := -100
  else
    FTemperature := aValue;

  FBarPos := 89 - Round(FTemperature / 100 * 82);

  Invalidate;
end;

end.
