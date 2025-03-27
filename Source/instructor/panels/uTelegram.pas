unit uTelegram;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, uAlarmRudderClass, StdCtrls , uDataType, uInstructorPanel,
  VrControls, VrRotarySwitch;

type
  TfrmTelegram = class(TForm)
    tmrKanan: TTimer;
    tmrKiri: TTimer;
    lbl28: TLabel;
    lbl29: TLabel;
    lbl30: TLabel;
    lbl31: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    lbl2: TLabel;
    lbl1: TLabel;
    pnlPort: TPanel;
    pnlStarboard: TPanel;
    grpTelegrapPS: TGroupBox;
    lbl3: TLabel;
    imgpsimgtelegrapps: TImage;
    imgps1: TImage;
    imgps2: TImage;
    imgps3: TImage;
    imgps4: TImage;
    imgps5: TImage;
    imgps6: TImage;
    imgps7: TImage;
    imgps8: TImage;
    imgps9: TImage;
    imgps10: TImage;
    imgps11: TImage;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    RotarySwitchPS: TVrRotarySwitch;
    grpTelegrapSB: TGroupBox;
    lbl16: TLabel;
    imgtelegrapsb: TImage;
    imgsb1: TImage;
    imgsb2: TImage;
    imgsb3: TImage;
    imgsb4: TImage;
    imgsb5: TImage;
    imgsb6: TImage;
    imgsb7: TImage;
    imgsb8: TImage;
    imgsb9: TImage;
    imgsb10: TImage;
    imgsb11: TImage;
    lbl24: TLabel;
    lbl21: TLabel;
    lbl19: TLabel;
    lbl18: TLabel;
    lbl27: TLabel;
    lbl26: TLabel;
    lbl25: TLabel;
    lbl17: TLabel;
    lbl20: TLabel;
    lbl22: TLabel;
    lbl23: TLabel;
    RotarySwitchSB: TVrRotarySwitch;

    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tmrKananTimer(Sender: TObject);
    procedure tmrKiriTimer(Sender: TObject);
    procedure RotarySwitchSBChange(Sender: TObject);
    procedure RotarySwitchPSChange(Sender: TObject);
    procedure RecvTelegraph(ProsId : E_PropsID; i: Integer; val: Boolean);

  private
    FIsTimerFlagPS, FIsTimerFlagSB : Boolean;
    Alarm : TAlarmObj;
    IdBlinkPS, IdBlinkSB : Integer;

    procedure CekIdBlinkLamp(idSide, value : Integer);

  public
    PSStatus, SBStatus : Byte; {1:Kirim 2:Terima 3:Standby }
    SwitchPosSB, SwitchPosPS, tempkiri, tempkanan  : Integer;

  end;

var
  frmTelegram: TfrmTelegram;

implementation

uses uInstructorSystem;
{$R *.dfm}

procedure TfrmTelegram.RotarySwitchPSChange(Sender: TObject);
begin
  {Pd saat kita mengirim pesan}
  if PSStatus = 1 then
  begin
    CekIdBlinkLamp(1, TVrRotarySwitch(Sender).SwitchPosition + 1);
    tmrKiri.Enabled := True;
    Alarm.Status := 1
  end
  {Pd saat kita membalas pesan}
  else if PSStatus = 2 then
  begin
    if (tempkiri <> (TVrRotarySwitch(Sender).SwitchPosition + 1))then
      exit;

    {untuk membunuh menu telegraph yg kelap-kelip}
    frmInstructorPanel.btnPropBridge.Color := clBtnFace;
    frmInstructorPanel.tmrTelegrap.Enabled := False;

    tmrKiri.Enabled := False;
    TImage(Components[IdBlinkPS]).Visible := True;

    {mengubah status dari penerima ke siap mengirim lagi}
    PSStatus := 1;
    Alarm.Status := 2;
  end;

  with Alarm do
  begin
    props := epBoardTelegramKiri;
    Value := true;
    aID   := TVrRotarySwitch(Sender).SwitchPosition + 1;
  end;

  InstructorSys.ClassAlarm.setLamp(Alarm);
end;

