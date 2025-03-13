unit uControllerSystem;

{*------------------------------------------------------------------------------
  Server Manager manage controller, event and network communication

  @author  ryu
  @version 2013/08/23 1.0 Initial revision.
  @todo
  @comment
-------------------------------------------------------------------------------}
interface

uses Windows, uDataType, Classes, uDatabase, uControllerManager, uControllerNetwork,
  SysUtils, uThreadTimer, uFunction, uSteppers, uDBSupportClasses;

type
  TControllerlSystem = class
  private

    FIPMSDatabase       : TIPMSDatabase;
    FControllerManager  : TControllerManager;
    FControllerNetwork  : TControllerNetwork;
    FFreedDatabase      : boolean;
    FRunner,FSecondRunner,
    FThirdRunner,FFourthRunner  : TMSTimer;

    FElmtCmdList        : TThreadList;
    FAlarmQueue         : TThreadList;
    FAlarmRemQueue      : TThreadList;

    FDelayedSending     : TDelayer;
    FElementRunner      : TDelayer;
    FLoggedDelay        : TDelayer;
    FAlarmDelayer       : TDelayer;

    FFreezed            : Boolean;

    FLoggerFileName : String;
    FFile : TextFile;
    FNum  : Int64;

    FRunningScenario : Integer;
    FServerRunningTime : TDateTime;

    procedure Freeze;
    procedure UnFreeze;

    procedure CreateThread;
    procedure CreateCommon;
    function PrepareBulkSend(var bulkData : R_Bulk_Common_Elmt_Command) : boolean;
    procedure AddElmCmdToBulk(data: R_Common_ELmt_Command);
    procedure OnNetworkLogger(const Value : string);

    procedure NetworkEventAssignment;
    procedure OnRunningThread(const aDt : Double);
    procedure OnScndRunningThread(const aDt : Double);
    procedure OnThirdRunningThread(const aDt : Double);
    procedure OnFourthRunningThread(const aDt : Double);
    procedure OnDelayedSending(Sender : TObject);
    procedure OnElementRunner(Sender : TObject);
    procedure OnRunLoggedElement(Sender : TObject);
    procedure OnAlarmDispatch(Sender : TObject);

    procedure ElementPropChange(Sender : TObject; PropsID : E_PropsID;Value : Byte);overload;
    procedure ElementPropChange(Sender : TObject; PropsID : E_PropsID;Value : Double);overload;

    procedure ElementAlarmChange(Sender : TObject; PropsID : E_PropsID;Value : Byte);

    procedure LoggedProperties(Value : String);
    procedure SetRunningScenario(Value : integer);

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
    procedure NetEvent_MimicCommonCmd(apRec: PAnsiChar; aSize: Word);
    procedure NetEvent_EmergencyCommonCmd(apRec: PAnsiChar; aSize: Word);
    procedure NetEvent_PumpCommonCmd(apRec: PAnsiChar; aSize: Word);

    procedure NetEvent_VentStatusCmd(apRec: PAnsiChar; aSize: Word);

     procedure NetEventStatusThrottleCommand(apRec: PAnsiChar; aSize: Word);
     procedure NetEventStatusThrottleCommand2(apRec: PAnsiChar; aSize: Word);

    //choco
    procedure NetEvent_FuncAllocCommand(apRec: PAnsiChar; aSize: Word);

    procedure NetEvent_InstructorCommand(apRec: PAnsiChar; aSize: Word);
  public
    constructor Create;overload;
    constructor Create(aDatabase : TIPMSDatabase);overload;
    destructor  Destroy;override;

    procedure SilentListener(ListenerID : string; Silent : Boolean);

    property Controller : TControllerManager read FControllerManager;
    property Network  : TControllerNetwork read FControllerNetwork;
    property Database : TIPMSDatabase read FIPMSDatabase;

    property RunningScenario : Integer read FRunningScenario write SetRunningScenario ;
    property ServerRunningTime : TDateTime read FServerRunningTime write FServerRunningTime;

  end;

var
  CtrlSystem : TControllerlSystem;

implementation

uses uTCPClient, uElementController, uElement, uListener,uPMSDataElement,
     uCBA, uSWE, uCTR, uDAE, uCBE, uAAE, uSSE, uMCE, uMCD, uMCS, uRHE,
     uSAE, uSEE, uSPE, uSS1, uSS2, uSSL, uSWB, uSWN, uVCE, uVCH, uVCP,
     Forms, TypInfo, uTCPDatatype;


type
  TCommon_ELmt_Command = class
    ElementID : string[20];
    MimicID   : Byte;
    CommandID : Byte;
    ValueByte : Byte;
    ValueDouble : Double;
    ValueBool   : boolean;
  end;

{ TServerManager }

constructor TControllerlSystem.Create;
begin
  FFreedDatabase     := true;
  FIPMSDatabase      := TIPMSDatabase.Create;

  CreateCommon;
  CreateThread;
  NetworkEventAssignment;

end;
procedure TControllerlSystem.OnNetworkLogger(const Value : string);
begin
  Inc(FNum);
//  value := IntToStr(FNum) + ' ' + FormatDateTime('hh:nn:ss:zzz',Now) + ' ' + Value;

  Writeln(FFile,Value);
//  try
//    Writeln(FFile,value);
//  finally
//  end;
end;

procedure TControllerlSystem.AddElmCmdToBulk(data: R_Common_ELmt_Command);
var
  i : integer;
  l : Tlist;
  item : TCommon_ELmt_Command;
  found : boolean;
begin
  found := False;
  l := FElmtCmdList.LockList;

  for I := 0 to l.Count - 1 do
  begin
    item := l.Items[I];
    if (item.ElementID = data.ElementID) and
       (item.CommandID = data.CommandID) then
    begin
      item.ValueByte := data.ValueByte;
      item.ValueDouble := data.ValueDouble;
      item.ValueBool := data.ValueBool;
      found := True;
      Break;
    end;
  end;

  if not found then
  begin
    item := TCommon_ELmt_Command.Create;
    item.ElementID := data.ElementID;
    item.MimicID := data.MimicID;
    item.CommandID := data.CommandID;
    item.ValueByte := data.ValueByte;
    item.ValueDouble := data.ValueDouble;
    item.ValueBool := data.ValueBool;

    l.Add(item);
  end;

  FElmtCmdList.UnlockList;

