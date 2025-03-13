unit uMainEngine;

interface

uses uEntity, Math;

type

  TMainEngine = class(TEntity)
  private
    FDelayRandom,
    FDelayer,
    FDelayerActualSpeed,
    FSetPointSpeed,
    FLeverSpeed,
    FActualSpeed,
    FDelayActualSpeed,
    FFuelRack,
    FFuelMargin,
    FStartingAir,
    FControlAir,
    FTCAirSeal,
    FSpeed,
    FTurboChargerSpeedA,
    FTurboChargerSpeedB,
    FTCOutlLOTempA,
    FTCOutlLOTempB,
    FTCLOPressInlet,
    FTempTCInletA,
    FTempTCInletB,
    FTempTCOutletA,
    FTempTCOutletB,
    FPressAirInlet,
    FTempSuperChargAir,
    FPressFOInlet,
    FTempFWHTOutlet,
    FPressFWHTInlet,
    FTempFWHTInlet,
    FPressSeaWaterOutlet,
    FLOPressInlet,
    FLOTempInlet,
    FAvgTempA,
    FAvgTempB,
    FCompProbA,
    FCompProbB,
    FAlarmPropulsionCheck : Double;

    FLeverControl : Integer;

    FTempExhCylA, FTempExhCylB,
    FDevTempExhCylA, FDevTempExhCylB,
    FTempConRodBear : array [0..9] of Double;
    FTempBear : array [0..10] of Double;

    FPC_StartingInterlocks : array[0..12] of Boolean;
    FPC_Alarms : array[0..17] of Boolean;
    FPC_SafetiesStop : array[0..12] of Boolean;

    FEngineRun,
    FReadyForUse,
    FRemoteManual,
    FRemoteAuto,
    FIncreaseSpeed,
    FDecreaseSpeed,
    FRunningHour,
    FOverspeed,
    FStopIncrease,
    FDecrease,
    FConRodBearingTempHigh,
    FConRodBearingTempVeryHigh,
    FBearingTempHigh,
    FBearingTempVeryHigh,
    FOilMistDetSafety,
    FOilMistDetFailure,
    FOilMistDetAlarm,
    FPrelubeInProgress,
    FPrelubeFailure,
    FOilSumpLevel,
    FPrimLOPump,
    FPrimLOPumpAuto,
    FHeater,
    FHeaterAuto,
    FPreHeatingPump,
    FPreHeatingPumpAuto,
    FLOPressVeryLow,
    FLOPressClogg,
    FPressFOClogg,
    FInjPipeALeakFO,
    FInjPipeBLeakFO,
    FAirValve,
    FGasValve,
    FBypassP2P4,
    FRemoteStartInterlock,
    FTurningGearEngaged,
    FManHandleAtStop,
    FFuelRackAtStop,
    FClutched,
    FStartingFault,
    FSlowTurningFault,
    FSTCSequenceFail,
    FSafetyStopSysFail,
    FSafetyStop,
    FPrelubricationFailure,
    FPrelubInProgress,
    FOverspeedAlarm,
    FSafetyStopsOverriden,
    FLOPressureVeryLow,
    FBearTempVeryHigh,
    FFwHtExpTkLevelVeryLow,
    FFwTempVeryHigh,
    FConRodBearTempVeryHigh,
    FRedGearSafetyStop,
    FOilMistDetHigh,
    FEmergencyShutdown,
    FLocalEmergencyStop,
    FEngInletLubOilVeryHigh,
    FEngineControllerWatchdog,
    FCtrlPowerSupplyOn,
    FSafetyPowerSuppOn,
    FSTCSequenceAlarm,
    FGovernorMinorFail,
    FSTCInManualMode,
    FLocalCtrlFail,
    FClutchFail,
    FDeclutchFail,
    FCommFailEC_PLC,
    FPLCMonitoringFail,
    FClutchFailure,
    FBridgeLeverOORFailure,
    FMCRLeverOORFailure,
    FGeneralSensorFailure,
    FTrailAlarm,
    FResetSafetyStopPossible,
    FEmergencyStop,
    FTransferOverride,
    FLocalControl,
    FMCRControl,
    FBridgeControl,
    FRemoteControlProposed,
    FStartingInProgress,
    F2TCMode,
    FFailure,
    FStartingInterlocks,
    FSafetiesStop,
    FPCSAlarms,
    FTankIsEmpty,
    FPreStartInhibition: Boolean;

    procedure SetSetpointSpeed(const Value: Double);
    procedure SetLeverSpeed(const Value: Double);
    procedure SetActualSpeed(const Value: Double);
    procedure SetDelayActualSpeed(const Value : Double);
    procedure SetFuelRack(const Value: Double);
    procedure SetFuelMargin(const Value: Double);
    procedure SetStartingAir(const Value: Double);
    procedure SetControlAir(const Value: Double);
    procedure SetTCAirSeal(const Value: Double);
    procedure SetSpeed(const Value : Double);
    procedure SetTurboChargerSpeedA(const Value : Double);
    procedure SetTurboChargerSpeedB(const Value : Double);
    procedure SetTCOutlLOTempA(const Value : Double);
    procedure SetTCOutlLOTempB(const Value : Double);
    procedure SetTCLOPressInlet(const Value : Double);
    procedure SetTempTCInletA(const Value : Double);
    procedure SetTempTCInletB(const Value : Double);
    procedure SetTempTCOutletA(const Value : Double);
    procedure SetTempTCOutletB(const Value : Double);
    procedure SetPressAirInlet(const Value : Double);
    procedure SetTempSuperChargAir(const Value : Double);
    procedure SetPressFOInlet(const Value : Double);
    procedure SetTempFWHTOutlet(const Value : Double);
    procedure SetPressFWHTInlet(const Value : Double);
    procedure SetTempFWHTInlet(const Value : Double);
    procedure SetPressSeaWaterOutlet(const Value : Double);
    procedure SetLOPressInlet(const Value : Double);
    procedure SetLOTempInlet(const Value : Double);
    procedure SetAvgTempA(const Value : Double);
    procedure SetAvgTempB(const Value : Double);
    procedure SetCompProbA(const Value : Double);
    procedure SetCompProbB(const Value : Double);
    procedure SetAlarmPropulsionCheck(const Value : Double);
    procedure SetLeverControl(const Value : Integer);

    function GetTempExhCylA(i: Integer):Double;
    function GetTempExhCylB(i: Integer): Double;
    function GetDevTempExhCylA(i: Integer): Double;
    function GetDevTempExhCylB(i: Integer): Double;
    function GetTempConRodBear(i: Integer): Double;
    function GetTempBear(i: Integer): Double;
    function GetPC_StartingInterlocks(i: Integer): Boolean;
    function GetPC_Alarms(i: Integer): Boolean;
    function GetPC_SafetiesStop(i : Integer): Boolean;

    procedure SetTempExhCylA(i: Integer;const aTemp : Double);
    procedure SetTempExhCylB(i: Integer;const aTemp : Double);
    procedure SetDevTempExhCylA(i: Integer;const aTemp : Double);
    procedure SetDevTempExhCylB(i: Integer;const aTemp : Double);
    procedure SetTempConRodBear(i: Integer;const aTemp : Double);
    procedure SetTempBear(i: Integer;const aTemp :  Double);
    procedure SetPC_StartingInterlocks(i : Integer; const aValue : Boolean);
    procedure SetPC_Alarms(i : Integer; const aValue : Boolean);
    procedure SetPC_SafetiesStop(i : Integer; const aValue : Boolean);

    procedure SetEngineRun(const Value : Boolean);
    procedure SetReadyForUse(const Value : Boolean);
    procedure SetRemoteManual(const Value : Boolean);
    procedure SetRemoteAuto(const Value : Boolean);
    procedure SetIncreaseSpeed(const Value : Boolean);
    procedure SetDecreaseSpeed(const Value : Boolean);
    procedure SetRunningHour(const Value : Boolean);
    procedure SetOverspeed(const Value : Boolean);
    procedure SetStopIncrease(const Value : Boolean);
    procedure SetDecrease(const Value : Boolean);
    procedure SetConRodBearingTempHigh(const Value : Boolean);
    procedure SetConRodBearingTempVeryHigh(const Value : Boolean);
    procedure SetBearingTempHigh(const Value : Boolean);
    procedure SetBearingTempVeryHigh(const Value : Boolean);
    procedure SetOilMistDetSafety(const Value : Boolean);
    procedure SetOilMistDetFailure(const Value : Boolean);
    procedure SetOilMistDetAlarm(const Value : Boolean);
    procedure SetPrelubeInProgress(const Value : Boolean);
    procedure SetPrelubeFailure(const Value : Boolean);
    procedure SetOilSumpLevel(const Value : Boolean);
    procedure SetPrimLOPump(const Value : Boolean);
    procedure SetPrimLOPumpAuto(const Value : Boolean);
    procedure SetHeater(const Value : Boolean);
    procedure SetHeaterAuto(const Value : Boolean);
    procedure SetPreHeatingPump(const Value : Boolean);
    procedure SetPreHeatingPumpAuto(const Value : Boolean);
    procedure SetLOPressVeryLow(const Value : Boolean);
    procedure SetLOPressClogg(const Value : Boolean);
    procedure SetPressFOClogg(const Value : Boolean);
    procedure SetInjPipeALeakFO(const Value : Boolean);
    procedure SetInjPipeBLeakFO(const Value : Boolean);
    procedure SetAirValve(const Value : Boolean);
    procedure SetGasValve(const Value : Boolean);
    procedure SetBypassP2P4(const Value : Boolean);

    procedure SetRemoteStartInterlock(const Value : Boolean);
    procedure SetTurningGearEngaged(const Value : Boolean);
    procedure SetManHandleAtStop(const Value : Boolean) ;
    procedure SetFuelRackAtStop(const Value : Boolean);
    procedure SetClutched(const Value : Boolean);
    procedure SetStartingFault(const Value : Boolean);
    procedure SetSlowTurningFault(const Value : Boolean);
    procedure SetSTCSequenceFail(const Value : Boolean);
    procedure SetSafetyStopSysFail(const Value : Boolean);
    procedure SetSafetyStop(const Value : Boolean);
    procedure SetPrelubricationFailure(const Value : Boolean);
    procedure SetSafetyStopsOverriden(const Value : Boolean);
    procedure SetOverspeedAlarm(const Value : Boolean);
    procedure SetLOPressureVeryLow(const Value : Boolean);
    procedure SetBearTempVeryHigh(const Value : Boolean);
    procedure SetFwHtExpTkLevelVeryLow(const Value : Boolean);
    procedure SetFwTempVeryHigh(const Value : Boolean);
    procedure SetConRodBearTempVeryHigh(const Value : Boolean);
    procedure SetRedGearSafetyStop(const Value : Boolean);
    procedure SetOilMistDetHigh(const Value : Boolean);
    procedure SetEmergencyShutdown(const Value : Boolean);
    procedure SetLocalEmergencyStop(const Value : Boolean);
    procedure SetEngInletLubOilVeryHigh(const Value : Boolean);
    procedure SetEngineControllerWatchdog(const Value : Boolean);
    procedure SetCtrlPowerSupplyOn(const Value : Boolean);
    procedure SetSafetyPowerSuppOn(const Value : Boolean);
    procedure SetSTCSequenceAlarm(const Value : Boolean);
    procedure SetGovernorMinorFail(const Value : Boolean);
    procedure SetSTCInManualMode(const Value : Boolean);
    procedure SetLocalCtrlFail(const Value : Boolean);
    procedure SetClutchFail(const Value : Boolean);
    procedure SetDeclutchFail(const Value : Boolean);
    procedure SetCommFailEC_PLC(const Value : Boolean);
    procedure SetPLCMonitoringFail(const Value : Boolean);
    procedure SetClutchFailure(const Value : Boolean);
    procedure SetBridgeLeverOORFailure(const Value : Boolean);

    procedure SetMCRLeverOORFailure(const Value : Boolean);
    procedure SetGeneralSensorFailure(const Value : Boolean);
    procedure SetTrailAlarm(const Value : Boolean);
    procedure SetResetSafetyStopPossible(const Value : Boolean);
    procedure SetEmergencyStop(const Value : Boolean);
    procedure SetTransferOverride(const Value : Boolean);
    procedure SetLocalControl(const Value : Boolean);
    procedure SetMCRControl(const Value : Boolean);
    procedure SetBridgeControl(const Value : Boolean);
    procedure SetRemoteControlProposed(const Value : Boolean);
    procedure SetStartingInProgress(const Value : Boolean);
    procedure Set2TCMode(const Value : Boolean);
    procedure SetFailure(const Value : Boolean);
    procedure SetStartingInterlocks(const Value : Boolean);
    procedure SetSafetiesStop(const Value : Boolean);
    procedure SetPCSAlarms(const Value : Boolean);
    procedure SetTankIsEmpty(const Value : Boolean);
    procedure SetPreStartInhibition(const Value : Boolean);

    procedure SetSpeedInManual(aValue : Double);

    {Actual Speed Calculation From Setpoint Speed}
    procedure calcActualSpeed;
    {Delay untuk manampilkan value pada mimic}
    procedure calcDelayActualSpeed;

    {Set nilai random berdasarkan perubahan RPM Main Engine}
    procedure calcFuelMainEngine(aRPM : Double);
    procedure calcTurboChargerSpeed(aRPM : Double);
    procedure calcTurboChargerTemp(aRPM : Double);
    procedure calcConRodBearTemp(aTemp : Double);
    procedure calcExhaustGasTemp(aTemp : Double);
    procedure setMainEnginePressureValue(aRPM : Double);
    procedure setMainEngineTempValue(aRPM : Double);
    {--}

    {Set Entity Main Engine State saat running}
    procedure setMainEngineState(aEngineRun : Boolean);

    {Set Propulsion Failure and Alarms}
    function StartInterlock: Boolean;
    function SafetiesStop: Boolean;
    function Alarms: Boolean;
    {--}

  public
    constructor Create;override;
    destructor Destroy;override;

    procedure Run(const aDt : Double); override;

    property AvgTempA : Double read FAvgTempA write SetAvgTempA;
    property AvgTempB : Double read FAvgTempB write SetAvgTempB;
    property CompProbA : Double read FCompProbA write SetCompProbA;
    property CompProbB : Double read FCompProbB write SetCompProbB;
    property TempExhCylA[i : Integer]: Double read GetTempExhCylA write SetTempExhCylA;
    property TempExhCylB[i : Integer]: Double read GetTempExhCylB write SetTempExhCylB;
    property DevTempExhCylA[i : Integer]: Double read GetDevTempExhCylA write SetDevTempExhCylA;
    property DevTempExhCylB[i : Integer]: Double read GetDevTempExhCylB write SetDevTempExhCylB;
    property TempConRodBear[i : Integer]: Double read GetTempConRodBear write SetTempConRodBear;
    property TempBear[i : Integer]: Double read GetTempBear write SetTempBear;
    property PC_StartingInterlocks[i : Integer]: Boolean read GetPC_StartingInterlocks write SetPC_StartingInterlocks;
    property PC_Alarms[i : Integer]: Boolean read GetPC_Alarms write SetPC_Alarms;
    property PC_SafetiesStop[i : Integer]: Boolean read GetPC_SafetiesStop write SetPC_SafetiesStop;

    property SetPointSpeed : Double read FSetPointSpeed write SetSetPointSpeed;
    property LeverSpeed : Double read FLeverSpeed write SetLeverSpeed;
    property ActualSpeed : Double read FActualSpeed write SetActualSpeed;
    property DelayActualSpeed : Double read FDelayActualSpeed write SetDelayActualSpeed;
    property FuelRack : Double read FFuelRack write SetFuelRack;

    property FuelMargin : Double read FFuelMargin write SetFuelMargin;
    property StartingAir : Double read FStartingAir write SetStartingAir;
    property ControlAir : Double read FControlAir write SetControlAir;
    property TCAirSeal : Double read FTCAirSeal write SetTCAirSeal;
    property Speed : Double read FSpeed write SetSpeed;
    property TurboChargerSpeedA : Double read FTurboChargerSpeedA write SetTurboChargerSpeedA;
    property TurboChargerSpeedB : Double read FTurboChargerSpeedB write SetTurboChargerSpeedB;
    property TCOutlLOTempA : Double read FTCOutlLOTempA write SetTCOutlLOTempA;
    property TCOutlLOTempB : Double read FTCOutlLOTempB write SetTCOutlLOTempB;
    property TCLOPressInlet : Double read FTCLOPressInlet write SetTCLOPressInlet;
    property TempTCInletA: Double read FTempTCInletA write SetTempTCInletA;
    property TempTCInletB: Double read FTempTCInletB write SetTempTCInletB;
    property TempTCOutletA : Double read FTempTCOutletA write SetTempTCOutletA;
    property TempTCOutletB : Double read FTempTCOutletB write SetTempTCOutletB;
    property PressAirInlet : Double read FPressAirInlet write SetPressAirInlet;
    property TempSuperChargAir: Double read FTempSuperChargAir write SetTempSuperChargAir;
    property PressFOInlet : Double read FPressFOInlet write SetPressFOInlet;
    property TempFWHTOutlet : Double read FTempFWHTOutlet write SetTempFWHTOutlet;
    property PressFWHTInlet : Double read FPressFWHTInlet write SetPressFWHTInlet;
    property TempFWHTInlet : Double read FTempFWHTInlet write SetTempFWHTInlet;
    property PressSeaWaterOutlet : Double read FPressSeaWaterOutlet write SetPressSeaWaterOutlet;
    property LOPressInlet : Double read FLOPressInlet write SetLOPressInlet;
    property LOTempInlet : Double read FLOTempInlet write SetLOTempInlet;
    property AlarmPropulsionCheck : Double read FAlarmPropulsionCheck write SetAlarmPropulsionCheck;

    property LeverControl : Integer read FLeverControl write SetLeverControl;

    property EngineRun : Boolean read FEngineRun write SetEngineRun;
    property ReadyForUse : Boolean read FReadyForUse write SetReadyForUse;
    property RemoteManual : Boolean read FRemoteManual write SetRemoteManual;
    property RemoteAuto : Boolean read FRemoteAuto write SetRemoteAuto;
    property IncreaseSpeed : Boolean read FIncreaseSpeed write SetIncreaseSpeed;
    property DecreaseSpeed : Boolean read FDecreaseSpeed write SetDecreaseSpeed;
    property RunningHour : Boolean read FRunningHour write SetRunningHour;
    property Overspeed : Boolean read FOverspeed write SetOverspeed;
    property StopIncrease : Boolean read FStopIncrease write SetStopIncrease;
    property Decrease : Boolean read FDecrease write SetDecrease;
    property ConRodBearingTempHigh : Boolean read FConRodBearingTempHigh write SetConRodBearingTempHigh;
    property ConRodBearingTempVeryHigh : Boolean read FConRodBearingTempVeryHigh write SetConRodBearingTempVeryHigh;
    property BearingTempHigh : Boolean read FBearingTempHigh write SetBearingTempHigh;
    property BearingTempVeryHigh : Boolean read FBearingTempVeryHigh write SetBearingTempVeryHigh;
    property OilMistDetSafety : Boolean read FOilMistDetSafety write SetOilMistDetSafety;
    property OilMistDetFailure : Boolean read FOilMistDetFailure write SetOilMistDetFailure;
    property OilMistDetAlarm : Boolean read FOilMistDetAlarm write SetOilMistDetAlarm;
    property PrelubeInProgress : Boolean read FPrelubeInProgress write SetPrelubeInProgress;
    property PrelubeFailure : Boolean read FPrelubeFailure write SetPrelubeFailure;
    property OilSumpLevel : Boolean read FOilSumpLevel write SetOilSumpLevel;
    property PrimLOPump : Boolean read FPrimLOPump write SetPrimLOPump;
    property PrimLOPumpAuto : Boolean read FPrimLOPumpAuto write SetPrimLOPumpAuto;
    property Heater : Boolean read FHeater write SetHeater;
    property HeaterAuto : Boolean read FHeaterAuto write SetHeaterAuto;
    property PreHeatingPump : Boolean read FPreHeatingPump write SetPreHeatingPump;
    property PreHeatingPumpAuto : Boolean read FPreHeatingPumpAuto write SetPreHeatingPumpAuto;
    property LOPressVeryLow : Boolean read FLOPressVeryLow write SetLOPressVeryLow;
    property LOPressClogg : Boolean read FLOPressClogg write SetLOPressClogg;
    property PressFOClogg : Boolean read FPressFOClogg write SetPressFOClogg;
    property InjPipeALeakFO : Boolean read FInjPipeALeakFO write SetInjPipeALeakFO;
    property InjPipeBLeakFO : Boolean read FInjPipeBLeakFO write SetInjPipeBLeakFO;
    property AirValve : Boolean read FAirValve write SetAirValve;
    property GasValve : Boolean read FGasValve write SetGasValve;
    property BypassP2P4 : Boolean read FBypassP2P4 write SetBypassP2P4;

    property RemoteStartInterlock : Boolean read FRemoteStartInterlock write SetRemoteStartInterlock;
    property TurningGearEngaged : Boolean read FTurningGearEngaged write SetTurningGearEngaged;
    property ManHandleAtStop : Boolean read FManHandleAtStop write SetManHandleAtStop;
    property FuelRackAtStop : Boolean read FFuelRackAtStop write SetFuelRackAtStop;
    property Clutched : Boolean read FClutched write SetClutched;
    property StartingFault : Boolean read FStartingFault write SetStartingFault;
    property SlowTurningFault : Boolean read FSlowTurningFault write SetSlowTurningFault;
    property STCSequenceFail : Boolean read FSTCSequenceFail write SetSTCSequenceFail;
    property SafetyStopSysFail : Boolean read FSafetyStopSysFail write SetSafetyStopSysFail;
    property SafetyStop : Boolean read FSafetyStop write SetSafetyStop;
    property PrelubricationFailure : Boolean read FPrelubricationFailure write SetPrelubricationFailure;
    property PrelubInProgress : Boolean read FPrelubInProgress write SetPrelubeInProgress;
    property SafetyStopsOverriden : Boolean read FSafetyStopsOverriden write SetSafetyStopsOverriden;
    property OverspeedAlarm : Boolean read FOverspeedAlarm write SetOverspeedAlarm;
    property LOPressureVeryLow : Boolean read FLOPressureVeryLow write SetLOPressureVeryLow;
    property BearTempVeryHigh : Boolean read FBearTempVeryHigh write SetBearTempVeryHigh;
    property FwHtExpTkLevelVeryLow : Boolean read FFwHtExpTkLevelVeryLow write SetFwHtExpTkLevelVeryLow;
    property FwTempVeryHigh : Boolean read FFwTempVeryHigh write SetFwTempVeryHigh;
    property ConRodBearTempVeryHigh : Boolean read FConRodBearTempVeryHigh write SetConRodBearTempVeryHigh;
    property RedGearSafetyStop : Boolean read FRedGearSafetyStop write SetRedGearSafetyStop;
    property OilMistDetHigh : Boolean read FOilMistDetHigh write SetOilMistDetHigh;
    property EmergencyShutdown : Boolean read FEmergencyShutdown write SetEmergencyShutdown;
    property LocalEmergencyStop : Boolean read FLocalEmergencyStop write SetLocalEmergencyStop;
    property EngInletLubOilVeryHigh : Boolean read FEngInletLubOilVeryHigh write SetEngInletLubOilVeryHigh;
    property EngineControllerWatchdog : Boolean read FEngineControllerWatchdog write SetEngineControllerWatchdog;
    property CtrlPowerSupplyOn : Boolean read FCtrlPowerSupplyOn write SetCtrlPowerSupplyOn;
    property SafetyPowerSuppOn : Boolean read FSafetyPowerSuppOn write SetSafetyPowerSuppOn;
    property STCSequenceAlarm : Boolean read FSTCSequenceAlarm write SetSTCSequenceAlarm;
    property GovernorMinorFail : Boolean read FGovernorMinorFail write SetGovernorMinorFail;
    property STCInManualMode : Boolean read FSTCInManualMode write SetSTCInManualMode;
    property LocalCtrlFail : Boolean read FLocalCtrlFail write SetLocalCtrlFail;
    property ClutchFail : Boolean read FClutchFail write SetClutchFail;
    property DeclutchFail : Boolean read FDeclutchFail write SetDeclutchFail;
    property CommFailEC_PLC : Boolean read FCommFailEC_PLC write SetCommFailEC_PLC;
    property PLCMonitoringFail : Boolean read FPLCMonitoringFail write SetPLCMonitoringFail;
    property ClutchFailure : Boolean read FClutchFailure write SetClutchFailure;
    property BridgeLeverOORFailure : Boolean read FBridgeLeverOORFailure write SetBridgeLeverOORFailure;
    property MCRLeverOORFailure : Boolean read FMCRLeverOORFailure write SetMCRLeverOORFailure;
    property GeneralSensorFailure : Boolean read FGeneralSensorFailure write SetGeneralSensorFailure;
    property TrailAlarm : Boolean read FTrailAlarm write SetTrailAlarm;
    property ResetSafetyStopPossible : Boolean read FResetSafetyStopPossible write SetResetSafetyStopPossible;
    property EmergencyStop : Boolean read FEmergencyStop write SetEmergencyStop;
    property TransferOverride : Boolean read FTransferOverride write SetTransferOverride;

    property LocalControl : Boolean read FLocalControl write SetLocalControl;
    property MCRControl : Boolean read FMCRControl write SetMCRControl;
    property BridgeControl : Boolean read FBridgeControl write SetBridgeControl;

    property RemoteControlProposed : Boolean read FRemoteControlProposed write SetRemoteControlProposed;
    property StartingInProgress : Boolean read FStartingInProgress write SetStartingInProgress;
    property TC2Mode : Boolean read F2TCMode write Set2TCMode;
    property Failure : Boolean read FFailure write SetFailure;
    property StartingInterlocks : Boolean read FStartingInterlocks write SetStartingInterlocks;
    property SafetiesStops : Boolean read FSafetiesStop write SetSafetiesStop;
    property PCSAlarms : Boolean read FPCSAlarms write SetPCSAlarms;
    property TankIsEmpty : Boolean read FTankIsEmpty write SetTankIsEmpty;
    property PreStartInhibition : Boolean read FPreStartInhibition write SetPreStartInhibition;
  end;

