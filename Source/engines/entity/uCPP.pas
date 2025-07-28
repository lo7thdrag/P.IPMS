
unit uCPP;

interface

uses uEntity;

const
  FPC_LeverPitchPositionManouver  : array[0..18] of Double = (10,9,8,7,6,5,4,3.5,3,2,1,0.5,0,-0.5,-2,-4,-6,-8,-10);
  FPC_LeverPitchValuesManouver    : array[0..18] of Double = (74.2, 74.2, 72.77, 71.07, 69.37, 67.67, 65.20, 62.72, 60.25, 40.17,
                                                  20.00, 0.00, 0.00, 0.00, -15.79, -36.84, -57.9, -78.95, -100);
  FPC_LeverPitchPositionTransit   : array[0..18] of Double = (10,9,8,7,6,5,4,3.5,3,2,1,0.5,0,-0.5,-2,-4,-6,-8,-10);
  FPC_LeverPitchValuesTransit     : array[0..12] of Double = (95.0, 95.0, 95.0, 95.0, 95.0, 95.0, 95.0, 79.51, 66.26, 39.75,
                                                           13.25, 00.0, 00.0);

type

  TCPP = class(TEntity)
  private

    FDelayer,
    FDelayerActualPitch,
    FSetpointPitch,
    FLeverPitch,
    FActualPitch,
    FDelayActualPitch,
    FServoOil,
    FStaticHub,
    FHydrOil : Double;

    FLeverPitchTransit : Double;

    FReadyForUse,
    FRemote,
    FRemoteManual,
    FRemoteAuto,
    FAheadPitch,
    FAsternPitch,
    FHydraulicPumpStart1,
    FHydraulicPumpStart2,
    FHydraulicPumpStart3,
    FHydraulicPumpStop1,
    FHydraulicPumpStop2,
    FHydraulicPumpStop3,
    FHydraulicPumpStandby1,
    FHydraulicPumpStandby2,
    FhydraulicPumpAuto3,
    FOilFilterClogged,
    FPitchNotZero,
    FCLSControl,
    FBackupSupplyFail,
    FFollowUpError,
    FCPPHPPOilLevel,
    FCPPOilLevel,
    FLocal,
    FFailure : Boolean;

    FPC_Failure : array [0..2] of Boolean;
    FPumpStandby : array[1..3] of Boolean;
    FPumpStop : array[1..3] of Boolean;
    FPumpStart : array[1..3] of Boolean;

    procedure SetSetpointPitch(const Value: Double);
    procedure SetLeverPitch(const Value: Double);
    procedure SetLeverPitchTransit(const Value: Double);
    procedure SetActualPitch(const Value: Double);
    procedure SetDelayActualPitch(const Value: Double);
    procedure SetServoOil(const Value: Double);
    procedure SetStaticHub(const Value: Double);
    procedure SetHydrOil(const Value: Double);

    procedure SetReadyForUse(const Value: Boolean);
    procedure SetRemote(const Value: Boolean);
    procedure SetRemoteManual(const Value: Boolean);
    procedure SetRemoteAuto(const Value: Boolean);
    procedure SetAheadPitch(const Value : Boolean);
    procedure SetAsternPitch(const Value : Boolean);
    procedure SetHydraulicPumpStart1(const Value : Boolean);
    procedure SetHydraulicPumpStart2(const Value : Boolean);
    procedure SetHydraulicPumpStart3(const Value : Boolean);
    procedure SetHydraulicPumpStop1(const Value : Boolean);
    procedure SetHydraulicPumpStop2(const Value : Boolean);
    procedure SetHydraulicPumpStop3(const Value : Boolean);
    procedure SetHydraulicPumpStandby1(const Value : Boolean);
    procedure SetHydraulicPumpStandby2(const Value : Boolean);
    procedure SetHydraulicPumpAuto3(const Value : Boolean);
    procedure SetOilFilterClogged(const Value : Boolean);
    procedure SetPitchNotZero(const Value : Boolean);
    procedure SetCLSControl(const Value : Boolean);
    procedure SetBackupSupplyFail(const Value : Boolean);
    procedure SetFollowUpError(const Value : Boolean);
    procedure SetCPPHPPOilLevel(const Value : Boolean);
    procedure SetCPPOilLevel(const Value : Boolean);
    procedure SetLocal(const Value : Boolean);
    procedure SetFailure(const Value : Boolean);
    procedure SetPC_Failure(i : Integer; const Value : Boolean);
    procedure SetPumpStandby(i : Integer; const Value : Boolean);
    procedure SetPumpStop(i : Integer; const Value : Boolean);
    procedure SetPumpStart(i : Integer; const Value : Boolean);

    procedure SetPitchInManual(const aValue : Double);
    {Set kondisi CPP Hydraulic Pump dari hardware}
    procedure setCPPHydraulicPump(aPumpID, aStateID : Integer; aON : Boolean);

    procedure calcActualPitch; {Actual Pitch calculation from Setpoint Pitch}
    procedure calcDelayActualPitch; {Delay untuk menampilkan value di mimic}

    function CPPFailure: Boolean; {Set kondisi CPP Failure}
    function GetPC_Failure(i : Integer): Boolean;
    function GetPumpStandby(i : Integer): Boolean;
    function GetPumpStop(i : Integer): Boolean;
    function GetPumpStart(i : Integer): Boolean;

  public

    FHydraulicPumpID, FHydraulicPumpState : Integer;
    FHydraulicPumpOnOff : Boolean;

    FPC_LeverPitchPositionManouver  : array[0..18] of Double;
    FPC_LeverPitchValuesManouver    : array[0..18] of Double;
    FPC_LeverPitchPositionTransit   : array[0..12] of Double;
    FPC_LeverPitchValuesTransit     : array[0..12] of Double;

    constructor Create;override;
    destructor Destroy;override;

    procedure Run(const aDt : Double);override;
    procedure LeverPitchValues;

    property SetpointPitch : Double read FSetpointPitch write SetSetpointPitch;
    property LeverPitch : Double read FLeverPitch write SetLeverPitch;
    property LeverPitchTransit : Double read FLeverPitchTransit write SetLeverPitchTransit;
    property ActualPitch : Double read FActualPitch write SetActualPitch;
    property DelayActualPitch : Double read FDelayActualPitch write SetDelayActualPitch;
    property ServoOil : Double read FServoOil write SetServoOil;
    property StaticHub : Double read FStaticHub write SetStaticHub;
    property HydrOil : Double read FHydrOil write SetHydrOil;

    property ReadyForUse : Boolean read FReadyForUse write SetReadyForUse;
    property Remote : Boolean read FRemote write SetRemote;
    property RemoteManual : Boolean read FRemoteManual write SetRemoteManual;
    property RemoteAuto : Boolean read FRemoteAuto write SetRemoteAuto;
    property AheadPitch : Boolean read FAheadPitch write SetAheadPitch;
    property AsternPitch : Boolean read FAsternPitch write SetAsternPitch;
    property HydraulicPumpStart1 : Boolean read FHydraulicPumpStart1 write SetHydraulicPumpStart1;
    property HydraulicPumpStart2 : Boolean read FHydraulicPumpStart2 write SetHydraulicPumpStart2;
    property HydraulicPumpStart3 : Boolean read FHydraulicPumpStart3 write SetHydraulicPumpStart3;
    property HydraulicPumpStop1 : Boolean read FHydraulicPumpStop1 write SetHydraulicPumpStop1;
    property HydraulicPumpStop2 : Boolean read FHydraulicPumpStop2 write SetHydraulicPumpStop2;
    property HydraulicPumpStop3 : Boolean read FHydraulicPumpStop3 write SetHydraulicPumpStop3;
    property HydraulicPumpStandby1 : Boolean read FHydraulicPumpStandby1 write SetHydraulicPumpStandby1;
    property HydraulicPumpStandby2 : Boolean read FHydraulicPumpStandby2 write SetHydraulicPumpStandby2;
    property HydraulicPumpAuto3 : Boolean read FhydraulicPumpAuto3 write SetHydraulicPumpAuto3;
    property OilFilterClogged : Boolean read FOilFilterClogged write SetOilFilterClogged;
    property PitchNotZero : Boolean read FPitchNotZero write SetPitchNotZero;
    property CLSControl : Boolean read FCLSControl write SetCLSControl;
    property BackupSupplyFail : Boolean read FBackupSupplyFail write SetBackupSupplyFail;
    property FollowUpError : Boolean read FFollowUpError write SetFollowUpError;
    property CPPHPPOilLevel : Boolean read FCPPHPPOilLevel write SetCPPHPPOilLevel;
    property CPPOilLevel : Boolean read FCPPOilLevel write SetCPPOilLevel;
    property Local : Boolean read FLocal write SetLocal;
    property Failure : Boolean read FFailure write SetFailure;
    property PC_Failure[i : Integer]: Boolean read GetPC_Failure write SetPC_Failure;
    property PumpStandby[i : Integer]: Boolean read GetPumpStandby write SetPumpStandby;
    property PumpStop[i : Integer]: Boolean read GetPumpStop write SetPumpStop;
    property PumpStart[i : Integer]: Boolean read GetPumpStart write SetPumpStart;
  end;

