unit uERNetwork;

{*------------------------------------------------------------------------------
  Network Manager class to manage connection for simulator system.
  Act as server to controller, pcsUi, pmsUI, mimic.

  @author  ryu
  @version 2013/09/27 1.0 Initial revision.
  @todo
  @comment
-------------------------------------------------------------------------------}

interface

uses uNetBaseSocket, uTCPServer, uTCPClient, ExtCtrls, uListener, uNetworkManager,
  uDataType;

type
  TERNetwork = class(TNetworkManager)

  public

    constructor Create; override;
    destructor Destroy; override;

    { start network comm }
    procedure StartNetwork;override;

    { stop network comm }
    procedure StopNetwork;override;

  end;
implementation

uses uSetting;

{ TERNetwork }

constructor TERNetwork.Create;
begin
  inherited;

  CreateServerSocket('AsSimulatorServer');

  with CreateClientSocket('AsInstructorClient') do
  begin
    ServerAddress := Setting.InstructorHost;
    ServerPort    := Setting.InstructorPort;
    AutoReconnect := True;
  end;

  StopNetwork;

end;

destructor TERNetwork.Destroy;
begin

  inherited;
end;

procedure TERNetwork.StartNetwork;
begin

  AsServer.Listen(Setting.SimEnginePort);
  Listeners.TriggerEvents(Self, epNetworkDebugInfo, 'Engine Room Network Started at ' + Setting.SimEngineServer);

  inherited;

end;

procedure TERNetwork.StopNetwork;
begin

  AsServer.Stop;
  Listeners.TriggerEvents(Self, epNetworkDebugInfo, 'Engine Room Network Stopped');

  inherited;

end;

end.
