unit ufrmDataTrend;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DB, uTrendChart, uTrendData, Grids, uDatabase, lognya;

type
  TfrmTrending = class(TForm)
    trndchrt1: TTrendChart;
    pnl1: TPanel;
    btnPause: TButton;
    btnSpan: TButton;
    btnPrint: TButton;
    btnExit: TButton;
    Button1: TButton;
    procedure trndchrt1DblClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FSessionID: integer;
    FDatabase: TIPMSDatabase;
    procedure SetDatabase(const Value: TIPMSDatabase);
    procedure SetSessionID(const Value: integer);
    { Private declarations }
  public
    { Public declarations }
    procedure AddDataTrend(Value : string);
    procedure ResetDataTrend;

    property SessionID : integer read FSessionID write SetSessionID;
    property Database : TIPMSDatabase read FDatabase write SetDatabase;
  end;

var
  frmTrending: TfrmTrending;

implementation

uses ufrmTrendControlPropts;

{$R *.dfm}

procedure TfrmTrending.AddDataTrend(Value: string);
begin
  if not Assigned(frmTrenControlPropts) then
  begin
    frmTrenControlPropts := TfrmTrenControlPropts.Create(Self);
    frmTrenControlPropts.SetChart(trndchrt1);
    frmTrenControlPropts.Database := Database;
    frmTrenControlPropts.SessionID := SessionID;
  end;

//  if Assigned(frmTrenControlPropts) then
  frmTrenControlPropts.QuickAddElement(Value);
end;

procedure TfrmTrending.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTrending.Button1Click(Sender: TObject);
begin
  Form5.Show;
end;

procedure TfrmTrending.ResetDataTrend;
begin
  if Assigned(frmTrenControlPropts) then
    frmTrenControlPropts.ResetDataTrend;
end;

procedure TfrmTrending.SetDatabase(const Value: TIPMSDatabase);
begin
  FDatabase := Value;
end;

procedure TfrmTrending.SetSessionID(const Value: integer);
begin
  FSessionID := Value;
end;

procedure TfrmTrending.trndchrt1DblClick(Sender: TObject);
begin

  if not Assigned(frmTrenControlPropts) then
  begin
    frmTrenControlPropts := TfrmTrenControlPropts.Create(Self);
    frmTrenControlPropts.SetChart(trndchrt1);
    frmTrenControlPropts.Database := Database;
    frmTrenControlPropts.SessionID := SessionID;
  end;

  frmTrenControlPropts.ShowModal;
end;

end.
