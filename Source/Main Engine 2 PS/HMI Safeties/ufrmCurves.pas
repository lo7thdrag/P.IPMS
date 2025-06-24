unit ufrmCurves;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, RzBmpBtn,
  Vcl.Imaging.pngimage, VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.Series,
  VCLTee.TeeProcs, VCLTee.Chart;

type
  TfrmCurves = class(TForm)
    pnlMain: TPanel;
    ImgBackground: TImage;
    btnAlarms: TRzBmpButton;
    Image13: TImage;
    Label24: TLabel;
    btnCurves: TRzBmpButton;
    btnMenu: TRzBmpButton;
    pnlTime: TPanel;
    lblTime: TLabel;
    Timer1: TTimer;
    chtCurves: TChart;
    FuelRack: TFastLineSeries;
    TC1Speed: TFastLineSeries;
    EngineSpeed: TFastLineSeries;
    Pitch: TFastLineSeries;
    TC2Speed: TFastLineSeries;
    pnlEngineSpeed: TPanel;
    lblDate1: TLabel;
    lblTimes1: TLabel;
    pnlFuelRack: TPanel;
    lblDate2: TLabel;
    lblTimes2: TLabel;
    pnlTC1Speed: TPanel;
    lblDate3: TLabel;
    lblTimes3: TLabel;
    pnlTC2Speed: TPanel;
    lblDate4: TLabel;
    lblTimes4: TLabel;
    pnlPitch: TPanel;
    lblDate5: TLabel;
    lblTimes5: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lblEngineSpeed: TLabel;
    lblFuelrack: TLabel;
    lblTC1Speed: TLabel;
    lblTC2Speed: TLabel;
    lblPitch: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure btnMenuClick(Sender: TObject);
    procedure btnAlarmsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public
    FXCounter: Integer;

    FXCounterEngineSpeed : Integer;
    FXCounterFuelRack    : Integer;
    FXCounterTC1Speed    : Integer;
    FXCounterTC2Speed    : Integer;
    FXCounterPitch       : Integer;
  end;

var
  frmCurves: TfrmCurves;

implementation

uses
  ufrmMenu, ufrmAlarms;
{$R *.dfm}

procedure TfrmCurves.FormCreate(Sender: TObject);
begin
  FXCounterEngineSpeed := 0;
  FXCounterFuelRack    := 0;
  FXCounterTC1Speed    := 0;
  FXCounterTC2Speed    := 0;
  FXCounterPitch       := 0;

//  FXCounter := 0;

  chtCurves.BottomAxis.Automatic := False;
  chtCurves.BottomAxis.Minimum := 0;
  chtCurves.BottomAxis.Maximum := 1250;

  chtCurves.LeftAxis.Automatic := False;
  chtCurves.LeftAxis.Minimum   := 0;
  chtCurves.LeftAxis.Maximum   := 1250;

  chtCurves.RightAxis.Automatic := False;
  chtCurves.RightAxis.Minimum  := 0;
  chtCurves.RightAxis.Maximum  := 35;

  EngineSpeed.VertAxis := aLeftAxis;
  TC1Speed.VertAxis    := aLeftAxis;
  TC2Speed.VertAxis    := aLeftAxis;
  FuelRack.VertAxis    := aRightAxis;
end;

procedure TfrmCurves.Timer1Timer(Sender: TObject);
begin
  lblTime.Caption := FormatDateTime('dd"/"mm"/"yyyy hh:nn:ss ampm', Now);

  lblTimes1.Caption := FormatDateTime('hh:nn:ss ampm', Now);
  lblDate1.Caption  := FormatDateTime('dd"/"mm"/"yyyy', Now);

  lblTimes2.Caption := FormatDateTime('hh:nn:ss ampm', Now);
  lblDate2.Caption  := FormatDateTime('dd"/"mm"/"yyyy', Now);

  lblTimes3.Caption := FormatDateTime('hh:nn:ss ampm', Now);
  lblDate3.Caption  := FormatDateTime('dd"/"mm"/"yyyy', Now);

  lblTimes4.Caption := FormatDateTime('hh:nn:ss ampm', Now);
  lblDate4.Caption  := FormatDateTime('dd"/"mm"/"yyyy', Now);

  lblTimes5.Caption := FormatDateTime('hh:nn:ss ampm', Now);
  lblDate5.Caption  := FormatDateTime('dd"/"mm"/"yyyy', Now);
end;

procedure TfrmCurves.btnAlarmsClick(Sender: TObject);
begin
  frmAlarms.Show;
  Self.Hide;
end;

procedure TfrmCurves.btnMenuClick(Sender: TObject);
begin
  frmMenu.Show;
  Self.Hide;
end;

end.
