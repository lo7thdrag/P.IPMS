unit uGearBox;

interface

uses uEntity, Math;

type

  TGearBox = class(TEntity)
  private
    FDelayer,
    FDelayerShaftSpeed,
    FDelayerClutchIn,
    FShaftSpeed,
    FSetpShaftSpeed,
    FDelayShaftSpeed,
    FShaftTemp,
    FPLB1,
    FPLB2,
    FThrAH,
    FThrAS,
    FLubOil,
    FCtrlOilPressIn,
    FCtrlOilPressOut,
    FLOPressInlet,
    FLOTempInlet : Double;

    FReadyForUse,
    FRemoteManual,
    FRemoteAuto,
    FClutchEngaged,
    FClutchEngagedDelay,
    FClutchAllowed,
    FShaftLocked,
    FSWFlowBearing,
    FStandbyPump,
    FPumpNotAuto,
    FPumpStanbyStart,
    FOilLevel,
    FFilter11,
    FFilter12,
    FLOPressInletLow,
    FPitchNotZero,
    FPCSClutchInterlock,
    FClutchAllowedLOP,
    FShaftDriven,
    FShaftStop,
    FShaftTrailing,

    FSafetyDeclutch,
    FFailure,
    FShaftPowerLimited,
    FClutchInterlocks : Boolean;

    FPC_ClutchInterlocks : array[0..4] of Boolean;

    procedure SetShaftSpeed(const Value : Double);
    procedure SetSetpShaftSpeed(const Value : Double);
    procedure SetDelayShaftSpeed(const Value : Double);
    procedure SetShaftTemp(const Value : Double);
    procedure SetLubOil(const Value: Double);
    procedure SetPLB1(const Value: Double);
    procedure SetPLB2(const Value: Double);
    procedure SetThrAH(const Value: Double);
    procedure SetThrAS(const Value: Double);
    procedure SetCtrlOilPressIn(const Value : Double);
    procedure SetCtrlOilPressOut(const Value : Double);
    procedure SetLOPressInlet(const Value : Double);
    procedure SetLOTempInlet(const Value : Double);

    procedure SetReadyForUse(const Value : Boolean);
    procedure SetRemoteAuto(const Value : Boolean);
    procedure SetRemoteManual(const Value : Boolean);
    procedure SetClutchEngaged(const Value : Boolean);
    procedure SetClutchEngagedDelay(const Value : Boolean);
    procedure SetClutchAllowed(const Value : Boolean);
    procedure SetStandbyPump(const Value : Boolean);
    procedure SetShaftLocked(const Value : Boolean);
    procedure SetSWFlowBearing(const Value : Boolean);
    procedure SetPumpNotAuto(const Value : Boolean);
    procedure SetPumpStandbyStart(const Value : Boolean);
    procedure SetOilLevel(const Value : Boolean);
    procedure SetFilter11(const Value : Boolean);
    procedure SetFilter12(const Value : Boolean);
    procedure SetLOPressInletLow(const Value : Boolean);
    procedure SetPitchNotZero(const Value : Boolean);
    procedure SetPCSClutchInterlock(const Value : Boolean);
    procedure SetClutchAllowedLOP(const Value : Boolean);
    procedure SetShaftDriven(const Value : Boolean);
    procedure SetShaftStop(const Value : Boolean);
    procedure SetShaftTrailing(const Value : Boolean);
    procedure SetSafetyDeclutch(const Value : Boolean);
    procedure SetFailure(const Value : Boolean);
    procedure SetShaftPowerLimited(const Value : Boolean);
    procedure SetClutchInterlocks(const Value : Boolean);

    procedure SetPC_ClutchInterlocks(i : Integer; Value : Boolean);

    procedure setClutchIn(aClutch : Boolean; const aDt : Double);
    procedure calcShaftSpeed; {Shaft Speed calculation from setpoint shaft speed}
    procedure calcDelayShaftSpeed; {Delay untuk menampilkan value di mimic}

    function ClutchInterlock: Boolean; {Set clutch interlock state}
    function SetLubOilPump : Boolean;
    function GetPC_ClutchInterlocks(i : Integer) : Boolean;

  public
    constructor Create;override;
    destructor Destroy;override;

    procedure Run(const aDt : Double);override;

    property ShaftSpeed : Double read FShaftSpeed write SetShaftSpeed;
    property SetpShaftSpeed : Double read FSetpShaftSpeed write SetSetpShaftSpeed;
    property DelayShaftSpeed : Double read FDelayShaftSpeed write SetDelayShaftSpeed;
    property ShaftTemp : Double read FShaftTemp write SetShaftTemp;
    property LubOil : Double read FLubOil write SetLubOil;
    property PLB1 : Double read FPLB1 write SetPLB1;
    property PLB2 : Double read FPLB2 write SetPLB2;
    property ThrAH : Double read FThrAH write SetThrAH;
    property ThrAS : Double read FThrAS write SetThrAS;
    property CtrlOilPressIn : Double read FCtrlOilPressIn write SetCtrlOilPressIn;
    property CtrlOilPressOut : Double read FCtrlOilPressOut write SetCtrlOilPressOut;
    property LOPressInlet : Double read FLOPressInlet write SetLOPressInlet;
    property LOTempInlet : Double read FLOTempInlet write SetLOTempInlet;

    property ReadyForUse : Boolean read FReadyForUse write SetReadyForUse;
    property RemoteAuto : Boolean read FRemoteAuto write SetRemoteAuto;
    property RemoteManual : Boolean read FRemoteManual write SetRemoteManual;
    property ClutchEngaged : Boolean read FClutchEngaged write SetClutchEngaged;
    property ClutchEngagedDelay : Boolean read FClutchEngagedDelay write SetClutchEngagedDelay;
    property ClutchAllowed : Boolean read FClutchAllowed write SetClutchAllowed;
    property ShaftLocked : Boolean read FShaftLocked write SetShaftLocked;
    property SWFlowBearing : Boolean read FSWFlowBearing write SetSWFlowBearing;
    property StandbyPump : Boolean read FStandbyPump write SetStandbyPump;
    property PumpNotAuto : Boolean read FPumpNotAuto write SetPumpNotAuto;
    property PumpStandbyStart : Boolean read FPumpStanbyStart write SetPumpStandbyStart;
    property OilLevel : Boolean read FOilLevel write SetOilLevel;
    property Filter11 : Boolean read FFilter11 write SetFilter11;
    property Filter12 : Boolean read FFilter12 write SetFilter12;
    property LOPressInletLow : Boolean read FLOPressInletLow write SetLOPressInletLow;
    property PitchNotZero : Boolean read FPitchNotZero write SetPitchNotZero;
    property PCSClutchInterlock : Boolean read FPCSClutchInterlock write SetPCSClutchInterlock;
    property ClutchAllowedLOP : Boolean read FClutchAllowedLOP write SetClutchAllowedLOP;
    property ShaftDriven : Boolean read FShaftDriven write SetShaftDriven;
    property ShaftStop : Boolean read FShaftStop write SetShaftStop;
    property ShaftTrailing : Boolean read FShaftTrailing write SetShaftTrailing;
    property SafetyDeclutch : Boolean read FSafetyDeclutch write SetSafetyDeclutch;
    property Failure : Boolean read FFailure write SetFailure;
    property ShaftPowerLimited : Boolean read FShaftPowerLimited write SetShaftPowerLimited;
    property ClutchInterlocks : Boolean read FClutchInterlocks write SetClutchInterlocks;

    property PC_ClutchInterlocks[i : Integer] : Boolean read GetPC_ClutchInterlocks write SetPC_ClutchInterlocks;
  end;


