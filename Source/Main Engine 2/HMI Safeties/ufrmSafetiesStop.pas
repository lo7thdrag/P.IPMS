unit ufrmSafetiesStop;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, VrControls, VrButtons,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, RzBmpBtn;

type
  TfrmSafetiesStop = class(TForm)
    Label4: TLabel;
    lblTime: TLabel;
    Panel2: TPanel;
    VrDemoButton7: TVrDemoButton;
    VrDemoButton8: TVrDemoButton;
    VrDemoButton9: TVrDemoButton;
    VrDemoButton10: TVrDemoButton;
    VrDemoButton11: TVrDemoButton;
    VrDemoButton12: TVrDemoButton;
    VrDemoButton13: TVrDemoButton;
    VrDemoButton14: TVrDemoButton;
    VrDemoButton15: TVrDemoButton;
    VrDemoButton16: TVrDemoButton;
    VrDemoButton17: TVrDemoButton;
    VrDemoButton18: TVrDemoButton;
    VrDemoButton19: TVrDemoButton;
    VrDemoButton20: TVrDemoButton;
    VrDemoButton21: TVrDemoButton;
    VrDemoButton22: TVrDemoButton;
    pnlSafetiesOverbidden: TPanel;
    Label2: TLabel;
    VrDemoButton1: TVrDemoButton;
    VrDemoButton2: TVrDemoButton;
    VrDemoButton3: TVrDemoButton;
    VrDemoButton4: TVrDemoButton;
    VrDemoButton5: TVrDemoButton;
    VrDemoButton6: TVrDemoButton;
    pnlSafetiesStop: TPanel;
    btnPS_SS_EmergencyShutdown: TVrDemoButton;
    btnPS_SS_EngInletLubOilVeryHigh: TVrDemoButton;
    btnPS_SS_RedGearSafetyStop: TVrDemoButton;
    btnPS_SS_Overspeed: TVrDemoButton;
    pnlMain: TPanel;
    btnAlarms: TRzBmpButton;
    btnCurves: TRzBmpButton;
    btnMenu: TRzBmpButton;
    btnPrevious: TRzBmpButton;
    btnNext: TRzBmpButton;
    ImgBackground: TImage;
    VrDemoButton23: TVrDemoButton;
    VrDemoButton24: TVrDemoButton;
    Label1: TLabel;
    lblSpeedSVAE: TLabel;
    Image1: TImage;
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
  frmSafetiesStop: TfrmSafetiesStop;

implementation

uses
  ufrmCompressedAirCircuit, ufrmLineBExhaustGasTemperature, ufrmMenu;

{$R *.dfm}

procedure TfrmSafetiesStop.btnNextClick(Sender: TObject);
begin
  frmCompressedAirCircuit.Show;
  Self.Hide;
end;

procedure TfrmSafetiesStop.btnPreviousClick(Sender: TObject);
begin
  frmLineBExhaustGasTemperature.Show;
  Self.Hide;
end;

procedure TfrmSafetiesStop.FormCreate(Sender: TObject);
begin
  lblTime.Caption := FormatDateTime('dd"/"mm"/"yyyy hh:nn:ss ampm', Now);
end;

procedure TfrmSafetiesStop.MenuClick(Sender: TObject);
begin
  frmMenu.Show;
  Self.Hide;
end;

end.
