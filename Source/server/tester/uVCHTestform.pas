unit uVCHTestform;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uElementTestForm, uDataType;

type
  TfrmVCHTest = class(TfrmElementTest)
    grpPlatformInterface: TGroupBox;
    grpInput: TGroupBox;
    grpOutput: TGroupBox;
    cbbStateSwitchClosed: TComboBox;
    lbl1: TLabel;
    cbbStateSwitchOpen: TComboBox;
    cbbStateSwitchRemote: TComboBox;
    lbl2: TLabel;
    lbl3: TLabel;
    cbbControlRun: TComboBox;
    lbl4: TLabel;
    cbbControlDirection: TComboBox;
    lbl5: TLabel;
    grpInput2: TGroupBox;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    cbbCommandCloseApp: TComboBox;
    cbbCommandOpenApp: TComboBox;
    cbbCommandCloseHMI: TComboBox;
    cbbCommandOpenHMI: TComboBox;
    cbbStateElementDisabled: TComboBox;
    cbbStateManualAuto: TComboBox;
    cbbRFU: TComboBox;
    grpOutput2: TGroupBox;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    cbbStateAlarm: TComboBox;
    cbbStateCommand: TComboBox;
    cbbStateControlPosition: TComboBox;
    cbbStateElement: TComboBox;
    grpIPMSInterface: TGroupBox;
    grpParameters: TGroupBox;
    edtTrans: TEdit;
    lbl17: TLabel;
    edtCtrl: TEdit;
    lbl18: TLabel;
    lbl19: TLabel;
    edtCdd: TEdit;
    procedure cbbStateSwitchClosedSelect(Sender: TObject);
    procedure cbbStateSwitchOpenSelect(Sender: TObject);
    procedure cbbStateSwitchRemoteSelect(Sender: TObject);
    procedure cbbCommandOpenAppSelect(Sender: TObject);
    procedure cbbStateElementDisabledSelect(Sender: TObject);
    procedure cbbStateManualAutoSelect(Sender: TObject);
    procedure cbbRFUSelect(Sender: TObject);
    procedure edtTransKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  protected
    procedure ApplyElement;override;
    procedure ElementPropertyChange(Sender : TObject;PropsID : E_PropsID;Value : Byte);overload;override;
    procedure ElementPropertyChange(Sender : TObject;PropsID : E_PropsID;Value : Double);overload;override;
  public
    { Public declarations }
  end;

var
  frmVCHTest: TfrmVCHTest;

implementation

uses uVCH, uFunction, uListener;
{$R *.dfm}

procedure TfrmVCHTest.ApplyElement;
begin
  inherited;

  if FElement is TVCHElement then
  begin
    with TVCHElement(FElement) do begin
      case StateSwitchClosed of
        sscClosed     : cbbStateSwitchClosed.ItemIndex := 0;
        sscNotClosed  : cbbStateSwitchClosed.ItemIndex := 1;
      end;
      case StateSwitchOpen of
        ssoOpen       : cbbStateSwitchOpen.ItemIndex := 0;
        ssoNotOpened  : cbbStateSwitchOpen.ItemIndex := 1;
      end;
      case StateSwitchRemote of
        ssrLocal   : cbbStateSwitchRemote.ItemIndex := 0;
        ssrRemote  : cbbStateSwitchRemote.ItemIndex := 1;
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
        snrRFU    : cbbRFU.ItemIndex := 0;
        snrNotRFU : cbbRFU.ItemIndex := 1;
      end;

      edtTrans.Text := FloatToStr(Parameters.GetParameter(epTTRANS).ParamDoubleValue);
      edtCdd.Text   := FloatToStr(Parameters.GetParameter(epTCDD).ParamDoubleValue);
      edtCtrl.Text  := FloatToStr(Parameters.GetParameter(epTCTRL).ParamDoubleValue);

      cbbStateAlarm.Text   := ElementAlarmStateToStr(StateAlarm);
      cbbStateElement.Text := ElementStateToStr(StateElement);
    end;
  end;

end;

procedure TfrmVCHTest.cbbCommandOpenAppSelect(Sender: TObject);
begin
  case TEdit(Sender).Tag of
    1:
    begin
      if cbbCommandCloseApp.Text = 'Not activated' then
        TVCHElement(FElement).CommandClose := sacNotActivated
      else
        TVCHElement(FElement).CommandClose := sacActivated;
    end;
    2:
    begin
      if cbbCommandOpenApp.Text = 'Not activated' then
        TVCHElement(FElement).CommandOpen := sacNotActivated
      else
        TVCHElement(FElement).CommandOpen := sacActivated;
    end;
    3:
    begin
      if cbbCommandCloseHMI.Text = 'Not activated' then
        TVCHElement(FElement).CommandClose := sacNotActivated
      else
        TVCHElement(FElement).CommandClose := sacActivated;
    end;
    4:
    begin
      if cbbCommandOpenHMI.Text = 'Not activated' then
        TVCHElement(FElement).CommandOpen := sacNotActivated
      else
        TVCHElement(FElement).CommandOpen := sacActivated;
    end;
  end;
