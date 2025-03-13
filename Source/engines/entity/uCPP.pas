
unit uCPP;

interface

uses uEntity;

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

    FReadyForUse,
    FRemote,
    FRemoteManual,
    FRemoteAuto,
    FAheadPitch,
    FAsternPitch,
    FHydraulicPumpStart1,
    FHydraulicPumpStart2,
    FHydraulicPumpStart3,
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
    FPumpStandby : array[1..2] of Boolean;
    FPumpStart : array[1..3] of Boolean;

    procedure SetSetpointPitch(const Value: Double);
    procedure SetLeverPitch(const Value: Double);
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
    procedure SetPumpStart(i : Integer; const Value : Boolean);

    procedure SetPitchInManual(const aValue : Double);
    {Set kondisi CPP Hydraulic Pump dari hardware}
    procedure setCPPHydraulicPump(aPumpID, aStateID : Integer; aON : Boolean);

    procedure calcActualPitch; {Actual Pitch calculation from Setpoint Pitch}
    procedure calcDelayActualPitch; {Delay untuk menampilkan value di mimic}

    function CPPFailure: Boolean; {Set kondisi CPP Failure}
    function GetPC_Failure(i : Integer): Boolean;
    function GetPumpStandby(i : Integer): Boolean;
    function GetPumpStart(i : Integer): Boolean;

  public

    FHydraulicPumpID, FHydraulicPumpState : Integer;
    FHydraulicPumpOnOff : Boolean;

    constructor Create;override;
    destructor Destroy;override;

    procedure Run(const aDt : Double);override;

    property SetpointPitch : Double read FSetpointPitch write SetSetpointPitch;
    property LeverPitch : Double read FLeverPitch write SetLeverPitch;
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
  HydraulicPumpStart1 := False;
  HydraulicPumpStart2 := False;
  HydraulicPumpStart3 := False;
  HydraulicPumpStandby1 := False;
  HydraulicPumpStandby2 := False;
  HydraulicPumpAuto3 := False;
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

procedure TCPP.Run(const aDt: Double);
begin
  inherited;
  if ReadyForUse then
  begin
    FDelayer := FDelayer + aDt;
    FDelayerActualPitch := FDelayerActualPitch + aDt;

    calcActualPitch;

    if AheadPitch then
      SetPitchInManual(0.1)
    else if AsternPitch then
      SetPitchInManual(-0.1);

    calcDelayActualPitch;
  end;

  setCPPHydraulicPump(FHydraulicPumpID,FHydraulicPumpState,FHydraulicPumpOnOff);

  Failure := CPPFailure;
end;

procedure TCPP.SetActualPitch(const Value: Double);
begin
  if FActualPitch = Value then
    exit;

  FActualPitch := Value;
//  Listener.TriggerEvents(Self,epPCSCPPActualPitch, Value);
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
          HydraulicPumpStart1 := not aON;
        end;
        C_PUMP_CPP_HYDRAULIC_STOP:
        begin
          HydraulicPumpStandby1 := not aON;
          HydraulicPumpStart1 := not aON
        end;
        C_PUMP_CPP_HYDRAULIC_START:
        begin
          HydraulicPumpStandby1 := not aON;
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
          HydraulicPumpStart2 := not aON;
        end;
        C_PUMP_CPP_HYDRAULIC_STOP:
        begin
          HydraulicPumpStandby2 := not aON;
          HydraulicPumpStart2 := not aON
        end;
        C_PUMP_CPP_HYDRAULIC_START:
        begin
          HydraulicPumpStandby2 := not aON;
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
          HydraulicPumpStart3 := not aON;
        end;
        C_PUMP_CPP_HYDRAULIC_STOP:
        begin
          HydraulicPumpAuto3 := not aON;
          HydraulicPumpStart3 := not aON
        end;
        C_PUMP_CPP_HYDRAULIC_START:
        begin
          HydraulicPumpAuto3 := not aON;
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

procedure TCPP.SetHydraulicPumpStandby2(const Value: Boolean);
begin
  if FHydraulicPumpStandby2 = Value then
    Exit;

  FHydraulicPumpStandby2 := Value;
  PumpStandby[2] := Value;
  Listener.TriggerEvents(Self,epPCSCPPPumpStandby2,Value);
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

procedure TCPP.SetHydrOil(const Value: Double);
begin
  if FHydrOil = Value then
    exit;

  FHydrOil := Value;
  Listener.TriggerEvents(Self,epPCSCPPHydrOil,Value);
end;

procedure TCPP.SetLeverPitch(const Value: Double);
begin
  if FLeverPitch = Value then
    exit;

  FLeverPitch := Value;
  Listener.TriggerEvents(Self,epPCSCPPLeverPitch, Value);
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
//  if not Failure then
//  begin
    if aValue > 0 then
    begin
      if SetpointPitch < 100 then
        SetpointPitch := SetpointPitch + aValue
      else
        SetpointPitch := 100;
    end
    else
    if aValue < 0 then
    begin
      if SetpointPitch > -100 then
        SetpointPitch := SetpointPitch + aValue
      else
        SetpointPitch := -100;
    end;
//  end;
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