implementation

uses
  uDataType;

{ TMainEngine }

procedure TMainEngine.Run(const aDt: Double);
begin
  inherited;

  FDelayRandom := FDelayRandom + aDt;
  FDelayer := FDelayer + aDt;
  FDelayerActualSpeed := FDelayerActualSpeed + aDt;

  if FDelayer > 0.05 then
  begin
    FDelayer := 0;

    calcActualSpeed;
    Speed := ActualSpeed;
  end;

  calcDelayActualSpeed;

  if EngineRun then
  begin

    if IncreaseSpeed then
      SetSpeedInManual(1)
    else if DecreaseSpeed then
      SetSpeedInManual(-1);

    if ActualSpeed >= 900 then
      TC2Mode := True
    else
      TC2Mode := False;

  end
  else if not EngineRun then
  begin
    SetPointSpeed := 0;
  end;

  if FDelayRandom > 13 then
  begin
    FDelayRandom := 0;

    setMainEngineTempValue(ActualSpeed);
    setMainEnginePressureValue(ActualSpeed);
    calcFuelMainEngine(ActualSpeed);
    calcTurboChargerSpeed(ActualSpeed);
    calcTurboChargerTemp(ActualSpeed);
  end;

  setMainEngineState(EngineRun);

  StartingInterlocks := StartInterlock; //Set Starting Interlocks
  SafetiesStops := SafetiesStop; //Set Safeties Stop
  PCSAlarms := Alarms; //Set PCS Alarms
