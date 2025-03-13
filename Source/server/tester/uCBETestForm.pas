unit uCBETestForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uElementTestForm, uDataType;

type
  TfrmCBETest = class(TfrmElementTest)
    grpPlatformInterface: TGroupBox;
    grpIPMSInterface: TGroupBox;
    cbbStateSwitchClose: TComboBox;
    grpInput: TGroupBox;
    grpOutput: TGroupBox;
    cbbStateSwitchOpen: TComboBox;
    cbbStateSwitchRemote: TComboBox;
    cbbStateSwitchTripped: TComboBox;
    cbbStateSwitchNoFault: TComboBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    cbbStateRFC: TComboBox;
    cbbStateRFO: TComboBox;
    cbbCommandCloseApp: TComboBox;
    cbbCommandOpenApp: TComboBox;
    cbbCommandCloseHMI: TComboBox;
    cbbCommandOpenHMI: TComboBox;
    cbbStateElementDisabled: TComboBox;
    cbbStateAlarmInhibited: TComboBox;
    cbbStateAutoManual: TComboBox;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    grpInputIPMS: TGroupBox;
    grpOutputIPMS: TGroupBox;
    lbl18: TLabel;
    lbl19: TLabel;
    lbl20: TLabel;
    lbl21: TLabel;
    grpParameters: TGroupBox;
    lbl12: TLabel;
    edtTrans: TEdit;
    edtTctrl: TEdit;
    lbl23: TLabel;
    edtStateAlarm: TEdit;
    edtStateCommand: TEdit;
    edtStateControlPosition: TEdit;
    edtStateElement: TEdit;
    edtControlClose: TEdit;
    edtControlOpen: TEdit;
    procedure cbbStateSwitchCloseSelect(Sender: TObject);
    procedure cbbStateSwitchOpenSelect(Sender: TObject);
    procedure cbbStateSwitchRemoteSelect(Sender: TObject);
    procedure cbbStateSwitchTrippedSelect(Sender: TObject);
    procedure cbbStateSwitchNoFaultSelect(Sender: TObject);
    procedure cbbCommandCloseAppSelect(Sender: TObject);
    procedure cbbCommandOpenAppSelect(Sender: TObject);
    procedure cbbCommandCloseHMISelect(Sender: TObject);
    procedure cbbCommandOpenHMISelect(Sender: TObject);
    procedure cbbStateElementDisabledSelect(Sender: TObject);
    procedure cbbStateAlarmInhibitedSelect(Sender: TObject);
    procedure cbbStateAutoManualSelect(Sender: TObject);
    procedure cbbStateRFCSelect(Sender: TObject);
    procedure cbbStateRFOSelect(Sender: TObject);
    procedure edtTransKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  protected
    procedure ApplyElement;override;
    procedure ElementPropertyChange(Sender : TObject;PropsID : E_PropsID;Value : Byte);overload;override;
  public
    { Public declarations }
  end;

var
  frmCBETest: TfrmCBETest;

implementation

uses uCBE, uListener, uFunction;

{$R *.dfm}

procedure TfrmCBETest.ApplyElement;
begin
  inherited;
  if FElement is TCBEElement then
  begin
    with TCBEElement(FElement) do begin

      case StateSwitchClosed of
        esClosed: cbbStateSwitchClose.ItemIndex := 0;
        esNotClosed: cbbStateSwitchClose.ItemIndex := 1;
        else
        begin
//          StateSwitchClosed := esClosed;
          cbbStateSwitchClose.ItemIndex := 0;
        end;
      end;

      case StateSwitchOpen of
        esOpen: cbbStateSwitchOpen.ItemIndex := 0;
        esNotOpen: cbbStateSwitchOpen.ItemIndex := 1;
        else
        begin
//          StateSwitchOpen := esOpen;
          cbbStateSwitchOpen.ItemIndex := 0;
        end;
      end;

      case StateSwitchRemote of
        esLocal: cbbStateSwitchRemote.ItemIndex := 0;
        esRemote: cbbStateSwitchRemote.ItemIndex := 1;
        else
        begin
