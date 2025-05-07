unit ufrmSetofPressureGaugesME2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, VrControls,
  VrAngularMeter, Vcl.ExtCtrls, RzBmpBtn, Vcl.Imaging.pngimage;

type
  TfrmSetofPressureGaugesME2 = class(TForm)
    pnlMain: TPanel;
    imgGaugesME2: TImage;
    EngineInletFWPressureMeter: TVrAngularMeter;
    EngineInletAirPressureMeter: TVrAngularMeter;
    Label13: TLabel;
    btnAlarm: TRzBmpButton;
    imgFlashLighting: TRzBmpButton;
    procedure MenuClick(Sender: TObject);
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
  imgFlashLighting.Visible := True;
end;

procedure TfrmSetofPressureGaugesME2.MenuClick(Sender: TObject);
begin
  frmMenu.Show;
  Self.Hide;
end;

end.