end;

procedure TControllerlSystem.SilentListener(ListenerID : string; Silent : Boolean);
var
  lCtrl, lElmt : TStrings;
  elmCtrl : TElementController;
  elmt : TElement;
  i, j : Integer;
  listener : TPropertyEventListener;
begin
  lCtrl := Controller.getControllers;

  for i := 0 to lCtrl.Count - 1 do
  begin
    elmCtrl := Controller.getController(lCtrl[i]);

    if Assigned(elmCtrl) then
    begin
      lElmt := elmCtrl.getElements;

      for j := 0 to lElmt.Count - 1 do
      begin
        elmt := elmCtrl.getElement(lElmt[j]);

        if Assigned(elmt) then
        begin
          listener := elmt.Listeners.Get(ListenerID) as TPropertyEventListener;
          if Assigned(listener) then
            listener.Silent := Silent;
        end;
      end;
    end;
  end;
end;

constructor TControllerlSystem.Create(aDatabase: TIPMSDatabase);
begin
  FFreedDatabase     := false;
  FIPMSDatabase      := aDatabase;

  CreateCommon;
  CreateThread;
  NetworkEventAssignment;

end;

procedure TControllerlSystem.CreateCommon;
begin
  FControllerManager := TControllerManager.Create(FIPMSDatabase);
  FControllerNetwork := TControllerNetwork.Create;
  FFreezed           := False;

  FRunningScenario := 0;
  FServerRunningTime := 0;

  FLoggerFileName := ExtractFilePath(Application.ExeName) + 'LOG_' + FormatDateTime('ddmmyyy_hhnnss',Now) + '_ELMT.log';
  AssignFile(FFile, FLoggerFileName);
  Rewrite(FFile);
  FNum := 0;

  Network.AsServer.OnGetSendLog := OnNetworkLogger;
  Network.AsServer.OnlogRecv    := OnNetworkLogger;
  Network.SimEngineSocket.OnGetSendLog := OnNetworkLogger;
  Network.SimEngineSocket.OnlogRecv := OnNetworkLogger;
  Network.AsClients.Get('AsInstructorClient').OnGetSendLog := OnNetworkLogger;
  Network.AsClients.Get('AsInstructorClient').OnlogRecv := OnNetworkLogger;

end;

procedure TControllerlSystem.CreateThread;
begin
  FElmtCmdList := TThreadList.Create;
  FAlarmQueue  := TThreadList.Create;
  FAlarmRemQueue := TThreadList.Create;

  FRunner := TMSTimer.Create;
  FRunner.OnRunning := OnRunningThread;
  FRunner.Enabled := True;

  FSecondRunner := TMSTimer.Create;
  FSecondRunner.OnRunning := OnScndRunningThread;
  FSecondRunner.Enabled := True;

  FThirdRunner := TMSTimer.Create;
  FThirdRunner.OnRunning := OnThirdRunningThread;
  FThirdRunner.Enabled := True;

  FFourthRunner := TMSTimer.Create;
  FFourthRunner.OnRunning := OnFourthRunningThread;
  FFourthRunner.Enabled := True;

  { send element data to network }
  FDelayedSending := TDelayer.Create;
  FDelayedSending.DInterval := 0.4;
  FDelayedSending.Enabled := True;
  FDelayedSending.OnTime := OnDelayedSending;

  { run element }
  FElementRunner := TDelayer.Create;
  FElementRunner.DInterval := 0.8;
  FElementRunner.Enabled := True;
  FElementRunner.OnTime := OnElementRunner;

  { log saved element to database }
  FLoggedDelay := TDelayer.Create;
  FLoggedDelay.DInterval := 3;
  FLoggedDelay.Enabled := True;
  FLoggedDelay.OnTime := OnRunLoggedElement;

  { save alarm to database }
  FAlarmDelayer := TDelayer.Create;
  FAlarmDelayer.DInterval := 0.7;
  FAlarmDelayer.Enabled := True;
  FAlarmDelayer.OnTime := OnAlarmDispatch;

end;

destructor TControllerlSystem.Destroy;
begin
  Close(FFile);

  FRunner.Free;
  FSecondRunner.Free;
  FThirdRunner.Free;

  FDelayedSending.Free;
  FElementRunner.Free;
  FLoggedDelay.Free;

  FElmtCmdList.Free;
  FAlarmQueue.Free;
  FAlarmRemQueue.Free;

  if FFreedDatabase then
    FreeAndNil(FIPMSDatabase);

  FControllerManager.Free;
  FControllerNetwork.Free;

  inherited;
end;

procedure TControllerlSystem.ElementPropChange(Sender: TObject;
  PropsID: E_PropsID; Value: Double);
var
  data : R_Common_ELmt_Command;
begin
  data.ValueByte := 0;
  data.ValueDouble := 0;
  data.ValueBool := False;

  case PropsID of
    epElementValueElmntChange  :
    begin
      data.ElementID := TElement(Sender).ElementID;
      data.CommandID := C_ORD_STATEVALUEELEMENT_CHANGE;
      data.ValueDouble := Value;
      data.MimicID   := TElement(Sender).ElementMimic;
      AddElmCmdToBulk(data);
    end;
    epValElementLevelChange :
    begin
        data.ElementID := TElement(Sender).ElementID;
        data.CommandID := C_ORD_STATEVALUELEVEL_CHANGE;
        data.ValueDouble := Value;
        data.MimicID   := TElement(Sender).ElementMimic;
        AddElmCmdToBulk(data);
    end;
    epValElementM3Change :
    begin
        data.ElementID := TElement(Sender).ElementID;
        data.CommandID := C_ORD_STATEVALUEM3_CHANGE;
        data.ValueDouble := Value;
        data.MimicID   := TElement(Sender).ElementMimic;
        AddElmCmdToBulk(data);
    end;
    epValElementMChange :
    begin
        data.ElementID := TElement(Sender).ElementID;
        data.CommandID := C_ORD_STATEVALUEELEMENT_CHANGE_IN_METER;
        data.ValueDouble := Value;
        data.MimicID   := TElement(Sender).ElementMimic;
        AddElmCmdToBulk(data);
    end;
    epValElementPercentChange :
    begin
        data.ElementID := TElement(Sender).ElementID;
        data.CommandID := C_ORD_STATEVALUEELEMENT_CHANGE_IN_PERCENT;
        data.ValueDouble := Value;
        data.MimicID   := TElement(Sender).ElementMimic;
        AddElmCmdToBulk(data);
    end;
  end;
