unit uFireFightingControlSystem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uValveControl, uSwitchElement, uShortcut, uMotorControlElement,
  uBaseComponent, uAnalogSensor, jpeg, ExtCtrls;

type
  TfrmFFSystem = class(TForm)
    img1: TImage;
    AnalogSensor1: TAnalogSensor;
    AnalogSensor2: TAnalogSensor;
    MotorControlElement1: TMotorControlElement;
    MotorControlElement2: TMotorControlElement;
    MotorControlElement3: TMotorControlElement;
    MotorControlElement4: TMotorControlElement;
    Shortcut1: TShortcut;
    Shortcut2: TShortcut;
    Shortcut3: TShortcut;
    Shortcut4: TShortcut;
    Shortcut5: TShortcut;
    SwitchElement1: TSwitchElement;
    SwitchElement2: TSwitchElement;
    SwitchElement3: TSwitchElement;
    SwitchElement4: TSwitchElement;
    SwitchElement5: TSwitchElement;
    SwitchElement6: TSwitchElement;
    SwitchElement7: TSwitchElement;
    ValveControl1: TValveControl;
    ValveControl10: TValveControl;
    ValveControl11: TValveControl;
    ValveControl12: TValveControl;
    ValveControl13: TValveControl;
    ValveControl14: TValveControl;
    ValveControl15: TValveControl;
    ValveControl16: TValveControl;
    ValveControl17: TValveControl;
    ValveControl18: TValveControl;
    ValveControl19: TValveControl;
    ValveControl2: TValveControl;
    ValveControl3: TValveControl;
    ValveControl4: TValveControl;
    ValveControl5: TValveControl;
    ValveControl6: TValveControl;
    ValveControl7: TValveControl;
    ValveControl8: TValveControl;
    ValveControl9: TValveControl;
    procedure SwitchElement1Click(Sender: TObject);
    procedure SwitchElement2Click(Sender: TObject);
    procedure SwitchElement3Click(Sender: TObject);
    procedure SwitchElement4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFFSystem: TfrmFFSystem;

implementation

uses uElement, uIPMS_Data, uControllerSystem, uSWE, uDataType, uFireFighting;

{$R *.dfm}

procedure TfrmFFSystem.SwitchElement1Click(Sender: TObject);
var
  aElm : TElement;
begin
  if SwitchElement1.Status = SWtaFalse then
  begin

     //set kondisi state 1

    aElm := CtrlSystem.Controller.getElement(TSwitchElement(Sender).ElementID);
    TSWEElement(aElm).StateInState := True;
    TSWEElement(aElm).NONC := 1; //NC
    TSWEElement(aElm).Mode := 1; // Mode No Alarm
    TSWEElement(aElm).Parameters.GetParameter(epTDELAY).ParamDoubleValue := 0;
    TSWEElement(aElm).StateElementDisabled := sdEnabled;

    TSWEElement(aElm).AlarmElementStateCalc;

    TSwitchElement(Sender).Status := SWtaOK;
    frmFireFighting.SwitchElement1.Status := SWtaOk;

    TSWEElement(CtrlSystem.Controller.getElement('5552E0021B')).StateElementDisabled := sdUnavailable;
//    TSWEElement(CtrlSystem.Controller.getElement('5552E0021B')).StateAlarm := saNone;
    SwitchElement2.Status := SWtaFalse;//unavailable
    frmFireFighting.SwitchElement2.Status := SWtaFalse;
  end
  else if SwitchElement1.Status = SWtaOk then
  begin
    TSwitchElement(Sender).Status := SWtaFalse;
    frmFireFighting.SwitchElement1.Status := SWtaFalse;
    TSWEElement(CtrlSystem.Controller.getElement('5552E0021A')).StateElementDisabled := sdUnavailable;

  end;

end;

procedure TfrmFFSystem.SwitchElement2Click(Sender: TObject);
var
  aElm : TElement;
begin
  if SwitchElement2.Status = SWtaFalse then
  begin

    //set kondisi alarm
    aElm := CtrlSystem.Controller.getElement('5552E0021B');
    TSWEElement(aElm).StateInState := True;
    TSWEElement(aElm).StateAlarmInhibited := siNotInhibited;
    TSWEElement(aElm).NONC := 0; //NO
    TSWEElement(aElm).Mode := 0; // Mode Alarm
    TSWEElement(aElm).Parameters.GetParameter(epTDELAY).ParamDoubleValue := 0;
    TSWEElement(aElm).StateElementDisabled := sdEnabled;

    TSWEElement(aElm).AlarmElementStateCalc;

    SwitchElement2.Status := SWtaAlarm;
    frmFireFighting.SwitchElement2.Status := SWtaAlarm;


    TSWEElement(CtrlSystem.Controller.getElement('5552E0021A')).StateElementDisabled := sdUnavailable;
    SwitchElement1.Status := SWtaFalse;
    frmFireFighting.SwitchElement1.Status := SWtaFalse;

  end
  else if SwitchElement2.Status = SWtaAlarm then
  begin
    SwitchElement2.Status := SWtaFalse;
    frmFireFighting.SwitchElement2.Status := SWtaFalse;
    TSWEElement(CtrlSystem.Controller.getElement('5552E0021B')).StateElementDisabled := sdUnavailable;
    TSWEElement(CtrlSystem.Controller.getElement('5552E0021B')).StateAlarm := saNone;
  end;