implementation

uses uDataType;

{ TMainEngine }

procedure TCPP.calcActualPitch;
begin
  if FDelayer > 0.01 then
  begin
    FDelayer := 0;
    if ActualPitch <> SetpointPitch then
    begin
      if ActualPitch < SetpointPitch then
        ActualPitch := ActualPitch + 0.1
      else
      if ActualPitch > SetpointPitch then
        ActualPitch := ActualPitch - 0.1;
    end;
  end;
end;

procedure TCPP.calcDelayActualPitch;
begin
  if FDelayerActualPitch > 1 then
  begin
    FDelayerActualPitch := 0;
    DelayActualPitch := ActualPitch;
  end;
end;

function TCPP.CPPFailure: Boolean;
begin
  if (not HydraulicPumpStart1 and not HydraulicPumpStart2 and not HydraulicPumpStart3) or
      CLSControl or FollowUpError or BackupSupplyFail then
      Result := True
    else
      Result := False;
end;

constructor TCPP.Create;
begin
  inherited;
  SetpointPitch := 0;
  LeverPitch    := 0;
  ActualPitch   := 0;
  FDelayer      := 0;

  HydraulicPumpStandby1 := False;
  HydraulicPumpStandby2 := False;
  HydraulicPumpAuto3 := False;

  HydraulicPumpStop1 := False;
  HydraulicPumpStop2 := False;
  HydraulicPumpStop3 := False;

  HydraulicPumpStart1 := False;
  HydraulicPumpStart2 := False;
  HydraulicPumpStart3 := False;


  LeverPitchValues;
