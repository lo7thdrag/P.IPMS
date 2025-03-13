unit uSBPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, ImgList, Buttons, SpeedButtonImage,
  uDataType, uListener, uFreezeFrom;

type
  TfrmSBPanel = class(TForm)
    pnlSBPanel: TPanel;
    imgSBPanel: TImage;
    imgME_FailureSB: TImage;
    imgGB_FailureSB: TImage;
    imgCPP_FailureSB: TImage;
    imgNone_3: TImage;
    imgShaft_Power_LimitedSB: TImage;
    imgShaft_LockedSB: TImage;
    imgPCS_AlarmSB: TImage;
    imgNone_4: TImage;
    imgClutch_InSB: TImage;
    imgClutch_OutSB: TImage;
    imgReady_For_Use_Clutch_SB: TImage;
    imgLocal_Clutch_SB: TImage;
    imgClutch_AllowedSB: TImage;
    imgNone_5: TImage;
    imgRemote_Auto_Clutch_SB: TImage;
    imgRemote_Manual_Clutch_SB: TImage;
    imgIncr_SpeedSB: TImage;
    imgReady_For_Use_ME_SB: TImage;
    imgRunning_StartSB: TImage;
    imgRemote_Auto_ME_SB: TImage;
    imgDecr_SpeedSB: TImage;
    imgLocal_ME_SB: TImage;
    imgStoped_StopSB: TImage;
    imgRemote_Manual_ME_SB: TImage;
    imgPitch_AH_SB: TImage;
    imgPitch_AS_SB: TImage;
    imgReady_For_Use_CPP_SB: TImage;
    imgLocal_CPP_SB: TImage;
    imgNone_1: TImage;
    imgNone_2: TImage;
    imgRemote_Auto_CPP_SB: TImage;
    imgRemote_Manual_CPP_SB: TImage;
    lbl_Alarm_SB: TLabel;
    lbl_ME_FailureSB: TLabel;
    lbl_GB_FailureSB: TLabel;
    lbl_CPP_FailureSB: TLabel;
    lbl_Shaft_Power_LimitedSB: TLabel;
    lbl_Shaft_LockedSB: TLabel;
    lbl_PCS_AlarmSB: TLabel;
    lbl_Clutch_GB_SB: TLabel;
    lbl_Clutch_InSB: TLabel;
    lbl_Clutch_OutSB: TLabel;
    lbl_Ready_For_Use_Clutch_SB: TLabel;
    lbl_Local_CPP_SB: TLabel;
    lbl_Clutch_AllowedSB: TLabel;
    lbl_Remote_Auto_Clutch_SB: TLabel;
    lbl_Remote_Manual_Clutch_SB: TLabel;
    lbl_ME_SB: TLabel;
    lbl_Incr_SpeedSB: TLabel;
    lbl_Ready_For_Use_ME_SB: TLabel;
    lbl_Decr_SpeedSB: TLabel;
    lbl_Local_ME_SB: TLabel;
    lbl_Running_StartSB: TLabel;
    lbl_Stopped_StopSB: TLabel;
    lbl_Remote_Auto_ME_SB: TLabel;
    lbl_Remote_Manual_ME_SB: TLabel;
    lbl_CPP_SB: TLabel;
    lbl_Pitch_AH_SB: TLabel;
    lbl_Pitch_AS_SB: TLabel;
    lbl_Ready_For_Use_CPP_SB: TLabel;
    lbl_Local_Clutch_SB: TLabel;
    lbl_Remote_Auto_CPP_SB: TLabel;
    lbl_Remote_Manual_CPP_SB: TLabel;
    btnIncr_SpeedSB: TSpeedButtonImage;
    ilButton_SB: TImageList;
    btnReady_For_Use_ME_SB: TSpeedButtonImage;
    btnRunning_Start_ME_SB: TSpeedButtonImage;
    btnRemote_Auto_ME_SB: TSpeedButtonImage;
    btnDecr_Speed_ME_SB: TSpeedButtonImage;
    btnLocal_ME_SB: TSpeedButtonImage;
    btnStopped_StopSB: TSpeedButtonImage;
    btnRemote_Manual_ME_SB: TSpeedButtonImage;
    btnPitch_AH_SB: TSpeedButtonImage;
    btnReady_For_Use_CPP_SB: TSpeedButtonImage;
    btnRemote_Auto_CPP_SB: TSpeedButtonImage;
    btnPitch_AS_SB: TSpeedButtonImage;
    btnLocal_CPP_SB: TSpeedButtonImage;
    btnRemote_Manual_CPP_SB: TSpeedButtonImage;
    btnME_FailureSB: TSpeedButtonImage;
    btnGB_FailureSB: TSpeedButtonImage;
    btnCPP_FailureSB: TSpeedButtonImage;
    btnShaft_Power_LimitedSB: TSpeedButtonImage;
    btnShaft_LockedSB: TSpeedButtonImage;
    btnPCS_AlarmSB: TSpeedButtonImage;
    btnClutch_InSB: TSpeedButtonImage;
    btnReady_For_Use_Clutch_SB: TSpeedButtonImage;
    btnClutch_AllowedSB: TSpeedButtonImage;
    btnRemote_Auto_Clutch_SB: TSpeedButtonImage;
    btnClutch_OutSB: TSpeedButtonImage;
    btnLocal_Clutch_SB: TSpeedButtonImage;
    btnRemote_Manual_Clutch_SB: TSpeedButtonImage;
    btnNone1: TSpeedButtonImage;
    btnNone2: TSpeedButtonImage;
    btnNone3: TSpeedButtonImage;
    btnNone4: TSpeedButtonImage;
    btnNone5: TSpeedButtonImage;
    FlasingIndicatorTimer: TTimer;
    procedure btnRunning_Start_ME_SBClick(Sender: TObject);
    procedure btnStopped_StopSBClick(Sender: TObject);
    procedure btnClutch_SBClick(Sender: TObject);
    procedure btnRemote_Auto_SBClick(Sender: TObject);
    procedure btnRemote_Manual_SBClick(Sender: TObject);
    procedure btnNoneMouseDown(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
    procedure btnNoneMouseUp(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
    procedure btnSBMouseDown(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
    procedure btnSBMouseUp(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FlasingIndicatorTimerTimer(Sender: TObject);

  private
    { Private declarations }
    FME_Failure, FGB_Failure, FCPP_Failure, FShaftPowerLimited, FShaftLocked, FPCSAlarm,
    FClutchIn, FClutchOut, FRunningStart, FStoppedStop,
    FLocal_ME, FLocal_GB, FLocal_CPP, FReadyForUse_ME, FReadyForUse_GB, FReadyForUse_CPP,
    FRemoteManual, FRemoteAuto,
    FFlashing_ClutchIn, FFlashing_ClutchOut, FFlashing_RemoteAuto, FFlashing_RemoteManual,
    FFlashing_RunningStart, FFlashing_StoppedStop : Boolean;

    counterStart, counterClutch, counterRemote : Integer;

    FAlarmAccept : array[0..5] of Boolean;

    FAlarmAcceptSB : Boolean;

    //Setting background color
    r, g, b : Byte;
    image_index : Integer;

    //Setting Lamp Indicator
    picture_Path, fIndikatorOn, fIndikatorOff, fIndikatorFault : string;

    FListener : TListeners;
    procedure PCSSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Integer);overload;
    procedure PCSSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Boolean);overload;

    procedure RemoteIndicatorLamp(aAutoManual: string; aOnOff: Boolean);
    procedure LocalMCRIndicator(aLocalMCR : string; aOnOff: Boolean);
    procedure LampTestIndicator(aOnOff: Integer);
    procedure BackgroundLampIndicator(aBrightness : Integer);

    procedure SpeedInChange(aIncreaseDecrease: Integer; aOnOff: Boolean);
    procedure PitchInChange(aAheadAstern : Integer; aOnOff: Boolean);

    procedure FlashingIndicatorRunning(SenderOn, SenderOff: TImage; aControl, aOnOff: Boolean);
    procedure FlashingIndicatorClutch(SenderOn, SenderOff: TImage; aControl, aOnOff: Boolean);
    procedure FlashingIndicatorRemote(SenderOn, SenderOff: TImage; aMode : string; aControl, aOnOff: Boolean);
    procedure FlashingIndicatorFailure(Sender: TImage; aControl, aOnOff: Boolean);

  public
    { Public declarations }

  end;

var
  frmSBPanel: TfrmSBPanel;

implementation

uses uPCSSystem;

{$R *.dfm}

procedure TfrmSBPanel.BackgroundLampIndicator(aBrightness: Integer);
var
  color : TColor;
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

  lbl_ME_FailureSB.Font.Color := color;
  lbl_GB_FailureSB.Font.Color := color;
  lbl_CPP_FailureSB.Font.Color := Color;
  lbl_Shaft_Power_LimitedSB.Font.Color := color;
  lbl_Shaft_LockedSB.Font.Color := color;
  lbl_PCS_AlarmSB.Font.Color := color;
  lbl_Clutch_InSB.Font.Color := color;
  lbl_Ready_For_Use_Clutch_SB.Font.Color := color;
  lbl_Clutch_AllowedSB.Font.Color := color;
  lbl_Remote_Auto_Clutch_SB.Font.Color := Color;

  lbl_Clutch_OutSB.Font.Color := color;
  lbl_Local_Clutch_SB.Font.Color := color;
  lbl_Remote_Manual_Clutch_SB.Font.Color := color;
  lbl_Incr_SpeedSB.Font.Color := color;
  lbl_Ready_For_Use_ME_SB.Font.Color := color;
  lbl_Running_StartSB.Font.Color := color;
  lbl_Remote_Auto_ME_SB.Font.Color := color;
  lbl_Decr_SpeedSB.Font.Color := color;
  lbl_Local_ME_SB.Font.Color := color;
  lbl_Stopped_StopSB.Font.Color := color;
  lbl_Remote_Manual_ME_SB.Font.Color := color;
  lbl_Ready_For_Use_CPP_SB.Font.Color := color;
  lbl_Remote_Auto_CPP_SB.Font.Color := color;
  lbl_Pitch_AS_SB.Font.Color := color;
  lbl_Pitch_AH_SB.Font.Color := color;
  lbl_Local_CPP_SB.Font.Color := color;
  lbl_Remote_Manual_CPP_SB.Font.Color := color;

  lbl_Alarm_SB.Font.Color := color;
  lbl_ME_SB.Font.Color := color;
  lbl_Clutch_GB_SB.Font.Color := color;
  lbl_CPP_SB.Font.Color := color;
end;

procedure TfrmSBPanel.btnClutch_SBClick(Sender: TObject);
begin
  if FReadyForUse_GB and FRemoteManual and PCSSystem.ControlRemoteSB then
  begin
    case TSpeedButtonImage(Sender).Tag of
      1:
      if PCSSystem.FClutchAllowedSB then
      begin
        imgClutch_InSB.Picture.LoadFromFile(fIndikatorOn);
        FFlashing_ClutchIn := True;
        PCSSystem.Clutch(C_PCS_GB_STARBOARD,True);
      end;
      2:
      begin
        imgClutch_OutSB.Picture.LoadFromFile(fIndikatorOn);
        FFlashing_ClutchOut := True;
        PCSSystem.Clutch(C_PCS_GB_STARBOARD,False);
      end;
    end;
  end;
end;

procedure TfrmSBPanel.btnSBMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if TSpeedButtonImage(Sender).Hint = 'Increase Speed' then
  begin
    imgIncr_SpeedSB.Picture.LoadFromFile(fIndikatorOn);
    SpeedInChange(1,True);
  end
  else if TSpeedButtonImage(Sender).Hint = 'Decrease Speed' then
  begin
    imgDecr_SpeedSB.Picture.LoadFromFile(fIndikatorOn);
    SpeedInChange(-1,True);
  end
  else if TSpeedButtonImage(Sender).Hint = 'Pitch AH' then
  begin
    imgPitch_AH_SB.Picture.LoadFromFile(fIndikatorOn);
    PitchInChange(1,True);
  end
  else if TSpeedButtonImage(Sender).Hint = 'Pitch AS' then
  begin
    imgPitch_AS_SB.Picture.LoadFromFile(fIndikatorOn);
    PitchInChange(-1,True);
  end;
end;

procedure TfrmSBPanel.btnSBMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if TSpeedButtonImage(Sender).Hint = 'Increase Speed' then
  begin
    imgIncr_SpeedSB.Picture.LoadFromFile(fIndikatorOff);
    SpeedInChange(1,False);
  end
  else if TSpeedButtonImage(Sender).Hint = 'Decrease Speed' then
  begin
    imgDecr_SpeedSB.Picture.LoadFromFile(fIndikatorOff);
    SpeedInChange(-1,False);
  end
  else if TSpeedButtonImage(Sender).Hint = 'Pitch AH' then
  begin
    imgPitch_AH_SB.Picture.LoadFromFile(fIndikatorOff);
    PitchInChange(1,False);
  end
  else if TSpeedButtonImage(Sender).Hint = 'Pitch AS' then
  begin
    imgPitch_AS_SB.Picture.LoadFromFile(fIndikatorOff);
    PitchInChange(-1,False);
  end;
end;

procedure TfrmSBPanel.btnNoneMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
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
  end;
end;

procedure TfrmSBPanel.btnNoneMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
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
  end;
end;

procedure TfrmSBPanel.btnRemote_Auto_SBClick(Sender: TObject);
begin
  if PCSSystem.ControlRemoteSB and FRunningStart then
  begin
    if TSpeedButtonImage(Sender).Hint = 'Gearbox' then
    begin
      if FReadyForUse_GB then
      begin
        imgRemote_Auto_Clutch_SB.Picture.LoadFromFile(fIndikatorOn);
        FFlashing_RemoteAuto := True;
        PCSSystem.Remote(C_PCS_GB_STARBOARD, C_ORD_GB_REMOTEAUTO, True);
      end;
    end
    else
    if TSpeedButtonImage(Sender).Hint = 'CPP' then
    begin
      if FReadyForUse_CPP then
      begin
        imgRemote_Auto_CPP_SB.Picture.LoadFromFile(fIndikatorOn);
        FFlashing_RemoteAuto := True;
        PCSSystem.Remote(C_PCS_CPP_STARBOARD, C_ORD_CPP_REMOTEAUTO, True);
      end;
    end
    else
    if TSpeedButtonImage(Sender).Hint = 'Main Engine' then
    begin
      if FReadyForUse_ME and FRunningStart then
      begin
        imgRemote_Auto_ME_SB.Picture.LoadFromFile(fIndikatorOn);
        FFlashing_RemoteAuto := True;
        PCSSystem.Remote(C_PCS_ME_STARBOARD, C_ORD_ME_REMOTEAUTO, True);
      end;
    end;
  end;
end;

procedure TfrmSBPanel.btnRemote_Manual_SBClick(Sender: TObject);
begin
  if PCSSystem.ControlRemoteSB then
  begin
    if TSpeedButtonImage(Sender).Hint = 'Gearbox' then
    begin
      if FReadyForUse_GB then
      begin
        imgRemote_Manual_Clutch_SB.Picture.LoadFromFile(fIndikatorOn);
        FFlashing_RemoteManual := True;
        PCSSystem.Remote(C_PCS_GB_STARBOARD, C_ORD_GB_REMOTEMAN, False);
      end;
    end
    else
    if TSpeedButtonImage(Sender).Hint = 'CPP' then
    begin
      if FReadyForUse_CPP then
      begin
        imgRemote_Manual_CPP_SB.Picture.LoadFromFile(fIndikatorOn);
        FFlashing_RemoteManual := True;
        PCSSystem.Remote(C_PCS_CPP_STARBOARD, C_ORD_CPP_REMOTEMAN, False);
      end;
    end
    else
    if TSpeedButtonImage(Sender).Hint = 'Main Engine' then
    begin
      if FReadyForUse_ME and FRunningStart then
      begin
        imgRemote_Manual_ME_SB.Picture.LoadFromFile(fIndikatorOn);
        FFlashing_RemoteManual := True;
        PCSSystem.Remote(C_PCS_ME_STARBOARD, C_ORD_ME_REMOTEMAN, False);
      end;
    end;
  end;
end;

procedure TfrmSBPanel.btnRunning_Start_ME_SBClick(Sender: TObject);
begin
  if FReadyForUse_ME and PCSSystem.ControlRemoteSB then
  begin
    imgRunning_StartSB.Picture.LoadFromFile(fIndikatorOn);
    FFlashing_RunningStart := True;
    PCSSystem.RunningStart(C_PCS_ME_STARBOARD, True);
  end;
end;

procedure TfrmSBPanel.btnStopped_StopSBClick(Sender: TObject);
begin
  if FReadyForUse_ME and FRunningStart and FRemoteManual and PCSSystem.ControlRemoteSB then
  begin
    imgStoped_StopSB.Picture.LoadFromFile(fIndikatorOn);
    FFlashing_StoppedStop := True;
    PCSSystem.StoppedStop(C_PCS_ME_STARBOARD);
  end
  else
    Exit;
end;

procedure TfrmSBPanel.FlashingIndicatorClutch(SenderOn, SenderOff: TImage;
  aControl, aOnOff: Boolean);
begin
  counterClutch := counterClutch + 1;

  if counterClutch < 5 then
  begin
    if TImage(SenderOn).Visible then
      TImage(SenderOn).Visible := not aOnOff
    else
      TImage(SenderOn).Visible := aOnOff;
  end;

  if counterClutch > 5 then
  begin
    if aControl then
    begin
      TImage(SenderOn).Visible := aOnOff;
      TImage(SenderOn).Picture.LoadFromFile(fIndikatorOn);
      TImage(SenderOff).Picture.LoadFromFile(fIndikatorOff);
      if SenderOn = imgClutch_InSB then
        FClutchOut := not aOnOff
      else if SenderOn = imgClutch_OutSB then
        FClutchIn := not aOnOff
    end
    else
      TImage(SenderOn).Picture.LoadFromFile(fIndikatorOff);

    counterClutch := 0;
    if SenderOn = imgClutch_InSB then
      FFlashing_ClutchIn := not aOnOff
    else if SenderOn = imgClutch_OutSB then
      FFlashing_ClutchOut := not aOnOff;
  end;
end;

procedure TfrmSBPanel.FlashingIndicatorFailure(Sender: TImage; aControl,
  aOnOff: Boolean);
begin
  if not aControl then
  begin
    if TImage(Sender).Visible then
      TImage(Sender).Visible := not aOnOff
    else
      TImage(Sender).Visible := aOnOff;
  end
  else
    TImage(Sender).Visible := aOnOff;
end;

procedure TfrmSBPanel.FlashingIndicatorRemote(SenderOn, SenderOff: TImage;
  aMode: string; aControl, aOnOff: Boolean);
begin
  counterRemote := counterRemote + 1;

  if counterRemote < 5 then
  begin
    if TImage(SenderOn).Visible then
      TImage(SenderOn).Visible := not aOnOff
    else
      TImage(SenderOn).Visible := aOnOff;
  end;

  if counterRemote > 5 then
  begin
    if aControl then
    begin
      TImage(SenderOn).Visible := aOnOff;
      TImage(SenderOn).Picture.LoadFromFile(fIndikatorOn);
      TImage(SenderOff).Picture.LoadFromFile(fIndikatorOff);
      if aMode = 'Auto' then
        FRemoteManual := not aOnOff
      else if aMode = 'Manual' then
        FRemoteAuto := not aOnOff
    end
    else
      TImage(SenderOn).Picture.LoadFromFile(fIndikatorOff);

    counterRemote := 0;
    if aMode = 'Auto' then
      FFlashing_RemoteAuto := not aOnOff
    else if aMode = 'Manual' then
      FFlashing_RemoteManual := not aOnOff;
  end;
end;

procedure TfrmSBPanel.FlashingIndicatorRunning(SenderOn, SenderOff: TImage;
  aControl, aOnOff: Boolean);
begin
  counterStart := counterStart + 1;

  if counterStart < 5 then
  begin
    if TImage(SenderOn).Visible then
      TImage(SenderOn).Visible := not aOnOff
    else
      TImage(SenderOn).Visible := aOnOff;
  end;

  if counterStart > 5 then
  begin
    if aControl then
    begin
      TImage(SenderOn).Visible := aOnOff;
      TImage(SenderOn).Picture.LoadFromFile(fIndikatorOn);
      TImage(SenderOff).Picture.LoadFromFile(fIndikatorOff);
      if SenderOn = imgRunning_StartSB then
        FStoppedStop := not aOnOff
      else if SenderOn = imgStoped_StopSB then
        FRunningStart := not aOnOff
    end
    else
      TImage(SenderOn).Picture.LoadFromFile(fIndikatorOff);

    counterStart := 0;
    if SenderOn = imgRunning_StartSB then
      FFlashing_RunningStart := not aOnOff
    else if SenderOn = imgStoped_StopSB then
      FFlashing_StoppedStop := not aOnOff;
  end;
end;

procedure TfrmSBPanel.RemoteIndicatorLamp(aAutoManual: string; aOnOff: Boolean);
begin
  if aAutoManual = 'Auto' then
  begin
    if aOnOff then
    begin
      imgRemote_Auto_ME_SB.Picture.LoadFromFile(fIndikatorOn);
      imgRemote_Auto_Clutch_SB.Picture.LoadFromFile(fIndikatorOn);
      imgRemote_Auto_CPP_SB.Picture.LoadFromFile(fIndikatorOn);
      imgRemote_Manual_CPP_SB.Picture.LoadFromFile(fIndikatorOff);
      FRemoteAuto := aOnOff;
      FRemoteManual := not aOnOff;
    end
    else
    begin
      imgRemote_Auto_ME_SB.Picture.LoadFromFile(fIndikatorOff);
      imgRemote_Auto_Clutch_SB.Picture.LoadFromFile(fIndikatorOff);
      FRemoteAuto := not aOnOff;
    end;
  end
  else if aAutoManual = 'Manual' then
  begin
    if aOnOff then
    begin
      imgRemote_Manual_Clutch_SB.Picture.LoadFromFile(fIndikatorOn);
      imgRemote_Manual_ME_SB.Picture.LoadFromFile(fIndikatorOn);
      imgRemote_Manual_CPP_SB.Picture.LoadFromFile(fIndikatorOn);
      FRemoteManual := aOnOff;
      FRemoteAuto := not aOnOff;
      if not FFlashing_RemoteManual then
        FFlashing_RemoteManual := aOnOff;
    end
    else
    begin
      imgRemote_Manual_Clutch_SB.Picture.LoadFromFile(fIndikatorOff);
      imgRemote_Manual_ME_SB.Picture.LoadFromFile(fIndikatorOff);
      FRemoteManual := not aOnOff;
    end;
  end;
end;

procedure TfrmSBPanel.SpeedInChange(aIncreaseDecrease: Integer;
  aOnOff: Boolean);
begin
  if FReadyForUse_ME and FRunningStart and FRemoteManual and PCSSystem.ControlRemoteSB then
  begin
    PCSSystem.Speed(C_PCS_ME_STARBOARD,aIncreaseDecrease,aOnOff);
  end;
end;

procedure TfrmSBPanel.PitchInChange(aAheadAstern : Integer; aOnOff: Boolean);
begin
  if FReadyForUse_CPP and FRemoteManual and PCSSystem.ControlRemoteSB then
  begin
    PCSSystem.Pitch(C_PCS_CPP_STARBOARD,aAheadAstern,aOnOff);
  end;
end;

procedure TfrmSBPanel.FormCreate(Sender: TObject);
begin
  FListener := TListeners.Create;
  with PCSSystem.Listener.Add('STARBOARD') as TPropertyEventListener do begin
    OnPropertyIntChange := PCSSystemEvent;
    OnPropertyBoolChange := PCSSystemEvent;
  end;

  picture_Path := Copy(ExtractFilePath(Application.ExeName),1,length(ExtractFilePath(Application.ExeName))-4);
  fIndikatorFault := picture_Path + 'bin\Images\Image MCR\IPMS_lampu_indikator_red.bmp';
  fIndikatorOn := picture_Path + 'bin\Images\Image MCR\IPMS_lampu_indikator_green.bmp';
  fIndikatorOff := picture_Path + 'bin\Images\Image MCR\IPMS_lampu_indikator.bmp';

  counterRemote := 0;
  counterStart := 0;
  counterClutch := 0;
end;

procedure TfrmSBPanel.FormDestroy(Sender: TObject);
begin
  FListener.Free;
end;

procedure TfrmSBPanel.FormShow(Sender: TObject);
var
  i : Integer;
begin
//  i:=0;
//  DefaultMonitor := dmDesktop;
//  if Screen.MonitorCount = 1  then
//    i := 0
//  else
//  if Screen.MonitorCount = 2 then
//    i := 0
//  else
//  if Screen.MonitorCount = 3 then
//    i := 0;

  Top := Screen.Monitors[PCSSystem.idFormPCS_SB].Top;
  Left := Screen.Monitors[PCSSystem.idFormPCS_SB].Left;

  r := 255;
  g := 255;
  b := 255;
  image_index := 0;
end;

procedure TfrmSBPanel.LampTestIndicator(aOnOff: Integer);
var
  i : Integer;
begin
  if aOnOff = 10 then
  begin
    imgIncr_SpeedSB.Picture.LoadFromFile(fIndikatorOn);
    imgDecr_SpeedSB.Picture.LoadFromFile(fIndikatorOn);
    imgReady_For_Use_ME_SB.Picture.LoadFromFile(fIndikatorOn);
    imgLocal_ME_SB.Picture.LoadFromFile(fIndikatorOn);
    imgRunning_StartSB.Picture.LoadFromFile(fIndikatorOn);
    imgStoped_StopSB.Picture.LoadFromFile(fIndikatorOn);
    imgRemote_Auto_ME_SB.Picture.LoadFromFile(fIndikatorOn);
    imgRemote_Manual_ME_SB.Picture.LoadFromFile(fIndikatorOn);
    imgPitch_AH_SB.Picture.LoadFromFile(fIndikatorOn);
    imgPitch_AS_SB.Picture.LoadFromFile(fIndikatorOn);
    imgReady_For_Use_CPP_SB.Picture.LoadFromFile(fIndikatorOn);
    imgLocal_CPP_SB.Picture.LoadFromFile(fIndikatorOn);
    imgRemote_Auto_CPP_SB.Picture.LoadFromFile(fIndikatorOn);
    imgRemote_Manual_CPP_SB.Picture.LoadFromFile(fIndikatorOn);
    imgClutch_InSB.Picture.LoadFromFile(fIndikatorOn);
    imgClutch_OutSB.Picture.LoadFromFile(fIndikatorOn);
    imgReady_For_Use_Clutch_SB.Picture.LoadFromFile(fIndikatorOn);
    imgLocal_Clutch_SB.Picture.LoadFromFile(fIndikatorOn);
    imgClutch_AllowedSB.Picture.LoadFromFile(fIndikatorOn);
    imgRemote_Auto_Clutch_SB.Picture.LoadFromFile(fIndikatorOn);
    imgRemote_Manual_Clutch_SB.Picture.LoadFromFile(fIndikatorOn);
    imgME_FailureSB.Picture.LoadFromFile(fIndikatorFault);
    imgShaft_Power_LimitedSB.Picture.LoadFromFile(fIndikatorFault);
    imgGB_FailureSB.Picture.LoadFromFile(fIndikatorFault);
    imgShaft_LockedSB.Picture.LoadFromFile(fIndikatorFault);
    imgCPP_FailureSB.Picture.LoadFromFile(fIndikatorFault);
    imgPCS_AlarmSB.Picture.LoadFromFile(fIndikatorFault);
    for i := 1 to 5 do
    begin
      TImage(FindComponent('imgNone_'+IntToStr(i))).Picture.LoadFromFile(fIndikatorOn);
    end;
  end
  else if aOnOff = 0 then
  begin
    imgIncr_SpeedSB.Picture.LoadFromFile(fIndikatorOff);
    imgDecr_SpeedSB.Picture.LoadFromFile(fIndikatorOff);
    if not FReadyForUse_ME then
      imgReady_For_Use_ME_SB.Picture.LoadFromFile(fIndikatorOff);
    if not FLocal_ME then
      imgLocal_ME_SB.Picture.LoadFromFile(fIndikatorOff);
    if not FRunningStart then
      imgRunning_StartSB.Picture.LoadFromFile(fIndikatorOff);
    if not FStoppedStop then
      imgStoped_StopSB.Picture.LoadFromFile(fIndikatorOff);
    if not FRemoteAuto then
    begin
      imgRemote_Auto_ME_SB.Picture.LoadFromFile(fIndikatorOff);
      imgRemote_Auto_CPP_SB.Picture.LoadFromFile(fIndikatorOff);
      imgRemote_Auto_Clutch_SB.Picture.LoadFromFile(fIndikatorOff);
    end;
    if not FRemoteManual then
    begin
      imgRemote_Manual_ME_SB.Picture.LoadFromFile(fIndikatorOff);
      imgRemote_Manual_CPP_SB.Picture.LoadFromFile(fIndikatorOff);
      imgRemote_Manual_Clutch_SB.Picture.LoadFromFile(fIndikatorOff);
    end;
    imgPitch_AH_SB.Picture.LoadFromFile(fIndikatorOff);
    imgPitch_AS_SB.Picture.LoadFromFile(fIndikatorOff);
    if not FReadyForUse_CPP then
      imgReady_For_Use_CPP_SB.Picture.LoadFromFile(fIndikatorOff);
    if not FLocal_CPP then
      imgLocal_CPP_SB.Picture.LoadFromFile(fIndikatorOff);
    if not FClutchIn then
      imgClutch_InSB.Picture.LoadFromFile(fIndikatorOff);
    if not FClutchOut then
      imgClutch_OutSB.Picture.LoadFromFile(fIndikatorOff);
    if not FReadyForUse_GB then
      imgReady_For_Use_Clutch_SB.Picture.LoadFromFile(fIndikatorOff);
    if not FLocal_GB then
      imgLocal_Clutch_SB.Picture.LoadFromFile(fIndikatorOff);
    if not PCSSystem.FClutchAllowedSB then
      imgClutch_AllowedSB.Picture.LoadFromFile(fIndikatorOff);
    if not FME_Failure then
      imgME_FailureSB.Picture.LoadFromFile(fIndikatorOff);
    if not FShaftPowerLimited then
      imgShaft_Power_LimitedSB.Picture.LoadFromFile(fIndikatorOff);
    if not FGB_Failure then
      imgGB_FailureSB.Picture.LoadFromFile(fIndikatorOff);
    if not FShaftLocked then
      imgShaft_LockedSB.Picture.LoadFromFile(fIndikatorOff);
    if not FCPP_Failure then
      imgCPP_FailureSB.Picture.LoadFromFile(fIndikatorOff);
    if not FPCSAlarm then
      imgPCS_AlarmSB.Picture.LoadFromFile(fIndikatorOff);
    for i := 1 to 5 do
    begin
      TImage(FindComponent('imgNone_'+IntToStr(i))).Picture.LoadFromFile(fIndikatorOff);
    end;
  end;
end;

procedure TfrmSBPanel.LocalMCRIndicator(aLocalMCR: string; aOnOff: Boolean);
begin
  if aLocalMCR = 'Local' then
  begin
    FLocal_ME := aOnOff;
    FLocal_GB := aOnOff;
    FLocal_CPP := aOnOff;
    imgLocal_ME_SB.Picture.LoadFromFile(fIndikatorOn);
    imgLocal_Clutch_SB.Picture.LoadFromFile(fIndikatorOn);
    imgLocal_CPP_SB.Picture.LoadFromFile(fIndikatorOn);
  end
  else if aLocalMCR = 'MCR' then
  begin
    FLocal_ME := not aOnOff;
    FLocal_GB := not aOnOff;
    FLocal_CPP := not aOnOff;
    imgLocal_ME_SB.Picture.LoadFromFile(fIndikatorOff);
    imgLocal_Clutch_SB.Picture.LoadFromFile(fIndikatorOff);
    imgLocal_CPP_SB.Picture.LoadFromFile(fIndikatorOff);
  end;
end;

procedure TfrmSBPanel.FlasingIndicatorTimerTimer(Sender: TObject);
begin
  if FFlashing_RunningStart then
    FlashingIndicatorRunning(imgRunning_StartSB,imgStoped_StopSB,FRunningStart,True);

  if FFlashing_StoppedStop then
    FlashingIndicatorRunning(imgStoped_StopSB,imgRunning_StartSB,FStoppedStop,True);

  if FFlashing_ClutchIn then
    FlashingIndicatorClutch(imgClutch_InSB,imgClutch_OutSB,FClutchIn,True);

  if FFlashing_ClutchOut then
    FlashingIndicatorClutch(imgClutch_OutSB,imgClutch_InSB,FClutchOut,True);

//  if FFlashing_RemoteAuto then
//  begin
//    FlashingIndicatorRemote(imgRemote_Auto_ME_SB,imgRemote_Manual_ME_SB,'Auto',FRemoteAuto,True);
//    FlashingIndicatorRemote(imgRemote_Auto_Clutch_SB,imgRemote_Manual_Clutch_SB,'Auto',FRemoteAuto,True);
//    FlashingIndicatorRemote(imgRemote_Auto_CPP_SB,imgRemote_Manual_CPP_SB,'Auto',FRemoteAuto,True);
//  end;
//
//  if FFlashing_RemoteManual then
//  begin
//    FlashingIndicatorRemote(imgRemote_Manual_ME_SB,imgRemote_Auto_ME_SB,'Manual',FRemoteManual,True);
//    FlashingIndicatorRemote(imgRemote_Manual_Clutch_SB,imgRemote_Auto_Clutch_SB,'Manual',FRemoteManual,True);
//    FlashingIndicatorRemote(imgRemote_Manual_CPP_SB,imgRemote_Auto_CPP_SB,'Manual',FRemoteManual,True);
//  end;

  if FFlashing_RemoteAuto then
  begin
    counterRemote := counterRemote + 1;

    if counterRemote < 5 then
    begin
      if imgRemote_Auto_Clutch_SB.Visible then
        imgRemote_Auto_Clutch_SB.Visible := False
      else
        imgRemote_Auto_Clutch_SB.Visible := True;

      if imgRemote_Auto_ME_SB.Visible then
        imgRemote_Auto_ME_SB.Visible := False
      else
        imgRemote_Auto_ME_SB.Visible := True;

      if imgRemote_Auto_CPP_SB.Visible then
        imgRemote_Auto_CPP_SB.Visible := False
      else
        imgRemote_Auto_CPP_SB.Visible := True;
    end;

    if counterRemote > 5 then
    begin
      if FRemoteAuto then
      begin
        imgRemote_Auto_Clutch_SB.Visible := True;
        imgRemote_Auto_ME_SB.Visible := True;
        imgRemote_Auto_CPP_SB.Visible := True;
        imgRemote_Auto_Clutch_SB.Picture.LoadFromFile(fIndikatorOn);
        imgRemote_Manual_Clutch_SB.Picture.LoadFromFile(fIndikatorOff);
        imgRemote_Auto_ME_SB.Picture.LoadFromFile(fIndikatorOn);
        imgRemote_Manual_ME_SB.Picture.LoadFromFile(fIndikatorOff);
        imgRemote_Auto_CPP_SB.Picture.LoadFromFile(fIndikatorOn);
        imgRemote_Manual_CPP_SB.Picture.LoadFromFile(fIndikatorOff);
        FRemoteManual := False;
      end
      else
      begin
        imgRemote_Auto_Clutch_SB.Picture.LoadFromFile(fIndikatorOff);
        imgRemote_Auto_ME_SB.Picture.LoadFromFile(fIndikatorOff);
        imgRemote_Auto_CPP_SB.Picture.LoadFromFile(fIndikatorOff);
      end;
      counterRemote := 0;
      FFlashing_RemoteAuto := False;
    end;
  end;

  if FFlashing_RemoteManual then
  begin
    counterRemote := counterRemote + 1;

    if counterRemote < 5 then
    begin
      if imgRemote_Manual_Clutch_SB.Visible then
        imgRemote_Manual_Clutch_SB.Visible := False
      else
        imgRemote_Manual_Clutch_SB.Visible := True;

      if imgRemote_Manual_ME_SB.Visible then
        imgRemote_Manual_ME_SB.Visible := False
      else
        imgRemote_Manual_ME_SB.Visible := True;

      if imgRemote_Manual_CPP_SB.Visible then
        imgRemote_Manual_CPP_SB.Visible := False
      else
        imgRemote_Manual_CPP_SB.Visible := True;
    end;

    if counterRemote > 5 then
    begin
      if FRemoteManual then
      begin
        imgRemote_Manual_Clutch_SB.Visible := True;
        imgRemote_Manual_ME_SB.Visible := True;
        imgRemote_Manual_CPP_SB.Visible := True;
        imgRemote_Manual_Clutch_SB.Picture.LoadFromFile(fIndikatorOn);
        imgRemote_Auto_Clutch_SB.Picture.LoadFromFile(fIndikatorOff);
        imgRemote_Manual_ME_SB.Picture.LoadFromFile(fIndikatorOn);
        imgRemote_Auto_ME_SB.Picture.LoadFromFile(fIndikatorOff);
        imgRemote_Manual_CPP_SB.Picture.LoadFromFile(fIndikatorOn);
        imgRemote_Auto_CPP_SB.Picture.LoadFromFile(fIndikatorOff);
        FRemoteAuto := False;
      end
      else
      begin
        imgRemote_Manual_Clutch_SB.Picture.LoadFromFile(fIndikatorOff);
        imgRemote_Manual_ME_SB.Picture.LoadFromFile(fIndikatorOff);
        imgRemote_Manual_CPP_SB.Picture.LoadFromFile(fIndikatorOff);
      end;

      counterRemote := 0;
      FFlashing_RemoteManual := False;
    end;
  end;

  if FME_Failure then
    FlashingIndicatorFailure(imgME_FailureSB,FAlarmAccept[0],True);

  if FGB_Failure then
    FlashingIndicatorFailure(imgGB_FailureSB,FAlarmAccept[1],True);

  if FCPP_Failure then
    FlashingIndicatorFailure(imgCPP_FailureSB,FAlarmAccept[2],True);

  if FShaftPowerLimited then
    FlashingIndicatorFailure(imgShaft_Power_LimitedSB,FAlarmAccept[3],True);

  if FShaftLocked then
    FlashingIndicatorFailure(imgShaft_LockedSB,FAlarmAccept[4],True);

  if FPCSAlarm then
    FlashingIndicatorFailure(imgPCS_AlarmSB,FAlarmAccept[5],True);

  if FAlarmAcceptSB then
  begin
    if FME_Failure then
      FAlarmAccept[0] := True;
    if FGB_Failure then
      FAlarmAccept[1] := True;
    if FCPP_Failure then
      FAlarmAccept[2] := True;
    if FShaftPowerLimited then
      FAlarmAccept[3] := True;
    if FShaftLocked then
      FAlarmAccept[4] := True;
    if FPCSAlarm then
      FAlarmAccept[5] := True;

    FAlarmAcceptSB := False;
  end;

end;

procedure TfrmSBPanel.PCSSystemEvent(Sender: TObject; PropsID: E_PropsID;
  Value: Boolean);
begin
  case PropsID of
    epPCSMESBRunStart:
      if Value then
      begin
        //On
        imgRunning_StartSB.Picture.LoadFromFile(fIndikatorOn);
        FFlashing_RunningStart := Value;
        FRunningStart := Value;
        FStoppedStop := not Value;
      end
      else
      begin
        //Off
        imgRunning_StartSB.Picture.LoadFromFile(fIndikatorOff);
        FRunningStart := not Value;
        FStoppedStop := Value;
      end;

    epPCSMESBRemoteAuto, epPCSGBRemoteAutoSB:
      RemoteIndicatorLamp('Auto', Value);

    epPCSMESBRemoteManual, epPCSGBRemoteManualSB:
      RemoteIndicatorLamp('Manual', Value);

    epPCSCPPRemoteSB:
      RemoteIndicatorLamp('Auto', Value);

    epPCSGBClutchAllowedSB:
      if Value then
        imgClutch_AllowedSB.Picture.LoadFromFile(fIndikatorOn)
      else
        imgClutch_AllowedSB.Picture.LoadFromFile(fIndikatorOff);

    epPCSGBClutchEngagedSB:
      if Value then
      begin
        FClutchIn := Value;
        FClutchOut := not Value;
        imgClutch_InSB.Picture.LoadFromFile(fIndikatorOn);
        imgClutch_OutSB.Picture.LoadFromFile(fIndikatorOff);
      end
      else
      begin
        FClutchIn := not Value;
        FClutchOut := Value;
        imgClutch_InSB.Picture.LoadFromFile(fIndikatorOff);
        imgClutch_OutSB.Picture.LoadFromFile(fIndikatorOn);
      end;

    epPCSMEReadyForUseSB:
      if Value then
      begin
        FReadyForUse_ME := Value;
        imgReady_For_Use_ME_SB.Picture.LoadFromFile(fIndikatorOn);
      end
      else
      begin
        FReadyForUse_ME := not Value;
        imgReady_For_Use_ME_SB.Picture.LoadFromFile(fIndikatorOff);
      end;

    epPCSCPPReadyForUseSB:
      if Value then
      begin
        FReadyForUse_CPP := Value;
        imgReady_For_Use_CPP_SB.Picture.LoadFromFile(fIndikatorOn);
      end
      else
      begin
        FReadyForUse_CPP := not Value;
        imgReady_For_Use_CPP_SB.Picture.LoadFromFile(fIndikatorOff);
      end;

    epPCSGBReadyForUseSB:
      if Value then
      begin
        FReadyForUse_GB := Value;
        imgReady_For_Use_Clutch_SB.Picture.LoadFromFile(fIndikatorOn);
      end
      else
      begin
        FReadyForUse_GB := not Value;
        imgReady_For_Use_Clutch_SB.Picture.LoadFromFile(fIndikatorOff);
      end;

    epPCSCtrlLocalSB:
      if Value then
        LocalMCRIndicator('Local', Value);

    epPCSCtrlMCRSB:
      if Value then
        LocalMCRIndicator('MCR', Value);

    epPCSMEFailureSB:
      if Value then
      begin
        FME_Failure := Value;
        imgME_FailureSB.Picture.LoadFromFile(fIndikatorFault);
        FAlarmAccept[0] := not Value;
      end
      else
      begin
        FME_Failure := not Value;
        imgME_FailureSB.Picture.LoadFromFile(fIndikatorOff);
      end;

    epPCSGBFailureSB:
      if Value then
      begin
        FGB_Failure := Value;
        imgGB_FailureSB.Picture.LoadFromFile(fIndikatorFault);
        FAlarmAccept[1] := not Value;
      end
      else
      begin
        FGB_Failure := not Value;
        imgGB_FailureSB.Picture.LoadFromFile(fIndikatorOff);
      end;

    epPCSCPPFailureSB:
      if Value then
      begin
        FCPP_Failure := Value;
        imgCPP_FailureSB.Picture.LoadFromFile(fIndikatorFault);
        FAlarmAccept[2] := not Value;
      end
      else
      begin
        FCPP_Failure := Value;
        imgCPP_FailureSB.Picture.LoadFromFile(fIndikatorOff);
      end;

    epPCSGBShaftPowerLimitedSB:
      if Value then
      begin
        FShaftPowerLimited := Value;
        imgShaft_Power_LimitedSB.Picture.LoadFromFile(fIndikatorFault);
        FAlarmAccept[3] := not Value;
      end
      else
      begin
        FShaftPowerLimited := not Value;
        imgShaft_Power_LimitedSB.Picture.LoadFromFile(fIndikatorOff);
      end;

    epPCSGBShaftLockedSB:
      if Value then
      begin
        FShaftLocked := Value;
        imgShaft_LockedSB.Picture.LoadFromFile(fIndikatorFault);
        FAlarmAccept[4] := not Value;
      end
      else
      begin
        FShaftLocked := not Value;
        imgShaft_LockedSB.Picture.LoadFromFile(fIndikatorOff);
      end;

    epPCSAlarmsSB:
      if Value then
      begin
        FPCSAlarm := Value;
        imgPCS_AlarmSB.Picture.LoadFromFile(fIndikatorFault);
        FAlarmAccept[5] := not Value;
      end
      else
      begin
        FPCSAlarm := not Value;
        imgPCS_AlarmSB.Picture.LoadFromFile(fIndikatorOff);
      end;

    epPCSCtrlAlarmAccept:
      if Value then
        FAlarmAcceptSB := Value;
  end;
end;

procedure TfrmSBPanel.PCSSystemEvent(Sender: TObject; PropsID: E_PropsID;
  Value: Integer);
begin
  case PropsID of
    epPCSFreezed:
      if Value = 1 then
      begin
        frmSBPanel.Enabled := False;
        PCSSystem.FFormFreezed[2] := TfrmFreeze.Create(frmSBPanel);
        with PCSSystem.FFormFreezed[2] do
        begin
          Parent := frmSBPanel;
          Position := poOwnerFormCenter;
          BringToFront;
          Show;
        end;
      end
      else if Value = 0 then
      begin
        frmSBPanel.Enabled := True;
        if Assigned(PCSSystem.FFormFreezed[2]) then
          FreeAndNil(PCSSystem.FFormFreezed[2]);
      end;

    epPCSCtrlBackgroundLamp:
      BackgroundLampIndicator(Value);

    epPCSCtrlLamptTest:
      LampTestIndicator(Value);
  end;
end;

end.