end;

procedure TControllerlSystem.OnAlarmDispatch(Sender : TObject);
var
  objElm : TElementData;
  objAlm : TAlarmData;
  list : TList;
  rec : R_Common_Mimic_Command;
  needUpdate : Boolean;
begin
  needUpdate := False;

  // save alarm to database then broadcast updated alarm to client

  //-============
  list := FAlarmQueue.LockList;

  if list.Count > 0 then
  begin
    // FIFO
    objElm := list.Items[0];

    FIPMSDatabase.SaveAlarm(FRunningScenario,objElm.ElementID,
      FServerRunningTime, objElm.ElementID+'.ALM.TRU', IntToStr(objElm.AlarmgroupID),
      'ALARM','MCR_Instructor', objElm.ElementID+'.ALM.TRU','N','G','G',
      IntToStr(objElm.MainMimic_IDfk)+ ' '+objElm.AlarmgroupAbbreviation+' '+
      objElm.ElementID+' '+objElm.Elementname+' '+objElm.Text_0,FServerRunningTime);

    list.Delete(0);
    objElm.Free;
    needUpdate := True;
  end;

  FAlarmQueue.UnlockList;
  //==================

  // remove alarm to database then broadcast updated alarm to client

  //-============
  list := FAlarmRemQueue.LockList;

  if list.Count > 0 then
  begin
    // FIFO
    objElm := list.Items[0];

    FIPMSDatabase.GetAlarmByRunningIDElemnID(FRunningScenario, objElm.ElementID, objAlm);

    if (objElm.aAck = 'Y') and ((objAlm.final_state <> 'A') or (objAlm.final_state <> 'D')) then

      { save alarm -> Running ID to RS_ALARM_LOG table ->
             state (prev: Ack, action: Reset, final: Delete) }
      FIPMSDatabase.SaveAlarm2(FRunningScenario,FServerRunningTime,
        objElm.ElementID+'.ALM.TRU', IntToStr(objElm.AlarmgroupID), 'ALARM',
        'MCR_Instructor', objElm.ElementID+'.ALM.TRU','A','R','D',
        IntToStr(objElm.MainMimic_IDfk)+' '+objElm.AlarmgroupAbbreviation+
        ' '+objElm.ElementID+' '+objElm.Elementname+' '+objElm.Text_0,
        FServerRunningTime)
    else
      { save alarm -> Running ID to RS_ALARM_LOG table ->
          state (prev: Generate, action: Reset, final: Reset) }
      FIPMSDatabase.SaveAlarm2(FRunningScenario, FServerRunningTime,
        objElm.ElementID+'.ALM.TRU',IntToStr(objElm.AlarmgroupID),
        'ALARM','MCR_Instructor',objElm.ElementID+'.ALM.TRU','G','R','R',
        IntToStr(objElm.MainMimic_IDfk)+' '+
        objElm.AlarmgroupAbbreviation+' '+objElm.ElementID+' '+
        objElm.Elementname+' '+objElm.Text_0,
        FServerRunningTime);

    list.Delete(0);
    objElm.Free;
    needUpdate := True;
  end;

  FAlarmRemQueue.UnlockList;
  //==================

  if needUpdate then
  begin
    rec.CommandID := C_ORD_UPDATE_ALARM;
    Network.AsServer.SendData(C_MIMICS_COMMAND,@rec);
  end;
end;

procedure TControllerlSystem.ElementAlarmChange(Sender: TObject;
  PropsID: E_PropsID; Value: Byte);
var
  lAlarm      : TList;
  FSeqNumber  : Integer;
  objElm      : TElementData;
  objAlm      : TAlarmData;
  isAdded     : boolean;
  bfElementID, afElementID : string;
  i           : integer;
begin
  // only executed while element alarm event trigerred
  // copied from frmmimic to modify db

  if PropsID = epElementAlarmChange then
  case E_StateAlarm(Value) of
    saNone, saInhibited :
    begin

      if FRunningScenario = 0 then
        Exit;

      objElm := FIPMSDatabase.GetElement(TElement(Sender).ElementID);
      FIPMSDatabase.GetAlarmByRunningIDElemnID(FRunningScenario,
          TElement(Sender).ElementID,objAlm);

      if not Assigned(objAlm) then
        Exit;

      if (objAlm.final_state = 'G') or
         (objAlm.final_state = 'R') then
      begin
        objElm.aAck := 'N';
      end
      else
      begin
        objElm.aAck := 'Y';
      end;

      lAlarm := FAlarmRemQueue.LockList;
      lAlarm.Add(objElm);
      FAlarmRemQueue.UnlockList;

    end;

    saNoneDisable :
    begin
      { set disable alarm status }
    end;

    saHA, saLA,
    saWireBreak,
    saUnknown,
    saFault,
    saTripped,
    saOpenFailure,
    saCLoseFailure,
    saStopFailure,
    saStartFailure,
    saSpeed1,
    saSpeed1Failure,
    saSpeed2,
    saSpeed2Failure,
    saFailedToStop,
    saFailureToStop,
    saSpeed1FailedToStop,
    saSpeed2FailedToStop,
    saNotStandby,
    saRunningFailedToStop,
    saStandbyFailedToStop,
    saStandbyFailure,
    saHHA,
    saOORL,
    saOORH,
    saXHA,
    saAlarm,
    saControlFailure :
    begin

      if FRunningScenario = 0 then
        Exit;

      objElm := FIPMSDatabase.GetElement(TElement(Sender).ElementID);

      lAlarm := FAlarmQueue.LockList;
      lAlarm.Add(objElm);
      FAlarmQueue.UnlockList;
    end;
  end;