implementation

uses uDataType;

{ TMainEngine }

procedure TGearBox.calcDelayShaftSpeed;
begin
  if FDelayerShaftSpeed > 1 then
  begin
    FDelayerShaftSpeed := 0;
    DelayShaftSpeed := ShaftSpeed;
  end;
end;

procedure TGearBox.calcShaftSpeed;
begin
  if FDelayer > 0.1 then
  begin
    FDelayer := 0;
    if ShaftSpeed <> SetpShaftSpeed then
    begin
      if ShaftSpeed < SetpShaftSpeed then
        ShaftSpeed := ShaftSpeed + 1
      else
      if ShaftSpeed > SetpShaftSpeed then
        ShaftSpeed := ShaftSpeed - 1;
    end;
  end;
end;

function TGearBox.ClutchInterlock: Boolean;
begin
  if PitchNotZero or ShaftLocked or PCSClutchInterlock or ClutchAllowedLOP then
    Result := True
  else
    Result := False;
end;

constructor TGearBox.Create;
begin
  inherited;

  FDelayer := 0;
  FDelayerShaftSpeed := 0;
  FDelayerClutchIn := 0;
  FRemoteManual := True;
end;

destructor TGearBox.Destroy;
begin

  inherited;
end;

function TGearBox.GetPC_ClutchInterlocks(i: Integer): Boolean;
begin
  Result := FPC_ClutchInterlocks[i];
