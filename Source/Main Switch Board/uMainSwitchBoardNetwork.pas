{*------------------------------------------------------------------------------
  MainSwitchBoard Network class to manage connection for MainSwitchBoard system.
  Act as client to VREngine system and Controller System.

  @author  Prince
-------------------------------------------------------------------------------}
unit uMainSwitchBoardNetwork;

interface

uses uNetworkManager, uTCPClient, ExtCtrls, uDataType;

type
  TMainSwitchBoardNetwork = class (TNetworkManager)

  private

    FVREngineSocket : TTCPClient;
    FMainSwitchBoardControllerSocket : TTCPClient;

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
    property MainSwitchBoardControllerSocket : TTCPClient read FMainSwitchBoardControllerSocket;

  end;

implementation

uses uSetting;

{ TMainSwitchBoardNetwork }

constructor TMainSwitchBoardNetwork.Create;
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

  FMainSwitchBoardControllerSocket := AsClients.Get('AsControllerClient');
end;

destructor TMainSwitchBoardNetwork.Destroy;
begin

  inherited;
end;

procedure TMainSwitchBoardNetwork.OnConnected(Sender: TObject);
begin
  inherited;

  Listeners.TriggerEvents(Self, epNetworkDebugInfo, 'MainSwitchBoard connected to ' +  (Sender as TTCPClient).ServerAddress);

end;

procedure TMainSwitchBoardNetwork.OnDisconnected(Sender: TObject);
begin
  inherited;

  Listeners.TriggerEvents(Self, epNetworkDebugInfo, 'MainSwitchBoard disconnected from ' +  (Sender as TTCPClient).ServerAddress);
end;

procedure TMainSwitchBoardNetwork.StartNetwork;
begin
  inherited;

  FVREngineSocket.AutoReconnect := True;
  FMainSwitchBoardControllerSocket.AutoReconnect := True;
end;

procedure TMainSwitchBoardNetwork.StopNetwork;
begin
  inherited;

  FVREngineSocket.Disconnect;
  FVREngineSocket.AutoReconnect := false;

  FMainSwitchBoardControllerSocket.Disconnect;
  FMainSwitchBoardControllerSocket.AutoReconnect := false;

end;

end.
