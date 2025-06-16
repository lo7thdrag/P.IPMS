unit ufrmClutchingAssitance;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VrControls, VrButtons, Vcl.ExtCtrls,
  Vcl.StdCtrls, VrAngularMeter, Vcl.Imaging.pngimage, RzBmpBtn;


type
  TfrmClutchingAssistance = class(TForm)
    pnlMain: TPanel;
    pnlST002: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    lblEngineSpeedClutching: TLabel;
    Panel5: TPanel;
    Label9: TLabel;
    lblEngineInletLOClutching: TLabel;
    Label12: TLabel;
    Panel7: TPanel;
    Label17: TLabel;
    lblEngineOutletFWClutching: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image5: TImage;
    Panel2: TPanel;
    Label6: TLabel;
    lblPropellerPitchClutching: TLabel;
    Label8: TLabel;
    Image3: TImage;
    Panel4: TPanel;
    VrDemoButton8: TVrDemoButton;
    VrDemoButton1: TVrDemoButton;
    VrDemoButton2: TVrDemoButton;
    VrDemoButton3: TVrDemoButton;
    VrDemoButton4: TVrDemoButton;
    VrDemoButton5: TVrDemoButton;
    Label3: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    VrEngineSpeedClutching: TVrAngularMeter;
    VrEngineInletLOClutching: TVrAngularMeter;
    VrEngineOutletFWClutching: TVrAngularMeter;
    VrPropellerPitchClutching: TVrAngularMeter;
    Label24: TLabel;
    ImgBackground: TImage;
    Image4: TImage;
    Image6: TImage;
    Image8: TImage;
    Image7: TImage;
    btnPrevious: TRzBmpButton;
    btnNext: TRzBmpButton;
    btnAlarms: TRzBmpButton;
    btnCurves: TRzBmpButton;
    btnMenu: TRzBmpButton;
    Image9: TImage;
    pnlTime: TPanel;
    lblTime: TLabel;
    Timer1: TTimer;
    Label36: TLabel;
    Label35: TLabel;
    Label34: TLabel;
    Label33: TLabel;
    Label32: TLabel;
    Label31: TLabel;
    Label38: TLabel;
    Label5: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label37: TLabel;
    Label22: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label23: TLabel;
    Label25: TLabel;
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
    procedure FormCreate(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnPreviousClick(Sender: TObject);
    procedure MenuClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClutchingAssistance: TfrmClutchingAssistance;

implementation

uses
  ufrmPLCNetwork, ufrmGeneralScreen, ufrmMenu;

{$R *.dfm}

procedure TfrmClutchingAssistance.btnNextClick(Sender: TObject);
begin
  frmPLCNetwork.Show;
  Self.Hide;
end;

procedure TfrmClutchingAssistance.btnPreviousClick(Sender: TObject);
begin
  frmGeneralScreen.Show;
  Self.Hide;
end;

procedure TfrmClutchingAssistance.FormCreate(Sender: TObject);
begin
  DoubleBuffered := True;
  pnlMain.DoubleBuffered := True;
  lblTime.Transparent := True;
  imgBackground.SendToBack;
  pnlTime.DoubleBuffered := True;
end;

procedure TfrmClutchingAssistance.MenuClick(Sender: TObject);
begin
  frmMenu.Show;
  Self.Hide;
end;

procedure TfrmClutchingAssistance.Timer1Timer(Sender: TObject);
begin
  lblTime.Caption := FormatDateTime('dd"/"mm"/"yyyy hh:nn:ss ampm', Now);
end;

end.
