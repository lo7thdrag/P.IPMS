unit uPropulsionConditionsSet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, VrControls, VrButtons, ExtCtrls, Menus, uMainEngine, uGearBox,
  uCPP, uDataType, Math;

type
  TfrmPropulsionConditions = class(TForm)
    pnlPS_StartingInterlocks: TPanel;
    btnPS_SI_RemoteStartInterlock: TVrDemoButton;
    btnPS_SI_TurningGearEngaged: TVrDemoButton;
    btnPS_SI_ManHandleAtStop: TVrDemoButton;
    btnPS_SI_FuelRackAtStop: TVrDemoButton;
    btnPS_SI_Clutched: TVrDemoButton;
    btnPS_SI_StartingFault: TVrDemoButton;
    btnPS_SI_SlowTurningFault: TVrDemoButton;
    btnPS_SI_STCSequenceFail: TVrDemoButton;
    btnPS_SI_SafetyStop: TVrDemoButton;
    btnPS_SI_PrelubeFailure: TVrDemoButton;
    btnPS_SI_PrelubeInProgress: TVrDemoButton;
    pnlPS_PropulsionConditions: TPanel;
    lbl1: TLabel;
    pnlPS_ClutchInterlocks: TPanel;
    btnPS_CI_PitchNotZero: TVrDemoButton;
    btnPS_CI_ShaftLocked: TVrDemoButton;
    btnPS_CI_PCSClutchInterlock: TVrDemoButton;
    btnPS_CI_ClutchAllowedLOP: TVrDemoButton;
    pnlPS_SafetiesStop: TPanel;
    btnPS_SS_SafetyStopOverriden: TVrDemoButton;
    btnPS_SS_Overspeed: TVrDemoButton;
    btnPS_SS_LOPressureVeryLow: TVrDemoButton;
    btnPS_SS_BearTempVeryHigh: TVrDemoButton;
    btnPS_SS_FwHtExpTkLevelVeryLow: TVrDemoButton;
    btnPS_SS_FwTempVeryHigh: TVrDemoButton;
    btnPS_SS_ConRodBearTempVeryHigh: TVrDemoButton;
    btnPS_SS_RedGearSafetyStop: TVrDemoButton;
    btnPS_SS_OilMistDetHigh: TVrDemoButton;
    btnPS_SS_EmergencyShutdown: TVrDemoButton;
    btnPS_SS_LocalEmergStop: TVrDemoButton;
    btnPS_SS_EngInletLubOilVeryHigh: TVrDemoButton;
    pnlPS_Alarms: TPanel;
    btnPS_Alarms_EngineControllerWatchdog: TVrDemoButton;
    btnPS_Alarms_CtrlPowerSupplyOn: TVrDemoButton;
    btnPS_Alarms_SafetyPowerSuppOn: TVrDemoButton;
    btnPS_Alarms_STCSequenceAlarm: TVrDemoButton;
    btnPS_Alarms_GovernorMinorFail: TVrDemoButton;
    btnPS_Alarms_STCInManualMode: TVrDemoButton;
    btnPS_Alarms_LocalCtrlFail: TVrDemoButton;
    btnPS_Alarms_ClutchFail: TVrDemoButton;
    btnPS_Alarms_DeclutchFail: TVrDemoButton;
    btnPS_Alarms_CommFailEC_PLC: TVrDemoButton;
    btnPS_Alarms_PLCMonitoringFail: TVrDemoButton;
    btnPS_Alarms_ClutchFailure: TVrDemoButton;
    btnPS_Alarms_BridgeLeverOORFailure: TVrDemoButton;
    btnPS_Alarms_MCRLeverOORFailure: TVrDemoButton;
    btnPS_Alarms_GeneralSensorFailure: TVrDemoButton;
    btnPS_Alarms_TrailAlarm: TVrDemoButton;
    btnPS_Alarms_ResetSafetyStopPossible: TVrDemoButton;
    pnlSB_PropulsionConditions: TPanel;
    lbl6: TLabel;
    pnlSB_StartingInterlocks: TPanel;
    btnSB_SI_RemoteStartInterlock: TVrDemoButton;
    btnSB_SI_TurningGearEngaged: TVrDemoButton;
    btnSB_SI_ManHandleAtStop: TVrDemoButton;
    btnSB_SI_FuelRackAtStop: TVrDemoButton;
    btnSB_SI_Clutched: TVrDemoButton;
    btnSB_SI_StartingFault: TVrDemoButton;
    btnSB_SI_SlowTurningFault: TVrDemoButton;
    btnSB_SI_STCSequenceFail: TVrDemoButton;
    btnSB_SI_SafetyStop: TVrDemoButton;
    btnSB_SI_PrelubeFailure: TVrDemoButton;
    btnSB_SI_PrelubeInProgress: TVrDemoButton;
    pnlSB_ClutchInterlocks: TPanel;
    btnSB_CI_PitchNotZero: TVrDemoButton;
    btnSB_CI_ShaftLocked: TVrDemoButton;
    btnSB_CI_PCSClutchInterlock: TVrDemoButton;
    btnSB_CI_ClutchAllowedLOP: TVrDemoButton;
    pnlSB_Alarms: TPanel;
    btnSB_Alarms_EngineControllerWatchdog: TVrDemoButton;
    btnSB_Alarms_CtrlPowerSupplyOn: TVrDemoButton;
    btnSB_Alarms_SafetyPowerSuppOn: TVrDemoButton;
    btnSB_Alarms_STCSequenceAlarm: TVrDemoButton;
    btnSB_Alarms_GovernorMinorFail: TVrDemoButton;
    btnSB_Alarms_STCInManualMode: TVrDemoButton;
    btnSB_Alarms_LocalCtrlFail: TVrDemoButton;
    btnSB_Alarms_ClutchFail: TVrDemoButton;
    btnSB_Alarms_DeclutchFail: TVrDemoButton;
    btnSB_Alarms_CommFailEC_PLC: TVrDemoButton;
    btnSB_Alarms_PLCMonitoringFail: TVrDemoButton;
    btnSB_Alarms_ClutchFailure: TVrDemoButton;
    btnSB_Alarms_BridgeLeverOORFailure: TVrDemoButton;
    btnSB_Alarms_MCRLeverOORFailure: TVrDemoButton;
    btnSB_Alarms_GeneralSensorFailure: TVrDemoButton;
    btnSB_Alarms_TrailAlarm: TVrDemoButton;
    btnSB_Alarms_ResetSafetyStopPossible: TVrDemoButton;
    pnlSB_SafetiesStop: TPanel;
    btnSB_SS_SafetyStopOverriden: TVrDemoButton;
    btnSB_SS_Overspeed: TVrDemoButton;
    btnSB_SS_LOPressureVeryLow: TVrDemoButton;
    btnSB_SS_BearTempVeryHigh: TVrDemoButton;
    btnSB_SS_FwHtExpTkLevelVeryLow: TVrDemoButton;
    btnSB_SS_FwTempVeryHigh: TVrDemoButton;
    btnSB_SS_ConRodBearTempVeryHigh: TVrDemoButton;
    btnSB_SS_RedGearSafetyStop: TVrDemoButton;
    btnSB_SS_OilMistDetHigh: TVrDemoButton;
    btnSB_SS_EmergencyShutdown: TVrDemoButton;
    btnSB_SS_LocalEmergStop: TVrDemoButton;
    btnSB_SS_EngInletLubOilVeryHigh: TVrDemoButton;
    pmAlarm: TPopupMenu;
    mniAlarmOn: TMenuItem;
    mniAlarmOff: TMenuItem;
    btnPS_SI_SafetyStopSysFail: TVrDemoButton;
    btnSB_SI_SafetyStopSysFail: TVrDemoButton;
    pnlPS_CPP: TPanel;
    btnPS_CPP_ControlFailure: TVrDemoButton;
    btnPS_CPP_FollowUpFailure: TVrDemoButton;
    btnPS_CPP_BackupSupplyFailure: TVrDemoButton;
    pnlSB_CPP: TPanel;
    btnSB_CPP_ControlFailure: TVrDemoButton;
    btnSB_CPP_FollowUpFailure: TVrDemoButton;
    btnSB_CPP_BackupSupplyFailure: TVrDemoButton;
    pnlPS_Shaft: TPanel;
    lbl13: TLabel;
    btnPS_GB_ShaftLock: TVrDemoButton;
    pnlSB_ShaftLock: TPanel;
    lbl14: TLabel;
    btnSB_GB_ShaftLock: TVrDemoButton;
    btnPS_GB_ShaftPowerLimited: TVrDemoButton;
    btnSB_GB_ShaftPowerLimited: TVrDemoButton;
    pnlPS_Failure: TPanel;
    lbl15: TLabel;
    btnPS_ME_Failure: TVrDemoButton;
    btnPS_GB_Failure: TVrDemoButton;
    pnlSB_Failure: TPanel;
    lbl16: TLabel;
    btnSB_ME_Failure: TVrDemoButton;
    btnSB_GB_Failure: TVrDemoButton;
    lbl17: TLabel;
    lbl2: TLabel;
    lbl5: TLabel;
    lbl4: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl3: TLabel;
    lbl7: TLabel;
    procedure mniAlarmOnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPropulsionConditionsMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    PortStarboard, pcsConditionStatus{, elementID} : string;
    pcsConditionStatusTag, conRodBearTemp, bearTemp : Integer;
    FButton : TVrDemoButton;

    procedure setAlarmCondition(Sender : TVrDemoButton; aOnOff : Integer);
    procedure setPropulsionAlarmState(isAlarm : Boolean);

    procedure setAlarmStatefromLoadSession;

  public
    { Public declarations }
    main_engine : TMainEngine;
    gearbox : TGearBox;
    cpp : TCPP;

  end;

