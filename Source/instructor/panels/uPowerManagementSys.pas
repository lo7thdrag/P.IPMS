unit uPowerManagementSys;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uGenerator, uSwitchboard, Menus, uSwitchElement,
  Buttons, VrControls, VrButtons, uDataType;

type
  TfrmPowerManagementSyst = class(TForm)
    pm1: TPopupMenu;
    AlarmOn1: TMenuItem;
    AlarmOff1: TMenuItem;
    GroupBox1: TGroupBox;
    grpDCU01: TGroupBox;
    grpDCU02: TGroupBox;
    grpDCU03: TGroupBox;
    grpDCU04: TGroupBox;
    grpDCUEG: TGroupBox;
    tmrDCU01: TTimer;
    rbStandby01: TRadioButton;
    rbManual01: TRadioButton;
    Label1: TLabel;
    chkSupplyVoltageLow01: TCheckBox;
    chkAutomaticStartFailed01: TCheckBox;
    chkSpeedSensorFailure01: TCheckBox;
    chkLubOilPressLow01: TCheckBox;
    chkLubOilTempHigh01: TCheckBox;
    chkCoolingWaterTempHigh01: TCheckBox;
    chkCoolingWaterLevelLow01: TCheckBox;
    chkFuelOilLeakage01: TCheckBox;
    chkFUWASeparator01: TCheckBox;
    Label5: TLabel;
    lblLampOS01: TLabel;
    lbl30: TLabel;
    lblLampLOPL01: TLabel;
    lbl17: TLabel;
    lblLampES01: TLabel;
    lbl20: TLabel;
    lblLampCWTH01: TLabel;
    lbl19: TLabel;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    CheckBox2: TCheckBox;
    chkCanBusFailure01: TCheckBox;
    rbStandby02: TRadioButton;
    rbManual02: TRadioButton;
    Label9: TLabel;
    chkSupplyVoltageLow02: TCheckBox;
    chkAutomaticStartFailed02: TCheckBox;
    chkSpeedSensorFailure02: TCheckBox;
    chkLubOilPressLow02: TCheckBox;
    chkLubOilTempHigh02: TCheckBox;
    chkCoolingWaterTempHigh02: TCheckBox;
    chkCoolingWaterLevelLow02: TCheckBox;
    chkFuelOilLeakage02: TCheckBox;
    chkFUWASeparator02: TCheckBox;
    lblLampOS02: TLabel;
    Label3: TLabel;
    lblLampLOPL02: TLabel;
    Label6: TLabel;
    lblLampES02: TLabel;
    Label8: TLabel;
    lblLampCWTH02: TLabel;
    Label7: TLabel;
    GroupBox3: TGroupBox;
    Label10: TLabel;
    CheckBox4: TCheckBox;
    chkCanBusFailure02: TCheckBox;
    Label11: TLabel;
    Label12: TLabel;
    Label4: TLabel;
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
    lblLampOS03: TLabel;
    Label14: TLabel;
    lblLampLOPL03: TLabel;
    Label17: TLabel;
    lblLampES03: TLabel;
    Label19: TLabel;
    lblLampCWTH03: TLabel;
    Label18: TLabel;
    GroupBox4: TGroupBox;
    Label13: TLabel;
    CheckBox6: TCheckBox;
    chkCanBusFailure03: TCheckBox;
    Label15: TLabel;
    Label16: TLabel;
    Label20: TLabel;
    rbStandby04: TRadioButton;
    rbManual04: TRadioButton;
    Label21: TLabel;
    Label22: TLabel;
    chkSupplyVoltageLow04: TCheckBox;
    chkAutomaticStartFailed04: TCheckBox;
    chkSpeedSensorFailure04: TCheckBox;
    chkLubOilPressLow04: TCheckBox;
    chkLubOilTempHigh04: TCheckBox;
    chkCoolingWaterTempHigh04: TCheckBox;
    chkCoolingWaterLevelLow04: TCheckBox;
    chkFuelOilLeakage04: TCheckBox;
    chkFUWASeparator04: TCheckBox;
    Label23: TLabel;
    lblLampOS04: TLabel;
    Label25: TLabel;
    lblLampLOPL04: TLabel;
    Label28: TLabel;
    lblLampES04: TLabel;
    Label30: TLabel;
    lblLampCWTH04: TLabel;
    Label29: TLabel;
    GroupBox5: TGroupBox;
    Label24: TLabel;
    CheckBox8: TCheckBox;
    chkCanBusFailure04: TCheckBox;
    rbManual05: TRadioButton;
    rbStandby05: TRadioButton;
    chkSupplyVoltageLow05: TCheckBox;
    chkAutomaticStartFailed05: TCheckBox;
    chkSpeedSensorFailure05: TCheckBox;
    chkLubOilPressLow05: TCheckBox;
    chkLubOilTempHigh05: TCheckBox;
    chkCoolingWaterTempHigh05: TCheckBox;
    chkCoolingWaterLevelLow05: TCheckBox;
    chkFuelOilLeakage05: TCheckBox;
    chkFUWASeparator05: TCheckBox;
    Label26: TLabel;
    Label27: TLabel;
    Label31: TLabel;
    lblLampOS05: TLabel;
    Label36: TLabel;
    lblLampLOPL05: TLabel;
    Label39: TLabel;
    lblLampCWTH05: TLabel;
    Label40: TLabel;
    CheckBox11: TCheckBox;
    CheckBox10: TCheckBox;
    Label32: TLabel;
    Label41: TLabel;
    btn3245E5004A: TVrDemoButton;
    btn3245E5001A: TVrDemoButton;
    btn3243E5005A: TVrDemoButton;
    btn3245E5005A: TVrDemoButton;
    Label34: TLabel;
    Label42: TLabel;
    btn3242E5001A: TVrDemoButton;
    btn3120E5002A: TVrDemoButton;
    btn3120E5004A: TVrDemoButton;
    btn3242E5011A: TVrDemoButton;
    btn3242E5021A: TVrDemoButton;
    btn3242E5025A: TVrDemoButton;
    btn3242E5024B: TVrDemoButton;
    Label37: TLabel;
    Label35: TLabel;
    btn3133E5001A: TVrDemoButton;
    btn3133E5011A: TVrDemoButton;
    btn3133E5021A: TVrDemoButton;
    btnCbReset03: TVrDemoButton;
    btnCbReset04: TVrDemoButton;
    btnCbReset01: TVrDemoButton;
    btnCbReset02: TVrDemoButton;
    Label33: TLabel;
    Label38: TLabel;
    btnAfterNonEssent: TVrDemoButton;
    btnEmergencyNonEssent: TVrDemoButton;
    btnforwardNonEssent: TVrDemoButton;
    btnCbReset05: TVrDemoButton;
    Label44: TLabel;
    Label43: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;

    procedure FormCreate(Sender: TObject);
