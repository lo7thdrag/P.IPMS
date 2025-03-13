unit uEmergencyStopNetwork;

interface

uses uNetworkManager, uTCPClient, ExtCtrls, uDataType;

type
  TEmergencyStopNetwork = class (TNetworkManager)

  private

    FControllerSocket   : TTCPClient;
    FInstrukturSocket   : TTCPClient;

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
    property InstrukturSocket : TTCPClient read FInstrukturSocket;

  end;

implementation

uses uSetting;

{ TPCSNetwork }

constructor TEmergencyStopNetwork.Create;
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
  FInstrukturSocket := AsClients.Get('AsInstructorClient');
end;

destructor TEmergencyStopNetwork.Destroy;
begin

  inherited;
end;

procedure TEmergencyStopNetwork.OnConnected(Sender: TObject);
begin
  inherited;

  Listeners.TriggerEvents(Self, epNetworkDebugInfo,
    'Emergency Stop connected to ' +  (Sender as TTCPClient).ServerAddress);

end;

procedure TEmergencyStopNetwork.OnDisconnected(Sender: TObject);
begin
  inherited;

  Listeners.TriggerEvents(Self, epNetworkDebugInfo,
    'Emergency Stop disconnected from ' +  (Sender as TTCPClient).ServerAddress);
end;

procedure TEmergencyStopNetwork.StartNetwork;
begin
  inherited;

  FControllerSocket.AutoReconnect := True;
  FInstrukturSocket.AutoReconnect := True;
end;

procedure TEmergencyStopNetwork.StopNetwork;
begin
  inherited;

  FControllerSocket.Disconnect;
  FControllerSocket.AutoReconnect := false;

  FInstrukturSocket.Disconnect;
  FInstrukturSocket.AutoReconnect := false;
end;

end.