end;

destructor TCPP.Destroy;
begin

  inherited;
end;

function TCPP.GetPC_Failure(i: Integer): Boolean;
begin
  Result := FPC_Failure[i];
end;

function TCPP.GetPumpStandby(i: Integer): Boolean;
begin
  Result := FPumpStandby[i];
end;

function TCPP.GetPumpStart(i: Integer): Boolean;
begin
  Result := FPumpStart[i];
end;

function TCPP.GetPumpStop(i: Integer): Boolean;
begin
  Result := FPumpStop[i];
end;

procedure TCPP.Run(const aDt: Double);
begin
  inherited;
  if FDelayer > 0.05 then
  begin
    FDelayer := 0;

    calcActualPitch;
    DelayActualPitch := SetpointPitch;
  end;
  calcDelayActualPitch;

  if ReadyForUse then
  begin
    FDelayer := FDelayer + aDt;
    FDelayerActualPitch := FDelayerActualPitch + aDt;

    if AheadPitch then
    begin
      SetPitchInManual(10);
      AheadPitch := False;
    end
    else if AsternPitch then
    begin
      SetPitchInManual(-10);
      AsternPitch := False;
    end;
  end;

  setCPPHydraulicPump(FHydraulicPumpID,FHydraulicPumpState,FHydraulicPumpOnOff);

  Failure := CPPFailure;
end;

procedure TCPP.SetActualPitch(const Value: Double);
begin
  if FActualPitch = Value then
    exit;

  FActualPitch := Value;
  Listener.TriggerEvents(Self,epPCSCPPActualPitch, Value);
end;

procedure TCPP.SetAheadPitch(const Value: Boolean);
begin
  if FAheadPitch = Value then
    Exit;

  FAheadPitch := Value;
end;

procedure TCPP.SetAsternPitch(const Value: Boolean);
begin
  if FAsternPitch = Value then
    Exit;

  FAsternPitch := Value;
end;

procedure TCPP.SetBackupSupplyFail(const Value: Boolean);
begin
  if FBackupSupplyFail = Value then
    Exit;

  FBackupSupplyFail := Value;
  PC_Failure[2] := Value;
  Listener.TriggerEvents(Self,epPCSCPPBackupSupplyFail,Value);
end;

