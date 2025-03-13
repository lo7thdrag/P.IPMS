unit uPCSPanelBridge;

interface


uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, ImgList, Buttons, SpeedButtonImage,
  uDataType, uListener;

type
  TfrmPCSPanelBridge = class(TForm)
    pnlAlarmPS: TPanel;
    pnlMESB: TPanel;
    pnlMEPS: TPanel;
    pnlAlarmSB: TPanel;
    pnlControlPosition: TPanel;
    pnlGeneral: TPanel;
    pnlControlLever: TPanel;
    imgAlarmPS: TImage;
    imgPCSPanelBridgeBackground: TImage;
    imgMEPS: TImage;
    imgMESB: TImage;
    imgAlarmSB: TImage;
    imgControlPosition: TImage;
    imgControlLever: TImage;
    lblAlarmPS: TLabel;
    lblMEPS: TLabel;
    lblMESB: TLabel;
    lblAlarmSB: TLabel;
    lblGBPS: TLabel;
    lblGBSB: TLabel;
    lblCPPPS: TLabel;
    lblCPPSB: TLabel;
    lblControlPosition: TLabel;
    lblGeneral: TLabel;
    lblModes: TLabel;
    lbl_Indicator: TLabel;
    btnMEFailure_PS: TSpeedButtonImage;
    ilButton: TImageList;
    btnGBFailure_PS: TSpeedButtonImage;
    btnCPPFailure_PS: TSpeedButtonImage;
    btnNone1_PS: TSpeedButtonImage;
    btnShaftPowerLimited_PS: TSpeedButtonImage;
    btnShaftLocked_PS: TSpeedButtonImage;
    btnPCSAlarm_PS: TSpeedButtonImage;
    btnNone2_PS: TSpeedButtonImage;
    btnClutchIn_PS: TSpeedButtonImage;
    btnReadyForUseGB_PS: TSpeedButtonImage;
    btnClutchAllowed_PS: TSpeedButtonImage;
    btnRemoteAutoGB_PS: TSpeedButtonImage;
    btnClutchOut_PS: TSpeedButtonImage;
    btnLocalGB_PS: TSpeedButtonImage;
    btnNone3_PS: TSpeedButtonImage;
    btnRemoteManualGB_PS: TSpeedButtonImage;
    btnClutchAllowed_SB: TSpeedButtonImage;
    btnClutchIn_SB: TSpeedButtonImage;
    btnClutchOut_SB: TSpeedButtonImage;
    btnCPPFailure_SB: TSpeedButtonImage;
    btnGBFailure_SB: TSpeedButtonImage;
    btnLocalGB_SB: TSpeedButtonImage;
    btnMEFailure_SB: TSpeedButtonImage;
    btnNone1_SB: TSpeedButtonImage;
    btnNone2_SB: TSpeedButtonImage;
    btnNone3_SB: TSpeedButtonImage;
    btnPCSAlarm_SB: TSpeedButtonImage;
    btnReadyForUseGB_SB: TSpeedButtonImage;
    btnRemoteAutoGB_SB: TSpeedButtonImage;
    btnRemoteManualGB_SB: TSpeedButtonImage;
    btnShaftLocked_SB: TSpeedButtonImage;
    btnShaftPowerLimited_SB: TSpeedButtonImage;
    btnNone4_PS: TSpeedButtonImage;
    btnPitchAH_PS: TSpeedButtonImage;
    btnPitchAS_PS: TSpeedButtonImage;
    btnRunning_PS: TSpeedButtonImage;
    btnReadyForUseME_PS: TSpeedButtonImage;
    btnLocalCPP_PS: TSpeedButtonImage;
    btnIncreaseSpeed_PS: TSpeedButtonImage;
    btnRemoteAutoME_PS: TSpeedButtonImage;
    btnRemoteManualME_PS: TSpeedButtonImage;
    btnNone5_PS: TSpeedButtonImage;
    btnStopped_PS: TSpeedButtonImage;
    btnReadyForUseCPP_PS: TSpeedButtonImage;
    btnRemoteAutoCPP_PS: TSpeedButtonImage;
    btnRemoteManualCPP_PS: TSpeedButtonImage;
    btnLocalME_PS: TSpeedButtonImage;
    btnDecreaseSpeed_PS: TSpeedButtonImage;
    btnDecreaseSpeed_SB: TSpeedButtonImage;
    btnIncreaseSpeed_SB: TSpeedButtonImage;
    btnLocalCPP_SB: TSpeedButtonImage;
    btnLocalME_SB: TSpeedButtonImage;
    btnNone4_SB: TSpeedButtonImage;
    btnNone5_SB: TSpeedButtonImage;
    btnPitchAH_SB: TSpeedButtonImage;
    btnPitchAS_SB: TSpeedButtonImage;
    btnReadyForUseCPP_SB: TSpeedButtonImage;
    btnReadyForUseME_SB: TSpeedButtonImage;
    btnRemoteAutoCPP_SB: TSpeedButtonImage;
    btnRemoteAutoME_SB: TSpeedButtonImage;
    btnRemoteManualCPP_SB: TSpeedButtonImage;
    btnRemoteManualME_SB: TSpeedButtonImage;
    btnRunning_SB: TSpeedButtonImage;
    btnStopped_SB: TSpeedButtonImage;
    btnNone2: TSpeedButtonImage;
    btnMCR_PS: TSpeedButtonImage;
    btnNone9: TSpeedButtonImage;
    btnNone3: TSpeedButtonImage;
    btnManoeuvring: TSpeedButtonImage;
    btnNone10: TSpeedButtonImage;
    btnNone6: TSpeedButtonImage;
    btnNone8: TSpeedButtonImage;
    btnTransit: TSpeedButtonImage;
    btnMCR_SB: TSpeedButtonImage;
    btnNone7: TSpeedButtonImage;
    btnBridge_SB: TSpeedButtonImage;
    btnNone11: TSpeedButtonImage;
    btnNone5: TSpeedButtonImage;
    btnBridge_PS: TSpeedButtonImage;
    btnNone4: TSpeedButtonImage;
    btnDecreaseIndicator: TSpeedButtonImage;
    btnIncreaseIndicator: TSpeedButtonImage;
    btnDecreaseBackground: TSpeedButtonImage;
    btnIncreaseBackground: TSpeedButtonImage;
    btnAlarm_Accept: TSpeedButtonImage;
    btnStopHorn: TSpeedButtonImage;
    btnNone1: TSpeedButtonImage;
    btnLampTest: TSpeedButtonImage;
    lblBack: TLabel;
    imgMEFailure_PS: TImage;
    imgGBFailure_PS: TImage;
    imgCPPFailue_PS: TImage;
    imgNone1_PS: TImage;
    imgShaftPowerLimited_PS: TImage;
    imgShaftLocked_PS: TImage;
    imgPCSAlarm_PS: TImage;
    imgNone2_PS: TImage;
    imgClutchIn_PS: TImage;
    imgReadyForUseGB_PS: TImage;
    imgClutchAllowed_PS: TImage;
    imgRemoteAutoGB_PS: TImage;
    imgClutchOut_PS: TImage;
    imgLocalGB_PS: TImage;
    imgNone3_PS: TImage;
    imgRemoteManualGB_PS: TImage;
    imgNone4_PS: TImage;
    imgPitchAH_PS: TImage;
    imgPitchAS_PS: TImage;
    imgRunning_PS: TImage;
    imgReadyForUseME_PS: TImage;
    imgLocalCPP_PS: TImage;
    imgIncreaseSpeed_PS: TImage;
    imgRemoteAutoME_PS: TImage;
    imgRemoteManualME_PS: TImage;
    imgNone5_PS: TImage;
    imgStopped_PS: TImage;
    imgReadyForUseCPP_PS: TImage;
    imgRemoteAutoCPP_PS: TImage;
    imgRemoteManualCPP_PS: TImage;
    imgLocalME_PS: TImage;
    imgDecreaseSpeed_PS: TImage;
    imgDecreaseSpeed_SB: TImage;
    imgIncreaseSpeed_SB: TImage;
    imgLocalCPP_SB: TImage;
    imgLocalME_SB: TImage;
    imgNone4_SB: TImage;
    imgNone5_SB: TImage;
    imgPitchAH_SB: TImage;
    imgPitchAS_SB: TImage;
    imgReadyForUseCPP_SB: TImage;
    imgReadyForUseME_SB: TImage;
    imgRemoteAutoCPP_SB: TImage;
    imgRemoteAutoME_SB: TImage;
    imgRemoteManualCPP_SB: TImage;
    imgRemoteManualME_SB: TImage;
    imgRunning_SB: TImage;
    imgStopped_SB: TImage;
    imgShaftPowerLimited_SB: TImage;
    imgMEFailure_SB: TImage;
    imgLocalGB_SB: TImage;
    imgShaftLocked_SB: TImage;
    imgClutchAllowed_SB: TImage;
    imgNone3_SB: TImage;
    imgClutchIn_SB: TImage;
    imgClutchOut_SB: TImage;
    imgReadyForUseGB_SB: TImage;
    imgGBFailure_SB: TImage;
    imgRemoteAutoGB_SB: TImage;
    imgNone1_SB: TImage;
    imgRemoteManualGB_SB: TImage;
    imgNone2_SB: TImage;
    imgCPPFailure_SB: TImage;
    imgPCSAlarm_SB: TImage;
    imgNone2: TImage;
    imgMCR_PS: TImage;
    imgNone9: TImage;
    imgNone3: TImage;
    imgManoeuvring: TImage;
    imgNone10: TImage;
    imgNone6: TImage;
    imgNone8: TImage;
    imgTransit: TImage;
    imgMCR_SB: TImage;
    imgNone7: TImage;
    imgBridge_SB: TImage;
    imgNone11: TImage;
    imgNone5: TImage;
    imgBridge_PS: TImage;
    imgNone4: TImage;
    img2: TImage;
    img3: TImage;
    img4: TImage;
    img5: TImage;
    imgAlarmAccept: TImage;
    imgStopHorn: TImage;
    imgNone1: TImage;
    imgLampTest: TImage;
    imgLeftAhead: TImage;
    imgRightAhead: TImage;
    imgLeftAstern: TImage;
    imgRightAstern: TImage;
    lblAlarmPS_1: TLabel;
    lblAlarmPS_2: TLabel;
    lblAlarmPS_3: TLabel;
    lblAlarmPS_4: TLabel;
    lblAlarmPS_5: TLabel;
    lblAlarmPS_6: TLabel;
    lblGBPS_1: TLabel;
    lblGBPS_5: TLabel;
    lblGBPS_2: TLabel;
    lblGBPS_3: TLabel;
    lblGBPS_4: TLabel;
    lblGBPS_6: TLabel;
    lblGBPS_7: TLabel;
    lblAlarmSB_1: TLabel;
    lblAlarmSB_2: TLabel;
    lblAlarmSB_3: TLabel;
    lblAlarmSB_4: TLabel;
    lblAlarmSB_5: TLabel;
    lblAlarmSB_6: TLabel;
    lblGBSB_1: TLabel;
    lblGBSB_2: TLabel;
    lblGBSB_3: TLabel;
    lblGBSB_4: TLabel;
    lblGBSB_5: TLabel;
    lblGBSB_6: TLabel;
    lblGBSB_7: TLabel;
    lblMEPS_1: TLabel;
    lblMEPS_2: TLabel;
    lblMEPS_3: TLabel;
    lblMEPS_5: TLabel;
    lblMEPS_6: TLabel;
    lblMEPS_7: TLabel;
    lblCPPPS_1: TLabel;
    lblCPPPS_2: TLabel;
    lblCPPPS_3: TLabel;
    lblCPPPS_4: TLabel;
    lblCPPPS_5: TLabel;
    lblCPPPS_6: TLabel;
    lblMEPS_4: TLabel;
    lblMEPS_8: TLabel;
    lblCPPSB_1: TLabel;
    lblCPPSB_2: TLabel;
    lblCPPSB_3: TLabel;
    lblCPPSB_4: TLabel;
    lblCPPSB_5: TLabel;
    lblCPPSB_6: TLabel;
    lblMESB_1: TLabel;
    lblMESB_2: TLabel;
    lblMESB_3: TLabel;
    lblMESB_4: TLabel;
    lblMESB_5: TLabel;
    lblMESB_6: TLabel;
    lblMESB_7: TLabel;
    lblMESB_8: TLabel;
    lblCTRL_1: TLabel;
    lblCTRL_2: TLabel;
    lblCTRL_3: TLabel;
    lblCTRL_4: TLabel;
    lblCTRL_5: TLabel;
    lblCTRL_6: TLabel;
    lblGeneral_1: TLabel;
    lblGeneral_3: TLabel;
    lblGeneral_4: TLabel;
    lblGeneral_5: TLabel;
    lblGeneral_6: TLabel;
    lblGeneral_7: TLabel;
    lblGeneral_2: TLabel;
    imgGeneral: TImage;
    procedure FormCreate(Sender: TObject);
    procedure changeBackgroundColor(Change : Boolean);
    procedure FormDestroy(Sender: TObject);


  private
    { Private declarations }
    FListener : TListeners;
    procedure PCSSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Integer);overload;

  public
    { Public declarations }
    //setting warna
    r, g, b : Byte;
    image_index : Integer;

  end;

