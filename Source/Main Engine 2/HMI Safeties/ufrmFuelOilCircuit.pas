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
    VrAngularMeter3: TVrAngularMeter;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel2: TPanel;
    VrDemoButton4: TVrDemoButton;
    VrDemoButton5: TVrDemoButton;
    VrDemoButton7: TVrDemoButton;
    VrDemoButton1: TVrDemoButton;
    VrDemoButton2: TVrDemoButton;
    Label24: TLabel;
    lblTime: TLabel;
    ImgBackground: TImage;
    btnAlarms: TRzBmpButton;
    btnCurves: TRzBmpButton;
    btnMenu: TRzBmpButton;
    btnPrevious: TRzBmpButton;
    btnNext: TRzBmpButton;
    Image10: TImage;
    Image2: TImage;
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
  lblTime.Caption := FormatDateTime('dd"/"mm"/"yyyy hh:nn:ss ampm', Now);
end;

procedure TfrmFuelOilCircuit.MenuClick(Sender: TObject);
begin
  frmMenu.Show;
  Self.Hide;
end;

end.
