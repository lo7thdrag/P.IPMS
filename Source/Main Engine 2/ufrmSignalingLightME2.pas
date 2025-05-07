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
    tmrHoorCounter: TTimer;
    Label13: TLabel;
    Panel1: TPanel;
    lblHoorCounter: TLabel;
    procedure MenuClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tmrHoorCounterTimer(Sender: TObject);

    procedure vrtryswtchRemoteChange(Sender: TObject);
    procedure vrtryswtchSpeedChange(Sender: TObject);
    procedure vrtryswtchPreStartInhibitionChange(Sender: TObject);
    procedure vrtryswtchSTCHChange(Sender: TObject);
  private
    FCounter: Integer;
    FListener : TListeners;

    procedure MainEngineSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Integer);overload;
    procedure MainEngineSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Boolean);overload;
  public

  end;

var
  frmSignalingLightME2: TfrmSignalingLightME2;

implementation

uses
  ufrmMenu, ufrmSetofPressureGaugesME2, uMainEngine2System;

{$R *.dfm}

procedure TfrmSignalingLightME2.FormCreate(Sender: TObject);
begin
  FListener := TListeners.Create;
  with MainEngine2System.Listener.Add('Main Engine 2') as TPropertyEventListener do
  begin
    OnPropertyIntChange  := MainEngineSystemEvent;
    OnPropertyBoolChange := MainEngineSystemEvent;
  end;

  FCounter := 0000000;
  lblHoorCounter.Caption := IntToStr(FCounter);
  tmrHoorCounter.Enabled := True;
end;

procedure TfrmSignalingLightME2.MainEngineSystemEvent(Sender: TObject;
  PropsID: E_PropsID; Value: Boolean);
begin

end;

procedure TfrmSignalingLightME2.MainEngineSystemEvent(Sender: TObject;
  PropsID: E_PropsID; Value: Integer);
begin
   case PropsID of
    epPCSFreezed:
      if Value = 1 then
      begin
        frmSignalingLightME2.Enabled := False;
        MainEngine2System.FFormFreezed[1] := TfrmFreeze.Create(frmSignalingLightME2);
        with MainEngine2System.FFormFreezed[1] do
        begin
          Parent   := frmSignalingLightME2;
          Position := poOwnerFormCenter;
          BringToFront;
          Show;
        end;
      end
      else if Value = 0 then
      begin
        frmSignalingLightME2.Enabled := True;
        if Assigned(MainEngine2System.FFormFreezed[1]) then
           FreeAndNil(MainEngine2System.FFormFreezed[1]);
      end;

      epPCSMERunningHour :
      begin
        lblHoorCounter.Caption := IntToStr(Value);
      end;
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

procedure TfrmSignalingLightME2.vrtryswtchPreStartInhibitionChange(
  Sender: TObject);
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

procedure TfrmSignalingLightME2.vrtryswtchRemoteChange(Sender: TObject);
begin
  if TVrRotarySwitch(Sender).Tag = 0 then
  begin
    if vrtryswtchRemotePS.SwitchPosition = 0 then
      MainEngine2System.vrtryswtchRemotePS(C_PCS_ME_PORTS, False)
    else if vrtryswtchRemotePS.SwitchPosition = 1 then
      MainEngine2System.vrtryswtchRemotePS(C_PCS_ME_PORTS, True);
  end;
end;

procedure TfrmSignalingLightME2.vrtryswtchSpeedChange(Sender: TObject);
begin
  if TVrRotarySwitch(Sender).Tag = 0 then
  begin
    if vrtryswtchSpeedPS.SwitchPosition = 0 then
      MainEngine2System.vrtryswtchSpeedPS(C_PCS_ME_PORTS, True)
    else if vrtryswtchSpeedPS.SwitchPosition = 1 then
      MainEngine2System.vrtryswtchSpeedPS(C_PCS_ME_PORTS, False)
    else if vrtryswtchSpeedPS.SwitchPosition = 2 then
      MainEngine2System.vrtryswtchSpeedPS(C_PCS_ME_PORTS, True);
  end;
end;

procedure TfrmSignalingLightME2.vrtryswtchSTCHChange(Sender: TObject);
begin
  if TVrRotarySwitch(Sender).Tag = 0 then
  begin
    if vrtryswtchSTC_PS.SwitchPosition = 0 then
      MainEngine2System.vrtryswtchSTC_PS(C_PCS_ME_PORTS, True)
    else if vrtryswtchSTC_PS.SwitchPosition = 1 then
      MainEngine2System.vrtryswtchSTC_PS(C_PCS_ME_PORTS, False)
    else if vrtryswtchSTC_PS.SwitchPosition = 2 then
      MainEngine2System.vrtryswtchSTC_PS(C_PCS_ME_PORTS, True);
  end;
end;

end.
