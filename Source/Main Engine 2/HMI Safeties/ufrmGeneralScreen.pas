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
    VrAngularMeter1: TVrAngularMeter;
    pnlSafetiesStop: TPanel;
    btnPS_SS_EmergencyShutdown: TVrDemoButton;
    btnPS_SS_EngInletLubOilVeryHigh: TVrDemoButton;
    btnPS_SS_RedGearSafetyStop: TVrDemoButton;
    btnPS_SS_Overspeed: TVrDemoButton;
    VrDemoButton1: TVrDemoButton;
    VrDemoButton2: TVrDemoButton;
    VrDemoButton3: TVrDemoButton;
    pnlEngineController: TPanel;
    VrDemoButton4: TVrDemoButton;
    VrDemoButton5: TVrDemoButton;
    VrDemoButton6: TVrDemoButton;
    VrDemoButton7: TVrDemoButton;
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
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label13: TLabel;
    VrAngularMeter2: TVrAngularMeter;
    VrAngularMeter4: TVrAngularMeter;
    VrAngularMeter5: TVrAngularMeter;
    VrAngularMeter3: TVrAngularMeter;
    Label24: TLabel;
    lblTime: TLabel;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    ImgBackground: TImage;
    EngineAirInletPressure: TVrAngularMeter;
    btnPrevious: TRzBmpButton;
    btnNext: TRzBmpButton;
    btnCurves: TRzBmpButton;
    btnMenu: TRzBmpButton;
    btnAlarms: TRzBmpButton;
    Image13: TImage;
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
  frmGeneralScreen: TfrmGeneralScreen;

implementation

uses
  ufrmClutchingAssitance, ufrmMenu;

{$R *.dfm}

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
  lblTime.Caption := FormatDateTime('dd"/"mm"/"yyyy hh:nn:ss ampm', Now);
end;

procedure TfrmGeneralScreen.MenuClick(Sender: TObject);
begin
  frmMenu.Show;
  Self.Hide;
end;

end.
