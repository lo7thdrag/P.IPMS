unit uSS2TestForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uElementTestForm, uDataType;

type
  TfrmSS2Test = class(TfrmElementTest)
    grpInput: TGroupBox;
    grpOutput: TGroupBox;
    grpParameters: TGroupBox;
    cbbStateElementDisabled: TComboBox;
    lbl1: TLabel;
    edtValueApplication: TEdit;
    cbbStateAlarmInhibited: TComboBox;
    cbbStateDisplayStationary: TComboBox;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    edtValueElement: TEdit;
    edtValueApplicationOutput: TEdit;
    edtHAV: TEdit;
    lbl9: TLabel;
    edtHHAV: TEdit;
    edtXHAV: TEdit;
    edtHY: TEdit;
    edtTA: TEdit;
    edtSTA: TEdit;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    edtStateAlarm: TEdit;
    edtStateElement: TEdit;
    procedure edtValueApplicationKeyPress(Sender: TObject; var Key: Char);
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
  frmSS2Test: TfrmSS2Test;

implementation

uses uSS2, uFunction, uListener;

{$R *.dfm}

procedure TfrmSS2Test.ApplyElement;
begin
  inherited;

  if FElement is TSS2Element then
  begin

    with TSS2Element(FElement) do
    begin

    {input}
      case StateElementDisabled of
        sdDisabled : cbbStateElementDisabled.ItemIndex := 0;
        sdEnabled  : cbbStateElementDisabled.ItemIndex := 1;
      end;

      case StateAlarmInhibited of
        siInhibited   : cbbStateAlarmInhibited.ItemIndex := 0;
        siNotInhibited: cbbStateAlarmInhibited.ItemIndex := 1;
      end;

      case StateDisplayStationary of
        ssDispStationary : cbbStateDisplayStationary.ItemIndex := 0;
        ssDispElement : cbbStateDisplayStationary.ItemIndex := 1;
      end;

      edtValueApplication.Text := FloatToStr(ValueApplication);

    {parameter}
      edtHAV.Text  := FloatToStr(Parameters.GetParameter(epHAV).ParamDoubleValue);
      edtHHAV.Text := FloatToStr(Parameters.GetParameter(epHHAV).ParamDoubleValue);
      edtXHAV.Text := FloatToStr(Parameters.GetParameter(epXHAV).ParamDoubleValue);
      edtHY.Text   := FloatToStr(Parameters.GetParameter(epHY).ParamDoubleValue);
      edtTA.Text   := FloatToStr(Parameters.GetParameter(epTA).ParamDoubleValue);
      edtSTA.Text  := FloatToStr(Parameters.GetParameter(epSTA).ParamDoubleValue);

    {output}
      edtStateAlarm.Text := ElementAlarmStateToStr(StateAlarm);
      edtStateElement.Text := ElementStateToStr(StateElement);
      edtValueElement.Text := FloatToStr(ValueElement);
      edtValueApplication.Text := FloatToStr(ValueApplication);
    end;
  end;
end;

procedure TfrmSS2Test.cbbStateAlarmInhibitedSelect(Sender: TObject);
begin
  inherited;

  if cbbStateAlarmInhibited.Text = 'Not inhibited' then
    TSS2Element(FElement).StateAlarmInhibited := siNotInhibited
  else if cbbStateAlarmInhibited.Text = 'Inhibited' then
    TSS2Element(FElement).StateAlarmInhibited := siInhibited;
end;

procedure TfrmSS2Test.cbbStateDisplayStationarySelect(Sender: TObject);
begin
  inherited;

  if cbbStateDisplayStationary.Text = 'Display stationary value' then
    TSS2Element(FElement).StateDisplayStationary := ssDispStationary
  else if cbbStateDisplayStationary.Text = 'Display sensor value (scaled)' then
    TSS2Element(FElement).StateDisplayStationary := ssDispElement;
end;

procedure TfrmSS2Test.cbbStateElementDisabledSelect(Sender: TObject);
begin
  inherited;

  if cbbStateElementDisabled.Text = 'Disabled' then
    TSS2Element(FElement).StateElementDisabled := sdDisabled
  else if cbbStateElementDisabled.Text = 'Enabled' then
    TSS2Element(FElement).StateElementDisabled := sdEnabled;
end;

procedure TfrmSS2Test.edtHAVKeyPress(Sender: TObject; var Key: Char);
var
  Value : integer;
begin
  inherited;

  if key = #13 then
  begin
    TryStrToInt(TEdit(sender).Text, Value);

    case TEdit(sender).Tag of
      1 : TSS2Element(FElement).Parameters.GetParameter(epHAV).ParamDoubleValue := Value;
      2 : TSS2Element(FElement).Parameters.GetParameter(epHHAV).ParamDoubleValue := Value;
      3 : TSS2Element(FElement).Parameters.GetParameter(epXHAV).ParamDoubleValue := Value;
      4 : TSS2Element(FElement).Parameters.GetParameter(epHY).ParamDoubleValue := Value;
      5 : TSS2Element(FElement).Parameters.GetParameter(epTA).ParamDoubleValue := Value;
      6 : TSS2Element(FElement).Parameters.GetParameter(epSTA).ParamDoubleValue := Value;
    end;
  end;
end;

procedure TfrmSS2Test.edtValueApplicationKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;

  if key = #13 then
    TSS2Element(FElement).ValueApplication := StrToInt(edtValueApplication.Text);
end;

procedure TfrmSS2Test.ElementPropertyChange(Sender: TObject; PropsID: E_PropsID;
  Value: Byte);
begin
  inherited;

  case PropsID of
    epElementAlarmChange : edtStateAlarm.Text := ElementAlarmStateToStr(E_StateAlarm(Value));
    epElementStateChange : edtStateAlarm.Text := ElementStateToStr(E_StateElement(Value));
    epElementDisabledChange : cbbStateElementDisabled.ItemIndex := Value;
    epElementAlrmInhibited :  cbbStateAlarmInhibited.ItemIndex := Value;
    epElementStateDisplayChange : cbbStateDisplayStationary.ItemIndex := Value;

  end;
end;

procedure TfrmSS2Test.ElementPropertyChange(Sender: TObject; PropsID: E_PropsID;
  Value: Double);
begin
  inherited;

  case PropsID of
    epElementValueAppChange : edtValueApplication.Text := FloatToStr(Value);
    epElementValueElmntChange : edtValueElement.Text := FloatToStr(Value);
    epElementValueAppOutChange : edtValueApplicationOutput.Text := FloatToStr(Value);
  end;
end;

end.
