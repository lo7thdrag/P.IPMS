unit ufrmAlarms;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, RzBmpBtn,
  Vcl.Imaging.pngimage, Vcl.ComCtrls, Vcl.MPlayer;

type
  TfrmAlarms = class(TForm)
    pnlMain: TPanel;
    ImgBackground: TImage;
    btnAlarms: TRzBmpButton;
    Image13: TImage;
    btnCurves: TRzBmpButton;
    btnMenu: TRzBmpButton;
    Label24: TLabel;
    pnlTime: TPanel;
    lblTime: TLabel;
    Timer1: TTimer;
    lvAlarms: TListView;
    mpAlarm: TMediaPlayer;
    procedure Timer1Timer(Sender: TObject);
    procedure btnMenuClick(Sender: TObject);
    procedure btnCurvesClick(Sender: TObject);
    procedure mpAlarmNotify(Sender: TObject);
    procedure Alarm(Value: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    Silence : Boolean;

    procedure AddAlarmToLog(const AText: string);
  end;

var
  frmAlarms: TfrmAlarms;

implementation

uses
   ufrmMenu, ufrmCurves;
{$R *.dfm}

procedure TfrmAlarms.FormCreate(Sender: TObject);
begin
  if not FileExists(ExtractFilePath(Application.Exename) + 'Alarm08.wav') then
  begin
    raise Exception.Create('Alarm08.wav Not found');
  end
  else
    mpAlarm.FileName:= ExtractFilePath(Application.Exename) + 'Alarm08.wav';

  Silence := False;
end;

procedure TfrmAlarms.Alarm(Value: Boolean);
begin
  if Value then
  begin
    silence := True;
    mpAlarm.OnNotify     := mpAlarmNotify;
    if not (mpAlarm.Mode = mpPlaying) then
    begin
      mpAlarm.Open;
      mpAlarm.Play;
    end;
  end
  else
  begin
    mpAlarm.Open;
    mpAlarm.Stop;
    mpAlarm.Notify := False;
  end;
end;

procedure TfrmAlarms.btnCurvesClick(Sender: TObject);
begin
  frmCurves.Show;
  Self.Hide;
end;

procedure TfrmAlarms.btnMenuClick(Sender: TObject);
begin
  frmMenu.Show;
  Self.Hide;
end;

procedure TfrmAlarms.mpAlarmNotify(Sender: TObject);
begin
  if (mpAlarm.NotifyValue = nvSuccessful) and Silence then
  begin
    mpAlarm.Play;
    mpAlarm.Notify := True;
  end;
end;

procedure TfrmAlarms.Timer1Timer(Sender: TObject);
begin
  lblTime.Caption := FormatDateTime('dd"/"mm"/"yyyy hh:nn:ss ampm', Now);
end;

procedure TfrmAlarms.AddAlarmToLog(const AText: string);
var
  Item : TListItem;
begin
  Item := lvAlarms.Items.Add;
  Item.Caption := FormatDateTime('hh:nn:ss ampm', Now);
  Item.SubItems.Add(FormatDateTime('dd/mm/yyyy', Now));
  Item.SubItems.Add(AText);
end;

end.
