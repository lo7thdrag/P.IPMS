unit ufrmSetofPressureGaugesME1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, VrControls,
  VrAngularMeter, Vcl.Imaging.jpeg;

type
  TfrmSetofPressureGaugesME1 = class(TForm)
    pnlMain: TPanel;
    imgGaugesME1: TImage;
    StartingAirPressureMeter: TVrAngularMeter;
    Label1: TLabel;
    EngineInletLubOilPressureMeter: TVrAngularMeter;
    Label2: TLabel;
    FuelOilPressureMeter: TVrAngularMeter;
    Label3: TLabel;
    Label19: TLabel;
    procedure NextClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetofPressureGaugesME1: TfrmSetofPressureGaugesME1;

implementation

uses
  ufrmSignalingLightME1, uMainEngine1System;

{$R *.dfm}

procedure TfrmSetofPressureGaugesME1.FormShow(Sender: TObject);
begin
  DefaultMonitor := dmDesktop;

  if Screen.MonitorCount > 1 then
  begin
    Height := Screen.Monitors[MainEngine1System.IdScreenGauges].Height;
    Top    := Screen.Monitors[MainEngine1System.IdScreenGauges].Top;
    Left   := Screen.Monitors[MainEngine1System.IdScreenGauges].Left;
    width  := Screen.Monitors[MainEngine1System.IdScreenGauges].Width;
  end
  else
  begin
    Height := Screen.Height;
    Width := Screen.Width;
    Left := 0;
    Top := 0;
  end;
end;

procedure TfrmSetofPressureGaugesME1.NextClick(Sender: TObject);
begin
  frmSignalingLightME1.Show;
  Self.Hide;
end;

end.
