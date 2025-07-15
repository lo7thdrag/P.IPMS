unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, ShellAPI, Tlhelp32, IniFiles;

type
  TfRestart = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    tmrRestart: TTimer;
    pbRestart: TProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure tmrRestartTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure RunPhone;

     //Search n Kill Task
    function KillTask(ExeFileName: string): Integer;
    function processExists(exeFileName: string): Boolean;

  public
    { Public declarations }
  end;

var
  fRestart: TfRestart;

implementation

{$R *.dfm}

procedure TfRestart.FormCreate(Sender: TObject);
begin
  pbRestart.Position := 0;
  pbRestart.Min := 0;
  pbRestart.Max := 1000 * 10;

  tmrRestart.Enabled := False;
  tmrRestart.Interval := 1000;
  tmrRestart.Enabled := True;
end;

procedure TfRestart.FormShow(Sender: TObject);
var
  iniPath : string;
  iniF : TIniFile;

  screenMon : integer;
begin
  iniPath := ExtractFilePath(Application.ExeName) + 'SettingPhone.ini';
  if FileExists(iniPath) then
  begin
    try
      iniF := TIniFile.Create(iniPath);
      screenMon := iniF.ReadInteger('Position','Monitor',0);
      if screenMon < Screen.MonitorCount then
      begin
        Top := Screen.Monitors[screenMon].Top;
        Left := Screen.Monitors[screenMon].Left;
      end;
    finally
      iniF.Free;
    end;
  end;

  BorderStyle := bsNone;
  ShowWindow(Handle, SW_SHOWMAXIMIZED);
end;

function TfRestart.KillTask(ExeFileName: string): Integer;
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  Result := 0;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
      UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
      UpperCase(ExeFileName))) then
      Result := Integer(TerminateProcess(
                        OpenProcess(PROCESS_TERMINATE,
                                    BOOL(0),
                                    FProcessEntry32.th32ProcessID),
                                    0));
     ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

function TfRestart.processExists(exeFileName: string): Boolean;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  Result := False;
  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
      UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
      UpperCase(ExeFileName))) then
    begin
      Result := True;
    end;
    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

procedure TfRestart.RunPhone;
var
  sExePhone : string;
begin
  sExePhone := ExtractFilePath(Application.ExeName)+'Phone.exe';

  ShellExecute(Handle,
               nil,
               PChar(sExePhone),
               nil,
               nil,
               SW_NORMAL);
end;

procedure TfRestart.tmrRestartTimer(Sender: TObject);
begin
  pbRestart.Position := pbRestart.Position + tmrRestart.Interval;

  if pbRestart.Position = pbRestart.Max then
  begin
    tmrRestart.Enabled := False;
    RunPhone;
    Close;
  end;
end;

end.
