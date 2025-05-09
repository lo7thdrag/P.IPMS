unit uPowerManagementSys;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uGenerator, uSwitchboard, Menus, uSwitchElement,
  Buttons, VrControls, VrButtons, uDataType ;

type
  TfrmPowerManagementSyst = class(TForm)
    pm1: TPopupMenu;
    AlarmOn1: TMenuItem;
    AlarmOff1: TMenuItem;
    lbl1: TPanel;
    lbl2: TLabel;
    lbl3: TPanel;
    lbl4: TLabel;
    lbl5: TPanel;
    lbl6: TLabel;
    lbl7: TPanel;
    lbl8: TLabel;
    lbl9: TPanel;
    lbl10: TLabel;
    lbl11: TPanel;
    lbl12: TLabel;
    lbl13: TPanel;
    btnAfterNonEssent: TVrDemoButton;
    lbl14: TPanel;
    btnEmergencyNonEssent: TVrDemoButton;
    lbl15: TPanel;
    lbl16: TLabel;
    lbl18: TPanel;
    lbl21: TLabel;
    lbl22: TPanel;
    lbl23: TLabel;
    lbl24: TPanel;
    lbl25: TLabel;
    lbl26: TPanel;
    lbl27: TLabel;
    lbl28: TLabel;
    btnCbReset05: TVrDemoButton;
    chk1: TCheckBox;
    chk2: TCheckBox;
    lbl29: TPanel;
    lbl31: TPanel;
    btnforwardNonEssent: TVrDemoButton;
    lblpnl230v: TPanel;
    lbl32: TLabel;
    btn3245E5004A: TVrDemoButton;
    btn3245E5001A: TVrDemoButton;
    btn3243E5005A: TVrDemoButton;
    btn3245E5005A: TVrDemoButton;
    lblpnl24V: TPanel;
    lbl33: TLabel;
    btn3242E5001A: TVrDemoButton;
    btn3120E5002A: TVrDemoButton;
    btn3120E5004A: TVrDemoButton;
    btn3242E5011A: TVrDemoButton;
    btn3242E5021A: TVrDemoButton;
    btn3242E5025A: TVrDemoButton;
    btn3242E5024B: TVrDemoButton;
    lblDCU1: TPanel;
    lbl17: TLabel;
    lbl19: TLabel;
    lbl20: TLabel;
    lbl30: TLabel;
    lbl34: TLabel;
    lbl35: TLabel;
    lbl36: TLabel;
    lbl37: TLabel;
    lbl38: TLabel;
    lbl39: TLabel;
    lbl40: TLabel;
    lbl41: TLabel;
    lbl42: TLabel;
    lbl43: TLabel;
    lbl44: TLabel;
    rbStandby01: TRadioButton;
    chkAutomaticStartFailed01: TCheckBox;
    chkCoolingWaterLevelLow01: TCheckBox;
    chkCoolingWaterTempHigh01: TCheckBox;
    chkFuelOilLeakage01: TCheckBox;
    chkFUWASeparator01: TCheckBox;
    chkLubOilPressLow01: TCheckBox;
    chkLubOilTempHigh01: TCheckBox;
    chkSpeedSensorFailure01: TCheckBox;
    chkSupplyVoltageLow01: TCheckBox;
    rbManual01: TRadioButton;
    lbl45: TPanel;
    lbl46: TPanel;
    lblLampOS01: TPanel;
    lblLampLOPL01: TPanel;
    lblLampCWTH01: TPanel;
    lblLampES01: TPanel;
    lblDCU2: TPanel;
    lbl47: TLabel;
    lbl48: TLabel;
    lbl49: TLabel;
    lbl50: TLabel;
    lbl51: TLabel;
    lbl52: TLabel;
    lbl53: TLabel;
    lbl54: TLabel;
    lbl55: TLabel;
    lbl56: TLabel;
    lbl57: TLabel;
    lbl58: TLabel;
    lbl59: TLabel;
    lbl60: TLabel;
    lbl61: TLabel;
    rbStandby02: TRadioButton;
    rbManual02: TRadioButton;
    chkSupplyVoltageLow02: TCheckBox;
    chkAutomaticStartFailed02: TCheckBox;
    chkSpeedSensorFailure02: TCheckBox;
    chkLubOilPressLow02: TCheckBox;
    chkLubOilTempHigh02: TCheckBox;
    chkCoolingWaterTempHigh02: TCheckBox;
    chkCoolingWaterLevelLow02: TCheckBox;
    chkFuelOilLeakage02: TCheckBox;
    chkFUWASeparator02: TCheckBox;
    lbl62: TPanel;
    lbl63: TPanel;
    lblLampOS02: TPanel;
    lblLampLOPL02: TPanel;
    lblLampCWTH02: TPanel;
    lblLampES02: TPanel;
    lblDCU3: TPanel;
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
    rbStandby03: TRadioButton;
    rbManual03: TRadioButton;
    chkSupplyVoltageLow03: TCheckBox;
    chkAutomaticStartFailed03: TCheckBox;
    chkSpeedSensorFailure03: TCheckBox;
    chkLubOilPressLow03: TCheckBox;
    chkLubOilTempHigh03: TCheckBox;
    chkCoolingWaterTempHigh03: TCheckBox;
    chkCoolingWaterLevelLow03: TCheckBox;
    chkFuelOilLeakage03: TCheckBox;
    chkFUWASeparator03: TCheckBox;
    lbl79: TPanel;
    lbl80: TPanel;
    lblLampOS03: TPanel;
    lblLampLOPL03: TPanel;
    lblLampCWTH03: TPanel;
    lblLampES03: TPanel;
    lblDCU4: TPanel;
    lbl81: TLabel;
    lbl82: TLabel;
    lbl83: TLabel;
    lbl84: TLabel;
    lbl85: TLabel;
    lbl86: TLabel;
    lbl87: TLabel;
    lbl88: TLabel;
    lbl89: TLabel;
    lbl90: TLabel;
    lbl91: TLabel;
    lbl92: TLabel;
    lbl93: TLabel;
    lbl94: TLabel;
    lbl95: TLabel;
    rbStandby04: TRadioButton;
    rbManual04: TRadioButton;
    chkSupplyVoltageLow04: TCheckBox;
    chkAutomaticStartFailed04: TCheckBox;
    chkSpeedSensorFailure04: TCheckBox;
    chkLubOilPressLow04: TCheckBox;
    chkLubOilTempHigh04: TCheckBox;
    chkCoolingWaterTempHigh04: TCheckBox;
    chkCoolingWaterLevelLow04: TCheckBox;
    chkFuelOilLeakage04: TCheckBox;
    chkFUWASeparator04: TCheckBox;
    lbl96: TPanel;
    lbl97: TPanel;
    lblLampOS04: TPanel;
    lblLampLOPL04: TPanel;
    lblLampCWTH04: TPanel;
    lblLampES04: TPanel;
    lblEMERGENCY: TPanel;
    lbl98: TLabel;
    lbl99: TLabel;
    lbl100: TLabel;
    lbl101: TLabel;
    lbl102: TLabel;
    lbl103: TLabel;
    lbl104: TLabel;
    lbl105: TLabel;
    lbl106: TLabel;
    lbl107: TLabel;
    lbl108: TLabel;
    lbl109: TLabel;
    lbl110: TLabel;
    lbl111: TLabel;
    rbStandby05: TRadioButton;
    rbManual05: TRadioButton;
    chkSupplyVoltageLow05: TCheckBox;
    chkAutomaticStartFailed05: TCheckBox;
    chkSpeedSensorFailure05: TCheckBox;
    chkLubOilPressLow05: TCheckBox;
    chkLubOilTempHigh05: TCheckBox;
    chkCoolingWaterTempHigh05: TCheckBox;
    chkCoolingWaterLevelLow05: TCheckBox;
    chkFuelOilLeakage05: TCheckBox;
    chkFUWASeparator05: TCheckBox;
    lbl112: TPanel;
    lbl113: TPanel;
    lblLampOS05: TPanel;
    lblLampLOPL05: TPanel;
    lblLampCWTH05: TPanel;
    lblGENSYS1: TPanel;
    lbl114: TLabel;
    lbl115: TLabel;
    chkCanBusFailure01: TCheckBox;
    chk3: TCheckBox;
    btnCbReset01: TVrDemoButton;
    lbl116: TPanel;
    lblGENSYS2: TPanel;
    lbl117: TLabel;
    lbl118: TLabel;
    chkCanBusFailure02: TCheckBox;
    chk4: TCheckBox;
    lbl119: TPanel;
    btnCbReset02: TVrDemoButton;
    lblGENSYS3: TPanel;
    lbl120: TLabel;
    lbl121: TLabel;
    chkCanBusFailure03: TCheckBox;
    chk5: TCheckBox;
    lbl122: TPanel;
    btnCbReset04: TVrDemoButton;
    lblGENSYS4: TPanel;
    lbl123: TLabel;
    lbl124: TLabel;
    chkCanBusFailure04: TCheckBox;
    chk6: TCheckBox;
    lbl125: TPanel;
    btnCbReset03: TVrDemoButton;
    lblUPS: TPanel;
    lbl126: TLabel;
    btn3133E5001A: TVrDemoButton;
    btn3133E5011A: TVrDemoButton;
    btn3133E5021A: TVrDemoButton;

    procedure FormCreate(Sender: TObject);

    procedure AlarmOn1Click(Sender: TObject);

    {$REGION ' Alarm Condition Procedure '}

    procedure NotStandbyMode(Sender: TObject);

    procedure MeasVoltMode(Sender: TObject);
    procedure AutomaticStartFailed(Sender: TObject);
    procedure SpeedSensorFailure(Sender: TObject);
    procedure LubOilPressLow(Sender: TObject);
    procedure LubOilTempHigh(Sender: TObject);
    procedure CoolingWaterTempHigh(Sender: TObject);
    procedure CoolingWaterLevelLow(Sender: TObject);
    procedure FuelOilLeakage(Sender: TObject);

    procedure DCPowMode(Sender: TObject);
    procedure CanBusMode(Sender: TObject);
    {$ENDREGION}

    procedure btnResetClick(Sender: TObject);
    procedure OnPmsConditionMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

  private
    { Private declarations }
    SwitchBoardId : string;
    elementID : string;
    isElementOrSwitchboard : Byte;
    CWTFailure01, CWTFailure02, CWTFailure03, CWTFailure04, CWTFailure05 : Integer;

    function toWarna(val : boolean): Integer;

    procedure SetBtnColor(Id : string; valbool: Boolean);
    procedure SetValueBool(IdGen : Integer; value : Boolean; modeAlarm : E_PropsID);
    procedure SetMimic(PageMimic : E_MimicType);

    procedure EnginePropertyIntChange(Sender : TObject; PropsID : E_PropsID;Value : Integer);overload;
    procedure EnginePropertyBoolChange(Sender : TObject; PropsID : E_PropsID;Value : Boolean);overload;
    procedure EnginePropertyDouChange(Sender : TObject; PropsID : E_PropsID;Value : Double);overload;

  public
    { Public declarations }
    Msb : array [0..2] of TSwitchboard;
  end;

