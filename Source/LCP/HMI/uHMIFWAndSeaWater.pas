unit uHMIFWAndSeaWater;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, VrControls, VrRotarySwitch, StdCtrls, Buttons, SpeedButtonImage,
  VrWheel, ExtCtrls, Unit6, Gauges;

type
  TfrmHMISeaWater = class(TForm)
    pnl3: TPanel;
    btn6: TSpeedButtonImage;
    btn7: TSpeedButtonImage;
    btnSea1: TSpeedButtonImage;
    spdN1: TSpeedo;
    pnl1: TPanel;
    btn1: TSpeedButtonImage;
    btn2: TSpeedButtonImage;
    btnSea2: TSpeedButtonImage;
    spdN2: TSpeedo;
    pnl2: TPanel;
    btn4: TSpeedButtonImage;
    btn5: TSpeedButtonImage;
    btnSea3: TSpeedButtonImage;
    spdN3: TSpeedo;
    pnl8: TPanel;
    pnl4: TPanel;
    pnl5: TPanel;
    pnl6: TPanel;
    img1: TImage;
    g9: TGauge;
    img2: TImage;
    pnl7: TPanel;
    vrtryswtchRemote: TVrRotarySwitch;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    pnl15: TPanel;
    pnl9: TPanel;
    btnPreOFF: TSpeedButtonImage;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHMISeaWater: TfrmHMISeaWater;

implementation

{$R *.dfm}

procedure TfrmHMISeaWater.FormCreate(Sender: TObject);
begin
  btnSea1.Caption := 'ENGINE OUTLET' + #10#13 + 'FRESH WATER' + #10#13 + 'TEMPERATURE LA';
  btnSea2.Caption := 'ENGINE INLET' + #10#13 + 'FRESH WATER' + #10#13 + 'PRESSURE';
  btnSea3.Caption := 'ENGINE OUTLET' + #10#13 + 'SEA WATER' + #10#13 + 'PRESSURE';
  btnPreOFF.Caption := 'PREHEATING' + #10#13 + 'OFF';

  spdN1.LoadImage := '..\..\resources\LCP\LCP_HMI meter 03a.bmp';
  spdN2.LoadImage := '..\..\resources\LCP\LCP_HMI meter 03b.bmp';
  spdN3.LoadImage := '..\..\resources\LCP\LCP_HMI meter 03c.bmp';
end;

end.
