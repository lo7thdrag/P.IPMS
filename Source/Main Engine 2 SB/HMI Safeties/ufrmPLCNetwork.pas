unit ufrmPLCNetwork;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, RzBmpBtn;

type
  TfrmPLCNetwork = class(TForm)
    pnlMain: TPanel;
    Label24: TLabel;
    btnPrevious: TRzBmpButton;
    btnNext: TRzBmpButton;
    btnAlarms: TRzBmpButton;
    btnCurves: TRzBmpButton;
    btnMenu: TRzBmpButton;
    ImgBackground: TImage;
    btnRuntimeNext: TRzBmpButton;
    imgPLCNetwork: TImage;
    imgOperatorPanel: TImage;
    imgEngineController: TImage;
    Image1: TImage;
    pnlTime: TPanel;
    lblTime: TLabel;
    Timer1: TTimer;
    procedure btnNextClick(Sender: TObject);
    procedure btnPreviousClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MenuClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnAlarmsClick(Sender: TObject);
    procedure btnCurvesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPLCNetwork: TfrmPLCNetwork;

implementation

uses
  ufrmLubOilCircuit, ufrmSafetiesStop, ufrmMenu, ufrmAlarms, ufrmCurves;
{$R *.dfm}

procedure TfrmPLCNetwork.btnAlarmsClick(Sender: TObject);
begin
  frmAlarms.Show;
  Self.Hide;
end;

procedure TfrmPLCNetwork.btnCurvesClick(Sender: TObject);
begin
  frmCurves.Show;
  Self.Hide;
end;

procedure TfrmPLCNetwork.btnNextClick(Sender: TObject);
begin
  frmMenu.Show;
  Self.Hide;
end;

procedure TfrmPLCNetwork.btnPreviousClick(Sender: TObject);
begin
  frmSafetiesStop.Show;
  Self.Hide;
end;

procedure TfrmPLCNetwork.FormCreate(Sender: TObject);
begin
  DoubleBuffered := True;
  pnlMain.DoubleBuffered := True;
  lblTime.Transparent := True;
  imgBackground.SendToBack;
  pnlTime.DoubleBuffered := True;
end;

procedure TfrmPLCNetwork.MenuClick(Sender: TObject);
begin
  frmMenu.Show;
  Self.Hide;
end;

procedure TfrmPLCNetwork.Timer1Timer(Sender: TObject);
begin
  lblTime.Caption := FormatDateTime('dd"/"mm"/"yyyy hh:nn:ss ampm', Now);
end;

end.
