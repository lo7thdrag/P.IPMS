unit uSPETestForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uElementTestForm, uDataType;

type
  TfrmSPETest = class(TfrmElementTest)
    grpInput: TGroupBox;
    grpOutput: TGroupBox;
    cbbCommandEnableDisable: TComboBox;
    lbl1: TLabel;
    lbl2: TLabel;
    edtHMISetPoint: TEdit;
    lbl3: TLabel;
    lbl4: TLabel;
    edtActualStepoint: TEdit;
    edtStateElement: TEdit;
    procedure cbbCommandEnableDisableSelect(Sender: TObject);
    procedure edtHMISetPointKeyPress(Sender: TObject; var Key: Char);
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
  frmSPETest: TfrmSPETest;

implementation

uses uSPE, uFunction, uListener;

{$R *.dfm}

procedure TfrmSPETest.ApplyElement;
begin
  inherited;

  if FElement is TSPEElement then
  begin

    with TSPEElement(FElement) do
    begin

    {input}
      case StateElementDisabled of
        sdDisabled : cbbCommandEnableDisable.ItemIndex := 0;
        sdEnabled  : cbbCommandEnableDisable.ItemIndex := 1;
      end;

      edtHMISetPoint.Text := IntToStr(HMISetPoint);

    {output}
      edtStateElement.Text := ElementStateToStr(StateElement);
      edtActualStepoint.Text := FloatToStr(ActualPoint);
    end;
  end;
end;

procedure TfrmSPETest.cbbCommandEnableDisableSelect(Sender: TObject);
begin
  inherited;

  if cbbCommandEnableDisable.Text = 'Disabled' then
    TSPEElement(FElement).CommandEnableDisable := sdDisabled
  else if cbbCommandEnableDisable.Text = 'Enabled' then
    TSPEElement(FElement).CommandEnableDisable := sdEnabled;

end;

procedure TfrmSPETest.edtHMISetPointKeyPress(Sender: TObject; var Key: Char);
var
  val : Integer;
begin
  inherited;

  if key = #13 then
  begin
    TryStrToInt(TEdit(sender).Text, val);

    case TEdit(sender).Tag of
      1: TSPEElement(FElement).HMISetPoint := val;
    end;

  end;
end;

procedure TfrmSPETest.ElementPropertyChange(Sender: TObject; PropsID: E_PropsID;
  Value: Byte);
begin
  inherited;

  case PropsID of
    epElementStateChange : edtStateElement.Text := ElementStateToStr(E_StateElement(Value));
    epElementDisabledChange : cbbCommandEnableDisable.ItemIndex := Value;
  end;
end;

procedure TfrmSPETest.ElementPropertyChange(Sender: TObject; PropsID: E_PropsID;
  Value: Double);
begin
  inherited;

  case PropsID of
    epElementActualSetChange : edtActualStepoint.Text := FloatToStr(Value);
    epElementHMISetChange : edtHMISetPoint.Text := FloatToStr(Value);
  end;
end;

end.