//    procedure BtnAlarmOn1Click(Sender: TObject);
    procedure AlarmOn1Click(Sender: TObject);

    procedure NotStandbyMode(Sender: TObject);
    procedure MeasVoltMode(Sender: TObject);
    procedure DCPowMode(Sender: TObject);
    procedure CanBusMode(Sender: TObject);
    procedure EngineAlarmMode(Sender: TObject);
    procedure ShutdownMode(Sender: TObject);

    procedure tmrDCU01Timer(Sender: TObject);
    procedure CekShutdownDCU(IdDcu : Integer);
    procedure btnResetClick(Sender: TObject);
    procedure OnPmsConditionMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    SwitchBoardId : string;
    elementID : string;
    isElementOrSwitchboard : Byte;
    CWTFailure01, CWTFailure02, CWTFailure03, CWTFailure04, CWTFailure05 : Integer;

    procedure EnginePropertyBoolChange(Sender : TObject; PropsID : E_PropsID;Value : Boolean);overload;

    procedure SetBtnColor(Id : string; valbool: Boolean);
    procedure SetLblColor(Id : string; valbool: Boolean);
    procedure SetCheckBox(Sender: TObject; value : Boolean; modeAlarm : E_PropsID);
    procedure SetValueBool(IdGen : Integer; value : Boolean; modeAlarm : E_PropsID);
    procedure SetMimic(PageMimic : E_MimicType);

    function toWarna(val : boolean): Integer;
    function toWarnaLbl(val : boolean): Integer;

    function SetEngineAlarmCheck(IdGen : Integer) : Boolean;
    function SetShutdownAlarmCheck(IdGen : Integer) : Boolean;


  public
    { Public declarations }
    Msb : array [0..2] of TSwitchboard;
  end;

