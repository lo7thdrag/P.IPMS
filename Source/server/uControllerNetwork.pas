unit uControllerNetwork;

interface

{ *------------------------------------------------------------------------------

  Network Manager class to manage connection for controller system.
  Act as server to IPMS UI client, and as client to sim engine system.

  @author  ryu
  @version 2013/09/02 1.0 Initial revision.
  @todo
  @comment
  ------------------------------------------------------------------------------- }

uses uNetBaseSocket, uTCPServer, uTCPClient, ExtCtrls, uListener, uNetworkManager;

type
  TControllerNetwork = class(TNetworkManager)

  private

    FSimEngineSocket : TTCPClient;

  public

    constructor Create; override;
    destructor Destroy; override;

    { start network comm }
    procedure StartNetwork;override;

    { stop network comm }
    procedure StopNetwork;override;

    procedure OnConnected(Sender : TObject);override;
    procedure OnDisconnected(Sender : TObject);override;

    property SimEngineSocket : TTCPClient read FSimEngineSocket;

  end;

implementation

uses uSetting, uDataType;

{ TNetworkManager }

constructor TControllerNetwork.Create;
begin
  inherited;

  CreateServerSocket('AsControllerServer');

  with CreateClientSocket('AsSimEngineClient') do
  begin
    ServerAddress := Setting.SimEngineServer;
    ServerPort    := Setting.SimEnginePort;
    AutoReconnect := True;
  end;
  FSimEngineSocket := AsClients.Get('AsSimEngineClient');

  with CreateClientSocket('AsControllerServer') do       //ngirim ke PCS
  begin
    ServerAddress := Setting.LPUServer;
    ServerPort    := Setting.LPUPort;
    AutoReconnect := True;
  end;

  with CreateClientSocket('AsInstructorClient') do
  begin
    ServerAddress := Setting.InstructorHost;
    ServerPort    := Setting.InstructorPort;
    AutoReconnect := True;
  end;
end;

destructor TControllerNetwork.Destroy;
begin

  inherited;
end;

procedure TControllerNetwork.OnConnected(Sender: TObject);
begin
  inherited;

  Listeners.TriggerEvents(Self, epNetworkDebugInfo,
    'Controller connected to ' +  (Sender as TTCPClient).ServerAddress);

end;

procedure TControllerNetwork.OnDisconnected(Sender: TObject);
begin
  inherited;

  Listeners.TriggerEvents(Self, epNetworkDebugInfo,
    'Controller disconnected from ' + (Sender as TTCPClient).ServerAddress);

end;

procedure TControllerNetwork.StartNetwork;
begin

  AsServer.Listen(Setting.LPUPort);
  Listeners.TriggerEvents(Self, epNetworkDebugInfo, 'Controller Server Network Started at ' + Setting.LPUServer);

  FSimEngineSocket.AutoReconnect := true;

  inherited;
end;

procedure TControllerNetwork.StopNetwork;
begin

  AsServer.Stop;
  Listeners.TriggerEvents(Self, epNetworkDebugInfo, 'Controller Server Network Stopped');

  FSimEngineSocket.Disconnect;
  FSimEngineSocket.AutoReconnect := false;

  inherited;
end;

end.
