unit ufrmCrankinOilTemperature;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, VCLTee.TeEngine,
  Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart, VCLTee.Series, VrControls,
  VrButtons, Vcl.StdCtrls, RzBmpBtn, Vcl.Imaging.pngimage, VrRocker, AdvTrackBar;

type
  TfrmCrankpinOilTemperature = class(TForm)
    pnlMain: TPanel;
    Panel8: TPanel;
    VrDemoButton1: TVrDemoButton;
    VrDemoButton3: TVrDemoButton;
    Panel2: TPanel;
    VrDemoButton2: TVrDemoButton;
    Label24: TLabel;
    ImgBackground: TImage;
    btnAlarms: TRzBmpButton;
    btnCurves: TRzBmpButton;
    btnMenu: TRzBmpButton;
    btnPrevious: TRzBmpButton;
    btnFilteringDeviation: TRzBmpButton;
    lblB1Crankpin: TLabel;
    lblB2Crankpin: TLabel;
    lblB3Crankpin: TLabel;
    lblB4Crankpin: TLabel;
    lblB5Crankpin: TLabel;
    lblB6Crankpin: TLabel;
    lblB7Crankpin: TLabel;
    lblB8Crankpin: TLabel;
    lblB9Crankpin: TLabel;
    lblB10Crankpin: TLabel;
    lblA1Crankpin: TLabel;
    lblA2Crankpin: TLabel;
    lblA3Crankpin: TLabel;
    lblA4Crankpin: TLabel;
    lblA5Crankpin: TLabel;
    lblA6Crankpin: TLabel;
    lblA7Crankpin: TLabel;
    lblA8Crankpin: TLabel;
    lblA9Crankpin: TLabel;
    lblA10Crankpin: TLabel;
    pnlGrafik1: TPanel;
    pnlGrafik2: TPanel;
    pnlGrafik3: TPanel;
    pnlGrafik4: TPanel;
    pnlGrafik5: TPanel;
    pnlGrafik6: TPanel;
    pnlGrafik7: TPanel;
    pnlGrafik8: TPanel;
    pnlGrafik9: TPanel;
    pnlGrafik10: TPanel;
    btnAlarmReset: TRzBmpButton;
    Label33: TLabel;
    lblAverageTempPCOT: TLabel;
    imgGrafik: TImage;
    Image1: TImage;
    Timer1: TTimer;
    pnlTime: TPanel;
    lblTime: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnPreviousClick(Sender: TObject);
    procedure btnFilteringDeviationClick(Sender: TObject);
    procedure MenuClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnAlarmsClick(Sender: TObject);
    procedure btnCurvesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCrankpinOilTemperature: TfrmCrankpinOilTemperature;

implementation

uses
  ufrmPCOTFilteringDeviations, ufrmEngineBearingTemperature, ufrmMenu, ufrmAlarms, ufrmCurves;
{$R *.dfm}

procedure TfrmCrankpinOilTemperature.btnAlarmsClick(Sender: TObject);
begin
  frmAlarms.Show;
  Self.Hide;
end;

procedure TfrmCrankpinOilTemperature.btnCurvesClick(Sender: TObject);
begin
  frmCurves.Show;
  Self.Hide;
end;

procedure TfrmCrankpinOilTemperature.btnFilteringDeviationClick(
  Sender: TObject);
begin
  frmPCOTFilteringDeviations.Show;
  Self.Hide;
end;

procedure TfrmCrankpinOilTemperature.btnPreviousClick(Sender: TObject);
begin
  frmEngineBearingTemperature.Show;
  Self.Hide;
end;

procedure TfrmCrankpinOilTemperature.FormCreate(Sender: TObject);
begin
  DoubleBuffered := True;
  pnlMain.DoubleBuffered := True;
  lblTime.Transparent := True;
  imgBackground.SendToBack;
  pnlTime.DoubleBuffered := True;
end;

procedure TfrmCrankpinOilTemperature.MenuClick(Sender: TObject);
begin
  frmMenu.Show;
  Self.Hide;
end;

procedure TfrmCrankpinOilTemperature.Timer1Timer(Sender: TObject);
begin
  lblTime.Caption := FormatDateTime('dd"/"mm"/"yyyy hh:nn:ss ampm', Now);
end;

end.
