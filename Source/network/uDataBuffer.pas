unit uDataBuffer;

interface

uses
  Classes, uTCPDatatype, uPacketRegister;

type
  { *
    28052013 Dibuat class TDataBuffer oleh farid
    data buffer berfungsi untuk menampung data dari jaringan,yang kemudian akan
    diakses oleh thread lain untuk memproses data yang ada didalam buffer.
    * }
  TDataBuffer = class
  private
    // FFileName: string;
    // FIsLogged: Boolean;
    // procedure CreateLogFile;
    FSocketIdentifier: string;
  protected
    FBuff: TThreadList;
    FRegProcs: TRegisterPacket;
    FLogRecv: TGetStrProc;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Clear;

    procedure PutPacket(aP: PAnsiChar; const aSize: integer;
      const ipSender: string);

    procedure PacketRecognizer(aP: PAnsiChar; const aSize: integer;
      const ipSender: string);

    function GetPacket(): boolean;
    function GetCount: integer;

    property RegProcs: TRegisterPacket read FRegProcs write FRegProcs;
    property LogRecv: TGetStrProc read FLogRecv write FLogRecv;
    property SocketIdentifier: string read FSocketIdentifier
      write FSocketIdentifier;

    // property IsLogged: Boolean read FIsLogged write FIsLogged;
  end;

implementation

uses
  Windows, SysUtils,
  uDataType;

{ TDataBuffer }

procedure TDataBuffer.Clear;
var
  i: integer;
begin
  with FBuff.LockList do
    try
      for i := Count - 1 downto 0 do
      begin
        FreeMem(Items[i]);
        Delete(i);
      end;
    finally
      FBuff.UnlockList;
    end;
end;

constructor TDataBuffer.Create;
begin
  FBuff := TThreadList.Create;
  // FFileName:= ChangeFileExt('DataBuffer', '.log');
  // FIsLogged:= False;
end;

// procedure TDataBuffer.CreateLogFile;
// var
// T: TextFile;
// begin
// AssignFile(T, FFileName);
// try
// Rewrite(T);
// Append(T);
// Writeln(T,'--- DataBuffer ---');
// finally
// CloseFile(T);
// end;
// end;

destructor TDataBuffer.Destroy;
begin
  Clear;

  FBuff.Free;
  inherited;
end;

function TDataBuffer.GetCount: integer;
var
  c: integer;
begin
  with FBuff.LockList do
    try
      c := Count;
    finally
      FBuff.UnlockList;
    end;
  result := c;
end;

function TDataBuffer.GetPacket(): boolean;
var
  pid: ^TPacketID;
  p: PAnsiChar;
  aSize: Word;
  ipSender: string;
  pLocBuff: PAnsiChar;
  cnt: integer;
  T: TextFile;
begin
  with FBuff.LockList do
    try
      // for i := Count-1 downto 0  do begin
      // if Count > 0 then
      // begin
      // if Assigned(FLogRecv) then
      // FLogRecv(TimeStr + ' : Get Count Buffer = ' + IntToStr(Count));
      // end;

      cnt := Count;
      result := cnt > 0;
      if result then
      begin
        pLocBuff := Items[0];
        pid := Items[0];

        aSize := pid^.recSize;
        GetMem(p, aSize);
        CopyMemory(p, pLocBuff, aSize);
        ipSender := LongIp_To_StrIp(pid^.ipSender);
        PacketRecognizer(p, aSize, ipSender); // ambil 1 record, lempar

        FreeMem(pLocBuff);
        Delete(0);

        // if IsLogged then begin
        // if not FileExists(FFileName) then
        // begin
        // CreateLogFile
        // end;
        //
        // AssignFile(T, FFileName);
        // try
        // Append(T);
        // Writeln(T, 'After GetPacket, Buffer = ', Count);
        // Writeln(T, '---');
        // finally
        // CloseFile(T);
        // end;
        // end;

      end;
      // end;
    finally
      FBuff.UnlockList;
    end;
end;

procedure TDataBuffer.PacketRecognizer(aP: PAnsiChar; const aSize: integer;
  const ipSender: string);
var
  pid: ^TPacketID;
  recID: Word;
begin
  pid := @aP^;
  recID := pid^.recID;

  if FRegProcs.IsHandled(recID) then
  begin
    // if Assigned(FLogRecv) then
    // FLogRecv(TimeStr + ': Data ' + FRegProcs[recID].recName);
    // FLogRecv(TimeStr + ': Data ' + getPacketIDname(recID));
    FRegProcs[recID].theProc(aP, FRegProcs[recID].recSize);
  end
  else
    // if Assigned(FLogRecv) then
    // FLogRecv(TimeStr + ': ' + 'UnRegistered ID ' + inttostr(recID) );
end;

procedure TDataBuffer.PutPacket(aP: PAnsiChar; const aSize: integer;
  const ipSender: string);
var
  pid: ^TPacketID;
  l: TList;
  pLocBuff: PAnsiChar;
  T: TextFile;
  r: ^R_Common_PCS_Command;
begin
  if aSize < SizeOf(TPacketID) then
    Exit;

  l := FBuff.LockList;
  try
    GetMem(pLocBuff, aSize);
    CopyMemory(pLocBuff, aP, aSize);

    pid := @pLocBuff^;
    pid^.recSize := aSize;

    if FRegProcs.IsHandled(pid.recID) then
    begin
      l.Add(pLocBuff);
      if Assigned(FLogRecv) then
        FLogRecv(TimeStr + ': [' + SocketIdentifier + '] ' + 'Data ' +
          FRegProcs[pid.recID].recName);
    end
    else
    begin
      FreeMem(pLocBuff);
      if Assigned(FLogRecv) then
        FLogRecv(TimeStr + ': [' + SocketIdentifier + '] ' + 'UnRegistered ID '
          + inttostr(pid.recID));
    end;

    // l.Add(pLocBuff);

    // if IsLogged then begin
    // if not FileExists(FFileName) then
    // begin
    // CreateLogFile
    // end;
    //
    // AssignFile(T, FFileName);
    // try
    // Append(T);
    // Writeln(T, 'After PutPacket, Count = ', l.Count);
    // Writeln(T, 'RecID = ', pid.recID);
    //
    // if pid.recID=52 then begin
    // r:= @pLocBuff^;
    // Writeln(T, 'CommandID = ', r.CommandID);
    // Writeln(T, 'CommandPropsID = ', Ord(r.CommandPropsID));
    // end;
    //
    // Writeln(T, '---');
    // finally
    // CloseFile(T);
    // end;
    // end;

  finally
    FBuff.UnlockList;
  end;

  // if FBuff.LockList.Count > 0 then
  // begin
  // if Assigned(FLogRecv) then
  // FLogRecv(TimeStr + ' : Count Put Buffer = ' + IntToStr(FBuff.LockList.Count));
  // end;
end;

end.
