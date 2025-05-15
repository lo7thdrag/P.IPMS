unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,

  uListener, uFreezeFrom, uDataType, RzBmpBtn, VrControls, VrRotarySwitch,
  Vcl.StdCtrls, VrAngularMeter, Vcl.ExtCtrls;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    pnlRpmMeSpeed: TPanel;
    vraMeSpeed: TVrAngularMeter;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label20: TLabel;
    pnlRpmShaftSpeed: TPanel;
    vraShaftSpeed: TVrAngularMeter;
    Label9: TLabel;
    Label10: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label19: TLabel;
    pnlCppPersen: TPanel;
    vraCPP: TVrAngularMeter;
    Label15: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label21: TLabel;
    pnlRudder: TPanel;
    imgBackgroundRudder: TImage;
    pnlCppHidraulicPump: TPanel;
    Image51: TImage;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label32: TLabel;
    Label26: TLabel;
    Label33: TLabel;
    Label31: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    pnlAlarmIndicator: TPanel;
    pnlAlarmPump12: TPanel;
    Image5: TImage;
    pnlAlramPump34: TPanel;
    Image1: TImage;
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
    imgAudible: TImage;
    ImgStandbyPS1: TImage;
    ImgStartPS1: TImage;
    ImgStandbyPS2: TImage;
    ImgStartPS2: TImage;
    ImgStandbyPS3: TImage;
    ImgStartPS3: TImage;
    ImgStandbySB1: TImage;
    ImgStartSB1: TImage;
    ImgStandbySB2: TImage;
    ImgStartSB2: TImage;
    ImgStandbySB3: TImage;
    ImgStartSB3: TImage;
    ImgRP1: TImage;
    ImgRP2: TImage;
    ImgRP3: TImage;
    ImgRP4: TImage;
    ImgSTOP1: TImage;
    ImgSTOP2: TImage;
    ImgASP1: TImage;
    ImgASP2: TImage;
    ImgSTOP3: TImage;
    ImgSTOP4: TImage;
    ImgASP3: TImage;
    ImgASP4: TImage;
    imgSTShadow: TImage;
    pnlTelegraph: TPanel;
    imgBackgroungTelegraph: TImage;
    imgps1: TImage;
    imgps10: TImage;
    imgps11: TImage;
    imgps2: TImage;
    imgps3: TImage;
    imgps4: TImage;
    imgps5: TImage;
    imgps6: TImage;
    imgps7: TImage;
    imgps8: TImage;
    imgps9: TImage;
    vrPsTelegrap: TVrRotarySwitch;
    vrPsPump1: TVrRotarySwitch;
    vrPsPump2: TVrRotarySwitch;
    vrPsPump3: TVrRotarySwitch;
    vrSbPump1: TVrRotarySwitch;
    vrSbPump2: TVrRotarySwitch;
    vrSbPump3: TVrRotarySwitch;
    vraPsRudderServo: TVrAngularMeter;
    tmrTelegraph: TTimer;
    imgAudibleShadow: TImage;
    tmrMeSpeed: TTimer;
    tmrShaftSpeed: TTimer;
    tmrCPP: TTimer;

    procedure FormCreate(Sender: TObject);
    procedure imgSTShadowMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure imgSTShadowMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

    procedure vrPsPumpChange(Sender: TObject);
    procedure vrSbPumpChange(Sender: TObject);
    procedure vrPsTelegrapChange(Sender: TObject);
    procedure tmrTelegraphTimer(Sender: TObject);
    procedure imgAudibleShadowMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgAudibleShadowMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure tmrShaftSpeedTimer(Sender: TObject);
    procedure tmrMeSpeedTimer(Sender: TObject);
    procedure tmrCPPTimer(Sender: TObject);

  private
    FIsBlinkState : Boolean;
    FIdBlink : Integer;
    FListener : TListeners;

    procedure MCRMachineLeftSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Integer);overload;
    procedure MCRMachineLeftSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Boolean);overload;
    procedure MCRMachineLeftSystemEvent(Sender : TObject; PropsID : E_PropsID; Value : Double); overload;

  public
    OrderMeSpeed : Double;
    OrderShaftSpeed : Double;
    OrderCPP : Double;

    IdReceive : Integer;
    TelegrapStatus : E_TelegrapState;

    FAlarmIndicator : array[0..14] of Boolean;
    FPumpRudderIndicator : array[0..11] of Boolean;
    FPsPump1 : array[0..2] of Boolean;
    FPsPump2 : array[0..2] of Boolean;
    FPsPump3 : array[0..2] of Boolean;
    FSbPump1 : array[0..2] of Boolean;
    FSbPump2 : array[0..2] of Boolean;
    FSbPump3 : array[0..2] of Boolean;

    procedure SetAlarmIndicator;
    procedure SetPumpRudderIndicator;

    procedure SetHidroulicPump;
    procedure SetTelegrap;

    procedure GetIdBlinkTelegrapLamp(value : Integer);
  end;

