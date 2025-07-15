unit SoudTest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, MMSystem, ExButtons, g711a, ComCtrls;

type
  TPCMATest=class(TCustomPCMA)
  public
   procedure Close; override;
  end;

  TSoundTest = class(TForm)
    WaveIn: TLabel;
    WaveOut: TLabel;
    Graph: TPaintBox;
    Test: TButton;
    Status: TLabel;
    Timer1: TTimer;
    Timer2: TTimer;
    ProgressBar: TProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure GraphPaint(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
    PCMA:TPCMATest;
    Stream:TMemoryStream;
    procedure WAVEInData(Var Msg:TMessage); message MM_WIM_DATA; // waveIn callback message
  public
    { Public declarations }
  end;

var
  SoundTest: TSoundTest;

//function DrawSound(data:pchar; Canvas:TCanvas; Color:TColor):integer;
function GetMaxAmp(data: pChar): Integer;

implementation

uses U_Main, U_Options;

{$R *.dfm}

//----------------------------------------------------------------------------//
{function DrawSound(data:pchar; Canvas:TCanvas; Color:TColor):integer;
var
 s  :^smallint;
 amp:integer;
 absamp:integer;
 i:integer;
begin
 with Canvas do begin
  Brush.Color:=clBlack;
  Pen.color:=clBlack;
  Rectangle(0,0,240,50);
  Pen.Color:=Color;
  MoveTo(0,25);
  s:=pointer(data);
  Result:=0;
  for i:=0 to 239 do begin
   amp:=round(50*s^/$7fff);
   LineTo(i,25+amp);
   absamp:=abs(amp);
   if absamp>Result then Result:=absamp;
   inc(s);
  end;
 end;
end;}

function GetMaxAmp(data: pChar): Integer;
var
 s  :^smallint;
 amp:integer;
 absamp:integer;
 i:integer;
begin
  s:=pointer(data);
  Result:=0;
  for i:=0 to 239 do begin
    amp:=round(50*s^/$7fff);
    absamp:=abs(amp);
    if absamp>Result then
      Result:=absamp;
    inc(s);
  end;
end;

//----------------------------------------------------------------------------//
procedure TPCMATest.Close;
begin
 CloseIn;
 CloseOut;
end;

//----------------------------------------------------------------------------//

procedure TSoundTest.FormCreate(Sender: TObject);
begin
// PCMA:=TPCMATest.Create(Handle);
// WaveIn.Caption :='Waveout audio: '+MainFrm.conf.WaveOut;
// WaveOut.Caption:='Wavein audio: '+MainFrm.conf.WaveIn;
// PCMA.DevOut:=MainFrm.PCMA.DevOut;
// PCMA.DevIn :=MainFrm.PCMA.DevIn;
// Status.Caption:='Please speak into microphone ...';
// Stream:=TMemoryStream.Create;
// if not PCMA.OpenIn then
//   ShowMessage('Unable to open wavein audio !');
end;

procedure TSoundTest.GraphPaint(Sender: TObject);
begin
 with Graph,Canvas do begin
  Brush.Color:=clBlack;
  FillRect(ClientRect);
 end;
end;

procedure TSoundTest.FormDestroy(Sender: TObject);
begin
 PCMA.Free;
end;

procedure TSoundTest.WAVEInData(Var Msg:TMessage);
// waveIn callback
var
 Header:PWaveHdr;
 s,p:string;
begin
 if Timer1.Enabled=False then exit;
// we took the opportunity to update the timer
 ProgressBar.StepIt;
// there will
 Header:=pointer(Msg.LParam);
 if Header.dwBytesRecorded=IN_SIZE then begin
  //DrawSound(Header.lpData,Graph.Canvas,clLime);
  SetLength(s,IN_SIZE);
  move(Header.lpData^,s[1],IN_SIZE);
  p:=PCM2PCMA(s);
  if length(p)=IN_SIZE div 2 then
   Stream.WriteBuffer(p[1],Length(p));
 end;
 waveInAddBuffer(Msg.wParam,Header,SizeOf(TWaveHdr));
end;

procedure TSoundTest.Timer1Timer(Sender: TObject);
begin
 ProgressBar.Position:=0;
 Timer1.Enabled:=False;
 Stream.Position:=0;
 PCMA.CloseIn;
 if not PCMA.OpenOut then begin
  ShowMessage('Unable to play sound !');
 end else begin
  Status.Caption:='Listen to your voice';
  Timer2.Enabled:=True;
 end;
end;

procedure TSoundTest.Timer2Timer(Sender: TObject);
var
 p,s:string;
begin
 SetLength(p,OUT_SIZE div 2);
 if Stream.Read(p[1],OUT_SIZE div 2)=OUT_SIZE div 2 then begin
  s:=PCMA2PCM(p);
  //DrawSound(@s[1],Graph.Canvas,clRed);
  PCMA.Play(s);
  ProgressBar.StepIt;
 end else begin
  Timer2.Enabled:=False;
  Stream.Position:=0;
  ProgressBar.Position:=0;
  PCMA.CloseOut;
  if PCMA.OpenIn then begin
   Status.Caption:='Please speak into microphone ...';
   Timer1.Enabled:=True;
  end else begin
   ShowMessage('Unable to open wavein audio !');
  end;
 end;
end;

end.