//  ReadyForUse := MEReadyForUse;
end;

procedure TMainEngine.calcActualSpeed;
begin
  if ActualSpeed <> SetPointSpeed then
  begin
    if ActualSpeed < SetPointSpeed then
      ActualSpeed := ActualSpeed + 1
    else
    if ActualSpeed > SetPointSpeed then
      ActualSpeed := ActualSpeed - 1;
    end;
end;

procedure TMainEngine.SetSpeedInManual(aValue: Double);
begin
  if not Failure then
  begin
    if aValue > 0 then
    begin
      if SetPointSpeed < 1050 then
        SetPointSpeed := SetPointSpeed + aValue
      else
        SetPointSpeed := 1050;
    end
    else
    if aValue < 0 then
    begin
      if SetPointSpeed > 0 then
        SetPointSpeed := SetPointSpeed + aValue
      else
        SetPointSpeed := 0;
    end;
  end;
end;

procedure TMainEngine.calcConRodBearTemp(aTemp: Double);
var
  i : Integer;
begin
  if not ConRodBearingTempVeryHigh then
  begin
    for i := 0 to 9 do
    begin
      TempConRodBear[i] := (Random(5) + aTemp);
    end;
  end;

  if not BearTempVeryHigh then
  begin
    for i := 0 to 10 do
    begin
      TempBear[i] := (Random(4) + aTemp);
    end;
  end;
end;

procedure TMainEngine.calcDelayActualSpeed;
begin
  if FDelayerActualSpeed > 1 then
  begin
    FDelayerActualSpeed := 0;
    DelayActualSpeed := ActualSpeed;
  end;
end;

procedure TMainEngine.calcExhaustGasTemp(aTemp: Double);
var
  i : Integer;
  ValueAvgTempA, ValueAvgTempB: Double;
begin
  ValueAvgTempA := 0;
  ValueAvgTempB := 0;

  for i := 0 to 9 do
  begin
    TempExhCylA[i] := (Random(40) + aTemp);
    TempExhCylB[i] := (Random(40) + aTemp);

    ValueAvgTempA := ValueAvgTempA + TempExhCylA[i];
    ValueAvgTempB := ValueAvgTempB + TempExhCylB[i];
  end;

  AvgTempA := Round(ValueAvgTempA/10);
  AvgTempB := Round(ValueAvgTempB/10);

  for i := 0 to 9 do
  begin
    DevTempExhCylA[i] := (TempExhCylA[i] - AvgTempA)*10;
    DevTempExhCylB[i] := (TempExhCylB[i] - AvgTempB)*10;
  end;
end;

