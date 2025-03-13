unit uPropulsionSystem;

interface

uses uCommonSystem, uMainEngine, uGearBox, uCPP, uEntity, uLIstener, Classes, uDataType, Math;

type
  TPropulsionSystem = class(TCommonSystem)
  public
    //Get Entity (Prince)
    ME : array [0..1] of TMainEngine;
    GB : array [0..1] of TGearBox;
    CPP: array [0..1] of TCPP;

    procedure Run(const aDt : Double); override;

    function getMainEngine(aIdent : string) : TMainEngine;
    function getGearBox(aIdent : string) : TGearBox;
    function getCPP(aIdent : string) : TCPP;
    //---

    constructor Create;override;
    destructor Destroy;override;

    procedure NetEvent_PCSCommand(apRec: PAnsiChar; aSize: Word);

    {Kontrol untuk panel PCS touch screen dengan Engine}
    procedure RunningStart(aPortStaboard : String);
    procedure StoppedStop(aPortStaboard : String);
    procedure Remote(aPortStarboard : string; aOnOff : Boolean);
    procedure Clutch(aPortStaboard : string; aValue : Boolean);
    procedure GeneralControl(aControl : Byte; aOnOff : Boolean);
    procedure ModeControl(aMode : Boolean);
    procedure MCRBridge(aPortStarboard : string; aControl : Boolean);
    {--}

    {Kontrol untuk tombol-tombol pada Throttle dengan Engine}
    procedure ShaftTrailing(aPortStaboard : String);
    procedure EmergencyStop(aPortStaboard : String);
    procedure TransferOverride(aPortStaboard : String);

//    procedure LeverControl(aControl : Byte; aValue : Integer);
    {--}

    procedure RemoteToMCR(aPortStarboard: string; Value : Boolean); {Prosedur pengalihan kontrol dari LCP ke MCR}
    procedure SetRudder(aPortStaboard: string; aValue : Integer); {Set Value Rudder dari instruktur ke servo}

    {Kontrol untuk hardware CPP Hydraulic Pump}
    procedure CPPHydraulicPump(aPortStaboard, PumpID, StateID: Integer; Value: Boolean);

  private
    FDelayedRun, FDelayedRunPS, FDelayedRunSB : double;
    FCrashStop, FTransitMode, FManouveringMode : Boolean;
    valueRudderPS, valueRudderSB : Integer;

    procedure SetTransitMode(const aValue : Boolean);
    procedure SetManouveringMode(const aValue : Boolean);

    {Mode yang digunakan saat Remote Auto dan menggunakan Throttle}
    procedure ModeManoeuvring(aPortStarboard: string; aValue : Integer);
    procedure ModeTransit(aPortStarboard : String; aValue : Integer);
    procedure ModeMaxFSR(aPortStarboard : string; aValue : Integer);
    procedure ModeTrail(aPortStarboard : string; aValue : Integer);

    procedure CrashStop; {Perubahan mode dari Transit ke Manouvering secara mendadak}

    {Set nilai random untuk value pada Propulsion (Temperature & Pressure)}
    procedure setPropulsionValue(aPortStarboard: string; aRPM : Double);
    procedure setGearboxTempValue(aPortStarboard : string; aTemp : Double);
    procedure setGearboxPressValue(aPortStarboard : string; aPress : Double);
    procedure setCPPTempValue(aPortStarboard : string; aTemp : Double);
    procedure setCPPPressValue(aPortStarboard : string; aPress : Double);
    {--}

    {Update state and value saat Engine Running}
    procedure setClutchAllowed;
    procedure setClutchInterlock;
    procedure setShaftSpeed;
    procedure setEmergencyStop;
    procedure setShaftTrailing;
    {--}

    {Procedure di LCP}
    procedure setLCPCondition;

    {Set failure state untuk Propulsion}
    function MainEngineFailure(aPortStarboard : string) : Boolean;
    function GearboxFailure(aPortStarboard : string) : Boolean;
    {--}

    function clutchAllowedCheck(aPortStarboard : string) : Boolean;

    {Shaft Speed Calculation from Actual Speed}
    function calcShaftSpeed(aPortStarboard : string) : Double;

    {Standby Pump Gearbox Control}
    function setStandbyPumpGB(aPortStarboard : string) : Boolean;

  public
    FEmergencyStopPS, FEmergencyStopSB : Boolean;

    property TransitMode : Boolean read FTransitMode write SetTransitMode;
    property ManouveringMode : Boolean read FManouveringMode write SetManouveringMode;

  const
    {Konstanta untuk nilai Combinatory Curve}
    C_RPM_Ahead_Manouvring : array[0..9] of Double = (450, 550, 650, 740, 820, 900, 980, 1050, 1050, 1050);
    C_RPM_Astern_Manouvring : array[0..9] of Double = (440, 510, 580, 650, 720, 780, 840, 910, 980, 1040);
    C_RPM_Transit : array[0..10] of Double = (400, 400, 400, 400, 420, 550, 680, 800, 920, 1050, 1050);
    C_RPM_Trail : array[0..10] of Double = (400, 400, 400, 400, 400, 500, 600, 700, 800, 900, 900);
    C_RPM_MaxFSR : array[0..10] of Double = (400, 400, 400, 400, 420, 550, 680, 800, 920, 1050, 1084);
    C_Pitch_Ahead_Manouvring : array[0..9] of Double = (8, 25, 42, 57, 73, 74, 74, 74, 74, 74);
    C_Pitch_Astern_Manouvring : array[0..9] of Double = (-5, -16, -26, -36, -46, -57, -68, -79, -90, -100);
    C_Pitch_Transit : array[0..10] of Double = (0, 20, 55, 92, 92, 92, 92, 92, 92, 92, 92);
    C_Pitch_Trail : array[0..10] of Double = (0, 20, 55, 92, 92, 92, 92, 92, 92, 92, 92);
    C_Pitch_MaxFXR : array[0..10] of Double = (0, 20, 55, 92, 92, 92, 92, 92, 92, 92, 92);

  end;

