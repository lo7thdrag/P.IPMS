unit uMCETestForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uElementTestForm, uDataType;

type
  TfrmMCETest = class(TfrmElementTest)
    grpInput: TGroupBox;
    cbbStateSwitchRemote: TComboBox;
    lbl1: TLabel;
    lbl2: TLabel;
    cbbStateSwitchRunning: TComboBox;
    cbbStateSwitchNoFault: TComboBox;
    lbl3: TLabel;
    grpPlatformInterface: TGroupBox;
    grpOutput: TGroupBox;
    grpIPMSInterface: TGroupBox;
    lbl4: TLabel;
    grpInput2: TGroupBox;
    cbbCommandStartApp: TComboBox;
    lbl5: TLabel;
    cbbCommandStopApp: TComboBox;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    cbbCommandStartHMI: TComboBox;
    cbbCommandStopHMI: TComboBox;
    cbbStateManualAuto: TComboBox;
    cbbStateElementDisabled: TComboBox;
    cbbStateBlockOut: TComboBox;
    cbbStateRestart: TComboBox;
    cbbStateValueValid: TComboBox;
    cbbRunCondition: TComboBox;
    cbbRFU: TComboBox;
    grpOutput2: TGroupBox;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl18: TLabel;
    edtStateAlarm: TEdit;
    edtStateCommand: TEdit;
    edtStateControl: TEdit;
    edtStateElement: TEdit;
    lbl25: TLabel;
    edtTtrans: TEdit;
    lbl26: TLabel;
    edtTctrl: TEdit;
    procedure cbbStateSwitchRemoteSelect(Sender: TObject);
    procedure cbbStateSwitchRunningSelect(Sender: TObject);
    procedure cbbStateSwitchNoFault1Select(Sender: TObject);
    procedure cbbCommandStartAppSelect(Sender: TObject);
    procedure cbbCommandStopAppSelect(Sender: TObject);
    procedure cbbCommandStartHMISelect(Sender: TObject);
    procedure cbbCommandStopHMISelect(Sender: TObject);
    procedure cbbStateManualAutoSelect(Sender: TObject);
    procedure cbbStateElementDisabledSelect(Sender: TObject);
    procedure cbbStateBlockOutSelect(Sender: TObject);
    procedure cbbStateRestartSelect(Sender: TObject);
    procedure cbbStateValueValidSelect(Sender: TObject);
    procedure cbbRunConditionSelect(Sender: TObject);
    procedure cbbRFUSelect(Sender: TObject);
    procedure edtTtransKeyPress(Sender: TObject; var Key: Char);
    { Private declarations }
  protected
    procedure ApplyElement;override;
    procedure ElementPropertyChange(Sender : TObject;PropsID : E_PropsID;Value : Byte);overload;override;
  public
    { Public declarations }
  end;

var
  frmMCETest: TfrmMCETest;

implementation

uses uMCE, uFunction, uListener;

{$R *.dfm}

procedure TfrmMCETest.ApplyElement;
begin
  inherited;

  if FElement is TMCEElement then
  begin

    with TMCEElement(FElement) do
    begin

    {input}
      case StateSwitchRemote of
        esLocal  : cbbStateSwitchRemote.ItemIndex := 0;
        esRemote : cbbStateSwitchRemote.ItemIndex := 1;
        else
        begin
          cbbStateSwitchRemote.ItemIndex := 0;
//          StateSwitchRemote := esLocal;
        end;
      end;

      case StateSwitchRunning of
        esNotRunning : cbbStateSwitchRunning.ItemIndex := 0;
        esRunning    : cbbStateSwitchRunning.ItemIndex := 1;
        else
        begin
          cbbStateSwitchRunning.ItemIndex := 0;
//          StateSwitchRunning := esNotRunning;
        end;
      end;

      case StateSwitchNoFault of
        esNoFault   : cbbStateSwitchNoFault.ItemIndex := 0;
        esFault : cbbStateSwitchNoFault.ItemIndex := 1;
        else
        begin
          cbbStateSwitchNoFault.ItemIndex := 0;
