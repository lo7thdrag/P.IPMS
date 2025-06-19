unit uPump;

interface

uses
  uEntity, uDataType;

type
  TPump = class(TEntity)
  private
    FPressure: double;
    FIsEngineRun : Boolean;
    FIsPowerSupply : Boolean;

    procedure SetPressure(const Value: double);
    procedure SetEngineRun(const Value: Boolean);
    procedure SetPowerSupply(const Value: Boolean);

  public
    constructor Create;override;
    destructor Destroy;override;

    procedure Run(const aDt : Double);override;

    procedure Start;
    procedure Stop;

    property Pressure : double read FPressure write SetPressure;  // MPa??
    property EngineRun : Boolean read FIsEngineRun write SetEngineRun;
    property PowerSupply : Boolean read FIsPowerSupply write SetPowerSupply;

  end;

implementation

{ TPump }

constructor TPump.Create;
begin
  inherited;

end;

destructor TPump.Destroy;
begin

  inherited;
end;

procedure TPump.Run(const aDt: Double);
begin
  inherited;

end;

procedure TPump.SetEngineRun(const Value: Boolean);
begin
  if FIsEngineRun = Value then
    exit;

  FIsEngineRun := Value;
  Listener.TriggerEvents(Self,epAuxEngineRun,Value);
end;

procedure TPump.SetPowerSupply(const Value: Boolean);
begin
  if FIsPowerSupply = Value then
    exit;

  FIsPowerSupply := Value;
  Listener.TriggerEvents(Self,epAuxPowerSupply,Value);
end;

procedure TPump.SetPressure(const Value: double);
begin
  FPressure := Value;
end;

procedure TPump.Start;
begin

end;

procedure TPump.Stop;
begin

end;

end.
