unit g711a;

// A Law PCMA codec (c)2006 by Paul TOTH <tothpaul@free.fr>
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

{-$define log}

{$define insert_dtmf}
{-$define callback}

interface

uses
 Windows, MMSystem,Classes,
 SysUtils,
 UDP, RTP, RTCP, DTMF;

const
 IN_SIZE  =30*16; // 30 ms, this is a built-in ptime !
                  // 16 bytes per ms (16000 bps)
 IN_COUNT =20;
 OUT_SIZE =30*16; // 30 ms
 OUT_COUNT=20;

type
 TCustomPCMA=class
 private
  fHwnd   :THandle;
  fMsg    :integer;
  fLock1  :TRTLCriticalSection;
//  fLock2  :TRTLCriticalSection;
  fDevOut :integer; // DevID
  fDevIn  :integer; // DevID
  fWaveOut:HWaveOut;  // MCI Handle
  fWaveIn :HWaveIn;
  fWOutHdr:array[0..OUT_COUNT-1] of TWaveHdr;
  fWInHdr :array[0..IN_COUNT-1] of TWaveHdr;

  //nando edited
  FisNoRx : Boolean;
  FisRecord : Boolean;

 protected
  fOutIdx :integer;
  fSample :string;
  procedure CloseOut;
  procedure CloseIn;
  function OpenOut:boolean;
 public
  StreamWav : TFileStream;

  constructor Create(HWnd:THandle ; id: string);
  destructor Destroy; override;
  function OpenIn:boolean;
  procedure Play(const Data:string);
  procedure Close; virtual; abstract;
  property DevOut:integer read fDevOut write fDevOut;
  property DevIn :integer read fDevIn  write fDevIn;

  property isNoRx : boolean read fisNoRx write fisNoRx;
  property isRecord : Boolean read FisRecord write FisRecord;
 end;

 TPCMA=class(TCustomPCMA)
 private
  fRTCP   :TCustomRTCPClient;
  fThread :THandle; // recv data
  fActive :boolean;
  procedure ThreadProc;
  procedure Send(const Data:string);
 public
  destructor Destroy; override;
  procedure Listen(Msg:integer; RTCP:TCustomRTCPClient);
  procedure SendDTMF(Code:integer);
  procedure WaveInMessage(hWaveIn:THandle; Header:PWaveHdr);
  procedure Close; override;
  property Active:boolean read fActive;
 end;

function PCM2PCMA(const Str:string):string;
function PCMA2PCM(const Str:string):string;

implementation

function PCM2PCMA(const Str:string):string;
const
 SEG_SHIFT=4;
 SEG_MASK=$70;
 QUANT_MASK=15;
var
 l,i:integer;
 s:smallint;
 w:word absolute s;
 mask:byte;
// amp:word;
begin
 Result:='';
 l:=Length(Str);
 if l mod 160<>0 then exit;
 l:=l div 2;
 SetLength(Result,l);
// amp:=0;
 for i:=1 to l do begin
  move(Str[2*i-1],s,2);
//  if abs(s)>amp then amp:=abs(s);
  if s<0 then begin
   mask:=$55;
   s:=-s-8;
  end else begin
   mask:=$D5;
  end;
  case s of
  -32768..$00FF: w:=(0 shl SEG_SHIFT) or ((w shr  4) and QUANT_MASK);
   $0100..$01FF: w:=(1 shl SEG_SHIFT) or ((w shr  4) and QUANT_MASK);
   $0200..$03FF: w:=(2 shl SEG_SHIFT) or ((w shr  5) and QUANT_MASK);
   $0400..$07FF: w:=(3 shl SEG_SHIFT) or ((w shr  6) and QUANT_MASK);
   $0800..$0FFF: w:=(4 shl SEG_SHIFT) or ((w shr  7) and QUANT_MASK);
   $1000..$1FFF: w:=(5 shl SEG_SHIFT) or ((w shr  8) and QUANT_MASK);
   $2000..$3FFF: w:=(6 shl SEG_SHIFT) or ((w shr  9) and QUANT_MASK);
   $4000..$7FFF: w:=(7 shl SEG_SHIFT) or ((w shr 10) and QUANT_MASK);
  else w:=$7F;
  end;
{
  if s<$00FF then w:=(0 shl SEG_SHIFT) or ((w shr  4) and QUANT_MASK) else
  if s<$01FF then w:=(1 shl SEG_SHIFT) or ((w shr  4) and QUANT_MASK) else
  if s<$03FF then w:=(2 shl SEG_SHIFT) or ((w shr  5) and QUANT_MASK) else
  if s<$07FF then w:=(3 shl SEG_SHIFT) or ((w shr  6) and QUANT_MASK) else
  if s<$0FFF then w:=(4 shl SEG_SHIFT) or ((w shr  7) and QUANT_MASK) else
  if s<$1FFF then w:=(5 shl SEG_SHIFT) or ((w shr  8) and QUANT_MASK) else
  if s<$3FFF then w:=(6 shl SEG_SHIFT) or ((w shr  9) and QUANT_MASK) else
  if s<$7FFF then w:=(7 shl SEG_SHIFT) or ((w shr 10) and QUANT_MASK) else w:=$7F;
}
  Result[i]:=chr(w xor mask);
 end;
