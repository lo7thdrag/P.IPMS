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

  private

  public
    { Public declarations }
  end;

var
  frmSetofPressureGaugesME2: TfrmSetofPressureGaugesME2;

implementation

uses
  ufrmMenu, ufrmSignalingLightME2, uMainEngine2System;

{$R *.dfm}


end.
