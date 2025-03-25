unit uScenario;

interface

uses
  uDatabase, Classes, uDBSupportClasses, uDataType, uListener, Dialogs;

type
  TScenario = class
  private
    FDatabase : TIPMSDatabase;
    FList : TStrings;
    FRunState : E_ScenarioRunState;
    FListener : TListeners;

    FPMSCondList : TList;
    FOnProgressStep : T_OnProgressStep;
    FCurrentRunningScenario : Integer;
    FCurrentRunningScenarioTime : TDateTime;
    FCurrentRunningScenarioStart : TDateTime;

    procedure SetRunState(const Value: E_ScenarioRunState);
    procedure SetOnProgressStep(const Value: T_OnProgressStep);
    procedure SetRunningScenarioTime(const Value: TDateTime);
    procedure SetRunningScenario(const Value: Integer);
    procedure SetCurrentScenarioStart(const Value: TDateTime);
  public
    constructor Create(aDatabase: TIPMSDatabase);
    destructor Destroy; override;

    procedure getScenarios(var aList: TStrings);
    procedure getSessions(var aList: TStrings);
    function insertScenario(aID: Integer; aName, aDesc: string; intArr: array of Integer): Integer;
    function deleteScenario(aID: Integer): Boolean;
    function getScenario(aName: string): TScenario_Data; overload;
    function getScenario(aID: Integer): TScenario_Data; overload;
    function getScenarioDesc(aName: string): string;
    function getScenarioConditions(aName: string): TStrings;
    function getSession(aSessionID: Integer): TSession_Data; overload;
    function getSession(aSessionName: string): TSession_Data; overload;
    procedure loadScenario(aSessionID: Integer);
    function PrepareRunningScenario(aName: string; var aDateTimeStart: TDateTime): Boolean;

    {prince}
    function setBooltoInt(valbool : Boolean): Integer;
    function setInttoBool(valint : Integer): Boolean;

    function GetConditionID(aName: string): Integer;
    procedure GetElementConditions(var aList: TStrings);
    procedure SaveElementCondition(aName: string; aList: TList; var ConditionID: Integer);

    {$REGION ' PMS '}
    function GetPMSCondID(aID, aIndex: Integer): Integer;
    function DeletePMSCondition(aID: Integer): Boolean;
    procedure GetPMSConditions(var aList: TStrings);
    procedure GetPMSCondition(aID: Integer; var aList: TList);
    procedure SavePMSCondition(aIsNew: Boolean; aName: string; aList: TList; var ConditionID: Integer);
    procedure SaveRS_PMSCondition(aSessionID: Integer);
    {$ENDREGION}

    {$REGION ' PCS '}
    function DeletePCSCondition(aID: Integer): Boolean;
    procedure GetPCSConditions(var aList: TStrings);
    procedure GetPCSCondition(aID: Integer; var aList : TList);
    procedure SavePCSCondition(aIsNew: Boolean; aName: string; var aList: TList);
    procedure SaveRS_PCSCondition(aSessionID: Integer);
    {$ENDREGION}

    {$REGION ' FA '}
    function DeleteFACondition(aID: Integer): Boolean;
    function GetFACondID(aID, aIndex: Integer): Integer;
    procedure GetFACondition(aID: Integer; var aList: TList);
    procedure GetFAConditions(var aList: TStrings);
    procedure SaveFACondition(aIsNew: Boolean; aName: string; aList: TList; var ConditionID: Integer);
    {$ENDREGION}

    {$REGION ' TANK '}
    function GetTanksCondID(aID, aIndex: Integer): Integer;
    function DeleteTanksCondition(aID: Integer): Boolean;
    function cekValidateTankValue(aID: string; aValue: Double): Boolean;
    function cekValidateTankName(aIsNew: Boolean; aType, aName,aOldName: string): Boolean;
    function getMaxTankValue(aElementID: string): Double;
    procedure GetTanksCondition(aID: Integer; var aList: TList);
    procedure GetTanksConditions(var aList: TStrings);
    procedure SaveTanksCondition(aIsNew: Boolean; aName, aOldName: string; aList: TList; var ConditionID: Integer);
    {$ENDREGION}

    property RunState : E_ScenarioRunState read FRunState write SetRunState;
    property Listener : TListeners read FListener;

    property CurrentRunningScenario : Integer read FCurrentRunningScenario write SetRunningScenario;
    property CurrentRunningScenarioTime : TDateTime read FCurrentRunningScenarioTime write SetRunningScenarioTime;
    property CurrentRunningScenarioStart : TDateTime read FCurrentRunningScenarioStart write SetCurrentScenarioStart;
    property OnProgressStep : T_OnProgressStep read FOnProgressStep write SetOnProgressStep;
  end;

implementation

uses
  uERSystem, uGenerator, uSwitchboard, uMainEngine, uGearBox, uCPP, uTank,
  uControllerSystem, uElement, Forms, SysUtils;

{ TScenario }

procedure FreeList(aList: TList);
var
  i : Integer;
  aObj : TObject;
begin
  for i := aList.Count - 1 downto 0 do
  begin
    aObj := aList.Items[i];
    aObj.Free;
  end;

  aList.Free;
end;

function TScenario.cekValidateTankName(aIsNew: Boolean; aType, aName,
  aOldName: string): Boolean;
begin
  Result := FDatabase.cekValidateTankName(aIsNew, aType, aName, aOldName);
end;

function TScenario.cekValidateTankValue(aID: string; aValue : Double): boolean;
begin
  Result := FDatabase.cekValidateTankValue(aID, aValue);
end;

constructor TScenario.Create;
begin
  FDatabase := aDatabase;
  FList := TStringList.Create;
  FRunState := esrStop;
  FListener := TListeners.Create;

  FPMSCondList := TList.Create;
end;

function TScenario.DeleteFACondition(aID: Integer): Boolean;
begin
  Result := FDatabase.DeleteFACondition(aID);
