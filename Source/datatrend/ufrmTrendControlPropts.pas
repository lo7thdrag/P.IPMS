unit ufrmTrendControlPropts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ExtCtrls, ComCtrls, StdCtrls, Menus, ImgList, ToolWin, uTrendChart,
  ufrmChart, uDatabase;

type
  TfrmTrenControlPropts = class(TForm)
    pgc1: TPageControl;
    btnCancel: TButton;
    btnOk: TButton;
    btnApply: TButton;
    btnHelp: TButton;
    tsLines: TTabSheet;
    tsAxis: TTabSheet;
    tsChart: TTabSheet;
    tsLegend: TTabSheet;
    tsGrid: TTabSheet;
    ts6: TTabSheet;
    tmr1: TTimer;
    chk1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure chk1Click(Sender: TObject);
  private
    { Private declarations }
    FChart : TTrendChart;
    FSessionID: integer;
    FDatabase: TIPMSDatabase;
    procedure SetDatabase(const Value: TIPMSDatabase);
    procedure SetSessionID(const Value: integer);
  public
    { Public declarations }
    procedure ResetDataTrend;
    procedure SetChart(chart : TTrendChart);
    procedure QuickAddElement(Value : String);

    property SessionID : integer read FSessionID write SetSessionID;
    property Database : TIPMSDatabase read FDatabase write SetDatabase;
  end;

var
  frmTrenControlPropts: TfrmTrenControlPropts;

implementation

uses ufrmLines, ufrmAxis, ufrmGridOption,ufrmLegend;

{$R *.dfm}

procedure TfrmTrenControlPropts.btnApplyClick(Sender: TObject);
begin
  frmAxis.Apply;
  frmChartOption.Apply;
  frmGrid.Apply;
  frmLegend.Apply;
  frmlines.Apply;
  FChart.Invalidate;
end;

procedure TfrmTrenControlPropts.btnCancelClick(Sender: TObject);
begin
  frmlines.Canceled;
  Close;
end;

procedure TfrmTrenControlPropts.btnOkClick(Sender: TObject);
begin
  frmAxis.Apply;
  frmChartOption.Apply;
  frmGrid.Apply;
  frmLegend.Apply;
  frmlines.Apply;
  FChart.Invalidate;
  Close;
end;

procedure TfrmTrenControlPropts.chk1Click(Sender: TObject);
begin
  if chk1.Checked then
    tmr1.Enabled := True
  else
    tmr1.Enabled := False
end;

procedure TfrmTrenControlPropts.FormActivate(Sender: TObject);
begin
  tmr1.Enabled := False;
end;

procedure TfrmTrenControlPropts.FormCreate(Sender: TObject);
begin

  frmLines := TfrmLines.Create(Self);
  frmLines.BorderStyle := bsNone;
  frmLines.Align := alClient;
  frmLines.Parent := tsLines ;
  frmLines.Show;

  frmAxis := TfrmAxis.Create(Self);
  frmAxis.BorderStyle := bsNone;
  frmAxis.Align := alClient;
  frmAxis.Parent := tsAxis ;
  frmAxis.Show;

  frmChartOption := TfrmChartOption.Create(Self);
  frmChartOption.BorderStyle := bsNone;
  frmChartOption.Align := alClient;
  frmChartOption.Parent := tsChart ;
  frmChartOption.Show;

  frmGrid := TfrmGrid.Create(Self);
  frmGrid.BorderStyle := bsNone;
  frmGrid.Align := alClient;
  frmGrid.Parent := tsGrid ;
  frmGrid.Show;

  frmLegend := TfrmLegend.Create(Self);
  frmLegend.BorderStyle := bsNone;
  frmLegend.Align := alClient;
  frmLegend.Parent := tsLegend ;
  frmLegend.Show;

  pgc1.ActivePageIndex := 0;
end;

procedure TfrmTrenControlPropts.FormDeactivate(Sender: TObject);
begin
  if chk1.Checked then
    tmr1.Enabled := True
  else
    tmr1.Enabled := False
end;

procedure TfrmTrenControlPropts.QuickAddElement(Value: String);
begin
  frmLines.AddElement(Value);
end;

procedure TfrmTrenControlPropts.ResetDataTrend;
begin

end;

procedure TfrmTrenControlPropts.SetChart(chart: TTrendChart);
begin
  FChart := chart;
  frmAxis.SetChart(chart);
  frmChartOption.SetChart(chart);
  frmGrid.SetChart(chart);
  frmLegend.SetChart(chart);
  frmLines.SetChart(chart);
end;

procedure TfrmTrenControlPropts.SetDatabase(const Value: TIPMSDatabase);
begin
  FDatabase := Value;

  frmLines.SetDatabase(FDatabase);
end;

procedure TfrmTrenControlPropts.SetSessionID(const Value: integer);
begin
  FSessionID := Value;

  frmLines.SetSession(FSessionID);
end;

procedure TfrmTrenControlPropts.tmr1Timer(Sender: TObject);
begin
  btnApply.Click
end;

end.