var
  frmPropulsionConditions: TfrmPropulsionConditions;

implementation

{$R *.dfm}
uses uERSystem, uControllerSystem;

procedure TfrmPropulsionConditions.btnPropulsionConditionsMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  pnt : TPoint;
begin
  if Button = mbRight then
  begin
    PortStarboard := TButton(Sender).Hint;
    pcsConditionStatus := TButton(Sender).Caption;
    pcsConditionStatusTag := TButton(Sender).Tag;
    FButton := TVrDemoButton(Sender);

    if GetCursorPos(pnt) then
      pmAlarm.Popup(pnt.X, pnt.y);
  end;
end;

procedure TfrmPropulsionConditions.FormShow(Sender: TObject);
begin
  setAlarmStatefromLoadSession;
end;

procedure TfrmPropulsionConditions.mniAlarmOnClick(Sender: TObject);
begin
  if PortStarboard = 'Main Engine PS' then
    main_engine := ERSystem.ERManager.EngineRoom.getPCSSystem.getMainEngine(C_PCS_ME_PORTS)
  else if PortStarboard = 'Main Engine SB' then
    main_engine := ERSystem.ERManager.EngineRoom.getPCSSystem.getMainEngine(C_PCS_ME_STARBOARD)
  else if PortStarboard = 'Gearbox PS' then
    gearbox := ERSystem.ERManager.EngineRoom.getPCSSystem.getGearBox(C_PCS_GB_PORTS)
  else if PortStarboard = 'Gearbox SB' then
    gearbox := ERSystem.ERManager.EngineRoom.getPCSSystem.getGearBox(C_PCS_GB_STARBOARD)
  else if PortStarboard = 'CPP PS' then
    cpp := ERSystem.ERManager.EngineRoom.getPCSSystem.getCPP(C_PCS_CPP_PORTS)
  else if PortStarboard = 'CPP SB' then
    cpp := ERSystem.ERManager.EngineRoom.getPCSSystem.getCPP(C_PCS_CPP_STARBOARD);

  setAlarmCondition(FButton,TPopupMenu(Sender).Tag);

