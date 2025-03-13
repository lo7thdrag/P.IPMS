unit uRunningHour;

interface

uses
  Classes, ExtCtrls, Graphics, SysUtils, uBaseComponent, uIPMS_Data, Windows;

type

  TRunningHour = class(TIPMSBaseComponent)
  private
    FPic : TPicture;
    FFileName : string;

    FTail : TRect;

    FUpperLimit : Double;
    FLowerLimit : Double;

    FSensorType : TSensorType;
    FSensorValue : Double;

    FStatus : TStatus_RH;
    FStyle : TStyle_RH;

    FBlinkTimer : TTimer;
    FBlinkCount : Integer;

    FSecCount : Integer;

    procedure SetSensorType(aType : TSensorType);
    procedure SetSensorValue(aValue : Double);
    procedure SetStatus(aStatus : TStatus_RH);
    procedure SetStyle(aStyle : TStyle_RH);

    procedure OnCounting(Sender: TObject);

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
    property Status : TStatus_RH read FStatus write SetStatus;
    property Style : TStyle_RH read FStyle write SetStyle;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('IPMS', [TRunningHour]);
end;

{ TRunningHour }

constructor TRunningHour.Create(aOwner: TComponent);
begin
  inherited;

  Height := 26;
  Width := 84;

  FBlinkTimer := TTimer.Create(Self);
  FBlinkTimer.Interval := 1000;
  FBlinkTimer.OnTimer := OnCounting;
  FBlinkTimer.Enabled := False;
  FBlinkCount := 0;

  FSecCount := 0;

  FPic := TPicture.Create;

  SensorType := StpTemperature;
  SensorValue := 0;
  Status := RHtaDisableUnavailable;
  Style := RHtyLeftToRight;
end;

destructor TRunningHour.Destroy;
begin

  inherited;
end;

function TRunningHour.GetSensorValue: string;
begin
  case FStatus of
    RHtaDisableUnavailable: Result := '****';
    RHtaNotCounting,
    RHtaCounting: Result := FormatFloat('#0.#', FSensorValue);
  end;
end;

procedure TRunningHour.OnCounting(Sender: TObject);
begin
  if (FBlinkCount mod 2) = 0 then
    FFileName := 'RH_3B'
  else
    FFileName := 'RH_3A';

  Inc(FBlinkCount);
  Invalidate;

  Inc(FSecCount);

  if FSecCount >= 3600 then
  begin
    SensorValue := SensorValue + 1;
    FSecCount := 0;
  end;
end;

procedure TRunningHour.Paint;
begin
  with Canvas do
  begin
    Font.Name := 'Arial';
    Font.Size := 12;

    if FindResource(HInstance, PChar(FFileName), RT_BITMAP) <> 0 then
    begin
      FPic.Bitmap.LoadFromResourceName(HInstance, FFileName);

      Canvas.Draw(0, 0, FPic.Bitmap);
    end;

    Pen.Color := colGrey;
    Brush.Color := colGrey;
    Rectangle(FTail);

    Font.Color := colBlack;
    DrawText(Canvas.Handle, PChar(GetSensorValue), -1, FTail, DT_CENTER);

    Pen.Color := colBlack;

    case FStyle of
      RHtyLeftToRight:
      begin
        MoveTo(Height, 0);
        LineTo(Height, Height);
      end;
      RHtyTopToBottom:
      begin
        MoveTo(0, (Height div 2) - 1);
        LineTo(Height div 2, (Height div 2) - 1);
      end;
    end;
  end;

  inherited;
end;

procedure TRunningHour.Resize;
begin
  inherited;

  case FStyle of
    RHtyLeftToRight:
    begin
      FTail.TopLeft := Point(Height, 0);
      FTail.BottomRight := Point(Width, Height);
    end;
    RHtyTopToBottom:
    begin
      FTail.TopLeft := Point(0, Height div 2);
      FTail.BottomRight := Point(Width, Height);
    end;
  end;

  Invalidate;
end;

procedure TRunningHour.SetSensorType(aType: TSensorType);
begin
  FSensorType := aType;
  Invalidate;
end;

procedure TRunningHour.SetSensorValue(aValue: Double);
begin
  FSensorValue := aValue;
  Invalidate;
end;

procedure TRunningHour.SetStatus(aStatus: TStatus_RH);
begin
  FStatus := aStatus;

  case FStatus of
    RHtaDisableUnavailable:
    begin
      FBlinkTimer.Enabled := False;
      FFileName := 'RH_1';
    end;
    RHtaNotCounting:
    begin
      FBlinkTimer.Enabled := False;
      FFileName := 'RH_2';
    end;
    RHtaCounting:
    begin
      FFileName := 'RH_3A';
      FBlinkTimer.Enabled := True;
    end;
  end;

  Invalidate;
end;

procedure TRunningHour.SetStyle(aStyle: TStyle_RH);
begin
  case aStyle of
    RHtyLeftToRight:
    begin
      if FStyle <> aStyle then
      begin
        Height := Height div 2;
        Width := Width + Height;
      end;

      FTail.TopLeft := Point(Height, 0);
      FTail.BottomRight := Point(Width, Height);
    end;
    RHtyTopToBottom:
    begin
      if FStyle <> aStyle then
      begin
        Width := Width - Height;
        Height := Height * 2;
      end;

      FTail.TopLeft := Point(0, Height div 2);
      FTail.BottomRight := Point(Width, Height);
    end;
  end;

  FStyle := aStyle;

  Invalidate;
end;

end.
