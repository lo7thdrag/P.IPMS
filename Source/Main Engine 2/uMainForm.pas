unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,

  uListener, uFreezeFrom, uDataType;

type
  TfrmMainForm = class(TForm)
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    FListener : TListeners;

    procedure MainEngine2SystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Integer);overload;
    procedure MainEngine2SystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Boolean);overload;
    procedure MainEngine2SystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Double);overload;

  public
    { Public declarations }
  end;

var
  frmMainForm: TfrmMainForm;

implementation

uses
  ufrmSetofPressureGaugesME2, ufrmSignalingLightME2, ufrmMenu, uMainEngine2System;

{$R *.dfm}

procedure TfrmMainForm.FormCreate(Sender: TObject);
begin
  FListener := TListeners.Create;
  with MainEngine2System.Listener.Add('MAINENGINE 2') as TPropertyEventListener do
  begin
    OnPropertyIntChange  := MainEngine2SystemEvent;
    OnPropertyBoolChange := MainEngine2SystemEvent;
    OnPropertyDblChange  := MainEngine2SystemEvent;
  end;
end;

procedure TfrmMainForm.FormDestroy(Sender: TObject);
begin
  FListener.Free;
end;

procedure TfrmMainForm.FormShow(Sender: TObject);
begin
  if Screen.MonitorCount > MainEngine2System.IdScreenSignaling then
  begin
    with frmSignalingLightME2 do
    begin
      Left   := Screen.Monitors[MainEngine2System.IdScreenSignaling].Left;
      Top    := Screen.Monitors[MainEngine2System.IdScreenSignaling].Top;
      Width  := Screen.Monitors[MainEngine2System.IdScreenSignaling].Width;
      Height := Screen.Monitors[MainEngine2System.IdScreenSignaling].Height;
      Show;
    end;
  end;

  if Screen.MonitorCount > MainEngine2System.IdScreenGauges then
  begin
    with frmSetofPressureGaugesME2 do
    begin
      Left   := Screen.Monitors[MainEngine2System.IdScreenGauges].Left;
      Top    := Screen.Monitors[MainEngine2System.IdScreenGauges].Top;
      Width  := Screen.Monitors[MainEngine2System.IdScreenGauges].Width;
      Height := Screen.Monitors[MainEngine2System.IdScreenGauges].Height;
      Show;
    end;
  end;

  if Screen.MonitorCount > MainEngine2System.IdScreenPmsHmi then
  begin
    with frmMenu do
    begin
      Left   := Screen.Monitors[MainEngine2System.IdScreenPmsHmi].Left;
      Top    := Screen.Monitors[MainEngine2System.IdScreenPmsHmi].Top;
      Width  := Screen.Monitors[MainEngine2System.IdScreenPmsHmi].Width;
      Height := Screen.Monitors[MainEngine2System.IdScreenPmsHmi].Height;
      Show;
    end;
  end;
end;

procedure TfrmMainForm.MainEngine2SystemEvent(Sender: TObject; PropsID: E_PropsID; Value: Integer);
begin
  case PropsID of
    epPCSFreezed:
    begin
      if Value = 1 then
      begin
        frmSignalingLightME2.Enabled := False;
        MainEngine2System.FFormFreezed[0] := TfrmFreeze.Create(frmSignalingLightME2);
        with MainEngine2System.FFormFreezed[0] do
        begin
          Parent := frmSignalingLightME2;
          Position := poOwnerFormCenter;
          BringToFront;
          Show;
        end;

        frmMenu.Enabled := False;

        frmSetofPressureGaugesME2.Enabled := False;
        MainEngine2System.FFormFreezed[2] := TfrmFreeze.Create(frmSetofPressureGaugesME2);
        with MainEngine2System.FFormFreezed[2] do
        begin
          Parent := frmSetofPressureGaugesME2;
          Position := poOwnerFormCenter;
          BringToFront;
          Show;
        end;
      end
      else if Value = 0 then
      begin
        frmSignalingLightME2.Enabled := True;
        if Assigned(MainEngine2System.FFormFreezed[0]) then
          FreeAndNil(MainEngine2System.FFormFreezed[0]);

        frmMenu.Enabled := True;

        frmSetofPressureGaugesME2.Enabled := True;
        if Assigned(MainEngine2System.FFormFreezed[2]) then
          FreeAndNil(MainEngine2System.FFormFreezed[2]);
      end;
    end;
    epPCSMERunningHours :
    begin
      frmSignalingLightME2.lblHoorCounter.Caption := IntToStr(Value);
    end;
    epPCSSpeedState :
    begin
      frmSignalingLightME2.vrtryswtchSpeedPS.SwitchPosition := Value;
    end;
    epPCSMESTCInManual :
    begin
      frmSignalingLightME2.vrtryswtchSTC_PS.SwitchPosition := Value;
    end;
  end;
end;

procedure TfrmMainForm.MainEngine2SystemEvent(Sender: TObject; PropsID: E_PropsID; Value: Boolean);
begin
  case PropsID of
    epPCSCtrlMCR :
    begin
      if Value then
        frmSignalingLightME2.vrtryswtchRemotePS.SwitchPosition := 1
      else
        frmSignalingLightME2.vrtryswtchRemotePS.SwitchPosition := 0;
    end;
    epPCSCtrlLocal:
    begin
      if Value then
        frmSignalingLightME2.vrtryswtchRemotePS.SwitchPosition := 0
      else
        frmSignalingLightME2.vrtryswtchRemotePS.SwitchPosition := 1;
    end;

    epPCSMEPreStart :
    begin
      if Value then
        frmSignalingLightME2.vrtryswtchPreStartPS.SwitchPosition := 0
      else
        frmSignalingLightME2.vrtryswtchPreStartPS.SwitchPosition := 1;
    end;
  end;
end;

procedure TfrmMainForm.MainEngine2SystemEvent(Sender: TObject; PropsID: E_PropsID; Value: Double);
begin
  case PropsID of
    epPCSMEPressFWHTInlet :
    begin
      if Assigned(frmSetofPressureGaugesME2) then
        frmSetofPressureGaugesME2.EngineInletFWPressureMeter.Position := Value
    end;
    epPCSMEPressAirInlet :
    begin
      if Assigned(frmSetofPressureGaugesME2) then
        frmSetofPressureGaugesME2.EngineInletAirPressureMeter.Position := Value
    end;
  end;
end;

end.
