unit ufrmMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, RzBmpBtn;

type
  TfrmMenu = class(TForm)
    pnlMain: TPanel;
    Label24: TLabel;
    lblTime: TLabel;
    pnlCompressedAir: TPanel;
    pnlFreshandSeaWater: TPanel;
    pnlCrackpinOil: TPanel;
    pnlPLCNetwork: TPanel;
    pnlLuboil: TPanel;
    pnlAirandGas: TPanel;
    pnlExhaustGasTemperature: TPanel;
    pnlSafetiesStop: TPanel;
    pnlFuelOilCircuit: TPanel;
    pnlEngineBearingsTemperature: TPanel;
    pnlClutchingAssistance: TPanel;
    pnlGeneralScreen: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    ImgBackground: TImage;
    btnAlarms: TRzBmpButton;
    btnCurves: TRzBmpButton;
    btnMenu: TRzBmpButton;
    btnPCOTValuesHistory: TRzBmpButton;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    Image13: TImage;
    Timer1: TTimer;
    pnlTime: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure CompressedAirCircuitClick(Sender: TObject);
    procedure FreshandSeaWaterCircuitClick(Sender: TObject);
    procedure CrankpinOilTemperatureClick(Sender: TObject);
    procedure PLCNetworkClick(Sender: TObject);
    procedure SafetiesStopandStartingInterlocksClick(Sender: TObject);
    procedure ExhaustGasTemperatureClick(Sender: TObject);
    procedure AirandGasCircuitClick(Sender: TObject);
    procedure LubOilCircuitClick(Sender: TObject);
    procedure FuelOilCircuitClick(Sender: TObject);
    procedure EngineBearingsTemperatureClick(Sender: TObject);
    procedure ClutchingAssistanceClick(Sender: TObject);
    procedure GeneralScreenClick(Sender: TObject);
    procedure GaugesClick(Sender: TObject);
    procedure SignalingClick(Sender: TObject);
    procedure MenuClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnAlarmsClick(Sender: TObject);
    procedure btnCurvesClick(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;

implementation

uses
  ufrmGeneralScreen, ufrmClutchingAssitance, ufrmPLCNetwork, ufrmLubOilCircuit, ufrmFuelOilCircuit, ufrmFWSeaWaterCircuit,
  ufrmAirGasCircuit, ufrmEngineBearingTemperature, ufrmCrankinOilTemperature, ufrmPCOTFilteringDeviations, ufrmLineAExhaustGasTemperature,
  ufrmLineBExhaustGasTemperature, ufrmSafetiesStop, ufrmCompressedAirCircuit, ufrmSetofPressureGaugesME2, ufrmSignalingLightME2,
  ufrmAlarms, uMainEngine2System;

{$R *.dfm}

procedure TfrmMenu.FormCreate(Sender: TObject);
begin
  DoubleBuffered := True;
  pnlMain.DoubleBuffered := True;
  lblTime.Transparent := True;
  imgBackground.SendToBack;
  pnlTime.DoubleBuffered := True;
end;

procedure TfrmMenu.Timer1Timer(Sender: TObject);
begin
  lblTime.Caption := FormatDateTime('dd"/"mm"/"yyyy hh:nn:ss ampm', Now);
end;

procedure TfrmMenu.AirandGasCircuitClick(Sender: TObject);
begin
  frmAirGasCircuit.Show;
  Self.Hide;
end;

procedure TfrmMenu.btnAlarmsClick(Sender: TObject);
begin
  frmAlarms.Show;
  Self.Hide;
end;

procedure TfrmMenu.btnCurvesClick(Sender: TObject);
begin
  frmAlarms.Show;
  Self.Hide;
end;

procedure TfrmMenu.ClutchingAssistanceClick(Sender: TObject);
begin
  frmClutchingAssistance.Show;
  Self.Hide;
end;

procedure TfrmMenu.CompressedAirCircuitClick(Sender: TObject);
begin
  frmCompressedAirCircuit.Show;
  Self.Hide;
end;

procedure TfrmMenu.CrankpinOilTemperatureClick(Sender: TObject);
begin
  frmCrankpinOilTemperature.Show;
  Self.Hide;
end;

procedure TfrmMenu.EngineBearingsTemperatureClick(Sender: TObject);
begin
  frmEngineBearingTemperature.Show;
  Self.Hide;
end;

procedure TfrmMenu.ExhaustGasTemperatureClick(Sender: TObject);
begin
  frmLineAExhaustGasTemperature.Show;
  Self.Hide;
end;

procedure TfrmMenu.FreshandSeaWaterCircuitClick(Sender: TObject);
begin
 frmFWSeaWaterCircuit.Show;
 Self.Hide;
end;

procedure TfrmMenu.FuelOilCircuitClick(Sender: TObject);
begin
  frmFuelOilCircuit.Show;
  Self.Hide;
end;

procedure TfrmMenu.GaugesClick(Sender: TObject);
begin
  frmSetofPressureGaugesME2.Show;
  Self.Hide;
end;

procedure TfrmMenu.GeneralScreenClick(Sender: TObject);
begin
  frmGeneralScreen.Show;
  Self.Hide;
end;

procedure TfrmMenu.LubOilCircuitClick(Sender: TObject);
begin
  frmLubOilCircuit.Show;
  Self.Hide;
end;

procedure TfrmMenu.MenuClick(Sender: TObject);
begin
  frmMenu.Show;
  Self.Hide;
end;

procedure TfrmMenu.PLCNetworkClick(Sender: TObject);
begin
  frmPLCNetwork.Show;
  Self.Hide;
end;

procedure TfrmMenu.SafetiesStopandStartingInterlocksClick(Sender: TObject);
begin
  frmSafetiesStop.Show;
  Self.Hide;
end;

procedure TfrmMenu.SignalingClick(Sender: TObject);
begin
  frmSignalingLightME2.Show;
  Self.Hide;
end;


end.
