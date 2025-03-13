unit uHMILubOilCircuit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, VrControls, VrRotarySwitch, StdCtrls, Buttons, SpeedButtonImage,
  VrWheel, ExtCtrls, Unit6;

type
  TfrmHMILubOilCircuit = class(TForm)
    grpRemote: TGroupBox;
    vrtryswtchRemote: TVrRotarySwitch;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    pnl1: TPanel;
    btn1: TSpeedButtonImage;
    btn2: TSpeedButtonImage;
    btnLub1: TSpeedButtonImage;
    spdEngInPres: TSpeedo;
    pnl2: TPanel;
    btn3: TSpeedButtonImage;
    btn4: TSpeedButtonImage;
    btnLub2: TSpeedButtonImage;
    spdLATC: TSpeedo;
    pnl3: TPanel;
    btn6: TSpeedButtonImage;
    btn7: TSpeedButtonImage;
    btnLub3: TSpeedButtonImage;
    spdTurboChar: TSpeedo;
    pnl4: TPanel;
    btn9: TSpeedButtonImage;
    btn10: TSpeedButtonImage;
    btnLub4: TSpeedButtonImage;
    spdEngInTemp: TSpeedo;
    pnl5: TPanel;
    btn12: TSpeedButtonImage;
    btn13: TSpeedButtonImage;
    btnLub5: TSpeedButtonImage;
    spdLBTC: TSpeedo;
    btnLub6: TSpeedButtonImage;
    btn16: TSpeedButtonImage;
    pnl6: TPanel;
    pnl7: TPanel;
    pnl8: TPanel;
    pnl9: TPanel;
    pnl10: TPanel;
    pnl11: TPanel;
    pnl12: TPanel;
    pnl13: TPanel;
    pnl14: TPanel;
    pnl15: TPanel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHMILubOilCircuit: TfrmHMILubOilCircuit;

implementation

{$R *.dfm}

procedure TfrmHMILubOilCircuit.FormCreate(Sender: TObject);
begin
  btnLub1.Caption := 'ENGINE INLET' + #10#13 + 'LUB OIL' + #10#13 + 'PRESSURE';
  btnLub2.Caption := 'LA TC' + #10#13 + 'OUTLET LUB OIL' + #10#13 + 'TEMPERATURE';
  btnLub3.Caption := 'TURBO CHARGER' + #10#13 + 'INLET LUB OIL' + #10#13 + 'PRESSURE';
  btnLub4.Caption := 'ENGINE INLET' + #10#13 + 'LUB OIL' + #10#13 + 'TEMPERATURE';
  btnLub5.Caption := 'LB TC' + #10#13 + 'OUTLET LUB OIL' + #10#13 + 'TEMPERATURE';
  btnLub6.Caption := 'PRELUB' + #10#13 + 'PUMP OFF';

  spdEngInPres.LoadImage :=  '..\..\resources\LCP\LCP_HMI meter 02a.bmp';
  spdEngInPres.LoadImage :=  '..\..\resources\LCP\LCP_HMI meter 02b.bmp';
  spdEngInPres.LoadImage :=  '..\..\resources\LCP\LCP_HMI meter 02c.bmp';
  spdEngInPres.LoadImage :=  '..\..\resources\LCP\LCP_HMI meter 02d.bmp';
  spdEngInPres.LoadImage :=  '..\..\resources\LCP\LCP_HMI meter 02e.bmp';
end;

end.