end;

function TScenario.DeletePCSCondition(aID: Integer): Boolean;
begin
  Result := FDatabase.DeletePCSCondition(aID);
end;

function TScenario.DeleteTanksCondition(aID: Integer): Boolean;
begin
  Result := FDatabase.DeleteTanksCondition(aID);
end;

function TScenario.DeletePMSCondition(aID: Integer): Boolean;
begin
  Result := FDatabase.DeletePMSCondition(aID);
end;

function TScenario.deleteScenario(aID: Integer): Boolean;
begin
  Result := FDatabase.DeleteScenario(aID);
end;

destructor TScenario.Destroy;
begin
  FList.Free;
  FListener.Free;

  inherited;
end;

function TScenario.GetConditionID(aName: string): Integer;
begin
  Result := FDatabase.GetConditionID(aName);
end;

procedure TScenario.GetElementConditions(var aList: TStrings);
begin
  FDatabase.GetAllCondition('ELEMENT', aList);
end;

function TScenario.GetFACondID(aID, aIndex: Integer): Integer;
begin
  FDatabase.GetFACondID(aID, aIndex);
  Result := 1;
end;

function TScenario.GetTanksCondID(aID, aIndex: Integer): Integer;
begin
  Result := FDatabase.GetTanksCondID(aID, aIndex);
end;

procedure TScenario.GetTanksCondition(aID: Integer; var aList: TList);
begin
  FDatabase.GetTanksCondByID(aID, aList);
end;

procedure TScenario.GetTanksConditions(var aList: TStrings);
begin
  FDatabase.GetAllCondition('TANK', aList);
end;

procedure TScenario.GetFACondition(aID: Integer; var aList: TList);
begin
  FDatabase.GetFACondByID(aID, aList);
end;

procedure TScenario.GetFAConditions(var aList: TStrings);
begin
  FDatabase.GetAllCondition('FA', aList);
end;

function TScenario.getMaxTankValue(aElementID: string): Double;
begin
  Result := FDatabase.getMaxTankValue(aElementID);
end;

procedure TScenario.GetPCSCondition(aID: Integer; var aList: TList);
begin
  FDatabase.GetPCSCondByID(aID, aList);
end;

procedure TScenario.GetPCSConditions(var aList: TStrings);
begin
  FDatabase.GetAllCondition('PCS', aList);
end;

function TScenario.GetPMSCondID(aID, aIndex: Integer): Integer;
begin
  Result := FDatabase.GetPMSCondID(aID, aIndex);
end;

procedure TScenario.GetPMSCondition(aID: Integer; var aList: TList);
begin
  FDatabase.GetPMSCondByID(aID, aList);
end;

procedure TScenario.GetPMSConditions(var aList: TStrings);
begin
  FDatabase.GetAllCondition('PMS', aList);
end;

function TScenario.getScenario(aName: string): TScenario_Data;
begin
  Result := FDatabase.GetScenarioByName(aName);
end;

function TScenario.getScenario(aID: Integer): TScenario_Data;
begin
  Result := FDatabase.GetScenarioByID(aID);
end;

function TScenario.getScenarioConditions(aName: string): TStrings;
begin
  Result := FDatabase.GetScenarioConditions(aName);
end;

function TScenario.getScenarioDesc(aName: string): string;
begin
  Result :=  FDatabase.GetScenarioDesc(aName);
end;

procedure TScenario.getScenarios(var aList : TStrings) ;
begin
  FDatabase.GetAllScenario(aList);
end;

function TScenario.getSession(aSessionID: Integer): TSession_Data;
begin
  Result := nil;
end;

function TScenario.getSession(aSessionName: string): TSession_Data;
begin
  Result := FDatabase.GetSession(aSessionName);
end;

procedure TScenario.getSessions(var aList: TStrings);
begin
  FDatabase.GetAllSession(aList);
end;

function TScenario.insertScenario(aID : Integer; aName, aDesc: string;
  intArr : array of Integer): Integer;
begin
  Result := FDatabase.SaveScenario(aID, aName, aDesc, intArr);
end;

procedure TScenario.loadScenario(aSessionID: Integer);
var
  i, j, k : Integer;
  l : TList;
  data : TScenarioPMSCondition;
  dataPCS : TScenarioPCSCondition;
  tankData : TTanksCond_Data;
  elemtData : TElementCondition;
  gen : TGenerator;
  swt : TSwitchboard;
  pwr : TPower;
  main_engine : TMainEngine;
  gearbox : TGearBox;
  cpp : TCPP;
  tank : TTank;
  element : TElement;
  aStep : double;
  aDiv : Double;
  recScenCond : R_Common_ScenarioCondition_Command;
begin
//  FCurrentScenario := aName;

  FListener.TriggerEvents(Self, epScenarioLoad,
    'Session ' + IntToStr(FCurrentRunningScenario));
  FListener.TriggerEvents(Self, epScenarioLoad, 1); // start loading

