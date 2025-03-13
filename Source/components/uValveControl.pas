unit uValveControl;

interface

uses
  Classes, ExtCtrls, Graphics, SysUtils, uBaseComponent, uIPMS_Data, Windows;

type
  TValveControl = class(TIPMSBaseComponent)
  private
    FIsShowAutoHandle : Boolean;
    FIsShowManHandle : Boolean;

    FLeftBar : TRect;
    FRightBar : TRect;
    FShapeCol : TColor;
    FStatus : TStatus_VC;
    FStyle : TStyle_VC;
    FValveType : TType_VC;

    FPath : string;
    FFilePrefix : string;
    FFileName : string;

    FSymbol : TPicture;
    FBlinkTimer : TTimer;
    FBlinkCount : Integer;

    procedure DrawHandle(aCanvas: TCanvas; aManX, aManY, aAutoX, aAutoY: Integer);
    procedure SetClutch(aStatus: TStatus_VC);
    procedure SetShowAutoHandle(aIsShow: Boolean);
    procedure SetShowManHandle(aIsShow: Boolean);
    procedure SetStatus(aStatus: TStatus_VC);
    procedure SetStyle(aStyle: TStyle_VC);
    procedure SetValveType(aType: TType_VC);

    procedure DoBlinkAnimation(Sender: TObject);
  protected
    procedure Paint; override;
    procedure Resize; override;
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;
  published
    property ShowAutoHandle : Boolean read FIsShowAutoHandle write SetShowAutoHandle;
    property ShowManHandle : Boolean read FIsShowManHandle write SetShowManHandle;
    property Status : TStatus_VC read FStatus write SetStatus;
    property Style : TStyle_VC read FStyle write SetStyle;
    property ValveType : TType_VC read FValveType write SetValveType;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('IPMS', [TValveControl]);
end;

{ TValveControl }

constructor TValveControl.Create(aOwner: TComponent);
begin
  inherited;

  FSymbol := TPicture.Create;
  FBlinkTimer := TTimer.Create(Self);
  FBlinkTimer.Interval := 1000;
  FBlinkTimer.OnTimer := DoBlinkAnimation;
  FBlinkTimer.Enabled := False;

  FBlinkCount := 0;

  Status := VCtaDisableUnavailable;
  Style := VCtyHorizontal;
  ValveType := VCtpStandart;
end;

destructor TValveControl.Destroy;
begin

  inherited;
end;

procedure TValveControl.DoBlinkAnimation(Sender: TObject);
begin
  if FBlinkCount >= 10 then
  begin
    FBlinkCount := 0;
    FBlinkTimer.Enabled := False;
    SetClutch(FStatus);
  end;

  Inc(FBlinkCount);

  case FStatus of
    VCtaClosed:
    begin
      if (FBlinkCount mod 2) = 0 then
      begin
        FFileName := 'Open';
        FShapeCol := colGreen;
      end
      else
      begin
        FFileName := 'Closed';
        FShapeCol := colGrey;
      end;
    end;
    VCtaOpen:
    begin
      if (FBlinkCount mod 2) = 0 then
      begin
        FFileName := 'Closed';
        FShapeCol := colGrey;
      end
      else
      begin
        FFileName := 'Open';
        FShapeCol := colGreen;
      end;
    end;
  end;

  Invalidate;
end;

procedure TValveControl.DrawHandle(aCanvas: TCanvas; aManX, aManY, aAutoX,
  aAutoY: Integer);
begin
  with aCanvas do
  begin
    Pen.Color := FShapeCol;

    if FIsShowManHandle then
    begin
      case FStyle of
        VCtyHorizontal:
        begin
          MoveTo(aManX + 0, aManY + 0);
          LineTo(aManX + 12, aManY + 0);
          MoveTo(aManX + 6, aManY + 0);
          LineTo(aManX + 6, aManY + 13);
        end;
        VCtyVertical:
        begin
          MoveTo(aManY + 0, aManX + 0);
          LineTo(aManY + 0, aManX + 12);
          MoveTo(aManY + 0, aManX + 6);
          LineTo(aManY + 13, aManX + 6);
        end;
      end;
    end;

    if FIsShowAutoHandle then
    begin
      case FStyle of
        VCtyHorizontal:
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
        VCtyVertical:
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