var
  frmPowerManagementSyst: TfrmPowerManagementSyst;
  generator : TGenerator;
  switchboard : TSwitchboard;

implementation

uses
  uMimicsSystem, uERSystem, uSWEInput, uSWE, uControllerSystem;
{$R *.dfm}


procedure TfrmPowerManagementSyst.FormCreate(Sender: TObject);
begin
  ERSystem.ERManager.EngineRoom.getPMSSystem.addEntityListener('PMS Condition',EnginePropertyBoolChange);
  ERSystem.ERManager.EngineRoom.getPMSSystem.addEntityListener('PMS Condition',EnginePropertyIntChange);
  ERSystem.ERManager.EngineRoom.getPMSSystem.addEntityListener('PMS Condition',EnginePropertyDouChange);
end;

procedure TfrmPowerManagementSyst.EnginePropertyBoolChange(Sender: TObject; PropsID: E_PropsID; Value: Boolean);
begin
  if Sender is TGenerator then
  begin
    case PropsID of
      epPMSFailureCBClosed:
      begin
        if TGenerator(Sender).Identifier = C_GENERATOR_ID[0] then
          btnCbReset01.Color := toWarna(Value)
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[1] then
          btnCbReset02.Color := toWarna(Value)
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[2] then
          btnCbReset03.Color := toWarna(Value)
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[3] then
          btnCbReset04.Color := toWarna(Value)
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[4] then
          btnCbReset05.Color := toWarna(Value)
      end;
      epPMSSpeedSensorFailureShutdown:
      begin
        {$REGION ' Speed Sensor Failure Shutdown '}
        if TGenerator(Sender).Identifier = C_GENERATOR_ID[0] then
          lblLampOS01.Color := toWarna(Value)
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[1] then
          lblLampOS01.Color := toWarna(Value)
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[2] then
          lblLampOS01.Color := toWarna(Value)
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[3] then
          lblLampOS01.Color := toWarna(Value)
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[4] then
          lblLampOS01.Color := toWarna(Value)
        {$ENDREGION}
      end;
      epPMSLubOilPressLowShutdown:
      begin
        {$REGION ' Lub Oil Press Low Shutdown '}
        if TGenerator(Sender).Identifier = C_GENERATOR_ID[0] then
          lblLampLOPL01.Color := toWarna(Value)
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[1] then
          lblLampLOPL02.Color := toWarna(Value)
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[2] then
          lblLampLOPL03.Color := toWarna(Value)
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[3] then
          lblLampLOPL04.Color := toWarna(Value)
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[4] then
          lblLampLOPL05.Color := toWarna(Value)
        {$ENDREGION}
      end;
      epPMSCoolWaterTempHighShutdown :
      begin
        {$REGION ' Cool Water Temp High Shutdown '}
        if TGenerator(Sender).Identifier = C_GENERATOR_ID[0] then
          lblLampCWTH01.Color := toWarna(Value)
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[1] then
          lblLampCWTH02.Color := toWarna(Value)
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[2] then
          lblLampCWTH03.Color := toWarna(Value)
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[3] then
          lblLampCWTH04.Color := toWarna(Value)
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[4] then
          lblLampCWTH05.Color := toWarna(Value)
        {$ENDREGION}
      end;
      epPMSGeneratorEmergencyStop:
      begin
        {$REGION ' Emergency Stop '}
        if TGenerator(Sender).Identifier = C_GENERATOR_ID[0] then
          lblLampES01.Color := toWarna(Value)
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[1] then
          lblLampES02.Color := toWarna(Value)
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[2] then
          lblLampES03.Color := toWarna(Value)
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[3] then
          lblLampES04.Color := toWarna(Value);
        {$ENDREGION}
      end;
      epPMSNotStandby :
      begin
        if TGenerator(Sender).Identifier = C_GENERATOR_ID[0] then
        begin
          rbStandby01.Checked := not Value;
          rbManual01.Checked := Value;
        end
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[1] then
        begin
          rbStandby02.Checked := not Value;
          rbManual02.Checked := Value;
        end
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[2] then
        begin
          rbStandby03.Checked := not Value;
          rbManual03.Checked := Value;
        end
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[3] then
        begin
          rbStandby04.Checked := not Value;
          rbManual04.Checked := Value;
        end
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[4] then
        begin
          rbStandby05.Checked := not Value;
          rbManual05.Checked := Value;
        end
      end;
    end;
  end
  else if Sender is TSwitchboard then
  begin
    case PropsID of
      epPMSMsbTripReduct:
      begin
        if TSwitchboard(Sender).Identifier = C_SWITCHBOARD_ID[0] then
          btnforwardNonEssent.Color := toWarna(Value)
        else if TSwitchboard(Sender).Identifier = C_SWITCHBOARD_ID[1] then
          btnAfterNonEssent.Color := toWarna(Value)
        else if TSwitchboard(Sender).Identifier = C_SWITCHBOARD_ID[2] then
          btnEmergencyNonEssent.Color := toWarna(Value)
      end;
    end;
  end;
