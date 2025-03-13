{*------------------------------------------------------------------------------
  PCS Network class to manage connection for PCS system.
  Act as client to VREngine system and Controller System.

  @author  ryu
  @version 2013/09/19 1.0 Initial revision.
  @todo
  @comment
-------------------------------------------------------------------------------}
unit uPCSNetwork;

interface

uses uNetworkManager, uTCPClient, ExtCtrls, uDataType;

type
  TPCSNetwork = class (TNetworkManager)

  private

    FVREngineSocket   : TTCPClient;
    FPCSControllerSocket: TTCPClient;
    FservoLampSocket : TTCPClient;

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
    property PCSControllerSocket : TTCPClient read FPCSControllerSocket;
    property servoLampSocket : TTCPClient read FservoLampSocket;

  end;

implementation

uses uSetting;

{ TPCSNetwork }

constructor TPCSNetwork.Create;
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

  FPCSControllerSocket := AsClients.Get('AsControllerClient');

  FservoLampSocket := AsClients.Get('AsInstructorClient');
end;

destructor TPCSNetwork.Destroy;
begin

  inherited;
end;

procedure TPCSNetwork.OnConnected(Sender: TObject);
begin
  inherited;

  Listeners.TriggerEvents(Self, epNetworkDebugInfo,
    'PCS connected to ' +  (Sender as TTCPClient).ServerAddress);

end;

procedure TPCSNetwork.OnDisconnected(Sender: TObject);
begin
  inherited;

  Listeners.TriggerEvents(Self, epNetworkDebugInfo,
    'PCS disconnected from ' +  (Sender as TTCPClient).ServerAddress);
end;

procedure TPCSNetwork.StartNetwork;
begin
  inherited;

  FVREngineSocket.AutoReconnect := True;
  FPCSControllerSocket.AutoReconnect := True;
  FservoLampSocket.AutoReconnect := True;
end;

procedure TPCSNetwork.StopNetwork;
begin
  inherited;

  FVREngineSocket.Disconnect;
  FVREngineSocket.AutoReconnect := false;

  FPCSControllerSocket.Disconnect;
  FPCSControllerSocket.AutoReconnect := false;

  FservoLampSocket.Disconnect;
  FservoLampSocket.AutoReconnect := False;

end;

end.
