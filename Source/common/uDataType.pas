unit uDataType;

{
  Place all user data types here
  Naming Convention :
    Constanta  C_XxxXxx  : C_MyConst = 20;
    User Type  T_XxxXxx  : T_UserType = procedure(Sender : TObject) of TObject;
    Enum       E_XxxXxx  : E_MyEnum = (meMine, meYours);
    Record     R_XxxXxx  : R_MyRecord = record
}

interface

uses
  uTCPDatatype;

const
  C_AlarmGroupCount = 16;
  C_AlarmsGroupItem : array [0..C_AlarmGroupCount - 1] of string = ('DG',
    'DISTR', 'PROP', 'AUX', 'FUEL', 'DMST', 'HVAC', 'FFDC', 'NAV', 'BALL',
    'IPMS', 'IAS', '-', '-', '-', '-');

  C_FunctionCount  = 12;

  C_PCS_ME_PORTS = 'Main Engine PS';
  C_PCS_ME_STARBOARD = 'Main Engine SB';
  C_PCS_GB_PORTS = 'GearBox PS';
  C_PCS_GB_STARBOARD = 'GearBox SB';
  C_PCS_CPP_PORTS = 'CPP PS';
  C_PCS_CPP_STARBOARD = 'CPP SB';
  C_PCS_PORTS = 'PORT';
  C_PCS_STARBOARD = 'STARBOARD';
  C_PCS_CONTROL = 'CONTROL';
  C_PCS_PUMP = 'PUMP';
  C_PCS_BRIDGE = 'BRIDGE';
  C_PCS_LOCAL = 'LOCAL';
  C_PCS_SERVO = 'SERVO';

  { constant for registered app }
  C_SYS_MIMIC    = 1000;
  C_SYS_PMS      = 1100;
  C_SYS_PCS_1    = 1201;
  C_SYS_PCS_2    = 1202;
  C_SYS_ACS      = 1300;
  C_SYS_CTRL     = 1400;

  { int constant used for network packet id }
  C_NETWORK_ACKNOWLEDGE = 40;

  C_MIMICS_COMMAND          = 50;
    C_ORD_CLOSE = 1;
    C_ORD_OPEN = 2;
    C_ORD_MANUAL = 3;
    C_ORD_AUTO = 4;
    C_ORD_STOP = 5;
    C_ORD_START = 6;
    C_ORD_APPLY = 7;
    C_ORD_DISABLE = 8;
    C_ORD_ENABLE = 9;
    C_ORD_MIMIC_ACK = 10;
    C_ORD_UPDATE_ALARM = 11;
    C_ORD_PING = 12;

  C_BULK_ELEMENT_COMMAND        = 51;
    C_ORD_STATEALARM_CHANGE = 1;         // byte
    C_ORD_STATEELEMENT_CHANGE = 2;
    C_ORD_STATEVALUEELEMENT_CHANGE = 3;    //double
    C_ORD_STATEVALUEAPP_CHANGE = 4;        //double
    C_ORD_STATEDISABLEENABLE_CHANGE = 5;
    C_ORD_ELEMENTCAPTION_CHANGE = 6;
    C_ORD_STATEVALUESENSOR_CHANGE = 7;     //value seonsor
    C_ORD_CONTROLMODE_CHANGE = 8;          //control mode Cip9Txt
    C_ORD_STATEVALUEM3_CHANGE = 9;
    C_ORD_STATEVALUELEVEL_CHANGE = 10;
    C_ORD_STATEVALUEELEMENT_CHANGE_IN_PERCENT = 11;
    C_ORD_STATEVALUEELEMENT_CHANGE_IN_METER = 12;

  C_PCS_COMMAND   = 52;

    C_ORD_ME_SPEED = 1;
    C_ORD_ME_RUNSTART = 2;
    C_ORD_ME_REMOTEAUTO = 3;
    C_ORD_ME_REMOTEMAN = 4;
    C_ORD_ME_STOP = 5;

    C_ORD_CPP_PITCH = 6;
    C_ORD_CPP_REMOTEAUTO = 7;
    C_ORD_CPP_REMOTEMAN = 8;

    C_ORD_GB_REMOTEAUTO = 9;
    C_ORD_GB_REMOTEMAN = 10;
    C_ORD_GB_CLUTCH_ENGAGED = 11;

    C_ORD_CTRL_ALARMACCEPT = 12;
    C_ORD_CTRL_STOPHORN = 13;
    C_ORD_CTRL_LAMPTEST = 14;
    C_ORD_CTRL_BACKGROUND_LAMP = 15;
    C_ORD_CTRL_MCR_BRIDGE = 16;
    C_ORD_CTRL_MODE = 17;
    C_ORD_CTRL_MANOEUVRING = 18;


    C_ORD_LEVER_SPEED = 20;
    C_ORD_LEVER_CONTROL = 21;
    C_ORD_LEVER_SHAFTDRIVEN = 22;
    C_ORD_LEVER_SHAFTSTOP = 23;
    C_ORD_LEVER_SHAFTTRAILING = 24;
    C_ORD_LEVER_EMERGENCYSTOP = 25;
    C_ORD_LEVER_TRANSFEROVERRIDE = 26;

    C_ORD_RUDDER = 27;


  C_PMS_COMMAND   = 53;
    C_ORD_GEN_MODE = 1;
    C_ORD_GEN_ENGINERUN = 2;
    C_ORD_GEN_GENSUPPLY = 3;

    C_ORD_GEN_STOP = 4;
    C_ORD_GEN_CBCLOSED = 5;
    C_ORD_GEN_CBCLOSEDE = 6;
    C_ORD_GEN_PREFERENCE = 7;
