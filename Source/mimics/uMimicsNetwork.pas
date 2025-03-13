unit uMimicsNetwork;

interface
{ *------------------------------------------------------------------------------

  Mimic Network class to manage connection for mimic IPMS system.
  Act as client to LPU Controller system.

  @author  ryu
  @version 2013/09/02 1.0 Initial revision.
  @todo
  @comment
  ------------------------------------------------------------------------------- }

uses uNetworkManager, uTCPClient, ExtCtrls, uDataType;

type
  TMimicsNetwork = class (TNetworkManager)

  private

    FControllerSocket : TTCPClient;
    FInstructorSocket : TTCPClient;

  public
    constructor Create; override;
    destructor Destroy; override;

    { start network comm }
    procedure StartNetwork;override;

    { stop network comm }
    procedure StopNetwork;override;

    procedure OnConnected(Sender : TObject);override;
    procedure OnDisconnected(Sender : TObject);override;

    property  ControllerSocket : TTCPClient read FControllerSocket;
    property  InstructorSocket : TTCPClient read FInstructorSocket;

  end;

implementation

uses uSetting;

{ TMimicsNetwork }

constructor TMimicsNetwork.Create;
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
  FInstructorSocket := AsClients.Get('AsInstructorClient');
end;

destructor TMimicsNetwork.Destroy;
begin
  inherited;
end;

procedure TMimicsNetwork.OnConnected(Sender: TObject);
begin
  inherited;

  Listeners.TriggerEvents(Self, epNetworkDebugInfo,
    'Mimics connected to ' +  (Sender as TTCPClient).ServerAddress);

end;

procedure TMimicsNetwork.OnDisconnected(Sender: TObject);
begin
  inherited;

  Listeners.TriggerEvents(Self, epNetworkDebugInfo,
    'Mimics disconnected from ' + (Sender as TTCPClient).ServerAddress);

end;

procedure TMimicsNetwork.StartNetwork;
begin
  inherited;

  FControllerSocket.AutoReconnect := True;
  FInstructorSocket.AutoReconnect := True;

end;

procedure TMimicsNetwork.StopNetwork;
begin
  inherited;

  FControllerSocket.Disconnect;
  FControllerSocket.AutoReconnect := false;

  FInstructorSocket.Disconnect;
  FInstructorSocket.AutoReconnect := false;

end;

end.