procedure TCPP.SetCLSControl(const Value: Boolean);
begin
  if FCLSControl = Value then
    Exit;

  FCLSControl := Value;
  PC_Failure[0] := Value;
  Listener.TriggerEvents(Self,epPCSCPPCLSControl,Value);
end;

procedure TCPP.SetCPPHPPOilLevel(const Value: Boolean);
begin
  if FCPPHPPOilLevel = Value then
    Exit;

  FCPPHPPOilLevel := Value;
  Listener.TriggerEvents(Self,epPCSCPPHPPOilLevel,Value);
end;

procedure TCPP.setCPPHydraulicPump(aPumpID, aStateID: Integer; aON: Boolean);
begin
  case aPumpID of
    C_PUMP_CPP_HYDRAULIC_1:
    begin
      case aStateID of
        C_PUMP_CPP_HYDRAULIC_STANDBY:
        begin
          HydraulicPumpStandby1 := aON;
          HydraulicPumpStop1 := not aON;
          HydraulicPumpStart1 := not aON;
        end;
        C_PUMP_CPP_HYDRAULIC_STOP:
        begin
          HydraulicPumpStandby1 := not aON;
          HydraulicPumpStop1 := aON;
          HydraulicPumpStart1 := not aON
        end;
        C_PUMP_CPP_HYDRAULIC_START:
        begin
          HydraulicPumpStandby1 := not aON;
          HydraulicPumpStop1 := not aON;
          HydraulicPumpStart1 := aON;
        end;
      end;
    end;

    C_PUMP_CPP_HYDRAULIC_2:
    begin
      case aStateID of
        C_PUMP_CPP_HYDRAULIC_STANDBY:
        begin
          HydraulicPumpStandby2 := aON;
          HydraulicPumpStop2 := not aON;
          HydraulicPumpStart2 := not aON;
        end;
        C_PUMP_CPP_HYDRAULIC_STOP:
        begin
          HydraulicPumpStandby2 := not aON;
          HydraulicPumpStop2 := aON;
          HydraulicPumpStart2 := not aON
        end;
        C_PUMP_CPP_HYDRAULIC_START:
        begin
          HydraulicPumpStandby2 := not aON;
          HydraulicPumpStop2 := not aON;
          HydraulicPumpStart2 := aON;
        end;
      end;
    end;

    C_PUMP_CPP_HYDRAULIC_3:
    begin
      case aStateID of
        C_PUMP_CPP_HYDRAULIC_STANDBY:
        begin
          HydraulicPumpAuto3 := aON;
          HydraulicPumpStop3 := not aON;
          HydraulicPumpStart3 := not aON;
        end;
        C_PUMP_CPP_HYDRAULIC_STOP:
        begin
          HydraulicPumpAuto3 := not aON;
          HydraulicPumpStop3 := aON;
          HydraulicPumpStart3 := not aON
        end;
        C_PUMP_CPP_HYDRAULIC_START:
        begin
          HydraulicPumpAuto3 := not aON;
          HydraulicPumpStop3 := not aON;
          HydraulicPumpStart3 := aON;
        end;
      end;
    end;
  end;
end;

procedure TCPP.SetCPPOilLevel(const Value: Boolean);
begin
  if FCPPOilLevel = Value then
    Exit;

  FCPPOilLevel := Value;
  Listener.TriggerEvents(Self,epPCSCPPOilLevel,Value);
end;

procedure TCPP.SetDelayActualPitch(const Value: Double);
begin
  if FDelayActualPitch = Value then
    Exit;

  FDelayActualPitch := Value;
  Listener.TriggerEvents(Self,epPCSCPPDelayActualPitch,Value);
end;

procedure TCPP.SetFailure(const Value: Boolean);
begin
  if FFailure = Value then
    Exit;

  FFailure := Value;
  Listener.TriggerEvents(Self,epPCSCPPFailure,Value);
end;

procedure TCPP.SetFollowUpError(const Value: Boolean);
begin
  if FFollowUpError = Value then
    Exit;

  FFollowUpError := Value;
  PC_Failure[1] := Value;
  Listener.TriggerEvents(Self,epPCSCPPFollowUpError,Value);
end;

procedure TCPP.SetHydraulicPumpAuto3(const Value: Boolean);
begin
  if FhydraulicPumpAuto3 = Value then
    Exit;

  FhydraulicPumpAuto3 := Value;
  PumpStandby[3] := Value;
  Listener.TriggerEvents(Self,epPCSCPPPumpAuto3,Value);