procedure TMainEngine.calcFuelMainEngine(aRPM: Double);
begin
  if aRPM < 400 then
  begin
    FuelRack := 0.1;
    FuelMargin := -0.1;
  end
  else if (aRPM >= 400) and (aRPM < 700)then
  begin
    FuelRack := RandomRange(70,150)/10;
    FuelMargin := RandomRange(70,95)/10;
  end
  else if (aRPM >= 700) and (aRPM < 1000) then
  begin
    FuelRack := RandomRange(150,250)/10;
    FuelMargin := RandomRange(20,70)/10;
  end
  else if (aRPM >= 1000) then
  begin
    FuelRack := RandomRange(260,280)/10;
    FuelMargin := RandomRange(16,25)/10;
  end;
end;

procedure TMainEngine.calcTurboChargerSpeed(aRPM: Double);
begin
  if aRPM < 400 then
  begin
    TurboChargerSpeedA := 0;
    TurboChargerSpeedB := 0;
  end
  else if (aRPM >= 400) and (aRPM < 450) then
  begin
    TurboChargerSpeedA := 0;
    TurboChargerSpeedB := random (1000) + (aRPM * 4);
  end
  else if (aRPM >= 450) and (aRPM < 900) then
  begin
    TurboChargerSpeedA := 0;
    TurboChargerSpeedB := random (1000) + ((aRPM - 400) * 44);
  end
  else if (aRPM >= 900) then
  begin
    TurboChargerSpeedA := (Random(1000) + ((aRPM - 400) * 44)) / 2;
    TurboChargerSpeedB := (Random(1000) + ((aRPM - 400) * 44)) / 2
  end;
end;

procedure TMainEngine.calcTurboChargerTemp(aRPM: Double);
begin
  if aRPM < 400 then
  begin
    TCOutlLOTempA := Random(3)+35;
    TempTCInletA := Random(3)+35;
    TempTCOutletA := Random(3)+35;
    TCOutlLOTempB := Random(3)+35;
    TempTCInletB := Random(3)+35;
    TempTCOutletB := Random(3)+35;
  end
  else if (aRPM >= 400) and (aRPM < 700) then
  begin
    TCOutlLOTempA := Random(10)+40;
    TempTCInletA := Random(3)+35;
    TempTCOutletA := Random(10)+40;
    TCOutlLOTempB := Random(10)+40;
    TempTCInletB := Random(30)+80;
    TempTCOutletB := Random(100)+100;
  end
  else if (aRPM >= 700) and (aRPM < 1000) then
  begin
    TCOutlLOTempA := Random(10)+40;
    TempTCInletA := Random(30)+80;
    TempTCOutletA := Random(100)+200;
    TCOutlLOTempB := Random(10)+40;
    TempTCInletB := Random(20)+80;
    TempTCOutletB := Random(100)+200;
  end
  else if (aRPM >= 1000) then
  begin
    TCOutlLOTempA := Random(10)+50;
    TempTCInletA := Random(30)+90;
    TempTCOutletA := Random(100)+300;
    TCOutlLOTempB := Random(10)+50;
    TempTCInletB := Random(20)+90;
    TempTCOutletB := Random(100)+300;
  end;
end;

procedure TMainEngine.setMainEnginePressureValue(aRPM: Double);
begin
  if aRPM < 400 then
  begin
    StartingAir := Random(30)/10;
    ControlAir := RandomRange(60,70)/10;
    TCAirSeal := 0;
//    TCLOPressInlet := 0;
    PressAirInlet := 0;
    PressFWHTInlet := RandomRange(1,25)/10;
    PressSeaWaterOutlet := 0.1;
    LOPressInlet := -0.1;
    PressFOInlet := 0.1;
  end
  else if aRPM >= 400 then
  begin
    StartingAir := RandomRange(250,350)/10;
    ControlAir := RandomRange(60,70)/10;
    TCAirSeal := 0;
//    TCLOPressInlet := (30)/10;
    PressAirInlet := 0;
    PressFWHTInlet := RandomRange(25,35)/10;
    PressSeaWaterOutlet := Random(7)/10 + 1;
    LOPressInlet := RandomRange(40,50)/10;
    PressFOInlet := Random(10)/10 + 2;
  end;
end;

procedure TMainEngine.setMainEngineState(aEngineRun: Boolean);
begin
  RunningHour := aEngineRun;
end;

procedure TMainEngine.setMainEngineTempValue(aRPM: Double);
begin
  if aRPM >= 1000 then
  begin
    calcConRodBearTemp(80);
    calcExhaustGasTemp(400);

    TempSuperChargAir := Random(10)+60;
    TempFWHTOutlet := Random(10)+65;
    TempFWHTInlet := Random(10)+60;
    LOTempInlet := Random(10)+60;
  end
  else
  if (aRPM >= 700) and (aRPM < 1000) then
  begin
    calcConRodBearTemp(70);
    calcExhaustGasTemp(300);

    TempSuperChargAir := Random(10)+50;
    TempFWHTOutlet := Random(10)+60;
    TempFWHTInlet := Random(10)+50;
    LOTempInlet := Random(10)+50;
  end
  else
  if (aRPM >= 500) and (aRPM < 700) then
  begin
    calcConRodBearTemp(60);
    calcExhaustGasTemp(200);

    TempSuperChargAir := Random(10)+40;
    TempFWHTOutlet := Random(10)+55;
    TempFWHTInlet := Random(10)+40;
    LOTempInlet := Random(10)+40;
  end
  else
  if (aRPM >= 400) and (aRPM < 500) then
  begin
    calcConRodBearTemp(50);
    calcExhaustGasTemp(100);

    TempSuperChargAir := Random(10)+37;
    TempFWHTOutlet := Random(10)+47;
    TempFWHTInlet := Random(10)+37;
    LOTempInlet := Random(10)+37;
  end
  else
  if (aRPM < 400) then
  begin
    calcConRodBearTemp(30);
    calcExhaustGasTemp(30);

    TempSuperChargAir := Random(3)+35;
    TempFWHTOutlet := Random(3)+35;
    TempFWHTInlet := Random(3)+35;
    LOTempInlet := Random(3)+35;
  end;
end;

function TMainEngine.StartInterlock: Boolean;
begin
  if RemoteStartInterlock or TurningGearEngaged or ManHandleAtStop or
    FuelRackAtStop or Clutched or StartingFault or SlowTurningFault or
    STCSequenceFail or SafetyStopSysFail or SafetyStop or
    PrelubricationFailure or PrelubeInProgress then
      Result := True
    else
      Result := False;
end;

function TMainEngine.Alarms: Boolean;
begin
  if EngineControllerWatchdog or CtrlPowerSupplyOn or SafetyPowerSuppOn or
    STCSequenceAlarm or GovernorMinorFail or LocalCtrlFail or ClutchFail or
    DeclutchFail or CommFailEC_PLC or PLCMonitoringFail or ClutchFailure or
    BridgeLeverOORFailure or MCRLeverOORFailure or GeneralSensorFailure or
    TrailAlarm then
    Result := True
  else
    Result := False;
end;

function TMainEngine.SafetiesStop: Boolean;
begin
  if SafetyStopsOverriden or OverspeedAlarm or LOPressureVeryLow or
    BearTempVeryHigh or FwHtExpTkLevelVeryLow or FwTempVeryHigh or
    ConRodBearTempVeryHigh or RedGearSafetyStop or OilMistDetHigh or
    EmergencyShutdown or LocalEmergencyStop or EngInletLubOilVeryHigh then
      Result := True
  else
      Result := False;
end;


constructor TMainEngine.Create;
begin
  inherited;
//  FSetPointSpeed  := 0;
//  FLeverSpeed     := 0;
//  FActualSpeed    := 0;
//  FRemoteManual   := False;
  LeverControl := 0;
end;

destructor TMainEngine.Destroy;
begin
  inherited;
end;

function TMainEngine.GetDevTempExhCylA(i: Integer): Double;
begin
  Result := FDevTempExhCylA[i];
end;

function TMainEngine.GetDevTempExhCylB(i: Integer): Double;
begin
  Result := FDevTempExhCylB[i];
end;

function TMainEngine.GetPC_Alarms(i: Integer): Boolean;
begin
  Result := FPC_Alarms[i];
end;

function TMainEngine.GetPC_SafetiesStop(i: Integer): Boolean;
begin
  Result := FPC_SafetiesStop[i];
end;

function TMainEngine.GetPC_StartingInterlocks(i: Integer): Boolean;
begin
  Result := FPC_StartingInterlocks[i];
end;

function TMainEngine.GetTempBear(i: Integer): Double;
begin
  Result := FTempBear[i];
end;

function TMainEngine.GetTempConRodBear(i: Integer): Double;
begin
  Result := FTempConRodBear[i];
end;

function TMainEngine.GetTempExhCylA(i: Integer): Double;
begin
  Result := FTempExhCylA[i];
end;

function TMainEngine.GetTempExhCylB(i: Integer): Double;
begin
  Result := FTempExhCylB[i];
end;

procedure TMainEngine.Set2TCMode(const Value: Boolean);
begin
  if F2TCMode = Value then
    Exit;

  F2TCMode := Value;
  Listener.TriggerEvents(Self, epPCSME2TCMode, Value);
end;

procedure TMainEngine.SetActualSpeed(const Value: Double);
begin
  if FActualSpeed = Value then
    exit;

  FActualSpeed := Value;
//  Listener.TriggerEvents(Self,epPCSMEActualSpeed, Value);
end;

procedure TMainEngine.SetAirValve(const Value: Boolean);
begin
  if FAirValve = Value then
    Exit;

  FAirValve := Value;
  Listener.TriggerEvents(Self,epPCSMEAirValve,Value);
end;

procedure TMainEngine.SetAlarmPropulsionCheck(const Value: Double);
begin
  if FAlarmPropulsionCheck = Value then
    Exit;

  FAlarmPropulsionCheck := Value;
  Listener.TriggerEvents(Self,epPCSMEAlarmPropulsionCheck,Value);
end;

procedure TMainEngine.SetAvgTempA(const Value: Double);
begin
  if FAvgTempA = Value then
    Exit;

  FAvgTempA := Value;
  Listener.TriggerEvents(Self,epPCSMEAvgTempA,Value*10);
end;

procedure TMainEngine.SetAvgTempB(const Value: Double);
begin
  if FAvgTempB = Value then
    Exit;

  FAvgTempB := Value;
  Listener.TriggerEvents(Self,epPCSMEAvgTempB,Value*10);
end;