var
  MainForm: TMainForm;

implementation

uses
  uMCRMachineLeftSystem;

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

procedure TMainForm.FormShow(Sender: TObject);
begin
//  Left   := Screen.Monitors[0].Left;
//  Top    := Screen.Monitors[0].Top;

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

procedure TMainForm.FormCreate(Sender: TObject);
var
  i : Integer;

begin
  FListener := TListeners.Create;
  with MCRMachineLeftSystem.Listener.Add('MCRMACHINELEFT') as TPropertyEventListener do
  begin
    OnPropertyIntChange := MCRMachineLeftSystemEvent;
    OnPropertyBoolChange := MCRMachineLeftSystemEvent;
    OnPropertyDblChange := MCRMachineLeftSystemEvent;
  end;

  {$REGION ' Set Alarm Indicator '}
  for I := 0 to 14 do
  begin
    FAlarmIndicator[i] := false;
  end;
  SetAlarmIndicator;
  {$ENDREGION}

  {$REGION ' Set CPP Hidraulic Pump Indicator '}
  for i := 0 to 2 do
  begin
    FPsPump1[i] := false;
    FPsPump2[i] := false;
    FPsPump3[i] := false;
    FSbPump1[i] := false;
    FSbPump2[i] := false;
    FSbPump3[i] := false;
  end;
  {$ENDREGION}

  {$REGION ' Set Pump Rudder Indicator '}
  for I := 0 to 11 do
  begin
    if (i = 2) or (i = 5) or (i = 8) or (i = 11) then
      FPumpRudderIndicator[i] := true
    else
      FPumpRudderIndicator[i] := false;
  end;
  SetPumpRudderIndicator;
  {$ENDREGION}

  {$REGION ' Set Telegrap Indicator '}
  TelegrapStatus := tsSend;
  FIsBlinkState := False;
  {$ENDREGION}

  EnableComposited(pnlAlarmIndicator);
  EnableComposited(pnlAlarmPump12);
  EnableComposited(pnlAlramPump34);
  EnableComposited(pnlCppHidraulicPump);
  EnableComposited(pnlTelegraph);
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

procedure TMainForm.SetHidroulicPump;
begin
  ImgStandbyPS1.Visible := FPsPump1[0];
  ImgStartPS1.Visible   := FPsPump1[2];

  ImgStandbyPS2.Visible := FPsPump2[0];
  ImgStartPS2.Visible   := FPsPump2[2];

  ImgStandbyPS3.Visible := FPsPump3[0];
  ImgStartPS3.Visible   := FPsPump3[2];

  ImgStandbySB1.Visible := FSbPump1[0];
  ImgStartSB1.Visible   := FSbPump1[2];

  ImgStandbySB2.Visible := FSbPump2[0];
  ImgStartSB2.Visible   := FSbPump2[2];

  ImgStandbySB3.Visible := FSbPump3[0];
  ImgStartSB3.Visible   := FSbPump3[2];
end;

procedure TMainForm.SetPumpRudderIndicator;
begin
  ImgRP1.Visible    := FPumpRudderIndicator[0];
  ImgSTOP1.Visible  := FPumpRudderIndicator[1];
  ImgASP1.Visible   := FPumpRudderIndicator[2];

  ImgRP2.Visible    := FPumpRudderIndicator[3];
  ImgSTOP2.Visible  := FPumpRudderIndicator[4];
  ImgASP2.Visible   := FPumpRudderIndicator[5];

  ImgRP3.Visible    := FPumpRudderIndicator[6];
  ImgSTOP3.Visible  := FPumpRudderIndicator[7];
  ImgASP3.Visible   := FPumpRudderIndicator[8];

  ImgRP4.Visible    := FPumpRudderIndicator[9];
  ImgSTOP4.Visible  := FPumpRudderIndicator[10];
  ImgASP4.Visible   := FPumpRudderIndicator[11];