implementation


{ TPCSSystem }

procedure TPropulsionSystem.CrashStop;
begin
  if FCrashStop then
  begin
    ME[0].SetPointSpeed := 400;
    ME[1].SetPointSpeed := 400;
//    ME[0].LeverSpeed := 400;
//    ME[1].LeverSpeed := 400;
    CPP[0].SetpointPitch := 0;
    CPP[1].SetpointPitch := 0;
    CPP[0].LeverPitch := 0;
    CPP[1].LeverPitch := 0;

    if (ME[0].ActualSpeed = 400) and ((CPP[0].ActualPitch > -1) and (CPP[0].ActualPitch < 1)) then
    begin
      TransitMode := False;
      ManouveringMode := True;
      FCrashStop := False;
      ModeManoeuvring(C_PCS_PORTS,ME[0].LeverControl);
    end;

    if (ME[1].ActualSpeed = 400) and ((CPP[1].ActualPitch > -1) and (CPP[1].ActualPitch < 1)) then
    begin
      TransitMode := False;
      ManouveringMode := True;
      FCrashStop := False;
      ModeManoeuvring(C_PCS_STARBOARD,ME[1].LeverControl);
    end;
  end;
end;

constructor TPropulsionSystem.Create;
var
  MainEngine : TMainEngine;
  GearBox : TGearBox;
  aCpp : TCPP;

  i, j, k : integer;
begin
  inherited;
  { create mainengine }
  for I := 0 to Length(C_MAINENGINE_ID) - 1 do
  begin
    MainEngine := TMainEngine.Create;
    MainEngine.Identifier := C_MAINENGINE_ID[i];
    addEntity(MainEngine);
  end;

  { create gearbox }
  for I := 0 to Length(C_GEARBOX_ID) - 1 do
  begin
    GearBox := TGearBox.Create;
    GearBox.Identifier := C_GEARBOX_ID[i];
    addEntity(GearBox);
  end;

  { create cpp }
  for I := 0 to Length(C_CPP_ID) - 1 do
  begin
    aCpp := TCPP.Create;
    aCpp.Identifier := C_CPP_ID[i];
    addEntity(aCpp);
  end;

  { moved here from run procedure }
  for i := 0 to Length(C_MAINENGINE_ID) - 1 do
    ME[i] := getMainEngine(C_MAINENGINE_ID[i]);
  for j := 0 to Length(C_GEARBOX_ID) - 1 do
    GB[j] := getGearBox(C_GEARBOX_ID[j]);
  for k := 0 to Length(C_CPP_ID) - 1 do
    CPP[k] := getCPP(C_CPP_ID[k]);

  valueRudderPS := 0;
  valueRudderSB := 0;
  FDelayedRunPS := 0;
  FDelayedRunSB := 0;
end;

destructor TPropulsionSystem.Destroy;
begin

  inherited;
end;


procedure TPropulsionSystem.EmergencyStop(aPortStaboard: String);
begin
  if aPortStaboard = C_PCS_ME_PORTS then
  begin
    StoppedStop(C_PCS_ME_PORTS);
    if ME[0].ActualSpeed < 400 then
      Clutch(C_PCS_GB_PORTS,False);
    if not (ME[0].EngineRun and GB[0].ClutchEngaged) and (ME[0].ActualSpeed = 0)  then
    begin
      Remote(C_PCS_ME_PORTS, False);
      FEmergencyStopPS := False;
      if ME[0].TankIsEmpty then
        ME[0].TankIsEmpty := False;
    end;
  end
  else
  if aPortStaboard = C_PCS_ME_STARBOARD then
  begin
    StoppedStop(C_PCS_ME_STARBOARD);
    if ME[1].ActualSpeed < 400 then
      Clutch(C_PCS_GB_STARBOARD,False);
    if not (ME[1].EngineRun and GB[1].ClutchEngaged) and (ME[1].ActualSpeed = 0) then
    begin
      Remote(C_PCS_ME_STARBOARD, False);
      FEmergencyStopSB := False;
      if ME[1].TankIsEmpty then
        ME[1].TankIsEmpty := False;
    end;
  end;
end;

function TPropulsionSystem.GearboxFailure(aPortStarboard: string): Boolean;
begin
  Result := False;
end;

procedure TPropulsionSystem.GeneralControl(aControl: Byte; aOnOff: Boolean);
begin
  case aControl of
    C_ORD_CTRL_ALARMACCEPT:
      Listener.TriggerEvents(Self,epPCSCtrlAlarmAccept,aOnOff);

    C_ORD_CTRL_STOPHORN:
      Listener.TriggerEvents(Self,epPCSCtrlStopHorn,aOnOff);

    C_ORD_CTRL_LAMPTEST:
      Listener.TriggerEvents(Self,epPCSCtrlLamptTest,aOnOff);

    C_ORD_CTRL_BACKGROUND_LAMP:
      Listener.TriggerEvents(Self,epPCSCtrlBackgroundLamp,aOnOff);
  end;
end;

function TPropulsionSystem.getCPP(aIdent: string): TCPP;
begin
  result := Entities.Get(aIdent) as TCPP;
end;

function TPropulsionSystem.getGearBox(aIdent: string): TGearBox;
begin
  result := Entities.Get(aIdent) as TGearBox;
end;

