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
    mpAlarm: TMediaPlayer;
    procedure AlarmFlashLightingClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetofPressureGaugesME2: TfrmSetofPressureGaugesME2;

implementation

uses
  ufrmMenu, ufrmSignalingLightME2, uMainEngine2System;

{$R *.dfm}

procedure TfrmSetofPressureGaugesME2.AlarmFlashLightingClick(Sender: TObject);
begin
//  imgFlashLighting.Visible := True;
end;

end.
