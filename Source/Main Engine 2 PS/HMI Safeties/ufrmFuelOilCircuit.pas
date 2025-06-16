unit ufrmFuelOilCircuit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, VrControls, VrButtons,
  VrAngularMeter, Vcl.ExtCtrls, RzBmpBtn, Vcl.Imaging.pngimage;

type
  TfrmFuelOilCircuit = class(TForm)
    pnlMain: TPanel;
    Image1: TImage;
    VrEngineInletFuelOilCircuit: TVrAngularMeter;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblEngineInletFuelOilCircuit: TLabel;
    Panel2: TPanel;
    VrDemoButton4: TVrDemoButton;
    VrDemoButton5: TVrDemoButton;
    VrDemoButton7: TVrDemoButton;
    VrDemoButton1: TVrDemoButton;
    VrDemoButton2: TVrDemoButton;
    Label24: TLabel;
    ImgBackground: TImage;
    btnAlarms: TRzBmpButton;
    btnCurves: TRzBmpButton;
    btnMenu: TRzBmpButton;
    btnPrevious: TRzBmpButton;
    btnNext: TRzBmpButton;
    Image10: TImage;
    Image2: TImage;
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
  frmFuelOilCircuit: TfrmFuelOilCircuit;

implementation

uses
  ufrmFWSeaWaterCircuit, ufrmLubOilCircuit, ufrmMenu;

{$R *.dfm}

procedure TfrmFuelOilCircuit.btnNextClick(Sender: TObject);
begin
  frmFWSeaWaterCircuit.Show;
  Self.Hide;
end;

procedure TfrmFuelOilCircuit.btnPreviousClick(Sender: TObject);
begin
  frmLubOilCircuit.Show;
  Self.Hide;
end;

procedure TfrmFuelOilCircuit.FormCreate(Sender: TObject);
begin
  DoubleBuffered := True;
  pnlMain.DoubleBuffered := True;
  lblTime.Transparent := True;
  imgBackground.SendToBack;
  pnlTime.DoubleBuffered := True;
end;

procedure TfrmFuelOilCircuit.MenuClick(Sender: TObject);
begin
  frmMenu.Show;
  Self.Hide;
end;

procedure TfrmFuelOilCircuit.Timer1Timer(Sender: TObject);
begin
  lblTime.Caption := FormatDateTime('dd"/"mm"/"yyyy hh:nn:ss ampm', Now);
end;

end.
