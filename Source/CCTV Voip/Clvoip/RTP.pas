unit RTP;

// RTP component for Delphi (c)2006 by Paul TOTH <tothpaul@free.fr>
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
 Windows, Messages, Classes, Winsock, SysUtils, UDP;

const
// RTP_DEFAULT_PORT=5004;

// RTP Error
 RTP_HOST_NOT_FOUND=1;
 RTP_NO_SOCKET     =2;
 RTP_READ_ERROR    =3;
 RTP_WRITE_ERROR   =4;

type
{
  0                   1                   2                   3
  0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 |V=2|P|X|  CC   |M|     PT      |       sequence number         |
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 |                           timestamp                           |
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 |           synchronization source (SSRC) identifier            |
 +=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+
}
 TRTPHeader=packed record
 // HEADER 12 bytes
  Version  : byte;      // $80  : Version = 2
  Payload  : byte;      //   8  : PCMA
  Sequence : word;
  Timestamp: cardinal;
  SSRC     : cardinal;
 // PCMA PayLoad...
 end;
(*
 TRTPHeader=record
  Version       :0..3;
  Padding       :boolean;
  Extension     :boolean;
  CSRCCount     :0..15;
  Marker        :boolean;
  PayloadType   :0..127;
  SequenceNumber:word;
  TimeStamp     :cardinal;
  SSRC          :cardinal;
 end;
*)
 TCustomRTPClient=class(TCustomUDPClient)
 private
  fLocalAddr:string;
  fPort     :word;
  fRemote   :TSockAddr;
  fError    :integer;
  fSSRC     :cardinal;
  fSequence :cardinal;
  fRTP_DEFAULT_PORT : Integer;
 protected
  function SendPayload(PayloadType:byte; const Payload:string):integer;
  property Error:integer read fError write SetError;
 public
  constructor Create(ARTP_Port: Integer);
  procedure Start(Target:string; Port:word);
  procedure Stop;
  property LocalAddr:string read fLocalAddr;
  property Port:word read fPort;
  property Remote:TSockAddr read fRemote;
  property SSRC:cardinal read fSSRC;
  property Sequence:cardinal read fSequence;
 end;

//function RTPHeaderEncode(const Header:TRTPHeader):string;
//procedure RTPHeaderDecode(const Data:string; var Header:TRTPHeader);

implementation

(*
function RTPHeaderEncode(const Header:TRTPHeader):string;
var
 b:byte;
 w:word;
 l:cardinal;
begin
 SetLength(Result,12);
 with Header do begin
  b:=CSRCCount+Version shl 6;
  if Padding   then b:=b or 32;
  if Extension then b:=b or 16;
  Result[1]:=chr(b);
  b:=PayloadType;
  if Marker then b:= b or 128;
  Result[2]:=chr(b);
  w:=Swap(SequenceNumber);
  move(w,Result[3],2);
  l:=Timestamp; LSwap(l);
  move(l,Result[5],4);
  l:=SSRC; LSwap(l);
  move(l,Result[9],4);
 end;
end;

procedure RTPHeaderDecode(const Data:string; var Header:TRTPHeader);
var
 b:byte;
begin
 FillChar(Header,SizeOf(Header),0);
 if Length(Data)<12 then exit;
 with Header do begin
  b:=ord(Data[1]);
  Version:=b shr 6;
  Padding:=(b and 32)>0;
  Extension:=(b and 16)>0;
  CSRCCount:=b and 15;
  b:=ord(Data[2]);
  Marker:=(b and 128)>0;
  PayloadType:=b and 127;
  Move(Data[3],SequenceNumber,2);
  SequenceNumber:=swap(SequenceNumber);
  Move(Data[5],Timestamp,4);
  LSwap(Timestamp);
  Move(Data[9],SSRC,4);
  LSwap(SSRC);
 end;
end;
*)
//----------------------------------------------------------------------------//

constructor TCustomRTPClient.Create(ARTP_Port: Integer);
var
 ad:integer;
begin
 inherited Create;
 fSSRC  :=getTickCount*100+cardinal(self) mod 100;
// find host address
 ad:=GetLocalAddr;
 if ad=INADDR_NONE then FatalError(RTP_HOST_NOT_FOUND);
 fLocalAddr:=inet_ntoa(in_addr(ad));
 fPort:=ARTP_PORT;
end;

procedure TCustomRTPClient.Start(Target:string; Port:word);
begin
 OpenSocket;
 BindSocket(fPort);
 FillChar(fRemote,SizeOf(fRemote),0);
 fRemote.sin_family:=AF_INET;
 fRemote.sin_port:=htons(Port);
 fRemote.sin_addr.S_addr:=INetAddr(Target);
 fSequence:=0;
end;

procedure TCustomRTPClient.Stop;
begin
  Close;
end;

function TCustomRTPClient.SendPayload(PayloadType:byte; const Payload:string):integer;
var
 hd:^TRTPHeader;
 pk:string;
begin
(*
 hd.Version:=2;
 hd.Padding:=False;
 hd.Extension:=False;
 hd.CSRCCount:=0;
 hd.Marker:=False;
 hd.PayloadType:=PayloadType;
 hd.SequenceNumber:=fSequence;
 hd.TimeStamp:=getTickCount;
 hd.SSRC:=fSSRC;
 pk:=RTPHeaderEncode(hd)+Payload;
*)
 SetLength(pk,SizeOf(TRTPHeader));
 hd:=@pk[1];
 hd.Version:=$80;
 hd.Payload:=PayloadType;
 hd.Sequence:=swap(fSequence);
 hd.Timestamp:=LSwap(GetTickCount);
 hd.SSRC:=fSSRC;
 pk:=pk+Payload;
 Result:=sendto(fSocket,pk[1],Length(pk),0,fRemote,SizeOf(fRemote));
 inc(fSequence);
end;

end.

