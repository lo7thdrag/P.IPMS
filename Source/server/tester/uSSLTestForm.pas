unit uSSLTestForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uElementTestForm, uDataType;

type
  TfrmSSLTest = class(TfrmElementTest)
    grpPlatformInterface: TGroupBox;
    grpInput: TGroupBox;
    edtValueSensor: TEdit;
    lbl1: TLabel;
    edtTrimValue: TEdit;
    edtCompensationSensor: TEdit;
    lbl2: TLabel;
    lbl3: TLabel;
    grpIPMSInterface: TGroupBox;
    grpInput2: TGroupBox;
    grpOutput2: TGroupBox;
    cbbStateElementDisabled: TComboBox;
    lbl4: TLabel;
    cbbStateInhibited: TComboBox;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    edtValueElement: TEdit;
    lbl8: TLabel;
    edtValueElementLevel: TEdit;
    edtValueElementM3: TEdit;
    edtValueElementMass: TEdit;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    grpParameters: TGroupBox;
    edtSG: TEdit;
    lbl12: TLabel;
    edtTau: TEdit;
    edtHAV: TEdit;
    edtHYHA: TEdit;
    edtHYLA: TEdit;
    edtLAV: TEdit;
    edtTHA: TEdit;
    edtTLA: TEdit;
    edtTOORL: TEdit;
    edtTOORH: TEdit;
    edtV4: TEdit;
    edtV20: TEdit;
    edtSenOff: TEdit;
    edtTnkCntMax: TEdit;
    lbl13: TLabel;
    lbl14: TLabel;
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
    edtStateAlarm: TEdit;
    edtStateElement: TEdit;
    lbl26: TLabel;
    lbl27: TLabel;
    procedure edtSGKeyPress(Sender: TObject; var Key: Char);
    procedure cbbStateElementDisabledSelect(Sender: TObject);
    procedure cbbStateInhibitedSelect(Sender: TObject);
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
  frmSSLTest: TfrmSSLTest;

implementation

uses uSSL, uListener, uFunction;

{$R *.dfm}

procedure TfrmSSLTest.ApplyElement;
begin
  inherited;

  if FElement is TSSLElement then
  begin
    with TSSLElement(FElement) do begin

    {input}
      case StateElementDisabled of
        sdDisabled  : cbbStateElementDisabled.ItemIndex := 0;
        sdEnabled   : cbbStateElementDisabled.ItemIndex := 1;
      end;

      case StateInhibited of
        siInhibited   : cbbStateInhibited.ItemIndex := 0;
        siNotInhibited: cbbStateInhibited.ItemIndex := 1;
      end;

      edtValueSensor.Text := FloatToStr(ValueSensor);
      edtTrimValue.Text   := FloatToStr(TrimValue);
      edtCompensationSensor.Text := FloatToStr(CompensationSensor);

    {parameter}
      edtSG.Text    := FloatToStr(Parameters.GetParameter(epSG).ParamDoubleValue);
      edtTau.Text   := FloatToStr(Parameters.GetParameter(epTAU).ParamDoubleValue);
      edtHAV.Text   := FloatToStr(Parameters.GetParameter(epHAV).ParamDoubleValue);
      edtHYHA.Text  := FloatToStr(Parameters.GetParameter(epHYHA).ParamDoubleValue);
      edtHYLA.Text  := FloatToStr(Parameters.GetParameter(epHYLA).ParamDoubleValue);
      edtLAV.Text   := FloatToStr(Parameters.GetParameter(epLAV).ParamDoubleValue);
      edtTHA.Text   := FloatToStr(Parameters.GetParameter(epTHA).ParamDoubleValue);
      edtTLA.Text   := FloatToStr(Parameters.GetParameter(epTLA).ParamDoubleValue);
      edtTOORL.Text := FloatToStr(Parameters.GetParameter(epTOORL).ParamDoubleValue);
      edtTOORH.Text := FloatToStr(Parameters.GetParameter(epTOORH).ParamDoubleValue);
      edtV4.Text    := FloatToStr(Parameters.GetParameter(epV4).ParamDoubleValue);
      edtV20.Text   := FloatToStr(Parameters.GetParameter(epV20).ParamDoubleValue);

//      edtSenOff.Text := FloatToStr(LengthMax);
//      edtTnkCntMax.Text := FloatToStr(TankMax);

    {output}
      edtStateAlarm.Text   := ElementAlarmStateToStr(StateAlarm);
      edtStateElement.Text := ElementStateToStr(StateElement);
      edtValueElement.Text := FloatToStr(ValueElement);
      edtValueElementLevel.Text:= FloatToStr(ValueElementLevel);
      edtValueElementM3.Text   := FloatToStr(ValueElementM3);
      edtValueElementMass.Text := FloatToStr(ValueElementMass);    end;
  end;