end;

procedure TfrmVCHTest.cbbRFUSelect(Sender: TObject);
begin
  if cbbRFU.Text = 'RFU' then
    TVCHElement(FElement).StateRFU := snrRFU
  else
    TVCHElement(FElement).StateRFU := snrNotRFU;
end;

procedure TfrmVCHTest.cbbStateElementDisabledSelect(Sender: TObject);
begin
  if cbbStateElementDisabled.Text = 'Disabled' then
    TVCHElement(FElement).StateElementDisabled := sdDisabled
  else
    TVCHElement(FElement).StateElementDisabled := sdEnabled;
end;

procedure TfrmVCHTest.cbbStateManualAutoSelect(Sender: TObject);
begin
  if cbbStateManualAuto.Text = 'Manual' then
    TVCHElement(FElement).StateAutoManual := smaManual
  else
    TVCHElement(FElement).StateAutoManual := smaAuto;
end;

procedure TfrmVCHTest.cbbStateSwitchClosedSelect(Sender: TObject);
begin
  if cbbStateSwitchClosed.Text = 'Closed' then
    TVCHElement(FElement).StateSwitchClosed := sscClosed
  else
    TVCHElement(FElement).StateSwitchClosed := sscNotClosed;
end;

procedure TfrmVCHTest.cbbStateSwitchOpenSelect(Sender: TObject);
begin
  if cbbStateSwitchOpen.Text = 'Open' then
    TVCHElement(FElement).StateSwitchOpen := ssoOpen
  else
    TVCHElement(FElement).StateSwitchOpen := ssoNotOpened;
end;

procedure TfrmVCHTest.cbbStateSwitchRemoteSelect(Sender: TObject);
begin
  if cbbStateSwitchRemote.Text = 'Local' then
    TVCHElement(FElement).StateSwitchRemote := ssrLocal
  else
    TVCHElement(FElement).StateSwitchRemote := ssrRemote;
end;

procedure TfrmVCHTest.edtTransKeyPress(Sender: TObject; var Key: Char);
var
  value : Integer;
begin
  if Key = #13 then begin

    TryStrToInt(TEdit(Sender).Text,value);

    case TEdit(Sender).Tag of
      1: TVCHElement(FElement).Parameters.GetParameter(epTTRANS).ParamDoubleValue := value;
      2: TVCHElement(FElement).Parameters.GetParameter(epTCDD).ParamDoubleValue := value;
      3: TVCHElement(FElement).Parameters.GetParameter(epTCTRL).ParamDoubleValue := value;
    end;
  end;
end;

procedure TfrmVCHTest.ElementPropertyChange(Sender: TObject; PropsID: E_PropsID;
  Value: Byte);
begin
  inherited;
  case PropsID of
    epElementAlarmChange    : cbbStateAlarm.Text := ElementAlarmStateToStr(E_StateAlarm(Value));
    epElementStateChange    : cbbStateElement.Text := ElementStateToStr(E_StateElement(Value));
    epElementDisabledChange : cbbStateElementDisabled.ItemIndex := Value;
    epStateSwitchOpenChange : cbbStateSwitchOpen.ItemIndex := Value;
    epStateSwitchCloseChange: cbbStateSwitchClosed.ItemIndex := Value;
    epStateSwitchRemoteChange : cbbStateSwitchRemote.ItemIndex := Value;
    epElementCommandCloseAppChange : cbbCommandCloseApp.ItemIndex := Value;
    epElementCommandOpenAppChange  : cbbCommandOpenApp.ItemIndex := Value;
    epElementCommandCloseHMIChange : cbbCommandCloseHMI.ItemIndex := Value;
    epElementCommandOpenHMIChange  : cbbCommandOpenHMI.ItemIndex := Value;
    epElementManualAutoChange : cbbStateManualAuto.ItemIndex := Value;
    epStateNoRFUChange  : cbbRFU.ItemIndex := Value;
  end;
end;

procedure TfrmVCHTest.ElementPropertyChange(Sender: TObject; PropsID: E_PropsID;
  Value: Double);
begin
  inherited;

end;

end.