//    C_ORD_SWT_INTERMODE = 7;
//    C_ORD_SWT_SHOREMODE = 8;
//    C_ORD_SWT_DISTRMODE = 9;
//    C_ORD_SWT_BUSBAR = 10;
//    C_ORD_SWT_SSHORECLOSED = 11;
//    C_ORD_SWT_INTERCLOSED = 12;

    {Prince : konstanta sementara PMS}
    //untuk buton d PMS mimik
    C_BTN_START     = 1;
    C_BTN_STOP      = 2;
    C_BTN_AUTO      = 3;
    C_BTN_SEMIAUTO  = 4;
    C_BTN_MANUAL    = 5;
    C_BTN_PREF      = 6;

    //untuk indikator d PMS mimik
    C_IND_ENGINERUNNING = 7;
    C_IND_GENSUP        = 8;
    C_IND_MANSEMAUT     = 9;
    C_IND_PREF          = 10;

    //untuk alrm d PMS mimik
    C_ALRM_CANBUS     = 11;
    C_ALRM_CTRLPOW    = 12;
    C_ALRM_POWSUP     = 13;
    C_ALRM_NOTSTANDBY = 14;
    C_ALRM_ENGINE     = 15;
    C_ALRM_SHUTDOWN   = 16;

    //untuk mtr d PMS mimik
    C_MTR_GEN   = 17;
    C_CBE_GEN   = 18;
    C_CBE_ESB   = 19;
    C_CBE_INT   = 20;
    C_CBE_SHR   = 21;
    C_CBE_DTR   = 22;

    //untuk value d PMS mimik
    C_POW_GEN   = 23;
    C_FREQ_GEN  = 24;
    C_CUR_GEN   = 25;
    C_VOLT_GEN  = 26;
    C_COS_GEN   = 27;
    C_U_GEN     = 28;
    C_V_GEN     = 29;
    C_W_GEN     = 30;
    C_ALRM_TRIP = 31;
    C_TRAFO115V = 32;
    C_TRAFO230V = 33;
    C_CBNAVNAUT = 34;
    C_ALRM_FAULTPAGELED = 35;
    C_CBE_GEN_FAILURE = 36;

  C_INSTRUCTOR_COMMAND = 54;
    C_ORD_LOAD_APP      = 1;
    C_ORD_UNLOAD_APP    = 2;
    C_ORD_FREEZE_APP    = 3;
    C_ORD_UNFREEZE_APP  = 4;
    C_ORD_ACK           = 5;
    C_ORD_STATUS_LOAD   = 6;
    C_ORD_STATUS_UNLOAD = 7;
    C_ORD_RESTART       = 8;
    C_ORD_SHUTDOWN      = 9;
    C_ORD_RESTART_ALL   = 10;
    C_ORD_SHUTDOWN_ALL  = 11;
    C_ORD_SCENARIO_CHANGE = 12;
    C_ORD_SYNC_SCENARIO_TIME = 13;
    C_ORD_CLOSE_APP = 14;

  C_PANELTHROTTLE_COMMAND = 55;

  C_FIRE_ACS_COMMAND  = 56;

  C_TELEGRAM_COMMAND   = 57;
  C_EMERGENCYSTOP_COMMAND   = 58;
  C_PUMP_COMMAND = 59;
    C_PUMP_CPP_HYDRAULIC_1 = 1;
    C_PUMP_CPP_HYDRAULIC_2 = 2;
    C_PUMP_CPP_HYDRAULIC_3 = 3;

  //Untuk button dan indikator pada Panel Throttle
  C_PANELTHROTTLE_COMMAND2 = 60;
    C_ORD_AHEAD_PS = 1;
    C_ORD_SHAFT_DRIVEN_PS = 2;
    C_ORD_SHAFT_STOP_PS = 3;
    C_ORD_SHAFT_TRAILING_PS = 4;
    C_ORD_ASTERN_PS = 5;
    C_ORD_EMERGENCY_STOP_PS = 6;
    C_ORD_LEVER_IN_SERVICE_PS = 7;
    C_ORD_TRANSFER_OVERRIDE_PS = 8;
    C_ORD_EMERGENCY_STOP_SB = 9;
    C_ORD_LEVER_IN_SERVICE_SB = 10;
    C_ORD_TRANSFER_OVERRIDE_SB = 11;
    C_ORD_AHEAD_SB = 12;
    C_ORD_SHAFT_DRIVEN_SB = 13;
    C_ORD_SHAFT_STOP_SB = 14;
    C_ORD_SHAFT_TRAILING_SB = 15;
    C_ORD_ASTERN_SB = 16;
    C_ORD_BTN_SHAFT_DRIVEN_PS = 17;
    C_ORD_BTN_SHAFT_STOP_PS = 18;
    C_ORD_BTN_SHAFT_TRAILING_PS = 19;
    C_ORD_BTN_EMERGENCY_STOP_PS = 20;
    C_ORD_BTN_TRANSFER_OVERRIDE_PS = 21;
    C_ORD_BTN_EMERGENCY_STOP_SB = 22;
    C_ORD_BTN_TRANSFER_OVERRIDE_SB = 23;
    C_ORD_BTN_SHAFT_DRIVEN_SB = 24;
    C_ORD_BTN_SHAFT_STOP_SB = 25;
    C_ORD_BTN_SHAFT_TRAILING_SB = 26;


  C_FUNCTIONALLOCATION_COMMAND = 61;

  C_VENTSTATUS_COMMAND = 62;
  C_Servo_COMMAND = 63;
    C_ORD_SERVO_PS = 1;
    C_ORD_SERVO_SB = 2;
    C_ORD_LAMP_PS = 3;
    C_ORD_LAMP_SB = 4;
    C_ORD_SWITCH_EG = 5;

  C_STATUS_CONTROL_INS_COMMAND = 64;

  //Untuk status CPP Hydraulic Pump Panel (Hardware)
  C_PUMP_COMMAND_STATUS = 65;
    C_PUMP_CPP_HYDRAULIC_STANDBY  = 1;
    C_PUMP_CPP_HYDRAULIC_STOP     = 2;
    C_PUMP_CPP_HYDRAULIC_START    = 3;
    C_PUMP_CPP_HYDRAULIC_AUTO     = 4;

  { const mimic component identifier }
  C_WB_TK_PS = 'WB TK PS';
  C_WB_TK_SB = 'WB TK SB';
  C_WB_TK_FWD = 'WB TK FWD';
  C_WB_PUMP = 'Ballast Pump';
  C_MAINENGINE_ID : array [0..1] of string = ('Main Engine PS',
    'Main Engine SB');
  C_GEARBOX_ID : array [0..1] of string = ('GearBox PS', 'GearBox SB');
  C_CPP_ID : array [0..1] of string = ('CPP PS', 'CPP SB');
  C_GENERATOR_ID : array [0..4] of string = ('Generator 1', 'Generator 2',
    'Generator 3', 'Generator 4', 'Emergency Generator');
  C_SWITCHBOARD_ID : array [0..2] of string = ('Switchboard FWD',
    'Switchboard AFT', 'Switchboard Emergency');
  C_POWER_ID : array [0..1] of string = ('Power FWD', 'Power AFT');

  A_MimicType : array [0..31] of Integer = (0, 1, 2, 4, 5,
                                            11, 12, 13, 14,
                                            30, 31, 32, 33, 34, 35, 36,
                                            41, 42, 43, 50,
                                            60, 61, 70, 71, 72, 73,
                                            100, 200, 210, 220,
                                            234, 235);
  C_BULK_ELEMENT_MAX = 50;
  C_HUGE_ELEMENT_COUNT = 2000;

  C_LOGGED_ELEMENT_PREFIX : array [0..21] of string =
    (
      '2410', '2431', '2436', '2621', '2622',
      '3110', '3241', '3243', '3244', '5131',
      '5162', '5210', '5291', '5292', '5321',
      '5411', '5412', '5551', '5610', '5932',
      '7010', '7100'
    );

  C_AlarmHistoryField : array[0..11] of string = ('timestamp',
    'sequence_number', 'alarm_id', 'alarm_class', 'resource', 'logged_by',
    'reference', 'prev_state', 'log_action', 'final_state', 'alarm_message',
    'generation_time');

  C_CommandHistoryField : array[0..2] of string = ('timestamp', 'point_id',
    '_VAL');

  C_TankElementID : array[0..17] of string = ('2621S0001A', '2621S0002A',
    '2622S0001A', '5292S0001A', '5292S0002A', '5292S0003A', '5321S0001A',
    '5321S0002A', '5321S0003A', '5411S0001A', '5411S0002A', '5411S0003A',
    '5411S0004A', '5411S0006A', '5412S0001A', '5412S0004A', '5412S0010A',
    '5932S0001A');

  C_TankIdentifier : array[0..17] of string = ('GBX LO TK', 'ME LO TK',
    'SL DIRTY TK', 'WB FWD', 'WB PS', 'WB SB', 'FW TK SB', 'FW TK PS',
    'FW ROLL STAB TK', 'FO TK1', 'FO TK2', 'FO TK3', 'FO TK4', 'FO LOAD TRUNK',
    'FO DAILY SB', 'FO DAILY PS', 'FO OV TK', 'BILGE W TK');

