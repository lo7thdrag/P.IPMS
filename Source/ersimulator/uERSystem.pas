unit uERSystem;

interface

uses uDataType, Classes, uDatabase, uERManager, uERNetwork, uListener, uSwitchboard, uGenerator,
  SysUtils, uFreezeFrom, uMainEngine, uCPP, uGearBox, uTCPClient, Forms;

type

  TERSystem = class
  private

    FIPMSDatabase  : TIPMSDatabase;
    FERManager     : TERManager;
    FERNetwork     : TERNetwork;
    FFreedDatabase : boolean;
    FOnPMSCommand : T_OnPMSCommand;
    FOnPCSCommand : T_OnPCSCommand;
    FOnTankCommand : T_OnTankCommand;

    FLoggerFileName : String;
    FFile : TextFile;
    FNum  : Int64;

    procedure OnNetworkLogger(const Value : string);
    procedure NetworkEventAssignment;
    procedure CreateCommon;
    procedure ElementPropByteChange(Sender: TObject; PropsID: E_PropsID;
      Value: Byte); overload;
    procedure ElementPropIntChange(Sender: TObject; PropsID: E_PropsID;
      Value: Integer); overload;
    procedure ElementPropDblChange(Sender: TObject; PropsID: E_PropsID;
      Value: Double); overload;
    procedure ElementPropStrChange(Sender: TObject; PropsID: E_PropsID;
      Value: String); overload;
    procedure ElementPropBoolChange(Sender: TObject; PropsID: E_PropsID;
      Value: Boolean); overload;

    procedure LoggedProperties(Value : String);
    procedure LogElementPropByteChange(Sender: TObject; PropsID: E_PropsID;
      Value: Byte); overload;
    procedure LogElementPropIntChange(Sender: TObject; PropsID: E_PropsID;
      Value: Integer); overload;
    procedure LogElementPropDblChange(Sender: TObject; PropsID: E_PropsID;
      Value: Double); overload;
    procedure LogElementPropStrChange(Sender: TObject; PropsID: E_PropsID;
      Value: String); overload;
    procedure LogElementPropBoolChange(Sender: TObject; PropsID: E_PropsID;
      Value: Boolean); overload;

    //Prince
    function toCheckCB(IdGen : string; IdMsb : Integer): boolean;
    procedure NetEvent_MimicCommonCmd(apRec: PAnsiChar; aSize: Word);
    procedure SetOnPCSCommand(const Value: T_OnPCSCommand);
    procedure SetOnPMSCommand(const Value: T_OnPMSCommand);
    procedure SetOnTankCommand(const Value: T_OnTankCommand);
  public
    constructor Create; overload;
    constructor Create(aDatabase : TIPMSDatabase); overload;
    destructor  Destroy; override;

    property ERManager : TERManager read FERManager;
    property Network : TERNetwork read FERNetwork;
    property Database : TIPMSDatabase read FIPMSDatabase;

    property OnPMSCommand : T_OnPMSCommand read FOnPMSCommand
      write SetOnPMSCommand;
    property OnPCSCommand : T_OnPCSCommand read FOnPCSCommand
      write SetOnPCSCommand;
    property OnTankCommand : T_OnTankCommand read FOnTankCommand
      write SetOnTankCommand;
  end;

var
  ERSystem : TERSystem;

implementation

uses
  uTank,uEntity,TypInfo;

{ TERSystem }

constructor TERSystem.Create;
begin
  FFreedDatabase:= True;
  FIPMSDatabase := TIPMSDatabase.Create;

  CreateCommon;
  NetworkEventAssignment;
end;

constructor TERSystem.Create(aDatabase: TIPMSDatabase);
begin
  FFreedDatabase:= False;
  FIPMSDatabase := aDatabase;

  CreateCommon;
  NetworkEventAssignment;
end;

destructor TERSystem.Destroy;
begin
  Close(FFile);

  if FFreedDatabase then
    FreeAndNil(FIPMSDatabase);

  FERManager.Free;
  FERNetwork.Free;

  inherited;
end;

procedure TERSystem.ElementPropBoolChange(Sender: TObject; PropsID: E_PropsID; Value: Boolean);
var
  rPmsCmd : R_Common_PMS_Command;
  rPCSCmd : R_Common_PCS_Command;