end;

procedure TfrmPowerManagementSyst.EnginePropertyDouChange(Sender: TObject;
  PropsID: E_PropsID; Value: Double);
begin
//m
end;

procedure TfrmPowerManagementSyst.EnginePropertyIntChange(Sender: TObject;
  PropsID: E_PropsID; Value: Integer);
begin
//m
end;

{$REGION ' Alarm Condition Procedure '}

procedure TfrmPowerManagementSyst.NotStandbyMode(Sender: TObject);
begin
  SetMimic(mtPowerMan);
  generator := ERSystem.ERManager.EngineRoom.getPMSSystem.getGenerator((C_GENERATOR_ID[TRadioButton(Sender).Tag]));

  case TRadioButton(Sender).Tag of
    0:
    begin
      {Saat kondisi DG masih jalan tidak bisa di not standby}
      if rbManual01.Checked and (not generator.EngineRun) then
        SetValueBool(0, True, epPMSNotStandby)
      else
      begin
        rbStandby01.Checked := True;
        SetValueBool(0, False, epPMSNotStandby)
      end;

    end;
    1:
    begin
      if rbManual02.Checked and (not generator.EngineRun)then
        SetValueBool(1, True, epPMSNotStandby)
      else
      begin
        rbStandby02.Checked := True;
        SetValueBool(1, False, epPMSNotStandby)
      end;
    end;
    2:
    begin
      if rbManual03.Checked and (not generator.EngineRun)then
        SetValueBool(2, True, epPMSNotStandby)
      else
      begin
        rbStandby03.Checked := True;
        SetValueBool(2, False, epPMSNotStandby)
      end;
    end;
    3:
    begin
      if rbManual04.Checked and (not generator.EngineRun)then
        SetValueBool(3, True, epPMSNotStandby)
      else
      begin
        rbStandby04.Checked := True;
        SetValueBool(3, False, epPMSNotStandby)
      end;
    end;
    4:
    begin
      if rbManual05.Checked and (not generator.EngineRun)then
        SetValueBool(4, True, epPMSNotStandby)
      else
      begin
        rbStandby05.Checked := True;
        SetValueBool(4, False, epPMSNotStandby)
      end;
    end;
  end;
