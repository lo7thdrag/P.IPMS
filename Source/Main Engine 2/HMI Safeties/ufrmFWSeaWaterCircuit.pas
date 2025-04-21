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
    Label4: TLabel;
    Panel4: TPanel;
    Label5: TLabel;
    Label7: TLabel;
    Panel5: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Panel6: TPanel;
    Label15: TLabel;
    Panel7: TPanel;
    Label17: TLabel;
    Label19: TLabel;
    VrAngularMeter3: TVrAngularMeter;
    VrAngularMeter1: TVrAngularMeter;
    VrAngularMeter4: TVrAngularMeter;
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
    lblTime: TLabel;
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
    procedure FormCreate(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnPreviousClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFWSeaWaterCircuit: TfrmFWSeaWaterCircuit;

implementation

uses
  ufrmAirGasCircuit, ufrmFuelOilCircuit;
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
  lblTime.Caption := FormatDateTime('dd"/"mm"/"yyyy hh:nn:ss ampm', Now);
end;

end.