end;

procedure TCPP.SetHydraulicPumpStandby1(const Value: Boolean);
begin
  if FHydraulicPumpStandby1 = Value then
    Exit;

  FHydraulicPumpStandby1 := Value;
  PumpStandby[1] := Value;
  Listener.TriggerEvents(Self,epPCSCPPPumpStandby1,Value);
end;

procedure TCPP.SetHydraulicPumpStop1(const Value: Boolean);
begin
  if FHydraulicPumpStop1 = Value then
    Exit;

  FHydraulicPumpStop1 := Value;
  PumpStop[1] := Value;
  Listener.TriggerEvents(Self,epPCSCPPPumpStop1,Value);
  Listener.TriggerEvents(Self,epPCSCPPHydraulicPumpHour1,False);
end;

procedure TCPP.SetHydraulicPumpStart1(const Value: Boolean);
begin
  if FHydraulicPumpStart1 = Value then
    Exit;

  FHydraulicPumpStart1 := Value;
  PumpStart[1] := Value;
  Listener.TriggerEvents(Self,epPCSCPPPumpStart1,Value);
  Listener.TriggerEvents(Self,epPCSCPPHydraulicPumpHour1,Value);
end;

procedure TCPP.SetHydraulicPumpStandby2(const Value: Boolean);
begin
  if FHydraulicPumpStandby2 = Value then
    Exit;

  FHydraulicPumpStandby2 := Value;
  PumpStandby[2] := Value;
  Listener.TriggerEvents(Self,epPCSCPPPumpStandby2,Value);
end;

procedure TCPP.SetHydraulicPumpStart2(const Value: Boolean);
begin
  if FHydraulicPumpStart2 = Value then
    Exit;

  FHydraulicPumpStart2 := Value;
  PumpStart[2] := Value;
  Listener.TriggerEvents(Self,epPCSCPPPumpStart2,Value);
  Listener.TriggerEvents(Self,epPCSCPPHydraulicPumpHour2,Value);
end;

procedure TCPP.SetHydraulicPumpStart3(const Value: Boolean);
begin
  if FHydraulicPumpStart3 = Value then
    Exit;

  FHydraulicPumpStart3 := Value;
  FPumpStart[3] := Value;
  Listener.TriggerEvents(Self,epPCSCPPPumpStart3,Value);
  Listener.TriggerEvents(Self,epPCSCPPHydraulicPumpHour3,Value);
end;

procedure TCPP.SetHydraulicPumpStop2(const Value: Boolean);
begin
  if FHydraulicPumpStop2 = Value then
    Exit;

  FHydraulicPumpStop2 := Value;
  PumpStop[2] := Value;
  Listener.TriggerEvents(Self,epPCSCPPPumpStop2,Value);
  Listener.TriggerEvents(Self,epPCSCPPHydraulicPumpHour2,False);
end;

procedure TCPP.SetHydraulicPumpStop3(const Value: Boolean);
begin
  if FHydraulicPumpStop3 = Value then
    Exit;

  FHydraulicPumpStop3 := Value;
  FPumpStop[3] := Value;
  Listener.TriggerEvents(Self,epPCSCPPPumpStop3,Value);
  Listener.TriggerEvents(Self,epPCSCPPHydraulicPumpHour3,False);
end;

procedure TCPP.SetHydrOil(const Value: Double);
begin
  if FHydrOil = Value then
    exit;

  FHydrOil := Value;
  Listener.TriggerEvents(Self,epPCSCPPHydrOil,Value);
end;

