{*------------------------------------------------------------------------------
  MCRMachineRight Network class to manage connection for MCRMachineRight system.
  Act as client to VREngine system and Controller System.

  @author  Prince
-------------------------------------------------------------------------------}
unit uMCRMachineRightNetwork;

interface

uses uNetworkManager, uTCPClient, ExtCtrls, uDataType;

type
  TMCRMachineRightNetwork = class (TNetworkManager)

  private

    FVREngineSocket : TTCPClient;
    FMCRMachineRightControllerSocket : TTCPClient;
    FMCRMachineRightAlarmSocket : TTCPClient;

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
    property MCRMachineRightControllerSocket : TTCPClient read FMCRMachineRightControllerSocket;
    property MCRMachineRightAlarmSocket : TTCPClient read FMCRMachineRightAlarmSocket;

  end;

implementation

uses uSetting;

{ TPCSNetwork }

constructor TMCRMachineRightNetwork.Create;
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

  FMCRMachineRightControllerSocket := AsClients.Get('AsControllerClient');
  FMCRMachineRightAlarmSocket := AsClients.Get('AsInstructorClient');
end;

destructor TMCRMachineRightNetwork.Destroy;
begin

  inherited;
end;

procedure TMCRMachineRightNetwork.OnConnected(Sender: TObject);
begin
  inherited;

  Listeners.TriggerEvents(Self, epNetworkDebugInfo, 'MCR Machine Left connected to ' +  (Sender as TTCPClient).ServerAddress);

end;

procedure TMCRMachineRightNetwork.OnDisconnected(Sender: TObject);
begin
  inherited;

  Listeners.TriggerEvents(Self, epNetworkDebugInfo, 'MCR Machine Left disconnected from ' +  (Sender as TTCPClient).ServerAddress);
end;

procedure TMCRMachineRightNetwork.StartNetwork;
begin
  inherited;

  FVREngineSocket.AutoReconnect := True;
  FMCRMachineRightControllerSocket.AutoReconnect := True;
  FMCRMachineRightAlarmSocket.AutoReconnect := True;
end;

procedure TMCRMachineRightNetwork.StopNetwork;
begin
  inherited;

  FVREngineSocket.Disconnect;
  FVREngineSocket.AutoReconnect := false;

  FMCRMachineRightControllerSocket.Disconnect;
  FMCRMachineRightControllerSocket.AutoReconnect := false;

  FMCRMachineRightAlarmSocket.Disconnect;
  FMCRMachineRightAlarmSocket.AutoReconnect := false;

end;

end.
