unit uSetpoint;

interface

uses
  Classes, Graphics, SysUtils, uBaseComponent, uIPMS_Data, Windows;

type

  TSetpoint = class(TIPMSBaseComponent)
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

    FStatus : TStatus_SP;
    FStyle : TStyle_SP;

    procedure SetCenterText(aHeadStr, aTailStr : string);

    procedure SetSensorType(aType : TSensorType);
    procedure SetSensorValue(aValue : Double);
    procedure SetStatus(aStatus : TStatus_SP);
    procedure SetStyle(aStyle : TStyle_SP);

    function GetSensorSymbol : string;
    function GetSensorValue : string;
  protected
    procedure Paint; override;
    procedure Resize; override;
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;
  published
    property UpperLimit : Double read FUpperLimit write FUpperLimit;
    property LowerLimit : Double read FLowerLimit write FLowerLimit;

    property SensorType : TSensorType read FSensorType write SetSensorType;
    property SensorValue : Double read FSensorValue write SetSensorValue;
    property Status : TStatus_SP read FStatus write SetStatus;
    property Style : TStyle_SP read FStyle write SetStyle;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('IPMS', [TSetpoint]);
end;

{ TSetpoint }

constructor TSetpoint.Create(aOwner: TComponent);
begin
  inherited;

  Height := 25;
  Width := 80;

  SensorType := StpTemperature;
  SensorValue := 0;
  Status := SPtaDisableUnavailable;
  Style := SPtyLeftToRight;
end;

destructor TSetpoint.Destroy;
begin

  inherited;
end;

function TSetpoint.GetSensorSymbol: string;
begin
  case FSensorType of
    StpTemperature: Result := 'T';
    StpPressure: Result := 'p';
    StpElectricalPower: Result := 'P';
    StpFlow: Result := 'F';
    StpContents: Result := 'C';
    StpLevel: Result := 'L';
    StpElectricalCurrent: Result := 'I';
    StpSpeed: Result := 'n';
    StpFrequency: Result := 'f';
    StpResistance: Result := 'R';
    StpConductivity: Result := 'S';
    StpVoltage: Result := 'V';
    StpHumidity: Result := 'H';
  end;
end;

function TSetpoint.GetSensorValue: string;
begin
  case FStatus of
    SPtaDisableUnavailable: Result := '****';
    SPtaNormal: Result := FormatFloat('#0.#', FSensorValue);
  end;
end;

procedure TSetpoint.Paint;
begin
  with Canvas do
  begin
    SetCenterText(GetSensorSymbol, GetSensorValue);

    Font.Name := 'Arial';
    Font.Size := 12;

    Pen.Color := FHeadRecCol;
    Brush.Color := FHeadRecCol;
    Rectangle(FHead);

    Font.Color := FHeadStrCol;
    TextOut(FStrHeadX, FStrHeadY, GetSensorSymbol);

    Pen.Color := colGrey;
    Brush.Color := colGrey;
    Rectangle(FTail);

    Font.Color := colBlack;
    TextOut(FStrTailX, FStrTailY, GetSensorValue);

    Pen.Color := colBlack;

    case FStyle of
      SPtyLeftToRight:
      begin
        MoveTo(Height, 0);
        LineTo(Height, Height);
      end;
      SPtyTopToBottom:
      begin
        MoveTo(0, (Height div 2) - 1);
        LineTo(Height div 2, (Height div 2) - 1);
      end;
    end;
  end;

  inherited;
end;

procedure TSetpoint.Resize;
begin
  inherited;

  case FStyle of
    SPtyLeftToRight:
    begin
      FHead.TopLeft := Point(0, 0);
      FHead.BottomRight := Point(Height, Height);
      FTail.TopLeft := Point(Height, 0);
      FTail.BottomRight := Point(Width, Height);
    end;
    SPtyTopToBottom:
    begin
      FHead.TopLeft := Point(0, 0);
      FHead.BottomRight := Point(Round(Height/2), Round(Height/2));
      FTail.TopLeft := Point(0, Round(Height/2));
      FTail.BottomRight := Point(Width, Height);
    end;
  end;

  Invalidate;
end;

procedure TSetpoint.SetCenterText(aHeadStr, aTailStr: string);
begin
  case FStyle of
    SPtyLeftToRight:
    begin
      FStrHeadX := (Height div 2) - (Length(aHeadStr) * 6);
      FStrHeadY := (Height div 2) - 9;
      FStrTailX := ((Width - Height) div 2) + (Height + 10) - (Length(aTailStr) * 6);
      FStrTailY := (Height div 2) - 9;
    end;
    SPtyTopToBottom:
    begin
      FStrHeadX := (Height div 4) - (Length(aHeadStr) * 6);
      FStrHeadY := (Height div 4) - 9;
      FStrTailX := (Width div 2) + 10 - (Length(aTailStr) * 6);
      FStrTailY := (Height div 2) + (Height div 4) - 9;
    end;
  end;
end;

procedure TSetpoint.SetSensorType(aType: TSensorType);
begin
  FSensorType := aType;
  Invalidate;
end;

procedure TSetpoint.SetSensorValue(aValue: Double);
begin
  FSensorValue := aValue;
  Invalidate;
end;

procedure TSetpoint.SetStatus(aStatus: TStatus_SP);
begin
  FStatus := aStatus;

  case FStatus of
    SPtaDisableUnavailable:
    begin
      FHeadRecCol := colPink;
      FHeadStrCol := colWhite;
    end;
    SPtaNormal:
    begin
      FHeadRecCol := clBlue;
      FHeadStrCol := colBlack;
    end;
  end;

  Invalidate;
end;

procedure TSetpoint.SetStyle(aStyle: TStyle_SP);
begin
  case aStyle of
    SPtyLeftToRight:
    begin
      if FStyle <> aStyle then
      begin
        Height := Height div 2;
        Width := Width + Height;
      end;

      FHead.TopLeft := Point(0, 0);
      FHead.BottomRight := Point(Height, Height);
      FTail.TopLeft := Point(Height, 0);
      FTail.BottomRight := Point(Width, Height);
    end;
    SPtyTopToBottom:
    begin
      if FStyle <> aStyle then
      begin
        Width := Width - Height;
        Height := Height * 2;
      end;

      FHead.TopLeft := Point(0, 0);
      FHead.BottomRight := Point(Height div 2, Height div 2);
      FTail.TopLeft := Point(0, Height div 2);
      FTail.BottomRight := Point(Width, Height);
    end;
  end;

  FStyle := aStyle;

  Invalidate;
end;

end.