procedure TCPP.LeverPitchValues;
begin
  // Mode Manouver
  FPC_LeverPitchPositionManouver[0]  := 10;    FPC_LeverPitchValuesManouver[0]  := 74.2;
  FPC_LeverPitchPositionManouver[1]  := 9;     FPC_LeverPitchValuesManouver[1]  := 74.2;
  FPC_LeverPitchPositionManouver[2]  := 8;     FPC_LeverPitchValuesManouver[2]  := 72.77;
  FPC_LeverPitchPositionManouver[3]  := 7;     FPC_LeverPitchValuesManouver[3]  := 71.07;
  FPC_LeverPitchPositionManouver[4]  := 6;     FPC_LeverPitchValuesManouver[4]  := 69.37;
  FPC_LeverPitchPositionManouver[5]  := 5;     FPC_LeverPitchValuesManouver[5]  := 67.67;
  FPC_LeverPitchPositionManouver[6]  := 4;     FPC_LeverPitchValuesManouver[6]  := 65.20;
  FPC_LeverPitchPositionManouver[7]  := 3.5;   FPC_LeverPitchValuesManouver[7]  := 62.72;
  FPC_LeverPitchPositionManouver[8]  := 3;     FPC_LeverPitchValuesManouver[8]  := 60.25;
  FPC_LeverPitchPositionManouver[9]  := 2;     FPC_LeverPitchValuesManouver[9]  := 40.17;
  FPC_LeverPitchPositionManouver[10] := 1;     FPC_LeverPitchValuesManouver[10] := 20.00;
  FPC_LeverPitchPositionManouver[11] := 0.5;   FPC_LeverPitchValuesManouver[11] := 00.0;
  FPC_LeverPitchPositionManouver[12] := 0;     FPC_LeverPitchValuesManouver[12] := 00.0;
  FPC_LeverPitchPositionManouver[13] := -0.5;  FPC_LeverPitchValuesManouver[13] := 00.0;
  FPC_LeverPitchPositionManouver[14] := -2;    FPC_LeverPitchValuesManouver[14] := -15.79;
  FPC_LeverPitchPositionManouver[15] := -4;    FPC_LeverPitchValuesManouver[15] := -36.84;
  FPC_LeverPitchPositionManouver[16] := -6;    FPC_LeverPitchValuesManouver[16] := -57.9;
  FPC_LeverPitchPositionManouver[17] := -8;    FPC_LeverPitchValuesManouver[17] := -78.95;
  FPC_LeverPitchPositionManouver[18] := -10;   FPC_LeverPitchValuesManouver[18] := -100;

  // Mode Transit
  FPC_LeverPitchPositionTransit[0]  := 10;    FPC_LeverPitchValuesTransit[0]  := 95.0;
  FPC_LeverPitchPositionTransit[1]  := 9;     FPC_LeverPitchValuesTransit[1]  := 95.0;
  FPC_LeverPitchPositionTransit[2]  := 8;     FPC_LeverPitchValuesTransit[2]  := 95.0;
  FPC_LeverPitchPositionTransit[3]  := 7;     FPC_LeverPitchValuesTransit[3]  := 95.0;
  FPC_LeverPitchPositionTransit[4]  := 6;     FPC_LeverPitchValuesTransit[4]  := 95.0;
  FPC_LeverPitchPositionTransit[5]  := 5;     FPC_LeverPitchValuesTransit[5]  := 95.0;
  FPC_LeverPitchPositionTransit[6]  := 4;     FPC_LeverPitchValuesTransit[6]  := 95.0;
  FPC_LeverPitchPositionTransit[7]  := 3.5;   FPC_LeverPitchValuesTransit[7]  := 79.51;
  FPC_LeverPitchPositionTransit[8]  := 3;     FPC_LeverPitchValuesTransit[8]  := 66.26;
  FPC_LeverPitchPositionTransit[9]  := 2;     FPC_LeverPitchValuesTransit[9]  := 39.75;
  FPC_LeverPitchPositionTransit[10] := 1;     FPC_LeverPitchValuesTransit[10] := 13.25;
  FPC_LeverPitchPositionTransit[11] := 0.5;   FPC_LeverPitchValuesTransit[11] := 00.0;
  FPC_LeverPitchPositionTransit[12] := 0;     FPC_LeverPitchValuesTransit[12] := 00.0;
end;

procedure TCPP.SetLeverPitch(const Value: Double);
var
  i : Integer;
  epsilon : Double;
begin
  if FLeverPitch = Value then
    exit;

  FLeverPitch := Value;

  ActualPitch   := 0;
  SetpointPitch := 0;
  epsilon       := 0.01;

  for i := 0 to High(FPC_LeverPitchValuesManouver) do
  begin
    if Abs(FPC_LeverPitchPositionManouver[i] - Value) < epsilon then
    begin
      ActualPitch   := FPC_LeverPitchValuesManouver[i];
      SetpointPitch := FPC_LeverPitchValuesManouver[i];
      Break;
    end;
  end;

  Listener.TriggerEvents(Self,epPCSCPPLeverPitch, ActualPitch);
end;

procedure TCPP.SetLeverPitchTransit(const Value: Double);
var
  i : Integer;
  epsilon : Double;
