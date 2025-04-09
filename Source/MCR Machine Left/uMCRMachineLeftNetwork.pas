{*------------------------------------------------------------------------------
  MCRMachineLeft Network class to manage connection for MCRMachineLeft system.
  Act as client to VREngine system and Controller System.

  @author  Prince
-------------------------------------------------------------------------------}
unit uMCRMachineLeftNetwork;

interface

uses uNetworkManager, uTCPClient, ExtCtrls, uDataType;

type
  TMCRMachineLeftNetwork = class (TNetworkManager)

  private

    FVREngineSocket : TTCPClient;
    FMCRMachineLeftControllerSocket : TTCPClient;
    FMCRMachineLeftAlarmSocket : TTCPClient;

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
    property MCRMachineLeftControllerSocket : TTCPClient read FMCRMachineLeftControllerSocket;
    property MCRMachineLeftAlarmSocket : TTCPClient read FMCRMachineLeftAlarmSocket;

  end;

implementation

uses uSetting;

{ TPCSNetwork }

constructor TMCRMachineLeftNetwork.Create;
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

  FMCRMachineLeftControllerSocket := AsClients.Get('AsControllerClient');
  FMCRMachineLeftAlarmSocket := AsClients.Get('AsInstructorClient');
end;

destructor TMCRMachineLeftNetwork.Destroy;
begin

  inherited;
end;

procedure TMCRMachineLeftNetwork.OnConnected(Sender: TObject);
begin
  inherited;

  Listeners.TriggerEvents(Self, epNetworkDebugInfo, 'MCR Machine Left connected to ' +  (Sender as TTCPClient).ServerAddress);

end;

procedure TMCRMachineLeftNetwork.OnDisconnected(Sender: TObject);
begin
  inherited;

  Listeners.TriggerEvents(Self, epNetworkDebugInfo, 'MCR Machine Left disconnected from ' +  (Sender as TTCPClient).ServerAddress);
end;

procedure TMCRMachineLeftNetwork.StartNetwork;
begin
  inherited;

  FVREngineSocket.AutoReconnect := True;
  FMCRMachineLeftControllerSocket.AutoReconnect := True;
  FMCRMachineLeftAlarmSocket.AutoReconnect := True;
end;

procedure TMCRMachineLeftNetwork.StopNetwork;
begin
  inherited;

  FVREngineSocket.Disconnect;
  FVREngineSocket.AutoReconnect := false;

  FMCRMachineLeftControllerSocket.Disconnect;
  FMCRMachineLeftControllerSocket.AutoReconnect := false;

  FMCRMachineLeftAlarmSocket.Disconnect;
  FMCRMachineLeftAlarmSocket.AutoReconnect := false;

end;

end.
