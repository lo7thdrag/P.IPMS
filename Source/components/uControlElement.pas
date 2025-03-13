unit uControlElement;

interface

uses
  Classes, Graphics, SysUtils, Windows, uBaseComponent, uIPMS_Data;

type

  TControlElement = class(TIPMSBaseComponent)
  private
    FStatus : TStatus_CT;
    FStyle : TStyle_CT;

    FSymbol : TPicture;

    FPath : string;
    FFileName : string;

    FCaption : string;

    FShape : TRect;
    FShapeColor : TColor;
    FTextColor : TColor;

    procedure SetCaption(aText: string);
    procedure SetStatus(aStatus: TStatus_CT);
    procedure SetStyle(aStyle: TStyle_CT);
  protected
    procedure Paint; override;
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Caption : string read FCaption write SetCaption;
    property Status : TStatus_CT read FStatus write SetStatus;
    property Style : TStyle_CT read FStyle write SetStyle;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('IPMS', [TControlElement]);
end;

{ TControlElement }

constructor TControlElement.Create(aOwner: TComponent);
begin
  inherited;

  FSymbol := TPicture.Create;
  FPath := 'CTR_Checkbox_';

  Caption := 'TEXT 1';

  Style := CTtyButton;
  Status := CTtaDisableUnavailable;
end;

destructor TControlElement.Destroy;
begin

  inherited;
end;

procedure TControlElement.Paint;
begin
  with Canvas do
  begin
    FShape.TopLeft := Point(0, 0);
    FShape.BottomRight := Point(Width, Height);

    case FStyle of
      CTtyButton:
      begin
        Brush.Color := FShapeColor;
        Pen.Color := FShapeColor;
        Rectangle(FShape);

        Font.Color := FTextColor;
        Font.Name := 'Arial';
        Font.Size := 10;
        Font.Style := [fsBold];

        DrawText(Handle, PChar(FCaption), -1, FShape, DT_CENTER);
      end;
      CTtyCheckbox:
      begin
        if FindResource(HInstance, PChar(FPath + FFileName),
          RT_BITMAP) <> 0 then
        begin
          FSymbol.Bitmap.LoadFromResourceName(HInstance, FPath + FFileName);
          Draw(0, 0, FSymbol.Bitmap);
        end;
      end;
    end;
  end;

  inherited;
end;

procedure TControlElement.SetCaption(aText: string);
begin
  FCaption := aText;
  Invalidate;
end;

procedure TControlElement.SetStatus(aStatus: TStatus_CT);
begin
  FStatus := aStatus;

  case FStatus of
    CTtaDisableUnavailable:
    begin
      FFileName := 'DisableUnavailable';
      FShapeColor := colPink;
      FTextColor := colSilverGrey;
    end;
    CTtaOFF:
    begin
      FFileName := 'OFF';
      FShapeColor := colSilverGrey;
      FTextColor := colBlack;
    end;
    CTtaON:
    begin
      FFileName := 'ON';
      FShapeColor := colBrightGreen;
      FTextColor := colBlack;
    end;
    CTtaNotReadyToUse:
    begin
      FFileName := 'NotReadyToUse';
      FShapeColor := colSilverGrey;
      FTextColor := colGrey;
    end;
    CTtaAlarm:
    begin
      FFileName := 'Alarm';
      FShapeColor := colRed;
      FTextColor := colSilverGrey;
    end;
  end;

  Invalidate;
end;

procedure TControlElement.SetStyle(aStyle: TStyle_CT);
begin
  FStyle := aStyle;

  if (csDesigning in ComponentState) and not (csLoading in ComponentState) then
  begin
    case FStyle of
      CTtyButton:
      begin
        Height := 20;
        Width := 118;
      end;
      CTtyCheckbox:
      begin
        Height := 20;
        Width := 20;
      end;
    end;
  end;
end;

end.
