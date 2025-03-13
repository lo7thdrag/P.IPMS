unit uSWETestForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uElementTestForm, uDataType;

type
  TfrmSWETest = class(TfrmElementTest)
    grpInput: TGroupBox;
    cbbStateElementDisabled: TComboBox;
    lbl1: TLabel;
    cbbStateAlarmInhibited: TComboBox;
    lbl2: TLabel;
    grpOutput: TGroupBox;
    lbl3: TLabel;
    lbl4: TLabel;
    grpParameters: TGroupBox;
    lbl5: TLabel;
    edtTDELAY: TEdit;
    lbl6: TLabel;
    lbl7: TLabel;
    grp1: TGroupBox;
    cbbInStatePlatform: TComboBox;
    lbl9: TLabel;
    edtStateAlarm: TEdit;
    edtStateElement: TEdit;
    cbbMode: TComboBox;
    cbbNONC: TComboBox;
    procedure cbbStateElementDisabledSelect(Sender: TObject);
    procedure cbbStateAlarmInhibitedSelect(Sender: TObject);
    procedure edtNONCKeyPress(Sender: TObject; var Key: Char);
    procedure cbbInStatePlatformSelect(Sender: TObject);
    procedure cbbNONCSelect(Sender: TObject);
    procedure cbbModeSelect(Sender: TObject);
    { Private declarations }
  protected
    procedure ApplyElement;override;
    procedure ElementPropertyChange(Sender : TObject;PropsID : E_PropsID;Value : Byte);overload;override;

  public
    { Public declarations }
  end;

var
  frmSWETest: TfrmSWETest;

implementation

uses uSWE, uListener, uFunction;

{$R *.dfm}

procedure TfrmSWETest.ApplyElement;
begin
  inherited;

  if FElement is TSWEElement then
  begin
    with TSWEElement(FElement) do begin

    {input}
      case StateAlarmInhibited of
         siInhibited : cbbStateAlarmInhibited.ItemIndex := 0;
         siNotInhibited    : cbbStateAlarmInhibited.ItemIndex := 1;
      end;

      case StateElementDisabled of
        sdDisabled  : cbbStateElementDisabled.ItemIndex := 0;
        sdEnabled   : cbbStateElementDisabled.ItemIndex := 1;
      end;

      case StateInState of
        False  : cbbInStatePlatform.ItemIndex := 0;
        True   : cbbInStatePlatform.ItemIndex := 1;
      end;

      {parameter -> sementara NO/NC : NO|0 NC|1 MODE : Alarm|0 No Alarm|1}
      cbbNONC.ItemIndex    := NONC;
      cbbMode.ItemIndex    := Mode;
      edtTDELAY.Text  := FloatToStr(Parameters.GetParameter(epTDELAY).ParamDoubleValue);

      edtStateAlarm.Text   := ElementAlarmStateToStr(StateAlarm);
      edtStateElement.Text := ElementStateToStr(StateElement);
    end;

  end;
end;

procedure TfrmSWETest.cbbNONCSelect(Sender: TObject);
begin
  inherited;
  if cbbNONC.Text = 'NO' then
    TSWEElement(FElement).NONC := 0
  else
  if cbbNONC.Text = 'NC' then
    TSWEElement(FElement).NONC := 1;
end;

procedure TfrmSWETest.cbbInStatePlatformSelect(Sender: TObject);
begin
  inherited;

  if cbbInStatePlatform.Text = 'True' then
    TSWEElement(FElement).StateInState := True
  else if cbbInStatePlatform.Text = 'False' then
    TSWEElement(FElement).StateInState := False;
end;

procedure TfrmSWETest.cbbModeSelect(Sender: TObject);
begin
  inherited;
  if cbbMode.Text = 'Alarm' then
    TSWEElement(FElement).Mode := 0
  else if cbbMode.Text = 'No Alarm' then
    TSWEElement(FElement).Mode := 1;
end;

procedure TfrmSWETest.cbbStateAlarmInhibitedSelect(Sender: TObject);
begin
  inherited;

  if cbbStateAlarmInhibited.Text = 'Not inhibited' then
    TSWEElement(FElement).StateAlarmInhibited := siNotInhibited
  else if cbbStateAlarmInhibited.Text = 'Inhibited' then
    TSWEElement(FElement).StateAlarmInhibited := siInhibited;;
end;

procedure TfrmSWETest.cbbStateElementDisabledSelect(Sender: TObject);
begin
  inherited;

  if cbbStateElementDisabled.Text = 'Disabled' then
    TSWEElement(FElement).StateElementDisabled := sdDisabled
  else   if cbbStateElementDisabled.Text = 'Enabled' then
    TSWEElement(FElement).StateElementDisabled := sdEnabled;
end;

procedure TfrmSWETest.edtNONCKeyPress(Sender: TObject; var Key: Char);
var
  Value : integer;
begin
  inherited;

  if not (key in['0'..'9', #8, #13, #46]) then
    key := #0;

  if key = #13 then
  begin
    TryStrToInt(TEdit(Sender).Text, Value);;

    case TEdit(sender).Tag of
      1: TSWEElement(FElement).Parameters.GetParameter(epTDELAY).ParamDoubleValue := Value;
    end;
  end;
end;

procedure TfrmSWETest.ElementPropertyChange(Sender: TObject; PropsID: E_PropsID;
  Value: Byte);
begin
  inherited;

  case PropsID of
    epElementAlarmChange    : edtStateAlarm.Text := ElementAlarmStateToStr(E_StateAlarm(Value));
    epElementStateChange    : edtStateElement.Text := ElementStateToStr(E_StateElement(Value));
    epElementDisabledChange : cbbStateElementDisabled.ItemIndex := Value;
    epElementAlrmInhibited  : cbbStateAlarmInhibited.ItemIndex := Value;
    epElementInState        : cbbInStatePlatform.ItemIndex := Value;
  end;
end;

end.
