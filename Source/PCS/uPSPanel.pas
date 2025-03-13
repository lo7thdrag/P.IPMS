unit uPSPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, ImgList, Buttons, SpeedButtonImage, uDataType,
  uListener, uFreezeFrom;

type
  TfrmPSPanel = class(TForm)
    pnlPSPanel: TPanel;
    imgPSPanel: TImage;
    imgME_FailurePS: TImage;
    imgGB_FailurePS: TImage;
    imgCPP_FailurePS: TImage;
    imgNone_1: TImage;
    imgShaft_Power_LimitedPS: TImage;
    imgShaft_LockedPS: TImage;
    imgPCS_AlarmPS: TImage;
    imgNone_2: TImage;
    imgClutch_InPS: TImage;
    imgReady_For_Use_Clutch_PS: TImage;
    imgClutch_AllowedPS: TImage;
    imgRemote_Auto_Clutch_PS: TImage;
    imgClutch_OutPS: TImage;
    imgLocal_Clutch_PS: TImage;
    imgNone_3: TImage;
    imgRemote_Manual_Clutch_PS: TImage;
    imgIncr_SpeedPS: TImage;
    imgDecr_SpeedPS: TImage;
    imgReady_For_Use_ME_PS: TImage;
    imgRunning_StartPS: TImage;
    imgRemote_Auto_ME_PS: TImage;
    imgLocal_ME_PS: TImage;
    imgStoped_StopPS: TImage;
    imgRemote_Manual_ME_PS: TImage;
    imgPitch_AHPS: TImage;
    imgReady_For_Use_CPP_PS: TImage;
    imgNone_4: TImage;
    imgRemote_Auto_CPP_PS: TImage;
    imgPitch_ASPS: TImage;
    imgLocal_CPP_PS: TImage;
    imgNone_5: TImage;
    imgRemote_Manual_CPP_PS: TImage;
    lbl_Alarm_PS: TLabel;
    lblME_FailurePS: TLabel;
    lbl_GB_FailurePS: TLabel;
    lbl_CPP_FailurePS: TLabel;
    lbl_Shaft_Power_LimitedPS: TLabel;
    lbl_Shaft_LockedPS: TLabel;
    lbl_PCS_AlarmPS: TLabel;
    lbl_Clutch_InPS: TLabel;
    lbl_Ready_For_Use_Clutch_PS: TLabel;
    lbl_Clutch_AllowedPS: TLabel;
    lbl_Remote_Auto_Clutch_PS: TLabel;
    lbl_Clutch_OutPS: TLabel;
    lbl_Local_Clutch_PS: TLabel;
    lbl_Remote_Manual_Clutch_PS: TLabel;
    lbl_Clutch_GB_PS: TLabel;
    lbl_ME_PS: TLabel;
    lbl_CPP_PS: TLabel;
    lbl_Incr_SpeedPS: TLabel;
    lbl_Ready_For_Use_ME_PS: TLabel;
    lbl_Running_StartPS: TLabel;
    lbl_Remote_Auto_ME_PS: TLabel;
    lbl_Decr_SpeedPS: TLabel;
    lbl_Local_ME_PS: TLabel;
    lbl_Stopped_StopPS: TLabel;
    lbl_Remote_Manual_ME_PS: TLabel;
    lbl_Pitch_AH_PS: TLabel;
    lbl_Ready_For_Use_CPP_PS: TLabel;
    lbl_Local_CPP_PS: TLabel;
    lbl_Pitch_AS_PS: TLabel;
    lbl_Remote_Auto_CPP_PS: TLabel;
    lbl_Remote_Manual_CPP_PS: TLabel;
    btnME_FailurePS: TSpeedButtonImage;
    ilButton_PS: TImageList;
    btnGB_FailurePS: TSpeedButtonImage;
    btnCPP_FailurePS: TSpeedButtonImage;
    btnShaft_Power_LimitedPS: TSpeedButtonImage;
    btnShaft_LockedPS: TSpeedButtonImage;
    btnPCS_AlarmPS: TSpeedButtonImage;
    btnClutch_InPS: TSpeedButtonImage;
    btnClutch_OutPS: TSpeedButtonImage;
    btnReady_For_Use_Clutch_PS: TSpeedButtonImage;
    btnClutch_AllowedPS: TSpeedButtonImage;
    btnRemote_Auto_Clutch_PS: TSpeedButtonImage;
    btnLocal_Clutch_PS: TSpeedButtonImage;
    btnRemote_Manual_Clutch_PS: TSpeedButtonImage;
    btnIncr_SpeedPS: TSpeedButtonImage;
    btnReady_For_Use_ME_PS: TSpeedButtonImage;
    btnRunning_StartPS: TSpeedButtonImage;
    btnRemote_Auto_ME_PS: TSpeedButtonImage;
    btnDecr_SpeedPS: TSpeedButtonImage;
    btnLocal_ME_PS: TSpeedButtonImage;
    btnStopped_StopPS: TSpeedButtonImage;
    btnRemote_Manual_ME_PS: TSpeedButtonImage;
    btnPitch_AH_PS: TSpeedButtonImage;
    btnReady_For_Use_CPP_PS: TSpeedButtonImage;
    btnRemote_Auto_CPP_PS: TSpeedButtonImage;
    btnPitch_AS_PS: TSpeedButtonImage;
    btnLocal_CPP_PS: TSpeedButtonImage;
    btnRemote_Manual_CPP_PS: TSpeedButtonImage;
    btnNone1: TSpeedButtonImage;
    btnNone2: TSpeedButtonImage;
    btnNone3: TSpeedButtonImage;
    btnNone4: TSpeedButtonImage;
    btnNone5: TSpeedButtonImage;
    FlashingIndicatorTimer : TTimer;
    procedure btnClutch_PSClick(Sender: TObject);
    procedure btnRemote_Auto_PSClick(Sender: TObject);
    procedure btnRemote_Manual_PSClick(Sender: TObject);
    procedure btnRunning_StartPSClick(Sender: TObject);
    procedure btnStopped_StopPSClick(Sender: TObject);
    procedure btnNoneMouseDown(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
    procedure btnNoneMouseUp(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
    procedure btnPSMouseDown(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
    procedure btnPSMouseUp(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);


    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender : TObject);
    procedure FlashingIndicatorTimerTimer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

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

    FAlarmAcceptPS : Boolean;

    //Setting background color
    r, g, b : Byte;
    image_index : Integer;

    //Setting Lamp Indicator
    picture_Path, fIndikatorOn, fIndikatorOff, fIndikatorFault : string;

    FListener : TListeners;
    procedure PCSSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Integer);overload;
    procedure PCSSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Boolean);overload;

    procedure RemoteIndicatorLamp(aAutoManual : string; aOnOff: Boolean);
    procedure LocalMCRIndicator(aLocalMCR : string; aOnOff: Boolean);
    procedure LampTestIndicator(aOnOff: Integer);
    procedure BackgroundLampIndicator(aBrightness: Integer);

    procedure SpeedInChange(aIncreaseDecrease: Integer; aOnOff: Boolean);
    procedure PitchInChange(aAheadAstern: Integer; aOnOff: Boolean);

    procedure FlashingIndicatorRunning(SenderOn, SenderOff: TImage; aControl, aOnOff: Boolean);
    procedure FlashingIndicatorClutch(SenderOn, SenderOff: TImage; aControl, aOnOff: Boolean);
    procedure FlashingIndicatorRemote(SenderOn, SenderOff: TImage; aMode : string; aControl, aOnOff: Boolean);
    procedure FlashingIndicatorFailure(Sender: TImage; aControl, aOnOff: Boolean);

  public
    { Public declarations }

  end;