begin
  case PropsID of
    epPMSGeneratorEngineRun, epPMSGeneratorSupplied, epPMSGeneratorStop, epPMSGeneratorCBClosed,
    epPMSGeneratorPreference, epPMSNotStandby, epPMSCanBusFailure, epPMSMeasPowFailure, epPMSDCPowFailure,
    epPMSEngineAlarm, epPMSShutdown, epPMSFaultPageLed, epPMSGeneratorFuelRunsOut, epPMSFailureCBClosed,

    epPMSMsbCBShore, epPMSMsbCBIntr, epPMSMsbCBNavNaut, epPMSGeneratorRunHour,epPMSGeneratorEmergencyStop,
    epPMSMsbTripReduct, epPMSSycnFail :
    begin
      if Sender is TGenerator then
        rPmsCmd.GenSwitchID := TGenerator(Sender).Identifier
      else if Sender is TSwitchboard then
        rPmsCmd.GenSwitchID := TSwitchboard(Sender).Identifier;

      rPmsCmd.CommandID   := PropsID;
      rPmsCmd.ValueBool   := Value;
      rPmsCmd.ValueKind   := 'boolean';

      if Assigned(FOnPMSCommand) then
        FOnPMSCommand(rPmsCmd);
//      Network.AsServer.SendData(C_PMS_COMMAND,@rPmsCmd);
    end;
    {epPMSGeneratorCBClosedE}epPMSEsbCBIntr :
    begin
      rPmsCmd.GenSwitchID := TSwitchboard(Sender).Identifier;
      rPmsCmd.CommandID   := PropsID;
      rPmsCmd.ValueInt    := TSwitchboard(Sender).ESBIntrMode;
      rPmsCmd.ValueBool   := Value;
      rPmsCmd.ValueKind   := 'boolean';

      //      Network.AsServer.SendData(C_PMS_COMMAND,@rPmsCmd);
      if Assigned(FOnPMSCommand) then
        FOnPMSCommand(rPmsCmd);
    end;

    {Paket data dikirimkan ke Mimic dan PCS Panel}
    epPCSMERunning, epPCSMERemoteAuto, epPCSMERemoteManual, epPCSMEReadyForUse,
    epPCSCPPRemoteAuto, epPCSCPPRemoteManual, epPCSCPPRemote, epPCSCPPReadyForUse,
    epPCSGBRemoteAuto, epPCSGBRemoteManual, epPCSGBClutchAllowed, epPCSGBClutchEngaged,
    epPCSGBReadyForUse, epPCSMETransitMode, epPCSMEManouveringMode,
    epPCSCPPPumpStart1,epPCSCPPPumpStart2, epPCSCPPPumpStart3, epPCSCPPPumpStandby1, epPCSCPPPumpStandby2,
    epPCSLeverShaftDriven, epPCSLeverShaftStop, epPCSLeverShaftTrailing, epPCSLeverEmergencyStop,
    epPCSLeverTransferOverride, epPCSCtrlLocal, epPCSCtrlMCR, epPCSCtrlBridge,
    epPCSMEFailure, epPCSGBFailure, epPCSCPPFailure, epPCSGBShaftLocked,
    epPCSGBShaftPowerLimited, epPCSAlarms:
    begin
      if Sender is TMainEngine then
        rPCSCmd.PortStaboardID := TMainEngine(Sender).Identifier
      else
      if Sender is TCPP then
        rPCSCmd.PortStaboardID := TCPP(Sender).Identifier
      else
      if Sender is TGearBox then
        rPCSCmd.PortStaboardID := TGearBox(Sender).Identifier;
      rPCSCmd.CommandPropsID := PropsID;
      rPCSCmd.ValueBool := Value;
      if Value then
        rPCSCmd.ValueInt := 1
      else
        rPCSCmd.ValueInt := 0;

      Network.AsServer.SendData(C_PCS_COMMAND,@rPCSCmd);
      if Assigned(FOnPCSCommand) then
        FOnPCSCommand(rPCSCmd);
    end;

    {Paket data hanya dikirimkan ke Panel PCS}
    epPCSCtrlLamptTest:
    begin
      rPCSCmd.CommandID := C_ORD_CTRL_LAMPTEST;
      if Value then
        rPCSCmd.ValueInt := 10
      else
        rPCSCmd.ValueInt := 0;

      Network.AsServer.SendData(C_PCS_COMMAND,@rPCSCmd);
    end;

    epPCSCtrlAlarmAccept, epPCSCtrlStopHorn, epPCSCtrlBackgroundLamp:
    begin
      if PropsID = epPCSCtrlAlarmAccept then
        rPCSCmd.CommandID := C_ORD_CTRL_ALARMACCEPT
      else
      if PropsID = epPCSCtrlStopHorn then
        rPCSCmd.CommandID := C_ORD_CTRL_STOPHORN
      else
      if PropsID = epPCSCtrlBackgroundLamp then
        rPCSCmd.CommandID := C_ORD_CTRL_BACKGROUND_LAMP;

      if Value then
        rPCSCmd.ValueInt := 1
      else
        rPCSCmd.ValueInt := 0;

      Network.AsServer.SendData(C_PCS_COMMAND,@rPCSCmd);
    end;

    {Paket data hanya dikirimkan ke Mimic}
    eppCSMERunningHour, epPCSMEOverspeed, epPCSMELOPumpHour,
    epPCSMESafetyShutdown, epPCSMERemoteCtrl, epPCSMELowLoad, epPCSMEVeryLowLoad,
    epPCSMEFsrTimerExpired, epPCSMEMaxFsrKeySwitch, epPCSMEStopIncrease, epPCSMEStopDecrease,
    epPCSMEConRodBearingTempHigh, epPCSMEConRodBearingTempVeryHigh, epPCSMEBearingTempHigh,
    epPCSMEBearingTempVeryHigh, epPCSMEOilMistDetSafety, epPCSMEOilMistDetFailure,
    epPCSMEOilMistDetAlarm, epPCSMEPrelubeInProgress, epPCSMEPrelubeFailure,
    epPCSMEOilSumpLevel, epPCSMEHeater,epPCSMELOPressVeryLow, epPCSMELOPressClogg,
    epPCSMEPressFOClogg, epPCSMEInjPipeALeakFO, epPCSMEInjPipeBLeakFO,
    epPCSMEPrimLOPump, epPCSMEPreHeatingPump, epPCSMEAirValve, epPCSMEGasValve, epPCSMEBypassP2P4,

    epPCSMERemoteStartInterlock, epPCSMETurningGearEngaged, epPCSMEManHandleAtStop, epPCSMEFuelRackAtStop,
    epPCSMEClutched, epPCSMEStartingFault, epPCSMESlowTurningFault, epPCSMESTCSequenceFail, epPCSMESafetyStopSysFail,
    epPCSMESafetyStop, epPCSMEPrelubricationFailure, epPCSMEPrelubInProgress, epPCSMESafetyStopsOverriden, epPCSMEOverspeedAlarm,
    epPCSMELOPressureVeryLow, epPCSMEBearTempVeryHigh, epPCSMEFwHtExpTkLevelVeryLow, epPCSMEFwTempVeryHigh,
    epPCSMEConRodBearTempVeryHigh, epPCSMERedGearSafetyStop, epPCSMEOilMistDetHigh, epPCSMEEmergencyShutdown,
    epPCSMELocalEmergencyStop, epPCSMEEngInletLubOilVeryHigh, epPCSMEEngineControllerWatchdog, epPCSMECtrlPowerSupplyOn,
    epPCSMESafetyPowerSuppOn, epPCSMESTCSequenceAlarm, epPCSMEGovernorMinorFail, epPCSMESTCInManualMode, epPCSMELocalCtrlFail,
    epPCSMEClutchFail, epPCSMEDeclutchFail, epPCSMECommFailEC_PLC, epPCSMEPLCMonitoringFail, epPCSMEClutchFailure,
    epPCSMEBridgeLeverOORFailure, epPCSMEMCRLeverOORFailure, epPCSMEGeneralSensorFailure, epPCSMETrailAlarm,
    epPCSMEResetSafetyStopPossible, epPCSMEStartingInterlocks,

    epPCSCPPHydraulicPumpHour1, epPCSCPPHydraulicPumpHour2, epPCSCPPHydraulicPumpHour3,
    epPCSCPPOilFilterClogged, epPCSCPPPitchNotZero, epPCSCPPCLSControl, epPCSCPPBackupSupplyFail,
    epPCSCPPFollowUpError, epPCSCPPHPPOilLevel, epPCSCPPOilLevel, epPCSCPPLocal,

    epPCSGBClutchEngagedVCE,  epPCSGBSWFlowBearing, epPCSGBStandbyPump, epPCSGBPumpNotAuto,
    epPCSGBPumpStandbyStart, epPCSGBOilLevel, epPCSGBFilter11, epPCSGBFilter12, epPCSGBLOPressInletLow,
    epPCSGBPitchNotZero, epPCSGBPCSClutchInterlock, epPCSGBClutchAllowedLOP,
    epPCSGBClutchInterlocks,

    epPCSMERemoteControlProposed, epPCSMEStartingInProgress, epPCSME2TCMode, epPCSGBClutched,
    epPCSGBDeclutched, epPCSGBSafetyDeclutch,

    epPCSMEFanExhSupply, epPCSMEFanSupply1, epPCSMEFanSupply2,
    epPCSMEFanExhSupplyHour, epPCSMEFanSupply1Hour, epPCSMEFanSupply2Hour:
    begin
      if Sender is TMainEngine then
        rPCSCmd.PortStaboardID := TMainEngine(Sender).Identifier
      else
      if Sender is TCPP then
        rPCSCmd.PortStaboardID := TCPP(Sender).Identifier
      else
      if Sender is TGearBox then
        rPCSCmd.PortStaboardID := TGearBox(Sender).Identifier;
      rPCSCmd.CommandPropsID := PropsID;
      rPCSCmd.ValueBool := Value;
      if Value then
        rPCSCmd.ValueInt := 1
      else
        rPCSCmd.ValueInt := 0;

      if Assigned(FOnPCSCommand) then
        FOnPCSCommand(rPCSCmd);
    end;
  end;
