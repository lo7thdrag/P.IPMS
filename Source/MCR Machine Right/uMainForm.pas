unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RzBmpBtn, Vcl.StdCtrls, VrControls,
  VrAngularMeter, Vcl.ExtCtrls,

  uListener, uFreezeFrom, uDataType, VrRotarySwitch, Vcl.MPlayer;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    PanelSpedometer: TPanel;
    Image3: TImage;
    vraSbRudderServo: TVrAngularMeter;
    pnlCPPpersen: TPanel;
    vraCPP: TVrAngularMeter;
    Label15: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label21: TLabel;
    pnlRPMMESPEED: TPanel;
    vraMeSpeed: TVrAngularMeter;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label20: TLabel;
    pnlRPMSHAFTSPEED: TPanel;
    vraShaftSpeed: TVrAngularMeter;
    Label9: TLabel;
    Label10: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label19: TLabel;
    pnlAlarmIndicator: TPanel;
    Image2: TImage;
    imgOP1: TImage;
    ImgOP2: TImage;
    ImgCFP2: TImage;
    ImgHLP1: TImage;
    ImgCFP1: TImage;
    ImgPFP1: TImage;
    ImgPFP2: TImage;
    ImgHLP2: TImage;
    ImgPowerFP1: TImage;
    ImgPowerFP2: TImage;
    ImgPFS: TImage;
    ImgPFC1: TImage;
    ImgPFC2: TImage;
    ImgLOLP1: TImage;
    ImgLOLP2: TImage;
    ImgST: TImage;
    ImgAudible: TImage;
    tmrTelegraph: TTimer;
    pnlTelegraph: TPanel;
    imgBackgroungTelegraph: TImage;
    imgsb1: TImage;
    imgsb10: TImage;
    imgsb11: TImage;
    imgsb2: TImage;
    imgsb3: TImage;
    imgsb4: TImage;
    imgsb5: TImage;
    imgsb6: TImage;
    imgsb7: TImage;
    imgsb8: TImage;
    imgsb9: TImage;
    vrSbTelegrap: TVrRotarySwitch;
    imgSTShadow: TImage;
    imgAudibleShadow: TImage;
    tmrMeSpeed: TTimer;
    tmrShaftSpeed: TTimer;
    tmrCPP: TTimer;
    pnlSparator: TPanel;
    mpAlarm: TMediaPlayer;
    procedure tmrTelegraphTimer(Sender: TObject);
    procedure vrSbTelegrapChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure imgSTShadowMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgSTShadowMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgAudibleShadowMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgAudibleShadowMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tmrMeSpeedTimer(Sender: TObject);
    procedure tmrShaftSpeedTimer(Sender: TObject);
    procedure tmrCPPTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    FIsBlinkState : Boolean;
    FIdBlink : Integer;
    FListener : TListeners;

    procedure MCRMachineRightSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Integer);overload;
    procedure MCRMachineRightSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Boolean);overload;
    procedure MCRMachineRightSystemEvent(Sender : TObject; PropsID : E_PropsID; Value : Double); overload;

  public
    OrderMeSpeed : Double;
    OrderShaftSpeed : Double;
    OrderCPP : Double;

    IdReceive : Integer;
    TelegrapStatus : E_TelegrapState;

    FAlarmIndicator : array[0..14] of Boolean;

    procedure SetAlarmIndicator;

    procedure SetTelegrap;

    procedure GetIdBlinkTelegrapLamp(value : Integer);

  end;

var
  MainForm: TMainForm;

implementation

uses
  uMCRMachineRightSystem;

{$R *.dfm}

procedure EnableComposited(WinControl:TWinControl);
var
  i:Integer;
  NewExStyle:DWORD;
begin
  NewExStyle := GetWindowLong(WinControl.Handle, GWL_EXSTYLE) or WS_EX_COMPOSITED;
  SetWindowLong(WinControl.Handle, GWL_EXSTYLE, NewExStyle);

  for I := 0 to WinControl.ControlCount - 1 do
    if WinControl.Controls[i] is TWinControl then
      EnableComposited(TWinControl(WinControl.Controls[i]));
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
  i : Integer;