var
  frmPSPanel: TfrmPSPanel;

implementation

uses uPCSSystem;

{$R *.dfm}


procedure TfrmPSPanel.BackgroundLampIndicator(aBrightness: Integer);
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

  lblME_FailurePS.Font.Color := color;
  lbl_GB_FailurePS.Font.Color := color;
  lbl_CPP_FailurePS.Font.Color := Color;
  lbl_Shaft_Power_LimitedPS.Font.Color := color;
  lbl_Shaft_LockedPS.Font.Color := color;
  lbl_PCS_AlarmPS.Font.Color := color;
  lbl_Clutch_InPS.Font.Color := color;
  lbl_Ready_For_Use_Clutch_PS.Font.Color := color;
  lbl_Clutch_AllowedPS.Font.Color := color;
  lbl_Remote_Auto_Clutch_PS.Font.Color := Color;

  lbl_Clutch_OutPS.Font.Color := color;
  lbl_Local_Clutch_PS.Font.Color := color;
  lbl_Remote_Manual_Clutch_PS.Font.Color := color;
  lbl_Incr_SpeedPS.Font.Color := color;
  lbl_Ready_For_Use_ME_PS.Font.Color := color;
  lbl_Running_StartPS.Font.Color := color;
  lbl_Remote_Auto_ME_PS.Font.Color := color;
  lbl_Decr_SpeedPS.Font.Color := color;
  lbl_Local_ME_PS.Font.Color := color;
  lbl_Stopped_StopPS.Font.Color := color;
  lbl_Remote_Manual_ME_PS.Font.Color := color;
  lbl_Ready_For_Use_CPP_PS.Font.Color := color;
  lbl_Remote_Auto_CPP_PS.Font.Color := color;
  lbl_Pitch_AS_PS.Font.Color := color;
  lbl_Pitch_AH_PS.Font.Color := color;
  lbl_Local_CPP_PS.Font.Color := color;
  lbl_Remote_Manual_CPP_PS.Font.Color := color;

  lbl_Alarm_PS.Font.Color := color;
  lbl_ME_PS.Font.Color := color;
  lbl_Clutch_GB_PS.Font.Color := color;
  lbl_CPP_PS.Font.Color := color;
end;

procedure TfrmPSPanel.btnClutch_PSClick(Sender: TObject);
begin
  if FReadyForUse_GB and FRemoteManual and PCSSystem.ControlRemotePS then
  begin
    case TSpeedButtonImage(Sender).Tag of
      1:
      if PCSSystem.FClutchAllowedPS then
      begin
        imgClutch_InPS.Picture.LoadFromFile(fIndikatorOn);
        FFlashing_ClutchIn := True;
        PCSSystem.Clutch(C_PCS_GB_PORTS,True);
      end;
      2:
      begin
        imgClutch_OutPS.Picture.LoadFromFile(fIndikatorOn);
        FFlashing_ClutchOut := True;
        PCSSystem.Clutch(C_PCS_GB_PORTS,False);
      end;
    end;
  end;
end;

