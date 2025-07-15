unit U_Helper;

interface

uses SysUtils, Dialogs, IniFiles;

type

  TConfig = class
    private
      FFileName, FRegistrar, FUsername, FPasswd, FDomain, FWaveIn, FWaveOut: string;
      FIsRememberPassword, FIsAutoConnect, FIsAutoDial, FIsDoNotDisturb, FIsSilent, FIsLogged: Boolean;
      fSIP_Local_Port, fRTP_Local_Port, fSIP_Remote_Port: Integer;
      fChannel: Integer;
    public
      constructor Create;
      destructor Destroy; override;
      procedure Load;
      procedure Save;
    published
      property FileName: string read FFileName write FFileName;
      property Registrar: string read FRegistrar write FRegistrar;
      property Username: string read FUsername write FUsername;
      property Passwd: string read FPasswd write FPasswd;
      property Domain: string read FDomain write FDomain;
      property WaveIn: string read FWaveIn write FWaveIn;
      property WaveOut: string read FWaveOut write FWaveOut;
      property IsRememberPassword: Boolean read FIsRememberPassword write FIsRememberPassword;
      property IsAutoConnect: Boolean read FIsAutoConnect write FIsAutoConnect;
      property IsAutoDial: Boolean read FIsAutoDial write FIsAutoDial;
      property IsDoNotDisturb: Boolean read FIsDoNotDisturb write FIsDoNotDisturb;
      property IsSilent: Boolean read FIsSilent write FIsSilent;
      property IsLogged: Boolean read FIsLogged write FIsLogged;
      property SIP_Local_Port: Integer read fSIP_Local_Port write fSIP_Local_Port;
      property RTP_Local_Port: Integer read fRTP_Local_Port write fRTP_Local_Port;
      property SIP_Remote_Port: Integer read fSIP_Remote_Port write fSIP_Remote_Port;
      property Channel: Integer read fChannel write fChannel;
    end;

  TLogFile = class
    private
      fFilename: string;
      fisLog: Boolean;
      fLogFile:TextFile;
    public
      constructor Create;
      destructor Destroy; override;
      procedure Init;
      procedure Log(const AHdr, AMsg: string);
      procedure Close;
    published
      property FileName: string read fFilename write fFilename;
      property IsLog: Boolean read fisLog write fisLog;
  end;

implementation

function FileIsThere(FileName: string): Boolean;
{ Boolean function that returns True if the file exists; otherwise,
  it returns False. Closes the file if it exists. }
 var
  F: file;
begin
  {$I-}
  AssignFile(F, FileName);
  FileMode := 0;  {Set file access to read only }
  Reset(F);
  CloseFile(F);
  {$I+}
  FileIsThere := (IOResult = 0) and (FileName <> '');
end;  { FileIsThere }

constructor TConfig.Create;
begin
  inherited Create;
end;

destructor TConfig.Destroy;
begin
  inherited Destroy;
end;

procedure TConfig.Load;
var ini: TIniFile;
begin
  ini:= TIniFile.Create(FFileName);
  try
    FRegistrar:= Trim(ini.ReadString('Server','Registrar',''));
    FDomain:= Trim(Ini.ReadString('Server','Domain',''));

    FUserName:= Trim(Ini.ReadString('User','Username',''));
    FPasswd:= Trim(Ini.ReadString('User','Passwd','1234'));
    FIsRememberPassword:= FPasswd<>'';
    FIsAutoConnect:= Ini.ReadBool('User','AutoConnect',False);
    FIsDoNotDisturb:= Ini.ReadBool('User','DoNotDisturb',False);
    FIsSilent:= Ini.ReadBool('User','Silence',False);

    FWaveIn:= Trim(Ini.ReadString('Device','WaveIn',''));
    FWaveOut:= Trim(Ini.ReadString('Device','WaveOut',''));

    FIsLogged:= Ini.ReadBool('General','Log',False);
    fSIP_Local_Port:= Ini.ReadInteger('General','SIP_Local_Port',5060);
    fRTP_Local_Port:= Ini.ReadInteger('General','RTP_Local_Port',6000);
    fSIP_Remote_Port:= Ini.ReadInteger('Server','SIP_Remote_Port',5060);

    fChannel:= Ini.ReadInteger('Conference','Channel',3000);
  finally
    ini.Free
  end;
end;

procedure TConfig.Save;
var ini: TIniFile;
begin
  ini:= TIniFile.Create(FFileName);
  try
    ini.WriteString('Server','Registrar',FRegistrar);
    ini.WriteString('Server','Domain',FDomain);

    ini.WriteString('User','Username',FUsername);
    ini.WriteString('User','Passwd',FPasswd);
    ini.WriteBool('User','AutoConnect',FIsAutoConnect);
    ini.WriteBool('User','DoNotDisturb',FIsDoNotDisturb);
    ini.WriteBool('User','Silence',FIsSilent);

    ini.WriteString('Device','WaveIn',FWaveIn);
    ini.WriteString('Device','WaveOut',FWaveOut);

    ini.WriteBool('General','Log',FIsLogged);
  finally
    ini.Free
  end;
end;

constructor TLogFile.Create;
begin
  inherited Create;
end;

destructor TLogFile.Destroy;
begin
  Close;
  inherited Destroy;
end;

procedure TLogFile.Init;
var IsFileExist: Boolean;
begin
  if not fisLog then
    Exit;
  IsFileExist:= FileIsThere(fFilename);
  try
    AssignFile(fLogFile,fFilename);
    if not IsFileExist then
      Rewrite(fLogFile)
    else
      Append(fLogFile);
  except
    on e:Exception do begin
      CloseFile(fLogFile);
      ShowMessage(e.Message);
    end;
  end;

end;

procedure TLogFile.Log(const AHdr, AMsg: string);
begin
  if fisLog then begin
    System.Writeln(fLogFile, '<'+FormatDateTime('dd mmm yyyy hh:nn:ss',Now)+ '> ['+AHdr+'] '+AMsg);
    Flush(fLogFile)
  end;
end;

procedure TLogFile.Close;
begin
  if not fisLog then
    Exit;
  {I-}
  CloseFile(fLogFile);
  {I+}
end;

end.