function TPropulsionSystem.getMainEngine(aIdent: string): TMainEngine;
begin
  result := Entities.Get(aIdent) as TMainEngine;
end;

procedure TPropulsionSystem.SetRudder(aPortStaboard: string; aValue: Integer);
begin
  if aPortStaboard = C_PCS_ME_PORTS then
  begin
    if valueRudderPS = aValue then
      Exit;

    valueRudderPS := aValue;
    Listener.TriggerEvents(Self, epRudderValuePS, aValue);
  end
  else
  if aPortStaboard = C_PCS_ME_STARBOARD then
  begin
    if valueRudderSB = aValue then
      Exit;

    valueRudderSB := aValue;
    Listener.TriggerEvents(Self, epRudderValueSB, aValue);
  end;
end;

procedure TPropulsionSystem.setShaftSpeed;
begin
  GB[0].SetpShaftSpeed := calcShaftSpeed(C_PCS_GB_PORTS);
  GB[1].SetpShaftSpeed := calcShaftSpeed(C_PCS_GB_STARBOARD);
end;

procedure TPropulsionSystem.setShaftTrailing;
begin
//  if ME[0].TransitMode then

  if GB[0].ShaftTrailing and ME[1].EngineRun and GB[1].ClutchEngaged then
  begin
    GB[0].SetpShaftSpeed := RandomRange(40,45);
    CPP[0].SetpointPitch := CPP[1].SetpointPitch;
  end
  else
  if GB[1].ShaftTrailing and ME[0].EngineRun and GB[0].ClutchEngaged then
  begin
    GB[1].SetpShaftSpeed := RandomRange(40,45);
    CPP[1].SetpointPitch := CPP[0].SetpointPitch;
  end
  else
  if GB[0].ShaftTrailing and ME[1].EngineRun and not GB[1].ClutchEngaged then
  begin
    GB[0].SetpShaftSpeed := 0;
    CPP[0].SetpointPitch := 0;
  end
  else
  if GB[1].ShaftTrailing and ME[0].EngineRun and not GB[0].ClutchEngaged then
  begin
    GB[1].SetpShaftSpeed := 0;
    CPP[1].SetpointPitch := 0;
  end;
end;

function TPropulsionSystem.setStandbyPumpGB(aPortStarboard: string): Boolean;
begin
  Result := False;
  if aPortStarboard = C_PCS_GB_PORTS then
  begin
    if (GB[0].LOPressInlet >= 0.9) and (GB[0].LOPressInlet <= 3.9) and
      (ME[0].ActualSpeed >= 400) and (ME[0].ActualSpeed <= 500) then
      Result := True
    else
      Result := False;
  end
  else if aPortStarboard = C_PCS_GB_STARBOARD then
  begin
    if (GB[1].LOPressInlet >= 0.9) and (GB[1].LOPressInlet <= 3.9) and
      (ME[1].ActualSpeed >= 400) and (ME[1].ActualSpeed <= 500) then
      Result := True
    else
      Result := False;
  end;
end;

procedure TPropulsionSystem.SetTransitMode(const aValue: Boolean);
begin
  if FTransitMode = aValue then
    Exit;

  FTransitMode := aValue;
  Listener.TriggerEvents(Self,epPCSMETransitMode,aValue);
end;

procedure TPropulsionSystem.ShaftTrailing(aPortStaboard: String);
begin
  if TransitMode then
  begin
    if aPortStaboard = C_PCS_GB_PORTS then
    begin
      if not ME[0].EngineRun and not GB[0].ShaftLocked and ME[1].EngineRun and (GB[1].ClutchEngaged or GB[1].ShaftDriven) then
      begin
        GB[0].ShaftTrailing := True;
        GB[0].ShaftDriven := False;
        GB[0].ShaftStop := False;
      end;
    end
    else
    if aPortStaboard = C_PCS_GB_STARBOARD then
    begin
      if not ME[1].EngineRun and not GB[1].ShaftLocked and ME[0].EngineRun and (GB[0].ClutchEngaged or GB[0].ShaftDriven) then
      begin
        GB[1].ShaftTrailing := True;
        GB[1].ShaftDriven := False;
        GB[1].ShaftStop := False;
      end;
    end;
  end;
end;

procedure TPropulsionSystem.setCPPPressValue(aPortStarboard: string; aPress: Double);
begin
  if aPortStarboard = C_PCS_PORTS then
  begin
    CPP[0].ServoOil := Random(5)/10 + aPress;
    CPP[0].StaticHub := Random(5)/10 + aPress;
  end
  else
  if aPortStarboard = C_PCS_STARBOARD then
  begin
    CPP[1].ServoOil := Random(5)/10 + aPress;
    CPP[1].StaticHub := Random(5)/10 + aPress;
  end;
end;

procedure TPropulsionSystem.setCPPTempValue(aPortStarboard: string;
  aTemp: Double);
begin
  if aPortStarboard = C_PCS_PORTS then
  begin
    CPP[0].HydrOil := Random(5) + aTemp;
  end
  else
  if aPortStarboard = C_PCS_STARBOARD then
  begin
    CPP[1].HydrOil := Random(5) + aTemp;
  end;
end;

procedure TPropulsionSystem.setGearboxPressValue(aPortStarboard: string;
  aPress: Double);
begin
  if aPortStarboard = C_PCS_PORTS then
  begin
    GB[0].CtrlOilPressIn := Random(10)/10 + aPress;
    GB[0].CtrlOilPressOut := Random(10)/10 + aPress;
    GB[0].LOPressInlet := Random(10)/10 + aPress;
  end
  else
  if aPortStarboard = C_PCS_STARBOARD then
  begin
    GB[1].CtrlOilPressIn := Random(10)/10 + aPress;
    GB[1].CtrlOilPressOut := Random(10)/10 + aPress;
    GB[1].LOPressInlet := Random(10)/10 + aPress;
  end;
