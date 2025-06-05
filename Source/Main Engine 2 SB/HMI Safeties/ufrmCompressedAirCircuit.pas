unit ufrmCompressedAirCircuit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, VrControls, VrButtons,
  Vcl.StdCtrls, VrAngularMeter, Vcl.Imaging.pngimage, RzBmpBtn;

type
  TfrmCompressedAirCircuit = class(TForm)
    pnlMain: TPanel;
    Image1: TImage;
    Image3: TImage;
    Image4: TImage;
    EngineAirInletPressure: TVrAngularMeter;
    VrAngularMeter4: TVrAngularMeter;
    VrAngularMeter3: TVrAngularMeter;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel5: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Panel6: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Panel2: TPanel;
    VrDemoButton4: TVrDemoButton;
    VrDemoButton5: TVrDemoButton;
    VrDemoButton7: TVrDemoButton;
    Label8: TLabel;
    btnPrevious: TRzBmpButton;
    btnNext: TRzBmpButton;
    btnAlarms: TRzBmpButton;
    btnCurves: TRzBmpButton;
    btnMenu: TRzBmpButton;
    ImgBackground: TImage;
    Image7: TImage;
    Image2: TImage;
    Image5: TImage;
    Image6: TImage;
    pnlTime: TPanel;
    lblTime: TLabel;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure btnPreviousClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure MenuClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCompressedAirCircuit: TfrmCompressedAirCircuit;

implementation

uses
  ufrmMenu, ufrmSafetiesStop;
{$R *.dfm}

procedure TfrmCompressedAirCircuit.btnNextClick(Sender: TObject);
begin
  frmMenu.Show;
  Self.Hide;
end;

procedure TfrmCompressedAirCircuit.btnPreviousClick(Sender: TObject);
begin
  frmSafetiesStop.Show;
  Self.Hide;
end;

procedure TfrmCompressedAirCircuit.FormCreate(Sender: TObject);
begin
  DoubleBuffered := True;
  pnlMain.DoubleBuffered := True;
  lblTime.Transparent := True;
  imgBackground.SendToBack;
  pnlTime.DoubleBuffered := True;
end;

procedure TfrmCompressedAirCircuit.MenuClick(Sender: TObject);
begin
  frmMenu.Show;
  Self.Hide;
end;

procedure TfrmCompressedAirCircuit.Timer1Timer(Sender: TObject);
begin
  lblTime.Caption := FormatDateTime('dd"/"mm"/"yyyy hh:nn:ss ampm', Now);
end;

end.
