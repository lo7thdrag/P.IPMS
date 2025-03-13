unit uPump;

interface

uses uEntity;

type
  TPump = class(TEntity)
  private
    FPressure: double;
    procedure SetPressure(const Value: double);
  public
    constructor Create;override;
    destructor Destroy;override;

    procedure Start;
    procedure Stop;

    property Pressure : double read FPressure write SetPressure;  // MPa??
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
