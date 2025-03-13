unit uShortcut;

interface

uses
  Classes, Controls, Graphics, Windows, uBaseComponent;

type

  TShortcut = class(TIPMSBaseComponent)
  private
    FPage : Integer;
    FShape : array[0..7] of TPoint;
    FRect : TRect;

    procedure SetPage(aPage: Integer);
  protected
    procedure Paint; override;
  public
    constructor Create(aOwner: TComponent); override;
  published
    property Page : Integer read FPage write SetPage;
  end;

procedure Register;

implementation

uses
  SysUtils, uIPMS_Data;

procedure Register;
begin
  RegisterComponents('IPMS', [TShortcut]);
end;

{ TShortcut }

constructor TShortcut.Create(aOwner: TComponent);
begin
  inherited;

  if (csDesigning in ComponentState) and
     not (csLoading in ComponentState) then
  begin
    Height := 24;
    Width := 40;
  end;

  FShape[0] := Point(3, 11);
  FShape[1] := Point(7, 3);
  FShape[2] := Point(32, 3);
  FShape[3] := Point(36, 11);
  FShape[4] := Point(36, 12);
  FShape[5] := Point(32, 20);
  FShape[6] := Point(7, 20);
  FShape[7] := Point(3, 12);
end;

procedure TShortcut.Paint;
begin
  with Canvas do
  begin
    Brush.Color := colGrey;
    Pen.Color := colGrey;

    Polygon(FShape);

    Font.Color := colWhite;
    Font.Name := 'Arial';
    Font.Size := 10;
    Font.Style := [fsBold];

    FRect.TopLeft := Point(0, 4);
    FRect.BottomRight := Point(Width, Height);
    DrawText(Canvas.Handle, PChar(IntToStr(FPage)), -1, FRect, DT_CENTER);
  end;

  inherited;
end;

procedure TShortcut.SetPage(aPage: Integer);
begin
  FPage := aPage;
  Invalidate;
end;

end.
