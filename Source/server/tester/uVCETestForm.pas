unit uVCETestForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uElementTestForm, uDataType;

type
  TfrmVCETest = class(TfrmElementTest)
    grpInput2: TGroupBox;
    cbbCommandCloseApp: TComboBox;
    lbl6: TLabel;
    cbbCommandOpenApp: TComboBox;
    cbbCommandCloseHMI: TComboBox;
    cbbCommandOpenHMI: TComboBox;
    cbbStateElementDisabled: TComboBox;
    cbbStateManualAuto: TComboBox;
    cbbStateRFU: TComboBox;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    grpIPMSInterface: TGroupBox;
    grpOutput2: TGroupBox;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    grpParameter: TGroupBox;
    edtTtrans: TEdit;
    lbl17: TLabel;
    edtTctrl: TEdit;
    lbl18: TLabel;
    edtStateAlarm: TEdit;
    edtStateCommand: TEdit;
    edtControlPosition: TEdit;
    edtStateElement: TEdit;
    grpInput: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    cbbStateSwitchClose: TComboBox;
    cbbStateSwitchOpen: TComboBox;
    cbbStateSwitchRemote: TComboBox;
    procedure cbbStateSwitchCloseSelect(Sender: TObject);
    procedure cbbStateSwitchOpenSelect(Sender: TObject);
    procedure cbbStateSwitchRemoteSelect(Sender: TObject);
    procedure cbbCommandCloseAppSelect(Sender: TObject);
    procedure cbbStateElementDisabledSelect(Sender: TObject);
    procedure cbbStateManualAutoSelect(Sender: TObject);
    procedure cbbStateRFUSelect(Sender: TObject);
    procedure edtTtransKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  protected
    procedure ApplyElement;override;
    procedure ElementPropertyChange(Sender : TObject;PropsID : E_PropsID;Value : Byte);overload;override;
  public
    { Public declarations }
  end;

var
  frmVCETest: TfrmVCETest;

implementation

uses uVCE, uListener, uFunction;
{$R *.dfm}

{ TfrmVCETest }

procedure TfrmVCETest.ApplyElement;
begin
  inherited;

  if FElement is TVCEElement then
  begin
    with TVCEElement(FElement) do begin

    {input}
      case StateSwitchClosed of
        esClosed    : cbbStateSwitchClose.ItemIndex := 0;
        esNotClosed : cbbStateSwitchClose.ItemIndex := 1;
        else
        begin
          cbbStateSwitchClose.ItemIndex := 0;
//          StateSwitchClosed := esClosed;
        end;
      end;
      case StateSwitchOpen of
        esOpen    : cbbStateSwitchOpen.ItemIndex := 0;
        esNotOpen : cbbStateSwitchOpen.ItemIndex := 1;
        else
        begin
          cbbStateSwitchOpen.ItemIndex := 0;
//          StateSwitchOpen := esOpen;
        end;
      end;
      case StateSwitchRemote of
        esLocal   : cbbStateSwitchRemote.ItemIndex := 0;
        esRemote  : cbbStateSwitchRemote.ItemIndex := 1;
        else
        begin
          cbbStateSwitchRemote.ItemIndex := 0;
//          StateSwitchRemote := esLocal;
        end;
      end;
      case CommandClose of
        sacNotActivated : cbbCommandCloseApp.ItemIndex := 0;
        sacActivated    : cbbCommandCloseApp.ItemIndex := 1;
      end;
      case CommandOpen of
        sacNotActivated : cbbCommandOpenApp.ItemIndex := 0;
        sacActivated    : cbbCommandOpenApp.ItemIndex := 1;
      end;
      case CommandClose of
        sacNotActivated : cbbCommandCloseHMI.ItemIndex := 0;
        sacActivated    : cbbCommandCloseHMI.ItemIndex := 1;
      end;
      case CommandOpen of
        sacNotActivated : cbbCommandOpenHMI.ItemIndex := 0;
        sacActivated    : cbbCommandOpenHMI.ItemIndex := 1;
      end;
      case StateElementDisabled of
        sdDisabled : cbbStateElementDisabled.ItemIndex := 0;
        sdEnabled  : cbbStateElementDisabled.ItemIndex := 1;
      end;
      case StateAutoManual of
        smaManual : cbbStateManualAuto.ItemIndex := 0;
        smaAuto   : cbbStateManualAuto.ItemIndex := 1;
      end;
      case StateRFU of
        snrRFU    : cbbStateRFU.ItemIndex := 0;
        snrNotRFU : cbbStateRFU.ItemIndex := 1;
      end;

    {parameter}
      edtTtrans.Text  := FloatToStr(Parameters.GetParameter(epTTRANS).ParamDoubleValue);
      edtTctrl.Text   := FloatToStr(Parameters.GetParameter(epTCTRL).ParamDoubleValue);

    {output}
      edtStateAlarm.Text   := ElementAlarmStateToStr(StateAlarm);
      edtStateElement.Text := ElementStateToStr(StateElement);
      edtStateCommand.Text := ElementStateCommandToStr(StateCommand);
      edtControlPosition.Text := ElementStateControlPositionToStr(StateControlPosition);
    end;
  end;
end;