var
  frmPowerManagementSyst: TfrmPowerManagementSyst;
  generator : TGenerator;
  switchboard : TSwitchboard;

implementation
uses uMimicsSystem, uERSystem, uSWEInput, uSWE, uControllerSystem;
{$R *.dfm}

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

procedure TfrmPowerManagementSyst.OnPmsConditionMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
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
procedure TfrmPowerManagementSyst.CanBusMode(Sender: TObject);
begin
  SetMimic(mtPowerMan);
  if TCheckBox(Sender).Checked then
    SetCheckBox(Sender, True, epPMSCanBusFailure)
  else
    SetCheckBox(Sender, False, epPMSCanBusFailure);
end;

procedure TfrmPowerManagementSyst.DCPowMode(Sender: TObject);
begin
  SetMimic(mtPowerMan);
  if TCheckBox(Sender).Checked then
    SetCheckBox(Sender, True, epPMSDCPowFailure)
  else
    SetCheckBox(Sender, False, epPMSDCPowFailure);
end;

procedure TfrmPowerManagementSyst.EngineAlarmMode(Sender: TObject);
begin
  SetMimic(mtPowerMan);
  if TCheckBox(Sender).Checked then
    SetCheckBox(Sender, True, epPMSEngineAlarm)
  else
    SetCheckBox(Sender, False, epPMSEngineAlarm);
end;

procedure TfrmPowerManagementSyst.EnginePropertyBoolChange(Sender: TObject;
  PropsID: E_PropsID; Value: Boolean);
begin
  if Sender is TGenerator then
  begin
    case PropsID of
      epPMSGeneratorEmergencyStop:
      begin
        if TGenerator(Sender).Identifier = C_GENERATOR_ID[0] then
          lblLampES01.Color := toWarnaLbl(Value)
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[1] then
          lblLampES02.Color := toWarnaLbl(Value)
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[2] then
          lblLampES03.Color := toWarnaLbl(Value)
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[3] then
          lblLampES04.Color := toWarnaLbl(Value)
      end;
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

procedure TfrmPowerManagementSyst.FormCreate(Sender: TObject);
begin
  ERSystem.ERManager.EngineRoom.getPMSSystem.addEntityListener('PMS Condition',EnginePropertyBoolChange);
end;

procedure TfrmPowerManagementSyst.MeasVoltMode(Sender: TObject);
begin
  SetMimic(mtPowerMan);
  if TCheckBox(Sender).Checked then
    SetCheckBox(Sender, True, epPMSMeasPowFailure)
  else
    SetCheckBox(Sender, False, epPMSMeasPowFailure);
end;

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

