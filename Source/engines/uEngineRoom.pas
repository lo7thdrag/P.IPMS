unit uEngineRoom;

interface

uses
  uBallastSystem, uPMSSystem, uDataType, uAuxSystem, uFireFightingSystem,
  uFuelOilSystem, uNavComSystem, uPropulsionSystem, uSeaFWSystem, uCommonSystem,
  Classes;

type

  TEngineRoom = class
  private
    FSubSystems : array [0..5] of TCommonSystem;
    FFreezed : Boolean;
    FDelay : Double;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Run(const aDt: Double);

    function getBallastSystem : TBallastSystem;
    function getPMSSystem : TPMSSystem;
    function getPCSSystem : TPropulsionSystem;
    function getFFSystem : TFireFightingSystem;
    function getFuelOilSystem : TFuelOilSystem;
    function getSeaFWSystem : TSeaFreshWaterSystem;

    function getSystem(aIndex: Integer): TCommonSystem;
    function getSystemCount: Integer;

    procedure PropulsionTankReady;
    procedure PropulsionTankConsumtion;

    procedure EnergiTankConsumtion;

    procedure getPMSConditionData(var aList: TList);

    procedure Freeze(aState: E_ScenarioRunState = esrPause);
    procedure UnFreeze;
    property Freezed : Boolean read FFreezed;
  end;

implementation

uses
  uDBSupportClasses, uMainEngine, uGenerator;

{ TEngineRoom }

constructor TEngineRoom.Create;
begin
  FSubSystems[0] := TBallastSystem.Create;
  FSubSystems[1] := TPMSSystem.Create;
  FSubSystems[2] := TFireFightingSystem.Create;
  FSubSystems[3] := TSeaFreshWaterSystem.Create;
  FSubSystems[4] := TPropulsionSystem.Create;
  FSubSystems[5] := TFuelOilSystem.Create;

  FFreezed := False;
  FDelay := 0;
end;

destructor TEngineRoom.Destroy;
var
  i : Integer;
begin
  for i := 0 to Length(FSubSystems) - 1 do
    FSubSystems[i].Free;

  inherited;
end;

procedure TEngineRoom.EnergiTankConsumtion;
var
  i : Integer;
  Gen : array [0..4] of TGenerator;
  flag1, flag2 : Double;
begin
  for i := 0 to Length(C_GENERATOR_ID) - 1 do
  begin
    Gen[i] := getPMSSystem.getGenerator(C_GENERATOR_ID[i]);

    if Gen[i].EngineRun then
    begin
      case i of
        0, 2 :
        begin
          flag1 := getFuelOilSystem.GetTank(C_TankIdentifier[15]).Content;

          if ( flag1 < 0.5) and (not Gen[i].FuelRunsOut) and
            (Gen[i].GeneratorState = 5) then
          begin
            Gen[i].GeneratorState := 6;
            Gen[i].FuelRunsOut := True;
            getFuelOilSystem.GetTank(C_TankIdentifier[15]).Transferring := False;
          end
          else
          begin
            getFuelOilSystem.GetTank(C_TankIdentifier[15]).TransferPerSec := 0.225/3600;
            getFuelOilSystem.GetTank(C_TankIdentifier[15]).Transferring := True;
          end;
        end;

        1, 3 :
        begin
          flag2 := getFuelOilSystem.GetTank(C_TankIdentifier[14]).Content;

          if (flag2 < 0.5) and (not Gen[i].FuelRunsOut) and
            (Gen[i].GeneratorState = 5) then
          begin
            Gen[i].GeneratorState := 6;
            Gen[i].FuelRunsOut := True;
            getFuelOilSystem.GetTank(C_TankIdentifier[14]).Transferring := False;
          end
          else
          begin
            getFuelOilSystem.GetTank(C_TankIdentifier[14]).TransferPerSec := 0.225/3600;
            getFuelOilSystem.GetTank(C_TankIdentifier[14]).Transferring := True;
          end;
        end;
      end;
    end
    else
    begin
      case i of
        0, 2 :
        begin
          flag1 := getFuelOilSystem.GetTank(C_TankIdentifier[15]).Content;

          if ( flag1 >= 0.5) and (Gen[i].FuelRunsOut) then
            Gen[i].FuelRunsOut := False;
        end;

        1,3 :
        begin
          flag2 := getFuelOilSystem.GetTank(C_TankIdentifier[14]).Content;

          if (flag2 >= 0.5) and (Gen[i].FuelRunsOut) then
            Gen[i].FuelRunsOut := False;
        end;
      end;
    end;
  end;
end;

procedure TEngineRoom.Freeze(aState : E_ScenarioRunState=esrPause);
begin
  FFreezed := True;
end;

function TEngineRoom.getBallastSystem: TBallastSystem;
begin
  Result := FSubSystems[0] as TBallastSystem;
end;

function TEngineRoom.getFFSystem: TFireFightingSystem;
begin
  Result := FSubSystems[2] as TFireFightingSystem;
end;

function TEngineRoom.getFuelOilSystem: TFuelOilSystem;
begin
  Result := FSubSystems[5] as TFuelOilSystem;
