unit uMCDTestForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uElementTestForm, uDataType;

type
  TfrmMCDTest = class(TfrmElementTest)
    grpInput: TGroupBox;
    cbbStateSwitchSpeed1: TComboBox;
    lbl1: TLabel;
    cbbStateSwitchSpeed2: TComboBox;
    cbbStateSwitchRemote: TComboBox;
    cbbStateSwitchNoFault: TComboBox;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    grpOutput: TGroupBox;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    grpPlatformInterface: TGroupBox;
    grpInput2: TGroupBox;
    cbbCommandStartSpeed1App: TComboBox;
    lbl8: TLabel;
    cbbCommandStartSpeed2App: TComboBox;
    cbbCommandStopApp: TComboBox;
    cbbCommandStartSpeed1HMI: TComboBox;
    cbbCommandStartSpeed2HMI: TComboBox;
    cbbCommandStopHMI: TComboBox;
    cbbStateBlokOut: TComboBox;
    cbbStateRestart: TComboBox;
    cbbStateManualAuto: TComboBox;
    cbbStateElementDisabled: TComboBox;
    cbbStateValueValid: TComboBox;
    cbbRFU: TComboBox;
    cbbRunCondition: TComboBox;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl18: TLabel;
    lbl19: TLabel;
    lbl20: TLabel;
    grpIPMSInterface: TGroupBox;
    grpOutput2: TGroupBox;
    grpParameter: TGroupBox;
    lbl21: TLabel;
    lbl22: TLabel;
    lbl23: TLabel;
    lbl24: TLabel;
    edtTtrans: TEdit;
    lbl25: TLabel;
    lbl26: TLabel;
    lbl27: TLabel;
    edtTctrl: TEdit;
    edtTro: TEdit;
    edtStateAlarm: TEdit;
    edtStateCommand: TEdit;
    edtStateControl: TEdit;
    edtStateElement: TEdit;
    edtControlStartSpeed1: TEdit;
    edtControlStartSpeed2: TEdit;
    edtControlStop: TEdit;
    procedure cbbStateSwitchSpeed1Select(Sender: TObject);
    procedure cbbStateSwitchSpeed2Select(Sender: TObject);
    procedure cbbStateSwitchRemoteSelect(Sender: TObject);
    procedure cbbStateSwitchNoFaultSelect(Sender: TObject);
    procedure cbbCommandStartSpeed1AppSelect(Sender: TObject);
    procedure cbbCommandStartSpeed2AppSelect(Sender: TObject);
    procedure cbbCommandStopAppSelect(Sender: TObject);
    procedure cbbCommandStartSpeed1HMISelect(Sender: TObject);
    procedure cbbCommandStartSpeed2HMISelect(Sender: TObject);
    procedure cbbCommandStopHMISelect(Sender: TObject);
    procedure cbbStateBlokOutSelect(Sender: TObject);
    procedure cbbStateRestartSelect(Sender: TObject);
    procedure cbbStateManualAutoSelect(Sender: TObject);
    procedure cbbStateElementDisabledSelect(Sender: TObject);
    procedure cbbStateValueValidSelect(Sender: TObject);
    procedure cbbRFUSelect(Sender: TObject);
    procedure cbbRunConditionSelect(Sender: TObject);
    procedure edtTtransKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  protected
    procedure ApplyElement;override ;
    procedure ElementPropertyChange(Sender : TObject;PropsID : E_PropsID;Value : Byte);overload;override;
  public
    { Public declarations }
  end;

var
  frmMCDTest: TfrmMCDTest;

implementation

uses uMCD, uFunction;

{$R *.dfm}

procedure TfrmMCDTest.ApplyElement;
begin
  inherited;

  if FElement is TMCDElement then
  begin

    with TMCDElement(FElement) do
    begin

      case StateSwitchSpeed1 of
        esSpeed1    : cbbStateSwitchSpeed1.ItemIndex := 0;
        esNotSpeed1 : cbbStateSwitchSpeed1.ItemIndex := 1;
        else
        begin
//          StateSwitchSpeed1 := esSpeed1;
          cbbStateSwitchSpeed1.ItemIndex := 0;
        end;
      end;

      case StateSwitchSpeed2 of
        esSpeed2    : cbbStateSwitchSpeed2.ItemIndex := 0;
        esNotSpeed2 : cbbStateSwitchSpeed2.ItemIndex := 1;
        else
        begin
//          StateSwitchSpeed2 := esSpeed2;
          cbbStateSwitchSpeed2.ItemIndex := 0;
        end;
      end;

      case StateSwitchRemote of
        esLocal  : cbbStateSwitchRemote.ItemIndex := 0;
        esRemote : cbbStateSwitchRemote.ItemIndex := 1;
        else
        begin