procedure TMainEngine.SetTankIsEmpty(const Value: Boolean);
begin
  if FTankIsEmpty = Value then
    Exit;

  FTankIsEmpty := Value;
end;

procedure TMainEngine.SetTCAirSeal(const Value: Double);
begin
  if FTCAirSeal = Value then
    exit;

  FTCAirSeal := Value;
  Listener.TriggerEvents(Self,epPCSMETCAirSeal,Value);
end;

procedure TMainEngine.SetTCLOPressInlet(const Value: Double);
begin
  if FTCLOPressInlet = Value then
    Exit;

  FTCLOPressInlet := Value;
  Listener.TriggerEvents(Self,epPCSMETCLOPressInlet,Value*1000);
end;

procedure TMainEngine.SetTCOutlLOTempA(const Value: Double);
begin
  if FTCOutlLOTempA = Value then
    Exit;

  FTCOutlLOTempA := Value;
  Listener.TriggerEvents(Self,epPCSMETCOutlLOTempA,Value*10);
end;

procedure TMainEngine.SetTCOutlLOTempB(const Value: Double);
begin
  if FTCOutlLOTempB = Value then
    Exit;

  FTCOutlLOTempB := Value;
  Listener.TriggerEvents(Self,epPCSMETCOutlLOTempB,Value*10);
end;

procedure TMainEngine.SetTempBear(i: Integer;const aTemp : Double);
begin
  if FTempBear[i] = aTemp then
    Exit;

  FTempBear[i] := aTemp;
  case i of
    0:
      Listener.TriggerEvents(Self,epPCSMETempBear1,aTemp*10);
    1:
      Listener.TriggerEvents(Self,epPCSMETempBear2,aTemp*10);
    2:
      Listener.TriggerEvents(Self,epPCSMETempBear3,aTemp*10);
    3:
      Listener.TriggerEvents(Self,epPCSMETempBear4,aTemp*10);
    4:
      Listener.TriggerEvents(Self,epPCSMETempBear5,aTemp*10);
    5:
      Listener.TriggerEvents(Self,epPCSMETempBear6,aTemp*10);
    6:
      Listener.TriggerEvents(Self,epPCSMETempBear7,aTemp*10);
    7:
      Listener.TriggerEvents(Self,epPCSMETempBear8,aTemp*10);
    8:
      Listener.TriggerEvents(Self,epPCSMETempBear9,aTemp*10);
    9:
      Listener.TriggerEvents(Self,epPCSMETempBear10,aTemp*10);
    10:
      Listener.TriggerEvents(Self,epPCSMETempBear11,aTemp*10);

  end;
end;

procedure TMainEngine.SetTempConRodBear(i: Integer;const aTemp : Double);
begin
  if FTempConRodBear[i] = aTemp then
    Exit;

  FTempConRodBear[i] := aTemp;
  case i of
    0:
      Listener.TriggerEvents(Self,epPCSMETempConRodBear1,aTemp*10);
    1:
      Listener.TriggerEvents(Self,epPCSMETempConRodBear2,aTemp*10);
    2:
      Listener.TriggerEvents(Self,epPCSMETempConRodBear3,aTemp*10);
    3:
      Listener.TriggerEvents(Self,epPCSMETempConRodBear4,aTemp*10);
    4:
      Listener.TriggerEvents(Self,epPCSMETempConRodBear5,aTemp*10);
    5:
      Listener.TriggerEvents(Self,epPCSMETempConRodBear6,aTemp*10);
    6:
      Listener.TriggerEvents(Self,epPCSMETempConRodBear7,aTemp*10);
    7:
      Listener.TriggerEvents(Self,epPCSMETempConRodBear8,aTemp*10);
    8:
      Listener.TriggerEvents(Self,epPCSMETempConRodBear9,aTemp*10);
    9:
      Listener.TriggerEvents(Self,epPCSMETempConRodBear10,aTemp*10);
  end;

end;

procedure TMainEngine.SetTempExhCylA(i: Integer;const aTemp : Double);
begin
  if FTempExhCylA[i] = aTemp then
    Exit;

  FTempExhCylA[i] := aTemp;
  case i of
    0:
      Listener.TriggerEvents(Self,epPCSMETempExhCylA1,aTemp*10);
    1:
      Listener.TriggerEvents(Self,epPCSMETempExhCylA2,aTemp*10);
    2:
      Listener.TriggerEvents(Self,epPCSMETempExhCylA3,aTemp*10);
    3:
      Listener.TriggerEvents(Self,epPCSMETempExhCylA4,aTemp*10);
    4:
      Listener.TriggerEvents(Self,epPCSMETempExhCylA5,aTemp*10);
    5:
      Listener.TriggerEvents(Self,epPCSMETempExhCylA6,aTemp*10);
    6:
      Listener.TriggerEvents(Self,epPCSMETempExhCylA7,aTemp*10);
    7:
      Listener.TriggerEvents(Self,epPCSMETempExhCylA8,aTemp*10);
    8:
      Listener.TriggerEvents(Self,epPCSMETempExhCylA9,aTemp*10);
    9:
      Listener.TriggerEvents(Self,epPCSMETempExhCylA10,aTemp*10);
  end;
end;

procedure TMainEngine.SetTempExhCylB(i: Integer;const aTemp : Double);
begin
  if FTempExhCylB[i] = aTemp then
    Exit;

  FTempExhCylB[i] := aTemp;
  case i of
    0:
      Listener.TriggerEvents(Self,epPCSMETempExhCylB1,aTemp*10);
    1:
      Listener.TriggerEvents(Self,epPCSMETempExhCylB2,aTemp*10);
    2:
      Listener.TriggerEvents(Self,epPCSMETempExhCylB3,aTemp*10);
    3:
      Listener.TriggerEvents(Self,epPCSMETempExhCylB4,aTemp*10);
    4:
      Listener.TriggerEvents(Self,epPCSMETempExhCylB5,aTemp*10);
    5:
      Listener.TriggerEvents(Self,epPCSMETempExhCylB6,aTemp*10);
    6:
      Listener.TriggerEvents(Self,epPCSMETempExhCylB7,aTemp*10);
    7:
      Listener.TriggerEvents(Self,epPCSMETempExhCylB8,aTemp*10);
    8:
      Listener.TriggerEvents(Self,epPCSMETempExhCylB9,aTemp*10);
    9:
      Listener.TriggerEvents(Self,epPCSMETempExhCylB10,aTemp*10);
  end;
end;

procedure TMainEngine.SetTempFWHTInlet(const Value: Double);
begin
  if FTempFWHTInlet = Value then
    Exit;

  FTempFWHTInlet := Value;
  Listener.TriggerEvents(Self,epPCSMETempFWHTInlet,Value*10);
end;

procedure TMainEngine.SetTempFWHTOutlet(const Value: Double);
begin
  if FTempFWHTOutlet = Value then
    Exit;

  FTempFWHTOutlet := Value;
  Listener.TriggerEvents(Self,epPCSMETempFWHTOutlet,Value*10);
end;

procedure TMainEngine.SetTempSuperChargAir(const Value: Double);
begin
  if FTempSuperChargAir = Value then
    Exit;

  FTempSuperChargAir := Value;
  Listener.TriggerEvents(Self,epPCSMETempSuperChargAir,Value*10);
end;

procedure TMainEngine.SetTempTCInletA(const Value: Double);
begin
  if FTempTCInletA = Value then
    Exit;

  FTempTCInletA := Value;
  Listener.TriggerEvents(Self,epPCSMETempTCInletA,Value*10);
end;

procedure TMainEngine.SetTempTCInletB(const Value: Double);
begin
  if FTempTCInletB = Value then
    Exit;

  FTempTCInletB := Value;
  Listener.TriggerEvents(Self,epPCSMETempTCInletB,Value*10);
end;

procedure TMainEngine.SetTempTCOutletA(const Value: Double);
begin
  if FTempTCOutletA = Value then
    Exit;

  FTempTCOutletA := Value;
  Listener.TriggerEvents(Self,epPCSMETempTCOutletA,Value*10);
end;

procedure TMainEngine.SetTempTCOutletB(const Value: Double);
begin
  if FTempTCOutletB = Value then
    Exit;

  FTempTCOutletB := Value;
  Listener.TriggerEvents(Self,epPCSMETempTCOutletB,Value*10);
end;

procedure TMainEngine.SetTrailAlarm(const Value: Boolean);
begin
  if FTrailAlarm = Value then
    Exit;

  FTrailAlarm := Value;
  PC_Alarms[15] := Value;
  Listener.TriggerEvents(Self,epPCSMETrailAlarm,Value);
end;

procedure TMainEngine.SetTransferOverride(const Value: Boolean);
begin
  if FTransferOverride = Value then
    Exit;

  FTransferOverride := Value;
  Listener.TriggerEvents(Self,epPCSLeverTransferOverride,Value);
end;

procedure TMainEngine.SetTurboChargerSpeedA(const Value: Double);
begin
  if FTurboChargerSpeedA = Value then
    Exit;

  FTurboChargerSpeedA := Value;
  Listener.TriggerEvents(Self,epPCSMETurboChargerSpeedA,Value);
end;

procedure TMainEngine.SetTurboChargerSpeedB(const Value: Double);
begin
   if FTurboChargerSpeedB = Value then
    Exit;

  FTurboChargerSpeedB := Value;
  Listener.TriggerEvents(Self,epPCSMETurboChargerSpeedB,Value);
end;

procedure TMainEngine.SetTurningGearEngaged(const Value: Boolean);
begin
  if FTurningGearEngaged = Value then
    Exit;

  FTurningGearEngaged := Value;
  PC_StartingInterlocks[1] := Value;
  listener.TriggerEvents(Self,epPCSMETurningGearEngaged,Value);
end;

procedure TMainEngine.SetBearingTempHigh(const Value: Boolean);
begin
  if FBearingTempHigh = Value then
    Exit;

  FBearingTempHigh := Value;
  Listener.TriggerEvents(Self,epPCSMEBearingTempHigh,Value);
end;

procedure TMainEngine.SetBearingTempVeryHigh(const Value: Boolean);
begin
  if FBearingTempVeryHigh = Value then
    Exit;

  FBearingTempVeryHigh := Value;
  Listener.TriggerEvents(Self,epPCSMEBearingTempVeryHigh,Value);
end;

