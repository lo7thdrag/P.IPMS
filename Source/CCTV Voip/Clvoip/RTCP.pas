unit RTCP;

// RTCP component for Delphi (c)2006 by Paul TOTH <tothpaul@free.fr>
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

{-$define LISTEN} // should we listen for RTCP packets ?

interface

uses Windows,Winsock,UDP,RTP;

type
 TNTPTime=record
  Seconds:cardinal; // seconds since 01/01/1900 00:00
  Fracs  :cardinal; // Round($FFFFFFFF * (ms/1000))
 end;

 TRTCPHeader=record
  Version             : 0..2;
  Padding             : boolean;
  ReceptionReportCount: 0..31;
  PacketType          : byte;
  Length              : word;
  SSRC                : cardinal;
 end;

 TRTCPReport=packed record
 // HEADER (8 bytes)
  shVersion   : byte;     // $81 : Version = 2 , Report Count =1
  shCode      : byte;     // 200
  shLength    : word;     //  12 : (52/4)-1
  shSSRC      : cardinal; //
 // SENDER REPORT (20 bytes)
  srNTPTime   : TNTPTime; // NTPNow()
  srTimestamp : cardinal; // GetTickCount (?)
  srPackets   : cardinal; // Number of Packets
  srBytes     : cardinal; // Number of bytes
 // RECEIVER REPORT (24 bytes)
  srSSRC      : cardinal; // Local SSRC
  srLost      : cardinal; // 0
  srHighest   : word;     // last send sequence
  srSequence  : word;     // last send sequence
  srJitter    : cardinal; // 0
  srLastSR    : cardinal; // middle of srNTPTime
  srDelay     : cardinal; // 1
 // HEADER (8 bytes)
  rhVersion   : byte;     // $81 : Version = 2 , Report Count =1
  rhCode      : byte;     // 201
  rhLength    : word;     //   7 : (32/4)-1
  rhSSRC      : cardinal; // local SSRC
 // RECEIVER REPORT (24 bytes)
  rrSSRC      : cardinal; // remote SSRC
  rrLost      : cardinal; // 0
  rrHighest   : word;     // 0
  rrSequence  : word;     // last Recevied sequence
  rrJitter    : cardinal; // to be computed
  rrLastSR    : cardinal; // same as srLastSR
  rrDelay     : cardinal; // 1
 // HEADER (8 bytes)
  dhVersion   : byte;     // $81 : Version = 2 , no Padding, Report Count =1
  dhCode      : byte;     // 202
  dhLength    : word;     //
  dhSSRC      : cardinal; // local SSRC
 // Source Description (4+ bytes)
  ssCode      : byte;     // 1
  ssLength    : byte;     // Length(ssName)
  ssName      : char;     // var length string
 // Pad
 end;


 TRTPClient=class(TCustomRTPClient)
 end;

 TCustomRTCPClient=class(TCustomUDPClient)
 private
  fRTP:TRTPClient;
  fRemote:TSockAddr;
  fRemoteSSRC :cardinal;
  fReport :string;
  pReport :^TRTCPReport;
  fPackets:cardinal;
  fBytes  :cardinal;
  fReports:integer;
  fStartTime:cardinal;
 {$IFDEF LISTEN}
  fActive:boolean;
  fThread:THandle;
  procedure Listen;
 {$ENDIF}
  procedure SendReport(Bye:boolean);
 public
  constructor Create(RTP:TRTPClient);
  procedure Start(const User,Target:string; Port:word);
  procedure Stop;
  function GetPayload(PayloadType:byte):string;
  function SendPayload(PayloadType:byte; const Payload:string):integer;
  procedure Enter;
  procedure Leave;
  property RTP:TRTPClient read fRTP;
 end;

 TRTCPClient=class(TCustomRTCPClient)
 end;

implementation

uses
 SysUtils;

procedure NTPNow(var Time:TNTPTime);
var
 T:TSystemTime;
 D:TDateTime;
begin
 GetSystemTime(T);
 D:=EncodeDate(T.wYear,T.wMonth,T.wDay)+EncodeTime(T.wHour,T.wMinute,T.wSecond,T.wMilliseconds);
 Time.Seconds:=LSwap(Round((D-2)*SecsPerDay));
 Time.Fracs  :=LSwap(Round($FFFFFFFF*(T.wMilliseconds/1000)));
end;

{$IFDEF LISTEN}
function StartMe(Sender:TCustomRTCPClient):integer; stdcall;
begin
 Sender.Listen;
end;
{$ENDIF}

function RTCPHeaderEncode(const Header:TRTCPHeader):string;
var
 b:byte;
 w:word;
 l:cardinal;
