unit uSAETestForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uElementTestForm, uDataType;

type
  TfrmSAETest = class(TfrmElementTest)
    grpInput: TGroupBox;
    lbl1: TLabel;
    cbbStateElementDisabled: TComboBox;
    cbbStateDisplayStationary: TComboBox;
    cbbStateAlarmInhibited: TComboBox;
    cbbStateValueValid: TComboBox;
    cbbStateWireBreak: TComboBox;
    cbbStateLowAlarm: TComboBox;
    cbbStateHighAlarm: TComboBox;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    edtValueApplication: TEdit;
    grpOutput: TGroupBox;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    edtValueElement: TEdit;
    grpParameters: TGroupBox;
    lbl13: TLabel;
    lbl14: TLabel;
    edtSF: TEdit;
    edtSTA: TEdit;
    cbbStateHighHighAlarm: TComboBox;
    edtStateAlarm: TEdit;
    edtStateElement: TEdit;
    procedure cbbStateElementDisabledSelect(Sender: TObject);
    procedure cbbStateDisplayStationarySelect(Sender: TObject);
    procedure cbbStateAlarmInhibitedSelect(Sender: TObject);
    procedure cbbStateValueValidSelect(Sender: TObject);
    procedure cbbStateWireBreakSelect(Sender: TObject);
    procedure cbbStateHighAlarmSelect(Sender: TObject);
    procedure edtValueApplicationKeyPress(Sender: TObject; var Key: Char);
    procedure cbbStateLowAlarmSelect(Sender: TObject);
    procedure cbbStateHighhighAlarmSelect(Sender: TObject);
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
  frmSAETest: TfrmSAETest;

implementation

uses uSAE, uListener, uFunction;

{$R *.dfm}

procedure TfrmSAETest.ApplyElement;
begin
  inherited;

  if FElement is TSAEElement then
  begin

    with TSAEElement(FElement) do
    begin

    {input}
      case StateElementDisabled of
        sdDisabled : cbbStateElementDisabled.ItemIndex := 0;
        sdEnabled  : cbbStateElementDisabled.ItemIndex := 1;
      end;

      case StateDisplayStationary of
        ssDispStationary : cbbStateDisplayStationary.ItemIndex := 0;
        ssDispElement    : cbbStateDisplayStationary.ItemIndex := 1;
      end;

      case StateAlarmInhibited of
        siInhibited    : cbbStateAlarmInhibited.ItemIndex := 0;
        siNotInhibited : cbbStateAlarmInhibited.ItemIndex := 1;
      end;

      case StateValueValid of
        svValid   : cbbStateValueValid.ItemIndex := 0;
        svInvalid : cbbStateValueValid.ItemIndex := 1;
      end;

      case StateWireBreak of
        swbWireBreak   : cbbStateWireBreak.ItemIndex := 0;
        swbNoWireBreak : cbbStateWireBreak.ItemIndex := 1;
      end;

      case StateHA of
        shaHighAlarm : cbbStateHighAlarm.ItemIndex := 0;
        shaNoAlarm   : cbbStateHighAlarm.ItemIndex := 1;
      end;

      case StateLA of
        slaLowAlarm : cbbStateLowAlarm.ItemIndex := 0;
        slaNoAlarm  : cbbStateLowAlarm.ItemIndex := 1;
      end;

      case StateHHA of
        shhHighHighAlarm : cbbStateHighhighAlarm.ItemIndex := 0;
        shhNoAlarm       : cbbStateHighHighAlarm.ItemIndex := 1;
      end;

      edtValueApplication.Text := FloatToStr(ValueApplication);

    {parameter}
      edtSF.Text := FloatToStr(Parameters.GetParameter(epSF).ParamDoubleValue);
      edtSTA.Text := FloatToStr(Parameters.GetParameter(epSTA).ParamDoubleValue);

    {output}
      edtValueElement.Text := FloatToStr(ValueElement);
      edtStateElement.Text := ElementStateToStr(StateElement);
      edtStateAlarm.Text := ElementAlarmStateToStr(StateAlarm);
    end;
  end;
end;

procedure TfrmSAETest.cbbStateAlarmInhibitedSelect(Sender: TObject);
begin
  inherited;

  if cbbStateAlarmInhibited.Text = 'Inhibited' then
    TSAEElement(FElement).StateAlarmInhibited := siInhibited
  else if cbbStateAlarmInhibited.Text = 'Not inhibited' then
    TSAEElement(FElement).StateAlarmInhibited := siNotInhibited;

end;

procedure TfrmSAETest.cbbStateDisplayStationarySelect(Sender: TObject);
begin
  inherited;

  if cbbStateDisplayStationary.Text = 'Display stationary value' then
    TSAEElement(FElement).StateDisplayStationary := ssDispStationary
  else if cbbStateDisplayStationary.Text = 'Display value element' then
    TSAEElement(FElement).StateDisplayStationary := ssDispElement;