procedure TMainEngine.SetBearTempVeryHigh(const Value: Boolean);
begin
  if FBearTempVeryHigh = Value then
    Exit;

  FBearTempVeryHigh := Value;
  PC_SafetiesStop[3] := Value;
  Listener.TriggerEvents(Self,epPCSMEBearTempVeryHigh,Value);
end;

procedure TMainEngine.SetBridgeControl(const Value: Boolean);
begin
  if FBridgeControl = Value then
    Exit;

  FBridgeControl := Value;
  Listener.TriggerEvents(Self,epPCSCtrlBridge,Value);
end;

procedure TMainEngine.SetBridgeLeverOORFailure(const Value: Boolean);
begin
  if FBridgeLeverOORFailure = Value then
    Exit;

  FBridgeLeverOORFailure := Value;
  PC_Alarms[12] := Value;
  Listener.TriggerEvents(Self,epPCSMEBridgeLeverOORFailure,Value);
end;

procedure TMainEngine.SetBypassP2P4(const Value: Boolean);
begin
  if FBypassP2P4 = Value then
    Exit;

  FBypassP2P4 := Value;
  Listener.TriggerEvents(Self,epPCSMEBypassP2P4,Value);
end;

procedure TMainEngine.SetClutched(const Value: Boolean);
begin
  if FClutched = Value then
    Exit;

  FClutched := Value;
  PC_StartingInterlocks[4] := Value;
  Listener.TriggerEvents(Self,epPCSMEClutched,Value);
end;

procedure TMainEngine.SetClutchFail(const Value: Boolean);
begin
  if FClutchFail = Value then
    Exit;

  FClutchFail := Value;
  PC_Alarms[7] := Value;
  Listener.TriggerEvents(Self,epPCSMEClutchFail,Value);
end;

procedure TMainEngine.SetClutchFailure(const Value: Boolean);
begin
  if FClutchFailure = Value then
    Exit;

  FClutchFailure := Value;
  PC_Alarms[11] := Value;
  Listener.TriggerEvents(Self,epPCSMEClutchFailure,Value);
end;

procedure TMainEngine.SetCommFailEC_PLC(const Value: Boolean);
begin
  if FCommFailEC_PLC = Value then
    Exit;

  FCommFailEC_PLC := Value;
  PC_Alarms[9] := Value;
  Listener.TriggerEvents(Self,epPCSMECommFailEC_PLC,Value);
end;

procedure TMainEngine.SetCompProbA(const Value: Double);
begin
  if FCompProbA = Value then
    Exit;

  FCompProbA := Value;
  Listener.TriggerEvents(Self,epPCSMECompProbA,Value);
end;

procedure TMainEngine.SetCompProbB(const Value: Double);
begin
  if FCompProbB = Value then
    Exit;

  FCompProbB := Value;
  Listener.TriggerEvents(Self,epPCSMECompProbB,Value);
end;

procedure TMainEngine.SetConRodBearingTempHigh(const Value: Boolean);
begin
  if FConRodBearingTempHigh = Value then
    Exit;

  FConRodBearingTempHigh := Value;
  Listener.TriggerEvents(Self,epPCSMEConRodBearingTempHigh,Value);
end;

procedure TMainEngine.SetConRodBearingTempVeryHigh(const Value: Boolean);
begin
  if FConRodBearingTempVeryHigh = Value then
    Exit;

  FConRodBearingTempVeryHigh := Value;
  Listener.TriggerEvents(Self,epPCSMEConRodBearingTempVeryHigh,Value);
end;

procedure TMainEngine.SetConRodBearTempVeryHigh(const Value: Boolean);
begin
  if FConRodBearTempVeryHigh = Value then
    Exit;

  FConRodBearTempVeryHigh := Value;
  PC_SafetiesStop[6] := Value;
  Listener.TriggerEvents(Self,epPCSMEConRodBearTempVeryHigh,Value);
end;

procedure TMainEngine.SetControlAir(const Value: Double);
begin
  if FControlAir = Value then
    exit;

  FControlAir := Value;
  Listener.TriggerEvents(Self,epPCSMEControlAir,Value);
end;

procedure TMainEngine.SetCtrlPowerSupplyOn(const Value: Boolean);
begin
  if FCtrlPowerSupplyOn = Value then
    Exit;

  FCtrlPowerSupplyOn := Value;
  PC_Alarms[1] := Value;
  Listener.TriggerEvents(Self,epPCSMECtrlPowerSupplyOn,Value);
end;

procedure TMainEngine.SetDeclutchFail(const Value: Boolean);
begin
  if FDeclutchFail = Value then
    Exit;

  FDeclutchFail := Value;
  PC_Alarms[8] := Value;
  Listener.TriggerEvents(Self,epPCSMEDeclutchFail,Value);
end;

procedure TMainEngine.SetDecrease(const Value: Boolean);
begin
  if FDecrease = Value then
    exit;

  FDecrease := Value;
  Listener.TriggerEvents(Self,epPCSMEStopDecrease,Value);
end;

procedure TMainEngine.SetDecreaseSpeed(const Value: Boolean);
begin
  if FDecreaseSpeed = Value then
    Exit;

  FDecreaseSpeed := Value;
end;

procedure TMainEngine.SetDelayActualSpeed(const Value: Double);
begin
  if FDelayActualSpeed = Value then
    Exit;

  FDelayActualSpeed := Value;
  Listener.TriggerEvents(Self,epPCSMEDelayActualSpeed,Value);
end;

procedure TMainEngine.SetDevTempExhCylA(i: Integer;const aTemp : Double);
begin
  if FDevTempExhCylA[i] = aTemp then
    Exit;

  FDevTempExhCylA[i] :=  aTemp;
  case i of
    0:
      Listener.TriggerEvents(Self,epPCSMEDevTempExhCylA1, aTemp);
    1:
      Listener.TriggerEvents(Self,epPCSMEDevTempExhCylA2, aTemp);
    2:
      Listener.TriggerEvents(Self,epPCSMEDevTempExhCylA3, aTemp);
    3:
      Listener.TriggerEvents(Self,epPCSMEDevTempExhCylA4, aTemp);
    4:
      Listener.TriggerEvents(Self,epPCSMEDevTempExhCylA5, aTemp);
    5:
      Listener.TriggerEvents(Self,epPCSMEDevTempExhCylA6, aTemp);
    6:
      Listener.TriggerEvents(Self,epPCSMEDevTempExhCylA7, aTemp);
    7:
      Listener.TriggerEvents(Self,epPCSMEDevTempExhCylA8, aTemp);
    8:
      Listener.TriggerEvents(Self,epPCSMEDevTempExhCylA9, aTemp);
    9:
      Listener.TriggerEvents(Self,epPCSMEDevTempExhCylA10, aTemp);
  end;
end;

procedure TMainEngine.SetDevTempExhCylB(i: Integer;const aTemp : Double);
begin
  if FDevTempExhCylB[i] = aTemp then
    Exit;

  FDevTempExhCylB[i] := aTemp;
  case i of
    0:
      Listener.TriggerEvents(Self,epPCSMEDevTempExhCylB1,aTemp);
    1:
      Listener.TriggerEvents(Self,epPCSMEDevTempExhCylB2,aTemp);
    2:
      Listener.TriggerEvents(Self,epPCSMEDevTempExhCylB3,aTemp);
    3:
      Listener.TriggerEvents(Self,epPCSMEDevTempExhCylB4,aTemp);
    4:
      Listener.TriggerEvents(Self,epPCSMEDevTempExhCylB5,aTemp);
    5:
      Listener.TriggerEvents(Self,epPCSMEDevTempExhCylB6,aTemp);
    6:
      Listener.TriggerEvents(Self,epPCSMEDevTempExhCylB7,aTemp);
    7:
      Listener.TriggerEvents(Self,epPCSMEDevTempExhCylB8,aTemp);
    8:
      Listener.TriggerEvents(Self,epPCSMEDevTempExhCylB9,aTemp);
    9:
      Listener.TriggerEvents(Self,epPCSMEDevTempExhCylB10,aTemp);
  end;
end;

procedure TMainEngine.SetEmergencyShutdown(const Value: Boolean);
begin
  if FEmergencyShutdown = Value then
    Exit;

  FEmergencyShutdown := Value;
  PC_SafetiesStop[9] := Value;
  Listener.TriggerEvents(Self,epPCSMEEmergencyShutdown,Value);
end;

procedure TMainEngine.SetEmergencyStop(const Value: Boolean);
begin
  if FEmergencyStop = Value then
    Exit;

  FEmergencyStop := Value;
  Listener.TriggerEvents(Self,epPCSLeverEmergencyStop,Value);
end;

procedure TMainEngine.SetEngineControllerWatchdog(const Value: Boolean);
begin
  if FEngineControllerWatchdog = Value then
    Exit;

  FEngineControllerWatchdog := Value;
  PC_Alarms[0] := Value;
  Listener.TriggerEvents(Self,epPCSMEEngineControllerWatchdog,Value);
end;

procedure TMainEngine.SetEngineRun(const Value: Boolean);
begin
  if FEngineRun = Value then
    Exit;

  FEngineRun := Value;
  Listener.TriggerEvents(Self,epPCSMERunning,Value);
  //Set Fan
  Listener.TriggerEvents(Self,epPCSMEFanExhSupply,Value);
  Listener.TriggerEvents(Self,epPCSMEFanSupply1,Value);
  Listener.TriggerEvents(Self,epPCSMEFanSupply2,Value);
  Listener.TriggerEvents(Self,epPCSMEFanExhSupplyHour,Value);
  Listener.TriggerEvents(Self,epPCSMEFanSupply1Hour,Value);
  Listener.TriggerEvents(Self,epPCSMEFanSupply2Hour,Value);
end;

procedure TMainEngine.SetEngInletLubOilVeryHigh(const Value: Boolean);
begin
  if FEngInletLubOilVeryHigh = Value then
    Exit;

  FEngInletLubOilVeryHigh := Value;
  PC_SafetiesStop[11] := Value;
  Listener.TriggerEvents(Self,epPCSMEEngInletLubOilVeryHigh,Value);
end;

procedure TMainEngine.SetFailure(const Value: Boolean);
begin
  if FFailure = Value then
    Exit;

  FFailure := Value;
  Listener.TriggerEvents(Self,epPCSMEFailure,Value);
end;