//          StateSwitchRemote := esLocal;
          cbbStateSwitchRemote.ItemIndex := 0;
        end;
      end;

      case StateSwitchNoFault of
        esFault   : cbbStateSwitchNoFault.ItemIndex := 0;
        esNoFault : cbbStateSwitchNoFault.ItemIndex := 1;
        else
        begin
//          StateSwitchNoFault := esFault;
          cbbStateSwitchNoFault.ItemIndex := 0;
        end;
      end;

      case CommandStartSpeed1App of
        sacActivated    : cbbCommandStartSpeed1App.ItemIndex := 0;
        sacNotActivated : cbbCommandStartSpeed1App.ItemIndex := 1;
      end;

      case CommandStartSpeed2App of
        sacActivated    : cbbCommandStartSpeed2App.ItemIndex := 0;
        sacNotActivated : cbbCommandStartSpeed2App.ItemIndex := 1;
      end;

      case CommandStopApp of
        sacActivated    : cbbCommandStopApp.ItemIndex := 0;
        sacNotActivated : cbbCommandStopApp.ItemIndex := 1;
      end;

      case CommandStartSpeed1HMI of
        sacActivated    : cbbCommandStartSpeed1HMI.ItemIndex := 0;
        sacNotActivated : cbbCommandStartSpeed1HMI.ItemIndex := 1;
      end;

      case CommandStartSpeed2HMI of
        sacActivated    : cbbCommandStartSpeed2HMI.ItemIndex := 0;
        sacNotActivated : cbbCommandStartSpeed2HMI.ItemIndex := 1;
      end;

      case CommandStopHMI of
        sacActivated    : cbbCommandStopHMI.ItemIndex := 0;
        sacNotActivated : cbbCommandStopHMI.ItemIndex := 1;
      end;

      case StateBlokOut of
        sacActivated    : cbbStateBlokOut.ItemIndex := 0;
        sacNotActivated : cbbStateBlokOut.ItemIndex := 1;
      end;

      case StateRestart of
        sacActivated    : cbbStateRestart.ItemIndex := 0;
        sacNotActivated : cbbStateRestart.ItemIndex := 1;
      end;

      case StateManualAuto of
        smaManual : cbbStateManualAuto.ItemIndex := 0;
        smaAuto   : cbbStateManualAuto.ItemIndex := 1;
      end;

      case StateElementDisabled of
        sdDisabled : cbbStateElementDisabled.ItemIndex := 0;
        sdEnabled  : cbbStateElementDisabled.ItemIndex := 1;
      end;

      case StateValueValid of
        svValid   : cbbStateValueValid.ItemIndex := 0;
        svInvalid : cbbStateValueValid.ItemIndex := 1;
      end;

      case RFU of
        snrRFU    : cbbRFU.ItemIndex := 0;
        snrNotRFU : cbbRFU.ItemIndex := 1;
      end;

      case RunCondition of
        srcOk    : cbbRunCondition.ItemIndex := 0;
        srcNotOk : cbbRunCondition.ItemIndex := 1;
      end;

      edtTtrans.Text := FloatToStr(Parameters.GetParameter(epTTRANS).ParamDoubleValue);
      edtTctrl.Text := FloatToStr(Parameters.GetParameter(epTCTRL).ParamDoubleValue);
      edtTro.Text := FloatToStr(Parameters.GetParameter(epTRO).ParamDoubleValue);

      {output}
      edtStateCommand.Text := ElementStateCommandToStr(StateCommand);
      edtStateControl.Text := ElementStateControlPositionToStr(StateControlPosition);
      edtStateAlarm.Text := ElementAlarmStateToStr(StateAlarm);
      edtStateElement.Text := ElementStateToStr(StateElement);

      edtControlStartSpeed1.Text := ElementStateCommandToStr(StateCommand);   //diambilkan dr stateComand  soalnya sama2 dari E_DesiredState
      edtControlStartSpeed2.Text := ElementStateCommandToStr(StateCommand);
      edtControlStop.Text := ElementStateCommandToStr(StateCommand);

    end;
  end;
end;

procedure TfrmMCDTest.cbbCommandStartSpeed1AppSelect(Sender: TObject);
begin
  inherited;

  if cbbCommandStartSpeed1App.Text = 'Not activated' then
    TMCDElement(FElement).CommandStartSpeed1App := sacNotActivated
  else if cbbCommandStartSpeed1App.Text = 'Activated' then
    TMCDElement(FElement).CommandStartSpeed1App := sacActivated;
end;

procedure TfrmMCDTest.cbbCommandStartSpeed1HMISelect(Sender: TObject);
begin
  inherited;

  if cbbCommandStartSpeed1HMI.Text = 'Not activated' then
    TMCDElement(FElement).CommandStartSpeed1HMI := sacNotActivated
  else if cbbCommandStartSpeed1HMI.Text = 'Activated' then
    TMCDElement(FElement).CommandStartSpeed1HMI := sacActivated;