function TfrmPowerManagementSyst.SetEngineAlarmCheck(IdGen: Integer): Boolean;
begin
  Result := False;
  case IdGen of
    0:
    begin
      if (chkSpeedSensorFailure01.Checked) or (chkLubOilPressLow01.Checked) or (chkLubOilTempHigh01.Checked) or
         (chkCoolingWaterTempHigh01.Checked) or (chkCoolingWaterLevelLow01.Checked) or (chkFuelOilLeakage01.Checked) or
         (chkFUWASeparator01.Checked) or (chkAutomaticStartFailed01.Checked)then
        Result := True
      else if (not chkSpeedSensorFailure01.Checked) and (not chkLubOilPressLow01.Checked) and (not chkLubOilTempHigh01.Checked) and
         (not chkCoolingWaterTempHigh01.Checked) and (not chkCoolingWaterLevelLow01.Checked) and (not chkFuelOilLeakage01.Checked) and
         (not chkFUWASeparator01.Checked) and (not chkAutomaticStartFailed01.Checked) then
        Result := False
    end;
    1:
    begin
      if (chkSpeedSensorFailure02.Checked) or (chkLubOilPressLow02.Checked) or (chkLubOilTempHigh02.Checked) or
         (chkCoolingWaterTempHigh02.Checked) or (chkCoolingWaterLevelLow02.Checked) or (chkFuelOilLeakage02.Checked) or
         (chkFUWASeparator02.Checked) or (chkAutomaticStartFailed02.Checked)then
        Result := True
      else if (not chkSpeedSensorFailure02.Checked) and (not chkLubOilPressLow02.Checked) and (not chkLubOilTempHigh02.Checked) and
         (not chkCoolingWaterTempHigh02.Checked) and (not chkCoolingWaterLevelLow02.Checked) and (not chkFuelOilLeakage02.Checked) and
         (not chkFUWASeparator02.Checked) and (not chkAutomaticStartFailed02.Checked)then
        Result := False
    end;
    2:
    begin
      if (chkSpeedSensorFailure03.Checked) or (chkLubOilPressLow03.Checked) or (chkLubOilTempHigh03.Checked) or
         (chkCoolingWaterTempHigh03.Checked) or (chkCoolingWaterLevelLow03.Checked) or (chkFuelOilLeakage03.Checked) or
         (chkFUWASeparator03.Checked) or (chkAutomaticStartFailed03.Checked)then
        Result := True
      else if (not chkSpeedSensorFailure03.Checked) and (not chkLubOilPressLow03.Checked) and (not chkLubOilTempHigh03.Checked) and
         (not chkCoolingWaterTempHigh03.Checked) and (not chkCoolingWaterLevelLow03.Checked) and (not chkFuelOilLeakage03.Checked) and
         (not chkFUWASeparator03.Checked) and (not chkAutomaticStartFailed03.Checked)then
        Result := False
    end;
    3:
    begin
      if (chkSpeedSensorFailure04.Checked) or (chkLubOilPressLow04.Checked) or (chkLubOilTempHigh04.Checked) or
         (chkCoolingWaterTempHigh04.Checked) or (chkCoolingWaterLevelLow04.Checked) or (chkFuelOilLeakage04.Checked) or
         (chkFUWASeparator04.Checked) or (chkAutomaticStartFailed04.Checked)then
        Result := True
      else if (not chkSpeedSensorFailure04.Checked) and (not chkLubOilPressLow04.Checked) and (not chkLubOilTempHigh04.Checked) and
         (not chkCoolingWaterTempHigh04.Checked) and (not chkCoolingWaterLevelLow04.Checked) and (not chkFuelOilLeakage04.Checked) and
         (not chkFUWASeparator04.Checked) and (not chkAutomaticStartFailed04.Checked)then
        Result := False
    end;
    4:
    begin
      if (chkSpeedSensorFailure05.Checked) or (chkLubOilPressLow05.Checked) or (chkLubOilTempHigh05.Checked) or
         (chkCoolingWaterTempHigh05.Checked) or (chkCoolingWaterLevelLow05.Checked) or (chkFuelOilLeakage05.Checked) or
         (chkFUWASeparator05.Checked) or (chkAutomaticStartFailed05.Checked)then
        Result := True
      else if (not chkSpeedSensorFailure05.Checked) and (not chkLubOilPressLow05.Checked) and (not chkLubOilTempHigh05.Checked) and
         (not chkCoolingWaterTempHigh05.Checked) and (not chkCoolingWaterLevelLow05.Checked) and (not chkFuelOilLeakage05.Checked) and
         (not chkFUWASeparator05.Checked) and (not chkAutomaticStartFailed05.Checked)then
        Result := False
    end;
  end;
end;

procedure TfrmPowerManagementSyst.SetLblColor(Id: string; valbool: Boolean);
begin
  {Label Over Speed}
  if Id = 'chkSpeedSensorFailure01' then
    lblLampOS01.Color := toWarnaLbl (valbool)
  else if Id = 'chkSpeedSensorFailure02' then
    lblLampOS02.Color := toWarnaLbl (valbool)
  else if Id = 'chkSpeedSensorFailure03' then
    lblLampOS03.Color := toWarnaLbl (valbool)
  else if Id = 'chkSpeedSensorFailure04' then
    lblLampOS04.Color := toWarnaLbl (valbool)
  else if Id = 'chkSpeedSensorFailure05' then
    lblLampOS05.Color := toWarnaLbl (valbool)

  {Label Lub Oil Press Low}
  else if Id = 'chkLubOilPressLow01' then
    lblLampLOPL01.Color := toWarnaLbl (valbool)
  else if Id = 'chkLubOilPressLow02' then
    lblLampLOPL02.Color := toWarnaLbl (valbool)
  else if Id = 'chkLubOilPressLow03' then
    lblLampLOPL03.Color := toWarnaLbl (valbool)
  else if Id = 'chkLubOilPressLow04' then
    lblLampLOPL04.Color := toWarnaLbl (valbool)
  else if Id = 'chkLubOilPressLow05' then
    lblLampLOPL05.Color := toWarnaLbl (valbool)

  {Label Cooling Water Temp High}
  else if Id = 'chkCoolingWaterTempHigh01' then
    lblLampCWTH01.Color := toWarnaLbl (valbool)
  else if Id = 'chkCoolingWaterTempHigh02' then
    lblLampCWTH02.Color := toWarnaLbl (valbool)
  else if Id = 'chkCoolingWaterTempHigh03' then
    lblLampCWTH03.Color := toWarnaLbl (valbool)
  else if Id = 'chkCoolingWaterTempHigh04' then
    lblLampCWTH04.Color := toWarnaLbl (valbool)
  else if Id = 'chkCoolingWaterTempHigh05' then
    lblLampCWTH05.Color := toWarnaLbl (valbool)
