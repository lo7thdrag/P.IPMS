unit ufrmLineAExhaustGasTemperature;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VCLTee.TeEngine, VCLTee.Series,
  VCLTee.TeeProcs, VCLTee.Chart, Vcl.StdCtrls, Vcl.ExtCtrls, RzBmpBtn,
  Vcl.Imaging.pngimage, VrControls, VrRocker, AdvTrackBar;

type
  TfrmLineAExhaustGasTemperature = class(TForm)
    pnlMain: TPanel;
    Label24: TLabel;
    lblTime: TLabel;
    ImgBackground: TImage;
    btnAlarms: TRzBmpButton;
    btnCurves: TRzBmpButton;
    btnMenu: TRzBmpButton;
    btnPrevious: TRzBmpButton;
    btnLineB: TRzBmpButton;
    lblB1LineA: TLabel;
    lblB2LineA: TLabel;
    lblA1LineA: TLabel;
    lblA2LineA: TLabel;
    lblA3LineA: TLabel;
    lblB3LineA: TLabel;
    lblB4LineA: TLabel;
    lblA4LineA: TLabel;
    lblA5LineA: TLabel;
    lblB5LineA: TLabel;
    lblB6LineA: TLabel;
    lblA6LineA: TLabel;
    lblA7LineA: TLabel;
    lblB7LineA: TLabel;
    lblB8LineA: TLabel;
    lblA9LineA: TLabel;
    lblA8LineA: TLabel;
    lblB9LineA: TLabel;
    lblB10LineA: TLabel;
    lblA10LineA: TLabel;
    Label33: TLabel;
    lblTCInputLineA: TLabel;
    Label35: TLabel;
    lblTCOutputLineA: TLabel;
    Label37: TLabel;
    lblCylinderAverageLineA: TLabel;
    Label39: TLabel;
    lblCompensationLineA: TLabel;
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
    imgGrafik: TImage;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure btnPreviousClick(Sender: TObject);
    procedure btnLineBClick(Sender: TObject);
    procedure MenuClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLineAExhaustGasTemperature: TfrmLineAExhaustGasTemperature;

implementation

uses
  ufrmLineBExhaustGasTemperature, ufrmPCOTFilteringDeviations, ufrmMenu;
{$R *.dfm}

procedure TfrmLineAExhaustGasTemperature.btnLineBClick(Sender: TObject);
begin
  frmLineBExhaustGasTemperature.Show;
  Self.Hide;
end;

procedure TfrmLineAExhaustGasTemperature.btnPreviousClick(Sender: TObject);
begin
  frmPCOTFilteringDeviations.Show;
  Self.Hide;
end;

procedure TfrmLineAExhaustGasTemperature.FormCreate(Sender: TObject);
begin
  lblTime.Caption := FormatDateTime('dd"/"mm"/"yyyy hh:nn:ss ampm', Now);
end;

procedure TfrmLineAExhaustGasTemperature.MenuClick(Sender: TObject);
begin
  frmMenu.Show;
  Self.Hide;
end;

end.
