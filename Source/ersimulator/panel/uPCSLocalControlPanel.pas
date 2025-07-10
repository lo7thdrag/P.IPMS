
unit uPCSLocalControlPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzBmpBtn, Buttons, SpeedButtonImage, VrControls,
  VrRotarySwitch, StdCtrls, uCommonSystem, uListener,uDataType, uMainEngine,
  uCPP, uGearBox, VrButtons, AppEvnts, ComCtrls;

type
  TfrmPCSLocalControlPanel = class(TForm)
    pnlHTELECTRICALWATERHEATERPS: TPanel;
    pnlPRELUBPUMPPS: TPanel;
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
    btnBypassP2P4OpenPS: TSpeedButtonImage;
    btnP2P4ClosedPS: TSpeedButtonImage;
    imgPrelubeON_PS: TImage;
    imgPrelubeOff_PS: TImage;
    vrtryswtchPrelubePS: TVrRotarySwitch;
    imgHeaterON_PS: TImage;
    imgHeaterOff_PS: TImage;
    vrtryswtchHeaterPS: TVrRotarySwitch;
    lbl31: TLabel;
    lbl32: TLabel;
    lbl33: TLabel;
    lbl34: TLabel;
    pnlSTANDBYPUMPGEARBOXPS: TPanel;
    imgStandByPumpGBON_PS: TImage;
    imgStandByPumpGBFault: TImage;
    vrtryswtchStandByPumpGBPS: TVrRotarySwitch;
    tmr1: TTimer;
    lbl35: TLabel;
    lbl37: TLabel;
    lbl44: TLabel;
    lbl45: TLabel;
    lbl46: TLabel;
    lbl47: TLabel;
    lbl48: TLabel;
    pnlHTPREHEATINGELECTRICPUMP1: TPanel;
    imgPreheatingPumpOn_PS: TImage;
    imgPreheatingPumpOff_PS: TImage;
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
    pnlLOPRELUBPUMPSB: TPanel;
    imgPrelubeON_SB: TImage;
    imgPrelubeOFF_SB: TImage;
    vrtryswtchPrelubeSB: TVrRotarySwitch;
    pnlSTANDBYPUMPGEARBOXSB: TPanel;
    imgStandByPumpGBON_SB: TImage;
    img25: TImage;
    vrtryswtchStandByPumpGBSB: TVrRotarySwitch;
    pnlHTPREHEATINGELECTRICPUMPSB: TPanel;
    imgPreheatingPumpOn_SB: TImage;
    imgPreheatingPumpOff_SB: TImage;
    vrtryswtchPumpHeaterSB: TVrRotarySwitch;
    pnlAlarm: TPanel;
    btnStopSB: TSpeedButtonImage;
    btnAlarm_Accept3: TSpeedButtonImage;
    btnClutchSB: TSpeedButtonImage;
    btnDeclutchSB: TSpeedButtonImage;
    btnSafetiesStopSB: TSpeedButtonImage;
    btnEmergencStopSB: TSpeedButtonImage;
    btnByPassOpenSB: TSpeedButtonImage;
    btnByPassClosedSB: TSpeedButtonImage;
    lbl53: TLabel;
    lbl54: TLabel;
    lbl55: TLabel;
    lbl56: TLabel;
    lbl57: TLabel;
    lbl58: TLabel;
    lbl59: TLabel;
    btn19: TVrDemoButton;
    pnlIndicatorLCPSS: TPanel;
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
    pnlHTELECTRICPUMPSB: TPanel;
    imgHeaterON_SB: TImage;
    imgHeaterOff_SB: TImage;
    vrtryswtchHeaterSB: TVrRotarySwitch;
    pnlLCPPS: TPanel;
    pnlLCPSB: TPanel;
    pnl4ControlLCPSTARTBOARDSIDE: TPanel;
    pnl4ControlLCPPORTSIDE: TPanel;
    grpRemote: TGroupBox;
    lbl1: TLabel;
    vrtryswtchRemotePS: TVrRotarySwitch;
    grpSpeed: TGroupBox;
    lbl7: TLabel;
    vrtryswtchSpeedPS: TVrRotarySwitch;
    grpSTCControl: TGroupBox;
    lbl10: TLabel;
    vrtryswtchSTC_PS: TVrRotarySwitch;
    grpPreStartingInhibition: TGroupBox;
    lbl11: TLabel;
    vrtryswtchPreStartPS: TVrRotarySwitch;
    grp1: TGroupBox;
    lbl29: TLabel;
    vrtryswtchRemoteSB: TVrRotarySwitch;
    grp2: TGroupBox;
    lbl38: TLabel;
    vrtryswtchSpeedSB: TVrRotarySwitch;
    grp3: TGroupBox;
    lbl41: TLabel;
    vrtryswtchSTC_SB: TVrRotarySwitch;
    grp7: TGroupBox;
    lbl43: TLabel;
    vrtryswtchPreStartSB: TVrRotarySwitch;
    btnStartSB: TSpeedButtonImage;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Image13: TImage;
    Image14: TImage;
    Image15: TImage;
    Image16: TImage;
    Image17: TImage;
    Image18: TImage;
    Image19: TImage;
    Image20: TImage;
    Image21: TImage;
    lbl12: TPanel;
    lblPrelube: TLabel;
    lbl2: TPanel;
    lbl8: TPanel;
    lbl14: TPanel;
    lbl4: TLabel;
    lblHeater: TLabel;
    lblStandByPumpGB: TLabel;
    lbl3: TPanel;
    lbl9: TLabel;
    lbl30: TLabel;
    btnPS_Standby1: TVrDemoButton;
    btnPS_Stop1: TVrDemoButton;
    btnPS_Start1: TVrDemoButton;
    Panel1: TPanel;
    lbl50: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    lbl51: TLabel;
    lbl81: TLabel;
    lbl52: TLabel;
    Panel5: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    btnPS_Standby2: TVrDemoButton;
    btnPS_Stop2: TVrDemoButton;
    btnPS_Start2: TVrDemoButton;
    Panel6: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    btnPS_Auto3: TVrDemoButton;
    btnPS_Stop3: TVrDemoButton;
    btnPS_Start3: TVrDemoButton;
    Panel7: TPanel;
    Label3: TLabel;
    Label12: TLabel;
    Panel8: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    Panel9: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    btnSB_Standby1: TVrDemoButton;
    btnSB_Stop1: TVrDemoButton;
    btnSB_Start1: TVrDemoButton;
    btnSB_Standby2: TVrDemoButton;
    btnSB_Stop2: TVrDemoButton;
    btnSB_Start2: TVrDemoButton;
    btnSB_Auto3: TVrDemoButton;
    btnSB_Stop3: TVrDemoButton;
    btnSB_Start3: TVrDemoButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    PrelubTimer: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure vrtryswtchChange(Sender: TObject);
    procedure btnONClick(Sender: TObject);
    procedure btnOFFClick(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure btnClutchClick(Sender: TObject);
    procedure btnDeclutchClick(Sender: TObject);
    procedure btnCPPClick(Sender: TObject);
    procedure LampIndicator;
    procedure btnAlarmPropulsionClick(Sender: TObject);

    procedure FormShortcut(var Msg: TWMKey; var Handled: Boolean);
    procedure btnEmergencStopClick(Sender: TObject);
    procedure btnSafetiesStopClick(Sender: TObject);
    procedure vrtryswtchPreStartPSClick(Sender: TObject);
    procedure vrtryswtchRemotePSClick(Sender: TObject);
    procedure vrtryswtchSpeedPSClick(Sender: TObject);
    procedure vrtryswtchSTC_PSClick(Sender: TObject);
    procedure btnByPassOpenClick(Sender: TObject);
    procedure btnByPassClosedClick(Sender: TObject);
    procedure PrelubTimerTimer(Sender: TObject);
    procedure btnSafetiesResetClick(Sender: TObject);

  private
    aplctnvntsKey : TApplicationEvents;
    main_engine : TMainEngine;
    main_engine_PS : TMainEngine;
    main_engine_SB : TMainEngine;
    gearbox    : TGearBox;
    gearbox_PS : TGearBox;
    gearbox_SB : TGearBox;
//    cpp    : TCPP;
    cpp_PS : TCPP;
    cpp_SB : TCPP;

    FStopDecrease: Boolean;
    FStopIncrease: Boolean;

    {Proses Prelube}
    PrelubeCounter : Integer;
    RunningCounter : Integer;
    FIsStarting : Boolean;
    FWaitToRunEngine : Boolean;

    cppHydraulicPumpID, cppConditionStatus : string;
    cppConditionStatusTag,counter : Integer;
    counterStartPS, counterStartSB, counterStopPS, counterStopSB, counterClutchPS, counterClutchSB,
    counterDeclutchPS, counterDeclutchSB : Integer;
    FFlashingStartPS, FFlashingStartSB, FFlashingStopPS, FFlashingStopSB, FPrelubBlinkPS, FPrelubBlinkSB,
    FFlashingClutchPS, FFlashingClutchSB, FFlashingDeclutchPS, FFlashingDeclutchSB : Boolean;

    procedure FlashingIndicatorStart(SenderOn, SenderOff: TSpeedButtonImage; aOnOff: Boolean);
    procedure FlashingIndicatorStop(SenderOn, SenderOff: TSpeedButtonImage; aOnOff: Boolean);
    procedure FlashingIndicatorClutch(SenderOn, SenderOff: TSpeedButtonImage; aOnOff: Boolean);
    procedure LoadSessionSynchronize;

    procedure EnginePropertyIntChange(Sender : TObject; PropsID : E_PropsID;Value : Integer);overload;
    procedure EnginePropertyBoolChange(Sender : TObject; PropsID : E_PropsID;Value : Boolean);overload;
    procedure EnginePropertyDouChange(Sender : TObject; PropsID : E_PropsID;Value : Double);overload;

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

procedure TfrmPCSLocalControlPanel.btnSafetiesResetClick(Sender: TObject);
var
  SenderOn, SenderOff : TSpeedButtonImage;
begin
  if (TButton(Sender).Tag = 0) and main_engine_PS.LocalControl then
  begin
    main_engine_PS.ResetSafetyStopPossible := True;
    TSpeedButtonImage(SenderOn).Color      := clRed;
  end
  else if (TButton(Sender).Tag = 1) and main_engine_SB.LocalControl then
  begin
    main_engine_SB.ResetSafetyStopPossible := True;
    TSpeedButtonImage(SenderOn).Color      := clRed;
  end;
end;

procedure TfrmPCSLocalControlPanel.btnSafetiesStopClick(Sender: TObject);
var
  SenderOn, SenderOff : TSpeedButtonImage;
begin
  if (TButton(Sender).Tag = 0) and main_engine_PS.LocalControl then
  begin
    main_engine_PS.SafetyStopsOverriden := True;
    TSpeedButtonImage(SenderOn).Color   := clLime;
  end
  else if (TButton(Sender).Tag = 1) and main_engine_SB.LocalControl then
  begin
    main_engine_SB.SafetyStopsOverriden := True;
    TSpeedButtonImage(SenderOn).Color   := clLime;
  end;
end;

procedure TfrmPCSLocalControlPanel.btnByPassClosedClick(Sender: TObject);
begin
  if (TButton(Sender).Tag = 0) and main_engine_PS.LocalControl then
  begin
    main_engine_PS.BypassP2P4 := False;
    main_engine_PS.AirValve   := False;
    main_engine_PS.GasValve   := False;
  end
  else if (TButton(Sender).Tag = 1) and main_engine_SB.LocalControl then
  begin
    main_engine_SB.BypassP2P4 := False;
    main_engine_SB.AirValve   := False;
    main_engine_SB.GasValve   := False;
  end;
end;

procedure TfrmPCSLocalControlPanel.btnByPassOpenClick(Sender: TObject);
begin
  if (TButton(Sender).Tag = 0) and main_engine_PS.LocalControl then
  begin
    main_engine_PS.BypassP2P4 := True;
    main_engine_PS.AirValve   := True;
    main_engine_PS.GasValve   := True;
  end
  else if (TButton(Sender).Tag = 1) and main_engine_SB.LocalControl then
  begin
    main_engine_SB.BypassP2P4 := True;
    main_engine_SB.AirValve   := True;
    main_engine_SB.GasValve   := True;
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
var
  SenderOn, SenderOff : TSpeedButtonImage;
begin
  if (TButton(Sender).Tag = 0) and main_engine_PS.LocalControl then
  begin
    main_engine_PS.LocalEmergencyStop := True;
    TSpeedButtonImage(SenderOn).Color := clLime;
  end
  else if (TButton(Sender).Tag = 1) and main_engine_SB.LocalControl then
  begin
    main_engine_SB.LocalEmergencyStop := True;
    TSpeedButtonImage(SenderOn).Color := clLime;
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
//        if cppConditionStatusTag = 1 then
//        begin
//          btnPS_Standby1.Color := clLime;
//          btnPS_Stop1.Color := clBtnFace;
//          btnPS_Start1.Color := clBtnFace;
//        end
//        else
//        if cppConditionStatusTag = 2 then
//        begin
//          btnSB_Standby1.Color := clLime;
//          btnSB_Stop1.Color := clBtnFace;
//          btnSB_Start1.Color := clBtnFace;
//        end;
      end
      else if cppHydraulicPumpID = 'Pump 2' then
      begin
        ERSystem.ERManager.EngineRoom.getPCSSystem.CPPHydraulicPump(cppConditionStatusTag,C_PUMP_CPP_HYDRAULIC_2,C_PUMP_CPP_HYDRAULIC_STANDBY,True);
//        if cppConditionStatusTag = 1 then
//        begin
//          btnPS_Standby2.Color := clLime;
//          btnPS_Stop2.Color := clBtnFace;
//          btnPS_Start2.Color := clBtnFace;
//        end
//        else
//        if cppConditionStatusTag = 2 then
//        begin
//          btnSB_Standby2.Color := clLime;
//          btnSB_Stop2.Color := clBtnFace;
//          btnSB_Start2.Color := clBtnFace;
//        end;
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
//        if cppConditionStatusTag = 1 then
//        begin
//          btnPS_Standby1.Color := clBtnFace;
//          btnPS_Stop1.Color := clLime;
//          btnPS_Start1.Color := clBtnFace;
//        end
//        else
//        if cppConditionStatusTag = 2 then
//        begin
//          btnSB_Standby1.Color := clBtnFace;
//          btnSB_Stop1.Color := clLime;
//          btnSB_Start1.Color := clBtnFace;
//        end;
      end
      else if cppHydraulicPumpID = 'Pump 2' then
      begin
        ERSystem.ERManager.EngineRoom.getPCSSystem.CPPHydraulicPump(cppConditionStatusTag,C_PUMP_CPP_HYDRAULIC_2,C_PUMP_CPP_HYDRAULIC_STOP,True);
//        if cppConditionStatusTag = 1 then
//        begin
//          btnPS_Standby2.Color := clBtnFace;
//          btnPS_Stop2.Color := clLime;
//          btnPS_Start2.Color := clBtnFace;
//        end
//        else
//        if cppConditionStatusTag = 2 then
//        begin
//          btnSB_Standby2.Color := clBtnFace;
//          btnSB_Stop2.Color := clLime;
//          btnSB_Start2.Color := clBtnFace;
//        end;
      end
      else if cppHydraulicPumpID = 'Pump 3' then
      begin
        ERSystem.ERManager.EngineRoom.getPCSSystem.CPPHydraulicPump(cppConditionStatusTag,C_PUMP_CPP_HYDRAULIC_3,C_PUMP_CPP_HYDRAULIC_STOP,True);
//        if cppConditionStatusTag = 1 then
//        begin
//          btnPS_Auto3.Color := clBtnFace;
//          btnPS_Stop3.Color := clLime;
//          btnPS_Start3.Color := clBtnFace;
//        end
//        else
//        if cppConditionStatusTag = 2 then
//        begin
//          btnSB_Auto3.Color := clBtnFace;
//          btnSB_Stop3.Color := clLime;
//          btnSB_Start3.Color := clBtnFace;
//        end;
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
//        if cppConditionStatusTag = 1 then
//        begin
//          btnPS_Standby1.Color := clBtnFace;
//          btnPS_Stop1.Color := clBtnFace;
//          btnPS_Start1.Color := clLime;
//        end
//        else
//        if cppConditionStatusTag = 2 then
//        begin
//          btnSB_Standby1.Color := clBtnFace;
//          btnSB_Stop1.Color := clBtnFace;
//          btnSB_Start1.Color := clLime;
//        end;
      end
      else if cppHydraulicPumpID = 'Pump 2' then
      begin
        ERSystem.ERManager.EngineRoom.getPCSSystem.CPPHydraulicPump(cppConditionStatusTag,C_PUMP_CPP_HYDRAULIC_2,C_PUMP_CPP_HYDRAULIC_START,True);
//        if cppConditionStatusTag = 1 then
//        begin
//          btnPS_Standby2.Color := clBtnFace;
//          btnPS_Stop2.Color := clBtnFace;
//          btnPS_Start2.Color := clLime;
//        end
//        else
//        if cppConditionStatusTag = 2 then
//        begin
//          btnSB_Standby2.Color := clBtnFace;
//          btnSB_Stop2.Color := clBtnFace;
//          btnSB_Start2.Color := clLime;
//        end;
      end
      else if cppHydraulicPumpID = 'Pump 3' then
      begin
        ERSystem.ERManager.EngineRoom.getPCSSystem.CPPHydraulicPump(cppConditionStatusTag,C_PUMP_CPP_HYDRAULIC_3,C_PUMP_CPP_HYDRAULIC_START,True);
//        if cppConditionStatusTag = 1 then
//        begin
//          btnPS_Auto3.Color := clBtnFace;
//          btnPS_Stop3.Color := clBtnFace;
//          btnPS_Start3.Color := clLime;
//        end
//        else
//        if cppConditionStatusTag = 2 then
//        begin
//          btnSB_Auto3.Color := clBtnFace;
//          btnSB_Stop3.Color := clBtnFace;
//          btnSB_Start3.Color := clLime;
//        end;
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
//        if cppConditionStatusTag = 1 then
//        begin
//          btnPS_Auto3.Color := clLime;
//          btnPS_Stop3.Color := clBtnFace;
//          btnPS_Start3.Color := clBtnFace;
//        end
//        else
//        if cppConditionStatusTag = 2 then
//        begin
//          btnSB_Auto3.Color := clLime;
//          btnSB_Stop3.Color := clBtnFace;
//          btnSB_Start3.Color := clBtnFace;
//        end;
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
      FIsStarting      := True;
      FWaitToRunEngine := True;
      FFlashingStopPS  := False;

      ERSystem.ERManager.EngineRoom.getPCSSystem.RunningStart(C_PCS_ME_PORTS);

      FFlashingStartPS := True;

      if not Assigned(main_engine) then
         Exit;

      main_engine.EngineRun := False;

      // bagian pump dan proses prelub
      main_engine.PrelubeInProgress  := True;
      PrelubeCounter := 0;

      PrelubTimer.Interval := 1000;
      PrelubTimer.Enabled  := True;

      // Gaz Valve, Air Valve dan By Pass P2-P4
      main_engine.BypassP2P4 := False;
      main_engine.AirValve   := False;
      main_engine.GasValve   := False;

      main_engine.PrimLOPumpAuto     := True;
      main_engine.PreHeatingPumpAuto := True;
      main_engine.HeaterAuto         := True;

      gearbox.ClutchEngaged := True;
    end;
  end
  else if TButton(Sender).Tag = 1 then
  begin
    if main_engine_SB.ReadyForUse and main_engine_SB.LocalControl then
    begin
      FIsStarting      := True;
      FWaitToRunEngine := True;
      FFlashingStopSB  := False;

      ERSystem.ERManager.EngineRoom.getPCSSystem.RunningStart(C_PCS_ME_STARBOARD);
      FFlashingStartSB := True;

      if not Assigned(main_engine) then
         Exit;

      main_engine.EngineRun := False;

      // bagian pump dan proses prelub
      main_engine.PrelubeInProgress  := True;
      PrelubeCounter := 0;

      PrelubTimer.Interval := 1000;
      PrelubTimer.Enabled := True;

      // Gaz Valve, Air Valve dan By Pass P2-P4
      main_engine.BypassP2P4 := False;
      main_engine.AirValve   := False;
      main_engine.GasValve   := False;

      main_engine.PrimLOPumpAuto     := True;
      main_engine.PreHeatingPumpAuto := True;
      main_engine.HeaterAuto         := True;

      gearbox.ClutchEngaged := True;
    end;
  end;
end;

procedure TfrmPCSLocalControlPanel.btnStopClick(Sender: TObject);
begin
  if TButton(Sender).Tag = 0 then
  begin
    if main_engine_PS.EngineRun and main_engine_PS.LocalControl then
    begin
      if FIsStarting then
        Exit;

      ERSystem.ERManager.EngineRoom.getPCSSystem.StoppedStop(C_PCS_ME_PORTS);
      FFlashingStopPS := True;

      // bagian pump dan proses prelub
      main_engine.PrimLOPumpAuto     := True;
      main_engine.PreHeatingPumpAuto := True;
      main_engine.HeaterAuto         := True;

      main_engine.StopIncrease := True;
      main_engine.Decrease     := True;
    end
  end
  else if TButton(Sender).Tag = 1 then
  begin
    if main_engine_SB.EngineRun and main_engine_SB.LocalControl then
    begin
      if FIsStarting then
        Exit;

      ERSystem.ERManager.EngineRoom.getPCSSystem.StoppedStop(C_PCS_ME_STARBOARD);
      FFlashingStopSB := True;

      // bagian pump dan proses prelub
      main_engine.PrimLOPumpAuto     := True;
      main_engine.PreHeatingPumpAuto := True;
      main_engine.HeaterAuto         := True;

      main_engine.StopIncrease := True;
      main_engine.Decrease     := True;
    end;
  end;
end;

procedure TfrmPCSLocalControlPanel.EnginePropertyBoolChange(Sender: TObject; PropsID: E_PropsID; Value: Boolean);
begin

  if Sender is TCPP then
  begin
    {$REGION ' CPP Section '}
    if TCPP(Sender).Identifier = 'CPP PS' then
    begin
      case PropsID of
        epPCSCPPPumpStandby1:
        begin
          if Value then
          begin
            btnPS_Standby1.Color := clLime;
            btnPS_Stop1.Color := clBtnFace;
            btnPS_Start1.Color := clBtnFace;
          end;
        end;
        epPCSCPPPumpStop1:
        begin
          if Value then
          begin
            btnPS_Standby1.Color := clBtnFace;
            btnPS_Stop1.Color := clLime;
            btnPS_Start1.Color := clBtnFace;
          end;
        end;
        epPCSCPPPumpStart1:
        begin
          if Value then
          begin
            btnPS_Standby1.Color := clBtnFace;
            btnPS_Stop1.Color := clBtnFace;
            btnPS_Start1.Color := clLime;
          end;
        end;
        epPCSCPPPumpStandby2:
        begin
          if Value then
          begin
            btnPS_Standby2.Color := clLime;
            btnPS_Stop2.Color := clBtnFace;
            btnPS_Start2.Color := clBtnFace;
          end;
        end;
        epPCSCPPPumpStop2:
        begin
          if Value then
          begin
            btnPS_Standby2.Color := clBtnFace;
            btnPS_Stop2.Color := clLime;
            btnPS_Start2.Color := clBtnFace;
          end;
        end;
        epPCSCPPPumpStart2:
        begin
          if Value then
          begin
            btnPS_Standby2.Color := clBtnFace;
            btnPS_Stop2.Color := clBtnFace;
            btnPS_Start2.Color := clLime;
          end;
        end;
        epPCSCPPPumpAuto3:
        begin
          if Value then
          begin
            btnPS_Auto3.Color := clLime;
            btnPS_Stop3.Color := clBtnFace;
            btnPS_Start3.Color := clBtnFace;
          end;
        end;
        epPCSCPPPumpStop3:
        begin
          if Value then
          begin
            btnPS_Auto3.Color := clBtnFace;
            btnPS_Stop3.Color := clLime;
            btnPS_Start3.Color := clBtnFace;
          end;
        end;
        epPCSCPPPumpStart3:
        begin
          if Value then
          begin
            btnPS_Auto3.Color := clBtnFace;
            btnPS_Stop3.Color := clBtnFace;
            btnPS_Start3.Color := clLime;
          end;
        end;
      end;
    end
    else if TCPP(Sender).Identifier = 'CPP SB' then
    begin
      case PropsID of
        epPCSCPPPumpStandby1:
        begin
          if Value then
          begin
            btnSB_Standby1.Color := clLime;
            btnSB_Stop1.Color := clBtnFace;
            btnSB_Start1.Color := clBtnFace;
          end;
        end;
        epPCSCPPPumpStop1:
        begin
          if Value then
          begin
            btnSB_Standby1.Color := clBtnFace;
            btnSB_Stop1.Color := clLime;
            btnSB_Start1.Color := clBtnFace;
          end;
        end;
        epPCSCPPPumpStart1:
        begin
          if Value then
          begin
            btnSB_Standby1.Color := clBtnFace;
            btnSB_Stop1.Color := clBtnFace;
            btnSB_Start1.Color := clLime;
          end;
        end;
        epPCSCPPPumpStandby2:
        begin
          if Value then
          begin
            btnSB_Standby2.Color := clLime;
            btnSB_Stop2.Color := clBtnFace;
            btnSB_Start2.Color := clBtnFace;
          end;
        end;
        epPCSCPPPumpStop2:
        begin
          if Value then
          begin
            btnSB_Standby2.Color := clBtnFace;
            btnSB_Stop2.Color := clLime;
            btnSB_Start2.Color := clBtnFace;
          end;
        end;
        epPCSCPPPumpStart2:
        begin
          if Value then
          begin
            btnSB_Standby2.Color := clBtnFace;
            btnSB_Stop2.Color := clBtnFace;
            btnSB_Start2.Color := clLime;
          end;
        end;
         epPCSCPPPumpAuto3:
        begin
          if Value then
          begin
            btnSB_Auto3.Color := clLime;
            btnSB_Stop3.Color := clBtnFace;
            btnSB_Start3.Color := clBtnFace;
          end;
        end;
        epPCSCPPPumpStop3:
        begin
          if Value then
          begin
            btnSB_Auto3.Color := clBtnFace;
            btnSB_Stop3.Color := clLime;
            btnSB_Start3.Color := clBtnFace;
          end;
        end;
        epPCSCPPPumpStart3:
        begin
          if Value then
          begin
            btnSB_Auto3.Color := clBtnFace;
            btnSB_Stop3.Color := clBtnFace;
            btnSB_Start3.Color := clLime;
          end;
        end;
      end;
    end;
    {$ENDREGION}
  end
  else if Sender is TMainEngine then
  begin
    {$REGION ' ME Section '}
    if TMainEngine(Sender).Identifier = 'Main Engine PS' then
    begin
      case PropsID of
        epPCSCtrlMCR:
        begin
          if Value then
            vrtryswtchRemotePS.SwitchPosition := 1
          else
            vrtryswtchRemotePS.SwitchPosition := 0;
        end;
        epPCSCtrlLocal:
        begin
          if Value then
            vrtryswtchRemotePS.SwitchPosition := 0
          else
            vrtryswtchRemotePS.SwitchPosition := 1;
        end;
        epPCSMEPreStart :
        begin
          if Value then
            vrtryswtchPreStartPS.SwitchPosition := 0;
//          else
//            vrtryswtchPreStartPS.SwitchPosition := 1;
        end;

        epPCSMERunning :
        begin
          if Value then
          begin
            FFlashingStartPS := True;
            FFlashingStopPS  := False;

            img18.Picture.LoadFromFile(fAlarmIndicatorGreenOn);
          end
          else
          begin
            FFlashingStartPS := False;
            FFlashingStopPS  := True;
            img18.Picture.LoadFromFile(fAlarmIndicatorGreenOff);
          end;
        end;
        epPCSGBClutchAllowed :    //Lamp Indicator
        begin
          if Value then
            img21.Picture.LoadFromFile(fAlarmIndicatorGreenOn)
          else
            img21.Picture.LoadFromFile(fAlarmIndicatorGreenOff);
        end;
        epPCSMEAirValve :
        begin
          if Value then
            img1.Picture.LoadFromFile(fAlarmIndicatorBlueOn)
          else
            img1.Picture.LoadFromFile(fAlarmIndicatorBlueOff);
        end;
        epPCSMEGasValve :
        begin
          if Value then
            img2.Picture.LoadFromFile(fAlarmIndicatorBlueOn)
          else
            img2.Picture.LoadFromFile(fAlarmIndicatorBlueOff);
        end;
        epPCSGBClutchEngaged :
        begin
          if Value then
          begin
             FFlashingClutchPS   := True;
             FFlashingDeclutchPS := False;
          end
          else
          begin
            FFlashingClutchPS   := False;
            FFlashingDeclutchPS := True;
          end;
        end;
        epPCSMESafetyStopsOverriden :
        begin
          main_engine_PS.EmergencyStop := True;
        end;
        epPCSMELocalEmergencyStop :
        begin
          main_engine_PS.LocalEmergencyStop := True;
        end;
        epPCSMEResetSafetyStopPossible :
        begin
          main_engine.ResetSafetyStopPossible := True;
        end;
      end;
    end
    else if TMainEngine(Sender).Identifier = 'Main Engine SB' then
    begin
      case PropsID of
        epPCSCtrlMCR:
        begin
          if Value then
            vrtryswtchRemoteSB.SwitchPosition := 1
          else
            vrtryswtchRemoteSB.SwitchPosition := 0;
        end;
        epPCSCtrlLocal:
        begin
          if Value then
            vrtryswtchRemoteSB.SwitchPosition := 0
          else
            vrtryswtchRemoteSB.SwitchPosition := 1;
        end;
        epPCSMEPreStart :
        begin
          if Value then
            vrtryswtchPreStartSB.SwitchPosition := 0
//          else
//            vrtryswtchPreStartSB.SwitchPosition := 1;
        end;
        epPCSMERunning :
        begin
          if Value then
          begin
            FFlashingStartSB := True;
            FFlashingStopSB  := False;
            img30.Picture.LoadFromFile(fAlarmIndicatorGreenOff);
          end
          else
          begin
            FFlashingStartSB := False;
            FFlashingStopSB  := True;
            img30.Picture.LoadFromFile(fAlarmIndicatorGreenOn);
          end;
        end;
        epPCSGBClutchAllowed :
        begin
          if Value then
            img31.Picture.LoadFromFile(fAlarmIndicatorGreenOn)
          else
            img31.Picture.LoadFromFile(fAlarmIndicatorGreenOff);
        end;
        epPCSMEAirValve :
        begin
          if Value then
            img32.Picture.LoadFromFile(fAlarmIndicatorBlueOn)
          else
            img32.Picture.LoadFromFile(fAlarmIndicatorBlueOff);
        end;
        epPCSMEGasValve :
        begin
          if Value then
            img33.Picture.LoadFromFile(fAlarmIndicatorBlueOn)
          else
            img33.Picture.LoadFromFile(fAlarmIndicatorBlueOff);
        end;
        epPCSGBClutchEngaged :
        begin
          if Value then
          begin
             FFlashingClutchSB   := True;
             FFlashingDeclutchSB := False;
          end
          else
          begin
            FFlashingClutchSB   := False;
            FFlashingDeclutchSB := True;
          end;
        end;
        epPCSMESafetyStopsOverriden :
        begin
           main_engine_PS.EmergencyStop := True;
        end;
        epPCSMELocalEmergencyStop :
        begin
          main_engine_PS.LocalEmergencyStop := True;
        end;
        epPCSMEResetSafetyStopPossible :
        begin
          main_engine.ResetSafetyStopPossible := True;
        end;
      end;
    {$ENDREGION}
    end;
  end;
end;

procedure TfrmPCSLocalControlPanel.EnginePropertyDouChange(Sender: TObject; PropsID: E_PropsID; Value: Double);
begin

end;

procedure TfrmPCSLocalControlPanel.EnginePropertyIntChange(Sender: TObject; PropsID: E_PropsID; Value: Integer);
begin
  if Sender is TMainEngine then
  begin
    {$REGION ' ME Section '}
    if TMainEngine(Sender).Identifier = 'Main Engine PS' then
    begin
      case PropsID of
        epPCSSpeedState :
        begin
          vrtryswtchSpeedPS.SwitchPosition := Value;
        end;
        epPCSMESTCInManual :
        begin
          vrtryswtchSTC_PS.SwitchPosition := Value;
        end;
      end;
    end
    else if TMainEngine(Sender).Identifier = 'Main Engine SB' then
    begin
      case PropsID of
        epPCSSpeedState :
        begin
          vrtryswtchSpeedSB.SwitchPosition := Value;
        end;
        epPCSMESTCInManual :
        begin
          vrtryswtchSTC_SB.SwitchPosition := Value;
        end;
      end;
    end;
  end;
  {$ENDREGION}
end;

procedure TfrmPCSLocalControlPanel.FlashingIndicatorClutch(SenderOn,
  SenderOff: TSpeedButtonImage; aOnOff: Boolean);
begin
  counter := counter + 1;

  if counter < 5 then
  begin
    if TSpeedButtonImage(SenderOn).Color = clGray then
      TSpeedButtonImage(SenderOn).Color := clWhite
    else
      TSpeedButtonImage(SenderOn).Color := clGray;
  end;

  if counter > 5 then
  begin
    if aOnOff then
    begin
      TSpeedButtonImage(SenderOn).Color := clWhite;
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
var
  CurrentCounter : PInteger;
begin
  if SenderOn.Tag = 0 then
    CurrentCounter := @counterStartPS
  else
    CurrentCounter := @counterStartSB;

  Inc(CurrentCounter^);

  if CurrentCounter^ < 60 then
  begin
    if SenderOn.Color = clGreen then
      SenderOn.Color := clLime
    else
      SenderOn.Color := clGreen;
  end;

  if CurrentCounter^ > 60 then
  begin
    if aOnOff then
    begin
      SenderOn.Color  := clLime;
      SenderOff.Color := clMaroon;
    end
    else
      SenderOn.Color := clGreen;

    if (SenderOn.Tag = 0) and FWaitToRunEngine then
    begin
      main_engine.EngineRun     := True;
      main_engine.SetPointSpeed := 400;

      FWaitToRunEngine := False;
      FIsStarting      := False;
    end
    else if (SenderOn.Tag = 1) and FWaitToRunEngine  then
    begin
      main_engine.EngineRun     := True;
      main_engine.SetPointSpeed := 400;

      FWaitToRunEngine := False;
      FIsStarting      := False;
    end;

    CurrentCounter^ := 0;
    if SenderOn.Tag = 0 then
       FFlashingStartPS := not aOnOff
    else if SenderOn.Tag = 1 then
       FFlashingStartSB := not aOnOff;
  end;
end;

procedure TfrmPCSLocalControlPanel.FlashingIndicatorStop(SenderOn, SenderOff: TSpeedButtonImage; aOnOff: Boolean);
var
  CurrentCounter : PInteger;
begin
  if SenderOn.Tag = 0 then
    CurrentCounter := @counterStopPS
  else
    CurrentCounter := @counterStopSB;

  Inc(CurrentCounter^);

  if CurrentCounter^ < 5 then
  begin
    if SenderOn.Color = clMaroon then
      SenderOn.Color := clRed
    else
      SenderOn.Color := clMaroon;
  end;

  if CurrentCounter^ > 5 then
  begin
    if aOnOff then
    begin
      SenderOn.Color  := clRed;
      SenderOff.Color := clGreen;
    end
    else
      SenderOn.Color := clMaroon;

    CurrentCounter^ := 0;
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

  ERSystem.ERManager.EngineRoom.getPCSSystem.addEntityListener('PCS Local Panel',EnginePropertyBoolChange);
  ERSystem.ERManager.EngineRoom.getPCSSystem.addEntityListener('PCS Local Panel',EnginePropertyIntChange);
  ERSystem.ERManager.EngineRoom.getPCSSystem.addEntityListener('PCS Local Panel',EnginePropertyDouChange);
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
//  if main_engine_PS.PrimLOPump then
//    imgPrelubeON_PS.Picture.LoadFromFile(fIndicatorOn)
//  else
//    imgPrelubeON_PS.Picture.LoadFromFile(fIndicatorOff);

//  if main_engine_SB.PrimLOPump then
//    imgPrelubeON_SB.Picture.LoadFromFile(fIndicatorOn)
//  else
//    imgPrelubeON_SB.Picture.LoadFromFile(fIndicatorOff);
//
//  if main_engine_PS.PreHeatingPump then
//    imgPreheatingPumpOn_PS.Picture.LoadFromFile(fIndicatorOn)
//  else
//    imgPreheatingPumpOn_PS.Picture.LoadFromFile(fIndicatorOff);
//
//  if main_engine_SB.PreHeatingPump then
//    imgPreheatingPumpOn_SB.Picture.LoadFromFile(fIndicatorOn)
//  else
//    imgPreheatingPumpOn_SB.Picture.LoadFromFile(fIndicatorOff);
//
//  if main_engine_PS.Heater then
//    imgHeaterON_PS.Picture.LoadFromFile(fIndicatorOn)
//  else
//    imgHeaterON_PS.Picture.LoadFromFile(fIndicatorOff);
//
//  if main_engine_SB.Heater then
//    imgHeaterON_SB.Picture.LoadFromFile(fIndicatorOn)
//  else
//    imgHeaterON_SB.Picture.LoadFromFile(fIndicatorOff);
//
//  if gearbox_PS.StandbyPump then
//    imgStandByPumpGBON_PS.Picture.LoadFromFile(fIndicatorOn)
//  else
//    imgStandByPumpGBON_PS.Picture.LoadFromFile(fIndicatorOff);
//
//  if gearbox_SB.StandbyPump then
//    imgStandByPumpGBON_SB.Picture.LoadFromFile(fIndicatorOn)
//  else
//    imgStandByPumpGBON_SB.Picture.LoadFromFile(fIndicatorOff);

  if main_engine_PS.ReadyForUse then
  begin
    img3.Picture.LoadFromFile(fAlarmIndicatorGreenOn);
    img6.Picture.LoadFromFile(fAlarmIndicatorGreenOn);
  end
  else
  begin
    img3.Picture.LoadFromFile(fAlarmIndicatorWhiteOff);
  end;

  if main_engine_SB.ReadyForUse then
  begin
    img34.Picture.LoadFromFile(fAlarmIndicatorGreenOn);
    img37.Picture.LoadFromFile(fAlarmIndicatorGreenOn);
  end
  else
  begin
    img34.Picture.LoadFromFile(fAlarmIndicatorWhiteOff);
  end;

  if main_engine_PS.EngineRun then
    img18.Picture.LoadFromFile(fAlarmIndicatorGreenOn)
  else
    img18.Picture.LoadFromFile(fAlarmIndicatorGreenOff);

  if main_engine_SB.EngineRun then
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
  begin
    img1.Picture.LoadFromFile(fAlarmIndicatorBlueOn);
    img4.Picture.LoadFromFile(fAlarmIndicatorBlueOff);
  end
  else
  begin
    img1.Picture.LoadFromFile(fAlarmIndicatorBlueOff);
    img4.Picture.LoadFromFile(fAlarmIndicatorBlueOn);
  end;

  if main_engine_PS.GasValve then
  begin
    img2.Picture.LoadFromFile(fAlarmIndicatorBlueOn);
    img5.Picture.LoadFromFile(fAlarmIndicatorBlueOff);
  end
  else
  begin
    img2.Picture.LoadFromFile(fAlarmIndicatorBlueOff);
    img5.Picture.LoadFromFile(fAlarmIndicatorBlueOn);
  end;

  if main_engine_SB.AirValve then
  begin
    img32.Picture.LoadFromFile(fAlarmIndicatorBlueOn);
    img35.Picture.LoadFromFile(fAlarmIndicatorBlueOff);
  end
  else
  begin
    img32.Picture.LoadFromFile(fAlarmIndicatorBlueOff);
    img35.Picture.LoadFromFile(fAlarmIndicatorBlueOn);
  end;

  if main_engine_SB.GasValve then
  begin
    img33.Picture.LoadFromFile(fAlarmIndicatorBlueOn);
    img36.Picture.LoadFromFile(fAlarmIndicatorBlueOff);
  end
  else
  begin
    img33.Picture.LoadFromFile(fAlarmIndicatorBlueOff);
    img36.Picture.LoadFromFile(fAlarmIndicatorBlueOn);
  end;

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

  if main_engine_PS.SafetyStopsOverriden then
    img10.Picture.LoadFromFile(fAlarmIndicatorRedOn)
  else
    img10.Picture.LoadFromFile(fAlarmIndicatorRedOff);

  if main_engine_SB.SafetyStopsOverriden then
    img41.Picture.LoadFromFile(fAlarmIndicatorRedOn)
  else
    img41.Picture.LoadFromFile(fAlarmIndicatorRedOff);

  if main_engine_PS.ManHandleAtStop then
    img9.Picture.LoadFromFile(fAlarmIndicatorRedOn)
  else
    img9.Picture.LoadFromFile(fAlarmIndicatorRedOff);

  if main_engine_SB.ManHandleAtStop then
    img40.Picture.LoadFromFile(fAlarmIndicatorRedOn)
  else
    img40.Picture.LoadFromFile(fAlarmIndicatorRedOff);

  if main_engine_PS.STCSequenceFail then
    img12.Picture.LoadFromFile(fAlarmIndicatorRedOn)
  else
    img12.Picture.LoadFromFile(fAlarmIndicatorRedOff);

  if main_engine_SB.STCSequenceFail then
    img43.Picture.LoadFromFile(fAlarmIndicatorRedOn)
  else
    img43.Picture.LoadFromFile(fAlarmIndicatorRedOff);
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

procedure TfrmPCSLocalControlPanel.PrelubTimerTimer(Sender: TObject);
begin
  if Assigned(main_engine) then
    main_engine.PrelubeInProgress := not main_engine.PrelubeInProgress;

  Inc(PrelubeCounter);

    if Assigned(main_engine) then
  begin
    case PrelubeCounter of
      54:
        begin
          main_engine.BypassP2P4 := True;
          main_engine.AirValve   := True;
          main_engine.GasValve   := True;
          main_engine.EngineRun  := True;

          main_engine.PrimLOPumpAuto     := False;
          main_engine.PreHeatingPumpAuto := False;
          main_engine.HeaterAuto         := False;

          main_engine.PrelubeInProgress := False;
        end;
      57:
        begin
          main_engine.BypassP2P4 := False;
          main_engine.AirValve   := False;
          main_engine.GasValve   := False;

          PrelubTimer.Enabled := False;
          main_engine.PrelubeInProgress := False;
        end;
    end;
  end;
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

  if not FIsStarting then
  begin
    if FFlashingStopPS then
    FlashingIndicatorStop(btnStopPS,btnStartPS,True);

    if FFlashingStopSB then
    FlashingIndicatorStop(btnStopSB,btnStartSB,True);
  end;

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
      main_engine.PrimLOPump     := False;
      main_engine.PrimLOPumpAuto := False;
    end
    else if TVrRotarySwitch(Sender).SwitchPosition = 2 then
    begin
      main_engine.PrimLOPumpAuto    := True;
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

      // bagian pump dan proses prelub
      main_engine.PrelubeInProgress  := False;
      PrelubTimer.Enabled := False;
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

procedure TfrmPCSLocalControlPanel.vrtryswtchPreStartPSClick(Sender: TObject);
begin
  if (TVrRotarySwitch(Sender).Tag = 0)then
  begin
    if  main_engine_PS.LocalControl then
    begin
      if vrtryswtchPreStartPS.SwitchPosition = 1 then
      begin
        main_engine_PS.PreStartInhibition := True;
        ERSystem.ERManager.EngineRoom.getPCSSystem.RunningStart(C_PCS_ME_PORTS);
        vrtryswtchPreStartPS.SwitchPosition := 0;
      end;
    end
    else
    begin
      vrtryswtchPreStartPS.SwitchPosition := 0
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

procedure TfrmPCSLocalControlPanel.vrtryswtchRemotePSClick(Sender: TObject);
begin
  if TVrRotarySwitch(Sender).Tag = 0 then
  begin
    if vrtryswtchRemotePS.SwitchPosition = 0 then
    begin
      ERSystem.ERManager.EngineRoom.getPCSSystem.RemoteToMCR(C_PCS_ME_PORTS, False);
//      ERSystem.ERManager.EngineRoom.getPCSSystem.Remote(C_PCS_ME_PORTS, False);
    end
    else if vrtryswtchRemotePS.SwitchPosition = 1 then
    begin
      ERSystem.ERManager.EngineRoom.getPCSSystem.RemoteToMCR(C_PCS_ME_PORTS, True);
//      ERSystem.ERManager.EngineRoom.getPCSSystem.Remote(C_PCS_ME_PORTS, True);
    end;
  end
  else if TVrRotarySwitch(Sender).Tag = 1 then
  begin
    if vrtryswtchRemoteSB.SwitchPosition = 0 then
      ERSystem.ERManager.EngineRoom.getPCSSystem.RemoteToMCR(C_PCS_ME_STARBOARD, False)
    else if vrtryswtchRemoteSB.SwitchPosition = 1 then
      ERSystem.ERManager.EngineRoom.getPCSSystem.RemoteToMCR(C_PCS_ME_STARBOARD, True);
  end;
end;

procedure TfrmPCSLocalControlPanel.vrtryswtchSpeedPSClick(Sender: TObject);
begin
  if (TVrRotarySwitch(Sender).Tag = 0) and main_engine_PS.LocalControl then
  begin
    if vrtryswtchSpeedPS.SwitchPosition = 0 then
    begin
      main_engine_PS.DecreaseSpeed := True;
      main_engine_PS.IncreaseSpeed := False;
      vrtryswtchSpeedPS.SwitchPosition := 1;
    end
    else if vrtryswtchSpeedPS.SwitchPosition = 1 then
    begin
      main_engine_PS.DecreaseSpeed := False;
      main_engine_PS.IncreaseSpeed := False;
    end
    else if vrtryswtchSpeedPS.SwitchPosition = 2 then
    begin
      main_engine_PS.DecreaseSpeed := False;
      main_engine_PS.IncreaseSpeed := True;
      vrtryswtchSpeedPS.SwitchPosition := 1;
    end;
  end
  else if (TVrRotarySwitch(Sender).Tag = 1) and main_engine_SB.LocalControl then
  begin
    if vrtryswtchSpeedSB.SwitchPosition = 0 then
    begin
      main_engine_SB.DecreaseSpeed := True;
      main_engine_SB.IncreaseSpeed := False;
      vrtryswtchSpeedSB.SwitchPosition := 1;
    end
    else if vrtryswtchSpeedSB.SwitchPosition = 1 then
    begin
      main_engine_SB.DecreaseSpeed := False;
      main_engine_SB.IncreaseSpeed := False;
    end
    else if vrtryswtchSpeedSB.SwitchPosition = 2 then
    begin
      main_engine_SB.DecreaseSpeed := False;
      main_engine_SB.IncreaseSpeed := True;
      vrtryswtchSpeedSB.SwitchPosition := 1;
    end;
  end;
end;

procedure TfrmPCSLocalControlPanel.vrtryswtchSTC_PSClick(Sender: TObject);
begin
 if (TVrRotarySwitch(Sender).Tag = 0) and main_engine_PS.LocalControl then
  begin
    if vrtryswtchSTC_PS.SwitchPosition = 0 then
    begin
      main_engine_PS.STCInManualMode := True;
      main_engine_PS.S2TCState := True;
    end
    else if vrtryswtchSTC_PS.SwitchPosition = 1 then
    begin
      main_engine_PS.STCInManualMode := False;
      main_engine_PS.S2TCState := False;
    end
    else if vrtryswtchSTC_PS.SwitchPosition = 2 then
    begin
      main_engine_PS.STCInManualMode := True;
      main_engine_PS.S2TCState := False;
    end
  end
  else if (TVrRotarySwitch(Sender).Tag = 1) and main_engine_SB.LocalControl then
  begin
    if vrtryswtchSTC_SB.SwitchPosition = 0 then
    begin
      main_engine_SB.STCInManualMode := True;
      main_engine_SB.S2TCState := True;
    end
    else if vrtryswtchSTC_SB.SwitchPosition = 1 then
    begin
      main_engine_SB.STCInManualMode := False;
      main_engine_SB.S2TCState := False;
    end
    else if vrtryswtchSTC_SB.SwitchPosition = 2 then
    begin
      main_engine_SB.STCInManualMode := True;
      main_engine_SB.S2TCState := False;
    end;
  end;
end;

end.
