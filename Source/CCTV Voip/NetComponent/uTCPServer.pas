unit uTCPServer;

interface

uses
  Classes, SysUtils, OverbyteIcsWSocket, OverbyteIcsWSocketS,
  uNetBaseSocket;

type

//==============================================================================
  TClientConnected = class(TWSocketClient)
  private
    FBuffer   : PAnsiChar;
    FBufferNow: LongWord;
  public

    ConnectedIP: string;
    ConnectTime: TDateTime;
  end;

//==============================================================================

  TTCPServer = class(TNetBaseSocket)
  private

    FOnClient_Connect   : TGetStrProc;
    FOnClient_DisConnect: TGetStrProc;
    FOnSvrChangeState: TChangeState;
    function getClientCount: Integer;
    function getClientConnected(i: Integer): TClientConnected;

  protected

    FIPIndex    : TStringList;
    WSockServer : TWSocketServer;

    function GetChangeState: TChangeState; override;
    procedure SetChangeState(const Value: TChangeState);override;

    procedure WSockServer_OnChangeState(Sender: TObject;
                                 OldState, NewState : TSocketState);

    procedure WSockServer_OnClientConnect(Sender: TObject; Client: TWSocketClient; Error: Word);
    procedure WSockServer_OnClientDisconnect(Sender: TObject; Client: TWSocketClient; Error: Word);


    procedure Client_OnDataAvailable(Sender: TObject; Error: Word);
    procedure Client_OnBGException(Sender: TObject; E: Exception; var CanClose: Boolean);

    function PrepareSendData(const aID: word; aBuffer: PAnsiChar): Boolean; override;

  public

    constructor Create;
    destructor Destroy; override;

    procedure Listen(aPort: string);
    procedure Stop;

    procedure SendData(const aID: word; aBuffer: PAnsiChar); override;

    procedure SendDataExceptThis(const aID: word; aBuffer: PAnsiChar; const ipExcept: string);
    procedure SendDataToIPAddress(const aID: word; aBuffer: PAnsiChar; const ipAdd: string);

    procedure FlushSendData; override;

  public

    property OnClient_Connect: TGetStrProc read FOnClient_Connect
      write FOnClient_Connect;

    property OnClient_DisConnect: TGetStrProc read FOnClient_DisConnect
      write FOnClient_DisConnect;

    property OnStateChange;

    property ClientCount: Integer read getClientCount;
    property Clients[i: Integer]: TClientConnected read getClientConnected;

    property LongIP: Longword read FLongXAddress;

  end;



implementation

{ TTCPServer }

uses
  Windows, Messages, WinSock;

constructor TTCPServer.Create;
begin
  inherited;

  WSockServer := TWSocketServer.Create(nil);
  WSocket     := WSockServer;

  WSockServer.MultiThreaded := False;
  WSockServer.OnChangeState := WSockServer_OnChangeState;

  FIPIndex := TStringList.Create;
  FIPIndex.Sorted := True;

end;

destructor TTCPServer.Destroy;
begin
  FIPIndex.Clear;
  FIPIndex.Free;

  WSocket := nil;
  WSockServer.Free;
  WSockServer := nil;

  inherited;
end;

procedure TTCPServer.SetChangeState(const Value: TChangeState);
begin
  FOnSvrChangeState := Value;
end;

function TTCPServer.GetChangeState: TChangeState;
begin
  result := FOnSvrChangeState;
end;

procedure TTCPServer.WSockServer_OnChangeState(Sender: TObject;
                                 OldState, NewState : TSocketState);
begin
  if Assigned(FOnSvrChangeState) then
    FOnSvrChangeState(sender,  OldState, NewState);
end;

procedure TTCPServer.Listen(aPort: string);
var s: string;
begin
  if WSockServer.State = wsClosed then begin
    WSockServer.OnClientConnect     := WSockServer_OnClientConnect;
    WSockServer.OnClientDisconnect  := WSockServer_OnClientDisconnect;

    WSockServer.Proto := CSOCK_DEF_PROTO;
    WSockServer.Port := aPort;
    WSockServer.Addr := '0.0.0.0';

    WSockServer.LineMode := False;
    WSockServer.LineEdit := False;
    WSockServer.LineEcho := False;

    WSockServer.ClientClass := TClientConnected;
    WSockServer.Banner := '';
    WSockServer.Listen;

    FLongXAddress := StrIp_To_LongIp(WSockServer.LocalAddr);

    FLogStat(DateStr + ': ' + 'Server Listening at port ' + aPort);
    FLogStat('addr : ' + WSockServer.Addr);
    FLogStat('local :' + WSockServer.LocalAddr);
    FLogStat('x addr' + WSockServer.GetXAddr);
  end;