procedure TfrmVCETest.cbbCommandCloseAppSelect(Sender: TObject);
begin
  case TEdit(Sender).Tag of
    1:
    begin
      if cbbCommandCloseApp.Text = 'Not activated' then
        TVCEElement(FElement).CommandClose := sacNotActivated
      else
        TVCEElement(FElement).CommandClose := sacActivated;
    end;
    2:
    begin
      if cbbCommandOpenApp.Text = 'Not activated' then
        TVCEElement(FElement).CommandOpen := sacNotActivated
      else
        TVCEElement(FElement).CommandOpen := sacActivated;
    end;
    3:
    begin
      if cbbCommandCloseHMI.Text = 'Not activated' then
        TVCEElement(FElement).CommandClose := sacNotActivated
      else
        TVCEElement(FElement).CommandClose := sacActivated;
    end;
    4:
    begin
      if cbbCommandOpenHMI.Text = 'Not activated' then
        TVCEElement(FElement).CommandOpen := sacNotActivated
      else
        TVCEElement(FElement).CommandOpen := sacActivated;
    end;
  end;
end;

procedure TfrmVCETest.cbbStateElementDisabledSelect(Sender: TObject);
begin
  if cbbStateElementDisabled.Text = 'Disabled' then
    TVCEElement(FElement).StateElementDisabled := sdDisabled
  else
    TVCEElement(FElement).StateElementDisabled := sdEnabled;
end;

procedure TfrmVCETest.cbbStateManualAutoSelect(Sender: TObject);
begin
  if cbbStateManualAuto.Text = 'Manual' then
    TVCEElement(FElement).StateAutoManual := smaManual
  else
    TVCEElement(FElement).StateAutoManual := smaAuto;
end;

procedure TfrmVCETest.cbbStateRFUSelect(Sender: TObject);
begin
  if cbbStateRFU.Text = 'Ready for use' then
    TVCEElement(FElement).StateRFU := snrRFU
  else
    TVCEElement(FElement).StateRFU := snrNotRFU;
end;

procedure TfrmVCETest.cbbStateSwitchCloseSelect(Sender: TObject);
begin
  if cbbStateSwitchClose.Text = 'Closed' then
    TVCEElement(FElement).StateSwitchClosed := esClosed
  else
    TVCEElement(FElement).StateSwitchClosed := esNotClosed;
end;

procedure TfrmVCETest.cbbStateSwitchOpenSelect(Sender: TObject);
begin
  if cbbStateSwitchOpen.Text = 'Open' then
    TVCEElement(FElement).StateSwitchOpen := esOpen
  else
    TVCEElement(FElement).StateSwitchOpen := esNotOpen;
end;

procedure TfrmVCETest.cbbStateSwitchRemoteSelect(Sender: TObject);
begin
  if cbbStateSwitchRemote.Text = 'Local' then
    TVCEElement(FElement).StateSwitchRemote := esLocal
  else
    TVCEElement(FElement).StateSwitchRemote := esRemote;
end;

procedure TfrmVCETest.edtTtransKeyPress(Sender: TObject; var Key: Char);
var
  value : Integer;
begin
  if not (key in['0'..'9', #8, #13, #46]) then
    key := #0;

  if Key = #13 then begin

    TryStrToInt(TEdit(Sender).Text,value);

    case TEdit(Sender).Tag of
      1: TVCEElement(FElement).Parameters.GetParameter(epTTRANS).ParamDoubleValue := value;
      2: TVCEElement(FElement).Parameters.GetParameter(epTCTRL).ParamDoubleValue := value;
    end;
  end;
end;

procedure TfrmVCETest.ElementPropertyChange(Sender: TObject; PropsID: E_PropsID;
  Value: Byte);
begin
  inherited;
  case PropsID of
    epElementAlarmChange    : edtStateAlarm.Text := ElementAlarmStateToStr(E_StateAlarm(Value));
    epElementStateChange    : edtStateElement.Text := ElementStateToStr(E_StateElement(Value));
    epElementStateControlPosChange : edtControlPosition.Text := ElementStateControlPositionToStr(E_ControlMode(Value));
    epElementStateCommandChange : edtStateCommand.Text := ElementStateCommandToStr(E_DesiredState(Value));

    epElementDisabledChange : cbbStateElementDisabled.ItemIndex := Value;
    epStateSwitchOpenChange : cbbStateSwitchOpen.ItemIndex := Value-3;
    epStateSwitchCloseChange: cbbStateSwitchClose.ItemIndex := Value-1;
    epStateSwitchRemoteChange : cbbStateSwitchRemote.ItemIndex := Value-9;
    epElementCommandCloseAppChange : cbbCommandCloseApp.ItemIndex := Value;
    epElementCommandOpenAppChange  : cbbCommandOpenApp.ItemIndex := Value;
    epElementCommandCloseHMIChange : cbbCommandCloseHMI.ItemIndex := Value;
    epElementCommandOpenHMIChange  : cbbCommandOpenHMI.ItemIndex := Value;
    epElementManualAutoChange : cbbStateManualAuto.ItemIndex := Value;
    epStateNoRFUChange  : cbbStateRFU.ItemIndex := Value;
  end;
end;

end.


