unit ufrmHistoricalRealtime;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleServer, MapXLib_TLB, ExtCtrls, Grids, VCLTee.TeEngine, VCLTee.Series,
  VCLTee.TeeProcs, VCLTee.Chart, DateUtils, Buttons, VclTee.TeeGDIPlus;

type
  TfrmHistoricalRealtime = class(TForm)
    btnPrintScreen: TButton;
    btnExit: TButton;
    cht1: TChart;
    Series1: TFastLineSeries;
    StringGrid1: TStringGrid;
    lblHistDate1: TLabel;
    lblHistTime1: TLabel;
    lblHistTime2: TLabel;
    lblHistDate2: TLabel;
    btnNext2: TButton;
    btnNext1: TButton;
    btnPrev2: TButton;
    btnPrev1: TButton;
    pnlPause: TPanel;
    btnSpan: TButton;
    btnWidden: TButton;
    btnNarrow: TButton;
    procedure btnExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPrev1Click(Sender: TObject);
    procedure btnNext1Click(Sender: TObject);
    procedure pnlPauseClick(Sender: TObject);
    procedure btnSpanClick(Sender: TObject);
    procedure btnWiddenClick(Sender: TObject);

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHistoricalRealtime: TfrmHistoricalRealtime;
  tm, tm1, tm2: TDateTime;

implementation

{$R *.dfm}

procedure TfrmHistoricalRealtime.btnNext1Click(Sender: TObject);
begin
  tm1 := StrToTime(lblHistTime1.Caption);
  tm1 := IncMinute(tm1, 60);
  lblHistTime1.Caption := FormatDateTime('hh:nn:ss', tm1);

  tm2 := StrToTime(lblHistTime2.Caption);
  tm2 := IncMinute(tm2, 60);
  lblHistTime2.Caption := FormatDateTime('hh:nn:ss', tm2);
end;

procedure TfrmHistoricalRealtime.btnPrev1Click(Sender: TObject);
begin
  tm1 := StrToTime(lblHistTime1.Caption);
  tm1 := IncMinute(tm1, -60);
  lblHistTime1.Caption := FormatDateTime('hh:nn:ss', tm1);

  tm2 := StrToTime(lblHistTime2.Caption);
  tm2 := IncMinute(tm2, -60);
  lblHistTime2.Caption := FormatDateTime('hh:nn:ss', tm2);

end;

procedure TfrmHistoricalRealtime.btnSpanClick(Sender: TObject);
begin
  btnSpan.Visible := False;
end;

procedure TfrmHistoricalRealtime.btnWiddenClick(Sender: TObject);
begin
  btnSpan.Visible := True;
end;

procedure TfrmHistoricalRealtime.btnExitClick(Sender: TObject);
begin
  frmHistoricalRealtime.Close;
end;

procedure TfrmHistoricalRealtime.FormCreate(Sender: TObject);
begin
  tm := Time;
  tm := IncMinute(tm, -60);
  lblHistTime1.Caption := FormatDateTime('hh:nn:ss', tm);
  lblHistDate1.Caption := FormatDateTime('dd/mm/yyyy', Now);

  lblHistTime2.Caption := FormatDateTime('hh:nn:ss', Now);
  lblHistDate2.Caption := FormatDateTime('dd/mm/yyyy', Now);

  StringGrid1.ColCount := 9;
  StringGrid1.RowCount := 1;

  with stringgrid1 do
   begin
     cells[0,0]:='Line ID';
     cells[1,0]:='Units';
     cells[2,0]:='Description';
     cells[3,0]:='Current Value';
     cells[4,0]:='Slider Value';
     cells[5,0]:='Slider Value Time';
     cells[6,0]:='2nd Slider Value';
     cells[7,0]:='2nd Slider Value Time';
     cells[8,0]:='2nd Slider Value';
   end;
end;

procedure TfrmHistoricalRealtime.pnlPauseClick(Sender: TObject);
begin
//  if pnlPause.Caption = 'PAUSE' then
//    pnlPause.Color := clBtnFace
//  else
//  begin
//    pnlPause.Caption := 'RESUME';
//    pnlPause.Color := clYellow;
//  end;

  if pnlPause.Caption = 'RESUME' then
  begin
    pnlPause.Caption := 'PAUSE';
    pnlPause.Color := clBtnFace;
  end
  else
  begin
    pnlPause.Caption := 'RESUME';
    pnlPause.Color := clYellow;
  end;

end;

end.
