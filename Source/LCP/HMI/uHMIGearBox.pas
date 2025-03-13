unit uHMIGearBox;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, SpeedButtonImage, VrControls, VrWheel, ExtCtrls,
  Unit6;

type
  TfrmHMIGearBox = class(TForm)
    lbl7: TLabel;
    pnl2: TPanel;
    btn4: TSpeedButtonImage;
    btn5: TSpeedButtonImage;
    btnGear1: TSpeedButtonImage;
    spdGear1: TSpeedo;
    pnl1: TPanel;
    btn1: TSpeedButtonImage;
    btn2: TSpeedButtonImage;
    btnGear2: TSpeedButtonImage;
    spdGear2: TSpeedo;
    pnl3: TPanel;
    btn6: TSpeedButtonImage;
    btn7: TSpeedButtonImage;
    btnGear3: TSpeedButtonImage;
    spdGear3: TSpeedo;
    pnl4: TPanel;
    btn9: TSpeedButtonImage;
    btn10: TSpeedButtonImage;
    btnGear4: TSpeedButtonImage;
    spdGear4: TSpeedo;
    pnl5: TPanel;
    btn12: TSpeedButtonImage;
    btn13: TSpeedButtonImage;
    btnGear5: TSpeedButtonImage;
    spdGear5: TSpeedo;
    pnl6: TPanel;
    btn15: TSpeedButtonImage;
    btn16: TSpeedButtonImage;
    btnGear6: TSpeedButtonImage;
    spdGear6: TSpeedo;
    pnl7: TPanel;
    pnl8: TPanel;
    pnl9: TPanel;
    pnl10: TPanel;
    pnl11: TPanel;
    pnl12: TPanel;
    pnl13: TPanel;
    pnl14: TPanel;
    pnl15: TPanel;
    lbl1: TLabel;
    pnl16: TPanel;
    pnl17: TPanel;
    lbl2: TLabel;
    pnl18: TPanel;
    pnl19: TPanel;
    pnl20: TPanel;
    pnl21: TPanel;
    pnl22: TPanel;
    lbl3: TLabel;
    pnl23: TPanel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHMIGearBox: TfrmHMIGearBox;

implementation

{$R *.dfm}

procedure TfrmHMIGearBox.FormCreate(Sender: TObject);
begin
  btnGear1.Caption := 'SHAFT SPEED';
  btnGear2.Caption := 'LUB OIL' + #10#13 + 'TEMPERATURE' + #10#13 + 'GEAR UNIT INLET';
  btnGear3.Caption := 'ENGINE SPEED';
  btnGear4.Caption := 'CONTROL OIL' + #10#13 + 'PRESSURE' + #10#13 + 'GEAR UNIT INLET';
  btnGear5.Caption := 'LUB OIL' + #10#13 + 'PRESSURE' + #10#13 + 'GEAR UNIT INLET';
  btnGear6.Caption := 'CONTROL OIL' + #10#13 + 'PRESSURE' + #10#13 + 'MULTIDISK CLUTCH';

  spdGear1.LoadImage := '..\..\resources\LCP\LCP_HMI meter 06a.bmp';
  spdGear2.LoadImage := '..\..\resources\LCP\LCP_HMI meter 06b.bmp';
  spdGear3.LoadImage := '..\..\resources\LCP\LCP_HMI meter 06c.bmp';
  spdGear4.LoadImage := '..\..\resources\LCP\LCP_HMI meter 06d.bmp';
  spdGear5.LoadImage := '..\..\resources\LCP\LCP_HMI meter 06e.bmp';
  spdGear6.LoadImage := '..\..\resources\LCP\LCP_HMI meter 06f.bmp';
end;

end.
