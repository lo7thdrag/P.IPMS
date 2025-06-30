unit ufrmAirGasCircuit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, VrControls,
  VrAngularMeter, VrButtons, Vcl.StdCtrls, RzBmpBtn, Vcl.Imaging.pngimage;

type
  TfrmAirGasCircuit = class(TForm)
    pnlMain: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Panel5: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    lblTurboCharge2: TLabel;
    Label12: TLabel;
    Panel6: TPanel;
    lblTurboCharge1: TLabel;
    Label14: TLabel;
    Panel7: TPanel;
    Label17: TLabel;
    lblEngineAirInletPressure: TLabel;
    Label13: TLabel;
    Label18: TLabel;
    Panel4: TPanel;
    Label5: TLabel;
    lblEngineAirInletTemperature: TLabel;
    Label8: TLabel;
    Label6: TLabel;
    Panel2: TPanel;
    lblAirValveClosed: TVrDemoButton;
    lblGazValveClosed: TVrDemoButton;
    lblByPassClosed: TVrDemoButton;
    lbl1TCRunning: TVrDemoButton;
    lblSTCInAutoMode: TVrDemoButton;
    lblSTCAlarm: TVrDemoButton;
    lblSTCFailure: TVrDemoButton;
    Label1: TLabel;
    Label2: TLabel;
    VrTurboChargerA: TVrAngularMeter;
    VrEngineAirInletPressure: TVrAngularMeter;
    VrEngineAirInletTemperature: TVrAngularMeter;
    VrTurboChargerB: TVrAngularMeter;
    Label24: TLabel;
    ImgBackground: TImage;
    btnAlarms: TRzBmpButton;
    btnCurves: TRzBmpButton;
    btnMenu: TRzBmpButton;
    btnPrevious: TRzBmpButton;
    btnNext: TRzBmpButton;
    Image10: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    pnlTime: TPanel;
    lblTime: TLabel;
    Timer1: TTimer;
    Label3: TLabel;
    Label4: TLabel;
    Label11: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnPreviousClick(Sender: TObject);
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
  frmAirGasCircuit: TfrmAirGasCircuit;

implementation

uses
  ufrmEngineBearingTemperature, ufrmFWSeaWaterCircuit, ufrmMenu, ufrmAlarms, ufrmCurves;

{$R *.dfm}

procedure TfrmAirGasCircuit.btnAlarmsClick(Sender: TObject);
begin
  frmAlarms.Show;
  Self.Hide;
end;

procedure TfrmAirGasCircuit.btnCurvesClick(Sender: TObject);
begin
  frmCurves.Show;
  Self.Hide;
end;

procedure TfrmAirGasCircuit.btnNextClick(Sender: TObject);
begin
  frmEngineBearingTemperature.Show;
  Self.Hide;
end;

procedure TfrmAirGasCircuit.btnPreviousClick(Sender: TObject);
begin
  frmFWSeaWaterCircuit.Show;
  Self.Hide;
end;

procedure TfrmAirGasCircuit.FormCreate(Sender: TObject);
begin
  DoubleBuffered := True;
  pnlMain.DoubleBuffered := True;
  lblTime.Transparent := True;
  imgBackground.SendToBack;
  pnlTime.DoubleBuffered := True;
end;

procedure TfrmAirGasCircuit.MenuClick(Sender: TObject);
begin
  frmMenu.Show;
  Self.Hide;
end;

procedure TfrmAirGasCircuit.Timer1Timer(Sender: TObject);
begin
  lblTime.Caption := FormatDateTime('dd"/"mm"/"yyyy hh:nn:ss ampm', Now);
end;

end.
