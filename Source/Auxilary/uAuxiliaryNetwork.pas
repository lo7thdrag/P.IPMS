{*------------------------------------------------------------------------------
  Auxiliary Network class to manage connection for Auxiliary system.
  Act as client to VREngine system and Controller System.

  @author  Prince
-------------------------------------------------------------------------------}
unit uAuxiliaryNetwork;

interface

uses uNetworkManager, uTCPClient, ExtCtrls, uDataType;

type
  TAuxiliaryNetwork = class (TNetworkManager)

  private

    FVREngineSocket : TTCPClient;
    FAuxiliaryControllerSocket : TTCPClient;

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
    property AuxiliaryControllerSocket : TTCPClient read FAuxiliaryControllerSocket;

  end;

implementation

uses uSetting;

{ TMainSwitchBoardNetwork }

constructor TAuxiliaryNetwork.Create;
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

  FAuxiliaryControllerSocket := AsClients.Get('AsControllerClient');
end;

destructor TAuxiliaryNetwork.Destroy;
begin

  inherited;
end;

procedure TAuxiliaryNetwork.OnConnected(Sender: TObject);
begin
  inherited;

  Listeners.TriggerEvents(Self, epNetworkDebugInfo, 'Auxiliary connected to ' +  (Sender as TTCPClient).ServerAddress);

end;

procedure TAuxiliaryNetwork.OnDisconnected(Sender: TObject);
begin
  inherited;

  Listeners.TriggerEvents(Self, epNetworkDebugInfo, 'Auxiliary disconnected from ' +  (Sender as TTCPClient).ServerAddress);
end;

procedure TAuxiliaryNetwork.StartNetwork;
begin
  inherited;

  FVREngineSocket.AutoReconnect := True;
  FAuxiliaryControllerSocket.AutoReconnect := True;
end;

procedure TAuxiliaryNetwork.StopNetwork;
begin
  inherited;

  FVREngineSocket.Disconnect;
  FVREngineSocket.AutoReconnect := false;

  FAuxiliaryControllerSocket.Disconnect;
  FAuxiliaryControllerSocket.AutoReconnect := false;

end;

end.