//          StateSwitchNoFault := esNoFault;
        end;
      end;

      case CommandStartApp of
        sacActivated    : cbbCommandStartApp.ItemIndex := 0;
        sacNotActivated : cbbCommandStartApp.ItemIndex := 1;
      end;

      case CommandStopApp of
        sacActivated    : cbbCommandStopApp.ItemIndex := 0;
        sacNotActivated : cbbCommandStopApp.ItemIndex := 1;
      end;

      case CommandStartHMI of
        sacActivated    : cbbCommandStartHMI.ItemIndex := 0;
        sacNotActivated : cbbCommandStartHMI.ItemIndex := 1;
      end;

      case CommandStopHMI of
        sacActivated    : cbbCommandStopHMI.ItemIndex := 0;
        sacNotActivated : cbbCommandStopHMI.ItemIndex := 1;
      end;

      case StateManualAuto of
        smaManual : cbbStateManualAuto.ItemIndex := 0;
        smaAuto   : cbbStateManualAuto.ItemIndex := 1;
      end;

      case StateElementDisabled of
        sdDisabled : cbbStateElementDisabled.ItemIndex := 0;
        sdEnabled  : cbbStateElementDisabled.ItemIndex := 1;
      end;

      case StateBlockOut of
        sacActivated    : cbbStateBlockOut.ItemIndex := 0;
        sacNotActivated : cbbStateBlockOut.ItemIndex := 1;
      end;

      case StateRestart of
        sacActivated    : cbbStateRestart.ItemIndex := 0;
        sacNotActivated : cbbStateRestart.ItemIndex := 1;
      end;

      case StateValueValid of
        svValid   : cbbStateValueValid.ItemIndex := 0;
        svInvalid : cbbStateValueValid.ItemIndex := 1;
      end;

      case RunCondition of
        srcOk    : cbbRunCondition.ItemIndex := 0;
        srcNotOk : cbbRunCondition.ItemIndex := 1;
      end;

      case StateRFU of
        snrRFU    : cbbRFU.ItemIndex := 0;
        snrNotRFU : cbbRFU.ItemIndex := 1;
      end;

    {parameter}
      edtTtrans.Text := FloatToStr(Parameters.GetParameter(epTTRANS).ParamDoubleValue);
      edtTctrl.Text := FloatToStr(Parameters.GetParameter(epTCTRL).ParamDoubleValue);

    {output}
      edtStateAlarm.Text   := ElementAlarmStateToStr(StateAlarm);
      edtStateCommand.Text := ElementStateCommandToStr(StateCommand);
      edtStateControl.Text := ElementStateControlPositionToStr(StateControlPosition);
      edtStateElement.Text := ElementStateToStr(StateElement);
    end;
  end;
end;

procedure TfrmMCETest.cbbCommandStartAppSelect(Sender: TObject);
begin
  inherited;
  if cbbCommandStartApp.Text = 'Not activated' then
    TMCEElement(FElement).CommandStartApp := sacNotActivated
  else if cbbCommandStartApp.Text = 'Activated' then
    TMCEElement(FElement).CommandStartApp := sacActivated;
end;

procedure TfrmMCETest.cbbCommandStartHMISelect(Sender: TObject);
begin
  inherited;
  if cbbCommandStartHMI.Text = 'Not activated' then
    TMCEElement(FElement).CommandStartHMI := sacNotActivated
  else if cbbCommandStartHMI.Text = 'Activated' then
    TMCEElement(FElement).CommandStartHMI := sacActivated;
end;

procedure TfrmMCETest.cbbCommandStopAppSelect(Sender: TObject);
begin
  inherited;
  if cbbCommandStopApp.Text = 'Not activated' then
    TMCEElement(FElement).CommandStopApp := sacNotActivated
  else if cbbCommandStopApp.Text = 'Activated' then
    TMCEElement(FElement).CommandStopApp := sacActivated;
end;

procedure TfrmMCETest.cbbCommandStopHMISelect(Sender: TObject);
begin
  inherited;
  if cbbCommandStopHMI.Text = 'Not activated' then
    TMCEElement(FElement).CommandStopHMI := sacNotActivated
  else if cbbCommandStopHMI.Text = 'Activated' then
    TMCEElement(FElement).CommandStopHMI := sacActivated;
end;

procedure TfrmMCETest.cbbRFUSelect(Sender: TObject);
begin
  inherited;
  if cbbRFU.Text = 'RFU' then
    TMCEElement(FElement).StateRFU := snrRFU
  else if cbbRFU.Text = 'Not RFU' then
    TMCEElement(FElement).StateRFU := snrNotRFU;
end;

procedure TfrmMCETest.cbbRunConditionSelect(Sender: TObject);
begin
  inherited;
  if cbbRunCondition.Text = 'OK' then
    TMCEElement(FElement).RunCondition := srcOk
  else if cbbRunCondition.Text = 'NOK' then
    TMCEElement(FElement).RunCondition := srcNotOk;
end;

procedure TfrmMCETest.cbbStateBlockOutSelect(Sender: TObject);
begin
  inherited;
  if cbbStateBlockOut.Text = 'Activated' then
    TMCEElement(FElement).StateBlockOut := sacActivated
  else if cbbStateBlockOut.Text = 'Not activated' then
    TMCEElement(FElement).StateBlockOut := sacNotActivated;
end;

procedure TfrmMCETest.cbbStateElementDisabledSelect(Sender: TObject);
begin
  inherited;
  if cbbStateElementDisabled.Text = 'Disabled' then
    TMCEElement(FElement).StateElementDisabled := sdDisabled
  else if cbbStateElementDisabled.Text = 'Enabled' then
    TMCEElement(FElement).StateElementDisabled := sdEnabled;
