unit uAuxSystem;

interface

uses
  uPump, uEntity, uDataType, uListener, uCommonSystem;

type

  TAuxilliarySystem = class(TCommonSystem)

  public
    constructor Create;override;
    destructor Destroy;override;

    procedure Run(const aDt : Double); override;

    function GetPump(aIdent : String) : TPump;
  end;

implementation

{ TAuxilliarySystem }

constructor TAuxilliarySystem.Create;
var
  pump : TPump;
  i : Integer;
begin
  inherited;

  for I := 0 to Length(C_PUMP_ID) - 1 do
  begin
    pump := TPump.Create;
    pump.Identifier := C_PUMP_ID[i];
    pump.PowerSupply := True;
    addEntity(pump);
  end;
end;

destructor TAuxilliarySystem.Destroy;
begin

  inherited;
end;

function TAuxilliarySystem.GetPump(aIdent: String): TPump;
begin
  result := Entities.Get(aIdent) as TPump;
end;

procedure TAuxilliarySystem.Run(const aDt: Double);
begin
  inherited;

end;

end.
