unit uBilgeSystemInsInput;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmBilgeSystemInsInput = class(TForm)
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
  frmBilgeSystemInsInput: TfrmBilgeSystemInsInput;

implementation
uses uControllerSystem, uDataType, uSWE;
{$R *.dfm}

{$R *.dfm}

procedure TfrmBilgeSystemInsInput.btnBilgeOKClick(Sender: TObject);
var
  aStateIn : Boolean;
  aStateEleDis : E_StateDisabled;
  aStateAlarmIn : E_StateInhibit;
begin
  TSWEElement(CtrlSystem.Controller.getElement(FValueElementID)).Parameters.GetParameter(epTDELAY).ParamDoubleValue := 0;
  if cbbBilgeInState.Text = 'True' then
  begin
    TSWEElement(CtrlSystem.Controller.getElement(FValueElementID)).StateAlarmInhibited := siNotInhibited;
    TSWEElement(CtrlSystem.Controller.getElement(FValueElementID)).Parameters.GetParameter(epMODE).ParamDoubleValue := 0;

    if TSWEElement(CtrlSystem.Controller.getElement(FValueElementID)).Parameters.GetParameter(epNONC).ParamDoubleValue = 0 then
      TSWEElement(CtrlSystem.Controller.getElement(FValueElementID)).StateInState := True
    else if TSWEElement(CtrlSystem.Controller.getElement(FValueElementID)).Parameters.GetParameter(epNONC).ParamDoubleValue = 1 then
      TSWEElement(CtrlSystem.Controller.getElement(FValueElementID)).StateInState := False;




  end
  else if cbbBilgeInState.Text = 'False' then
  begin
    TSWEElement(CtrlSystem.Controller.getElement(FValueElementID)).StateAlarmInhibited := siInhibited;
    TSWEElement(CtrlSystem.Controller.getElement(FValueElementID)).Parameters.GetParameter(epMODE).ParamDoubleValue := 1;

    if TSWEElement(CtrlSystem.Controller.getElement(FValueElementID)).Parameters.GetParameter(epNONC).ParamDoubleValue = 0 then
      TSWEElement(CtrlSystem.Controller.getElement(FValueElementID)).StateInState := False
    else if TSWEElement(CtrlSystem.Controller.getElement(FValueElementID)).Parameters.GetParameter(epNONC).ParamDoubleValue = 1 then
      TSWEElement(CtrlSystem.Controller.getElement(FValueElementID)).StateInState := True;
  end;

  {if cbbBilgeStateInhibited.Text = 'Not inhibited' then
  begin
    TSWEElement(CtrlSystem.Controller.getElement(FValueElementID)).StateAlarmInhibited := siNotInhibited;
  end
  else if cbbBilgeStateInhibited.Text = 'Inhibited' then
  begin
    TSWEElement(CtrlSystem.Controller.getElement(FValueElementID)).StateAlarmInhibited := siInhibited;
  end;

  if cbbBilgeNONC.Text = 'NO' then
  begin
    TSWEElement(CtrlSystem.Controller.getElement(FValueElementID)).Parameters.GetParameter(epNONC).ParamDoubleValue := 0; //NO
  end
  else if cbbBilgeNONC.Text = 'NC' then
  begin
    TSWEElement(CtrlSystem.Controller.getElement(FValueElementID)).Parameters.GetParameter(epNONC).ParamDoubleValue := 1; //NO
  end;

  if cbbBilgeMode.Text = 'Alarm' then
  begin
    TSWEElement(CtrlSystem.Controller.getElement(FValueElementID)).Parameters.GetParameter(epMODE).ParamDoubleValue := 1; // Mode Alarm
  end
  else if cbbBilgeMode.Text = 'Not Alarm' then
  begin
    TSWEElement(CtrlSystem.Controller.getElement(FValueElementID)).Parameters.GetParameter(epMODE).ParamDoubleValue := 0;
  end;}

  {TSWEElement(CtrlSystem.Controller.getElement(FValueElementID)).Parameters.GetParameter(epTDELAY).ParamDoubleValue := StrToFloat(edtBilgeTDelay.Text);}

  if cbbBilgeStateElement.Text = 'Enabled' then
  begin
//    TSWEElement(CtrlSystem.Controller.getElement(FValueElementID)).Parameters.GetParameter(epMODE).ParamDoubleValue := 1;
    TSWEElement(CtrlSystem.Controller.getElement(FValueElementID)).StateElementDisabled := sdEnabled;
  end
  else if  cbbBilgeStateElement.Text = 'Disabled' then
  begin
    TSWEElement(CtrlSystem.Controller.getElement(FValueElementID)).StateElementDisabled := sdDisabled;
  end;

 frmBilgeSystemInsInput.Close;
end;

procedure TfrmBilgeSystemInsInput.btnCancelClick(Sender: TObject);
begin
  frmBilgeSystemInsInput.Close;
end;

function TfrmBilgeSystemInsInput.getElementID: string;
begin
  Result := FValueElementID;
end;

procedure TfrmBilgeSystemInsInput.setElementID(Value: string);
begin
  FValueElementID := Value;
end;

end.
