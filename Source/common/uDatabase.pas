unit uDatabase;

interface

uses
  Classes, DB, Graphics, StrUtils, SysUtils, ZConnection, ZDataset,
  uBaseComponent, uDataType, uDBSupportClasses, uElementTables, uIPMS_Data,
  uListener, uTrendDataType;

type

  TIPMSDatabase = class
  private
    FConnection : TZConnection;
    FListeners : TListeners;
    FOnExceptionMessage : TGetStrProc;
    procedure SetOnExceptionMessage(const Value: TGetStrProc);
  public
    constructor Create;
    destructor Destroy; override;

    function ConnectDB: Boolean;

    procedure PopulateController;
    procedure PopulateElements(CtrlID: string);
    function PopulateDefaultElementParameter: TList;
    procedure PopulateLoggedElement(var elementTable: TElementTables);
    procedure getValueParameter(const aElementID: string; var aList: Tlist); // instructor
    procedure getAllElementIDs(var list: TStrings);
    procedure getFieldsTrend(var list: TList);
    procedure getValueLogs(TableName, FieldName: string; SessionID: Integer;
      alist: TList);
    procedure getRS_Parameters(aSession: Integer; var list: Tlist);
    procedure getRS_CommandHistory(aSession: Integer; var list: Tlist);
    function getElementTableName(ElementID: string): string;

    function GetElement(ElementID: string): TElementData;
    function GetCIP_INFO(aElementType: string): TCIPInfo;
    procedure GetAll_IPMSLog_Data(aList: TList);
    function GetCAPData(aElementID: string): TCAP_Data;
    procedure GetAvailableLogTimeStamp(aTimeType: string; aAvailList: TStrings);

    { ACS Control }
    procedure GetAllLocation(var locationList: TList);
    procedure GetAllAlarm(var alarmMsgList: TList);
    procedure GetAllFault(var faultMsgList: TList);

    function GetLocationDetail(aLocDetail: string): TACSData;
    function GetLocationByRoomID(aLocByRoom : string): TACSData;
    function GetAlarmMsgGRM(aAlarmID : Byte): TACSData;
    function GetFaultMsgGRM(aFaultID : Byte): TACSData;
    function GetAlarmComment(alarmMsg: string): TACSData;
    function GetFaultComment(faultMsg: string): TACSData;
    { end }

    { scenario }
    procedure GetAllScenario(var aScenarios: TStrings);
    procedure GetAllSession(var aScenarios: TStrings);
    function GetSession(sessionName: string): TSession_Data; overload;
    function GetSession(sessionID: Integer): TSession_Data; overload;
    procedure DeleteSession(isAll: Boolean; sessionID: Integer = 0);
    procedure SnapshotScenario(newName: string; sessionID: Integer);
    function SaveScenario(aID: Integer; aName, aDescription: string;
      intArr: array of Integer): Integer;
    function SaveConditionScenario(aScenarioID: Integer): Integer;
    function DeleteScenario(aID: Integer): Boolean;
    function GetScenarioByName(aName: string): TScenario_Data;
    function GetScenarioByID(aID: Integer): TScenario_Data;
    function GetScenarioDesc(aName: string): string;
    function GetScenarioConditions(aName: string;
      aType: string = 'ALL'): TStrings;
    function GetScenarioIDByName(aName: string;
      out aScenarioType: Integer): Integer;
    function GetConditions(aName: string; aType: string = 'ALL'): TStrings;
    procedure GetPMSCondition(aName: string; var l: TList); // list of TScenarioPMSCondition
    procedure GetRS_PMSCondition(aSessionID: Integer; var l: TList); // list of TScenarioPMSCondition
    procedure GetPCSCondition(aName: string; var l: TList); //list of pcs condition
    procedure GetRS_PCSCondition(aSessionID: Integer; var l: TList); //list of pcs condition
    procedure GetElementCondition(aName: string; var l: TList); // list of TElementCondition
    procedure GetRS_ElementCondition(aSession: Integer; var l: TList); // list of TElementCondition

    function GetFreeConditionID: Integer;
    function GetFreeConditionScenarioID: Integer;
    function GetFreePMSCondID: Integer;
    function GetConditionID(aName: string): Integer;
    procedure GetPMSCondByID(aID: Integer; var aList: TList);
    function SavePMSCondition(aIsNew: Boolean; aName: string; aList: TList;
      var ConditionID: Integer): Boolean;
    procedure SaveRS_PMSCondition(aList: TList; aSessionID: Integer);
    function GetPMSCondID(aID, aIndex: Integer): Integer;
    function SaveElementCondition(aIsNew: Boolean; aName: string; aList: TList;
      var ConditionID: Integer): Boolean;
    procedure GetAllCondition(aType: string; var aPMSCond: TStrings); overload;
    procedure GetAllCondition(var aList: TList); overload;
    function GetConditionInfo(aID: Integer): string;
    function DeletePMSCondition(aID: Integer): Boolean;
//    procedure DeleteCondition(a

    function DeletePCSCondition(aID: Integer): Boolean;
    function GetFreePCSCondID: Integer;
    procedure GetPCSCondByID(aID: Integer; var aList: TList);
    function SavePCSCondition(aIsNew: Boolean; aName: string;
      var aList: TList): Boolean;
    procedure SaveRS_PCSCondition(aList: TList; aSessionID: Integer);

    function DeleteFACondition(aID: Integer): Boolean;
    function GetFACondID(aID, aIndex: Integer): Integer;
    procedure GetFACondByID(aID: Integer; var aList: TList);
    procedure GetFACondition(aScenarioName: string; var aList: TList);
    procedure GetRS_FACondition(aSessionID: Integer; var aList: TList);
    function GetFreeFACondID: Integer;
    function SaveFACondition(aIsNew: Boolean; aName: string; aList: TList;
      var ConditionID: Integer): Boolean;
    procedure SaveRS_FACondition(aSessionID: Integer; aList: TList);

    function SaveTanksCondition(aIsNew: Boolean; aName, aOldName: string;
      aList: TList; var ConditionID: Integer): Boolean;
    function GetFreeTanksCondID: Integer;
    function GetTanksCondID(aID, aIndex: Integer): Integer;
    function DeleteTanksCondition(aID: Integer): Boolean;
    function cekValidateTankValue(aID: string; aValue: Double): Boolean;
    function cekValidateTankName(aIsNew: Boolean; aType, aName,
      aOldName: string): Boolean;
    function getMaxTankValue(aElementID: string): Double;
    function getMaxLengthTankValue(aElementID: string): Double;
    procedure GetTanksCondByID(aID: Integer; var aList: TList);
    procedure GetTanksCondition(aScenarioName: string; var aList: TList);
    procedure GetRS_TanksCondition(aSessionID: Integer; var aList: TList);

    procedure UpdateStoppedTimeRS(aTime: TDateTime; aRSID: Integer);
    function PrepareRunningScenario(aScenarioID: Integer;
      aDateTimeStart: TDateTime): Integer;
    function SaveMimics(FPairedList: TComponentElement; FTableName: string;
      FScenarioID: Integer): Boolean;
    function LoadMimics(FPairedList: TComponentElement; FTableName: string;
      FScenarioID: Integer): Boolean;
    function SaveElements(elementList: TList; aScenarioID: Integer;
      asRunningScenario: Boolean = True): Boolean;
    { end }

    { logger }
    function Logger(SessionID: Integer; LogTime: TDateTime; Identifier: string;
      Value, Category: string): Boolean;

    { alarm history }
    procedure GetMaxSeqNumber(var aSeqNumber: Integer);overload;
    procedure GetMaxSeqNumber(var aSeqNumber,aRunID: Integer);overload;
    function SaveAlarm(aRunngingID: Integer; aTime: TDateTime;
      aSeqNumber: Integer; alarmID, alarmClass, aResource, aLogged, aRefer,
      aPrevState, aLogAct, aFinalState, alarm_msg: string;
      aGeneratTime: TDateTime): Boolean;overload;
    function SaveAlarm(aRunngingID: Integer; elementID : String;aTime: TDateTime;
      alarmID, alarmClass, aResource, aLogged, aRefer,
      aPrevState, aLogAct, aFinalState, alarm_msg: string;
      aGeneratTime: TDateTime): Boolean;overload;
    function SaveAlarm2(aRunngingID: Integer; aTime: TDateTime;
          alarmID, alarmClass, aResource, aLogged, aRefer,
          aPrevState, aLogAct, aFinalState, alarm_msg: string;
          aGeneratTime: TDateTime): Boolean;overload;
    procedure GetAlarmByRunningID(aRunningID: Integer; var alarmList: TList);
    procedure GetAlarmByRunningIDElemnID(aRunningID: Integer; aElmntID : String; var aAlarmData: TAlarmData);
    procedure GetGenerateTime(aRunningID: Integer; aElementID: string;
      var aGenerateTime: TDateTime);
    function AlarmExist(aRunningID: Integer; elementID : String): Boolean;
    { end }

    function SaveParameterChange(aRunning_ID: Integer; aDateTime: TDateTime;
      aPointID, aENG, aPREV, aVAL: string): Boolean;
    function AlterParameterChange(aElemID, aParamVal,
      aParamName: string): Boolean;
    function SaveCommands(aRunningID: Integer; aDateTime: TDateTime; aPointID,
      aVAL: string): Boolean;

    procedure SaveLog(aQuery: array of String); overload;
    procedure SaveLog(aQuery: String); overload;

    procedure GetTankTable(var aList: TList);
    procedure GetTankTableByElementID(const aElementID: string;
      var aList: TList);

    property Listeners : TListeners read FListeners;
    property OnExceptionMessage : TGetStrProc  read FOnExceptionMessage
      write SetOnExceptionMessage;
    property Connection : TZConnection read FConnection;
  end;

implementation

uses uSetting, Dialogs, uFunction,
  uAnalogSensor,uCircuitBreakerElement,uComputer,uControlElement,uHorizontalBar,uMotorControlDoubleSpeed,
  uMotorControlElement,uRunningHour,uSetpoint,uShortcut,uSwitchElement,uMotorControlStandby,
  uSwitchEvent,uSwitchNBCD,uSwitchTriangle,uTankSensor,uValveControl,uValveProportionally,
  uVerticalBar, Forms, uTrendData;

{ TIPMSDatabase }

function TIPMSDatabase.getMaxTankValue(aElementID: string): Double;
var
  FQuery : TZQuery;
  query : string;
begin
  Result := 0;

  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;

    SQL.Clear;
    query := 'SELECT Trim0m FROM TankTables ' +
             'WHERE ElementID = ' + QuotedStr(aElementID) +
             ' Order By SoundLength DESC';
    SQL.Add(query);
    Open;

    First;
    Result := FieldByName('Trim0m').AsFloat;

    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.getMaxLengthTankValue(aElementID: string): Double;
var
  FQuery : TZQuery;
  query : string;
begin
  Result := 0;

  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;

    SQL.Clear;
    query := 'SELECT SoundLength FROM TankTables ' +
             'WHERE ElementID = ' + QuotedStr(aElementID) +
             ' Order By SoundLength DESC';

    SQL.Add(query);
    Open;

    First;
    Result := FieldByName('SoundLength').AsFloat;

    Close;
    Connection := nil;
    Free;
  end;
end;

procedure TIPMSDatabase.GetMaxSeqNumber(var aSeqNumber, aRunID: Integer);
var
  FQuery: TZQuery;
  query : string;
begin
  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT ISNULL(MAX(sequence_number),0) as lastSequence FROM RS_ALARM_LOG where Running_ID = ' + IntToStr(aRunID);
    SQL.Add(query);
    Open;

    aSeqNumber := FieldByName('lastSequence').AsInteger;

    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.AlarmExist(aRunningID: Integer; elementID: String): Boolean;
var
  FQuery : TZQuery;
  query : string;
begin
  Result := False;

  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT * FROM RS_ALARM_LOG ' +
             ' WHERE alarm_id like ' + QuotedStr(elementID + '%') + ' and ' +
             ' Running_ID = ' + IntToStr(aRunningID) + ' and final_state = ' + QuotedStr('D');


    SQL.Add(query);
    Open;

    if RecordCount > 0 then
      Result := True
    else
      Result := False;

    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.AlterParameterChange(aElemID, aParamVal,
  aParamName: string): Boolean;
var
  FQuery : TZQuery;
  query : string;
begin
  Result := False;

  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'UPDATE Parameter SET ParamValue = ' + QuotedStr(aParamVal) +
             ' WHERE ElementID = ' + QuotedStr(aElemID) +
             ' AND ParamName = ' + QuotedStr(aParamName);

    SQL.Add(query);
    ExecSQL;

    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.cekValidateTankName(aIsNew: Boolean; aType, aName,
  aOldName: string): Boolean;
var
  FQuery : TZQuery;
  query : string;
  aNameCek : String;
begin
  Result := False;

  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    if aIsNew then
      query := 'SELECT Condition_Name ' +
               'FROM Condition ' +
               'WHERE Condition_Type = ' + QuotedStr(aType)
    else
      query := 'SELECT Condition_Name ' +
               'FROM Condition ' +
               'WHERE Condition_Type = ' + QuotedStr(aType) +
               ' AND NOT Condition_Name = ' + QuotedStr(aOldName);

    SQL.Add(query);
    Open;

    if RecordCount > 0 then
    begin
      First;

      while not Eof do
      begin
        aNameCek := FieldByName('Condition_Name').AsString;

        if aNameCek = aName then
        begin
          Result := False;
          Exit;
        end
        else
          Result := True;

        Next;
      end;
    end
    else
      Result := True;

    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.cekValidateTankValue(aID: string;
  aValue: Double): Boolean;
var
  FQuery : TZQuery;
  query : string;
  ValueCek : Double;
begin
  Result := False;

  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT Trim0m ' +
             'FROM TankTables ' +
             'WHERE ElementID = ' + QuotedStr(aID) +
             ' ORDER BY SoundLength DESC';
    SQL.Add(query);
    Open;

    First;
    ValueCek := FieldByName('Trim0m').AsFloat;

    if aValue > ValueCek then
      Result := False
    else
      Result := True;

    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.ConnectDB: Boolean;
begin
  FConnection.HostName := Setting.Database;
  FConnection.Database := Setting.DBName;
  FConnection.User := Setting.UserName;
  FConnection.Password := Setting.Password;
  FConnection.Protocol := Setting.Protocol;

  FConnection.Connect;

  Result := FConnection.Connected;

  if not Result then
    MessageDlg('Failed to connect Database..!', mtError, [mbOK], 0);
end;

constructor TIPMSDatabase.Create;
begin
  if not Assigned(Setting) then
    Setting := TSetting.Create;

  FConnection := TZConnection.Create(nil);
  FListeners := TListeners.Create;

  ConnectDB;

end;

function TIPMSDatabase.DeleteFACondition(aID: Integer): Boolean;
var
  FQuery : TZQuery;
  query : string;
begin
  Result := False;

  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'DELETE FROM FA_Condition ' +
             'WHERE Condition_ID = ' + IntToStr(aID);
    SQL.Add(query);

    query := 'DELETE FROM Condition ' +
             'WHERE Condition_ID = ' + IntToStr(aID);
    SQL.Add(query);
    ExecSQL;

    Close;
    Connection := nil;
    Free;
  end;

  Result := True;
end;

function TIPMSDatabase.DeletePCSCondition(aID: Integer): Boolean;
var
  FQuery : TZQuery;
  query : string;
begin
  Result := False;

  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'DELETE FROM PCS_Condition ' +
             'WHERE Condition_ID = ' + IntToStr(aID);
    SQL.Add(query);

    query := 'DELETE FROM Condition ' +
             'WHERE Condition_ID = ' + IntToStr(aID);
    SQL.Add(query);
    ExecSQL;

    Close;
    Connection := nil;
    Free;
  end;

  Result := True;
end;

function TIPMSDatabase.DeleteTanksCondition(aID: Integer): Boolean;
var
  FQuery : TZQuery;
  query : string;
begin
  Result := False;

  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;

    SQL.Clear;
    query := 'DELETE FROM Tanks_Condition ' +
             'WHERE Condition_ID = ' + IntToStr(aID);
    SQL.Add(query);

    query := 'DELETE FROM Condition ' +
             'WHERE Condition_ID = ' + IntToStr(aID);
    SQL.Add(query);
    ExecSQL;

    Close;
    Connection := nil;
    Free;
  end;

  Result := True;
end;


function TIPMSDatabase.DeletePMSCondition(aID: Integer): Boolean;
var
  FQuery : TZQuery;
  query : string;
begin
  Result := False;

  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'DELETE FROM PMS_Condition ' +
             'WHERE Condition_ID = ' + IntToStr(aID);
    SQL.Add(query);

    query := 'DELETE FROM Condition ' +
             'WHERE Condition_ID = ' + IntToStr(aID);
    SQL.Add(query);
    ExecSQL;

    Close;
    Connection := nil;
    Free;
  end;

  Result := True;
end;

function TIPMSDatabase.DeleteScenario(aID: Integer): Boolean;
var
  FQuery : TZQuery;
  query : String;
begin
  Result := False;

  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'DELETE from RunningScenario ' +
             'WHERE Scenario_ID = ' + IntToStr(aID) + ';';
    SQL.Add(query);

    query := 'DELETE from Scenario ' +
             'WHERE Scenario_ID = ' + IntToStr(aID);
    SQL.Add(query);

    try
      ExecSQL;
    finally
    end;

    Close;
    Connection := nil;
    Free;
  end;

  Result := True;
end;

procedure TIPMSDatabase.DeleteSession(isAll: Boolean; sessionID: Integer = 0);
var
  FQuery : TZQuery;
  query : string;
begin
  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    if isAll then
      query := 'EXEC sp_deleteSession 1'
    else
      query := 'EXEC sp_deleteSession 0, ' + IntToStr(sessionID);

    SQL.Add(query);
    ExecSQL;

    Close;
    Connection := nil;
    Free;
  end;
end;

destructor TIPMSDatabase.Destroy;
begin
  FListeners.Free;

  FConnection.Disconnect;
  FConnection.Free;

  inherited;
end;

Procedure TIPMSDatabase.GetAlarmByRunningID(aRunningID: Integer; var alarmList: TList);
var
  FQuery : TZQuery;
  query  : string;
  aAlarmData : TAlarmData;
  i      : Integer;
begin
  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

//    query := 'SELECT * ' +
//             'FROM RS_ALARM_LOG '  +
//             'WHERE Running_ID = ' + IntToStr(aRunningID) +
//             'ORDER BY sequence_number ASC, timestamp DESC';

    query := 'SELECT * ' +
         'FROM RS_ALARM_LOG '  +
         'WHERE sequence_number IN (' +
           'SELECT MAX(sequence_number) ' +
           'FROM RS_ALARM_LOG '  +
           'WHERE Running_ID = ' + IntToStr(aRunningID) +
           ' GROUP BY alarm_id) ' +
         'AND Running_ID = ' + IntToStr(aRunningID) +
         'ORDER BY final_state DESC, timestamp DESC';

    SQL.Add(query);
    Open;

    if Assigned(alarmList) then
    begin
      // ini jangan lupa di free object ny dlu sebelum diclear, biar usage memorynya g tmbh gede...!
//      FreeList(alarmList);
//      alarmList := TList.Create;
//      alarmList.Clear;

      for i := alarmList.Count -1  downto 0 do
      begin
        TAlarmData(alarmList.Items[i]).Free;
        alarmList.Delete(i);
      end;
      alarmList.Clear;

    end
    else
      alarmList := TList.Create;

    if RecordCount > 0 then
    begin
      First;

      while not Eof do
      begin
        aAlarmData := TAlarmData.Create;

        aAlarmData.Running_ID := FieldByName('Running_ID').AsInteger;
        aAlarmData.timestamp := FieldByName('timestamp').AsDateTime;
        aAlarmData.sequence_number := FieldByName('sequence_number').AsInteger;
        aAlarmData.alarm_id := FieldByName('alarm_id').AsString;
        aAlarmData.alarm_class := FieldByName('alarm_class').AsString;
        aAlarmData.resource := FieldByName('resource').AsString;
        aAlarmData.logged_by := FieldByName('logged_by').AsString;
        aAlarmData.reference := FieldByName('reference').AsString;
        aAlarmData.prev_state := FieldByName('prev_state').AsString;
        aAlarmData.log_action := FieldByName('log_action').AsString;
        aAlarmData.final_state := FieldByName('final_state').AsString;
        aAlarmData.alarm_message := FieldByName('alarm_message').AsString;
        aAlarmData.generation_time := FieldByName('generation_time').AsDateTime;

        alarmList.Add(aAlarmData);
        Next;
      end;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

procedure TIPMSDatabase.GetAlarmByRunningIDElemnID(aRunningID: Integer;
  aElmntID: String; var aAlarmData: TAlarmData);
var
  FQuery : TZQuery;
  query  : string;
begin
  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);
  aAlarmData := nil;

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT * ' +
             'FROM RS_ALARM_LOG '  +
             'WHERE sequence_number IN (' +
               'SELECT MAX(sequence_number) ' +
               'FROM RS_ALARM_LOG '  +
               'WHERE Running_ID = ' + IntToStr(aRunningID) +
               ' GROUP BY alarm_id) ' +
             'AND Running_ID = ' + IntToStr(aRunningID) +
             'AND alarm_id like ' + QuotedStr(aElmntID + '%') +
//             ' and final_state in (' + QuotedStr('G') + ',' + QuotedStr('A') +
//             ',' + QuotedStr('R') + ') ' +
             'ORDER BY sequence_number ASC, timestamp DESC';

    SQL.Add(query);
    Open;

    if RecordCount > 0 then
    begin
      First;
      aAlarmData := TAlarmData.Create;

      aAlarmData.Running_ID := FieldByName('Running_ID').AsInteger;
      aAlarmData.timestamp := FieldByName('timestamp').AsDateTime;
      aAlarmData.sequence_number := FieldByName('sequence_number').AsInteger;
      aAlarmData.alarm_id := FieldByName('alarm_id').AsString;
      aAlarmData.alarm_class := FieldByName('alarm_class').AsString;
      aAlarmData.resource := FieldByName('resource').AsString;
      aAlarmData.logged_by := FieldByName('logged_by').AsString;
      aAlarmData.reference := FieldByName('reference').AsString;
      aAlarmData.prev_state := FieldByName('prev_state').AsString;
      aAlarmData.log_action := FieldByName('log_action').AsString;
      aAlarmData.final_state := FieldByName('final_state').AsString;
      aAlarmData.alarm_message := FieldByName('alarm_message').AsString;
      aAlarmData.generation_time := FieldByName('generation_time').AsDateTime;

    end;

    Close;
    Connection := nil;
    Free;
  end;