// if amp<300 then Result:='' else Write(amp,' ');
end;

function alaw2linear(a_val:byte):word;
const
 QUANT_MASK=15;
 SEG_MASK=$70;
 SEG_SHIFT=4;
 SIGN_BIT=$80;
var
 t:integer;
 seg:integer;
begin
 a_val :=a_val xor $55;
 t := (a_val and QUANT_MASK) shl 4;
 seg := (a_val and SEG_MASK) shr SEG_SHIFT;
 case seg of
  0: inc(t,8);
  1: inc(t,$108);
  else
   inc(t,$108);
   t:=t shl (seg-1);
 end;
 if (a_val and SIGN_BIT)=0 then t:=not t;
 Result:=t;
end;

function PCMA2PCM(const Str:string):string;
var
 l,i:integer;
 w:word;
begin
 l:=Length(Str);
 if l mod 80<>0 then begin
  Result:='';
  exit;
 end;

 SetLength(Result,2*l);
 for i:=1 to l do begin
  w:=alaw2linear(ord(Str[i]));
  Result[2*i-1]:=chr(w);
  Result[2*i  ]:=chr(w shr 8);
 end;
end;

function Start(Sender:TPCMA):integer; stdcall;
begin
 try
  Sender.ThreadProc;
  Result:=0;
 except
  Result:=-1;
 end;
end;

//----------------------------------------------------------------------------//
constructor TCustomPCMA.Create(HWnd:THandle ; id: string);
var
 i :integer;
begin
 fisNoRx    := False;
 fisRecord  := False;
 
 StreamWav  := TFileStream.Create('C:\temp\Record-' + id + '.dat', fmCreate or fmOpenWrite);

 fHwnd:=HWnd;
 InitializeCriticalSection(fLock1);
// InitializeCriticalSection(fLock2);
 fDevOut:=-2; // -1 is WAVE_MAPPER
 fDevIn :=-2;
 fWaveOut:=0;
 fWaveIn :=0;
// out buffers
 FillChar(fWOutHdr,SizeOf(fWOutHdr),0);
 for i:=Low(fWOutHdr) to High(fWOutHdr) do begin
  GetMem(fWOutHdr[i].lpData,OUT_SIZE);
  fWOutHdr[i].dwBufferLength:=OUT_SIZE;
 end;
// in buffers
 FillChar(fWInHdr,SizeOf(fWInHdr),0);
 for i:=Low(fWInHdr) to High(fWInHdr) do begin
  GetMem(fWInHdr[i].lpData,IN_SIZE);
  fWInHdr[i].dwBufferLength:=IN_SIZE;
 end;
end;

destructor TCustomPCMA.Destroy;
var
 i:integer;
begin
 Close;

 StreamWav.Free;

 for i:=Low(fWOutHdr) to High(fWOutHdr) do FreeMem(fWOutHdr[i].lpData);
 for i:=Low(fWInHdr)  to High(fWInHdr)  do FreeMem(fWInHdr[i].lpData);
 DeleteCriticalSection(fLock1);
// DeleteCriticalSection(fLock2);
 inherited;
end;

function TCustomPCMA.OpenOut:boolean;
var
 WF:TWaveFormatEx;
 i :integer;
begin
 CloseOut;
 Result:=False;
 WF.wBitsPerSample  := 16;
 WF.wFormatTag      := WAVE_FORMAT_PCM;
 WF.nChannels       := 1;
 WF.nSamplesPerSec  := 8000;
 WF.nAvgBytesPerSec := 16000;
 WF.nBlockAlign     := 2;
 WF.cbSize          := 0;
 EnterCriticalSection(fLock1);
 try
  if waveOutOpen(@fWaveOut,fDevOut,@WF,0,0,CALLBACK_NULL)<>MMSYSERR_NOERROR then raise Exception.Create('Impossible d''accéder au micro');
  for i:=Low(fWOutHdr) to High(fWOutHdr) do begin
   waveOutPrepareHeader(fWaveOut,@fWOutHdr[i],SizeOf(TWaveHdr));
   fWOutHdr[i].dwUser:=0;
  end;
  fOutIdx:=0;
  Result:=True;
 finally
  LeaveCriticalSection(fLock1);
 end;