//--- start loading scenario here
//  Application.ProcessMessages;

  // load PMS condition
  FDatabase.GetRS_PMSCondition(aSessionID,l);

  // 1st 50% step;

  if l.Count <= 0 then
  begin
    aDiv := 50;
    aStep := aDiv;

    if Assigned(FOnProgressStep) then
      FOnProgressStep(Round(aStep));
  end
  else
    aDiv := 50 / l.Count;

  aStep := aDiv;

  for i := 0 to l.Count - 1 do
  begin
    data := l.Items[i];

    if data.PMS_Type = 1 then
    begin
      gen := ERSystem.ERManager.EngineRoom.getPMSSystem.getGenerator(data.PMS_Name);

      if Assigned(gen) then
      begin
        gen.GeneratorMode := data.PMS_Mode;
        gen.EngineRun := setInttoBool(data.PMS_OnOff);
        gen.GeneratorSupplied := setInttoBool(data.PMS_GenSupplied);

        {dr pd ngerubah dbase sama PMS Editor mending diset disini aja}
        if data.PMS_GenState = 0  then
          gen.GeneratorState := 1
        else
          gen.GeneratorState := data.PMS_GenState;

        {untuk menghindari cb tertutup diawal permainan}
        if data.PMS_Mode = 3 then
          gen.CBClosed := False
        else
          gen.CBClosed := setInttoBool(data.PMS_CBClosed);

        gen.Preference := setInttoBool(data.PMS_Preference);
        gen.Busbar := setInttoBool(data.PMS_Busbar);
        gen.RunHourState := setInttoBool(data.PMS_RunHours);
        gen.EmergencyStop := setInttoBool(data.PMS_EmergencyStop);
        gen.NotStandby := setInttoBool(data.PMS_NotStandby);
        gen.CanBusFailure := setInttoBool(data.PMS_CanBusFailure);
        gen.MeasPowFailure := setInttoBool(data.PMS_MeasPowFailure);
        gen.DCPowFailure := setInttoBool(data.PMS_DCPowFailure);
        gen.EngineAlarm := setInttoBool(data.PMS_EngineAlarm);
        gen.ShutDown := setInttoBool(data.PMS_ShutDown);
        gen.FaultPageLed := setInttoBool(data.PMS_FaultPageLed);
        gen.FailureCBClosed := setInttoBool(data.PMS_FailureCBClosed);
        gen.Power := data.PMS_Power;
        gen.PowerState := data.PMS_Power_State;
        gen.Frequency := data.PMS_Frequency;
        gen.FrequencyState := data.PMS_Frequency_State;
        gen.SwitchFrequency := data.PMS_SwitchFrequency;
        gen.Current := data.PMS_Current;
        gen.Voltage := data.PMS_Voltage;
        gen.VoltageState := data.PMS_Voltage_State;
        gen.CosPhi := data.PMS_CosPhi;
        gen.U := data.PMS_U;
        gen.V := data.PMS_V;
        gen.W := data.PMS_W;
      end;
    end
    else if data.PMS_Type = 2 then
    begin
      swt := ERSystem.ERManager.EngineRoom.getPMSSystem.getSwitchboard(data.PMS_Name);

      if Assigned(swt) then
      begin
        swt.MSBIntrMode := data.PMS_SWB_MSBIntrMode;
        swt.ESBIntrMode := data.PMS_SWB_ESBIntrMode;
        swt.ShoreIntrMode := data.PMS_SWB_ShoreIntrMode;
        swt.MsbCBIntr := setInttoBool(data.PMS_SWB_MsbCBIntr);
        swt.EsbCBIntr := setInttoBool(data.PMS_SWB_EsbCBIntr);
        swt.MsbCBShore := setInttoBool(data.PMS_SWB_MsbCBShore);
        swt.EmergencyCon := setInttoBool(data.PMS_SWB_EmergencyCon);
        swt.TripReduct := setInttoBool(data.PMS_SWB_TripReduct);
      end;
    end
    else if data.PMS_Type = 3 then
    begin
      ERSystem.ERManager.EngineRoom.getPMSSystem.SetVariablePMS(data.PMS_FirstLoad = 1,
      data.PMS_StateRunFull, data.PMS_StateRunFwd, data.PMS_StateRunAft);
    end
    else
    begin
      pwr := ERSystem.ERManager.EngineRoom.getPMSSystem.GetPower(data.PMS_Name);

      if Assigned(pwr) then
      begin
        pwr.PowerMode := data.PMS_PowerMode;
        pwr.PowerConsmr := data.PMS_PowerConsmr;
      end;
    end;

    if Assigned(FOnProgressStep) then
      FOnProgressStep(Round(aStep));

    aStep := aStep + aDiv;
  end;

  FreeList(l);

  // end load PMS condition

  //load PCS condition
  FDatabase.GetRS_PCSCondition(aSessionID, l);

  if l.Count <= 0 then
  begin
    aDiv := 50;
    aStep := aDiv;

    if Assigned(FOnProgressStep) then
      FOnProgressStep(Round(aStep));
  end
  else
    aDiv := 50 / l.Count;

  aStep := aDiv;

  for i := 0 to l.Count - 1 do
  begin
    dataPCS := l.Items[i];

    //Load Scenario
    if dataPCS.PCS_Name = 'Remote Port' then
    begin
      if dataPCS.PCS_State = 0 then
        ERSystem.ERManager.EngineRoom.getPCSSystem.Remote(C_PCS_ME_PORTS,True)
      else if dataPCS.PCS_State = 1 then
        ERSystem.ERManager.EngineRoom.getPCSSystem.Remote(C_PCS_ME_PORTS,False);
    end;

    if dataPCS.PCS_Name = 'Remote Starboard' then
    begin
      if dataPCS.PCS_State = 0 then
        ERSystem.ERManager.EngineRoom.getPCSSystem.Remote(C_PCS_ME_STARBOARD,True)
      else if dataPCS.PCS_State = 1 then
        ERSystem.ERManager.EngineRoom.getPCSSystem.Remote(C_PCS_ME_STARBOARD,False);
    end;

    if dataPCS.PCS_Name = 'Gear Box Port Engaged' then
    begin
      if dataPCS.PCS_State = 0 then
        ERSystem.ERManager.EngineRoom.getPCSSystem.Clutch(C_PCS_GB_PORTS,True);
    end;

    if dataPCS.PCS_Name = 'Gear Box Starboard Engaged' then
    begin
      if dataPCS.PCS_State = 0 then
        ERSystem.ERManager.EngineRoom.getPCSSystem.Clutch(C_PCS_GB_STARBOARD, True);
    end;

    if dataPCS.PCS_Name = 'Mode Engine Port' then
    begin
      main_engine := ERSystem.ERManager.EngineRoom.getPCSSystem.getMainEngine(C_PCS_ME_PORTS);

      if dataPCS.PCS_State = 0 then
      begin