end;

procedure TfrmPowerManagementSyst.MeasVoltMode(Sender: TObject);
begin
  SetMimic(mtPowerMan);
  SetValueBool(TCheckBox(Sender).Tag, TCheckBox(Sender).Checked, epPMSMeasPowFailure)
  //  SetCheckBox(Sender, TCheckBox(Sender).Checked, epPMSMeasPowFailure);
end;

procedure TfrmPowerManagementSyst.AutomaticStartFailed(Sender: TObject);
begin
  SetMimic(mtPowerMan);
  SetValueBool(TCheckBox(Sender).Tag, TCheckBox(Sender).Checked, epPMSAutStartFailure);
//  SetCheckBox(Sender, TCheckBox(Sender).Checked, epPMSAutStartFailure)
end;

procedure TfrmPowerManagementSyst.SpeedSensorFailure(Sender: TObject);
begin
  SetMimic(mtPowerMan);
  SetValueBool(TCheckBox(Sender).Tag, TCheckBox(Sender).Checked, epPMSSpeedSensorFailureAlrm);
  //  SetCheckBox(Sender, TCheckBox(Sender).Checked, epPMSSpeedSensorFailureAlrm);
end;

procedure TfrmPowerManagementSyst.LubOilPressLow(Sender: TObject);
begin
  SetMimic(mtPowerMan);
  SetValueBool(TCheckBox(Sender).Tag, TCheckBox(Sender).Checked, epPMSLubOilPressLowAlrm);
  //  SetCheckBox(Sender, TCheckBox(Sender).Checked, epPMSLubOilPressLowAlrm)
