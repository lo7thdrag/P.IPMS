unit uEventForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Math, Dialogs,ExtCtrls, uLibPCS, StdCtrls;

type
  TEventForm = class

  private


  public

  procedure eventBtnAlarm_AcceptOnClick;
  procedure eventBtnStop_HornOnClick;
  procedure eventBtnLamp_TestOnClick;
  procedure eventBtnMCR_PSOnClick;
  procedure eventBtnMCR_SBOnClick;
  procedure eventBtnBridge_PSOnClick;
  procedure eventBtnBridge_SBOnClick;
  procedure eventBtnTransitOnClick;
  procedure eventBtnManoeuvreOnClick;



  end;
var
  EventForm : TEventForm;

implementation

uses
  uGeneralPanel, uPSPanel, uSBPanel;

{ TEventForm }

procedure TEventForm.eventBtnAlarm_AcceptOnClick;
begin

//  ThePCS.Alarm_Accept.isOn := True;

end;

procedure TEventForm.eventBtnBridge_PSOnClick;
begin

end;

procedure TEventForm.eventBtnBridge_SBOnClick;
begin

end;

procedure TEventForm.eventBtnLamp_TestOnClick;
var
  i : Integer;
begin
  if frm_GeneralPanel.Cek_Lamp_Test = False then
  begin
    with frm_GeneralPanel do
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
//         ('Cek_None_'+IntToStr(i)):= True;
//        TLabel(FindComponent('lbl_'+IntToStr(i))).Font.Color:=Color;
      end;

    end;

    with frmPSPanel do
    begin
      imgME_FailurePS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgGB_FailurePS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgCPP_FailurePS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgShaft_Power_LimitedPS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgShaft_LockedPS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgPCS_AlarmPS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgClutch_InPS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgReady_For_Use_Clutch_PS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgClutch_AllowedPS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgRemote_Auto_Clutch_PS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgClutch_OutPS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgLocal_Clutch_PS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgRemote_Manual_Clutch_PS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgIncr_SpeedPS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgReady_For_Use_ME_PS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgRunning_StartPS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgRemote_Auto_ME_PS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgDecr_SpeedPS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgDecr_SpeedPS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgLocal_ME_PS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgStoped_StopPS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgRemote_Manual_ME_PS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgPitch_AHPS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgReady_For_Use_CPP_PS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgRemote_Auto_CPP_PS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgPitch_ASPS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imglocal_CPP_PS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgRemote_Manual_CPP_PS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);

      for i := 1 to 5 do
      begin
        TImage(FindComponent('imgNone_'+IntToStr(i))).Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      end;
    end;

    with frmSBPanel do
    begin
      imgME_FailureSB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgGB_FailureSB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgCPP_FailureSB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgShaft_Power_LimitedSB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgShaft_LockedSB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgPCS_AlarmSB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgClutch_InSB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgReady_For_Use_Clutch_SB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgClutch_AllowedSB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgRemote_Auto_Clutch_SB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgClutch_OutSB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgLocal_Clutch_SB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgRemote_Manual_Clutch_SB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgIncr_SpeedSB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgReady_For_Use_ME_SB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgRunning_StartSB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgRemote_Auto_ME_SB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgDecr_SpeedSB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgDecr_SpeedSB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgLocal_ME_SB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgStoped_StopSB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgRemote_Manual_ME_SB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgPitch_AH_SB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgReady_For_Use_CPP_SB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgRemote_Auto_CPP_SB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgPitch_AS_SB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgLocal_CPP_SB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      imgRemote_Manual_CPP_SB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);

      for i := 1 to 5 do
      begin
        TImage(FindComponent('imgNone_'+IntToStr(i))).Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOn);
      end;
    end;

    frm_GeneralPanel.Cek_Lamp_Test := True;
  end
  else if frm_GeneralPanel.Cek_Lamp_Test = True then
  begin
    with frm_GeneralPanel do
    begin
      imgAlarmAccept.Picture.LoadFromFile(fIndikatorOff);
      imgStopHorn.Picture.LoadFromFile(fIndikatorOff);
      imgLampTest.Picture.LoadFromFile(fIndikatorOff);
      imgMCR_PS.Picture.LoadFromFile(fIndikatorOff);
      imgMCR_SB.Picture.LoadFromFile(fIndikatorOff);
      imgBridge_PS.Picture.LoadFromFile(fIndikatorOff);
      imgBridge_SB.Picture.LoadFromFile(fIndikatorOff);
      imgTransit.Picture.LoadFromFile(fIndikatorOff);
      imgManouvre.Picture.LoadFromFile(fIndikatorOff);

      for i := 1 to 11 do
      begin
        TImage(FindComponent('imgNone_'+IntToStr(i))).Picture.LoadFromFile(fIndikatorOff);
      end;

    end;

    with frmPSPanel do
    begin
      imgME_FailurePS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgGB_FailurePS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgCPP_FailurePS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgShaft_Power_LimitedPS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgShaft_LockedPS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgPCS_AlarmPS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgClutch_InPS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgReady_For_Use_Clutch_PS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgClutch_AllowedPS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgRemote_Auto_Clutch_PS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgClutch_OutPS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgLocal_Clutch_PS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgRemote_Manual_Clutch_PS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgIncr_SpeedPS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgReady_For_Use_ME_PS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgRunning_StartPS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgRemote_Auto_ME_PS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgDecr_SpeedPS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgDecr_SpeedPS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgLocal_ME_PS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgStoped_StopPS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgRemote_Manual_ME_PS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgPitch_AHPS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgReady_For_Use_CPP_PS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgRemote_Auto_CPP_PS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgPitch_ASPS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imglocal_CPP_PS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgRemote_Manual_CPP_PS.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);

      for i := 1 to 5 do
      begin
        TImage(FindComponent('imgNone_'+IntToStr(i))).Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      end;
    end;

    with frmSBPanel do
    begin
      imgME_FailureSB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgGB_FailureSB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgCPP_FailureSB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgShaft_Power_LimitedSB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgShaft_LockedSB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgPCS_AlarmSB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgClutch_InSB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgReady_For_Use_Clutch_SB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgClutch_AllowedSB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgRemote_Auto_Clutch_SB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgClutch_OutSB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgLocal_Clutch_SB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgRemote_Manual_Clutch_SB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgIncr_SpeedSB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgReady_For_Use_ME_SB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgRunning_StartSB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgRemote_Auto_ME_SB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgDecr_SpeedSB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgDecr_SpeedSB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgLocal_ME_SB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgStoped_StopSB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgRemote_Manual_ME_SB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgPitch_AH_SB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgReady_For_Use_CPP_SB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgRemote_Auto_CPP_SB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgPitch_AS_SB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgLocal_CPP_SB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      imgRemote_Manual_CPP_SB.Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);

      for i := 1 to 5 do
      begin
        TImage(FindComponent('imgNone_'+IntToStr(i))).Picture.LoadFromFile(frm_GeneralPanel.fIndikatorOff);
      end;
    end;
    frm_GeneralPanel.Cek_Lamp_Test := False;
  end;
end;
procedure TEventForm.eventBtnManoeuvreOnClick;
begin

end;

procedure TEventForm.eventBtnMCR_PSOnClick;
begin

end;

procedure TEventForm.eventBtnMCR_SBOnClick;
begin

end;

procedure TEventForm.eventBtnStop_HornOnClick;
begin

end;

procedure TEventForm.eventBtnTransitOnClick;
begin

end;

end.
