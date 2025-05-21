unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,

  uListener, uFreezeFrom, uDataType, Vcl.ExtCtrls;

type
  TfrmMainForm = class(TForm)
    tmrBlinkTimer: TTimer;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tmrBlinkMe1Timer(Sender: TObject);
  private
    FListener : TListeners;
    FIsBlinkState : Boolean;
    FIsStartBlink : Boolean;
    FIsStopBlink  : Boolean;

    procedure MainEngine1SystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Integer);overload;
    procedure MainEngine1SystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Boolean);overload;
    procedure MainEngine1SystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Double);overload;
  public
    { Public declarations }
  end;

var
  frmMainForm: TfrmMainForm;

implementation

uses
  ufrmSetofPressureGaugesME1, ufrmSignalingLightME1, ufrmPMSDieselEngineSafetiesME1, uMainEngine1System;

{$R *.dfm}

procedure TfrmMainForm.FormCreate(Sender: TObject);
begin
  FListener := TListeners.Create;
  with MainEngine1System.Listener.Add('MAINENGINE 1') as TPropertyEventListener do
  begin
    OnPropertyIntChange  := MainEngine1SystemEvent;
    OnPropertyBoolChange := MainEngine1SystemEvent;
    OnPropertyDblChange  := MainEngine1SystemEvent;
  end;
end;

procedure TfrmMainForm.FormDestroy(Sender: TObject);
begin
  FListener.Free;
end;

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
      frmSignalingLightME1.Show;
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
      frmSignalingLightME1.Show;
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
      frmSignalingLightME1.Show;
    end;
  end;
end;

procedure TfrmMainForm.MainEngine1SystemEvent(Sender: TObject; PropsID: E_PropsID; Value: Integer);
begin
  case PropsID of
    epPCSFreezed :
    begin
      if Value = 1 then
      begin
        frmSignalingLightME1.Enabled := False;
        MainEngine1System.FFormFreezed[0] := TfrmFreeze.Create(frmSignalingLightME1);
        with MainEngine1System.FFormFreezed[0] do
        begin
          Parent   := frmSignalingLightME1;
          Position := poOwnerFormCenter;
          BringToFront;
          Show;
        end;

        frmPMSDieselEngineSafetiesME1.Enabled := False;
        MainEngine1System.FFormFreezed[1] := TfrmFreeze.Create(frmPMSDieselEngineSafetiesME1);
        with MainEngine1System.FFormFreezed[1] do
        begin
          Parent   := frmPMSDieselEngineSafetiesME1;
          Position := poOwnerFormCenter;
          BringToFront;
          Show;
        end;

        frmSetofPressureGaugesME1.Enabled := False;
        MainEngine1System.FFormFreezed[2] := TfrmFreeze.Create(frmSetofPressureGaugesME1);
        with MainEngine1System.FFormFreezed[2] do
        begin
          Parent   := frmSetofPressureGaugesME1;
          Position := poOwnerFormCenter;
          BringToFront;
          Show;
        end;
      end
      else if Value = 0 then
      begin
        frmSignalingLightME1.Enabled := True;
        if Assigned(MainEngine1System.FFormFreezed[0]) then
          FreeAndNil(MainEngine1System.FFormFreezed[0]);

        frmPMSDieselEngineSafetiesME1.Enabled := True;
        if Assigned(MainEngine1System.FFormFreezed[1]) then
          FreeAndNil(MainEngine1System.FFormFreezed[1]);

        frmSetofPressureGaugesME1.Enabled := True;
        if Assigned(MainEngine1System.FFormFreezed[2]) then
          FreeAndNil(MainEngine1System.FFormFreezed[2]);
      end;
    end;
  end;
end;

procedure TfrmMainForm.MainEngine1SystemEvent(Sender: TObject; PropsID: E_PropsID; Value: Boolean);
begin
  case PropsID of
    epPCSMERunning :
    begin
      FIsStartBlink := Value;
      FIsStopBlink  := not Value;
      tmrBlinkTimer.Enabled := FIsStartBlink or FIsStopBlink;
    end;
    epPCSCtrlLocal :
    begin
      if Value then
      begin
        frmSignalingLightME1.imgLocalPositionME1.Visible := True;
        frmSignalingLightME1.imgRemotePositionME1.Visible := False;
      end
      else
      begin
        frmSignalingLightME1.imgLocalPositionME1.Visible := False;
        frmSignalingLightME1.imgRemotePositionME1.Visible := True;
      end;
    end;
  end;
end;

procedure TfrmMainForm.MainEngine1SystemEvent(Sender: TObject; PropsID: E_PropsID; Value: Double);
begin

end;

procedure TfrmMainForm.tmrBlinkMe1Timer(Sender: TObject);
begin
  FIsBlinkState := not FIsBlinkState;

  if FIsStartBlink then
  begin
    frmSignalingLightME1.imgStartME1.Visible := FIsBlinkState;
    frmSignalingLightME1.imgStartingAllowedME1.Visible := True;
  end
  else
  begin
    frmSignalingLightME1.imgStartME1.Visible := False;
    frmSignalingLightME1.imgStartingAllowedME1.Visible := False;
  end;

  if FIsStopBlink then
  begin
    frmSignalingLightME1.imgStopME1.Visible := FIsBlinkState;
  end
  else
  begin
    frmSignalingLightME1.imgStopME1.Visible := False;
  end;

 if not FIsStartBlink and not FIsStopBlink then
  tmrBlinkTimer.Enabled := False;
end;

end.
