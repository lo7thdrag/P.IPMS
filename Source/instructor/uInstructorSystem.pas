unit uInstructorSystem;

interface

uses
  uDatabase, uScenario, uDataLogger, uInstructorNetwork, uDataType, uAlarmRudderClass,
  SysUtils, Forms;

type
  TInstructorSystem = class
  private
    FDatabase : TIPMSDatabase;
    FScenario : TScenario;
    FNetwork  : TInstructorNetwork;
    FClassAlarm: TClassAlarm;

    FLoggerFileName : String;
    FFile : TextFile;
    FNum  : Int64;

    procedure OnPropByteChange(Sender : TObject; Props :E_PropsID; Value : Byte);
    procedure OnPropObjChange(Sender : TObject;Props : E_PropsID; Value : TObject);
    procedure OnPropStrChange(Sender : TObject;Props : E_PropsID; Value : String);
    procedure OnPropIntChange(Sender : TObject;Props : E_PropsID; Value : integer);
    procedure OnPropDblChange(Sender : TObject;Props : E_PropsID; Value : Double);
    procedure OnNetEventRecv(apRec: PAnsiChar; aSize: Word);
    procedure OnNetEventRecvTelegram(apRec: PAnsiChar; aSize: Word);
    procedure OnNetEventRecvServoLamp(apRec : PAnsiChar ; aSize : Word);
    procedure NetEvent_StatusControlIns(apRec: PAnsiChar; aSize: Word);
    procedure OnNetworkLogger(const Value : string);
    procedure OnNetEventRecvACS(apRec: PAnsiChar; aSize: Word);

  public
    constructor Create(aDatabase : TIPMSDatabase);
    destructor Destroy;override;

    property Scenario : TScenario read FScenario;
    property Network : TInstructorNetwork read FNetwork;
    property Database : TIPMSDatabase read FDatabase;
    property ClassAlarm : TClassAlarm read FClassAlarm;

  end;

var
  InstructorSys : TInstructorSystem;

implementation

uses
  uMimicPanel, uNetworkStatus, uListener, uERSystem, uControllerSystem,
  uPCSSystem, uMimicsSystem, uInstructorPanel, uclientControl, uTelegram,
  uNav_CommSystem, uFireFighting, uVentSystem, uACSControl;

{ TInstructorSystem }

constructor TInstructorSystem.Create(aDatabase: TIPMSDatabase);
begin
  FDatabase := aDatabase;
  FScenario := TScenario.Create(FDatabase);

  FNetwork  := TInstructorNetwork.Create;
  FNetwork.AsServer.RegisterProcedure(C_INSTRUCTOR_COMMAND, OnNetEventRecv,
    SizeOf(R_Common_Instr_Command));

  FNetwork.AsServer.RegisterProcedure(C_TELEGRAM_COMMAND,
    OnNetEventRecvTelegram,
    SizeOf(R_Common_Telegram_Command));

  FNetwork.AsServer.RegisterProcedure(C_FIRE_ACS_COMMAND,
    OnNetEventRecvACS,
    SizeOf(R_Common_ACS_Command));

  //yoga
  FNetwork.AsServer.RegisterProcedure(C_Servo_COMMAND, OnNetEventRecvServoLamp,
   SizeOf(R_ServoAndLamp_Command));

   FNetwork.AsServer.RegisterProcedure(C_STATUS_CONTROL_INS_COMMAND, NetEvent_StatusControlIns,
    SizeOf(R_Command_StatCtrl_Ins));


  FClassAlarm := TClassAlarm.Create;

  with Scenario.Listener.Add('Network') as TPropertyEventListener do
  begin
    OnPropertyByteChange  := OnPropByteChange;
    OnPropertyIntChange   := OnPropIntChange;
    OnPropertyDblChange   := OnPropDblChange;
  end;

  with Network.Listeners.Add('Network') as TPropertyEventListener do
  begin
    OnPropertyStringChange := OnPropStrChange;
  end;

  with ClassAlarm.Listener.Add('Network') as TPropertyEventListener do
  begin
    OnPropertyObjectChange := OnPropObjChange;
  end;

  FLoggerFileName := ExtractFilePath(Application.ExeName) + 'LOG_' + FormatDateTime('ddmmyyy_hhnnss',Now) + '_INSTR.log';
  AssignFile(FFile, FLoggerFileName);
  Rewrite(FFile);
  FNum := 0;

  FNetwork.AsServer.OnlogRecv := OnNEtworkLogger;
  FNetwork.AsServer.OnGetSendLog := OnNEtworkLogger;