end;

procedure TERSystem.ElementPropByteChange(Sender: TObject; PropsID: E_PropsID; Value: Byte);
begin

end;

procedure TERSystem.ElementPropIntChange(Sender: TObject; PropsID: E_PropsID; Value: Integer);
var
  rPCSCmd : R_Common_PCS_Command;
  rPmsCmd : R_Common_PMS_Command;
begin
  case PropsID of
//    epPCSCtrlBackgroundLamp:
//    begin
//      rPCSCmd.CommandID := C_ORD_CTRL_BACKGROUND_LAMP;
//      rPCSCmd.ValueInt := Value;
//      Network.AsServer.SendData(C_PCS_COMMAND,@rPCSCmd);
//    end;

    //Rudder
    epRudderValuePS, epRudderValueSB:
    begin
      if PropsID = epRudderValuePS then
      begin
        rPCSCmd.CommandPropsID := epRudderValuePS;
        rPCSCmd.PortStaboardID := C_PCS_ME_PORTS;
      end
      else
      begin
        rPCSCmd.CommandPropsID := epRudderValueSB;
        rPCSCmd.PortStaboardID := C_PCS_ME_STARBOARD;
      end;

      rPCSCmd.CommandID := C_ORD_RUDDER;
      rPCSCmd.ValueInt := Value;
      rPCSCmd.ValueDouble := Round(Value);
      Network.AsServer.SendData(C_PCS_COMMAND,@rPCSCmd);
      if Assigned(FOnPCSCommand) then
        FOnPCSCommand(rPCSCmd);
    end;


    epPMSGeneratorMode, epPMSGeneratorState:
    begin
      if Sender is TGenerator then
        rPmsCmd.GenSwitchID := TGenerator(Sender).Identifier
      else if Sender is TSwitchboard then
        rPmsCmd.GenSwitchID := TSwitchboard(Sender).Identifier;

      rPmsCmd.CommandID   := PropsID;
      rPmsCmd.ValueInt    := Value;
      rPmsCmd.ValueKind   := 'integer';
