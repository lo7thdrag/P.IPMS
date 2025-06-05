unit ufrmLineBExhaustGasTemperature;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VCLTee.TeEngine, VCLTee.Series,
  VCLTee.TeeProcs, VCLTee.Chart, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, RzBmpBtn, VrControls, VrRocker, AdvTrackBar;

type
  TfrmLineBExhaustGasTemperature = class(TForm)
    pnlMain: TPanel;
    Label24: TLabel;
    btnAlarms: TRzBmpButton;
    btnCurves: TRzBmpButton;
    btnMenu: TRzBmpButton;
    ImgBackground: TImage;
    btnNext: TRzBmpButton;
    btnLineA: TRzBmpButton;
    Label33: TLabel;
    lblTCInputLineB: TLabel;
    Label35: TLabel;
    lblTCOutputLineB: TLabel;
    Label37: TLabel;
    lblCylinderAverageLineB: TLabel;
    Label39: TLabel;
    lblCompensationLineA: TLabel;
    lblA1LineB: TLabel;
    lblA2LineB: TLabel;
    lblA3LineB: TLabel;
    lblA4LineB: TLabel;
    lblA5LineB: TLabel;
    lblA6LineB: TLabel;
    lblA7LineB: TLabel;
    lblA8LineB: TLabel;
    lblA9LineB: TLabel;
    lblA10LineB: TLabel;
    lblB1LineB: TLabel;
    lblB2LineB: TLabel;
    lblB3LineB: TLabel;
    lblB4LineB: TLabel;
    lblB5LineB: TLabel;
    lblB6LineB: TLabel;
    lblB7LineB: TLabel;
    lblB8LineB: TLabel;
    lblB9LineB: TLabel;
    lblB10LineB: TLabel;
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
    pnlTime: TPanel;
    lblTime: TLabel;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnLineAClick(Sender: TObject);
    procedure MenuClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLineBExhaustGasTemperature: TfrmLineBExhaustGasTemperature;

implementation

uses
  ufrmSafetiesStop, ufrmLineAExhaustGasTemperature, ufrmMenu;
{$R *.dfm}

procedure TfrmLineBExhaustGasTemperature.btnLineAClick(Sender: TObject);
begin
  frmLineAExhaustGasTemperature.Show;
  Self.Hide;
end;

procedure TfrmLineBExhaustGasTemperature.btnNextClick(Sender: TObject);
begin
  frmSafetiesStop.Show;
  Self.Hide;
end;

procedure TfrmLineBExhaustGasTemperature.FormCreate(Sender: TObject);
begin
  DoubleBuffered := True;
  pnlMain.DoubleBuffered := True;
  lblTime.Transparent := True;
  imgBackground.SendToBack;
  pnlTime.DoubleBuffered := True;
end;

procedure TfrmLineBExhaustGasTemperature.MenuClick(Sender: TObject);
begin
  frmMenu.Show;
  Self.Hide;
end;

procedure TfrmLineBExhaustGasTemperature.Timer1Timer(Sender: TObject);
begin
  lblTime.Caption := FormatDateTime('dd"/"mm"/"yyyy hh:nn:ss ampm', Now);
end;

end.
