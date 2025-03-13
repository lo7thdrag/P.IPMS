unit uDAETestForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uElementTestForm, uDataType;

type
  TfrmDAETest = class(TfrmElementTest)
    grpInput: TGroupBox;
    lbl1: TLabel;
    cbbCommand: TComboBox;
    lbl2: TLabel;
    grpOutput: TGroupBox;
    lbl3: TLabel;
    edtStateElement: TEdit;
    cbbState: TComboBox;
    procedure cbbCommandSelect(Sender: TObject);
    procedure cbbStateSelect(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure ApplyElement;override;
    procedure ElementPropertyChange(Sender : TObject;PropsID : E_PropsID;Value : Byte);overload;override;
  public
    { Public declarations }
  end;

var
  frmDAETest: TfrmDAETest;

implementation

uses uDAE, uListener, uFunction;

{$R *.dfm}

procedure TfrmDAETest.ApplyElement;
begin
  inherited;

  if FElement is TDAEElement then
  begin
    with TDAEElement(FElement) do
    begin
      case Command of
        sdDisabled: cbbCommand.ItemIndex := 0;
        sdEnabled: cbbCommand.ItemIndex := 1;
      end;

      case state of
        sState1: cbbState.ItemIndex := 0;
        sState2: cbbState.ItemIndex := 1;
        sState3: cbbState.ItemIndex := 2;
        sState4: cbbState.ItemIndex := 3;
        sState5: cbbState.ItemIndex := 4;
        sState6: cbbState.ItemIndex := 5;
        sState7: cbbState.ItemIndex := 6;
        sState8: cbbState.ItemIndex := 7;
        sState9: cbbState.ItemIndex := 8;
        sState10: cbbState.ItemIndex := 9;
        sState11: cbbState.ItemIndex := 10;
        sState12: cbbState.ItemIndex := 11;
        sState13: cbbState.ItemIndex := 12;
        sState14: cbbState.ItemIndex := 13;
        sState15: cbbState.ItemIndex := 14;
      end;

      edtStateElement.Text := ElementStateToStr(StateElement);
    end;
  end;
end;

procedure TfrmDAETest.cbbCommandSelect(Sender: TObject);
begin
  inherited;
  if cbbCommand.Text = 'Disabled' then
    TDAEElement(FElement).Command := sdDisabled
  else if cbbCommand.Text = 'Enabled' then
    TDAEElement(FElement).Command := sdEnabled;
end;

procedure TfrmDAETest.cbbStateSelect(Sender: TObject);
begin
  inherited;
  if cbbState.Text = 'State 1' then
    TDAEElement(FElement).State := sState1
  else if cbbState.Text = 'State 2' then
    TDAEElement(FElement).State := sState2
  else if cbbState.Text = 'State 3' then
    TDAEElement(FElement).State := sState3
  else if cbbState.Text = 'State 4' then
    TDAEElement(FElement).State := sState4
  else if cbbState.Text = 'State 5' then
    TDAEElement(FElement).State := sState5
  else if cbbState.Text = 'State 6' then
    TDAEElement(FElement).State := sState6
  else if cbbState.Text = 'State 7' then
    TDAEElement(FElement).State := sState7
  else if cbbState.Text = 'State 8' then
    TDAEElement(FElement).State := sState8
  else if cbbState.Text = 'State 9' then
    TDAEElement(FElement).State := sState9
  else if cbbState.Text = 'State 10' then
    TDAEElement(FElement).State := sState10
  else if cbbState.Text = 'State 11' then
    TDAEElement(FElement).State := sState11
  else if cbbState.Text = 'State 12' then
    TDAEElement(FElement).State := sState12
  else if cbbState.Text = 'State 13' then
    TDAEElement(FElement).State := sState13
  else if cbbState.Text = 'State 14' then
    TDAEElement(FElement).State := sState14
  else if cbbState.Text = 'State 15' then
    TDAEElement(FElement).State := sState15;
end;

procedure TfrmDAETest.ElementPropertyChange(Sender: TObject; PropsID: E_PropsID;
  Value: Byte);
begin
  inherited;
  case PropsID of
    epElementStateChange    : edtStateElement.Text := ElementStateToStr(E_StateElement(Value));
//    epElementCaptionChange  : cbbState.ItemIndex := Value;
  end;
end;

end.
