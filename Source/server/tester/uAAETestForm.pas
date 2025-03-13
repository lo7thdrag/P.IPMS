unit uAAETestForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uElement, uElementTestForm, StdCtrls, uDataType;

type
  TfrmAAETest = class(TfrmElementTest)
    grpInput: TGroupBox;
    lblStateValid: TLabel;
    lblStateWire: TLabel;
    lblStateElmDisable: TLabel;
    lblStateAlarmInhibited: TLabel;
    lblStateDispStat: TLabel;
    lblValueApp: TLabel;
    edtValueApp: TEdit;
    cbbStateValid: TComboBox;
    cbbStateWire: TComboBox;
    cbbStateElmDisable: TComboBox;
    cbbAlarmInhibited: TComboBox;
    cbbStateDispStat: TComboBox;
    grpOutput: TGroupBox;
    lblStateAlarm: TLabel;
    lblStateElement: TLabel;
    lblValueHMI: TLabel;
    lblValueElement: TLabel;
    edtStateAlarm: TEdit;
    edtStateElement: TEdit;
    edtValueHMI: TEdit;
    edtValueElement: TEdit;
    lblHav: TLabel;
    edtHAV: TEdit;
    lblLAV: TLabel;
    edtLAV: TEdit;
    lblHYHA: TLabel;
    edtHYHA: TEdit;
    lblHYLA: TLabel;
    edtHYLA: TEdit;
    lblTHA: TLabel;
    edtTHA: TEdit;
    lblTLA: TLabel;
    edtTLA: TEdit;
    lblSF: TLabel;
    edtSF: TEdit;
    lblSTA: TLabel;
    edtSTA: TEdit;
    procedure cbbStateValidSelect(Sender: TObject);
    procedure cbbStateWireSelect(Sender: TObject);
    procedure cbbStateElmDisableSelect(Sender: TObject);
    procedure cbbAlarmInhibitedSelect(Sender: TObject);
    procedure cbbStateDispStatSelect(Sender: TObject);
    procedure edtValueAppKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  protected
    procedure ApplyElement; override;
    procedure ElementPropertyChange(Sender: TObject; PropsID: E_PropsID;
      Value: Byte); overload; override;
    procedure ElementPropertyChange(Sender: TObject; PropsID: E_PropsID;
      Value: Double); overload; override;
  public
    { Public declarations }
  end;

var
  frmAAETest: TfrmAAETest;

implementation

uses
  uAAE, uListener, uFunction;

{$R *.dfm}

{ TfrmAAETest }

procedure TfrmAAETest.ApplyElement;
begin
  inherited;

  if FElement is TAAEElement then
  begin
    with TAAEElement(FElement) do
    begin
      case StateValid of
        svValid : cbbStateValid.ItemIndex := 0;
        svInvalid : cbbStateValid.ItemIndex := 1;
      end;

      case StateWireBreak of
        swbWireBreak : cbbStateWire.ItemIndex := 0;
        swbNoWireBreak : cbbStateWire.ItemIndex := 1;
      end;

      case StateElementDisabled of
        sdDisabled : cbbStateElmDisable.ItemIndex := 0;
        sdEnabled : cbbStateElmDisable.ItemIndex := 1;
      end;

      case StateAlarmInhibited of
        siInhibited : cbbAlarmInhibited.ItemIndex := 0;
        siNotInhibited : cbbAlarmInhibited.ItemIndex := 1;
      end;

      case StateDisplayStationary of
        ssDispStationary : cbbStateDispStat.ItemIndex := 0;
        ssDispElement : cbbStateDispStat.ItemIndex := 1;
      end;

      edtValueApp.Text := FloatToStr(ValueApplication);
      edtHAV.Text := FloatToStr(Parameters.GetParameter(epHAV).ParamDoubleValue);
      edtLAV.Text := FloatToStr(Parameters.GetParameter(epLAV).ParamDoubleValue);
      edtHYHA.Text := FloatToStr(Parameters.GetParameter(epHYHA).ParamDoubleValue);
      edtHYLA.Text := FloatToStr(Parameters.GetParameter(epHYLA).ParamDoubleValue);
      edtTHA.Text := FloatToStr(Parameters.GetParameter(epTHA).ParamDoubleValue);
      edtTLA.Text := FloatToStr(Parameters.GetParameter(epTLA).ParamDoubleValue);
      edtSF.Text := FloatToStr(Parameters.GetParameter(epSF).ParamDoubleValue);
      edtSTA.Text := FloatToStr(Parameters.GetParameter(epSTA).ParamDoubleValue);

      edtStateAlarm.Text := ElementAlarmStateToStr(StateAlarm);
      edtStateElement.Text := ElementStateToStr(StateElement);
      edtValueElement.Text := FloatToStr(ValueElement);
      edtValueHMI.Text := FloatToStr(ValueHMI);
    end;
  end;
