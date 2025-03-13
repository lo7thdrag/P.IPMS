unit uAxisAttribute;

interface

uses Graphics, uTrendDataType, Classes, ExtCtrls;

type
  TDoubleArray = array of Double;
  TAxisAttribute = class
  private
    FAxisID: String;
    FAxisType: E_AxisType;
    FColor: TColor;
    FVisible: Boolean;
    FAxisLabel: String;
    FTicks: Integer;
    FNumbered: Boolean;
    FDefaultAxis: Boolean;
    procedure SetAxisID(const Value: String);
    procedure SetAxisType(const Value: E_AxisType);
    procedure SetColor(const Value: TColor);
    procedure SetAxisLabel(const Value: String);
    procedure SetVisible(const Value: Boolean);
    procedure SetNumbered(const Value: Boolean);
    procedure SetTickValues(const Value: TDoubleArray);
    procedure SetDefaultAxis(const Value: Boolean);
    procedure SetTicks(const Value: Integer);
  protected
    FTickValues: TDoubleArray;
    procedure UpdateTick;virtual;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    property Color    : TColor read FColor write SetColor;
    property AxisID   : String read FAxisID write SetAxisID;
    property AxisType : E_AxisType read FAxisType write SetAxisType;
    property Visible  : Boolean read FVisible write SetVisible;
    property AxisLabel: String read FAxisLabel write SetAxisLabel;
    property Ticks    : Integer read FTicks write SetTicks;
    property Numbered : Boolean read FNumbered write SetNumbered;
    property TickValues : TDoubleArray read FTickValues write SetTickValues;
    property DefaultAxis : Boolean read FDefaultAxis write SetDefaultAxis;
  end;

  TXAxisAttribute = class(TAxisAttribute)
  private
    FNoScroll: Boolean;
    FDuration: Word;
    FStartDateType: E_XAxisTime;
    FStartDate: TDateTime;
    FStartTimeType: E_XAxisTime;
    FStartTime: TDateTime;
    FDiffDays: integer;
    FTimerRecent : TTimer;
    FNotifyChange: TNotifyEvent;
    FEndDate : TDateTime;
    FOnNotifyTimeChange: TNotifyEvent;
    procedure SetDuration(const Value: Word);
    procedure SetNoScroll(const Value: Boolean);
    procedure SetStartDateType(const Value: E_XAxisTime);
    procedure SetStartDate(const Value: TDateTime);
    procedure SetStartTimeType(const Value: E_XAxisTime);
    procedure SetStartTime(const Value: TDateTime);
    procedure SetDiffDays(const Value: integer);
    procedure SetNotifyChange(const Value: TNotifyEvent);
    procedure OnTimerChange(Sender : TObject);
    procedure SetOnNotifyTimeChange(const Value: TNotifyEvent);
  protected
    procedure UpdateTick;override;
  public
    constructor Create;override;
    destructor Destroy;override;

    procedure EnableTimer;
    procedure DisableTimer;

    property Duration : Word read FDuration write SetDuration;
    property NoScroll : Boolean read FNoScroll write SetNoScroll;
    property StartDateType :E_XAxisTime read FStartDateType write SetStartDateType;
    property StartTimeType :E_XAxisTime read FStartTimeType write SetStartTimeType;

    { start time -> start date }
    property StartDate : TDateTime read FStartDate write SetStartDate; {start date final result }
    property EndDate : TDateTime read FEndDate;       {end date final result }

    property StartTime : TDateTime read FStartTime write SetStartTime;
    property DiffDays : integer read FDiffDays write SetDiffDays;   { now minus days }
    property OnNotifyChange : TNotifyEvent read FNotifyChange write SetNotifyChange;
    property OnNotifyTimeChange : TNotifyEvent read FOnNotifyTimeChange write SetOnNotifyTimeChange;
  end;

  TYAxisAttribute = class(TAxisAttribute)
  private
    FIsAutoScale: Boolean;
    FUpperLimit: integer;
    FUsePointLimit: Boolean;
    FLowerLimit: integer;
    FCanvasMaxTextWidth: integer;
    FDefaultLowerLimit: integer;
    FDefaultUpperLimit: integer;
    procedure SetIsAutoScale(const Value: Boolean);
    procedure SetLowerLimit(const Value: integer);
    procedure SetUpperLimit(const Value: integer);
    procedure SetUsePointLimit(const Value: Boolean);
    procedure SetCanvasMaxTextWidth(const Value: integer);
    procedure SetDefaultLowerLimit(const Value: integer);
    procedure SetDefaultUpperLimit(const Value: integer);
  protected
    procedure UpdateTick;override;
  public
    constructor Create;override;
    destructor Destroy;override;

    property IsAutoScale : Boolean read FIsAutoScale write SetIsAutoScale;
    property UsePointLimit : Boolean read FUsePointLimit write SetUsePointLimit;
    property LowerLimit : integer read FLowerLimit write SetLowerLimit;
    property UpperLimit : integer read FUpperLimit write SetUpperLimit;

    property DefaultLowerLimit : integer  read FDefaultLowerLimit write SetDefaultLowerLimit;
    property DefaultUpperLimit : integer  read FDefaultUpperLimit write SetDefaultUpperLimit;

    property CanvasMaxTextWidth : integer read FCanvasMaxTextWidth write SetCanvasMaxTextWidth;

  end;

  TAxisSeries = class
  private
    FAxises : TList;
    FOnNotifyEvent: TNotifyEvent;
    procedure SetOnNotifyEvent(const Value: TNotifyEvent);
    procedure OnNotifiedObject(Sender : TObject);

  public
    constructor Create;
    destructor Destroy;override;
    procedure AddAxis(aAxis :TAxisAttribute);
    procedure RemoveAxis(aAxis :TAxisAttribute);
    function GetAxis(aIndex : Integer) : TAxisAttribute;
    function GetDefaultXAxis : TXAxisAttribute;
    function GetDefaultYAxis : TYAxisAttribute;
    function Count : integer;
    property OnNotifyEvent : TNotifyEvent read FOnNotifyEvent write SetOnNotifyEvent;

  end;