end;

function TIPMSDatabase.GetAlarmComment(alarmMsg: string): TACSData;
var
  FQuery : TZQuery;
  query : string;
  aAlarmData : TACSData;
begin
  Result := nil;

  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT AlarmCommentEng ' +
             'FROM ACS_AlarmMsg ' +
             'WHERE AlarmMsgEng = ' + QuotedStr(alarmMsg) +
             ' ORDER BY AlarmMsgEng';

    SQL.Add(query);
    Open;

    if RecordCount > 0 then
    begin
      First;

      aAlarmData := TACSData.Create;
      aAlarmData.alarmComment := FieldByName('AlarmCommentEng').AsString;

      Result := aAlarmData;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.GetAlarmMsgGRM(aAlarmID: Byte): TACSData;
var
  FQuery : TZQuery;
  query : string;
  aACSData :  TACSData;
begin
  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query :=  ' SELECT AlarmMsgEng, AlarmMsgGRM FROM ACS_AlarmMsg ' +
              ' WHERE AlarmMsgID = ' + IntToStr(aAlarmID);

    SQL.Add(query);
    Open;

    if RecordCount > 0 then
    begin
      First;

      aACSData := TACSData.Create;
      aACSData.alarmMessage := FieldByName('AlarmMsgEng').AsString;
      aACSData.alarmMessageGRM := FieldByName('AlarmMsgGRM').AsString;

      Result := aACSData;
    end;

    Close;
    Connection := nil;
    Free;

  end;
end;

procedure TIPMSDatabase.GetAllAlarm(var alarmMsgList: TList);
var
  FQuery : TZQuery;
  query : string;
  aAlarmMsg :  TACSData;
begin
  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT * FROM ACS_AlarmMsg';

    SQL.Add(query);
    Open;

    if RecordCount > 0 then
    begin
      alarmMsgList := TList.Create;

      while not Eof do
      begin
        aAlarmMsg := TACSData.Create;
        aAlarmMsg.alarmMessage := FieldByName('AlarmMsgEng').AsString;
        aAlarmMsg.alarmComment := FieldByName('AlarmCommentEng').AsString;

        alarmMsgList.Add(aAlarmMsg);
        Next;
      end;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

//procedure TIPMSDatabase.GetAllCommands(timePrev, timeNext: string;
//  var commandList: TList);
//var
//  FQuery: TZQuery;
//  query: string;
//  commandData: TCommandsData;
//begin
//  if not FConnection.Connected then
//    Exit;

//  FQuery := TZQuery.Create(nil);

//  with FQuery do
//  begin
//    Connection := FConnection;
//    SQL.Clear;

//    query := 'SELECT * FROM COMMANDS WHERE timestamp >= ' +QuotedStr(timePrev)+
//             'AND timestamp <= ' +QuotedStr(timeNext)+
//             'ORDER BY timestamp DESC';

//    SQL.Add(query);
//    Open;

//    if RecordCount > 0 then
//    begin
//      First;

//      commandList := TList.Create;

//      while not Eof do
//      begin
//        commandData := TCommandsData.Create;
//        commandData.timestamp := FieldByName('timestamp').AsDateTime;
//        commandData.point_id := FieldByName('point_id').AsString;
//        commandData._VAL := FieldByName('_VAL').AsString;

//        commandList.Add(commandData);
//        Next;
//      end;
//    end;
//  end;

//  FQuery.Free;
//end;

procedure TIPMSDatabase.GetAllCondition(var aList: TList);
var
  FQuery : TZQuery;
  query : string;
  condData : TConditionData;
begin
  if not FConnection.Connected then
    Exit;

  if not Assigned(aList) then
    aList := TList.Create;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT * FROM Condition';

    SQL.Add(query);
    Open;

    if RecordCount > 0 then
    begin
      First;

      while not Eof do
      begin
        condData := TConditionData.Create;
        condData.ConditionID := FieldByName('Condition_ID').AsInteger;
        condData.ConditionName := FieldByName('Condition_Name').AsString;
        condData.ConditionType := FieldByName('Condition_Type').AsString;

        aList.Add(condData);
        Next;
      end;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

procedure TIPMSDatabase.GetAllCondition(aType: string; var aPMSCond: TStrings);
var
  FQuery : TZQuery;
  query : string;
begin
  if not FConnection.Connected then
    Exit;

  if not Assigned(aPMSCond) then
    aPMSCond := TStringList.Create;

  aPMSCond.Clear;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT * ' +
             'FROM Condition ' +
             'WHERE Condition_Type = ' + QuotedStr(aType) +
             ' ORDER BY Condition_Name';

    SQL.Add(query);
    Open;

    if RecordCount > 0 then
    begin
      First;

      while not Eof do
      begin
        aPMSCond.Add(FieldByName('Condition_Name').AsString);

        Next;
      end;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

procedure TIPMSDatabase.getAllElementIDs(var list: TStrings);
var
  FQuery : TZQuery;
  query : String;
begin
  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT ElementID from Elements  order by ElementID';

    SQL.Add(query);
    Open;

    list := TStringList.Create;

    while not Eof do
    begin
      list.Add(FieldByName('ElementID').AsString);
      Next;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

procedure TIPMSDatabase.GetAllFault(var faultMsgList: TList);
var
  FQuery : TZQuery;
  query : string;
  aFaultMsg : TACSData;
begin
  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT * FROM ACS_FaultMsg';

    SQL.Add(query);
    Open;

    if RecordCount > 0 then
    begin
      faultMsgList := TList.Create;

      while not Eof do
      begin
        aFaultMsg := TACSData.Create;
        aFaultMsg.faultMessage := FieldByName('FaultMsgEng').AsString;
        aFaultMsg.faultComment := FieldByName('FaultCommentEng').AsString;

        faultMsgList.Add(aFaultMsg);
        Next;
      end;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

procedure TIPMSDatabase.GetAllLocation(var locationList: TList);
var
  FQuery : TZQuery;
  query : string;
  aACSData : TACSData;
begin
  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT Lokasi FROM ACS_KillCard ORDER BY Lokasi';

    SQL.Add(query);
    Open;

    if RecordCount > 0 then
    begin
      locationList := TList.Create;

      while not Eof do
      begin
        aACSData := TACSData.Create;
        aACSData.lokasi := FieldByName('Lokasi').AsString;

        locationList.Add(aACSData);
        Next;
      end;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

procedure TIPMSDatabase.GetAllScenario(var aScenarios: TStrings);
var
  FQuery : TZQuery;
  query : string;
begin
  if not Assigned(aScenarios) then
    aScenarios := TStringList.Create;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT SCENARIO_NAME FROM SCENARIO';

    SQL.Add(query);
    Open;

    while not Eof do
    begin
      aScenarios.Add(FieldByName('Scenario_Name').AsString);

      Next;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

procedure TIPMSDatabase.GetAllSession(var aScenarios: TStrings);
var
  FQuery : TZQuery;
  query : string;
begin
  if not Assigned(aScenarios) then
    aScenarios := TStringList.Create;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'EXEC sp_getSession 1 ';

    SQL.Add(query);
    Open;

    while not Eof do
    begin
      aScenarios.Add(FieldByName('Scenario_Name').AsString);
      Next;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

procedure TIPMSDatabase.GetAll_IPMSLog_Data(aList: TList);
{var
  FQuery : TZQuery;

  tableData : TIPMS_Table_Data;

  fieldDef : TFieldDef;
  fieldVal : TIPMS_Record_Data;

  query : string;

  i, j : Integer;}
begin
  {if not FConnection.Connected then
    Exit;

  if not Assigned(aList) then
    aList := TList.Create
  else
    aList.Clear;

  FQuery := TZQuery.Create(nil);
  FQuery.Connection := FConnection;
  FQuery.SQL.Clear;

  query := 'SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME LIKE ''%AMCS%'' ORDER BY TABLE_NAME';
  FQuery.SQL.Add(query);
  FQuery.Open;

  if FQuery.RecordCount > 0 then
  begin
    FQuery.First;

    while not FQuery.Eof do
    begin
      tableData := TIPMS_Table_Data.Create;
      tableData.FDB_Name := FQuery.FieldByName('TABLE_NAME').AsString;
      tableData.FDB_Field := TIPMS_Field_Data.Create;

      aList.Add(tableData);

      FQuery.Next;
    end;
  end;

  for i := 0 to aList.Count - 1 do
  begin
    tableData := aList.Items[i];

    FQuery.SQL.Clear;
    query := 'SELECT TOP 500 * FROM ' + tableData.FDB_Name + ' ORDER BY timestamp';
    FQuery.SQL.Add(query);
    FQuery.Open;

    if FQuery.RecordCount > 0 then
    begin
      FQuery.First;

      while not FQuery.Eof do
      begin
        if FQuery.FieldDefs.Count <= 1 then
          Break;

        if not Assigned(tableData.FDB_Field.Values) then
          tableData.FDB_Field.Values := TList.Create;

        for j := 1 to FQuery.FieldDefs.Count - 1 do
        begin
          fieldDef := FQuery.FieldDefs.Items[j];

          fieldVal := TIPMS_Record_Data.Create;
          fieldVal.FFieldID := fieldDef.Name;
          fieldVal.FElementID := StringReplace(fieldDef.Name, 'VAL_VAL0', '', [rfReplaceAll]);

          tableData.FDB_Field.Values.Add(fieldVal);
        end;

        tableData.FDB_Field.timestamp := FQuery.FieldByName('timestamp').AsDateTime;

        for j := 0 to tableData.FDB_Field.Values.Count - 1 do
        begin
          fieldVal := tableData.FDB_Field.Values.Items[j];
          fieldVal.FElementValue := FQuery.FieldByName(fieldVal.FFieldID).AsFloat;
        end;

        FQuery.Next;
      end;
    end;
  end;    }
end;

procedure TIPMSDatabase.GetAvailableLogTimeStamp(aTimeType: string;
  aAvailList: TStrings);
var
  FQuery, FQueryElemt : TZQuery;
  query, queryElmt, strDate : string;
begin
  aAvailList := nil;

//  if (aTimeType <> 'START') or (aTimeType <> 'STOP') then
//    Exit;

  if not Assigned(aAvailList) then
    aAvailList := TStringList.Create;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT TABLE_NAME ' +
             'FROM INFORMATION_SCHEMA.TABLES ' +
             'WHERE TABLE_NAME LIKE ''%AMCS%'' ' +
             'ORDER BY TABLE_NAME';
    SQL.Add(query);
    Open;

    FQueryElemt := TZQuery.Create(nil);
    FQueryElemt.Connection := FConnection;

    while not Eof do
    begin
      FQueryElemt.SQL.Clear;

      if aTimeType = 'START' then
        queryElmt := 'SELECT MIN([timestamp]) as MyTime ' +
                     'FROM ' + FieldByName('TABLE_NAME').AsString
      else
        queryElmt := 'SELECT MAX([timestamp]) as MyTime ' +
                     'FROM ' + FieldByName('TABLE_NAME').AsString;

      FQueryElemt.SQL.Add(queryElmt);
      FQueryElemt.Open;

      if FQueryElemt.RecordCount > 0 then
      begin
        DateTimeToString(strDate, 'dd/mm/yyy hh/nn',
          FQueryElemt.FieldByName('MyTime').AsDateTime);
        aAvailList.Add(strDate);
      end;

      FQueryElemt.Close;
      Next;
    end;

    FQueryElemt.Connection := nil;
    FQueryElemt.Free;

    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.GetCAPData(aElementID: string): TCAP_Data;
var
  FQuery : TZQuery;
  query, tmpStr : string;
  capData : TCAP_Data;
  iopointData : TIOPOint_Data;
  equationData : TEquation_Data;
  paramData : TParameter_Data;
  tankData : TTank_Data;
  i : Integer;
begin
  Result := nil;

  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT A.*, B.AlarmgroupAbbreviation, B.AlarmgroupDescription ' +
             'FROM Elements A LEFT JOIN AlarmGroups B ON A.AlarmgroupID = B.AlarmgroupID ' +
             'WHERE A.ElementID = ' + QuotedStr(aElementID);

    SQL.Add(query);
    Open;

    if RecordCount > 0 then
    begin
      First;

      capData := TCAP_Data.Create;

      capData.FElementID := FieldByName('ElementID').AsString;
      capData.FElementtype_IDfk := FieldByName('Elementtype_IDfk').AsString;
      capData.FElementname := FieldByName('Elementname').AsString;
      capData.FSystemIDfk := FieldByName('SystemIDfk').AsString;
      capData.FSystemDescription := FieldByName('SystemDescription').AsString;
      capData.FController_ID := FieldByName('Controller_ID').AsString;
      capData.FMainMimic_IDfk := FieldByName('MainMimic_IDfk').AsString;
      capData.FAlarmGroupAbbreviation := FieldByName('AlarmgroupAbbreviation').AsString;

      SQL.Clear;

      query := 'SELECT * FROM IOPoints WHERE ElementIDfk = ' + QuotedStr(aElementID);
      SQL.Add(query);
      Open;

      capData.FIOPointList := TList.Create;
      capData.FEquationList := TList.Create;

      if RecordCount > 0 then
      begin
        First;

        while not Eof do
        begin
          iopointData := TIOPOint_Data.Create;

          iopointData.FIO_type := FieldByName('IO_type').AsString;
          iopointData.FIO_function_IDfk := FieldByName('IO_function_IDfk').AsString;
          iopointData.FIO_Rack := FieldByName('IO_Rack').AsString;
          iopointData.FIO_Slot := FieldByName('IO_Slot').AsString;
          iopointData.FIO_Channel := FieldByName('IO_Channel').AsString;
          iopointData.FCM_IDfk := FieldByName('CM_IDfk').AsString;
          iopointData.FS_Address_desk := FieldByName('S_Adress_desc').AsString;
          iopointData.F_Serial := FieldByName('Serial').AsString;

          tmpStr := FieldByName('Equation_IDfk').AsString;

          if tmpStr <> '' then
          begin
            equationData := TEquation_Data.Create;

            equationData.FEquation_IDfk := tmpStr;
            capData.FEquationList.Add(equationData);
          end;

          capData.FIOPointList.Add(iopointData);
          Next;
        end;
      end;

      SQL.Clear;

      query := 'SELECT * FROM IOPointsEquations WHERE ElementIDfk = ' + QuotedStr(aElementID);

      SQL.Add(query);
      Open;

      if RecordCount > 0 then
      begin
        First;
        i := 0;

        while not Eof do
        begin
          equationData := capData.FEquationList.Items[i];

          equationData.FEquationName := FieldByName('EquationName').AsString;
          equationData.FEquationDesc := FieldByName('EquationDescription').AsString;

          Inc(i);
          Next;
        end;
      end;

      SQL.Clear;

      query := 'SELECT * FROM Parameter ' +
               'WHERE ElementID = ' + QuotedStr(capData.FElementID);

      SQL.Add(query);
      Open;

      if RecordCount > 0 then
      begin
        First;

        capData.FParamList := TList.Create;

        while not FQuery.Eof do
        begin
          paramData := TParameter_Data.Create;

          paramData.FParamName := FieldByName('ParamName').AsString;
          paramData.FParamValue := FieldByName('ParamValue').AsString;
          paramData.FParamUnit := FieldByName('ParamUnit').AsString;

          capData.FParamList.Add(paramData);
          Next;
        end;
      end;

      SQL.Clear;

      query := 'SELECT * FROM TankTables WHERE ElementID = ' + QuotedStr(capData.FElementID);

      SQL.Add(query);
      Open;

      if RecordCount > 0 then
      begin
        First;

        capData.FTankList := TList.Create;

        while not FQuery.Eof do
        begin
          tankData := TTank_Data.Create;

          tankData.FElementID := FieldByName('ElementID').AsString;
          tankData.FTankBreakPointNumber := FieldByName('TankBreakPointNumber').AsString;
          tankData.FSoundLength := FieldByName('SoundLength').AsString;
          tankData.FTrim2m := FieldByName('Trim-2m').AsString;
          tankData.FTrim0m := FieldByName('Trim0m').AsString;
          tankData.FTrim1m := FieldByName('Trim1m').AsString;
          tankData.FTrim3m := FieldByName('Trim3m').AsString;
          tankData.FTrim6m := FieldByName('Trim6m').AsString;

          capData.FTankList.Add(tankData);
          Next;
        end;
      end;

      Result := capData;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.GetCIP_INFO(aElementType: string): TCIPInfo;
var
  FQuery : TZQuery;
  query : string;
  CIP_Info : TCIPInfo;
begin
  Result := nil;

  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT * ' +
             'FROM CIP_INFO ' +
             'WHERE TYPE = ' + QuotedStr(aElementType);
    SQL.Add(query);
    Open;

    if RecordCount > 0 then
    begin
      First;

      CIP_Info := TCIPInfo.Create;

      CIP_Info.F1 := FieldByName('F1').AsString;
      CIP_Info.F2 := FieldByName('F2').AsString;
      CIP_Info.F3 := FieldByName('F3').AsString;
      CIP_Info.F4 := FieldByName('F4').AsString;
      CIP_Info.F5 := FieldByName('F5').AsString;
      CIP_Info.F6 := FieldByName('F6').AsString;
      CIP_Info.F7 := FieldByName('F7').AsString;
      CIP_Info.F8 := FieldByName('F8').AsString;

      CIP_Info.F1A := FieldByName('F1A').AsString;
      CIP_Info.F2A := FieldByName('F2A').AsString;
      CIP_Info.F3A := FieldByName('F3A').AsString;
      CIP_Info.F4A := FieldByName('F4A').AsString;
      CIP_Info.F5A := FieldByName('F5A').AsString;
      CIP_Info.F6A := FieldByName('F6A').AsString;
      CIP_Info.F7A := FieldByName('F7A').AsString;
      CIP_Info.F8A := FieldByName('F8A').AsString;

      CIP_Info.SM0 := FieldByName('SM0').AsString;
      CIP_Info.SM1 := FieldByName('SM1').AsString;
      CIP_Info.SM2 := FieldByName('SM2').AsString;
      CIP_Info.SM3 := FieldByName('SM3').AsString;
      CIP_Info.SM4 := FieldByName('SM4').AsString;
      CIP_Info.SM5 := FieldByName('SM5').AsString;
      CIP_Info.SM6 := FieldByName('SM6').AsString;
      CIP_Info.SM7 := FieldByName('SM7').AsString;
      CIP_Info.SM8 := FieldByName('SM8').AsString;
      CIP_Info.SM9 := FieldByName('SM9').AsString;
      CIP_Info.SM10 := FieldByName('SM10').AsString;
      CIP_Info.SM11 := FieldByName('SM11').AsString;
      CIP_Info.SM12 := FieldByName('SM12').AsString;
      CIP_Info.SM13 := FieldByName('SM13').AsString;
      CIP_Info.SM14 := FieldByName('SM14').AsString;
      CIP_Info.SM15 := FieldByName('SM15').AsString;

      CIP_Info.ENBL := FieldByName('ENBL').AsString;
      CIP_Info.INH := FieldByName('INH').AsString;
      CIP_Info.AUTO := FieldByName('AUTO').AsString;
      CIP_Info.MAN := FieldByName('MAN').AsString;
      CIP_Info.LOC := FieldByName('LOC').AsString;

      Result := CIP_Info;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.GetConditionID(aName: string): Integer;
var
  FQuery : TZQuery;
  query : string;
begin
  Result := 0;

  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT * ' +
             'FROM Condition ' +
             'WHERE Condition_Name = ' + QuotedStr(aName);

    SQL.Add(query);
    Open;

    if RecordCount > 0 then
    begin
      First;

      Result := FieldByName('Condition_ID').AsInteger;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.GetConditionInfo(aID: Integer): string;
var
  FQuery : TZQuery;
  query : String;
  scen : String;
begin
  Result := 'NONE';

  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT c.*, s.Scenario_Name ' +
             'FROM Condition c INNER JOIN ScenarioCondition sc ON sc.Condition_ID = c.Condition_ID ' +
             'INNER JOIN Scenario s ON s.Scenario_ID = sc.Scenario_ID ' +
             'WHERE c.condition_id = ' + IntToStr(aID);
    SQL.Add(query);
    Open;

    if RecordCount <= 0 then
      Result := 'NONE'
    else
    begin
      First;

      scen := '';
      while not EOF do
      begin
        scen := FieldByName('Scenario_Name').AsString;

        Next;

        if not EOF then
          scen := scen + ', ';
      end;

      Result := 'Used by ' + scen + ' scenario(s).';
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.GetConditions(aName, aType: string): TStrings;
var
  FQuery : TZQuery;
  query : String;
begin
  Result := nil;

  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'EXEC sp_initialCondition2 ' + QuotedStr(aName) +
             ', ' + QuotedStr(aType);
    SQL.Add(query);
    Open;

    First;
    Result := TStringList.Create;

    while not EOF do
    begin
      Result.Add(FieldByName('tInfo').AsString);
      Next;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.GetElement(ElementID: string): TElementData;
var
  FQuery : TZQuery;
  query : string;
  element : TElementData;
  elmType : string;
begin
  Result := nil;
  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT a.*, b.AlarmgroupAbbreviation, b.AlarmgroupDescription ' +
             'FROM Elements a LEFT JOIN AlarmGroups b ON a.AlarmgroupID = b.AlarmgroupID ' +
             'WHERE a.ElementID = ' + QuotedStr(ElementID);
    SQL.Add(query);
    Open;

    if FQuery.RecordCount > 0 then
    begin
      First;

      elmType := FieldByName('Controller_ID').AsString;
      element := TElementData.Create;
      element.ElementID := FieldByName('ElementID').AsString;
      element.ElementName := FieldByName('Elementname').AsString;
      element.Elementtype_IDfk := FieldByName('Elementtype_IDfk').AsString;
      element.MainMimic_IDfk := StrToInt(FieldByName('MainMimic_IDfk').AsString);
      element.Inhibit_IDfk := FieldByName('Inhibit_IDfk').AsString;
      element.SystemIDfk := StrToInt(FieldByName('SystemIDfk').AsString);
      element.SystemDescription := FieldByName('SystemDescription').AsString;
      element.Controller_ID := FieldByName('Controller_ID').AsString;
      element.AlarmgroupID := FieldByName('AlarmgroupID').AsInteger;
      element.AlarmgroupDescription := FieldByName('AlarmgroupDescription').AsString;
      element.AlarmgroupAbbreviation := FieldByName('AlarmgroupAbbreviation').AsString;
      element.Text_0 := FieldByName('Text_0').AsString;
      element.Text_1 := FieldByName('Text_1').AsString;

      Result := element;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

