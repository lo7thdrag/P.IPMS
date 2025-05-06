unit ufrmSetofPressureGaugesME2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, VrControls,
  VrAngularMeter, Vcl.ExtCtrls, RzBmpBtn;

type
  TfrmSetofPressureGaugesME2 = class(TForm)
    pnlMain: TPanel;
    imgGaugesME2: TImage;
    EngineInletFWPressureMeter: TVrAngularMeter;
    Label4: TLabel;
    EngineInletAirPressureMeter: TVrAngularMeter;
    Label5: TLabel;
    Label13: TLabel;
    btnAlarm: TRzBmpButton;
    imgFlashLighting: TRzBmpButton;
    procedure MenuClick(Sender: TObject);
    procedure AlarmFlashLightingClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetofPressureGaugesME2: TfrmSetofPressureGaugesME2;

implementation

uses
  ufrmMenu, ufrmSignalingLightME2, uMainEngine2System;

{$R *.dfm}

procedure TfrmSetofPressureGaugesME2.AlarmFlashLightingClick(Sender: TObject);
begin
  imgFlashLighting.Visible := True;
end;

procedure TfrmSetofPressureGaugesME2.FormShow(Sender: TObject);
begin
   DefaultMonitor := dmDesktop;

  if Screen.MonitorCount > 1 then
  begin
    Height := Screen.Monitors[MainEngine2System.IdScreenGauges].Height;
    Top    := Screen.Monitors[MainEngine2System.IdScreenGauges].Top;
    Left   := Screen.Monitors[MainEngine2System.IdScreenGauges].Left;
    width  := Screen.Monitors[MainEngine2System.IdScreenGauges].Width;
  end
  else
  begin
    Height := Screen.Height;
    Width := Screen.Width;
    Left := 0;
    Top := 0;
  end;
end;

procedure TfrmSetofPressureGaugesME2.MenuClick(Sender: TObject);
begin
  frmMenu.Show;
  Self.Hide;
end;

end.