//      Network.AsServer.SendData(C_PMS_COMMAND,@rPmsCmd);
      if Assigned(FOnPMSCommand) then
        FOnPMSCommand(rPmsCmd);
    end;

    epPMSPowerConsmr:
    begin
      rPmsCmd.GenSwitchID := TGenerator(Sender).Identifier;
      rPmsCmd.CommandID   := PropsID;
      rPmsCmd.ValueInt    := Value;
      rPmsCmd.ValueKind   := 'integer';
//      Network.AsServer.SendData(C_PMS_COMMAND,@rPmsCmd);
      if Assigned(FOnPMSCommand) then
        FOnPMSCommand(rPmsCmd);
    end;
  end;
end;

procedure TERSystem.ElementPropStrChange(Sender: TObject;
  PropsID: E_PropsID; Value: String);
begin

end;

procedure TERSystem.LogElementPropBoolChange(Sender: TObject;
  PropsID: E_PropsID; Value: Boolean);
var
  s : String;
begin

  s := GetEnumName(TypeInfo(E_PropsID),integer(PropsID)) ;

  if Sender is TEntity then
    s := TEntity(Sender).Identifier + ':' + s + '->' + BoolToStr(Value,True)
  else
    s := Sender.ClassName + ':' + s + '->' + BoolToStr(Value,True);

  LoggedProperties(s);