procedure TfrmPSPanel.btnPSMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if TSpeedButtonImage(Sender).Hint = 'Increase Speed' then
  begin
    imgIncr_SpeedPS.Picture.LoadFromFile(fIndikatorOn);
    SpeedInChange(1,True);
  end
  else if TSpeedButtonImage(Sender).Hint = 'Decrease Speed' then
  begin
    imgDecr_SpeedPS.Picture.LoadFromFile(fIndikatorOn);
    SpeedInChange(-1,True);
  end
  else if TSpeedButtonImage(Sender).Hint = 'Pitch AH' then
  begin
    imgPitch_AHPS.Picture.LoadFromFile(fIndikatorOn);
    PitchInChange(1,True);
  end
  else if TSpeedButtonImage(Sender).Hint = 'Pitch AS' then
  begin
    imgPitch_ASPS.Picture.LoadFromFile(fIndikatorOn);
    PitchInChange(-1,True);
  end;
end;

procedure TfrmPSPanel.btnPSMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if TSpeedButtonImage(Sender).Hint = 'Increase Speed' then
  begin
    imgIncr_SpeedPS.Picture.LoadFromFile(fIndikatorOff);
    SpeedInChange(1,False);
  end
  else if TSpeedButtonImage(Sender).Hint = 'Decrease Speed' then
  begin
    imgDecr_SpeedPS.Picture.LoadFromFile(fIndikatorOff);
    SpeedInChange(-1,False);
  end
  else if TSpeedButtonImage(Sender).Hint = 'Pitch AH' then
  begin
    imgPitch_AHPS.Picture.LoadFromFile(fIndikatorOff);
    PitchInChange(1,False);
  end
  else if TSpeedButtonImage(Sender).Hint = 'Pitch AS' then
  begin
    imgPitch_ASPS.Picture.LoadFromFile(fIndikatorOff);
    PitchInChange(-1,False);
  end;
end;

