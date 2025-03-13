unit uSS1TestForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uElementTestForm, uDataType, uSSETestForm;

type
  TfrmSS1Test = class(TfrmElementTest)
    grpPlatformInterface: TGroupBox;
    edtValueSensor: TEdit;
    grpInput: TGroupBox;
    lbl1: TLabel;
    grpIPMSInterface: TGroupBox;
    grpInput2: TGroupBox;
    grpOutput2: TGroupBox;
    grpParameters: TGroupBox;
    cbbStateElementDisabled: TComboBox;
    lbl2: TLabel;
    cbbStateAlarmInhibited: TComboBox;
    cbbStateDisplayStationary: TComboBox;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    edtValueElement: TEdit;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    edtvalueApplication: TEdit;
    edtHAV: TEdit;
    lbl9: TLabel;
    edtHHAV: TEdit;
    edtXHAV: TEdit;
    edtHY: TEdit;
    edtTA: TEdit;
    edtTOORL: TEdit;
    edtTOORH: TEdit;
    edtV20: TEdit;
    edtV4: TEdit;
    edtSTA: TEdit;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl18: TLabel;
    edtStateElement: TEdit;
    edtStateAlarm: TEdit;
    lbl19: TLabel;
    procedure cbbStateElementDisabledSelect(Sender: TObject);
    procedure cbbStateAlarmInhibitedSelect(Sender: TObject);
    procedure cbbStateDisplayStationarySelect(Sender: TObject);
    procedure edtHAVKeyPress(Sender: TObject; var Key: Char);
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
  frmSS1Test: TfrmSS1Test;

implementation

uses uSS1, uFunction, uListener;

{$R *.dfm}

procedure TfrmSS1Test.ApplyElement;
begin
  inherited;

  if FElement is TSS1Element then
  begin

    with TSS1Element(FElement) do
    begin

    {input}
      case StateElementDisabled of
        sdDisabled: cbbStateElementDisabled.ItemIndex := 0;
        sdEnabled : cbbStateElementDisabled.ItemIndex := 1;
      end;

      case StateAlarmInhibited of
        siInhibited   : cbbStateAlarmInhibited.ItemIndex := 0;
        siNotInhibited: cbbStateAlarmInhibited.ItemIndex := 1;
      end;

      case StateDisplayStationary of
        ssDispStationary: cbbStateDisplayStationary.ItemIndex := 0;
        ssDispElement   : cbbStateDisplayStationary.ItemIndex := 1;
      end;

      edtValueSensor.Text := FloatToStr(ValueSensor);

    {parameter}
      edtHAV.Text   := FloatToStr(Parameters.GetParameter(epHAV).ParamDoubleValue);
      edtHHAV.Text  := FloatToStr(Parameters.GetParameter(epHHAV).ParamDoubleValue);
      edtXHAV.Text  := FloatToStr(Parameters.GetParameter(epXHAV).ParamDoubleValue);
      edtHY.Text    := FloatToStr(Parameters.GetParameter(epHY).ParamDoubleValue);
      edtTA.Text    := FloatToStr(Parameters.GetParameter(epTA).ParamDoubleValue);
      edtTOORL.Text := FloatToStr(Parameters.GetParameter(epTOORL).ParamDoubleValue);
      edtTOORH.Text := FloatToStr(Parameters.GetParameter(epTOORH).ParamDoubleValue);
      edtV20.Text   := FloatToStr(Parameters.GetParameter(epV20).ParamDoubleValue);
      edtV4.Text    := FloatToStr(Parameters.GetParameter(epV4).ParamDoubleValue);
      edtSTA.Text   := FloatToStr(Parameters.GetParameter(epSTA).ParamDoubleValue);

    {output}
      edtStateAlarm.Text := ElementAlarmStateToStr(StateAlarm);
      edtStateElement.Text := ElementStateToStr(StateElement);
      edtValueElement.Text := FloatToStr(ValueElement);
      edtvalueApplication.Text := FloatToStr(ValueApplication);
    end;
  end;