end;

procedure TPropulsionSystem.setGearboxTempValue(aPortStarboard: string;
  aTemp: Double);
begin
  if aPortStarboard = C_PCS_PORTS then
  begin
    GB[0].PLB1 := (Random(7)+aTemp);
    GB[0].PLB2 := (Random(7)+aTemp);
    GB[0].ThrAH := (Random(7)+aTemp);
    GB[0].ThrAS := (Random(7)+aTemp);
    GB[0].LOTempInlet := (Random(10)+aTemp);
    if aTemp <= 30 then
      GB[0].ShaftTemp := (Random(10)+aTemp)
    else if (aTemp > 30) and GB[0].ClutchEngaged then
      GB[0].ShaftTemp := (Random(10)+aTemp)+30;
  end
  else
  if aPortStarboard = C_PCS_STARBOARD then
  begin
    GB[1].PLB1 := (Random(7)+aTemp);
    GB[1].PLB2 := (Random(7)+aTemp);
    GB[1].ThrAH := (Random(7)+aTemp);
    GB[1].ThrAS := (Random(7)+aTemp);
    GB[1].LOTempInlet := (Random(10)+aTemp);
    if aTemp <= 30 then
      GB[1].ShaftTemp := (Random(10)+aTemp)
    else if (aTemp > 30) and GB[1].ClutchEngaged then
      GB[1].ShaftTemp := (Random(10)+aTemp)+30;
  end;
end;

procedure TPropulsionSystem.setLCPCondition;
begin
  if ME[0].PrimLOPumpAuto then
    ME[0].PrimLOPump := True;

  if ME[1].PrimLOPumpAuto then
    ME[1].PrimLOPump := True;

  if ME[0].PreHeatingPumpAuto then
    ME[0].PreHeatingPump := True;

  if ME[1].PreHeatingPumpAuto then
    ME[1].PreHeatingPump := True;

  if ME[0].HeaterAuto then
    ME[0].Heater := True;

  if ME[1].HeaterAuto then
    ME[1].Heater := True;
end;

procedure TPropulsionSystem.SetManouveringMode(const aValue: Boolean);
begin
  if FManouveringMode = aValue then
    Exit;

  FManouveringMode := aValue;
  Listener.TriggerEvents(Self,epPCSMEManouveringMode,aValue);
end;

function TPropulsionSystem.calcShaftSpeed(aPortStarboard: string): Double;
begin
  result := 0;
  if aPortStarboard = C_PCS_GB_PORTS then
  begin
    if GB[0].ClutchEngaged and not GB[0].ShaftTrailing then
    begin
      Result := Round(ME[0].ActualSpeed/4.35);
    end;
  end
  else
  if aPortStarboard = C_PCS_GB_STARBOARD then
  begin
    if GB[1].ClutchEngaged and not GB[1].ShaftTrailing then
    begin
      Result := Round(ME[1].ActualSpeed/4.35);
    end;
  end;
end;

function TPropulsionSystem.clutchAllowedCheck(aPortStarboard: string): Boolean;
begin
  Result := False;
  if aPortStarboard = C_PCS_GB_PORTS then
  begin
    if ((ME[0].ActualSpeed >= 400) and (ME[0].ActualSpeed <= 450)) and
      not CPP[0].PitchNotZero and not GB[0].ShaftLocked and not GB[0].ClutchEngaged then
      Result := True
    else
      Result := False;
  end
  else
  if aPortStarboard = C_PCS_GB_STARBOARD then
  begin
    if ((ME[1].ActualSpeed >= 400) and (ME[1].ActualSpeed <= 450)) and
      not CPP[1].PitchNotZero and not GB[1].ShaftLocked and not GB[1].ClutchEngaged then
      Result := True
    else
      Result := False;
  end;
end;

procedure TPropulsionSystem.Clutch(aPortStaboard : string; aValue: Boolean);
begin
  if aPortStaboard = C_PCS_GB_PORTS then
  begin
    if ((CPP[0].SetpointPitch > -1) and (CPP[0].SetpointPitch < 1) and (not GB[0].ShaftLocked) and
      (ME[0].ActualSpeed <= 450)) or FEmergencyStopPS then
    begin
      GB[0].ClutchEngagedDelay := aValue;
      if GB[0].ClutchEngagedDelay then
      begin
        GB[0].ShaftDriven := True;
        GB[0].ShaftStop := False;
        GB[0].ShaftTrailing := False;
      end
      else if not GB[0].ClutchEngagedDelay then
      begin
        GB[0].ShaftStop := True;
        GB[0].ShaftDriven := False;
        CPP[0].SetpointPitch := 0;
        if GB[0].ShaftTrailing then
        begin
          GB[0].SetpShaftSpeed := 0;
          GB[0].ShaftTrailing := False;
        end;
      end;
    end;
  end
  else
  if aPortStaboard = C_PCS_GB_STARBOARD then
  begin
    if ((CPP[1].SetpointPitch > -1) and (CPP[1].SetpointPitch < 1) and (not GB[1].ShaftLocked) and
      (ME[1].ActualSpeed <= 450)) or FEmergencyStopSB then
    begin
      GB[1].ClutchEngagedDelay := aValue;
      if GB[1].ClutchEngagedDelay then
      begin
        GB[1].ShaftDriven := True;
        GB[1].ShaftStop := False;
        GB[1].ShaftTrailing := False;
      end
      else if not GB[1].ClutchEngagedDelay then
      begin
        GB[1].ShaftStop := True;
        GB[1].ShaftDriven := False;
        CPP[1].SetpointPitch := 0;
        if GB[1].ShaftTrailing then
        begin
          GB[1].SetpShaftSpeed := 0;
          GB[1].ShaftTrailing := False;
        end;
      end;
    end;
  end;