end;

procedure TfrmPowerManagementSyst.SetMimic(PageMimic: E_MimicType);
begin
  SysMimics.Mimic.ShowMimic(PageMimic);
  SysMimics.Mimic.AddMimicHistory(Ord(PageMimic));
end;

function TfrmPowerManagementSyst.SetShutdownAlarmCheck(IdGen: Integer): Boolean;
begin
  Result := False;
  case IdGen of
    0:
    begin
      if (chkSpeedSensorFailure01.Checked) or (chkLubOilPressLow01.Checked) or (lblLampES01.Color = clRed) or
         (chkCoolingWaterTempHigh01.Checked) then
        Result := True
      else if (not chkSpeedSensorFailure01.Checked) and ( not chkLubOilPressLow01.Checked) and (lblLampES01.Color <> clRed) and
        (not chkCoolingWaterTempHigh01.Checked) then
        Result := False
    end;
    1:
    begin
      if (chkSpeedSensorFailure02.Checked) or (chkLubOilPressLow02.Checked) or (lblLampES02.Color = clRed) or
         (chkCoolingWaterTempHigh02.Checked) then
        Result := True
      else if (not chkSpeedSensorFailure02.Checked) and ( not chkLubOilPressLow02.Checked) and (lblLampES02.Color <> clRed) and
        (not chkCoolingWaterTempHigh02.Checked) then
        Result := False
    end;
    2:
    begin
      if (chkSpeedSensorFailure03.Checked) or (chkLubOilPressLow03.Checked) or (lblLampES03.Color = clRed) or
         (chkCoolingWaterTempHigh03.Checked) then
        Result := True
      else if (not chkSpeedSensorFailure03.Checked) and ( not chkLubOilPressLow03.Checked) and (lblLampES03.Color <> clRed) and
        (not chkCoolingWaterTempHigh03.Checked) then
        Result := False
    end;
    3:
    begin
      if (chkSpeedSensorFailure04.Checked) or (chkLubOilPressLow04.Checked) or (lblLampES04.Color = clRed) or
         (chkCoolingWaterTempHigh04.Checked) then
        Result := True
      else if (not chkSpeedSensorFailure04.Checked) and ( not chkLubOilPressLow04.Checked) and (lblLampES04.Color <> clRed) and
        (not chkCoolingWaterTempHigh04.Checked) then
        Result := False
    end;
    4:
    begin
      if (chkSpeedSensorFailure05.Checked) or (chkLubOilPressLow05.Checked) or
         (chkCoolingWaterTempHigh05.Checked)then
        Result := True
      else if (not chkSpeedSensorFailure05.Checked) and ( not chkLubOilPressLow05.Checked) and
        (not chkCoolingWaterTempHigh05.Checked) then
        Result := False
    end;
  end;
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

procedure TfrmPowerManagementSyst.SetCheckBox(Sender: TObject; value : Boolean; modeAlarm : E_PropsID);
var
  i : Integer;
