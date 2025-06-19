unit ufrmLubOilCircuit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, VrControls,
  VrButtons, VrAngularMeter, RzBmpBtn, Vcl.Imaging.pngimage;

type
  TfrmLubOilCircuit = class(TForm)
    pnlMain: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    VrEngineAirInletPressure: TVrAngularMeter;
    VrEngineInletLOTemp: TVrAngularMeter;
    pnlSafetiesStop: TPanel;
    btnPS_SS_EmergencyShutdown: TVrDemoButton;
    btnPS_SS_EngInletLubOilVeryHigh: TVrDemoButton;
    btnPS_SS_RedGearSafetyStop: TVrDemoButton;
    btnPS_SS_Overspeed: TVrDemoButton;
    VrDemoButton1: TVrDemoButton;
    Panel2: TPanel;
    VrDemoButton4: TVrDemoButton;
    VrDemoButton5: TVrDemoButton;
    VrDemoButton6: TVrDemoButton;
    VrDemoButton7: TVrDemoButton;
    VrDemoButton8: TVrDemoButton;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblEngineAirInletPressureLO: TLabel;
    Panel4: TPanel;
    Label5: TLabel;
    lblTCInletLubOilPress: TLabel;
    Label8: TLabel;
    Panel5: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    lblEngineInletLOTemp: TLabel;
    Label12: TLabel;
    Panel6: TPanel;
    lblLATCOutletLOTemp: TLabel;
    Label16: TLabel;
    Panel7: TPanel;
    Label17: TLabel;
    lblEngineInletLubOilTemp: TLabel;
    Label20: TLabel;
    Panel8: TPanel;
    Label21: TLabel;
    lblLBTCOutletLOTemp: TLabel;
    Label13: TLabel;
    VrDemoButton9: TVrDemoButton;
    VrDemoButton10: TVrDemoButton;
    VrDemoButton2: TVrDemoButton;
    Label24: TLabel;
    ImgBackground: TImage;
    btnAlarms: TRzBmpButton;
    btnCurves: TRzBmpButton;
    btnMenu: TRzBmpButton;
    btnPrevious: TRzBmpButton;
    btnNext: TRzBmpButton;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    Label25: TLabel;
    VrEngineInletLubOilTemp: TVrAngularMeter;
    VrLATCOutletLOTemp: TVrAngularMeter;
    VrLBTCOutletLOTemp: TVrAngularMeter;
    VrTCInletLubOilPress: TVrAngularMeter;
    Label6: TLabel;
    Label14: TLabel;
    Label18: TLabel;
    Label22: TLabel;
    Image13: TImage;
    pnlTime: TPanel;
    lblTime: TLabel;
    Timer1: TTimer;
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
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
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
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnNextclick(Sender: TObject);
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
  frmLubOilCircuit: TfrmLubOilCircuit;

implementation

uses
  ufrmFuelOilCircuit, ufrmCompressedAirCircuit, ufrmMenu, ufrmAlarms, ufrmCurves;
{$R *.dfm}

procedure TfrmLubOilCircuit.btnAlarmsClick(Sender: TObject);
begin
  frmAlarms.Show;
  Self.Hide;
end;

procedure TfrmLubOilCircuit.btnCurvesClick(Sender: TObject);
begin
  frmCurves.Show;
  Self.Hide;
end;

procedure TfrmLubOilCircuit.btnNextclick(Sender: TObject);
begin
  frmFuelOilCircuit.Show;
  Self.Hide;
end;

procedure TfrmLubOilCircuit.btnPreviousClick(Sender: TObject);
begin
  frmCompressedAirCircuit.Show;
  Self.Hide;
end;

procedure TfrmLubOilCircuit.FormCreate(Sender: TObject);
begin
  DoubleBuffered := True;
  pnlMain.DoubleBuffered := True;
  lblTime.Transparent := True;
  imgBackground.SendToBack;
  pnlTime.DoubleBuffered := True;
end;

procedure TfrmLubOilCircuit.MenuClick(Sender: TObject);
begin
  frmMenu.Show;
  Self.Hide;
end;

procedure TfrmLubOilCircuit.Timer1Timer(Sender: TObject);
begin
  lblTime.Caption := FormatDateTime('dd"/"mm"/"yyyy hh:nn:ss ampm', Now);
end;

end.