end;

procedure TfrmAAETest.cbbAlarmInhibitedSelect(Sender: TObject);
begin
  if cbbAlarmInhibited.Text = 'Inhibited' then
    TAAEElement(FElement).StateAlarmInhibited := siInhibited
  else
    TAAEElement(FElement).StateAlarmInhibited := siNotInhibited;
end;

procedure TfrmAAETest.cbbStateDispStatSelect(Sender: TObject);
begin
  if cbbStateDispStat.Text = 'Display Stationary' then
    TAAEElement(FElement).StateDisplayStationary := ssDispStationary
  else
    TAAEElement(FElement).StateDisplayStationary := ssDispElement;
end;

procedure TfrmAAETest.cbbStateElmDisableSelect(Sender: TObject);
begin
  if cbbStateElmDisable.Text = 'Disabled' then
    TAAEElement(FElement).StateElementDisabled := sdDisabled
  else
    TAAEElement(FElement).StateElementDisabled := sdEnabled;
end;

procedure TfrmAAETest.cbbStateValidSelect(Sender: TObject);
begin
  if cbbStateValid.Text = 'Valid' then
    TAAEElement(FElement).StateValid := svValid
  else
    TAAEElement(FElement).StateValid := svInvalid;
end;

procedure TfrmAAETest.cbbStateWireSelect(Sender: TObject);
begin
  if cbbStateWire.Text = 'Wire Break' then
    TAAEElement(FElement).StateWireBreak := swbWireBreak
  else
    TAAEElement(FElement).StateWireBreak := swbNoWireBreak;
end;

procedure TfrmAAETest.edtValueAppKeyPress(Sender: TObject; var Key: Char);
var
  value : Double;
begin
  if not (key in['0'..'9', #8, #13, #46]) then
    key := #0;

  if Key = #13 then
  begin
    TryStrToFloat(TEdit(Sender).Text,value);

    case TEdit(Sender).Tag of
      1 : TAAEElement(FElement).ValueApplication := value;
      2 : TAAEElement(FElement).Parameters.GetParameter(epHAV).ParamDoubleValue := value;
      3 : TAAEElement(FElement).Parameters.GetParameter(epLAV).ParamDoubleValue := value;
      4 : TAAEElement(FElement).Parameters.GetParameter(epHYHA).ParamDoubleValue := value;
      5 : TAAEElement(FElement).Parameters.GetParameter(epHYLA).ParamDoubleValue := value;
      6 : TAAEElement(FElement).Parameters.GetParameter(epTHA).ParamDoubleValue := value;
      7 : TAAEElement(FElement).Parameters.GetParameter(epTLA).ParamDoubleValue := value;
      8 : TAAEElement(FElement).Parameters.GetParameter(epSF).ParamDoubleValue := value;
      9 : TAAEElement(FElement).Parameters.GetParameter(epSTA).ParamDoubleValue := value;
    end;

//    FElement.AlarmElementStateCalc;
  end;
end;

procedure TfrmAAETest.ElementPropertyChange(Sender: TObject; PropsID: E_PropsID;
  Value: Double);
begin
  inherited;

  case PropsID of
    epElementValueAppChange : edtValueApp.Text := FloatToStr(Value);
    epElementValueElmntChange : edtValueElement.Text := FloatToStr(Value);
    epElementHMISetChange : edtValueHMI.Text := FloatToStr(Value);
  end;
end;

procedure TfrmAAETest.ElementPropertyChange(Sender: TObject; PropsID: E_PropsID;
  Value: Byte);
begin
  inherited;

  case PropsID of
    epElementAlarmChange    : edtStateAlarm.Text := ElementAlarmStateToStr(E_StateAlarm(Value));
    epElementStateChange    : edtStateElement.Text := ElementStateToStr(E_StateElement(Value));
    epElementAlrmInhibited  : cbbAlarmInhibited.ItemIndex := Value;
    epElementStateDisplayChange: cbbStateDispStat.ItemIndex := Value;
    epElementDisabledChange : cbbStateElmDisable.ItemIndex := Value;
    epElementValidChange    : cbbStateValid.ItemIndex := Value;
    epElementWireBreakChange: cbbStateWire.ItemIndex := Value;
  end;
end;

end.
