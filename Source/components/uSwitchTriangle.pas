unit uSwitchTriangle;

interface

uses
  Classes, Graphics, Windows, uBaseComponent, uIPMS_Data;

type
  TSwitchTriangle = class(TIPMSBaseComponent)
  private
    FShape : array[0..2] of TPoint;
    FShapeCol : TColor;

    FStatus : TStatus_SW;
    FStyle : TStyle_SW;
    FSize : TSize_SW;

    procedure SetSize(aSize: TSize_SW);
    procedure SetStatus(aStatus: TStatus_SW);
    procedure SetStyle(aStyle: TStyle_SW);
  protected
    procedure Paint; override;
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Size : TSize_SW read FSize write SetSize;
    property Status : TStatus_SW read FStatus write SetStatus;
    property Style : TStyle_SW read FStyle write SetStyle;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('IPMS', [TSwitchTriangle]);
end;

{ TSwitchTriangle }

constructor TSwitchTriangle.Create(aOwner: TComponent);
begin
  inherited;

  Size := SWszBig;
  Style := SWtyUp;
  Status := SWtaDisabled;
end;

destructor TSwitchTriangle.Destroy;
begin

  inherited;
end;

procedure TSwitchTriangle.Paint;
begin
  inherited;

  with Canvas do
  begin
    Brush.Color := FShapeCol;
    Pen.Color := FShapeCol;
    Polygon(FShape);

    case FStyle of
      SWtyUp:
      begin
        Pen.Color := colDarkGrey;
        MoveTo(Width div 2, 0); LineTo(Width, Height);
        MoveTo(0, Height-1); LineTo(Width, Height-1);

        Pen.Color := colWhite;
        MoveTo(0, Height); LineTo(Width div 2, 0);
      end;
      SWtyDown:
      begin
        Pen.Color := colDarkGrey;
        MoveTo(Width, 0); LineTo(Width div 2, Height);

        Pen.Color := colWhite;
        MoveTo(0, 0); LineTo(Width, 0);
        MoveTo(0, 0); LineTo(Width div 2, Height);
      end;
    end;
  end;
end;

procedure TSwitchTriangle.SetSize(aSize: TSize_SW);
begin
  FSize := aSize;

  if (csDesigning in ComponentState) and not (csLoading in ComponentState) then
  begin
    case FSize of
      SWszBig:
      begin
        Height := 20;
        Width := 30;
      end;
      SWszSmall:
      begin
        Height := 10;
        Width := 15;
      end;
    end;

    SetStyle(FStyle);
  end;

  Invalidate;
end;

procedure TSwitchTriangle.SetStatus(aStatus: TStatus_SW);
begin
  FStatus := aStatus;

  case FStatus of
    SWtaDisabled: FShapeCol := colPink;
    SWtaFalse: FShapeCol := colGrey;
    SWtaOk: FShapeCol := colBrightGreen;
    SWtaIndicateAlarm: FShapeCol := colDarkGreen;
    SWtaWarning: FShapeCol := colYellow;
    SWtaAlarm: FShapeCol := colRed;
  end;

  Invalidate;
end;

procedure TSwitchTriangle.SetStyle(aStyle: TStyle_SW);
begin
  FStyle := aStyle;

  case FStyle of
    SWtyUp:
    begin
      FShape[0] := Point(Width div 2, 0);
      FShape[1] := Point(0, Height);
      FShape[2] := Point(Width, Height);
    end;
    SWtyDown:
    begin
      FShape[0] := Point(Width div 2, Height);
      FShape[1] := Point(0, 0);
      FShape[2] := Point(Width, 0);
    end;
  end;

  Invalidate;
end;

end.
