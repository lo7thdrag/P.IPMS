{*------------------------------------------------------------------------------
  DieselGenerator Network class to manage connection for DieselGenerator system.
  Act as client to VREngine system and Controller System.

  @author  Prince
-------------------------------------------------------------------------------}
unit uDieselGeneratorNetwork;

interface

uses uNetworkManager, uTCPClient, ExtCtrls, uDataType;

type
  TDieselGeneratorNetwork = class (TNetworkManager)

  private

    FVREngineSocket   : TTCPClient;
    FDieselGeneratorControllerSocket: TTCPClient;

  public
    constructor Create; override;
    destructor Destroy; override;

    { start network comm }
    procedure StartNetwork;override;

    { stop network comm }
    procedure StopNetwork;override;

    procedure OnConnected(Sender : TObject);override;
    procedure OnDisconnected(Sender : TObject);override;

    property VREngineSocket : TTCPClient read FVREngineSocket;
    property DieselGeneratorControllerSocket : TTCPClient read FDieselGeneratorControllerSocket;

  end;

implementation

uses uSetting;

{ TPCSNetwork }

constructor TDieselGeneratorNetwork.Create;
begin
  inherited;

  with CreateClientSocket('AsSimEngineClient') do
  begin
    ServerAddress := Setting.SimEngineServer;
    ServerPort    := Setting.SimEnginePort;
    AutoReconnect := True;
  end;
  FVREngineSocket := AsClients.Get('AsSimEngineClient');

  with CreateClientSocket('AsInstructorClient') do
  begin
    ServerAddress := Setting.InstructorHost;
    ServerPort    := Setting.InstructorPort;
    AutoReconnect := True;
  end;

  with CreateClientSocket('AsControllerClient') do
  begin
    ServerAddress := Setting.LPUServer;
    ServerPort    := Setting.LPUPort;
    AutoReconnect := True;
  end;

  FDieselGeneratorControllerSocket := AsClients.Get('AsControllerClient');
end;

destructor TDieselGeneratorNetwork.Destroy;
begin

  inherited;
end;

procedure TDieselGeneratorNetwork.OnConnected(Sender: TObject);
begin
  inherited;

  Listeners.TriggerEvents(Self, epNetworkDebugInfo, 'Diesel Generator connected to ' +  (Sender as TTCPClient).ServerAddress);

end;

procedure TDieselGeneratorNetwork.OnDisconnected(Sender: TObject);
begin
  inherited;

  Listeners.TriggerEvents(Self, epNetworkDebugInfo, 'Diesel Generator disconnected from ' +  (Sender as TTCPClient).ServerAddress);
end;

procedure TDieselGeneratorNetwork.StartNetwork;
begin
  inherited;

  FVREngineSocket.AutoReconnect := True;
  FDieselGeneratorControllerSocket.AutoReconnect := True;
end;

procedure TDieselGeneratorNetwork.StopNetwork;
begin
  inherited;

  FVREngineSocket.Disconnect;
  FVREngineSocket.AutoReconnect := false;

  FDieselGeneratorControllerSocket.Disconnect;
  FDieselGeneratorControllerSocket.AutoReconnect := false;

end;

end.
