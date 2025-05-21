unit ufrmSignalingLightME2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VrControls, VrRotarySwitch,
  Vcl.StdCtrls, Vcl.ExtCtrls,

  uDataType, uListener, uFreezeFrom;

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
    Panel1: TPanel;
    lblHoorCounter: TLabel;


    procedure vrtryswtchRemotePSClick(Sender: TObject);
    procedure vrtryswtchSpeedPSClick(Sender: TObject);
    procedure vrtryswtchSTC_PSClick(Sender: TObject);
    procedure vrtryswtchPreStartPSClick(Sender: TObject);
  private


  public

  end;

var
  frmSignalingLightME2: TfrmSignalingLightME2;

implementation

uses
  ufrmSetofPressureGaugesME2, uMainEngine2System;

{$R *.dfm}

procedure TfrmSignalingLightME2.vrtryswtchPreStartPSClick(Sender: TObject);
begin
  if TVrRotarySwitch(Sender).Tag = 0 then
  begin
    if vrtryswtchPreStartPS.SwitchPosition = 0 then
    begin
      MainEngine2System.vrtryswtchPreStartInhibitionPS(C_PCS_ME_PORTS, True);
      MainEngine2System.RunningStart(C_PCS_ME_PORTS);
    end
    else if vrtryswtchPreStartPS.SwitchPosition = 1 then
    begin
      MainEngine2System.vrtryswtchPreStartInhibitionPS(C_PCS_ME_PORTS, False);
      MainEngine2System.RunningStart(C_PCS_ME_PORTS);
    end;
  end;
end;

procedure TfrmSignalingLightME2.vrtryswtchRemotePSClick(Sender: TObject);
begin
  if TVrRotarySwitch(Sender).Tag = 0 then
  begin
    if vrtryswtchRemotePS.SwitchPosition = 0 then
      MainEngine2System.vrtryswtchRemotePS(C_PCS_ME_PORTS, False)
    else if vrtryswtchRemotePS.SwitchPosition = 1 then
      MainEngine2System.vrtryswtchRemotePS(C_PCS_ME_PORTS, True);
  end;
end;

procedure TfrmSignalingLightME2.vrtryswtchSpeedPSClick(Sender: TObject);
begin
  if TVrRotarySwitch(Sender).Tag = 0 then
  begin
    MainEngine2System.vrtryswtchRiseSpeedPS(C_PCS_ME_PORTS, vrtryswtchSpeedPS.SwitchPosition);
  end;
end;

procedure TfrmSignalingLightME2.vrtryswtchSTC_PSClick(Sender: TObject);
begin
  if TVrRotarySwitch(Sender).Tag = 0 then
  begin
    MainEngine2System.vrtryswtchAutoSTC_PS(C_PCS_ME_PORTS, vrtryswtchSTC_PS.SwitchPosition);
  end;
end;

end.
