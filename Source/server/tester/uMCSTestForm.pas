unit uMCSTestForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uElementTestForm;

type
  TfrmMCSTest = class(TfrmElementTest)
    grpPlatformInterface: TGroupBox;
    grpInput: TGroupBox;
    grpOutput: TGroupBox;
    cbbStateSwitchRemote: TComboBox;
    lbl1: TLabel;
    cbbStateSwitchRunning: TComboBox;
    cbbStateSwitchStandby: TComboBox;
    cbbStateSwitchNoFault: TComboBox;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    cbbControlStandby: TComboBox;
    cbb3ControlStart: TComboBox;
    cbbControlStop: TComboBox;
    lbl6: TLabel;
    lbl7: TLabel;
    grpIPMSInterface: TGroupBox;
    grpInput2: TGroupBox;
    grpOutput2: TGroupBox;
    cbbCommandStandbyApp: TComboBox;
    lbl8: TLabel;
    cbbCommandStartApp: TComboBox;
    cbbCommandStopApp: TComboBox;
    cbbCommandStandbyHMI: TComboBox;
    cbbCommandStartHMI: TComboBox;
    cbbCommandStopHMI: TComboBox;
    cbbStateBlockOut: TComboBox;
    cbbStateRestart: TComboBox;
    cbbStateValueValid: TComboBox;
    cbbStateManualAuto: TComboBox;
    cbbStateElementDisabled: TComboBox;
    cbbStateSwitchRFU: TComboBox;
    cbbStateRunCondition: TComboBox;
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
    cbbStateAlarm: TComboBox;
    lbl21: TLabel;
    cbbStateCommand: TComboBox;
    cbbStateElement: TComboBox;
    lbl22: TLabel;
    lbl23: TLabel;
    lbl24: TLabel;
    cbbControlPosition: TComboBox;
    grpParameters: TGroupBox;
    edtTtrans: TEdit;
    lbl25: TLabel;
    edtTctrl: TEdit;
    lbl26: TLabel;
    procedure cbbStateSwitchRemoteSelect(Sender: TObject);
    procedure cbbStateSwitchRunningSelect(Sender: TObject);
    procedure cbbStateSwitchStandbySelect(Sender: TObject);
    procedure cbbStateSwitchNoFaultSelect(Sender: TObject);
    procedure cbbCommandStandbyAppSelect(Sender: TObject);
    procedure cbbCommandStartAppSelect(Sender: TObject);
    procedure cbbCommandStopAppSelect(Sender: TObject);
    procedure cbbCommandStandbyHMISelect(Sender: TObject);
    procedure cbbCommandStartHMISelect(Sender: TObject);
    procedure cbbCommandStopHMISelect(Sender: TObject);
    procedure cbbStateBlockOutSelect(Sender: TObject);
    procedure cbbStateRestartSelect(Sender: TObject);
    procedure cbbStateValueValidSelect(Sender: TObject);
    procedure cbbStateManualAutoSelect(Sender: TObject);
    procedure cbbStateElementDisabledSelect(Sender: TObject);
    procedure cbbStateSwitchRFUSelect(Sender: TObject);
    procedure cbbStateRunConditionSelect(Sender: TObject);
    procedure edtTtransKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  protected
    procedure ApplyElement;override;
  public
    { Public declarations }
  end;

var
  frmMCSTest: TfrmMCSTest;

implementation

uses uMCS, uDataType;

{$R *.dfm}

