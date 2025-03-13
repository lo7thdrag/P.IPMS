 unit uSSETestForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uElementTestForm, uDataType;

type
  TfrmSSETest = class(TfrmElementTest)
    grpPlatformInterface: TGroupBox;
    edtValueSensor: TEdit;
    lbl1: TLabel;
    grpIPMSInterface: TGroupBox;
    grpInput: TGroupBox;
    grpOutput: TGroupBox;
    cbbStateElementDisabled: TComboBox;
    lbl2: TLabel;
    cbbStateInhibited: TComboBox;
    cbbStateDisplayStationary: TComboBox;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    edtValueElement: TEdit;
    edtValueApplication: TEdit;
    grpParameters: TGroupBox;
    edtHAV: TEdit;
    lbl9: TLabel;
    edtLAV: TEdit;
    edtHYHA: TEdit;
    edtHYLA: TEdit;
    edtTHA: TEdit;
    edtTLA: TEdit;
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
    lbl19: TLabel;
    edtStateElement: TEdit;
    edtStateAlarm: TEdit;
    lbl20: TLabel;
    procedure edtValueSensorKeyPress(Sender: TObject; var Key: Char);
    procedure cbbStateElementDisabledSelect(Sender: TObject);
    procedure cbbStateInhibitedSelect(Sender: TObject);
    procedure cbbStateDisplayStationarySelect(Sender: TObject);
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
  frmSSETest: TfrmSSETest;

implementation

uses uSSE, uFunction, uListener;

{$R *.dfm}


{ TfrmSSETest }

procedure TfrmSSETest.ApplyElement;
begin
  inherited;

  if FElement is TSSEElement then
  begin

    with TSSEElement(FElement) do
    begin

    {input}
      case StateElementDisabled of
        sdDisabled : cbbStateElementDisabled.ItemIndex := 0;
        sdEnabled  : cbbStateElementDisabled.ItemIndex := 1;
      end;

      case StateInhibited of
        siInhibited    : cbbStateInhibited.ItemIndex := 0;
        siNotInhibited : cbbStateInhibited.ItemIndex := 1;
      end;

      case StateDisplayStationary of
        ssDispStationary : cbbStateDisplayStationary.ItemIndex := 0;
        ssDispElement    : cbbStateDisplayStationary.ItemIndex := 1;
      end;

      edtValueSensor.Text := FloatToStr(ValueSensor);

    {parameter}
      edtHAV.Text   := FloatToStr(Parameters.GetParameter(epHAV).ParamDoubleValue);
      edtLAV.Text   := FloatToStr(Parameters.GetParameter(epLAV).ParamDoubleValue);
      edtHYHA.Text  := FloatToStr(Parameters.GetParameter(epHYHA).ParamDoubleValue);
      edtHYLA.Text  := FloatToStr(Parameters.GetParameter(epHYLA).ParamDoubleValue);
      edtTHA.Text   := FloatToStr(Parameters.GetParameter(epTHA).ParamDoubleValue);
      edtTLA.Text   := FloatToStr(Parameters.GetParameter(epTLA).ParamDoubleValue);
      edtV20.Text   := FloatToStr(Parameters.GetParameter(epV20).ParamDoubleValue);
      edtV4.Text    := FloatToStr(Parameters.GetParameter(epV4).ParamDoubleValue);

      edtTOORL.Text := FloatToStr(Parameters.GetParameter(epTOORL).ParamDoubleValue);
      edtTOORH.Text := FloatToStr(Parameters.GetParameter(epTOORH).ParamDoubleValue);
      edtSTA.Text   := FloatToStr(Parameters.GetParameter(epSTA).ParamDoubleValue);

    {output}
      edtStateAlarm.Text := ElementAlarmStateToStr(StateAlarm);
      edtStateElement.Text := ElementStateToStr(StateElement);
      edtValueElement.Text := FloatToStr(ValueElement);
      edtValueApplication.Text := FloatToStr(ValueApplication);
    end;
  end;
end;

procedure TfrmSSETest.cbbStateDisplayStationarySelect(Sender: TObject);
begin
  inherited;

  if cbbStateDisplayStationary.Text = 'Display stationary value' then
    TSSEElement(FElement).StateDisplayStationary := ssDispStationary
  else if cbbStateDisplayStationary.Text = 'Display sensor value (scaled)' then
    TSSEElement(FElement).StateDisplayStationary := ssDispElement;
end;

procedure TfrmSSETest.cbbStateElementDisabledSelect(Sender: TObject);
begin
  inherited;

  if cbbStateElementDisabled.Text = 'Disabled' then
    TSSEElement(FElement).StateElementDisabled := sdDisabled
  else if cbbStateElementDisabled.Text = 'Enabled' then
    TSSEElement(FElement).StateElementDisabled := sdEnabled;

end;

procedure TfrmSSETest.cbbStateInhibitedSelect(Sender: TObject);
begin
  inherited;

  if cbbStateInhibited.Text = 'Inhibited' then
    TSSEElement(FElement).StateInhibited := siInhibited
  else if cbbStateInhibited.Text = 'Not inhibited' then
    TSSEElement(FElement).StateInhibited := siNotInhibited;

end;

procedure TfrmSSETest.edtValueSensorKeyPress(Sender: TObject; var Key: Char);
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
      1: TSSEElement(FElement).ValueSensor := val;
      2: TSSEElement(FElement).Parameters.GetParameter(epHAV).ParamDoubleValue := val;
      3: TSSEElement(FElement).Parameters.GetParameter(epLAV).ParamDoubleValue := val;
      4: TSSEElement(FElement).Parameters.GetParameter(epHYHA).ParamDoubleValue := val;
      5: TSSEElement(FElement).Parameters.GetParameter(epHYLA).ParamDoubleValue := val;
      6: TSSEElement(FElement).Parameters.GetParameter(epTHA).ParamDoubleValue := val;
      7: TSSEElement(FElement).Parameters.GetParameter(epTLA).ParamDoubleValue := val;
      8: TSSEElement(FElement).Parameters.GetParameter(epTOORL).ParamDoubleValue := val;
      9: TSSEElement(FElement).Parameters.GetParameter(epTOORH).ParamDoubleValue := val;
      10: TSSEElement(FElement).Parameters.GetParameter(epV20).ParamDoubleValue := val;
      11: TSSEElement(FElement).Parameters.GetParameter(epV4).ParamDoubleValue := val;
      12: TSSEElement(FElement).Parameters.GetParameter(epSTA).ParamDoubleValue := val;
    end;

  end;
end;

procedure TfrmSSETest.ElementPropertyChange(Sender: TObject; PropsID: E_PropsID;
  Value: Byte);
begin
  inherited;

  case PropsID of
    epElementAlarmChange : edtStateAlarm.Text := ElementAlarmStateToStr(E_StateAlarm(Value));
    epElementStateChange : edtStateElement.Text := ElementStateToStr(E_StateElement(Value));
    epElementDisabledChange : cbbStateElementDisabled.ItemIndex := Value;
    epElementAlrmInhibited : cbbStateInhibited.ItemIndex := Value;
    epElementStateDisplayChange : cbbStateDisplayStationary.ItemIndex := Value;
  end;
end;

procedure TfrmSSETest.ElementPropertyChange(Sender: TObject; PropsID: E_PropsID;
  Value: Double);
begin
  inherited;

  case PropsID of
    epElementValueSensorChange: edtValueSensor.Text := FloatToStr(Value);
    epElementValueElmntChange : edtValueElement.Text := FloatToStr(Value);
    epElementValueAppChange : edtValueApplication.Text := FloatToStr(Value);
  end;
end;

end.
