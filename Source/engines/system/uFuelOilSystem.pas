unit uFuelOilSystem;

interface

uses
  Classes, uCommonSystem, uDatabase, uPump, uTank;

type
  TFuelOilSystem = class(TCommonSystem)
  private
    FDatabase : TIPMSDatabase;
  public
    constructor Create; override;
    destructor Destroy; override;

    procedure Run(const aDt: Double); override;

    function GetTank(aIdentifier: string): TTank;
  end;

implementation

uses
  uDataType;

{ TFuelOilSystem }

constructor TFuelOilSystem.Create;
var
  i : Integer;
  tank : TTank;
begin
  inherited;

  FDatabase := TIPMSDatabase.Create;

  for i := 0 to Length(C_TankElementID) - 1 do
  begin
    tank := TTank.Create(C_TankElementID[i], FDatabase);
    tank.Identifier := C_TankIdentifier[i];
    addEntity(tank);
  end;
end;

destructor TFuelOilSystem.Destroy;
begin

  inherited;
end;

function TFuelOilSystem.GetTank(aIdentifier: string): TTank;
begin
  Result := Entities.Get(aIdentifier) as TTank;
end;

procedure TFuelOilSystem.Run(const aDt: Double);
begin
  inherited;

end;

end.
