unit ufrmPCOTFilteringDeviations;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VCLTee.TeEngine, VCLTee.Series,
  VCLTee.TeeProcs, VCLTee.Chart, VrControls, VrButtons, Vcl.StdCtrls,
  Vcl.ExtCtrls, RzBmpBtn, Vcl.Imaging.pngimage, VrRocker, Vcl.ComCtrls,
  AdvTrackBar;

type
  TfrmPCOTFilteringDeviations = class(TForm)
    pnlMain: TPanel;
    Panel8: TPanel;
    VrDemoButton1: TVrDemoButton;
    VrDemoButton3: TVrDemoButton;
    Panel2: TPanel;
    VrDemoButton2: TVrDemoButton;
    Label24: TLabel;
    lblTime: TLabel;
    ImgBackground: TImage;
    btnNext: TRzBmpButton;
    btnCurves: TRzBmpButton;
    btnMenu: TRzBmpButton;
    btnAlarms: TRzBmpButton;
    btnInstantaneousDeviation: TRzBmpButton;
    lblB1PCOT: TLabel;
    lblA1PCOT: TLabel;
    lblA2PCOT: TLabel;
    lblB2PCOT: TLabel;
    lblB3PCOT: TLabel;
    lblA3PCOT: TLabel;
    lblA4PCOT: TLabel;
    lblB4PCOT: TLabel;
    lblB5PCOT: TLabel;
    lblA5PCOT: TLabel;
    lblA6PCOT: TLabel;
    lblB6PCOT: TLabel;
    lblB7PCOT: TLabel;
    lblA7PCOT: TLabel;
    lblA8PCOT: TLabel;
    lblB8PCOT: TLabel;
    lblB9PCOT: TLabel;
    Label30: TLabel;
    lblA10PCOT: TLabel;
    lblB10PCOT: TLabel;
    Label33: TLabel;
    lblAverageTempPCOT: TLabel;
    btnAlarmReset: TRzBmpButton;
    pnlGrafik1: TPanel;
    Edit1: TEdit;
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
    procedure btnNextClick(Sender: TObject);
    procedure btnPreviousClick(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure MenuClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPCOTFilteringDeviations: TfrmPCOTFilteringDeviations;

implementation

uses
  ufrmLineAExhaustGasTemperature, ufrmCrankinOilTemperature, ufrmMenu;
{$R *.dfm}

procedure TfrmPCOTFilteringDeviations.btnNextClick(Sender: TObject);
begin
  frmLineAExhaustGasTemperature.Show;
  Self.Hide;
end;

procedure TfrmPCOTFilteringDeviations.btnPreviousClick(Sender: TObject);
begin
  frmCrankpinOilTemperature.Show;
  Self.Hide;
end;

procedure TfrmPCOTFilteringDeviations.Edit1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    if StrToInt(Edit1.Text) < 0 then
    begin
      pnlGrafik1.Height := abs(StrToInt(Edit1.Text));
      pnlGrafik1.Top := 568
    end
    else
    begin
      pnlGrafik1.Height := abs(StrToInt(Edit1.Text));
      pnlGrafik1.Top := 568 - StrToInt(Edit1.Text);
    end;
  end;
end;

procedure TfrmPCOTFilteringDeviations.FormCreate(Sender: TObject);
begin
  lblTime.Caption := FormatDateTime('dd"/"mm"/"yyyy hh:nn:ss ampm', Now);
end;

procedure TfrmPCOTFilteringDeviations.MenuClick(Sender: TObject);
begin
  frmMenu.Show;
  Self.Hide;
end;

end.
