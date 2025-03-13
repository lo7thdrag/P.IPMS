unit uBallastSystem;

interface

uses uTank, uPump, uEntity, uDataType, uListener, uCommonSystem;

type
  TBallastSystem = class(TCommonSystem)
  public

    constructor Create;override;
    destructor Destroy;override;

    procedure Run(const aDt : Double); override;

    function Pump(aIdent : String) : TPump;
    function Tank(aIdent : string) : TTank;

  end;

implementation

uses uConsumption;

{ TBallasSystem }

constructor TBallastSystem.Create;
//var
//  tank : TTank;
//  pump : TPump;
begin
  inherited;
  { create water ballast }

//  tank := TTank.Create(100);
//  tank.Identifier := C_WB_TK_PS;
//  addEntity(tank);
//
//  tank := TTank.Create(100);
//  tank.Identifier := C_WB_TK_SB;
//  addEntity(tank);
//
//  tank := TTank.Create(100);
//  tank.Identifier := C_WB_TK_FWD;
//  addEntity(tank);
//
//  { create ballast pump }
//  pump := TPump.Create;
//  pump.Identifier := C_WB_PUMP;
//  pump.Consumption.Add(TConsumption.Create);
//  addEntity(pump);
end;

destructor TBallastSystem.Destroy;
begin

  inherited;
end;

function TBallastSystem.Pump(aIdent: String): TPump;
begin

  Result := Entities.Get(aIdent) as TPump;

end;

procedure TBallastSystem.Run(const aDt: Double);
begin

  inherited;

end;

function TBallastSystem.Tank(aIdent: string): TTank;
begin
  Result := Entities.Get(aIdent) as TTank;
end;

end.