end;

procedure TControllerlSystem.ElementPropChange(Sender: TObject;
  PropsID: E_PropsID; Value: Byte);
var
  data : R_Common_ELmt_Command;
begin
  data.ValueByte := 0;
  data.ValueDouble := 0;
  data.ValueBool := False;

  case PropsID of
    epElementAlarmChange  :
      begin

        data.ElementID := TElement(Sender).ElementID;
        data.CommandID := C_ORD_STATEALARM_CHANGE;
        data.ValueByte := Value;
        data.MimicID   := TElement(Sender).ElementMimic;
        AddElmCmdToBulk(data);
      end;
    epElementStateChange  :
      begin

        data.ElementID := TElement(Sender).ElementID;
        data.CommandID := C_ORD_STATEELEMENT_CHANGE;
        data.ValueByte := Value;
        data.MimicID   := TElement(Sender).ElementMimic;
        AddElmCmdToBulk(data);
      end;
    epElementDisabledChange :
      begin
        data.ElementID := TElement(Sender).ElementID;
        data.CommandID := C_ORD_STATEDISABLEENABLE_CHANGE;
        data.ValueByte := Value;
        data.MimicID   := TElement(Sender).ElementMimic;
        AddElmCmdToBulk(data);
      end;
    epElementStateControlPosChange :
      begin
        data.ElementID := TElement(Sender).ElementID;
        data.CommandID := C_ORD_CONTROLMODE_CHANGE;
        data.ValueByte := Value;
        data.MimicID   := TElement(Sender).ElementMimic;
        AddElmCmdToBulk(data);
      end;
    epElementCaptionChange  :
      begin
        data.ElementID := TElement(Sender).ElementID;
        data.CommandID := C_ORD_ELEMENTCAPTION_CHANGE;
        data.ValueByte := Value;
        data.MimicID   := TElement(Sender).ElementMimic;
        AddElmCmdToBulk(data);
      end;
  end;
end;


procedure TControllerlSystem.NetEventStatusThrottleCommand(apRec: PAnsiChar;
  aSize: Word);
var
  rec: ^R_Common_PanelThrottle_Command;
begin
  rec := @apRec^;
  {terima dari panel throttle}
  Network.AsServer.SendData(C_PANELTHROTTLE_COMMAND,@rec^);
end;

procedure TControllerlSystem.NetEventStatusThrottleCommand2(apRec: PAnsiChar;
  aSize: Word);
var
  rec: ^R_Common_PanelThrottle_Command;
begin
  rec := @apRec^;
  {terima dari panel throttle}
  Network.AsServer.SendData(C_PANELTHROTTLE_COMMAND2,@rec^);
end;

procedure TControllerlSystem.NetEvent_EmergencyCommonCmd(apRec: PAnsiChar;
  aSize: Word);
var
  recCmd  : ^R_Common_EmergencyStop_Command;
  recER   : R_Common_PMS_Command;
begin
  recCmd := @apRec^;

  recER.GenSwitchID := recCmd.GenId;
  recER.CommandID := epPMSGeneratorEmergencyStop;
  recER.ValueBool := recCmd.ValueBool;

  Network.SimEngineSocket.SendData(C_MIMICS_COMMAND,@recER);
end;


procedure TControllerlSystem.NetEvent_FuncAllocCommand(apRec: PAnsiChar;
  aSize: Word);
var
  rFAData : ^R_Common_FuncAlloc_Command;
begin
  rFAData := @apRec^;

  Network.AsServer.SendData(C_FUNCTIONALLOCATION_COMMAND, @rFAData^);
end;

procedure TControllerlSystem.NetEvent_VentStatusCmd(apRec: PAnsiChar;
  aSize: Word);
var
  rec : ^R_Common_VentStatus_Command;
  elmnt   : TElement;

begin
  rec := @apRec^;
  elmnt := CtrlSystem.Controller.getElement(rec.ElementID);
  if not Assigned(elmnt) then
    exit;

  if rec.ElementType = 1 then // 1 = MCD, 2 = MCE
  begin
    if rec.Status = byte(seStopped) then
    begin
      TMCDElement(elmnt).StateValueValid := svValid;
      TMCDElement(elmnt).StateSwitchNoFault := esNoFault;
      TMCDElement(elmnt).StateSwitchRemote := esLocal;
      TMCDElement(elmnt).StateSwitchSpeed2 := esNotSpeed2;
      TMCDElement(elmnt).StateSwitchSpeed1 := esNotSpeed1;
      TMCDElement(elmnt).StateElementDisabled := sdEnabled;
    end
    else if rec.Status = byte(seSpeed1) then
    begin
      TMCDElement(elmnt).StateValueValid := svValid;
      TMCDElement(elmnt).StateSwitchNoFault := esNoFault;
      TMCDElement(elmnt).StateSwitchRemote := esLocal;
      TMCDElement(elmnt).StateSwitchSpeed2 := esNotSpeed2;
      TMCDElement(elmnt).StateSwitchSpeed1 := esSpeed1;
      TMCDElement(elmnt).StateElementDisabled := sdEnabled;
    end
    else if rec.Status = byte(seSpeed2) then
    begin
      TMCDElement(elmnt).StateValueValid := svValid;
      TMCDElement(elmnt).StateSwitchNoFault := esNoFault;
      TMCDElement(elmnt).StateSwitchRemote := esLocal;
      TMCDElement(elmnt).StateSwitchSpeed2 := esSpeed2;
      TMCDElement(elmnt).StateSwitchSpeed1 := esNotSpeed1;
      TMCDElement(elmnt).StateElementDisabled := sdEnabled;
    end
  end
  else if rec.ElementType = 2 then  // 1 = MCD, 2 = MCE
  begin
    if rec.Status = byte(seStopped) then
    begin
      TMCEElement(elmnt).StateValueValid := svValid;
      TMCEElement(elmnt).StateSwitchNoFault := esNoFault;
      TMCEElement(elmnt).StateSwitchRemote := esLocal;
      TMCEElement(elmnt).StateSwitchRunning := esNotRunning;
      TMCEElement(elmnt).StateElementDisabled := sdEnabled;
    end
    else if rec.Status = byte(seRunning) then
    begin
      TMCEElement(elmnt).StateValueValid := svValid;
      TMCEElement(elmnt).StateSwitchNoFault := esNoFault;
      TMCEElement(elmnt).StateSwitchRemote := esLocal;
      TMCEElement(elmnt).StateSwitchRunning := esRunning;
      TMCEElement(elmnt).StateElementDisabled := sdEnabled;
    end;
  end;