end;

procedure TPropulsionSystem.CPPHydraulicPump(aPortStaboard, PumpID,
  StateID: Integer; Value: Boolean);
begin
  if aPortStaboard = 1 then
  begin
    CPP[0].FHydraulicPumpID := PumpID;
    CPP[0].FHydraulicPumpState := StateID;
    CPP[0].FHydraulicPumpOnOff := Value;
  end
  else if aPortStaboard = 2 then
  begin
    CPP[1].FHydraulicPumpID := PumpID;
    CPP[1].FHydraulicPumpState := StateID;
    CPP[1].FHydraulicPumpOnOff := Value;
  end;
end;

procedure TPropulsionSystem.Remote(aPortStarboard: string; aOnOff: Boolean);
begin
  if (aPortStarboard = C_PCS_ME_PORTS) or (aPortStarboard = C_PCS_CPP_PORTS) or
  (aPortStarboard = C_PCS_GB_PORTS) then
  begin
    ME[0].RemoteAuto := aOnOff;
    ME[0].RemoteManual := not aOnOff;
    CPP[0].Remote := aOnOff;
    GB[0].RemoteAuto := aOnOff;
    GB[0].RemoteManual := not aOnOff;

    if ME[0].RemoteAuto and not TransitMode then
      ManouveringMode := True;
  end
  else
  if (aPortStarboard = C_PCS_ME_STARBOARD) or (aPortStarboard = C_PCS_CPP_STARBOARD) or
  (aPortStarboard = C_PCS_GB_STARBOARD) then
  begin
    ME[1].RemoteAuto := aOnOff;
    ME[1].RemoteManual := not aOnOff;
    CPP[1].Remote := aOnOff;
    GB[1].RemoteAuto := aOnOff;
    GB[1].RemoteManual := not aOnOff;

    if ME[1].RemoteAuto and not TransitMode then
      ManouveringMode := True;
  end;
end;

procedure TPropulsionSystem.RemoteToMCR(aPortStarboard: string; Value: Boolean);
begin
  if aPortStarboard = C_PCS_ME_PORTS then
  begin
    ME[0].MCRControl := Value;
    ME[0].LocalControl := not Value;
    Remote(aPortStarboard, False);
  end
  else if aPortStarboard = C_PCS_ME_STARBOARD then
  begin
    ME[1].MCRControl := Value;
    ME[1].LocalControl := not Value;
    Remote(aPortStarboard, False);
  end;
end;

procedure TPropulsionSystem.Run(const aDt: Double);
begin
  inherited;

  if ManouveringMode then
  begin
    ModeManoeuvring(C_PCS_ME_PORTS, ME[0].LeverControl);
    ModeManoeuvring(C_PCS_ME_STARBOARD, ME[1].LeverControl);
  end
  else if TransitMode then
  begin
    ModeTransit(C_PCS_ME_PORTS, ME[0].LeverControl);
    ModeTransit(C_PCS_ME_STARBOARD, ME[1].LeverControl);
  end;

  //Prosedur Crash Stop
  CrashStop;

  //Emergency Stop
  setEmergencyStop;

  //Clutch Interlock
  setClutchInterlock;

  //Clutch Allowed
  setClutchAllowed;

  //Shaft Speed Calculation
  setShaftSpeed;

  //Shaft Trailing
  setShaftTrailing;

  FDelayedRun := FDelayedRun + aDt;
  FDelayedRunPS := FDelayedRunPS + aDt;
  FDelayedRunSB := FDelayedRunSB + aDt;

  // run every 10 seconds
  if FDelayedRun > 10 then
  begin
    FDelayedRun := 0;



    setLCPCondition;
  end;

  // run every 13 seconds
  if FDelayedRunPS > 13 then
  begin
    FDelayedRunPS := 0;

    setPropulsionValue(C_PCS_PORTS,ME[0].ActualSpeed);
  end;

  // run every 16 seconds
  if FDelayedRunSB > 16 then
  begin
    FDelayedRunSB := 0;

    setPropulsionValue(C_PCS_STARBOARD,ME[1].ActualSpeed);
  end;

  {Alarm Safeties Stop}
  if ME[0].SafetiesStops then
    EmergencyStop(C_PCS_ME_PORTS);
  if ME[1].SafetiesStops then
    EmergencyStop(C_PCS_ME_STARBOARD);

end;

procedure TPropulsionSystem.RunningStart(aPortStaboard: String);
begin
  if aPortStaboard = C_PCS_ME_PORTS then
  begin
    if ((ME[0].ReadyForUse) and (not ME[0].StartingInterlocks) and (not GB[0].ClutchEngaged) and (GB[0].ReadyForUse)) or
      ME[0].PreStartInhibition then
    begin
      ME[0].EngineRun := True;
      ME[0].EmergencyStop := False;
      ME[0].SetPointSpeed := 400;
    end;
  end
  else
  if aPortStaboard = C_PCS_ME_STARBOARD then
  begin
    if ((ME[1].ReadyForUse) and (not ME[1].StartingInterlocks) and (not GB[1].ClutchEngaged) and (GB[1].ReadyForUse)) or
      ME[1].PreStartInhibition then
    begin
      ME[1].EngineRun := True;
      ME[1].EmergencyStop := False;
      ME[1].SetPointSpeed := 400;
    end;
  end;
end;

