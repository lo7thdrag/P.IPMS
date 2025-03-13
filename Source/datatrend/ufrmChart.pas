unit ufrmChart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzCmboBx, Mask, ExtCtrls, uTrendChart;

type
  TfrmChartOption = class(TForm)
    cbbForeground: TRzColorComboBox;
    lbl1: TLabel;
    lbl2: TLabel;
    cbbBackground: TRzColorComboBox;
    lbl3: TLabel;
    cbbChart: TRzColorComboBox;
    Label1: TLabel;
    medtAutoUpdate: TMaskEdit;
    lbl4: TLabel;
    medtRuntimeRefresh: TMaskEdit;
    cbb3: TComboBox;
    lbl5: TLabel;
    chkShowButton: TCheckBox;
    chk2ndSlider: TCheckBox;
    rg1: TRadioGroup;
    btnAdvance: TButton;
  private
    { Private declarations }
    FChart : TTrendChart;
  public
    { Public declarations }
    procedure SetChart(aChart : TTrendChart);
    procedure Apply;
  end;

var
  frmChartOption: TfrmChartOption;

implementation

{$R *.dfm}

{ TfrmChartOption }

procedure TfrmChartOption.Apply;
begin

  if Assigned(FChart) then
  begin
    FChart.ForegroundColor := cbbForeground.SelectedColor;
    FChart.BackgroundColor := cbbBackground.SelectedColor;
    FChart.ChartColor := cbbChart.SelectedColor;
    FChart.Show2ndSlider := chk2ndSlider.Checked;
    FChart.ShowButton := chkShowButton.Checked;
  end;

end;

procedure TfrmChartOption.SetChart(aChart: TTrendChart);
begin
  FChart := aChart;

  cbbForeground.ItemIndex := cbbForeground.Count - 1;
  cbbBackground.ItemIndex := cbbBackground.Count - 1;
  cbbChart.ItemIndex := cbbChart.Count - 1;

  cbbForeground.SelectedColor := aChart.ForegroundColor;
  cbbBackground.SelectedColor := aChart.BackgroundColor;
  cbbChart.SelectedColor := aChart.ChartColor;

  chk2ndSlider.Checked := aChart.Show2ndSlider;
  chkShowButton.Checked := aChart.ShowButton;

end;

end.