end;

procedure TControllerlSystem.NetEvent_PumpCommonCmd(apRec: PAnsiChar;
  aSize: Word);
var
  recCmd  : ^R_Common_PumpStatus_Command;
  recPCS   : R_Common_PCS_Command;
begin
  recCmd := @apRec^;

  recPCS.CommandID  := recCmd.SideId;
  recPCS.Number     := recCmd.PumpId;
  recPCS.ValueInt   := recCmd.StadeId;
  recPCS.ValueBool  := recCmd.ValueBool;
  Network.SimEngineSocket.SendData(C_MIMICS_COMMAND,@recPCS);
end;

procedure TControllerlSystem.NetEvent_MimicCommonCmd(apRec: PAnsiChar;  aSize: Word);
var
  recCmd  : ^R_Common_Mimic_Command;
  rec     : R_Common_Mimic_Command;
  recER   : R_Common_PMS_Command;
  elmnt   : TElement;
  val1  : string;
  val2 : E_PropsID;
  val3  : Integer ;
  ipSender : String;
begin
  recCmd := @apRec^;

  // hanya untuk ping saja, ga perlu cek element id
  case recCmd.CommandID of
    C_ORD_PING:
    begin
      // response to client ping
      ipSender := LongIp_To_StrIp(recCmd.pid.ipSender);
      Network.AsServer.SendDataToIPAddress(C_MIMICS_COMMAND,apRec,ipSender);
      Exit;
    end;
  end;

  elmnt := CtrlSystem.Controller.getElement(recCmd.ElementID);
  if not Assigned(elmnt) then
    exit;

  case recCmd.CommandID of
    C_ORD_APPLY :
    begin
      if elmnt.ElementType = eltCTR then
      begin
        if TCTRElement(elmnt).StateElementDisabled = sdEnabled then
        begin
          SearchPMSElementID.getCTREngineID(recCmd.ElementName, val1, val2, val3);
          case val2 of
            epPMSGeneratorEngineRun : recER.ValueBool := True;
            epPMSGeneratorMode      : recER.ValueInt  := val3;
          end;
          recER.GenSwitchID := val1;
          recER.CommandID   := val2;
          Network.SimEngineSocket.SendData(C_MIMICS_COMMAND,@recER);
        end
      end
    end;
    C_ORD_CLOSE :
    begin
      if elmnt.ElementType = eltCBE then
      begin
        SearchPMSElementID.getCBEEngineID(recCmd.ElementName, val1, val2, val3, 1);
        case val2 of
          epPMSGeneratorCBClosed : recER.ValueBool := True;
          epPMSMsbCBIntr : recER.ValueBool  := True;
          epPMSEsbIntrMode : recER.ValueInt  := val3;
        end;
        recER.GenSwitchID := val1;
        recER.CommandID   := val2;
        Network.SimEngineSocket.SendData(C_MIMICS_COMMAND,@recER);
      end;
    end;
    C_ORD_OPEN :
    begin
      if elmnt.ElementType = eltCBE then
      begin
        SearchPMSElementID.getCBEEngineID(recCmd.ElementName, val1, val2, val3, 2);
        case val2 of
          epPMSGeneratorCBClosed : recER.ValueBool := False;
          epPMSMsbCBIntr : recER.ValueBool  := False;
          epPMSEsbIntrMode : recER.ValueInt  := val3;
        end;
        recER.GenSwitchID := val1;
        recER.CommandID   := val2;
        Network.SimEngineSocket.SendData(C_MIMICS_COMMAND,@recER);
      end;
    end;
    C_ORD_DISABLE :
    begin
      if elmnt.ElementType = eltAAE then
        TAAEElement(elmnt).StateElementDisabled := sdDisabled
      else if elmnt.ElementType = eltCBA then
        TCBAElement(elmnt).StateElementDisabled := sdDisabled
      else if elmnt.ElementType = eltCBE then
        TCBEElement(elmnt).StateElementDisabled := sdDisabled
      else if elmnt.ElementType = eltDAE then
        TDAEElement(elmnt).StateElementDisabled := sdDisabled
      else if elmnt.ElementType = eltMCD then
        TMCDElement(elmnt).StateElementDisabled := sdDisabled
      else if elmnt.ElementType = eltMCS then
        TMCSElement(elmnt).StateElementDisabled := sdDisabled
      else if elmnt.ElementType = eltMCE then
        TMCEElement(elmnt).StateElementDisabled := sdDisabled
      else if elmnt.ElementType = eltRHE then
        TRHEElement(elmnt).StateElementDisabled := sdDisabled
      else if elmnt.ElementType = eltSAE then
        TSAEElement(elmnt).StateElementDisabled := sdDisabled
      else if elmnt.ElementType = eltSEE then
        TSEEElement(elmnt).StateElementDisabled := sdDisabled
      else if elmnt.ElementType = eltSS1 then
        TSS1Element(elmnt).StateElementDisabled := sdDisabled
      else if elmnt.ElementType = eltSS2 then
        TSS2Element(elmnt).StateElementDisabled := sdDisabled
      else if elmnt.ElementType = eltSSE then
        TSSEElement(elmnt).StateElementDisabled := sdDisabled
      else if elmnt.ElementType = eltSSL then
        TSSLElement(elmnt).StateElementDisabled := sdDisabled
      else if elmnt.ElementType = eltSWB then
        TSWBElement(elmnt).StateElementDisabled := sdDisabled
      else if elmnt.ElementType = eltSWE then
        TSWEElement(elmnt).StateElementDisabled := sdDisabled
      else if elmnt.ElementType = eltSWN then
        TSWNElement(elmnt).StateElementDisabled := sdDisabled
      else if elmnt.ElementType = eltVCH then
        TVCHElement(elmnt).StateElementDisabled := sdDisabled
      else if elmnt.ElementType = eltVCE then
        TVCEElement(elmnt).StateElementDisabled := sdDisabled
      else if elmnt.ElementType = eltVCP then
        TVCPElement(elmnt).StateElementDisabled := sdDisabled;

      rec.ElementID := recCmd.ElementID;
      rec.ElementName := recCmd.ElementName;
      rec.CommandID := recCmd.CommandID;
      rec.FinalState := 'D';
      Network.AsServer.SendData(C_MIMICS_COMMAND,@rec);
    end;
    C_ORD_ENABLE :
    begin
      if elmnt.ElementType = eltAAE then
      begin
        TAAEElement(elmnt).StateElementDisabled := sdEnabled;
        TAAEElement(elmnt).StateValid := svValid;
        TAAEElement(elmnt).StateAlarmInhibited := siInhibited;
      end
      else if elmnt.ElementType = eltCBA then
      begin

      end
      else if elmnt.ElementType = eltCBE then
      begin
        TCBEElement(elmnt).StateElementDisabled := sdEnabled;
        TCBEElement(elmnt).StateSwitchTripped := esNotTripped;
        TCBEElement(elmnt).StateSwitchNoFault := esNoFault;
        TCBEElement(elmnt).StateRFO := sroReadyForOpen;
        TCBEElement(elmnt).StateRFC := srfReadyForClose;
        TCBEElement(elmnt).StateSwitchRemote := esLocal;
        TCBEElement(elmnt).StateSwitchClosed := esNotClosed;
        TCBEElement(elmnt).StateSwitchOpen := esOpen;
      end
      else if elmnt.ElementType = eltCTR then
      begin
        TCTRElement(elmnt).StateNoFault := snfNotFault;
        TCTRElement(elmnt).StateNoRFU := snrRFU;
        TCTRElement(elmnt).StateTransition := stNotInTransition;
        TCTRElement(elmnt).ProcesStatus := spsNormal;
      end
      else if elmnt.ElementType = eltDAE then
      begin
        TDAEElement(elmnt).Command := sdEnabled;
        TDAEElement(elmnt).State := sState1;
      end
      else if elmnt.ElementType = eltMCD then
      begin
        TMCDElement(elmnt).StateValueValid := svValid;
        TMCDElement(elmnt).StateSwitchNoFault := esNoFault;
        TMCDElement(elmnt).StateSwitchRemote := esLocal;
        TMCDElement(elmnt).StateSwitchSpeed2 := esNotSpeed2;
        TMCDElement(elmnt).StateSwitchSpeed1 := esSpeed1;
        TMCDElement(elmnt).StateElementDisabled := sdEnabled;
      end
      else if elmnt.ElementType = eltMCS then
      begin

      end
      else if elmnt.ElementType = eltMCE then
      begin
        TMCEElement(elmnt).StateValueValid := svValid;
        TMCEElement(elmnt).StateSwitchNoFault := esNoFault;
        TMCEElement(elmnt).StateSwitchRemote := esLocal;
        TMCEElement(elmnt).StateSwitchRunning := esRunning;
        TMCEElement(elmnt).StateElementDisabled := sdEnabled;
      end
      else if elmnt.ElementType = eltRHE then
      begin
        TRHEElement(elmnt).StateElementDisabled := sdEnabled;
        TRHEElement(elmnt).EnableCounting := secEnabled;
        TRHEElement(elmnt).CommandReset := sacNotActivated;
      end
      else if elmnt.ElementType = eltSAE then
      begin
        TSAEElement(elmnt).StateElementDisabled := sdEnabled;
        TSAEElement(elmnt).StateValueValid := svValid;
        TSAEElement(elmnt).StateAlarmInhibited := siInhibited;
        TSAEElement(elmnt).StateLA := slaLowAlarm;
      end
      else if elmnt.ElementType = eltSEE then
      begin

      end
      else if elmnt.ElementType = eltSS1 then
      begin
        TSS1Element(elmnt).StateElementDisabled := sdEnabled;
        TSS1Element(elmnt).StateAlarmInhibited := siInhibited
      end
      else if elmnt.ElementType = eltSS2 then
      begin

      end
      else if elmnt.ElementType = eltSSE then
      begin
        TSSEElement(elmnt).StateElementDisabled := sdEnabled;
        TSSEElement(elmnt).StateInhibited := siInhibited
      end
      else if elmnt.ElementType = eltSSL then
      begin
        TSSLElement(elmnt).StateElementDisabled := sdEnabled;
        TSSLElement(elmnt).StateInhibited := siInhibited;
        TSSLElement(elmnt).ValueSensor := 10;
        TSSLElement(elmnt).Parameters.GetParameter(epTOORH).ParamDoubleValue := 2;
        TSSLElement(elmnt).Parameters.GetParameter(epTOORL).ParamDoubleValue := 2;
      end
      else if elmnt.ElementType = eltSWB then
      begin

      end
      else if elmnt.ElementType = eltSWE then
      begin
        TSWEElement(elmnt).StateInState := True;
        TSWEElement(elmnt).NONC := 1; //NC
        TSWEElement(elmnt).Mode := 1; // Mode No Alarm
        TSWEElement(elmnt).Parameters.GetParameter(epTDELAY).ParamDoubleValue := 0;
        TSWEElement(elmnt).StateElementDisabled := sdEnabled;
      end
      else if elmnt.ElementType = eltSWN then
      begin

      end
      else if elmnt.ElementType = eltVCH then
      begin

      end
      else if elmnt.ElementType = eltVCE then
      begin
        TVCEElement(elmnt).StateElementDisabled := sdEnabled;
        TVCEElement(elmnt).StateRFU := snrRFU;
        TVCEElement(elmnt).StateSwitchRemote := esLocal;
        TVCEElement(elmnt).StateSwitchClosed := esNotClosed;
        TVCEElement(elmnt).StateSwitchOpen := esOpen;
      end
      else if elmnt.ElementType = eltVCP then
      begin

      end;

      rec.ElementID := recCmd.ElementID;
      rec.ElementName := recCmd.ElementName;
      rec.CommandID := recCmd.CommandID;
      rec.FinalState := 'R';
      Network.AsServer.SendData(C_MIMICS_COMMAND,@rec);
    end;
    C_ORD_MANUAL:
    begin
      if elmnt.ElementType = eltCBE then
      begin
        SearchPMSElementID.getCBEEngineID(recCmd.ElementName, val1, val2, val3, 3);
        case val2 of
          epPMSGeneratorMode : recER.ValueInt  := 2;
        end;
        recER.GenSwitchID := val1;
        recER.CommandID   := val2;
        Network.SimEngineSocket.SendData(C_MIMICS_COMMAND,@recER);
      end;
    end;
    C_ORD_AUTO:
    begin
      if elmnt.ElementType = eltCBE then
      begin
        SearchPMSElementID.getCBEEngineID(recCmd.ElementName, val1, val2, val3, 4);
        case val2 of
          epPMSGeneratorMode : recER.ValueInt  := 4;
        end;
        recER.GenSwitchID := val1;
        recER.CommandID   := val2;
        Network.SimEngineSocket.SendData(C_MIMICS_COMMAND,@recER);
      end;
    end;
    C_ORD_MIMIC_ACK:
    begin
      Network.AsServer.SendData(C_MIMICS_COMMAND,apRec);
    end;
  end;
