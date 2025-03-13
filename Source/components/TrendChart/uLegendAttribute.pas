unit uLegendAttribute;

interface

uses Classes, uTrendDataType, SysUtils;

type
  TLegendLineAttr = class
  private
    FLegendItemNameTitle: String;
    FLegendItemVisible: boolean;
    FLegendItemName: string;
    FLegendItemID: string;
    FLegendItemNameTitle2: String;
    procedure SetLegendItemID(const Value: string);
    procedure SetLegendItemName(const Value: string);
    procedure SetLegendItemNameTitle(const Value: String);
    procedure SetLegendItemVisible(const Value: boolean);
    procedure SetLegendItemNameTitle2(const Value: String);
  public
    property LegendItemID   : string read FLegendItemID write SetLegendItemID;
    property LegendItemName : string read FLegendItemName write SetLegendItemName;
    property LegendItemNameTitle : String read FLegendItemNameTitle write SetLegendItemNameTitle;
    property LegendItemNameTitle2 : String read FLegendItemNameTitle2 write SetLegendItemNameTitle2;
    property LegendItemVisible : boolean read FLegendItemVisible write SetLegendItemVisible;
  end;

  TLegendAttribute = class
  private
    FLegendItems : TList;
    FShowStatusLine: boolean;
    FShowLegendTitle: boolean;
    FShowLegend: boolean;
    FStatusTitle: Boolean;
    FSliderTime: Boolean;
    FCurrentDate: Boolean;
    FSliderTimeDelta: boolean;
    FSliderTime2nd: Boolean;
    FSliderDate: Boolean;
    FCurrentTime: boolean;
    FSliderDate2nd: Boolean;
    FDisplayFormat: integer;
    FDisplayHeight: integer;
    FTitleFontName: String;
    FTitleFontSize: integer;
    FTitleFontStyle: String;
    procedure SetShowLegend(const Value: boolean);
    procedure SetShowLegendTitle(const Value: boolean);
    procedure SetShowStatusLine(const Value: boolean);
    function GetLegendCount: integer;
    procedure SetCurrentDate(const Value: Boolean);
    procedure SetCurrentTime(const Value: boolean);
    procedure SetSliderDate(const Value: Boolean);
    procedure SetSliderDate2nd(const Value: Boolean);
    procedure SetSliderTime(const Value: Boolean);
    procedure SetSliderTime2nd(const Value: Boolean);
    procedure SetSliderTimeDelta(const Value: boolean);
    procedure SetStatusTitle(const Value: Boolean);
    procedure SetDisplayFormat(const Value: integer);
    procedure SetDisplayHeight(const Value: integer);
    procedure SetTitleFontName(const Value: String);
    procedure SetTitleFontSize(const Value: integer);
    procedure SetTitleFontStyle(const Value: String);

  public
    constructor Create;
    destructor Destroy;override;
    function GetLegendItem(index : integer) : TLegendLineAttr;
    procedure ClearLegend;
    procedure AddLegend(item : TLegendLineAttr);

    property ShowLegend : boolean read FShowLegend write SetShowLegend default True;
    property ShowLegendTitle : boolean read FShowLegendTitle write SetShowLegendTitle default True;
    property ShowStatusLine : boolean read FShowStatusLine write SetShowStatusLine;
    property LegendCount : integer read GetLegendCount;

    property CurrentDate : Boolean read FCurrentDate write SetCurrentDate default True;
    property CurrentTime : boolean read FCurrentTime write SetCurrentTime default True;
    property SliderDate : Boolean read FSliderDate write SetSliderDate default True;
    property SliderTime : Boolean read FSliderTime write SetSliderTime default True;
    property SliderDate2nd : Boolean read FSliderDate2nd write SetSliderDate2nd;
    property SliderTime2nd : Boolean read FSliderTime2nd write SetSliderTime2nd;
    property SliderTimeDelta : boolean read FSliderTimeDelta write SetSliderTimeDelta;
    property StatusTitle : Boolean read FStatusTitle write SetStatusTitle;

    property DisplayHeight : integer read FDisplayHeight write SetDisplayHeight;
    property DisplayFormat : integer read FDisplayFormat write SetDisplayFormat;

    property TitleFontName : String read FTitleFontName write SetTitleFontName;
    property TitleFontStyle : String read FTitleFontStyle write SetTitleFontStyle;
    property TitleFontSize: integer read FTitleFontSize write SetTitleFontSize;
  end;

