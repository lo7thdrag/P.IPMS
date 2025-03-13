unit uLoaderNetwork;

interface

{ *------------------------------------------------------------------------------

  Network Manager class to manage connection for controller system.
  Act as server to IPMS UI client, and as client to sim engine system.

  @author  ryu
  @version 2013/09/02 1.0 Initial revision.
  @todo
  @comment
  ------------------------------------------------------------------------------- }

uses uNetBaseSocket, uTCPServer, uTCPClient, ExtCtrls, uListener,
  uNetworkManager;

type
  TLoaderNetwork = class(TNetworkManager)

  private

    FInstructorSocket: TTCPClient;

  public

    constructor Create; override;
    destructor Destroy; override;

    { start network comm }
    procedure StartNetwork; override;

    { stop network comm }
    procedure StopNetwork; override;

    procedure OnConnected(Sender: TObject); override;
    procedure OnDisconnected(Sender: TObject); override;

    property InstructorSocket : TTCPClient read FInstructorSocket;

  end;

implementation

uses uSetting, uDataType;

{ TNetworkManager }

constructor TLoaderNetwork.Create;
begin
  inherited;

  with CreateClientSocket('AsInstructorClient') do
  begin
    ServerAddress := Setting.InstructorHost;
    ServerPort := Setting.InstructorPort;
    AutoReconnect := True;
  end;
  FInstructorSocket := AsClients.Get('AsInstructorClient');

end;

destructor TLoaderNetwork.Destroy;
begin

  inherited;
end;

procedure TLoaderNetwork.OnConnected(Sender: TObject);
begin
  inherited;
end;

procedure TLoaderNetwork.OnDisconnected(Sender: TObject);
begin
  inherited;

end;

procedure TLoaderNetwork.StartNetwork;
begin

  FInstructorSocket.AutoReconnect := True;

  inherited;
end;

procedure TLoaderNetwork.StopNetwork;
begin

  FInstructorSocket.Disconnect;
  FInstructorSocket.AutoReconnect := false;

  inherited;
end;

end.