procedure TMainEngine.SetFuelMargin(const Value: Double);
begin
  if FFuelMargin = Value then
    exit;

  FFuelMargin := Value;
  Listener.TriggerEvents(Self,epPCSMEFuelMargin, Value);
end;

procedure TMainEngine.SetFuelRack(const Value: Double);
begin
  if FFuelRack = Value then
    exit;

  FFuelRack := Value;
  Listener.TriggerEvents(Self,epPCSMEFuelRack, Value);
end;

procedure TMainEngine.SetFuelRackAtStop(const Value: Boolean);
begin
  if FFuelRackAtStop = Value then
    Exit;

  FFuelRackAtStop := Value;
  PC_StartingInterlocks[3] := Value;
  Listener.TriggerEvents(Self,epPCSMEFuelRackAtStop,Value);
end;

procedure TMainEngine.SetFwHtExpTkLevelVeryLow(const Value: Boolean);
begin
  if FFwHtExpTkLevelVeryLow = Value then
    Exit;

  FFwHtExpTkLevelVeryLow := Value;
  PC_SafetiesStop[4] := Value;
  Listener.TriggerEvents(Self,epPCSMEFwHtExpTkLevelVeryLow,Value);
end;

procedure TMainEngine.SetFwTempVeryHigh(const Value: Boolean);
begin
  if FFwTempVeryHigh = Value then
    Exit;

  FFwTempVeryHigh := Value;
  PC_SafetiesStop[5] := Value;
  Listener.TriggerEvents(Self,epPCSMEFwTempVeryHigh,Value);
end;

procedure TMainEngine.SetGasValve(const Value: Boolean);
begin
  if FGasValve = Value then
    Exit;

  FGasValve := Value;
  Listener.TriggerEvents(Self,epPCSMEGasValve,Value);
end;

procedure TMainEngine.SetGeneralSensorFailure(const Value: Boolean);
begin
  if FGeneralSensorFailure = Value then
    Exit;

  FGeneralSensorFailure := Value;
  PC_Alarms[14] := Value;
  Listener.TriggerEvents(Self,epPCSMEGeneralSensorFailure,Value);
end;

procedure TMainEngine.SetGovernorMinorFail(const Value: Boolean);
begin
  if FGovernorMinorFail = Value then
    Exit;

  FGovernorMinorFail := Value;
  PC_Alarms[4] := Value;
  Listener.TriggerEvents(Self,epPCSMEGovernorMinorFail,Value);
end;

procedure TMainEngine.SetHeater(const Value: Boolean);
begin
  if FHeater = Value then
    Exit;

  FHeater := Value;
  Listener.TriggerEvents(Self,epPCSMEHeater,Value);
end;

procedure TMainEngine.SetHeaterAuto(const Value: Boolean);
begin
  if FHeaterAuto = Value then
    Exit;

  FHeaterAuto := Value;
end;

procedure TMainEngine.SetIncreaseSpeed(const Value: Boolean);
begin
  if FIncreaseSpeed = Value then
    Exit;

  FIncreaseSpeed := Value;
end;

procedure TMainEngine.SetInjPipeALeakFO(const Value: Boolean);
begin
  if FInjPipeALeakFO = Value then
    Exit;

  FInjPipeALeakFO := Value;
  Listener.TriggerEvents(Self,epPCSMEInjPipeALeakFO,Value);
end;

procedure TMainEngine.SetInjPipeBLeakFO(const Value: Boolean);
begin
  if FInjPipeBLeakFO = Value then
    Exit;

  FInjPipeBLeakFO := Value;
  Listener.TriggerEvents(Self,epPCSMEInjPipeBLeakFO,Value);
end;

procedure TMainEngine.SetLeverControl(const Value: Integer);
begin
  if FLeverControl = Value then
    Exit;

  FLeverControl := Value;
  Listener.TriggerEvents(Self,epPCSCtrlLever, Value);
end;

procedure TMainEngine.SetLeverSpeed(const Value: Double);
begin
  if FLeverSpeed = Value then
    exit;

  FLeverSpeed := Value;
  Listener.TriggerEvents(Self,epPCSMELeverSpeed, Value);
end;

procedure TMainEngine.SetLocalControl(const Value: Boolean);
begin
  if FLocalControl = Value then
    Exit;

  FLocalControl := Value;
  Listener.TriggerEvents(Self,epPCSCtrlLocal,Value);
end;

procedure TMainEngine.SetLocalCtrlFail(const Value: Boolean);
begin
  if FLocalCtrlFail = Value then
    Exit;

  FLocalCtrlFail := Value;
  PC_Alarms[6] := Value;
  Listener.TriggerEvents(Self,epPCSMELocalCtrlFail,Value);
end;

procedure TMainEngine.SetLocalEmergencyStop(const Value: Boolean);
begin
  if FLocalEmergencyStop = Value then
    Exit;

  FLocalEmergencyStop := Value;
  PC_SafetiesStop[10] := Value;
  Listener.TriggerEvents(Self,epPCSMELocalEmergencyStop,Value);
end;

procedure TMainEngine.SetLOPressClogg(const Value: Boolean);
begin
  if FLOPressClogg = Value then
    Exit;

  FLOPressClogg := Value;
  Listener.TriggerEvents(Self,epPCSMELOPressClogg,Value);
end;

procedure TMainEngine.SetLOPressInlet(const Value: Double);
begin
  if FLOPressInlet = Value then
    Exit;

  FLOPressInlet := Value;
  Listener.TriggerEvents(Self,epPCSMELOPressInlet,Value);
end;

procedure TMainEngine.SetLOPressureVeryLow(const Value: Boolean);
begin
  if FLOPressureVeryLow = Value then
    Exit;

  FLOPressureVeryLow := Value;
  PC_SafetiesStop[2] := Value;
  Listener.TriggerEvents(Self,epPCSMELOPressureVeryLow,Value);
end;

procedure TMainEngine.SetLOPressVeryLow(const Value: Boolean);
begin
  if FLOPressVeryLow = Value then
    Exit;

  FLOPressVeryLow := Value;
  Listener.TriggerEvents(Self,epPCSMELOPressVeryLow,Value);
end;

procedure TMainEngine.SetLOTempInlet(const Value: Double);
begin
  if FLOTempInlet = Value then
    Exit;

  FLOTempInlet := Value;
  Listener.TriggerEvents(Self,epPCSMELOTempInlet,Value*10);
end;

procedure TMainEngine.SetManHandleAtStop(const Value: Boolean);
begin
  if FManHandleAtStop = Value then
    Exit;

  FManHandleAtStop := Value;
  PC_StartingInterlocks[2] := Value;
  Listener.TriggerEvents(Self,epPCSMEManHandleAtStop,Value);
end;

procedure TMainEngine.SetMCRControl(const Value: Boolean);
begin
  if FMCRControl = Value then
    Exit;

  FMCRControl := Value;
  Listener.TriggerEvents(Self,epPCSCtrlMCR,Value);
end;

procedure TMainEngine.SetMCRLeverOORFailure(const Value: Boolean);
begin
  if FMCRLeverOORFailure = Value then
    Exit;

  FMCRLeverOORFailure := Value;
  PC_Alarms[13] := Value;
  Listener.TriggerEvents(Self,epPCSMEMCRLeverOORFailure,Value);
end;

procedure TMainEngine.SetOilMistDetAlarm(const Value: Boolean);
begin
  if FOilMistDetAlarm = Value then
    Exit;

  FOilMistDetAlarm := Value;
  Listener.TriggerEvents(Self,epPCSMEOilMistDetAlarm,Value);
end;

procedure TMainEngine.SetOilMistDetFailure(const Value: Boolean);
begin
  if FOilMistDetFailure = Value then
    Exit;

  FOilMistDetFailure := Value;
  Listener.TriggerEvents(Self,epPCSMEOilMistDetFailure,Value);
end;

procedure TMainEngine.SetOilMistDetHigh(const Value: Boolean);
begin
  if FOilMistDetHigh = Value then
    Exit;

  FOilMistDetHigh := Value;
  PC_SafetiesStop[8] := Value;
  Listener.TriggerEvents(Self,epPCSMEOilMistDetHigh,Value);
end;

procedure TMainEngine.SetOilMistDetSafety(const Value: Boolean);
begin
  if FOilMistDetSafety = Value then
    Exit;

  FOilMistDetSafety := Value;
  Listener.TriggerEvents(Self,epPCSMEOilMistDetSafety,Value);
end;

procedure TMainEngine.SetOilSumpLevel(const Value: Boolean);
begin
  if FOilSumpLevel = Value then
    Exit;

  FOilSumpLevel := Value;
  Listener.TriggerEvents(Self,epPCSMEOilSumpLevel,Value);
end;

procedure TMainEngine.SetOverspeed(const Value: Boolean);
begin
  if FOverspeed = Value then
    exit;

  FOverspeed := Value;
  PC_SafetiesStop[1] := Value;
  Listener.TriggerEvents(Self,epPCSMEOverspeed,Value);
end;

procedure TMainEngine.SetOverspeedAlarm(const Value: Boolean);
begin
  if FOverspeedAlarm = Value then
    Exit;

  FOverspeedAlarm := Value;
  Listener.TriggerEvents(Self,epPCSMEOverspeedAlarm,Value);
end;

procedure TMainEngine.SetPCSAlarms(const Value: Boolean);
begin
  if FPCSAlarms = Value then
    Exit;

  FPCSAlarms := Value;
  Listener.TriggerEvents(Self,epPCSAlarms,Value);
end;

procedure TMainEngine.SetPC_Alarms(i: Integer; const aValue: Boolean);
begin
  FPC_Alarms[i] := aValue;
end;

procedure TMainEngine.SetPC_SafetiesStop(i: Integer; const aValue: Boolean);
begin
  FPC_SafetiesStop[i] := aValue;
end;

procedure TMainEngine.SetPC_StartingInterlocks(i: Integer;
  const aValue: Boolean);
begin
  FPC_StartingInterlocks[i] := aValue;
end;

procedure TMainEngine.SetPLCMonitoringFail(const Value: Boolean);
begin
  if FPLCMonitoringFail = Value then
    Exit;

  FPLCMonitoringFail := Value;
  PC_Alarms[10] := Value;
  Listener.TriggerEvents(Self,epPCSMEPLCMonitoringFail,Value);
end;

