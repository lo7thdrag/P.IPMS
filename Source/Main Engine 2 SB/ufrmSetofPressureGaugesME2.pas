unit ufrmSetofPressureGaugesME2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, VrControls,
  VrAngularMeter, Vcl.ExtCtrls, RzBmpBtn, Vcl.Imaging.pngimage, Vcl.MPlayer;

type
  TfrmSetofPressureGaugesME2 = class(TForm)
    pnlMain: TPanel;
    imgGaugesME2: TImage;
    EngineInletFWPressureMeter: TVrAngularMeter;
    EngineInletAirPressureMeter: TVrAngularMeter;
    btnAlarm: TRzBmpButton;
    imgFlashLighting: TRzBmpButton;
    mpAlarmGauges: TMediaPlayer;
    Label10: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    Label9: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    procedure mpAlarmGaugesNotify(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Alarm(Value: Boolean);
  private
    Silence : Boolean;
  public
    { Public declarations }
  end;

var
  frmSetofPressureGaugesME2: TfrmSetofPressureGaugesME2;

implementation

uses
  ufrmMenu, ufrmSignalingLightME2, uMainEngine2System;

{$R *.dfm}

procedure TfrmSetofPressureGaugesME2.FormCreate(Sender: TObject);
begin
  if not FileExists(ExtractFilePath(Application.Exename) + 'Alarm08.wav') then
  begin
    raise Exception.Create('Alarm08.wav Not found');
  end
  else
    mpAlarmGauges.FileName:= ExtractFilePath(Application.Exename) + 'Alarm08.wav';

  Silence := False;
end;

procedure TfrmSetofPressureGaugesME2.mpAlarmGaugesNotify(Sender: TObject);
begin
  if (mpAlarmGauges.NotifyValue = nvSuccessful) and Silence then
  begin
    mpAlarmGauges.Play;
    mpAlarmGauges.Notify := True;
  end;
end;

procedure TfrmSetofPressureGaugesME2.Alarm(Value: Boolean);
begin
  if Value then
  begin
    Silence := True;
    mpAlarmGauges.OnNotify := mpAlarmGaugesNotify;
    if not (mpAlarmGauges.Mode = mpPlaying) then
    begin
      mpAlarmGauges.Open;
      mpAlarmGauges.Play;
    end;
  end
  else
  begin
    mpAlarmGauges.Open;
    mpAlarmGauges.Stop;
    mpAlarmGauges.Notify := False;
  end;
end;

end.