procedure TfrmTelegram.RotarySwitchSBChange(Sender: TObject);
begin
  {Pd saat kita mengirim pesan}
  if SBStatus = 1 then
  begin
    CekIdBlinkLamp(2, TVrRotarySwitch(Sender).SwitchPosition + 1);
    tmrKanan.Enabled := True;
    Alarm.Status := 1
  end
  {Pd saat kita membalas pesan}
  else if SBStatus = 2 then
  begin
    if (tempkanan <> (TVrRotarySwitch(Sender).SwitchPosition + 1))then
      exit;

    {untuk membunuh menu telegraph yg kelap-kelip}
    frmInstructorPanel.btnPropBridge.Color := clBtnFace;
    frmInstructorPanel.tmrTelegrap.Enabled := False;

    tmrKanan.Enabled := False;
    TImage(Components[IdBlinkSB]).Visible := True;

    {mengubah status dari penerima ke siap mengirim lagi}
    SBStatus := 1;
    Alarm.Status := 2;
  end;

  with Alarm do
  begin
    props := epBoardTelegramKanan;
    Value := true;
    aID   := TVrRotarySwitch(Sender).SwitchPosition + 1;
  end;

  InstructorSys.ClassAlarm.setLamp(Alarm);
end;

procedure TfrmTelegram.tmrKananTimer(Sender: TObject);
begin
  if FIsTimerFlagSB then
  begin
    TImage(Components[IdBlinkSB]).Visible := True;
    FIsTimerFlagSB := False;
  end
  else
  begin
    TImage(Components[IdBlinkSB]).Visible := False;
    FIsTimerFlagSB := True;
  end;
end;

procedure TfrmTelegram.tmrKiriTimer(Sender: TObject);
begin
  if FIsTimerFlagPS then
  begin
    TImage(Components[IdBlinkPS]).Visible := True;
    FIsTimerFlagPS := False;
  end
  else
  begin
    TImage(Components[IdBlinkPS]).Visible := False;
    FIsTimerFlagPS := True;
  end;
end;

procedure TfrmTelegram.CekIdBlinkLamp(idSide, value : Integer);
var
  i : Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TImage then
    begin

      case idSide of
        1: {Port Side}
        begin
          if ((TImage(Components[i]).Tag > 0)) and ((TImage(Components[i]).Tag < 12)) then
          begin
            TImage(Components[i]).Visible := False;

            if (TImage(Components[i]).Tag = value ) then
            begin
              IdBlinkPS := i;
            end;
          end;
        end;

        2: {Starboard Side}
        begin
          if ((TImage(Components[i]).Tag > 20)) and ((TImage(Components[i]).Tag < 32)) then
          begin
            TImage(Components[i]).Visible := False;

            if (TImage(Components[i]).Tag = (value + 20)) then
            begin
              IdBlinkSB := i;
            end;
          end;
        end;
      end;
    end;
  end;
end;

Procedure TfrmTelegram.FormCreate(Sender: TObject);
begin
  PSStatus := 1;
  SBStatus := 1;
  Alarm := TAlarmObj.Create;
end;

procedure TfrmTelegram.FormDestroy(Sender: TObject);
begin
  Alarm.Free;
end;

procedure TfrmTelegram.RecvTelegraph(ProsId: E_PropsID; i: Integer; val: Boolean);
begin
  if ProsId = epBoardTelegramKiri then
  begin
    if PSStatus = 1 then
    begin
      {Pd saat menerima kiriman}
      PSStatus := 2;
      tempkiri := i;
      CekIdBlinkLamp(1,i);

      tmrKiri.Enabled := True;
      frmInstructorPanel.tmrTelegrap.Enabled := True;
    end
    else
    begin
      {Pd saat menerima balasan yg kita kirim}
      PSStatus := 1;
      tmrKiri.Enabled := False;
      TImage(Components[IdBlinkPS]).Visible := True;
    end;
  end;

  if ProsId = epBoardTelegramKanan then
  begin
    if SBStatus = 1 then
    begin
      {Pd saat menerima kiriman}
      SBStatus := 2;
      tempkanan := i;
      CekIdBlinkLamp(2,i);

      tmrKanan.Enabled := True;
      frmInstructorPanel.tmrTelegrap.Enabled := True;
    end
    else
    begin
      {Pd saat menerima balasan yg kita kirim}
      SBStatus := 1;
      tmrKanan.Enabled := False;
      TImage(Components[IdBlinkSB]).Visible := True;
    end;
  end;
end;

end.