//        main_engine.ManouveringMode := True;
//        main_engine.TransitMode := False;
//        ERSystem.ERManager.EngineRoom.getPCSSystem.ModeManoeuvring(main_engine,dataPCS.Value);
      end
      else if dataPCS.PCS_State = 1 then
      begin
//        main_engine.ManouveringMode := False;
//        main_engine.TransitMode := True;
//        ERSystem.ERManager.EngineRoom.getPCSSystem.ModeTransit(main_engine,dataPCS.Value);
      end;
    end;

    if dataPCS.PCS_Name = 'Mode Engine Starboard' then
    begin
      main_engine := ERSystem.ERManager.EngineRoom.getPCSSystem.getMainEngine(C_PCS_ME_STARBOARD);

      if dataPCS.PCS_State = 0 then
      begin
//        main_engine.ManouveringMode := True;
//        main_engine.TransitMode := False;
//        ERSystem.ERManager.EngineRoom.getPCSSystem.ModeManoeuvring(main_engine,dataPCS.Value);
      end
      else if dataPCS.PCS_State = 1 then
      begin
//        main_engine.ManouveringMode := False;
//        main_engine.TransitMode := True;
//        ERSystem.ERManager.EngineRoom.getPCSSystem.ModeTransit(main_engine,dataPCS.Value);
      end;
    end;

    if dataPCS.PCS_Name = 'Control' then
    begin
      if dataPCS.PCS_State = 0 then
      begin
        ERSystem.ERManager.EngineRoom.getPCSSystem.RemoteToMCR(C_PCS_ME_PORTS, False);
        ERSystem.ERManager.EngineRoom.getPCSSystem.RemoteToMCR(C_PCS_ME_STARBOARD, False);
      end
      else if dataPCS.PCS_State = 1 then
      begin
        ERSystem.ERManager.EngineRoom.getPCSSystem.RemoteToMCR(C_PCS_ME_PORTS, True);
        ERSystem.ERManager.EngineRoom.getPCSSystem.RemoteToMCR(C_PCS_ME_STARBOARD, True);
      end;
    end;

    if dataPCS.PCS_Name = 'Main Engine Port Status' then
    begin
      main_engine := ERSystem.ERManager.EngineRoom.getPCSSystem.getMainEngine(C_PCS_ME_PORTS);
      gearbox := ERSystem.ERManager.EngineRoom.getPCSSystem.getGearBox(C_PCS_GB_PORTS);
      cpp := ERSystem.ERManager.EngineRoom.getPCSSystem.getCPP(C_PCS_CPP_PORTS);

      if dataPCS.PCS_State = 0 then
      begin
        main_engine.EngineRun := False;
        gearbox.ReadyForUse := False;
        cpp.ReadyForUse := False;
      end
      else if dataPCS.PCS_State = 1 then
      begin
        main_engine.EngineRun := True;
        gearbox.ReadyForUse := True;
        cpp.ReadyForUse := True;
        ERSystem.ERManager.EngineRoom.getPCSSystem.RunningStart(C_PCS_ME_PORTS);
      end;
    end;

    if dataPCS.PCS_Name = 'Main Engine Starboard Status' then
    begin
      main_engine := ERSystem.ERManager.EngineRoom.getPCSSystem.getMainEngine(C_PCS_ME_STARBOARD);
      gearbox := ERSystem.ERManager.EngineRoom.getPCSSystem.getGearBox(C_PCS_GB_STARBOARD);
      cpp := ERSystem.ERManager.EngineRoom.getPCSSystem.getCPP(C_PCS_CPP_STARBOARD);

      if dataPCS.PCS_State = 0 then
      begin
        main_engine.EngineRun := False;
        gearbox.ReadyForUse := False;
        cpp.ReadyForUse := False;
      end
      else if dataPCS.PCS_State = 1 then
      begin
        main_engine.EngineRun := True;
        gearbox.ReadyForUse := True;
        cpp.ReadyForUse := True;
        ERSystem.ERManager.EngineRoom.getPCSSystem.RunningStart(C_PCS_ME_STARBOARD);
      end;
    end;
    // End Load Scenario

    // Load Session
    if (dataPCS.PCS_Name = 'Main Engine PS') or (dataPCS.PCS_Name = 'Main Engine SB') then
    begin
      main_engine := ERSystem.ERManager.EngineRoom.getPCSSystem.getMainEngine(dataPCS.PCS_Name);

      if Assigned(main_engine) then
      begin
        if dataPCS.PCS_ME_Control = 0 then
          ERSystem.ERManager.EngineRoom.getPCSSystem.RemoteToMCR(dataPCS.PCS_Name,True)
        else
          ERSystem.ERManager.EngineRoom.getPCSSystem.RemoteToMCR(dataPCS.PCS_Name,False);

        if dataPCS.PCS_ME_EngineRun = 1 then
          main_engine.EngineRun := True
        else
          main_engine.EngineRun := False;

        if dataPCS.PCS_ME_ReadyForUse = 1 then
          main_engine.ReadyForUse := True
        else
          main_engine.ReadyForUse := False;

        case dataPCS.PCS_ME_Mode of
          0 :
          begin
            ERSystem.ERManager.EngineRoom.getPCSSystem.ManouveringMode := False;
            ERSystem.ERManager.EngineRoom.getPCSSystem.TransitMode := False;
          end;
          1 : ERSystem.ERManager.EngineRoom.getPCSSystem.ManouveringMode := True;
          2 : ERSystem.ERManager.EngineRoom.getPCSSystem.TransitMode := True;
        end;

        main_engine.SetPointSpeed := dataPCS.PCS_ME_SetpointSpeed;

        if dataPCS.PCS_ME_RemoteAuto = 1 then
          main_engine.RemoteAuto := True
        else
          main_engine.RemoteAuto := False;

        if dataPCS.PCS_ME_RemoteManual = 1 then
          main_engine.RemoteManual := True
        else
          main_engine.RemoteManual := False;

        main_engine.LeverControl := dataPCS.PCS_ME_LeverControl;

        if dataPCS.PCS_ME_Alarm = 1 then
          main_engine.PCSAlarms := True
        else
          main_engine.PCSAlarms := False;

        if dataPCS.PCS_ME_Failure = 1 then
          main_engine.Failure := True
        else
          main_engine.Failure := False;

        if dataPCS.PCS_LCP_Heater = 1 then
          main_engine.Heater := True
        else
          main_engine.Heater := False;

        if dataPCS.PCS_LCP_Pump = 1 then
          main_engine.PrimLOPump := True
        else
          main_engine.PrimLOPump := False;

        for k := 0 to 11 do
        begin
          if dataPCS.PCS_PC_StartingInterlocks[k+1] = '1' then
            main_engine.PC_StartingInterlocks[k] := True
          else
            main_engine.PC_StartingInterlocks[k] := False;
        end;

        for k := 0 to 16 do
        begin
          if dataPCS.PCS_PC_Alarms[k+1] = '1' then
            main_engine.PC_Alarms[k] := True
          else
            main_engine.PC_Alarms[k] := False;
        end;

        for k := 0 to 11 do
        begin
          if dataPCS.PCS_PC_SafetiesStop[k+1] = '1' then
            main_engine.PC_SafetiesStop[k] := True
          else
            main_engine.PC_SafetiesStop[k] := False;
        end;
      end;
    end;

    if (dataPCS.PCS_Name = 'GearBox PS') or (dataPCS.PCS_Name = 'GearBox SB') then
    begin
      gearbox := ERSystem.ERManager.EngineRoom.getPCSSystem.getGearBox(dataPCS.PCS_Name);

      if Assigned(gearbox) then
      begin
        if dataPCS.PCS_GB_ClutchAllowed = 1 then
          gearbox.ClutchAllowed := True
        else
          gearbox.ClutchAllowed := False;

        if dataPCS.PCS_GB_ClutchEngaged = 1 then
        begin
          gearbox.ClutchEngagedDelay := True;
          gearbox.ClutchEngaged := True
        end
        else
        begin
          gearbox.ClutchEngagedDelay := False;
          gearbox.ClutchEngaged := False;
        end;

        if dataPCS.PCS_GB_ReadyForUse = 1 then
          gearbox.ReadyForUse := True
        else
          gearbox.ReadyForUse := False;

        if dataPCS.PCS_GB_RemoteAuto = 1 then
          gearbox.RemoteAuto := True
        else
          gearbox.RemoteAuto := False;

        if dataPCS.PCS_GB_RemoteManual = 1 then
          gearbox.RemoteManual := True
        else
          gearbox.RemoteManual := False;

        if dataPCS.PCS_GB_Failure = 1 then
          gearbox.Failure := True
        else
          gearbox.Failure := False;

        if dataPCS.PCS_GB_ShaftLocked = 1 then
          gearbox.ShaftLocked := True
        else
          gearbox.ShaftLocked := False;

        if dataPCS.PCS_GB_ShaftPowerLimited = 1 then
          gearbox.ShaftPowerLimited := True
        else
          gearbox.ShaftPowerLimited := False;

        for k := 0 to 3 do
        begin
          if dataPCS.PCS_PC_ClutchInterlocks[k+1] = '1' then
            gearbox.PC_ClutchInterlocks[k] := True
          else
            gearbox.PC_ClutchInterlocks[k] := False;
        end;

      end;
    end;

    if (dataPCS.PCS_Name = 'CPP PS') or (dataPCS.PCS_Name = 'CPP SB')then
    begin
      cpp := ERSystem.ERManager.EngineRoom.getPCSSystem.getCPP(dataPCS.PCS_Name);

      if Assigned(cpp) then
      begin
        if dataPCS.PCS_CPP_ReadyForUse = 1 then
          cpp.ReadyForUse := True
        else
          cpp.ReadyForUse := False;

        cpp.SetpointPitch := dataPCS.PCS_CPP_SetpointPitch;

        if dataPCS.PCS_CPP_RemoteAuto = 1 then
          cpp.Remote := True
        else
          cpp.RemoteAuto := False;

        if dataPCS.PCS_CPP_RemoteManual = 1 then
          cpp.Remote := False
        else
          cpp.Remote := True;

        if dataPCS.PCS_CPP_Failure = 1 then
          cpp.Failure := True
        else
          cpp.Failure := False;

        if dataPCS.PCS_CPP_PumpAuto = 1 then
          cpp.HydraulicPumpAuto3 := True
        else
          cpp.HydraulicPumpAuto3 := False;

        for k := 1 to 2 do
        begin
          if dataPCS.PCS_CPP_PumpStandby[k] = '1' then
            cpp.PumpStandby[k] := True
          else
            cpp.PumpStandby[k] := False;
        end;

        for k := 1 to 3 do
        begin
          if dataPCS.PCS_CPP_PumpStart[k] = '1' then
            cpp.PumpStart[k] := True
          else
            cpp.PumpStart[k] := False;
        end;

        for k := 0 to 2 do
        begin
          if dataPCS.PCS_PC_CPPFailure[k+1] = '1' then
            cpp.PC_Failure[k] := True
          else
            cpp.PC_Failure[k] := False;
        end;
      end;
    end;
    // End Load Session

    if Assigned(FOnProgressStep) then
      FOnProgressStep(Round(aStep));

    aStep := aStep + aDiv;
  end;

  FreeList(l);
  //End load PCS Condition

  //load Tank condition
  FDatabase.GetRS_TanksCondition(aSessionID, l);

  if l.Count <= 0 then
  begin
    aDiv := 50;
    aStep := aDiv;

    if Assigned(FOnProgressStep) then
      FOnProgressStep(Round(aStep));
  end
  else
    aDiv := 50 / l.Count;

  aStep := aDiv;

  for i := 0 to l.Count - 1 do
  begin
    tankData := TTanksCond_Data(l.Items[i]);

    for j := 0 to Length(C_TankElementID) - 1 do
    begin
      if tankData.Tanks_ElementID = C_TankElementID[j] then
      begin
        ERSystem.ERManager.EngineRoom.getFuelOilSystem.GetTank(C_TankIdentifier[j]).Content := tankData.Tanks_Value;
        Break;
      end;
    end;

    if Assigned(FOnProgressStep) then
      FOnProgressStep(Round(aStep));

    aStep := aStep + aDiv;
  end;

  FreeList(l);
  //end load Tank condition

  // load element condition
  FDatabase.GetRS_ElementCondition(aSessionID, l);

  if l.Count <= 0 then
  begin
    aDiv := 100;

    if Assigned(FOnProgressStep) then
      FOnProgressStep(Round(aDiv));
  end
  else
    aDiv := 50 / l.Count;

  for i := 0 to l.Count - 1 do
  begin
    elemtData := l.Items[i];

    element := CtrlSystem.Controller.getElement(elemtData.Element_ID);
    CtrlSystem.Controller.setElementCondition(element, elemtData);
    Sleep(50);

    aStep := aStep + aDiv;

    if Assigned(FOnProgressStep) then
      FOnProgressStep(Round(aStep));
  end;

  if Assigned(FOnProgressStep) then
    FOnProgressStep(100);

  FreeList(l);

  // end load element condition

  {Ryu : untuk FA dan Tank condition akan diload di mimic berdasar running scenario}

  FOnProgressStep := nil;
  FListener.TriggerEvents(Self, epScenarioLoad, 0);  // finish loading