end;

procedure TControllerlSystem.NetworkEventAssignment;
var
  client : TTCPClient;
  lCtrl, lElmt : TStrings;
  elmCtrl : TElementController;
  elmt : TElement;
  i, j : Integer;
begin

  Network.AsClients.Get('AsSimEngineClient').OnlogRecv := OnNetworkLogger;
  Network.AsClients.Get('AsSimEngineClient').OnGetRecvLog := OnNetworkLogger;

  lCtrl := Controller.getControllers;

  for i := 0 to lCtrl.Count - 1 do
  begin
    elmCtrl := Controller.getController(lCtrl[i]);

    if Assigned(elmCtrl) then
    begin
      lElmt := elmCtrl.getElements;

      for j := 0 to lElmt.Count - 1 do
      begin
        elmt := elmCtrl.getElement(lElmt[j]);

        if Assigned(elmt) then
        begin
          with (elmt.Listeners.Add('DBListener') as TPropertyEventListener) do
          begin
            { digunakan hanya untuk meyimpan perubahan alarm }
            OnPropertyByteChange    := ElementAlarmChange;
          end;

          with (elmt.Listeners.Add('NetworkListener') as TPropertyEventListener) do
          begin
            { change nil with procedure }
            OnPropertyStringChange  := nil;
            OnPropertyIntChange     := nil;
            OnPropertyDblChange     := ElementPropChange;
            OnPropertyByteChange    := ElementPropChange;
            OnPropertyObjectChange  := nil;
            OnPropertyBoolChange    := nil;
          end;

          with (elmt.Listeners.Add('Logger') as TPropertyEventListener) do
          begin
            { change nil with procedure }
            OnPropertyIntChange := LogElementPropIntChange;
            OnPropertyDblChange := LogElementPropDblChange;
            OnPropertyByteChange := LogElementPropByteChange;
            OnPropertyStringChange := LogElementPropStrChange;
            OnPropertyBoolChange := LogElementPropBoolChange;
          end;
        end;
      end;
    end;
  end;

  { set all network event here.. as server }
  with FControllerNetwork.AsServer do
  begin
    RegisterProcedure(C_BULK_ELEMENT_COMMAND,nil,SizeOf(R_Bulk_Common_Elmt_Command));
    RegisterProcedure(C_PMS_COMMAND,nil,SizeOf(R_Common_EmergencyStop_Command));
    RegisterProcedure(C_INSTRUCTOR_COMMAND, nil, SizeOf(R_Common_ScenarioCondition_Command));

    RegisterProcedure(C_PANELTHROTTLE_COMMAND,NetEventStatusThrottleCommand,SizeOf(R_Common_PanelThrottle_Command));
    RegisterProcedure(C_PANELTHROTTLE_COMMAND2,NetEventStatusThrottleCommand2,SizeOf(R_Common_PanelThrottle_Command));

    RegisterProcedure(C_FUNCTIONALLOCATION_COMMAND, NetEvent_FuncAllocCommand,SizeOf(R_Common_FuncAlloc_Command));
    RegisterProcedure(C_VENTSTATUS_COMMAND,NetEvent_VentStatusCmd,SizeOf(R_Common_VentStatus_Command));

    {terima paket dari mimic k controller}
    RegisterProcedure(C_MIMICS_COMMAND,NetEvent_MimicCommonCmd,SizeOf(R_Common_Mimic_Command));

    {terima paket dari EmergencyStop k controller}
    RegisterProcedure(C_EMERGENCYSTOP_COMMAND,NetEvent_EmergencyCommonCmd,SizeOf(R_Common_EmergencyStop_Command));

    {terima paket dari ShipAlarm k controller}
    RegisterProcedure(C_PUMP_COMMAND,NetEvent_PumpCommonCmd,SizeOf(R_Common_PumpStatus_Command));


  end;

  { set all network event here.. as client }
  client := FControllerNetwork.AsClients.Get('AsSimEngineClient');
  if Assigned(client) then
  begin
