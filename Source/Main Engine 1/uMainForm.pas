unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TfrmMainForm = class(TForm)
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMainForm: TfrmMainForm;

implementation

uses
  ufrmSetofPressureGaugesME1, ufrmSignalingLightME1, ufrmPMSDieselEngineSafetiesME1, uMainEngine1System;

{$R *.dfm}

procedure TfrmMainForm.FormShow(Sender: TObject);
begin
  if Screen.MonitorCount > MainEngine1System.IdScreenSignaling then
  begin
    with frmSignalingLightME1 do
    begin
      Left   := Screen.Monitors[MainEngine1System.IdScreenSignaling].Left;
      Top    := Screen.Monitors[MainEngine1System.IdScreenSignaling].Top;
      Width  := Screen.Monitors[MainEngine1System.IdScreenSignaling].Width;
      Height := Screen.Monitors[MainEngine1System.IdScreenSignaling].Height;
      Show;
    end;
  end;

  if Screen.MonitorCount > MainEngine1System.IdScreenGauges then
  begin
    with frmSetofPressureGaugesME1 do
    begin
      Left   := Screen.Monitors[MainEngine1System.IdScreenGauges].Left;
      Top    := Screen.Monitors[MainEngine1System.IdScreenGauges].Top;
      Width  := Screen.Monitors[MainEngine1System.IdScreenGauges].Width;
      Height := Screen.Monitors[MainEngine1System.IdScreenGauges].Height;
      Show;
    end;
  end;

  if Screen.MonitorCount > MainEngine1System.IdScreenPmsHmi then
  begin
    with frmPMSDieselEngineSafetiesME1 do
    begin
      Left   := Screen.Monitors[MainEngine1System.IdScreenPmsHmi].Left;
      Top    := Screen.Monitors[MainEngine1System.IdScreenPmsHmi].Top;
      Width  := Screen.Monitors[MainEngine1System.IdScreenPmsHmi].Width;
      Height := Screen.Monitors[MainEngine1System.IdScreenPmsHmi].Height;
      Show;
    end;
  end;
end;

end.