//          StateSwitchRemote := esLocal;
          cbbStateSwitchRemote.ItemIndex := 0;
        end;
      end;

      case StateSwitchTripped of
        esTripped: cbbStateSwitchTripped.ItemIndex := 0;
        esNotTripped: cbbStateSwitchTripped.ItemIndex := 1;
        else
        begin
//          StateSwitchTripped := esTripped;
          cbbStateSwitchTripped.ItemIndex := 0;
        end;
      end;

      case StateSwitchNoFault of
        esFault: cbbStateSwitchNoFault.ItemIndex := 0;
        esNoFault: cbbStateSwitchNoFault.ItemIndex := 1;
        else
        begin
//          StateSwitchNoFault := esFault;
          cbbStateSwitchNoFault.ItemIndex := 0;
        end;
      end;

      case StateCommandCloseApp of
        sacNotActivated: cbbCommandCloseApp.ItemIndex := 0;
        sacActivated: cbbCommandCloseApp.ItemIndex := 1;
      end;

      case StateCommandOpenApp of
        sacNotActivated: cbbCommandOpenApp.ItemIndex := 0;
        sacActivated: cbbCommandOpenApp.ItemIndex := 1;
      end;

      case StateCommandCloseHMI of
        sacNotActivated: cbbCommandCloseHMI.ItemIndex := 0;
        sacActivated: cbbCommandCloseHMI.ItemIndex := 1;
      end;

      case StateCommandOpenHMI of
        sacNotActivated: cbbCommandOpenHMI.ItemIndex := 0;
        sacActivated: cbbCommandOpenHMI.ItemIndex := 1;
      end;

      case StateElementDisabled of
        sdDisabled: cbbStateElementDisabled.ItemIndex := 0;
        sdEnabled: cbbStateElementDisabled.ItemIndex := 1;
      end;

      case StateAlarmInhibited of
        siInhibited: cbbStateAlarmInhibited.ItemIndex := 0;
        siNotInhibited: cbbStateAlarmInhibited.ItemIndex := 1;
      end;

      case StateManualAuto of
        smaManual: cbbStateAutoManual.ItemIndex := 0;
        smaAuto: cbbStateAutoManual.ItemIndex := 1;
      end;

      case StateRFC of
        srfReadyForClose: cbbStateRFC.ItemIndex := 0;
        srfNotReadyForClose: cbbStateRFC.ItemIndex := 1;
      end;

      case StateRFO of
        sroReadyForOpen: cbbStateRFO.ItemIndex := 0;
        sroNotReadyForOpen: cbbStateRFO.ItemIndex := 1;
      end;

      edtTrans.Text := FloatToStr(Parameters.GetParameter(epTTRANS).ParamDoubleValue);
      edtTctrl.Text := FloatToStr(Parameters.GetParameter(epTCTRL).ParamDoubleValue);

      edtStateAlarm.Text := ElementAlarmStateToStr(StateAlarm);
      edtStateCommand.Text := ElementStateCommandToStr(StateCommand);
      edtStateControlPosition.Text := ElementStateControlPositionToStr(StateControlPosition);
      edtStateElement.Text := ElementStateToStr(StateElement);

      edtControlClose.Text := ElementStateControlCloseOpenToStr(StateControlCloseOpen);
      edtControlOpen.Text := ElementStateControlCloseOpenToStr(StateControlCloseOpen);
    end;
  end;

end;

procedure TfrmCBETest.cbbCommandCloseAppSelect(Sender: TObject);
begin
  inherited;
  if cbbCommandCloseApp.Text = 'Not activated'  then
    TCBEElement(FElement).StateCommandCloseApp := sacNotActivated
  else if cbbCommandCloseApp.Text = 'Activated'  then
    TCBEElement(FElement).StateCommandCloseApp := sacActivated;
end;