end;

procedure TTCPServer.Stop;
var i: Integer;
    cClient: TWSocketClient;
begin
  for i := 0 to WSockServer.ClientCount - 1 do begin
    cClient := WSockServer.Client[i];
    if cClient.State <> wsClosed then
      cClient.Close;
  end;
  WSockServer.Close;

  WSockServer.OnClientConnect     := nil;
  WSockServer.OnClientDisconnect  := nil;

  FLogStat(DateStr + ': ' + 'Server stopped');
end;

function TTCPServer.PrepareSendData(const aID: word; aBuffer: PAnsiChar): Boolean;
var pid: ^TPacketID;
begin
  if inherited PrepareSendData(aID, aBuffer) then begin
    pid   := @aBuffer^;
    pid.ipSender := FLongXAddress;
  end
  else begin
    Result := False;
  end;
end;

procedure TTCPServer.SendData(const aID: word; aBuffer: PAnsiChar);
var pSize: word;
    i: integer;
    cCon: TClientConnected;
    strTemp: string;
begin
  if WSockServer.ClientCount <= 0 then Exit;

  if not PrepareSendData(aID, aBuffer) then begin
    FLogSend(TimeStr + ': Unregistered Packet ID ' + inttostr(aID));
    Exit;
  end;

  pSize := FRegProcs[aID].recSize;
  strTemp := 'Send ALL: ID ' + IntToStr(aID) + IntToStr(psize) + ' byte ';

  for i := 0 to WSockServer.ClientCount - 1 do begin
    cCon := TClientConnected(WSockServer.Client[i]);

    if (cCon <> nil) and (cCon.State = wsConnected) then begin

      if not cCon.AllSent then
        cCon.Flush;

      FLogSend(TimeStr + ': ' + strTemp + ', to: ' + cCon.ConnectedIP);
      try
        cCon.Send(aBuffer, pSize);
      except
        on e: exception do HandleException(e, cCon);
      end; //end exception
    end;
  end;
end;

procedure TTCPServer.SendDataExceptThis(const aID: word; aBuffer: PAnsiChar;
  const ipExcept: string);
var pSize: word;
    i: integer;
    cCon: TClientConnected;
    strTemp: string;
begin
  if WSockServer.ClientCount <= 0 then Exit;

  if not PrepareSendData(aID, aBuffer) then begin
    FLogSend(TimeStr + ': Unregistered Packet ID ' + inttostr(aID));
    Exit;
  end;

  pSize := FRegProcs[aID].recSize;

  strTemp := 'Send: ID ' + inttostr(aID) + ' EXCEPT ' + ipExcept;

  for i := 0 to WSockServer.ClientCount - 1 do begin
    cCon := TClientConnected(WSockServer.Client[i]);

    if (cCon <> nil) and
      (cCon.ConnectedIP <> ipExcept) and
      (cCon.State = wsConnected) then begin

      if not cCon.AllSent then
        cCon.Flush;

      FLogSend(TimeStr + ': ' + strTemp + ', to: ' + cCon.ConnectedIP);
      try
        cCon.Send(aBuffer, psize);
      except
        on e: exception do HandleException(e, cCon);
      end; //end exception
    end;
  end;
end;

procedure TTCPServer.SendDataToIPAddress(const aID: word; aBuffer: PAnsiChar;
  const ipAdd: string);
var psize: word;
    i: integer;
    cCon: TClientConnected;
begin
  if FIPIndex.Count <= 0 then Exit;

  i := FIPIndex.IndexOf(ipAdd);
  if i < 0 then begin
    FLogSend(TimeStr + ': ' + ipAdd + ' not connected');
    Exit;
  end;
  cCon := TClientConnected(FIPIndex.Objects[i]);

  if (cCon = nil) then Exit;
  if (cCon.State <> wsConnected) then Exit;

  if not PrepareSendData(aID, aBuffer) then begin
    FLogSend(TimeStr + ': Unregistered Packet ID ' + inttostr(aID));
    Exit;
  end;

  pSize := FRegProcs[aID].recSize;

  FLogSend(TimeStr + ':ID ' + IntToStr(aID) + ' to: ' + cCon.ConnectedIP);
  try
    cCon.Send(aBuffer, psize);
  except
    on e: exception do HandleException(e, cCon);
  end; //end exception
end;

procedure TTCPServer.WSockServer_OnClientConnect(Sender: TObject; Client: TWSocketClient;
  Error: Word);
var cCon: TClientConnected;
  ipAdd: string;
  i: integer;
