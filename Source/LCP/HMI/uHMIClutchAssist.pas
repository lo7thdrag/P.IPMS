unit uHMIClutchAssist;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, SpeedButtonImage, VrControls, VrWheel, ExtCtrls,
  Unit6, uDataType;

type
  TfrmHMIClutchingAssist = class(TForm)
    pnl2: TPanel;
    btn4: TSpeedButtonImage;
    btn5: TSpeedButtonImage;
    btnClutch1: TSpeedButtonImage;
    spdCLutch1: TSpeedo;
    pnl1: TPanel;
    btn1: TSpeedButtonImage;
    btn2: TSpeedButtonImage;
    btnClutch2: TSpeedButtonImage;
    spdClutch2: TSpeedo;
    pnl3: TPanel;
    btn6: TSpeedButtonImage;
    btn7: TSpeedButtonImage;
    btnClutch3: TSpeedButtonImage;
    spdClutch3: TSpeedo;
    pnl6: TPanel;
    pnl4: TPanel;
    pnl5: TPanel;
    pnl7: TPanel;
    pnl8: TPanel;
    pnl9: TPanel;
    pnl10: TPanel;
    btn3: TSpeedButtonImage;
    btn8: TSpeedButtonImage;
    btnClutch4: TSpeedButtonImage;
    spdClutch4: TSpeedo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHMIClutchingAssist: TfrmHMIClutchingAssist;

implementation

{$R *.dfm}

procedure TfrmHMIClutchingAssist.FormCreate(Sender: TObject);
begin
  btnClutch1.Caption := 'ENGINE SPEED';
  btnClutch2.Caption := 'ENGINE INLET' + #10#13 + 'LUB OIL' + #10#13 + 'TEMPERATURE';
  btnClutch3.Caption := 'ENGINE OUTLET' + #10#13 + 'FRESH WATER' + 'TEMPERATURE LA';
  btnClutch4.Caption := 'SHAFT SPEED';

  spdCLutch1.LoadImage := '..\..\resources\LCP\LCP_HMI meter 05a.bmp';
  spdClutch2.LoadImage := '..\..\resources\LCP\LCP_HMI meter 05b.bmp';
  spdClutch3.LoadImage := '..\..\resources\LCP\LCP_HMI meter 05c.bmp';
  spdClutch4.LoadImage := '..\..\resources\LCP\LCP_HMI meter 05d.bmp';

end;
end.
