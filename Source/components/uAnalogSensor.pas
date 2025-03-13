unit uAnalogSensor;

interface

uses
  Classes, Dialogs, Graphics, SysUtils, uBaseComponent, uIPMS_Data, Windows;

type

  TAnalogSensor = class(TIPMSBaseComponent)
  private
    FHead : TRect;
    FStrHeadX : Integer;
    FStrHeadY : Integer;
    FHeadRecCol : TColor;
    FHeadStrCol : TColor;

    FTail : TRect;
    FStrTailX : Integer;
    FStrTailY : Integer;

    FUpperLimit : Double;
    FLowerLimit : Double;

    FSensorType : TSensorType;
    FSensorValue : Double;

    FStatus : TStatus_AS;
    FStyle : TStyle_AS;
    FIsShowHead: Boolean;

    FDecimalPlace : Integer;

    procedure SetCenterText(aHeadStr, aTailStr: string);

    procedure SetDecimalPlace(aValue: Integer);
    procedure SetSensorType(aType: TSensorType);
    procedure SetSensorValue(aValue: Double);
    procedure SetShowHead(const Value: Boolean);
    procedure SetStatus(aStatus: TStatus_AS);
    procedure SetStyle(aStyle: TStyle_AS);

    function GetSensorSymbol: string;
    function GetSensorValue: string;
  protected
    procedure Paint; override;
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;
  published
    property DecimalPlace : Integer read FDecimalPlace write SetDecimalPlace;

    property UpperLimit : Double read FUpperLimit write FUpperLimit;
    property LowerLimit : Double read FLowerLimit write FLowerLimit;

    property SensorType : TSensorType read FSensorType write SetSensorType;
    property SensorValue : Double read FSensorValue write SetSensorValue;
    property ShowHead : Boolean read FIsShowHead write SetShowHead;
    property Status : TStatus_AS read FStatus write SetStatus;
    property Style : TStyle_AS read FStyle write SetStyle;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('IPMS', [TAnalogSensor]);
end;

{ TAnalogSensor }

constructor TAnalogSensor.Create(aOwner: TComponent);
begin
  inherited;

  DecimalPlace := 1;
  SensorType := StpTemperature;
  SensorValue := 0;
  ShowHead := True;
  Status := AStaDisableUnavailable;
  Style := AStyLeftToRight;
end;

destructor TAnalogSensor.Destroy;
begin

  inherited;
end;

function TAnalogSensor.GetSensorSymbol: string;
begin
  case FSensorType of
    StpTemperature: Result := 'T';
    StpPressure: Result := 'p';
    StpElectricalPower: Result := 'P';
    StpFlow: Result := 'F';
    StpContents: Result := 'C';
    StpLevel: Result := 'L';
    StpElectricalCurrent: Result := 'I';
    StpSpeed: Result := 'N';
    StpFrequency: Result := 'f';
    StpResistance: Result := 'R';
    StpConductivity: Result := 'S';
    StpVoltage: Result := 'U';
    StpHumidity: Result := 'H';
    StpCosPhi: Result := '1';
    StpVolume: Result := 'V';
    StpAngle: Result := '2';
    StpDelta: Result := '6';
  end;
end;

function TAnalogSensor.GetSensorValue: string;
begin
  case FStatus of
    AStaDisableUnavailable: Result := '****';
    AStaValOK,
    AStaValHighLow:
    begin
      case FDecimalPlace of
        0: Result := FormatFloat('0', FSensorValue);
        1: Result := FormatFloat('0.0', FSensorValue);
        2: Result := FormatFloat('0.00', FSensorValue);
        3: Result := FormatFloat('0.000', FSensorValue);
      end;
    end;
    AStaTooLow: Result := '----';
    AStaTooHigh: Result := '++++';
    AStaWireBreak: Result := '****';
  end;
end;

