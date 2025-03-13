unit uSEETestForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uElementTestForm, uDataType;

type
  TfrmSEETest = class(TfrmElementTest)
    grpInput: TGroupBox;
    cbbCommandReset: TComboBox;
    lbl1: TLabel;
    cbbEventInput: TComboBox;
    cbbStateElementDisabled: TComboBox;
    lbl2: TLabel;
    lbl3: TLabel;
    grpOutput: TGroupBox;
    lbl4: TLabel;
    edtValueElement: TEdit;
    lbl5: TLabel;
    grpParameters: TGroupBox;
    edtOFFSET: TEdit;
    lbl6: TLabel;
    edtStateElement: TEdit;
    procedure cbbCommandResetSelect(Sender: TObject);
    procedure cbbEventInputSelect(Sender: TObject);
    procedure cbbStateElementDisabledSelect(Sender: TObject);
    procedure edtOFFSETKeyPress(Sender: TObject; var Key: Char);
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
  frmSEETest: TfrmSEETest;

implementation

uses uSEE, uFunction, uListener;

{$R *.dfm}

procedure TfrmSEETest.ApplyElement;
begin
  inherited;

  if FElement is TSEEElement then
  begin

    with TSEEElement(FElement) do
    begin

    {input}
      case CommandReset of
        sacNotActivated : cbbCommandReset.ItemIndex := 0;
        sacActivated    : cbbCommandReset.ItemIndex := 1;
      end;

      case EventInput of
        sacNotActivated : cbbEventInput.ItemIndex := 0;
        sacActivated    : cbbEventInput.ItemIndex := 1;
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

procedure TfrmSEETest.cbbCommandResetSelect(Sender: TObject);
begin
  inherited;

  if cbbCommandReset.Text = 'Not actived' then
    TSEEElement(FElement).CommandReset := sacNotActivated
  else if cbbCommandReset.Text = 'Actived' then
    TSEEElement(FElement).CommandReset := sacActivated;

end;

procedure TfrmSEETest.cbbEventInputSelect(Sender: TObject);
begin
  inherited;

  if cbbEventInput.Text = 'Not actived' then
    TSEEElement(FElement).EventInput := sacNotActivated
  else if cbbEventInput.Text = 'Actived' then
    TSEEElement(FElement).EventInput := sacActivated;

end;

procedure TfrmSEETest.cbbStateElementDisabledSelect(Sender: TObject);
begin
  inherited;

  if cbbStateElementDisabled.Text = 'Disabled' then
    TSEEElement(FElement).StateElementDisabled := sdDisabled
  else if cbbStateElementDisabled.Text = 'Enabled' then
    TSEEElement(FElement).StateElementDisabled := sdEnabled;

end;

procedure TfrmSEETest.edtOFFSETKeyPress(Sender: TObject; var Key: Char);
var
  val: Integer;
begin
  inherited;

  if key = #13 then
  begin
    TryStrToInt(TEdit(sender).Text, val);

    case TEdit(sender).Tag of
      1: TSEEElement(FElement).Parameters.GetParameter(epOFFSET).ParamDoubleValue := val;
    end;

  end;
end;

procedure TfrmSEETest.ElementPropertyChange(Sender: TObject; PropsID: E_PropsID;
  Value: Byte);
begin
  inherited;

   case PropsID of
     epElementStateChange : edtStateElement.Text := ElementStateToStr(E_StateElement(Value));
     epElementDisabledChange : cbbStateElementDisabled.ItemIndex := Value;
     epElementEventChange : cbbEventInput.ItemIndex := Value;
     epElementResetChange : cbbCommandReset.ItemIndex := Value;
   end;
end;

procedure TfrmSEETest.ElementPropertyChange(Sender: TObject; PropsID: E_PropsID;
  Value: Double);
begin
  inherited;

  case PropsID of
    epElementValueElmntChange : edtValueElement.Text := FloatToStr(Value);
  end;
end;

end.
