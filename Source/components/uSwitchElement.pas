unit uSwitchElement;

interface

uses
  Classes, Dialogs, Graphics, SysUtils, uBaseComponent, uIPMS_Data, Windows;

type
  TSwitchElement = class(TIPMSBaseComponent)
  private
    { General Part }
    FShape : TRect;
    FShapeCol : TColor;
    FStatus : TStatus_SW;
    FType : TType_SW;

    { SWE Part }
    FSymbol : TPicture;
//    FFileName : string;
//    FFilePrefix : string;
//    FPath : string;

    { SWB Part }
    FCaption : string;
    FTextCol : TColor;
    FSize : TSize_SW;

    procedure SetCaption(aCaption: string);
    procedure SetSize(aSize: TSize_SW);
    procedure SetStatus(aStatus: TStatus_SW);
    procedure SetType(aType: TType_SW);
  protected
    procedure Paint; override;
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Caption : string read FCaption write SetCaption;
    property Size : TSize_SW read FSize write SetSize;
    property Status : TStatus_SW read FStatus write SetStatus;
    property SwitchType : TType_SW read FType write SetType;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('IPMS', [TSwitchElement]);
end;

{ TSwitchElement }

constructor TSwitchElement.Create(aOwner: TComponent);
begin
  inherited;

  Caption := 'TEXT';
  FSymbol := TPicture.Create;

  Status := SWtaDisabled;
  SwitchType := SWtpSWE;
end;

destructor TSwitchElement.Destroy;
begin

  inherited;
end;

procedure TSwitchElement.Paint;
begin
  with Canvas do
  begin
    Brush.Color := FShapeCol;
    Pen.Color := FShapeCol;

    case FType of
      SWtpSWE:
      begin
        Font.Color := FTextCol;
        Font.Name := 'IPMS';
        Font.Size := 10;
        Font.Style := [fsBold];

        FShape.TopLeft := Point(0, 0);
        FShape.BottomRight := Point(Width, Height);
        Rectangle(FShape);

        DrawText(Canvas.Handle, PChar(FCaption), -1, FShape, DT_CENTER);
      end;
      SWtpSWB:
      begin
        Font.Color := FTextCol;
        Font.Name := 'Arial';
        Font.Size := 10;
        Font.Style := [fsBold];

        FShape.TopLeft := Point(0, 0);
        FShape.BottomRight := Point(Width, Height);
        Rectangle(FShape);

        DrawText(Canvas.Handle, PChar(FCaption), -1, FShape, DT_CENTER);
      end;
      SWtpDAE:
      begin
        FShape.TopLeft := Point(0, 0);
        FShape.BottomRight := Point(Width, Height);
        Rectangle(FShape);

        Pen.Color := colDarkGrey;
        MoveTo(Width-1, 0); LineTo(Width-1, Height);
        MoveTo(0, Height-1); LineTo(Width, Height-1);

        Pen.Color := colWhite;
        MoveTo(0, 0); LineTo(0, Height);
        MoveTo(0, 0); LineTo(Width, 0);
      end;
    end;
  end;

  inherited;
end;

procedure TSwitchElement.SetCaption(aCaption: string);
begin
  FCaption := aCaption;
  Invalidate;
end;

procedure TSwitchElement.SetSize(aSize: TSize_SW);
begin
  FSize := aSize;

  if (csDesigning in ComponentState) and
     not (csLoading in ComponentState) and
     (FType = SWtpDAE)then
  begin
    case FSize of
      SWszBig:
      begin
        Height := 18;
        Width := 18;
      end;
      SWszSmall:
      begin
        Height := 9;
        Width := 9;
      end;
    end;
  end;

  Invalidate;
end;

procedure TSwitchElement.SetStatus(aStatus: TStatus_SW);
begin
  FStatus := aStatus;

  case FStatus of
    SWtaDisabled:
    begin
      FShapeCol := colPink;
      FTextCol := colWhite;
    end;
    SWtaFalse:
    begin
      FShapeCol := colGrey;
      FTextCol := colBlack;
    end;
    SWtaOk:
    begin
      FShapeCol := colBrightGreen;
      FTextCol := colBlack;
    end;
    SWtaIndicateAlarm:
    begin
      FShapeCol := colDarkGreen;
      FTextCol := colWhite;
    end;
    SWtaWarning:
    begin
      FShapeCol := colYellow;
      FTextCol := colBlack;
    end;
    SWtaAlarm:
    begin
      FShapeCol := colRed;
      FTextCol := colWhite;
    end;
  end;

  Invalidate;
end;

procedure TSwitchElement.SetType(aType: TType_SW);
begin
  FType := aType;

  if (csDesigning in ComponentState) and not (csLoading in ComponentState) then
  begin
    case FType of
      SWtpSWE:
      begin
        Height := 18;
        Width := 35;
      end;
      SWtpSWB:
      begin
        Height := 18;
        Width := 50;
      end;
      SWtpDAE: SetSize(FSize);
    end;
  end;

  Invalidate;
end;

end.