begin
 SetLength(Result,8);
 with Header do begin
  b:=ReceptionReportCount+Version shl 6;
  if Padding   then b:=b or 32;
  Result[1]:=chr(b);
  Result[2]:=chr(PacketType);
  w:=Swap(Length div 4-1);
  move(w,Result[3],2);
  l:=SSRC; LSwap(l);
  move(l,Result[5],4);
 end;
end;

constructor TCustomRTCPClient.Create(RTP:TRTPClient);
begin
 inherited Create;
 fRTP:=RTP;
end;

procedure TCustomRTCPClient.Start(const User,Target:string; Port:word);
var
{$IFDEF LISTEN}
 id:cardinal;
{$ENDIF}
 i:integer;
 l:integer;
 s:string;
begin
// Reset Reports
 s:=User+'@'+GetHostName;
 l:=length(s);
 i:=SizeOf(TRTCPReport)+l;
 i:=(i+3)and(not 3);
 SetLength(fReport,i);
 pReport:=@fReport[1];
 FillChar(pReport^,i,0);
 move(s[1],pReport.ssName,l);
 pReport.shVersion:=$81;
 pReport.shCode   :=200;
 pReport.shLength :=swap(12);
 pReport.shSSRC   :=fRTP.SSRC;
 pReport.srSSRC   :=fRTP.SSRC;
 pReport.srDelay  :=LSwap(1);
 pReport.rhVersion:=$81;
 pReport.rhCode   :=201;
 pReport.rhLength :=swap(7);
 pReport.rhSSRC   :=fRTP.SSRC;
 pReport.rrDelay  :=LSwap(1);
 pReport.dhVersion:=$81;
 pReport.dhCode   :=202;
 pReport.dhLength :=swap(((i-84) div 4)-1);
 pReport.dhSSRC   :=fRTP.SSRC;
 pReport.ssCode   :=1;
 pReport.ssLength :=l;
 fPackets:=0;
 fBytes:=0;
 fReports:=0;
 fStartTime:=GetTickCount;
// Start RTCP
 OpenSocket;
 BindSocket(fRTP.Port+1);
// Start RTP
 fRTP.Start(Target,Port);
// Remote
 fRemote:=fRTP.Remote;
 fRemote.sin_port:=htons(Port+1);
// Listen
{$IFDEF LISTEN}
 if fActive then exit;
 fActive:=True;
 fThread:=CreateThread(nil,0,@StartMe,pointer(Self),0,id);
{$ENDIF}
end;

procedure TCustomRTCPClient.Stop;
begin
  fRTP.Close;
  Close;
end;

function TCustomRTCPClient.GetPayload(PayloadType:byte):string;
var
 s :string;
 hd:^TRTPHeader;
 t :integer;
 d :integer;
begin
 Result:='';
 s:=fRTP.Read;
 if length(s)<13 then exit;

// verify packet
// RTPHeaderDecode(s,hd);
// if (hd.Version<>2)or(hd.PayloadType<>PayloadType) then exit;
 hd:=@s[1];
 if (hd.Version<>$80)or(hd.Payload<>PayloadType) then exit;

// verify source
 if (fRTP.From.sin_addr.S_addr<>fRTP.Remote.sin_addr.S_addr)
 or (fRTP.From.sin_port<>fRTP.Remote.sin_port) then begin
//  exit; ... ?!
 end;

// verify SSRC
 if fRemoteSSRC=0 then begin
  fRemoteSSRC:=hd.SSRC
 end else begin
//  if hd.SSRC<>fRemoteSSRC then exit;  ... ?!
 end;

// ok !
 Result:=copy(s,13,MaxInt);

(*
// jitter
 t:=GetTickCount-hd.TimeStamp;
 d:=t-fTransit;
 fTransit:=t;
 if (d<0) then d:=-d;
 inc(fJitter,(d-fJitter +8) shr 4);

 fReceiver.Highest :=hd.SequenceNumber;
 fReceiver.Sequence:=hd.SequenceNumber;
*)
 pReport.rrSSRC    :=hd.SSRC;
 pReport.rrSequence:=hd.Sequence;
end;

function TCustomRTCPClient.SendPayload(PayloadType:byte; const Payload:string):integer;
var
 e:integer;
begin
 if fReports=0 then SendReport(False);
 inc(fReports);
 if fReports=150 then fReports:=0;
 inc(fPackets);
 inc(fBytes,Length(Payload));
 pReport.srHighest:=swap(fRTP.Sequence); // before it change
 pReport.srSequence:=pReport.srHighest;
 Result:=fRTP.SendPayload(PayloadType,Payload);