end;

function TScenario.PrepareRunningScenario(aName: string;
  var aDateTimeStart: TDateTime): Boolean;
var
  ScenType : Integer;
  ScenID : Integer;
begin
  Result := False;
  ScenID := FDatabase.GetScenarioIDByName(aName, ScenType);

  if ScenID > 0 then
  begin
    CurrentRunningScenario := FDatabase.PrepareRunningScenario(ScenID,
      aDateTimeStart);
    CurrentRunningScenarioTime := aDateTimeStart;
    CurrentRunningScenarioStart := aDateTimeStart;

    Result := True;
  end;
end;

procedure TScenario.SaveElementCondition(aName: string; aList: TList;
  var ConditionID: Integer);
begin
  FDatabase.SaveElementCondition(True, aName, aList, ConditionID);
end;

procedure TScenario.SaveFACondition(aIsNew: Boolean; aName: string;
  aList: TList; var ConditionID: Integer);
begin
  FDatabase.SaveFACondition(aIsNew, aName, aList, ConditionID);
end;

procedure TScenario.SavePCSCondition(aIsNew: Boolean; aName: string;
  var aList : TList);
begin
  FDatabase.SavePCSCondition(aIsNew, aName,  aList);
end;

procedure TScenario.SavePMSCondition(aIsNew: Boolean; aName: string;
  aList: TList; var ConditionID : Integer);