end;

destructor TInstructorSystem.Destroy;
begin
  Close(FFile);
  FClassAlarm.Free;
  FScenario.Free;
  FNetwork.Free;

  inherited;
end;

procedure TInstructorSystem.NetEvent_StatusControlIns(apRec: PAnsiChar;
  aSize: Word);
var
 rec : ^R_Command_StatCtrl_Ins;
begin
  rec := @apRec^;
  if rec.MimicID = Byte(mtNavCom) then
    frmNav_CommSystem.UpdateControlStatus(rec.MimicID, rec.Status, rec.ElementID)
  else if (rec.MimicID = Byte(mtFireDet1)) or (rec.MimicID = Byte(mtFireDet2)) then
    frmFireFighting.UpdateControlStatus(rec.MimicID, rec.Status, rec.ElementID)
  else if rec.MimicID = Byte(mtMachineVent) then
    frmVentSystem.UpdateControlStatus(rec.MimicID, rec.Status, rec.ElementID)

end;

procedure TInstructorSystem.OnNetEventRecv(apRec: PAnsiChar; aSize: Word);
var
  rec       : ^R_Common_Instr_Command;
begin
  rec := @apRec^;

  case rec.CommandID of
    C_ORD_ACK :
    begin

      if rec.ValueByte = 1 then
        frmClientControl.UpdateClientList(rec.ValueString)
      else
        frmClientControl.UpdateClientList(rec.ValueString,True)
    end;
    C_ORD_STATUS_LOAD :
    begin
      frmClientControl.UpdateClientStatus(rec.ValueString, 'ONLINE')
    end;
    C_ORD_STATUS_UNLOAD :
    begin
      frmClientControl.UpdateClientStatus(rec.ValueString, 'READY')
    end

  end;

end;

procedure TInstructorSystem.OnNetEventRecvACS(apRec: PAnsiChar; aSize: Word);
var
  rec : ^R_Common_ACS_Command;
begin
  rec := @apRec^;

  if rec.CommandID = epFaultStatus then
  begin
    frmACSControl.faultStatus := rec.Status;
  end;

end;

procedure TInstructorSystem.OnNetEventRecvServoLamp(apRec: PAnsiChar;
  aSize: Word);
var
  rec  : ^R_ServoAndLamp_Command;
begin
  rec := @apRec^;

  if rec.nameID = C_ORD_SERVO_PS then
  begin
    if rec.status = True then
      frmClientControl.lvStatusConsole.Items[2].SubItems[1] := 'RUNNING'
    else
      frmClientControl.lvStatusConsole.Items[2].SubItems[1] := 'NOT RUNNING';
  end
  else if rec.nameID = C_ORD_SERVO_SB then
  begin
    if rec.status = True then
      frmClientControl.lvStatusConsole.Items[4].SubItems[1] := 'RUNNING'
    else
      frmClientControl.lvStatusConsole.Items[4].SubItems[1] := 'NOT RUNNING';
  end
  else if rec.nameID = C_ORD_LAMP_PS then
  begin
    if rec.status = True then
      frmClientControl.lvStatusConsole.Items[2].SubItems[2] := 'RUNNING'
    else
      frmClientControl.lvStatusConsole.Items[2].SubItems[2] := 'NOT RUNNING';
  end
  else if rec.nameID = C_ORD_LAMP_SB then
  begin
    if rec.status = True then
      frmClientControl.lvStatusConsole.Items[4].SubItems[2] := 'RUNNING'
    else
      frmClientControl.lvStatusConsole.Items[4].SubItems[2] := 'NOT RUNNING';
  end
  else if rec.nameID = C_ORD_SWITCH_EG then {untuk emergency stop}
  begin
    if rec.status = True then
      frmClientControl.lvStatusConsole.Items[6].SubItems[2] := 'RUNNING'
    else
      frmClientControl.lvStatusConsole.Items[6].SubItems[2] := 'NOT RUNNING';
  end
