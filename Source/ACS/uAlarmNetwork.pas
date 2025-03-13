unit uAlarmNetwork;

interface

uses uNetworkManager, uTCPClient, ExtCtrls, uDataType;

type
  TAlarmNetwork = class (TNetworkManager)

  private

    FControllerSocket : TTCPClient;
    FInstructorSocket : TTCPClient;
    FAlarmSocket      : TTCPClient;

  public
    constructor Create; override;
    destructor Destroy; override;

    { start network comm }
    procedure StartNetwork;override;

    { stop network comm }
    procedure StopNetwork;override;

    procedure OnConnected(Sender : TObject);override;
    procedure OnDisconnected(Sender : TObject);override;

    property AlarmSocket : TTCPClient read FAlarmSocket;
  end;

implementation

uses uSetting;

constructor TAlarmNetwork.Create;
begin
  inherited;

  with CreateClientSocket('AsControllerClient') do
  begin
    ServerAddress := Setting.LPUServer;
    ServerPort    := Setting.LPUPort;
    AutoReconnect := True;
  end;
  FControllerSocket := AsClients.Get('AsControllerClient');

  with CreateClientSocket('AsInstructorClient') do
  begin
    ServerAddress := Setting.InstructorHost;
    ServerPort    := Setting.InstructorPort;
    AutoReconnect := True;
  end;
  FInstructorSocket := AsClients.Get('AsInstructorClient');

  FAlarmSocket := AsClients.Get('AsInstructorClient');

end;

destructor TAlarmNetwork.Destroy;
begin
  inherited;
end;

procedure TAlarmNetwork.OnConnected(Sender: TObject);
begin
  inherited;

  Listeners.TriggerEvents(Self, epNetworkDebugInfo,
    'Mimics connected to ' +  (Sender as TTCPClient).ServerAddress);

end;

procedure TAlarmNetwork.OnDisconnected(Sender: TObject);
begin
  inherited;

  Listeners.TriggerEvents(Self, epNetworkDebugInfo,
    'Mimics disconnected from ' + (Sender as TTCPClient).ServerAddress);

end;

procedure TAlarmNetwork.StartNetwork;
begin
  inherited;

  FControllerSocket.AutoReconnect := True;
  FInstructorSocket.AutoReconnect := True;
  FAlarmSocket.AutoReconnect := True;
end;

procedure TAlarmNetwork.StopNetwork;
begin
  inherited;

  FControllerSocket.Disconnect;
  FControllerSocket.AutoReconnect := false;

  FInstructorSocket.Disconnect;
  FInstructorSocket.AutoReconnect := false;

  FAlarmSocket.Disconnect;
  FAlarmSocket.AutoReconnect := False;
end;

end.
