unit uDieselGeneratorSystem;

interface

uses uDieselGeneratorNetwork, uListener, uTCPClient, uDataType, ExtCtrls, uFreezeFrom, SysUtils,
  Forms, IniFiles, Classes;

type

  TDieselGeneratorSystem = class
  private

    FDieselGeneratorNetwork  : TDieselGeneratorNetwork;
    FLIstener    : TListeners;
    FFreezed     : boolean;

    FIdConsole : String;

    procedure NetworkEventAssignment;

    procedure LoadSettingForm(filepath: string);

    {Receive Diesel Generator state from Engine}
    procedure NetEventDieselGeneratorCommand(apRec: PAnsiChar; aSize: Word);

    {Receive command from instructur}
    procedure NetEventInstructorCommonCmd(apRec: PAnsiChar; aSize: Word);

    procedure SetFreezed(const Value: boolean);

  public
    FFormFreezed : array[0..2] of TfrmFreeze;

    constructor Create;
    destructor Destroy;override;

    {Prosedur untuk mengirimkan paket data dari inputan PCS Panel Touch Screen ke Engine}
    procedure EngineRun(aValue : Boolean);
    procedure EngineStop(aValue : Boolean);
    procedure EngineMode(aValue : Boolean);
    {--}

    property Network : TDieselGeneratorNetwork read FDieselGeneratorNetwork;
    property Listener :TListeners read FListener;
    property Freezed : boolean read FFreezed write SetFreezed;

    property IdConsole: String read FIdConsole write FIdConsole;

  end;

var
  DieselGeneratorSystem : TDieselGeneratorSystem;

implementation

{ TDieselGeneratorSystem }

constructor TDieselGeneratorSystem.Create;
begin
  FDieselGeneratorNetwork := TDieselGeneratorNetwork.Create;
  FLIstener := TListeners.Create;

  LoadSettingForm('..\bin\setting.ini');

  NetworkEventAssignment;

  FDieselGeneratorNetwork.StartNetwork;

end;

destructor TDieselGeneratorSystem.Destroy;
begin

  FLIstener.Free;

  FDieselGeneratorNetwork.StopNetwork;
  FDieselGeneratorNetwork.Free;

  inherited;
end;

procedure TDieselGeneratorSystem.LoadSettingForm(filepath: string);
var
  inifile : TIniFile;
  tempstring : TStringList;
begin
  inifile := TIniFile.Create(filepath);
  tempstring := TStringList.Create;

  inifile.ReadSection('CONSOLE DIESEL GENERATOR', tempstring);

  FIdConsole := inifile.ReadString('CONSOLE DIESEL GENERATOR', tempstring[0],'Default');

  inifile.Free;
  tempstring.Free;
end;

procedure TDieselGeneratorSystem.SetFreezed(const Value: boolean);
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

procedure TDieselGeneratorSystem.EngineMode(aValue: Boolean);
var
  recCmd : R_Common_PMS_Command;
begin
  recCmd.GenSwitchID := IdConsole;
  recCmd.CommandPropsID := epPMSNotStandby;
  recCmd.ValueBool := aValue;

  Network.DieselGeneratorControllerSocket.SendData(C_PMS_COMMAND,@recCmd);
end;

procedure TDieselGeneratorSystem.EngineRun(aValue: Boolean);
var
  recCmd : R_Common_PMS_Command;
begin
  recCmd.GenSwitchID := IdConsole;
  recCmd.CommandPropsID := epPMSGeneratorEngineRun;
  recCmd.ValueBool := aValue;

  Network.DieselGeneratorControllerSocket.SendData(C_PMS_COMMAND,@recCmd);
end;

procedure TDieselGeneratorSystem.EngineStop(aValue: Boolean);
var
  recCmd : R_Common_PMS_Command;
begin
  recCmd.GenSwitchID := IdConsole;
  recCmd.CommandPropsID := epPMSGeneratorStop;
  recCmd.ValueBool := aValue;

  Network.DieselGeneratorControllerSocket.SendData(C_PMS_COMMAND,@recCmd);
end;

{ fungsi untuk menangani event dari jaringan untuk PCSCommand }
procedure TDieselGeneratorSystem.NetEventInstructorCommonCmd(apRec: PAnsiChar; aSize: Word);
var
  rec: ^R_Common_Instr_Command;
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

procedure TDieselGeneratorSystem.NetEventDieselGeneratorCommand(apRec: PAnsiChar; aSize: Word);
var
  rec: ^R_Common_PMS_Command;
begin

  rec := @apRec^;

  if FIdConsole <> rec.GenSwitchID then
    Exit;

  case rec.CommandPropsID of
    epPMSGeneratorEngineRun, epPMSGeneratorStop, epPMSMeasPowFailure, epPMSAutStartFailure, epPMSSpeedSensorFailureAlrm, epPMSLubOilPressLowAlrm, epPMSLubOilTempHigh,
    epPMSCoolWaterTempHighAlrm, epPMSCoolWaterLevelLow, epPMSFuelOilLeakage, epPMSNotStandby, epPMSStartDisable, epPMSShutdown,
    epPMSSpeedSensorFailureShutdown, epPMSLubOilPressLowShutdown, epPMSCoolWaterTempHighShutdown:
    begin
      FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueBool)
    end;
//    epPMSGeneratorRunningHours:
//    begin
//      FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueInt)
//    end;

  end;
end;

procedure TDieselGeneratorSystem.NetworkEventAssignment;

var
  client : TTCPClient;
begin
  { set all network event here.. as simengine client }
  client := FDieselGeneratorNetwork.AsClients.Get('AsSimEngineClient');
  if Assigned(client) then
  begin
    with  client do
    begin
      RegisterProcedure(C_PMS_COMMAND, NetEventDieselGeneratorCommand, SizeOf(R_Common_PMS_Command));
    end;
  end;

  { set all network event here.. as instructor client}
  client := FDieselGeneratorNetwork.AsClients.Get('AsInstructorClient');
  if Assigned(client) then
  begin
    with  client do
    begin
      RegisterProcedure(C_INSTRUCTOR_COMMAND, NetEventInstructorCommonCmd, SizeOf(R_Common_Instr_Command));
    end;
  end;

  client := FDieselGeneratorNetwork.AsClients.Get('AsControllerClient');
  if Assigned(client) then
  begin
    with client do
    begin
      {kirim paket dari Diesel Generator ke controller}
      client.RegisterProcedure(C_PMS_COMMAND, nil, SizeOf(R_Common_PMS_Command));

    end;
  end;
end;

end.