implementation

uses SysUtils;

procedure SecondToWordHMS(aValue : integer; var h,m,s : word);
begin
  if aValue < 60 then begin
    s := aValue;
    h := 0;
    m := 0;
    exit;
  end;

  s := aValue mod 60;
  m := aValue div 60;
  if m < 60 then begin
    h := 0;
    exit;
  end;

  m := m mod 60;
  h := m div 60;

end;

{ TAxisAttribute }

constructor TAxisAttribute.Create;
begin
  Visible := True;
  Ticks := 5;
  Numbered := True;
end;

destructor TAxisAttribute.Destroy;
begin

  inherited;
end;

procedure TAxisAttribute.SetAxisID(const Value: String);
begin
  FAxisID := Value;
end;

procedure TAxisAttribute.SetAxisLabel(const Value: String);
begin
  FAxisLabel := Value;
end;

procedure TAxisAttribute.SetAxisType(const Value: E_AxisType);
begin
  FAxisType := Value;
end;

procedure TAxisAttribute.SetColor(const Value: TColor);
begin
  FColor := Value;
end;

procedure TAxisAttribute.SetDefaultAxis(const Value: Boolean);
begin
  FDefaultAxis := Value;
end;

procedure TAxisAttribute.SetNumbered(const Value: Boolean);
begin
  FNumbered := Value;
end;

procedure TAxisAttribute.SetTicks(const Value: Integer);
begin
  FTicks := Value;

  UpdateTick;
end;

procedure TAxisAttribute.SetTickValues(const Value: TDoubleArray);
begin
  FTickValues := Value;
end;

procedure TAxisAttribute.SetVisible(const Value: Boolean);
begin
  FVisible := Value;
end;