end;

procedure TCustomPCMA.CloseOut;
var
 i:integer;
begin
 EnterCriticalSection(fLock1);
 try
  if fWaveOut<>0 then begin
   waveOutReset(fWaveOut);
   for i:=Low(fWOutHdr) to High(fWOutHdr) do
    //while
    waveOutUnprepareHeader(fWaveOut,@fWOutHdr[i],SizeOf(TWaveHdr));
    //=WAVERR_STILLPLAYING; do sleep(0);
   waveOutClose(fWaveOut);
   fWaveOut:=0;
  end;
 finally
  LeaveCriticalSection(fLock1);
 end;
end;

{$ifdef callback}
procedure waveInProc(hwi:HWaveIn; uMsg:UINT; dwInstance,dwParam1,dwParam2:cardinal); stdcall;
begin
 case uMsg of
  WIM_DATA : TPCMA(dwInstance).WaveInMessage(hwi,PWaveHdr(dwParam1));
 end;
end;
{$endif}

function TCustomPCMA.OpenIn:boolean;
var
 WF :TWaveFormatEx;
 e,i:integer;
begin
{$ifdef log}WriteLn('OpenIn...(close)');{$endif}
 CloseIn;
 Result:=False;
 WF.wBitsPerSample  := 16;
 WF.wFormatTag      := WAVE_FORMAT_PCM;
 WF.nChannels       := 1;
 WF.nSamplesPerSec  := 8000;
 WF.nAvgBytesPerSec := 16000;
 WF.nBlockAlign     := 2;
 WF.cbSize          := 0;
// EnterCriticalSection(fLock2);
 try
 {$ifdef log}WriteLn('-waveInOpen');{$endif}
 {$ifdef callback}
  if waveInOpen(@fWaveIn,fDevIn,@WF,cardinal(@waveInProc),cardinal(Self),CALLBACK_FUNCTION)<>MMSYSERR_NOERROR then exit;
 {$else}
  e:=waveInOpen(@fWaveIn,fDevIn,@WF,fHWnd,0,CALLBACK_WINDOW);
  if e<>MMSYSERR_NOERROR then begin
  {$ifdef log}WriteLn('!waveInOpen=',e);{$endif}
   exit;
  end;
 {$endif}
  for i:=Low(fWInHdr) to High(fWInHdr) do begin
  {$ifdef log}WriteLn('-waveInPrepareHeader');{$endif}
   waveInPrepareHeader(fWaveIn,@fWInHdr[i],SizeOf(TWaveHdr));
  {$ifdef log}WriteLn('-waveInAddBuffer');{$endif}
   if waveInAddBuffer(fWaveIn,@fWInHdr[i],SizeOf(TWaveHdr))<>MMSYSERR_NOERROR then exit;
  end;
 {$ifdef log}WriteLn('-waveInStart');{$endif}
  if waveInStart(fWaveIn)<>MMSYSERR_NOERROR then exit;
  Result:=True;
 finally
//  LeaveCriticalSection(fLock2);
 end;
end;

procedure TCustomPCMA.CloseIn;
var
 e,i:integer;
begin
{$ifdef log}WriteLn('CloseIn');{$endif}
// EnterCriticalSection(fLock2);
 try
  if fWaveIn<>0 then begin
   e:=waveInStop(fWaveIn);
   {$ifdef log}writeln('-waveInStop=',e);{$endif}
   e:=waveInReset(fWaveIn);
   {$ifdef log}writeln('-waveInReset=',e);{$endif}
   for i:=Low(fWInHdr) to High(fWInHdr) do begin
    e:=waveInUnprepareHeader(fWaveIn,@fWInHdr[i],SizeOf(TWaveHdr));
   {$ifdef log}writeln('-waveInUnPrepareHeader=',e);{$endif}
   end;
   e:=waveInClose(fWaveIn);
  {$ifdef log}writeln('-waveInClose=',e);{$endif}
   fWaveIn:=0;
  end;
 finally
//  LeaveCriticalSection(fLock2);
 end;
end;

procedure TCustomPCMA.Play(const Data:string);
var
 l,x,e:integer;