end;

procedure TInstructorSystem.OnNetEventRecvTelegram(apRec: PAnsiChar; aSize: Word);
var
  rec       : ^R_Common_Telegram_Command;
begin
  rec := @apRec^;

  if rec.CommandID = epBoardTelegramKiri then
    frmTelegram.PSStatus := rec.ValueByte
  else if rec.CommandID = epBoardTelegramKanan then
    frmTelegram.SBStatus := rec.ValueByte;

  frmTelegram.RecvTelegraph(rec.CommandID, rec.ValueInt, rec.ValueBool)
end;

procedure TInstructorSystem.OnNetworkLogger(const Value: string);
begin
  Inc(FNum);

//  try
//    Writeln(FFile,IntToStr(FNum) + ' ' + Value);
//  finally
//  end;
end;

procedure TInstructorSystem.OnPropByteChange(Sender: TObject; Props: E_PropsID;
  Value: Byte);
var
  recIns : R_Common_Instr_Command;
begin
  case Props of
    epScenarioRunState :
    begin
      case E_ScenarioRunState(Value) of
        esrRun :
        begin
          recIns.CommandID := C_ORD_UNFREEZE_APP;
          recIns.Value := True;
        end;
        esrPause, esrStop :
        begin
          recIns.CommandID := C_ORD_FREEZE_APP;
          recIns.Value := True;
        end;
      end;

      Network.AsServer.SendData(C_INSTRUCTOR_COMMAND,@recIns);
    end;
  end;

end;

procedure TInstructorSystem.OnPropDblChange(Sender: TObject; Props: E_PropsID;
  Value: Double);
var
  recIns : R_Common_Instr_Command;
begin
  case Props of
    epScenarioRunningTime :
    begin

      // tell controller to change running time
      CtrlSystem.ServerRunningTime := Value;

      recIns.CommandID := C_ORD_SYNC_SCENARIO_TIME;
      recIns.ValueDbl  := Value;

      Network.AsServer.SendData(C_INSTRUCTOR_COMMAND,@recIns);
    end;
  end;
end;

procedure TInstructorSystem.OnPropIntChange(Sender: TObject; Props: E_PropsID;
  Value: integer);
var
  recIns : R_Common_Instr_Command;
begin
  case Props of
    epScenarioRunScenarioChange :
    begin
      // tell controller to change run scenario
      CtrlSystem.RunningScenario := Value;

      recIns.CommandID := C_ORD_SCENARIO_CHANGE;
      recIns.ValueInt  := Value;

      Network.AsServer.SendData(C_INSTRUCTOR_COMMAND,@recIns);
    end;
  end;
end;

procedure TInstructorSystem.OnPropObjChange(Sender: TObject; Props: E_PropsID;
  Value: TObject);
var
  recIns : R_Common_Instr_Command;
begin
//  recIns.CommandID := Byte(Props);
  recIns.aProps := integer(Props);
  recIns.ID := TAlarmObj(value).aID;
  recIns.Value := TAlarmObj(value).Value;
  recIns.ValueByte := TAlarmObj(value).Status;

  Network.AsServer.SendData(C_INSTRUCTOR_COMMAND,@recIns);

end;
procedure TInstructorSystem.OnPropStrChange(Sender: TObject; Props: E_PropsID;
  Value: String);
var
  recIns : R_Common_Instr_Command;
begin
  case Props of
    epNetworkClientConnect :
    begin
      case Scenario.RunState of
        esrRun : recIns.CommandID := C_ORD_UNFREEZE_APP;
        esrPause, esrStop : recIns.CommandID := C_ORD_FREEZE_APP;
      end;
      // connected client send state of instructor
      Network.AsServer.SendDataToIPAddress(C_INSTRUCTOR_COMMAND,@recIns,Value);
    end;
  end;
end;

end.