end;

procedure TfrmPowerManagementSyst.LubOilTempHigh(Sender: TObject);
begin
  SetMimic(mtPowerMan);
  SetValueBool(TCheckBox(Sender).Tag, TCheckBox(Sender).Checked, epPMSLubOilTempHigh);
  //  SetCheckBox(Sender, TCheckBox(Sender).Checked, epPMSLubOilTempHigh)
end;

procedure TfrmPowerManagementSyst.CoolingWaterTempHigh(Sender: TObject);
begin
  SetMimic(mtPowerMan);
  SetValueBool(TCheckBox(Sender).Tag, TCheckBox(Sender).Checked, epPMSCoolWaterTempHighAlrm);
  //  SetCheckBox(Sender, TCheckBox(Sender).Checked, epPMSCoolWaterTempHighAlrm)
end;

procedure TfrmPowerManagementSyst.CoolingWaterLevelLow(Sender: TObject);
begin
  SetMimic(mtPowerMan);
  SetValueBool(TCheckBox(Sender).Tag, TCheckBox(Sender).Checked, epPMSCoolWaterLevelLow);
  //  SetCheckBox(Sender, TCheckBox(Sender).Checked, epPMSCoolWaterLevelLow)
end;

procedure TfrmPowerManagementSyst.FuelOilLeakage(Sender: TObject);
begin
  SetMimic(mtPowerMan);
  SetValueBool(TCheckBox(Sender).Tag, TCheckBox(Sender).Checked, epPMSFuelOilLeakage);
  //  SetCheckBox(Sender, TCheckBox(Sender).Checked, epPMSFuelOilLeakage)
