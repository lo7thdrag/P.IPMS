unit uFastLogger;

interface

uses Windows, SysUtils;

type
   TFastLogger = class
   private
      FFilename: string;
      FIsLog: Boolean;
      FFileHandle: Integer;
   public
      constructor Create;
      destructor Destroy; override;
      procedure Init;
      procedure CustomLog(AMsg: string);
      procedure InsertEmptyLine;
      procedure Log(ASection, AMsg: string);
      procedure Close;
   published
      property FileName: string read FFilename write FFilename;
      property IsLog: Boolean read FIsLog write FIsLog;
   end;

implementation

constructor TFastLogger.Create;
begin
   inherited Create;
   FIsLog:= False;
end;

destructor TFastLogger.Destroy;
begin
   Close;
   inherited Destroy;
end;

procedure TFastLogger.Init;
begin
   if FIsLog then begin
     if not FileExists(FFilename) then begin
        FFileHandle:= FileCreate(FileName);
        if FFileHandle=Integer(INVALID_HANDLE_VALUE) then
           raise Exception.Create('Error creating file ' + FFilename)
        else
           FileClose(FFileHandle);
     end;

     FFileHandle:= FileOpen(FFilename, fmOpenWrite or fmShareDenyWrite);
     if FFileHandle = Integer(INVALID_HANDLE_VALUE) then begin
        MessageBox(0, PChar('Log file:  ' + FFilename + ' in being used ?'), PChar('Write/Append log file error'), MB_OK);
     end;
   end;
end;

procedure TFastLogger.CustomLog(AMsg: string);
begin
   if FIsLog and (FFileHandle<>Integer(INVALID_HANDLE_VALUE)) then begin
      FileSeek(FFileHandle, 0, FILE_END);
      FileWrite(FFileHandle, PChar(AMsg + #13#10)^, (Length(AMsg)+ 2) * SizeOf(Char));
      FlushFileBuffers(FFileHandle);
   end;
end;

procedure TFastLogger.InsertEmptyLine;
begin
   if FIsLog then
      CustomLog('');
end;

procedure TFastLogger.Log(ASection: string; AMsg: string);
var s: string;
begin
   if FIsLog then begin
      s:= '['+FormatDateTime('dd-mm-yyyy hh:nn:ss',Now)+ '] <'+ASection+'> '+AMsg;
      CustomLog(s);
   end;
end;


procedure TFastLogger.Close;
begin
   if FIsLog and (FFileHandle<>Integer(INVALID_HANDLE_VALUE)) then begin
      FileClose(FFileHandle);
      FFileHandle:= Integer(INVALID_HANDLE_VALUE);
   end;
end;

end.

{

procedure TMainFomr.WriteLogData(aEventString: String);
var
  logFile: Integer;
begin
  logFile := FileOpen(FLogFileName, fmOpenWrite or fmShareDenyWrite);
  if logFile = -1 then begin
    MessageBox(0, PChar('Log file:  ' + FEventLogFileName + ' in being used
?'), PChar('Write/Append log file error'), MB_OK);
  end else begin
    FileSeek(logFile, 0, 2);
    FileWrite(logFile, PChar(aEventString + #13#10)^, (Length(aEventString)
+ 2) * SizeOf(Char));
    FileClose(logFile);
  end;
end;


Or:


procedure TMainFomr.WriteLogData(aEventString: String);
var
  logFile: TFileStream;
begin
  try
    logFile := TFileStream.Create(FLogFileName, fmOpenWrite or
fmShareDenyWrite);
  except
    MessageBox(0, PChar('Log file:  ' + FEventLogFileName + ' in being used
?'), PChar('Write/Append log file error'), MB_OK);
    Exit;
  end;
  try
    logFile.Seek(0, soEnd);
    logFile.Write(PChar(aEventString + #13#10)^, (Length(aEventString) + 2)
* SizeOf(Char));
  finallly
    logFile.Free;
  end;
end;


Or:


procedure TMainFomr.WriteLogData(aEventString: String);
var
  logFile: TFileStream;
  writer: TStreamWriter;
begin
  try
    logFile := TFileStream.Create(FLogFileName, fmOpenWrite or
fmShareDenyWrite);
  except
    MessageBox(0, PChar('Log file:  ' + FEventLogFileName + ' in being used
?'), PChar('Write/Append log file error'), MB_OK);
    Exit;
  end;
  try
    logFile.Seek(0, soEnd);
    writer := TStreamWriter.Create(logFile);
    try
      writer.WriteLine(aEventString);
    finally
      write.Free;
    end;
  finallly
    logFile.Free;
  end;
end;

}