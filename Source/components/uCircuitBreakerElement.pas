unit uCircuitBreakerElement;

interface

uses
    Classes, Graphics, Windows, uBaseComponent, uIPMS_Data;
Type

  TCircuitBreakerElement = class (TIPMSBaseComponent)
  private
    FIsShowAutoHandle : Boolean;
    FIsShowManHandle : Boolean;
    FPic : TPicture;
    FHandlePosX : Integer;
    FHandlePosY : Integer;
    FShapeCol : TColor;
    FStatus : TStatus_CB;
    FStatusStr : string;
    FStyle : TStyle_CB;
    FStyleStr : string;

    procedure DrawHandle(aCanvas: TCanvas; aManX, aManY, aAutoX, aAutoY: Integer);

    procedure SetShowAutoHandle(aIsShow: Boolean);
    procedure SetShowManHandle(aIsShow: Boolean);
    procedure SetStatus(aStatus: TStatus_CB);
    procedure SetStyle(aStyle: TStyle_CB);
  protected
    procedure Paint; override;
  public
    Constructor Create (aOwner : TComponent); override;
    Destructor  Destroy ; override;
  published
    property ShowAutoHandle : Boolean read FIsShowAutoHandle write SetShowAutoHandle;
    property ShowManHandle : Boolean read FIsShowManHandle write SetShowManHandle;
    property Status : TStatus_CB read FStatus write SetStatus;
    property Style : TStyle_CB read FStyle write SetStyle;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('IPMS', [TCircuitBreakerElement]);
end;

{ TCircuitBreakerElement }

constructor TCircuitBreakerElement.Create(aOwner: TComponent);
begin
  inherited;

  FPic := TPicture.Create;

  Status := CBtaDisabledUnavailable;
  Style := CBtyHorizontal;

  Height := 46;
  Width  := 55;
end;

destructor TCircuitBreakerElement.Destroy;
begin

  inherited;
end;

procedure TCircuitBreakerElement.DrawHandle(aCanvas: TCanvas; aManX, aManY,
  aAutoX, aAutoY: Integer);
begin
  with aCanvas do
  begin
    Pen.Color := FShapeCol;

    if FIsShowManHandle then
    begin
      case FStyle of
        CBtyHorizontal:
        begin
          MoveTo(aManX + 0, aManY + 0);
          LineTo(aManX + 12, aManY + 0);
          MoveTo(aManX + 6, aManY + 0);
          LineTo(aManX + 6, aManY + 10);
        end;
        CBtyVertical:
        begin
          MoveTo(aManY + 0, aManX + 0);
          LineTo(aManY + 0, aManX + 12);
          MoveTo(aManY + 0, aManX + 6);
          LineTo(aManY + 10, aManX + 6);
        end;
      end;
    end;

    if FIsShowAutoHandle then
    begin
      case FStyle of
        CBtyHorizontal:
        begin
          MoveTo(aAutoX + 0, aAutoY + 10);
          LineTo(aAutoX + 12, aAutoY + 10);
          MoveTo(aAutoX + 12, aAutoY + 10);
          LineTo(aAutoX + 12, aAutoY + 14);
          MoveTo(aAutoX + 12, aAutoY + 14);
          LineTo(aAutoX + 0, aAutoY + 14);
          MoveTo(aAutoX + 0, aAutoY + 14);
          LineTo(aAutoX + 0, aAutoY + 10);

          MoveTo(aAutoX + 6, aAutoY + 0);
          LineTo(aAutoX + 6, aAutoY + 10);
        end;
        CBtyVertical:
        begin
          MoveTo(aAutoY + 10, aAutoX + 0);
          LineTo(aAutoY + 10, aAutoX + 12);
          MoveTo(aAutoY + 10, aAutoX + 12);
          LineTo(aAutoY + 14, aAutoX + 12);
          MoveTo(aAutoY + 14, aAutoX + 12);
          LineTo(aAutoY + 14, aAutoX + 0);
          MoveTo(aAutoY + 14, aAutoX + 0);
          LineTo(aAutoY + 10, aAutoX + 0);

          MoveTo(aAutoY + 0, aAutoX + 6);
          LineTo(aAutoY + 10, aAutoX + 6);
        end;
      end;
    end;
  end;
end;

procedure TCircuitBreakerElement.Paint;
begin
  if FindResource(HInstance, PChar('CB_' + FStyleStr + FStatusStr), RT_BITMAP) <> 0 then
  begin
    FPic.Bitmap.LoadFromResourceName(HInstance, 'CB_' + FStyleStr + FStatusStr);

    Canvas.Draw(0, 0, FPic.Bitmap);
    DrawHandle(Canvas, 21, FHandlePosY, 21, FHandlePosY + 15);
  end;

  inherited;
end;

procedure TCircuitBreakerElement.SetShowAutoHandle(aIsShow: Boolean);
begin
  FIsShowAutoHandle := aIsShow;
  Invalidate;
end;

procedure TCircuitBreakerElement.SetShowManHandle(aIsShow: Boolean);
begin
  FIsShowManHandle := aIsShow;
  Invalidate;
end;

procedure TCircuitBreakerElement.SetStatus(aStatus: TStatus_CB);
begin
  FStatus := aStatus;

  case FStatus of
    CBtaDisabledUnavailable :
    begin
      FStatusStr := '1';
      FShapeCol := colPink;
      FHandlePosX := FHandlePosX;
      FHandlePosY := 0;
    end;
    CBtaOpen :
    begin
      FStatusStr := '2';
      FShapeCol := colGrey;
      FHandlePosX := FHandlePosX;
      FHandlePosY := 0;
    end;
    CBtaClosed :
    begin
      FStatusStr := '3';
      FShapeCol := colGreen;
      FHandlePosX := FHandlePosX;
      FHandlePosY := 12;
    end;
    CBtaNotReadyClose :
    begin
      FStatusStr := '4';
      FShapeCol := colYellow;
      FHandlePosX := FHandlePosX;
      FHandlePosY := 0;
    end;
    CBtaNotReadyOpen :
    begin
      FStatusStr := '5';
      FShapeCol := colYellow;
      FHandlePosX := FHandlePosX;
      FHandlePosY := 12;
    end;
    CBtaFailedCloseTripped :
    begin
      FStatusStr := '6';
      FShapeCol := colRed;
      FHandlePosX := FHandlePosX;
      FHandlePosY := 0;
    end;
    CBtaUndertermined :
    begin
      FStatusStr := '7';
      FShapeCol := colRed;
      FHandlePosX := FHandlePosX;
      FHandlePosY := 0;
    end;
    CBtaFailedOpen :
    begin
      FStatusStr := '8';
      FShapeCol := colRed;
      FHandlePosX := FHandlePosX;
      FHandlePosY := 12;
    end;
  end;

  Invalidate;
end;

procedure TCircuitBreakerElement.SetStyle(aStyle: TStyle_CB);
begin
  FStyle := aStyle;

  case FStyle of
    CBtyHorizontal:
    begin
      Height := 46;
      Width  := 55;
      FStyleStr := 'Hor_';
    end;
    CBtyVertical:
    begin
      Height := 55;
      Width  := 46;
      FStyleStr := 'Ver_';
    end;
  end;

  Invalidate;
end;

end.
