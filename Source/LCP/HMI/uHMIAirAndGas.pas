unit uHMIAirAndGas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, SpeedButtonImage, VrControls, VrWheel, ExtCtrls,
  VrAngularMeter, TFlatGaugeUnit, Gauges, VrGauge, Unit6;

type
  TfrmHMIAIrAndGas = class(TForm)
    pnl3: TPanel;
    btn6: TSpeedButtonImage;
    btn7: TSpeedButtonImage;
    btnAirGas1: TSpeedButtonImage;
    spdN1: TSpeedo;
    pnl1: TPanel;
    btn1: TSpeedButtonImage;
    btn2: TSpeedButtonImage;
    btnAirGas2: TSpeedButtonImage;
    spdInlet: TSpeedo;
    pnl2: TPanel;
    btn4: TSpeedButtonImage;
    btn5: TSpeedButtonImage;
    btnAirGas3: TSpeedButtonImage;
    spdN2: TSpeedo;
    pnl15: TPanel;
    pnl4: TPanel;
    pnl5: TPanel;
    pnl6: TPanel;
    pnl7: TPanel;
    pnl8: TPanel;
    pnl9: TPanel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHMIAIrAndGas: TfrmHMIAIrAndGas;

implementation

{$R *.dfm}

procedure TfrmHMIAIrAndGas.FormCreate(Sender: TObject);
begin
  btnAirGas1.Caption := 'TURBO CHARGER' + #10#13 + 'SPEED N 1';
  btnAirGas2.Caption := 'ENGINE AIR INLET' + #10#13 + 'PRESSURE';
  btnAirGas3.Caption := 'TURBO CHARGER' + #10#13 + 'SPEED N 2';

  spdN1.LoadImage := '..\..\resources\LCP\LCP_HMI meter 04a.bmp';
  spdInlet.LoadImage := '..\..\resources\LCP\LCP_HMI meter 04b.bmp';
  spdN2.LoadImage := '..\..\resources\LCP\LCP_HMI meter 04c.bmp';
end;

end.