begin
  cCon := TClientConnected(Client);
  GetMem(cCon.FBuffer, CSOCK_BUFFER_SIZE);

  with cCon do begin
    FBufferNow := 0;

    LineMode := False;
    LineEdit := False;
    LineEcho := False;
    OnDataAvailable := Client_OnDataAvailable;
    OnBgException   := Client_OnBgException;
    ConnectTime := Now;
  end;

  ipAdd := cCon.PeerAddr;
  cCon.ConnectedIP := ipAdd;

  i := FIPIndex.IndexOf(ipAdd);
  if i < 0 then
    FIPIndex.AddObject(ipAdd, cCon)
  else
    FIPIndex.Objects[i] := cCon;

  if Assigned(FOnClient_Connect) then
    FOnClient_Connect(ipAdd);

  FLogStat(TimeStr + ': ' + 'Connection from ' + ipAdd);
end;

procedure TTCPServer.WSockServer_OnClientDisconnect(Sender: TObject;
  Client: TWSocketClient; Error: Word);
var cCon: TClientConnected;
  ipAdd: string;
  i: Integer;
begin
  cCon := TClientConnected(Client);

  ipAdd := cCon.PeerAddr;

  i := FIPIndex.IndexOf(ipAdd);
  if i >= 0 then
    FIPIndex.Delete(i);

  if Assigned(FOnClient_DisConnect) then
    FOnClient_DisConnect(ipAdd);

  FreeMem(cCon.FBuffer);
  FLogStat(TimeStr + ': ' + 'Disconnecting ' + ipAdd +
    ', duration: ' + FormatDateTime('hh:nn:ss', Now - cCon.ConnectTime));

end;

procedure TTCPServer.Client_OnBGException(Sender: TObject; E: Exception;
  var CanClose: Boolean);
begin
  FLogStat(TimeStr + ': ' + 'Client exception occured: ' + E.ClassName + ': ' + E.Message);
  CanClose := True;
end;

procedure TTCPServer.Client_OnDataAvailable(Sender: TObject; Error: Word);
var
  lbuffer: PAnsiChar;
  receivedByte, readByte: integer;
  p: pointer;
  findRec: boolean;
  pSize : ^Word;
  recSize: Integer;
  ipSend : string;
  bCount: Integer;
  cCon: TClientConnected;
begin
  cCon := TClientConnected(Sender);
  ipSend := cCon.PeerAddr;

  receivedByte := cCon.RcvdCount;
//  Number of characters in receive buffer but not read yet.

  if receivedByte < 1 then exit;
  FLogRecv(TimeStr + ': ' + inttostr(receivedByte));

  GetMem(lbuffer, receivedByte + 1);
  readByte := TWSocket(Sender).Receive(lbuffer, receivedByte);

  if readByte < 1 then exit;

  p := cCon.FBuffer + cCon.FBufferNow;
  CopyMemory(PAnsiChar(p), lbuffer, readByte);
  Inc(cCon.FBufferNow, readByte);

  p := cCon.FBuffer;
  bCount   := cCon.FBufferNow;
  findRec  := true;
  while findRec and (bCount >= CMAX_PACKET_BYTESIZE) do begin
    pSize   := p;
    recSize := pSize^;
    findRec := bCount >= recSize;
    if (findRec) then begin
      PacketRecognizer(p, recSize, cCon.ConnectedIP); // ambil 1 record, lempar.
      bCount := bCount - recSize;
      p := pByte(Integer(p) + recSize);
    end;
  end;

  if bCount > 0  then  begin
    CopyMemory(cCon.FBuffer, p, bCount); // geser data ke awal FBuffer
  end;
  cCon.FBufferNow := bCount;

  FreeMem(lbuffer);
end;


function TTCPServer.getClientConnected(i: Integer): TClientConnected;
begin
  if i < WSockServer.ClientCount then
    Result := WSockServer.Client[i] as TClientConnected
  else
    Result := nil;

end;

function TTCPServer.getClientCount: Integer;
begin
  Result := FIPIndex.Count;
// kalo pakai WSockServer.ClientCount, waktu event client onDisconnect
// client yg sedang OnDisconnect masih dihitung.

//  Result := WSockServer.ClientCount;

end;


procedure TTCPServer.FlushSendData;
var i: integer;
    cCon: TClientConnected;
begin

  for i := 0 to WSockServer.ClientCount - 1 do begin
    cCon := TClientConnected(WSockServer.Client[i]);

    if (cCon <> nil) and (cCon.State = wsConnected) then begin

      if not cCon.AllSent then begin
        FLogSend(TimeStr + ': flush  ' + cCon.ConnectedIP);
        cCon.Flush;
      end;
    end;
  end;
end;


end.