procedure TfrmCBETest.cbbCommandCloseHMISelect(Sender: TObject);
begin
  inherited;
  if cbbCommandCloseHMI.Text = 'Not activated' then
    TCBEElement(FElement).StateCommandCloseHMI := sacNotActivated
  else if cbbCommandCloseHMI.Text = 'Activated' then
    TCBEElement(FElement).StateCommandCloseHMI := sacActivated;
end;

procedure TfrmCBETest.cbbCommandOpenAppSelect(Sender: TObject);
begin
  inherited;
  if cbbCommandOpenApp.Text = 'Not activated' then
    TCBEElement(FElement).StateCommandOpenApp := sacNotActivated
  else if cbbCommandOpenApp.Text = 'Activated' then
    TCBEElement(FElement).StateCommandOpenApp := sacActivated;
end;

procedure TfrmCBETest.cbbCommandOpenHMISelect(Sender: TObject);
begin
  inherited;
  if cbbCommandOpenHMI.Text = 'Not activated' then
    TCBEElement(FElement).StateCommandOpenHMI := sacNotActivated
  else if cbbCommandOpenHMI.Text = 'Activated' then
    TCBEElement(FElement).StateCommandOpenHMI := sacActivated;
end;

procedure TfrmCBETest.cbbStateAlarmInhibitedSelect(Sender: TObject);
begin
  inherited;
  if cbbStateAlarmInhibited.Text = 'Inhibited' then
    TCBEElement(FElement).StateAlarmInhibited := siInhibited
  else if cbbStateAlarmInhibited.Text = 'Not inhibited' then
    TCBEElement(FElement).StateAlarmInhibited := siNotInhibited;
end;

procedure TfrmCBETest.cbbStateAutoManualSelect(Sender: TObject);
begin
  inherited;
  if cbbStateAutoManual.Text = 'Manual' then
    TCBEElement(FElement).StateManualAuto := smaManual
  else if cbbStateAutoManual.Text = 'Auto' then
    TCBEElement(FElement).StateManualAuto := smaAuto;
end;

procedure TfrmCBETest.cbbStateElementDisabledSelect(Sender: TObject);
begin
  inherited;
  if cbbStateElementDisabled.Text = 'Disabled' then
    TCBEElement(FElement).StateElementDisabled := sdDisabled
  else if cbbStateElementDisabled.Text = 'Enabled' then
    TCBEElement(FElement).StateElementDisabled := sdEnabled;
end;

procedure TfrmCBETest.cbbStateRFCSelect(Sender: TObject);
begin
  inherited;
  if cbbStateRFC.Text = 'Ready for Closing' then
    TCBEElement(FElement).StateRFC := srfReadyForClose
  else if cbbStateRFC.Text = 'Not Ready for Closing' then
    TCBEElement(FElement).StateRFC := srfNotReadyForClose;
end;

procedure TfrmCBETest.cbbStateRFOSelect(Sender: TObject);
begin
  inherited;
  if cbbStateRFO.Text = 'Ready for Opening' then
    TCBEElement(FElement).StateRFO := sroReadyForOpen
  else if cbbStateRFO.Text = 'Not Ready for Opening' then
    TCBEElement(FElement).StateRFO := sroNotReadyForOpen;
end;

procedure TfrmCBETest.cbbStateSwitchCloseSelect(Sender: TObject);
begin
  inherited;
  if cbbStateSwitchClose.Text = 'Closed' then
    TCBEElement(FElement).StateSwitchClosed := esClosed
  else if cbbStateSwitchClose.Text = 'Not closed' then
    TCBEElement(FElement).StateSwitchClosed := esNotClosed;
end;

procedure TfrmCBETest.cbbStateSwitchNoFaultSelect(Sender: TObject);
begin
  inherited;
  if cbbStateSwitchNoFault.Text = 'Fault' then
    TCBEElement(FElement).StateSwitchNoFault := esFault
  else if cbbStateSwitchNoFault.Text = 'No fault' then
    TCBEElement(FElement).StateSwitchNoFault := esNoFault;
end;

