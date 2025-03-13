unit uSWEInput;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmSWEInput = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    pnl2: TPanel;
    lbl2: TLabel;
    cbbBilgeStateElement: TComboBox;
    btnBilgeOK: TButton;
    cbbBilgeInState: TComboBox;
    pnl3: TPanel;
    lbl3: TLabel;
    cbbBilgeStateInhibited: TComboBox;
    pnl4: TPanel;
    lbl4: TLabel;
    cbbBilgeNONC: TComboBox;
    pnl5: TPanel;
    lbl5: TLabel;
    cbbBilgeMode: TComboBox;
    pnl6: TPanel;
    lbl6: TLabel;
    edtBilgeTDelay: TEdit;
    btnCancel: TButton;
    procedure btnBilgeOKClick(Sender: TObject);
    procedure setElementID(Value : string);
    function getElementID : string;
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    FValueElementID : string;
  public
    { Public declarations }
  end;

var
  frmSWEInput: TfrmSWEInput;

implementation
uses uControllerSystem, uDataType, uSWE;
{$R *.dfm}

{$R *.dfm}

procedure TfrmSWEInput.btnBilgeOKClick(Sender: TObject);
//var
//  aStateIn : Boolean;
//  aStateEleDis : E_StateDisabled;
//  aStateAlarmIn : E_StateInhibit;
begin
  if FValueElementID = '' then
    Exit;

  TSWEElement(CtrlSystem.Controller.getElement(FValueElementID)).Parameters.GetParameter(epTDELAY).ParamDoubleValue := 0;
  if cbbBilgeInState.Text = 'True' then
  begin
    TSWEElement(CtrlSystem.Controller.getElement(FValueElementID)).StateAlarmInhibited := siNotInhibited;
    TSWEElement(CtrlSystem.Controller.getElement(FValueElementID)).Mode := 0;

    if TSWEElement(CtrlSystem.Controller.getElement(FValueElementID)).NONC = 0 then
      TSWEElement(CtrlSystem.Controller.getElement(FValueElementID)).StateInState := True
    else if TSWEElement(CtrlSystem.Controller.getElement(FValueElementID)).NONC = 1 then
      TSWEElement(CtrlSystem.Controller.getElement(FValueElementID)).StateInState := False;
  end
  else if cbbBilgeInState.Text = 'False' then
  begin
    TSWEElement(CtrlSystem.Controller.getElement(FValueElementID)).StateAlarmInhibited := siInhibited;
    TSWEElement(CtrlSystem.Controller.getElement(FValueElementID)).Mode := 1;

    if TSWEElement(CtrlSystem.Controller.getElement(FValueElementID)).NONC = 0 then
      TSWEElement(CtrlSystem.Controller.getElement(FValueElementID)).StateInState := False
    else if TSWEElement(CtrlSystem.Controller.getElement(FValueElementID)).NONC = 1 then
      TSWEElement(CtrlSystem.Controller.getElement(FValueElementID)).StateInState := True;
  end;

  if cbbBilgeStateElement.Text = 'Enabled' then
  begin
    TSWEElement(CtrlSystem.Controller.getElement(FValueElementID)).StateElementDisabled := sdEnabled;
    TSWEElement(CtrlSystem.Controller.getElement(FValueElementID)).AlarmElementStateCalc;
  end
  else if  cbbBilgeStateElement.Text = 'Disabled' then
  begin
    TSWEElement(CtrlSystem.Controller.getElement(FValueElementID)).StateElementDisabled := sdDisabled;
    TSWEElement(CtrlSystem.Controller.getElement(FValueElementID)).AlarmElementStateCalc;
  end;

 frmSWEInput.Close;
end;

procedure TfrmSWEInput.btnCancelClick(Sender: TObject);
begin
  frmSWEInput.Close;
end;

function TfrmSWEInput.getElementID: string;
begin
  Result := FValueElementID;
end;

procedure TfrmSWEInput.setElementID(Value: string);
begin
  FValueElementID := Value;
end;

end.
