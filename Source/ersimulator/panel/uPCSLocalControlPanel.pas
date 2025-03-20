
unit uPCSLocalControlPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzBmpBtn, Buttons, SpeedButtonImage, VrControls,
  VrRotarySwitch, StdCtrls, uCommonSystem, uListener,uDataType, uMainEngine,
  uCPP, uGearBox, VrButtons, AppEvnts, ComCtrls;

type
  TfrmPCSLocalControlPanel = class(TForm)
    pnlWaterHeater: TPanel;
    pnlPrelube: TPanel;
    pnlIndicator: TPanel;
    pnlControl: TPanel;
    img17: TImage;
    img20: TImage;
    img18: TImage;
    img21: TImage;
    btnStopPS: TSpeedButtonImage;
    btnStartPS: TSpeedButtonImage;
    btnSafeties: TSpeedButtonImage;
    btnClutchPS: TSpeedButtonImage;
    btnDeclutchPS: TSpeedButtonImage;
    btnSafetiesStopPS: TSpeedButtonImage;
    btnEmergencStopPS: TSpeedButtonImage;
    btnBypassP2P4Open: TSpeedButtonImage;
    btnP2P4Closed: TSpeedButtonImage;
    imgPrelubeON_PS: TImage;
    imgPrelubeOff_PS: TImage;
    vrtryswtchPrelubePS: TVrRotarySwitch;
    imgHeaterON_PS: TImage;
    imgHeaterOff_PS: TImage;
    vrtryswtchHeaterPS: TVrRotarySwitch;
    lblHeater: TLabel;
    lblPrelube: TLabel;
    lbl31: TLabel;
    lbl32: TLabel;
    lbl33: TLabel;
    lbl34: TLabel;
    pnlStandbyPumpGB: TPanel;
    imgStandByPumpGBON_PS: TImage;
    imgStandByPumpGBFault: TImage;
    lblStandByPumpGB: TLabel;
    vrtryswtchStandByPumpGBPS: TVrRotarySwitch;
    tmr1: TTimer;
    lbl35: TLabel;
    lbl37: TLabel;
    lbl44: TLabel;
    lbl45: TLabel;
    lbl46: TLabel;
    lbl47: TLabel;
    lbl48: TLabel;
    pnlPumpHeater: TPanel;
    imgPreheatingPumpOn_PS: TImage;
    imgPreheatingPumpOff_PS: TImage;
    lbl4: TLabel;
    vrtryswtchPumpHeaterPS: TVrRotarySwitch;
    btnAlarmPropulsion: TVrDemoButton;
    pgc1: TPageControl;
    tsPS: TTabSheet;
    img1: TImage;
    img2: TImage;
    img3: TImage;
    img4: TImage;
    img5: TImage;
    img6: TImage;
    img7: TImage;
    img8: TImage;
    img9: TImage;
    img10: TImage;
    img11: TImage;
    img12: TImage;
    img13: TImage;
    img14: TImage;
    img15: TImage;
    img16: TImage;
    img19: TImage;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl13: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl18: TLabel;
    lbl19: TLabel;
    lbl20: TLabel;
    lbl21: TLabel;
    lbl22: TLabel;
    lbl23: TLabel;
    lbl24: TLabel;
    lbl25: TLabel;
    lbl26: TLabel;
    lbl27: TLabel;
    lbl28: TLabel;
    tsSB: TTabSheet;
    pnl2: TPanel;
    lbl50: TLabel;
    imgPrelubeON_SB: TImage;
    imgPrelubeOFF_SB: TImage;
    vrtryswtchPrelubeSB: TVrRotarySwitch;
    pnl3: TPanel;
    imgStandByPumpGBON_SB: TImage;
    img25: TImage;
    lbl51: TLabel;
    vrtryswtchStandByPumpGBSB: TVrRotarySwitch;
    pnl4: TPanel;
    imgPreheatingPumpOn_SB: TImage;
    imgPreheatingPumpOff_SB: TImage;
    lbl52: TLabel;
    vrtryswtchPumpHeaterSB: TVrRotarySwitch;
    pnl6: TPanel;
    btnStopSB: TSpeedButtonImage;
    btnStartSB: TSpeedButtonImage;
    btnAlarm_Accept3: TSpeedButtonImage;
    btnClutchSB: TSpeedButtonImage;
    btnDeclutchSB: TSpeedButtonImage;
    btnSafetiesStopSB: TSpeedButtonImage;
    btnEmergencStopSB: TSpeedButtonImage;
    btnAlarm_Accept8: TSpeedButtonImage;
    btnAlarm_Accept9: TSpeedButtonImage;
    lbl53: TLabel;
    lbl54: TLabel;
    lbl55: TLabel;
    lbl56: TLabel;
    lbl57: TLabel;
    lbl58: TLabel;
    lbl59: TLabel;
    btn19: TVrDemoButton;
    pnl7: TPanel;
    img28: TImage;
    img29: TImage;
    img30: TImage;
    img31: TImage;
    lbl60: TLabel;
    lbl61: TLabel;
    lbl62: TLabel;
    lbl63: TLabel;
    img32: TImage;
    img33: TImage;
    img34: TImage;
    img35: TImage;
    img36: TImage;
    img37: TImage;
    img38: TImage;
    img39: TImage;
    img40: TImage;
    img41: TImage;
    img42: TImage;
    img43: TImage;
    img44: TImage;
    img45: TImage;
    img46: TImage;
    img47: TImage;
    img48: TImage;
    lbl64: TLabel;
    lbl65: TLabel;
    lbl66: TLabel;
    lbl67: TLabel;
    lbl68: TLabel;
    lbl69: TLabel;
    lbl70: TLabel;
    lbl71: TLabel;
    lbl72: TLabel;
    lbl73: TLabel;
    lbl74: TLabel;
    lbl75: TLabel;
    lbl76: TLabel;
    lbl77: TLabel;
    lbl78: TLabel;
    lbl79: TLabel;
    lbl80: TLabel;
    pnl8: TPanel;
    imgHeaterON_SB: TImage;
    imgHeaterOff_SB: TImage;
    lbl81: TLabel;
    vrtryswtchHeaterSB: TVrRotarySwitch;
    pnlLCPPS: TPanel;
    grpPS_CPP1: TGroupBox;
    btnPS_Start1: TVrDemoButton;
    btnPS_Standby1: TVrDemoButton;
    btnPS_Stop1: TVrDemoButton;
    grpPS_CPP2: TGroupBox;
    btnPS_Start2: TVrDemoButton;
    btnPS_Standby2: TVrDemoButton;
    btnPS_Stop2: TVrDemoButton;
    grpPS_CPP3: TGroupBox;
    btnPS_Start3: TVrDemoButton;
    btnPS_Auto3: TVrDemoButton;
    btnPS_Stop3: TVrDemoButton;
    pnlLCPSB: TPanel;
    Panel1: TPanel;
    pnlSwitch: TPanel;
    grpRemote: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    vrtryswtchRemotePS: TVrRotarySwitch;
    grpSpeed: TGroupBox;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    vrtryswtchSpeedPS: TVrRotarySwitch;
    grpSTCControl: TGroupBox;
    lbl10: TLabel;
    lbl12: TLabel;
    vrtryswtchSTC_PS: TVrRotarySwitch;
    grpPreStartingInhibition: TGroupBox;
    lbl11: TLabel;
    lbl14: TLabel;
    lbl85: TLabel;
    vrtryswtchPreStartPS: TVrRotarySwitch;
    grp1: TGroupBox;
    lbl29: TLabel;
    lbl30: TLabel;
    lbl36: TLabel;
    vrtryswtchRemoteSB: TVrRotarySwitch;
    grp2: TGroupBox;
    lbl38: TLabel;
    lbl39: TLabel;
    lbl40: TLabel;
    vrtryswtchSpeedSB: TVrRotarySwitch;
    grp3: TGroupBox;
    lbl41: TLabel;
    lbl42: TLabel;
    vrtryswtchSTC_SB: TVrRotarySwitch;
    grp7: TGroupBox;
    lbl43: TLabel;
    lbl49: TLabel;
    lbl83: TLabel;
    vrtryswtchPreStartSB: TVrRotarySwitch;
    grp13: TGroupBox;
    btnSB_Start1: TVrDemoButton;
    btnSB_Standby1: TVrDemoButton;
    btnSB_Stop1: TVrDemoButton;
    grp14: TGroupBox;
    btnSB_Start2: TVrDemoButton;
    btnSB_Standby2: TVrDemoButton;
    btnSB_Stop2: TVrDemoButton;
    grp15: TGroupBox;
    btnSB_Start3: TVrDemoButton;
    btnSB_Auto3: TVrDemoButton;
    btnSB_Stop3: TVrDemoButton;
    Label4: TLabel;
    Label7: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label12: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure vrtryswtchChange(Sender: TObject);
    procedure btnONClick(Sender: TObject);
    procedure btnOFFClick(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure vrtryswtchRemoteChange(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure btnClutchClick(Sender: TObject);
    procedure btnDeclutchClick(Sender: TObject);
    procedure btnCPPClick(Sender: TObject);
    procedure LampIndicator;
    procedure btnAlarmPropulsionClick(Sender: TObject);

    procedure FormShortcut(var Msg: TWMKey; var Handled: Boolean);
    procedure btnEmergencStopClick(Sender: TObject);
    procedure vrtryswtchSpeedChange(Sender: TObject);
    procedure vrtryswtchTCControlChange(Sender: TObject);
    procedure vrtryswtchPreStartInhibitionChange(Sender: TObject);
    procedure btnSafetiesStopClick(Sender: TObject);

  private
    aplctnvntsKey : TApplicationEvents;
    main_engine : TMainEngine;
    main_engine_PS : TMainEngine;
    main_engine_SB : TMainEngine;
    gearbox    : TGearBox;
    gearbox_PS : TGearBox;
    gearbox_SB : TGearBox;
    cpp    : TCPP;
    cpp_PS : TCPP;
    cpp_SB : TCPP;

    cppHydraulicPumpID, cppConditionStatus : string;
    cppConditionStatusTag,counter : Integer;
    FFlashingStartPS, FFlashingStartSB, FFlashingStopPS, FFlashingStopSB,
    FFlashingClutchPS, FFlashingClutchSB, FFlashingDeclutchPS, FFlashingDeclutchSB : Boolean;

    procedure FlashingIndicatorStart(SenderOn, SenderOff: TSpeedButtonImage; aOnOff: Boolean);
    procedure FlashingIndicatorStop(SenderOn, SenderOff: TSpeedButtonImage; aOnOff: Boolean);
    procedure FlashingIndicatorClutch(SenderOn, SenderOff: TSpeedButtonImage; aOnOff: Boolean);
    procedure LoadSessionSynchronize;

  public

    picture_Path : string;
    fIndicatorOn, fIndicatorOff, fIndicatorFault,
    fAlarmIndicatorGreenOn, fAlarmIndicatorGreenOff, fAlarmIndicatorGreenFault,
    fAlarmIndicatorBlueOn, fAlarmIndicatorBlueOff, fAlarmIndicatorBlueFault,
    fAlarmIndicatorRedOn, fAlarmIndicatorRedOff, fAlarmIndicatorRedFault,
    fAlarmIndicatorWhiteOn, fAlarmIndicatorWhiteOff, fAlarmIndicatorWhiteFault : string;
    Start_ON : Boolean;

  end;

var
  frmPCSLocalControlPanel: TfrmPCSLocalControlPanel;
//  MainEngine : TMainEngine;
//  GearBox : TGearBox;
//  cpp : TCPP;

implementation

uses uERSystem, uPropulsionSystem;

{$R *.dfm}

procedure TfrmPCSLocalControlPanel.btnAlarmPropulsionClick(Sender: TObject);
begin
  if TVrDemoButton(Sender).Color = clBtnFace then
  begin
    btnAlarmPropulsion.Color := clLime;
    ERSystem.ERManager.EngineRoom.getPCSSystem.ME[0].AlarmPropulsionCheck := 1;
  end
  else
  begin
    btnAlarmPropulsion.Color := clBtnFace;
    ERSystem.ERManager.EngineRoom.getPCSSystem.ME[0].AlarmPropulsionCheck := 0;
  end;
end;

procedure TfrmPCSLocalControlPanel.btnOFFClick(Sender: TObject);
begin
  if TButton(Sender).Hint = 'Prelub' then
  begin
    if TButton(Sender).Tag = 0 then
    begin
      if vrtryswtchPrelubePS.SwitchPosition = 0 then
        main_engine_PS.PrimLOPump := False;
    end
    else if TButton(Sender).Tag = 1 then
    begin
      if vrtryswtchPrelubeSB.SwitchPosition = 0 then
        main_engine_SB.PrimLOPump := False;
    end;
  end
  else if TButton(Sender).Hint = 'Preheating Pump' then
  begin
    if TButton(Sender).Tag = 0 then
    begin
      if vrtryswtchPumpHeaterPS.SwitchPosition = 0 then
        main_engine_PS.PreHeatingPump := False;
    end
    else if TButton(Sender).Tag = 1 then
    begin
      if vrtryswtchPumpHeaterSB.SwitchPosition = 0 then
        main_engine_SB.PreHeatingPump := False;
    end;
  end
  else if TButton(Sender).Hint = 'Heater' then
  begin
    if TButton(Sender).Tag = 0 then
    begin
      if vrtryswtchHeaterPS.SwitchPosition = 0 then
        main_engine_PS.Heater := False;
    end
    else if TButton(Sender).Tag = 1 then
    begin
      if vrtryswtchHeaterSB.SwitchPosition = 0 then
        main_engine_SB.Heater := False;
    end;
  end;
end;

procedure TfrmPCSLocalControlPanel.btnONClick(Sender: TObject);
begin
  if TButton(Sender).Hint = 'Prelub' then
  begin
    if TButton(Sender).Tag = 0 then
    begin
      if vrtryswtchPrelubePS.SwitchPosition = 0 then
        main_engine_PS.PrimLOPump := True;
    end
    else if TButton(Sender).Tag = 1 then
    begin
      if vrtryswtchPrelubeSB.SwitchPosition = 0 then
        main_engine_SB.PrimLOPump := True;
    end;
  end
  else if TButton(Sender).Hint = 'Preheating Pump' then
  begin
    if TButton(Sender).Tag = 0 then
    begin
      if vrtryswtchPumpHeaterPS.SwitchPosition = 0 then
        main_engine_PS.PreHeatingPump := True;
    end
    else if TButton(Sender).Tag = 1 then
    begin
      if vrtryswtchPumpHeaterSB.SwitchPosition = 0 then
        main_engine_SB.PreHeatingPump := True;
    end;
  end
  else if TButton(Sender).Hint = 'Heater' then
  begin
    if TButton(Sender).Tag = 0 then
    begin
      if vrtryswtchHeaterPS.SwitchPosition = 0 then
        main_engine_PS.Heater := True;
    end
    else if TButton(Sender).Tag = 1 then
    begin
      if vrtryswtchHeaterSB.SwitchPosition = 0 then
        main_engine_SB.Heater := True;
    end;
  end;
end;

procedure TfrmPCSLocalControlPanel.btnSafetiesStopClick(Sender: TObject);
begin
  if (TButton(Sender).Tag = 0) and main_engine_PS.LocalControl then
  begin
    main_engine_PS.EmergencyStop := True;
  end
  else if (TButton(Sender).Tag = 1) and main_engine_SB.LocalControl then
  begin
    main_engine_SB.EmergencyStop := True;
  end;
end;

procedure TfrmPCSLocalControlPanel.btnClutchClick(Sender: TObject);
begin
  if TButton(Sender).Tag = 0 then
  begin
    if gearbox_PS.ClutchAllowed and main_engine_PS.LocalControl then
    begin
      ERSystem.ERManager.EngineRoom.getPCSSystem.Clutch(C_PCS_GB_PORTS, True);
      FFlashingClutchPS := True;
    end;
  end
  else if TButton(Sender).Tag = 1 then
  begin
    if gearbox_SB.ClutchAllowed and main_engine_SB.LocalControl then
    begin
      ERSystem.ERManager.EngineRoom.getPCSSystem.Clutch(C_PCS_GB_STARBOARD, True);
      FFlashingClutchSB := True;
    end;
  end;
end;

procedure TfrmPCSLocalControlPanel.btnDeclutchClick(Sender: TObject);
begin
  if TButton(Sender).Tag = 0 then
  begin
    if gearbox_PS.ClutchEngaged and main_engine_PS.LocalControl then
    begin
      ERSystem.ERManager.EngineRoom.getPCSSystem.Clutch(C_PCS_GB_PORTS, False);
      FFlashingDeclutchPS := True;
    end;
  end
  else if TButton(Sender).Tag = 1 then
  begin
    if gearbox_SB.ClutchEngaged and main_engine_SB.LocalControl then
    begin
      ERSystem.ERManager.EngineRoom.getPCSSystem.Clutch(C_PCS_GB_STARBOARD, False);
      FFlashingDeclutchSB := True;
    end;
  end;
end;

procedure TfrmPCSLocalControlPanel.btnEmergencStopClick(Sender: TObject);
begin
  if (TButton(Sender).Tag = 0) and main_engine_PS.LocalControl then
  begin
    main_engine_PS.EmergencyStop := True;
  end
  else if (TButton(Sender).Tag = 1) and main_engine_SB.LocalControl then
  begin
    main_engine_SB.EmergencyStop := True;
  end;
end;

procedure TfrmPCSLocalControlPanel.btnCPPClick(Sender: TObject);
begin
  cppHydraulicPumpID := TButton(Sender).Hint;
  cppConditionStatus := TButton(Sender).Caption;
  cppConditionStatusTag := TButton(Sender).Tag;

//  if cppConditionStatusTag = 1 then
//    cpp := ERSystem.ERManager.EngineRoom.getPCSSystem.getCPP(C_PCS_CPP_PORTS)
//  else if cppConditionStatusTag = 2 then
//    cpp := ERSystem.ERManager.EngineRoom.getPCSSystem.getCPP(C_PCS_CPP_STARBOARD);

  if cppConditionStatus = 'Standby' then
  begin
    if TVrDemoButton(Sender).Color = clBtnFace then
    begin
      if cppHydraulicPumpID = 'Pump 1' then
      begin
        ERSystem.ERManager.EngineRoom.getPCSSystem.CPPHydraulicPump(cppConditionStatusTag,C_PUMP_CPP_HYDRAULIC_1,C_PUMP_CPP_HYDRAULIC_STANDBY,True);
        if cppConditionStatusTag = 1 then
        begin
          btnPS_Standby1.Color := clLime;
          btnPS_Stop1.Color := clBtnFace;
          btnPS_Start1.Color := clBtnFace;
        end
        else
        if cppConditionStatusTag = 2 then
        begin
          btnSB_Standby1.Color := clLime;
          btnSB_Stop1.Color := clBtnFace;
          btnSB_Start1.Color := clBtnFace;
        end;
      end
      else if cppHydraulicPumpID = 'Pump 2' then
      begin
        ERSystem.ERManager.EngineRoom.getPCSSystem.CPPHydraulicPump(cppConditionStatusTag,C_PUMP_CPP_HYDRAULIC_2,C_PUMP_CPP_HYDRAULIC_STANDBY,True);
        if cppConditionStatusTag = 1 then
        begin
          btnPS_Standby2.Color := clLime;
          btnPS_Stop2.Color := clBtnFace;
          btnPS_Start2.Color := clBtnFace;
        end
        else
        if cppConditionStatusTag = 2 then
        begin
          btnSB_Standby2.Color := clLime;
          btnSB_Stop2.Color := clBtnFace;
          btnSB_Start2.Color := clBtnFace;
        end;
      end;
    end;
  end
  else if cppConditionStatus = 'Stop' then
  begin
    if TVrDemoButton(Sender).Color = clBtnFace then
    begin
      if cppHydraulicPumpID = 'Pump 1' then
      begin
        ERSystem.ERManager.EngineRoom.getPCSSystem.CPPHydraulicPump(cppConditionStatusTag,C_PUMP_CPP_HYDRAULIC_1,C_PUMP_CPP_HYDRAULIC_STOP,True);
        if cppConditionStatusTag = 1 then
        begin
          btnPS_Standby1.Color := clBtnFace;
          btnPS_Stop1.Color := clLime;
          btnPS_Start1.Color := clBtnFace;
        end
        else
        if cppConditionStatusTag = 2 then
        begin
          btnSB_Standby1.Color := clBtnFace;
          btnSB_Stop1.Color := clLime;
          btnSB_Start1.Color := clBtnFace;
        end;
      end
      else if cppHydraulicPumpID = 'Pump 2' then
      begin
        ERSystem.ERManager.EngineRoom.getPCSSystem.CPPHydraulicPump(cppConditionStatusTag,C_PUMP_CPP_HYDRAULIC_2,C_PUMP_CPP_HYDRAULIC_STOP,True);
        if cppConditionStatusTag = 1 then
        begin
          btnPS_Standby2.Color := clBtnFace;
          btnPS_Stop2.Color := clLime;
          btnPS_Start2.Color := clBtnFace;
        end
        else
        if cppConditionStatusTag = 2 then
        begin
          btnSB_Standby2.Color := clBtnFace;
          btnSB_Stop2.Color := clLime;
          btnSB_Start2.Color := clBtnFace;
        end;
      end
      else if cppHydraulicPumpID = 'Pump 3' then
      begin
        ERSystem.ERManager.EngineRoom.getPCSSystem.CPPHydraulicPump(cppConditionStatusTag,C_PUMP_CPP_HYDRAULIC_3,C_PUMP_CPP_HYDRAULIC_STOP,True);
        if cppConditionStatusTag = 1 then
        begin
          btnPS_Auto3.Color := clBtnFace;
          btnPS_Stop3.Color := clLime;
          btnPS_Start3.Color := clBtnFace;
        end
        else
        if cppConditionStatusTag = 2 then
        begin
          btnSB_Auto3.Color := clBtnFace;
          btnSB_Stop3.Color := clLime;
          btnSB_Start3.Color := clBtnFace;
        end;
      end;
    end;
  end
  else if cppConditionStatus = 'Start' then
  begin
    if TVrDemoButton(Sender).Color = clBtnFace then
    begin
      if cppHydraulicPumpID = 'Pump 1' then
      begin
        ERSystem.ERManager.EngineRoom.getPCSSystem.CPPHydraulicPump(cppConditionStatusTag,C_PUMP_CPP_HYDRAULIC_1,C_PUMP_CPP_HYDRAULIC_START,True);
        if cppConditionStatusTag = 1 then
        begin
          btnPS_Standby1.Color := clBtnFace;
          btnPS_Stop1.Color := clBtnFace;
          btnPS_Start1.Color := clLime;
        end
        else
        if cppConditionStatusTag = 2 then
        begin
          btnSB_Standby1.Color := clBtnFace;
          btnSB_Stop1.Color := clBtnFace;
          btnSB_Start1.Color := clLime;
        end;
      end
      else if cppHydraulicPumpID = 'Pump 2' then
      begin
        ERSystem.ERManager.EngineRoom.getPCSSystem.CPPHydraulicPump(cppConditionStatusTag,C_PUMP_CPP_HYDRAULIC_2,C_PUMP_CPP_HYDRAULIC_START,True);
        if cppConditionStatusTag = 1 then
        begin
          btnPS_Standby2.Color := clBtnFace;
          btnPS_Stop2.Color := clBtnFace;
          btnPS_Start2.Color := clLime;
        end
        else
        if cppConditionStatusTag = 2 then
        begin
          btnSB_Standby2.Color := clBtnFace;
          btnSB_Stop2.Color := clBtnFace;
          btnSB_Start2.Color := clLime;
        end;
      end
      else if cppHydraulicPumpID = 'Pump 3' then
      begin
        ERSystem.ERManager.EngineRoom.getPCSSystem.CPPHydraulicPump(cppConditionStatusTag,C_PUMP_CPP_HYDRAULIC_3,C_PUMP_CPP_HYDRAULIC_START,True);
        if cppConditionStatusTag = 1 then
        begin
          btnPS_Auto3.Color := clBtnFace;
          btnPS_Stop3.Color := clBtnFace;
          btnPS_Start3.Color := clLime;
        end
        else
        if cppConditionStatusTag = 2 then
        begin
          btnSB_Auto3.Color := clBtnFace;
          btnSB_Stop3.Color := clBtnFace;
          btnSB_Start3.Color := clLime;
        end;
      end
    end;
  end
  else if cppConditionStatus = 'Auto' then
  begin
    if TVrDemoButton(Sender).Color = clBtnFace then
    begin
      if cppHydraulicPumpID = 'Pump 3' then
      begin
        ERSystem.ERManager.EngineRoom.getPCSSystem.CPPHydraulicPump(cppConditionStatusTag,C_PUMP_CPP_HYDRAULIC_3,C_PUMP_CPP_HYDRAULIC_STANDBY,True);
        if cppConditionStatusTag = 1 then
        begin
          btnPS_Auto3.Color := clLime;
          btnPS_Stop3.Color := clBtnFace;
          btnPS_Start3.Color := clBtnFace;
        end
        else
        if cppConditionStatusTag = 2 then
        begin
          btnSB_Auto3.Color := clLime;
          btnSB_Stop3.Color := clBtnFace;
          btnSB_Start3.Color := clBtnFace;
        end;
      end;
    end
  end;
end;

procedure TfrmPCSLocalControlPanel.btnStartClick(Sender: TObject);
begin
  if TButton(Sender).Tag = 0 then
  begin
    if main_engine_PS.ReadyForUse and main_engine_PS.LocalControl then
    begin
      ERSystem.ERManager.EngineRoom.getPCSSystem.RunningStart(C_PCS_ME_PORTS);
      FFlashingStartPS := True;
    end
  end
  else if TButton(Sender).Tag = 1 then
  begin
    if main_engine_SB.ReadyForUse and main_engine_SB.LocalControl then
    begin
      ERSystem.ERManager.EngineRoom.getPCSSystem.RunningStart(C_PCS_ME_STARBOARD);
      FFlashingStartSB := True;
    end;
  end;
end;

procedure TfrmPCSLocalControlPanel.btnStopClick(Sender: TObject);
begin
  if TButton(Sender).Tag = 0 then
  begin
    if main_engine_PS.EngineRun and main_engine_PS.LocalControl then
    begin
      ERSystem.ERManager.EngineRoom.getPCSSystem.StoppedStop(C_PCS_ME_PORTS);
      FFlashingStopPS := True;
    end
  end
  else if TButton(Sender).Tag = 1 then
  begin
    if main_engine_SB.EngineRun and main_engine_SB.LocalControl then
    begin
      ERSystem.ERManager.EngineRoom.getPCSSystem.StoppedStop(C_PCS_ME_STARBOARD);
      FFlashingStopSB := True;
    end;
  end;
end;

procedure TfrmPCSLocalControlPanel.FlashingIndicatorClutch(SenderOn,
  SenderOff: TSpeedButtonImage; aOnOff: Boolean);
begin
  counter := counter + 1;

  if counter < 5 then
  begin
    if TSpeedButtonImage(SenderOn).Color = clGray then
      TSpeedButtonImage(SenderOn).Color := clSilver
    else
      TSpeedButtonImage(SenderOn).Color := clGray;
  end;

  if counter > 5 then
  begin
    if aOnOff then
    begin
      TSpeedButtonImage(SenderOn).Color := clSilver;
      TSpeedButtonImage(SenderOff).Color:= clGray;
    end
    else
      TSpeedButtonImage(SenderOn).Color := clGray;

    counter := 0;
    if (SenderOn.Tag = 0) and (SenderOn.Hint = 'Clutch') then
      FFlashingClutchPS := not aOnOff
    else if (SenderOn.Tag = 0) and (SenderOn.Hint = 'Declutch')  then
      FFlashingDeclutchPS := not aOnOff
    else if (SenderOn.Tag = 1) and (SenderOn.Hint = 'Clutch') then
      FFlashingClutchSB := not aOnOff
    else if (SenderOn.Tag = 1) and (SenderOn.Hint = 'Declutch') then
      FFlashingDeclutchSB := not aOnOff;
  end;
end;

procedure TfrmPCSLocalControlPanel.FlashingIndicatorStart(SenderOn,SenderOff: TSpeedButtonImage;
  aOnOff: Boolean);
begin
  counter := counter + 1;

  if counter < 5 then
  begin
    if TSpeedButtonImage(SenderOn).Color = clGreen then
      TSpeedButtonImage(SenderOn).Color := clLime
    else
      TSpeedButtonImage(SenderOn).Color := clGreen;
  end;

  if counter > 5 then
  begin
    if aOnOff then
    begin
      TSpeedButtonImage(SenderOn).Color := clLime;
      TSpeedButtonImage(SenderOff).Color:= clMaroon;
    end
    else
      TSpeedButtonImage(SenderOn).Color := clGreen;

    counter := 0;
    if SenderOn.Tag = 0 then
      FFlashingStartPS := not aOnOff
    else if SenderOn.Tag = 1 then
      FFlashingStartSB := not aOnOff;
  end;
end;

procedure TfrmPCSLocalControlPanel.FlashingIndicatorStop(SenderOn,
  SenderOff: TSpeedButtonImage; aOnOff: Boolean);
begin
  counter := counter + 1;

  if counter < 5 then
  begin
    if TSpeedButtonImage(SenderOn).Color = clMaroon then
      TSpeedButtonImage(SenderOn).Color := clRed
    else
      TSpeedButtonImage(SenderOn).Color := clMaroon;
  end;

  if counter > 5 then
  begin
    if aOnOff then
    begin
      TSpeedButtonImage(SenderOn).Color := clRed;
      TSpeedButtonImage(SenderOff).Color:= clGreen;
    end
    else
      TSpeedButtonImage(SenderOn).Color := clMaroon;

    counter := 0;
    if SenderOn.Tag = 0 then
      FFlashingStopPS := not aOnOff
    else if SenderOn.Tag = 1 then
      FFlashingStopSB := not aOnOff;
  end;
end;

procedure TfrmPCSLocalControlPanel.FormCreate(Sender: TObject);
begin
  aplctnvntsKEy := TApplicationEvents.Create(self);
  aplctnvntsKEy.OnShortCut := FormShortcut;

  main_engine_PS := ERSystem.ERManager.EngineRoom.getPCSSystem.getMainEngine(C_PCS_ME_PORTS);
  main_engine_SB := ERSystem.ERManager.EngineRoom.getPCSSystem.getMainEngine(C_PCS_ME_STARBOARD);
  gearbox_PS := ERSystem.ERManager.EngineRoom.getPCSSystem.getGearBox(C_PCS_GB_PORTS);
  gearbox_SB := ERSystem.ERManager.EngineRoom.getPCSSystem.getGearBox(C_PCS_GB_STARBOARD);
  cpp_PS := ERSystem.ERManager.EngineRoom.getPCSSystem.getCPP(C_PCS_CPP_PORTS);
  cpp_SB := ERSystem.ERManager.EngineRoom.getPCSSystem.getCPP(C_PCS_CPP_STARBOARD);

  picture_Path           := Copy(ExtractFilePath(Application.ExeName),1,length(ExtractFilePath(Application.ExeName))-4);
  fIndicatorOn           := picture_Path + 'Bin\Images\Image LCP\ipms_CPP_button hijau - on.bmp';
  fIndicatorOff          := picture_Path + 'Bin\Images\Image LCP\ipms_CPP_button hijau.bmp';
  fAlarmIndicatorGreenOn := picture_Path + 'Bin\Images\Image LCP\ipms_CPP_button hijau - on 2.bmp';
  fAlarmIndicatorGreenOff:= picture_Path + 'Bin\Images\Image LCP\ipms_CPP_button hijau 2.bmp';
  fAlarmIndicatorBlueOn  := picture_Path + 'Bin\Images\Image LCP\ipms_RR 02 button blue - on.bmp';
  fAlarmIndicatorBlueOff := picture_Path + 'Bin\Images\Image LCP\ipms_RR 02 button blue.bmp';
  fAlarmIndicatorRedOn   := picture_Path + 'Bin\Images\Image LCP\ipms_RR 02 button pink - on 2.bmp';
  fAlarmIndicatorRedOff  := picture_Path + 'Bin\Images\Image LCP\ipms_RR 02 button pink 2.bmp';
  fAlarmIndicatorWhiteOn := picture_Path + 'Bin\Images\Image LCP\ipms_RR 02 button white - on.bmp';
  fAlarmIndicatorWhiteOff:= picture_Path + 'Bin\Images\Image LCP\ipms_RR 02 button white.bmp';

  counter := 0;
end;

procedure TfrmPCSLocalControlPanel.FormShortcut(var Msg: TWMKey;
  var Handled: Boolean);
begin
  if GetKeyState(VK_CONTROL) < 0 then
  begin
    case Msg.CharCode of
      VK_SHIFT :
      begin
        btnAlarmPropulsion.Visible := True;
      end;

      VK_NUMPAD1 :
      begin
//        pnlCPP_PS.Visible := True;
//        pnlCPP_SB.Visible := True;
      end;

      VK_SPACE :
      begin
        btnAlarmPropulsion.Visible := False;
//        pnlCPP_PS.Visible := False;
//        pnlCPP_SB.Visible := False;
      end;
    end;
  end;
end;

procedure TfrmPCSLocalControlPanel.LampIndicator;
begin
  if main_engine_PS.PrimLOPump then
    imgPrelubeON_PS.Picture.LoadFromFile(fIndicatorOn)
  else
    imgPrelubeON_PS.Picture.LoadFromFile(fIndicatorOff);

  if main_engine_SB.PrimLOPump then
    imgPrelubeON_SB.Picture.LoadFromFile(fIndicatorOn)
  else
    imgPrelubeON_SB.Picture.LoadFromFile(fIndicatorOff);

  if main_engine_PS.PreHeatingPump then
    imgPreheatingPumpOn_PS.Picture.LoadFromFile(fIndicatorOn)
  else
    imgPreheatingPumpOn_PS.Picture.LoadFromFile(fIndicatorOff);

  if main_engine_SB.PreHeatingPump then
    imgPreheatingPumpOn_SB.Picture.LoadFromFile(fIndicatorOn)
  else
    imgPreheatingPumpOn_SB.Picture.LoadFromFile(fIndicatorOff);

  if main_engine_PS.Heater then
    imgHeaterON_PS.Picture.LoadFromFile(fIndicatorOn)
  else
    imgHeaterON_PS.Picture.LoadFromFile(fIndicatorOff);

  if main_engine_SB.Heater then
    imgHeaterON_SB.Picture.LoadFromFile(fIndicatorOn)
  else
    imgHeaterON_SB.Picture.LoadFromFile(fIndicatorOff);

  if gearbox_PS.StandbyPump then
    imgStandByPumpGBON_PS.Picture.LoadFromFile(fIndicatorOn)
  else
    imgStandByPumpGBON_PS.Picture.LoadFromFile(fIndicatorOff);

  if gearbox_SB.StandbyPump then
    imgStandByPumpGBON_SB.Picture.LoadFromFile(fIndicatorOn)
  else
    imgStandByPumpGBON_SB.Picture.LoadFromFile(fIndicatorOff);

  if main_engine_PS.ReadyForUse then
    img18.Picture.LoadFromFile(fAlarmIndicatorGreenOn)
  else
    img18.Picture.LoadFromFile(fAlarmIndicatorGreenOff);

  if main_engine_SB.ReadyForUse then
    img30.Picture.LoadFromFile(fAlarmIndicatorGreenOn)
  else
    img30.Picture.LoadFromFile(fAlarmIndicatorGreenOff);

  if gearbox_PS.ClutchAllowed then
    img21.Picture.LoadFromFile(fAlarmIndicatorGreenOn)
  else
    img21.Picture.LoadFromFile(fAlarmIndicatorGreenOff);

  if gearbox_SB.ClutchAllowed then
    img31.Picture.LoadFromFile(fAlarmIndicatorGreenOn)
  else
    img31.Picture.LoadFromFile(fAlarmIndicatorGreenOff);

  if main_engine_PS.AirValve then
    img1.Picture.LoadFromFile(fAlarmIndicatorBlueOn)
  else
    img1.Picture.LoadFromFile(fAlarmIndicatorBlueOff);

  if main_engine_PS.GasValve then
    img2.Picture.LoadFromFile(fAlarmIndicatorBlueOn)
  else
    img2.Picture.LoadFromFile(fAlarmIndicatorBlueOff);

  if main_engine_PS.LocalControl then
  begin
    img17.Picture.LoadFromFile(fAlarmIndicatorWhiteOn);
    img20.Picture.LoadFromFile(fAlarmIndicatorWhiteOff);
  end
  else
  begin
    img17.Picture.LoadFromFile(fAlarmIndicatorWhiteOff);
    img20.Picture.LoadFromFile(fAlarmIndicatorWhiteOn);
  end;

  if main_engine_SB.LocalControl then
  begin
    img28.Picture.LoadFromFile(fAlarmIndicatorWhiteOn);
    img29.Picture.LoadFromFile(fAlarmIndicatorWhiteOff);
  end
  else
  begin
    img28.Picture.LoadFromFile(fAlarmIndicatorWhiteOff);
    img29.Picture.LoadFromFile(fAlarmIndicatorWhiteOn);
  end;

end;

procedure TfrmPCSLocalControlPanel.LoadSessionSynchronize;
begin
  if main_engine_PS.PrimLOPumpAuto then
    vrtryswtchPrelubePS.SwitchPosition := 2;

  if main_engine_SB.PrimLOPumpAuto then
    vrtryswtchPrelubeSB.SwitchPosition := 2;

  if main_engine_PS.PreHeatingPumpAuto then
    vrtryswtchPumpHeaterPS.SwitchPosition := 2;

  if main_engine_SB.PreHeatingPumpAuto then
    vrtryswtchPumpHeaterSB.SwitchPosition := 2;

  if main_engine_PS.HeaterAuto then
    vrtryswtchHeaterPS.SwitchPosition := 2;

  if main_engine_SB.HeaterAuto then
    vrtryswtchHeaterSB.SwitchPosition := 2;

  if gearbox_PS.StandbyPump then
    vrtryswtchStandByPumpGBPS.SwitchPosition := 0;

  if gearbox_SB.StandbyPump then
    vrtryswtchStandByPumpGBSB.SwitchPosition := 0;

  if main_engine_PS.EngineRun then
    btnStartPS.Color := clLime;

  if main_engine_SB.EngineRun then
    btnStartSB.Color := clLime;

  if gearbox_PS.ClutchEngaged then
    btnClutchPS.Color := clWhite;

  if gearbox_SB.ClutchEngaged then
    btnClutchSB.Color := clWhite;

  if main_engine_PS.MCRControl then
    vrtryswtchRemotePS.SwitchPosition := 1;

  if main_engine_SB.MCRControl then
    vrtryswtchRemoteSB.SwitchPosition := 1;


end;

procedure TfrmPCSLocalControlPanel.tmr1Timer(Sender: TObject);
begin
  if (main_engine_PS.PreHeatingPump or main_engine_PS.PreHeatingPumpAuto)
    and (main_engine_PS.PrimLOPump or main_engine_PS.PrimLOPumpAuto)
    and (main_engine_PS.Heater or main_engine_PS.HeaterAuto)
    and gearbox_PS.StandbyPump and not main_engine_PS.TankIsEmpty then
  begin
    main_engine_PS.ReadyForUse := True;
  end;

  if (main_engine_SB.PreHeatingPump or main_engine_SB.PreHeatingPumpAuto)
    and (main_engine_SB.PrimLOPump or main_engine_SB.PrimLOPumpAuto)
    and (main_engine_SB.Heater or main_engine_SB.HeaterAuto)
    and gearbox_SB.StandbyPump and not main_engine_SB.TankIsEmpty then
  begin
    main_engine_SB.ReadyForUse := True;
  end;

  if main_engine_PS.Heater and gearbox_PS.StandbyPump then
  begin
    cpp_PS.ReadyForUse := True;
    gearbox_PS.ReadyForUse := True;
  end;

  if main_engine_SB.Heater and gearbox_SB.StandbyPump then
  begin
    cpp_SB.ReadyForUse := True;
    gearbox_SB.ReadyForUse := True;
  end;

  LampIndicator;

  if FFlashingStartPS then
    FlashingIndicatorStart(btnStartPS,btnStopPS,True);

  if FFlashingStartSB then
    FlashingIndicatorStart(btnStartSB,btnStopSB,True);

//  if not main_engine_PS.EngineRun then
//    FlashingIndicatorStart(btnStartPS,btnStopPS,False);
//
//  if not main_engine_SB.EngineRun then
//    FlashingIndicatorStart(btnStartSB,btnStartSB);


  if FFlashingStopPS then
    FlashingIndicatorStop(btnStopPS,btnStartPS,True);

  if FFlashingStopSB then
    FlashingIndicatorStop(btnStopSB,btnStartSB,True);

  if FFlashingClutchPS then
    FlashingIndicatorClutch(btnClutchPS,btnDeclutchPS,True);

  if FFlashingClutchSB then
    FlashingIndicatorClutch(btnClutchSB,btnDeclutchSB,True);

  if FFlashingDeclutchPS then
    FlashingIndicatorClutch(btnDeclutchPS,btnClutchPS,True);

  if FFlashingDeclutchSB then
    FlashingIndicatorClutch(btnDeclutchSB,btnClutchSB,True);
end;

procedure TfrmPCSLocalControlPanel.vrtryswtchChange(Sender: TObject);
begin
  if TVrRotarySwitch(Sender).Tag = 0 then
  begin
    main_engine := ERSystem.ERManager.EngineRoom.getPCSSystem.getMainEngine(C_PCS_ME_PORTS);
    gearbox := ERSystem.ERManager.EngineRoom.getPCSSystem.getGearBox(C_PCS_GB_PORTS);
  end
  else if TVrRotarySwitch(Sender).Tag = 1 then
  begin
    main_engine := ERSystem.ERManager.EngineRoom.getPCSSystem.getMainEngine(C_PCS_ME_STARBOARD);
    gearbox := ERSystem.ERManager.EngineRoom.getPCSSystem.getGearBox(C_PCS_GB_STARBOARD);
  end;

  if TVrRotarySwitch(Sender).Hint = 'Prelub' then
  begin
    if TVrRotarySwitch(Sender).SwitchPosition = 0 then
    begin

    end
    else if TVrRotarySwitch(Sender).SwitchPosition = 1 then
    begin
      main_engine.PrimLOPump := False;
      main_engine.PrimLOPumpAuto := False;
    end
    else if TVrRotarySwitch(Sender).SwitchPosition = 2 then
    begin
      main_engine.PrimLOPumpAuto := True;
    end;
  end
  else if TVrRotarySwitch(Sender).Hint = 'Preheating Pump' then
  begin
    if TVrRotarySwitch(Sender).SwitchPosition = 0 then
    begin

    end
    else if TVrRotarySwitch(Sender).SwitchPosition = 1 then
    begin
      main_engine.PreHeatingPump := False;
      main_engine.PreHeatingPumpAuto := False;
    end
    else if TVrRotarySwitch(Sender).SwitchPosition = 2 then
    begin
      main_engine.PreHeatingPumpAuto := True;
    end;
  end
  else if TVrRotarySwitch(Sender).Hint = 'Heater' then
  begin
    if TVrRotarySwitch(Sender).SwitchPosition = 0 then
    begin

    end
    else if TVrRotarySwitch(Sender).SwitchPosition = 1 then
    begin
      main_engine.Heater := False;
      main_engine.HeaterAuto := False;
    end
    else if TVrRotarySwitch(Sender).SwitchPosition = 2 then
    begin
      main_engine.HeaterAuto := True;
    end;
  end
  else if TVrRotarySwitch(Sender).Hint = 'Standby Pump GB' then
  begin
    if TVrRotarySwitch(Sender).SwitchPosition = 0 then
    begin
      gearbox.StandbyPump := True;
    end
    else if TVrRotarySwitch(Sender).SwitchPosition = 1 then
    begin
      gearbox.StandbyPump := False;
    end;
  end;
end;

procedure TfrmPCSLocalControlPanel.vrtryswtchPreStartInhibitionChange(
  Sender: TObject);
begin
  if (TVrRotarySwitch(Sender).Tag = 0) and main_engine_PS.LocalControl then
  begin
    if vrtryswtchPreStartPS.SwitchPosition = 1 then
    begin
      main_engine_PS.PreStartInhibition := True;
      ERSystem.ERManager.EngineRoom.getPCSSystem.RunningStart(C_PCS_ME_PORTS);
      vrtryswtchPreStartPS.SwitchPosition := 0;
    end;

  end
  else if (TVrRotarySwitch(Sender).Tag = 1) and main_engine_SB.LocalControl then
  begin
    if vrtryswtchPreStartSB.SwitchPosition = 1 then
    begin
      main_engine_SB.PreStartInhibition := True;
      ERSystem.ERManager.EngineRoom.getPCSSystem.RunningStart(C_PCS_ME_STARBOARD);
      vrtryswtchPreStartSB.SwitchPosition := 0;
    end;
  end;
end;

procedure TfrmPCSLocalControlPanel.vrtryswtchRemoteChange(Sender: TObject);
begin
  if TVrRotarySwitch(Sender).Tag = 0 then
  begin
    if vrtryswtchRemotePS.SwitchPosition = 0 then
      ERSystem.ERManager.EngineRoom.getPCSSystem.RemoteToMCR(C_PCS_ME_PORTS, False)
    else if vrtryswtchRemotePS.SwitchPosition = 1 then
      ERSystem.ERManager.EngineRoom.getPCSSystem.RemoteToMCR(C_PCS_ME_PORTS, True);
  end
  else if TVrRotarySwitch(Sender).Tag = 1 then
  begin
    if vrtryswtchRemoteSB.SwitchPosition = 0 then
      ERSystem.ERManager.EngineRoom.getPCSSystem.RemoteToMCR(C_PCS_ME_STARBOARD, False)
    else if vrtryswtchRemoteSB.SwitchPosition = 1 then
      ERSystem.ERManager.EngineRoom.getPCSSystem.RemoteToMCR(C_PCS_ME_STARBOARD, True);
  end;
end;

procedure TfrmPCSLocalControlPanel.vrtryswtchSpeedChange(Sender: TObject);
begin
  if (TVrRotarySwitch(Sender).Tag = 0) and main_engine_PS.LocalControl then
  begin
    if vrtryswtchSpeedPS.SwitchPosition = 0 then
    begin
      main_engine_PS.DecreaseSpeed := True;
    end
    else if vrtryswtchSpeedPS.SwitchPosition = 1 then
    begin
      main_engine_PS.DecreaseSpeed := False;
      main_engine_PS.IncreaseSpeed := False;
    end
    else if vrtryswtchSpeedPS.SwitchPosition = 2 then
    begin
      main_engine_PS.IncreaseSpeed := True;
    end;
  end
  else if (TVrRotarySwitch(Sender).Tag = 1) and main_engine_SB.LocalControl then
  begin
    if vrtryswtchSpeedSB.SwitchPosition = 0 then
    begin
      main_engine_SB.DecreaseSpeed := True;
    end
    else if vrtryswtchSpeedSB.SwitchPosition = 1 then
    begin
      main_engine_SB.DecreaseSpeed := False;
      main_engine_SB.IncreaseSpeed := False;
    end
    else if vrtryswtchSpeedSB.SwitchPosition = 2 then
    begin
      main_engine_SB.IncreaseSpeed := True;
    end;
  end;
end;

procedure TfrmPCSLocalControlPanel.vrtryswtchTCControlChange(Sender: TObject);
begin
  if (TVrRotarySwitch(Sender).Tag = 0) and main_engine_PS.LocalControl then
  begin
    if not (vrtryswtchSTC_PS.SwitchPosition = 1) then
      main_engine_PS.STCInManualMode := True
    else
      main_engine_PS.STCInManualMode := False;
  end
  else if (TVrRotarySwitch(Sender).Tag = 1) and main_engine_SB.LocalControl then
  begin
    if not (vrtryswtchSTC_SB.SwitchPosition = 1) then
      main_engine_SB.STCInManualMode := True
    else
      main_engine_SB.STCInManualMode := False;
  end;
end;

end.