procedure TPropulsionSystem.setClutchAllowed;
begin
  GB[0].ClutchAllowed := ClutchAllowedCheck(C_PCS_GB_PORTS);
  GB[1].ClutchAllowed := ClutchAllowedCheck(C_PCS_GB_STARBOARD);
end;

procedure TPropulsionSystem.setClutchInterlock;
begin
  if GB[0].ClutchInterlocks then
  begin
    if GB[0].ClutchEngaged then
      Clutch(C_PCS_GB_PORTS,False);
  end;
  if GB[1].ClutchInterlocks then
  begin
    if GB[1].ClutchEngaged then
      Clutch(C_PCS_GB_STARBOARD,False);
  end;
end;

procedure TPropulsionSystem.setEmergencyStop;
begin
  if FEmergencyStopPS or ME[0].TankIsEmpty then
    EmergencyStop(C_PCS_ME_PORTS);

  if FEmergencyStopSB or ME[1].TankIsEmpty then
      EmergencyStop(C_PCS_ME_STARBOARD);
end;

procedure TPropulsionSystem.setPropulsionValue(aPortStarboard: string;
  aRPM: Double);
begin
  if aRPM >= 1000 then
  begin
    setGearboxTempValue(aPortStarboard,40);
    setGearboxPressValue(aPortStarboard,2);
    setCPPTempValue(aPortStarboard,40);
    setCPPPressValue(aPortStarboard,10);
  end
  else
  if (aRPM >= 400) and (aRPM < 1000) then
  begin
    setGearboxTempValue(aPortStarboard,35);
    setGearboxPressValue(aPortStarboard,1);
    setCPPTempValue(aPortStarboard,35);
    setCPPPressValue(aPortStarboard,8);
  end
  else
  if (aRPM < 400) then
  begin
    setGearboxTempValue(aPortStarboard,30);
    setGearboxPressValue(aPortStarboard,0);
    setCPPTempValue(aPortStarboard,30);
    setCPPPressValue(aPortStarboard,5);
  end;
end;

procedure TPropulsionSystem.StoppedStop(aPortStaboard: String);
begin
  if aPortStaboard = C_PCS_ME_PORTS then
  begin
    ME[0].EngineRun := False;
    ME[0].SetPointSpeed := 0;
    CPP[0].SetpointPitch := 0;

    ME[0].RemoteAuto := False;
    ME[0].RemoteManual := True;
  end
  else
  if aPortStaboard = C_PCS_ME_STARBOARD then
  begin
    ME[1].EngineRun := False;
    ME[1].SetPointSpeed := 0;
    CPP[1].SetpointPitch := 0;

    ME[1].RemoteAuto := False;
    ME[1].RemoteManual := True;
  end;

  if not ME[0].EngineRun and not ME[1].EngineRun then
  begin
    TransitMode := False;
    ManouveringMode := False;
  end;
end;

procedure TPropulsionSystem.ModeControl(aMode: Boolean);
begin
  ManouveringMode := aMode;
  TransitMode := not aMode;
end;

procedure TPropulsionSystem.ModeManoeuvring(aPortStarboard: string;
  aValue: Integer);
var
  i, LeverPS, LeverSB : Integer;
begin
  if (aPortStarboard = C_PCS_ME_PORTS) then
  begin
    if LeverPS = aValue then
      Exit;

    LeverPS := aValue;

    if ME[0].RemoteAuto and ME[0].EngineRun and CPP[0].Remote then
    begin
      if aValue > 0 then
      begin
        for i := 0 to Length(C_RPM_Ahead_Manouvring)-1 do
        begin
          if aValue = i+1 then
          begin
            ME[0].LeverSpeed := C_RPM_Ahead_Manouvring[i];
            ME[0].SetPointSpeed := C_RPM_Ahead_Manouvring[i];
            CPP[0].LeverPitch := C_Pitch_Ahead_Manouvring[i];
            CPP[0].SetpointPitch := C_Pitch_Ahead_Manouvring[i];
          end;
        end;
      end
      else if aValue < 0 then
      begin
        for i := 0 to Length(C_RPM_Astern_Manouvring)-1 do
        begin
          if aValue = -(i+1) then
          begin
            ME[0].LeverSpeed := C_RPM_Astern_Manouvring[i];
            ME[0].SetPointSpeed := C_RPM_Astern_Manouvring[i];
            CPP[0].LeverPitch := C_Pitch_Astern_Manouvring[i];
            CPP[0].SetpointPitch := C_Pitch_Astern_Manouvring[i];
          end;
        end;
      end
      else if aValue = 0 then
      begin
        ME[0].LeverSpeed := 400;
        ME[0].SetPointSpeed := 400;
        CPP[0].LeverPitch := 0;
        CPP[0].SetpointPitch := 0;
      end;
    end;
  end;

  if (aPortStarboard = C_PCS_ME_STARBOARD) then
  begin
    if LeverSB = aValue then
      Exit;

    LeverSB := aValue;

    if ME[1].RemoteAuto and ME[1].EngineRun and CPP[1].Remote then
    begin
      if aValue > 0 then
      begin
        for i := 0 to Length(C_RPM_Ahead_Manouvring)-1 do
        begin
          if aValue = i+1 then
          begin
            ME[1].LeverSpeed := C_RPM_Ahead_Manouvring[i];
            ME[1].SetPointSpeed := C_RPM_Ahead_Manouvring[i];
            CPP[1].LeverPitch := C_Pitch_Ahead_Manouvring[i];
            CPP[1].SetpointPitch := C_Pitch_Ahead_Manouvring[i];
          end;
        end;
      end
      else if aValue < 0 then
      begin
        for i := 0 to Length(C_RPM_Astern_Manouvring)-1 do
        begin
          if aValue = -(i+1) then
          begin
            ME[1].LeverSpeed := C_RPM_Astern_Manouvring[i];
            ME[1].SetPointSpeed := C_RPM_Astern_Manouvring[i];
            CPP[1].LeverPitch := C_Pitch_Astern_Manouvring[i];
            CPP[1].SetpointPitch := C_Pitch_Astern_Manouvring[i]
          end;
        end;
      end
      else if aValue = 0 then
      begin
        ME[1].LeverSpeed := 400;
        ME[1].SetPointSpeed := 400;
        CPP[1].LeverPitch := 0;
        CPP[1].SetpointPitch := 0;
      end;
    end;
  end;