end;

procedure TfrmMCDTest.cbbCommandStartSpeed2AppSelect(Sender: TObject);
begin
  inherited;

  if cbbCommandStartSpeed2App.Text = 'Not activated' then
    TMCDElement(FElement).CommandStartSpeed2App := sacNotActivated
  else if cbbCommandStartSpeed2App.Text = 'Activated' then
    TMCDElement(FElement).CommandStartSpeed2App := sacActivated;
end;

procedure TfrmMCDTest.cbbCommandStartSpeed2HMISelect(Sender: TObject);
begin
  inherited;

  if cbbCommandStartSpeed2HMI.Text = 'Not activated' then
    TMCDElement(FElement).CommandStartSpeed2HMI := sacNotActivated
  else if cbbCommandStartSpeed2HMI.Text = 'Activated' then
    TMCDElement(FElement).CommandStartSpeed2HMI := sacActivated;
end;

procedure TfrmMCDTest.cbbCommandStopAppSelect(Sender: TObject);
begin
  inherited;

  if cbbCommandStopApp.Text = 'Not activated' then
    TMCDElement(FElement).CommandStopApp := sacNotActivated
  else if cbbCommandStopApp.Text = 'Activated' then
    TMCDElement(FElement).CommandStopApp := sacActivated;
end;

procedure TfrmMCDTest.cbbCommandStopHMISelect(Sender: TObject);
begin
  inherited;

  if cbbCommandStopHMI.Text = 'Not activated' then
    TMCDElement(FElement).CommandStopHMI := sacNotActivated
  else if cbbCommandStopHMI.Text = 'Activated' then
    TMCDElement(FElement).CommandStopHMI := sacActivated;
end;

procedure TfrmMCDTest.cbbRFUSelect(Sender: TObject);
begin
  inherited;

  if cbbRFU.Text = 'RFU' then
    TMCDElement(FElement).RFU := snrRFU
  else if cbbRFU.Text = 'Not RFU' then
    TMCDElement(FElement).RFU := snrNotRFU;
end;

procedure TfrmMCDTest.cbbRunConditionSelect(Sender: TObject);
begin
  inherited;

  if cbbRunCondition.Text = 'Activated' then
    TMCDElement(FElement).RunCondition := srcOk
  else if cbbRunCondition.Text = 'Not activated' then
  TMCDElement(FElement).RunCondition := srcNotOk;
end;

procedure TfrmMCDTest.cbbStateBlokOutSelect(Sender: TObject);
begin
  inherited;

  if cbbStateBlokOut.Text = 'Activated' then
    TMCDElement(FElement).StateBlokOut := sacActivated
  else if cbbStateBlokOut.Text = 'Not activated' then
    TMCDElement(FElement).StateBlokOut := sacNotActivated;
end;

procedure TfrmMCDTest.cbbStateElementDisabledSelect(Sender: TObject);
begin
  inherited;

  if cbbStateElementDisabled.Text ='Disabled' then
    TMCDElement(FElement).StateElementDisabled := sdDisabled
  else if cbbStateElementDisabled.Text ='Enabled' then
    TMCDElement(FElement).StateElementDisabled := sdEnabled;

end;

procedure TfrmMCDTest.cbbStateManualAutoSelect(Sender: TObject);
begin
  inherited;

  if cbbStateManualAuto.Text = 'Manual' then
    TMCDElement(FElement).StateManualAuto := smaManual
  else   if cbbStateManualAuto.Text = 'Auto' then
    TMCDElement(FElement).StateManualAuto := smaAuto;
end;

procedure TfrmMCDTest.cbbStateRestartSelect(Sender: TObject);
begin
  inherited;

  if cbbStateRestart.Text = 'Activated' then
    TMCDElement(FElement).StateRestart := sacActivated
  else if cbbStateRestart.Text = 'Not activated' then
    TMCDElement(FElement).StateRestart := sacNotActivated;
end;

procedure TfrmMCDTest.cbbStateSwitchNoFaultSelect(Sender: TObject);
begin
  inherited;

  if cbbStateSwitchNoFault.Text = 'Fault' then
    TMCDElement(FElement).StateSwitchNoFault := esFault
  else if cbbStateSwitchNoFault.Text = 'No fault' then
    TMCDElement(FElement).StateSwitchNoFault := esNoFault;
end;

procedure TfrmMCDTest.cbbStateSwitchRemoteSelect(Sender: TObject);
begin
  inherited;

  if cbbStateSwitchRemote.Text = 'Local' then
    TMCDElement(FElement).StateSwitchRemote := esLocal
  else if cbbStateSwitchRemote.Text = 'Remote' then
    TMCDElement(FElement).StateSwitchRemote := esRemote;