end;

procedure TfrmFFSystem.SwitchElement3Click(Sender: TObject);
var
  aElm : TElement;
begin
  if SwitchElement3.Status = SWtaFalse then
  begin

     //set kondisi state 1

    aElm := CtrlSystem.Controller.getElement(TSwitchElement(Sender).ElementID);
    TSWEElement(aElm).StateInState := True;
    TSWEElement(aElm).NONC := 1; //NC
    TSWEElement(aElm).Mode := 1; // Mode No Alarm
    TSWEElement(aElm).Parameters.GetParameter(epTDELAY).ParamDoubleValue := 0;
    TSWEElement(aElm).StateElementDisabled := sdEnabled;

    TSWEElement(aElm).AlarmElementStateCalc;

    TSwitchElement(Sender).Status := SWtaOK;

    TSWEElement(CtrlSystem.Controller.getElement('5551E0001D')).StateElementDisabled := sdUnavailable;
    SwitchElement4.Status := SWtaFalse;//unavailable

    // set release
    aElm := CtrlSystem.Controller.getElement('5551E0001B');
    TSWEElement(aElm).StateInState := True;
    TSWEElement(aElm).NONC := 1; //NC
    TSWEElement(aElm).Mode := 1; // Mode No Alarm
    TSWEElement(aElm).Parameters.GetParameter(epTDELAY).ParamDoubleValue := 0;
    TSWEElement(aElm).StateElementDisabled := sdEnabled;

    TSWEElement(aElm).AlarmElementStateCalc;

    SwitchElement5.Status := SWtaOk;

  end
  else if SwitchElement3.Status = SWtaOk then
  begin
    TSwitchElement(Sender).Status := SWtaFalse;
    TSWEElement(CtrlSystem.Controller.getElement('5551E0001C')).StateElementDisabled := sdUnavailable;

    TSWEElement(CtrlSystem.Controller.getElement('5551E0001B')).StateElementDisabled := sdUnavailable;
    SwitchElement5.Status := SWtaFalse;//unavailable

  end;

end;

procedure TfrmFFSystem.SwitchElement4Click(Sender: TObject);
var
  aElm : TElement;
begin
  if SwitchElement4.Status = SWtaFalse then
  begin

     //set kondisi state 1

    aElm := CtrlSystem.Controller.getElement(TSwitchElement(Sender).ElementID);
    TSWEElement(aElm).StateInState := True;
    TSWEElement(aElm).NONC := 1; //NC
    TSWEElement(aElm).Mode := 1; // Mode No Alarm
    TSWEElement(aElm).Parameters.GetParameter(epTDELAY).ParamDoubleValue := 0;
    TSWEElement(aElm).StateElementDisabled := sdEnabled;

    TSWEElement(aElm).AlarmElementStateCalc;

    TSwitchElement(Sender).Status := SWtaOK;

    TSWEElement(CtrlSystem.Controller.getElement('5551E0001C')).StateElementDisabled := sdUnavailable;
    SwitchElement3.Status := SWtaFalse;//unavailable

    // set release
    aElm := CtrlSystem.Controller.getElement('5551E0001B');
    TSWEElement(aElm).StateInState := True;
    TSWEElement(aElm).NONC := 1; //NC
    TSWEElement(aElm).Mode := 1; // Mode No Alarm
    TSWEElement(aElm).Parameters.GetParameter(epTDELAY).ParamDoubleValue := 0;
    TSWEElement(aElm).StateElementDisabled := sdEnabled;

    TSWEElement(aElm).AlarmElementStateCalc;

    SwitchElement5.Status := SWtaOk;

  end
  else if SwitchElement4.Status = SWtaOk then
  begin
    TSwitchElement(Sender).Status := SWtaFalse;
    TSWEElement(CtrlSystem.Controller.getElement('5551E0001D')).StateElementDisabled := sdUnavailable;

    TSWEElement(CtrlSystem.Controller.getElement('5551E0001B')).StateElementDisabled := sdUnavailable;
    SwitchElement5.Status := SWtaFalse;//unavailable

  end;

end;

end.
