unit ufrmGridOption;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzCmboBx, Mask, RzEdit, RzSpnEdt, uTrendChart, uTrendDataType;

type
  TfrmGrid = class(TForm)
    chkShowGrid: TCheckBox;
    lbl1: TLabel;
    cbbForeground: TRzColorComboBox;
    lbl2: TLabel;
    cbbStyle: TComboBox;
    grp1: TGroupBox;
    rbFixed: TRadioButton;
    rbAxis: TRadioButton;
    rzedtVerticalTick: TRzSpinEdit;
    rzedtHorizontalTick: TRzSpinEdit;
    lbl3: TLabel;
    lbl4: TLabel;
    cbbAxisTick: TComboBox;
    procedure rbFixedClick(Sender: TObject);
    procedure rbAxisClick(Sender: TObject);
  private
    { Private declarations }
    FChart :TTrendChart;
  public
    { Public declarations }
    procedure SetChart(aChart : TTrendChart);
    procedure Apply;
  end;

var
  frmGrid: TfrmGrid;

implementation

{$R *.dfm}

procedure TfrmGrid.Apply;
begin
  FChart.GridColor := cbbForeground.SelectedColor;
  FChart.ShowGrid := chkShowGrid.Checked;
  case cbbStyle.ItemIndex of
    0 : FChart.GridAttribute.Style := eldsNone ;
    1 : FChart.GridAttribute.Style := eldsSolid ;
    2 : FChart.GridAttribute.Style := eldsDash ;
    3 : FChart.GridAttribute.Style := eldSmallDash ;
    4 : FChart.GridAttribute.Style := eldsDashDot ;
    5 : FChart.GridAttribute.Style := eldsDashDotDot ;
  end;
end;

procedure TfrmGrid.rbAxisClick(Sender: TObject);
begin
  rzedtVerticalTick.Enabled := False;
  rzedtHorizontalTick.Enabled := False;
  cbbAxisTick.Enabled := True;
end;

procedure TfrmGrid.rbFixedClick(Sender: TObject);
begin
  rzedtVerticalTick.Enabled := True;
  rzedtHorizontalTick.Enabled := True;
  cbbAxisTick.Enabled := False;
end;

procedure TfrmGrid.SetChart(aChart : TTrendChart);
begin
  FChart := aChart;
  chkShowGrid.Checked := aChart.ShowGrid;
  cbbForeground.SelectedColor := aChart.GridColor;
  case aChart.GridAttribute.Style of
    eldsNone : cbbStyle.ItemIndex := 0;
    eldsSolid : cbbStyle.ItemIndex := 1;
    eldsDash : cbbStyle.ItemIndex := 2;
    eldSmallDash: cbbStyle.ItemIndex := 3;
    eldsDashDot : cbbStyle.ItemIndex := 4;
    eldsDashDotDot : cbbStyle.ItemIndex := 5;
  end;

end;

end.
