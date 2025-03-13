unit uSWNTestForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uElementTestForm, uDataType;

type
  TfrmSWNTest = class(TfrmElementTest)
    cbbStateSwitch: TComboBox;
    lbl1: TLabel;
    cbbStateAlarmInhibited: TComboBox;
    lbl2: TLabel;
    cbbEvaluateState: TComboBox;
    lbl3: TLabel;
    cbbStateElementDisabled: TComboBox;
    lbl4: TLabel;
    lbl5: TLabel;
    cbbStateAlarm: TComboBox;
    lbl6: TLabel;
    cbbStateElement: TComboBox;
    lbl7: TLabel;
    lbl8: TLabel;
    edtTdelay: TEdit;
    grpInput: TGroupBox;
    grpOutput: TGroupBox;
    grpParameters: TGroupBox;
    cbbMode: TComboBox;
    procedure cbbStateSwitchSelect(Sender: TObject);
    procedure cbbStateAlarmInhibitedSelect(Sender: TObject);
    procedure cbbEvaluateStateSelect(Sender: TObject);
    procedure cbbStateElementDisabledSelect(Sender: TObject);
    procedure cbbModeSelect(Sender: TObject);
    procedure edtTdelayKeyPress(Sender: TObject; var Key: Char);
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
  frmSWNTest: TfrmSWNTest;

implementation

uses uSWN, uFunction, uListener;
{$R *.dfm}

{ TfrmSWNTest }

procedure TfrmSWNTest.ApplyElement;
begin
  inherited;

  if FElement is TSWNElement then
  begin
    with TSWNElement(FElement) do begin

      case StateAlarmInhibited of
        siNotInhibited  : cbbStateAlarmInhibited.ItemIndex := 0;
        siInhibited     : cbbStateAlarmInhibited.ItemIndex := 1;
      end;

      case StateElementDisabled of
        sdDisabled  : cbbStateElementDisabled.ItemIndex := 0;
        sdEnabled   : cbbStateElementDisabled.ItemIndex := 1;
      end;

      if Mode = True then
        cbbMode.ItemIndex := 0
      else
        cbbMode.ItemIndex := 1;

      if StateSwitch = False then
        cbbStateSwitch.ItemIndex := 0
      else
        cbbStateSwitch.ItemIndex := 1;

      if Evaluate = False then
        cbbEvaluateState.ItemIndex := 0
      else
        cbbEvaluateState.ItemIndex := 1;

      edtTdelay.Text := FloatToStr(Parameters.GetParameter(epTDELAY).ParamDoubleValue);

      cbbStateAlarm.Text   := ElementAlarmStateToStr(StateAlarm);
      cbbStateElement.Text := ElementStateToStr(StateElement);
    end;

  end;
end;

procedure TfrmSWNTest.cbbEvaluateStateSelect(Sender: TObject);
begin
  if cbbEvaluateState.Text = 'False' then
    TSWNElement(FElement).Evaluate := False
  else
    TSWNElement(FElement).Evaluate := True;
end;

procedure TfrmSWNTest.cbbModeSelect(Sender: TObject);
begin
  if cbbMode.Text = 'Alarm' then
    TSWNElement(FElement).Mode := True
  else
    TSWNElement(FElement).Mode := False;
end;

procedure TfrmSWNTest.cbbStateAlarmInhibitedSelect(Sender: TObject);
begin
  if cbbStateAlarmInhibited.Text = 'Not inhibited' then
    TSWNElement(FElement).StateAlarmInhibited := siNotInhibited
  else
    TSWNElement(FElement).StateAlarmInhibited := siInhibited;
end;

procedure TfrmSWNTest.cbbStateElementDisabledSelect(Sender: TObject);
begin
  if cbbStateElementDisabled.Text = 'Disabled' then
    TSWNElement(FElement).StateElementDisabled := sdDisabled
  else
    TSWNElement(FElement).StateElementDisabled := sdEnabled;
end;

procedure TfrmSWNTest.cbbStateSwitchSelect(Sender: TObject);
begin
  if cbbStateSwitch.Text = 'False' then
    TSWNElement(FElement).StateSwitch := False
  else
    TSWNElement(FElement).StateSwitch := True;
end;

procedure TfrmSWNTest.edtTdelayKeyPress(Sender: TObject; var Key: Char);
var
  value : Integer;
begin
  if Key = #13 then begin

    TryStrToInt(TEdit(Sender).Text,value);

    TSWNElement(FElement).Parameters.GetParameter(epTDELAY).ParamDoubleValue := value;
  end;
end;

procedure TfrmSWNTest.ElementPropertyChange(Sender: TObject; PropsID: E_PropsID;
  Value: Byte);
begin
  inherited;

  case PropsID of
    epElementAlarmChange    : cbbStateAlarm.Text := ElementAlarmStateToStr(E_StateAlarm(Value));
    epElementStateChange    : cbbStateElement.Text := ElementStateToStr(E_StateElement(Value));
    epElementDisabledChange : cbbStateElementDisabled.ItemIndex := Value;
    epStateSwitchChange     : cbbStateSwitch.ItemIndex := Value;
    epEvaluateStateChange   : cbbEvaluateState.ItemIndex := Value;
    epElementAlrmInhibited  : cbbStateAlarmInhibited.ItemIndex := Value;
  end;
end;

procedure TfrmSWNTest.ElementPropertyChange(Sender: TObject; PropsID: E_PropsID;
  Value: Double);
begin
  inherited;

end;

end.