begin
 EnterCriticalSection(fLock1);
 try
  if fWaveOut=0 then exit;
 {$ifdef insert_dtmf}
  if fSample='' then fSample:=Data; { else play DTMF }
 {$else}
  fSample:=fSample+Data; // on ignore les anciennes data...ou pas
 {$endif}
  l:=Length(fSample);
  x:=1;
  try
   while l>=OUT_SIZE do begin
    if fWOutHdr[fOutIdx].dwUser=1 then begin
   //while (fWOutHdr[fOutIdx].dwFlags AND WHDR_DONE)=0 do sleep(0);
     if (fWOutHdr[fOutIdx].dwFlags AND WHDR_DONE)=0 then begin
      PostMessage(fHWnd,fMsg,5,0);
      exit;
     end;
    end;
    Move(fSample[x],fWOutHdr[fOutIdx].lpData^,OUT_SIZE);
    inc(x,OUT_SIZE);
    dec(l,OUT_SIZE);
    e:=waveOutWrite(fWaveOut,@fWOutHdr[fOutIdx],SizeOf(TWaveHdr));
    if e=MMSYSERR_NOERROR then begin
     fWOutHdr[fOutIdx].dwUser:=1;
     inc(fOutIdx);
     if fOutIdx>High(fWOutHdr) then fOutIdx:=Low(fWOutHdr);
     PostMessage(fHWnd,fMsg,6,0);
    end else begin
     PostMessage(fHWnd,fMsg,7,e);
    end;
   end;
  finally
  {$ifdef insert_dtmf}
   fSample:=''; // drop unplayed data
  {$else}
   fSample:=copy(fSample,x,l);
  {$endif}
  end;
 finally
  LeaveCriticalSection(fLock1);
 end;
end;

//----------------------------------------------------------------------------//

destructor TPCMA.Destroy;
begin
 Listen(0,nil);
 inherited;
end;

procedure TPCMA.Close;
begin
 CloseIn;
 fActive:=False;
 WaitOrKill(fThread,10);
 CloseOut;
end;

procedure TPCMA.Listen(Msg:integer; RTCP:TCustomRTCPClient);
var
 id:cardinal;
begin
 Close;
 fRTCP:=RTCP;
 if fRTCP=nil then exit;
 fMsg:=Msg;
 IsMultiThread:=True;
 fActive:=True;
 fThread:=CreateThread(nil,0,@Start,pointer(Self),0,id);
// OpenIn;
end;

procedure TPCMA.SendDTMF(Code:integer);
var
 wav:string;
 payload:string;
begin
 wav:=DTMF.GetDTMF(Code,3*160);
 payload:=PCM2PCMA(wav);
 Send(payload);
{$ifdef insert_dtmf}
 fSample:=wav;
{$else}
 Play(wav); // local echo
{$endif}
end;

procedure TPCMA.Send(const Data:string);
var
 x,l,e:integer;
 s:string;
begin
// EnterCriticalSection(fLock2);
 try
  l:=Length(Data);
  x:=1;
  while l>240 do begin
   e:=fRTCP.SendPayload(8,copy(Data,x,240));
   PostMessage(fHWnd,fMsg,8,e);
   inc(x,240);
   dec(l,240);
  end;
  if l=0 then exit;
  if x>1 then s:=copy(Data,x,l) else s:=Data;
  fRTCP.SendPayload(8,s); // Send over UDP
 finally
//  LeaveCriticalSection(fLock2);
 end;
end;

procedure TPCMA.ThreadProc;
var
 s:string;
begin
 try
  SendMessage(fHWnd,fMsg,0,0);
  if OpenOut then begin
    while fActive do begin
     s:=fRTCP.GetPayload(8);
     if s='' then
      PostMessage(fHWnd,fMsg,3,0) // erreur de paquet
     else begin
      PostMessage(fHWnd,fMsg,1,0);
      if not fisNoRx then
      begin
        Play(PCMA2PCM(s));
      end;
      
      if fisRecord then
      begin
        StreamWav.Write((@s[1])^, Length(s));
      end;
     end;
    end;
  end;
 finally
  SendMessage(fHWnd,fMsg,2,0);
  CloseHandle(fThread);
  fThread:=0;
 end;
end;

procedure TPCMA.WaveInMessage(hWaveIn:THandle; Header:PWaveHdr);
var
 s,p:string;
begin
 with Header^ do begin
  if (dwBytesRecorded=IN_SIZE) then begin
   SetLength(s,IN_SIZE);
   move(lpData^,s[1],IN_SIZE);
   p:=PCM2PCMA(s);
   if length(p)=IN_SIZE div 2 then Send(p);
  end;
 end;
 waveInAddBuffer(hWaveIn,Header,SizeOf(TWaveHdr))
end;

{$ifdef log}
initialization
 AllocConsole;
{$endif}
end.