procedure TfrmPSPanel.btnNoneMouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TfrmPSPanel.btnNoneMouseUp(Sender: TObject; Button: TMouseButton;
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

procedure TfrmPSPanel.btnRemote_Auto_PSClick(Sender: TObject);
begin
  if PCSSystem.ControlRemotePS and FRunningStart then
  begin
    if TSpeedButtonImage(Sender).Hint = 'Gearbox' then
    begin
      if FReadyForUse_GB then
      begin
        imgRemote_Auto_Clutch_PS.Picture.LoadFromFile(fIndikatorOn);
        FFlashing_RemoteAuto := True;
        PCSSystem.Remote(C_PCS_GB_PORTS, C_ORD_GB_REMOTEAUTO, True);
      end;
    end
    else
    if TSpeedButtonImage(Sender).Hint = 'CPP' then
    begin
      if FReadyForUse_CPP then
      begin
        imgRemote_Auto_CPP_PS.Picture.LoadFromFile(fIndikatorOn);
        FFlashing_RemoteAuto := True;
        PCSSystem.Remote(C_PCS_CPP_PORTS, C_ORD_CPP_REMOTEAUTO, True);
      end;
    end
    else
    if TSpeedButtonImage(Sender).Hint = 'Main Engine' then
    begin
      if FReadyForUse_ME and FRunningStart then
      begin
        imgRemote_Auto_ME_PS.Picture.LoadFromFile(fIndikatorOn);
        FFlashing_RemoteAuto := True;
        PCSSystem.Remote(C_PCS_ME_PORTS, C_ORD_ME_REMOTEAUTO, True);
      end;
    end;
  end;
end;

procedure TfrmPSPanel.btnRemote_Manual_PSClick(Sender: TObject);
begin
  if PCSSystem.ControlRemotePS then
  begin
    if TSpeedButtonImage(Sender).Hint = 'Gearbox' then
    begin
      if FReadyForUse_GB then
      begin
        imgRemote_Manual_Clutch_PS.Picture.LoadFromFile(fIndikatorOn);
        FFlashing_RemoteManual := True;
        PCSSystem.Remote(C_PCS_GB_PORTS, C_ORD_GB_REMOTEMAN, False);
      end;
    end
    else
    if TSpeedButtonImage(Sender).Hint = 'CPP' then
    begin
      if FReadyForUse_CPP then
      begin
        imgRemote_Manual_CPP_PS.Picture.LoadFromFile(fIndikatorOn);
        FFlashing_RemoteManual := True;
        PCSSystem.Remote(C_PCS_CPP_PORTS, C_ORD_CPP_REMOTEMAN, False);
      end;
    end
    else
    if TSpeedButtonImage(Sender).Hint = 'Main Engine' then
    begin
      if FReadyForUse_ME and FRunningStart then
      begin
        imgRemote_Manual_ME_PS.Picture.LoadFromFile(fIndikatorOn);
        FFlashing_RemoteManual := True;
        PCSSystem.Remote(C_PCS_ME_PORTS, C_ORD_ME_REMOTEMAN, False);
      end;
    end;
  end;
end;

procedure TfrmPSPanel.btnRunning_StartPSClick(Sender: TObject);
begin
  if FReadyForUse_ME and PCSSystem.ControlRemotePS then
  begin
    imgRunning_StartPS.Picture.LoadFromFile(fIndikatorOn);
    FFlashing_RunningStart := True;
    PCSSystem.RunningStart(C_PCS_ME_PORTS, True);
  end;
end;

procedure TfrmPSPanel.btnStopped_StopPSClick(Sender: TObject);
begin
  if FReadyForUse_ME and FRunningStart and FRemoteManual and PCSSystem.ControlRemotePS then
  begin
    imgStoped_StopPS.Picture.LoadFromFile(fIndikatorOn);
    FFlashing_StoppedStop := True;
    PCSSystem.StoppedStop(C_PCS_ME_PORTS);
  end;
end;

procedure TfrmPSPanel.FormCreate(Sender: TObject);
begin
  FListener := TListeners.Create;
  with PCSSystem.Listener.Add('PORTS') as TPropertyEventListener do begin
    OnPropertyIntChange := PCSSystemEvent;
    OnPropertyBoolChange := PCSSystemEvent;
  end;

  picture_Path    := Copy(ExtractFilePath(Application.ExeName),1,length(ExtractFilePath(Application.ExeName))-4);
  fIndikatorFault := picture_Path + 'bin\Images\Image MCR\IPMS_lampu_indikator_red.bmp';
  fIndikatorOn := picture_Path + 'bin\Images\Image MCR\IPMS_lampu_indikator_green.bmp';
  fIndikatorOff := picture_Path + 'bin\Images\Image MCR\IPMS_lampu_indikator.bmp';

  counterRemote := 0;
  counterStart := 0;
  counterClutch := 0;
end;

procedure TfrmPSPanel.FormDestroy(Sender: TObject);
begin
  FListener.Free;
end;

procedure TfrmPSPanel.FormShow(Sender: TObject);
var
  i : Integer;
begin
//  i:=0;
//  DefaultMonitor := dmDesktop;
//  if Screen.MonitorCount = 1  then
//    i := 0
//  else
//  if Screen.MonitorCount = 2 then
//    i := 1
//  else
//  if Screen.MonitorCount = 3 then
//    i := 2;

  Top := Screen.Monitors[PCSSystem.idFormPCS_PS].Top;
  Left := Screen.Monitors[PCSSystem.idFormPCS_PS].Left;

  r := 255;
  g := 255;
  b := 255;
  image_index := 0;
end;

procedure TfrmPSPanel.LampTestIndicator(aOnOff: Integer);
var
  i : Integer;
begin
  if aOnOff = 10 then
  begin
    imgIncr_SpeedPS.Picture.LoadFromFile(fIndikatorOn);
    imgDecr_SpeedPS.Picture.LoadFromFile(fIndikatorOn);
    imgReady_For_Use_ME_PS.Picture.LoadFromFile(fIndikatorOn);
    imgLocal_ME_PS.Picture.LoadFromFile(fIndikatorOn);
    imgRunning_StartPS.Picture.LoadFromFile(fIndikatorOn);
    imgStoped_StopPS.Picture.LoadFromFile(fIndikatorOn);
    imgRemote_Auto_ME_PS.Picture.LoadFromFile(fIndikatorOn);
    imgRemote_Manual_ME_PS.Picture.LoadFromFile(fIndikatorOn);
    imgPitch_AHPS.Picture.LoadFromFile(fIndikatorOn);
    imgPitch_ASPS.Picture.LoadFromFile(fIndikatorOn);
    imgReady_For_Use_CPP_PS.Picture.LoadFromFile(fIndikatorOn);
    imgLocal_CPP_PS.Picture.LoadFromFile(fIndikatorOn);
    imgRemote_Auto_CPP_PS.Picture.LoadFromFile(fIndikatorOn);
    imgRemote_Manual_CPP_PS.Picture.LoadFromFile(fIndikatorOn);
    imgClutch_InPS.Picture.LoadFromFile(fIndikatorOn);
    imgClutch_OutPS.Picture.LoadFromFile(fIndikatorOn);
    imgReady_For_Use_Clutch_PS.Picture.LoadFromFile(fIndikatorOn);
    imgLocal_Clutch_PS.Picture.LoadFromFile(fIndikatorOn);
    imgClutch_AllowedPS.Picture.LoadFromFile(fIndikatorOn);
    imgRemote_Auto_Clutch_PS.Picture.LoadFromFile(fIndikatorOn);
    imgRemote_Manual_Clutch_PS.Picture.LoadFromFile(fIndikatorOn);
    imgME_FailurePS.Picture.LoadFromFile(fIndikatorFault);
    imgShaft_Power_LimitedPS.Picture.LoadFromFile(fIndikatorFault);
    imgGB_FailurePS.Picture.LoadFromFile(fIndikatorFault);
    imgShaft_LockedPS.Picture.LoadFromFile(fIndikatorFault);
    imgCPP_FailurePS.Picture.LoadFromFile(fIndikatorFault);
    imgPCS_AlarmPS.Picture.LoadFromFile(fIndikatorFault);
    for i := 1 to 5 do
    begin
      TImage(FindComponent('imgNone_'+IntToStr(i))).Picture.LoadFromFile(fIndikatorOn);
    end;
  end
  else if aOnOff = 0 then
  begin
    imgIncr_SpeedPS.Picture.LoadFromFile(fIndikatorOff);
    imgDecr_SpeedPS.Picture.LoadFromFile(fIndikatorOff);
    if not FReadyForUse_ME then
      imgReady_For_Use_ME_PS.Picture.LoadFromFile(fIndikatorOff);
    if not FLocal_ME then
      imgLocal_ME_PS.Picture.LoadFromFile(fIndikatorOff);
    if not FRunningStart then
      imgRunning_StartPS.Picture.LoadFromFile(fIndikatorOff);
    if not FStoppedStop then
      imgStoped_StopPS.Picture.LoadFromFile(fIndikatorOff);
    if not FRemoteAuto then
    begin
      imgRemote_Auto_ME_PS.Picture.LoadFromFile(fIndikatorOff);
      imgRemote_Auto_CPP_PS.Picture.LoadFromFile(fIndikatorOff);
      imgRemote_Auto_Clutch_PS.Picture.LoadFromFile(fIndikatorOff);
    end;
    if not FRemoteManual then
    begin
      imgRemote_Manual_ME_PS.Picture.LoadFromFile(fIndikatorOff);
      imgRemote_Manual_CPP_PS.Picture.LoadFromFile(fIndikatorOff);
      imgRemote_Manual_Clutch_PS.Picture.LoadFromFile(fIndikatorOff);
    end;
    imgPitch_AHPS.Picture.LoadFromFile(fIndikatorOff);
    imgPitch_ASPS.Picture.LoadFromFile(fIndikatorOff);
    if not FReadyForUse_CPP then
      imgReady_For_Use_CPP_PS.Picture.LoadFromFile(fIndikatorOff);
    if not FLocal_CPP then
      imgLocal_CPP_PS.Picture.LoadFromFile(fIndikatorOff);
    if not FClutchIn then
      imgClutch_InPS.Picture.LoadFromFile(fIndikatorOff);
    if not FClutchOut then
      imgClutch_OutPS.Picture.LoadFromFile(fIndikatorOff);
    if not FReadyForUse_GB then
      imgReady_For_Use_Clutch_PS.Picture.LoadFromFile(fIndikatorOff);
    if not FLocal_GB then
      imgLocal_Clutch_PS.Picture.LoadFromFile(fIndikatorOff);
    if not PCSSystem.FClutchAllowedPS then
      imgClutch_AllowedPS.Picture.LoadFromFile(fIndikatorOff);
    if not FME_Failure then
      imgME_FailurePS.Picture.LoadFromFile(fIndikatorOff);
    if not FShaftPowerLimited then
      imgShaft_Power_LimitedPS.Picture.LoadFromFile(fIndikatorOff);
    if not FGB_Failure then
      imgGB_FailurePS.Picture.LoadFromFile(fIndikatorOff);
    if not FShaftLocked then
      imgShaft_LockedPS.Picture.LoadFromFile(fIndikatorOff);
    if not FCPP_Failure then
      imgCPP_FailurePS.Picture.LoadFromFile(fIndikatorOff);
    if not FPCSAlarm then
      imgPCS_AlarmPS.Picture.LoadFromFile(fIndikatorOff);
    for i := 1 to 5 do
      begin
        TImage(FindComponent('imgNone_'+IntToStr(i))).Picture.LoadFromFile(fIndikatorOff);
      end;
  end;
end;

procedure TfrmPSPanel.LocalMCRIndicator(aLocalMCR: string; aOnOff: Boolean);
begin
  if aLocalMCR = 'Local' then
  begin
    FLocal_ME := aOnOff;
    FLocal_GB := aOnOff;
    FLocal_CPP := aOnOff;
    imgLocal_ME_PS.Picture.LoadFromFile(fIndikatorOn);
    imgLocal_Clutch_PS.Picture.LoadFromFile(fIndikatorOn);
    imgLocal_CPP_PS.Picture.LoadFromFile(fIndikatorOn);
  end
  else if aLocalMCR = 'MCR' then
  begin
    FLocal_ME := not aOnOff;
    FLocal_GB := not aOnOff;
    FLocal_CPP := not aOnOff;
    imgLocal_ME_PS.Picture.LoadFromFile(fIndikatorOff);
    imgLocal_Clutch_PS.Picture.LoadFromFile(fIndikatorOff);
    imgLocal_CPP_PS.Picture.LoadFromFile(fIndikatorOff);
  end;
end;

procedure TfrmPSPanel.FlashingIndicatorClutch(SenderOn, SenderOff: TImage;
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
      if SenderOn = imgClutch_InPS then
        FClutchOut := not aOnOff
      else if SenderOn = imgClutch_OutPS then
        FClutchIn := not aOnOff
    end
    else
      TImage(SenderOn).Picture.LoadFromFile(fIndikatorOff);

    counterClutch := 0;
    if SenderOn = imgClutch_InPS then
      FFlashing_ClutchIn := not aOnOff
    else if SenderOn = imgClutch_OutPS then
      FFlashing_ClutchOut := not aOnOff;
  end;
end;

procedure TfrmPSPanel.FlashingIndicatorFailure(Sender: TImage; aControl,
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

procedure TfrmPSPanel.FlashingIndicatorRemote(SenderOn, SenderOff: TImage;
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

procedure TfrmPSPanel.FlashingIndicatorRunning(SenderOn, SenderOff: TImage;
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
      if SenderOn = imgRunning_StartPS then
        FStoppedStop := not aOnOff
      else if SenderOn = imgStoped_StopPS then
        FRunningStart := not aOnOff
    end
    else
      TImage(SenderOn).Picture.LoadFromFile(fIndikatorOff);

    counterStart := 0;
    if SenderOn = imgRunning_StartPS then
      FFlashing_RunningStart := not aOnOff
    else if SenderOn = imgStoped_StopPS then
      FFlashing_StoppedStop := not aOnOff;
  end;
end;

procedure TfrmPSPanel.RemoteIndicatorLamp(aAutoManual: string; aOnOff: Boolean);
begin
  if aAutoManual = 'Auto' then
  begin
    if aOnOff then
    begin
      imgRemote_Auto_ME_PS.Picture.LoadFromFile(fIndikatorOn);
      imgRemote_Auto_Clutch_PS.Picture.LoadFromFile(fIndikatorOn);
      imgRemote_Auto_CPP_PS.Picture.LoadFromFile(fIndikatorOn);
      imgRemote_Manual_CPP_PS.Picture.LoadFromFile(fIndikatorOff);
      FRemoteAuto := aOnOff;
      FRemoteManual := not aOnOff;
    end
    else
    begin
      imgRemote_Auto_ME_PS.Picture.LoadFromFile(fIndikatorOff);
      imgRemote_Auto_Clutch_PS.Picture.LoadFromFile(fIndikatorOff);
      FRemoteAuto := not aOnOff;
    end;
  end
  else if aAutoManual = 'Manual' then
  begin
    if aOnOff then
    begin
      imgRemote_Manual_ME_PS.Picture.LoadFromFile(fIndikatorOn);
      imgRemote_Manual_Clutch_PS.Picture.LoadFromFile(fIndikatorOn);
      imgRemote_Manual_CPP_PS.Picture.LoadFromFile(fIndikatorOn);
      imgRemote_Auto_CPP_PS.Picture.LoadFromFile(fIndikatorOff);
      FRemoteManual := aOnOff;
      FRemoteAuto := not aOnOff;
      if not FFlashing_RemoteManual then
        FFlashing_RemoteManual := aOnOff;
    end
    else
    begin
      imgRemote_Manual_ME_PS.Picture.LoadFromFile(fIndikatorOff);
      imgRemote_Manual_Clutch_PS.Picture.LoadFromFile(fIndikatorOff);
      FRemoteManual := not aOnOff;
    end;
  end;
end;

procedure TfrmPSPanel.SpeedInChange(aIncreaseDecrease: Integer;
  aOnOff: Boolean);
begin
  if FReadyForUse_ME and FRunningStart and FRemoteManual and PCSSystem.ControlRemotePS then
  begin
    PCSSystem.Speed(C_PCS_ME_PORTS,aIncreaseDecrease,aOnOff);
  end;
end;

procedure TfrmPSPanel.PitchInChange(aAheadAstern: Integer; aOnOff: Boolean);
begin
  if FReadyForUse_CPP and FRemoteManual and PCSSystem.ControlRemotePS then
  begin
    PCSSystem.Pitch(C_PCS_CPP_PORTS,aAheadAstern,aOnOff);
  end;
end;

procedure TfrmPSPanel.FlashingIndicatorTimerTimer(Sender: TObject);
begin

  if FFlashing_RunningStart then
    FlashingIndicatorRunning(imgRunning_StartPS,imgStoped_StopPS,FRunningStart,True);

  if FFlashing_StoppedStop then
    FlashingIndicatorRunning(imgStoped_StopPS,imgRunning_StartPS,FStoppedStop,True);

  if FFlashing_ClutchIn then
    FlashingIndicatorClutch(imgClutch_InPS,imgClutch_OutPS,FClutchIn,True);

  if FFlashing_ClutchOut then
    FlashingIndicatorClutch(imgClutch_OutPS,imgClutch_InPS,FClutchOut,True);

//  if FFlashing_RemoteAuto then
//  begin
//    FlashingIndicatorRemote(imgRemote_Auto_ME_PS,imgRemote_Manual_ME_PS,'Auto',FRemoteAuto,True);
//    FlashingIndicatorRemote(imgRemote_Auto_Clutch_PS,imgRemote_Manual_Clutch_PS,'Auto',FRemoteAuto,True);
//    FlashingIndicatorRemote(imgRemote_Auto_CPP_PS,imgRemote_Manual_CPP_PS,'Auto',FRemoteAuto,True);
//  end;
//
//  if FFlashing_RemoteManual then
//  begin
//    FlashingIndicatorRemote(imgRemote_Manual_ME_PS,imgRemote_Auto_ME_PS,'Manual',FRemoteManual,True);
//    FlashingIndicatorRemote(imgRemote_Manual_Clutch_PS,imgRemote_Auto_Clutch_PS,'Manual',FRemoteManual,True);
//    FlashingIndicatorRemote(imgRemote_Manual_CPP_PS,imgRemote_Auto_CPP_PS,'Manual',FRemoteManual,True);
//  end;

  if FFlashing_RemoteAuto then
  begin
    counterRemote := counterRemote + 1;

    if counterRemote < 5 then
    begin
      if imgRemote_Auto_Clutch_PS.Visible then
        imgRemote_Auto_Clutch_PS.Visible := False
      else
        imgRemote_Auto_Clutch_PS.Visible := True;

      if imgRemote_Auto_ME_PS.Visible then
        imgRemote_Auto_ME_PS.Visible := False
      else
        imgRemote_Auto_ME_PS.Visible := True;

      if imgRemote_Auto_CPP_PS.Visible then
        imgRemote_Auto_CPP_PS.Visible := False
      else
        imgRemote_Auto_CPP_PS.Visible := True;
    end;

    if counterRemote > 5 then
    begin
      if FRemoteAuto then
      begin
        imgRemote_Auto_Clutch_PS.Visible := True;
        imgRemote_Auto_ME_PS.Visible := True;
        imgRemote_Auto_CPP_PS.Visible := True;
        imgRemote_Auto_Clutch_PS.Picture.LoadFromFile(fIndikatorOn);
        imgRemote_Manual_Clutch_PS.Picture.LoadFromFile(fIndikatorOff);
        imgRemote_Auto_ME_PS.Picture.LoadFromFile(fIndikatorOn);
        imgRemote_Manual_ME_PS.Picture.LoadFromFile(fIndikatorOff);
        imgRemote_Auto_CPP_PS.Picture.LoadFromFile(fIndikatorOn);
        imgRemote_Manual_CPP_PS.Picture.LoadFromFile(fIndikatorOff);
        FRemoteManual := False;
      end
      else
      begin
        imgRemote_Auto_Clutch_PS.Picture.LoadFromFile(fIndikatorOff);
        imgRemote_Auto_ME_PS.Picture.LoadFromFile(fIndikatorOff);
        imgRemote_Auto_CPP_PS.Picture.LoadFromFile(fIndikatorOff);
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
      if imgRemote_Manual_Clutch_PS.Visible then
        imgRemote_Manual_Clutch_PS.Visible := False
      else
        imgRemote_Manual_Clutch_PS.Visible := True;

      if imgRemote_Manual_ME_PS.Visible then
        imgRemote_Manual_ME_PS.Visible := False
      else
        imgRemote_Manual_ME_PS.Visible := True;

      if imgRemote_Manual_CPP_PS.Visible then
        imgRemote_Manual_CPP_PS.Visible := False
      else
        imgRemote_Manual_CPP_PS.Visible := True;
    end;

    if counterRemote > 5 then
    begin
      if FRemoteManual then
      begin
        imgRemote_Manual_Clutch_PS.Visible := True;
        imgRemote_Manual_ME_PS.Visible := True;
        imgRemote_Manual_CPP_PS.Visible := True;
        imgRemote_Manual_Clutch_PS.Picture.LoadFromFile(fIndikatorOn);
        imgRemote_Auto_Clutch_PS.Picture.LoadFromFile(fIndikatorOff);
        imgRemote_Manual_ME_PS.Picture.LoadFromFile(fIndikatorOn);
        imgRemote_Auto_ME_PS.Picture.LoadFromFile(fIndikatorOff);
        imgRemote_Manual_CPP_PS.Picture.LoadFromFile(fIndikatorOn);
        imgRemote_Auto_CPP_PS.Picture.LoadFromFile(fIndikatorOff);
        FRemoteAuto := False;
      end
      else
      begin
        imgRemote_Manual_Clutch_PS.Picture.LoadFromFile(fIndikatorOff);
        imgRemote_Manual_ME_PS.Picture.LoadFromFile(fIndikatorOff);
        imgRemote_Manual_CPP_PS.Picture.LoadFromFile(fIndikatorOff);
      end;
      counterRemote := 0;
      FFlashing_RemoteManual := False;
    end;
  end;

  if FME_Failure then
    FlashingIndicatorFailure(imgME_FailurePS,FAlarmAccept[0],True);

  if FGB_Failure then
    FlashingIndicatorFailure(imgGB_FailurePS,FAlarmAccept[1],True);

  if FCPP_Failure then
    FlashingIndicatorFailure(imgCPP_FailurePS,FAlarmAccept[2],True);

  if FShaftPowerLimited then
    FlashingIndicatorFailure(imgShaft_Power_LimitedPS,FAlarmAccept[3],True);

  if FShaftLocked then
    FlashingIndicatorFailure(imgShaft_LockedPS,FAlarmAccept[4],True);

  if FPCSAlarm then
    FlashingIndicatorFailure(imgPCS_AlarmPS,FAlarmAccept[5],True);

  if FAlarmAcceptPS then
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

    FAlarmAcceptPS := False;
  end;

end;

procedure TfrmPSPanel.PCSSystemEvent(Sender: TObject; PropsID: E_PropsID;
  Value: Boolean);
begin
  case PropsID of
    epPCSMEPSRunStart:
      begin
        if Value then
        begin
          //On
          imgRunning_StartPS.Picture.LoadFromFile(fIndikatorOn);
          FFlashing_RunningStart := Value;
          FRunningStart := Value;
          FStoppedStop := not Value;
        end
        else
        begin
          //Off
          imgRunning_StartPS.Picture.LoadFromFile(fIndikatorOff);
          FRunningStart := not Value;
          FStoppedStop := True;
        end;
      end;

    epPCSMEPSRemoteAuto, epPCSGBRemoteAutoPS:
      RemoteIndicatorLamp('Auto',Value);

    epPCSMEPSRemoteManual, epPCSGBRemoteManualPS:
      RemoteIndicatorLamp('Manual',Value);

    epPCSCPPRemotePS:
      RemoteIndicatorLamp('Auto',Value);

    epPCSGBClutchAllowedPS:
      if Value then
        imgClutch_AllowedPS.Picture.LoadFromFile(fIndikatorOn)
      else
        imgClutch_AllowedPS.Picture.LoadFromFile(fIndikatorOff);

    epPCSGBClutchEngagedPS:
      if Value then
      begin
        FClutchIn := Value;
        FClutchOut := not Value;
        imgClutch_InPS.Picture.LoadFromFile(fIndikatorOn);
        imgClutch_OutPS.Picture.LoadFromFile(fIndikatorOff);
      end
      else
      begin
        FClutchIn := not Value;
        FClutchOut := Value;
        imgClutch_InPS.Picture.LoadFromFile(fIndikatorOff);
        imgClutch_OutPS.Picture.LoadFromFile(fIndikatorOn);
      end;

    epPCSMEReadyForUsePS:
      if Value then
      begin
        FReadyForUse_ME := Value;
        imgReady_For_Use_ME_PS.Picture.LoadFromFile(fIndikatorOn);
      end
      else
      begin
        FReadyForUse_ME := not Value;
        imgReady_For_Use_ME_PS.Picture.LoadFromFile(fIndikatorOff);
      end;

    epPCSCPPReadyForUsePS:
      if Value then
      begin
        FReadyForUse_CPP := Value;
        imgReady_For_Use_CPP_PS.Picture.LoadFromFile(fIndikatorOn);
      end
      else
      begin
        FReadyForUse_CPP := not Value;
        imgReady_For_Use_CPP_PS.Picture.LoadFromFile(fIndikatorOff);
      end;

    epPCSGBReadyForUsePS:
      if Value then
      begin
        FReadyForUse_GB := Value;
        imgReady_For_Use_Clutch_PS.Picture.LoadFromFile(fIndikatorOn);
      end
      else
      begin
        FReadyForUse_GB := not Value;
        imgReady_For_Use_Clutch_PS.Picture.LoadFromFile(fIndikatorOff);
      end;

    epPCSCtrlLocalPS:
      if Value then
        LocalMCRIndicator('Local', Value);

    epPCSCtrlMCRPS:
      if Value then
        LocalMCRIndicator('MCR', Value);

    epPCSMEFailurePS:
      if Value then
      begin
        FME_Failure := Value;
        imgME_FailurePS.Picture.LoadFromFile(fIndikatorFault);
        FAlarmAccept[0] := not Value;
      end
      else
      begin
        FME_Failure := not Value;
        imgME_FailurePS.Picture.LoadFromFile(fIndikatorOff);
      end;

    epPCSGBFailurePS:
      if Value then
      begin
        FGB_Failure := Value;
        imgGB_FailurePS.Picture.LoadFromFile(fIndikatorFault);
        FAlarmAccept[1] := not Value;
      end
      else
      begin
        FGB_Failure := False;
        imgGB_FailurePS.Picture.LoadFromFile(fIndikatorOff);
      end;

    epPCSCPPFailurePS:
      if Value then
      begin
        FCPP_Failure := Value;
        imgCPP_FailurePS.Picture.LoadFromFile(fIndikatorFault);
        FAlarmAccept[2] := not Value;
      end
      else
      begin
        FCPP_Failure := not Value;
        imgCPP_FailurePS.Picture.LoadFromFile(fIndikatorOff);
      end;

    epPCSGBShaftPowerLimitedPS:
      if Value then
      begin
        FShaftPowerLimited := Value;
        imgShaft_Power_LimitedPS.Picture.LoadFromFile(fIndikatorFault);
        FAlarmAccept[3] := not Value;
      end
      else
      begin
        FShaftPowerLimited := not Value;
        imgShaft_Power_LimitedPS.Picture.LoadFromFile(fIndikatorOff);
      end;

    epPCSGBShaftLockedPS:
      if Value then
      begin
        FShaftLocked := Value;
        imgShaft_LockedPS.Picture.LoadFromFile(fIndikatorFault);
        FAlarmAccept[4] := not Value;
      end
      else
      begin
        FShaftLocked := not Value;
        imgShaft_LockedPS.Picture.LoadFromFile(fIndikatorOff);
      end;

    epPCSAlarmsPS:
      if Value then
      begin
        FPCSAlarm := Value;
        imgPCS_AlarmPS.Picture.LoadFromFile(fIndikatorFault);
        FAlarmAccept[5] := not Value;
      end
      else
      begin
        FPCSAlarm := not Value;
        imgPCS_AlarmPS.Picture.LoadFromFile(fIndikatorOff);
      end;

    epPCSCtrlAlarmAccept:
      if Value then
        FAlarmAcceptPS := Value;
  end;
end;

procedure TfrmPSPanel.PCSSystemEvent(Sender: TObject; PropsID: E_PropsID;
  Value: Integer);
begin
  case PropsID of
    epPCSFreezed:
      if Value = 1 then
      begin
        frmPSPanel.Enabled := False;
        PCSSystem.FFormFreezed[1] := TfrmFreeze.Create(frmPSPanel);
        with PCSSystem.FFormFreezed[1] do
        begin
          Parent := frmPSPanel;
          Position := poOwnerFormCenter;
          BringToFront;
          Show;
        end;
      end
      else if Value = 0 then
      begin
        frmPSPanel.Enabled := True;
        if Assigned(PCSSystem.FFormFreezed[1]) then
          FreeAndNil(PCSSystem.FFormFreezed[1]);
      end;

    epPCSCtrlBackgroundLamp:
      BackgroundLampIndicator(Value);

    epPCSCtrlLamptTest:
      LampTestIndicator(Value);
  end;
end;
end.