end;

procedure TGearBox.Run(const aDt: Double);
begin
  inherited;

  if ClutchEngagedDelay and not ClutchEngaged then
    setClutchIn(True, aDt)
  else
  if not ClutchEngagedDelay and ClutchEngaged then
    setClutchIn(False, aDt);

  FDelayer := FDelayer + aDt;
  FDelayerShaftSpeed := FDelayerShaftSpeed + aDt;

  calcShaftSpeed;

  calcDelayShaftSpeed;

  ClutchInterlocks := ClutchInterlock();

end;

procedure TGearBox.SetClutchAllowed(const Value: Boolean);
begin
  if FClutchAllowed = Value then
    exit;

  FClutchAllowed := Value;
  Listener.TriggerEvents(Self,epPCSGBClutchAllowed, Value);
end;

procedure TGearBox.SetClutchAllowedLOP(const Value: Boolean);
begin
  if FClutchAllowedLOP = Value then
    Exit;

  FClutchAllowedLOP := Value;
  PC_ClutchInterlocks[3] := Value;
//  Listener.TriggerEvents(Self,epPCSGBClutchAllowedLOP,Value);
end;

procedure TGearBox.SetClutchEngaged(const Value: Boolean);
begin
  if FClutchEngaged = Value then
    exit;

  FClutchEngaged := Value;
  Listener.TriggerEvents(Self, epPCSGBClutchEngaged, Value);
  Listener.TriggerEvents(Self, epPCSGBClutched, Value);
  Listener.TriggerEvents(Self, epPCSGBDeclutched, not Value);
end;

procedure TGearBox.SetClutchEngagedDelay(const Value: Boolean);
begin
  if FClutchEngagedDelay = Value then
    exit;

  FClutchEngagedDelay := Value;
  Listener.TriggerEvents(Self,epPCSGBClutchEngagedVCE, Value);
end;

procedure TGearBox.setClutchIn(aClutch: Boolean; const aDt: Double);
begin
  FDelayerClutchIn := FDelayerClutchIn + aDt;
  if FDelayerClutchIn > 9 then
  begin
    FDelayerClutchIn := 0;
    ClutchEngaged := aClutch;
  end;
end;

procedure TGearBox.SetClutchInterlocks(const Value: Boolean);
begin
  if FClutchInterlocks = Value then
    Exit;

  FClutchInterlocks := Value;
  Listener.TriggerEvents(Self, epPCSGBClutchInterlocks, Value);
end;

procedure TGearBox.SetCtrlOilPressIn(const Value: Double);
begin
  if FCtrlOilPressIn = Value then
    Exit;

  FCtrlOilPressIn := Value;
  Listener.TriggerEvents(Self,epPCSGBCtrlOilPressIn,Value);
end;

procedure TGearBox.SetCtrlOilPressOut(const Value: Double);
begin
  if FCtrlOilPressOut = Value then
    Exit;

  FCtrlOilPressOut := Value;
  Listener.TriggerEvents(Self,epPCSGBCtrlOilPressOut,Value);
end;

procedure TGearBox.SetDelayShaftSpeed(const Value: Double);
begin
  if FDelayShaftSpeed = Value then
    Exit;

  FDelayShaftSpeed := Value;
  Listener.TriggerEvents(Self,epPCSGBDelayShaftSpeed,Value);
