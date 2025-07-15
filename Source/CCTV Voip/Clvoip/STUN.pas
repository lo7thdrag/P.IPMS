unit STUN;

// STUN component for Delphi (c)2006 by Paul TOTH <tothpaul@free.fr>
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

// RFC 3489

interface

uses
 Windows, Messages, Winsock, Classes, UDP;

const
 STUN_DEFAULT_PORT=3478;

{
   All STUN messages consist of a 20 byte header:

    0                   1                   2                   3
    0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |      STUN Message Type        |         Message Length        |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
                            Transaction ID
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
                                                                   |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

   The Message Types can take on the following values:

      0x0001  :  Binding Request
      0x0101  :  Binding Response
      0x0111  :  Binding Error Response
      0x0002  :  Shared Secret Request
      0x0102  :  Shared Secret Response
      0x0112  :  Shared Secret Error Response

   The message length is the count, in bytes, of the size of the
   message, not including the 20 byte header.

   The transaction ID is a 128 bit identifier.  It also serves as salt
   to randomize the request and the response.  All responses carry the
   same identifier as the request they correspond to.

}
 STUN_BINDING_REQUEST             =$0001;
 STUN_BINDING_RESPONSE            =$0101;
 STUN_BINDING_ERROR_RESPONSE      =$0111;
 STUN_SHARED_SECRET_REQUEST       =$0002;
 STUN_SHARED_SECRET_RESPONSE      =$0102;
 STUN_SHARED_SECRET_ERROR_RESPONSE=$0112;

{
   After the header are 0 or more attributes.  Each attribute is TLV
   encoded, with a 16 bit type, 16 bit length, and variable value:

    0                   1                   2                   3
    0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |         Type                  |            Length             |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                             Value                             ....
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

   The following types are defined:

   0x0001: MAPPED-ADDRESS
   0x0002: RESPONSE-ADDRESS
   0x0003: CHANGE-REQUEST
   0x0004: SOURCE-ADDRESS
   0x0005: CHANGED-ADDRESS
   0x0006: USERNAME
   0x0007: PASSWORD
   0x0008: MESSAGE-INTEGRITY
   0x0009: ERROR-CODE
   0x000a: UNKNOWN-ATTRIBUTES
   0x000b: REFLECTED-FROM
}
 STUN_MAPPED_ADDRESS     = $0001;
 STUN_RESPONSE_ADDRESS   = $0002;
 STUN_CHANGE_REQUEST     = $0003;
 STUN_SOURCE_ADDRESS     = $0004;
 STUN_CHANGED_ADDRESS    = $0005;
 STUN_USERNAME           = $0006;
 STUN_PASSWORD           = $0007;
 STUN_MESSAGE_INTEGRITY  = $0008;
 STUN_ERROR_CODE         = $0009;
 STUN_UNKNOWN_ATTRIBUTES = $000A;
 STUN_REFLECTED_FROM     = $000B;

type
 TCustomSTUNClient=class(TCustomUDPClient)
 private
  fActive :boolean;
  fHWnd   :THandle;
  fMsg    :integer;
  fRemote :TSockAddr;
  fTransID:string;
  fThread :THandle;
  procedure ThreadProc;
 protected
  fAddress:integer;
  fPort   :word;
  procedure DoBind; virtual;
 public
  constructor Create(HWnd:THandle; Msg:integer);
  destructor Destroy; override;
  procedure Request(const Host:string);
  procedure ProcessMessage(var Msg);
 end;

 TSTUNClient=class(TCustomSTUNClient)
 private
  EOnBind:TNotifyEvent;
 protected
  procedure DoBind; override;
 public
  property OnBind:TNotifyEvent read EOnBind write EOnBind;
  property Address:integer read fAddress;
  property Port:word read fPort;
 end;

implementation

function StartMe(Sender:TSTUNClient):integer; stdcall;
begin
 try
  Sender.ThreadProc;
  Result:=0;
 except
  Result:=-1;
 end;
end;

constructor TCustomSTUNClient.Create(Hwnd:THandle; Msg:integer);
begin
 inherited Create;
 fHWnd:=HWnd;
 fMsg :=Msg;
 fTransID:=CreateGUID;
end;

destructor TCustomSTUNClient.Destroy;
begin
 WaitOrKill(fThread,10);
 inherited;
end;

procedure TCustomSTUNClient.Request(const Host:string);
var
 id:cardinal;
  s:string;
  w:word;
begin
 OpenSocket;
 BindSocket(STUN_DEFAULT_PORT);
 IsMultiThread:=True;
 fActive:=True;
 fThread:=CreateThread(nil,0,@StartMe,pointer(Self),0,id);
 FillChar(fRemote,SizeOf(fRemote),0);
 fRemote.sin_family:=AF_INET;
 fRemote.sin_port:=htons(STUN_DEFAULT_PORT);
 fRemote.sin_addr.S_addr:=INetAddr(Host);
 SetLength(s,20);
 w:=swap(STUN_BINDING_REQUEST);
 move(w,s[1],2);
 w:=0;
 move(w,s[3],2);
 move(fTransID[1],s[5],16);
 sendto(fSocket,s[1],Length(s),0,fRemote,SizeOf(fRemote));
end;

procedure TCustomSTUNClient.ThreadProc;
var
 s:string;
 c:word;
 w:word;
 l:integer;
 x:integer;
begin
 try
  while fActive do begin
   s:=Read;
   if length(s)<20 then continue;
   if copy(s,5,16)<>fTransID then continue;
   move(s[1],w,2); w:=swap(w);
   if w<>STUN_BINDING_RESPONSE then continue;
   move(s[3],w,2); l:=swap(w);
   if length(s)<20+l then continue;
   x:=21;
   while (l>4) do begin
    move(s[x],c,2); c:=swap(c); inc(x,2);
    move(s[x],w,2); w:=swap(w); inc(x,2);
    dec(l,w+4);
    if c=STUN_MAPPED_ADDRESS then begin
     if w<>8 then continue;
     move(s[x],w,2); w:=swap(w); // IPv4 = 1
     if w<>1 then continue;
     move(s[x+2],w,2); w:=swap(w); // Port
     move(s[x+4],l,4); // IP
     fPort:=w;
     fAddress:=l;
     SendMessage(fHWnd,fMsg,l,w);
     exit;
    end;
    inc(x,w);
   end;
  end; 
 finally
  CloseHandle(fThread);
  fThread:=0;
 end;
end;

procedure TCustomSTUNClient.ProcessMessage(var Msg);
begin
 fAddress:=TMessage(Msg).wParam;
 fPort   :=TMessage(Msg).lParam;
 DoBind;
end;

procedure TCustomSTUNClient.DoBind;
begin
 fActive:=False;
 Close;
end;

//----------------------------------------------------------------------------//

procedure TSTUNClient.DoBind;
begin
 inherited;
 if Assigned(EOnBind) then EOnBind(Self);
end;

end.