end;

procedure TERSystem.LogElementPropByteChange(Sender: TObject;
  PropsID: E_PropsID; Value: Byte);
var
  s : String;
begin

  s := GetEnumName(TypeInfo(E_PropsID),integer(PropsID)) ;

  if Sender is TEntity then
    s := TEntity(Sender).Identifier + ':' + s + '->' + IntToStr(Value)
  else
    s := Sender.ClassName + ':' + s + '->' + IntToStr(Value);

  LoggedProperties(s);
end;

procedure TERSystem.LogElementPropDblChange(Sender: TObject; PropsID: E_PropsID;
  Value: Double);
var
  s : String;
begin

  s := GetEnumName(TypeInfo(E_PropsID),integer(PropsID)) ;

  if Sender is TEntity then
    s := TEntity(Sender).Identifier + ':' + s + '->' + FloatToStr(Value)
  else
    s := Sender.ClassName + ':' + s + '->' + FloatToStr(Value);

  LoggedProperties(s);
end;

procedure TERSystem.LogElementPropIntChange(Sender: TObject; PropsID: E_PropsID;
  Value: Integer);
var
  s : String;
begin

  s := GetEnumName(TypeInfo(E_PropsID),integer(PropsID)) ;

  if Sender is TEntity then
    s := TEntity(Sender).Identifier + ':' + s + '->' + IntToStr(Value)
  else
    s := Sender.ClassName + ':' + s + '->' + IntToStr(Value);

  LoggedProperties(s);
end;

procedure TERSystem.LogElementPropStrChange(Sender: TObject; PropsID: E_PropsID;
  Value: String);
var
  s : String;
begin

  s := GetEnumName(TypeInfo(E_PropsID),integer(PropsID)) ;

  if Sender is TEntity then
    s := TEntity(Sender).Identifier + ':' + s + '->' + Value
  else
    s := Sender.ClassName + ':' + s + '->' + Value;

  LoggedProperties(s);
end;

procedure TERSystem.LoggedProperties(Value: String);
begin

  Inc(FNum);
  value := IntToStr(FNum) + ' ' + FormatDateTime('hh:nn:ss:zzz',Now) + ' ' + Value;
//  Writeln(FFile,Value);

  try
    Writeln(FFile,value);
  finally
  end;
end;

procedure TERSystem.ElementPropDblChange(Sender: TObject;
  PropsID: E_PropsID; Value: Double);
var
  rPmsCmd : R_Common_PMS_Command;
  rPCSCmd : R_Common_PCS_Command;
  rTankCmd : R_Common_TANK_Command;
begin
  case PropsID of
    epPMSPower, epPMSFrequency, epPMSCurrent, epPMSCosPhi, epPMSVoltage, epPMSU,
    epPMSV, epPMSW, epPMSTrafo115Volt, epPMSTrafo230Volt :
    begin
      if Sender is TGenerator then
        rPmsCmd.GenSwitchID := TGenerator(Sender).Identifier
      else if Sender is TSwitchboard then
        rPmsCmd.GenSwitchID := TSwitchboard(Sender).Identifier;

      rPmsCmd.CommandID   := PropsID;
      rPmsCmd.ValueDob    := Value;
      rPmsCmd.ValueKind   := 'double';