end;

function TPropulsionSystem.MainEngineFailure(aPortStarboard: string): Boolean;
begin
  Result := False;
end;

procedure TPropulsionSystem.MCRBridge(aPortStarboard: string;
  aControl: Boolean);
begin
  if aPortStarboard = C_PCS_ME_PORTS then
  begin
//    ME[0].MCRControl := aControl;
//    ME[0].BridgeControl := not aControl;
  end
  else if aPortStarboard = C_PCS_ME_STARBOARD then
  begin
//    ME[1].MCRControl := aControl;
//    ME[1].BridgeControl := not aControl;
  end;
end;

procedure TPropulsionSystem.TransferOverride(aPortStaboard: String);
begin
  if aPortStaboard = C_PCS_PORTS then
  begin
//    ME[0].TransferOverride := True;
  end
  else
  if aPortStaboard = C_PCS_STARBOARD then
  begin
//    ME[1].TransferOverride := True;
  end;
end;

procedure TPropulsionSystem.ModeTransit(aPortStarboard: String; aValue : Integer);
var
  i, LeverPS, LeverSB: Integer;
begin
  if (aPortStarboard = C_PCS_ME_PORTS) then
  begin
    if GB[1].ShaftTrailing then
      ModeTrail(aPortStarboard, aValue)
    else
    begin
      if ME[0].RemoteAuto and ME[0].EngineRun and CPP[0].Remote then
      begin
        if LeverPS = aValue then
          Exit;

        LeverPS := aValue;

        if aValue < 0 then
        begin
          FCrashStop := True;
        end;

        for i := 0 to Length(C_RPM_Transit)-1 do
        begin
          if aValue = i then
          begin
            ME[0].LeverSpeed := C_RPM_Transit[i];
            ME[0].SetPointSpeed := C_RPM_Transit[i];
            CPP[0].LeverPitch := C_Pitch_Transit[i];
            CPP[0].SetpointPitch := C_Pitch_Transit[i];
          end;
        end;
      end;
    end;
  end;

  if (aPortStarboard = C_PCS_ME_STARBOARD) then
  begin
    if GB[0].ShaftTrailing then
      ModeTrail(aPortStarboard, aValue)
    else
    begin
      if ME[1].RemoteAuto and ME[1].EngineRun and CPP[1].Remote then
      begin
        if LeverSB = aValue then
          Exit;

        LeverSB := aValue;

        if aValue < 0 then
        begin
          FCrashStop := True;
        end;

        for i := 0 to Length(C_RPM_Transit)-1 do
        begin
          if aValue = i then
          begin
            ME[1].LeverSpeed := C_RPM_Transit[i];
            ME[1].SetPointSpeed := C_RPM_Transit[i];
            CPP[1].LeverPitch := C_Pitch_Transit[i];
            CPP[1].SetpointPitch := C_Pitch_Transit[i]
          end;
        end;
      end;
    end;
  end;
end;

procedure TPropulsionSystem.ModeMaxFSR(aPortStarboard: string; aValue: Integer);
var
  i, LeverPS, LeverSB: Integer;
begin
  if (aPortStarboard = C_PCS_PORTS) and (LeverPS <> aValue) then
  begin
    LeverPS := aValue;

    if TransitMode and ME[0].RemoteAuto and ME[0].EngineRun and CPP[0].Remote then
    begin
      if aValue < 0 then
      begin
        FCrashStop := True;
      end;

      for i := 0 to Length(C_RPM_MaxFSR)-1 do
      begin
        if aValue = i then
        begin
          ME[0].LeverSpeed := C_RPM_MaxFSR[i];
          ME[0].SetPointSpeed := C_RPM_MaxFSR[i];
          CPP[0].LeverPitch := C_Pitch_MaxFXR[i];
          CPP[0].SetpointPitch := C_Pitch_MaxFXR[i];
        end;
      end;
    end;
  end;

  if (aPortStarboard = C_PCS_STARBOARD) and (LeverSB <> aValue) then
  begin
    LeverSB := aValue;

    if TransitMode and ME[1].RemoteAuto and ME[1].EngineRun and CPP[1].Remote then
    begin
      if aValue < 0 then
      begin
        FCrashStop := True;
      end;

      for i := 0 to Length(C_RPM_MaxFSR)-1 do
      begin
        if aValue = i then
        begin
          ME[1].LeverSpeed := C_RPM_MaxFSR[i];
          ME[1].SetPointSpeed := C_RPM_MaxFSR[i];
          CPP[1].LeverPitch := C_Pitch_MaxFXR[i];
          CPP[1].SetpointPitch := C_Pitch_MaxFXR[i]
        end;
      end;

    end;
  end;
end;

procedure TPropulsionSystem.ModeTrail(aPortStarboard: string; aValue: Integer);
var
  i, LeverPS, LeverSB: Integer;
