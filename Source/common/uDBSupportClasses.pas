unit uDBSupportClasses;

interface

uses
  Classes, ExtCtrls, uDataType;

type
  TACSData = class
    sandiRuangan : string;
    deck : string;
    lokasi : string;
    lokasiGRM : string;
    alarmID : Byte;
    alarmMessage : string;
    alarmMessageGRM : string;
    alarmComment : string;
    alarmCommentGRM : string;
    faultID : Byte;
    faultMessage : string;
    faultMessageGRM : string;
    faultComment : string;
    faultCommentGRM : string;
    statusRec : String;
    scenTime : TDateTime;
  end;

  TCommandsData = class
    timestamp : TDateTime;
    point_id : string;
    _VAL : string;
  end;

  TParameterChangesData = class
    timestamp : TDateTime;
    point_id : string;
    _ENG : string;
    _PREV : string;
    _VAL : string;
  end;

  TAlarmData = class
    Running_ID : Integer;
    timestamp : TDateTime;
    sequence_number : Integer;
    alarm_id : string;
    alarm_class : string;
    resource : string;
    logged_by : string;
    reference : string;
    prev_state : string;
    log_action : string;
    final_state : string;
    alarm_message : string;
    generation_time : TDateTime;
    aDuration : Double;
    aAck : string;
  end;

  TElementData = class
  public
    ElementID : string;
	  Elementname : string;
  	Inhibit_IDfk : string;
	  Controller_ID : string;
	  SystemIDfk : Integer;
	  SystemDescription : string;
	  MainMimic_IDfk : Integer;
	  Text_0 : string;
	  Text_1 : string;
	  Alarm : Integer;
	  AlarmgroupID : Integer;
	  Elementtype_IDfk : string;
    AlarmgroupAbbreviation : string;
    AlarmgroupDescription : string;
    aDuration: Double;
    aAck : string;
    FinalState : string;
    aTime : TDateTime;
  end;

  TCIPInfo = class
  public
    F1 : string;
    F2 : string;
    F3 : string;
    F4 : string;
    F5 : string;
    F6 : string;
    F7 : string;
    F8 : string;
    F1A : string;
    F2A : string;
    F3A : string;
    F4A : string;
    F5A : string;
    F6A : string;
    F7A : string;
    F8A : string;
    SM0 : string;
    SM1 : string;
    SM2 : string;
    SM3 : string;
    SM4 : string;
    SM5 : string;
    SM6 : string;
    SM7 : string;
    SM8 : string;
    SM9 : string;
    SM10 : string;
    SM11 : string;
    SM12 : string;
    SM13 : string;
    SM14 : string;
    SM15 : string;
    ENBL : string;
    INH : string;
    AUTO : string;
    MAN : string;
    LOC : string;
  end;

  TIPMS_Record_Data = class
  public
    FElementID : string;
    FFieldID : string;
    FElementValue : Double;
  end;

  TIPMS_Field_Data = class
  public
    timestamp : TDateTime;
    Values : TList;
  end;

  TIPMS_Table_Data = class
  public
    FDB_Name : string;
    FDB_Field : TIPMS_Field_Data;
  end;

  TIOPOint_Data = class
    FIO_type : string;
    FIO_function_IDfk : string;
    FIO_Rack : string;
    FIO_Slot : string;
    FIO_Channel : string;
    FCM_IDfk : string;
    FS_Address_desk : string;
    F_Serial : string;
  end;

  TEquation_Data = class
    FEquation_IDfk : string;
    FEquationName : string;
    FEquationDesc : string;
  end;

  TParameter_Data = class
    FParamName : string;
    FParamValue : string;
    FParamUnit : string;
  end;

  TTank_Data = class
    FElementID : string;
    FTankBreakPointNumber : string;
    FSoundLength : string;
    FTrim2m : string;
    FTrim0m : string;
    FTrim1m : string;
    FTrim3m : string;
    FTrim6m : string;
  end;

  TCAP_Data = class
  public
    FElementID : string;
    FElementtype_IDfk : string;
    FElementname : string;
    FSystemIDfk : string;
    FSystemDescription : string;
    FController_ID : string;
    FMainMimic_IDfk : string;
    FAlarmGroupAbbreviation : string;
    FIOPointList : TList;
    FEquationList : TList;
    FParamList : TList;
    FTankList : TList;
  end;

  TElementPointParamData = class
    FTimestamp : TDateTime;
    FPointID : string;
    FEngUnit : string;
    FPrevVal : string;
    FCurrVal : string;
    FParamType : string;
    FElementID : string;
  end;

  TIPMS_Record_Parameter = class
  public
    FElementID : string;
    FParameterName : string;
    FParameterValue : string;
    FParameterUnit : string;
  end;

  TScenario_Data = class
    ID : Integer;
    Name : string;
    Description : string;
    ArrConditionID : array of Integer;
    ArrConditionType : array of string;
    ArrConditionName : array of string;
  end;

  TSession_Data = class
    SessionName : string;
    SessionID : Integer;
    SessionStart : TDateTime;
    SessionStop : TDateTime;
    OriginalScenario : string;
  end;

  TPMSCond_Data = class
    PMS_ID : Integer;
    PMS_Name : string;
    PMS_Type : Integer;

    {Gen}
    PMS_Mode : Integer;      {-----> Mode Genarator : 1:Man; 2:SemiMan; 3:Aut; 4:SemiAut}
    PMS_State : Integer;
    PMS_OnOff : Integer;
    PMS_Pref : Integer;
    PMS_CB : Integer;

    {Switch}
    PMS_SWB_MSBIntrMode : Integer;
    PMS_SWB_ESBIntrMode : Integer;
    PMS_SWB_ShoreIntrMode : Integer;
    PMS_SWB_MsbCBIntr : Integer;
    PMS_SWB_EsbCBIntr : Integer;
    PMS_SWB_MsbCBShore : Integer;

    {Variable}
    PMS_FirstLoad : Integer;
    PMS_StateRunFull : Integer;
    PMS_StateRunFwd : Integer;
    PMS_StateRunAft : Integer;

    Condition_ID : Integer;
  end;

  TPCSCond_Data = class
    PCS_ID : Integer;
    PCS_Name : string;
    PCS_State : Integer;
    Condition_ID : Integer;
    Value : Integer;
  end;

  TFACond_Data = class
    FA_ID : Integer;
    Role : string;
    FA_DGSETS_State : Integer;
    FA_Distribution_State : Integer;
    FA_Propultion_State : Integer;
    FA_Auxiliary_State : Integer;
    FA_Fuel_State : Integer;
    FA_Domest_State : Integer;
    FA_HVAC_State : Integer;
    FA_FFDC_State : Integer;
    FA_Navigation_State : Integer;
    FA_Ballast_State : Integer;
    FA_IPMS_State : Integer;
    FA_IAS_State : Integer;
    Condition_ID : Integer;
  end;

  TTanksCond_Data = class
    Tanks_ID : Integer;
    Tanks_ElementID : string;
    Tanks_Value : Double;
    Condition_ID : Integer;
  end;

  TScenarioPMSCondition = class
    PMS_Name : string;
    PMS_Type : Integer;
    PMS_Mode : Integer;
    PMS_OnOff : Integer;
    PMS_GenSupplied : Integer;
    PMS_GenState : Integer;
    PMS_CBClosed : Integer;
    PMS_Preference : Integer;
    PMS_Busbar : Integer;
    PMS_RunHours : Integer;
    PMS_EmergencyStop : Integer;

    {Failure Element}
    PMS_NotStandby : Integer;
    PMS_CanBusFailure : Integer;
    PMS_MeasPowFailure : Integer;
    PMS_DCPowFailure : Integer;
    PMS_EngineAlarm : Integer;
    PMS_ShutDown : Integer;
    PMS_FaultPageLed : Integer;
    PMS_FailureCBClosed : Integer;

    {Value Element}
    PMS_Power : Double;
    PMS_Power_State : Double;
    PMS_Frequency : Double;
    PMS_Frequency_State : Double;
    PMS_SwitchFrequency : Double;
    PMS_Current : Double;
    PMS_Voltage : Double;
    PMS_Voltage_State : Double;
    PMS_CosPhi : Double;
    PMS_U : Double;
    PMS_V : Double;
    PMS_W : Double;

    {Switchboard}
    PMS_SWB_MSBIntrMode : Integer;
    PMS_SWB_ESBIntrMode : Integer;
    PMS_SWB_ShoreIntrMode : Integer;
    PMS_SWB_MsbCBIntr : Integer;
    PMS_SWB_EsbCBIntr : Integer;
    PMS_SWB_MsbCBShore : Integer;
    PMS_SWB_MsbCBNavNaut : Integer;
    PMS_SWB_Busbar : Integer;
    PMS_SWB_TripReduct : Integer;
    PMS_SWB_EmergencyCon : Integer;
    PMS_SWB_Frequency : Double;
    PMS_SWB_Voltage : Double;
    PMS_SWB_Power : Double;
    PMS_SWB_Trafo230Volt : Double;
    PMS_SWB_Trafo115Volt : Double;

    {Power}
    PMS_PowerMode : Integer;
    PMS_PowerConsmr : Double;

    {Variable}
    PMS_FirstLoad : Integer;
    PMS_StateRunFull : Integer;
    PMS_StateRunFwd : Integer;
    PMS_StateRunAft : Integer;
  end;

  TScenarioPCSCondition = class
    PCS_Name : string;
    PCS_State : Integer;
    Value : Integer;
    PCS_ME_Control : Integer;
    PCS_ME_Mode : Integer;
    PCS_ME_EngineRun : Integer;
    PCS_ME_ReadyForUse : Integer;
    PCS_ME_SetpointSpeed : Double;
    PCS_ME_RemoteAuto : Integer;
    PCS_ME_RemoteManual : Integer;
    PCS_ME_LeverControl : Integer;
    PCS_ME_Alarm : Integer;
    PCS_ME_Failure : Integer;
    PCS_GB_ClutchAllowed : Integer;
    PCS_GB_ClutchEngaged : Integer;
    PCS_GB_ReadyForUse : Integer;
    PCS_GB_RemoteAuto : Integer;
    PCS_GB_RemoteManual : Integer;
    PCS_GB_Failure : Integer;
    PCS_GB_ShaftLocked : Integer;
    PCS_GB_ShaftPowerLimited : Integer;
    PCS_CPP_ReadyForUse : Integer;
    PCS_CPP_SetpointPitch : Double;
    PCS_CPP_RemoteAuto : Integer;
    PCS_CPP_RemoteManual : Integer;
    PCS_CPP_Failure : Integer;
    PCS_CPP_PumpStandby : string;
    PCS_CPP_PumpStart : string;
    PCS_CPP_PumpAuto : Integer;
    PCS_LCP_Heater : Integer;
    PCS_LCP_Pump : Integer;
    PCS_PC_StartingInterlocks : string;
    PCS_PC_Alarms : string;
    PCS_PC_SafetiesStop : string;
    PCS_PC_ClutchInterlocks : string;
    PCS_PC_CPPFailure : string;
  end;

  TElementCondition = class
    Condition_ID : Integer;
    Element_ID : string;
    StateElementDisabled : Integer;
    ValueApplication : Double;
    StateValid : Integer;
    StateWireBreak : Integer;
    StateDisplayStationary : Integer;
    StateAlarmInhibited : Integer;
    StateStatus : Integer;
    StateCommandClose : Integer;
    StateCommandOpen : Integer;
    StateManualAuto : Integer;
    StateCommandCloseApp : Integer;
    StateCommandOpenApp : Integer;
    StateCommandCloseHMI : Integer;
    StateCommandOpenHMI : Integer;
    StateRFC : Integer;
    StateRFO : Integer;
    StateSwitchClosed : Integer;
    StateSwitchOpen : Integer;
    StateSwitchRemote : Integer;
    StateSwitchTripped : Integer;
    StateSwitchNoFault : Integer;
    StatePMSSwitchClosedOpen : Integer;
    StateNoFault : Integer;
    StateNoRFU : Integer;
    StateTransition : Integer;
    ProcesStatus : Integer;
    CommandHMI : Integer;
    Command : Integer;
    State : Integer;
    StateElementCaption : Integer;
    StateSwitchSpeed1 : Integer;
    StateSwitchSpeed2 : Integer;
    CommandStartSpeed1App : Integer;
    CommandStartSpeed2App : Integer;
    CommandStopApp : Integer;
    CommandStartSpeed1HMI : Integer;
    CommandStartSpeed2HMI : Integer;
    CommandStopHMI : Integer;
    StateBlockOut : Integer;
    StateRestart : Integer;
    StateValueValid : Integer;
    RFU : Integer;
    RunCondition : Integer;
    CommandStartApp : Integer;
    CommandStartHMI : Integer;
    StateRFU : Integer;
    StateSwitchRunning : Integer;
    StateSwitchStandby : Integer;
    CommandStandbyApp : Integer;
    CommandStandbyHMI : Integer;
    StateSwitchRFU : Integer;
    StateRunCondition : Integer;
    CommandReset : Integer;
    EnableCounting : Integer;
    StateLA : Integer;
    StateHA : Integer;
    StateHHA : Integer;
    EventInput : Integer;
    SensorValue : Double;
    CommandEnableDisable : Integer;
    HMISetPoint : Integer;
    ValueSensor : Double;
    TrimValue : Double;
    CompensationSensor : Double;
    InState : Integer;
    Mode : Integer;
    Evaluate : Integer;
    StateSwitch : Integer;
    StateAutoManual : Integer;
    CommandOpen : Integer;
    CommandClose : Integer;
    DesireState : Integer;
    SetPoint : Integer;
    ValueValve : Integer;
    StateInhibited : Integer;
    ValueElement : Double;
    StateInState : Integer;
  end;

  TFieldDataTrend = class
    TableName : string;
    ColumnName : string;
    ElIndex : Integer;
    TableType : string;
  end;

  TComponentElementPair = class
    ElementID : string;
    MimicType : array of E_MimicType;
    ComponentList : TList; // jumlah component = jumlah mimic
    MimicIndex : TList;
  end;

  TComponentElement = class
  private
    FCElement : TList;
  public
    constructor Create;
    destructor Destroy; override;
    procedure AddPair(aVal: TComponentElementPair);
    function PairExist(aElementID: string): Boolean;
    function GetPair(aElementID: string): TComponentElementPair; overload;
    function GetPair(index: Integer): TComponentElementPair; overload;
    function PairCount: Integer;
  end;

  TConditionData = class
    ConditionID : Integer;
    ConditionName : string;
    ConditionType : string;
  end;