begin
  FDatabase.SavePMSCondition(aIsNew, aName, aList, ConditionID);
end;

procedure TScenario.SaveRS_PCSCondition(aSessionID: Integer);
var
  me : TMainEngine;
  gb : TGearBox;
  cpp : TCPP;
  i, j : Integer;
  tempstring : string;
  pcsData : TScenarioPCSCondition;
  pcsList : TList;
begin
  pcsList := TList.Create;

  for i := 0 to Length(C_MAINENGINE_ID) - 1 do
  begin
    me := ERSystem.ERManager.EngineRoom.getPCSSystem.getMainEngine(C_MAINENGINE_ID[i]);

    if Assigned(me) then
    begin
      pcsData := TScenarioPCSCondition.Create;

      pcsData.PCS_Name := C_MAINENGINE_ID[i];
      pcsData.PCS_ME_Control := Byte(me.LocalControl);
      pcsData.PCS_ME_EngineRun := Byte(me.EngineRun);
      pcsData.PCS_ME_ReadyForUse := Byte(me.ReadyForUse);
      pcsData.PCS_ME_SetpointSpeed := me.SetPointSpeed;
      pcsData.PCS_ME_RemoteAuto := Byte(me.RemoteAuto);
      pcsData.PCS_ME_RemoteManual := Byte(me.RemoteManual);
      pcsData.PCS_ME_LeverControl := me.LeverControl;
      pcsData.PCS_ME_Alarm := Byte(me.PCSAlarms);
      pcsData.PCS_ME_Failure := Byte(me.Failure);

      if ERSystem.ERManager.EngineRoom.getPCSSystem.ManouveringMode then
        pcsData.PCS_ME_Mode := 1
      else if ERSystem.ERManager.EngineRoom.getPCSSystem.TransitMode then
        pcsData.PCS_ME_Mode := 2
      else
        pcsData.PCS_ME_Mode := 0;


      for j := 0 to 11 do
      begin
        tempstring := IntToStr(Byte(me.PC_StartingInterlocks[j]));
        pcsData.PCS_PC_StartingInterlocks := pcsData.PCS_PC_StartingInterlocks + tempstring;
      end;

      for j := 0 to 16 do
      begin
        tempstring := IntToStr(Byte(me.PC_Alarms[j]));
        pcsData.PCS_PC_Alarms := pcsData.PCS_PC_Alarms + tempstring;
      end;

      for j := 0 to 11 do
      begin
        tempstring := IntToStr(Byte(me.PC_SafetiesStop[j]));
        pcsData.PCS_PC_SafetiesStop := pcsData.PCS_PC_SafetiesStop + tempstring;
      end;

      pcsList.Add(pcsData);
    end;
  end;

  for i := 0 to Length(C_GEARBOX_ID) - 1 do
  begin
    gb := ERSystem.ERManager.EngineRoom.getPCSSystem.getGearBox(C_GEARBOX_ID[i]);

    if Assigned(gb) then
    begin
      pcsData := TScenarioPCSCondition.Create;

      pcsData.PCS_Name := C_GEARBOX_ID[i];
      pcsData.PCS_GB_ClutchAllowed := Byte(gb.ClutchAllowed);
      pcsData.PCS_GB_ClutchEngaged := Byte(gb.ClutchEngaged);
      pcsData.PCS_GB_ReadyForUse := Byte(gb.ReadyForUse);
      pcsData.PCS_GB_RemoteAuto := Byte(gb.RemoteAuto);
      pcsData.PCS_GB_RemoteManual := Byte(gb.RemoteManual);
      pcsData.PCS_GB_Failure := Byte(gb.Failure);
      pcsData.PCS_GB_ShaftLocked := Byte(gb.ShaftLocked);
      pcsData.PCS_GB_ShaftPowerLimited := Byte(gb.ShaftPowerLimited);

      for j := 0 to 3 do
      begin
        tempstring := IntToStr(Byte(gb.PC_ClutchInterlocks[j]));
        pcsData.PCS_PC_ClutchInterlocks := pcsData.PCS_PC_ClutchInterlocks + tempstring;
      end;

      pcsList.Add(pcsData);
    end;
  end;

  for i := 0 to Length(C_CPP_ID) - 1 do
  begin
    cpp := ERSystem.ERManager.EngineRoom.getPCSSystem.getCPP(C_CPP_ID[i]);

    if Assigned(cpp) then
    begin
      pcsData := TScenarioPCSCondition.Create;

      pcsData.PCS_Name := C_CPP_ID[i];
      pcsData.PCS_CPP_ReadyForUse := Byte(cpp.ReadyForUse);
      pcsData.PCS_CPP_SetpointPitch := cpp.SetpointPitch;
      pcsData.PCS_CPP_RemoteAuto := Byte(cpp.Remote);
      pcsData.PCS_CPP_RemoteManual := Byte(not cpp.Remote);
      pcsData.PCS_CPP_Failure := Byte(cpp.Failure);
      pcsData.PCS_CPP_PumpAuto := Byte(cpp.HydraulicPumpAuto3);

      for j := 0 to 1 do
      begin
        tempstring := IntToStr(Byte(cpp.PumpStandby[j]));
        pcsData.PCS_CPP_PumpStandby := pcsData.PCS_CPP_PumpStandby + tempstring;
      end;

      for j := 0 to 2 do
      begin
        tempstring := IntToStr(Byte(cpp.PumpStart[j]));
        pcsData.PCS_CPP_PumpStart := pcsData.PCS_CPP_PumpStart + tempstring;
      end;

      for j := 0 to 2 do
      begin
        tempstring := IntToStr(Byte(cpp.PC_Failure[j]));
        pcsData.PCS_PC_CPPFailure := pcsData.PCS_PC_CPPFailure + tempstring;
      end;

      pcsList.Add(pcsData);
    end;
  end;

  FDatabase.SaveRS_PCSCondition(pcsList, aSessionID);
  FreeList(pcsList);