var
  frmPCSPanelBridge: TfrmPCSPanelBridge;

implementation

uses uPCSSystem;

{$R *.dfm}



procedure TfrmPCSPanelBridge.changeBackgroundColor(change : Boolean);
var
  i : Integer;
begin
  if Change = False then
  begin
     if b <> 255 then
        b := b + 51;  //Bertambah redup
  end
  else
  begin
    if b <> 0 then
      b := b - 51  //Bertambah terang
  end;

  color := RGB (r, g, b);
  for i := 1 to 6 do
  begin
    TLabel(FindComponent('lblAlarmPS_'+IntToStr(i))).Font.Color := Color;
    TLabel(FindComponent('lblCPPPS_'+IntToStr(i))).Font.Color := Color;
    TLabel(FindComponent('lblAlarmSB_'+IntToStr(i))).Font.Color := Color;
    TLabel(FindComponent('lblCPPSB_'+IntToStr(i))).Font.Color := Color;
    TLabel(FindComponent('lblCTRL_'+IntToStr(i))).Font.Color := Color;
  end;

  for i := 1 to 7 do
  begin
    TLabel(FindComponent('lblGBPS_'+IntToStr(i))).Font.Color := Color;
    TLabel(FindComponent('lblGBSB_'+IntToStr(i))).Font.Color := Color;
    TLabel(FindComponent('lblGeneral_'+IntToStr(i))).Font.Color := Color;
  end;

  for i := 1 to 8 do
  begin
    TLabel(FindComponent('lblMEPS_'+IntToStr(i))).Font.Color := Color;
    TLabel(FindComponent('lblMESB_'+IntToStr(i))).Font.Color := Color;
  end;
end;

procedure TfrmPCSPanelBridge.FormCreate(Sender: TObject);
begin
  r := 255;
  g := 255;
  b := 255;

  FListener := TListeners.Create;
  with PCSSystem.Listener.Add('BRIDGE') as TPropertyEventListener do begin
    OnPropertyIntChange := PCSSystemEvent;
  end;
  
end;

procedure TfrmPCSPanelBridge.FormDestroy(Sender: TObject);
begin
  Flistener.free;
end;





procedure TfrmPCSPanelBridge.PCSSystemEvent(Sender: TObject; PropsID: E_PropsID;
  Value: Integer);
begin

end;

end.
