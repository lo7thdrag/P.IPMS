unit uConsumption;

interface

uses Classes;

type

  {
    asummed : cmOff = 0%, cmIdle = 30%, cmMedimumLoad = 60%,
      cmHighLoad = 85%, cmFullLoad = 100% of max consumption
  }
  TConsumptionMode = (cmOff, cmIdle, cmMediumLoad, cmHighLoad, cmFullLoad,cmUserLoad);

  {
    consumption type : power, fuel, etc
  }
  TConsumptionType = (ctPower, ctFuel);

  TConsumption = class
  private
    FMaxConsumption: Double;
    FConsumptionMode: TConsumptionMode;
    FPercentageHighLoad: double;
    FPercentageIdle: Double;
    FPercentageMediumLoad: double;
    FConsumerType: TConsumptionType;
    FUserConsumption : double;
    FFeederAvailable: Boolean;

    function getConsumption: Double;
    procedure SetMaxConsumption(const Value: Double);
    procedure SetConsumptionMode(const Value: TConsumptionMode);
    procedure SetPercentageHighLoad(const Value: double);
    procedure SetPercentageIdle(const Value: Double);
    procedure SetPercentageMediumLoad(const Value: double);
    procedure SetConsumerType(const Value: TConsumptionType);
    procedure SetFeederAvailable(const Value: Boolean);
  public
    constructor Create;
    destructor Destroy;override;

    procedure SetUserFixedConsumption(aConsume : Double);

    property MaxConsumption : Double  read FMaxConsumption write SetMaxConsumption;
    property ConsumptionMode : TConsumptionMode read FConsumptionMode write SetConsumptionMode;
    property Consumption : Double read getConsumption;

    property PercentageIdle : Double read FPercentageIdle write SetPercentageIdle;
    property PercentageMediumLoad : double read FPercentageMediumLoad write SetPercentageMediumLoad;
    property PercentageHighLoad : double read FPercentageHighLoad write SetPercentageHighLoad;

    property ConsumerType : TConsumptionType read FConsumerType write SetConsumerType;

    { set feeder availablity here }
    property FeederAvailable : Boolean read FFeederAvailable write SetFeederAvailable;

  end;

  TConsumptions = class
  private
    FList : TList;

  public

    constructor Create;
    destructor Destroy;override;

    function getCount : integer;

    procedure Add(aConsumption : TConsumption);
  end;

implementation

{ TPowerConsumption }

constructor TConsumption.Create;
begin
  { default }
  FPercentageIdle       := 30;
  FPercentageMediumLoad := 60;
  FPercentageHighLoad   := 80;
  FConsumptionMode      := cmOff;
  FConsumerType         := ctPower;
end;

destructor TConsumption.Destroy;
begin

  inherited;
end;

function TConsumption.getConsumption: Double;
begin
  Result := 0.00;
  case FConsumptionMode of
    cmOff       : result := 0;
    cmIdle      : result := (FPercentageIdle / 100) * FMaxConsumption;
    cmMediumLoad: result := (FPercentageMediumLoad / 100) * FMaxConsumption;
    cmHighLoad  : result := (FPercentageHighLoad / 100) * FMaxConsumption;
    cmFullLoad  : result := FMaxConsumption;
    cmUserLoad  : Result := FUserConsumption;
  end;
end;

procedure TConsumption.SetConsumerType(const Value: TConsumptionType);
begin
  FConsumerType := Value;
end;

procedure TConsumption.SetConsumptionMode(const Value: TConsumptionMode);
begin
  FConsumptionMode := Value;
end;

procedure TConsumption.SetFeederAvailable(const Value: Boolean);
begin
  FFeederAvailable := Value;
end;

procedure TConsumption.SetMaxConsumption(const Value: Double);
begin
  FMaxConsumption := Value;
end;

procedure TConsumption.SetPercentageHighLoad(const Value: double);
begin
  FPercentageHighLoad := Value;
end;

procedure TConsumption.SetPercentageIdle(const Value: Double);
begin
  FPercentageIdle := Value;
end;

procedure TConsumption.SetPercentageMediumLoad(const Value: double);
begin
  FPercentageMediumLoad := Value;
end;

procedure TConsumption.SetUserFixedConsumption(aConsume: Double);
begin
  FUserConsumption := aConsume;
end;

{ TConsumptions }

procedure TConsumptions.Add(aConsumption: TConsumption);
begin

end;

constructor TConsumptions.Create;
begin
  FList := TList.Create;
end;

destructor TConsumptions.Destroy;
var
  i : integer;
begin

  for I := 0 to FList.Count - 1 do
    TObject(FList.Items[i]).Free;

  FList.Clear;
  FList.Free;

  inherited;
end;

function TConsumptions.getCount: integer;
begin
  Result := FList.Count;
end;

end.