end;

procedure TfrmSAETest.cbbStateElementDisabledSelect(Sender: TObject);
begin
  inherited;

  if cbbStateElementDisabled.Text = 'Disabled' then
    TSAEElement(FElement).StateElementDisabled := sdDisabled
  else if cbbStateElementDisabled.Text = 'Enabled' then
    TSAEElement(FElement).StateElementDisabled := sdEnabled;

end;

procedure TfrmSAETest.cbbStateHighAlarmSelect(Sender: TObject);
begin
  inherited;

  if cbbStateHighAlarm.Text = 'High alarm' then
    TSAEElement(FElement).StateHA := shaHighAlarm
  else if cbbStateHighAlarm.Text = 'No alarm' then
    TSAEElement(FElement).StateHA := shaNoAlarm;
end;

procedure TfrmSAETest.cbbStateHighhighAlarmSelect(Sender: TObject);
begin
  inherited;

  if cbbStateHighhighAlarm.Text = 'Highhigh alarm' then
    TSAEElement(FElement).StateHHA := shhHighHighAlarm
  else if cbbStateHighhighAlarm.Text = 'No alarm' then
    TSAEElement(FElement).StateHHA := shhNoAlarm;

end;

procedure TfrmSAETest.cbbStateLowAlarmSelect(Sender: TObject);
begin
  inherited;

  if cbbStateLowAlarm.Text = 'Low alarm' then
    TSAEElement(FElement).StateLA := slaLowAlarm
  else if cbbStateLowAlarm.Text = 'No alarm' then
    TSAEElement(FElement).StateLA := slaNoAlarm;

end;

procedure TfrmSAETest.cbbStateValueValidSelect(Sender: TObject);
begin
  inherited;

  if cbbStateValueValid.Text = 'Valid' then
    TSAEElement(FElement).StateValueValid := svValid
  else if cbbStateValueValid.Text = 'Invalid' then
    TSAEElement(FElement).StateValueValid := svInvalid;

end;

procedure TfrmSAETest.cbbStateWireBreakSelect(Sender: TObject);
begin
  inherited;

  if cbbStateWireBreak.Text = 'Wire break' then
    TSAEElement(FElement).StateWireBreak := swbWireBreak
  else if cbbStateWireBreak.Text = 'No wire break' then
    TSAEElement(FElement).StateWireBreak := swbNoWireBreak;

end;

procedure TfrmSAETest.edtValueApplicationKeyPress(Sender: TObject;
  var Key: Char);
var
  val: Double;
begin
  inherited;

  if not (key in['0'..'9', #8, #13, #46]) then
    key := #0;

  if Key = #13 then
  begin

    TryStrToFloat(TEdit(Sender).Text, val);

    case TEdit(Sender).tag of
      1: TSAEElement(FElement).ValueApplication := val;
      2: TSAEElement(FElement).Parameters.GetParameter(epSF).ParamDoubleValue := val;
      3: TSAEElement(FElement).Parameters.GetParameter(epSTA).ParamDoubleValue := val;
    end;
  end;

//  FElement.AlarmElementStateCalc;
end;

procedure TfrmSAETest.ElementPropertyChange(Sender: TObject; PropsID: E_PropsID;
  Value: Byte);
begin
  inherited;

  case PropsID of
    epElementAlarmChange        : edtStateAlarm.Text := ElementAlarmStateToStr(E_StateAlarm(Value));
    epElementStateChange        : edtStateElement.Text := ElementStateToStr(E_StateElement(Value));
    epElementDisabledChange     : cbbStateElementDisabled.ItemIndex := Value;
    epElementStateDisplayChange : cbbStateDisplayStationary.ItemIndex := Value;
    epElementAlrmInhibited      : cbbStateAlarmInhibited.ItemIndex := Value;
    epElementValidChange        : cbbStateValueValid.ItemIndex := Value;
    epElementWireBreakChange    : cbbStateWireBreak.ItemIndex := Value;
    epElementLowChange          : cbbStateLowAlarm.ItemIndex := Value;
    epElementHighChange         : cbbStateHighAlarm.ItemIndex := Value;
    epElementHighHighChange     : cbbStateHighHighAlarm.ItemIndex := Value;
  end;
end;

procedure TfrmSAETest.ElementPropertyChange(Sender: TObject; PropsID: E_PropsID;
  Value: Double);
begin
  inherited;

  case PropsID of
    epElementValueAppChange : edtValueApplication.Text := FloatToStr(Value);
    epElementValueElmntChange : edtValueElement.Text := FloatToStr(Value);
  end;
end;

end.