procedure TfrmMCSTest.ApplyElement;
begin
  inherited;

  if FElement is TMCSElement then
  begin

    with TMCSElement(FElement) do
    begin

      case StateSwitchRemote of
        esLocal  : cbbStateSwitchRemote.ItemIndex := 0;
        esRemote : cbbStateSwitchRemote.ItemIndex := 1;
      end;

      case StateSwitchRunning of
        esRunning    : cbbStateSwitchRunning.ItemIndex := 0;
        esNotRunning : cbbStateSwitchRunning.ItemIndex := 1;
      end;

      case StateSwitchStandby of
        esStandby    : cbbStateSwitchStandby.ItemIndex := 0;
        esNotStandby : cbbStateSwitchStandby.ItemIndex := 1;
      end;

      case StateSwitchNoFault of
        esFault   : cbbStateSwitchNoFault.ItemIndex := 0;
        esNoFault : cbbStateSwitchNoFault.ItemIndex := 1;
      end;

      case CommandStandbyApp of
        sacActivated   : cbbCommandStandbyApp.ItemIndex := 0;
        sacNotActivated: cbbCommandStandbyApp.ItemIndex := 1;
      end;

      case CommandStartApp of
        sacActivated   : cbbCommandStartApp.ItemIndex := 0;
        sacNotActivated: cbbCommandStartApp.ItemIndex := 1;
      end;

      case CommandStopApp of
        sacActivated   : cbbCommandStopApp.ItemIndex := 0;
        sacNotActivated: cbbCommandStopApp.ItemIndex := 1;
      end;

      case CommandStandbyHMI of
        sacActivated   : cbbCommandStandbyHMI.ItemIndex := 0;
        sacNotActivated: cbbCommandStandbyHMI.ItemIndex := 1;
      end;

      case CommandStartHMI of
        sacActivated   : cbbCommandStartHMI.ItemIndex := 0;
        sacNotActivated: cbbCommandStartHMI.ItemIndex := 1;
      end;

      case CommandStopHMI of
        sacActivated   : cbbCommandStopHMI.ItemIndex := 0;
        sacNotActivated: cbbCommandStopHMI.ItemIndex := 1;
      end;

      case StateBlockOut of
        sacActivated   : cbbStateBlockOut.ItemIndex := 0;
        sacNotActivated: cbbStateBlockOut.ItemIndex := 1;
      end;

      case StateRestart of
        sacActivated   : cbbStateRestart.ItemIndex := 0;
        sacNotActivated: cbbStateRestart.ItemIndex := 1;
      end;

      case StateValueValid of
        svValid  : cbbStateValueValid.ItemIndex := 0;
        svInvalid: cbbStateValueValid.ItemIndex := 1;
      end;

      case StateManualAuto of
        smaManual: cbbStateManualAuto.ItemIndex := 0;
        smaAuto  : cbbStateManualAuto.ItemIndex := 1;
      end;

      case StateElementDisabled of
        sdDisabled: cbbStateElementDisabled.ItemIndex := 0;
        sdEnabled : cbbStateElementDisabled.ItemIndex := 1;
      end;

      case StateSwitchRFU of
        snrRFU   : cbbStateSwitchRFU.ItemIndex := 0;
        snrNotRFU: cbbStateSwitchRFU.ItemIndex := 1;
      end;

      case StateRunCondition of
        srcOk   : cbbStateRunCondition.ItemIndex := 0;
        srcNotOk: cbbStateRunCondition.ItemIndex := 1;
      end;

      edtTctrl.Text := FloatToStr(Parameters.GetParameter(epTCTRL).ParamDoubleValue);
      edtTtrans.Text := FloatToStr(Parameters.GetParameter(epTTRANS).ParamDoubleValue);
    end;
  end;
end;

procedure TfrmMCSTest.cbbCommandStandbyAppSelect(Sender: TObject);
begin
  inherited;
  if cbbCommandStandbyApp.Text = 'Not activated' then
    TMCSElement(FElement).CommandStandbyApp := sacNotActivated
  else if cbbCommandStandbyApp.Text = 'Activated' then
    TMCSElement(FElement).CommandStandbyApp := sacActivated;
end;

procedure TfrmMCSTest.cbbCommandStandbyHMISelect(Sender: TObject);
begin
  inherited;
  if cbbCommandStandbyHMI.Text = 'Not activated' then
    TMCSElement(FElement).CommandStandbyHMI := sacNotActivated
  else if cbbCommandStandbyHMI.Text = 'Activated' then
    TMCSElement(FElement).CommandStandbyHMI := sacActivated;
end;

procedure TfrmMCSTest.cbbCommandStartAppSelect(Sender: TObject);
begin
  inherited;
  if cbbCommandStartApp.Text = 'Not activated' then
    TMCSElement(FElement).CommandStartApp := sacNotActivated
  else if cbbCommandStartApp.Text = 'Activated' then
    TMCSElement(FElement).CommandStartApp := sacActivated;
end;

procedure TfrmMCSTest.cbbCommandStartHMISelect(Sender: TObject);
begin
  inherited;
  if cbbCommandStartHMI.Text = 'Not activated' then
    TMCSElement(FElement).CommandStartHMI := sacNotActivated
  else if cbbCommandStartHMI.Text = 'Activated' then
    TMCSElement(FElement).CommandStartHMI := sacActivated;
end;

procedure TfrmMCSTest.cbbCommandStopAppSelect(Sender: TObject);
begin
  inherited;
  if cbbCommandStopApp.Text = 'Not activated' then
    TMCSElement(FElement).CommandStopApp := sacNotActivated
  else if cbbCommandStopApp.Text = 'Activated' then
    TMCSElement(FElement).CommandStopApp := sacActivated;
end;

procedure TfrmMCSTest.cbbCommandStopHMISelect(Sender: TObject);
begin
  inherited;
  if cbbCommandStopHMI.Text = 'Not activated' then
    TMCSElement(FElement).CommandStopHMI := sacNotActivated
  else if cbbCommandStopHMI.Text = 'Activated' then
    TMCSElement(FElement).CommandStopHMI := sacActivated;
end;