begin
  FListener := TListeners.Create;
  with MCRMachineRightSystem.Listener.Add('MCRMACHINERIGHT') as TPropertyEventListener do
  begin
    OnPropertyIntChange := MCRMachineRightSystemEvent;
    OnPropertyBoolChange := MCRMachineRightSystemEvent;
    OnPropertyDblChange := MCRMachineRightSystemEvent;
  end;

  {$REGION ' Set Alarm Indicator '}
  for I := 0 to 14 do
  begin
    FAlarmIndicator[i] := false;
  end;
  SetAlarmIndicator;
  {$ENDREGION}

  {$REGION ' Set Telegrap Indicator '}
  TelegrapStatus := tsSend;
  FIsBlinkState := False;
  {$ENDREGION}

  EnableComposited(pnlAlarmIndicator);
  EnableComposited(pnlTelegraph);
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  Left   := Screen.Monitors[0].Left;
  Top    := Screen.Monitors[0].Top;
end;

procedure TMainForm.GetIdBlinkTelegrapLamp(value: Integer);
var
  i : Integer;

begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TImage then
    begin
      if TImage(Components[i]).Hint <> 'Telegrap' then
        Continue;

      TImage(Components[i]).Visible := False;

      if (TImage(Components[i]).Tag = value ) then
      begin
        FIdBlink := i;
      end;
    end;
  end;
end;

procedure TMainForm.imgAudibleShadowMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  imgAudible.Visible := True;
end;

procedure TMainForm.imgAudibleShadowMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  imgAudible.Visible := False;
end;

procedure TMainForm.imgSTShadowMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ImgST.Visible         := True;
  imgOP1.Visible        := True;
  ImgPFP1.Visible       := True;
  ImgPFS.Visible        := True;
  ImgLOLP1.Visible      := True;
  ImgLOLP2.Visible      := True;

  imgOP2.Visible        := True;
  ImgPFP2.Visible       := True;
  ImgPFC1.Visible       := True;

  ImgHLP1.Visible       := True;
  ImgHLP2.Visible       := True;
  ImgPFC2.Visible       := True;

  ImgCFP1.Visible       := True;
  ImgPowerFP1.Visible   := True;

  ImgCFP2.Visible       := True;
  ImgPowerFP2.Visible   := True;
end;

procedure TMainForm.imgSTShadowMouseUp(Sender: TObject; Button: TMouseButton;   Shift: TShiftState; X, Y: Integer);
begin
  ImgST.Visible := False;
  SetAlarmIndicator;
end;

procedure TMainForm.MCRMachineRightSystemEvent(Sender: TObject;   PropsID: E_PropsID; Value: Integer);
var
    koefRate, degRate : Double;
    outputRudderLeft, outputRudderRight : Integer;
    tempRudderLeft, TempSpeedMERight, TempSpeedCPPRight, TempSpeedSHAFTRight : Double;
begin
  case PropsID of
    epPMSFreezed:
    begin
      if Value = 1 then
      begin
        MainForm.Enabled := False;
        MCRMachineRightSystem.FFormFreezed[0] := TfrmFreeze.Create(MainForm);
        with MCRMachineRightSystem.FFormFreezed[0] do
        begin
          Parent := MainForm;
          Position := poOwnerFormCenter;
          BringToFront;
          Show;
        end;
      end
      else if Value = 0 then
      begin
        MainForm.Enabled := True;
        if Assigned(MCRMachineRightSystem.FFormFreezed[0]) then
          FreeAndNil(MCRMachineRightSystem.FFormFreezed[0]);
      end;
    end;
    epRudderValueSB:
    begin
      vraSbRudderServo.Position := abs(Value);
    end;
  end;
end;

procedure TMainForm.MCRMachineRightSystemEvent(Sender: TObject; PropsID: E_PropsID; Value: Boolean);
begin

end;

procedure TMainForm.MCRMachineRightSystemEvent(Sender: TObject; PropsID: E_PropsID; Value: Double);
begin
  case PropsID of
    epPCSMEActualSpeedSB:
    begin
      OrderMESpeed := Value;
      tmrMeSpeed.Enabled := True;
    end;

    epPCSGBShaftSpeedSB:
    begin
      OrderShaftSpeed := Value;
      tmrShaftSpeed.Enabled := True;
    end;

    epPCSCPPActualPitchSB:
    begin
      OrderCPP := Value;
      tmrCPP.Enabled := True;
    end;
  end;
end;