begin
  if (aPortStarboard = C_PCS_PORTS) and (LeverPS <> aValue) then
  begin
    LeverPS := aValue;

    if TransitMode and ME[0].RemoteAuto and ME[0].EngineRun and CPP[0].Remote and
    not ME[1].EngineRun and GB[1].ShaftTrailing then
    begin
      if aValue < 0 then
      begin
        FCrashStop := True;
      end;

      for i := 0 to Length(C_RPM_Trail)-1 do
      begin
        if aValue = i then
        begin
          ME[0].LeverSpeed := C_RPM_Trail[i];
          ME[0].SetPointSpeed := C_RPM_Trail[i];
          CPP[0].LeverPitch := C_Pitch_Trail[i];
          CPP[0].SetpointPitch := C_Pitch_Trail[i];
        end;
      end;
    end;
  end;

  if (aPortStarboard = C_PCS_STARBOARD) and (LeverSB <> aValue) then
  begin
    LeverSB := aValue;

    if TransitMode and ME[1].RemoteAuto and ME[1].EngineRun and CPP[1].Remote and
    not ME[0].EngineRun and GB[0].ShaftTrailing then
    begin
      if aValue < 0 then
      begin
        FCrashStop := True;
      end;

      for i := 0 to Length(C_RPM_Trail)-1 do
      begin
        if aValue = i then
        begin
          ME[1].LeverSpeed := C_RPM_Trail[i];
          ME[1].SetPointSpeed := C_RPM_Trail[i];
          CPP[1].LeverPitch := C_Pitch_Trail[i];
          CPP[1].SetpointPitch := C_Pitch_Trail[i]
        end;
      end;

    end;
  end;
end;

procedure TPropulsionSystem.NetEvent_PCSCommand(apRec: PAnsiChar; aSize: Word);
var
  rec: ^R_Common_PCS_Command;
  recCPPPump: ^R_Common_PumpStatus_Command;
begin
  rec := @apRec^;
  recCPPPump := @apRec^;

  case rec.CommandID of
    C_ORD_ME_SPEED    :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
        if rec.ValueInt = 1 then
          ME[0].IncreaseSpeed := rec.ValueBool
        else if rec.ValueInt = -1 then
          ME[0].DecreaseSpeed := rec.ValueBool;
      end
      else if rec.PortStaboardID = C_PCS_ME_STARBOARD then
      begin
        if rec.ValueInt = 1 then
          ME[1].IncreaseSpeed := rec.ValueBool
        else if rec.ValueInt = -1 then
          ME[1].DecreaseSpeed := rec.ValueBool;
      end;
    end;
//      Speed(rec.PortStaboardID, rec.ValueDouble);

    C_ORD_ME_RUNSTART :
      RunningStart(rec.PortStaboardID);

    C_ORD_ME_REMOTEAUTO, C_ORD_ME_REMOTEMAN, C_ORD_GB_REMOTEAUTO, C_ORD_GB_REMOTEMAN,
    C_ORD_CPP_REMOTEAUTO, C_ORD_CPP_REMOTEMAN :
      Remote(rec.PortStaboardID, rec.ValueBool);

    C_ORD_ME_STOP       :
      StoppedStop(rec.PortStaboardID);

    C_ORD_CPP_PITCH    :
    begin
      if rec.PortStaboardID = C_PCS_CPP_PORTS then
      begin
        if rec.ValueInt = 1 then
          CPP[0].AheadPitch := rec.ValueBool
        else if rec.ValueInt = -1 then
          CPP[0].AsternPitch := rec.ValueBool;
      end
      else if rec.PortStaboardID = C_PCS_CPP_STARBOARD then
      begin
        if rec.ValueInt = 1 then
          CPP[1].AheadPitch := rec.ValueBool
        else if rec.ValueInt = -1 then
          CPP[1].AsternPitch := rec.ValueBool;
      end;
    end;
//      Pitch(rec.PortStaboardID,rec.ValueDouble);

    C_ORD_GB_CLUTCH_ENGAGED   :
      Clutch(rec.PortStaboardID, rec.ValueBool);

    //Control
    C_ORD_CTRL_ALARMACCEPT, C_ORD_CTRL_STOPHORN, C_ORD_CTRL_LAMPTEST, C_ORD_CTRL_BACKGROUND_LAMP:
      GeneralControl(rec.CommandID, rec.ValueBool);

    C_ORD_CTRL_MCR_BRIDGE:
      MCRBridge(rec.PortStaboardID, rec.ValueBool);

    C_ORD_CTRL_MODE    :
      ModeControl(rec.ValueBool);

    //Lever Control
    C_ORD_LEVER_SPEED     :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
        ME[0].LeverControl := rec.ValueInt
      else if rec.PortStaboardID = C_PCS_ME_STARBOARD then
        ME[1].LeverControl := rec.ValueInt;
    end;

    C_ORD_LEVER_SHAFTTRAILING   :
      ShaftTrailing(rec.PortStaboardID);

    C_ORD_LEVER_EMERGENCYSTOP   :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
        FEmergencyStopPS := True;
        ME[0].EmergencyStop := True;
      end
      else
      if rec.PortStaboardID = C_PCS_ME_STARBOARD then
      begin
        FEmergencyStopSB := True;
        ME[1].EmergencyStop := True;
      end;
    end;

    C_ORD_LEVER_TRANSFEROVERRIDE:
      TransferOverride(rec.PortStaboardID);

  end;

  case recCPPPump.PumpId of
    C_PUMP_CPP_HYDRAULIC_1, C_PUMP_CPP_HYDRAULIC_2, C_PUMP_CPP_HYDRAULIC_3:
      CPPHydraulicPump(recCPPPump.SideId, recCPPPump.PumpId, recCPPPump.StadeId, recCPPPump.ValueBool);
  end;

end;

end.
