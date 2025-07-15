unit U_Options;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, MMSystem, U_Helper;

type
  TOptionsFrm = class(TForm)
    WaveOutTest: TLabel;
    WaveOutList: TComboBox;
    Label13: TLabel;
    WaveInList: TComboBox;
    Test: TButton;
    procedure WaveOutListChange(Sender: TObject);
    procedure WaveInListChange(Sender: TObject);
    procedure TestClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CheckDevices;
    procedure SetWaveIn(const Name:string);
    procedure SetWaveOut(const Name:string);
    function WaveInName:string;
    function WaveOutName:string;
  end;

var
  OptionsFrm: TOptionsFrm;

implementation

uses U_Main, SoudTest;

{$R *.dfm}

procedure TOptionsFrm.WaveOutListChange(Sender: TObject);
var p: Integer;
begin
  p:= WaveOutList.ItemIndex;
  MainFrm.PCMA.DevOut:= p;
  MainFrm.conf.WaveOut:= WaveOutList.Items[p]
end;

procedure TOptionsFrm.WaveInListChange(Sender: TObject);
var p: Integer;
begin
  p:= WaveInList.ItemIndex;
  MainFrm.PCMA.DevIn:= p;
  MainFrm.conf.WaveIn:= WaveInList.Items[p]
end;

procedure TOptionsFrm.CheckDevices;
var
 Handle:HKEY;
 RegType:integer;
 DataSize:integer;
 smPlayback:string;
 smRecord  :string;
 i,count:integer;
 info:TWaveOutCaps;
 list:TStringList;
 ok:boolean;
begin
// Default devices
 if (RegOpenKeyEx(HKEY_CURRENT_USER,'Software\Microsoft\Multimedia\Sound Mapper',0,KEY_ALL_ACCESS,Handle)=ERROR_SUCCESS) then begin
  if RegQueryValueEx(Handle,'Playback',nil,@RegType,nil,@DataSize)=ERROR_SUCCESS then begin
   SetLength(smPlayback,Datasize);
   RegQueryValueEx(Handle,'Playback',nil,@RegType,PByte(@smPlayback[1]),@DataSize);
   SetLength(smPlayback,Datasize-1);
  end;
  if RegQueryValueEx(Handle,'Record',nil,@RegType,nil,@DataSize)=ERROR_SUCCESS then begin
   SetLength(smRecord,Datasize);
   RegQueryValueEx(Handle,'Record',nil,@RegType,PByte(@smRecord[1]),@DataSize);
   SetLength(smRecord,Datasize-1);
  end;
  RegCloseKey(Handle);
 end;
//
 ok:=True;
 list:=TStringList.Create;
 try
 // waveOut devices
  count:=waveOutGetNumDevs();
  for i:=0 to count-1 do begin
   if waveOutGetDevCaps(i, @info, SizeOf(Info))=0 then begin
    list.Add(info.szPname);
   end;
  end;

  if List.Count=0 then begin
   ok:=False;
   WaveOutList.Items.Clear;
   MainFrm.PCMA.DevOut:=-1;
  end else begin
   i:=WaveOutList.ItemIndex;
   WaveOutList.Items.Assign(List);
   if i<0 then i:=List.IndexOf(smPlayback);
   if (i<0)or(i>=List.Count) then i:=0;
   WaveOutlist.ItemIndex:=i;
   MainFrm.PCMA.DevOut:=i;
   List.Clear;
  end;

 // waveIn devices
  count:=waveInGetNumDevs();
  for i:=0 to count-1 do begin
   if waveInGetDevCaps(i, @info, SizeOf(Info))=0 then begin
    List.Add(info.szPname);
   end;
  end;

  if List.Count=0 then begin
   ok:=False;
   WaveInList.Items.Clear;
   MainFrm.PCMA.DevIn:=-1;
  end else begin
   i:=WaveInList.ItemIndex;
   if i<0 then i:=List.IndexOf(smRecord);
   WaveInList.Items.Assign(List);
   if (i<0)or(i>=List.Count) then i:=0;
   WaveInlist.ItemIndex:=i;
   MainFrm.PCMA.DevIn:=i;
   List.Clear;
  end;

 finally
  List.Free;
 end;

 MainFrm.btnConnect.Enabled:=ok;
end;

procedure TOptionsFrm.SetWaveIn(const Name:string);
var
 i:integer;
begin
 if Name='' then exit;
 i:=WaveInList.Items.IndexOf(Name);
 if i<0 then exit;
 WaveInList.ItemIndex:=i;
 MainFrm.PCMA.DevIn:=i;
end;

procedure TOptionsFrm.SetWaveOut(const Name:string);
var
 i:integer;
begin
 if Name='' then exit;
 i:=WaveOutList.Items.IndexOf(Name);
 if i<0 then exit;
 WaveOutList.ItemIndex:=i;
 MainFrm.PCMA.DevOut:=i;
end;

function TOptionsFrm.WaveInName:string;
begin
 Result:=WaveInList.Items[WaveInList.ItemIndex]
end;

function TOptionsFrm.WaveOutName:string;
begin
 Result:=WaveOutList.Items[WaveOutList.ItemIndex]
end;

procedure TOptionsFrm.TestClick(Sender: TObject);
begin
  with TSoundTest.Create(Self) do begin
  try
   ShowModal;
  finally
   Free;
  end;
 end;
end;

end.
