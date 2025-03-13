unit uTankSensor;

interface

uses
  Classes, Graphics, SysUtils, uBaseComponent, uIPMS_Data, Windows;

type
  TTankSensor = class(TIPMSBaseComponent)
  private
    FStatus : TStatus_TS;

    FUpperLimit : Double;
    FLowerLimit : Double;
    FTankValue : Double;

    FBox : TRect;
    FBarFront : TRect;
    FBarBack : TRect;

    FBarColor : TColor;

    procedure SetStatus(aStatus : TStatus_TS);

    procedure SetUpperLimit(aValue : Double);
    procedure SetLowerLimit(aValue : Double);
    procedure SetTankValue(aValue : Double);

    procedure Initialize;
  protected
    procedure Paint; override;
    procedure Resize; override;
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Status : TStatus_TS read FStatus write SetStatus;

    property UpperLimit : Double read FUpperLimit write SetUpperLimit;
    property LowerLimit : Double read FLowerLimit write SetLowerLimit;
    property TankValue : Double read FTankValue write SetTankValue;
  end;

const
  backBarHeight : Integer = 90;
  backBarWidth : Integer = 14;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('IPMS', [TTankSensor]);
end;

{ TAnalogSensor }

constructor TTankSensor.Create(aOwner: TComponent);
begin
  inherited;

  Height := 100;
  Width := 60;

  Initialize;

  Status := TStaDisableUnavailable;

  UpperLimit := 100;
  LowerLimit := 0;
  TankValue := 40;
end;

destructor TTankSensor.Destroy;
begin

  inherited;
end;

procedure TTankSensor.Initialize;
begin
  FBox.TopLeft := Point(0, 0);
  FBox.BottomRight := Point(Width, Height);

  FBarBack.TopLeft := Point(5, (Height div 2) - (backBarHeight div 2));
  FBarBack.BottomRight := Point(backBarWidth, (Height div 2) +
    (backBarHeight div 2));
end;

procedure TTankSensor.Paint;
var
  i,
  distance : Integer;
begin
  with Canvas do
  begin
    Brush.Color := colGrey;
    Pen.Color := colGrey;
    Rectangle(FBox);

    Brush.Color := colBlack;
    Pen.Color := colBlack;
    Rectangle(FBarBack);

    Brush.Color := FBarColor;
    Pen.Color := FBarColor;
    Rectangle(FBarFront);

    Pen.Color := colBlack;

    distance := (Height div 2) - (backBarHeight div 2);

    for i := 1 to 17 do
    begin
      MoveTo(FBarBack.Left, ((i * 5) + distance));
      LineTo(FBarBack.Right, ((i * 5) + distance));
    end;
  end;

  inherited;
end;

procedure TTankSensor.Resize;
var
  frontBarHeight : Integer;
begin
  inherited;

  FBox.TopLeft := Point(0, 0);
  FBox.BottomRight := Point(Width, Height);

  FBarBack.TopLeft := Point(5, (Height div 2) - (backBarHeight div 2));
  FBarBack.BottomRight := Point(backBarWidth, (Height div 2) +
    (backBarHeight div 2));

  if (FUpperLimit - FLowerLimit) <= 0 then
    frontBarHeight := backBarHeight
  else
    frontBarHeight := Round(FTankValue /(FUpperLimit - FLowerLimit) *
      backBarHeight);

  FBarFront.TopLeft := Point(5, FBarFront.Bottom - frontBarHeight);
  FBarFront.BottomRight := Point(backBarWidth, (Height div 2) +
    (backBarHeight div 2));
end;

procedure TTankSensor.SetLowerLimit(aValue: Double);
var
  frontBarHeight : Integer;
begin
  if FLowerLimit > FUpperLimit then
    Exit;

  FLowerLimit := aValue;

  if (FUpperLimit - FLowerLimit) <= 0 then
    frontBarHeight := backBarHeight
  else
    frontBarHeight := Round(FTankValue /(FUpperLimit - FLowerLimit) *
      backBarHeight);

  FBarFront.TopLeft := Point(5, FBarFront.Bottom - frontBarHeight);
  FBarFront.BottomRight := Point(backBarWidth, (Height div 2) +
    (backBarHeight div 2));

  Invalidate;
end;

procedure TTankSensor.SetStatus(aStatus: TStatus_TS);
begin
  FStatus := aStatus;

  case FStatus of
    TStaDisableUnavailable: FBarColor := colPink;
    TStaValOK: FBarColor := colGreen;
    TStaValHighLow: FBarColor := colRed;
    TStaTooLowTooHigh: FBarColor := colRed;
  end;

  Invalidate;
end;

procedure TTankSensor.SetTankValue(aValue: Double);
var
  frontBarHeight : Integer;
begin
  if (FTankValue < FLowerLimit) and (FTankValue > FUpperLimit) then
    Exit;

  FTankValue := aValue;

  if (FUpperLimit - FLowerLimit) <= 0 then
    frontBarHeight := backBarHeight
  else
    frontBarHeight := Round(FTankValue /(FUpperLimit - FLowerLimit) *
      backBarHeight);

  FBarFront.TopLeft := Point(5, FBarFront.Bottom - frontBarHeight);
  FBarFront.BottomRight := Point(backBarWidth, (Height div 2) +
    (backBarHeight div 2));

  Invalidate;
end;

procedure TTankSensor.SetUpperLimit(aValue: Double);
var
  frontBarHeight : Integer;
begin
  if FUpperLimit < FLowerLimit then
    Exit;

  FUpperLimit := aValue;

  if (FUpperLimit - FLowerLimit) <= 0 then
    frontBarHeight := backBarHeight
  else
    frontBarHeight := Round(FTankValue /(FUpperLimit - FLowerLimit) *
      backBarHeight);

  FBarFront.TopLeft := Point(5, FBarFront.Bottom - frontBarHeight);
  FBarFront.BottomRight := Point(backBarWidth, (Height div 2) +
    (backBarHeight div 2));

  Invalidate;
end;

end.