//      Network.AsServer.SendData(C_PMS_COMMAND,@rPmsCmd);
      if Assigned(FOnPMSCommand) then
        FOnPMSCommand(rPmsCmd);
    end;

    {Paket data dikirimkan ke Mimic dan PCS Panel}
    epPCSMELeverSpeed, epPCSMESetPointSpeed, epPCSCPPSetPointPitch, epPCSGBSetpShaftSpeed:
    begin
      if Sender is TMainEngine then
        rPCSCmd.PortStaboardID := TMainEngine(Sender).Identifier
      else if Sender is TCPP then
        rPCSCmd.PortStaboardID := TCPP(Sender).Identifier
      else if Sender is TGearBox then
        rPCSCmd.PortStaboardID := TCPP(Sender).Identifier;

      rPCSCmd.CommandPropsID := PropsID;
      rPCSCmd.ValueDouble := Value;

      Network.AsServer.SendData(C_PCS_COMMAND,@rPCSCmd);

      if Assigned(FOnPCSCommand) then
        FOnPCSCommand(rPCSCmd);
    end;

    {Paket data hanya dikirimkan ke Mimic}
    epPCSMEDelayActualSpeed, epPCSGBDelayShaftSpeed, epPCSCPPDelayActualPitch,
    epPCSMEActualSpeed,
    epPCSMEStartingAir, epPCSMEControlAir,
    epPCSMETCAirSeal, epPCSMESpeed, epPCSMEFuelRack, epPCSMEFuelMargin,
    epPCSMETurboChargerSpeedA, epPCSMETurboChargerSpeedB, epPCSMETCOutlLOTempA,
    epPCSMETCOutlLOTempB, epPCSMETCLOPressInlet, epPCSMETempTCInletA,
    epPCSMETempTCInletB, epPCSMETempTCOutletA, epPCSMETempTCOutletB,
    epPCSMEPressAirInlet, epPCSMETempSuperChargAir, epPCSMEPressFOInlet,
    epPCSMETempFWHTOutlet, epPCSMETempFWHTInlet, epPCSMEPressFWHTInlet,
    epPCSMEPressSeaWaterOutlet, epPCSMELOPressInlet, epPCSMELOTempInlet,
    epPCSMEAlarmPropulsionCheck, epPCSMEAvgTempA, epPCSMEAvgTempB,
    epPCSMECompProbA, epPCSMECompProbB, epPCSMETempExhCylA1,
    epPCSMETempExhCylA2, epPCSMETempExhCylA3, epPCSMETempExhCylA4,
    epPCSMETempExhCylA5, epPCSMETempExhCylA6, epPCSMETempExhCylA7,
    epPCSMETempExhCylA8, epPCSMETempExhCylA9, epPCSMETempExhCylA10,
    epPCSMETempExhCylB1, epPCSMETempExhCylB2, epPCSMETempExhCylB3,
    epPCSMETempExhCylB4, epPCSMETempExhCylB5, epPCSMETempExhCylB6,
    epPCSMETempExhCylB7, epPCSMETempExhCylB8, epPCSMETempExhCylB9,
    epPCSMETempExhCylB10, epPCSMEDevTempExhCylA1, epPCSMEDevTempExhCylA2,
    epPCSMEDevTempExhCylA3, epPCSMEDevTempExhCylA4, epPCSMEDevTempExhCylA5,
    epPCSMEDevTempExhCylA6, epPCSMEDevTempExhCylA7, epPCSMEDevTempExhCylA8,
    epPCSMEDevTempExhCylA9, epPCSMEDevTempExhCylA10, epPCSMEDevTempExhCylB1,
    epPCSMEDevTempExhCylB2, epPCSMEDevTempExhCylB3, epPCSMEDevTempExhCylB4,
    epPCSMEDevTempExhCylB5, epPCSMEDevTempExhCylB6, epPCSMEDevTempExhCylB7,
    epPCSMEDevTempExhCylB8, epPCSMEDevTempExhCylB9, epPCSMEDevTempExhCylB10,
    epPCSMETempConRodBear1, epPCSMETempConRodBear2, epPCSMETempConRodBear3,
    epPCSMETempConRodBear4, epPCSMETempConRodBear5, epPCSMETempConRodBear6,
    epPCSMETempConRodBear7, epPCSMETempConRodBear8, epPCSMETempConRodBear9,
    epPCSMETempConRodBear10, epPCSMETempBear1, epPCSMETempBear2,
    epPCSMETempBear3, epPCSMETempBear4, epPCSMETempBear5, epPCSMETempBear6,
    epPCSMETempBear7, epPCSMETempBear8, epPCSMETempBear9, epPCSMETempBear10,
    epPCSMETempBear11,

    epPCSCPPLeverPitch,
    epPCSCPPActualPitch,
    epPCSCPPServoOil, epPCSCPPStaticHub, epPCSCPPHydrOil,

    epPCSGBShaftSpeed,

    epPCSGBShaftTemp, epPCSGBLubOil, epPCSGBCtrlOilPressIn,
    epPCSGBCtrlOilPressOut, epPCSGBLOPressInlet, epPCSGBLOTempInlet,
    epPCSGBPLB1, epPCSGBPLB2,
    epPCSGBThrAH, epPCSGBTHrAS:
    begin
      if Sender is TMainEngine then
        rPCSCmd.PortStaboardID := TMainEngine(Sender).Identifier
      else if Sender is TCPP then
        rPCSCmd.PortStaboardID := TCPP(Sender).Identifier
      else if Sender is TGearBox then
        rPCSCmd.PortStaboardID := TGearBox(Sender).Identifier;

      rPCSCmd.CommandPropsID   := PropsID;
      rPCSCmd.ValueDouble := Value;