end;

procedure TScenario.SaveRS_PMSCondition(aSessionID: Integer);
var
  gen : TGenerator;
  swt : TSwitchboard;
  pwr : TPower;
  i : Integer;
  pmsData : TScenarioPMSCondition;
  PMSList : TList;
  aFirstLoad : Boolean;
  aStateRunFull, aStateRunFwd, aStateRunAft : Integer;
begin
  PMSList := TList.Create;

  for i := 0 to Length(C_GENERATOR_ID) - 1 do
  begin
    gen := ERSystem.ERManager.EngineRoom.getPMSSystem.getGenerator(C_GENERATOR_ID[i]);

    if Assigned(gen) then
    begin
      pmsData := TScenarioPMSCondition.Create;

      {Tipe PMS : 1.Generator, 2.Switchboard, 3.Power}
      pmsData.PMS_Type := 1;

      {Entity Element}
      pmsData.PMS_Name := C_GENERATOR_ID[i];                            {-----> Nama Genarator}
      pmsData.PMS_Mode := gen.GeneratorMode;                       {-----> Mode Genarator : 1:Man; 2:SemiMan; 3:Aut; 4:SemiAut}
      pmsData.PMS_OnOff := setBooltoInt(gen.EngineRun);
      pmsData.PMS_GenSupplied := setBooltoInt(gen.GeneratorSupplied);
      pmsData.PMS_GenState := gen.GeneratorState;
      pmsData.PMS_CBClosed := setBooltoInt(gen.CBClosed);
      pmsData.PMS_Preference := setBooltoInt(gen.Preference);
      pmsData.PMS_Busbar := setBooltoInt(gen.Busbar);
      pmsData.PMS_RunHours := setBooltoInt(gen.RunHourState);

      {Failure Element}
      pmsData.PMS_EmergencyStop := setBooltoInt(gen.EmergencyStop);
      pmsData.PMS_NotStandby := setBooltoInt(gen.NotStandby);
      pmsData.PMS_CanBusFailure := setBooltoInt(gen.CanBusFailure);
      pmsData.PMS_MeasPowFailure := setBooltoInt(gen.MeasPowFailure);
      pmsData.PMS_DCPowFailure := setBooltoInt(gen.DCPowFailure);
      pmsData.PMS_EngineAlarm := setBooltoInt(gen.EngineAlarm);
      pmsData.PMS_ShutDown := setBooltoInt(gen.ShutDown);
      pmsData.PMS_FaultPageLed := setBooltoInt(gen.FaultPageLed);
      pmsData.PMS_FailureCBClosed := setBooltoInt(gen.FailureCBClosed);

      {Value Element}
      pmsData.PMS_Power := gen.Power;
      pmsData.PMS_Power_State := gen.PowerState;
      pmsData.PMS_Frequency := gen.Frequency;
      pmsData.PMS_Frequency_State := gen.FrequencyState;
      pmsData.PMS_SwitchFrequency := gen.SwitchFrequency;
      pmsData.PMS_Current := gen.Current;
      pmsData.PMS_Voltage := gen.Voltage;
      pmsData.PMS_Voltage_State := gen.VoltageState;
      pmsData.PMS_CosPhi := gen.CosPhi;
      pmsData.PMS_U := gen.U;
      pmsData.PMS_V := gen.V;
      pmsData.PMS_W := gen.W;

      PMSList.Add(pmsData);
    end;
  end;

  for i := 0 to Length(C_SWITCHBOARD_ID) - 1 do
  begin
    swt := ERSystem.ERManager.EngineRoom.getPMSSystem.getSwitchboard(C_SWITCHBOARD_ID[i]);

    if Assigned(swt) then
    begin
      pmsData := TScenarioPMSCondition.Create;

      pmsData.PMS_Type := 2;

      {Entity Element}
      pmsData.PMS_Name := C_SWITCHBOARD_ID[i];
      pmsData.PMS_SWB_MSBIntrMode := swt.MSBIntrMode;               {-----> 1:Man; 2:Off; 3:Aut}
      pmsData.PMS_SWB_ESBIntrMode := swt.ESBIntrMode;               {-----> 1:Aft; 2:Off; 3:Fwd; 4:Dbl}
      pmsData.PMS_SWB_ShoreIntrMode := swt.ShoreIntrMode;           {-----> 1:Man; 2:Off; 3:Aut}
      pmsData.PMS_SWB_MsbCBIntr := setBooltoInt(swt.MsbCBIntr);
      pmsData.PMS_SWB_EsbCBIntr := setBooltoInt(swt.EsbCBIntr);
      pmsData.PMS_SWB_MsbCBShore := setBooltoInt(swt.MsbCBShore);
      pmsData.PMS_SWB_MsbCBNavNaut := setBooltoInt(swt.MsbCBNavNaut);
      pmsData.PMS_SWB_Busbar := setBooltoInt(swt.Busbar);
      pmsData.PMS_SWB_TripReduct := setBooltoInt(swt.TripReduct);
      pmsData.PMS_SWB_EmergencyCon := setBooltoInt(swt.EmergencyCon);
      pmsData.PMS_SWB_Frequency := swt.Frequency;
      pmsData.PMS_SWB_Voltage := swt.Voltage;
      pmsData.PMS_SWB_Power := swt.Power;
      pmsData.PMS_SWB_Trafo230Volt := swt.Trafo230Volt;
      pmsData.PMS_SWB_Trafo115Volt := swt.Trafo115Volt;

      PMSList.Add(pmsData);
    end;
  end;

  for i := 0 to Length(C_POWER_ID) - 1 do
  begin
    pwr := ERSystem.ERManager.EngineRoom.getPMSSystem.GetPower(C_POWER_ID[i]);

    if Assigned(pwr) then
    begin
      pmsData := TScenarioPMSCondition.Create;

      pmsData.PMS_Type := 4;

      {Entity Element}
      pmsData.PMS_Name := C_POWER_ID[i];
      pmsData.PMS_PowerMode := pwr.PowerMode;
      pmsData.PMS_PowerConsmr := pwr.PowerConsmr;

      PMSList.Add(pmsData);
    end;
  end;

  {Variable}
  for i := 0 to 0 do
  begin
    ERSystem.ERManager.EngineRoom.getPMSSystem.GetVariablePMS(aStateRunFull, aStateRunFwd, aStateRunAft);

    pmsData := TScenarioPMSCondition.Create;

    pmsData.PMS_Type := 3;

    pmsData.PMS_Name := 'Variable';
    pmsData.PMS_FirstLoad := 1;
    pmsData.PMS_StateRunFull := aStateRunFull;
    pmsData.PMS_StateRunFwd := aStateRunFwd;
    pmsData.PMS_StateRunAft := aStateRunAft;

    PMSList.Add(pmsData);
  end;

  FDatabase.SaveRS_PMSCondition(PMSList, aSessionID);
  FreeList(PMSList);
