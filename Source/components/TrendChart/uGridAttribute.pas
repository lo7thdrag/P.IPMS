unit uGridAttribute;

interface

uses Graphics, uTrendDataType, uLineAttribute;

type

  TGridAttribute = class
  private
    FShowGrid: boolean;
    FColor: TCOlor;
    FWidth: integer;
    FStyle: E_LineDispStyle;
    FTickType: E_GridTicks;
    FHorizontalTick: integer;
    FVerticalTick: integer;
    FUseAxisLine: TLIneData;
    procedure SetColor(const Value: TCOlor);
    procedure SetShowGrid(const Value: boolean);
    procedure SetStyle(const Value: E_LineDispStyle);
    procedure SetWidth(const Value: integer);
    procedure SetTickType(const Value: E_GridTicks);
    procedure SetHorizontalTick(const Value: integer);
    procedure SetVerticalTick(const Value: integer);
    procedure SetUseAxisLine(const Value: TLIneData);

  public
    constructor Create;
    property ShowGrid : boolean read FShowGrid write SetShowGrid;
    property Color : TCOlor read FColor write SetColor;
    property Style : E_LineDispStyle read FStyle write SetStyle;
    property Width : integer read FWidth write SetWidth;
    property TickType : E_GridTicks read FTickType write SetTickType;

    // tick fixed
    property VerticalTick : integer read FVerticalTick write SetVerticalTick;
    property HorizontalTick : integer read FHorizontalTick write SetHorizontalTick;

    // tick custom
    property UseAxisLine : TLIneData read FUseAxisLine write SetUseAxisLine;
  end;

implementation

{ TGridAttribute }

constructor TGridAttribute.Create;
begin
  Color := clBlack;
  ShowGrid := True;
  Style := eldSmallDash;
  Width := 1;
  TickType := egdCustom;
end;

procedure TGridAttribute.SetColor(const Value: TCOlor);
begin
  FColor := Value;
end;

procedure TGridAttribute.SetHorizontalTick(const Value: integer);
begin
  FHorizontalTick := Value;
end;

procedure TGridAttribute.SetShowGrid(const Value: boolean);
begin
  FShowGrid := Value;
end;

procedure TGridAttribute.SetStyle(const Value: E_LineDispStyle);
begin
  FStyle := Value;
end;

procedure TGridAttribute.SetTickType(const Value: E_GridTicks);
begin
  FTickType := Value;
end;

procedure TGridAttribute.SetUseAxisLine(const Value: TLIneData);
begin
  FUseAxisLine := Value;
end;

procedure TGridAttribute.SetVerticalTick(const Value: integer);
begin
  FVerticalTick := Value;
end;

procedure TGridAttribute.SetWidth(const Value: integer);
begin
  FWidth := Value;
end;

end.
