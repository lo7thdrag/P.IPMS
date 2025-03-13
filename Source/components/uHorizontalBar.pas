unit uHorizontalBar;

interface

uses
  Classes, Graphics, Windows, uBaseComponent, uIPMS_Data;

type

  THorizontalBar = class(TIPMSBaseComponent)
  private
    FBgShape : TRect;
    FBarShape : TRect;
    FBarPos : Integer;
    FPosition : Integer;
    FShapeCol : TColor;
    FStatus : TStatus_AS;

    procedure SetPosition(aValue: Integer);
    procedure SetStatus(aStatus : TStatus_AS);
  protected
    procedure Paint; override;
  public
    constructor Create(aOwner: TComponent); override;
  published
    property Position : Integer read FPosition write SetPosition;
    property Status : TStatus_AS read FStatus write SetStatus;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('IPMS', [THorizontalBar]);
end;

{ THorizontalBar }

constructor THorizontalBar.Create(aOwner: TComponent);
begin
  inherited;

  if (csDesigning in ComponentState) and
     not (csLoading in ComponentState) then
  begin
    Height := 15;
    Width := 86;
  end;

  Position := 0;
  Status := AStaDisableUnavailable;
end;

procedure THorizontalBar.Paint;
var
  i : Integer;
begin
  inherited;

  with Canvas do
  begin
    { background }
    Brush.Color := colGrey;
    Pen.Color := colGrey;
    FBgShape.TopLeft := Point(0, 5);
    FBgShape.BottomRight := Point(Width - 1, Height - 1);
    Rectangle(FBgShape);

    MoveTo(0, 5); LineTo(0, 0);
    MoveTo(42, 5); LineTo(42, 0);
    MoveTo(84, 5); LineTo(84, 0);

    { bar }
    Brush.Color := FShapeCol;
    Pen.Color := FShapeCol;
    FBarShape.TopLeft := Point(42, 6);
    FBarShape.BottomRight := Point(FBarPos, Height - 2);
    Rectangle(FBarShape);

    Pen.Color := colBlack;

    for i := 0 to 20 - 1 do
    begin
      MoveTo((i + 1) * 4, 6);
      LineTo((i + 1) * 4, Height - 2);
    end;
  end;
end;

procedure THorizontalBar.SetPosition(aValue: Integer);
begin
  if aValue > 50 then
    FPosition := 50
  else if aValue < -50 then
    FPosition := -50
  else
    FPosition := aValue;

  FBarPos := 42 + Round(FPosition / 50 * 41);

  Invalidate;
end;

procedure THorizontalBar.SetStatus(aStatus: TStatus_AS);
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

end.