procedure InitConditionElement(var aCondition: TElementCondition);

implementation

procedure InitConditionElement(var aCondition: TElementCondition);
begin
  with aCondition do
  begin
    Condition_ID := 0;
    Element_ID := '';
    StateElementDisabled := 0;
    ValueApplication := 0;
    StateValid := 0;
    StateWireBreak := 0;
    StateDisplayStationary := 0;
    StateAlarmInhibited := 0;
    StateStatus := 0;
    StateCommandClose := 0;
    StateCommandOpen := 0;
    StateManualAuto := 0;
    StateCommandCloseApp := 0;
    StateCommandOpenApp := 0;
    StateCommandCloseHMI := 0;
    StateCommandOpenHMI := 0;
    StateRFC := 0;
    StateRFO := 0;
    StateSwitchClosed := 0;
    StateSwitchOpen := 0;
    StateSwitchRemote := 0;
    StateSwitchTripped := 0;
    StateSwitchNoFault := 0;
    StatePMSSwitchClosedOpen := 0;
    StateNoFault := 0;
    StateNoRFU := 0;
    StateTransition := 0;
    ProcesStatus := 0;
    CommandHMI := 0;
    Command := 0;
    State := 0;
    StateElementCaption := 0;
    StateSwitchSpeed1 := 0;
    StateSwitchSpeed2 := 0;
    CommandStartSpeed1App := 0;
    CommandStartSpeed2App := 0;
    CommandStopApp := 0;
    CommandStartSpeed1HMI := 0;
    CommandStartSpeed2HMI := 0;
    CommandStopHMI := 0;
    StateBlockOut := 0;
    StateRestart := 0;
    StateValueValid := 0;
    RFU := 0;
    RunCondition := 0;
    CommandStartApp := 0;
    CommandStartHMI := 0;
    StateRFU := 0;
    StateSwitchRunning := 0;
    StateSwitchStandby := 0;
    CommandStandbyApp := 0;
    CommandStandbyHMI := 0;
    StateSwitchRFU := 0;
    StateRunCondition := 0;
    CommandReset := 0;
    EnableCounting := 0;
    StateLA := 0;
    StateHA := 0;
    StateHHA := 0;
    EventInput := 0;
    SensorValue := 0 ;
    CommandEnableDisable := 0;
    HMISetPoint := 0;
    ValueSensor := 0 ;
    TrimValue := 0 ;
    CompensationSensor := 0 ;
    InState := 0;
    Mode := 0;
    Evaluate := 0;
    StateSwitch := 0;
    StateAutoManual := 0;
    CommandOpen := 0;
    CommandClose := 0;
    DesireState := 0;
    SetPoint := 0;
    ValueValve := 0;
    StateInhibited := 0;
    ValueElement := 0;
    StateInState := 0;
  end;