end;
procedure TfrmPropulsionConditions.setAlarmCondition(Sender: TVrDemoButton;
  aOnOff: Integer);
begin
  if aOnOff = 1 then
  begin
    setPropulsionAlarmState(True);
    Sender.Color := clRed;
  end
  else if aOnOff = 2 then
  begin
    setPropulsionAlarmState(False);
    Sender.Color := clBtnFace;
  end;
end;

procedure TfrmPropulsionConditions.setAlarmStatefromLoadSession;
var
  main_engine_ps : TMainEngine;
  main_engine_sb : TMainEngine;
  gearbox_ps : TGearBox;
  gearbox_sb : TGearBox;
  cpp_ps : TCPP;
  cpp_sb : TCPP;
begin
  main_engine_ps := ERSystem.ERManager.EngineRoom.getPCSSystem.getMainEngine(C_PCS_ME_PORTS);
  main_engine_sb := ERSystem.ERManager.EngineRoom.getPCSSystem.getMainEngine(C_PCS_ME_STARBOARD);
  gearbox_ps := ERSystem.ERManager.EngineRoom.getPCSSystem.getGearBox(C_PCS_GB_PORTS);
  gearbox_sb := ERSystem.ERManager.EngineRoom.getPCSSystem.getGearBox(C_PCS_GB_STARBOARD);
  cpp_ps := ERSystem.ERManager.EngineRoom.getPCSSystem.getCPP(C_PCS_CPP_PORTS);
  cpp_sb := ERSystem.ERManager.EngineRoom.getPCSSystem.getCPP(C_PCS_CPP_STARBOARD);

  if Assigned(main_engine_ps) then
  begin
    if main_engine_ps.PC_StartingInterlocks[0] then
      setAlarmCondition(btnPS_SI_RemoteStartInterlock, 1);

    if main_engine_ps.PC_StartingInterlocks[1] then
      setAlarmCondition(btnPS_SI_TurningGearEngaged, 1);

    if main_engine_ps.PC_StartingInterlocks[2] then
      setAlarmCondition(btnPS_SI_ManHandleAtStop, 1);

    if main_engine_ps.PC_StartingInterlocks[3] then
      setAlarmCondition(btnPS_SI_FuelRackAtStop, 1);

    if main_engine_ps.PC_StartingInterlocks[4] then
      setAlarmCondition(btnPS_SI_Clutched, 1);

    if main_engine_ps.PC_StartingInterlocks[5] then
      setAlarmCondition(btnPS_SI_StartingFault, 1);

    if main_engine_ps.PC_StartingInterlocks[6] then
      setAlarmCondition(btnPS_SI_SlowTurningFault, 1);

    if main_engine_ps.PC_StartingInterlocks[7] then
      setAlarmCondition(btnPS_SI_STCSequenceFail, 1);

    if main_engine_ps.PC_StartingInterlocks[8] then
      setAlarmCondition(btnPS_SI_SafetyStopSysFail, 1);

    if main_engine_ps.PC_StartingInterlocks[9] then
      setAlarmCondition(btnPS_SI_SafetyStop, 1);

    if main_engine_ps.PC_StartingInterlocks[10] then
      setAlarmCondition(btnPS_SI_PrelubeFailure, 1);

    if main_engine_ps.PC_StartingInterlocks[11] then
      setAlarmCondition(btnPS_SI_PrelubeInProgress, 1);

    if main_engine_ps.PC_SafetiesStop[0] then
      setAlarmCondition(btnPS_SS_SafetyStopOverriden, 1);

    if main_engine_ps.PC_SafetiesStop[1] then
      setAlarmCondition(btnPS_SS_Overspeed, 1);

    if main_engine_ps.PC_SafetiesStop[2] then
      setAlarmCondition(btnPS_SS_LOPressureVeryLow, 1);

    if main_engine_ps.PC_SafetiesStop[3] then
      setAlarmCondition(btnPS_SS_BearTempVeryHigh, 1);

    if main_engine_ps.PC_SafetiesStop[4] then
      setAlarmCondition(btnPS_SS_FwHtExpTkLevelVeryLow, 1);

    if main_engine_ps.PC_SafetiesStop[5] then
      setAlarmCondition(btnPS_SS_FwTempVeryHigh, 1);

    if main_engine_ps.PC_SafetiesStop[6] then
      setAlarmCondition(btnPS_SS_ConRodBearTempVeryHigh, 1);

    if main_engine_ps.PC_SafetiesStop[7] then
      setAlarmCondition(btnPS_SS_RedGearSafetyStop, 1);

    if main_engine_ps.PC_SafetiesStop[8] then
      setAlarmCondition(btnPS_SS_OilMistDetHigh, 1);

    if main_engine_ps.PC_SafetiesStop[9] then
      setAlarmCondition(btnPS_SS_EmergencyShutdown, 1);

    if main_engine_ps.PC_SafetiesStop[10] then
     setAlarmCondition(btnPS_SS_LocalEmergStop, 1);

    if main_engine_ps.PC_SafetiesStop[11] then
      setAlarmCondition(btnPS_SS_EngInletLubOilVeryHigh, 1);

    if main_engine_ps.PC_Alarms[0] then
      setAlarmCondition(btnPS_Alarms_EngineControllerWatchdog, 1);

    if main_engine_ps.PC_Alarms[1] then
      setAlarmCondition(btnPS_Alarms_CtrlPowerSupplyOn, 1);

    if main_engine_ps.PC_Alarms[2] then
      setAlarmCondition(btnPS_Alarms_SafetyPowerSuppOn, 1);

    if main_engine_ps.PC_Alarms[3] then
      setAlarmCondition(btnPS_Alarms_STCSequenceAlarm, 1);

    if main_engine_ps.PC_Alarms[4] then
      setAlarmCondition(btnPS_Alarms_GovernorMinorFail, 1);

    if main_engine_ps.PC_Alarms[5] then
       setAlarmCondition(btnPS_Alarms_STCInManualMode, 1);

    if main_engine_ps.PC_Alarms[6] then
      setAlarmCondition(btnPS_Alarms_LocalCtrlFail, 1);

    if main_engine_ps.PC_Alarms[7] then
      setAlarmCondition(btnPS_Alarms_ClutchFail, 1);

    if main_engine_ps.PC_Alarms[8] then
      setAlarmCondition(btnPS_Alarms_DeclutchFail, 1);

    if main_engine_ps.PC_Alarms[9] then
      setAlarmCondition(btnPS_Alarms_CommFailEC_PLC, 1);

    if main_engine_ps.PC_Alarms[10] then
      setAlarmCondition(btnPS_Alarms_PLCMonitoringFail, 1);

    if main_engine_ps.PC_Alarms[11] then
      setAlarmCondition(btnPS_Alarms_ClutchFailure, 1);

    if main_engine_ps.PC_Alarms[12] then
      setAlarmCondition(btnPS_Alarms_BridgeLeverOORFailure, 1);

    if main_engine_ps.PC_Alarms[13] then
      setAlarmCondition(btnPS_Alarms_MCRLeverOORFailure, 1);

    if main_engine_ps.PC_Alarms[14] then
      setAlarmCondition(btnPS_Alarms_GeneralSensorFailure, 1);

    if main_engine_ps.PC_Alarms[15] then
      setAlarmCondition(btnPS_Alarms_TrailAlarm, 1);

    if main_engine_ps.PC_Alarms[16] then
      setAlarmCondition(btnPS_Alarms_ResetSafetyStopPossible, 1);
  end;

  if Assigned(main_engine_sb) then
  begin
    if main_engine_sb.PC_StartingInterlocks[0] then
      setAlarmCondition(btnSB_SI_RemoteStartInterlock, 1);

    if main_engine_sb.PC_StartingInterlocks[1] then
      setAlarmCondition(btnSB_SI_TurningGearEngaged, 1);

    if main_engine_sb.PC_StartingInterlocks[2] then
      setAlarmCondition(btnSB_SI_ManHandleAtStop, 1);

    if main_engine_sb.PC_StartingInterlocks[3] then
      setAlarmCondition(btnSB_SI_FuelRackAtStop, 1);

    if main_engine_sb.PC_StartingInterlocks[4] then
      setAlarmCondition(btnSB_SI_Clutched, 1);

    if main_engine_sb.PC_StartingInterlocks[5] then
      setAlarmCondition(btnSB_SI_StartingFault, 1);

    if main_engine_sb.PC_StartingInterlocks[6] then
      setAlarmCondition(btnSB_SI_SlowTurningFault, 1);

    if main_engine_sb.PC_StartingInterlocks[7] then
      setAlarmCondition(btnSB_SI_STCSequenceFail, 1);

    if main_engine_sb.PC_StartingInterlocks[8] then
      setAlarmCondition(btnSB_SI_SafetyStopSysFail, 1);

    if main_engine_sb.PC_StartingInterlocks[9] then
      setAlarmCondition(btnSB_SI_SafetyStop, 1);

    if main_engine_sb.PC_StartingInterlocks[10] then
      setAlarmCondition(btnSB_SI_PrelubeFailure, 1);

    if main_engine_sb.PC_StartingInterlocks[11] then
      setAlarmCondition(btnSB_SI_PrelubeInProgress, 1);

    if main_engine_sb.PC_SafetiesStop[0] then
      setAlarmCondition(btnSB_SS_SafetyStopOverriden, 1);

    if main_engine_sb.PC_SafetiesStop[1] then
      setAlarmCondition(btnSB_SS_Overspeed, 1);

    if main_engine_sb.PC_SafetiesStop[2] then
      setAlarmCondition(btnSB_SS_LOPressureVeryLow, 1);

    if main_engine_sb.PC_SafetiesStop[3] then
      setAlarmCondition(btnSB_SS_BearTempVeryHigh, 1);

    if main_engine_sb.PC_SafetiesStop[4] then
      setAlarmCondition(btnSB_SS_FwHtExpTkLevelVeryLow, 1);

    if main_engine_sb.PC_SafetiesStop[5] then
      setAlarmCondition(btnSB_SS_FwTempVeryHigh, 1);

    if main_engine_sb.PC_SafetiesStop[6] then
      setAlarmCondition(btnSB_SS_ConRodBearTempVeryHigh, 1);

    if main_engine_sb.PC_SafetiesStop[7] then
      setAlarmCondition(btnSB_SS_RedGearSafetyStop, 1);

    if main_engine_sb.PC_SafetiesStop[8] then
      setAlarmCondition(btnSB_SS_OilMistDetHigh, 1);

    if main_engine_sb.PC_SafetiesStop[9] then
      setAlarmCondition(btnSB_SS_EmergencyShutdown, 1);

    if main_engine_sb.PC_SafetiesStop[10] then
     setAlarmCondition(btnSB_SS_LocalEmergStop, 1);

    if main_engine_sb.PC_SafetiesStop[11] then
      setAlarmCondition(btnSB_SS_EngInletLubOilVeryHigh, 1);

    if main_engine_sb.PC_Alarms[0] then
      setAlarmCondition(btnSB_Alarms_EngineControllerWatchdog, 1);

    if main_engine_sb.PC_Alarms[1] then
      setAlarmCondition(btnSB_Alarms_CtrlPowerSupplyOn, 1);

    if main_engine_sb.PC_Alarms[2] then
      setAlarmCondition(btnSB_Alarms_SafetyPowerSuppOn, 1);

    if main_engine_sb.PC_Alarms[3] then
      setAlarmCondition(btnSB_Alarms_STCSequenceAlarm, 1);

    if main_engine_sb.PC_Alarms[4] then
      setAlarmCondition(btnSB_Alarms_GovernorMinorFail, 1);

    if main_engine_sb.PC_Alarms[5] then
       setAlarmCondition(btnSB_Alarms_STCInManualMode, 1);

    if main_engine_sb.PC_Alarms[6] then
      setAlarmCondition(btnSB_Alarms_LocalCtrlFail, 1);

    if main_engine_sb.PC_Alarms[7] then
      setAlarmCondition(btnSB_Alarms_ClutchFail, 1);

    if main_engine_sb.PC_Alarms[8] then
      setAlarmCondition(btnSB_Alarms_DeclutchFail, 1);

    if main_engine_sb.PC_Alarms[9] then
      setAlarmCondition(btnSB_Alarms_CommFailEC_PLC, 1);

    if main_engine_sb.PC_Alarms[10] then
      setAlarmCondition(btnSB_Alarms_PLCMonitoringFail, 1);

    if main_engine_sb.PC_Alarms[11] then
      setAlarmCondition(btnSB_Alarms_ClutchFailure, 1);

    if main_engine_sb.PC_Alarms[12] then
      setAlarmCondition(btnSB_Alarms_BridgeLeverOORFailure, 1);

    if main_engine_sb.PC_Alarms[13] then
      setAlarmCondition(btnSB_Alarms_MCRLeverOORFailure, 1);

    if main_engine_sb.PC_Alarms[14] then
      setAlarmCondition(btnSB_Alarms_GeneralSensorFailure, 1);

    if main_engine_sb.PC_Alarms[15] then
      setAlarmCondition(btnSB_Alarms_TrailAlarm, 1);

    if main_engine_sb.PC_Alarms[16] then
      setAlarmCondition(btnSB_Alarms_ResetSafetyStopPossible, 1);
  end;

  if Assigned(gearbox_ps) then
  begin
    if gearbox_ps.PC_ClutchInterlocks[0] then
      setAlarmCondition(btnPS_CI_PitchNotZero, 1);

    if gearbox_ps.PC_ClutchInterlocks[1] then
      setAlarmCondition(btnPS_CI_ShaftLocked, 1);

    if gearbox_ps.PC_ClutchInterlocks[2] then
      setAlarmCondition(btnPS_CI_PCSClutchInterlock, 1);

    if gearbox_ps.PC_ClutchInterlocks[3] then
      setAlarmCondition(btnPS_CI_ClutchAllowedLOP, 1);
  end;

  if Assigned(gearbox_sb) then
  begin
    if gearbox_sb.PC_ClutchInterlocks[0] then
      setAlarmCondition(btnSB_CI_PitchNotZero, 1);

    if gearbox_sb.PC_ClutchInterlocks[1] then
      setAlarmCondition(btnSB_CI_ShaftLocked, 1);

    if gearbox_sb.PC_ClutchInterlocks[2] then
      setAlarmCondition(btnSB_CI_PCSClutchInterlock, 1);

    if gearbox_sb.PC_ClutchInterlocks[3] then
      setAlarmCondition(btnSB_CI_ClutchAllowedLOP, 1);
  end;

  if Assigned(cpp_ps) then
  begin
    if cpp_ps.PC_Failure[0] then
      setAlarmCondition(btnPS_CPP_ControlFailure, 1);

    if cpp_ps.PC_Failure[1] then
      setAlarmCondition(btnPS_CPP_FollowUpFailure, 1);

    if cpp_ps.PC_Failure[2] then
      setAlarmCondition(btnPS_CPP_BackupSupplyFailure, 1);
  end;

  if Assigned(cpp_sb) then
  begin
    if cpp_sb.PC_Failure[0] then
      setAlarmCondition(btnSB_CPP_ControlFailure, 1);

    if cpp_sb.PC_Failure[1] then
      setAlarmCondition(btnSB_CPP_FollowUpFailure, 1);

    if cpp_sb.PC_Failure[2] then
      setAlarmCondition(btnSB_CPP_BackupSupplyFailure, 1);
  end;
