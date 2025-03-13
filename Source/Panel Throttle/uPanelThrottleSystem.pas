unit uPanelThrottleSystem;

interface

uses uEntity, uLIstener, uCommonSystem, Classes, uDataType, uTCPClient, uPanelThrottleNetwork,
     uPanelThrottleManager;

type
  TShipAlarmSystem = class
  private

    FAlarmNetwork  : TAlarmNetwork;
    FLIstener      : TListeners;
    FEventManager: TShipAlarmManager;

    procedure NetworkEventAssignment;

  public

    procedure setStatusThrottle(aGen: byte; aValue : boolean);
    procedure sendTelegram(ProsId : E_PropsID; i: Integer; val: Boolean; Status: Byte);
    procedure sendServoLampStatus(nameID : Integer ; status : Boolean);

    property Network : TAlarmNetwork read FAlarmNetwork;
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

procedure TShipAlarmSystem.NetworkEventAssignment;
var
  client : TTCPClient;
begin
  { set all network event here.. as simengine client }
  client := FAlarmNetwork.AsClients.Get('AsControllerClient');
  if Assigned(client) then
    with  client do
    begin
      RegisterProcedure(C_PANELTHROTTLE_COMMAND, nil {NetEventEmergencyCommand}, SizeOf(R_Common_PanelThrottle_Command));
      RegisterProcedure(C_PANELTHROTTLE_COMMAND2, EventManager.NetEventStatusThrottleCommand2  , SizeOf(R_Common_PanelThrottle_Command));
    end;

  { set all network event here.. as instructor client }
  client := FAlarmNetwork.AsClients.Get('AsInstructorClient');
  if Assigned(client) then
    with  client do
    begin
      RegisterProcedure(C_INSTRUCTOR_COMMAND,  EventManager.NetEventInstructorCommonCmd, SizeOf(R_Common_Instr_Command));
      RegisterProcedure(C_TELEGRAM_COMMAND, nil, SizeOf(R_Common_Telegram_Command));
      RegisterProcedure(C_Servo_COMMAND, nil, SizeOf(R_ServoAndLamp_Command));
    end;
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

procedure TShipAlarmSystem.sendTelegram(ProsId: E_PropsID; i: Integer;
  val: Boolean; Status: Byte);
var
  recCmd : R_Common_Telegram_Command;
begin
  recCmd.CommandID := ProsId;
  recCmd.ValueInt  := i;
  recCmd.ValueBool := val;
  recCmd.ValueByte := Status;
  Network.AlarmSocket.SendData(C_TELEGRAM_COMMAND, @recCmd);
end;

procedure TShipAlarmSystem.setStatusThrottle(aGen: byte; aValue: boolean);
var
  recCmd : R_Common_PanelThrottle_Command;
begin
  recCmd.aID:= aGen;
  recCmd.aValue := aValue;

  {kirim ke controller}
  Network.ControllerSocket.SendData(C_PANELTHROTTLE_COMMAND,@recCmd);
end;

end.