begin
  if value then
    TCheckBox(Sender).Font.Color := clRed
  else
    TCheckBox(Sender).Font.Color := clBlack;

  case modeAlarm of
    epPMSNotStandby : SetValueBool(TCheckBox(Sender).Tag, value, epPMSNotStandby);
    epPMSMeasPowFailure : SetValueBool(TCheckBox(Sender).Tag, value, epPMSMeasPowFailure);
    epPMSDCPowFailure : SetValueBool(TCheckBox(Sender).Tag, value, epPMSDCPowFailure);
    epPMSCanBusFailure :
    begin
      if value then
      begin
        chkCanBusFailure01.Font.Color := clRed;
        chkCanBusFailure02.Font.Color := clRed;
        chkCanBusFailure03.Font.Color := clRed;
        chkCanBusFailure04.Font.Color := clRed;
      end
      else
      begin
        chkCanBusFailure01.Font.Color := clBlack;
        chkCanBusFailure02.Font.Color := clBlack;
        chkCanBusFailure03.Font.Color := clBlack;
        chkCanBusFailure04.Font.Color := clBlack;
      end;

      chkCanBusFailure01.Checked := value;
      chkCanBusFailure02.Checked := value;
      chkCanBusFailure03.Checked := value;
      chkCanBusFailure04.Checked := value;

      for i := 0 to 3 do
        SetValueBool(i, value, epPMSCanBusFailure);

    end;
    epPMSEngineAlarm :
    begin
      if SetEngineAlarmCheck(TCheckBox(Sender).Tag) then
        SetValueBool(TCheckBox(Sender).Tag, True, epPMSEngineAlarm)
      else
        SetValueBool(TCheckBox(Sender).Tag, False, epPMSEngineAlarm)

    end;
    epPMSShutdown :
    begin
      if SetShutdownAlarmCheck(TCheckBox(Sender).Tag) then
        SetValueBool(TCheckBox(Sender).Tag, True, epPMSShutdown)
      else
        SetValueBool(TCheckBox(Sender).Tag, False, epPMSShutdown)
    end;
  end;

end;

procedure TfrmPowerManagementSyst.SetValueBool(IdGen: Integer; value: Boolean;
  modeAlarm: E_PropsID);
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
    if (generator.ShutDown) and (modeAlarm = epPMSEngineAlarm) then
      Exit;
  end;

  case modeAlarm of
    {Generator}
    epPMSNotStandby : generator.NotStandby := value;
    epPMSMeasPowFailure : generator.MeasPowFailure := value;
    epPMSDCPowFailure : generator.DCPowFailure := value;
    epPMSCanBusFailure : generator.CanBusFailure := value;
    epPMSEngineAlarm : generator.EngineAlarm := value;
    epPMSShutdown : generator.ShutDown := value;
    epPMSFailureCBClosed : generator.FailureCBClosed := value;
//    epPMSGeneratorCBClosed : generator.CbClosed := value;

    {Switchboard}
    epPMSMsbTripReduct : switchboard.TripReduct := value;
  end;
end;

procedure TfrmPowerManagementSyst.ShutdownMode(Sender: TObject);
begin
  SysMimics.Mimic.ShowMimic(mtPowerMan);
  SysMimics.Mimic.AddMimicHistory(Ord(mtPowerMan));

  if TCheckBox(Sender).Checked then
    SetCheckBox(Sender, True, epPMSShutdown)
  else
    SetCheckBox(Sender, False, epPMSShutdown);

  {Set warna label}
  SetLblColor(TCheckBox(Sender).Name, TCheckBox(Sender).Checked);
end;