type

  {
    Event listener type ID - set your custom type event here...
    Event type Name must be clearly and unambigous, add datatype too.
  }
  E_PropsID = (
      { general }
      epGeneralInfo,
      { use in uDatabase }
      epQueryControllerIDStr, epQueryElementsByControllerID,
      epQueryElementByElementID,
      { use in network }
      epNetworkClientConnect, epNetworkClientDisconnect,
      epNetworkStart, epNetworkStop, epNetworkConnectedToServer,
      epNetworkDisconnectedFromServer, epNetworkDebugInfo,
      epNetworkAck,epNetworkLogRcv,
      { use in controller }
      epControllerDebugInfo,
      { use in element }
      epElementAlarmChange,
      epElementCaptionChange,
      epElementStateChange,
      epElementAlrmInhibited,
      epElementStateDisplayChange,
      epElementDisabledChange,
      epElementValidChange,
      epElementWireBreakChange,
      epElementValueAppChange,
      epElementValueElmntChange,
      epElementDebugInfo,
      epElementResetChange,
      epElementCountingChange,
      epElementLowChange,
      epElementHighChange,
      epElementHighHighChange,
      epElementEventChange,
      epElementActualSetChange,
      epElementHMISetChange,
      epElementValueSensorChange,
      epElementCommandOpenChange,
      epElementCommandCloseChange,
      epElementManualAutoChange,
      epElementStateCommandChange,
      epElementStateControlPosChange,
      epStateSwitchSpeed1Change,
      epStateSwitchSpeed2Change,
      epStateSwitchCloseChange,
      epStateSwitchOpenChange,
      epStateSwitchRemoteChange,
      epStateSwitchTrippedChange,
      epStateSwitchNoFaultChange,
      epStateSwitchRunningChange,
      epElementCommandCloseAppChange,
      epElementCommandOpenAppChange,
      epElementCommandStartAppChange,
      epElementCommandStopAppChange,
      epElementCommandStartSpeed1AppChange,
      epElementCommandStartSpeed2AppChange,
      epElementCommandCloseHMIChange,
      epElementCommandOpenHMIChange,
      epElementCommandStartHMIChange,
      epElementCommandStopHMIChange,
      epElementCommandStartSpeed1HMIChange,
      epElementCommandStartSpeed2HMIChange,
      epElementRFCChange,
      epElementRFOChange,
      epStateNoFaultChange,
      epStateNoRFUChange,
      epStateTransitionChange,
      epProcesStatusChange,
      epCommandHMIChange,
      epElementValueAppOutChange,
      epElementBlackOutChange,
      epElementRestartChange,
      epElementRunChange,
      epElementTrimValueChange,
      epElementCompensationSensorChange,
      epStateSwitchChange,
      epEvaluateStateChange,
      epElementValueValveChange,
      epStateSwitchDelayed,
      epElementInState,
      epControlStartSpeed1Change,
      epControlStartSpeed2Change,
      epControlStopChange,
      epControlCloseChange,
      epControlOpenChange,
      epValElementLevelChange,
      epValElementM3Change,
      epValElementMChange,
      epValElementPercentChange,
      epValElementMassChange,
      epElementValueHMIChange,
      epElementValueChange,
      { use in system }
      epSystemDebugInfo,

      { use in PCS System }
      //Entity Main Engine
      epPCSMEReadyForUse, epPCSMEReadyForUsePS, epPCSMEReadyForUseSB,
      epPCSMERemoteControl, epPCSMERemoteManual, epPCSMERemoteAuto,
      epPCSMELeverSpeed, epPCSMESetPointSpeed,
      epPCSMEActualSpeed, epPCSMEDelayActualSpeed, epPCSMEActualSpeedPS, epPCSMEActualSpeedSB,
      epPCSMEFuelRack, epPCSMEFuelMargin,epPCSMERunning,
      epPCSMERunningHour, epPCSMELOPumpHour,
      epPCSMESafetyShutdown, epPCSMERemoteCtrl, epPCSMELowLoad, epPCSMEVeryLowLoad,
      epPCSMEFsrTimerExpired, epPCSMEMaxFsrKeySwitch, epPCSMEStopIncrease, epPCSMEStopDecrease,
      epPCSMEPSRunStart, epPCSMEPSRemoteAuto, epPCSMEPSRemoteManual,
      epPCSMESBRunStart, epPCSMESBRemoteAuto, epPCSMESBRemoteManual,
      epPCSMEStartingAir, epPCSMEControlAir, epPCSMETCAirSeal, epPCSMESpeed, epPCSMETurboChargerSpeedA,
      epPCSMETurboChargerSpeedB, epPCSMETCOutlLOTempA, epPCSMETCOutlLOTempB, epPCSMETCLOPressInlet,
      epPCSMETempTCInletA, epPCSMETempTCInletB, epPCSMETempTCOutletA, epPCSMETempTCOutletB,
      epPCSMEPressAirInlet, epPCSMETempSuperChargAir, epPCSMEPressFOInlet, epPCSMETempFWHTOutlet,
      epPCSMETempFWHTInlet, epPCSMEPressFWHTInlet, epPCSMEPressSeaWaterOutlet, epPCSMELOPressInlet,
      epPCSMELOTempInlet, epPCSMEAlarmPropulsionCheck,

      epPCSMEAvgTempA, epPCSMEAvgTempB, epPCSMECompProbA, epPCSMECompProbB,
      epPCSMETempExhCylA1, epPCSMETempExhCylA2, epPCSMETempExhCylA3, epPCSMETempExhCylA4, epPCSMETempExhCylA5,
      epPCSMETempExhCylA6, epPCSMETempExhCylA7, epPCSMETempExhCylA8, epPCSMETempExhCylA9, epPCSMETempExhCylA10,
      epPCSMETempExhCylB1, epPCSMETempExhCylB2, epPCSMETempExhCylB3, epPCSMETempExhCylB4, epPCSMETempExhCylB5,
      epPCSMETempExhCylB6, epPCSMETempExhCylB7, epPCSMETempExhCylB8, epPCSMETempExhCylB9, epPCSMETempExhCylB10,
      epPCSMEDevTempExhCylA1, epPCSMEDevTempExhCylA2, epPCSMEDevTempExhCylA3, epPCSMEDevTempExhCylA4, epPCSMEDevTempExhCylA5,
      epPCSMEDevTempExhCylA6, epPCSMEDevTempExhCylA7, epPCSMEDevTempExhCylA8, epPCSMEDevTempExhCylA9, epPCSMEDevTempExhCylA10,
      epPCSMEDevTempExhCylB1, epPCSMEDevTempExhCylB2, epPCSMEDevTempExhCylB3, epPCSMEDevTempExhCylB4, epPCSMEDevTempExhCylB5,
      epPCSMEDevTempExhCylB6, epPCSMEDevTempExhCylB7, epPCSMEDevTempExhCylB8, epPCSMEDevTempExhCylB9, epPCSMEDevTempExhCylB10,
      epPCSMETempConRodBear1, epPCSMETempConRodBear2, epPCSMETempConRodBear3, epPCSMETempConRodBear4, epPCSMETempConRodBear5,
      epPCSMETempConRodBear6, epPCSMETempConRodBear7, epPCSMETempConRodBear8, epPCSMETempConRodBear9, epPCSMETempConRodBear10,
      epPCSMETempBear1, epPCSMETempBear2, epPCSMETempBear3, epPCSMETempBear4, epPCSMETempBear5,
      epPCSMETempBear6, epPCSMETempBear7, epPCSMETempBear8, epPCSMETempBear9, epPCSMETempBear10, epPCSMETempBear11,

      epPCSMEOverspeed, epPCSMEConRodBearingTempHigh, epPCSMEConRodBearingTempVeryHigh,
      epPCSMEBearingTempHigh, epPCSMEBearingTempVeryHigh, epPCSMEOilMistDetSafety, epPCSMEOilMistDetFailure,
      epPCSMEOilMistDetAlarm, epPCSMEPrelubeInProgress, epPCSMEPrelubeFailure,
      epPCSMEOilSumpLevel, epPCSMEHeater,epPCSMELOPressVeryLow, epPCSMELOPressClogg,
      epPCSMEPressFOClogg, epPCSMEInjPipeALeakFO, epPCSMEInjPipeBLeakFO,
      epPCSMEPrimLOPump, epPCSMEPreHeatingPump, epPCSMEAirValve, epPCSMEGasValve, epPCSMEBypassP2P4,
      epPCSMEManouveringMode, epPCSMETransitMode,

      epPCSMERemoteStartInterlock, epPCSMETurningGearEngaged, epPCSMEManHandleAtStop, epPCSMEFuelRackAtStop,
      epPCSMEClutched, epPCSMEStartingFault, epPCSMESlowTurningFault, epPCSMESTCSequenceFail, epPCSMESafetyStopSysFail,
      epPCSMESafetyStop, epPCSMEPrelubricationFailure, epPCSMEPrelubInProgress, epPCSMESafetyStopsOverriden, epPCSMEOverspeedAlarm,
      epPCSMELOPressureVeryLow, epPCSMEBearTempVeryHigh, epPCSMEFwHtExpTkLevelVeryLow, epPCSMEFwTempVeryHigh,
      epPCSMEConRodBearTempVeryHigh, epPCSMERedGearSafetyStop, epPCSMEOilMistDetHigh, epPCSMEEmergencyShutdown,
      epPCSMELocalEmergencyStop, epPCSMEEngInletLubOilVeryHigh, epPCSMEEngineControllerWatchdog, epPCSMECtrlPowerSupplyOn,
      epPCSMESafetyPowerSuppOn, epPCSMESTCSequenceAlarm, epPCSMEGovernorMinorFail, epPCSMESTCInManualMode, epPCSMELocalCtrlFail,
      epPCSMEClutchFail, epPCSMEDeclutchFail, epPCSMECommFailEC_PLC, epPCSMEPLCMonitoringFail, epPCSMEClutchFailure,
      epPCSMEBridgeLeverOORFailure, epPCSMEMCRLeverOORFailure, epPCSMEGeneralSensorFailure, epPCSMETrailAlarm,
      epPCSMEResetSafetyStopPossible,

      epPCSMERemoteControlProposed, epPCSMEStartingInProgress, epPCSME2TCMode,
      epPCSMEStartingInterlocks, epPCSMESafetiesStop,

      //Main Engine Failure
      epPCSMEFailure, epPCSMEFailurePS, epPCSMEFailureSB,

      //Vent System
      epPCSMEFanExhSupply, epPCSMEFanSupply1, epPCSMEFanSupply2,
      epPCSMEFanExhSupplyHour, epPCSMEFanSupply1Hour, epPCSMEFanSupply2Hour,

      //Entity CPP
      epPCSCPPReadyForUse, epPCSCPPReadyForUsePS, epPCSCPPReadyForUseSB,
      epPCSCPPRemote, epPCSCPPRemotePS, epPCSCPPRemoteSB,
      epPCSCPPRemoteManual, epPCSCPPRemoteManualPS, epPCSCPPRemoteManualSB,
      epPCSCPPRemoteAuto, epPCSCPPRemoteAutoPS, epPCSCPPRemoteAutoSB,
      epPCSCPPSetPointPitch, epPCSCPPLeverPitch,
      epPCSCPPActualPitch, epPCSCPPDelayActualPitch, epPCSCPPActualPitchPS, epPCSCPPActualPitchSB,
      epPCSCPPServoOil, epPCSCPPStaticHub, epPCSCPPHydrOil,
      epPCSCPPHydraulicPumpHour1, epPCSCPPHydraulicPumpHour2, epPCSCPPHydraulicPumpHour3,
      epPCSCPPPumpStandby1, epPCSCPPPumpStandby2, epPCSCPPPumpAuto3,
      epPCSCPPPumpStart1, epPCSCPPPumpStart2, epPCSCPPPumpStart3,
      epPCSCPPPumpStandby1PS, epPCSCPPPumpStandby2PS, epPCSCPPPumpAuto3PS,
      epPCSCPPPumpStart1PS, epPCSCPPPumpStart2PS, epPCSCPPPumpStart3PS,
      epPCSCPPPumpStandby1SB, epPCSCPPPumpStandby2SB, epPCSCPPPumpAuto3SB,
      epPCSCPPPumpStart1SB, epPCSCPPPumpStart2SB, epPCSCPPPumpStart3SB,
      epPCSCPPOilFilterClogged, epPCSCPPPitchNotZero, epPCSCPPCLSControl, epPCSCPPBackupSupplyFail,
      epPCSCPPFollowUpError, epPCSCPPHPPOilLevel, epPCSCPPOilLevel, epPCSCPPLocal,
      epPCSCPPFailure, epPCSCPPFailurePS, epPCSCPPFailureSB,

      //Entity GearBox
      epPCSGBReadyForUse, epPCSGBReadyForUsePS, epPCSGBReadyForUseSB,
      epPCSGBRemoteAuto, epPCSGBRemoteAutoPS, epPCSGBRemoteAutoSB,
      epPCSGBRemoteManual, epPCSGBRemoteManualPS, epPCSGBRemoteManualSB,
      epPCSGBPLB1, epPCSGBPLB2, epPCSGBThrAH,epPCSGBTHrAS,
      epPCSGBClutchAllowed, epPCSGBClutchAllowedPS, epPCSGBClutchAllowedSB,
      epPCSGBClutchEngagedVCE, epPCSGBClutchEngaged, epPCSGBClutchEngagedPS, epPCSGBClutchEngagedSB,
      epPCSGBLOPumpHour,
      epPCSGBSetpShaftSpeed, epPCSGBShaftSpeed, epPCSGBDelayShaftSpeed, epPCSGBShaftSpeedPS, epPCSGBShaftSpeedSB,
      epPCSGBShaftLocked, epPCSGBShaftLockedPS, epPCSGBShaftLockedSB,
      epPCSGBShaftTemp, epPCSGBLubOil, epPCSGBCtrlOilPressIn, epPCSGBCtrlOilPressOut,
      epPCSGBLOPressInlet, epPCSGBLOTempInlet,
      epPCSGBSWFlowBearing, epPCSGBStandbyPump, epPCSGBPumpNotAuto, epPCSGBPumpStandbyStart,
      epPCSGBOilLevel, epPCSGBFilter11, epPCSGBFilter12, epPCSGBLOPressInletLow,
      epPCSGBPitchNotZero, epPCSGBPCSClutchInterlock, epPCSGBClutchAllowedLOP,
      epPCSGBClutched, epPCSGBDeclutched, epPCSGBSafetyDeclutch,
      epPCSGBFailure, epPCSGBFailurePS, epPCSGBFailureSB,
      epPCSGBShaftPowerLimited, epPCSGBShaftPowerLimitedPS, epPCSGBShaftPowerLimitedSB,
      epPCSGBClutchInterlocks,

      //Alarm
      epPCSAlarms, epPCSAlarmsPS, epPCSAlarmsSB,

      //Control
      epPCSCtrlAlarmAccept, epPCSCtrlStopHorn, epPCSCtrlLamptTest,
      epPCSCtrlLocal, epPCSCtrlLocalPS, epPCSCtrlLocalSB,
      epPCSCtrlMCR, epPCSCtrlMCRPS, epPCSCtrlMCRSB,
      epPCSCtrlBridge, epPCSCtrlBridgePS, epPCSCtrlBridgeSB,
      epPCSCtrlTransit, epPCSCtrlManoeuvring, epPCSCtrlBackgroundLamp,
      epPCSCtrlLever, epPCSCtrlLeverPS, epPCSCtrlLeverSB,

      //Rudder
      epRudderValue, epRudderValuePS, epRudderValueSB, epRudderCourse, epRudderCoursePS, epRudderCourseSB,

      //Throttle Panel
      epPCSLeverShaftDriven, epPCSLeverShaftStop, epPCSLeverShaftTrailing,
      epPCSLeverEmergencyStop, epPCSLeverTransferOverride,
      epPCSLeverShaftDrivenPS, epPCSLeverShaftStopPS, epPCSLeverShaftTrailingPS,
      epPCSLeverEmergencyStopPS, epPCSLeverTransferOverridePS,
      epPCSLeverShaftDrivenSB, epPCSLeverShaftStopSB, epPCSLeverShaftTrailingSB,
      epPCSLeverEmergencyStopSB, epPCSLeverTransferOverrideSB,

      epPCSFreezed,

      { use in Engine room system }
      epERTankCapacity,

      { use in PMS System}
      epPMSPowerMode, epPMSPowerConsmr, epPMSPower, epPMSFrequency, epPMSSwitchFrequency,epPMSCurrent, epPMSCosPhi, epPMSVoltage, epPMSU, epPMSV, epPMSW,
      epPMSGeneratorEmergencyStop, epPMSGeneratorMode, epPMSGeneratorFuelRunsOut, epPMSGeneratorEngineRun, epPMSGeneratorStop, epPMSGeneratorSupplied,
      epPMSGeneratorState, epPMSGeneratorCBClosed, {epPMSGeneratorCBClosedE,} epPMSGeneratorPreference, epPMSGeneratorBusbar,
      epPMSGeneratorRunHour, epPMSNotStandby, epPMSCanBusFailure, epPMSMeasPowFailure, epPMSDCPowFailure, epPMSEngineAlarm,
      epPMSShutdown, epPMSFaultPageLed, epPMSFailureCBClosed,

      epPMSMsbIntrMode, epPMSEsbIntrMode, epPMSMsbShoreMode, epPMSMsbCBShore, epPMSMsbCBIntr, epPMSEsbCBIntr, epPMSMsbCBNavNaut,
      epPMSEmergencyCon, epPMSMsbBusbar, epPMSMsbTripReduct, epPMSSycnFail, epPMSTrafo115Volt, epPMSTrafo230Volt,

      {use in panel hardware}
      epBoardAlarmLamp, epBoardAlarmLampKanan, epBoardTelegramKiri, epBoardTelegramKanan, epRudderIndicator,

      { use in Scenario}
      epScenarioLoad, epScenarioRunState, epScenarioCondition, epScenarioRunningTime,
      epScenarioRunScenarioChange,

      {use in Tank}
      epTankLevel, epTankValueSensor, epElementParamChange,

      {use in ACS}
      epFaultStatus
    );


  E_AlarmGroupType = (agtDG,   agtDISTR, agtPROP,  agtAUX, agtFUEL,
                      agtDMST, agtHVAC,  agtFFDC,  agtNAV, agtBALL,
                      agtIPMS, agtIAS,  agtRSV1,  agtRSV2,  agtRSV3, agtRSV4);

  E_MimicType =   ( mtLogin   = 0,
                    mtTOC     = 1,
                    mtFAlloc  = 2,
                    mtNavCom  = 4,
                    mtNetArc  = 5,
                    mtPowerMan  = 11,
                    mt230VPower = 12,
                    mt24VPower  = 13,
                    mtUPSPower  = 14,
                    mtPropulsion = 30,
                    mtCPP     = 31,
                    mtMEPS    = 32,
                    mtMESB    = 33,
                    mtMEPSExh = 34,
                    mtMESBExh = 35,
                    mtPropCond = 36,
                    mtFireDet1 = 41,
                    mtFireDet2 = 42,
                    mtMachineVent = 43,
                    mtFireFS      = 50,
                    mtBallast     = 60,
                    mtBilge       = 61,
                    mtAux         = 70,
                    mtFuel        = 71,
                    mtTanks       = 72,
                    mtSeaWater    = 73,
                    mtRunHours    = 100,
                    mtListDisElm  = 200,
                    mtListParmCh  = 210,
                    mtCmdHist     = 220,
                    { show alarm summary }
                    mtDGALRM,   mtDISTRALRM, mtPROPALRM,  mtAUXALRM,
                    mtFUELALRM, mtDMSTALRM,  mtFFDCALRM,  mtNAVALRM,
                    mtBALLALRM, mtIPMSALRM,  mtIASALRM,   mtHVACALRM,
                    { show }
                    mtAssist  = 233,
                    {button bawah}
                    mtAlarm   = 234,
                    mtHistory = 235,
                    mtReserved);

  E_ElementType = (eltAAE, eltCBA, eltCBE, eltCTR, eltDAE, eltMCD,
                   eltMCE, eltMCS, eltRHE, eltSAE, eltSEE, eltSPE,
                   eltSSE, eltSS1, eltSS2, eltSSL, eltSWB, eltSWE,
                   eltSWN, eltVCE, eltVCH, eltVCP, eltUNDEF);

  E_ElementParameter = (epHAV, epLAV, epHYHA, epHYLA, epTHA, epTLA, epSF, epSTA,
                        epTTRANS, epTCTRL, epTRO, epOFFSET, epSG, epTAU, epTOORL,
                        epTOORH, epV4, epV20, epHA, epLA, epTCDD, epTDELAY, epMODE,
                        epNONC, epHHAV, epXHAV, epHY, epTA, epSENOFF, epTnkCntMax);

  { input state/command from IPMS}
  E_StateValid      = (svValid, svInvalid);
  E_StateWireBreak  = (swbWireBreak, swbNoWireBreak);
  E_StateDisabled   = (sdDisabled, sdEnabled, sdUnavailable);
  E_State           = (sState1, sState2, sState3, sState4, sState5, sState6, sState7,
                       sState8, sState9, sState10, sState11, sState12, sState13, sState14,
                       sState15);
  E_StateInhibit    = (siInhibited, siNotInhibited);
  E_StateDisplayStationery = (ssDispStationary, ssDispElement);
  E_StateActivated  = (sacActivated, sacNotActivated);
  E_StateManualAuto = (smaManual, smaAuto, smaLocal);
  E_StateRFC        = (srfReadyForClose, srfNotReadyForClose);
  E_StateRFO        = (sroReadyForOpen, sroNotReadyForOpen);
  E_StateNotRFU     = (snrRFU, snrNotRFU);
  E_StateNotFault   = (snfNotFault, snfFault);
  E_StateTransition = (stInTransition, stNotInTransition);
  E_StateProcesStatus = (spsNormal, spsActive);
  E_StateRunCondition = (srcOk, srcNotOk);
  E_StateEnableCount= (secNotEnabled, secEnabled);
  E_StateLowAlarm   = (slaLowAlarm, slaNoAlarm);
  E_StateHighAlarm  = (shaHighAlarm, shaNoAlarm);
  E_StateHighHigh   = (shhHighHighAlarm, shhNoAlarm);

  // bebe added
  E_StateSwitchRemote = (ssrLocal, ssrRemote);
  E_StateSwitchClosed = (sscClosed, sscNotClosed);
  E_StateSwitchOpen = (ssoOpen, ssoNotOpened);

  { internal element input }
  E_DesiredState    = (dsNone, dsCLose, dsOpen, dsStop, dsRun, dsSpeed1, dsSpeed2,
                       dsStart, dsStandby);

  E_ControlMode     = (cmNone, cmLocal, cmManual, cmAuto, cmRemote);

  E_ControlRun      = (crRun, crStop);

  E_ControlDirection = (cdOpen, cdClose);

  { input state/command from external App, such as PMS}
  E_ExtStatus       = (esElementDisabled, esClosed, esNotClosed, esOpen, esNotOpen,
                       esTransition, esNotRFO, esNotRFC, esFailure, esLocal,
                       esRemote, esManual, esAuto, esUnknown, esFault, esNoFault,
                       esTripped, esNotTripped, esFailedToOpen, esFailedToClose,
                       esRunning, esNotRunning, esSpeed1, esNotSpeed1,
                       esSpeed2, esNotSpeed2, esStandby, esNotStandby);


  { output state/command to IPMS }
  E_StateAlarm      = (saNone, saHA, saLA, saWireBreak, saInhibited, saUnknown,
                       saFault, saTripped, saOpenFailure,saCLoseFailure,
                       saStopFailure, saStartFailure, saSpeed1, saSpeed1Failure,
                       saSpeed2, saSpeed2Failure, saFailedToStop, saFailureToStop,
                       saSpeed1FailedToStop, saSpeed2FailedToStop, saNotStandby,
                       saRunningFailedToStop, saStandbyFailedToStop,
                       saStandbyFailure, saHHA, saOORL, saOORH, saXHA, saAlarm,
                       saControlFailure, saNoneDisable {special for state element disable});

  E_StateElement    = (seValueOK, seFalse, seDisabled, seHA, seLA, seUnavailable,
                       seWireBreak, seClosed, seOpen, seTransition, seNotRFO,
                       seNotRFC, seCloseFailure, seOpenFailure, seUndetermined,
                       seFault, seTripped, seUnknown, seFailedToClose,
                       seFailedToOpen, seNotRFU, seInTransition, seNormal,
                       seActive, seInvalid, seStopped, seRunning, seStopFailure,
                       seRunFailure, seSpeed1, seSpeed2, seSpeed1Failure,
                       seSpeed2Failure, seFailedToStop, seFailureToStop,
                       seSpeed1FailedToStop, seSpeed2FailedToStop, seStandby,
                       seStandbyFailure, seStartFailure, seStandbyFailedToStop,
                       seCounting, seState, seHHA, seEnabled, seOORL, seOORH,
                       seXHA, seState0, seState1, seAlarm, seWarning, seNone,
                       seControlFailure);

  { output state/command to external app such as PMS, or other platform }
  E_ExtCommand       = (ecOpen, ecClose, ecManual, ecAuto, ecDisableElement,
                        ecEnableElement, ecStart, ecStop);

  E_MimicState = (msMimic, msAssist, msAlarm, msHistory, msParameter, msCommand);

  { scenario running state }
  E_ScenarioRunState = (esrRun, esrPause, esrStop);

  { value state }
  E_ValueState = (evsNone, evsNormal, evsLow, evsHigh);

  { tipe form di instructor panel }
  E_FormType = (ftScenarioBuilder = 1, ftPMSEditor, ftPCSEditor, ftFAEditor,
    ftScenarioLoader, ftPMS, ftFFS, ftMimicSys, ftNetSystem, ftPCSGeneral,
    ftPCSStb, ftPCSPS, ftTelegraph, ftPCSLeft, ftPCSLever,
    ftPCSLocalControl, ftElemtMod, ftNetStatus, ftDataLogger, ftClientControl,
    ftShipAlarm, ftNav_ComSys, ftTanksOverview, ftBilgeSystem,
    ftAuxSystemOverview, ftTanksEditor, ftPMSOverview, ftVentSystem,
    ftFireFightingSystem, ftACSControl, ftPropulsionConditions, ftTankSys,
    ftACSTestFunction, ftFuelOilPanel, ftBallastPanel, ftFreshWaterPanel);
  {tipe form di HMI LCP}
  E_HMIFormType = (ftMenu = 1, ftAirAndGas, ftGasTemperature, ftCrankOil, ftGenScreen,
                  ftLubOil, ftGearDiesel, ftStartingInterlocks, ftSeaWater, ftClutch, ftGearBox);

  { Sort, Filter, Field}
  E_AlarmHistoryFieldName = (AHfnTimeStamp, AHfnSequenceNumber, AHfnAlarmId,
    AHfnAlarmClass, AHfnResource, AHfnLoggedBy, AHfnReference, AHfnPrevState,
    AHfnLogAction, AHfnFinalState, AHfnAlarmMessage, AHfnGenerationTime);
  E_CommandHistoryFieldName = (CHfnTimeStamp, CHfnPointId, CHfn_VAL);
  E_LogicalMode = (lmNone, lmEquals, lmBetween, lmLessThan, lmGreaterThan,
    lmIsNull);
  E_ShowMode = (smAdd, smModify);

  { user type }
  T_OnStateCBAToPMACommand  = procedure (Sender: TObject;
    Command: E_ExtCommand) of object;
  T_ONStateCBEToPlatformCmd = procedure (Sender: TObject;
    Command: E_ExtCommand; StateActivated: E_StateActivated) of object;
  T_ONStateMCEToPlatformCmd = procedure (Sender: TObject;
    Command: E_ExtCommand; StateManualAuto: E_StateManualAuto) of object;
  T_ONStateMCDToPlatformCmd = procedure (Sender: TObject;
    Command: E_ExtCommand; StateActivated: E_StateActivated) of object;
  T_ONStateMCSToPlatformCmd = procedure (Sender: TObject;
    Command: E_ExtCommand; StateActivated: E_StateActivated) of object;
  T_OnProgressStep = procedure (aStep : Integer) of object;


  { records --> network data start here }
  R_Common_ELmt_Command = record
    ElementID : string[20];
    MimicID   : Byte;
    CommandID : Byte;
    ValueByte : Byte;
    ValueDouble : Double;
    ValueBool   : boolean;
  end;

  R_Bulk_Common_Elmt_Command = record
    pid       : TPacketID;
    bunchData : array [0..C_BULK_ELEMENT_MAX - 1] of R_Common_ELmt_Command; // set 0 to CommandID for last record
  end;

  // for sending all element state
  R_Huge_Common_Elmt_Command = record
    pid       : TPacketID;
    bunchData : array [0..C_HUGE_ELEMENT_COUNT - 1] of R_Common_ELmt_Command; // set 0 to CommandID for last record
  end;

  R_Common_ER_Command = record
    ER_Type         : byte; // 1 : PCS, 2 : PMS
    PortStaboardID  : string[20];
    CommandID       : Byte;
    CommandPropsID  : E_PropsID;
    Number          : Integer;
    GenSwitchID     : string[25];
    ValueInt        : Integer;
    ValueDouble     : Double;
    ValueBool       : Boolean;
    ValueKind       : string[10];
  end;

  R_Bulk_Common_ER_Command = record
    pid       : TPacketID;
    bunchData : array [0..C_BULK_ELEMENT_MAX - 1] of R_Common_ER_Command; // set 0 to CommandID for last record
  end;

  R_Common_PCS_Command = record
    pid             : TPacketID;
    PortStaboardID  : string[20];
    CommandID       : Byte;
    CommandPropsID  : E_PropsID;
    Number          : Integer;
    ValueInt        : Integer;
    ValueDouble     : Double;
    ValueBool       : Boolean;
  end;

  R_Common_PMS_Command = record
    pid         : TPacketID;
    GenSwitchID : string[25];
    CommandID   : E_PropsID;
    ValueDob    : Double;
    ValueInt    : Integer;
    ValueBool   : boolean;
    ValueKind   : string[10];
  end;

  R_Common_TANK_Command = record
    pid : TPacketID;
    ElementID : string[15];
    TankID : string[25];
    CommandID : E_PropsID;
    ValueBoolean : Boolean;
    ValueDouble : Double;
    ValueInteger : Integer;
  end;

  R_Common_Instr_Command = record
    pid         : TPacketID;
    CommandID   : Byte;
    ValueByte   : Byte;
    ValueString : string[50];
    ValueInt    : Integer;
    ValueDbl    : Double;
    ID          : Byte;
    Value       : Boolean;
    aProps      : integer;
    IPSender    : string[30];
  end;

  R_ServoAndLamp_Command = record
    pid    : TPacketID;
    nameID : Integer;
    status : Boolean;
  end;

  R_Network_Acknowledge = record
    pid         : TPacketID;
    AcknowledgeID : string[50];
  end;

  R_Common_Mimic_Command = record
    pid         : TPacketID;
    ElementID   : String[50];
    ElementName : String[50];
    CommandID   : Byte;
    aAck        : string[1];
    FinalState  : string[1];
    SelectID    : Integer;
  end;

  R_Command_StatCtrl_Ins = record
    pid         : TPacketID;
    ElementID   : String[50];
    MimicID     : Byte;
    Status      : Byte;
  end;

  R_Common_VentStatus_Command = record
    pid         : TPacketID;
    ElementID   : String[50];
    ElementType : Byte; // 1 = MCD,  2 = MCE
    Status      : Byte;
  end;

  R_Common_PanelThrottle_Command = record
    pid         : TPacketID;
    aID         : Byte;
    aValue      : boolean;
  end;

  R_Common_ScenarioCondition_Command = record
    pid : TPacketID;
    ScenarioName : string[100];
    ConditionType : string[20];
  end;

  R_Common_Telegram_Command = record
    pid : TPacketID;
    CommandID   : E_PropsID;
    ValueInt    : Integer;
    ValueBool   : boolean;
    ValueByte   : Byte; {1; utk mengirim 2: utk membalas}
  end;

  R_Common_EmergencyStop_Command = record
    pid : TPacketID;
    GenId       : string[50];
    CommandID   : E_PropsID;
    ValueBool   : boolean;
  end;

  R_Common_PumpStatus_Command = record
    pid : TPacketID;
    SideId    : Byte;
    PumpId    : Integer;
    StadeId   : Integer;
    ValueBool : boolean;
  end;

  R_Common_FuncAlloc_Command = record
    pid : TPacketID;
    role : string[20];
    changeAlarm1 : Boolean;
    changeAlarm2 : Boolean;
    changeAlarm3 : Boolean;
    changeAlarm4 : Boolean;
    changeAlarm5 : Boolean;
    changeAlarm6 : Boolean;
    changeAlarm7 : Boolean;
    changeAlarm8 : Boolean;
    changeAlarm9 : Boolean;
    changeAlarm10 : Boolean;
    changeAlarm11 : Boolean;
    changeAlarm12 : Boolean;
  end;

  R_Common_ACS_Command = record
    pid : TPacketID;
    CommandID : E_PropsID;
    RoomID : string[4];
    AlarmID : Byte;
    FaultID : Byte;
    Status  : Byte;
    SimTime : TDateTime;
  end;
  { end network record data}

  { event procedure }
  T_OnDoubleValueChange = procedure (Value : Double) of object;
  T_OnPCSCommand = procedure (Value : R_Common_PCS_Command) of object;
  T_OnPMSCommand = procedure (Value : R_Common_PMS_Command) of object;
  T_OnTankCommand = procedure(aCommand: R_Common_TANK_Command) of object;

implementation
end.