end;

{$IFDEF LISTEN}
procedure TCustomRTCPClient.Listen;
// this is for debug purpose, freephonie.net doesn't seems to send any RTCP packet !
var
 sa:TSockAddr;
 si:integer;
 ss:string;
 sl:integer;
 rc:integer;
 hd:TRTCPHeader;
begin
 try
  sl:=1500;
  SetLength(ss,sl);
  while fActive do begin
   FillChar(sa,SizeOf(sa),0);
   sa.sin_family:=AF_INET;
   si:=SizeOf(sa);
   rc:=recvfrom(fSocket,ss[1],sl,0,sa,si);
   if rc>0 then begin
    WriteLn('RTCP received from ',inet_ntoa(sa.sin_addr),':',ntohs(sa.sin_port),' (');
    RTCPHeaderDecode(ss,hd);
    WriteLn(' Version    : ',hd.Version);
    WriteLn(' PacketType : ',hd.PacketType);
    WriteLn(' Length     : ',rc);
    WriteLn(')');
   end;
  end;
 finally
  CloseHandle(fThread);
  fThread:=0;
 end;
end;
{$ENDIF}

procedure TCustomRTCPClient.Enter;
begin
 fRemoteSSRC:=0;
 SendPayload(8,'');
end;

procedure TCustomRTCPClient.Leave;
begin
 SendReport(True);
{$IFDEF LISTEN}
 fActive:=False;
 WaitOrKill(fThread,10);
{$ENDIF}
end;

procedure TCustomRTCPClient.SendReport(Bye:boolean);
var
 Hd:TRTCPHeader;
 s :string;
 t :cardinal;
begin
 if pReport=nil then exit; // when .Leave is called before .Start...
(*
 t:=GetTickCount;
 if t-fReport.RTPTimestamp<100 then exit;
// Time
 NTPNow(fReport.NTPTime);
*)
 NTPNow(pReport.srNTPTime);
 pReport.srTimestamp:=LSwap(GetTickCount-fStartTime);
 pReport.srPackets:=LSwap(fPackets);
 pReport.srBytes:=LSwap(fBytes);
(*
 fReport.RTPTimestamp:=t;
 fSender.LastSR:=fReport.NTPTime.Seconds shl 16+fReport.NTPTime.Fracs shr 16;
 fSender.DelaySinceLastSR:=1;

 fReceiver.InterarrivalJitter:=fJitter shr 4;
 fReceiver.LastSR:=fSender.LastSR;
 fReceiver.DelaySinceLastSR:=1;
*)
 pReport.srLastSR:=pReport.srNTPTime.Seconds shr 16+pReport.srNTPTime.Fracs shl 16;
 pReport.rrLastSR:=pReport.srLastSR;

(*
      If Si is the RTP timestamp from packet i, and Ri is the time of
      arrival in RTP timestamp units for packet i, then for two packets
      i and j, D may be expressed as

         D(i,j) = (Rj - Ri) - (Sj - Si) = (Rj - Sj) - (Ri - Si)

      The interarrival jitter SHOULD be calculated continuously as each
      data packet i is received from source SSRC_n, using this
      difference D for that packet and the previous packet i-1 in order
      of arrival (not necessarily in sequence), according to the formula

         J(i) = J(i-1) + (|D(i-1,i)| - J(i-1))/16

      Whenever a reception report is issued, the current value of J is
      sampled.
*)
(*
 Hd.Version:=2;
 Hd.Padding:=False;
 Hd.ReceptionReportCount:=1;
 Hd.PacketType:=200;
 Hd.Length:=52;
 Hd.SSRC:=fRTP.SSRC;

 s:=RTCPHeaderEncode(Hd)+RTCPSenderReportEncode(fReport)+RTCPReportBlockEncode(fSender);

 Hd.PacketType:=201;
 Hd.Length:=32;
 s:=s+RTCPHeaderEncode(Hd)+RTCPReportBlockEncode(fReceiver);

 Hd.PacketType:=202;
 Hd.Length:=Length(fCName)+8;
 s:=s+RTCPHeaderEncode(Hd)+fCName;
*)
 s:=fReport;
 if Bye then begin
  Hd.Version:=2;
  Hd.Padding:=False;
  Hd.ReceptionReportCount:=1;
  Hd.SSRC:=fRTP.SSRC;
  Hd.PacketType:=203;
  Hd.Length:=8+4;
  s:=s+RTCPHeaderEncode(Hd)+#3'BYE';
 end;

 sendto(fSocket,s[1],Length(s),0,fRemote,SizeOf(fRemote));
end;

end.

