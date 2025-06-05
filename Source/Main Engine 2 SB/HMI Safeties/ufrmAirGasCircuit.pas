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
    Label19: TLabel;
    Label13: TLabel;
    Label18: TLabel;
    Panel4: TPanel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label6: TLabel;
    Panel2: TPanel;
    VrDemoButton8: TVrDemoButton;
    VrDemoButton1: TVrDemoButton;
    VrDemoButton2: TVrDemoButton;
    VrDemoButton3: TVrDemoButton;
    VrDemoButton4: TVrDemoButton;
    VrDemoButton5: TVrDemoButton;
    VrDemoButton6: TVrDemoButton;
    Label1: TLabel;
    Label2: TLabel;
    VrAngularMeter1: TVrAngularMeter;
    VrAngularMeter3: TVrAngularMeter;
    VrAngularMeter4: TVrAngularMeter;
    VrAngularMeter2: TVrAngularMeter;
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
  frmAirGasCircuit: TfrmAirGasCircuit;

implementation

uses
  ufrmEngineBearingTemperature, ufrmFWSeaWaterCircuit, ufrmMenu;

{$R *.dfm}

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
