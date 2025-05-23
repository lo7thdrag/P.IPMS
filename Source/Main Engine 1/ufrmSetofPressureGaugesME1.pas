unit ufrmSetofPressureGaugesME1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, VrControls,
  VrAngularMeter, Vcl.Imaging.jpeg, Vcl.Imaging.pngimage;

type
  TfrmSetofPressureGaugesME1 = class(TForm)
    pnlMain: TPanel;
    imgGaugesME1: TImage;
    StartingAirPressureMeter: TVrAngularMeter;
    EngineInletLubOilPressureMeter: TVrAngularMeter;
    FuelOilPressureMeter: TVrAngularMeter;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetofPressureGaugesME1: TfrmSetofPressureGaugesME1;

implementation

uses
  ufrmSignalingLightME1, uMainEngine1System;

{$R *.dfm}


end.
