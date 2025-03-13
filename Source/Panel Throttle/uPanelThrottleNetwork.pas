unit uPanelThrottleNetwork;

interface

uses uNetworkManager, uTCPClient, ExtCtrls, uDataType;

type
  TAlarmNetwork = class (TNetworkManager)

  private

    FControllerSocket : TTCPClient;
    FAlarmSocket   : TTCPClient;
    FShipLampSocket : TTCPClient;

  public
    constructor Create; override;
    destructor Destroy; override;

    { start network comm }
    procedure StartNetwork;override;

    { stop network comm }
    procedure StopNetwork;override;

    procedure OnConnected(Sender : TObject);override;
    procedure OnDisconnected(Sender : TObject);override;

    property ControllerSocket : TTCPClient read FControllerSocket;
    property AlarmSocket : TTCPClient read FAlarmSocket;
    property ShipLampSocket : TTCPClient read FShipLampSocket;


  end;

implementation

uses uSetting;

{ TPCSNetwork }

constructor TAlarmNetwork.Create;
begin
  inherited;

  with CreateClientSocket('AsInstructorClient') do
  begin
    ServerAddress := Setting.InstructorHost;
    ServerPort    := Setting.InstructorPort;
    AutoReconnect := True;
  end;
  FAlarmSocket := AsClients.Get('AsInstructorClient');

  with CreateClientSocket('AsControllerClient') do
  begin
    ServerAddress := Setting.LPUServer;
    ServerPort    := Setting.LPUPort;
    AutoReconnect := True;
  end;

  FControllerSocket := AsClients.Get('AsControllerClient');
  FShipLampSocket := AsClients.Get('AsInstructorClient');

end;

destructor TAlarmNetwork.Destroy;
begin

  inherited;
end;

procedure TAlarmNetwork.OnConnected(Sender: TObject);
begin
  inherited;

  Listeners.TriggerEvents(Self, epNetworkDebugInfo,
    'Emergency Stop connected to ' +  (Sender as TTCPClient).ServerAddress);

end;

procedure TAlarmNetwork.OnDisconnected(Sender: TObject);
begin
  inherited;

  Listeners.TriggerEvents(Self, epNetworkDebugInfo,
    'Emergency Stop disconnected from ' +  (Sender as TTCPClient).ServerAddress);
end;

procedure TAlarmNetwork.StartNetwork;
begin
  inherited;

  FAlarmSocket.AutoReconnect := True;
  FControllerSocket.AutoReconnect := True;
  FShipLampSocket.AutoReconnect := True;
end;

procedure TAlarmNetwork.StopNetwork;
begin
  inherited;

  FAlarmSocket.Disconnect;
  FAlarmSocket.AutoReconnect := false;

  FControllerSocket.Disconnect;
  FControllerSocket.AutoReconnect := false;

  FShipLampSocket.Disconnect;
  FShipLampSocket.AutoReconnect := False;

end;

end.
