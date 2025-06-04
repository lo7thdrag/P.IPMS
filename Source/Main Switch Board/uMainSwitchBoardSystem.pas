unit uMainSwitchBoardSystem;

interface

uses uMainSwitchBoardNetwork, uListener, uTCPClient, uDataType, ExtCtrls, uFreezeFrom, SysUtils,
  Forms, IniFiles, Classes, typinfo;

type

  TMainSwitchBoardSystem = class
  private
    T:TextFile;
    FN:string;

    FMainSwitchBoardNetwork  : TMainSwitchBoardNetwork;
    FLIstener    : TListeners;
    FFreezed     : boolean;

    FIdFormGensys : String;
    FIdGenerator : String;

    procedure CreateLogFile;

    procedure NetworkEventAssignment;

    {Receive Diesel Generator state from Engine}
    procedure NetEventMainSwitchBoardCommand(apRec: PAnsiChar; aSize: Word);

    {Receive command from instructur}
    procedure NetEventInstructorCommonCmd(apRec: PAnsiChar; aSize: Word);

    procedure LoadSettingForm(filepath: string);
    procedure SetFreezed(const Value: boolean);

  public
    FFormFreezed : array[0..0] of TfrmFreeze;

    procedure EngineRun(aValue : Boolean);
    procedure EngineStop(aValue : Boolean);
    procedure GeneratorPreference(aValue : Boolean);
    procedure CBClosed(aValue : Boolean);
    procedure CBShore(aValue : Boolean);
    procedure GeneratorMode(aValue : Integer);

    constructor Create;
    destructor Destroy;override;

    property Network : TMainSwitchBoardNetwork read FMainSwitchBoardNetwork;
    property Listener :TListeners read FListener;
    property Freezed : boolean read FFreezed write SetFreezed;

    property IdFormGensys: String read FIdFormGensys write FIdFormGensys;
    property IdGenerator: String read FIdGenerator write FIdGenerator;

  end;

var
  MainSwitchBoardSystem : TMainSwitchBoardSystem;

implementation

uses
  uMainForm;

{ TMainSwitchBoardSystem }

constructor TMainSwitchBoardSystem.Create;
begin
  FMainSwitchBoardNetwork := TMainSwitchBoardNetwork.Create;
  FLIstener := TListeners.Create;

  LoadSettingForm('..\bin\setting.ini');

  NetworkEventAssignment;

  FMainSwitchBoardNetwork.StartNetwork;

end;

procedure TMainSwitchBoardSystem.CreateLogFile;
begin
  FN := ChangeFileExt('TulisLog', '.log');
  AssignFile(T, FN);
  Rewrite(T);
  Append(T);
  Writeln(T,'BreakingLine');
  CloseFile(T);
end;

destructor TMainSwitchBoardSystem.Destroy;
begin

  FLIstener.Free;

  FMainSwitchBoardNetwork.StopNetwork;
  FMainSwitchBoardNetwork.Free;

  inherited;
end;

procedure TMainSwitchBoardSystem.LoadSettingForm(filepath: string);
var
  inifile : TIniFile;
  tempstring : TStringList;
begin
  inifile := TIniFile.Create(filepath);
  tempstring := TStringList.Create;

  inifile.ReadSection('CONSOLE MAINSWITCHBOARD', tempstring);

  FIdFormGensys := inifile.ReadString('CONSOLE MAINSWITCHBOARD', tempstring[0],'GENSYS');
  FIdGenerator := inifile.ReadString('CONSOLE MAINSWITCHBOARD', tempstring[1],'Generator 1');

  tempstring.Free;
  inifile.Free;
end;

procedure TMainSwitchBoardSystem.SetFreezed(const Value: boolean);
var
  setFreezed : Integer;
begin
  if FFreezed = Value then
    Exit;

  FFreezed := Value;
  if FFreezed then
  begin
    setFreezed := 1;
    FLIstener.TriggerEvents(Self,epPMSFreezed,setFreezed)
  end
  else
  begin
    setFreezed := 0;
    FLIstener.TriggerEvents(Self,epPMSFreezed,setFreezed);
  end;
end;

procedure TMainSwitchBoardSystem.EngineRun(aValue: Boolean);
var
  recCmd : R_Common_PMS_Command;
begin
  recCmd.GenSwitchID := IdGenerator;
  recCmd.CommandPropsID := epPMSGeneratorEngineRun;
  recCmd.ValueBool := aValue;

  Network.MainSwitchBoardControllerSocket.SendData(C_PMS_COMMAND,@recCmd);
end;

procedure TMainSwitchBoardSystem.EngineStop(aValue: Boolean);
var
  recCmd : R_Common_PMS_Command;
begin
  recCmd.GenSwitchID := IdGenerator;
  recCmd.CommandPropsID := epPMSGeneratorStop;
  recCmd.ValueBool := aValue;

  Network.MainSwitchBoardControllerSocket.SendData(C_PMS_COMMAND,@recCmd);
end;

