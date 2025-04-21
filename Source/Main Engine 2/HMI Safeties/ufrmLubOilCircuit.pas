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
    EngineAirInletPressure: TVrAngularMeter;
    VrAngularMeter2: TVrAngularMeter;
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
    Label4: TLabel;
    Panel4: TPanel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Panel5: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Panel6: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    Panel7: TPanel;
    Label17: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Panel8: TPanel;
    Label21: TLabel;
    Label23: TLabel;
    Label13: TLabel;
    VrDemoButton9: TVrDemoButton;
    VrDemoButton10: TVrDemoButton;
    VrDemoButton2: TVrDemoButton;
    Label24: TLabel;
    lblTime: TLabel;
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
    VrAngularMeter4: TVrAngularMeter;
    VrAngularMeter3: TVrAngularMeter;
    VrAngularMeter5: TVrAngularMeter;
    VrAngularMeter1: TVrAngularMeter;
    Label6: TLabel;
    Label14: TLabel;
    Label18: TLabel;
    Label22: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnNextclick(Sender: TObject);
    procedure btnPreviousClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLubOilCircuit: TfrmLubOilCircuit;

implementation

uses
  ufrmFuelOilCircuit, ufrmPLCNetwork;
{$R *.dfm}

procedure TfrmLubOilCircuit.btnNextclick(Sender: TObject);
begin
  frmFuelOilCircuit.Show;
  Self.Hide;
end;

procedure TfrmLubOilCircuit.btnPreviousClick(Sender: TObject);
begin
  frmPLCNetwork.Show;
  Self.Hide;
end;

procedure TfrmLubOilCircuit.FormCreate(Sender: TObject);
begin
  lblTime.Caption := FormatDateTime('dd"/"mm"/"yyyy hh:nn:ss ampm', Now);
end;

end.
