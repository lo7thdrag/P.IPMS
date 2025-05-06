unit ufrmSignalingLightME2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VrControls, VrRotarySwitch,
  Vcl.StdCtrls, Vcl.ExtCtrls,

  uDataType;

type
  TfrmSignalingLightME2 = class(TForm)
    pnlMain: TPanel;
    grpRemote: TGroupBox;
    lbl1: TLabel;
    vrtryswtchRemotePS: TVrRotarySwitch;
    grpSpeed: TGroupBox;
    lbl7: TLabel;
    vrtryswtchSpeedPS: TVrRotarySwitch;
    grpPreStartingInhibition: TGroupBox;
    lbl11: TLabel;
    vrtryswtchPreStartPS: TVrRotarySwitch;
    grpSTCControl: TGroupBox;
    lbl10: TLabel;
    vrtryswtchSTC_PS: TVrRotarySwitch;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    tmrHoorCounter: TTimer;
    Label13: TLabel;
    Panel1: TPanel;
    lblCounter1: TLabel;
    lblCounter2: TLabel;
    lblCounter3: TLabel;
    lblCounter4: TLabel;
    lblCounter5: TLabel;
    lblCounter6: TLabel;
    lblCounter7: TLabel;
    lblCounter8: TLabel;
    lblHoorCounter: TLabel;
    procedure MenuClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tmrHoorCounterTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure vrtryswtchRemoteChange(Sender: TObject);
  private
    FCounter: Integer;
  public
    { Public declarations }
  end;

var
  frmSignalingLightME2: TfrmSignalingLightME2;

implementation

uses
  ufrmMenu, ufrmSetofPressureGaugesME2, uMainEngine2System;

{$R *.dfm}

procedure TfrmSignalingLightME2.FormCreate(Sender: TObject);
begin
  FCounter := 0000000;
  lblHoorCounter.Caption := IntToStr(FCounter);
  tmrHoorCounter.Enabled := True;
end;

procedure TfrmSignalingLightME2.FormShow(Sender: TObject);
begin
  DefaultMonitor := dmDesktop;

  if Screen.MonitorCount > 1 then
  begin
    Height := Screen.Monitors[MainEngine2System.IdScreenSignaling].Height;
    Top    := Screen.Monitors[MainEngine2System.IdScreenSignaling].Top;
    Left   := Screen.Monitors[MainEngine2System.IdScreenSignaling].Left;
    width  := Screen.Monitors[MainEngine2System.IdScreenSignaling].Width;
  end
  else
  begin
    Height := Screen.Height;
    Width := Screen.Width;
    Left := 0;
    Top := 0;
  end;
end;

procedure TfrmSignalingLightME2.MenuClick(Sender: TObject);
begin
  frmMenu.Show;
  Self.Hide;
end;

procedure TfrmSignalingLightME2.tmrHoorCounterTimer(Sender: TObject);
begin
  Inc(FCounter);
  lblHoorCounter.Caption := IntToStr(FCounter);
end;

procedure TfrmSignalingLightME2.vrtryswtchRemoteChange(Sender: TObject);
var
  i : Integer;
  stateIdTemp : Integer;
begin
  if TVrRotarySwitch(Sender).Tag = 0 then
  begin
    MainEngine2System.vrtryswtchRemotePS(C_PCS_ME_PORTS);
    MainEngine2System.vrtryswtchRemotePS(C_PCS_GB_STARBOARD);
  end;
end;

end.