procedure TValveControl.Paint;
begin
  case FStyle of
    VCtyHorizontal,
    VCtyVertical:
    begin
      if FindResource(HInstance, PChar(FPath + FFilePrefix + FFileName),
        RT_BITMAP) <> 0 then
      begin
        FSymbol.Bitmap.LoadFromResourceName(HInstance, FPath + FFilePrefix +
          FFileName);

        Canvas.Draw(0, 0, FSymbol.Bitmap);
    //    DrawHandle(Canvas, 12, 7, 12, 19);
        DrawHandle(Canvas, 12, 7, 30, 0);
      end;
    end;
    VCtyBar:
    begin
      with Canvas do
      begin
        Brush.Color := FShapeCol;
        Pen.Color := FShapeCol;

        Rectangle(FLeftBar);
        Rectangle(FRightBar);
      end;
    end;
  end;

  inherited;
end;

procedure TValveControl.Resize;
begin
  inherited;

  FSymbol.Bitmap.Height := Height;
  FSymbol.Bitmap.Width := Width;

  Invalidate;
end;

procedure TValveControl.SetClutch(aStatus: TStatus_VC);
begin
  if aStatus = VCtaOpen then
  begin
    FLeftBar.TopLeft := Point(4, 2);
    FLeftBar.BottomRight := Point(14, 62);

    FRightBar.TopLeft := Point(15, 2);
    FRightBar.BottomRight := Point(25, 62);
  end
  else if aStatus = VCtaClosed then       
  begin
    FLeftBar.TopLeft := Point(2, 2);
    FLeftBar.BottomRight := Point(12, 62);

    FRightBar.TopLeft := Point(17, 2);
    FRightBar.BottomRight := Point(27, 62);
  end;
end;

procedure TValveControl.SetShowAutoHandle(aIsShow: Boolean);
begin
  FIsShowAutoHandle := aIsShow;
  Invalidate;
end;

procedure TValveControl.SetShowManHandle(aIsShow: Boolean);
begin
  FIsShowManHandle := aIsShow;
  Invalidate;
end;

procedure TValveControl.SetStatus(aStatus: TStatus_VC);
var
  lastStatus : TStatus_VC;
begin
  lastStatus := FStatus;
  FStatus := aStatus;

  case FStatus of
    VCtaDisableUnavailable:
    begin
      FFileName := 'DisableUnavailable';
      FShapeCol := colPink;
    end;
    VCtaClosed:
    begin
      if lastStatus = VCtaOpen then
        FBlinkTimer.Enabled := True
      else
      begin
        FFileName := 'Closed';
        FShapeCol := colGrey;
        SetClutch(FStatus);
      end;
    end;
    VCtaOpen:
    begin
      if lastStatus = VCtaClosed then
        FBlinkTimer.Enabled := True
      else
      begin
        FFileName := 'Open';
        FShapeCol := colGreen;
        SetClutch(FStatus);
      end;
    end;
    VCtaNotReadyToClose:
    begin
      FFileName := 'NotReadyToClose';
      FShapeCol := colYellow;
    end;
    VCtaNotReadyToOpen:
    begin
      FFileName := 'NotReadyToOpen';
      FShapeCol := colYellow;
    end;
    VCtaCloseFailed:
    begin
      FFileName := 'CloseFailed';
      FShapeCol := colRed;
    end;
    VCtaOpenFailed:
    begin
      FFileName := 'OpenFailed';
      FShapeCol := colRed;
    end;
  end;

  Invalidate;
end;

procedure TValveControl.SetStyle(aStyle: TStyle_VC);
begin
  FStyle := aStyle;

  case FStyle of
    VCtyHorizontal:
    begin
      FFilePrefix := 'Hor_';
      Height := 35;
      Width := 35;
    end;
    VCtyVertical:
    begin
      FFilePrefix := 'Ver_';
      Height := 35;
      Width := 35;
    end;
    VCtyBar:
    begin
      Height := 64;
      Width := 29;
    end;
  end;

  Invalidate;
end;

procedure TValveControl.SetValveType(aType: TType_VC);
begin
  FValveType := aType;

  case FValveType of
    VCtpStandart: FPath := 'VC_Standard_';
    VCtpNonReturn: FPath := 'VC_NonReturn_';
  end;

  Invalidate;
end;

end.
