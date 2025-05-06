unit ufrmEngineBearingTemperature;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, VCLTee.TeEngine,
  VCLTee.TeeProcs, VCLTee.Chart, Vcl.ExtCtrls, Vcl.StdCtrls, VrControls,
  VrButtons, VCLTee.Series, RzBmpBtn, Vcl.Imaging.pngimage, VrRocker,
  AdvTrackBar;

type
  TfrmEngineBearingTemperature = class(TForm)
    pnlMain: TPanel;
    Panel8: TPanel;
    VrDemoButton1: TVrDemoButton;
    VrDemoButton3: TVrDemoButton;
    Label24: TLabel;
    lblTime: TLabel;
    ImgBackground: TImage;
    btnAlarms: TRzBmpButton;
    btnCurves: TRzBmpButton;
    btnMenu: TRzBmpButton;
    btnNext: TRzBmpButton;
    btnPrevious: TRzBmpButton;
    Image1: TImage;
    lblEngineBearing1: TLabel;
    lblEngineBearing2: TLabel;
    lblEngineBearing3: TLabel;
    lblEngineBearing4: TLabel;
    lblEngineBearing5: TLabel;
    lblEngineBearing6: TLabel;
    lblEngineBearing7: TLabel;
    lblEngineBearing8: TLabel;
    lblEngineBearing9: TLabel;
    lblEngineBearing10: TLabel;
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
    lblEngineBearing11: TLabel;
    pnlGrafik11: TPanel;
    Image2: TImage;
    procedure FormCreate(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnPreviousClick(Sender: TObject);
    procedure MenuClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEngineBearingTemperature: TfrmEngineBearingTemperature;

implementation

uses
 ufrmCrankinOilTemperature, ufrmAirGasCircuit, ufrmMenu;

{$R *.dfm}

procedure TfrmEngineBearingTemperature.btnNextClick(Sender: TObject);
begin
  frmCrankpinOilTemperature.Show;
  Self.Hide;
end;

procedure TfrmEngineBearingTemperature.btnPreviousClick(Sender: TObject);
begin
  frmAirGasCircuit.Show;
  Self.Hide;
end;

procedure TfrmEngineBearingTemperature.FormCreate(Sender: TObject);
begin
  lblTime.Caption := FormatDateTime('dd"/"mm"/"yyyy hh:nn:ss ampm', Now);
end;

procedure TfrmEngineBearingTemperature.MenuClick(Sender: TObject);
begin
  frmMenu.Show;
  Self.Hide;
end;

end.