implementation

{ TLegendAttribute }

procedure TLegendAttribute.AddLegend;
begin
  FLegendItems.Add(item);
end;

procedure TLegendAttribute.ClearLegend;
var
  i :  integer;
  item : TLegendLineAttr;
begin
  for I := 0 to FLegendItems.Count - 1 do
  begin
    item := FLegendItems.Items[i];
    item.Free;
  end;
  FLegendItems.Clear;
end;

constructor TLegendAttribute.Create;
var
  i :  integer;
  item : TLegendLineAttr;
begin
  FLegendItems := TList.Create;

  for I := 0 to Length(C_LINE_ATTR) - 1 do
  begin
    item := TLegendLineAttr.Create;
    item.LegendItemID := C_LINE_ATTR[i];
    item.LegendItemName := C_LINE_ATTR[i];

    if i < 7 then
      item.LegendItemVisible := True
    else
      item.LegendItemVisible := False;

    if i = 7 then
    begin
      item.LegendItemNameTitle := 'Lower Limit';
      item.LegendItemNameTitle2 := 'Upper Limit';
    end else
      item.LegendItemNameTitle := C_LINE_TITILE[i];

    FLegendItems.Add(item);

  end;

  FShowLegendTitle := True;
  FShowLegend := True;
  FDisplayHeight := 10;
end;

destructor TLegendAttribute.Destroy;
begin
  FLegendItems.Free;
  inherited;
end;

function TLegendAttribute.GetLegendCount: integer;
begin
  Result := FLegendItems.Count;
end;

function TLegendAttribute.GetLegendItem(index: integer): TLegendLineAttr;
begin
  Result := FLegendItems.Items[index];
end;

procedure TLegendAttribute.SetCurrentDate(const Value: Boolean);
begin
  FCurrentDate := Value;
end;

procedure TLegendAttribute.SetCurrentTime(const Value: boolean);
begin
  FCurrentTime := Value;
end;

procedure TLegendAttribute.SetDisplayFormat(const Value: integer);
begin
  FDisplayFormat := Value;
end;

procedure TLegendAttribute.SetDisplayHeight(const Value: integer);
begin
  FDisplayHeight := Value;
end;

procedure TLegendAttribute.SetShowLegend(const Value: boolean);
begin
  FShowLegend := Value;
end;

procedure TLegendAttribute.SetShowLegendTitle(const Value: boolean);
begin
  FShowLegendTitle := Value;
end;

procedure TLegendAttribute.SetShowStatusLine(const Value: boolean);
begin
  FShowStatusLine := Value;
end;

procedure TLegendAttribute.SetSliderDate(const Value: Boolean);
begin
  FSliderDate := Value;
end;

procedure TLegendAttribute.SetSliderDate2nd(const Value: Boolean);
begin
  FSliderDate2nd := Value;
end;

procedure TLegendAttribute.SetSliderTime(const Value: Boolean);
begin
  FSliderTime := Value;
end;

procedure TLegendAttribute.SetSliderTime2nd(const Value: Boolean);
begin
  FSliderTime2nd := Value;
end;

procedure TLegendAttribute.SetSliderTimeDelta(const Value: boolean);
begin
  FSliderTimeDelta := Value;
end;

procedure TLegendAttribute.SetStatusTitle(const Value: Boolean);
begin
  FStatusTitle := Value;
end;

procedure TLegendAttribute.SetTitleFontName(const Value: String);
begin
  FTitleFontName := Value;
end;

procedure TLegendAttribute.SetTitleFontSize(const Value: integer);
begin
  FTitleFontSize := Value;
end;

procedure TLegendAttribute.SetTitleFontStyle(const Value: String);
begin
  FTitleFontStyle := Value;
end;

{ TLegendLineAttr }

procedure TLegendLineAttr.SetLegendItemID(const Value: string);
begin
  FLegendItemID := Value;
end;

procedure TLegendLineAttr.SetLegendItemName(const Value: string);
begin
  FLegendItemName := Value;
end;

procedure TLegendLineAttr.SetLegendItemNameTitle(const Value: String);
begin
  FLegendItemNameTitle := Value;
end;

procedure TLegendLineAttr.SetLegendItemNameTitle2(const Value: String);
begin
  FLegendItemNameTitle2 := Value;
end;

procedure TLegendLineAttr.SetLegendItemVisible(const Value: boolean);
begin
  FLegendItemVisible := Value;
end;

end.
