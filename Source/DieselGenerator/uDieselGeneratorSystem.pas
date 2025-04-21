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

    FIdFormDieselGenerator : String;

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
    procedure StartStopEngine(aValue : Boolean);
    {--}

    property Network : TDieselGeneratorNetwork read FDieselGeneratorNetwork;
    property Listener :TListeners read FListener;
    property Freezed : boolean read FFreezed write SetFreezed;

    property IdFormDieselGenerator: String read FIdFormDieselGenerator write FIdFormDieselGenerator;

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

  inifile.ReadSection('Form DieselGenerator', tempstring);

//  FIdFormDieselGenerator := StrToInt(inifile.ReadString('Form DieselGenerator', tempstring[0],'Default'));
  FIdFormDieselGenerator := inifile.ReadString('Form DieselGenerator', tempstring[0],'Default');

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

procedure TDieselGeneratorSystem.StartStopEngine(aValue: Boolean);
var
  recCmd : R_Common_PMS_Command;
begin
  recCmd.GenSwitchID := IdFormDieselGenerator;
  recCmd.CommandPropsID := epPMSGeneratorEngineRun;
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
//      if servoID = 1 then
//        PCSSystem.sendServoLampStatus(C_ORD_SERVO_PS, False)
//      else if servoID = 3  then
//        PCSSystem.sendServoLampStatus(C_ORD_SERVO_SB, False);
    end;

  end;
end;

procedure TDieselGeneratorSystem.NetEventDieselGeneratorCommand(apRec: PAnsiChar; aSize: Word);
var
  rec: ^R_Common_PMS_Command;
begin

  rec := @apRec^;

  if FIdFormDieselGenerator <> rec.GenSwitchID then
    Exit;

  case rec.CommandPropsID of
    epPMSMeasPowFailure, epPMSAutStartFailure, epPMSSpeedSensorFailureAlrm, epPMSLubOilPressLowAlrm, epPMSLubOilTempHigh,
    epPMSCoolWaterTempHighAlrm, epPMSCoolWaterLevelLow, epPMSFuelOilLeakage:
    begin
      FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueBool)
    end;
//    epPMSAutStartFailure,epPMSLubOilTempHigh :
//    begin
//      FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueBool);
//    end;
//    epPMSEngineAlarm:
//    begin
//      FLIstener.TriggerEvents(Self,epPMSEngineAlarm,rec.ValueBool)
//    end;
//    epPMSShutdown:
//    begin
//      FLIstener.TriggerEvents(Self,epPMSShutdown,rec.ValueBool)
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
