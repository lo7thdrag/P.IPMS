unit uValveProportionally;

interface

uses
  Classes, Graphics, SysUtils, uBaseComponent, uIPMS_Data, Windows;

type
  TValveProportionally = class(TIPMSBaseComponent)
  private
    FStatus : TStatus_VP;
    FStyle : TStyle_VP;

    FSymbol : TPicture;

    FPath : string;
    FFilePrefix : string;
    FFileName : string;

    FSensorValue : Double;

    FShape : TRect;
    FShapeColor : TColor;
    FTextColor : TColor;

    procedure SetStatus(aStatus: TStatus_VP);
    procedure SetStyle(aStyle: TStyle_VP);
    procedure SetSensorValue(aValue: Double);

    procedure SetCenterText(aText: string; var aPosX, aPosY: Integer);

    function GetSensorValue: string;
  protected
    procedure Paint; override;
    procedure Resize; override;
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Status : TStatus_VP read FStatus write SetStatus;
//    property Style : TStyle_VP read FStyle write SetStyle;
    property SensorValue : Double read FSensorValue write SetSensorValue;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('IPMS', [TValveProportionally]);
end;

{ TValveProportionally }

constructor TValveProportionally.Create(aOwner: TComponent);
begin
  inherited;

  FSymbol := TPicture.Create;

  Height := 70;
  Width := 55;

  FPath := 'VC_Proportional_';

  Status := VPtaDisableUnavailable;
  SetStyle(VPtyHorizontal);
end;

destructor TValveProportionally.Destroy;
begin

  inherited;
end;

function TValveProportionally.GetSensorValue: string;
begin
  case FStatus of
    VPtaDisableUnavailable: Result := '***';
    VPtaAlmostClosed: Result := FormatFloat('#0.#', FSensorValue);
    VPtaNotClosed: Result := FormatFloat('#0.#', FSensorValue);
    VPtaNotReadyToUse: Result := FormatFloat('#0.#', FSensorValue);
    VPtaTooLow: Result := '---';
    VPtaTooHigh: Result := '+++';
    VPtaFailed: Result := FormatFloat('#0.#', FSensorValue);
  end;
end;

procedure TValveProportionally.Paint;
var
  valueStr : string;
  posX, posY : Integer;
begin
  if FindResource(HInstance, PChar(FPath + FFilePrefix + FFileName),
    RT_BITMAP) <> 0 then
  begin
    FSymbol.Bitmap.LoadFromResourceName(HInstance, FPath + FFilePrefix +
      FFileName);

    with Canvas do
    begin
      Draw(0, 0, FSymbol.Bitmap);

      Brush.Color := FShapeColor;
      Pen.Color := FShapeColor;
      Rectangle(FShape);

      valueStr := GetSensorValue;
      SetCenterText(valueStr, posX, posY);

      Font.Color := FTextColor;
      Font.Name := 'Arial';
      Font.Size := 12;
      TextOut(posX, 45, valueStr);
    end;
  end;

  inherited;
end;

procedure TValveProportionally.Resize;
begin
  inherited;

  FShape.TopLeft := Point(0, 45);
  FShape.BottomRight := Point(Width, Height);
end;

procedure TValveProportionally.SetCenterText(aText: string; var aPosX,
  aPosY: Integer);
begin
  aPosX := (Width div 2) - (Length(aText) * 6);
  aPosY := (Height div 2) - 9;
end;

procedure TValveProportionally.SetSensorValue(aValue: Double);
begin
  FSensorValue := aValue;
  Invalidate;
end;

procedure TValveProportionally.SetStatus(aStatus: TStatus_VP);
begin
  FStatus := aStatus;

  case FStatus of
    VPtaDisableUnavailable:
    begin
      FFileName := 'DisableUnavailable';

      FShapeColor := colSilverGrey;
      FTextColor := colBlack;
    end;
    VPtaAlmostClosed:
    begin
      FFileName := 'AlmostClosed';

      FShapeColor := colSilverGrey;
      FTextColor := colBlack;
    end;
    VPtaNotClosed:
    begin
      FFileName := 'NotClose';

      FShapeColor := colSilverGrey;
      FTextColor := colBlack;
    end;
    VPtaNotReadyToUse:
    begin
      FFileName := 'NotReadyToUse';

      FShapeColor := colSilverGrey;
      FTextColor := colBlack;
    end;
    VPtaTooLow:
    begin
      FFileName := 'OpenFailed';

      FShapeColor := colRed;
      FTextColor := colSilverGrey;
    end;
    VPtaTooHigh:
    begin
      FFileName := 'OpenFailed';

      FShapeColor := colRed;
      FTextColor := colSilverGrey;
    end;
    VPtaFailed:
    begin
      FFileName := 'OpenFailed';

      FShapeColor := colSilverGrey;
      FTextColor := colBlack;
    end;
  end;

  Invalidate;
end;

procedure TValveProportionally.SetStyle(aStyle: TStyle_VP);
begin
  FStyle := aStyle;

  case FStyle of
    VPtyHorizontal: FFilePrefix := 'Hor_';
    VPtyVertical: FFilePrefix := 'Ver_';
  end;

  Invalidate;
end;

end.
