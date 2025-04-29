unit uMainEngine2Network;

interface

uses uNetworkManager, uTCPClient, ExtCtrls, uDataType;

type
   TMainEngine2Network = class (TNetworkManager)

   private
    FVREngineSocket : TTCPClient;
    FMainEngineControllerSocket : TTCPClient;

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
    property MainEngine1ControllerSocket : TTCPClient read FMainEngineControllerSocket;
   end;

implementation

uses uSetting;

{ TPCSNetwork }

constructor TMainEngine2Network.Create;
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

  FMainEngineControllerSocket := AsClients.Get('AsControllerClient');
end;

destructor TMainEngine2Network.Destroy;
begin

  inherited;
end;

procedure TMainEngine2Network.OnConnected(Sender: TObject);
begin
  inherited;

  Listeners.TriggerEvents(Self, epNetworkDebugInfo, 'Main Engine 1 connected to ' +  (Sender as TTCPClient).ServerAddress);

end;

procedure TMainEngine2Network.OnDisconnected(Sender: TObject);
begin
  inherited;

  Listeners.TriggerEvents(Self, epNetworkDebugInfo, 'Main Engine 1 disconnected from ' +  (Sender as TTCPClient).ServerAddress);
end;

procedure TMainEngine2Network.StartNetwork;
begin
  inherited;

  FVREngineSocket.AutoReconnect := True;
  FMainEngineControllerSocket.AutoReconnect := True;
end;

procedure TMainEngine2Network.StopNetwork;
begin
  inherited;

  FVREngineSocket.Disconnect;
  FVREngineSocket.AutoReconnect := false;

  FMainEngineControllerSocket.Disconnect;
  FMainEngineControllerSocket.AutoReconnect := false;
end;

end.
