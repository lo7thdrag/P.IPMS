unit uRHEtestForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uElementTestForm, uDataType, ExtCtrls;

type
  TfrmRHETest = class(TfrmElementTest)
    grpInput: TGroupBox;
    grpOutput: TGroupBox;
    cbbCommandReset: TComboBox;
    cbbEnableCounting: TComboBox;
    cbbStateElementDisabled: TComboBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    edtValueElement: TEdit;
    lbl5: TLabel;
    edtStateElement: TEdit;
    grp1: TGroupBox;
    lbl6: TLabel;
    edtOFFSET: TEdit;
    procedure cbbCommandResetSelect(Sender: TObject);
    procedure cbbEnableCountingSelect(Sender: TObject);
    procedure cbbStateElementDisabledSelect(Sender: TObject);
    procedure edtOFFSETKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  protected
    procedure ApplyElement;override;
    procedure ElementPropertyChange(Sender: TObject; PropsID: E_PropsID;  Value: Double);overload;override;
    procedure ElementPropertyChange(Sender : TObject;PropsID : E_PropsID;Value : Byte);overload;override;
  public
    { Public declarations }
  end;

var
  frmRHETest: TfrmRHETest;

implementation

uses uRHE, uFunction, uListener ;

{$R *.dfm}

procedure TfrmRHETest.ApplyElement;
begin
  inherited;

  if FElement is TRHEElement then
  begin

    with TRHEElement(FElement) do
    begin

    {input}
      case CommandReset of
        sacActivated : cbbCommandReset.ItemIndex := 0;
        sacNotActivated    : cbbCommandReset.ItemIndex := 1;
      end;

      case EnableCounting of
        secNotEnabled : cbbEnableCounting.ItemIndex := 0;
        secEnabled    : cbbEnableCounting.ItemIndex := 1;
      end;

      case StateElementDisabled of
        sdDisabled : cbbStateElementDisabled.ItemIndex := 0;
        sdEnabled  : cbbStateElementDisabled.ItemIndex := 1;
      end;

    {parameter}
      edtOFFSET.Text := FloatToStr(Parameters.GetParameter(epOFFSET).ParamDoubleValue);

    {output}
      edtStateElement.Text := ElementStateToStr(StateElement);
      edtValueElement.Text := FloatToStr(ValueElement);
    end;
  end;
end;

procedure TfrmRHETest.cbbCommandResetSelect(Sender: TObject);
begin
  inherited;
  if cbbCommandReset.Text = 'Not activated' then
    TRHEElement(FElement).CommandReset := sacNotActivated
  else if cbbCommandReset.Text = 'Activated' then
    TRHEElement(FElement).CommandReset := sacActivated;
end;

procedure TfrmRHETest.cbbEnableCountingSelect(Sender: TObject);
begin
  inherited;
  if cbbEnableCounting.Text = 'Not enabled' then
    TRHEElement(FElement).EnableCounting := secNotEnabled
  else if cbbEnableCounting.Text = 'Enabled' then
    TRHEElement(FElement).EnableCounting := secEnabled;
end;

procedure TfrmRHETest.cbbStateElementDisabledSelect(Sender: TObject);
begin
  inherited;
  if cbbStateElementDisabled.Text = 'Disabled' then
    TRHEElement(FElement).StateElementDisabled := sdDisabled
  else if cbbStateElementDisabled.Text = 'Enabled' then
    TRHEElement(FElement).StateElementDisabled := sdEnabled;
end;

procedure TfrmRHETest.edtOFFSETKeyPress(Sender: TObject; var Key: Char);
var
  value : Integer;
begin

  if not (key in['0'..'9', #8, #13, #46]) then
    key := #0;

  if Key = #13 then begin

    TryStrToInt(TEdit(Sender).Text,value);

    case TEdit(Sender).Tag of
      1 : TRHEElement(FElement).Parameters.GetParameter(epOFFSET).ParamDoubleValue := value;
    end;

  end;

//  TRHEElement(FElement).AlarmElementStateCalc;
end;

procedure TfrmRHETest.ElementPropertyChange(Sender: TObject; PropsID: E_PropsID;
  Value: Double);
begin
  inherited;

  case PropsID of
    epElementValueElmntChange : edtValueElement.Text := FloatToStr(Value);
  end;
end;

procedure TfrmRHETest.ElementPropertyChange(Sender: TObject; PropsID: E_PropsID;
  Value: Byte);
begin
  inherited;

  case PropsID of
    epElementStateChange: edtStateElement.Text := ElementStateToStr(E_StateElement(Value));
    epElementResetChange: cbbCommandReset.ItemIndex := Value;
    epElementCountingChange: cbbEnableCounting.ItemIndex := Value;
    epElementDisabledChange: cbbStateElementDisabled.ItemIndex := Value;
//    epElementValueElmntChange : edtValueElement.Text := IntToStr(Value);
  end;
end;

end.