end;

function TEngineRoom.getPCSSystem: TPropulsionSystem;
begin
  Result := FSubSystems[4] as TPropulsionSystem;
end;

procedure TEngineRoom.getPMSConditionData(var aList: TList);
var
  conditionData : TPMSCond_Data;
  i : Integer;
begin
  aList := TList.Create;

  for i := 0 to Length(getPMSSystem.Gen) - 1 do
  begin
    conditionData := TPMSCond_Data.Create;
    conditionData.PMS_Name := C_GENERATOR_ID[i];
    conditionData.PMS_Type := 1;
    conditionData.PMS_Mode:= getPMSSystem.Gen[i].GeneratorMode;

    if getPMSSystem.Gen[i].EngineRun then
      conditionData.PMS_OnOff := 1
    else
      conditionData.PMS_OnOff := 0;

    aList.Add(conditionData);
  end;

  for i := 0 to Length(getPMSSystem.MSB) - 1 do
  begin
    conditionData := TPMSCond_Data.Create;
    conditionData.PMS_Name := C_SWITCHBOARD_ID[i];
    conditionData.PMS_Type := 2;

    if getPMSSystem.MSB[i].MsbCBIntr then
      conditionData.PMS_SWB_MsbCBIntr := 1
    else
      conditionData.PMS_SWB_MsbCBIntr:= 0;

    conditionData.PMS_OnOff := -1;

    aList.Add(conditionData);
  end;
end;

function TEngineRoom.getPMSSystem: TPMSSystem;
begin
  Result := FSubSystems[1] as TPMSSystem;
end;

function TEngineRoom.getSeaFWSystem: TSeaFreshWaterSystem;
begin
  Result := FSubSystems[3] as TSeaFreshWaterSystem;
end;

function TEngineRoom.getSystem(aIndex: Integer): TCommonSystem;
begin
  Result := nil;
  if (aIndex >=0) and (aIndex <= Length(FSubSystems) - 1) then
    Result := FSubSystems[aIndex];
end;

function TEngineRoom.getSystemCount: Integer;
begin
  Result := Length(FSubSystems);
end;

procedure TEngineRoom.PropulsionTankConsumtion;
var
  MainEnginePS, MainEngineSB : TMainEngine;
begin
  MainEnginePS := getPCSSystem.getMainEngine(C_PCS_ME_PORTS);
  MainEngineSB := getPCSSystem.getMainEngine(C_PCS_ME_STARBOARD);

  if MainEnginePS.EngineRun then
  begin
    //interpolasi ActualRPM  agar mendapatkan TransferPerSec yang lebih detail
    getFuelOilSystem.GetTank(C_TankIdentifier[15]).RPMChange(MainEnginePS.ActualSpeed);
    getFuelOilSystem.GetTank(C_TankIdentifier[15]).Transferring := True;

    if getFuelOilSystem.GetTank(C_TankIdentifier[15]).Content = 0 then
      MainEnginePS.TankIsEmpty := True;
  end
  else
  begin
    getFuelOilSystem.GetTank(C_TankIdentifier[15]).Transferring := False;
  end;

  if MainEngineSB.EngineRun then
  begin
    //interpolasi ActualRPM  agar mendapatkan TransferPerSec yang lebih detail
    getFuelOilSystem.GetTank(C_TankIdentifier[14]).RPMChange(MainEngineSB.ActualSpeed);
    getFuelOilSystem.GetTank(C_TankIdentifier[14]).Transferring := True;

    if getFuelOilSystem.GetTank(C_TankIdentifier[14]).Content = 0 then
      MainEngineSB.TankIsEmpty := True;
  end
  else
  begin
    getFuelOilSystem.GetTank(C_TankIdentifier[14]).Transferring := False;
  end;
end;

procedure TEngineRoom.PropulsionTankReady;
var
  MainEnginePS, MainEngineSB : TMainEngine;
begin
  MainEnginePS := getPCSSystem.getMainEngine(C_PCS_ME_PORTS);
  MainEngineSB := getPCSSystem.getMainEngine(C_PCS_ME_STARBOARD);

  if getFuelOilSystem.GetTank(C_TankIdentifier[15]).Content = 0 then
    MainEnginePS.ReadyForUse := False
  else
    MainEnginePS.ReadyForUse := True;

  if getFuelOilSystem.GetTank(C_TankIdentifier[14]).Content = 0 then
    MainEngineSB.ReadyForUse := False
  else
    MainEngineSB.ReadyForUse := True;
end;

procedure TEngineRoom.Run(const aDt: Double);
var
  i : Integer;
begin
  if FFreezed then
    Exit;

  for i := 0 to Length(FSubSystems) - 1 do
    FSubSystems[i].Run(aDt);

  FDelay := FDelay + aDt;
  if FDelay > 5 then
  begin
    FDelay := 0;
//    PropulsionTankReady;
    PropulsionTankConsumtion;
    EnergiTankConsumtion;
  end;
end;

procedure TEngineRoom.UnFreeze;
begin
  FFreezed := False;
end;

end.