procedure TfrmCBETest.cbbStateSwitchOpenSelect(Sender: TObject);
begin
  inherited;
  if cbbStateSwitchOpen.Text = 'Open' then
    TCBEElement(FElement).StateSwitchOpen := esOpen
  else if cbbStateSwitchOpen.Text = 'Not open' then
    TCBEElement(FElement).StateSwitchOpen := esNotOpen;
end;

procedure TfrmCBETest.cbbStateSwitchRemoteSelect(Sender: TObject);
begin
  inherited;
  if cbbStateSwitchRemote.Text = 'Local' then
    TCBEElement(FElement).StateSwitchRemote := esLocal
  else if cbbStateSwitchRemote.Text = 'Remote' then
    TCBEElement(FElement).StateSwitchRemote := esRemote;
end;

procedure TfrmCBETest.cbbStateSwitchTrippedSelect(Sender: TObject);
begin
  inherited;
  if cbbStateSwitchTripped.Text = 'Tripped' then
    TCBEElement(FElement).StateSwitchTripped := esTripped
  else if cbbStateSwitchTripped.Text = 'Not tripped' then
    TCBEElement(FElement).StateSwitchTripped := esNotTripped;
end;

procedure TfrmCBETest.edtTransKeyPress(Sender: TObject; var Key: Char);
var
 Value : Double;
begin
  inherited;

  if not (key in['0'..'9', #8, #13, #46]) then
    key := #0;

  if key = #13 then
  begin
    TryStrToFloat(TEdit(sender).Text, Value);

    case TEdit(sender).Tag of
      1 : TCBEElement(FElement).Parameters.GetParameter(epTTRANS).ParamDoubleValue := value;
      2 : TCBEElement(FElement).Parameters.GetParameter(epTCTRL).ParamDoubleValue := value;
    end;

  end;
end;

procedure TfrmCBETest.ElementPropertyChange(Sender: TObject; PropsID: E_PropsID;
  Value: Byte);
begin
  inherited;

  case PropsID of
    //output
    epElementAlarmChange    : edtStateAlarm.Text := ElementAlarmStateToStr(E_StateAlarm(Value));
    epElementStateCommandChange : edtStateCommand.Text := ElementStateCommandToStr(E_DesiredState(Value));
    epElementStateControlPosChange : edtStateControlPosition.Text := ElementStateControlPositionToStr(E_ControlMode(value));
    epElementStateChange    : edtStateElement.Text := ElementStateToStr(E_StateElement(Value));

    epControlCloseChange : edtControlClose.Text := ElementStateControlCloseOpenToStr(E_StateActivated(Value));
    epControlOpenChange : edtControlOpen.Text := ElementStateControlCloseOpenToStr(E_StateActivated(Value));

    //input
    epStateSwitchCloseChange : cbbStateSwitchClose.ItemIndex := value;
    epStateSwitchOpenChange : cbbStateSwitchOpen.ItemIndex := value;
    epStateSwitchRemoteChange : cbbStateSwitchRemote.ItemIndex := value;
    epStateSwitchTrippedChange : cbbStateSwitchTripped.ItemIndex := value;
    epStateSwitchnoFaultChange : cbbStateSwitchNoFault.ItemIndex := value;

    epElementCommandCloseAppChange : cbbCommandCloseApp.ItemIndex := value;
    epElementCommandOpenAppChange : cbbCommandOpenApp.ItemIndex := value;
    epElementCommandCloseHMIChange : cbbCommandCloseHMI.ItemIndex := value;
    epElementCommandOpenHMIChange : cbbCommandOpenHMI.ItemIndex := value;
    epElementDisabledChange : cbbStateElementDisabled.ItemIndex := value;
    epElementAlrmInhibited : cbbStateAlarmInhibited.ItemIndex := value;
    epElementManualAutoChange : cbbStateAutoManual.ItemIndex := value;
    epElementRFCChange : cbbStateRFC.ItemIndex := value;
    epElementRFOChange : cbbStateRFO.ItemIndex := value;
  end;

end;

end.
