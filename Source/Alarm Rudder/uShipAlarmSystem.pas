unit uShipAlarmSystem;

interface

uses uEntity, uLIstener, uCommonSystem, Classes, uDataType, uTCPClient, uShipAlarmNetwork,
     uShipAlarmManager;

type
  TShipAlarmSystem = class
  private

    FAlarmNetwork  : TAlarmNetwork;
    FLIstener      : TListeners;
    FEventManager: TShipAlarmManager;

    procedure NetworkEventAssignment;

    {Receive from Engine}
    procedure NetEventPCSCommand(apRec: PAnsiChar; aSize: Word);

  public

    procedure sendTelegram(ProsId : E_PropsID; i: Integer; val: Boolean; Status : Byte);
    procedure sendPumpStatus(sideId : byte; pumpId, stadeId: Integer; status: Boolean);
    procedure sendServoLampStatus(nameID : Integer ; status : Boolean);

    property Network : TAlarmNetwork read FAlarmNetwork;
    property Listener :TListeners read FListener;
    property EventManager : TShipAlarmManager read FEventManager;


    constructor Create;
    destructor Destroy;override;
  end;

var
  ShipAlarmSystem : TShipAlarmSystem;

implementation

{ TPMSSystem }

constructor TShipAlarmSystem.Create;
begin
  FAlarmNetwork := TAlarmNetwork.Create;
  FLIstener := TListeners.Create;
  FEventManager := TShipAlarmManager.Create;

  NetworkEventAssignment;

  FAlarmNetwork.StartNetwork;
end;

destructor TShipAlarmSystem.Destroy;
begin
  FLIstener.Free;

  FAlarmNetwork.StopNetwork;
  FAlarmNetwork.Free;
  FEventManager.Destroy;

  inherited;
end;

procedure TShipAlarmSystem.sendPumpStatus(sideId: byte; pumpId,
  stadeId: Integer; status: Boolean);
var
  recCmd : R_Common_PumpStatus_Command;
begin
  recCmd.SideId   := sideId;
  recCmd.PumpId   := pumpId;
  recCmd.StadeId  := stadeId;
  recCmd.ValueBool := status;
  Network.ControllerSocket.SendData(C_PUMP_COMMAND, @recCmd);
end;

procedure TShipAlarmSystem.sendServoLampStatus(nameID: Integer;
  status: Boolean);
var
   recCmd : R_ServoAndLamp_Command;
begin
  recCmd.nameID := nameID;
  recCmd.status := status;

  Network.ShipLampSocket.SendData(C_Servo_COMMAND , @recCmd);
end;

procedure TShipAlarmSystem.sendTelegram(ProsId : E_PropsID; i: Integer; val: Boolean; Status: Byte);
var
  recCmd : R_Common_Telegram_Command;
begin
  recCmd.CommandID := ProsId;
  recCmd.ValueInt  := i;
  recCmd.ValueBool := val;
  recCmd.ValueByte := Status;
  Network.AlarmSocket.SendData(C_TELEGRAM_COMMAND, @recCmd);
end;

procedure TShipAlarmSystem.NetEventPCSCommand(apRec: PAnsiChar; aSize: Word);
var
  rec: ^R_Common_PCS_Command;
begin
  rec := @apRec^;

  case rec.CommandPropsID of
    epPCSCPPPumpStandby1:
    begin
      if rec.PortStaboardID = C_PCS_CPP_PORTS then
        FLIstener.TriggerEvents(Self,epPCSCPPPumpStandby1PS,rec.ValueBool)
      else if rec.PortStaboardID = C_PCS_CPP_STARBOARD then
        FLIstener.TriggerEvents(Self,epPCSCPPPumpStandby1SB,rec.ValueBool);
    end;

    epPCSCPPPumpStandby2:
    begin
      if rec.PortStaboardID = C_PCS_CPP_PORTS then
        FLIstener.TriggerEvents(Self,epPCSCPPPumpStandby2PS,rec.ValueBool)
      else if rec.PortStaboardID = C_PCS_CPP_STARBOARD then
        FLIstener.TriggerEvents(Self,epPCSCPPPumpStandby2SB,rec.ValueBool);
    end;

    epPCSCPPPumpAuto3:
    begin
      if rec.PortStaboardID = C_PCS_CPP_PORTS then
        FLIstener.TriggerEvents(Self,epPCSCPPPumpAuto3PS,rec.ValueBool)
      else if rec.PortStaboardID = C_PCS_CPP_STARBOARD then
        FLIstener.TriggerEvents(Self,epPCSCPPPumpAuto3SB,rec.ValueBool);
    end;

    epPCSCPPPumpStart1:
    begin
      if rec.PortStaboardID = C_PCS_CPP_PORTS then
        FLIstener.TriggerEvents(Self,epPCSCPPPumpStart1PS,rec.ValueBool)
      else if rec.PortStaboardID = C_PCS_CPP_STARBOARD then
        FLIstener.TriggerEvents(Self,epPCSCPPPumpStart1SB,rec.ValueBool);
    end;

    epPCSCPPPumpStart2:
    begin
      if rec.PortStaboardID = C_PCS_CPP_PORTS then
        FLIstener.TriggerEvents(Self,epPCSCPPPumpStart2PS,rec.ValueBool)
      else if rec.PortStaboardID = C_PCS_CPP_STARBOARD then
        FLIstener.TriggerEvents(Self,epPCSCPPPumpStart2SB,rec.ValueBool);
    end;

    epPCSCPPPumpStart3:
    begin
      if rec.PortStaboardID = C_PCS_CPP_PORTS then
        FLIstener.TriggerEvents(Self,epPCSCPPPumpStart3PS,rec.ValueBool)
      else if rec.PortStaboardID = C_PCS_CPP_STARBOARD then
        FLIstener.TriggerEvents(Self,epPCSCPPPumpStart3SB,rec.ValueBool);
    end;
  end;

end;

procedure TShipAlarmSystem.NetworkEventAssignment;
var
  client : TTCPClient;
begin

  {Prince}
  { set all network event here.. as client }
  client := FAlarmNetwork.AsClients.Get('AsControllerClient');
  if Assigned(client) then
  with  client do
  begin
    {register paket dr ShipAlarm k controller}
    RegisterProcedure(C_PUMP_COMMAND, nil,SizeOf(R_Common_PumpStatus_Command));
  end;

  { set all network event here.. as simengine client }
  client := FAlarmNetwork.AsClients.Get('AsInstructorClient');
  if Assigned(client) then
  with  client do
  begin
    {register paket dr ShipAlarmSystem k instructor}
    RegisterProcedure(C_TELEGRAM_COMMAND, nil, SizeOf(R_Common_Telegram_Command));
    RegisterProcedure(C_INSTRUCTOR_COMMAND,  EventManager.NetEventInstructorCommonCmd, SizeOf(R_Common_Instr_Command));
    RegisterProcedure(C_Servo_COMMAND, nil, SizeOf(R_ServoAndLamp_Command));
  end;

  {Iqbal}
  { set all network event here.. as simengine client }
  client := FAlarmNetwork.AsClients.Get('AsSimEngineClient');
  if Assigned(client) then
  with  client do
  begin
    RegisterProcedure(C_PCS_COMMAND, NetEventPCSCommand, SizeOf(R_Common_PCS_Command));
  end;
end;

end.
