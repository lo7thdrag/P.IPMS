unit uGeneralPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, ImgList, Buttons, StdCtrls, SpeedButtonImage,
  TFlatSpeedButtonUnit, uDataType, uListener, ComCtrls, uFreezeFrom;

type
  Tfrm_GeneralPanel = class(TForm)
    pnlGeneralPanel: TPanel;
    imgPCS_GeneralPanel: TImage;
    lbl1_General: TLabel;
    lbl_Increase_Left: TLabel;
    imgAlarmAccept: TImage;
    imgStopHorn: TImage;
    imgNone_1: TImage;
    imgLampTest: TImage;
    imgMCR_PS: TImage;
    imgMCR_SB: TImage;
    imgBridge_PS: TImage;
    imgBridge_SB: TImage;
    imgNone_2: TImage;
    imgNone_3: TImage;
    imgNone_4: TImage;
    imgNone_5: TImage;
    imgNone_6: TImage;
    imgTransit: TImage;
    imgManouvre: TImage;
    imgNone_7: TImage;
    imgNone_8: TImage;
    imgNone_9: TImage;
    imgNone_10: TImage;
    imgNone_11: TImage;
    lbl_Decrerase_Left: TLabel;
    lbl_Decrease_Right: TLabel;
    lbl_Increase_Right: TLabel;
    lbl_Indicator: TLabel;
    lblBackground: TLabel;
    lbl_Alarm_Accept: TLabel;
    lbl_Stop_Horn: TLabel;
    lbl_Lamp_Test: TLabel;
    lbl_Cntrl_Position: TLabel;
    lbl_Cntrl_Modes: TLabel;
    lbl_MCR_PS: TLabel;
    lbl_MCR_SB: TLabel;
    lbl_Bridge_PS: TLabel;
    lbl_Bridge_SB: TLabel;
    lbl_Manoeuvre: TLabel;
    lbl_Transit: TLabel;
    btnAlarm_Accept: TSpeedButtonImage;
    ilButton_Image: TImageList;
    btnStop_Horn: TSpeedButtonImage;
    btnLamp_Test: TSpeedButtonImage;
    btnIncrease_Left: TSpeedButtonImage;
    btnDecrease_Left: TSpeedButtonImage;
    btnDecrease_Right: TSpeedButtonImage;
    btnIncrease_Right: TSpeedButtonImage;
    btnMCR_PS: TSpeedButtonImage;
    btnMCR_SB: TSpeedButtonImage;
    btnBridge_PS: TSpeedButtonImage;
    btnBridge_SB: TSpeedButtonImage;
    btnTransit: TSpeedButtonImage;
    btnManoeuvre: TSpeedButtonImage;
    btnNone1: TSpeedButtonImage;
    btnNone2: TSpeedButtonImage;
    btnNone3: TSpeedButtonImage;
    btnNone4: TSpeedButtonImage;
    btnNone5: TSpeedButtonImage;
    btnNone6: TSpeedButtonImage;
    btnNone7: TSpeedButtonImage;
    btnNone8: TSpeedButtonImage;
    btnNone9: TSpeedButtonImage;
    btnNone10: TSpeedButtonImage;
    btnNone11: TSpeedButtonImage;
    iltest: TImageList;
    FlashingIndicator: TTimer;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender:TObject);
    procedure btnGeneralControlClick(Sender : TObject);
    procedure btnStop_HornClick(Sender: TObject);
    procedure btnIndicatorLampClick(Sender : TObject);
    procedure btnBackgroundLampClick(Sender : TObject);
    procedure btnMCRClick(Sender : TObject);
    procedure btnBridgeClick(Sender : TObject);
    procedure btnModeClick(Sender : TObject);
    procedure FlashingIndicatorTimer(Sender: TObject);
    procedure btnNoneMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnNoneMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnMouseUp(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
    procedure btnLamp_TestMouseDown(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
    procedure btnLamp_TestMouseUp(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
    procedure btnAlarm_AcceptClick(Sender: TObject);

  private
    { Private declarations }
    FAlarmAccept, FStopHorn, FMCR_PS, FMCR_SB, FBridge_PS, FBridge_SB, FTransit, FManouvre,
    FMCR_PS_Flashing, FMCR_SB_Flashing, FBridge_PS_Flashing, FBridge_SB_Flashing,
    FTransit_Flashing, FManouvre_Flashing : Boolean;

    FCounterTransit, FCounterManouvre, FCounterControlPS, FCounterControlSB : Integer;

    procedure PCSSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Integer);overload;
    procedure PCSSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Boolean);overload;

    procedure LocalMCRIndicator(aPortStarboard, aLocalMCR : string; aOnOff: Boolean);
    procedure LampTestIndicator(aOnOff: Integer);
    procedure BackgroundLampIndicator(aBrightness: Integer);

  public
    { Public declarations }
    picture_Path : string;
    fIndikatorOn, fIndikatorOn1, fIndikatorOn2, fIndikatorOn3, fIndikatorOn4, fIndikatorOn5,
    fIndikatorOff, fIndikatorFault : string;

    RemoteAutoCheck, FAlarmON : Boolean;

    //setting warna
    r, g, b : Byte;
    image_index : Integer;

    silence : Boolean;
  end;

var
  frm_GeneralPanel: Tfrm_GeneralPanel;

implementation

  uses uPCSSystem, uAlarmPCS;

{$R *.dfm}

procedure Tfrm_GeneralPanel.btnNoneMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case TSpeedButtonImage(Sender).Tag of
    1:
      imgNone_1.Picture.LoadFromFile(fIndikatorOn);
    2:
      imgNone_2.Picture.LoadFromFile(fIndikatorOn);
    3:
      imgNone_3.Picture.LoadFromFile(fIndikatorOn);
    4:
      imgNone_4.Picture.LoadFromFile(fIndikatorOn);
    5:
      imgNone_5.Picture.LoadFromFile(fIndikatorOn);
    6:
      imgNone_6.Picture.LoadFromFile(fIndikatorOn);
    7:
      imgNone_7.Picture.LoadFromFile(fIndikatorOn);
    8:
      imgNone_8.Picture.LoadFromFile(fIndikatorOn);
    9:
      imgNone_9.Picture.LoadFromFile(fIndikatorOn);
    10:
      imgNone_10.Picture.LoadFromFile(fIndikatorOn);
    11:
      imgNone_11.Picture.LoadFromFile(fIndikatorOn);
  end;
end;

procedure Tfrm_GeneralPanel.btnNoneMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case TSpeedButtonImage(Sender).Tag of
    1:
      imgNone_1.Picture.LoadFromFile(fIndikatorOff);
    2:
      imgNone_2.Picture.LoadFromFile(fIndikatorOff);
    3:
      imgNone_3.Picture.LoadFromFile(fIndikatorOff);
    4:
      imgNone_4.Picture.LoadFromFile(fIndikatorOff);
    5:
      imgNone_5.Picture.LoadFromFile(fIndikatorOff);
    6:
      imgNone_6.Picture.LoadFromFile(fIndikatorOff);
    7:
      imgNone_7.Picture.LoadFromFile(fIndikatorOff);
    8:
      imgNone_8.Picture.LoadFromFile(fIndikatorOff);
    9:
      imgNone_9.Picture.LoadFromFile(fIndikatorOff);
    10:
      imgNone_10.Picture.LoadFromFile(fIndikatorOff);
    11:
      imgNone_11.Picture.LoadFromFile(fIndikatorOff);
  end;
end;

procedure Tfrm_GeneralPanel.btnModeClick(Sender: TObject);
begin
  if RemoteAutoCheck then
  begin
    if TSpeedButtonImage(Sender).Hint = 'Manouvre' then
    begin
      FManouvre_Flashing := True;
      imgManouvre.Picture.LoadFromFile(fIndikatorOn);
      PCSSystem.Mode(True);
    end
    else if TSpeedButtonImage(Sender).Hint = 'Transit' then
    begin
      FTransit_Flashing := True;
      imgTransit.Picture.LoadFromFile(fIndikatorOn);
      PCSSystem.Mode(False);
    end;
  end;
end;

procedure Tfrm_GeneralPanel.btnMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case TSpeedButtonImage(Sender).Tag of
    1:
      imgAlarmAccept.Picture.LoadFromFile(fIndikatorOn);
    2:
      imgStopHorn.Picture.LoadFromFile(fIndikatorOn);
  end;
end;

procedure Tfrm_GeneralPanel.btnMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case TSpeedButtonImage(Sender).Tag of
    1:
      imgAlarmAccept.Picture.LoadFromFile(fIndikatorOff);
    2:
      imgStopHorn.Picture.LoadFromFile(fIndikatorOff);
  end;
end;

procedure Tfrm_GeneralPanel.BackgroundLampIndicator(aBrightness: Integer);
begin
  if aBrightness = 1 then
  begin
    if b <> 0 then
    begin
      b := b - 51;
    end;
    color := RGB (r, g, b);
  end
  else
  if aBrightness = -1 then
  begin
    if b <> 255 then
    begin
      b := b + 51;
    end;
    color := RGB (r, g, b);
  end
  else
    Exit;

  lbl_Alarm_Accept.Font.Color := color;
  lbl_Stop_Horn.Font.Color    := color;
  lbl_Lamp_Test.Font.Color    := Color;
  lbl_MCR_PS.Font.Color       := color;
  lbl_MCR_SB.Font.Color       := color;
  lbl_Bridge_PS.Font.Color    := color;
  lbl_Bridge_SB.Font.Color    := color;
  lbl_Transit.Font.Color      := color;
  lbl_Manoeuvre.Font.Color    := color;
  lbl_Increase_Left.Font.Color     := color;
  lbl_Increase_Right.Font.Color    := color;
  lbl_Decrerase_Left.Font.Color    := color;
  lbl_Decrease_Right.Font.Color    := color;
  lbl_Indicator.Font.Color    := color;
  lblBackground.Font.Color    := color;
  lbl1_General.Font.Color     := color;
  lbl_Cntrl_Position.Font.Color := color;
  lbl_Cntrl_Modes.Font.Color := color;
end;

procedure Tfrm_GeneralPanel.btnAlarm_AcceptClick(Sender: TObject);
begin
  PCSSystem.GeneralControl(C_ORD_CTRL_ALARMACCEPT,True);
end;

procedure Tfrm_GeneralPanel.btnBackgroundLampClick(Sender: TObject);
begin
  if TSpeedButtonImage(Sender).Hint = 'Increase' then
    PCSSystem.BackgroundLamp(True)
  else if TSpeedButtonImage(Sender).Hint = 'Decrease' then
    PCSSystem.BackgroundLamp(False);
end;

procedure Tfrm_GeneralPanel.btnBridgeClick(Sender: TObject);
begin
  if TSpeedButtonImage(Sender).Hint = 'PS' then
  begin
    if FMCR_PS then
    begin
      FBridge_PS_Flashing := True;
      imgBridge_PS.Picture.LoadFromFile(fIndikatorOn);
      PCSSystem.MCRBridge(C_PCS_ME_PORTS,False);
    end;
  end
  else if TSpeedButtonImage(Sender).Hint = 'SB' then
  begin
    if FMCR_SB then
    begin
      FBridge_SB_Flashing := True;
      imgBridge_SB.Picture.LoadFromFile(fIndikatorOn);
      PCSSystem.MCRBridge(C_PCS_ME_STARBOARD,False);
    end;
  end;
end;

procedure Tfrm_GeneralPanel.btnGeneralControlClick(Sender: TObject);
begin
  if TSpeedButtonImage(Sender).Hint = 'Alarm Accept' then
  begin
    PCSSystem.GeneralControl(C_ORD_CTRL_ALARMACCEPT, True);
    frmPCSAlarm.StopAlarmSound(True);
  end
  else if TSpeedButtonImage(Sender).Hint = 'Stop Horn' then
  begin
    FStopHorn := True;
    PCSSystem.GeneralControl(C_ORD_CTRL_STOPHORN, True);
  end;
end;

procedure Tfrm_GeneralPanel.btnIndicatorLampClick(Sender: TObject);
begin
//  if TSpeedButtonImage(Sender).Hint = 'Increase' then
//  begin
//    if image_index <= 4 then
//    begin
//      Inc(image_index);
//    end;
//  end
//  else if TSpeedButtonImage(Sender).Hint = 'Decrease' then
//  begin
//    if b <> 255 then
//    begin
//      b := b + 51;
//    end;
//    color := RGB (r, g, b);
//  end;
end;

procedure Tfrm_GeneralPanel.btnLamp_TestMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  PCSSystem.GeneralControl(C_ORD_CTRL_LAMPTEST,True);
end;

procedure Tfrm_GeneralPanel.btnLamp_TestMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  PCSSystem.GeneralControl(C_ORD_CTRL_LAMPTEST,False);
end;

procedure Tfrm_GeneralPanel.btnMCRClick(Sender: TObject);
begin
  if TSpeedButtonImage(Sender).Hint = 'PS' then
  begin
    if FMCR_PS then
    begin
      FMCR_PS_Flashing := True;
      imgMCR_PS.Picture.LoadFromFile(fIndikatorOn);
      PCSSystem.MCRBridge(C_PCS_ME_PORTS,True);
    end;
  end
  else if TSpeedButtonImage(Sender).Hint = 'SB' then
  begin
    if FMCR_SB then
    begin
      FMCR_SB_Flashing := True;
      imgMCR_SB.Picture.LoadFromFile(fIndikatorOn);
      PCSSystem.MCRBridge(C_PCS_ME_STARBOARD,True);
    end;
  end;
end;

procedure Tfrm_GeneralPanel.btnStop_HornClick(Sender: TObject);
begin
  PCSSystem.GeneralControl(C_ORD_CTRL_STOPHORN,True);
//  frmPCSAlarm.StopAlarmSound(True);
end;

procedure Tfrm_GeneralPanel.FlashingIndicatorTimer(Sender: TObject);
begin
  if FStopHorn then
  begin
//    mpAlarmPCS.Stop;
//    mpAlarmPCS.Close;
    FStopHorn := False;
  end;

  if FBridge_PS_Flashing then
  begin
    FCounterControlPS := FCounterControlPS + 1;

    if FCounterControlPS < 5 then
    begin
      if imgBridge_PS.Visible = True then
        imgBridge_PS.Visible := False
      else
        imgBridge_PS.Visible := True;
    end;

    if FCounterControlPS > 5 then
    begin
      if FBridge_PS = true then
      begin
        imgBridge_PS.Picture.LoadFromFile(fIndikatorOn);
        FBridge_PS := False;
        imgMCR_PS.Picture.LoadFromFile(fIndikatorOff);
      end
      else
        imgBridge_PS.Picture.LoadFromFile(fIndikatorOff);
      FCounterControlPS := 0;
      FBridge_PS_Flashing := False;
    end;
  end;

  if FBridge_SB_Flashing then
  begin
    FCounterControlSB := FCounterControlSB + 1;

    if FCounterControlSB < 5 then
    begin
      if imgBridge_SB.Visible then
        imgBridge_SB.Visible := False
      else
        imgBridge_SB.Visible := True;
    end;

    if FCounterControlSB > 5 then
    begin
      if FBridge_SB = true then
        begin
          imgBridge_SB.Picture.LoadFromFile(fIndikatorOn);
          FBridge_SB := False;
          imgMCR_SB.Picture.LoadFromFile(fIndikatorOff);
        end
      else
        imgBridge_SB.Picture.LoadFromFile(fIndikatorOff);
      FCounterControlSB := 0;
      FBridge_SB_Flashing := False;
    end;
  end;

  if FTransit_Flashing then
  begin
    FCounterTransit := FCounterTransit + 1;

    if FCounterTransit < 5 then
    begin
      if imgTransit.Visible = True then
        imgTransit.Visible := False
      else
        imgTransit.Visible := True;
    end;

    if FCounterTransit > 5 then
    begin
      if FTransit then
        begin
          imgTransit.Picture.LoadFromFile(fIndikatorOn);
          FManouvre := False;
          imgManouvre.Picture.LoadFromFile(fIndikatorOff);
        end
      else
        imgTransit.Picture.LoadFromFile(fIndikatorOff);
      FCounterTransit := 0;
      FTransit_Flashing := False;
    end;
  end;

  if FManouvre_Flashing then
  begin
    FCounterManouvre := FCounterManouvre + 1;

    if FCounterManouvre < 5 then
    begin
      if imgManouvre.Visible = True then
        imgManouvre.Visible := False
      else
        imgManouvre.Visible := True;
    end;

    if FCounterManouvre > 5 then
    begin
      if RemoteAutoCheck then
      begin
        imgManouvre.Picture.LoadFromFile(fIndikatorOn);
        FTransit := False;
        imgTransit.Picture.LoadFromFile(fIndikatorOff);
      end
      else
        imgManouvre.Picture.LoadFromFile(fIndikatorOff);
      FCounterManouvre := 0;
      FManouvre_Flashing := False;
    end;
  end;
end;

procedure Tfrm_GeneralPanel.FormCreate(Sender: TObject);
begin
  with PCSSystem.Listener.Add('CONTROL') as TPropertyEventListener do begin
      OnPropertyIntChange := PCSSystemEvent;
      OnPropertyBoolChange := PCSSystemEvent;
  end;

  FCounterTransit := 0;
  FCounterManouvre := 0;
  FCounterControlPS := 0;
  FCounterControlSB := 0;

  silence := False;

  picture_Path    := Copy(ExtractFilePath(Application.ExeName),1,length(ExtractFilePath(Application.ExeName))-4);
  fIndikatorOn    := picture_Path + 'bin\Images\Image MCR\IPMS_lampu_indikator_green.bmp';
  fIndikatorOn1    := picture_Path + 'bin\Images\Image MCR\IPMS_lampu_indikator_green1';
  fIndikatorOn2    := picture_Path + 'bin\Images\Image MCR\IPMS_lampu_indikator_green2';
  fIndikatorOn3    := picture_Path + 'bin\Images\Image MCR\IPMS_lampu_indikator_green3';
  fIndikatorOn4    := picture_Path + 'bin\Images\Image MCR\IPMS_lampu_indikator_green4';
  fIndikatorOn5    := picture_Path + 'bin\Images\Image MCR\IPMS_lampu_indikator_green5';
  fIndikatorOff   := picture_Path + 'bin\Images\Image MCR\IPMS_lampu_indikator.bmp';
  fIndikatorFault := picture_Path + 'bin\Images\Image MCR\IPMS_lampu_indikator_red.bmp';
end;

procedure Tfrm_GeneralPanel.FormShow(Sender: TObject);
begin
  r := 255;
  g := 255;
  b := 255;
  image_index := 0;
end;

procedure Tfrm_GeneralPanel.LampTestIndicator(aOnOff: Integer);
var
  i: Integer;
begin
  if aOnOff = 10 then
  begin
    imgAlarmAccept.Picture.LoadFromFile(fIndikatorOn);
    imgStopHorn.Picture.LoadFromFile(fIndikatorOn);
    imgLampTest.Picture.LoadFromFile(fIndikatorOn);
    imgMCR_PS.Picture.LoadFromFile(fIndikatorOn);
    imgMCR_SB.Picture.LoadFromFile(fIndikatorOn);
    imgBridge_PS.Picture.LoadFromFile(fIndikatorOn);
    imgBridge_SB.Picture.LoadFromFile(fIndikatorOn);
    imgTransit.Picture.LoadFromFile(fIndikatorOn);
    imgManouvre.Picture.LoadFromFile(fIndikatorOn);
    for i := 1 to 11 do
    begin
      TImage(FindComponent('imgNone_'+IntToStr(i))).Picture.LoadFromFile(fIndikatorOn);
    end;
  end
  else if aOnOff = 0 then
  begin
    if not FAlarmAccept then
      imgAlarmAccept.Picture.LoadFromFile(fIndikatorOff);
    if not FStopHorn then
      imgStopHorn.Picture.LoadFromFile(fIndikatorOff);
    imgLampTest.Picture.LoadFromFile(fIndikatorOff);
    if not FMCR_PS then
      imgMCR_PS.Picture.LoadFromFile(fIndikatorOff);
    if not FMCR_SB then
      imgMCR_SB.Picture.LoadFromFile(fIndikatorOff);
    if not FBridge_PS then
      imgBridge_PS.Picture.LoadFromFile(fIndikatorOff);
    if not FBridge_SB then
      imgBridge_SB.Picture.LoadFromFile(fIndikatorOff);
    if not FTransit then
      imgTransit.Picture.LoadFromFile(fIndikatorOff);
    if not FManouvre then
      imgManouvre.Picture.LoadFromFile(fIndikatorOff);
    for i := 1 to 11 do
    begin
      TImage(FindComponent('imgNone_'+IntToStr(i))).Picture.LoadFromFile(fIndikatorOff);
    end;
  end;
end;

procedure Tfrm_GeneralPanel.LocalMCRIndicator(aPortStarboard, aLocalMCR: string;
  aOnOff: Boolean);
begin
  if aPortStarboard = C_PCS_PORTS then
  begin
    if aLocalMCR = 'Local' then
    begin
      imgMCR_PS.Picture.LoadFromFile(fIndikatorOff);
      FMCR_PS := not aOnOff;
    end
    else if aLocalMCR = 'MCR' then
    begin
      imgMCR_PS.Picture.LoadFromFile(fIndikatorOn);
      FMCR_PS := aOnOff;
    end;
  end
  else if aPortStarboard = C_PCS_STARBOARD then
  begin
    if aLocalMCR = 'Local' then
    begin
      imgMCR_SB.Picture.LoadFromFile(fIndikatorOff);
      FMCR_SB := not aOnOff;
    end
    else if aLocalMCR = 'MCR' then
    begin
      imgMCR_SB.Picture.LoadFromFile(fIndikatorOn);
      FMCR_SB := aOnOff;
    end;
  end;
end;

procedure Tfrm_GeneralPanel.PCSSystemEvent(Sender: TObject; PropsID: E_PropsID;
  Value: Boolean);
begin
  case PropsID of
    epPCSCtrlLocalPS:
      if Value then
        LocalMCRIndicator(C_PCS_PORTS,'Local',Value);

    epPCSCtrlLocalSB:
      if Value then
        LocalMCRIndicator(C_PCS_STARBOARD,'Local',Value);

    epPCSCtrlMCRPS:
      if Value then
        LocalMCRIndicator(C_PCS_PORTS,'MCR',Value);

    epPCSCtrlMCRSB:
      if Value then
        LocalMCRIndicator(C_PCS_STARBOARD,'MCR',Value);

    epPCSCtrlBridgePS:
      if Value then
      begin
        imgBridge_PS.Picture.LoadFromFile(fIndikatorOn);
        FBridge_PS := Value;
      end
      else
      begin
        imgBridge_PS.Picture.LoadFromFile(fIndikatorOff);
        FBridge_PS := not Value;
      end;

    epPCSCtrlBridgeSB:
      if Value then
      begin
        imgBridge_SB.Picture.LoadFromFile(fIndikatorOn);
        FBridge_SB := Value;
      end
      else
      begin
        imgBridge_SB.Picture.LoadFromFile(fIndikatorOff);
        FBridge_SB := not Value;
      end;

    epPCSMETransitMode:
      if Value then
      begin
        FTransit := Value;
        FManouvre := not Value;
        imgTransit.Picture.LoadFromFile(fIndikatorOn);
        imgManouvre.Picture.LoadFromFile(fIndikatorOff);
      end
      else
      begin
//        imgTransit.Picture.LoadFromFile(fIndikatorOff);
        FTransit := not Value;
      end;

    epPCSMEManouveringMode:
      if Value then
      begin
        FTransit := not Value;
        FManouvre := Value;
        imgTransit.Picture.LoadFromFile(fIndikatorOff);
        imgManouvre.Picture.LoadFromFile(fIndikatorOn);
      end
      else
      begin
//        imgManouvre.Picture.LoadFromFile(fIndikatorOff);
        FManouvre := not Value;
      end;

    epPCSMEPSRemoteAuto, epPCSMESBRemoteAuto:
      if Value then
        RemoteAutoCheck := Value
      else
        RemoteAutoCheck := not Value;

    epPCSMEFailurePS, epPCSMEFailureSB, epPCSGBFailurePS, epPCSGBFailureSB,
    epPCSCPPFailurePS, epPCSCPPFailureSB, epPCSGBShaftPowerLimitedPS, epPCSGBShaftPowerLimitedSB,
    epPCSGBShaftLockedPS, epPCSGBShaftLockedSB, epPCSAlarmsPS, epPCSAlarmsSB:
    begin
      if Value and FAlarmOn then
        frmPCSAlarm.PlayAlarmSound;
    end;

    epPCSCtrlStopHorn, epPCSCtrlAlarmAccept:
    begin
      if Value then
        frmPCSAlarm.StopAlarmSound(True);
    end;
  end;
end;

procedure Tfrm_GeneralPanel.PCSSystemEvent(Sender: TObject; PropsID: E_PropsID;
  Value: Integer);
var
  color : TColor;
  i : Integer;
begin
  case PropsID of
    epPCSFreezed:
      if Value = 1 then
      begin
        frm_GeneralPanel.Enabled := False;
        PCSSystem.FFormFreezed[0] := TfrmFreeze.Create(frm_GeneralPanel);
        with PCSSystem.FFormFreezed[0] do
        begin
          Parent := frm_GeneralPanel;
          Position := poOwnerFormCenter;
          BringToFront;
          Show;
        end;
      end
      else if Value = 0 then
      begin
        frm_GeneralPanel.Enabled := True;
        if Assigned(PCSSystem.FFormFreezed[0]) then
          FreeAndNil(PCSSystem.FFormFreezed[0]);
      end;

    epPCSCtrlBackgroundLamp:
      BackgroundLampIndicator(Value);

    epPCSCtrlLamptTest:
      LampTestIndicator(Value);
  end;
end;

end.
