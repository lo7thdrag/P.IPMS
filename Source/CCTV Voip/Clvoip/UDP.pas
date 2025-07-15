unit UDP;

// (c)2006 by Paul TOTH <tothpaul@free.fr>
// http://tothpaul.free.fr

{
This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
}

interface

uses
 Windows,Messages,Winsock,SysUtils, Dialogs;

const
 UDP_BASE_ERROR=0;
 UDP_NO_SOCKET =UDP_BASE_ERROR+1;
 UDP_LAST_ERROR=UDP_BASE_ERROR+1;

 hx:array[0..$F] of char='0123456789ABCDEF';

type
 TCustomUDPClient=class
 protected
  fError :integer;
  fSocket:integer;
  fFrom  :TSockAddr;
  procedure SetError(Value:integer);
  procedure FatalError(ErrNo:integer);
  procedure OpenSocket; virtual;
  procedure BindSocket(Port:word);
  property Error:integer read fError write SetError;
 public
  constructor Create;
  destructor Destroy; override;
  procedure Close; virtual;
  property From:TSockAddr read fFrom;
  function Read:string;
 end;

procedure WaitOrKill(var Thread:THandle; Time:cardinal);
function LSwap(c:cardinal):cardinal;
function GetHostName:string;
function GetLocalAddr:integer;
function INetAddr(Host:string):integer;
function IsLocal(Addr:integer):boolean;
function Dump(s:string):string;
function CreateGUID:string;
function CreateID:string;
function URLEncode(const Str:string):string;

implementation

//----------------------------------------------------------------------------//

procedure WaitOrKill(var Thread:THandle; Time:cardinal);
begin
 if Thread=0 then exit;
 if WaitForSingleObject(Thread,Time)=WAIT_TIMEOUT then begin
  TerminateThread(Thread,0);
  CloseHandle(Thread);
  Thread:=0;
 end;
end;

function LSwap(c:cardinal):cardinal;
begin
 Result:=swap(c shr 16)+swap(c) shl 16;
end;

function GetHostName:string;
var
 host:array[0..80] of char;
begin
 if Winsock.gethostname(host,sizeof(host))=0 then
  Result:=host
 else
  Result:='localhost';
end;

function GetLocalAddr:integer;
var
 host:array[0..80] of char;
begin
 if Winsock.gethostname(host,sizeof(host))=0 then
  Result:=INetAddr(host)
 else
  Result:=INADDR_NONE;
end;

function INetAddr(Host:string):integer;
var
 pHost:PChar;
 HostEnt:PHostEnt;
begin
 if Host='' then begin
  Result:=INADDR_NONE;
 end else begin
  pHost:=PChar(Host);
  Result:=inet_addr(pHost);
  if Result=INADDR_NONE then begin
   HostEnt:=gethostbyname(pHost);
   if HostEnt<>nil then Result:=integer(pointer(HostEnt^.h_addr^)^);
  end;
 end;
end;

function IsLocal(Addr:integer):boolean;
// 10.0.0.1 - 10.255.255.254
// 172.16.0.1 - 172.31.255.254
// 192.168.0.1 - 192.168.255.254
var
 i:integer;
begin
 Result:=False;
 i:=addr shr 24;
 if (i=0)or(i=255) then exit;
 i:=(addr shr 8) and 255;
 case addr and 255 of
  10,127: { true } ;
  172: if (i<16)or(i>31) then exit;
  192: if (i<>168) then exit;
  else exit; // not reserved
 end;
 Result:=True;
end;

function Dump(s:string):string;
var
 i:integer;
 b:byte;
begin
 SetLength(Result,2*Length(s));
 for i:=1 to Length(s) do begin
  b:=ord(s[i]);
  Result[2*i-1]:=hx[b shr  4];
  Result[2*i  ]:=hx[b and $f];
 end;
end;

function CoCreateGuid(out guid: TGUID): HResult; stdcall; external 'ole32.dll';

function CreateGUID:string;
var
 guid:TGUID;
begin
 CoCreateGuid(guid);
 SetLength(Result,SizeOf(guid));
 move(guid,Result[1],SizeOf(guid));
end;

function CreateID:string;
begin
 Result:=Dump(CreateGUID);
end;

//----------------------------------------------------------------------------//

constructor TCustomUDPClient.Create;
begin
 fSocket:=INVALID_SOCKET;
end;

destructor TCustomUDPClient.Destroy;
begin
 Close;
 inherited;
end;

procedure TCustomUDPClient.SetError(Value:integer);
begin
 if Value=SOCKET_ERROR then begin
  FatalError(WSAGetLastError);
 end;
end;

procedure TCustomUDPClient.FatalError(ErrNo:integer);
begin
 fError:=ErrNo;
 Abort;
end;

procedure TCustomUDPClient.OpenSocket;
begin
 Close;
 fSocket:=socket(AF_INET,SOCK_DGRAM,IPPROTO_UDP);
 if fSocket=INVALID_SOCKET then FatalError(UDP_NO_SOCKET);
end;

procedure TCustomUDPClient.Close;
begin
 if fSocket<>INVALID_SOCKET then begin
  closesocket(fSocket);
  fSocket:=INVALID_SOCKET;
 end;
end;

procedure TCustomUDPClient.BindSocket(Port:word);
var
 sa:TSockAddr;
begin
 FillChar(sa,SizeOf(sa),0);
 sa.sin_family:=AF_INET;
 sa.sin_port:=htons(Port);
 Error:=bind(fSocket,sa,SizeOf(sa));
end;

function TCustomUDPClient.Read:string;
var
 l,i:integer;
begin
 FillChar(fFrom,SizeOf(fFrom),0);
 fFrom.sin_family:=AF_INET;
 l:=1500;
 SetLength(Result,l);
 i:=SizeOf(fFrom);
 l:=recvfrom(fSocket,Result[1],l,0,fFrom,i);
 if l<=0 then Result:='' else SetLength(Result,l);
end;

function URLEncode(const Str:string):string;
var
 i,e,x,b:integer;
begin
 Result:=Str;
 e:=0;
 for i:=1 to Length(Str) do begin
  case Str[i] of
  // non-ASCII
   #$00..#$1F,#$7F,#$80..#$FF,
  // unsafe
   {' ',}'<','>','"','#','%','}','|','\','^','~', '[', ']', '`',
  // reserved
   ';','/','?',':','@','=','&',
   '$','-','_','.','+','!','*','''','(',')': begin
    Result[i]:='%';
    inc(e);
   end;
   ' ' : Result[i]:='+';
  end;
 end;
 if e=0 then exit;
 x:=Length(Result)+2*e;
 SetLength(Result,x);
 for i:=Length(Str) downto 1 do begin
  if Result[i]='%' then begin
   b:=ord(Str[i]);
   Result[x]:=hx[b and $F]; dec(x);
   Result[x]:=hx[b shr 4]; dec(x);
   dec(e);
  end;
  Result[x]:=Result[i];
  dec(x);
  if e=0 then exit;
 end;
end;

//----------------------------------------------------------------------------//

procedure WSAStartup;
var
  wsa:TWSAData;
begin
  Winsock.WSAStartup($101,wsa);
end;

procedure WSAClean;
begin
  Winsock.WSACleanup
end;

initialization
  WSAStartup;

finalization
  WSAClean
end.

