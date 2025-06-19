unit ufrmPCOTValueHistory;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, RzBmpBtn,
  Vcl.Imaging.pngimage;

type
  TfrmPCOTValueHistory = class(TForm)
    pnlMain: TPanel;
    ImgBackground: TImage;
    btnAlarms: TRzBmpButton;
    Image13: TImage;
    Label24: TLabel;
    btnCurves: TRzBmpButton;
    btnMenu: TRzBmpButton;
    pnlTime: TPanel;
    lblTime: TLabel;
    Timer1: TTimer;
    btnUp: TRzBmpButton;
    btnDown: TRzBmpButton;
    lblA1PCOT: TLabel;
    lblA2PCOT: TLabel;
    lblA3PCOT: TLabel;
    lblA4PCOT: TLabel;
    lblA5PCOT: TLabel;
    lblA6PCOT: TLabel;
    lblA7PCOT: TLabel;
    lblA8PCOT: TLabel;
    lblA9PCOT: TLabel;
    lblA10PCOT: TLabel;
    lblTOil: TLabel;
    lblSpeed: TLabel;
    lblIndex: TLabel;
    Image1: TImage;
    procedure Timer1Timer(Sender: TObject);
    procedure btnAlarmsClick(Sender: TObject);
    procedure btnMenuClick(Sender: TObject);
    procedure btnCurvesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPCOTValueHistory: TfrmPCOTValueHistory;

implementation

uses
  ufrmMenu, ufrmAlarms, ufrmCurves;
{$R *.dfm}

procedure TfrmPCOTValueHistory.btnAlarmsClick(Sender: TObject);
begin
  frmAlarms.Show;
  Self.Hide;
end;

procedure TfrmPCOTValueHistory.btnCurvesClick(Sender: TObject);
begin
  frmCurves.Show;
  Self.Hide;
end;

procedure TfrmPCOTValueHistory.btnMenuClick(Sender: TObject);
begin
  frmMenu.Show;
  Self.Hide;
end;

procedure TfrmPCOTValueHistory.Timer1Timer(Sender: TObject);
begin
  lblTime.Caption := FormatDateTime('dd"/"mm"/"yyyy hh:nn:ss ampm', Now);
end;

end.