end;

procedure TfrmSS1Test.cbbStateAlarmInhibitedSelect(Sender: TObject);
begin
  inherited;
  if cbbStateAlarmInhibited.Text = 'Inhibited' then
    TSS1Element(FElement).StateAlarmInhibited := siInhibited
  else if cbbStateAlarmInhibited.Text = 'Not inhibited' then
    TSS1Element(FElement).StateAlarmInhibited := siNotInhibited
end;

procedure TfrmSS1Test.cbbStateDisplayStationarySelect(Sender: TObject);
begin
  inherited;
  if cbbStateDisplayStationary.Text = 'Display stationary value' then
    TSS1Element(FElement).StateDisplayStationary := ssDispStationary
  else if cbbStateDisplayStationary.Text = 'Display sensor value (scaled)' then
    TSS1Element(FElement).StateDisplayStationary := ssDispElement;
end;

procedure TfrmSS1Test.cbbStateElementDisabledSelect(Sender: TObject);
begin
  inherited;
  if cbbStateElementDisabled.Text = 'Disabled' then
    TSS1Element(FElement).StateElementDisabled := sdDisabled
  else if cbbStateElementDisabled.Text = 'Enabled' then
    TSS1Element(FElement).StateElementDisabled := sdEnabled;

end;

procedure TfrmSS1Test.edtHAVKeyPress(Sender: TObject; var Key: Char);
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
      1: TSS1Element(FElement).Parameters.GetParameter(epHAV).ParamDoubleValue := Value;
      2: TSS1Element(FElement).Parameters.GetParameter(epHHAV).ParamDoubleValue := Value;
      3: TSS1Element(FElement).Parameters.GetParameter(epXHAV).ParamDoubleValue := Value;
      4: TSS1Element(FElement).Parameters.GetParameter(epHY).ParamDoubleValue := Value;
      5: TSS1Element(FElement).Parameters.GetParameter(epTA).ParamDoubleValue := Value;
      6: TSS1Element(FElement).Parameters.GetParameter(epTOORL).ParamDoubleValue := Value;
      7: TSS1Element(FElement).Parameters.GetParameter(epTOORH).ParamDoubleValue := Value;
      8: TSS1Element(FElement).Parameters.GetParameter(epV20).ParamDoubleValue := Value;
      9: TSS1Element(FElement).Parameters.GetParameter(epV4).ParamDoubleValue := Value;
      10: TSS1Element(FElement).Parameters.GetParameter(epSTA).ParamDoubleValue := Value;
      11: TSS1Element(FElement).ValueSensor := Value;
    end;
  end;

//  TSS1Element(FElement).AlarmElementStateCalc;
end;

procedure TfrmSS1Test.ElementPropertyChange(Sender: TObject; PropsID: E_PropsID;
  Value: Byte);
begin
  inherited;

  case PropsID of
    epElementAlarmChange : edtStateAlarm.Text := ElementAlarmStateToStr(E_StateAlarm(Value));
    epElementStateChange : edtStateElement.Text := ElementStateToStr(E_StateElement(Value));
    epElementDisabledChange : cbbStateElementDisabled.ItemIndex := Value;
    epElementAlrmInhibited : cbbStateAlarmInhibited.ItemIndex := Value;
    epElementStateDisplayChange : cbbStateDisplayStationary.ItemIndex := Value;
  end;
end;

procedure TfrmSS1Test.ElementPropertyChange(Sender: TObject; PropsID: E_PropsID;
  Value: Double);
begin
  inherited;

  case PropsID of
    epElementValueSensorChange : edtValueSensor.Text := FloatToStr(Value);
    epElementValueElmntChange   : edtValueElement.Text := FloatToStr(Value);
    epElementValueAppChange    : edtvalueApplication.Text := FloatToStr(Value);
  end;
end;

end.
