unit uHMICrankcaseOilTemp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Gauges, RzBorder, SpeedButtonImage;

type
  TfrmCrankOilTemp = class(TForm)
    rzmtrA1: TRzMeter;
    lbl5: TLabel;
    lbl12: TLabel;
    rzmtrB1: TRzMeter;
    rzmtrB2: TRzMeter;
    rzmtrA2: TRzMeter;
    rzmtrB3: TRzMeter;
    rzmtrA3: TRzMeter;
    rzmtrB4: TRzMeter;
    rzmtrA4: TRzMeter;
    rzmtrB5: TRzMeter;
    rzmtrA5: TRzMeter;
    gB6: TGauge;
    rzmtrB6: TRzMeter;
    rzmtrA6: TRzMeter;
    lbl1: TLabel;
    lbl22: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl18: TLabel;
    lbl19: TLabel;
    lbl20: TLabel;
    lbl29: TLabel;
    lbl28: TLabel;
    lbl21: TLabel;
    gA6: TGauge;
    gB5: TGauge;
    gA5: TGauge;
    gB4: TGauge;
    gA4: TGauge;
    gB3: TGauge;
    gA3: TGauge;
    gB2: TGauge;
    gA2: TGauge;
    gB1: TGauge;
    gA1: TGauge;
    lbl23: TLabel;
    lbl24: TLabel;
    lbl25: TLabel;
    lbl26: TLabel;
    lbl27: TLabel;
    lbl30: TLabel;
    lbl31: TLabel;
    lbl32: TLabel;
    lbl33: TLabel;
    lbl34: TLabel;
    lbl35: TLabel;
    lbl36: TLabel;
    lbl37: TLabel;
    lbl38: TLabel;
    lbl39: TLabel;
    lbl40: TLabel;
    lbl41: TLabel;
    lbl42: TLabel;
    lbl43: TLabel;
    lbl44: TLabel;
    lbl45: TLabel;
    lbl46: TLabel;
    lbl47: TLabel;
    lbl48: TLabel;
    lbl49: TLabel;
    lbl50: TLabel;
    lbl51: TLabel;
    lbl53: TLabel;
    lbl55: TLabel;
    lbl57: TLabel;
    lbl59: TLabel;
    lbl61: TLabel;
    lbl63: TLabel;
    pnl1: TPanel;
    btnAlarmReset: TSpeedButtonImage;
    lbl64: TLabel;
    scrlbr1: TScrollBar;
    scrlbr2: TScrollBar;
    img1: TImage;
    lbl52: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure scrlbr1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCrankOilTemp: TfrmCrankOilTemp;

implementation

{$R *.dfm}

procedure TfrmCrankOilTemp.FormCreate(Sender: TObject);
begin
  btnAlarmReset.Caption := 'ALAEM' + #13#10 + 'RESET';
end;

procedure TfrmCrankOilTemp.scrlbr1Change(Sender: TObject);
begin
  if scrlbr1.Position >= 0 then
  begin
    rzmtrA1.Value := 0;
    rzmtrA2.Value := 0;
    rzmtrA3.Value := 0;
    rzmtrA4.Value := 0;
    rzmtrA5.Value := 0;
    rzmtrA6.Value := 0;

    gA1.Progress := scrlbr1.Position;
    gA2.Progress := scrlbr1.Position;
    gA3.Progress := scrlbr1.Position;
    gA4.Progress := scrlbr1.Position;
    gA5.Progress := scrlbr1.Position;
    gA6.Progress := scrlbr1.Position;
  end
  else if scrlbr1.Position < 0 then
  begin
    gA1.Progress := 0;
    gA2.Progress := 0;
    gA3.Progress := 0;
    gA4.Progress := 0;
    gA5.Progress := 0;
    gA6.Progress := 0;

    rzmtrA1.Value := -1 * (scrlbr1.Position);
    rzmtrA2.Value := -1 * (scrlbr1.Position);
    rzmtrA3.Value := -1 * (scrlbr1.Position);
    rzmtrA4.Value := -1 * (scrlbr1.Position);
    rzmtrA5.Value := -1 * (scrlbr1.Position);
    rzmtrA6.Value := -1 * (scrlbr1.Position);
  end;

  lbl52.Caption := IntToStr(scrlbr1.Position);
end;

end.