end;

procedure TGearBox.SetFailure(const Value: Boolean);
begin
  if FFailure = Value then
    Exit;

  FFailure := Value;
  Listener.TriggerEvents(Self,epPCSGBFailure,Value);
end;

procedure TGearBox.SetFilter11(const Value: Boolean);
begin
  if FFilter11 = Value then
    Exit;

  FFilter11 := Value;
  Listener.TriggerEvents(Self,epPCSGBFilter11,Value);
end;

procedure TGearBox.SetFilter12(const Value: Boolean);
begin
  if FFilter12 = Value then
    Exit;

  FFilter12 := Value;
  Listener.TriggerEvents(Self,epPCSGBFilter12,Value);
end;

procedure TGearBox.SetLOPressInlet(const Value: Double);
begin
  if FLOPressInlet = Value then
    Exit;

  FLOPressInlet := Value;
  Listener.TriggerEvents(Self,epPCSGBLOPressInlet,Value);
end;

procedure TGearBox.SetLOPressInletLow(const Value: Boolean);
begin
  if FLOPressInletLow = Value then
    Exit;

  FLOPressInletLow := Value;
  Listener.TriggerEvents(Self,epPCSGBLOPressInletLow,Value);
end;

procedure TGearBox.SetLOTempInlet(const Value: Double);
begin
  if FLOTempInlet = Value then
    Exit;

  FLOTempInlet := Value;
  Listener.TriggerEvents(Self,epPCSGBLOTempInlet,Value);
end;

procedure TGearBox.SetLubOil(const Value: Double);
begin
  if FLubOil = Value then
    exit;

  FLubOil := Value;
  Listener.TriggerEvents(Self,epPCSGBLubOil,Value);
end;

function TGearBox.SetLubOilPump: Boolean;
begin
  if (ShaftSpeed < 92) then
  begin
    Result := True;
  end
  else if (ShaftSpeed > 113) then
  begin
    Result := False;
  end;
end;

procedure TGearBox.SetOilLevel(const Value: Boolean);
begin
  if FOilLevel = Value then
    Exit;

  FOilLevel := Value;
  Listener.TriggerEvents(Self,epPCSGBOilLevel,Value);
end;

procedure TGearBox.SetPCSClutchInterlock(const Value: Boolean);
begin
  if FPCSClutchInterlock = Value then
    Exit;

  FPCSClutchInterlock := Value;
  PC_ClutchInterlocks[2] := Value;
  Listener.TriggerEvents(Self,epPCSGBPCSClutchInterlock,Value);
end;

procedure TGearBox.SetPC_ClutchInterlocks(i: Integer; Value: Boolean);
begin
  FPC_ClutchInterlocks[i] := Value;
end;

procedure TGearBox.SetPitchNotZero(const Value: Boolean);
begin
  if FPitchNotZero = Value then
    Exit;

  FPitchNotZero := Value;
  FPC_ClutchInterlocks[0] := Value;
  Listener.TriggerEvents(Self,epPCSGBPitchNotZero,Value);
end;

procedure TGearBox.SetPLB1(const Value: Double);
begin
  if FPLB1 = Value then
    exit;

  FPLB1 := Value;
  Listener.TriggerEvents(Self,epPCSGBPLB1, Value);
end;

procedure TGearBox.SetPLB2(const Value: Double);
begin
  if FPLB2 = Value then
    exit;

  FPLB2 := Value;
  Listener.TriggerEvents(Self,epPCSGBPLB2, Value);
end;

procedure TGearBox.SetPumpNotAuto(const Value: Boolean);
begin
  if FPumpNotAuto = Value then
    Exit;

  FPumpNotAuto := Value;
  Listener.TriggerEvents(Self,epPCSGBPumpNotAuto,Value);
end;

procedure TGearBox.SetPumpStandbyStart(const Value: Boolean);
begin
  if FPumpStanbyStart = Value then
    Exit;

  FPumpStanbyStart := Value;
  Listener.TriggerEvents(Self,epPCSGBPumpStandbyStart,Value);
end;

