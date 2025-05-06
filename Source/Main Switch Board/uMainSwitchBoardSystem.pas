unit uMainSwitchBoardSystem;

interface

uses uMainSwitchBoardNetwork, uListener, uTCPClient, uDataType, ExtCtrls, uFreezeFrom, SysUtils,
  Forms, IniFiles, Classes;

type

  TMainSwitchBoardSystem = class
  private

    FMainSwitchBoardNetwork  : TMainSwitchBoardNetwork;
    FLIstener    : TListeners;
    FFreezed     : boolean;

    FIdGensys : String;
    FIdGenenerator : String;

    procedure NetworkEventAssignment;

    {Receive Diesel Generator state from Engine}
    procedure NetEventMainSwitchBoardCommand(apRec: PAnsiChar; aSize: Word);

    {Receive command from instructur}
    procedure NetEventInstructorCommonCmd(apRec: PAnsiChar; aSize: Word);

    procedure LoadSettingForm(filepath: string);
    procedure SetFreezed(const Value: boolean);

  public
    FFormFreezed : array[0..0] of TfrmFreeze;

    constructor Create;
    destructor Destroy;override;

    property Network : TMainSwitchBoardNetwork read FMainSwitchBoardNetwork;
    property Listener :TListeners read FListener;
    property Freezed : boolean read FFreezed write SetFreezed;

    property IdGensys: String read FIdGensys write FIdGensys;
    property IdGenenerator: String read FIdGenenerator write FIdGenenerator;

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

  FIdGensys := inifile.ReadString('FORM GENSYS', tempstring[0],'GENSYS 1');
  FIdGenenerator := inifile.ReadString('ID GENSYS', tempstring[1],'GENERATOR 1');

  inifile.Free;
  tempstring.Free;
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

  case E_PropsID(rec^.aProps) of
    epBoardAlarmLamp:
    begin
//      {$REGION ' Set Alarm Indicator '}
//
//      for I := 0 to  Length(MainForm.FAlarmIndicator)- 1 do
//      begin
//        if rec.ID = (i+1) then  //penyesuaian arraynya>> mulai dari 0 sedangkan ID mulai dari 1
//        begin
//          MainForm.FAlarmIndicator[i] := rec.Value;
//          MainForm.SetAlarmIndicator;
//        end;
//      end;
//
//      {$ENDREGION}
    end;
  end;
end;

procedure TMainSwitchBoardSystem.NetEventMainSwitchBoardCommand(apRec: PAnsiChar; aSize: Word);
var
  rec: ^R_Common_PMS_Command;
begin

  rec := @apRec^;

  if FIdGenenerator <> rec.GenSwitchID then
    Exit;

  case rec.CommandPropsID of
    epPCSCPPPumpStandby1:
    begin
//      if rec.PortStaboardID = C_PCS_CPP_PORTS then
//        FLIstener.TriggerEvents(Self,epPCSCPPPumpStandby1PS,rec.ValueBool)
//      else if rec.PortStaboardID = C_PCS_CPP_STARBOARD then
//        FLIstener.TriggerEvents(Self,epPCSCPPPumpStandby1SB,rec.ValueBool);
    end;
    epPMSGeneratorMode:
    begin
      FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueInt)
    end;
    epPMSGeneratorEngineRun:
    begin
      FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueBool)
    end;
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
//      RegisterProcedure(C_TELEGRAM_COMMAND, nil, SizeOf(R_Common_Telegram_Command));
    end;
  end;

   client := FMainSwitchBoardNetwork.AsClients.Get('AsControllerClient');
   if Assigned(client) then
   begin
     with client do
     begin
//       RegisterProcedure(C_PUMP_COMMAND, nil, SizeOf(R_Common_PumpStatus_Command));
     end;
   end;
end;

//procedure TMainSwitchBoardSystem.sendPumpStatus(sideId: byte; pumpId, stadeId: Integer; status: Boolean);
//var
//  recCmd : R_Common_PumpStatus_Command;
//begin
//  recCmd.SideId   := sideId;
//  recCmd.PumpId   := pumpId;
//  recCmd.StadeId  := stadeId;
//  recCmd.ValueBool := status;
//  Network.MCRMachineLeftControllerSocket.SendData(C_PUMP_COMMAND, @recCmd);
//end;

//procedure TMainSwitchBoardSystem.sendTelegram(ProsId: E_PropsID; i: Integer; val: Boolean; Status: Byte);
//var
//  recCmd : R_Common_Telegram_Command;
//begin
//  recCmd.CommandID := ProsId;
//  recCmd.ValueInt  := i;
//  recCmd.ValueBool := val;
//  recCmd.ValueByte := Status;
//  Network.MCRMachineLeftAlarmSocket.SendData(C_TELEGRAM_COMMAND, @recCmd);
//end;

end.