procedure TfrmMCSTest.cbbStateBlockOutSelect(Sender: TObject);
begin
  inherited;
  if cbbStateBlockOut.Text = 'Activated' then
    TMCSElement(FElement).StateBlockOut := sacActivated
  else if cbbStateBlockOut.Text = 'Not activated' then
    TMCSElement(FElement).StateBlockOut := sacNotActivated;
end;

procedure TfrmMCSTest.cbbStateElementDisabledSelect(Sender: TObject);
begin
  inherited;
  if cbbStateElementDisabled.Text = 'Disabled' then
    TMCSElement(FElement).StateElementDisabled := sdDisabled
  else if cbbStateElementDisabled.Text = 'Enabled' then
    TMCSElement(FElement).StateElementDisabled := sdEnabled
end;

procedure TfrmMCSTest.cbbStateManualAutoSelect(Sender: TObject);
begin
  inherited;
  if cbbStateManualAuto.Text = 'Manual' then
    TMCSElement(FElement).StateManualAuto := smaManual
  else if cbbStateManualAuto.Text = 'Auto' then
    TMCSElement(FElement).StateManualAuto := smaAuto;
end;

procedure TfrmMCSTest.cbbStateRestartSelect(Sender: TObject);
begin
  inherited;
  if cbbStateRestart.Text = 'Activated' then
    TMCSElement(FElement).StateRestart := sacActivated
  else if cbbStateRestart.Text = 'Not Activated' then
    TMCSElement(FElement).StateRestart := sacNotActivated;

end;

procedure TfrmMCSTest.cbbStateRunConditionSelect(Sender: TObject);
begin
  inherited;
  if cbbStateRunCondition.Text = 'OK' then
    TMCSElement(FElement).StateRunCondition := srcOk
  else if cbbStateRunCondition.Text = 'NOK' then
    TMCSElement(FElement).StateRunCondition := srcNotOk;
end;

procedure TfrmMCSTest.cbbStateSwitchNoFaultSelect(Sender: TObject);
begin
  inherited;
  if cbbStateSwitchNoFault.Text = 'Fault' then
    TMCSElement(FElement).StateSwitchNoFault := esFault
  else if cbbStateSwitchNoFault.Text = 'No fault' then
    TMCSElement(FElement).StateSwitchNoFault := esNoFault;
end;

procedure TfrmMCSTest.cbbStateSwitchRemoteSelect(Sender: TObject);
begin
  inherited;
  if cbbStateSwitchRemote.Text = 'Local' then
    TMCSElement(FElement).StateSwitchRemote := esLocal
  else if cbbStateSwitchRemote.Text = 'Remote' then
    TMCSElement(FElement).StateSwitchRemote := esRemote;
end;

procedure TfrmMCSTest.cbbStateSwitchRFUSelect(Sender: TObject);
begin
  inherited;
  if cbbStateSwitchRFU.Text = 'RFU' then
    TMCSElement(FElement).StateSwitchRFU := snrRFU
  else if cbbStateSwitchRFU.Text = 'Not RFU' then
    TMCSElement(FElement).StateSwitchRFU := snrNotRFU;
end;

procedure TfrmMCSTest.cbbStateSwitchRunningSelect(Sender: TObject);
begin
  inherited;
  if cbbStateSwitchRunning.Text = 'Running' then
    TMCSElement(FElement).StateSwitchRunning := esRunning
  else if cbbStateSwitchRunning.Text = 'Not running' then
    TMCSElement(FElement).StateSwitchRunning := esNotRunning;
end;

procedure TfrmMCSTest.cbbStateSwitchStandbySelect(Sender: TObject);
begin
  inherited;
  if cbbStateSwitchStandby.Text = 'Standby' then
    TMCSElement(FElement).StateSwitchStandby := esStandby
  else if cbbStateSwitchStandby.Text = 'Not standby' then
    TMCSElement(FElement).StateSwitchStandby := esNotStandby;

end;

procedure TfrmMCSTest.cbbStateValueValidSelect(Sender: TObject);
begin
  inherited;
  if cbbStateValueValid.Text = 'Valid' then
    TMCSElement(FElement).StateValueValid := svValid
  else if cbbStateValueValid.Text = 'Not valid' then
    TMCSElement(FElement).StateValueValid := svInvalid;
end;

procedure TfrmMCSTest.edtTtransKeyPress(Sender: TObject; var Key: Char);
var
  Value : integer;
begin
  inherited;
  if key = #13 then
  begin
    TryStrToInt(TEdit(sender).Text, Value);
    case TEdit(sender).Tag of
      1 : TMCSElement(FElement).Parameters.GetParameter(epTTRANS).ParamDoubleValue := Value;
      2 : TMCSElement(FElement).Parameters.GetParameter(epTCTRL).ParamDoubleValue := Value;
    end;
  end;

end;

end.
