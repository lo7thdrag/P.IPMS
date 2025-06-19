unit ufrmCurves;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, RzBmpBtn,
  Vcl.Imaging.pngimage;

type
  TfrmCurves = class(TForm)
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
    procedure Timer1Timer(Sender: TObject);
    procedure btnMenuClick(Sender: TObject);
    procedure btnAlarmsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCurves: TfrmCurves;

implementation

uses
  ufrmMenu, ufrmAlarms;
{$R *.dfm}

procedure TfrmCurves.btnAlarmsClick(Sender: TObject);
begin
  frmAlarms.Show;
  Self.Hide;
end;

procedure TfrmCurves.btnMenuClick(Sender: TObject);
begin
  frmMenu.Show;
  Self.Hide;
end;

procedure TfrmCurves.Timer1Timer(Sender: TObject);
begin
  lblTime.Caption := FormatDateTime('dd"/"mm"/"yyyy hh:nn:ss ampm', Now);
end;

end.