end;

procedure TMainForm.SetTelegrap;
begin
  case TelegrapStatus of
    tsReceive :
    begin
      if (IdReceive <> (vrPsTelegrap.SwitchPosition + 1))then
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

procedure TMainForm.vrPsPumpChange(Sender: TObject);
var
  i : Integer;
  stateIdTemp : Integer;

begin
  case TVrRotarySwitch(Sender).Tag of
    1:
    begin
      for i := 0 to 2 do
      begin
        case i of
          0 : stateIdTemp := C_PUMP_CPP_HYDRAULIC_STANDBY;
          1 : stateIdTemp := C_PUMP_CPP_HYDRAULIC_STOP;
          2 : stateIdTemp := C_PUMP_CPP_HYDRAULIC_START;
        end;

        if vrPsPump1.SwitchPosition = i then
          MCRMachineLeftSystem.sendPumpStatus(1, TVrRotarySwitch(Sender).Tag, stateIdTemp, vrPsPump1.SwitchPosition = i);
      end;
    end;
    2:
    begin
      for i := 0 to 2 do
      begin
        case i of
          0 : stateIdTemp := C_PUMP_CPP_HYDRAULIC_STANDBY;
          1 : stateIdTemp := C_PUMP_CPP_HYDRAULIC_STOP;
          2 : stateIdTemp := C_PUMP_CPP_HYDRAULIC_START;
        end;

        if vrPsPump2.SwitchPosition = i then
          MCRMachineLeftSystem.sendPumpStatus(1, TVrRotarySwitch(Sender).Tag, stateIdTemp, vrPsPump2.SwitchPosition = i);
      end;
    end;
    3:
    begin
      for i := 0 to 2 do
      begin
        case i of
          0 : stateIdTemp := C_PUMP_CPP_HYDRAULIC_STANDBY;
          1 : stateIdTemp := C_PUMP_CPP_HYDRAULIC_STOP;
          2 : stateIdTemp := C_PUMP_CPP_HYDRAULIC_START;
        end;

        if vrPsPump3.SwitchPosition = i then
          MCRMachineLeftSystem.sendPumpStatus(1, TVrRotarySwitch(Sender).Tag, stateIdTemp, vrPsPump3.SwitchPosition = i);
      end;
    end;
  end;
end;

procedure TMainForm.vrSbPumpChange(Sender: TObject);
var
  i : Integer;
  stateIdTemp : Integer;

begin
  case TVrRotarySwitch(Sender).Tag of
    1:
    begin
      for i := 0 to 2 do
      begin
        case i of
          0 : stateIdTemp := C_PUMP_CPP_HYDRAULIC_STANDBY;
          1 : stateIdTemp := C_PUMP_CPP_HYDRAULIC_STOP;
          2 : stateIdTemp := C_PUMP_CPP_HYDRAULIC_START;
        end;

        if vrSbPump1.SwitchPosition = i then
          MCRMachineLeftSystem.sendPumpStatus(2, TVrRotarySwitch(Sender).Tag, stateIdTemp, vrSbPump1.SwitchPosition = i);
      end;
    end;
    2:
    begin
      for i := 0 to 2 do
      begin
        case i of
          0 : stateIdTemp := C_PUMP_CPP_HYDRAULIC_STANDBY;
          1 : stateIdTemp := C_PUMP_CPP_HYDRAULIC_STOP;
          2 : stateIdTemp := C_PUMP_CPP_HYDRAULIC_START;
        end;

        if vrSbPump2.SwitchPosition = i then
          MCRMachineLeftSystem.sendPumpStatus(2, TVrRotarySwitch(Sender).Tag, stateIdTemp, vrSbPump2.SwitchPosition = i);
      end;
    end;
    3:
    begin
      for i := 0 to 2 do
      begin
        case i of
          0 : stateIdTemp := C_PUMP_CPP_HYDRAULIC_STANDBY;
          1 : stateIdTemp := C_PUMP_CPP_HYDRAULIC_STOP;
          2 : stateIdTemp := C_PUMP_CPP_HYDRAULIC_START;
        end;

        if vrSbPump3.SwitchPosition = i then
          MCRMachineLeftSystem.sendPumpStatus(2, TVrRotarySwitch(Sender).Tag, stateIdTemp, vrSbPump3.SwitchPosition = i);
      end;
    end;
  end;