procedure TMainSwitchBoardSystem.GeneratorMode(aValue: Integer);
var
  recCmd : R_Common_PMS_Command;
begin
  recCmd.GenSwitchID := IdGenerator;
  recCmd.CommandPropsID := epPMSGeneratorMode;
  recCmd.ValueInt := aValue;

  Network.MainSwitchBoardControllerSocket.SendData(C_PMS_COMMAND,@recCmd);
end;

procedure TMainSwitchBoardSystem.GeneratorPreference(aValue: Boolean);
var
  recCmd : R_Common_PMS_Command;
begin
  recCmd.GenSwitchID := IdGenerator;
  recCmd.CommandPropsID := epPMSGeneratorPreference;
  recCmd.ValueBool := aValue;

  Network.MainSwitchBoardControllerSocket.SendData(C_PMS_COMMAND,@recCmd);
end;

procedure TMainSwitchBoardSystem.CBClosed(aValue: Boolean);
var
  recCmd : R_Common_PMS_Command;
begin
  recCmd.GenSwitchID := IdGenerator;
  recCmd.CommandPropsID := epPMSGeneratorCBClosed;
  recCmd.ValueBool := aValue;

  Network.MainSwitchBoardControllerSocket.SendData(C_PMS_COMMAND,@recCmd);
end;

procedure TMainSwitchBoardSystem.CBShore(aValue: Boolean);
var
  recCmd : R_Common_PMS_Command;
begin
  recCmd.GenSwitchID := IdGenerator;
  recCmd.CommandPropsID := epPMSMsbCBShore;
  recCmd.ValueBool := aValue;

  Network.MainSwitchBoardControllerSocket.SendData(C_PMS_COMMAND,@recCmd);
end;

{ fungsi untuk menangani event dari jaringan untuk PCSCommand }
procedure TMainSwitchBoardSystem.NetEventInstructorCommonCmd(apRec: PAnsiChar; aSize: Word);
var
  rec: ^R_Common_Instr_Command;
  i,aCount : integer;
begin
  rec := @apRec^;

  case rec.CommandID of
    C_ORD_FREEZE_APP : Freezed := True;

    C_ORD_UNFREEZE_APP : Freezed := False;

    C_ORD_CLOSE_APP :
    begin

    end;

  end;
end;

procedure TMainSwitchBoardSystem.NetEventMainSwitchBoardCommand(apRec: PAnsiChar; aSize: Word);
var
  rec: ^R_Common_PMS_Command;
begin

  rec := @apRec^;
  {Tambahan}
  FN := ChangeFileExt('TulisLog', '.log');
  if not FileExists(FN) then
  begin
    CreateLogFile
  end;

  AssignFile(T, FN);
  Append(T);
  Writeln(T, (rec.pid.recID));
  Writeln(T, (rec.GenSwitchID));
  Writeln(T, (GetEnumName(typeInfo(E_PropsID ), Ord(rec.CommandPropsID))));
  Writeln(T, 'Kind : ', rec.ValueKind);
  Writeln(T, 'Bool : ', BoolToStr(rec.ValueBool, True));
  Writeln(T, 'Int : ', rec.ValueInt.ToString);
  Writeln(T, 'Double : ', rec.ValueDob.ToString);
  Writeln(T, '---');
  CloseFile(T);
  {Tambahan}

  if FIdGenerator <> rec.GenSwitchID then
    Exit;

  case rec.CommandPropsID of
    epPMSGeneratorEngineRun, epPMSGeneratorStop, epPMSGeneratorSupplied, epPMSGeneratorCBClosed,
    epPMSGeneratorPreference, epPMSGeneratorBusbar:
    begin
      FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueBool)
    end;
    epPMSGeneratorMode:
    begin
      FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueInt)
    end;
//    epPMSPower, epPMSFrequency, epPMSV, epPMSVoltage, epPMSCurrent:
//    begin
//      FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDob)
//    end;
  end;
end;

procedure TMainSwitchBoardSystem.NetworkEventAssignment;
var
  client : TTCPClient;
begin
  { set all network event here.. as simengine client }
  client := FMainSwitchBoardNetwork.AsClients.Get('AsSimEngineClient');
  if Assigned(client) then
  begin
    with  client do
    begin
      RegisterProcedure(C_PMS_COMMAND, NetEventMainSwitchBoardCommand, SizeOf(R_Common_PMS_Command));
    end;
  end;

  { set all network event here.. as instructor client}
  client := FMainSwitchBoardNetwork.AsClients.Get('AsInstructorClient');
  if Assigned(client) then
  begin
    with  client do
    begin
      RegisterProcedure(C_INSTRUCTOR_COMMAND, NetEventInstructorCommonCmd, SizeOf(R_Common_Instr_Command));
    end;
  end;

   client := FMainSwitchBoardNetwork.AsClients.Get('AsControllerClient');
   if Assigned(client) then
   begin
     with client do
     begin
       client.RegisterProcedure(C_PMS_COMMAND, nil, SizeOf(R_Common_PMS_Command));
     end;
   end;
end;

end.
