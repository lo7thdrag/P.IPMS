unit ufrmGeneralScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, VrControls, VrButtons,
  VrAngularMeter, Vcl.ExtCtrls, Vcl.Imaging.pngimage, RzBmpBtn;

type
  TfrmGeneralScreen = class(TForm)
    pnlMain: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    VrTCSpeedA: TVrAngularMeter;
    pnlSafetiesStop: TPanel;
    btnPS_SS_EngineStopped: TVrDemoButton;
    btnPS_SS_SpeedSetting: TVrDemoButton;
    btnPS_SS_ClutcInterlocks: TVrDemoButton;
    btnPS_SS_StartingInterlocks: TVrDemoButton;
    VrDemoButton1: TVrDemoButton;
    VrDemoButton2: TVrDemoButton;
    VrDemoButton3: TVrDemoButton;
    pnlEngineController: TPanel;
    VrDemoButton4: TVrDemoButton;
    btnPS_SI_SlowTurningFailure: TVrDemoButton;
    VrDemoButton6: TVrDemoButton;
    btnPS_SI_StartingFailure: TVrDemoButton;
    VrDemoButton8: TVrDemoButton;
    VrDemoButton9: TVrDemoButton;
    pnlPT119: TPanel;
    pnlST116: TPanel;
    pnlST002: TPanel;
    pnlRPM: TPanel;
    pnlZT006: TPanel;
    pnlST117: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblEngineAirInletPressure: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lblTCSpeedA: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    lblEngineSpeed: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    lblDigitalSpeedSetPoint: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    lblFuelRack: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    lblTCSpeedB: TLabel;
    Label13: TLabel;
    VrEngineSpeed: TVrAngularMeter;
    VrFuelRack: TVrAngularMeter;
    VrTCSpeedB: TVrAngularMeter;
    VrDigitalSpeedSetPoint: TVrAngularMeter;
    Label24: TLabel;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    ImgBackground: TImage;
    VrEngineAirInletPressure: TVrAngularMeter;
    btnPrevious: TRzBmpButton;
    btnNext: TRzBmpButton;
    btnCurves: TRzBmpButton;
    btnMenu: TRzBmpButton;
    btnAlarms: TRzBmpButton;
    Image13: TImage;
    pnlTime: TPanel;
    lblTime: TLabel;
    Timer1: TTimer;
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
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
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
  frmGeneralScreen: TfrmGeneralScreen;

implementation

uses
  ufrmClutchingAssitance, ufrmMenu, ufrmAlarms, ufrmCurves;

{$R *.dfm}

procedure TfrmGeneralScreen.btnAlarmsClick(Sender: TObject);
begin
  frmAlarms.Show;
  Self.Hide;
end;

procedure TfrmGeneralScreen.btnCurvesClick(Sender: TObject);
begin
  frmCurves.Show;
  Self.Hide;
end;

procedure TfrmGeneralScreen.btnNextClick(Sender: TObject);
begin
  frmClutchingAssistance.Show;
  Self.Hide;
end;

procedure TfrmGeneralScreen.btnPreviousClick(Sender: TObject);
begin
  frmMenu.Show;
  Self.Hide;
end;

procedure TfrmGeneralScreen.FormCreate(Sender: TObject);
begin
  DoubleBuffered := True;
  pnlMain.DoubleBuffered := True;
  lblTime.Transparent := True;
  imgBackground.SendToBack;
  pnlTime.DoubleBuffered := True;
end;

procedure TfrmGeneralScreen.MenuClick(Sender: TObject);
begin
  frmMenu.Show;
  Self.Hide;
end;

procedure TfrmGeneralScreen.Timer1Timer(Sender: TObject);
begin
  lblTime.Caption := FormatDateTime('dd"/"mm"/"yyyy hh:nn:ss ampm', Now);
end;

end.
