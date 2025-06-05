unit ufrmSafetiesStop;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, VrControls, VrButtons,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, RzBmpBtn,

  uListener, uFreezeFrom, uDataType;

type
  TfrmSafetiesStop = class(TForm)
    Label4: TLabel;
    Panel2: TPanel;
    VrDemoButton7: TVrDemoButton;
    VrDemoButton8: TVrDemoButton;
    btnPS_SI_TurningGearDisengaged: TVrDemoButton;
    btnPS_SI_ManHandleAtStop: TVrDemoButton;
    VrDemoButton11: TVrDemoButton;
    VrDemoButton12: TVrDemoButton;
    VrDemoButton13: TVrDemoButton;
    btnPS_SI_FuelRackAtStop: TVrDemoButton;
    VrDemoButton15: TVrDemoButton;
    VrDemoButton16: TVrDemoButton;
    btnPS_SI_PrelubeInProgress: TVrDemoButton;
    btnPS_SI_PrelubeFailure: TVrDemoButton;
    btnPS_SI_StartingFailure: TVrDemoButton;
    btnPS_SI_STCSequenceFail: TVrDemoButton;
    btnPS_SI_SlowTurningFailure: TVrDemoButton;
    btnPS_SI_SafetyStop: TVrDemoButton;
    pnlSafetiesOverbidden: TPanel;
    Label2: TLabel;
    btnPS_SS_FwHtExpTkLevelVeryLow: TVrDemoButton;
    btnPS_SS_FwTempVeryHigh: TVrDemoButton;
    btnPS_SS_ConRodBearTempVeryHigh: TVrDemoButton;
    btnPS_SS_EngInletLubOilVeryHighTemperature: TVrDemoButton;
    btnPS_SS_OilMistDetHigh: TVrDemoButton;
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
    pnlTime: TPanel;
    lblTime: TLabel;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnPreviousClick(Sender: TObject);
    procedure MenuClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  frmSafetiesStop: TfrmSafetiesStop;

implementation

uses
  ufrmCompressedAirCircuit, ufrmLineBExhaustGasTemperature, ufrmMenu, uMainEngine2System;

{$R *.dfm}

procedure TfrmSafetiesStop.FormCreate(Sender: TObject);
begin
  DoubleBuffered := True;
  pnlMain.DoubleBuffered := True;
  lblTime.Transparent := True;
  imgBackground.SendToBack;
  pnlTime.DoubleBuffered := True;
end;

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

procedure TfrmSafetiesStop.MenuClick(Sender: TObject);
begin
  frmMenu.Show;
  Self.Hide;
end;

procedure TfrmSafetiesStop.Timer1Timer(Sender: TObject);
begin
  lblTime.Caption := FormatDateTime('dd"/"mm"/"yyyy hh:nn:ss ampm', Now);
end;

end.
