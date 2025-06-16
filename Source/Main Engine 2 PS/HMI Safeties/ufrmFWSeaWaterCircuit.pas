unit ufrmFWSeaWaterCircuit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VrControls, VrAngularMeter,
  Vcl.StdCtrls, Vcl.ExtCtrls, VrButtons, Vcl.Imaging.pngimage, RzBmpBtn;

type
  TfrmFWSeaWaterCircuit = class(TForm)
    pnlMain: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblEngineInletFWTemp: TLabel;
    Panel4: TPanel;
    Label5: TLabel;
    Label7: TLabel;
    Panel5: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    lblEngineInletFWPressSeaWater: TLabel;
    Panel6: TPanel;
    lblEngineOutletSeaWaterPress: TLabel;
    Panel7: TPanel;
    Label17: TLabel;
    Label19: TLabel;
    VrEngineInletFWTemp: TVrAngularMeter;
    VrEngineInletFWPressSeaWater: TVrAngularMeter;
    VrEngineOutletSeaWaterPress: TVrAngularMeter;
    VrAngularMeter5: TVrAngularMeter;
    Label12: TLabel;
    Label13: TLabel;
    Label18: TLabel;
    Label14: TLabel;
    Label20: TLabel;
    Label16: TLabel;
    Label8: TLabel;
    Label6: TLabel;
    Panel2: TPanel;
    VrDemoButton4: TVrDemoButton;
    VrDemoButton5: TVrDemoButton;
    VrDemoButton7: TVrDemoButton;
    VrDemoButton8: TVrDemoButton;
    VrDemoButton9: TVrDemoButton;
    Panel8: TPanel;
    VrDemoButton1: TVrDemoButton;
    VrDemoButton3: TVrDemoButton;
    Label21: TLabel;
    Label24: TLabel;
    ImgBackground: TImage;
    VrAngularMeter2: TVrAngularMeter;
    Image7: TImage;
    Image6: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    btnAlarms: TRzBmpButton;
    btnCurves: TRzBmpButton;
    btnMenu: TRzBmpButton;
    btnPrevious: TRzBmpButton;
    btnNext: TRzBmpButton;
    lblValveControlSignal: TLabel;
    Image11: TImage;
    Timer1: TTimer;
    pnlTime: TPanel;
    lblTime: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
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
  frmFWSeaWaterCircuit: TfrmFWSeaWaterCircuit;

implementation

uses
  ufrmAirGasCircuit, ufrmFuelOilCircuit, ufrmMenu;
{$R *.dfm}

procedure TfrmFWSeaWaterCircuit.btnNextClick(Sender: TObject);
begin
  frmAirGasCircuit.Show;
  Self.Hide;
end;

procedure TfrmFWSeaWaterCircuit.btnPreviousClick(Sender: TObject);
begin
  frmFuelOilCircuit.Show;
  Self.Hide;
end;

procedure TfrmFWSeaWaterCircuit.FormCreate(Sender: TObject);
begin
  DoubleBuffered := True;
  pnlMain.DoubleBuffered := True;
  lblTime.Transparent := True;
  imgBackground.SendToBack;
  pnlTime.DoubleBuffered := True;
end;

procedure TfrmFWSeaWaterCircuit.MenuClick(Sender: TObject);
begin
  frmMenu.Show;
  Self.Hide;
end;

procedure TfrmFWSeaWaterCircuit.Timer1Timer(Sender: TObject);
begin
  lblTime.Caption := FormatDateTime('dd"/"mm"/"yyyy hh:nn:ss ampm', Now);
end;

end.