end;

procedure TMainForm.vrPsTelegrapChange(Sender: TObject);
begin

  case TelegrapStatus of
    tsSend :
    begin
      {$REGION ' Pd saat kita mengirim pesan '}
      GetIdBlinkTelegrapLamp(TVrRotarySwitch(Sender).SwitchPosition + 1);
      tmrTelegraph.Enabled := True;

      MCRMachineLeftSystem.sendTelegram(epBoardTelegramKiri, TVrRotarySwitch(Sender).SwitchPosition + 1, True, Ord(tsSend));
      {$ENDREGION}
    end;
    tsReply :
    begin
      {$REGION ' Pd saat kita membalas pesan '}
      if (IdReceive <> (vrPsTelegrap.SwitchPosition + 1))then
        exit;

      GetIdBlinkTelegrapLamp(TVrRotarySwitch(Sender).SwitchPosition + 1);
      TImage(Components[FIdBlink]).Visible := True;

      tmrTelegraph.Enabled := False;

      MCRMachineLeftSystem.sendTelegram(epBoardTelegramKiri, TVrRotarySwitch(Sender).SwitchPosition + 1, True, Ord(tsReply));

      {mengubah status dari penerima ke siap mengirim lagi}
      TelegrapStatus := tsSend;
      {$ENDREGION}
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

procedure TMainForm.imgSTShadowMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ImgST.Visible := False;
  SetAlarmIndicator;
end;

