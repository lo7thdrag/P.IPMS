unit uNetworkManager;

interface
{*------------------------------------------------------------------------------

  Network Manager abstract class to manage connection.
  Object can be act as server, clients or both.

  @author  ryu
  @version 2013/09/02 1.0 Initial revision.
  @todo
  @comment
-------------------------------------------------------------------------------}
uses uTCPServer, uTCPClient, ExtCtrls, uListener, uVirtualTime, uThreadTimer,
  Classes, uSteppers, OverbyteIcsWSocket, SysUtils ;

type
  TTCPClients = class
  private

    FClients : TList;

  public
    constructor Create;
    destructor Destroy;override;

    { get all buffered packets }
    procedure GetPackets;

    { add new client }
    function Add(aClientId : String) : TTCPClient;

    { remove client}
    function Remove(aClientId : string) : boolean;

    { get client }
    function Get(aClientId : string) : TTCPClient;overload;
    function Get(aIndex : integer) : TTCPClient;overload;

    { remove all client }
    procedure RemoveAll;

    function Count : integer;

  end;

  TNetworkManager = class
  private
    FListeners      : TListeners;
    FStarted        : Boolean;
    FNetworkThread  : TMSTimer;
    FDelayReconnect : TDelayer;

    {
      atribut ini digunakan jika aplikasi bertindak sebagai server dan
      assignment dilakukan di kelas turunannya.
      Note : Sementara Hanya bisa menjadi 1 server sj.
    }
    FAsServerSocket : TTCPServer;

    {
      atribut ini digunakan jika aplikasi butuh koneksi tcp ke lebih
      dari 1 aplikasi lainnya.
    }
    FAsClientsSocket : TTCPClients; { list of TTCPClient }

    { get packet from network buffer }
    procedure GetPacket;

    { event trigerred by network thread }
    procedure FNetworkThread_OnRunning(const dt: double);virtual;
    procedure FNetworkThread_OnTerminate(sender: TObject);virtual;

    { trigerred by server socket }
    procedure OnClientConnect(const aValue: String);
    procedure OnClientDisconnect(const aValue: String);

    { trigerred by delayer }
    procedure OnDelayTime(Sender : TObject);

    { network log }
    procedure OnNetworkLogStr(const Value : String);

  protected
    { trigerred by client socket }
    procedure OnConnected(Sender : TObject);virtual;
    procedure OnDisconnected(Sender : TObject);virtual;

    { server socket creator }
    procedure CreateServerSocket(aServerID:String);

    { client socket creator }
    function CreateClientSocket(aClientID: String) : TTCPClient;

  public
    constructor Create; virtual;
    destructor  Destroy;override;

    { start network comm }
    procedure StartNetwork;virtual;

    { stop network comm }
    procedure StopNetwork;virtual;

    property Listeners  : TListeners read FListeners;
    property Started    : Boolean read FStarted;

    property AsClients  : TTCPClients read FAsClientsSocket;
    property AsServer   : TTCPServer read FAsServerSocket;

  end;

implementation

uses uDataType;

{ TNetworkManager }

constructor TNetworkManager.Create;
begin

  FAsClientsSocket := TTCPClients.Create;
  FListeners := TListeners.Create;

  FNetworkThread := TMSTimer.Create;
  with FNetworkThread do
  begin

    OnRunning := FNetworkThread_OnRunning;
    OnTerminate := FNetworkThread_OnTerminate;

    Interval := 2;
    Enabled := True;

  end;

  FDelayReconnect := TDelayer.Create;
  with FDelayReconnect do begin

    DInterval := 1;
    Ontime := OnDelayTime;
    Enabled := True;

  end;

end;

function TNetworkManager.CreateClientSocket(aClientID: String): TTCPClient;
begin

  Result := FAsClientsSocket.Add(aClientID);
  Result.OnConnected    := OnConnected;
  Result.OnDisConnected := OnDisConnected;

end;

procedure TNetworkManager.CreateServerSocket(aServerID:String);
begin
  if not Assigned(FAsServerSocket) then begin
    FAsServerSocket  := TTCPServer.Create;
    FAsServerSocket.SocketIdentifier := aServerID;
  end;

  FAsServerSocket.OnClient_Connect    := OnClientConnect;
  FAsServerSocket.OnClient_DisConnect := OnClientDisconnect;
  FAsServerSocket.OnlogRecv           := OnNetworkLogStr;
end;

destructor TNetworkManager.Destroy;
begin
  FListeners.Free;

  with FDelayReconnect do begin

    Enabled := False;
    OnTime  := nil;
    Free;

  end;

  with FNetworkThread do
  begin

    Enabled := False;
    OnRunning := nil;
    Free;

  end;

  FAsClientsSocket.Free;

  inherited;
end;

procedure TNetworkManager.FNetworkThread_OnRunning(const dt: double);
begin

  { get all packets }
  GetPacket;

  { try reconnecting clients }
  FDelayReconnect.Run(dt);

end;

procedure TNetworkManager.FNetworkThread_OnTerminate(sender: TObject);
begin

end;

