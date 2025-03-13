unit uLCPPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, VrControls, VrWheel, Gauges, AdvSmoothGauge, RzBorder,
  VrAngularMeter, VrRaster, VrMeter;

type
  TfrmLCPPanel = class(TForm)
    btn1: TButton;
    btnGauge: TButton;
    btnTimerandswitch: TButton;
    btn2: TButton;
    g1: TGauge;
    rzmtr2: TRzMeter;
    rzmtr1: TRzMeter;
    vrmtr1: TVrMeter;
    vrstr1: TVrRaster;
    vrnglrmtr1: TVrAngularMeter;
    procedure btn1Click(Sender: TObject);
    procedure btnGaugeClick(Sender: TObject);
    procedure btnTimerandswitchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLCPPanel: TfrmLCPPanel;

implementation
uses uSignalAndButton, uGaugeLCP, uTimerAndSwitch, uHMILCP;

{$R *.dfm}

procedure TfrmLCPPanel.btn1Click(Sender: TObject);
begin
  frmSignalAndButton.Show;
end;

procedure TfrmLCPPanel.btn2Click(Sender: TObject);
begin
  frmHMILCP.Show;
end;

procedure TfrmLCPPanel.btnGaugeClick(Sender: TObject);
begin
  frmGaugeLCP.Show;
end;

procedure TfrmLCPPanel.btnTimerandswitchClick(Sender: TObject);
begin
  frmTimerAndSwitch.Show;
end;

procedure TfrmLCPPanel.FormCreate(Sender: TObject);
var
  i : Integer;
begin
  DefaultMonitor := dmDesktop;
  i := 1;

  Height := Screen.Monitors[i].Height;
  Top    := Screen.Monitors[i].Top;
  Left   := Screen.Monitors[i].Left;
  width  := Screen.Monitors[i].Width;
end;

end.
