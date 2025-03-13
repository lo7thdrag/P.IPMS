unit uVCPTestForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uElementTestForm, uDataType;

type
  TfrmVCPTest = class(TfrmElementTest)
    grpPlatformInterface: TGroupBox;
    grpInput: TGroupBox;
    grpOutput: TGroupBox;
    edtValueValve: TEdit;
    lbl1: TLabel;
    cbbStateSwitchRemote: TComboBox;
    lbl2: TLabel;
    cbbControlClose: TComboBox;
    lbl3: TLabel;
    cbbControlOpen: TComboBox;
    lbl4: TLabel;
    grpIPMSInterface: TGroupBox;
    grpInput2: TGroupBox;
    cbbStateElementDisabled: TComboBox;
    lbl5: TLabel;
    grpOutput2: TGroupBox;
    cbbStateAlarm: TComboBox;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    cbbStateControlPosition: TComboBox;
    cbbStateElement: TComboBox;
    edtValueElement: TEdit;
    grp1: TGroupBox;
    edtTtrans: TEdit;
    lbl10: TLabel;
    procedure cbbStateSwitchRemoteSelect(Sender: TObject);
    procedure cbbStateElementDisabledSelect(Sender: TObject);
    procedure edtTtransKeyPress(Sender: TObject; var Key: Char);
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
  frmVCPTest: TfrmVCPTest;

implementation

uses uVCP, uListener, uFunction;

{$R *.dfm}

procedure TfrmVCPTest.ApplyElement;
begin
  inherited;

  if FElement is TVCPElement then
  begin
    with TVCPElement(FElement) do begin
      case StateSwitchRemote of
        ssrLocal  : cbbStateSwitchRemote.ItemIndex := 0;
        ssrRemote : cbbStateSwitchRemote.ItemIndex := 1;
      end;
      case StateElementDisabled of
        sdDisabled : cbbStateElementDisabled.ItemIndex := 0;
        sdEnabled  : cbbStateElementDisabled.ItemIndex := 1;
      end;

      edtValueValve.Text  := FloatToStr(ValueValve);
      edtTtrans.Text      := FloatToStr(Parameters.GetParameter(epTTRANS).ParamDoubleValue);

      cbbStateAlarm.Text   := ElementAlarmStateToStr(StateAlarm);
      cbbStateElement.Text := ElementStateToStr(StateElement);

    end;
  end;
end;

procedure TfrmVCPTest.cbbStateElementDisabledSelect(Sender: TObject);
begin
  if cbbStateElementDisabled.Text = 'Disabled' then
    TVCPElement(FElement).StateElementDisabled := sdDisabled
  else
    TVCPElement(FElement).StateElementDisabled := sdEnabled;
end;

procedure TfrmVCPTest.cbbStateSwitchRemoteSelect(Sender: TObject);
begin
  if cbbStateSwitchRemote.Text = 'Local' then
    TVCPElement(FElement).StateSwitchRemote := ssrLocal
  else
    TVCPElement(FElement).StateSwitchRemote := ssrRemote;
end;

procedure TfrmVCPTest.edtTtransKeyPress(Sender: TObject; var Key: Char);
var
  value : Integer;
begin
  if Key = #13 then begin

    TryStrToInt(TEdit(Sender).Text,value);

    case TEdit(Sender).Tag of
      1: TVCPElement(FElement).ValueValve := value;
      2: TVCPElement(FElement).Parameters.GetParameter(epTTRANS).ParamDoubleValue := value;
    end;
  end;
end;

procedure TfrmVCPTest.ElementPropertyChange(Sender: TObject; PropsID: E_PropsID;
  Value: Byte);
begin
  inherited;
  case PropsID of
    epElementAlarmChange    : cbbStateAlarm.Text := ElementAlarmStateToStr(E_StateAlarm(Value));
    epElementStateChange    : cbbStateElement.Text := ElementStateToStr(E_StateElement(Value));
    epElementDisabledChange : cbbStateElementDisabled.ItemIndex := Value;
    epStateSwitchRemoteChange : cbbStateSwitchRemote.ItemIndex := Value;
  end;
end;

procedure TfrmVCPTest.ElementPropertyChange(Sender: TObject; PropsID: E_PropsID;
  Value: Double);
begin
  inherited;
  case PropsID of
    epElementValueValveChange    : edtValueValve.Text := FloatToStr(Value);
  end;
end;

end.