procedure TNetworkManager.GetPacket;
begin

  { get server packet }
  if Assigned(FAsServerSocket) then
    FAsServerSocket.getPacket;

  { get clients packet }
  FAsClientsSocket.GetPackets;

end;

procedure TNetworkManager.OnClientConnect(const aValue: String);
begin
  { uncomment for specific action, not debugging }
  Listeners.TriggerEvents(Self, epNetworkClientConnect, AsServer);
  Listeners.TriggerEvents(Self, epNetworkClientConnect, aValue);

end;

procedure TNetworkManager.OnClientDisconnect(const aValue: String);
begin
  { uncomment for specific action, not debugging }
  Listeners.TriggerEvents(Self, epNetworkClientConnect, AsServer);
  Listeners.TriggerEvents(Self, epNetworkClientConnect, aValue);

end;

procedure TNetworkManager.OnConnected(Sender: TObject);
begin
  { uncomment for specific action, not debugging }
  Listeners.TriggerEvents(Self, epNetworkConnectedToServer,Sender);

  // sending acknowledge
end;

procedure TNetworkManager.OnDelayTime(Sender: TObject);
var
  i : integer;
  clientSocket : TTCPClient;
begin

  for I := 0 to AsClients.Count - 1 do
  begin

    clientSocket := AsClients.Get(i);

    if (not clientSocket.Connected) and clientSocket.AutoReconnect then

      if (clientSocket.State <> wsConnecting) then begin

        clientSocket.Connect;
      end;

  end;

end;

procedure TNetworkManager.OnDisconnected(Sender: TObject);
begin
  { uncomment for specific action, not debugging }
  Listeners.TriggerEvents(Self, epNetworkDisconnectedFromServer, Sender);
end;

procedure TNetworkManager.OnNetworkLogStr(const Value: String);
begin
  Listeners.TriggerEvents(Self, epNetworkLogRcv, Value);
end;

procedure TNetworkManager.StartNetwork;
begin

  if Assigned(FAsServerSocket) then
  begin
    FAsServerSocket.OnClient_Connect := OnClientConnect;
    FAsServerSocket.OnClient_DisConnect := OnClientDisconnect;
  end;

  { uncomment for specific action, not debugging }
  Listeners.TriggerEvents(Self, epNetworkStart, Integer(1));

  FStarted := true;
end;

procedure TNetworkManager.StopNetwork;
begin
  if Assigned(FAsServerSocket) then
  begin
    FAsServerSocket.OnClient_Connect := nil;
    FAsServerSocket.OnClient_DisConnect := nil;
  end;

  { uncomment for specific action, not debugging }
  Listeners.TriggerEvents(Self, epNetworkStop,Integer(0));

  FStarted := false;
end;

{ TTCPClients }

function TTCPClients.Add(aClientId: String): TTCPClient;
begin

  Result := TTCPClient.Create;
  Result.SocketIdentifier := aClientId;

  FClients.Add(result);

end;

function TTCPClients.Count: integer;
begin
  result := FClients.Count;
end;

constructor TTCPClients.Create;
begin

  FClients := TList.Create;

end;

destructor TTCPClients.Destroy;
var
  i : integer;
  sockItem : TObject;
begin

  for i := 0 to FClients.Count - 1 do
  begin
    sockItem := FClients.Items[i];
    FreeAndNil(sockItem);
  end;

  FClients.Free;

end;

function TTCPClients.Get(aClientId: string): TTCPClient;
var
  i : integer;
  sockItem : TObject;
begin
  result := nil;

  for I := 0 to FClients.Count - 1 do
  begin

    sockItem := FClients.Items[i];
    if sockItem.ClassType = TTCPClient then
      if TTCPClient(sockItem).SocketIdentifier = aClientId then
      begin
        result := TTCPClient(sockItem);
        Break;
      end;
  end;
end;

function TTCPClients.Get(aIndex: integer): TTCPClient;
begin
  result := nil;

  if not (aIndex >= FClients.Count) then
    result := FClients.Items[aIndex];

end;

procedure TTCPClients.GetPackets;
var
  i : integer;
  sockItem : TObject;
begin
  for I := 0 to FClients.Count - 1 do
  begin

    sockItem := FClients.Items[i];
    if sockItem.ClassType = TTCPClient then
      TTCPClient(sockItem).GetPacket;

  end;
  inherited;
end;

function TTCPClients.Remove(aClientId: string): boolean;
var
  i : integer;
  sockItem : TObject;
begin
  result := false;
  for I := 0 to FClients.Count - 1 do
  begin

    sockItem := FClients.Items[i];
    if sockItem.ClassType = TTCPClient then
      if TTCPClient(sockItem).SocketIdentifier = aClientId then
      begin
        FClients.Delete(i);
        sockItem.Free;
        result := true;
        Break;
      end;

  end;
end;

procedure TTCPClients.RemoveAll;
var
  i : integer;
  sockItem : TObject;
begin
  for I := FClients.Count - 1 downto 0 do
  begin

    sockItem := FClients.Items[i];
    sockItem.Free;

  end;
  FClients.Clear;
end;

end.
