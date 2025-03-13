unit uHMILineExhaustGasTemp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzBorder, Gauges, ExtCtrls;

type
  TfrmLineGasTemp = class(TForm)
    rzmtrA1: TRzMeter;
    rzmtrA2: TRzMeter;
    rzmtrA3: TRzMeter;
    rzmtrA4: TRzMeter;
    rzmtrA5: TRzMeter;
    rzmtrA6: TRzMeter;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl18: TLabel;
    lbl19: TLabel;
    lbl20: TLabel;
    lbl21: TLabel;
    lbl22: TLabel;
    lbl23: TLabel;
    lbl24: TLabel;
    lbl25: TLabel;
    lbl26: TLabel;
    lbl27: TLabel;
    gA6: TGauge;
    gA5: TGauge;
    gA4: TGauge;
    gA3: TGauge;
    gA2: TGauge;
    gA1: TGauge;
    scrlbr1: TScrollBar;
    lbl29: TLabel;
    img1: TImage;
    lbl64: TLabel;
    lbl28: TLabel;
    lbl30: TLabel;
    procedure scrlbr1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLineGasTemp: TfrmLineGasTemp;

implementation

{$R *.dfm}

procedure TfrmLineGasTemp.scrlbr1Change(Sender: TObject);
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
  else
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

  lbl29.Caption := IntToStr(scrlbr1.Position);

end;

end.