begin
  if FLeverPitch = Value then
    exit;

  FLeverPitch := Value;

  ActualPitch   := 0;
  SetpointPitch := 0;
  epsilon       := 0.01;

  for i := 0 to High(FPC_LeverPitchValuesTransit) do
  begin
    if Abs(FPC_LeverPitchPositionTransit[i] - Value) < epsilon then
    begin
      ActualPitch   := FPC_LeverPitchValuesTransit[i];
      SetpointPitch := FPC_LeverPitchValuesTransit[i];
      Break;
    end;
  end;

  Listener.TriggerEvents(Self,epPCSCPPLeverPitch, ActualPitch);
end;

procedure TCPP.SetLocal(const Value: Boolean);
begin
  if FLocal = Value then
    Exit;

  FLocal := Value;
  Listener.TriggerEvents(Self,epPCSCPPLocal,Value);
end;

procedure TCPP.SetOilFilterClogged(const Value: Boolean);
begin
  if FOilFilterClogged = Value then
    Exit;

  FOilFilterClogged := Value;
  Listener.TriggerEvents(Self,epPCSCPPOilFilterClogged,Value);
end;

procedure TCPP.SetPC_Failure(i: Integer; const Value: Boolean);
begin
  if FPC_Failure[i] =  Value then
    Exit;

  FPC_Failure[i] := Value;
end;

procedure TCPP.SetPitchInManual(const aValue: Double);
begin
  if aValue > 0 then
  begin
    if SetpointPitch < 95 then
      SetpointPitch := SetpointPitch + aValue
    else
      SetpointPitch := 95;
  end
  else
  if aValue < 0 then
  begin
    if SetpointPitch > -95 then
      SetpointPitch := SetpointPitch + aValue
    else
      SetpointPitch := -95;
  end;
end;

procedure TCPP.SetPitchNotZero(const Value: Boolean);
begin
  if FPitchNotZero = Value then
    Exit;

  FPitchNotZero := Value;
  Listener.TriggerEvents(Self,epPCSCPPPitchNotZero,Value);
end;

procedure TCPP.SetPumpStandby(i: Integer; const Value: Boolean);
begin
  if FPumpStandby[i] = Value then
    Exit;

  FPumpStandby[i] := Value;
end;

procedure TCPP.SetPumpStart(i: Integer; const Value: Boolean);
begin
  if FPumpStart[i] = Value then
    Exit;

  FPumpStart[i] := Value;
end;

procedure TCPP.SetPumpStop(i: Integer; const Value: Boolean);
begin
  if FPumpStop[i] = Value then
    Exit;

  FPumpStop[i] := Value;
end;

procedure TCPP.SetReadyForUse(const Value: Boolean);
begin
  if FReadyForUse = Value then
    Exit;

  FReadyForUse := Value;
  Listener.TriggerEvents(Self,epPCSCPPReadyForUse,Value);
end;

procedure TCPP.SetRemote(const Value: Boolean);
begin
  if FRemote = Value then
    Exit;

  FRemote := Value;
  Listener.TriggerEvents(Self,epPCSCPPRemote,Value);
end;
procedure TCPP.SetRemoteAuto(const Value: Boolean);
begin
  if RemoteAuto = Value then
    Exit;

  FRemoteAuto := Value;
//  Listener.TriggerEvents(Self,epPCSCPPRemoteAuto,Value);
end;

procedure TCPP.SetRemoteManual(const Value: Boolean);
begin
  if RemoteManual = Value then
    Exit;

  FRemoteManual := Value;
//  Listener.TriggerEvents(Self,epPCSCPPRemoteManual,Value);
end;

procedure TCPP.SetServoOil(const Value: Double);
begin
  if FServoOil = Value then
    exit;

  FServoOil := Value;
  Listener.TriggerEvents(Self,epPCSCPPServoOil,Value);
end;

procedure TCPP.SetSetpointPitch(const Value: Double);
begin
  if FSetpointPitch = Value then
    exit;

  FSetpointPitch := Value;
  Listener.TriggerEvents(Self,epPCSCPPSetPointPitch,Value);
end;

procedure TCPP.SetStaticHub(const Value: Double);
begin
  if FStaticHub = Value then
    exit;

  FStaticHub := Value;
  Listener.TriggerEvents(Self,epPCSCPPStaticHub,Value);
end;

end.
