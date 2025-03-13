unit uAlarmPCS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MPlayer;

type
  TfrmPCSAlarm = class(TForm)
    mpAlarmPCS: TMediaPlayer;
    procedure mpAlarmPCSNotify(Sender: TObject);
    procedure PlayAlarmSound;
    procedure StopAlarmSound(isStop : Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    silence : Boolean;

  end;

var
  frmPCSAlarm: TfrmPCSAlarm;

implementation

{$R *.dfm}

procedure TfrmPCSAlarm.FormCreate(Sender: TObject);
begin
  if not FileExists(ExtractFilePath(Application.Exename) + 'IPMS_ALARM.wav') then
  begin
    raise Exception.Create('IPMS_ALARM.wav Not found');
  end
  else
    mpAlarmPCS.FileName:= ExtractFilePath(Application.Exename) + 'IPMS_ALARM.wav';

  mpAlarmPCS.Open
end;

procedure TfrmPCSAlarm.FormDestroy(Sender: TObject);
begin
  mpAlarmPCS.Close;
  mpAlarmPCS.Free;
end;

procedure TfrmPCSAlarm.mpAlarmPCSNotify(Sender: TObject);
begin
  if (mpAlarmPCS.NotifyValue = nvSuccessful) and silence then
  begin
    mpAlarmPCS.Play;
    mpAlarmPCS.Notify := True;
  end;
end;

procedure TfrmPCSAlarm.PlayAlarmSound;
begin
  try
    mpAlarmPCS.AutoRewind := True;
    mpAlarmPCS.Play;
    mpAlarmPCS.Notify := True;
  except
    on E:Exception do
      MessageDlg(E.Message,mtError,[mbOK],0);
  end;
  silence := True;
end;

procedure TfrmPCSAlarm.StopAlarmSound(isStop: Boolean);
begin
  if isStop then
  begin
    try
//      mpAlarmPCS.Open;
      mpAlarmPCS.Stop;
    finally
    end;
    mpAlarmPCS.Notify := True;
    silence := False;
  end;
end;

end.