procedure TIPMSDatabase.GetElementCondition(aName: string; var l: TList);
var
  FQuery : TZQuery;
  query : string;
  FData : TElementCondition;
begin
  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT d.* ' +
             'FROM Scenario a INNER JOIN ScenarioCondition b ON a.Scenario_ID = b.Scenario_ID ' +
  	         'INNER JOIN Condition c ON b.Condition_ID = c.Condition_ID ' +
             'INNER JOIN ConditionElement d ON d.Condition_ID = c.Condition_ID ' +
          	 'WHERE c.Condition_Type = ''ELEMENT'' AND a.Scenario_Name = ' + QuotedStr(aName);
    SQL.Add(query);
    Open;
    First;

    l := TList.Create;

    while not EOF do
    begin
      FData := TElementCondition.Create;

      FData.Condition_ID := FieldByName('Condition_ID').AsInteger;;
      FData.Element_ID := FieldByName('Element_ID').AsString;
      FData.StateElementDisabled := FieldByName('StateElementDisabled').AsInteger;
      FData.ValueApplication := FieldByName('ValueApplication').AsFloat;
      FData.StateValid := FieldByName('StateValid').AsInteger;
      FData.StateWireBreak := FieldByName('StateWireBreak').AsInteger;
      FData.StateDisplayStationary := FieldByName('StateDisplayStationary').AsInteger;
      FData.StateAlarmInhibited := FieldByName('StateAlarmInhibited').AsInteger;
      FData.StateStatus := FieldByName('StateStatus').AsInteger;
      FData.StateCommandClose := FieldByName('StateCommandClose').AsInteger;
      FData.StateCommandOpen := FieldByName('StateCommandOpen').AsInteger;
      FData.StateManualAuto := FieldByName('StateManualAuto').AsInteger;
      FData.StateCommandCloseApp := FieldByName('StateCommandCloseApp').AsInteger;
      FData.StateCommandOpenApp := FieldByName('StateCommandOpenApp').AsInteger;
      FData.StateCommandCloseHMI := FieldByName('StateCommandCloseHMI').AsInteger;
      FData.StateCommandOpenHMI := FieldByName('StateCommandOpenHMI').AsInteger;
      FData.StateRFC := FieldByName('StateRFC').AsInteger;
      FData.StateRFO := FieldByName('StateRFO').AsInteger;
      FData.StateSwitchClosed := FieldByName('StateSwitchClosed').AsInteger;
      FData.StateSwitchOpen := FieldByName('StateSwitchOpen').AsInteger;
      FData.StateSwitchRemote := FieldByName('StateSwitchRemote').AsInteger;
      FData.StateSwitchTripped := FieldByName('StateSwitchTripped').AsInteger;
      FData.StateSwitchNoFault := FieldByName('StateSwitchNoFault').AsInteger;
      FData.StatePMSSwitchClosedOpen := FieldByName('StatePMSSwitchClosedOpen').AsInteger;
      FData.StateNoFault := FieldByName('StateNoFault').AsInteger;
      FData.StateNoRFU := FieldByName('StateNoRFU').AsInteger;
      FData.StateTransition := FieldByName('StateTransition').AsInteger;
      FData.ProcesStatus := FieldByName('ProcesStatus').AsInteger;
      FData.CommandHMI := FieldByName('CommandHMI').AsInteger;
      FData.Command := FieldByName('Command').AsInteger;
      FData.State := FieldByName('State').AsInteger;
      FData.StateElementCaption := FieldByName('StateElementCaption').AsInteger;
      FData.StateSwitchSpeed1 := FieldByName('StateSwitchSpeed1').AsInteger;
      FData.StateSwitchSpeed2 := FieldByName('StateSwitchSpeed2').AsInteger;
      FData.CommandStartSpeed1App := FieldByName('CommandStartSpeed1App').AsInteger;
      FData.CommandStartSpeed2App := FieldByName('CommandStartSpeed2App').AsInteger;
      FData.CommandStopApp := FieldByName('CommandStopApp').AsInteger;
      FData.CommandStartSpeed1HMI := FieldByName('CommandStartSpeed1HMI').AsInteger;
      FData.CommandStartSpeed2HMI := FieldByName('CommandStartSpeed2HMI').AsInteger;
      FData.CommandStopHMI := FieldByName('CommandStopHMI').AsInteger;
      FData.StateBlockOut := FieldByName('StateBlokOut').AsInteger;
      FData.StateRestart := FieldByName('StateRestart').AsInteger;
      FData.StateValueValid := FieldByName('StateValueValid').AsInteger;
      FData.RFU := FieldByName('RFU').AsInteger;
      FData.RunCondition := FieldByName('RunCondition').AsInteger;
      FData.CommandStartApp := FieldByName('CommandStartApp').AsInteger;
      FData.CommandStartHMI := FieldByName('CommandStartHMI').AsInteger;
      FData.StateRFU := FieldByName('StateRFU').AsInteger;
      FData.StateSwitchRunning := FieldByName('StateSwitchRunning').AsInteger;
      FData.StateSwitchStandby := FieldByName('StateSwitchStandby').AsInteger;
      FData.CommandStandbyApp := FieldByName('CommandStandbyApp').AsInteger;
      FData.CommandStandbyHMI := FieldByName('CommandStandbyHMI').AsInteger;
      FData.StateSwitchRFU := FieldByName('StateSwitchRFU').AsInteger;
      FData.StateRunCondition := FieldByName('StateRunCondition').AsInteger;
      FData.CommandReset := FieldByName('CommandReset').AsInteger;
      FData.EnableCounting := FieldByName('EnableCounting').AsInteger;
      FData.StateLA := FieldByName('StateLA').AsInteger;
      FData.StateHA := FieldByName('StateHA').AsInteger;
      FData.StateHHA := FieldByName('StateHHA').AsInteger;
      FData.EventInput := FieldByName('EventInput').AsInteger;
      FData.SensorValue := FieldByName('SensorValue').AsFloat;
      FData.CommandEnableDisable := FieldByName('CommandEnableDisable').AsInteger;
      FData.HMISetPoint := FieldByName('HMISetPoint').AsInteger;
      FData.ValueSensor := FieldByName('ValueSensor').AsFloat;
      FData.TrimValue := FieldByName('TrimValue').AsFloat;
      FData.CompensationSensor := FieldByName('CompensationSensor').AsFloat;
      FData.InState := FieldByName('InState').AsInteger;
      FData.Mode := FieldByName('Mode').AsInteger;
      FData.Evaluate := FieldByName('Evaluate').AsInteger;
      FData.StateSwitch := FieldByName('StateSwitch').AsInteger;
      FData.StateAutoManual := FieldByName('StateAutoManual').AsInteger;
      FData.CommandOpen := FieldByName('CommandOpen').AsInteger;
      FData.CommandClose := FieldByName('CommandClose').AsInteger;
      FData.DesireState := FieldByName('DesireState').AsInteger;
      FData.SetPoint := FieldByName('SetPoint').AsInteger;
      FData.ValueValve := FieldByName('ValueValve').AsInteger;

      l.Add(FData);
      Next;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.getElementTableName(ElementID: String): string;
var
  FQuery : TZQuery;
  query : string;
begin
  Result := '';
  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'EXEC sp_getElementTableName ' + QuotedStr(ElementID);

    SQL.Add(query);
    Open;

    if RecordCount > 0 then
    begin
      First;
      Result := FieldByName('FTableName').AsString;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

procedure TIPMSDatabase.GetFACondByID(aID: Integer; var aList: TList);
var
  FQuery : TZQuery;
  query : string;
  faData : TFACond_Data;
begin
  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT * FROM FA_Condition ' +
             'WHERE Condition_ID = ' + IntToStr(aID) +
             ' ORDER BY FA_ID';
    SQL.Add(query);
    Open;

    if RecordCount > 0 then
    begin
      First;

      if not Assigned(aList) then
        aList := TList.Create
      else
        aList.Clear;

      while not Eof do
      begin
        faData := TFACond_Data.Create;
        faData.FA_ID := FieldByName('FA_ID').AsInteger;
        faData.Role := FieldByName('Role').AsString;
        faData.FA_DGSETS_State := FieldByName('FA_DGSETS_State').AsInteger;
        faData.FA_Distribution_State := FieldByName('FA_Distribution_State').AsInteger;
        faData.FA_Propultion_State := FieldByName('FA_Propultion_State').AsInteger;
        faData.FA_Auxiliary_State := FieldByName('FA_Auxiliary_State').AsInteger;
        faData.FA_Fuel_State := FieldByName('FA_Fuel_State').AsInteger;
        faData.FA_Domest_State := FieldByName('FA_Domest_State').AsInteger;
        faData.FA_HVAC_State := FieldByName('FA_HVAC_State').AsInteger;
        faData.FA_FFDC_State := FieldByName('FA_FFDC_State').AsInteger;
        faData.FA_Navigation_State := FieldByName('FA_Navigation_State').AsInteger;
        faData.FA_Ballast_State := FieldByName('FA_Ballast_State').AsInteger;
        faData.FA_IPMS_State := FieldByName('FA_IPMS_State').AsInteger;
        faData.FA_IAS_State := FieldByName('FA_IAS_State').AsInteger;
        faData.Condition_ID := FieldByName('Condition_ID').AsInteger;

        aList.Add(faData);
        Next;
      end;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

procedure TIPMSDatabase.GetTanksCondByID(aID: Integer; var aList: TList);
var
  FQuery : TZQuery;
  query : string;
  TanksData : TTanksCond_Data;
begin
  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT * ' +
             'FROM Tanks_Condition ' +
             'WHERE Condition_ID = ' + IntToStr(aID) +
             ' ORDER BY Tanks_ID';
    SQL.Add(query);
    Open;

    if RecordCount > 0 then
    begin
      First;

      if not Assigned(aList) then
        aList := TList.Create
      else
        aList.Clear;

      while not Eof do
      begin
        TanksData := TTanksCond_Data.Create;
        TanksData.Tanks_ID := FieldByName('Tanks_ID').AsInteger;
        TanksData.Tanks_ElementID := FieldByName('Tanks_ElementID').AsString;
        TanksData.Tanks_Value := FieldByName('Tanks_Value').AsFloat;
        TanksData.Condition_ID := FieldByName('Condition_ID').AsInteger;

        aList.Add(TanksData);
        Next;
      end;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.GetFACondID(aID, aIndex: Integer): Integer;
var
  FQuery : TZQuery;
  query : string;