//    client.RegisterProcedure(C_PMS_COMMAND, Controller.NetEvent_PMSElmtCommonCmd, SizeOf(R_Common_PMS_Command));
//    client.RegisterProcedure(C_PCS_COMMAND, nl, SizeOf(R_Common_PCS_Command));
//    client.RegisterProcedure(C_INSTRUCTOR_COMMAND, NetEvent_InstructorCommand, SizeOf(R_Common_Instr_Command));

    {Kirim paket dari controller ke ER}
    client.RegisterProcedure(C_MIMICS_COMMAND,nil,SizeOf(R_Common_PMS_Command));
  end;

  client := FControllerNetwork.AsClients.Get('AsInstructorClient');
  if Assigned(client) then
  begin
    client.RegisterProcedure(C_INSTRUCTOR_COMMAND, NetEvent_InstructorCommand, SizeOf(R_Common_Instr_Command));
  end;
end;

procedure TControllerlSystem.OnDelayedSending(Sender : TObject);
var
  bulkData : R_Bulk_Common_Elmt_Command;
begin
  if PrepareBulkSend(bulkData) then
     Network.AsServer.SendData(C_BULK_ELEMENT_COMMAND,@bulkData);
end;

procedure TControllerlSystem.OnElementRunner(Sender : TObject);
begin
  Controller.RunElement(Sender);