//      Network.AsServer.SendData(C_PCS_COMMAND,@rPCSCmd);

      if Assigned(FOnPCSCommand) then
        FOnPCSCommand(rPCSCmd);
    end;

    epTankLevel:
    begin
      if Sender is TTank then
      begin
        rTankCmd.ElementID := TTank(Sender).ElementID;
        rTankCmd.TankID := TTank(Sender).Identifier;
      end;

      rTankCmd.CommandID := PropsID;
      rTankCmd.ValueDouble := Value;

      if Assigned(FOnTankCommand) then
        FOnTankCommand(rTankCmd);
    end;
  end;
end;
procedure TERSystem.NetEvent_MimicCommonCmd(apRec: PAnsiChar; aSize: Word);
var
  recER : ^R_Common_PMS_Command;
  generator : TGenerator;
  switchboard : TSwitchboard;
  recERPCS : ^R_Common_PCS_Command;
begin
  recER := @apRec^;
  recERPCS := @apRec^;

  case recER.CommandID of
    epPMSGeneratorEmergencyStop, epPMSGeneratorEngineRun, epPMSGeneratorStop, epPMSGeneratorCBClosed,
    epPMSGeneratorPreference, epPMSGeneratorMode  :
    begin
      generator := ERManager.EngineRoom.getPMSSystem.getGenerator(recER.GenSwitchID);
      if generator.NotStandby then
        Exit;
    end;
    epPMSMsbCBShore, epPMSMsbCBIntr :
    begin
      switchboard := ERManager.EngineRoom.getPMSSystem.getSwitchboard(recER.GenSwitchID);
    end;
  end;

  case recER.CommandID of
    epPMSGeneratorEmergencyStop :
    begin
      generator.EmergencyStop := recER.ValueBool;
    end;

    epPMSGeneratorFuelRunsOut :
    begin
      generator.FuelRunsOut := recER.ValueBool;
    end;

    epPMSGeneratorEngineRun:
    begin
      {hanya bisa nyala jk state 'waiting', tdk shutdown, tdk emergency stop}
      if (generator.GeneratorState = 1) and (not generator.ShutDown) and (not generator.EmergencyStop) then
        generator.EngineRun := recER.ValueBool;
    end;
    epPMSGeneratorStop:
    begin
      {hanya bisa mati jk state 'Gen Ready'}
      if generator.GeneratorState = 5 then
        generator.GeneratorState := 6;
    end;
    epPMSGeneratorCBClosed:
    begin
      if (generator.GeneratorMode = 2) and (not generator.FailureCBClosed) then
      begin
        if generator.CbClosed then
          generator.CbClosed := False
        else
        begin
          if toCheckCB(recER.GenSwitchID, 0) and (Abs(generator.Frequency - generator.SwitchFrequency) >= 100) then
            generator.FailureCBClosed := True
          else
            generator.CbClosed := recER.ValueBool;
        end;
      end;

    end;
    epPMSGeneratorPreference:
    begin
      if generator.Preference then
          generator.Preference  := False
      else
      begin
        if (generator.GeneratorMode = 3) and (generator.GeneratorState = 1) then
        begin
          if (generator.EmergencyStop) or (generator.ShutDown) then
            Exit
          else
            generator.EngineRun := True;
        end;
        generator.Preference  := True;
      end;
    end;
    epPMSGeneratorMode :
    begin
      generator.GeneratorMode := recER.ValueInt;
    end;
    epPMSMsbCBShore:
    begin
      switchboard.MsbCBShore  := recER.ValueBool;
    end;
    epPMSMsbCBIntr:
    begin
      switchboard := ERManager.EngineRoom.getPMSSystem.getSwitchboard(recER.GenSwitchID);
      switchboard.MsbCBIntr  := recER.ValueBool;
    end;
  end;
  case recERPCS.CommandID of
    1,2:
    begin
      ERManager.EngineRoom.getPCSSystem.CPPHydraulicPump(recERPCS.CommandID, recERPCS.Number, recERPCS.ValueInt, recERPCS.ValueBool);
    end;
  end;
end;

procedure TERSystem.NetworkEventAssignment;
var
  i : integer;
  client : TTCPClient;