procedure TMainForm.MCRMachineLeftSystemEvent(Sender: TObject; PropsID: E_PropsID; Value: Boolean);
begin
  case PropsID of
    epPCSCPPPumpStandby1PS :
    begin
      {$REGION ' CPP Pump 1 Standby '}
      FPsPump1[0] := Value;
      SetHidroulicPump;

      if Value then
        vrPsPump1.SwitchPosition := 0;
      {$ENDREGION}
    end;
    epPCSCPPPumpStop1PS:
    begin
      {$REGION ' CPP Pump 1 Stop '}
      FPsPump1[1] := Value;
      SetHidroulicPump;

      if Value then
        vrPsPump1.SwitchPosition := 1;
      {$ENDREGION}
    end;
    epPCSCPPPumpStart1PS:
    begin
      {$REGION ' CPP Pump 1 Start '}
      FPsPump1[2] := Value;
      SetHidroulicPump;

      if Value then
        vrPsPump1.SwitchPosition := 2;
      {$ENDREGION}
    end;
    epPCSCPPPumpStandby2PS:
    begin
      {$REGION ' CPP Pump 2 Standby '}
      FPsPump2[0] := Value;
      SetHidroulicPump;

      if Value then
        vrPsPump2.SwitchPosition := 0;
      {$ENDREGION}
    end;
    epPCSCPPPumpStop2PS:
    begin
      {$REGION ' CPP Pump 2 Stop '}
      FPsPump2[1] := Value;
      SetHidroulicPump;

      if Value then
        vrPsPump2.SwitchPosition := 1;
      {$ENDREGION}
    end;
    epPCSCPPPumpStart2PS:
    begin
      {$REGION ' CPP Pump 2 Start '}
      FPsPump2[2] := Value;
      SetHidroulicPump;

      if Value then
        vrPsPump2.SwitchPosition := 2;
      {$ENDREGION}
    end;
    epPCSCPPPumpAuto3PS:
    begin
      {$REGION ' CPP Pump 3 Auto '}
      FPsPump3[0] := Value;
      SetHidroulicPump;

      if Value then
        vrPsPump3.SwitchPosition := 0;
      {$ENDREGION}
    end;
    epPCSCPPPumpStop3PS:
    begin
      {$REGION ' CPP Pump 3 Stop '}
      FPsPump3[1] := Value;
      SetHidroulicPump;

      if Value then
        vrPsPump3.SwitchPosition := 1;
      {$ENDREGION}
    end;
    epPCSCPPPumpStart3PS:
    begin
      {$REGION ' CPP Pump 3 Start '}
      FPsPump3[2] := Value;
      SetHidroulicPump;

      if Value then
        vrPsPump3.SwitchPosition := 2;
      {$ENDREGION}
    end;
    epPCSCPPPumpStandby1SB :
    begin
      {$REGION ' CPP Pump 1 Standby '}
      FSbPump1[0] := Value;
      SetHidroulicPump;

      if Value then
        vrSbPump1.SwitchPosition := 0;
      {$ENDREGION}
    end;
    epPCSCPPPumpStop1SB:
    begin
      {$REGION ' CPP Pump 1 Stop '}
      FSbPump1[1] := Value;
      SetHidroulicPump;

      if Value then
        vrSbPump1.SwitchPosition := 1;
      {$ENDREGION}
    end;
    epPCSCPPPumpStart1SB:
    begin
      {$REGION ' CPP Pump 1 Start '}
      FSbPump1[2] := Value;
      SetHidroulicPump;

      if Value then
        vrSbPump1.SwitchPosition := 2;
      {$ENDREGION}
    end;
    epPCSCPPPumpStandby2SB:
    begin
      {$REGION ' CPP Pump 2 Standby '}
      FSbPump2[0] := Value;
      SetHidroulicPump;

      if Value then
        vrSbPump2.SwitchPosition := 0;
      {$ENDREGION}
    end;
    epPCSCPPPumpStop2SB:
    begin
      {$REGION ' CPP Pump 2 Stop '}
      FSbPump2[1] := Value;
      SetHidroulicPump;

      if Value then
        vrSbPump2.SwitchPosition := 1;
      {$ENDREGION}
    end;
    epPCSCPPPumpStart2SB:
    begin
      {$REGION ' CPP Pump 2 Start '}
      FSbPump2[2] := Value;
      SetHidroulicPump;

      if Value then
        vrSbPump2.SwitchPosition := 2;
      {$ENDREGION}
    end;
    epPCSCPPPumpAuto3SB:
    begin
      {$REGION ' CPP Pump 3 Auto '}
      FSbPump3[0] := Value;
      SetHidroulicPump;

      if Value then
        vrSbPump3.SwitchPosition := 0;
      {$ENDREGION}
    end;
    epPCSCPPPumpStop3SB:
    begin
      {$REGION ' CPP Pump 3 Stop '}
      FSbPump3[1] := Value;
      SetHidroulicPump;

      if Value then
        vrSbPump3.SwitchPosition := 1;
      {$ENDREGION}
    end;
    epPCSCPPPumpStart3SB:
    begin
      {$REGION ' CPP Pump 3 Start '}
      FSbPump3[2] := Value;
      SetHidroulicPump;

      if Value then
        vrSbPump3.SwitchPosition := 2;
      {$ENDREGION}
    end;
  end;
end;

procedure TMainForm.MCRMachineLeftSystemEvent(Sender: TObject; PropsID: E_PropsID; Value: Integer);
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
        MCRMachineLeftSystem.FFormFreezed[0] := TfrmFreeze.Create(MainForm);
        with MCRMachineLeftSystem.FFormFreezed[0] do
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
        if Assigned(MCRMachineLeftSystem.FFormFreezed[0]) then
          FreeAndNil(MCRMachineLeftSystem.FFormFreezed[0]);
      end;
    end;
    epRudderValuePS:
    begin
      vraPsRudderServo.Position := abs(Value);
    end;
  end;
end;

procedure TMainForm.MCRMachineLeftSystemEvent(Sender: TObject; PropsID: E_PropsID; Value: Double);
begin
  case PropsID of
    epPCSMEActualSpeedPS:
    begin
      OrderMESpeed := Value;
      tmrMeSpeed.Enabled := True;
    end;

    epPCSGBShaftSpeedPS:
    begin
      OrderShaftSpeed := Value;
      tmrShaftSpeed.Enabled := True;
    end;

    epPCSCPPActualPitchPS:
    begin
      OrderCPP := Value;
      tmrCPP.Enabled := True;
    end;
  end;
end;

end.
