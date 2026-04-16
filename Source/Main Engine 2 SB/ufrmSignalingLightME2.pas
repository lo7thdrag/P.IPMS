unit ufrmSignalingLightME2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VrControls, VrRotarySwitch,
  Vcl.StdCtrls, Vcl.ExtCtrls,

  uDataType, uListener, uFreezeFrom, Vcl.MPlayer;

type
  TfrmSignalingLightME2 = class(TForm)
    pnlMain: TPanel;
    grpRemote: TGroupBox;
    lbl1: TLabel;
    vrtryswtchRemoteSB: TVrRotarySwitch;
    grpSpeed: TGroupBox;
    lbl7: TLabel;
    vrtryswtchSpeedSB: TVrRotarySwitch;
    grpPreStartingInhibition: TGroupBox;
    lbl11: TLabel;
    vrtryswtchPreStartSB: TVrRotarySwitch;
    grpSTCControl: TGroupBox;
    lbl10: TLabel;
    vrtryswtchSTC_SB: TVrRotarySwitch;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    lblHoorCounter: TLabel;


    procedure vrtryswtchRemoteSBClick(Sender: TObject);
    procedure vrtryswtchSpeedSBClick(Sender: TObject);
    procedure vrtryswtchSTC_SBClick(Sender: TObject);
    procedure vrtryswtchPreStartSBClick(Sender: TObject);
  private


  public

  end;

var
  frmSignalingLightME2: TfrmSignalingLightME2;

implementation

uses
  ufrmSetofPressureGaugesME2, uMainEngine2System;

{$R *.dfm}
procedure TfrmSignalingLightME2.vrtryswtchPreStartSBClick(Sender: TObject);
begin
  if TVrRotarySwitch(Sender).Tag = 0 then
  begin
    if vrtryswtchPreStartSB.SwitchPosition = 0 then
    begin
      MainEngine2System.vrtryswtchPreStartInhibitionPS(C_PCS_ME_STARBOARD, True);
      MainEngine2System.RunningStart(C_PCS_ME_STARBOARD);
    end
    else if vrtryswtchPreStartSB.SwitchPosition = 1 then
    begin
      MainEngine2System.vrtryswtchPreStartInhibitionPS(C_PCS_ME_STARBOARD, False);
      MainEngine2System.RunningStart(C_PCS_ME_STARBOARD);
      vrtryswtchPreStartSB.SwitchPosition := 0
    end;
  end;
end;

procedure TfrmSignalingLightME2.vrtryswtchRemoteSBClick(Sender: TObject);
begin
  if TVrRotarySwitch(Sender).Tag = 0 then
  begin
    if vrtryswtchRemoteSB.SwitchPosition = 0 then
      MainEngine2System.vrtryswtchRemotePS(C_PCS_ME_STARBOARD, False)
    else if vrtryswtchRemoteSB.SwitchPosition = 1 then
      MainEngine2System.vrtryswtchRemotePS(C_PCS_ME_STARBOARD, True);
  end;
end;

procedure TfrmSignalingLightME2.vrtryswtchSpeedSBClick(Sender: TObject);
begin
  if TVrRotarySwitch(Sender).Tag = 0 then
  begin
    MainEngine2System.vrtryswtchRiseSpeedPS(C_PCS_ME_STARBOARD, vrtryswtchSpeedSB.SwitchPosition);
  end;
end;

procedure TfrmSignalingLightME2.vrtryswtchSTC_SBClick(Sender: TObject);
begin
  if TVrRotarySwitch(Sender).Tag = 0 then
  begin
    MainEngine2System.vrtryswtchAutoSTC_PS(C_PCS_ME_STARBOARD, vrtryswtchSTC_SB.SwitchPosition);
  end;
end;

end.