procedure TMainForm.SetAlarmIndicator;
begin
    imgOP1.Visible        := FAlarmIndicator[0];
    ImgPFP1.Visible       := FAlarmIndicator[1];
    ImgPFS.Visible        := FAlarmIndicator[2];
    ImgLOLP1.Visible      := FAlarmIndicator[3];
    ImgLOLP2.Visible      := FAlarmIndicator[4];

    imgOP2.Visible        := FAlarmIndicator[5];
    ImgPFP2.Visible       := FAlarmIndicator[6];
    ImgPFC1.Visible       := FAlarmIndicator[7];

    ImgHLP1.Visible       := FAlarmIndicator[8];
    ImgHLP2.Visible       := FAlarmIndicator[9];
    ImgPFC2.Visible       := FAlarmIndicator[10];

    ImgCFP1.Visible       := FAlarmIndicator[11];
    ImgPowerFP1.Visible   := FAlarmIndicator[12];

    ImgCFP2.Visible       := FAlarmIndicator[13];
    ImgPowerFP2.Visible   := FAlarmIndicator[14];
end;

procedure TMainForm.SetTelegrap;
begin
  case TelegrapStatus of
    tsReceive :
    begin
      if (IdReceive <> (vrSbTelegrap.SwitchPosition + 1))then
        exit;

      GetIdBlinkTelegrapLamp(IdReceive);

      tmrTelegraph.Enabled := False;
      TImage(Components[FIdBlink]).Visible := True;

      TelegrapStatus := tsSend;
    end;
    tsReply :
    begin
      GetIdBlinkTelegrapLamp(IdReceive);
      tmrTelegraph.Enabled := True;
    end;
  end;
end;

procedure TMainForm.tmrCPPTimer(Sender: TObject);
begin
  if vraCPP.Position > OrderCPP then
  begin
    vraCPP.Position := vraCPP.Position - 1;
  end
  else if vraCPP.Position < OrderCPP then
  begin
    vraCPP.Position := vraCPP.Position + 1;
  end
  else
  begin
    tmrCPP.Enabled := False;
  end;
end;

procedure TMainForm.tmrMeSpeedTimer(Sender: TObject);
begin
  if vraMeSpeed.Position > OrderMeSpeed then
  begin
    vraMeSpeed.Position := vraMeSpeed.Position - 1;
  end
  else if vraMeSpeed.Position < OrderMeSpeed then
  begin
    vraMeSpeed.Position := vraMeSpeed.Position + 1;
  end
  else
  begin
    tmrMeSpeed.Enabled := False;
  end;
end;

procedure TMainForm.tmrShaftSpeedTimer(Sender: TObject);
begin
  if vraShaftSpeed.Position > OrderShaftSpeed then
  begin
    vraShaftSpeed.Position := vraShaftSpeed.Position - 1;
  end
  else if vraShaftSpeed.Position < OrderShaftSpeed then
  begin
    vraShaftSpeed.Position := vraShaftSpeed.Position + 1;
  end
  else
  begin
    tmrShaftSpeed.Enabled := False;
  end;
end;

procedure TMainForm.tmrTelegraphTimer(Sender: TObject);
begin
  if FIsBlinkState then
  begin
    TImage(Components[FIdBlink]).Visible := True;
    FIsBlinkState := False;
  end
  else
  begin
    TImage(Components[FIdBlink]).Visible := False;
    FIsBlinkState := True;
  end;
end;

procedure TMainForm.vrSbTelegrapChange(Sender: TObject);
begin

  case TelegrapStatus of
    tsSend :
    begin
      {$REGION ' Pd saat kita mengirim pesan '}
      GetIdBlinkTelegrapLamp(TVrRotarySwitch(Sender).SwitchPosition + 1);
      tmrTelegraph.Enabled := True;

      MCRMachineRightSystem.sendTelegram(epBoardTelegramKanan, TVrRotarySwitch(Sender).SwitchPosition + 1, True, Ord(tsSend));
      {$ENDREGION}
    end;
    tsReply :
    begin
      {$REGION ' Pd saat kita membalas pesan '}
      if (IdReceive <> (vrSbTelegrap.SwitchPosition + 1))then
        exit;

      GetIdBlinkTelegrapLamp(TVrRotarySwitch(Sender).SwitchPosition + 1);
      TImage(Components[FIdBlink]).Visible := True;

      tmrTelegraph.Enabled := False;

      MCRMachineRightSystem.sendTelegram(epBoardTelegramKanan, TVrRotarySwitch(Sender).SwitchPosition + 1, True, Ord(tsReply));

      {mengubah status dari penerima ke siap mengirim lagi}
      TelegrapStatus := tsSend;
      {$ENDREGION}
    end;
  end;
end;

end.