procedure TAxisAttribute.UpdateTick;
begin

end;

{ TXAxisAttribute }

constructor TXAxisAttribute.Create;
begin
  inherited;

  AxisType := eatXTime;
  Duration := 5 * 60; //second

  StartDateType := exaMostRecent;
  StartDate := Now;
  StartTime := Now;

  DiffDays := 0;

  FTimerRecent := TTimer.Create(nil);
  FTimerRecent.Interval := 1000; // 1 second
  FTimerRecent.OnTimer := OnTimerChange;
  FTimerRecent.Enabled := False;
end;

destructor TXAxisAttribute.Destroy;
begin

  inherited;
end;

procedure TXAxisAttribute.DisableTimer;
begin
  FTimerRecent.Enabled := False;
end;

procedure TXAxisAttribute.EnableTimer;
begin
  FTimerRecent.Enabled := True;
end;

procedure TXAxisAttribute.OnTimerChange(Sender: TObject);
begin
  if StartDateType = exaMostRecent then
  begin
    StartDate := Now;

    if Assigned(FNotifyChange) then
      FNotifyChange(Self);

    if Assigned(FOnNotifyTimeChange) then
      FOnNotifyTimeChange(Self);
  end;
end;

procedure TXAxisAttribute.SetDiffDays(const Value: integer);
begin
  FDiffDays := Value;
end;

procedure TXAxisAttribute.SetDuration(const Value: Word);
begin
  FDuration := Value;
end;

procedure TXAxisAttribute.SetNoScroll(const Value: Boolean);
begin
  FNoScroll := Value;
end;

procedure TXAxisAttribute.SetNotifyChange(const Value: TNotifyEvent);
begin
  FNotifyChange := Value;
end;

procedure TXAxisAttribute.SetOnNotifyTimeChange(const Value: TNotifyEvent);
begin
  FOnNotifyTimeChange := Value;
end;

procedure TXAxisAttribute.SetStartDate(const Value: TDateTime);
var
  h,n,s : Word;
begin
  FStartDate := Value;

  case StartDateType of
    exaMostRecent:
    begin
      FEndDate := FStartDate;
      SecondToWordHMS(Duration,h,n,s);
      FStartDate := FStartDate - EncodeTime(h,n,s,0);

      if Assigned(FOnNotifyTimeChange) then
        FOnNotifyTimeChange(Self);

      UpdateTick;
    end;
    exaStartDate,exaNowMinDays:
    begin
      SecondToWordHMS(Duration,h,n,s);
      FEndDate := FStartDate + EncodeTime(h,n,s,0);

      if Assigned(FOnNotifyTimeChange) then
        FOnNotifyTimeChange(Self);

      UpdateTick;
    end;
  end;

end;

procedure TXAxisAttribute.SetStartDateType(const Value: E_XAxisTime);
begin
  FStartDateType := Value;
end;

procedure TXAxisAttribute.SetStartTime(const Value: TDateTime);
begin
  FStartTime := Value;
end;

procedure TXAxisAttribute.SetStartTimeType(const Value: E_XAxisTime);
begin
  FStartTimeType := Value;
end;

procedure TXAxisAttribute.UpdateTick;
var
  i : integer;
  r, val : double;
begin
  inherited;

  SetLength(FTickValues,FTicks);
  r := 0;
  if FTicks > 0 then
    r := (FEndDate - FStartDate) / (FTicks + 1);

  val := 0;
  for i := 0 to Length(FTickValues) - 1 do
  begin
    val := val + r;
    FTickValues[i] := FStartDate + val;
  end;
end;

{ TYAxisAttribute }

constructor TYAxisAttribute.Create;
begin
  inherited;

  IsAutoScale := True;
  LowerLimit := 0;
  UpperLimit := 100;

  DefaultLowerLimit := 0;
  DefaultUpperLimit := 100;

  AxisType := eatY;

end;

destructor TYAxisAttribute.Destroy;
begin

  inherited;