procedure TGearBox.SetReadyForUse(const Value: Boolean);
begin
  if FReadyForUse = Value then
    Exit;

  FReadyForUse := Value;
  Listener.TriggerEvents(Self,epPCSGBReadyForUse,Value);
end;

procedure TGearBox.SetRemoteAuto(const Value: Boolean);
begin
  if FRemoteAuto = Value then
    Exit;

  FRemoteAuto := Value;
  Listener.TriggerEvents(Self,epPCSGBRemoteAuto, Value);
end;

procedure TGearBox.SetRemoteManual(const Value: Boolean);
begin
  if FRemoteManual = Value then
    Exit;

  FRemoteManual := Value;
  Listener.TriggerEvents(Self,epPCSGBRemoteManual, Value);
end;

procedure TGearBox.SetSafetyDeclutch(const Value: Boolean);
begin
  if FSafetyDeclutch = Value then
    Exit;

  FSafetyDeclutch := Value;
  Listener.TriggerEvents(Self,epPCSGBSafetyDeclutch,Value);
end;

procedure TGearBox.SetSetpShaftSpeed(const Value: Double);
begin
  if FSetpShaftSpeed = Value then
    Exit;

  FSetpShaftSpeed := Value;
  Listener.TriggerEvents(Self, epPCSGBSetpShaftSpeed, Value);
end;

procedure TGearBox.SetShaftDriven(const Value: Boolean);
begin
  if FShaftDriven = Value then
    Exit;

  FShaftDriven := Value;
  Listener.TriggerEvents(Self,epPCSLeverShaftDriven,Value);
end;

procedure TGearBox.SetShaftLocked(const Value: Boolean);
begin
  if FShaftLocked = Value then
    Exit;

  FShaftLocked := Value;
  PC_ClutchInterlocks[1] := Value;
  Listener.TriggerEvents(Self,epPCSGBShaftLocked,Value);
end;

procedure TGearBox.SetShaftPowerLimited(const Value: Boolean);
begin
  if FShaftPowerLimited = Value then
    Exit;

  FShaftPowerLimited := Value;
  Listener.TriggerEvents(Self,epPCSGBShaftPowerLimited,Value);
end;

procedure TGearBox.SetShaftSpeed(const Value: Double);
begin
  if FShaftSpeed = Value then
    Exit;

  FShaftSpeed := Value;
//  Listener.TriggerEvents(Self,epPCSGBShaftSpeed,Value);
end;

procedure TGearBox.SetShaftStop(const Value: Boolean);
begin
  if FShaftStop = Value then
    Exit;

  FShaftStop := Value;
  Listener.TriggerEvents(Self,epPCSLeverShaftStop,Value);
end;

procedure TGearBox.SetShaftTemp(const Value: Double);
begin
  if FShaftTemp = Value then
    Exit;

  FShaftTemp := Value;
  Listener.TriggerEvents(Self,epPCSGBShaftTemp,Value);
end;

procedure TGearBox.SetShaftTrailing(const Value: Boolean);
begin
  if FShaftTrailing = Value then
    Exit;

  FShaftTrailing := Value;
  Listener.TriggerEvents(Self,epPCSLeverShaftTrailing,Value);
end;

procedure TGearBox.SetStandbyPump(const Value: Boolean);
begin
  if FStandbyPump = Value then
    exit;

  FStandbyPump := Value;
  Listener.TriggerEvents(Self,epPCSGBStandbyPump,Value);
end;

procedure TGearBox.SetSWFlowBearing(const Value: Boolean);
begin
  if FSWFlowBearing = Value then
    Exit;

  FSWFlowBearing := Value;
  Listener.TriggerEvents(Self,epPCSGBSWFlowBearing,Value);
end;

procedure TGearBox.SetThrAH(const Value: Double);
begin
  if FThrAH = Value then
    exit;

  FThrAH := Value;
  Listener.TriggerEvents(Self,epPCSGBThrAH, Value);
end;

procedure TGearBox.SetThrAS(const Value: Double);
begin
  if FThrAS = Value then
    exit;

  FThrAS := Value;
  Listener.TriggerEvents(Self,epPCSGBTHrAS, Value);
end;

end.