begin
  { add subsytem follower }
  for i := 0 to FERManager.EngineRoom.getSystemCount - 1 do
  begin
    with FERManager.EngineRoom.getSystem(i) do
    begin
      addEntityListener('Network', ElementPropByteChange);
      addEntityListener('Network', ElementPropDblChange);
      addEntityListener('Network', ElementPropIntChange);
      addEntityListener('Network', ElementPropStrChange);
      addEntityListener('Network', ElementPropBoolChange);

      addEntityListener('Logger', LogElementPropByteChange);
      addEntityListener('Logger', LogElementPropDblChange);
      addEntityListener('Logger', LogElementPropIntChange);
      addEntityListener('Logger', LogElementPropStrChange);
      addEntityListener('Logger', LogElementPropBoolChange);

      with Listener.Add('Network') as TPropertyEventListener do
      begin
        OnPropertyIntChange := ElementPropIntChange;
        OnPropertyDblChange := ElementPropDblChange;
        OnPropertyByteChange := ElementPropByteChange;
        OnPropertyStringChange := ElementPropStrChange;
        OnPropertyBoolChange := ElementPropBoolChange;
      end;

      with Listener.Add('Logger') as TPropertyEventListener do
      begin
        OnPropertyIntChange := LogElementPropIntChange;
        OnPropertyDblChange := LogElementPropDblChange;
        OnPropertyByteChange := LogElementPropByteChange;
        OnPropertyStringChange := LogElementPropStrChange;
        OnPropertyBoolChange := LogElementPropBoolChange;
      end;
    end;
  end;

  { set all network event here.. as server }
  with FERNetwork.AsServer do
  begin
    with ERManager.EngineRoom do
    begin
      RegisterProcedure(C_PCS_COMMAND, getPCSSystem.NetEvent_PCSCommand,
        SizeOf(R_Common_PCS_Command));

      {Kirim paket dari ER ke bawahannya}
      RegisterProcedure(C_PMS_COMMAND, nil, SizeOf(R_Common_PMS_Command));

      {terima paket dari controller ke ER}
      RegisterProcedure(C_MIMICS_COMMAND, NetEvent_MimicCommonCmd, SizeOf(R_Common_PMS_Command));
    end;
  end;

  { set all network event here.. as client }
  client := FERNetwork.AsClients.Get('AsInstructorClient');

  if Assigned(client) then
  begin
    client.RegisterProcedure(C_INSTRUCTOR_COMMAND,
      ERManager.NetEvent_InstructorCommand, SizeOf(R_Common_Instr_Command));

    client.OnlogRecv := OnNetworkLogger;
    client.OnGetSendLog := OnNetworkLogger;
  end;

  FERNetwork.AsServer.OnGetSendLog := OnNetworkLogger;
  FERNetwork.AsServer.OnlogRecv := OnNetworkLogger;
end;

procedure TERSystem.OnNetworkLogger(const Value: string);
begin
  Inc(FNum);

  try
    Writeln(FFile,IntToStr(FNum) + ' ' + value);
  finally
  end;
end;

procedure TERSystem.SetOnPCSCommand(const Value: T_OnPCSCommand);
begin
  FOnPCSCommand := Value;
end;

procedure TERSystem.SetOnPMSCommand(const Value: T_OnPMSCommand);
begin
  FOnPMSCommand := Value;
end;

procedure TERSystem.SetOnTankCommand(const Value: T_OnTankCommand);
begin
  FOnTankCommand := Value;
end;

function TERSystem.toCheckCB(IdGen: string; IdMsb: Integer): boolean;
var
  switchboard : TSwitchboard;
begin
  Result := False;

  if (IdGen = 'Generator 1') or (IdGen = 'Generator 2') then
    IdMsb := 0
  else if (IdGen = 'Generator 3') or (IdGen = 'Generator 4') then
    IdMsb := 1;

  switchboard := ERSystem.ERManager.EngineRoom.getPMSSystem.getSwitchboard(C_SWITCHBOARD_ID[IdMsb]);

  if (switchboard.Frequency <> 0)then
    Result := True;
end;

procedure TERSystem.CreateCommon;
begin

  FERManager    := TERManager.Create;
  FERNetwork    := TERNetwork.Create;

  FLoggerFileName := ExtractFilePath(Application.ExeName) + 'LOG_' + FormatDateTime('ddmmyyy_hhnnss',Now) + '_ER.log';
  AssignFile(FFile, FLoggerFileName);
  Rewrite(FFile);
  FNum := 0;
end;


end.