end;

procedure TScenario.SaveTanksCondition(aIsNew: Boolean; aName, aOldName: string;
  aList: TList; var ConditionID: Integer);
begin
  FDatabase.SaveTanksCondition(aIsNew, aName, aOldName, aList, ConditionID);
end;

function TScenario.setBooltoInt(valbool: Boolean): Integer;
begin
  if valbool then
    Result := 1
  else
    Result := 0;
end;

procedure TScenario.SetCurrentScenarioStart(const Value: TDateTime);
begin
  FCurrentRunningScenarioStart := Value;
end;

function TScenario.setInttoBool(valint: Integer): Boolean;
begin
  if valint = 1 then
    Result := True
  else
    Result := False;
end;

procedure TScenario.SetOnProgressStep(const Value: T_OnProgressStep);
begin
  FOnProgressStep := Value;
end;

procedure TScenario.SetRunningScenario(const Value: Integer);
begin
  FCurrentRunningScenario := Value;
  // tell listeners to apply new scenarios
  Listener.TriggerEvents(Self, epScenarioRunScenarioChange,
    FCurrentRunningScenario);
end;

procedure TScenario.SetRunningScenarioTime(const Value: TDateTime);
begin
  FCurrentRunningScenarioTime := Value;
  Listener.TriggerEvents(Self, epScenarioRunningTime, Double(Value));
end;

procedure TScenario.SetRunState(const Value: E_ScenarioRunState);
begin
  if (FRunState = Value) or (FCurrentRunningScenario = 0) then
    Exit;

  FRunState := Value;
  Listener.TriggerEvents(Self, epScenarioRunState, Byte(Value));
end;

end.
