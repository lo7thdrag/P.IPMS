unit uProgressBar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, ShellAPI;

type
  TfrmProgress = class(TForm)
    pnlUp: TPanel;
    pnlBottom: TPanel;
    pbProgess: TProgressBar;
    tmrProgress: TTimer;
    procedure tmrProgressTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    aMode : Integer;
    procedure ShowProgressBar;
  end;

var
  frmProgress: TfrmProgress;

implementation

uses uSocketHandle;

{$R *.dfm}

{ TfrmProgress }

function WindowsExit(RebootParam: Longword): Boolean;
var
   TTokenHd: THandle;
   TTokenPvg: TTokenPrivileges;
   cbtpPrevious: DWORD;
   rTTokenPvg: TTokenPrivileges;
   pcbtpPreviousRequired: DWORD;
   tpResult: Boolean;
const
   SE_SHUTDOWN_NAME = 'SeShutdownPrivilege';
begin
   if Win32Platform = VER_PLATFORM_WIN32_NT then
   begin
     tpResult := OpenProcessToken(GetCurrentProcess(),
       TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY,
       TTokenHd) ;
     if tpResult then
     begin
       tpResult := LookupPrivilegeValue(nil,
                                        SE_SHUTDOWN_NAME,
                                        TTokenPvg.Privileges[0].Luid) ;
       TTokenPvg.PrivilegeCount := 1;
       TTokenPvg.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED;
       cbtpPrevious := SizeOf(rTTokenPvg) ;
       pcbtpPreviousRequired := 0;
       if tpResult then
         Windows.AdjustTokenPrivileges(TTokenHd,
                                       False,
                                       TTokenPvg,
                                       cbtpPrevious,
                                       rTTokenPvg,
                                       pcbtpPreviousRequired) ;
     end;
   end;
   Result := ExitWindowsEx(RebootParam, 0) ;
end;

procedure TfrmProgress.FormShow(Sender: TObject);
begin
  ShowProgressBar;
end;

procedure TfrmProgress.ShowProgressBar;
begin
  tmrProgress.Enabled := False;

  case aMode of
    1 : begin
          pnlUp.Caption       := 'Waiting To Restart Connector';
          pbProgess.Min       := 0;
          pbProgess.Max       := 1000 * 5; // 10 Second
          pbProgess.Position  := 0;
          pbProgess.BarColor  := clYellow;

          tmrProgress.Enabled := True;

          VoipManager.aloggerFile.Log('Restart', 'Prepare Restart Connector');
        end;
    2 : begin
          pnlUp.Caption       := 'Waiting To Restart Phone';
          pbProgess.Min       := 0;
          pbProgess.Max       := 1000 * 10; // 10 Second
          pbProgess.Position  := 0;
          pbProgess.BarColor  := clYellow;

          tmrProgress.Enabled := True;

          VoipManager.aloggerFile.Log('Restart', 'Prepare Restart Phone');
        end;
    3 : begin
          pnlUp.Caption       := 'Waiting To Restart Phone & Connector';
          pbProgess.Min       := 0;
          pbProgess.Max       := 1000 * 10; // 10 Second
          pbProgess.Position  := 0;
          pbProgess.BarColor  := clYellow;

          tmrProgress.Enabled := True;

          VoipManager.aloggerFile.Log('Restart', 'Prepare Restart Connector n Phone');
        end;
    4 : begin
          pnlUp.Caption       := 'Preparing Communication';
          pbProgess.Min       := 0;
          pbProgess.Max       := 1000 * 10; // 10 Second
          pbProgess.Position  := 0;
          pbProgess.BarColor  := clGreen;

          tmrProgress.Enabled := True;

          VoipManager.aloggerFile.Log('Run Application', 'Prepare To Run Phone');
        end;
    5 : begin
          pnlUp.Caption       := 'Waiting To Close Communication';
          pbProgess.Min       := 0;
          pbProgess.Max       := 1000 * 10; // 10 Second
          pbProgess.Position  := 0;
          pbProgess.BarColor  := clRed;

          tmrProgress.Enabled := True;

          VoipManager.aloggerFile.Log('Run Application', 'Prepare To Close Phone');
        end;
    6 : begin
          pnlUp.Caption       := 'Closing Phone';
          pbProgess.Min       := 0;
          pbProgess.Max       := 1000 * 10; // 10 Second
          pbProgess.Position  := 0;
          pbProgess.BarColor  := clRed;

          tmrProgress.Enabled := True;

          VoipManager.aloggerFile.Log('Run Application', 'Prepare To Close Application');
        end;
    7 : begin
          pnlUp.Caption       := 'Waiting To Close Communication';
          pbProgess.Min       := 0;
          pbProgess.Max       := 1000 * 10; // 10 Second
          pbProgess.Position  := 0;
          pbProgess.BarColor  := clRed;

          tmrProgress.Enabled := True;

          VoipManager.aloggerFile.Log('Run Application', 'Prepare To Close Phone');
        end;
    8 : begin
          pnlUp.Caption       := 'Waiting To Close Communication';
          pbProgess.Min       := 0;
          pbProgess.Max       := 1000 * 10; // 10 Second
          pbProgess.Position  := 0;
          pbProgess.BarColor  := clRed;

          tmrProgress.Enabled := True;

          VoipManager.aloggerFile.Log('Run Application', 'Prepare To Close Phone');
        end;
  end;
end;

procedure TfrmProgress.tmrProgressTimer(Sender: TObject);
var
  sExeRestart : string;
begin
  pbProgess.Position := pbProgess.Position + tmrProgress.Interval;

  if pbProgess.Position >= pbProgess.Max then
  begin
    tmrProgress.Enabled := False;

    case aMode of
      1 : begin
            VoipManager.RestartConnector;
            VoipManager.aloggerFile.Log('Restart', 'Restart Connector');
          end;
      2 : begin
            VoipManager.CloseEngineVoip;
            VoipManager.aloggerFile.Log('Restart', 'Restart Phone');

            sExeRestart := ExtractFilePath(Application.ExeName)+'Restart.exe';

            ShellExecute(Handle,
                         nil,
                         PChar(sExeRestart),
                         nil,
                         nil,
                         SW_NORMAL);

            Application.Terminate;
          end;

      3 : begin
            VoipManager.RestartConnector_EngineVoip;
            VoipManager.aloggerFile.Log('Restart', 'Restart Connector n Phone');

            sExeRestart := ExtractFilePath(Application.ExeName)+'Restart.exe';

            ShellExecute(Handle,
                         nil,
                         PChar(sExeRestart),
                         nil,
                         nil,
                         SW_NORMAL);

            Application.Terminate;
          end;
      4 : begin

          end;
      5 : begin
            VoipManager.CloseEngineVoip;
          end;
      6 : begin
            VoipManager.CloseEngineVoip;
            VoipManager.SendClearLaunchSignToLauncher;
            //Sleep(10);
            Application.Terminate;
          end;
      7 : begin
            VoipManager.CloseEngineVoip;
            VoipManager.RestartPC;

            WindowsExit(EWX_REBOOT or EWX_FORCE);
          end;
      8 : begin
            VoipManager.CloseEngineVoip;
            VoipManager.ShutdownPC;

            WindowsExit(EWX_POWEROFF or EWX_FORCE) ;
          end;
    end;

    Close;
  end;
end;

end.