procedure TfrmPowerManagementSyst.tmrDCU01Timer(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to 4 do
    CekShutdownDCU(i)
end;

procedure TfrmPowerManagementSyst.CekShutdownDCU(IdDcu: Integer);
begin
  case IdDcu of
    0:
    begin
      {Cooling Water Temp}
      if chkCoolingWaterTempHigh01.Checked then
      begin
        CWTFailure01 := CWTFailure01 + 1;

        if CWTFailure01 > 10 then
        begin
          SetLblColor('chkCoolingWaterTempHigh01', True);
          SetValueBool(0, True, epPMSShutdown);
        end;
      end
      else
      begin
        CWTFailure01 := 0;
        SetLblColor('chkCoolingWaterTempHigh01', False);

        if (lblLampOS01.Color <> clRed) and (lblLampLOPL01.Color <> clRed) and (lblLampES01.Color <> clRed) then
          SetValueBool(0, False, epPMSShutdown);
      end;

      {Emergency Stop}
      if lblLampES01.Color = clRed then
        SetValueBool(0, True, epPMSShutdown)
      else
      begin
        if (lblLampOS01.Color <> clRed) and (lblLampLOPL01.Color <> clRed) and (lblLampCWTH01.Color <> clRed) then
          SetValueBool(0, False, epPMSShutdown);
      end;
    end;
    1:
    begin
      {Cooling Water Temp}
      if chkCoolingWaterTempHigh02.Checked then
      begin
        CWTFailure02 := CWTFailure02 + 1;

        if CWTFailure02 > 10 then
        begin
          SetLblColor('chkCoolingWaterTempHigh02', True);
          SetValueBool(1, True, epPMSShutdown);
        end;
      end
      else
      begin
        CWTFailure02 := 0;
        SetLblColor('chkCoolingWaterTempHigh02', False);

        if (lblLampOS02.Color <> clRed) and (lblLampLOPL02.Color <> clRed) and (lblLampES02.Color <> clRed) then
          SetValueBool(1, False, epPMSShutdown);
      end;

      {Emergency Stop}
      if lblLampES02.Color = clRed then
        SetValueBool(1, True, epPMSShutdown)
      else
      begin
        if (lblLampOS02.Color <> clRed) and (lblLampLOPL02.Color <> clRed) and (lblLampCWTH02.Color <> clRed) then
          SetValueBool(1, False, epPMSShutdown);
      end;
    end;
    2:
    begin
      {Cooling Water Temp}
      if chkCoolingWaterTempHigh03.Checked then
      begin
        CWTFailure03 := CWTFailure03 + 1;

        if CWTFailure03 > 10 then
        begin
          SetLblColor('chkCoolingWaterTempHigh03', True);
          SetValueBool(2, True, epPMSShutdown);
        end;
      end
      else
      begin
        CWTFailure03 := 0;
        SetLblColor('chkCoolingWaterTempHigh03', False);

        if (lblLampOS03.Color <> clRed) and (lblLampLOPL03.Color <> clRed) and (lblLampES03.Color <> clRed) then
          SetValueBool(2, False, epPMSShutdown);
      end;

      {Emergency Stop}
      if lblLampES03.Color = clRed then
        SetValueBool(2, True, epPMSShutdown)
      else
      begin
        if (lblLampOS03.Color <> clRed) and (lblLampLOPL03.Color <> clRed) and (lblLampCWTH03.Color <> clRed) then
          SetValueBool(2, False, epPMSShutdown);
      end;
    end;
    3:
    begin
      {Cooling Water Temp}
      if chkCoolingWaterTempHigh04.Checked then
      begin
        CWTFailure04 := CWTFailure04 + 1;

        if CWTFailure04 > 10 then
        begin
          SetLblColor('chkCoolingWaterTempHigh04', True);
          SetValueBool(3, True, epPMSShutdown);
        end;
      end
      else
      begin
        CWTFailure04 := 0;
        SetLblColor('chkCoolingWaterTempHigh04', False);

        if (lblLampOS04.Color <> clRed) and (lblLampLOPL04.Color <> clRed) and (lblLampES04.Color <> clRed) then
          SetValueBool(3, False, epPMSShutdown);
      end;

      {Emergency Stop}
      if lblLampES04.Color = clRed then
        SetValueBool(3, True, epPMSShutdown)
      else
      begin
        if (lblLampOS04.Color <> clRed) and (lblLampLOPL04.Color <> clRed) and (lblLampCWTH04.Color <> clRed) then
          SetValueBool(3, False, epPMSShutdown);
      end;
    end;
    4:
    begin
      {Cooling Water Temp}
      if chkCoolingWaterTempHigh05.Checked then
      begin
        CWTFailure05 := CWTFailure05 + 1;

        if CWTFailure05 > 10 then
        begin
          SetLblColor('chkCoolingWaterTempHigh05', True);
          SetValueBool(4, True, epPMSShutdown);
        end;
      end
      else
      begin
        CWTFailure05 := 0;
        SetLblColor('chkCoolingWaterTempHigh05', False);

        if (lblLampOS05.Color <> clRed) and (lblLampLOPL05.Color <> clRed) then
          SetValueBool(4, False, epPMSShutdown);
      end;
    end;
  end;
end;

function TfrmPowerManagementSyst.toWarna(val: boolean): Integer;
begin
  if val then
    result := clRed
  else
    result := clBtnFace;
end;

function TfrmPowerManagementSyst.toWarnaLbl(val: boolean): Integer;
begin
  if val then
    result := clRed
  else
    result := clBlack;
end;

end.