end;

{ TComponentElement }

procedure TComponentElement.AddPair(aVal: TComponentElementPair);
begin
  if not PairExist(aVal.ElementID) then
    FCELement.Add(aVal);
end;

constructor TComponentElement.Create;
begin
  FCELement := TList.Create;
end;

destructor TComponentElement.Destroy;
begin
  FCELement.Free;
  inherited;
end;

function TComponentElement.GetPair(index: Integer): TComponentElementPair;
begin
  Result := nil;

  if index < FCELement.Count then
    Result := TComponentElementPair(FCELement.Items[index]);
end;

function TComponentElement.GetPair(aElementID: string): TComponentElementPair;
var
  i : Integer;
begin
  Result := nil;

  for i := 0 to FCELement.Count - 1 do
  begin
    if TComponentElementPair(FCELement.Items[i]).ElementID = aElementID then
    begin
      Result := TComponentElementPair(FCELement.Items[i]);
      Break;
    end;
  end;
end;

function TComponentElement.PairCount: Integer;
begin
  Result := FCELement.Count;
end;

function TComponentElement.PairExist(aElementID: string): Boolean;
var
  i : Integer;
begin
  Result := False;

  for i := 0 to FCELement.Count - 1 do
  begin
    if TComponentElementPair(FCELement.Items[i]).ElementID = aElementID then
    begin
      Result := True;
      Break;
    end;
  end;
end;

end.