begin
  Result := 0;

  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT * FROM (' +
               'SELECT ROW_NUMBER() OVER (ORDER BY FA_ID ASC) AS RowNumber, * ' +
               'FROM FA_Condition ' +
               'WHERE Condition_ID = ' + IntToStr(aID) + ') AS NewTable ' +
             'WHERE NewTable.RowNumber = ' + IntToStr(aIndex);
    SQL.Add(query);
    Open;

    if RecordCount > 0 then
    begin
      First;
      Result := FieldByName('FA_ID').AsInteger;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.GetTanksCondID(aID, aIndex: Integer): Integer;
var
  FQuery : TZQuery;
  query : string;
begin
  Result := 0;

  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT * ' +
             'FROM (' +
               'SELECT ROW_NUMBER() OVER (ORDER BY Tanks_ID ASC) AS RowNumber, * ' +
               'FROM Tanks_Condition ' +
               'WHERE Condition_ID = ' + IntToStr(aID) + ') AS NewTable ' +
             'WHERE NewTable.RowNumber = ' + IntToStr(aIndex);
    SQL.Add(query);
    Open;

    if RecordCount > 0 then
    begin
      First;
      Result := FieldByName('Tanks_ID').AsInteger;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

procedure TIPMSDatabase.GetTanksCondition(aScenarioName: string;
  var aList: TList);
var
  FQuery : TZQuery;
  query : string;
  tankData : TTanksCond_Data;
begin
  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT D.* ' +
             'FROM Scenario A ' +
             'INNER JOIN ScenarioCondition B ON A.Scenario_ID = B.Scenario_ID ' +
             'INNER JOIN Condition C ON B.Condition_ID = C.Condition_ID ' +
             'INNER JOIN Tanks_Condition D ON C.Condition_ID = D.Condition_ID ' +
             'WHERE C.Condition_Type = ' + QuotedStr('TANK') +
             'AND A.Scenario_Name = ' + QuotedStr(aScenarioName);
    SQL.Add(query);
    Open;

    if RecordCount > 0 then
    begin
      First;

      aList := TList.Create;

      while not Eof do
      begin
        tankData := TTanksCond_Data.Create;
        tankData.Tanks_ID := FieldByName('Tanks_ID').AsInteger;
        tankData.Tanks_ElementID := FieldByName('Tanks_ElementID').AsString;
        tankData.Tanks_Value := FieldByName('Tanks_Value').AsFloat;
        tankData.Condition_ID := FieldByName('Condition_ID').AsInteger;

        aList.Add(tankData);
        Next;
      end;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

procedure TIPMSDatabase.GetTankTable(var aList: TList);
var
  FQuery : TZQuery;
  query : string;
  tankData : TTank_Data;
begin
  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT * FROM TankTables';
    SQL.Add(query);
    Open;

    if RecordCount > 0 then
    begin
      aList := TList.Create;
      First;

      while not Eof do
      begin
        tankData := TTank_Data.Create;

        tankData.FElementID := FieldByName('ElementID').AsString;
        tankData.FTankBreakPointNumber := FieldByName('TankBreakPointNumber').AsString;
        tankData.FSoundLength := FieldByName('SoundLength').AsString;
        tankData.FTrim2m := FieldByName('Trim-2m').AsString;
        tankData.FTrim0m := FieldByName('Trim0m').AsString;
        tankData.FTrim1m := FieldByName('Trim1m').AsString;
        tankData.FTrim3m := FieldByName('Trim3m').AsString;
        tankData.FTrim6m := FieldByName('Trim6m').AsString;

        aList.Add(tankData);
        Next;
      end;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

procedure TIPMSDatabase.GetTankTableByElementID(const aElementID: string;
  var aList: TList);
var
  FQuery : TZQuery;
  query : string;
  tankData : TTank_Data;
begin
  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT * ' +
             'FROM TankTables ' +
             'WHERE ElementID = ' + QuotedStr(aElementID);

    SQL.Add(query);
    Open;

    if RecordCount > 0 then
    begin
      aList := TList.Create;
      First;

      while not Eof do
      begin
        tankData := TTank_Data.Create;

        tankData.FElementID := FieldByName('ElementID').AsString;
        tankData.FTankBreakPointNumber := FieldByName('TankBreakPointNumber').AsString;
        tankData.FSoundLength := FieldByName('SoundLength').AsString;
        tankData.FTrim2m := FieldByName('Trim-2m').AsString;
        tankData.FTrim0m := FieldByName('Trim0m').AsString;
        tankData.FTrim1m := FieldByName('Trim1m').AsString;
        tankData.FTrim3m := FieldByName('Trim3m').AsString;
        tankData.FTrim6m := FieldByName('Trim6m').AsString;

        aList.Add(tankData);
        Next;
      end;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

procedure TIPMSDatabase.GetFACondition(aScenarioName: string; var aList: TList);
var
  FQuery : TZQuery;
  query : string;
  faData : TFACond_Data;
begin
  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT D.* ' +
             'FROM Scenario A ' +
             'INNER JOIN ScenarioCondition B ON A.Scenario_ID = B.Scenario_ID ' +
             'INNER JOIN Condition C ON B.Condition_ID = C.Condition_ID ' +
             'INNER JOIN FA_Condition D ON C.Condition_ID = D.Condition_ID ' +
             'WHERE C.Condition_Type = ' + QuotedStr('FA') +
             'AND A.Scenario_Name = ' + QuotedStr(aScenarioName);
    SQL.Add(query);
    Open;

    if RecordCount > 0 then
    begin
      First;

      aList := TList.Create;

      while not Eof do
      begin
        faData := TFACond_Data.Create;
        faData.FA_ID := FieldByName('FA_ID').AsInteger;
        faData.Role := FieldByName('Role').AsString;
        faData.FA_DGSETS_State := FieldByName('FA_DGSETS_State').AsInteger;
        faData.FA_Distribution_State := FieldByName('FA_Distribution_State').AsInteger;
        faData.FA_Propultion_State := FieldByName('FA_Propultion_State').AsInteger;
        faData.FA_Auxiliary_State := FieldByName('FA_Auxiliary_State').AsInteger;
        faData.FA_Fuel_State := FieldByName('FA_Fuel_State').AsInteger;
        faData.FA_Domest_State := FieldByName('FA_Domest_State').AsInteger;
        faData.FA_HVAC_State := FieldByName('FA_HVAC_State').AsInteger;
        faData.FA_FFDC_State := FieldByName('FA_FFDC_State').AsInteger;
        faData.FA_Navigation_State := FieldByName('FA_Navigation_State').AsInteger;
        faData.FA_Ballast_State := FieldByName('FA_Ballast_State').AsInteger;
        faData.FA_IPMS_State := FieldByName('FA_IPMS_State').AsInteger;
        faData.FA_IAS_State := FieldByName('FA_IAS_State').AsInteger;

        aList.Add(faData);
        Next;
      end;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.GetFaultComment(faultMsg: string): TACSData;
var
  FQuery : TZQuery;
  query : string;
  aFaultData : TACSData;
begin
  Result := nil;

  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT FaultCommentEng FROM ACS_FaultMsg ' +
             'WHERE FaultMsgEng = ' + QuotedStr(faultMsg) +
             'ORDER BY FaultMsgEng';
    SQL.Add(query);
    Open;

    if RecordCount > 0 then
    begin
      First;

      aFaultData := TACSData.Create;
      aFaultData.faultComment := FieldByName('FaultCommentEng').AsString;

      Result := aFaultData;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.GetFaultMsgGRM(aFaultID: Byte): TACSData;
var
  FQuery : TZQuery;
  query : string;
  aACSData :  TACSData;
begin
  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query :=  ' SELECT FaultMsgEng,FaultMsgGRM FROM ACS_FaultMsg ' +
              ' WHERE FaultMsgID = ' + IntToStr(aFaultID);

    SQL.Add(query);
    Open;

    if RecordCount > 0 then
    begin
      First;

      aACSData := TACSData.Create;
      aACSData.faultMessage := FieldByName('FaultMsgEng').AsString;
      aACSData.faultMessageGRM := FieldByName('FaultMsgGRM').AsString;

      Result := aACSData;
    end;

    Close;
    Connection := nil;
    Free;

  end;
end;

procedure TIPMSDatabase.getFieldsTrend(var list: TList);
var
  FQuery : TZQuery;
  query  : String;
  data : TFieldDataTrend;
begin
  if not FConnection.Connected then
    Exit;

  if not assigned(list) then
    list := TList.Create;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'EXEC dbo.sp_fieldslist';
    SQL.Add(query);
    Open;

    while not EOF do
    begin
      data := TFieldDataTrend.Create;
      data.TableName := FieldByName('TBL_NAME').AsString;
      data.ColumnName := FieldByName('FIELD_NAME').AsString;

      List.Add(data);
      Next;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.GetFreeConditionID: Integer;
var
  FQuery : TZQuery;
  query : string;
  id : Integer;
begin
  Result := 0;

  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT * FROM Condition ORDER BY Condition_ID';
    SQL.Add(query);
    Open;

    Result := 1;

    if RecordCount > 0 then
    begin
      First;

      while not Eof do
      begin
        id := FieldByName('Condition_ID').AsInteger;

        if Result = id then
          Inc(Result);

        Next;
      end;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.GetFreeConditionScenarioID: Integer;
var
  FQuery : TZQuery;
  query : string;
  id : Integer;
begin
  Result := 0;

  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT * FROM ScenarioCondition ORDER BY ScenarioCondition_ID';
    SQL.Add(query);
    Open;

    Result := 1;

    if RecordCount > 0 then
    begin
      First;

      while not Eof do
      begin
        id := FieldByName('ScenarioCondition_ID').AsInteger;

        if Result = id then
          Inc(Result);

        Next;
      end;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.GetFreeFACondID: Integer;
var
  FQuery : TZQuery;
  query : string;
  id : Integer;
begin
  Result := 0;

  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT * FROM FA_Condition ORDER BY FA_ID';
    SQL.Add(query);
    Open;

    Result := 1;

    if RecordCount > 0 then
    begin
      First;

      while not Eof do
      begin
        id := FieldByName('FA_ID').AsInteger;

        if Result = id then
          Inc(Result);

        Next;
      end;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.GetFreeTanksCondID: Integer;
var
  FQuery : TZQuery;
  query : string;
  id : Integer;
begin
  Result := 0;

  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT * FROM Tanks_Condition ORDER BY Tanks_ID';
    SQL.Add(query);
    Open;

    Result := 1;

    if RecordCount > 0 then
    begin
      First;

      while not Eof do
      begin
        id := FieldByName('Tanks_ID').AsInteger;

        if Result = id then
          Inc(Result);

        Next;
      end;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

procedure TIPMSDatabase.GetGenerateTime(aRunningID: Integer; aElementID: string;
  var aGenerateTime: TDateTime);
var
  FQuery : TZQuery;
  query : string;
begin
  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT generation_time ' +
             ' FROM RS_ALARM_LOG '  +
             ' WHERE sequence_number IN (SELECT MAX(sequence_number) ' +
               ' FROM RS_ALARM_LOG ' +
               ' WHERE Running_ID = ' + IntToStr(aRunningID) +
               ' GROUP BY alarm_id) ' +
             ' AND Running_ID = ' + IntToStr(aRunningID) +
             ' AND alarm_id = ' + QuotedStr(aElementID) ;

    SQL.Add(query);
    Open;

    aGenerateTime := FQuery.FieldByName('generation_time').AsDateTime;

    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.GetLocationByRoomID(aLocByRoom: string): TACSData;
var
  FQuery : TZQuery;
  query : string;
  aACSData : TACSData;
begin
  Result := nil;

  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT * FROM ACS_KillCard ' +
             'WHERE sandiRuangan = ' + QuotedStr(aLocByRoom)+
             'ORDER BY Deck DESC';

    SQL.Add(query);
    Open;

    if RecordCount > 0 then
    begin
      First;

      aACSData := TACSData.Create;
      aACSData.lokasi := FieldByName('Lokasi').AsString;
      aACSData.sandiRuangan := FieldByName('SandiRuangan').AsString;
      aACSData.deck := FieldByName('Deck').AsString;

      Result := aACSData;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.GetLocationDetail(aLocDetail: string): TACSData;
var
  FQuery : TZQuery;
  query : string;
  aACSData : TACSData;
begin
  result := nil;

  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT * FROM ACS_KillCard ' +
             'WHERE Lokasi = '+ QuotedStr(aLocDetail) +
             'ORDER BY Deck DESC';
    SQL.Add(query);
    Open;

    if RecordCount > 0 then
    begin
      First;

      aACSData := TACSData.Create;
      aACSData.sandiRuangan := FieldByName('SandiRuangan').AsString;
      aACSData.deck := FieldByName('Deck').AsString;
      aACSData.lokasi := FieldByName('Lokasi').AsString;

      Result := aACSData;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

procedure TIPMSDatabase.GetMaxSeqNumber(var aSeqNumber: Integer);
var
  FQuery: TZQuery;
  query : string;
begin
  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT MAX(sequence_number) AS lastSequence FROM RS_ALARM_LOG';
    SQL.Add(query);
    Open;

    aSeqNumber := FieldByName('lastSequence').AsInteger;

    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.GetFreePCSCondID: Integer;
var
  FQuery : TZQuery;
  query : string;
  id : Integer;
begin
  Result := 0;

  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT * FROM PCS_Condition ORDER BY PCS_ID';
    SQL.Add(query);
    Open;

    Result := 1;

    if RecordCount > 0 then
    begin
      First;

      while not Eof do
      begin
        id := FieldByName('PCS_ID').AsInteger;

        if Result = id then
          Inc(Result);

        Next;
      end;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.GetFreePMSCondID: Integer;
var
  FQuery : TZQuery;
  query : string;
  id : Integer;
begin
  Result := 0;

  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT * FROM PMS_Condition ORDER BY PMS_ID';
    SQL.Add(query);
    Open;

    Result := 1;

    if RecordCount > 0 then
    begin
      First;

      while not Eof do
      begin
        id := FieldByName('PMS_ID').AsInteger;

        if Result = id then
          Inc(Result);

        Next;
      end;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

procedure TIPMSDatabase.GetPCSCondByID(aID: Integer;var aList : TList);
var
  FQuery : TZQuery;
  query : string;
  aData : TPCSCond_Data;
begin
  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT * FROM PCS_Condition ' +
             'WHERE Condition_ID = ' + IntToStr(aID) +
             ' ORDER BY PCS_ID';
    SQL.Add(query);
    Open;

    if RecordCount > 0 then
    begin
      First;

      if not Assigned(aList) then
        aList := TList.Create
      else
        aList.Clear;

      while not Eof do
      begin
        aData := TPCSCond_Data.Create;
        aData.PCS_ID := FieldByName('PCS_ID').AsInteger;
        aData.PCS_Name := FieldByName('PCS_Name').AsString;
        aData.PCS_State := FieldByName('PCS_State').AsInteger;
        aData.Condition_ID := FieldByName('Condition_ID').AsInteger;
        aData.Value := FieldByName('Value').AsInteger;

        aList.Add(aData);
        Next;
      end;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

procedure TIPMSDatabase.GetPCSCondition(aName: string; var l: TList);
var
  FQuery : TZQuery;
  query : String;
  FData : TScenarioPCSCondition;
begin
  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT d.PCS_NAME, d.PCS_State, d.Value ' +
             'FROM Scenario a INNER JOIN ScenarioCondition b ON a.Scenario_ID = b.Scenario_ID ' +
             'INNER JOIN Condition c ON b.Condition_ID = c.Condition_ID ' +
             'INNER JOIN PCS_Condition d ON d.Condition_ID = c.Condition_ID ' +
             'WHERE c.Condition_Type = ''PCS'' AND a.Scenario_Name = ' + QuotedStr(aName);
    SQL.Add(query);
    Open;

    First;
    l := TList.Create;

    while not EOF do
    begin
      FData := TScenarioPCSCondition.Create;

      FData.PCS_Name := FieldByName('PCS_NAME').AsString;
      FData.PCS_State := FieldByName('PCS_State').AsInteger;
      FData.Value := FieldByName('Value').AsInteger;

      l.Add(FData);
      Next;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

procedure TIPMSDatabase.GetPMSCondByID(aID: Integer; var aList: TList);
var
  FQuery : TZQuery;
  query : string;
  pmsData : TPMSCond_Data;
begin
  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT * ' +
             'FROM PMS_Condition ' +
             'WHERE Condition_ID = ' + IntToStr(aID) +
             ' ORDER BY PMS_ID';
    SQL.Add(query);
    Open;

    if RecordCount > 0 then
    begin
      First;

      if not Assigned(aList) then
        aList := TList.Create
      else
        aList.Clear;

      while not Eof do
      begin
        pmsData := TPMSCond_Data.Create;
        pmsData.PMS_ID := FieldByName('PMS_ID').AsInteger;
        pmsData.PMS_Name := FieldByName('PMS_Name').AsString;
        pmsData.PMS_Type := FieldByName('PMS_Type').AsInteger;
        pmsData.PMS_Mode := FieldByName('PMS_Mode').AsInteger;
        pmsData.PMS_State := FieldByName('PMS_State').AsInteger;
        pmsData.PMS_OnOff := FieldByName('PMS_OnOff').AsInteger;
        pmsData.PMS_Pref := FieldByName('PMS_Pref').AsInteger;
        pmsData.PMS_CB := FieldByName('PMS_CB').AsInteger;
        pmsData.PMS_SWB_MSBIntrMode := FieldByName('PMS_SWB_MSBIntrMode').AsInteger;
        pmsData.PMS_SWB_ESBIntrMode := FieldByName('PMS_SWB_ESBIntrMode').AsInteger;
        pmsData.PMS_SWB_ShoreIntrMode := FieldByName('PMS_SWB_ShoreIntrMode').AsInteger;
        pmsData.PMS_SWB_MsbCBIntr := FieldByName('PMS_SWB_MsbCBIntr').AsInteger;
        pmsData.PMS_SWB_EsbCBIntr := FieldByName('PMS_SWB_EsbCBIntr').AsInteger;
        pmsData.PMS_SWB_MsbCBShore := FieldByName('PMS_SWB_MsbCBShore').AsInteger;
        pmsData.Condition_ID := FieldByName('Condition_ID').AsInteger;

        aList.Add(pmsData);
        Next;
      end;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.GetPMSCondID(aID, aIndex: Integer): Integer;
var
  FQuery : TZQuery;
  query : string;
begin
  Result := 0;

  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT * FROM (' +
               'SELECT ROW_NUMBER() OVER (ORDER BY PMS_ID ASC) AS RowNumber, * ' +
               'FROM PMS_Condition ' +
               'WHERE Condition_ID = ' + IntToStr(aID) + ') AS NewTable ' +
             'WHERE NewTable.RowNumber = ' + IntToStr(aIndex);
    SQL.Add(query);
    Open;

    if RecordCount > 0 then
    begin
      First;
      Result := FieldByName('PMS_ID').AsInteger;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

procedure TIPMSDatabase.GetPMSCondition(aName: string; var l : TList) ;
var
  FQuery : TZQuery;
  query : String;
  FData : TScenarioPMSCondition;
begin
  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT d.PMS_NAME, d.PMS_TYPE, d.PMS_Mode, d.PMS_OnOff ' +
             'FROM Scenario a INNER JOIN ScenarioCondition b ON a.Scenario_ID = b.Scenario_ID ' +
             'INNER JOIN Condition c ON b.Condition_ID = c.Condition_ID ' +
             'INNER JOIN PMS_Condition d ON d.Condition_ID = c.Condition_ID ' +
             'WHERE c.Condition_Type = ''PMS'' AND a.Scenario_Name = ' + QuotedStr(aName);
    SQL.Add(query);
    Open;

    First;
    l := TList.Create;

    while not EOF do
    begin
      FData := TScenarioPMSCondition.Create;

      FData.PMS_Name := FieldByName('PMS_NAME').AsString;
      FData.PMS_Type := FieldByName('PMS_TYPE').AsInteger;
      FData.PMS_Mode := FieldByName('PMS_Mode').AsInteger;
      FData.PMS_OnOff := FieldByName('PMS_OnOff').AsInteger;

      l.Add(FData);
      Next;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

procedure TIPMSDatabase.getRS_CommandHistory(aSession: Integer;
  var list: Tlist);
var
  FQuery : TZQuery;
  query  : string;
  FCommandData : TCommandsData;
begin
  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT * ' +
             'FROM RS_COMMANDS ' +
             'WHERE RUNNING_ID = ' + IntToStr(aSession);
    SQL.Add(query);
    Open;

    First;
    list := TList.Create;

    while not Eof do
    begin
      FCommandData := TCommandsData.Create;

      FCommandData.timestamp := FieldByName('timestamp').AsDateTime;
      FCommandData.point_id := FieldByName('point_id').AsString;
      FCommandData._VAL := FieldByName('_VAL').AsString;

      list.Add(FCommandData);
      Next;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

procedure TIPMSDatabase.getRS_Parameters(aSession: Integer; var list: Tlist);
var
  FQuery : TZQuery;
  query  : string;
  FParameterData : TParameterChangesData;
begin
  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT * ' +
             'FROM RS_PARAMETERS ' +
             'WHERE RUNNING_ID = ' + IntToStr(aSession);
    SQL.Add(query);
    Open;

    First;
    list := TList.Create;

    while not Eof do
    begin
      FParameterData := TParameterChangesData.Create;

      FParameterData.timestamp := FieldByName('timestamp').AsDateTime;
      FParameterData.point_id := FieldByName('point_id').AsString;
      FParameterData._ENG := FieldByName('_ENG').AsString;
      FParameterData._PREV := FieldByName('_PREV').AsString;
      FParameterData._VAL := FieldByName('_VAL').AsString;

      list.Add(FParameterData);
      Next;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

procedure TIPMSDatabase.GetRS_ElementCondition(aSession: integer; var l: TList);
var
  FQuery : TZQuery;
  query : String;
  FData : TElementCondition;
begin
  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT * ' +
             'FROM RS_ConditionElement ' +
             'WHERE RUNNING_ID = ' + IntToStr(aSession);
    SQL.Add(query);
    Open;

    First;
    l := TList.Create;

    while not EOF do
    begin
      FData := TElementCondition.Create;

      FData.Element_ID := FieldByName('Element_ID').AsString;
      FData.StateElementDisabled := FieldByName('StateElementDisabled').AsInteger;
      FData.ValueApplication := FieldByName('ValueApplication').AsFloat;
      FData.StateValid := FieldByName('StateValid').AsInteger;
      FData.StateWireBreak := FieldByName('StateWireBreak').AsInteger;
      FData.StateDisplayStationary := FieldByName('StateDisplayStationary').AsInteger;
      FData.StateAlarmInhibited := FieldByName('StateAlarmInhibited').AsInteger;
      FData.StateStatus := FieldByName('StateStatus').AsInteger;
      FData.StateCommandClose := FieldByName('StateCommandClose').AsInteger;
      FData.StateCommandOpen := FieldByName('StateCommandOpen').AsInteger;
      FData.StateManualAuto := FieldByName('StateManualAuto').AsInteger;
      FData.StateCommandCloseApp := FieldByName('StateCommandCloseApp').AsInteger;
      FData.StateCommandOpenApp := FieldByName('StateCommandOpenApp').AsInteger;
      FData.StateCommandCloseHMI := FieldByName('StateCommandCloseHMI').AsInteger;
      FData.StateCommandOpenHMI := FieldByName('StateCommandOpenHMI').AsInteger;
      FData.StateRFC := FieldByName('StateRFC').AsInteger;
      FData.StateRFO := FieldByName('StateRFO').AsInteger;
      FData.StateSwitchClosed := FieldByName('StateSwitchClosed').AsInteger;
      FData.StateSwitchOpen := FieldByName('StateSwitchOpen').AsInteger;
      FData.StateSwitchRemote := FieldByName('StateSwitchRemote').AsInteger;
      FData.StateSwitchTripped := FieldByName('StateSwitchTripped').AsInteger;
      FData.StateSwitchNoFault := FieldByName('StateSwitchNoFault').AsInteger;
      FData.StatePMSSwitchClosedOpen := FieldByName('StatePMSSwitchClosedOpen').AsInteger;
      FData.StateNoFault := FieldByName('StateNoFault').AsInteger;
      FData.StateNoRFU := FieldByName('StateNoRFU').AsInteger;
      FData.StateTransition := FieldByName('StateTransition').AsInteger;
      FData.ProcesStatus := FieldByName('ProcesStatus').AsInteger;
      FData.CommandHMI := FieldByName('CommandHMI').AsInteger;
      FData.Command := FieldByName('Command').AsInteger;
      FData.State := FieldByName('State').AsInteger;
      FData.StateElementCaption := FieldByName('StateElementCaption').AsInteger;
      FData.StateSwitchSpeed1 := FieldByName('StateSwitchSpeed1').AsInteger;
      FData.StateSwitchSpeed2 := FieldByName('StateSwitchSpeed2').AsInteger;
      FData.CommandStartSpeed1App := FieldByName('CommandStartSpeed1App').AsInteger;
      FData.CommandStartSpeed2App := FieldByName('CommandStartSpeed2App').AsInteger;
      FData.CommandStopApp := FieldByName('CommandStopApp').AsInteger;
      FData.CommandStartSpeed1HMI := FieldByName('CommandStartSpeed1HMI').AsInteger;
      FData.CommandStartSpeed2HMI := FieldByName('CommandStartSpeed2HMI').AsInteger;
      FData.CommandStopHMI := FieldByName('CommandStopHMI').AsInteger;
      FData.StateBlockOut := FieldByName('StateBlokOut').AsInteger;
      FData.StateRestart := FieldByName('StateRestart').AsInteger;
      FData.StateValueValid := FieldByName('StateValueValid').AsInteger;
      FData.RFU := FieldByName('RFU').AsInteger;
      FData.RunCondition := FieldByName('RunCondition').AsInteger;
      FData.CommandStartApp := FieldByName('CommandStartApp').AsInteger;
      FData.CommandStartHMI := FieldByName('CommandStartHMI').AsInteger;
      FData.StateRFU := FieldByName('StateRFU').AsInteger;
      FData.StateSwitchRunning := FieldByName('StateSwitchRunning').AsInteger;
      FData.StateSwitchStandby := FieldByName('StateSwitchStandby').AsInteger;
      FData.CommandStandbyApp := FieldByName('CommandStandbyApp').AsInteger;
      FData.CommandStandbyHMI := FieldByName('CommandStandbyHMI').AsInteger;
      FData.StateSwitchRFU := FieldByName('StateSwitchRFU').AsInteger;
      FData.StateRunCondition := FieldByName('StateRunCondition').AsInteger;
      FData.CommandReset := FieldByName('CommandReset').AsInteger;
      FData.EnableCounting := FieldByName('EnableCounting').AsInteger;
      FData.StateLA := FieldByName('StateLA').AsInteger;
      FData.StateHA := FieldByName('StateHA').AsInteger;
      FData.StateHHA := FieldByName('StateHHA').AsInteger;
      FData.EventInput := FieldByName('EventInput').AsInteger;
      FData.SensorValue := FieldByName('SensorValue').AsFloat;
      FData.CommandEnableDisable := FieldByName('CommandEnableDisable').AsInteger;
      FData.HMISetPoint := FieldByName('HMISetPoint').AsInteger;
      FData.ValueSensor := FieldByName('ValueSensor').AsFloat;
      FData.TrimValue := FieldByName('TrimValue').AsFloat;
      FData.CompensationSensor := FieldByName('CompensationSensor').AsFloat;
      FData.InState := FieldByName('InState').AsInteger;
      FData.Mode := FieldByName('Mode').AsInteger;
      FData.Evaluate := FieldByName('Evaluate').AsInteger;
      FData.StateSwitch := FieldByName('StateSwitch').AsInteger;
      FData.StateAutoManual := FieldByName('StateAutoManual').AsInteger;
      FData.CommandOpen := FieldByName('CommandOpen').AsInteger;
      FData.CommandClose := FieldByName('CommandClose').AsInteger;
      FData.DesireState := FieldByName('DesireState').AsInteger;
      FData.SetPoint := FieldByName('SetPoint').AsInteger;
      FData.ValueValve := FieldByName('ValueValve').AsInteger;

      l.Add(FData);
      Next;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

procedure TIPMSDatabase.GetRS_FACondition(aSessionID: integer;
  var aList: TList);
var
  FQuery : TZQuery;
  query : string;
  faData : TFACond_Data;
begin
  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT * ' +
             'FROM RS_FA_Condition ' +
             'WHERE RUNNING_ID = ' + IntToStr(aSessionID);
    SQL.Add(query);
    Open;

    if RecordCount > 0 then
    begin
      First;

      aList := TList.Create;

      while not Eof do
      begin
        faData := TFACond_Data.Create;
        faData.FA_ID := FieldByName('Running_ID').AsInteger;
        faData.Role := FieldByName('Role').AsString;
        faData.FA_DGSETS_State := FieldByName('FA_DGSETS_State').AsInteger;
        faData.FA_Distribution_State := FieldByName('FA_Distribution_State').AsInteger;
        faData.FA_Propultion_State := FieldByName('FA_Propultion_State').AsInteger;
        faData.FA_Auxiliary_State := FieldByName('FA_Auxiliary_State').AsInteger;
        faData.FA_Fuel_State := FieldByName('FA_Fuel_State').AsInteger;
        faData.FA_Domest_State := FieldByName('FA_Domest_State').AsInteger;
        faData.FA_HVAC_State := FieldByName('FA_HVAC_State').AsInteger;
        faData.FA_FFDC_State := FieldByName('FA_FFDC_State').AsInteger;
        faData.FA_Navigation_State := FieldByName('FA_Navigation_State').AsInteger;
        faData.FA_Ballast_State := FieldByName('FA_Ballast_State').AsInteger;
        faData.FA_IPMS_State := FieldByName('FA_IPMS_State').AsInteger;
        faData.FA_IAS_State := FieldByName('FA_IAS_State').AsInteger;

        aList.Add(faData);
        Next;
      end;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

procedure TIPMSDatabase.GetRS_PCSCondition(aSessionID: integer; var l: TList);
var
  FQuery : TZQuery;
  query  : String;
  FData  : TScenarioPCSCondition;
begin
  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT PCS_NAME, PCS_State, Value,  ' +
             'PCS_ME_Control, PCS_ME_Mode, PCS_ME_EngineRun, PCS_ME_ReadyForUse, ' +
             'PCS_ME_SetpointSpeed, PCS_ME_RemoteAuto, PCS_ME_RemoteManual, PCS_ME_LeverControl, ' +
             'PCS_ME_Alarm, PCS_ME_Failure, PCS_GB_ClutchAllowed, PCS_GB_ClutchEngaged, ' +
             'PCS_GB_ReadyForUse, PCS_GB_RemoteAuto, PCS_GB_RemoteManual, PCS_GB_Failure, ' +
             'PCS_GB_ShaftLocked, PCS_GB_ShaftPowerLimited, PCS_CPP_ReadyForUse, ' +
             'PCS_CPP_SetpointPitch, PCS_CPP_RemoteAuto, PCS_CPP_RemoteManual, PCS_CPP_Failure, ' +
             'PCS_CPP_PumpStandby, PCS_CPP_PumpStart, PCS_CPP_PumpAuto, ' +
             'PCS_PC_StartingInterlocks, PCS_PC_Alarms, PCS_PC_SafetiesStop, ' +
             'PCS_PC_ClutchInterlocks, PCS_PC_CPPFailure ' +
             'FROM RS_PCS_Condition ' +
             'WHERE RUNNING_ID = ' + IntToStr(aSessionID);
    SQL.Add(query);
    Open;

    First;
    l := TList.Create;

    while not EOF do
    begin
      FData := TScenarioPCSCondition.Create;

      FData.PCS_Name := FieldByName('PCS_NAME').AsString;
      FData.PCS_State := FieldByName('PCS_State').AsInteger;
      FData.Value := FieldByName('Value').AsInteger;
      FData.PCS_ME_Control := FieldByName('PCS_ME_Control').AsInteger;
      FData.PCS_ME_Mode := FieldByName('PCS_ME_Mode').AsInteger;
      FData.PCS_ME_EngineRun := FieldByName('PCS_ME_EngineRun').AsInteger;
      FData.PCS_ME_ReadyForUse := FieldByName('PCS_ME_ReadyForUse').AsInteger;
      FData.PCS_ME_SetpointSpeed := FieldByName('PCS_ME_SetpointSpeed').AsFloat;
      FData.PCS_ME_RemoteAuto := FieldByName('PCS_ME_RemoteAuto').AsInteger;
      FData.PCS_ME_RemoteManual := FieldByName('PCS_ME_RemoteManual').AsInteger;
      FData.PCS_ME_LeverControl := FieldByName('PCS_ME_LeverControl').AsInteger;
      FData.PCS_ME_Alarm := FieldByName('PCS_ME_Alarm').AsInteger;
      FData.PCS_ME_Failure := FieldByName('PCS_ME_Failure').AsInteger;
      FData.PCS_GB_ClutchAllowed := FieldByName('PCS_GB_ClutchAllowed').AsInteger;
      FData.PCS_GB_ClutchEngaged := FieldByName('PCS_GB_ClutchEngaged').AsInteger;
      FData.PCS_GB_ReadyForUse := FieldByName('PCS_GB_ReadyForUse').AsInteger;
      FData.PCS_GB_RemoteAuto := FieldByName('PCS_GB_RemoteAuto').AsInteger;
      FData.PCS_GB_RemoteManual := FieldByName('PCS_GB_RemoteManual').AsInteger;
      FData.PCS_GB_Failure := FieldByName('PCS_GB_Failure').AsInteger;
      FData.PCS_GB_ShaftLocked := FieldByName('PCS_GB_ShaftLocked').AsInteger;
      FData.PCS_GB_ShaftPowerLimited := FieldByName('PCS_GB_ShaftPowerLimited').AsInteger;
      FData.PCS_CPP_ReadyForUse := FieldByName('PCS_CPP_ReadyForUse').AsInteger;
      FData.PCS_CPP_SetpointPitch := FieldByName('PCS_CPP_SetpointPitch').AsInteger;
      FData.PCS_CPP_RemoteAuto := FieldByName('PCS_CPP_RemoteAuto').AsInteger;
      FData.PCS_CPP_RemoteManual := FieldByName('PCS_CPP_RemoteManual').AsInteger;
      FData.PCS_CPP_Failure := FieldByName('PCS_CPP_Failure').AsInteger;
      FData.PCS_CPP_PumpStandby := FieldByName('PCS_CPP_PumpStandby').AsString;
      FData.PCS_CPP_PumpStart := FieldByName('PCS_CPP_PumpStart').AsString;
      FData.PCS_CPP_PumpAuto := FieldByName('PCS_CPP_PumpAuto').AsInteger;
      FData.PCS_PC_StartingInterlocks := FieldByName('PCS_PC_StartingInterlocks').AsString;
      FData.PCS_PC_Alarms := FieldByName('PCS_PC_Alarms').AsString;
      FData.PCS_PC_SafetiesStop := FieldByName('PCS_PC_SafetiesStop').AsString;
      FData.PCS_PC_ClutchInterlocks := FieldByName('PCS_PC_ClutchInterlocks').AsString;
      FData.PCS_PC_CPPFailure := FieldByName('PCS_PC_CPPFailure').AsString;

      l.Add(FData);
      Next;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

procedure TIPMSDatabase.GetRS_PMSCondition(aSessionID: integer; var l: TList);
var
  FQuery : TZQuery;
  query : String;
  FData : TScenarioPMSCondition;
begin
  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT PMS_Name, PMS_Type, PMS_Mode, PMS_OnOff, ' +
             'PMS_GenSupplied, PMS_GenState, PMS_CBClosed, PMS_Preference, ' +
             'PMS_Busbar, PMS_RunHours, PMS_EmergencyStop, ' +

             'PMS_NotStandby, PMS_CanBusFailure, PMS_MeasPowFailure, ' +
             'PMS_DCPowFailure, PMS_EngineAlarm, PMS_ShutDown, ' +
             'PMS_FaultPageLed, PMS_FailureCBClosed, PMS_Power, ' +
             'PMS_Power_State, PMS_Frequency, PMS_Frequency_State, ' +
             'PMS_SwitchFrequency, PMS_Current, PMS_Voltage, ' +
             'PMS_Voltage_State, PMS_CosPhi, PMS_U, ' +
             'PMS_V, PMS_W, PMS_SWB_MSBIntrMode, ' +
             'PMS_SWB_ESBIntrMode, PMS_SWB_ShoreIntrMode, ' +

             'PMS_SWB_MsbCBIntr, PMS_SWB_EsbCBIntr, ' +
             'PMS_SWB_MsbCBShore, PMS_SWB_MsbCBNavNaut, PMS_SWB_Busbar, ' +
             'PMS_SWB_TripReduct, PMS_SWB_EmergencyCon, PMS_SWB_Frequency, ' +
             'PMS_SWB_Voltage, PMS_SWB_Power, PMS_SWB_Trafo230Volt, ' +
             'PMS_SWB_Trafo115Volt, PMS_PowerMode, PMS_PowerConsmr, ' +
             'PMS_FirstLoad, PMS_StateRunFull, PMS_StateRunFwd, PMS_StateRunAft ' +
             'FROM RS_PMS_Condition ' +
             'WHERE Running_ID = ' + IntToStr(aSessionID);
    SQL.Add(query);
    Open;

    First;
    l := TList.Create;

    while not EOF do
    begin
      FData := TScenarioPMSCondition.Create;

      FData.PMS_Name := FieldByName('PMS_Name').AsString;
      FData.PMS_Type := FieldByName('PMS_Type').AsInteger;
      FData.PMS_Mode := FieldByName('PMS_Mode').AsInteger;
      FData.PMS_OnOff := FieldByName('PMS_OnOff').AsInteger;
      FData.PMS_GenSupplied := FieldByName('PMS_GenSupplied').AsInteger;
      FData.PMS_GenState := FieldByName('PMS_GenState').AsInteger;
      FData.PMS_CBClosed := FieldByName('PMS_CBClosed').AsInteger;
      FData.PMS_Preference := FieldByName('PMS_Preference').AsInteger;
      FData.PMS_Busbar := FieldByName('PMS_Busbar').AsInteger;
      FData.PMS_RunHours := FieldByName('PMS_RunHours').AsInteger;
      FData.PMS_EmergencyStop := FieldByName('PMS_EmergencyStop').AsInteger;

      FData.PMS_NotStandby := FieldByName('PMS_NotStandby').AsInteger;
      FData.PMS_CanBusFailure := FieldByName('PMS_CanBusFailure').AsInteger;
      FData.PMS_MeasPowFailure := FieldByName('PMS_MeasPowFailure').AsInteger;
      FData.PMS_DCPowFailure := FieldByName('PMS_DCPowFailure').AsInteger;
      FData.PMS_EngineAlarm := FieldByName('PMS_EngineAlarm').AsInteger;
      FData.PMS_ShutDown := FieldByName('PMS_ShutDown').AsInteger;
      FData.PMS_FaultPageLed := FieldByName('PMS_FaultPageLed').AsInteger;
      FData.PMS_FailureCBClosed := FieldByName('PMS_FailureCBClosed').AsInteger;
      FData.PMS_Power := FieldByName('PMS_Power').AsFloat;
      FData.PMS_Power_State := FieldByName('PMS_Power_State').AsFloat;
      FData.PMS_Frequency := FieldByName('PMS_Frequency').AsFloat;
      FData.PMS_Frequency_State := FieldByName('PMS_Frequency_State').AsFloat;
      FData.PMS_SwitchFrequency := FieldByName('PMS_SwitchFrequency').AsFloat;
      FData.PMS_Current := FieldByName('PMS_Current').AsFloat;
      FData.PMS_Voltage := FieldByName('PMS_Voltage').AsFloat;
      FData.PMS_Voltage_State := FieldByName('PMS_Voltage_State').AsFloat;
      FData.PMS_CosPhi := FieldByName('PMS_CosPhi').AsFloat;
      FData.PMS_U := FieldByName('PMS_U').AsFloat;
      FData.PMS_V := FieldByName('PMS_V').AsFloat;
      FData.PMS_W := FieldByName('PMS_W').AsFloat;
      FData.PMS_SWB_MSBIntrMode := FieldByName('PMS_SWB_MSBIntrMode').AsInteger;
      FData.PMS_SWB_ESBIntrMode := FieldByName('PMS_SWB_ESBIntrMode').AsInteger;
      FData.PMS_SWB_ShoreIntrMode := FieldByName('PMS_SWB_ShoreIntrMode').AsInteger;

      FData.PMS_SWB_MsbCBIntr := FieldByName('PMS_SWB_MsbCBIntr').AsInteger;
      FData.PMS_SWB_EsbCBIntr := FieldByName('PMS_SWB_EsbCBIntr').AsInteger;
      FData.PMS_SWB_MsbCBShore := FieldByName('PMS_SWB_MsbCBShore').AsInteger;
      FData.PMS_SWB_MsbCBNavNaut := FieldByName('PMS_SWB_MsbCBNavNaut').AsInteger;
      FData.PMS_SWB_Busbar := FieldByName('PMS_SWB_Busbar').AsInteger;
      FData.PMS_SWB_TripReduct := FieldByName('PMS_SWB_TripReduct').AsInteger;
      FData.PMS_SWB_EmergencyCon := FieldByName('PMS_SWB_EmergencyCon').AsInteger;
      FData.PMS_SWB_Frequency := FieldByName('PMS_SWB_Frequency').AsFloat;
      FData.PMS_SWB_Voltage := FieldByName('PMS_SWB_Voltage').AsFloat;
      FData.PMS_SWB_Power := FieldByName('PMS_SWB_Power').AsFloat;
      FData.PMS_SWB_Trafo230Volt := FieldByName('PMS_SWB_Trafo230Volt').AsFloat;
      FData.PMS_SWB_Trafo115Volt := FieldByName('PMS_SWB_Trafo115Volt').AsFloat;

      FData.PMS_PowerMode := FieldByName('PMS_PowerMode').AsInteger;
      FData.PMS_PowerConsmr := FieldByName('PMS_PowerConsmr').AsFloat;
      FData.PMS_FirstLoad := FieldByName('PMS_FirstLoad').AsInteger;
      FData.PMS_StateRunFull := FieldByName('PMS_StateRunFull').AsInteger;
      FData.PMS_StateRunFwd := FieldByName('PMS_StateRunFwd').AsInteger;
      FData.PMS_StateRunAft := FieldByName('PMS_StateRunAft').AsInteger;
      l.Add(FData);
      Next;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

procedure TIPMSDatabase.GetRS_TanksCondition(aSessionID: integer;
  var aList: TList);
var
  FQuery : TZQuery;
  query : string;
  tankData : TTanksCond_Data;
begin
  aList := nil;
  
  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT * ' +
             'FROM RS_Tanks_Condition ' +
             'WHERE RUNNING_ID = ' + IntToStr(aSessionID);
    SQL.Add(query);
    Open;

    if RecordCount > 0 then
    begin
      First;

      aList := TList.Create;

      while not Eof do
      begin
        tankData := TTanksCond_Data.Create;
        tankData.Tanks_ID := FieldByName('Running_ID').AsInteger;
        tankData.Tanks_ElementID := FieldByName('Tanks_ElementID').AsString;
        tankData.Tanks_Value := FieldByName('Tanks_Value').AsFloat;

        aList.Add(tankData);
        Next;
      end;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.GetScenarioByID(aID: Integer): TScenario_Data;
var
  FQuery : TZQuery;
  query : string;
  i : Integer;
begin
  Result := nil;

  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT * ' +
             'FROM Scenario ' +
             'WHERE Scenario_ID = ' + IntToStr(aID);
    SQL.Add(query);
    Open;

    if RecordCount > 0 then
    begin
      First;

      Result := TScenario_Data.Create;
      Result.ID := FieldByName('Scenario_ID').AsInteger;
      Result.Name := FieldByName('Scenario_Name').AsString;
      Result.Description := FieldByName('Scenario_Description').AsString;

      SQL.Clear;

      query := 'SELECT a.Condition_ID, b.Condition_Type, b.Condition_Name ' +
               'FROM ScenarioCondition a INNER JOIN Condition b ON a.Condition_ID = b.Condition_ID ' +
               'WHERE Scenario_ID = ' + IntToStr(Result.ID);
      SQL.Add(query);
      Open;

      if RecordCount > 0 then
      begin
        First;
        SetLength(Result.ArrConditionID, RecordCount);
        SetLength(Result.ArrConditionType, RecordCount);
        SetLength(Result.ArrConditionName, RecordCount);

        i := 0;

        while not FQuery.Eof do
        begin
          Result.ArrConditionID[i] := FieldByName('Condition_ID').AsInteger;
          Result.ArrConditionType[i] := FieldByName('Condition_Type').AsString;
          Result.ArrConditionName[i] := FieldByName('Condition_Name').AsString;
          Inc(i);

          Next;
        end;
      end;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.GetScenarioByName(aName: String): TScenario_Data;
var
  FQuery : TZQuery;
  query : String;
  i : integer;
begin
  Result := nil;

  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT * ' +
             'FROM Scenario ' +
             'WHERE Scenario_Name = ' + QuotedStr(aName);
    SQL.Add(query);
    Open;

    i := 0;

    if RecordCount > 0 then
    begin
      First;

      Result := TScenario_Data.Create;
      Result.ID := FieldByName('Scenario_ID').AsInteger;
      Result.Name := FieldByName('Scenario_Name').AsString;
      Result.Description := FieldByName('Scenario_Description').AsString;

      Close;
      SQL.Clear;

      query := 'SELECT a.Condition_ID, b.Condition_Type, b.Condition_Name ' +
               'FROM ScenarioCondition a INNER JOIN Condition b ON a.Condition_ID = b.Condition_ID ' +
               'WHERE Scenario_ID = ' + IntToStr(Result.ID);

      SQL.Add(query);
      Open;

      if RecordCount > 0 then
      begin
        First;

        SetLength(Result.ArrConditionID, RecordCount);
        SetLength(Result.ArrConditionType, RecordCount);
        SetLength(Result.ArrConditionName, RecordCount);

        while not Eof do
        begin
          Result.ArrConditionID[i] := FieldByName('Condition_ID').AsInteger;
          Result.ArrConditionType[i] := FieldByName('Condition_Type').AsString;
          Result.ArrConditionName[i] := FieldByName('Condition_Name').AsString;
          Inc(i);

          Next;
        end;
      end;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.GetScenarioConditions(aName: String;aType : string = 'ALL'): TStrings;
var
  FQuery : TZQuery;
  query : String;
begin
  Result := nil;

  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'EXEC sp_initialCondition ' + QuotedStr(aName) +
             ', ' + QuotedStr(aType);
    SQL.Add(query);
    Open;

    First;
    Result := TStringList.Create;

    while not Eof do
    begin
      Result.Add(FieldByName('tInfo').AsString);

      Next;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.GetScenarioDesc(aName: String): String;
var
  FQuery : TZQuery;
  query : String;
begin
  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT Scenario_Description ' +
             'FROM Scenario ' +
             'WHERE Scenario_Name = ' + QuotedStr(aName);
    SQL.Add(query);
    Open;

    First;
    Result := FieldByName('Scenario_Description').AsString;

    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.GetScenarioIDByName(aName: string;
  out aScenarioType: Integer): Integer;
var
  FQuery : TZQuery;
  query : String;
begin
  Result := 0;

  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'EXEC sp_getScenarioID ' + QuotedStr(aName);
    SQL.Add(query);
    Open;

    First;
    Result := FieldByName('ScenarioID').AsInteger;
    aScenarioType := 0; // scenario

    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.GetSession(sessionID: integer): TSession_Data;
var
  FQuery : TZQuery;
  query : string;
begin
  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT r.*, s.SCENARIO_NAME ' +
             'FROM RunningScenario r LEFT JOIN SCENARIO s ON r.SCENARIO_ID = s.SCENARIO_ID ' +
             'WHERE r.RUNNING_ID = ' + IntToStr(sessionID);
    SQL.Add(query);
    Open;

    Result := nil;

    if RecordCount > 0 then
    begin
      First;

      Result := TSession_Data.Create;
      Result.SessionID := FieldByName('Running_ID').AsInteger;
      Result.SessionStart := 0;
      Result.SessionStop := 0;

      if not FieldByName('SCENARIO_NAME').IsNull then
        Result.OriginalScenario := FieldByName('SCENARIO_NAME').AsString
      else
        Result.OriginalScenario := 'NOT FOUND';

      Result.SessionName := 'Session ' + IntToStr(Result.SessionID);

      if not FieldByName('Running_Start').IsNull then
        Result.SessionStart := FieldByName('Running_Start').AsDateTime;

      if not FieldByName('Running_End').IsNull then
        Result.SessionStop := FieldByName('Running_End').AsDateTime;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.GetSession(sessionName: string): TSession_Data;
var
  FQuery : TZQuery;
  query : string;
begin
  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'EXEC sp_getSession 0, ' + QuotedStr(sessionName);
    SQL.Add(query);
    Open;

    Result := nil;

    if RecordCount > 0 then
    begin
      First;

      Result := TSession_Data.Create;
      Result.SessionID := FieldByName('Running_ID').AsInteger;
      Result.SessionStart := 0;
      Result.SessionStop := 0;
      Result.OriginalScenario := FieldByName('ScenarioOrigin').AsString;
      Result.SessionName := FieldByName('Session_Name').AsString;

      if not FieldByName('Running_Start').IsNull then
        Result.SessionStart := FieldByName('Running_Start').AsDateTime;

      if not FieldByName('Running_End').IsNull then
        Result.SessionStop := FieldByName('Running_End').AsDateTime;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

procedure TIPMSDatabase.getValueLogs(TableName, FieldName : string;
  SessionID: Integer; alist: TList);
var
  FQuery : TZQuery;
  query : string;
//  fieldParameter : TIPMS_Record_Parameter;
begin
  if not FConnection.Connected then
    Exit;

  if not Assigned(aList) then
    aList := TList.Create
  else
    aList.Clear;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT [' + FieldName + '_VAL0], timestamp ' +
             'FROM RS_' + TableName +
             ' WHERE RunningID = ' + IntToStr(SessionID);
    SQL.Add(query);
    Open;

    if RecordCount > 0 then
    begin
      First;

      while not Eof do
      begin
        aList.Add(TItemData.Create(FieldByName(FieldName + '_VAL0').AsFloat,
          FieldByName('timestamp').AsDateTime));

        Next;
      end;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

procedure TIPMSDatabase.getValueParameter(const aElementID: string;
  var aList: Tlist);
var
  FQuery : TZQuery;
  query : string;
  fieldParameter : TIPMS_Record_Parameter;
begin
  if not FConnection.Connected then
    Exit;

  if not Assigned(aList) then
    aList := TList.Create
  else
    aList.Clear;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT ParamName, ParamValue, ParamUnit ' +
             'FROM Parameter ' +
             'WHERE ElementID = ' + QuotedStr(aElementID);
    SQL.Add(query);
    Open;

    if RecordCount > 0 then
    begin
      First;

      while not Eof do
      begin
        fieldParameter := TIPMS_Record_Parameter.Create;
        fieldParameter.FElementID := aElementID;
        fieldParameter.FParameterName:= FieldByName('ParamName').AsString;
        fieldParameter.FParameterValue := FieldByName('ParamValue').AsString;
        fieldParameter.FParameterUnit := FieldByName('ParamUnit').AsString;

        aList.Add(fieldParameter);
        Next;
      end;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.LoadMimics(FPairedList: TComponentElement;
  FTableName: string; FScenarioID: Integer): Boolean;
var
  i : Integer;
  pair : TComponentElementPair;
  comp : TIPMSBaseComponent;
  query : string;
  FQuery  : TZQuery;
  mimicID : E_MimicType;
  isfound : Boolean;
begin
  Result := True;

  FQuery  := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    if ContainsStr(FTableName,'RS_') then
      query := 'SELECT * ' +
               'FROM ' + FTableName +
               ' WHERE RUNNING_ID = ' + IntToStr(FScenarioID)
    else
      query := 'SELECT * ' +
               'FROM ' + FTableName +
               ' WHERE SCENARIO_ID = ' + IntToStr(FScenarioID);

    SQL.Add(query);
    Open;

    First;

    while not Eof do
    begin
      pair := FPairedList.GetPair(FieldByName('ElementID').AsString);
      isfound := false;

      for i := 0 to pair.ComponentList.Count - 1 do
      begin
        comp := pair.ComponentList.Items[i];
        mimicID := pair.MimicType[i];

        if (FieldByName('CompClass').AsString = comp.ClassName) and
          (FieldByName('MimicID').AsInteger = Byte(mimicID)) and
          (FieldByName('CompTag').AsInteger = comp.Tag) then
        begin
          if FieldByName('CompClass').AsString = 'TAnalogSensor' then
          begin
            with TAnalogSensor(comp) do
            begin
              DecimalPlace := FieldByName('AS_DecimalPlace').AsInteger;
              UpperLimit   := FieldByName('AS_UpperLimit').AsFloat;
              LowerLimit   := FieldByName('AS_LowerLimit').AsFloat;
              SensorType   := TSensorType(FieldByName('AS_SensorType').AsInteger);
              SensorValue  := FieldByName('AS_SensorValue').AsFloat;
              ShowHead     := FieldByName('AS_ShowHead').AsBoolean;
              Status       := TStatus_AS(FieldByName('AS_Status').AsInteger);
              Style        := TStyle_AS(FieldByName('AS_Style').AsInteger);
            end;
          end
          else if FieldByName('CompClass').AsString = 'TCircuitBreakerElement' then
          begin
            with TCircuitBreakerElement(comp) do
            begin
              ShowAutoHandle  := FieldByName('CBE_ShowAutoHandle').AsBoolean;
              ShowManHandle   := FieldByName('CBE_ShowManHandle').AsBoolean;
              Status          := TStatus_CB(FieldByName('CBE_Status').AsInteger);
              Style           := TStyle_CB(FieldByName('CBE_Style').AsInteger);
            end;
          end
          else if FieldByName('CompClass').AsString = 'TComputer' then
          begin
            with TComputer(comp) do
            begin
              ComputerName    := FieldByName('COM_ComputerName').AsString;
              ComputerType    := TType_PC(FieldByName('COM_ComputerType').AsInteger);
              Status          := TStatus_SW(FieldByName('COM_Status').AsInteger);
            end;
          end
          else if FieldByName('CompClass').AsString = 'TControlElement' then
          begin
            with TControlElement(comp) do
            begin
              Caption         := FieldByName('CE_Caption').AsString;
              Style           := TStyle_CT(FieldByName('CE_Style').AsInteger);
              Status          := TStatus_CT(FieldByName('CE_Status').AsInteger);
            end;
          end
          else if FieldByName('CompClass').AsString = 'THorizontalBar' then
          begin
            with THorizontalBar(comp) do
            begin
              Position        := FieldByName('HB_Position').AsInteger;
              Status          := TStatus_AS(FieldByName('HB_Status').AsInteger);
            end;
          end
          else if FieldByName('CompClass').AsString = 'TMotorControlDoubleSpeed' then
          begin
            with TMotorControlDoubleSpeed(comp) do
            begin
              MotorType       := TType_MD(FieldByName('MCDS_MotorType').AsInteger);
              Status          := TStatus_MD(FieldByName('MCDS_Status').AsInteger);
            end;
          end
          else if FieldByName('CompClass').AsString = 'TMotorControlElement' then
          begin
            with TMotorControlElement(comp) do
            begin
              Face         := TFace_MC(FieldByName('MCE_Face').AsInteger);
              GenType      := TGenType_MC(FieldByName('MCE_GenType').AsInteger);
              SensorType   := TType_MC(FieldByName('MCE_SensorType').AsInteger);
              ShowAutoHandle  := FieldByName('MCE_ShowAutoHandle').AsBoolean;
              ShowManHandle   := FieldByName('MCE_ShowManHandle').AsBoolean;
              Status       := TStatus_MC(FieldByName('MCE_Status').AsInteger);
            end;
          end
          else if FieldByName('CompClass').AsString = 'TMotorControlStandby' then
          begin
            with TMotorControlStandby(comp) do
            begin
              StatusPump    := TStatus_MS(FieldByName('MCS_StatusPump').AsInteger);
            end;
          end
          else if FieldByName('CompClass').AsString = 'TRunningHour' then
          begin
            with TRunningHour(comp) do
            begin
              UpperLimit   := FieldByName('RH_UpperLimit').AsFloat;
              LowerLimit   := FieldByName('RH_LowerLimit').AsFloat;
              SensorType   := TSensorType(FieldByName('RH_SensorType').AsInteger);
              SensorValue  := FieldByName('RH_SensorValue').AsFloat;
              Status       := TStatus_RH(FieldByName('RH_Status').AsInteger);
              Style        := TStyle_RH(FieldByName('RH_Style').AsInteger);
            end;
          end
          else if FieldByName('CompClass').AsString = 'TSetpoint' then
          begin
            with TSetpoint(comp) do
            begin
              UpperLimit   := FieldByName('SP_UpperLimit').AsFloat;
              LowerLimit   := FieldByName('SP_LowerLimit').AsFloat;
              SensorType   := TSensorType(FieldByName('SP_SensorType').AsInteger);
              SensorValue  := FieldByName('SP_SensorValue').AsFloat;
              Status       := TStatus_SP(FieldByName('SP_Status').AsInteger);
              Style        := TStyle_SP(FieldByName('SP_Style').AsInteger);
            end;
          end
          else if FieldByName('CompClass').AsString = 'TSwitchElement' then
          begin
            with TSwitchElement(comp) do
            begin
              Caption         := FieldByName('SWE_Caption').AsString;
              SwitchType      := TType_SW(FieldByName('SWE_SwitchType').AsInteger);
              Status          := TStatus_SW(FieldByName('SWE_Status').AsInteger);
              Size            := TSize_SW(FieldByName('SWE_Size').AsInteger);
            end;
          end
          else if FieldByName('CompClass').AsString = 'TSwitchEvent' then
          begin
            with TSwitchEvent(comp) do
            begin
              UpperLimit   := FieldByName('SE_UpperLimit').AsFloat;
              LowerLimit   := FieldByName('SE_LowerLimit').AsFloat;
              SensorType   := TSensorType(FieldByName('SE_SensorType').AsInteger);
              SensorValue  := FieldByName('SE_SensorValue').AsFloat;
              Status       := TStatus_SE(FieldByName('SE_Status').AsInteger);
              Style        := TStyle_SE(FieldByName('SE_Style').AsInteger);
            end;
          end
          else if FieldByName('CompClass').AsString = 'TSwitchNBCD' then
          begin
            with TSwitchNBCD(comp) do
            begin
              Status       := TStatus_SN(FieldByName('NBCD_Status').AsInteger);
            end;
          end
          else if FieldByName('CompClass').AsString = 'TSwitchTriangle' then
          begin
            with TSwitchTriangle(comp) do
            begin
              Style           := TStyle_SW(FieldByName('ST_Style').AsInteger);
              Status          := TStatus_SW(FieldByName('ST_Status').AsInteger);
              Size            := TSize_SW(FieldByName('ST_Size').AsInteger);
            end;
          end
          else if FieldByName('CompClass').AsString = 'TTankSensor' then
          begin
            with TTankSensor(comp) do
            begin
              UpperLimit   := FieldByName('TS_UpperLimit').AsFloat;
              LowerLimit   := FieldByName('TS_LowerLimit').AsFloat;
              TankValue    := FieldByName('TS_TankValue').AsFloat;
              Status       := TStatus_TS(FieldByName('TS_Status').AsInteger);
            end;
          end
          else if FieldByName('CompClass').AsString = 'TValveControl' then
          begin
            with TValveControl(comp) do
            begin
              Style           := TStyle_VC(FieldByName('VC_Style').AsInteger);
              ValveType       := TType_VC(FieldByName('VC_ValveType').AsInteger);
              ShowAutoHandle  := FieldByName('VC_ShowAutoHandle').AsBoolean;
              ShowManHandle   := FieldByName('VC_ShowManHandle').AsBoolean;
              Status          := TStatus_VC(FieldByName('VC_Status').AsInteger);
            end;
          end
          else if FieldByName('CompClass').AsString = 'TValveProportionally' then
          begin
            with TValveProportionally(comp) do
            begin
              SensorValue  := FieldByName('VP_SensorValue').AsFloat;
              Status       := TStatus_VP(FieldByName('VP_Status').AsInteger);
            end;
          end
          else if FieldByName('CompClass').AsString = 'TVerticalBar' then
          begin
            with TVerticalBar(comp) do
            begin
              Temperature  := FieldByName('VB_Temperature').AsInteger;
              Status       := TStatus_AS(FieldByName('VB_Status').AsInteger);
            end;
          end;

          isfound := True;
        end;

        if isfound then
          Break;
      end;

      Next;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.Logger(SessionID: Integer; LogTime: TDateTime;
  Identifier, Value, Category: string): Boolean;
var
  FQuery : TZQuery;
  query : string;
begin
  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := Connection;
    SQL.Clear;

    query := 'INSERT INTO LOGGER Values(:Session,:Time,:Ident,:Value,:Category)' ;
    SQL.Add(query);

    ParamByName('Session').Value := SessionID;
    ParamByName('Time').Value := LogTime;
    ParamByName('Ident').Value := Identifier;
    ParamByName('Value').Value := Value;
    ParamByName('Category').Value := Category;

    try
      ExecSQL;
      Result := True;
    finally
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.SaveAlarm(aRunngingID: Integer; aTime: TDateTime;
  aSeqNumber: Integer; alarmID, alarmClass, aResource, aLogged, aRefer,
  aPrevState, aLogAct, aFinalState, alarm_msg: string;
  aGeneratTime: TDateTime): Boolean;
var
  FQuery : TZQuery;
  query : string;
begin
  Result := False;

  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'INSERT INTO RS_ALARM_LOG(Running_ID, timestamp, sequence_number ,alarm_id,' +
             'alarm_class, resource, logged_by, reference, prev_state,   ' +
             'log_action, final_state, alarm_message, generation_time)   ' +
             'VALUES(' + IntToStr(aRunngingID)    + ', '
                     + QuotedStr(DateTimeToStr(aTime))  + ', '
                     + IntToStr(aSeqNumber)    + ', '
                     + QuotedStr(alarmID)      + ', '
                     + QuotedStr(alarmClass)   + ', '
                     + QuotedStr(aResource)    + ', '
                     + QuotedStr(aLogged)      + ', '
                     + QuotedStr(aRefer)       + ', '
                     + QuotedStr(aPrevState)   + ', '
                     + QuotedStr(aLogAct)      + ', '
                     + QuotedStr(aFinalState)  + ', '
                     + QuotedStr(alarm_msg)    + ', '
                     + QuotedStr(DateTimeToStr(aGeneratTime)) + ')';
    SQL.Add(query);

    try
      ExecSQL;
    except
      on E:Exception do
      begin
        if Assigned(FOnExceptionMessage) then
          FOnExceptionMessage(E.Message);
      end;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.SaveAlarm(aRunngingID: Integer; elementID: String;
  aTime: TDateTime; alarmID, alarmClass, aResource,
  aLogged, aRefer, aPrevState, aLogAct, aFinalState, alarm_msg: string;
  aGeneratTime: TDateTime): Boolean;
var
  FQuery : TZQuery;
  query : string;
begin
  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'EXEC sp_SaveAlarm2 :runningID, :elementID, ' +
    	':timestm, :alarm_id , :alarm_class, ' +
	    ':res, :logged_by, :reference, :prev_state, ' +
      ':log_action, :final_state, :alarm_message, :generation_time' ;

    SQL.Add(query);

    ParamByName('runningID').Value := aRunngingID;
    ParamByName('elementID').Value := elementID;
    ParamByName('timestm').Value := aTime;
    ParamByName('alarm_id').Value := alarmID;

    ParamByName('alarm_class').Value := alarmClass;
    ParamByName('res').Value := aResource;
    ParamByName('logged_by').Value := aLogged;
    ParamByName('reference').Value := aRefer;
    ParamByName('prev_state').Value := aPrevState;

    ParamByName('log_action').Value := aLogAct;
    ParamByName('final_state').Value := aFinalState;
    ParamByName('alarm_message').Value := alarm_msg;
    ParamByName('generation_time').Value := aGeneratTime;

    try
      ExecSQL;
    finally
      SQL.Clear;
      Params.Clear;
      Close;
    end;

    Connection := nil;
  end;
  FreeAndNil(FQuery);
end;

function TIPMSDatabase.SaveAlarm2(aRunngingID: Integer;
  aTime: TDateTime; alarmID, alarmClass, aResource, aLogged, aRefer, aPrevState,
  aLogAct, aFinalState, alarm_msg: string; aGeneratTime: TDateTime): Boolean;
var
  FQuery : TZQuery;
  query : string;
  seqNumber : Integer;
begin
  Result := False;

  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    GetMaxSeqNumber(seqNumber,aRunngingID);
    seqNumber := seqNumber + 1;

    query := 'INSERT INTO RS_ALARM_LOG(Running_ID, timestamp, sequence_number ,alarm_id,' +
             'alarm_class, resource, logged_by, reference, prev_state,   ' +
             'log_action, final_state, alarm_message, generation_time)   ' +
             'VALUES(' + IntToStr(aRunngingID)    + ', '
                     + QuotedStr(DateTimeToStr(aTime))  + ', '
                     + IntToStr(seqNumber)    + ', '
                     + QuotedStr(alarmID)      + ', '
                     + QuotedStr(alarmClass)   + ', '
                     + QuotedStr(aResource)    + ', '
                     + QuotedStr(aLogged)      + ', '
                     + QuotedStr(aRefer)       + ', '
                     + QuotedStr(aPrevState)   + ', '
                     + QuotedStr(aLogAct)      + ', '
                     + QuotedStr(aFinalState)  + ', '
                     + QuotedStr(alarm_msg)    + ', '
                     + QuotedStr(DateTimeToStr(aGeneratTime)) + ')';
    SQL.Add(query);

    try
      ExecSQL;
    except
      on E:Exception do
      begin
        if Assigned(FOnExceptionMessage) then
          FOnExceptionMessage(E.Message);
      end;
    end;


    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.SaveCommands(aRunningID: Integer; aDateTime: TDateTime;
  aPointID, aVAL: string): Boolean;
var
  FQuery : TZQuery;
  query : string;
begin
  Result := False;

  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'INSERT INTO RS_COMMANDS(Running_ID,timestamp, point_id, _VAL) ' +
             'VALUES('+ QuotedStr(IntToStr(aRunningID))  + ', '
                      + QuotedStr(DateTimeToStr(aDateTime))  + ', '
                      + QuotedStr(aPointID) + ', '
                      + QuotedStr(aVAL)     + ')';
    SQL.Add(query);

    try
      ExecSQL;
    except
      on E:Exception do
      begin
        if Assigned(FOnExceptionMessage) then
          FOnExceptionMessage(E.Message);
      end;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.SaveConditionScenario(aScenarioID: Integer): Integer;
begin
  Result := 0;
end;

function TIPMSDatabase.SaveElementCondition(aIsNew: Boolean; aName: string;
  aList: TList;var ConditionID : integer): Boolean;
var
  i, condID : Integer;
  elmtCondition : TElementCondition;
  FQuery : TZQuery;
  query : string;
begin
  Result := False;

  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;

    if aIsNew then
    begin
      SQL.Clear;
      condID := GetFreeConditionID;
      ConditionID := condID;

      query := 'INSERT INTO Condition(Condition_ID, Condition_Name, Condition_Type) ' +
               'VALUES(' + IntToStr(condID) + ', '
                         + QuotedStr(aName) + ', '
                         + QuotedStr('ELEMENT') + ')';

      SQL.Add(query);
      ExecSQL;

      for i := 0 to aList.Count - 1 do
      begin
        SQL.Clear;

        elmtCondition := TElementCondition(aList.Items[i]);

        with elmtCondition do
          query := 'INSERT INTO ConditionElement ' +
                   'VALUES(' +
                      IntToStr(condID) + ',' +
                      QuotedStr(Element_ID) + ',' +
                      IntToStr(StateElementDisabled) + ',' +
                      FloatToStr(ValueApplication) + ',' +
                      IntToStr(StateValid) + ',' +
                      IntToStr(StateWireBreak) + ',' +
                      IntToStr(StateDisplayStationary) + ',' +
                      IntToStr(StateAlarmInhibited) + ',' +
                      IntToStr(StateStatus) + ',' +
                      IntToStr(StateCommandClose) + ',' +
                      IntToStr(StateCommandOpen) + ',' +
                      IntToStr(StateManualAuto) + ',' +
                      IntToStr(StateCommandCloseApp) + ',' +
                      IntToStr(StateCommandOpenApp) + ',' +
                      IntToStr(StateCommandCloseHMI) + ',' +
                      IntToStr(StateCommandOpenHMI) + ',' +
                      IntToStr(StateRFC) + ',' +
                      IntToStr(StateRFO) + ',' +
                      IntToStr(StateSwitchClosed) + ',' +
                      IntToStr(StateSwitchOpen) + ',' +
                      IntToStr(StateSwitchRemote) + ',' +
                      IntToStr(StateSwitchTripped) + ',' +
                      IntToStr(StateSwitchNoFault) + ',' +
                      IntToStr(StatePMSSwitchClosedOpen) + ',' +
                      IntToStr(StateNoFault) + ',' +
                      IntToStr(StateNoRFU) + ',' +
                      IntToStr(StateTransition) + ',' +
                      IntToStr(ProcesStatus) + ',' +
                      IntToStr(CommandHMI) + ',' +
                      IntToStr(Command) + ',' +
                      IntToStr(State) + ',' +
                      IntToStr(StateElementCaption) + ',' +
                      IntToStr(StateSwitchSpeed1) + ',' +
                      IntToStr(StateSwitchSpeed2) + ',' +
                      IntToStr(CommandStartSpeed1App) + ',' +
                      IntToStr(CommandStartSpeed2App) + ',' +
                      IntToStr(CommandStopApp) + ',' +
                      IntToStr(CommandStartSpeed1HMI) + ',' +
                      IntToStr(CommandStartSpeed2HMI) + ',' +
                      IntToStr(CommandStopHMI) + ',' +
                      IntToStr(StateBlockOut) + ',' +
                      IntToStr(StateRestart) + ',' +
                      IntToStr(StateValueValid) + ',' +
                      IntToStr(RFU) + ',' +
                      IntToStr(RunCondition) + ',' +
                      IntToStr(CommandStartApp) + ',' +
                      IntToStr(CommandStartHMI) + ',' +
                      IntToStr(StateRFU) + ',' +
                      IntToStr(StateSwitchRunning) + ',' +
                      IntToStr(StateSwitchStandby) + ',' +
                      IntToStr(CommandStandbyApp) + ',' +
                      IntToStr(CommandStandbyHMI) + ',' +
                      IntToStr(StateSwitchRFU) + ',' +
                      IntToStr(StateRunCondition) + ',' +
                      IntToStr(CommandReset) + ',' +
                      IntToStr(EnableCounting) + ',' +
                      IntToStr(StateLA) + ',' +
                      IntToStr(StateHA) + ',' +
                      IntToStr(StateHHA) + ',' +
                      IntToStr(EventInput) + ',' +
                      FloatToStr(SensorValue) + ',' +
                      IntToStr(CommandEnableDisable) + ',' +
                      IntToStr(HMISetPoint) + ',' +
                      FloatToStr(ValueSensor) + ',' +
                      FloatToStr(TrimValue) + ',' +
                      FloatToStr(CompensationSensor) + ',' +
                      IntToStr(InState) + ',' +
                      IntToStr(Mode) + ',' +
                      IntToStr(Evaluate) + ',' +
                      IntToStr(StateSwitch) + ',' +
                      IntToStr(StateAutoManual) + ',' +
                      IntToStr(CommandOpen) + ',' +
                      IntToStr(CommandClose) + ',' +
                      IntToStr(DesireState) + ',' +
                      IntToStr(SetPoint) + ',' +
                      IntToStr(ValueValve) +
                   ')';

        SQL.Add(query);
        ExecSQL;
      end;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.SaveElements(elementList: TList; aScenarioID: integer;
  asRunningScenario: Boolean = True): Boolean;
var
  i : Integer;
  elmtCondition : TElementCondition;
  FQuery : TZQuery;
  query : string;
begin
  Result := False;

  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;

    if asRunningScenario then
    begin
      SQL.Clear;
      query := 'DELETE FROM RS_CONDITIONELEMENT ' +
               'WHERE RUNNING_ID = ' + IntToStr(aScenarioID) + ';';
      SQL.Add(query);
      ExecSQL;

      for i := 0 to elementList.Count - 1 do
      begin
        elmtCondition := TElementCondition(elementList.Items[i]);

        SQL.Clear;
        with elmtCondition do
          query := 'INSERT INTO RS_ConditionElement ' +
                   'VALUES(' +
                      IntToStr(aScenarioID) + ',' +
                      QuotedStr(Element_ID) + ',' +
                      IntToStr(StateElementDisabled) + ',' +
                      FloatToStr(ValueApplication) + ',' +
                      IntToStr(StateValid) + ',' +
                      IntToStr(StateWireBreak) + ',' +
                      IntToStr(StateDisplayStationary) + ',' +
                      IntToStr(StateAlarmInhibited) + ',' +
                      IntToStr(StateStatus) + ',' +
                      IntToStr(StateCommandClose) + ',' +
                      IntToStr(StateCommandOpen) + ',' +
                      IntToStr(StateManualAuto) + ',' +
                      IntToStr(StateCommandCloseApp) + ',' +
                      IntToStr(StateCommandOpenApp) + ',' +
                      IntToStr(StateCommandCloseHMI) + ',' +
                      IntToStr(StateCommandOpenHMI) + ',' +
                      IntToStr(StateRFC) + ',' +
                      IntToStr(StateRFO) + ',' +
                      IntToStr(StateSwitchClosed) + ',' +
                      IntToStr(StateSwitchOpen) + ',' +
                      IntToStr(StateSwitchRemote) + ',' +
                      IntToStr(StateSwitchTripped) + ',' +
                      IntToStr(StateSwitchNoFault) + ',' +
                      IntToStr(StatePMSSwitchClosedOpen) + ',' +
                      IntToStr(StateNoFault) + ',' +
                      IntToStr(StateNoRFU) + ',' +
                      IntToStr(StateTransition) + ',' +
                      IntToStr(ProcesStatus) + ',' +
                      IntToStr(CommandHMI) + ',' +
                      IntToStr(Command) + ',' +
                      IntToStr(State) + ',' +
                      IntToStr(StateElementCaption) + ',' +
                      IntToStr(StateSwitchSpeed1) + ',' +
                      IntToStr(StateSwitchSpeed2) + ',' +
                      IntToStr(CommandStartSpeed1App) + ',' +
                      IntToStr(CommandStartSpeed2App) + ',' +
                      IntToStr(CommandStopApp) + ',' +
                      IntToStr(CommandStartSpeed1HMI) + ',' +
                      IntToStr(CommandStartSpeed2HMI) + ',' +
                      IntToStr(CommandStopHMI) + ',' +
                      IntToStr(StateBlockOut) + ',' +
                      IntToStr(StateRestart) + ',' +
                      IntToStr(StateValueValid) + ',' +
                      IntToStr(RFU) + ',' +
                      IntToStr(RunCondition) + ',' +
                      IntToStr(CommandStartApp) + ',' +
                      IntToStr(CommandStartHMI) + ',' +
                      IntToStr(StateRFU) + ',' +
                      IntToStr(StateSwitchRunning) + ',' +
                      IntToStr(StateSwitchStandby) + ',' +
                      IntToStr(CommandStandbyApp) + ',' +
                      IntToStr(CommandStandbyHMI) + ',' +
                      IntToStr(StateSwitchRFU) + ',' +
                      IntToStr(StateRunCondition) + ',' +
                      IntToStr(CommandReset) + ',' +
                      IntToStr(EnableCounting) + ',' +
                      IntToStr(StateLA) + ',' +
                      IntToStr(StateHA) + ',' +
                      IntToStr(StateHHA) + ',' +
                      IntToStr(EventInput) + ',' +
                      FloatToStr(SensorValue) + ',' +
                      IntToStr(CommandEnableDisable) + ',' +
                      IntToStr(HMISetPoint) + ',' +
                      FloatToStr(ValueSensor) + ',' +
                      FloatToStr(TrimValue) + ',' +
                      FloatToStr(CompensationSensor) + ',' +
                      IntToStr(InState) + ',' +
                      IntToStr(Mode) + ',' +
                      IntToStr(Evaluate) + ',' +
                      IntToStr(StateSwitch) + ',' +
                      IntToStr(StateAutoManual) + ',' +
                      IntToStr(CommandOpen) + ',' +
                      IntToStr(CommandClose) + ',' +
                      IntToStr(DesireState) + ',' +
                      IntToStr(SetPoint) + ',' +
                      IntToStr(ValueValve) +
                   ');';

        SQL.Add(query);
        ExecSQL;
      end;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.SaveFACondition(aIsNew: Boolean; aName: string;
  aList: TList; var ConditionID: Integer): Boolean;
var
  FQuery : TZQuery;
  condID, i : Integer;
  query : string;
  faData : TFACond_Data;
begin
  Result := False;

  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    if aIsNew then
    begin
      condID := GetFreeConditionID;
      ConditionID := condID;

      query := 'INSERT INTO Condition(Condition_ID, Condition_Name, Condition_Type) ' +
               'VALUES(' + IntToStr(condID) + ', '
                         + QuotedStr(aName) + ', '
                         + QuotedStr('FA') + ')';
      SQL.Add(query);
      ExecSQL;

      for i := 0 to aList.Count - 1 do
      begin
        SQL.Clear;

        faData := TFACond_Data(aList.Items[i]);

        query := 'INSERT INTO FA_Condition(FA_ID, Role, FA_DGSETS_State, ' +
                 'FA_Distribution_State, FA_Propultion_State, ' +
                 'FA_Auxiliary_State, FA_Fuel_State, FA_Domest_State, ' +
                 'FA_HVAC_State, FA_FFDC_State, FA_Navigation_State, ' +
                 'FA_Ballast_State, FA_IPMS_State, FA_IAS_State, ' +
                 'Condition_ID) ' +
                 'VALUES(' + IntToStr(GetFreeFACondID) +
                 ', ' + QuotedStr(faData.Role) +
                 ', ' + IntToStr(faData.FA_DGSETS_State) +
                 ', ' + IntToStr(faData.FA_Distribution_State) +
                 ', ' + IntToStr(faData.FA_Propultion_State) +
                 ', ' + IntToStr(faData.FA_Auxiliary_State) +
                 ', ' + IntToStr(faData.FA_Fuel_State) +
                 ', ' + IntToStr(faData.FA_Domest_State) +
                 ', ' + IntToStr(faData.FA_HVAC_State) +
                 ', ' + IntToStr(faData.FA_FFDC_State) +
                 ', ' + IntToStr(faData.FA_Navigation_State) +
                 ', ' + IntToStr(faData.FA_Ballast_State) +
                 ', ' + IntToStr(faData.FA_IPMS_State) +
                 ', ' + IntToStr(faData.FA_IAS_State) +
                 ', ' + IntToStr(condID) + ')';

        SQL.Add(query);
        ExecSQL;
      end;
    end
    else
    begin
      query := 'UPDATE Condition ' +
               'SET Condition_Name = ' + QuotedStr(aName) +
               ' WHERE Condition_Name = ' + QuotedStr(aName);
      SQL.Add(query);
      ExecSQL;

      for i := 0 to aList.Count - 1 do
      begin
        SQL.Clear;

        faData := TFACond_Data(aList.Items[i]);

        query := 'UPDATE FA_Condition ' +
                 'SET Role = ' + QuotedStr(faData.Role) +
                 ', FA_DGSETS_State = ' + IntToStr(faData.FA_DGSETS_State) +
                 ', FA_Distribution_State = ' + IntToStr(faData.FA_Distribution_State) +
                 ', FA_Propultion_State = ' + IntToStr(faData.FA_Propultion_State) +
                 ', FA_Auxiliary_State = ' + IntToStr(faData.FA_Auxiliary_State) +
                 ', FA_Fuel_State = ' + IntToStr(faData.FA_Fuel_State) +
                 ', FA_Domest_State = ' + IntToStr(faData.FA_Domest_State) +
                 ', FA_HVAC_State = ' + IntToStr(faData.FA_HVAC_State) +
                 ', FA_FFDC_State = ' + IntToStr(faData.FA_FFDC_State) +
                 ', FA_Navigation_State = ' + IntToStr(faData.FA_Navigation_State) +
                 ', FA_Ballast_State = ' + IntToStr(faData.FA_Ballast_State) +
                 ', FA_IPMS_State = ' + IntToStr(faData.FA_IPMS_State) +
                 ', FA_IAS_State = ' + IntToStr(faData.FA_IAS_State) +
                 ' WHERE Condition_ID = ' + IntToStr(faData.Condition_ID) +
                 ' AND FA_ID = ' + IntToStr(faData.FA_ID);

        SQL.Add(query);
        ExecSQL;
      end;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

procedure TIPMSDatabase.SaveLog(aQuery: String);
var
  FQuery  : TZQuery;
begin
  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    SQL.Add(aQuery);

    try
      ExecSQL;
    except on E:Exception do

    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

procedure TIPMSDatabase.SaveLog(aQuery: array of String);
var
  FQuery  : TZQuery;
  i : integer;
begin
  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    for i := 0 to Length(aQuery) - 1 do
    begin
      try
        SQL.Clear;
        SQL.Add(aQuery[i] + ';');
        ExecSQL;
      finally

      end;
    end;

    Close;
    try
      Connection := nil;
    finally
      Free;
    end;
  end;
end;

function TIPMSDatabase.SaveMimics(FPairedList: TComponentElement;
  FTableName: string; FScenarioID: Integer): Boolean;
  function BooleanToBitStr(Value: Boolean): string;
  begin
    if Value then
      Result := '1'
    else
      Result := '0';
  end;
var
  i,j : Integer;
  pair : TComponentElementPair;
  comp : TIPMSBaseComponent;
  val, query: string;
  FQuery  : TZQuery;
  mimicID : E_MimicType;
begin
  FQuery  := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    if ContainsStr(FTableName,'RS_') then
      query := 'DELETE FROM ' + FTableName +
               ' WHERE RUNNING_ID = ' + IntToStr(FScenarioID)
    else
      query := 'DELETE FROM ' + FTableName +
               ' WHERE SCENARIO_ID = ' + IntToStr(FScenarioID);

    SQL.Add(query);
    ExecSQL;
    Free;
  end;

  FQuery  := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;

    for i := 0 to FPairedList.PairCount - 1 do
    begin
      Application.ProcessMessages;
      pair :=FPairedList.GetPair(i);

      for j := 0 to pair.ComponentList.Count - 1 do
      begin
        SQL.Clear;

        if ContainsStr(FTableName,'RS_') then
          query := 'INSERT INTO ' + FTableName + '([Running_ID], ' +
                   '[ElementID], [MimicID], [CompTag],[CompClass],[StatusStr]'
        else
          query := 'INSERT INTO ' + FTableName + '([Scenario_ID], ' +
                   '[ElementID], [MimicID], [CompTag],[CompClass],[StatusStr]';

        comp := pair.ComponentList.Items[j];
        mimicID := pair.MimicType[j];

        val := IntToStr(FScenarioID) + ', ' +
               QuotedStr(pair.ElementID) + ', ' +
               IntToStr(Byte(mimicID)) + ', ' +
               IntToStr(comp.Tag) + ', ' +
               QuotedStr(comp.ClassName) + ',' +
               QuotedStr(comp.StatusStr) ;

        if comp.ClassType = TAnalogSensor then
        begin
          query := query + ',[AS_DecimalPlace], [AS_UpperLimit], ' +
                   '[AS_LowerLimit], [AS_SensorType], [AS_SensorValue], ' +
                   '[AS_ShowHead], [AS_Status], [AS_Style]) ' +
                   'VALUES (' + val + ', ' +
                   IntToStr(TAnalogSensor(comp).DecimalPlace) + ', ' +
                   FloatToStr(TAnalogSensor(comp).UpperLimit) + ', ' +
                   FloatToStr(TAnalogSensor(comp).LowerLimit) + ', ' +
                   IntToStr(Byte(TAnalogSensor(comp).SensorType)) + ', ' +
                   FloatToStr(TAnalogSensor(comp).SensorValue) + ', ' +
                   BooleanToBitStr(TAnalogSensor(comp).ShowHead) + ', ' +
                   IntToStr(Byte(TAnalogSensor(comp).Status)) + ', ' +
                   IntToStr(Byte(TAnalogSensor(comp).Style)) + ')';
          SQL.Add(query);
        end
        else if comp.ClassType = TCircuitBreakerElement then
        begin
          query := query + ', [CBE_ShowAutoHandle], [CBE_ShowManHandle], '+
                   '[CBE_Status], [CBE_Style]) ' +
                   'VALUES (' + val + ', ' +
                   BooleanToBitStr(TCircuitBreakerElement(comp).ShowAutoHandle) + ', ' +
                   BooleanToBitStr(TCircuitBreakerElement(comp).ShowManHandle) + ', ' +
                   IntToStr(Byte(TCircuitBreakerElement(comp).Status)) + ', ' +
                   IntToStr(Byte(TCircuitBreakerElement(comp).Style)) + ')';
          SQL.Add(query);
        end
        else if comp.ClassType = TComputer then
        begin
          query := query + ', [COM_ComputerName], [COM_ComputerType], ' +
                   '[COM_Status]) VALUES (' + val + ', ' +
                   QuotedStr(TComputer(comp).ComputerName) + ', ' +
                   IntToStr(Byte(TComputer(comp).ComputerType)) + ', ' +
                   IntToStr(Byte(TComputer(comp).Status)) + ')' ;
          SQL.Add(query);
        end
        else if comp.ClassType = TControlElement then
        begin
          query := query + ',[CE_Caption],[CE_Status],[CE_Style] '+
                   ') VALUES (' + val + ',' +
                  QuotedStr(TControlElement(comp).Caption) + ',' +
                  IntToStr(Byte(TControlElement(comp).Status)) + ',' +
                  IntToStr(Byte(TControlElement(comp).Style)) + ')' ;
          SQL.Add(query);
        end
        else if comp.ClassType = THorizontalBar then
        begin
          query := query + ',[HB_Position],[HB_Status] '+
                   ') VALUES (' + val + ',' +
                  IntToStr(THorizontalBar(comp).Position) + ',' +
                  IntToStr(Byte(THorizontalBar(comp).Status)) + ')' ;
          SQL.Add(query);
        end
        else if comp.ClassType = TMotorControlDoubleSpeed then
        begin
          query := query + ',[MCDS_MotorType],[MCDS_Status] '+
                   ') VALUES (' + val + ',' +
                  IntToStr(Byte(TMotorControlDoubleSpeed(comp).MotorType)) + ',' +
                  IntToStr(Byte(TMotorControlDoubleSpeed(comp).Status)) + ')' ;
          SQL.Add(query);
        end
        else if comp.ClassType = TMotorControlElement then
        begin
          query := query + ',[MCE_Face],[MCE_GenType],[MCE_SensorType],'+
                   '[MCE_ShowAutoHandle],[MCE_ShowManHandle],[MCE_Status]'+
                   ') VALUES (' + val + ',' +
                  IntToStr(Byte(TMotorControlElement(comp).Face)) + ',' +
                  IntToStr(Byte(TMotorControlElement(comp).GenType)) + ',' +
                  IntToStr(Byte(TMotorControlElement(comp).SensorType)) + ',' +
                  BooleanToBitStr(TMotorControlElement(comp).ShowAutoHandle) + ',' +
                  BooleanToBitStr(TMotorControlElement(comp).ShowManHandle) + ',' +
                  IntToStr(Byte(TMotorControlElement(comp).Status)) + ')' ;
          SQL.Add(query);
        end
        else if comp.ClassType = TMotorControlStandby then
        begin
          query := query + ',[MCS_StatusPump]) VALUES (' + val + ',' +
                  IntToStr(Byte(TMotorControlStandby(comp).StatusPump)) + ')' ;
          SQL.Add(query);
        end
        else if comp.ClassType = TRunningHour then
        begin
          query := query + ',[RH_UpperLimit],[RH_LowerLimit],[RH_SensorType],[RH_SensorValue],[RH_Status],[RH_Style]'+
                   ') VALUES (' + val + ',' +
                  FloatToStr(TRunningHour(comp).UpperLimit) + ',' +
                  FloatToStr(TRunningHour(comp).LowerLimit) + ',' +
                  IntToStr(Byte(TRunningHour(comp).SensorType)) + ',' +
                  FloatToStr(TRunningHour(comp).SensorValue) + ',' +
                  IntToStr(Byte(TRunningHour(comp).Status)) + ',' +
                  IntToStr(Byte(TRunningHour(comp).Style)) + ')' ;
          SQL.Add(query);
        end
        else if comp.ClassType = TSetpoint then
        begin
          query := query + ',[SP_UpperLimit],[SP_LowerLimit],[SP_SensorType],[SP_SensorValue],[SP_Status],[SP_Style]'+
                   ') VALUES (' + val + ',' +
                  FloatToStr(TSetpoint(comp).UpperLimit) + ',' +
                  FloatToStr(TSetpoint(comp).LowerLimit) + ',' +
                  IntToStr(Byte(TSetpoint(comp).SensorType)) + ',' +
                  FloatToStr(TSetpoint(comp).SensorValue) + ',' +
                  IntToStr(Byte(TSetpoint(comp).Status)) + ',' +
                  IntToStr(Byte(TSetpoint(comp).Style)) + ')' ;
          SQL.Add(query);
        end
        else if comp.ClassType = TSwitchElement then
        begin
          query := query + ',[SWE_Caption],[SWE_Size],[SWE_Status],[SWE_SwitchType]'+
                   ') VALUES (' + val + ',' +
                  QuotedStr(TSwitchElement(comp).Caption) + ',' +
                  IntToStr(Byte(TSwitchElement(comp).Size)) + ',' +
                  IntToStr(Byte(TSwitchElement(comp).Status)) + ',' +
                  IntToStr(Byte(TSwitchElement(comp).SwitchType)) + ')' ;
          SQL.Add(query);
        end
        else if comp.ClassType = TSwitchEvent then
        begin
          query := query + ',[SE_UpperLimit],[SE_LowerLimit],[SE_SensorType],[SE_SensorValue],[SE_Status],[SE_Style]'+
                   ') VALUES (' + val + ',' +
                  FloatToStr(TSwitchEvent(comp).UpperLimit) + ',' +
                  FloatToStr(TSwitchEvent(comp).LowerLimit) + ',' +
                  IntToStr(Byte(TSwitchEvent(comp).SensorType)) + ',' +
                  FloatToStr(TSwitchEvent(comp).SensorValue) + ',' +
                  IntToStr(Byte(TSwitchEvent(comp).Status)) + ',' +
                  IntToStr(Byte(TSwitchEvent(comp).Style)) + ')' ;
          SQL.Add(query);
        end
        else if comp.ClassType = TSwitchNBCD then
        begin
          query := query + ',[NBCD_Status]) VALUES (' + val + ',' +
                  IntToStr(Byte(TSwitchNBCD(comp).Status)) + ')' ;
          SQL.Add(query);
        end
        else if comp.ClassType = TSwitchTriangle then
        begin
          query := query + ',[ST_Size],[ST_Status],[ST_Style]'+
                   ') VALUES (' + val + ',' +
                  IntToStr(Byte(TSwitchTriangle(comp).Size)) + ',' +
                  IntToStr(Byte(TSwitchTriangle(comp).Status)) + ',' +
                  IntToStr(Byte(TSwitchTriangle(comp).Style)) + ')' ;
          SQL.Add(query);
        end
        else if comp.ClassType = TTankSensor then
        begin
          query := query + ',[TS_Status],[TS_UpperLimit],[TS_LowerLimit],[TS_TankValue]'+
                   ') VALUES (' + val + ',' +
                  IntToStr(Byte(TTankSensor(comp).Status)) + ',' +
                  FloatToStr(TTankSensor(comp).UpperLimit) + ',' +
                  FloatToStr(TTankSensor(comp).LowerLimit) + ',' +
                  FloatToStr(TTankSensor(comp).TankValue) + ')' ;
          SQL.Add(query);
        end
        else if comp.ClassType = TValveControl then
        begin
          query := query + ',[VC_ShowAutoHandle],[VC_ShowManHandle],[VC_Status],[VC_Style],[VC_ValveType]'+
                   ') VALUES (' + val + ',' +
                  BooleanToBitStr(TValveControl(comp).ShowAutoHandle) + ',' +
                  BooleanToBitStr(TValveControl(comp).ShowManHandle) + ',' +
                  IntToStr(Byte(TValveControl(comp).Status)) + ',' +
                  IntToStr(Byte(TValveControl(comp).Style)) + ',' +
                  IntToStr(Byte(TValveControl(comp).ValveType)) + ')' ;
          SQL.Add(query);
        end
        else if comp.ClassType = TValveProportionally then
        begin
          query := query + ',[VP_Status],[VP_SensorValue]'+
                   ') VALUES (' + val + ',' +
                  IntToStr(Byte(TValveProportionally(comp).Status)) + ',' +
                  FloatToStr(TValveProportionally(comp).SensorValue) + ')' ;
          SQL.Add(query);
        end
        else if comp.ClassType = TVerticalBar then
        begin
          query := query + ',[VB_Status],[VB_Temperature]'+
                   ') VALUES (' + val + ',' +
                  IntToStr(Byte(TVerticalBar(comp).Status)) + ',' +
                  IntToStr(TVerticalBar(comp).Temperature) + ')' ;
          SQL.Add(query);
        end
      end;

      try
        ExecSQL;
      except

      end;
    end;

    Free;
  end;
end;

function TIPMSDatabase.SaveTanksCondition(aIsNew: Boolean; aName, aOldName: string;
  aList: TList; var ConditionID: Integer): Boolean;
var
  FQuery : TZQuery;
  condID, i : Integer;
  query : string;
  TanksData : TTanksCond_Data;
begin
  Result := False;

  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    if aIsNew then
    begin
      condID := GetFreeConditionID;
      ConditionID := condID;

      query := 'INSERT INTO Condition(Condition_ID, Condition_Name, Condition_Type) ' +
               'VALUES(' + IntToStr(condID) + ', '
                         + QuotedStr(aName) + ', '
                         + QuotedStr('TANK') + ')';
      SQL.Add(query);

      try
        ExecSQL;
      except
        on E:Exception do
        begin
          if Assigned(FOnExceptionMessage) then
            FOnExceptionMessage(E.Message);
        end;
      end;

      for i := 0 to aList.Count - 1 do
      begin
        SQL.Clear;

        TanksData := TTanksCond_Data(aList.Items[i]);

        query := 'INSERT INTO Tanks_Condition(Tanks_ID, Tanks_elementID, Tanks_Value, ' +
                 'Condition_ID) ' +
                 'VALUES(' + IntToStr(GetFreeTanksCondID) +
                 ', ' + QuotedStr(TanksData.Tanks_ElementID) +
                 ', ' + floatToStr(TanksData.Tanks_Value) +
                 ', ' + IntToStr(condID) + ')';
        SQL.Add(query);
        ExecSQL;
      end;
    end
    else
    begin
      query := 'UPDATE Condition ' +
               'SET Condition_Name = ' + QuotedStr(aName) +
               ' WHERE Condition_Name = ' + QuotedStr(aOldName);
      SQL.Add(query);
      ExecSQL;

      for i := 0 to aList.Count - 1 do
      begin
        SQL.Clear;

        TanksData := TTanksCond_Data(aList.Items[i]);

        query := 'UPDATE Tanks_Condition ' +
                 'SET Tanks_ElementID = ' + QuotedStr(TanksData.Tanks_ElementID) +
                 ', Tanks_Value = ' + FloatToStr(TanksData.Tanks_Value) +
                 ' WHERE Condition_ID = ' + IntToStr(TanksData.Condition_ID) +
                 ' AND Tanks_ID = ' + IntToStr(TanksData.Tanks_ID);

        SQL.Add(query);
        ExecSQL;
      end;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.SaveParameterChange(aRunning_ID: Integer; aDateTime: TDateTime;
  aPointID, aENG, aPREV, aVAL: string): Boolean;
var
  FQuery: TZQuery;
  query: string;
begin
  Result := False;

  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'INSERT INTO RS_PARAMETERS(Running_ID, timestamp, point_id, _ENG, _PREV, _VAL) ' +
             'VALUES('+ QuotedStr(IntToStr(aRunning_ID)) + ', '
                      + QuotedStr(DateTimeToStr(aDateTime)) + ', '
                      + QuotedStr(aPointID) + ', '
                      + QuotedStr(aENG)     + ', '
                      + QuotedStr(aPREV)    + ', '
                      + QuotedStr(aVAL)     + ')';
    SQL.Add(query);

    try
      ExecSQL;
    except
      on E:Exception do
      begin
        if Assigned(FOnExceptionMessage) then
          FOnExceptionMessage(E.Message);
      end;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.SavePCSCondition(aIsNew: Boolean; aName: string;
  var aList: TList): Boolean;
var
  FQuery : TZQuery;
  condID : Integer;
  query : string;
  i : Integer;
  pcsData : TPCSCond_Data;
begin
  Result := False;

  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    if aIsNew then
    begin
      condID := GetFreeConditionID;

      query := 'INSERT INTO Condition(Condition_ID, Condition_Name, Condition_Type) ' +
               'VALUES(' + IntToStr(condID) + ', '
                         + QuotedStr(aName) + ', '
                         + QuotedStr('PCS') + ')';
      SQL.Add(query);
      ExecSQL;

      for i := 0 to aList.Count - 1 do
      begin
        pcsData := TPCSCond_Data(aList.Items[i]);
        SQL.Clear;

        query := 'INSERT INTO PCS_Condition(PCS_ID, PCS_Name, PCS_State, ' +
                 'Condition_ID, ' + 'Value)' +
                 'VALUES(' + IntToStr(GetFreePCSCondID) +
                 ', ' + QuotedStr(pcsData.PCS_Name) +
                 ', ' + IntToStr(pcsData.PCS_State) +
                 ', ' + IntToStr(condID) +
                 ', ' + IntToStr(pcsData.Value) + ')';
        SQL.Add(query);
        ExecSQL;
      end;
    end
    else
    begin
      query := 'UPDATE Condition ' +
               'SET Condition_Name = ' + QuotedStr(aName) +
               ' WHERE Condition_Name = ' + QuotedStr(aName);
      SQL.Add(query);
      ExecSQL;

      for i := 0 to aList.Count - 1 do
      begin
        pcsData := TPCSCond_Data(aList.Items[i]);
        SQL.Clear;

        query := 'UPDATE PCS_Condition ' +
                 'SET PCS_State = ' + IntToStr(pcsData.PCS_State) +
                 ', Value = ' + IntToStr(pcsData.Value) +
                 ' WHERE Condition_ID = ' + IntToStr(pcsData.Condition_ID) +
                 'and PCS_Name = ' + QuotedStr(pcsData.PCS_Name);
        SQL.Add(query);
        ExecSQL;
      end;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.SavePMSCondition(aIsNew: Boolean; aName: string;
  aList: TList;var ConditionID : integer): Boolean;
var
  i, condID : Integer;
  pmsData : TPMSCond_Data;
  FQuery : TZQuery;
  query : string;
begin
  Result := False;

  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    if aIsNew then
    begin
      condID := GetFreeConditionID;
      ConditionID := condID;

      query := 'INSERT INTO Condition(Condition_ID, Condition_Name, Condition_Type) ' +
               'VALUES(' + IntToStr(condID) + ', '
                         + QuotedStr(aName) + ', '
                         + QuotedStr('PMS') + ')';
      SQL.Add(query);
      ExecSQL;

      for i := 0 to aList.Count - 1 do
      begin
        SQL.Clear;

        pmsData := TPMSCond_Data(aList.Items[i]);

        query := 'INSERT INTO PMS_Condition(PMS_ID, PMS_Name, PMS_Type, PMS_Mode, ' +
                 'PMS_State, PMS_OnOff, PMS_Pref, PMS_CB, PMS_SWB_MSBIntrMode, ' +
                 'PMS_SWB_ESBIntrMode, PMS_SWB_ShoreIntrMode, PMS_SWB_MsbCBIntr, ' +
                 'PMS_SWB_EsbCBIntr, PMS_SWB_MsbCBShore, PMS_FirstLoad, PMS_StateRunFull, '+
                 'PMS_StateRunFwd, PMS_StateRunAft, Condition_ID) ' +
                 'VALUES(' + IntToStr(GetFreePMSCondID) +
                 ', ' + QuotedStr(pmsData.PMS_Name) +
                 ', ' + IntToStr(pmsData.PMS_Type) +
                 ', ' + IntToStr(pmsData.PMS_Mode) +
                 ', ' + IntToStr(pmsData.PMS_State) +
                 ', ' + IntToStr(pmsData.PMS_OnOff) +
                 ', ' + IntToStr(pmsData.PMS_Pref) +
                 ', ' + IntToStr(pmsData.PMS_CB) +
                 ', ' + IntToStr(pmsData.PMS_SWB_MSBIntrMode) +
                 ', ' + IntToStr(pmsData.PMS_SWB_ESBIntrMode) +
                 ', ' + IntToStr(pmsData.PMS_SWB_ShoreIntrMode) +
                 ', ' + IntToStr(pmsData.PMS_SWB_MsbCBIntr) +
                 ', ' + IntToStr(pmsData.PMS_SWB_EsbCBIntr) +
                 ', ' + IntToStr(pmsData.PMS_SWB_MsbCBShore) +
                 ', ' + IntToStr(pmsData.PMS_FirstLoad) +
                 ', ' + IntToStr(pmsData.PMS_StateRunFull) +
                 ', ' + IntToStr(pmsData.PMS_StateRunFwd) +
                 ', ' + IntToStr(pmsData.PMS_StateRunAft) +
                 ', ' + IntToStr(condID) + ')';

        SQL.Add(query);
        ExecSQL;
      end;
    end
    else
    begin
      query := 'UPDATE Condition ' +
               'SET Condition_Name = ' + QuotedStr(aName) +
               ' WHERE Condition_Name = ' + QuotedStr(aName);
      SQL.Add(query);
      ExecSQL;

      for i := 0 to aList.Count - 1 do
      begin
        SQL.Clear;

        pmsData := TPMSCond_Data(aList.Items[i]);

        query := 'UPDATE PMS_Condition ' +
                 'SET PMS_Mode = ' + IntToStr(pmsData.PMS_Mode) +
                 ', PMS_State = ' + IntToStr(pmsData.PMS_State) +
                 ', PMS_OnOff = ' + IntToStr(pmsData.PMS_OnOff) +
                 ', PMS_Pref = ' + IntToStr(pmsData.PMS_Pref) +
                 ', PMS_CB = ' + IntToStr(pmsData.PMS_CB) +
                 ', PMS_SWB_MSBIntrMode = ' + IntToStr(pmsData.PMS_SWB_MSBIntrMode) +
                 ', PMS_SWB_ESBIntrMode = ' + IntToStr(pmsData.PMS_SWB_ESBIntrMode) +
                 ', PMS_SWB_ShoreIntrMode = ' + IntToStr(pmsData.PMS_SWB_ShoreIntrMode) +
                 ', PMS_SWB_MsbCBIntr = ' + IntToStr(pmsData.PMS_SWB_MsbCBIntr) +
                 ', PMS_SWB_EsbCBIntr = ' + IntToStr(pmsData.PMS_SWB_EsbCBIntr) +
                 ', PMS_SWB_MsbCBShore = ' + IntToStr(pmsData.PMS_SWB_MsbCBShore) +
                 ', PMS_FirstLoad = ' + IntToStr(pmsData.PMS_FirstLoad) +
                 ', PMS_StateRunFull = ' + IntToStr(pmsData.PMS_StateRunFull) +
                 ', PMS_StateRunFwd = ' + IntToStr(pmsData.PMS_StateRunFwd) +
                 ', PMS_StateRunAft = ' + IntToStr(pmsData.PMS_StateRunAft) +
                 ' WHERE Condition_ID = ' + IntToStr(pmsData.Condition_ID) +
                 ' AND PMS_ID = ' + IntToStr(pmsData.PMS_ID);

        SQL.Add(query);
        ExecSQL;
      end;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

procedure TIPMSDatabase.SaveRS_FACondition(aSessionID: integer; aList: TList);
var
  FQuery : TZQuery;
  i : Integer;
  query : string;
  faData : TFACond_Data;
begin
  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'DELETE FROM RS_FA_Condition WHERE Running_ID = ' + IntToStr(aSessionID);
    SQL.Add(query);
    ExecSQL;

    for i := 0 to aList.Count - 1 do
    begin
      SQL.Clear;

      faData := TFACond_Data(aList.Items[i]);

      query := 'INSERT INTO RS_FA_Condition(Role, FA_DGSETS_State, ' +
               'FA_Distribution_State, FA_Propultion_State, ' +
               'FA_Auxiliary_State, FA_Fuel_State, FA_Domest_State, ' +
               'FA_HVAC_State, FA_FFDC_State, FA_Navigation_State, ' +
               'FA_Ballast_State, FA_IPMS_State, FA_IAS_State, ' +
               'Running_ID) ' +
               'VALUES(' + QuotedStr(faData.Role) +
               ', ' + IntToStr(faData.FA_DGSETS_State) +
               ', ' + IntToStr(faData.FA_Distribution_State) +
               ', ' + IntToStr(faData.FA_Propultion_State) +
               ', ' + IntToStr(faData.FA_Auxiliary_State) +
               ', ' + IntToStr(faData.FA_Fuel_State) +
               ', ' + IntToStr(faData.FA_Domest_State) +
               ', ' + IntToStr(faData.FA_HVAC_State) +
               ', ' + IntToStr(faData.FA_FFDC_State) +
               ', ' + IntToStr(faData.FA_Navigation_State) +
               ', ' + IntToStr(faData.FA_Ballast_State) +
               ', ' + IntToStr(faData.FA_IPMS_State) +
               ', ' + IntToStr(faData.FA_IAS_State) +
               ', ' + IntToStr(aSessionID) + ')';

      SQL.Add(query);

      try
        ExecSQL;
      finally

      end;
    end;


    Close;
    Connection := nil;
    Free;
  end;
end;

procedure TIPMSDatabase.SaveRS_PCSCondition(aList: TList; aSessionID: Integer);
var
  FQuery : TZQuery;
  query : string;
  pcsData : TScenarioPCSCondition;
  i : Integer;
begin
  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'DELETE FROM RS_PCS_CONDITION ' +
             'WHERE RUNNING_ID = ' +IntToStr(aSessionID) + ';';
    SQL.Add(query);
    ExecSQL;

    for i := 0 to aList.Count - 1 do
    begin
      SQL.Clear;
      pcsData := TScenarioPCSCondition(aList.Items[i]);

      query := 'INSERT INTO RS_PCS_Condition(PCS_Name, PCS_State, ' +
               'PCS_ME_Control, PCS_ME_Mode, PCS_ME_EngineRun, ' +
               'PCS_ME_ReadyForUse, PCS_ME_SetpointSpeed, PCS_ME_RemoteAuto, ' +
               'PCS_ME_RemoteManual, PCS_ME_LeverControl, PCS_ME_Alarm, PCS_ME_Failure, ' +
               'PCS_GB_ClutchAllowed, PCS_GB_ClutchEngaged, PCS_GB_ReadyForUse, ' +
               'PCS_GB_RemoteAuto, PCS_GB_RemoteManual, PCS_GB_Failure, ' +
               'PCS_GB_ShaftLocked, PCS_GB_ShaftPowerLimited, PCS_CPP_ReadyForUse, ' +
               'PCS_CPP_SetpointPitch, PCS_CPP_RemoteAuto, PCS_CPP_RemoteManual, PCS_CPP_Failure, ' +
               'PCS_CPP_PumpStandby, PCS_CPP_PumpStart, PCS_CPP_PumpAuto, ' +
               'PCS_PC_StartingInterlocks, PCS_PC_Alarms,  ' +
               'PCS_PC_SafetiesStop, PCS_PC_ClutchInterlocks, PCS_PC_CPPFailure, ' +
               'Running_ID) ' +
               'VALUES(' + QuotedStr(pcsData.PCS_Name) +
               ', ' + IntToStr(pcsData.PCS_State) +
               ', ' + IntToStr(pcsData.PCS_ME_Control) +
               ', ' + IntToStr(pcsData.PCS_ME_Mode) +
               ', ' + IntToStr(pcsData.PCS_ME_EngineRun) +
               ', ' + IntToStr(pcsData.PCS_ME_ReadyForUse) +
               ', ' + FloatToStr(pcsData.PCS_ME_SetpointSpeed) +
               ', ' + IntToStr(pcsData.PCS_ME_RemoteAuto) +
               ', ' + IntToStr(pcsData.PCS_ME_RemoteManual) +
               ', ' + IntToStr(pcsData.PCS_ME_LeverControl) +
               ', ' + IntToStr(pcsData.PCS_ME_Alarm) +
               ', ' + IntToStr(pcsData.PCS_ME_Failure) +
               ', ' + IntToStr(pcsData.PCS_GB_ClutchAllowed) +
               ', ' + IntToStr(pcsData.PCS_GB_ClutchEngaged) +
               ', ' + IntToStr(pcsData.PCS_GB_ReadyForUse) +
               ', ' + IntToStr(pcsData.PCS_GB_RemoteAuto) +
               ', ' + IntToStr(pcsData.PCS_GB_RemoteManual) +
               ', ' + IntToStr(pcsData.PCS_GB_Failure) +
               ', ' + IntToStr(pcsData.PCS_GB_ShaftLocked) +
               ', ' + IntToStr(pcsData.PCS_GB_ShaftPowerLimited) +
               ', ' + IntToStr(pcsData.PCS_CPP_ReadyForUse) +
               ', ' + FloatToStr(pcsData.PCS_CPP_SetpointPitch) +
               ', ' + IntToStr(pcsData.PCS_CPP_RemoteAuto) +
               ', ' + IntToStr(pcsData.PCS_CPP_RemoteManual) +
               ', ' + IntToStr(pcsData.PCS_CPP_Failure) +
               ', ' + QuotedStr(pcsData.PCS_CPP_PumpStandby) +
               ', ' + QuotedStr(pcsData.PCS_CPP_PumpStart) +
               ', ' + IntToStr(pcsData.PCS_CPP_PumpAuto) +
               ', ' + QuotedStr(pcsData.PCS_PC_StartingInterlocks) +
               ', ' + QuotedStr(pcsData.PCS_PC_Alarms) +
               ', ' + QuotedStr(pcsData.PCS_PC_SafetiesStop) +
               ', ' + QuotedStr(pcsData.PCS_PC_ClutchInterlocks) +
               ', ' + QuotedStr(pcsData.PCS_PC_CPPFailure) +
               ', ' + IntToStr(aSessionID) + ');';

      SQL.Add(query);
      try
        ExecSQL;
      finally

      end;
    end;


    Close;
    Connection := nil;
    Free;
  end;
end;

procedure TIPMSDatabase.SaveRS_PMSCondition(aList: TList; aSessionID: integer);
var
  FQuery : TZQuery;
  query : string;
//  pmsData : TPMSCond_Data;
  pmsData : TScenarioPMSCondition;
  i : Integer;
begin
  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'DELETE FROM RS_PMS_CONDITION WHERE RUNNING_ID = ' +IntToStr(aSessionID) + ';';
    SQL.Add(query);
    ExecSQL;

    for i := 0 to aList.Count - 1 do
    begin
      pmsData := TScenarioPMSCondition(aList.Items[i]);
      SQL.Clear;
      query := 'INSERT INTO RS_PMS_Condition(PMS_Name, PMS_Type, PMS_Mode, ' +
               'PMS_OnOff, PMS_GenSupplied, PMS_GenState, PMS_CBClosed, ' +
               'PMS_Preference, PMS_Busbar, PMS_RunHours, PMS_EmergencyStop, ' +

               'PMS_NotStandby, PMS_CanBusFailure, PMS_MeasPowFailure, ' +
               'PMS_DCPowFailure, PMS_EngineAlarm, PMS_ShutDown, ' +
               'PMS_FaultPageLed, PMS_FailureCBClosed, PMS_Power, ' +
               'PMS_Power_State, PMS_Frequency, PMS_Frequency_State, ' +
               'PMS_SwitchFrequency, PMS_Current, PMS_Voltage, ' +
               'PMS_Voltage_State, PMS_CosPhi, PMS_U, ' +
               'PMS_V, PMS_W, PMS_SWB_MSBIntrMode, ' +
               'PMS_SWB_ESBIntrMode, PMS_SWB_ShoreIntrMode, ' +

               'PMS_SWB_MsbCBIntr, PMS_SWB_EsbCBIntr, ' +
               'PMS_SWB_MsbCBShore, PMS_SWB_MsbCBNavNaut, PMS_SWB_Busbar, ' +
               'PMS_SWB_TripReduct, PMS_SWB_EmergencyCon, PMS_SWB_Frequency, ' +
               'PMS_SWB_Voltage, PMS_SWB_Power, PMS_SWB_Trafo230Volt, ' +
               'PMS_SWB_Trafo115Volt, PMS_PowerMode, PMS_PowerConsmr, ' +
               'PMS_FirstLoad, PMS_StateRunFull, PMS_StateRunFwd, PMS_StateRunAft, Running_ID) ' +

               'VALUES(' + QuotedStr(pmsData.PMS_Name) +
               ', ' + IntToStr(pmsData.PMS_Type) +
               ', ' + IntToStr(pmsData.PMS_Mode) +
               ', ' + IntToStr(pmsData.PMS_OnOff) +
               ', ' + IntToStr(pmsData.PMS_GenSupplied) +
               ', ' + IntToStr(pmsData.PMS_GenState) +
               ', ' + IntToStr(pmsData.PMS_CBClosed) +
               ', ' + IntToStr(pmsData.PMS_Preference) +
               ', ' + IntToStr(pmsData.PMS_Busbar) +
               ', ' + IntToStr(pmsData.PMS_RunHours) +
               ', ' + IntToStr(pmsData.PMS_EmergencyStop) +

               ', ' + IntToStr(pmsData.PMS_NotStandby) +
               ', ' + IntToStr(pmsData.PMS_CanBusFailure) +
               ', ' + IntToStr(pmsData.PMS_MeasPowFailure) +
               ', ' + IntToStr(pmsData.PMS_DCPowFailure) +
               ', ' + IntToStr(pmsData.PMS_EngineAlarm) +
               ', ' + IntToStr(pmsData.PMS_ShutDown) +
               ', ' + IntToStr(pmsData.PMS_FaultPageLed) +
               ', ' + IntToStr(pmsData.PMS_FailureCBClosed) +
               ', ' + FloatToStr(pmsData.PMS_Power) +
               ', ' + FloatToStr(pmsData.PMS_Power_State) +
               ', ' + FloatToStr(pmsData.PMS_Frequency) +
               ', ' + FloatToStr(pmsData.PMS_Frequency_State) +
               ', ' + FloatToStr(pmsData.PMS_SwitchFrequency) +
               ', ' + FloatToStr(pmsData.PMS_Current) +
               ', ' + FloatToStr(pmsData.PMS_Voltage) +
               ', ' + FloatToStr(pmsData.PMS_Voltage_State) +
               ', ' + FloatToStr(pmsData.PMS_CosPhi) +
               ', ' + FloatToStr(pmsData.PMS_U) +
               ', ' + FloatToStr(pmsData.PMS_V) +
               ', ' + FloatToStr(pmsData.PMS_W) +
               ', ' + IntToStr(pmsData.PMS_SWB_MSBIntrMode) +
               ', ' + IntToStr(pmsData.PMS_SWB_ESBIntrMode) +
               ', ' + IntToStr(pmsData.PMS_SWB_ShoreIntrMode) +

               ', ' + IntToStr(pmsData.PMS_SWB_MsbCBIntr) +
               ', ' + IntToStr(pmsData.PMS_SWB_EsbCBIntr) +
               ', ' + IntToStr(pmsData.PMS_SWB_MsbCBShore) +
               ', ' + IntToStr(pmsData.PMS_SWB_MsbCBNavNaut) +
               ', ' + IntToStr(pmsData.PMS_SWB_Busbar) +
               ', ' + IntToStr(pmsData.PMS_SWB_TripReduct) +
               ', ' + IntToStr(pmsData.PMS_SWB_EmergencyCon) +
               ', ' + FloatToStr(pmsData.PMS_SWB_Frequency) +
               ', ' + FloatToStr(pmsData.PMS_SWB_Voltage) +
               ', ' + FloatToStr(pmsData.PMS_SWB_Power) +
               ', ' + FloatToStr(pmsData.PMS_SWB_Trafo230Volt) +
               ', ' + FloatToStr(pmsData.PMS_SWB_Trafo115Volt) +
               ', ' + IntToStr(pmsData.PMS_PowerMode) +
               ', ' + FloatToStr(pmsData.PMS_PowerConsmr) +
               ', ' + IntToStr(pmsData.PMS_FirstLoad) +
               ', ' + IntToStr(pmsData.PMS_StateRunFull) +
               ', ' + IntToStr(pmsData.PMS_StateRunFwd) +
               ', ' + IntToStr(pmsData.PMS_StateRunAft) +
               ', ' + IntToStr(aSessionID) + ');';

      SQL.Add(query);
      try
        ExecSQL;
      finally

      end;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.SaveScenario(aID: Integer; aName, aDescription: string;
  intArr: array of Integer): Integer;
var
  FQuery  : TZQuery;
  query : String;
  success : Boolean;
  i : integer;
  scenID : integer;
begin
  Result := 0;

  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'EXEC dbo.sp_savescenario ' + IntToStr(aID) +
             ', ' + QuotedStr(aName) +
             ', ' + QuotedStr(aDescription);
    SQL.Add(query);
    Open;

    scenID := FieldByName('SCENARIO_ID').AsInteger;

    if FieldByName('SUCCESS').AsInteger = 1 then
      success := True
    else
      success := False;

    Result := scenID;

    Close;

    if success then
    begin
      // delete scenario id first
      query := 'DELETE FROM SCENARIOCONDITION ' +
               'WHERE SCENARIO_ID = ' + IntToStr(scenID);

      SQL.Clear;
      SQL.Add(query);
      ExecSQL;

      Close;

      for i := 0 to Length(intArr) - 1 do
      begin
        query := 'INSERT INTO SCENARIOCONDITION VALUES (' + IntToStr(scenID) +
                 ', ' + IntToStr(intArr[i]) +
                 ', ' + IntToStr(GetFreeConditionScenarioID) + ')';

        SQL.Clear;
        SQL.Add(query);
        ExecSQL;

        Close;
      end;
    end;

    if success then
      ShowMessage('Scenario Has Been Saved');

    Close;
    Connection := nil;
    Free;
  end;
end;

procedure TIPMSDatabase.SetOnExceptionMessage(const Value: TGetStrProc);
begin
  FOnExceptionMessage := Value;
end;

procedure TIPMSDatabase.SnapshotScenario(newName: string;
  sessionID: integer);
var
  FQuery : TZQuery;
  query, res : string;
begin
  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'EXEC sp_saveasRunningScenario ' + QuotedStr(newName) +
             ', ' + IntToStr(sessionID);
    SQL.Add(query);

    try
      Open;
      res := FieldByName('RESULT').AsString;
    finally
    end;

    if res = 'SUCCESS' then
      MessageDlg('New Scenario saved..', mtInformation, [mbOK], 0)
    else
      MessageDlg('New Scenario failed..', mtError, [mbOK], 0);

    Close;
    Connection := nil;
    Free;
  end;
end;

procedure TIPMSDatabase.UpdateStoppedTimeRS(aTime: TDateTime; aRSID: integer);
var
  FQuery : TZQuery;
  query : string;
begin
  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'UPDATE RUNNINGSCENARIO ' +
             'SET RUNNING_END = ' + QuotedStr(DateTimeToStr(aTime)) +
             ' WHERE RUNNING_ID = ' + IntToStr(aRSID) ;
    SQL.Add(query);
    ExecSQL;

    Close;
    Connection := nil;
    Free;
  end;
end;

procedure TIPMSDatabase.PopulateController;
var
  FQuery : TZQuery;
  query : string;
begin
  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT Controller_ID ' +
             'FROM Elements ' +
             'GROUP BY Controller_ID ' +
             'ORDER BY Controller_ID' ;
    SQL.Add(query);
    Open;

    while not Eof do
    begin
      FListeners.TriggerEvents(Self, epQueryControllerIDStr,
        FieldByName('Controller_ID').AsString);

      Next;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.PopulateDefaultElementParameter: TList;
begin
  Result := nil;
end;

procedure TIPMSDatabase.PopulateElements(CtrlID : String);
var
  FQuery : TZQuery;
  query, elmType : string;
  element : TElementData;
begin
  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT a.*, b.AlarmgroupAbbreviation, b.AlarmgroupDescription ' +
             'FROM Elements a LEFT JOIN AlarmGroups b ON a.AlarmgroupID = b.AlarmgroupID ' +
             'WHERE a.Controller_ID = ' + QuotedStr(CtrlID) +
             ' ORDER BY a.ElementID';
    SQL.Add(query);
    Open;

    while not Eof do
    begin
      elmType := FieldByName('Controller_ID').AsString;

      element := TElementData.Create;
      element.ElementID := FieldByName('ElementID').AsString;
      element.ElementName := FieldByName('Elementname').AsString;
      element.Elementtype_IDfk := FieldByName('Elementtype_IDfk').AsString;
      element.MainMimic_IDfk := StrToInt(FieldByName('MainMimic_IDfk').AsString);
      element.Inhibit_IDfk := FieldByName('Inhibit_IDfk').AsString;
      element.SystemIDfk := StrToInt(FieldByName('SystemIDfk').AsString);
      element.SystemDescription := FieldByName('SystemDescription').AsString;
      element.Controller_ID := FieldByName('Controller_ID').AsString;
      element.AlarmgroupID := FieldByName('AlarmgroupID').AsInteger;
      element.AlarmgroupDescription := FieldByName('AlarmgroupDescription').AsString;
      element.AlarmgroupAbbreviation := FieldByName('AlarmgroupAbbreviation').AsString;
      element.Text_0 := FieldByName('Text_0').AsString;
      element.Text_1 := FieldByName('Text_1').AsString;

      { trigger event }
      Listeners.TriggerEvents(Self, epQueryElementsByControllerID, element);

      element.Free;
      Next;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

procedure TIPMSDatabase.PopulateLoggedElement(var elementTable : TElementTables);
var
  FQuery : TZQuery;
  query : String;
begin
  if not FConnection.Connected then
    Exit;

  if not Assigned(elementTable) then
    elementTable := TElementTables.Create;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'SELECT * ' +
             'FROM v_getAllLoggedField ' +
             'ORDER BY ElementID';
    SQL.Add(query);
    Open;

    while not Eof do
    begin
      elementTable.AddField(FieldByName('ElementID').AsString,
        FieldByName('LoggedVal').AsString, FieldByName('TABLE_NAME').AsString);

      Next;
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

function TIPMSDatabase.PrepareRunningScenario(aScenarioID: Integer;
  aDateTimeStart: TDateTime): Integer;
var
  FQuery : TZQuery;
  query : string;
begin
  Result := 0;

  if not FConnection.Connected then
    Exit;

  FQuery := TZQuery.Create(nil);

  with FQuery do
  begin
    Connection := FConnection;
    SQL.Clear;

    query := 'EXEC sp_prepareRunningScenario ' + IntToStr(aScenarioID) +
             ', ' + QuotedStr(DateTimeToStr(aDateTimeStart));
    SQL.Add(query);

    try
      Open;

      if RecordCount > 0 then
      begin
        First;
        Result := FieldByName('RunningID').AsInteger;
      end;
    finally
    end;

    Close;
    Connection := nil;
    Free;
  end;
end;

end.