end;

procedure TfrmPowerManagementSyst.CanBusMode(Sender: TObject);
var
  i : Integer;

begin
  SetMimic(mtPowerMan);

  for i := 0 to 3 do
    SetValueBool(i, TCheckBox(Sender).Checked, epPMSCanBusFailure);
end;

procedure TfrmPowerManagementSyst.DCPowMode(Sender: TObject);
begin
  SetMimic(mtPowerMan);
  SetValueBool(TCheckBox(Sender).Tag, TCheckBox(Sender).Checked, epPMSDCPowFailure);
end;

{$ENDREGION}

procedure TfrmPowerManagementSyst.AlarmOn1Click(Sender: TObject);
begin
  case isElementOrSwitchboard of
    0 :
    begin
      switchboard := ERSystem.ERManager.EngineRoom.getPMSSystem.getSwitchboard(SwitchBoardId);

      if TPopupMenu(Sender).Tag = 1 then
      begin
        SetBtnColor(SwitchBoardId, True);
        switchboard.TripReduct := True
      end
      else
      begin
        SetBtnColor(SwitchBoardId, False);
        switchboard.TripReduct := False;
      end;

    end;
    1:
    begin
      TSWEElement(CtrlSystem.Controller.getElement(elementID)).Parameters.GetParameter(epTDELAY).ParamDoubleValue := 0;

      if TPopupMenu(Sender).Tag = 1 then
      begin
        SetBtnColor(elementID, True);

        TSWEElement(CtrlSystem.Controller.getElement(elementID)).Mode := 0;
        TSWEElement(CtrlSystem.Controller.getElement(elementID)).NONC := 1;
        TSWEElement(CtrlSystem.Controller.getElement(elementID)).StateAlarmInhibited := siNotInhibited;
        TSWEElement(CtrlSystem.Controller.getElement(elementID)).StateElementDisabled := sdEnabled;
      end
      else
      begin
        SetBtnColor(elementID, False);

        TSWEElement(CtrlSystem.Controller.getElement(elementID)).StateElementDisabled := sdUnavailable;
      end;
    end;
  end;
end;

procedure TfrmPowerManagementSyst.btnResetClick(Sender: TObject);
begin

  if TButton(Sender).Tag < 4 then
    {untuk reset circuit breaker}
    SetValueBool(TButton(Sender).Tag, False, epPMSFailureCBClosed)
  else if TButton(Sender).Tag = 4 then
  begin
    SetValueBool(TButton(Sender).Tag, False, epPMSFailureCBClosed);
  end
  else
    {untuk reset Non Essential Trip/ Reduct}
    SetValueBool(TButton(Sender).Tag, False, epPMSMsbTripReduct);
end;

procedure TfrmPowerManagementSyst.SetMimic(PageMimic: E_MimicType);
begin
  SysMimics.Mimic.ShowMimic(PageMimic);
  SysMimics.Mimic.AddMimicHistory(Ord(PageMimic));
end;

