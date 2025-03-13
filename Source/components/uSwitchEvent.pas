unit uSwitchEvent;

interface

uses
  Classes, Graphics, SysUtils, uBaseComponent, uIPMS_Data, Windows;

type

  TSwitchEvent = class(TIPMSBaseComponent)
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

    FStatus : TStatus_SE;
    FStyle : TStyle_SE;

    procedure SetCenterText(aHeadStr, aTailStr : string);

    procedure SetSensorType(aType : TSensorType);
    procedure SetSensorValue(aValue : Double);
    procedure SetStatus(aStatus : TStatus_SE);
    procedure SetStyle(aStyle : TStyle_SE);

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
    property Status : TStatus_SE read FStatus write SetStatus;
    property Style : TStyle_SE read FStyle write SetStyle;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('IPMS', [TSwitchEvent]);
end;

{ TSwitchEvent }

constructor TSwitchEvent.Create(aOwner: TComponent);
begin
  inherited;

  Height := 25;
  Width := 80;

  SensorType := StpTemperature;
  SensorValue := 0;
  Status := SEtaDisableUnavailable;
  Style := SEtyLeftToRight;
end;

destructor TSwitchEvent.Destroy;
begin

  inherited;
end;

function TSwitchEvent.GetSensorSymbol: string;
begin
  Result := '#';
end;

function TSwitchEvent.GetSensorValue: string;
begin
  case FStatus of
    SEtaDisableUnavailable: Result := '****';
    SEtaNormal: Result := FormatFloat('#0.#', FSensorValue);
  end;
end;

procedure TSwitchEvent.Paint;
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
      SEtyLeftToRight:
      begin
        MoveTo(Height, 0);
        LineTo(Height, Height);
      end;
      SEtyTopToBottom:
      begin
        MoveTo(0, (Height div 2) - 1);
        LineTo(Height div 2, (Height div 2) - 1);
      end;
    end;
  end;

  inherited;
end;

procedure TSwitchEvent.Resize;
begin
  inherited;

  case FStyle of
    SEtyLeftToRight:
    begin
      FHead.TopLeft := Point(0, 0);
      FHead.BottomRight := Point(Height, Height);
      FTail.TopLeft := Point(Height, 0);
      FTail.BottomRight := Point(Width, Height);
    end;
    SEtyTopToBottom:
    begin
      FHead.TopLeft := Point(0, 0);
      FHead.BottomRight := Point(Round(Height/2), Round(Height/2));
      FTail.TopLeft := Point(0, Round(Height/2));
      FTail.BottomRight := Point(Width, Height);
    end;
  end;

  Invalidate;
end;

procedure TSwitchEvent.SetCenterText(aHeadStr, aTailStr: string);
begin
  case FStyle of
    SEtyLeftToRight:
    begin
      FStrHeadX := (Height div 2) - (Length(aHeadStr) * 6);
      FStrHeadY := (Height div 2) - 9;
      FStrTailX := ((Width - Height) div 2) + (Height + 10) - (Length(aTailStr) * 6);
      FStrTailY := (Height div 2) - 9;
    end;
    SEtyTopToBottom:
    begin
      FStrHeadX := (Height div 4) - (Length(aHeadStr) * 6);
      FStrHeadY := (Height div 4) - 9;
      FStrTailX := (Width div 2) + 10 - (Length(aTailStr) * 6);
      FStrTailY := (Height div 2) + (Height div 4) - 9;
    end;
  end;
end;

procedure TSwitchEvent.SetSensorType(aType: TSensorType);
begin
  FSensorType := aType;
  Invalidate;
end;

procedure TSwitchEvent.SetSensorValue(aValue: Double);
begin
  FSensorValue := aValue;
  Invalidate;
end;

procedure TSwitchEvent.SetStatus(aStatus: TStatus_SE);
begin
  FStatus := aStatus;

  case FStatus of
    SEtaDisableUnavailable:
    begin
      FHeadRecCol := colPink;
      FHeadStrCol := colWhite;
    end;
    SEtaNormal:
    begin
      FHeadRecCol := colGrey;
      FHeadStrCol := colBlack;
    end;
  end;

  Invalidate;
end;

procedure TSwitchEvent.SetStyle(aStyle: TStyle_SE);
begin
  case aStyle of
    SEtyLeftToRight:
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
    SEtyTopToBottom:
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