end;

procedure TControllerlSystem.OnRunLoggedElement(Sender : TObject);
begin
 Controller.RunLoggedElement(Sender);
end;

procedure TControllerlSystem.NetEvent_InstructorCommand(apRec: PAnsiChar;
  aSize: Word);
var
  rec: ^R_Common_Instr_Command;
begin
  rec := @apRec^;

  case rec.CommandID of
    C_ORD_FREEZE_APP    : Freeze;
    C_ORD_UNFREEZE_APP  : UnFreeze;
  end;
end;

procedure TControllerlSystem.OnRunningThread(const aDt: Double);
begin

  if FFreezed then Exit;

  FElementRunner.Run(aDt);
end;

procedure TControllerlSystem.OnScndRunningThread(const aDt: Double);
begin
  if FFreezed then Exit;

  FLoggedDelay.Run(aDt);
end;

procedure TControllerlSystem.OnFourthRunningThread(const aDt : Double);
begin
  FAlarmDelayer.Run(aDt);
end;

procedure TControllerlSystem.OnThirdRunningThread(const aDt: Double);
begin
  // always sending
  FDelayedSending.Run(aDt);
end;

function TControllerlSystem.PrepareBulkSend(
  var bulkData: R_Bulk_Common_Elmt_Command) : Boolean;
var
  i: integer;
  l : TList;
  item : TCommon_ELmt_Command;
begin
  Result := False;

  i := 0;

  EmptyBulkElementData(bulkData);

  l := FElmtCmdList.LockList;

  while (i < C_BULK_ELEMENT_MAX) and
    (l.Count > 0) do
  begin
    item := l.Items[0];

    bulkData.bunchData[i].ElementID := item.ElementID;
    bulkData.bunchData[i].MimicID := item.MimicID;
    bulkData.bunchData[i].CommandID := item.CommandID;
    bulkData.bunchData[i].ValueByte := item.ValueByte;
    bulkData.bunchData[i].ValueDouble := item.ValueDouble;
    bulkData.bunchData[i].ValueBool := item.ValueBool;

    item.Free;
    l.Delete(0);

    Inc(i);
    Result := True;
  end;

  FElmtCmdList.UnlockList;

end;

procedure TControllerlSystem.Freeze;
begin
  FFreezed := True;
end;

procedure TControllerlSystem.UnFreeze;
begin
  FFreezed := False;
end;


procedure TControllerlSystem.LogElementPropBoolChange(Sender: TObject;
  PropsID: E_PropsID; Value: Boolean);
begin

end;

procedure TControllerlSystem.LogElementPropByteChange(Sender: TObject;
  PropsID: E_PropsID; Value: Byte);
var
  s : String;
begin

  s := GetEnumName(TypeInfo(E_PropsID),integer(PropsID)) ;

  if Sender is TElement then
    s := TElement(Sender).ElementID + ':' + s + '->' + IntToStr(Value)
  else
    s := Sender.ClassName + ':' + s + '->' + IntToStr(Value);

  LoggedProperties(s);
end;

procedure TControllerlSystem.LogElementPropDblChange(Sender: TObject;
  PropsID: E_PropsID; Value: Double);
var
  s : String;
begin

  s := GetEnumName(TypeInfo(E_PropsID),integer(PropsID)) ;

  if Sender is TElement then
    s := TElement(Sender).ElementID + ':' + s + '->' + FloatToStr(Value)
  else
    s := Sender.ClassName + ':' + s + '->' + FloatToStr(Value);

  LoggedProperties(s);
end;

procedure TControllerlSystem.LogElementPropIntChange(Sender: TObject;
  PropsID: E_PropsID; Value: Integer);
var
  s : String;
begin

  s := GetEnumName(TypeInfo(E_PropsID),integer(PropsID)) ;

  if Sender is TElement then
    s := TElement(Sender).ElementID + ':' + s + '->' + IntToStr(Value)
  else
    s := Sender.ClassName + ':' + s + '->' + IntToStr(Value);

  LoggedProperties(s);
end;

procedure TControllerlSystem.LogElementPropStrChange(Sender: TObject;
  PropsID: E_PropsID; Value: String);
var
  s : String;
begin

  s := GetEnumName(TypeInfo(E_PropsID),integer(PropsID)) ;

  if Sender is TElement then
    s := TElement(Sender).ElementID + ':' + s + '->' + Value
  else
    s := Sender.ClassName + ':' + s + '->' + Value;

  LoggedProperties(s);
end;


procedure TControllerlSystem.SetRunningScenario(Value : integer);
begin
  FRunningScenario := Value;
end;

procedure TControllerlSystem.LoggedProperties(Value: String);
begin

  Inc(FNum);
  value := IntToStr(FNum) + ' ' + FormatDateTime('hh:nn:ss:zzz',Now) + ' ' + Value;

  try
    Writeln(FFile,value);
  finally
  end;
end;

end.
