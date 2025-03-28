unit uDataBuffer;

interface

uses
  Classes, uTCPDatatype, uPacketRegister;

type
  {*
    28052013 Dibuat class TDataBuffer oleh farid
    data buffer berfungsi untuk menampung data dari jaringan,yang kemudian akan
    diakses oleh thread lain untuk memproses data yang ada didalam buffer.
  *}
  TDataBuffer = class
  private
  protected
    FBuff    : TThreadList;
    FRegProcs   : TRegisterPacket;
    FLogRecv: TGetStrProc;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Clear;

    procedure PutPacket(aP: PAnsiChar;
      const aSize: integer; const ipSender: string);

    procedure PacketRecognizer(aP: PAnsiChar;
      const aSize: integer; const ipSender: string);

    function GetPacket(): boolean;
    function GetCount : integer;

    property RegProcs : TRegisterPacket read FRegProcs write FRegProcs;
    property LogRecv: TGetStrProc read FLogRecv write FLogRecv;
  end;

implementation

uses
  Windows, SysUtils;

{ TDataBuffer }

procedure TDataBuffer.Clear;
var i: integer;
begin
  with FBuff.LockList do
  for i := Count-1 downto 0  do begin
    FreeMem(Items[i]);
    Delete(i);
  end;
  FBuff.UnlockList;
end;

constructor TDataBuffer.Create;
begin
  FBuff := TThreadList.Create;
end;

destructor TDataBuffer.Destroy;
begin
  Clear;

  FBuff.Free;
  inherited;
end;

function TDataBuffer.GetCount: integer;
var
  c : integer;
begin
   c := FBuff.LockList.Count;
   FBuff.UnlockList;
   result := c;
end;

function TDataBuffer.GetPacket():Boolean;
var pid: ^TPacketID;
    p: PAnsiChar;
    aSize: Word;
    IPSender : string;
    pLocBuff : PAnsiChar;
begin
  with FBuff.LockList do begin
//    for i := Count-1 downto 0  do begin
//      if Count > 0 then
//      begin
//        if Assigned(FLogRecv) then
//           FLogRecv(TimeStr + ' : Get Count Buffer = ' + IntToStr(Count));
//      end;

      Result := Count > 0;
      if Result then
      begin
        pLocBuff  := Items[0];
        pid       := Items[0];

        aSize     := pid^.recSize;
        GetMem(p, aSize);
        CopyMemory(p, pLocBuff, aSize);
        IPSender := LongIp_To_StrIp(pid^.ipSender);
        PacketRecognizer(p, aSize, IPSender); // ambil 1 record, lempar

        FreeMem(pLocBuff);
        Delete(0);
      end;
//    end;
  end;
  FBuff.UnlockList;
end;

procedure TDataBuffer.PacketRecognizer(aP: PAnsiChar; const aSize: integer;
  const ipSender: string);
var pid : ^TPacketID;
    recID: Word;
begin
  pid   := @aP^;
  recID := pid^.recID;

  if FRegProcs.IsHandled(recID) then begin
    if Assigned(FLogRecv) then
       FLogRecv(TimeStr + ': Data ' + FRegProcs[recID].recName);
//    FLogRecv(TimeStr + ': Data ' + getPacketIDname(recID));
    FRegProcs[recID].theProc(aP, FRegProcs[recID].recSize);
  end
  else
    if Assigned(FLogRecv) then
      FLogRecv(TimeStr + ': ' + 'UnRegistered ID ' + inttostr(recID) );
end;

procedure TDataBuffer.PutPacket(aP: PAnsiChar;
      const aSize: integer; const ipSender: string);
var pid: ^TPacketID;
    l : TList;
    pLocBuff : PAnsiChar;
begin
  if aSize < SizeOf(TPacketID) then Exit;

  l := FBuff.LockList;
  try
    GetMem(pLocBuff, aSize);
    CopyMemory(pLocBuff, aP,  aSize);

    pid := @pLocBuff^;
    pid^.recSize := aSize;

    l.Add(pLocBuff);
  finally
    FBuff.UnlockList;
  end;

//  if FBuff.LockList.Count > 0 then
//  begin
//    if Assigned(FLogRecv) then
//      FLogRecv(TimeStr + ' : Count Put Buffer = ' + IntToStr(FBuff.LockList.Count));
//  end;
end;

end.