end;

procedure TfrmMCETest.cbbStateManualAutoSelect(Sender: TObject);
begin
  inherited;
  if cbbStateManualAuto.Text = 'Manual' then
    TMCEElement(FElement).StateManualAuto := smaManual
  else if cbbStateManualAuto.Text = 'Auto' then
    TMCEElement(FElement).StateManualAuto := smaAuto;
end;

procedure TfrmMCETest.cbbStateRestartSelect(Sender: TObject);
begin
  inherited;
  if cbbStateRestart.Text = 'Activated' then
    TMCEElement(FElement).StateRestart := sacActivated
  else if cbbStateRestart.Text = 'Not activated' then
    TMCEElement(FElement).StateRestart := sacNotActivated;
end;

procedure TfrmMCETest.cbbStateSwitchNoFault1Select(Sender: TObject);
begin
  inherited;
  if cbbStateSwitchNoFault.Text = 'No fault' then
    TMCEElement(FElement).StateSwitchNoFault := esNoFault
  else if cbbStateSwitchNoFault.Text = 'Fault' then
    TMCEElement(FElement).StateSwitchNoFault := esFault;
end;

procedure TfrmMCETest.cbbStateSwitchRemoteSelect(Sender: TObject);
begin
  inherited;
  if cbbStateSwitchRemote.Text = 'Local' then
    TMCEElement(FElement).StateSwitchRemote := esLocal
  else if cbbStateSwitchRemote.Text = 'Remote' then
    TMCEElement(FElement).StateSwitchRemote := esRemote;
end;

procedure TfrmMCETest.cbbStateSwitchRunningSelect(Sender: TObject);
begin
  inherited;
  if cbbStateSwitchRunning.Text = 'Running' then
    TMCEElement(FElement).StateSwitchRunning := esRunning
  else if cbbStateSwitchRunning.Text = 'Not running' then
    TMCEElement(FElement).StateSwitchRunning := esNotRunning;
end;

procedure TfrmMCETest.cbbStateValueValidSelect(Sender: TObject);
begin
  inherited;
  if cbbStateValueValid.Text = 'Valid' then
    TMCEElement(FElement).StateValueValid := svValid
  else if cbbStateValueValid.Text = 'Not valid' then
    TMCEElement(FElement).StateValueValid := svInvalid;
end;

procedure TfrmMCETest.edtTtransKeyPress(Sender: TObject; var Key: Char);
var
  val: Integer;
begin
  inherited;

  if not (key in['0'..'9', #8, #13, #46]) then
    key := #0;

  if Key = #13 then
  begin

    TryStrToInt(TEdit(Sender).Text, val);

    case TEdit(Sender).Tag of
      1: TMCEElement(FElement).Parameters.GetParameter(epTTRANS).ParamDoubleValue := val;
      2: TMCEElement(FElement).Parameters.GetParameter(epTCTRL).ParamDoubleValue := val;
    end;
  end;

end;

procedure TfrmMCETest.ElementPropertyChange(Sender: TObject; PropsID: E_PropsID;
  Value: Byte);
begin
  inherited;

  case PropsID of
    epElementAlarmChange : edtStateAlarm.Text := ElementAlarmStateToStr(E_StateAlarm(Value));
    epElementStateChange : edtStateElement.Text := ElementStateToStr(E_StateElement(Value));
    epElementStateCommandChange    : edtStateCommand.Text := ElementStateCommandToStr(E_DesiredState(Value));
    epElementStateControlPosChange : edtStateControl.Text := ElementStateControlPositionToStr(E_ControlMode(Value));

    epStateSwitchRemoteChange  : cbbStateSwitchRemote.ItemIndex := Value;
    epStateSwitchNoFaultChange : cbbStateSwitchNoFault.ItemIndex := Value;
    epStateSwitchRunningChange : cbbStateSwitchRunning.ItemIndex := Value;

    epElementCommandStartAppChange : cbbCommandStartApp.ItemIndex := Value;
    epElementCommandStopAppChange  : cbbCommandStopApp.ItemIndex := Value;
    epElementCommandStartHMIChange : cbbCommandStartHMI.ItemIndex := Value;
    epElementCommandStopHMIChange  : cbbCommandStopHMI.ItemIndex := Value;
    epElementManualAutoChange : cbbStateManualAuto.ItemIndex := Value;
    epElementDisabledChange   : cbbStateElementDisabled.ItemIndex := Value;
    epElementBlackOutChange   : cbbStateBlockOut.ItemIndex := Value;
    epElementRestartChange    : cbbStateRestart.ItemIndex := Value;
    epElementValidChange      : cbbStateValueValid.ItemIndex := Value;
    epElementRunChange        : cbbRunCondition.ItemIndex := Value;
    epStateNoRFUChange        : cbbRFU.ItemIndex := Value;
  end;
end;

end.