procedure TMainEngine.SetPreHeatingPump(const Value: Boolean);
begin
  if FPreHeatingPump = Value then
    Exit;

  FPreHeatingPump := Value;
  Listener.TriggerEvents(Self,epPCSMEPreHeatingPump,Value);
end;

procedure TMainEngine.SetPreHeatingPumpAuto(const Value: Boolean);
begin
  if FPreHeatingPumpAuto = Value then
    Exit;

  FPreHeatingPumpAuto := Value;
end;

procedure TMainEngine.SetPrelubeFailure(const Value: Boolean);
begin
  if FPrelubeFailure = Value then
    Exit;

  FPrelubeFailure := Value;
  Listener.TriggerEvents(Self,epPCSMEPrelubeFailure,Value);
end;

procedure TMainEngine.SetPrelubeInProgress(const Value: Boolean);
begin
  if FPrelubeInProgress = Value then
    Exit;

  FPrelubeInProgress := Value;
  PC_StartingInterlocks[11] := Value;
  Listener.TriggerEvents(Self,epPCSMEPrelubInProgress,Value);
end;

procedure TMainEngine.SetPrelubricationFailure(const Value: Boolean);
begin
  if FPrelubricationFailure = Value then
    Exit;

  FPrelubricationFailure := Value;
  PC_StartingInterlocks[10] := Value;
  Listener.TriggerEvents(Self,epPCSMEPrelubricationFailure,Value);
end;

procedure TMainEngine.SetPressAirInlet(const Value: Double);
begin
  if FPressAirInlet = Value then
    Exit;

  FPressAirInlet := Value;
  Listener.TriggerEvents(Self,epPCSMEPressAirInlet,Value);
end;

procedure TMainEngine.SetPressFOClogg(const Value: Boolean);
begin
  if FPressFOClogg = Value then
    Exit;

  FPressFOClogg := Value;
  Listener.TriggerEvents(Self,epPCSMEPressFOClogg,Value);
end;

procedure TMainEngine.SetPressFOInlet(const Value: Double);
begin
  if FPressFOInlet = Value then
    Exit;

  FPressFOInlet := Value;
  Listener.TriggerEvents(Self,epPCSMEPressFOInlet,Value);
end;

procedure TMainEngine.SetPressFWHTInlet(const Value: Double);
begin
  if FPressFWHTInlet = Value then
    Exit;

  FPressFWHTInlet := Value;
  Listener.TriggerEvents(Self,epPCSMEPressFWHTInlet,Value);
end;

procedure TMainEngine.SetPressSeaWaterOutlet(const Value: Double);
begin
  if FPressSeaWaterOutlet = Value then
    Exit;

  FPressSeaWaterOutlet := Value;
  Listener.TriggerEvents(Self,epPCSMEPressSeaWaterOutlet,Value);
end;

procedure TMainEngine.SetPreStartInhibition(const Value: Boolean);
begin
  if FPreStartInhibition = Value then
    Exit;

  FPreStartInhibition := Value;
end;

procedure TMainEngine.SetPrimLOPump(const Value: Boolean);
begin
  if FPrimLOPump = Value then
    Exit;

  FPrimLOPump := Value;
  Listener.TriggerEvents(Self,epPCSMEPrimLOPump,Value);
end;

procedure TMainEngine.SetPrimLOPumpAuto(const Value: Boolean);
begin
  if FPrimLOPumpAuto = Value then
    Exit;

  FPrimLOPumpAuto := Value;
end;

procedure TMainEngine.SetReadyForUse(const Value: Boolean);
begin
  if FReadyForUse = Value then
    Exit;

  FReadyForUse := Value;
  Listener.TriggerEvents(Self,epPCSMEReadyForUse, Value);
end;

procedure TMainEngine.SetRedGearSafetyStop(const Value: Boolean);
begin
  if FRedGearSafetyStop = Value then
    Exit;

  FRedGearSafetyStop := Value;
  PC_SafetiesStop[7] := Value;
  Listener.TriggerEvents(Self,epPCSMERedGearSafetyStop,Value);
end;

procedure TMainEngine.SetRemoteAuto(const Value: Boolean);
begin
  if FRemoteAuto = Value then
    Exit;

  FRemoteAuto := Value;
  Listener.TriggerEvents(Self,epPCSMERemoteAuto, Value);
end;

procedure TMainEngine.SetRemoteControlProposed(const Value: Boolean);
begin
  if FRemoteControlProposed = Value then
    Exit;

  FRemoteControlProposed := Value;
  Listener.TriggerEvents(Self, epPCSMERemoteControlProposed, Value);
end;

procedure TMainEngine.SetRemoteManual(const Value: Boolean);
begin
  if FRemoteManual = Value then
    Exit;

  FRemoteManual := Value;
  Listener.TriggerEvents(Self,epPCSMERemoteManual, Value);
end;

procedure TMainEngine.SetRemoteStartInterlock(const Value: Boolean);
begin
  if FRemoteStartInterlock = Value then
    Exit;

  FRemoteStartInterlock := Value;
  PC_StartingInterlocks[0] := Value;
  Listener.TriggerEvents(Self,epPCSMERemoteStartInterlock,Value);
end;

procedure TMainEngine.SetResetSafetyStopPossible(const Value: Boolean);
begin
  if FResetSafetyStopPossible = Value then
    Exit;

  FResetSafetyStopPossible := Value;
  PC_Alarms[16] := Value;
  Listener.TriggerEvents(Self,epPCSMEResetSafetyStopPossible,Value);
end;

procedure TMainEngine.SetRunningHour(const Value: Boolean);
begin
  if FRunningHour = Value then
    Exit;

  FRunningHour := Value;
  Listener.TriggerEvents(Self,eppCSMERunningHour,Value);
end;

procedure TMainEngine.SetSafetiesStop(const Value: Boolean);
begin
  if FSafetiesStop = Value then
    Exit;

  FSafetiesStop := Value;
  Listener.TriggerEvents(Self, epPCSMESafetiesStop, Value);
end;

procedure TMainEngine.SetSafetyPowerSuppOn(const Value: Boolean);
begin
  if FSafetyPowerSuppOn = Value then
    Exit;

  FSafetyPowerSuppOn := Value;
  PC_Alarms[2] := Value;
  Listener.TriggerEvents(Self,epPCSMESafetyPowerSuppOn,Value);
end;

procedure TMainEngine.SetSafetyStop(const Value: Boolean);
begin
  if FSafetyStop = Value then
    Exit;

  FSafetyStop := Value;
  PC_StartingInterlocks[9] := Value;
  Listener.TriggerEvents(Self,epPCSMESafetyStop,Value);
end;

procedure TMainEngine.SetSafetyStopsOverriden(const Value: Boolean);
begin
  if FSafetyStopsOverriden = Value then
    Exit;

  FSafetyStopsOverriden := Value;
  PC_SafetiesStop[0] := Value;
  Listener.TriggerEvents(Self,epPCSMESafetyStopsOverriden,Value);
end;

procedure TMainEngine.SetSafetyStopSysFail(const Value: Boolean);
begin
  if FSafetyStopSysFail = Value then
    Exit;

  FSafetyStopSysFail := Value;
  PC_StartingInterlocks[8] := Value;
  Listener.TriggerEvents(Self,epPCSMESafetyStopSysFail,Value);
end;

procedure TMainEngine.SetSetpointSpeed(const Value: Double);
begin
  if FSetPointSpeed = Value then
    exit;

  FSetPointSpeed := Value;
  Listener.TriggerEvents(Self,epPCSMESetPointSpeed, Value);
end;


procedure TMainEngine.SetSlowTurningFault(const Value: Boolean);
begin
  if FSlowTurningFault = Value then
    Exit;

  FSlowTurningFault := Value;
  PC_StartingInterlocks[6] := Value;
  Listener.TriggerEvents(Self,epPCSMESlowTurningFault,Value);
end;

procedure TMainEngine.SetSpeed(const Value: Double);
begin
  if FSpeed = Value then
    Exit;

  FSpeed := Value;
  Listener.TriggerEvents(Self,epPCSMESpeed,Value);
end;

procedure TMainEngine.SetStartingAir(const Value: Double);
begin
  if FStartingAir = Value then
    exit;

  FStartingAir := Value;
  Listener.TriggerEvents(Self,epPCSMEStartingAir,Value);
end;

procedure TMainEngine.SetStartingFault(const Value: Boolean);
begin
  if FStartingFault = Value then
    Exit;

  FStartingFault := Value;
  PC_StartingInterlocks[5] := Value;
  Listener.TriggerEvents(Self,epPCSMEStartingFault,Value);
end;

procedure TMainEngine.SetStartingInProgress(const Value: Boolean);
begin
  if FStartingInProgress = Value then
    Exit;

  FStartingInProgress := Value;
  Listener.TriggerEvents(Self, epPCSMEStartingInProgress, Value);
end;

procedure TMainEngine.SetStartingInterlocks(const Value: Boolean);
begin
  if FStartingInterlocks = Value then
    Exit;

  FStartingInterlocks := Value;
  Listener.TriggerEvents(Self, epPCSMEStartingInterlocks, Value);
end;

procedure TMainEngine.SetSTCInManualMode(const Value: Boolean);
begin
  if FSTCInManualMode = Value then
    Exit;

  FSTCInManualMode := Value;
  PC_Alarms[5] := Value;
  Listener.TriggerEvents(Self,epPCSMESTCInManualMode,Value);
end;

procedure TMainEngine.SetSTCSequenceAlarm(const Value: Boolean);
begin
  if FSTCSequenceAlarm = Value then
    Exit;

  FSTCSequenceAlarm := Value;
  PC_Alarms[3] := Value;
  Listener.TriggerEvents(Self,epPCSMESTCSequenceAlarm,Value);
end;

procedure TMainEngine.SetSTCSequenceFail(const Value: Boolean);
begin
  if FSTCSequenceFail = Value then
    Exit;

  FSTCSequenceFail := Value;
  PC_StartingInterlocks[7] := Value;
  Listener.TriggerEvents(Self,epPCSMESTCSequenceFail,Value);
end;

procedure TMainEngine.SetStopIncrease(const Value: Boolean);
begin
  if FStopIncrease = Value then
    exit;

  FStopIncrease := Value;
  Listener.TriggerEvents(Self,epPCSMEStopIncrease,Value);
end;

end.