end;

procedure TYAxisAttribute.SetCanvasMaxTextWidth(const Value: integer);
begin
  FCanvasMaxTextWidth := Value;
end;

procedure TYAxisAttribute.SetDefaultLowerLimit(const Value: integer);
begin
  {Prince : biar ngefek ke kurva}
  LowerLimit := Value;

  FDefaultLowerLimit := Value;
  UpdateTick;
end;

procedure TYAxisAttribute.SetDefaultUpperLimit(const Value: integer);
begin
  {Prince : biar ngefek ke kurva}
  UpperLimit := Value;

  FDefaultUpperLimit := Value;
  UpdateTick;
end;

procedure TYAxisAttribute.SetIsAutoScale(const Value: Boolean);
begin
  FIsAutoScale := Value;
end;

procedure TYAxisAttribute.SetLowerLimit(const Value: integer);
begin
  FLowerLimit := Value;
end;

procedure TYAxisAttribute.SetUpperLimit(const Value: integer);
begin
  FUpperLimit := Value;
end;

procedure TYAxisAttribute.SetUsePointLimit(const Value: Boolean);
begin
  FUsePointLimit := Value;
end;

procedure TYAxisAttribute.UpdateTick;
var
  i : integer;
  r, val : double;
begin

  SetLength(FTickValues,FTicks);
  r := 0;
  if FTicks > 0 then
    r := (DefaultUpperLimit - DefaultLowerLimit) / (FTicks + 1);

  val := 0;
  for i := 0 to Length(FTickValues) - 1 do
  begin
    val := val + r;
    FTickValues[i] := DefaultLowerLimit + val;
  end;
end;

{ TAxisSeries }

procedure TAxisSeries.AddAxis(aAxis: TAxisAttribute);
begin
  FAxises.Add(aAxis);
  if aAxis.AxisType = eatXTime then
    TXAxisAttribute(aAxis).OnNotifyChange := OnNotifiedObject;
end;

function TAxisSeries.Count: integer;
begin
  Result := FAxises.Count;
end;

constructor TAxisSeries.Create;
begin
  FAxises := TList.Create;
end;

destructor TAxisSeries.Destroy;
begin
  FAxises.Free;
  inherited;
end;

function TAxisSeries.GetAxis(aIndex: Integer) : TAxisAttribute;
begin
  Result := nil;

  if aIndex < 0 then Exit;
  if aIndex >= FAxises.Count then Exit;

  Result := FAxises.Items[aIndex];

end;

function TAxisSeries.GetDefaultXAxis: TXAxisAttribute;
var
  axis : TAxisAttribute;
  i : integer;
begin

  Result := nil;

  for I := 0 to FAxises.Count - 1 do
  begin
    axis := FAxises.Items[i];
    if axis.AxisType = eatXTime then
      if axis.DefaultAxis then
      begin
        Result := TXAxisAttribute(axis);
        Break;
      end;
  end;
end;

function TAxisSeries.GetDefaultYAxis: TYAxisAttribute;
var
  axis : TAxisAttribute;
  i : integer;
begin
  Result := nil;
  for I := 0 to FAxises.Count - 1 do
  begin
    axis := FAxises.Items[i];
    if axis.AxisType = eatY then
      if axis.DefaultAxis then
      begin
        Result := TYAxisAttribute(axis);
        Break;
      end;
  end;
end;

procedure TAxisSeries.OnNotifiedObject(Sender: TObject);
begin
  if Assigned(FOnNotifyEvent) then
    FOnNotifyEvent(Sender);
end;

procedure TAxisSeries.RemoveAxis(aAxis: TAxisAttribute);
begin
  if not aAxis.DefaultAxis then
  begin
    FAxises.Remove(aAxis);
    aAxis.Free;
  end;
end;

procedure TAxisSeries.SetOnNotifyEvent(const Value: TNotifyEvent);
begin
  FOnNotifyEvent := Value;
end;

end.