procedure TAnalogSensor.Paint;
begin
  with Canvas do
  begin
    case FStyle of
      AStyLeftToRight:
      begin
        FHead.TopLeft := Point(0, 0);
        FHead.BottomRight := Point(Height, Height);
        FTail.TopLeft := Point(Height, 0);
        FTail.BottomRight := Point(Width, Height);
      end;
      AStyTopToBottom:
      begin
        FHead.TopLeft := Point(0, 0);
        FHead.BottomRight := Point(Height div 2, Height div 2);
        FTail.TopLeft := Point(0, Height div 2);
        FTail.BottomRight := Point(Width, Height);
      end;
    end;

    SetCenterText(GetSensorSymbol, GetSensorValue);

    Font.Size := 12;

    if FIsShowHead then
    begin
      Font.Name := 'IPMS';

      Pen.Color := FHeadRecCol;
      Brush.Color := FHeadRecCol;
      Rectangle(FHead);

      Font.Color := FHeadStrCol;
      TextOut(FStrHeadX, FStrHeadY, GetSensorSymbol);
    end;

    Pen.Color := colGrey;
    Brush.Color := colGrey;
    Rectangle(FTail);

    Font.Name := 'Arial';

    Font.Color := colBlack;
    TextOut(FStrTailX, FStrTailY, GetSensorValue);

    Pen.Color := colBlack;

    case FStyle of
      AStyLeftToRight:
      begin
        MoveTo(Height, 0);
        LineTo(Height, Height);
      end;
      AStyTopToBottom:
      begin
        MoveTo(0, (Height div 2) - 1);
        LineTo(Height div 2, (Height div 2) - 1);
      end;
    end;
  end;

  inherited;
end;

procedure TAnalogSensor.SetCenterText(aHeadStr, aTailStr: string);
begin
  case FStyle of
    AStyLeftToRight:
    begin
      FStrHeadX := (Height div 2) - (Length(aHeadStr) * 6);
      FStrHeadY := (Height div 2) - 9;
      FStrTailX := ((Width - Height) div 2) + (Height + 10) -
        (Length(aTailStr) * 6);
      FStrTailY := (Height div 2) - 9;
    end;
    AStyTopToBottom:
    begin
      FStrHeadX := (Height div 4) - (Length(aHeadStr) * 6);
      FStrHeadY := (Height div 4) - 9;
      FStrTailX := (Width div 2) + 10 - (Length(aTailStr) * 6);
      FStrTailY := (Height div 2) + (Height div 4) - 9;
    end;
  end;
end;

procedure TAnalogSensor.SetDecimalPlace(aValue: Integer);
begin
  FDecimalPlace := aValue;
  Invalidate;
end;

procedure TAnalogSensor.SetSensorType(aType: TSensorType);
begin
  FSensorType := aType;
  Invalidate;
end;

procedure TAnalogSensor.SetSensorValue(aValue: Double);
begin
  FSensorValue := aValue;
  Invalidate;
end;

procedure TAnalogSensor.SetShowHead(const Value: Boolean);
begin
  FIsShowHead := Value;
  Invalidate;
end;

procedure TAnalogSensor.SetStatus(aStatus: TStatus_AS);
begin
  FStatus := aStatus;

  case FStatus of
    AStaDisableUnavailable:
    begin
      FHeadRecCol := colPink;
      FHeadStrCol := colWhite;
    end;
    AStaValOK:
    begin
      FHeadRecCol := colGrey;
      FHeadStrCol := colBlack;
    end;
    AStaValHighLow,
    AStaTooLow,
    AStaTooHigh,
    AStaWireBreak:
    begin
      FHeadRecCol := colRed;
      FHeadStrCol := colWhite;
    end;
  end;

  Invalidate;
end;

procedure TAnalogSensor.SetStyle(aStyle: TStyle_AS);
begin
  FStyle := aStyle;

  case FStyle of
    AStyLeftToRight:
    begin
      Height := 26;
      Width := 84;
    end;
    AStyTopToBottom:
    begin
      Height := 52;
      Width := 58;
    end;
  end;

  Invalidate;
end;

end.