procedure TfrmPowerManagementSyst.SetBtnColor(Id: string; valbool: Boolean);
begin
  {230V 115V Power Distribution}
  if Id = '3245E5004A'  then
    btn3245E5004A.Color := toWarna(valbool)
  else if Id = '3245E5001A'  then
    btn3245E5001A.Color := toWarna(valbool)
  else if Id = '3243E5005A' then
    btn3243E5005A.Color := toWarna(valbool)
  else if Id = '3245E5005A' then
    btn3245E5005A.Color := toWarna(valbool)

  {24V DC Power Distribution}
  else if Id = '3242E5001A' then
    btn3242E5001A.Color := toWarna(valbool)
  else if Id = '3120E5002A'  then
    btn3120E5002A.Color := toWarna(valbool)
  else if Id = '3120E5004A'  then
    btn3120E5004A.Color := toWarna(valbool)
  else if Id = '3242E5011A' then
    btn3242E5011A.Color := toWarna(valbool)
  else if Id = '3242E5021A' then
    btn3242E5021A.Color := toWarna(valbool)
  else if Id = '3242E5025A' then
    btn3242E5025A.Color := toWarna(valbool)
  else if Id = '3242E5024B' then
    btn3242E5024B.Color := toWarna(valbool)

  {Uninteruptible Power Supply}
  else if Id = '3133E5001A' then
    btn3133E5001A.Color := toWarna(valbool)
  else if Id = '3133E5011A' then
    btn3133E5011A.Color := toWarna(valbool)
  else if Id = '3133E5021A' then
    btn3133E5021A.Color := toWarna(valbool)

end;

procedure TfrmPowerManagementSyst.SetValueBool(IdGen: Integer; value: Boolean; modeAlarm: E_PropsID);
  var
  IdSwitchboard : Integer;
begin
  if modeAlarm = epPMSMsbTripReduct then
  begin
    case IdGen of
      5 : IdSwitchboard := 0;
      6 : IdSwitchboard := 1;
      7 : IdSwitchboard := 2;
    end;
    switchboard := ERSystem.ERManager.EngineRoom.getPMSSystem.getSwitchboard(C_SWITCHBOARD_ID[IdSwitchboard]);
  end
  else
  begin
    generator := ERSystem.ERManager.EngineRoom.getPMSSystem.getGenerator((C_GENERATOR_ID[IdGen]));
//    if (generator.ShutDown) and (modeAlarm = epPMSEngineAlarm) then
//      Exit;
  end;

  case modeAlarm of
    {Generator}
    epPMSNotStandby : generator.NotStandby := value;
    epPMSMeasPowFailure : generator.MeasPowFailure := value;
    epPMSAutStartFailure : generator.AutStartFailure := value;
    epPMSSpeedSensorFailureAlrm : generator.SpeedSensorFailureAlrm := value;
    epPMSLubOilPressLowAlrm : generator.LubOilPressLowAlrm := value;
    epPMSLubOilTempHigh : generator.LubOilTempHigh := value;
    epPMSCoolWaterTempHighAlrm : generator.CoolWaterTempHighAlrm := value;
    epPMSCoolWaterLevelLow : generator.CoolWaterLevelLow := value;
    epPMSFuelOilLeakage : generator.FuelOilLeakage := value;

    epPMSDCPowFailure : generator.DCPowFailure := value;
    epPMSCanBusFailure : generator.CanBusFailure := value;
    epPMSFailureCBClosed : generator.FailureCBClosed := value;

//    epPMSGeneratorCBClosed : generator.CbClosed := value;
//    epPMSEngineAlarm : generator.EngineAlarm := value;
//    epPMSShutdown : generator.ShutDown := value;

    {Switchboard}
    epPMSMsbTripReduct : switchboard.TripReduct := value;
  end;
end;

function TfrmPowerManagementSyst.toWarna(val: boolean): Integer;
begin
  if val then
    result := clRed
  else
    result := clMedGray;
end;

procedure TfrmPowerManagementSyst.OnPmsConditionMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  pnt : TPoint;
begin
  if Button = mbRight then
  begin
    if TButton(Sender).Tag = 1 then
    begin
      SetMimic(mtPowerMan);
      SwitchBoardId := TButton(Sender).Hint;
      isElementOrSwitchboard := 0;

    end
    else if TButton(Sender).Tag = 2 then
    begin
      SetMimic(mt230VPower);
      elementID := TButton(Sender).Hint;
      isElementOrSwitchboard := 1;
    end
    else if TButton(Sender).Tag = 3 then
    begin
      SetMimic(mt24VPower);
      elementID := TButton(Sender).Hint;
      isElementOrSwitchboard := 1;
    end
    else if TButton(Sender).Tag = 4 then
    begin
      SetMimic(mtUPSPower);
      elementID := TButton(Sender).Hint;
      isElementOrSwitchboard := 1;
    end;

    if GetCursorPos(pnt) then
      pm1.Popup(pnt.X, pnt.y);
  end;
end;

end.
