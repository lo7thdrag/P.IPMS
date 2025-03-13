unit uHMIGenScreen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, SpeedButtonImage, VrControls, VrWheel, ExtCtrls, Unit6;

type
  TfrmHMIGenScreen = class(TForm)
    pnl1: TPanel;
    btn1: TSpeedButtonImage;
    btn2: TSpeedButtonImage;
    btnGen1: TSpeedButtonImage;
    pnl2: TPanel;
    btn4: TSpeedButtonImage;
    btn5: TSpeedButtonImage;
    btnGen2: TSpeedButtonImage;
    pnl3: TPanel;
    btn7: TSpeedButtonImage;
    btn8: TSpeedButtonImage;
    btnGen3: TSpeedButtonImage;
    pnl4: TPanel;
    btn10: TSpeedButtonImage;
    btn11: TSpeedButtonImage;
    btnGen4: TSpeedButtonImage;
    pnl5: TPanel;
    btn13: TSpeedButtonImage;
    btn14: TSpeedButtonImage;
    btnGen5: TSpeedButtonImage;
    pnl6: TPanel;
    btn16: TSpeedButtonImage;
    btn17: TSpeedButtonImage;
    btnGen6: TSpeedButtonImage;
    pnl7: TPanel;
    btn19: TSpeedButtonImage;
    btn20: TSpeedButtonImage;
    btnGen7: TSpeedButtonImage;
    spdEngAir: TSpeedo;
    spdENgSpeed: TSpeedo;
    spdFuelRack: TSpeedo;
    spdTurboN1: TSpeedo;
    spdDigSpeed: TSpeedo;
    spdShaft: TSpeedo;
    spdTurboSpeedN2: TSpeedo;
    pnl15: TPanel;
    pnl8: TPanel;
    pnl9: TPanel;
    pnl10: TPanel;
    pnl11: TPanel;
    pnl12: TPanel;
    pnl13: TPanel;
    pnl14: TPanel;
    pnl16: TPanel;
    pnl17: TPanel;
    pnl18: TPanel;
    pnl19: TPanel;
    pnl20: TPanel;
    pnl21: TPanel;
    pnl22: TPanel;
    pnl23: TPanel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHMIGenScreen: TfrmHMIGenScreen;

implementation

{$R *.dfm}

procedure TfrmHMIGenScreen.FormCreate(Sender: TObject);
begin
  btnGen1.Caption := 'ENGINE AIR INLET' + #10#13 + 'PRESSURE';
  btnGen2.Caption := 'ENGINE SPEED';
  btnGen3.Caption := 'FUEL RACK';
  btnGen4.Caption := 'TURBO CHARGER'+ #10#13 + 'SPEED N 1';
  btnGen5.Caption := 'DIGITAL' + #10#13 + 'SPEED SET POINT';
  btnGen6.Caption := 'TURBO CHARGER SPEED' + #10#13 + 'SPEED N 2';
  btnGen7.Caption := 'SHAFT SPEED';

  spdEngAir.LoadImage := '..\..\resources\LCP\HMI_0to4.bmp';
  spdENgSpeed.LoadImage := '..\..\resources\LCP\HMI_0to1200.bmp';
  spdFuelRack.LoadImage := '..\..\resources\LCP\HMI_0to35.bmp';
  spdTurboN1.LoadImage := '..\..\resources\LCP\LCP_HMI meter 01d.bmp';
  spdDigSpeed.LoadImage := '..\..\resources\LCP\LCP_HMI meter 01e.bmp';
  spdTurboSpeedN2.LoadImage := '..\..\resources\LCP\LCP_HMI meter 01f.bmp';
  spdShaft.LoadImage := '..\..\resources\LCP\LCP_HMI meter 01g.bmp';

end;

end.