end;

procedure TfrmSSLTest.cbbStateElementDisabledSelect(Sender: TObject);
begin
  inherited;

  if cbbStateElementDisabled.Text = 'Disabled' then
    TSSLElement(FElement).StateElementDisabled := sdDisabled
  else if cbbStateElementDisabled.Text = 'Enabled' then
    TSSLElement(FElement).StateElementDisabled := sdEnabled;
end;

procedure TfrmSSLTest.cbbStateInhibitedSelect(Sender: TObject);
begin
  inherited;

  if cbbStateInhibited.Text = 'Inhibited' then
    TSSLElement(FElement).StateInhibited := siInhibited
  else if cbbStateInhibited.Text = 'Not inhibited' then
    TSSLElement(FElement).StateInhibited := siNotInhibited;
end;

procedure TfrmSSLTest.edtSGKeyPress(Sender: TObject; var Key: Char);
var
  value : Double;
begin
  if not (key in['0'..'9', #8, #13, #46]) then
    key := #0;

  if Key = #13 then begin

    TryStrToFloat(TEdit(Sender).Text,value);

    case TEdit(Sender).Tag of
      1 : TSSLElement(FElement).Parameters.GetParameter(epSG).ParamDoubleValue := value;
      2 : TSSLElement(FElement).Parameters.GetParameter(epTAU).ParamDoubleValue := value;
      3 : TSSLElement(FElement).Parameters.GetParameter(epHAV).ParamDoubleValue := value;
      4 : TSSLElement(FElement).Parameters.GetParameter(epHYHA).ParamDoubleValue := value;
      5 : TSSLElement(FElement).Parameters.GetParameter(epHYLA).ParamDoubleValue := value;
      6 : TSSLElement(FElement).Parameters.GetParameter(epLAV).ParamDoubleValue := value;
      7 : TSSLElement(FElement).Parameters.GetParameter(epTHA).ParamDoubleValue := value;
      8 : TSSLElement(FElement).Parameters.GetParameter(epTLA).ParamDoubleValue := value;
      9 : TSSLElement(FElement).Parameters.GetParameter(epTOORL).ParamDoubleValue := value;
      10: TSSLElement(FElement).Parameters.GetParameter(epTOORH).ParamDoubleValue := value;
      11: TSSLElement(FElement).Parameters.GetParameter(epV4).ParamDoubleValue := value;
      12: TSSLElement(FElement).Parameters.GetParameter(epV20).ParamDoubleValue := value;
//      13: TSSLElement(FElement).Parameters.GetParameter(epSENOFF).ParamDoubleValue := value;
//      14: TSSLElement(FElement).Parameters.GetParameter(epTnkCntMax).ParamDoubleValue := value;
      31: TSSLElement(FElement).ValueSensor := value;
      32: TSSLElement(FElement).TrimValue := value;
      33: TSSLElement(FElement).CompensationSensor := value;
    end;
  end;

//  TSSLElement(FElement).AlarmElementStateCalc;
end;

procedure TfrmSSLTest.ElementPropertyChange(Sender: TObject; PropsID: E_PropsID;
  Value: Byte);
begin
  inherited;

  case PropsID of
    epElementAlarmChange    : edtStateAlarm.Text := ElementAlarmStateToStr(E_StateAlarm(Value));
    epElementStateChange    : edtStateElement.Text := ElementStateToStr(E_StateElement(Value));
    epElementDisabledChange : cbbStateElementDisabled.ItemIndex := Value;
    epElementAlrmInhibited  : cbbStateInhibited.ItemIndex := Value;
  end;
end;

procedure TfrmSSLTest.ElementPropertyChange(Sender: TObject; PropsID: E_PropsID;
  Value: Double);
begin
  inherited;

  case PropsID of
    epElementValueSensorChange : edtValueSensor.Text := FloatToStr(Value);
    epElementTrimValueChange   : edtTrimValue.Text := FloatToStr(Value);
    epElementCompensationSensorChange : edtCompensationSensor.Text := FloatToStr(Value);

    epValElementPercentChange : edtValueElement.Text := FloatToStr(Value);
    epValElementMChange: edtValueElementLevel.Text := FloatToStr(Value);
    epValElementM3Change   : edtValueElementM3.Text := FloatToStr(Value);
    epValElementMassChange : edtValueElementMass.Text := FloatToStr(Value);
  end;
end;

end.