end;

procedure TfrmMCDTest.cbbStateSwitchSpeed1Select(Sender: TObject);
begin
  inherited;

  if cbbStateSwitchSpeed1.Text = 'Running speed 1' then
    TMCDElement(FElement).StateSwitchSpeed1 := esSpeed1
  else if cbbStateSwitchSpeed1.Text = 'Not running speed 1' then
    TMCDElement(FElement).StateSwitchSpeed1 := esNotSpeed1;
end;

procedure TfrmMCDTest.cbbStateSwitchSpeed2Select(Sender: TObject);
begin
  inherited;

  if cbbStateSwitchSpeed2.Text = 'Running speed 2' then
    TMCDElement(FElement).StateSwitchSpeed2 := esSpeed2
  else if cbbStateSwitchSpeed2.Text = 'Not running speed 2' then
    TMCDElement(FElement).StateSwitchSpeed2 := esNotSpeed2;
end;

procedure TfrmMCDTest.cbbStateValueValidSelect(Sender: TObject);
begin
  inherited;

  if cbbStateValueValid.Text = 'Valid' then
    TMCDElement(FElement).StateValueValid := svValid
  else if cbbStateValueValid.Text = 'Not valid' then
    TMCDElement(FElement).StateValueValid := svInvalid;
end;

procedure TfrmMCDTest.edtTtransKeyPress(Sender: TObject; var Key: Char);
var
  Value : integer;
begin
  inherited;

  if not (key in['0'..'9', #8, #13, #46]) then
    key := #0;

  if key = #13 then
  begin
    TryStrToInt(TEdit(sender).Text, Value);
    case TEdit(sender).Tag of
      1 : TMCDElement(FElement).Parameters.GetParameter(epTTRANS).ParamDoubleValue := Value;
      2 : TMCDElement(FElement).Parameters.GetParameter(epTCTRL).ParamDoubleValue := Value;
      3 : TMCDElement(FElement).Parameters.GetParameter(epTRO).ParamDoubleValue := Value;
    end;
  end;
end;

procedure TfrmMCDTest.ElementPropertyChange(Sender: TObject; PropsID: E_PropsID;
  Value: Byte);
begin
  inherited;

  case PropsID of
    //output
    epElementAlarmChange    : edtStateAlarm.Text := ElementAlarmStateToStr(E_StateAlarm(Value));
    epElementStateChange    : edtStateElement.Text := ElementStateToStr(E_StateElement(Value));
    epElementStateCommandChange    : edtStateCommand.Text := ElementStateCommandToStr(E_DesiredState(Value));
    epElementStateControlPosChange : edtStateControl.Text := ElementStateControlPositionToStr(E_ControlMode(Value));

    epControlStartSpeed1Change : edtControlStartSpeed1.Text := ElementStateCommandToStr(E_DesiredState(Value));
    epControlStartSpeed2Change : edtControlStartSpeed2.Text := ElementStateCommandToStr(E_DesiredState(Value));
    epControlStopChange : edtControlStop.Text := ElementStateCommandToStr(E_DesiredState(Value));

    //input
    epStateSwitchSpeed1Change : cbbStateSwitchSpeed1.ItemIndex := Value;
    epStateSwitchSpeed2Change : cbbStateSwitchSpeed2.ItemIndex := Value;
    epStateSwitchRemoteChange : cbbStateSwitchRemote.ItemIndex := Value;
    epStateSwitchNoFaultChange : cbbStateSwitchNoFault.ItemIndex := Value;

    epElementCommandStartSpeed1AppChange : cbbCommandStartSpeed1App.ItemIndex := value;
    epElementCommandStartSpeed2AppChange : cbbCommandStartSpeed2App.ItemIndex := value;
    epElementCommandStopAppChange : cbbCommandStopApp.ItemIndex := value;
    epElementCommandStartSpeed1HMIChange : cbbCommandStartSpeed1HMI.ItemIndex := value;
    epElementCommandStartSpeed2HMIChange : cbbCommandStartSpeed2HMI.ItemIndex := value;
    epElementCommandStopHMIChange : cbbCommandStopHMI.ItemIndex := value;
    epElementBlackOutChange : cbbStateBlokOut.ItemIndex := value;
    epElementRestartChange : cbbStateRestart.ItemIndex := value;
    epElementManualAutoChange : cbbStateManualAuto.ItemIndex := value;
    epElementDisabledChange : cbbStateElementDisabled.ItemIndex := value;
    epElementValidChange : cbbStateValueValid.ItemIndex := value;
    epStateNoRFUChange : cbbRFU.ItemIndex := value;
    epElementRunChange : cbbRunCondition.ItemIndex := value;

  end;

end;

end.