end;

procedure TfrmPropulsionConditions.setPropulsionAlarmState(isAlarm: Boolean);
begin
  if pcsConditionStatus = 'REMOTE START INTERLOCK' then
  begin
    main_engine.RemoteStartInterlock := isAlarm;
  end
  else if pcsConditionStatus = 'TURNING GEAR ENGAGED' then
  begin
    main_engine.TurningGearEngaged := isAlarm;
  end
  else if pcsConditionStatus = 'MAN HANDLE AT STOP' then
  begin
    main_engine.ManHandleAtStop := isAlarm;
  end
  else if pcsConditionStatus = 'FUEL RACK AT STOP' then
  begin
    main_engine.FuelRackAtStop := isAlarm;
  end
  else if pcsConditionStatus = 'CLUTCHED' then
  begin
    main_engine.Clutched := isAlarm;
  end
  else if pcsConditionStatus = 'STARTING FAULT' then
  begin
    main_engine.StartingFault := isAlarm;
  end
  else if pcsConditionStatus = 'SLOW TURNING FAULT' then
  begin
    main_engine.SlowTurningFault := isAlarm;
  end
  else if pcsConditionStatus = 'STC SEQUENCE FAIL' then
  begin
    main_engine.STCSequenceFail := isAlarm;
  end
  else if pcsConditionStatus = 'SAFETY STOP SYS FAIL' then
  begin
    main_engine.SafetyStopSysFail := isAlarm;
  end
  else if pcsConditionStatus = 'SAFETY STOP' then
  begin
    main_engine.SafetyStop := isAlarm;
  end
  else if pcsConditionStatus = 'PRELUBRICATION FAILURE' then
  begin
    main_engine.PrelubricationFailure := isAlarm;
  end
  else if pcsConditionStatus = 'PRELUB IN PROGRESS' then
  begin
    main_engine.PrelubInProgress := isAlarm;
  end
  else if pcsConditionStatus = 'PITCH NOT ZERO' then
  begin
    gearbox.PitchNotZero := isAlarm;
  end
  else if pcsConditionStatus  = 'SHAFT LOCKED' then
  begin
    gearbox.ShaftLocked := isAlarm;
  end
  else if pcsConditionStatus  = 'PCS CLUTCH INTERLOCK' then
  begin
    gearbox.PCSClutchInterlock := isAlarm;
  end
  else if pcsConditionStatus  = 'CLUTCH ALLOWED LOP' then
  begin
    gearbox.ClutchAllowedLOP := isAlarm;
  end
  else if pcsConditionStatus  = 'SAFETY STOPS OVERRIDEN' then
  begin
    main_engine.SafetyStopsOverriden := isAlarm;
  end
  else if pcsConditionStatus  = 'OVERSPEED' then
  begin
    main_engine.OverspeedAlarm := isAlarm;
  end
  else if pcsConditionStatus  = 'LO PRESSURE VERY LOW' then
  begin
    main_engine.LOPressVeryLow := isAlarm;
  end
  else if pcsConditionStatus  = 'BEAR TEMP VERY HIGH' then
  begin
    if isAlarm then
    begin
      bearTemp := RandomRange(0,10);
      main_engine.BearTempVeryHigh := isAlarm;
      main_engine.TempBear[bearTemp] := 150;
    end
    else
    begin
      main_engine.BearTempVeryHigh := False;
      main_engine.TempBear[bearTemp] := 30;
    end;
  end
  else if pcsConditionStatus  = 'FW HT EXP TK LEVEL VERY LOW' then
  begin
    main_engine.FwHtExpTkLevelVeryLow := isAlarm;
  end
  else if pcsConditionStatus  = 'FW TEMP VERY HIGH' then
  begin
    main_engine.FwTempVeryHigh := isAlarm;
  end
  else if pcsConditionStatus  = 'CON ROD BEAR TEMP VERY HIGH' then
  begin
    if isAlarm then
    begin
      conRodBearTemp := RandomRange(0,9);
      main_engine.ConRodBearTempVeryHigh := isAlarm;
      main_engine.TempConRodBear[conRodBearTemp] := 100;
    end
    else
    begin
      main_engine.ConRodBearTempVeryHigh := False;
      main_engine.TempConRodBear[conRodBearTemp] := 30;
    end;
  end
  else if pcsConditionStatus  = 'RED GEAR SAFETY STOP' then
  begin
    main_engine.RedGearSafetyStop := isAlarm;
  end
  else if pcsConditionStatus  = 'OIL MIST DET HIGH' then
  begin
    main_engine.OilMistDetHigh := isAlarm;
  end
  else if pcsConditionStatus  = 'EMERGENCY SHUTDOWN' then
  begin
    main_engine.EmergencyShutdown := isAlarm;
  end
  else if pcsConditionStatus  = 'LOCAL EMERG STOP' then
  begin
    main_engine.LocalEmergencyStop := isAlarm;
  end
  else if pcsConditionStatus  = 'ENG INLET LUB OIL VERY HIGH' then
  begin
    main_engine.EngInletLubOilVeryHigh := isAlarm;
  end
  else if pcsConditionStatus  = 'ENGINE CONTROLLER WATCHDOG' then
  begin
    main_engine.EngineControllerWatchdog := isAlarm;
  end
  else if pcsConditionStatus  = 'CTRL POWER SUPPLY ON' then
  begin
    main_engine.CtrlPowerSupplyOn := isAlarm;
  end
  else if pcsConditionStatus  = 'SAFETY POWER SUPP ON' then
  begin
    main_engine.SafetyPowerSuppOn := isAlarm;
  end
  else if pcsConditionStatus  = 'STC SEQUENCE ALARM' then
  begin
    main_engine.STCSequenceAlarm := isAlarm;
  end
  else if pcsConditionStatus  = 'GOVERNOR MINOR FAIL' then
  begin
    main_engine.GovernorMinorFail := isAlarm;
  end
  else if pcsConditionStatus  = 'STC IN MANUAL MODE' then
  begin
    main_engine.STCInManualMode := isAlarm;
  end
  else if pcsConditionStatus  = 'LOCAL CTRL FAIL' then
  begin
    main_engine.LocalCtrlFail := isAlarm;
  end
  else if pcsConditionStatus  = 'CLUTCH FAIL' then
  begin
    main_engine.ClutchFail := isAlarm;
  end
  else if pcsConditionStatus  = 'DECLUTCH FAIL' then
  begin
    main_engine.DeclutchFail := isAlarm;
  end
  else if pcsConditionStatus  = 'COMM FAIL EC And PLC' then
  begin
    main_engine.CommFailEC_PLC := isAlarm;
  end
  else if pcsConditionStatus  = 'PLC MONITORING FAIL' then
  begin
    main_engine.PLCMonitoringFail := isAlarm;
  end
  else if pcsConditionStatus  = 'CLUTCH FAILURE' then
  begin
    main_engine.ClutchFailure := isAlarm;
  end
  else if pcsConditionStatus  = 'BRIDGE LEVER OOR FAILURE' then
  begin
    main_engine.BridgeLeverOORFailure := isAlarm;
  end
  else if pcsConditionStatus  = 'MCR LEVER OOR FAILURE' then
  begin
    main_engine.MCRLeverOORFailure := isAlarm;
  end
  else if pcsConditionStatus  = 'GENERAL SENSOR FAILURE' then
  begin
    main_engine.GeneralSensorFailure := isAlarm;
  end
  else if pcsConditionStatus  = 'TRAIL ALARM' then
  begin
    main_engine.TrailAlarm := isAlarm;
  end
  else if pcsConditionStatus  = 'RESET SAFETY STOP POSSIBLE' then
  begin
    main_engine.ResetSafetyStopPossible := isAlarm;
  end
  else if pcsConditionStatus = 'CONTROL FAILURE' then
  begin
    cpp.CLSControl := isAlarm;
  end
  else if pcsConditionStatus = 'FOLLOW UP FAILURE' then
  begin
    cpp.FollowUpError := isAlarm;
  end
  else if pcsConditionStatus = 'BACKUP SUPPLY FAILURE' then
  begin
    cpp.BackupSupplyFail := isAlarm;
  end
  else if pcsConditionStatus = 'SHAFT LOCK' then
  begin
    gearbox.ShaftLocked := isAlarm;
  end
  else if pcsConditionStatus = 'SHAFT POWER LIMITED' then
  begin
    gearbox.ShaftPowerLimited := isAlarm;
  end
  else if pcsConditionStatus = 'ME FAILURE' then
  begin
    main_engine.Failure := isAlarm;
  end
  else if pcsConditionStatus = 'GB FAILURE' then
  begin
    gearbox.Failure := isAlarm;
  end;
end;

end.
