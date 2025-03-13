unit uVentSystem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, uMotorControlElement, uBaseComponent,
  uMotorControlDoubleSpeed, jpeg, ExtCtrls;

type
  TfrmVentSystem = class(TForm)
    img1: TImage;
    MotorControlDoubleSpeed1: TMotorControlDoubleSpeed;
    MotorControlDoubleSpeed2: TMotorControlDoubleSpeed;
    MotorControlDoubleSpeed3: TMotorControlDoubleSpeed;
    MotorControlDoubleSpeed4: TMotorControlDoubleSpeed;
    MotorControlDoubleSpeed5: TMotorControlDoubleSpeed;
    MotorControlElement1: TMotorControlElement;
    MotorControlElement2: TMotorControlElement;
    MotorControlElement3: TMotorControlElement;
    pmMCD: TPopupMenu;
    mniDisabled1: TMenuItem;
    mniStopped1: TMenuItem;
    mniRemoteSupplyLow1: TMenuItem;
    mniRemoteExhaustHigh1: TMenuItem;
    mniStopFanNotReady1: TMenuItem;
    mniStopFailSupplyLow1: TMenuItem;
    mniStopFailExhaustHigh1: TMenuItem;
    mniMDtaRunSupplyLowFailStop1: TMenuItem;
    mniRunExhaustHighFailSupplyLow21: TMenuItem;
    mniUndeterminedFaulted1: TMenuItem;
    pmMCE: TPopupMenu;
    mniDisableUnavailable1: TMenuItem;
    mniStopped2: TMenuItem;
    mniRunning1: TMenuItem;
    mniNotReadyForUse1: TMenuItem;
    mniFailedToStart1: TMenuItem;
    mniRunningFailStopFaultedUndetermined1: TMenuItem;
    procedure MotorControlDoubleSpeed1MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure mniDisabled1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mniDisableUnavailable1Click(Sender: TObject);
    procedure mniStopped2Click(Sender: TObject);
    procedure mniRunning1Click(Sender: TObject);
    procedure mniNotReadyForUse1Click(Sender: TObject);
    procedure mniFailedToStart1Click(Sender: TObject);
    procedure mniStopped1Click(Sender: TObject);
    procedure mniRemoteSupplyLow1Click(Sender: TObject);
    procedure mniRemoteExhaustHigh1Click(Sender: TObject);
    procedure mniStopFanNotReady1Click(Sender: TObject);
    procedure mniStopFailSupplyLow1Click(Sender: TObject);
    procedure mniStopFailExhaustHigh1Click(Sender: TObject);
    procedure mniMDtaRunSupplyLowFailStop1Click(Sender: TObject);
    procedure mniRunExhaustHighFailSupplyLow21Click(Sender: TObject);
    procedure mniUndeterminedFaulted1Click(Sender: TObject);
    procedure mniRunningFailStopFaultedUndetermined1Click(Sender: TObject);
  private
    { Private declarations }
    MCDElementID : string;
    MCEElementID : string;
    aObj : TObject;
  public
    { Public declarations }
    procedure UpdateControlStatus(aMimicID, aStatus : byte; aElementID : string);
  end;

var
  frmVentSystem: TfrmVentSystem;

implementation

uses uElement, uControllerSystem, uMCD, uDataType, uIPMS_Data, uMCE;

{$R *.dfm}

procedure TfrmVentSystem.FormCreate(Sender: TObject);
begin
  aObj := TObject.Create;
end;

procedure TfrmVentSystem.mniDisabled1Click(Sender: TObject);
var
 aElm : TElement;
begin
  aElm := CtrlSystem.Controller.getElement(MCDElementID);
  TMCDElement(aElm).StateElementDisabled := sdDisabled;
//  TMCDElement(aElm).AlarmElementStateCalc;
  TMotorControlDoubleSpeed(aObj).Status := MDtaDisableUnavailable;
end;

procedure TfrmVentSystem.mniDisableUnavailable1Click(Sender: TObject);
var
  aElm : TElement;
begin
  aElm := CtrlSystem.Controller.getElement(MCEElementID);
  TMCEElement(aElm).StateElementDisabled := sdDisabled;
//  TMCEElement(aElm).AlarmElementStateCalc;
  TMotorControlElement(aObj).Status := MCtaDisableUnavailable;
end;

procedure TfrmVentSystem.mniFailedToStart1Click(Sender: TObject);     // run failure
var
  aElm : TElement;
begin
  aElm := CtrlSystem.Controller.getElement(MCEElementID);
  TMCEElement(aElm).StateValueValid := svValid;
  TMCEElement(aElm).StateSwitchNoFault := esNoFault;
  TMCEElement(aElm).StateSwitchRemote := esRemote;
  TMCEElement(aElm).StateRFU := snrRFU;
  TMCEElement(aElm).RunCondition := srcOk;
  TMCEElement(aElm).CommandStartApp := sacActivated;
  TMCEElement(aElm).StateSwitchRemote := esRemote;
  TMCEElement(aElm).StateManualAuto := smaAuto;
  TMCEElement(aElm).StateSwitchRunning := esNotRunning;
  TMCEElement(aElm).Parameters.GetParameter(epTTRANS).ParamDoubleValue := 1; // syarat > 0

  TMCEElement(aElm).StateElementDisabled := sdEnabled;

//  TMCEElement(aElm).AlarmElementStateCalc;

  TMotorControlElement(aObj).Status := MCtaFailedToStart;
end;

procedure TfrmVentSystem.mniNotReadyForUse1Click(Sender: TObject);    //notRFU
var
  aElm : TElement;
begin
  aElm := CtrlSystem.Controller.getElement(MCEElementID);
  TMCEElement(aElm).StateValueValid := svValid;
  TMCEElement(aElm).StateSwitchNoFault := esNoFault;
  TMCEElement(aElm).StateSwitchRemote := esRemote;
  TMCEElement(aElm).StateRFU := snrNotRFU;
  TMCEElement(aElm).StateElementDisabled := sdEnabled;

//  TMCEElement(aElm).AlarmElementStateCalc;

  TMotorControlElement(aObj).Status := MCtaNotReadyForUse;
end;

procedure TfrmVentSystem.mniRemoteExhaustHigh1Click(Sender: TObject);  //speed 2
var
 aElm : TElement;
begin
  aElm := CtrlSystem.Controller.getElement(MCDElementID);

  TMCDElement(aElm).StateValueValid := svValid;
  TMCDElement(aElm).StateSwitchNoFault := esNoFault;
  TMCDElement(aElm).StateSwitchRemote := esLocal;
  TMCDElement(aElm).StateSwitchSpeed2 := esSpeed2;
  TMCDElement(aElm).StateSwitchSpeed1 := esNotSpeed1;
  TMCDElement(aElm).StateElementDisabled := sdEnabled;

//  TMCDElement(aElm).AlarmElementStateCalc;

  TMotorControlDoubleSpeed(aObj).Status := MDtaRemoteExhaustHigh;
end;

procedure TfrmVentSystem.mniRemoteSupplyLow1Click(Sender: TObject);      //speed 1
var
 aElm : TElement;
begin
  aElm := CtrlSystem.Controller.getElement(MCDElementID);

  TMCDElement(aElm).StateValueValid := svValid;
  TMCDElement(aElm).StateSwitchNoFault := esNoFault;
  TMCDElement(aElm).StateSwitchRemote := esLocal;
  TMCDElement(aElm).StateSwitchSpeed2 := esNotSpeed2;
  TMCDElement(aElm).StateSwitchSpeed1 := esSpeed1;
  TMCDElement(aElm).StateElementDisabled := sdEnabled;

//  TMCDElement(aElm).AlarmElementStateCalc;

  TMotorControlDoubleSpeed(aObj).Status := MDtaRemoteSupplyLow;
end;

procedure TfrmVentSystem.mniRunExhaustHighFailSupplyLow21Click(Sender: TObject);  //speed 2_fail to stop
var
 aElm : TElement;
begin
  aElm := CtrlSystem.Controller.getElement(MCDElementID);

  TMCDElement(aElm).StateValueValid := svValid;
  TMCDElement(aElm).StateSwitchNoFault := esNoFault;
  TMCDElement(aElm).StateSwitchRemote := esRemote;
  TMCDElement(aElm).RFU := snrRFU;

  TMCDElement(aElm).StateManualAuto := smaAuto;
  TMCDElement(aElm).RunCondition := srcNotOk;

  TMCDElement(aElm).StateSwitchSpeed1 := esNotSpeed1;
  TMCDElement(aElm).StateSwitchSpeed2 := esSpeed2;

  TMCDElement(aElm).Parameters.GetParameter(epTTRANS).ParamDoubleValue := 1; // TTrans > 0 and timer >= TTrans,, timer = 10

  TMCDElement(aElm).StateElementDisabled := sdEnabled;

//   TMCDElement(aElm).AlarmElementStateCalc;

  TMotorControlDoubleSpeed(aObj).Status := MDtaRunExhaustHigh_FailSupplyLow2;
end;

procedure TfrmVentSystem.mniRunning1Click(Sender: TObject);
var
  aElm : TElement;
begin
  aElm := CtrlSystem.Controller.getElement(MCEElementID);
  TMCEElement(aElm).StateValueValid := svValid;
  TMCEElement(aElm).StateSwitchNoFault := esNoFault;
  TMCEElement(aElm).StateSwitchRemote := esLocal;
  TMCEElement(aElm).StateSwitchRunning := esRunning;
  TMCEElement(aElm).StateElementDisabled := sdEnabled;

//  TMCEElement(aElm).AlarmElementStateCalc;

  TMotorControlElement(aObj).Status := MCtaRunning;
end;

procedure TfrmVentSystem.mniRunningFailStopFaultedUndetermined1Click(
  Sender: TObject);
var
  aElm : TElement;
begin
  aElm := CtrlSystem.Controller.getElement(MCEElementID);
  TMCEElement(aElm).StateValueValid := svInvalid;
  TMCEElement(aElm).StateElementDisabled := sdEnabled;

//  TMCEElement(aElm).AlarmElementStateCalc;

  TMotorControlElement(aObj).Status := MCtaRunningFailStop_Faulted_Undetermined;
end;

procedure TfrmVentSystem.mniStopFailExhaustHigh1Click(Sender: TObject);  //speed 2 failure
var
 aElm : TElement;
begin            //belum selesai
  aElm := CtrlSystem.Controller.getElement(MCDElementID);

  TMCDElement(aElm).StateValueValid := svValid;
  TMCDElement(aElm).StateSwitchNoFault := esNoFault;
  TMCDElement(aElm).StateSwitchRemote := esRemote;
  TMCDElement(aElm).RFU := snrRFU;

  TMCDElement(aElm).StateManualAuto := smaAuto;
  TMCDElement(aElm).CommandStartSpeed1App := sacNotActivated;
  TMCDElement(aElm).CommandStartSpeed2App := sacActivated;
  TMCDElement(aElm).CommandStopApp := sacNotActivated;
  TMCDElement(aElm).CommandStartSpeed1HMI := sacNotActivated;
  TMCDElement(aElm).CommandStartSpeed2HMI := sacNotActivated;
  TMCDElement(aElm).CommandStopHMI := sacNotActivated;
  TMCDElement(aElm).RunCondition := srcOk;

  TMCDElement(aElm).StateSwitchSpeed2 := esNotSpeed2;

  TMCDElement(aElm).Parameters.GetParameter(epTTRANS).ParamDoubleValue := 1; // TTrans > 0 and timer >= TTrans,, timer = 10

  TMCDElement(aElm).StateElementDisabled := sdEnabled;

//  TMCDElement(aElm).AlarmElementStateCalc;

  TMotorControlDoubleSpeed(aObj).Status := MDtaStop_FailExhaustHigh;
end;

procedure TfrmVentSystem.mniStopFailSupplyLow1Click(Sender: TObject);      //speed1 failure
var
 aElm : TElement;
begin            //belum selesai
  aElm := CtrlSystem.Controller.getElement(MCDElementID);

  TMCDElement(aElm).StateValueValid := svValid;
  TMCDElement(aElm).StateSwitchNoFault := esNoFault;
  TMCDElement(aElm).StateSwitchRemote := esRemote;
  TMCDElement(aElm).RFU := snrRFU;

  TMCDElement(aElm).StateManualAuto := smaAuto;
  TMCDElement(aElm).CommandStartSpeed1App := sacActivated;
  TMCDElement(aElm).CommandStartSpeed2App := sacNotActivated;
  TMCDElement(aElm).CommandStopApp := sacNotActivated;
  TMCDElement(aElm).CommandStartSpeed1HMI := sacNotActivated;
  TMCDElement(aElm).CommandStartSpeed2HMI := sacNotActivated;
  TMCDElement(aElm).CommandStopHMI := sacNotActivated;
  TMCDElement(aElm).RunCondition := srcOk;

  TMCDElement(aElm).StateSwitchSpeed1 := esNotSpeed1;

  TMCDElement(aElm).Parameters.GetParameter(epTTRANS).ParamDoubleValue := 1; // TTrans > 0 and timer >= TTrans,, timer = 10

  TMCDElement(aElm).StateElementDisabled := sdEnabled;

//  TMCDElement(aElm).AlarmElementStateCalc;

  TMotorControlDoubleSpeed(aObj).Status := MDtaStop_FailSupplyLow;
end;

procedure TfrmVentSystem.mniMDtaRunSupplyLowFailStop1Click(Sender: TObject);  //speed 1_fail to stop
var
 aElm : TElement;
begin
  aElm := CtrlSystem.Controller.getElement(MCDElementID);

  TMCDElement(aElm).StateValueValid := svValid;
  TMCDElement(aElm).StateSwitchNoFault := esNoFault;
  TMCDElement(aElm).StateSwitchRemote := esRemote;
  TMCDElement(aElm).RFU := snrRFU;

  TMCDElement(aElm).StateManualAuto := smaAuto;
  TMCDElement(aElm).RunCondition := srcNotOk;

  TMCDElement(aElm).StateSwitchSpeed1 := esSpeed1;
  TMCDElement(aElm).StateSwitchSpeed2 := esNotSpeed2;

  TMCDElement(aElm).Parameters.GetParameter(epTTRANS).ParamDoubleValue := 1; // TTrans > 0 and timer >= TTrans,, timer = 10

  TMCDElement(aElm).StateElementDisabled := sdEnabled;

//  TMCDElement(aElm).AlarmElementStateCalc;

  TMotorControlDoubleSpeed(aObj).Status := MDtaRunSupplyLow_FailStop;
end;

procedure TfrmVentSystem.mniStopFanNotReady1Click(Sender: TObject);   //not RFU
var
 aElm : TElement;
begin
  aElm := CtrlSystem.Controller.getElement(MCDElementID);

  TMCDElement(aElm).StateValueValid := svValid;
  TMCDElement(aElm).StateSwitchNoFault := esNoFault;
  TMCDElement(aElm).StateSwitchRemote := esRemote;
  TMCDElement(aElm).RFU := snrNotRFU;
  TMCDElement(aElm).StateElementDisabled := sdEnabled;

//  TMCDElement(aElm).AlarmElementStateCalc;

  TMotorControlDoubleSpeed(aObj).Status := MDtaStop_FanNotReady;
end;

procedure TfrmVentSystem.mniStopped1Click(Sender: TObject);   //undeterminated fault
var
 aElm : TElement;
begin
  aElm := CtrlSystem.Controller.getElement(MCDElementID);

  TMCDElement(aElm).StateValueValid := svValid;
  TMCDElement(aElm).StateSwitchNoFault := esNoFault;
  TMCDElement(aElm).StateSwitchRemote := esLocal;
  TMCDElement(aElm).StateSwitchSpeed2 := esNotSpeed2;
  TMCDElement(aElm).StateSwitchSpeed1 := esNotSpeed1;
  TMCDElement(aElm).StateElementDisabled := sdEnabled;

//  TMCDElement(aElm).AlarmElementStateCalc;

  TMotorControlDoubleSpeed(aObj).Status := MDtaStopped;
end;

procedure TfrmVentSystem.mniStopped2Click(Sender: TObject);
var
  aElm : TElement;
begin
  aElm := CtrlSystem.Controller.getElement(MCEElementID);
  TMCEElement(aElm).StateValueValid := svValid;
  TMCEElement(aElm).StateSwitchNoFault := esNoFault;
  TMCEElement(aElm).StateSwitchRemote := esLocal;
  TMCEElement(aElm).StateSwitchRunning := esNotRunning;
  TMCEElement(aElm).StateElementDisabled := sdEnabled;

//  TMCEElement(aElm).AlarmElementStateCalc;

  TMotorControlElement(aObj).Status := MCtaStopped;
end;

procedure TfrmVentSystem.mniUndeterminedFaulted1Click(Sender: TObject);  //notValid
var
 aElm : TElement;
begin
  aElm := CtrlSystem.Controller.getElement(MCDElementID);
  TMCDElement(aElm).StateValueValid := svInvalid;
  TMCDElement(aElm).StateElementDisabled := sdEnabled;

//  TMCDElement(aElm).AlarmElementStateCalc;

  TMotorControlDoubleSpeed(aObj).Status := MDtaUndeterminedFaulted;
end;

procedure TfrmVentSystem.MotorControlDoubleSpeed1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  pt : Tpoint;
begin
  if sender is TMotorControlDoubleSpeed then
  begin
    MCDElementID := TMotorControlDoubleSpeed(sender).ElementID;
    if button = mbright then
    begin
      getcursorpos(pt);
      pmMCD.Popup(pt.x,pt.y);
    end;
  end
  else if sender is TMotorControlElement then
  begin
    MCEElementID := TMotorControlElement(sender).ElementID;
    if button = mbright then
    begin
      getcursorpos(pt);
      pmMCE.Popup(pt.x,pt.y);
    end;
  end;

  aObj := sender;
end;

procedure TfrmVentSystem.UpdateControlStatus(aMimicID, aStatus: byte;
  aElementID: string);
var
  i : integer;
  aComp : TComponent;
begin
  for I := 0 to frmVentSystem.ComponentCount - 1 do
  begin
    aComp := frmVentSystem.Components[i];

    if aComp is TMotorControlDoubleSpeed then
    begin
      if TMotorControlDoubleSpeed(aComp).ElementID = aElementID then
      begin
        case aStatus of
          Byte(seDisabled) : //disable
          begin
            TMotorControlDoubleSpeed(aComp).Status := MDtaDisableUnavailable;
          end;
          Byte(seStopped) :
          begin
            TMotorControlDoubleSpeed(aComp).Status := MDtaStopped;
          end;
          Byte(seSpeed1) :
          begin
            TMotorControlDoubleSpeed(aComp).Status := MDtaRemoteSupplyLow;
          end;
          Byte(seSpeed2) : //
          begin
            TMotorControlDoubleSpeed(aComp).Status := MDtaRemoteExhaustHigh;
          end;
          Byte(seNotRFU) : //
          begin
            TMotorControlDoubleSpeed(aComp).Status := MDtaStop_FanNotReady;
          end;
          Byte(seSpeed1Failure) : //
          begin
            TMotorControlDoubleSpeed(aComp).Status := MDtaStop_FailSupplyLow;
          end;
          Byte(seSpeed2Failure) : //
          begin
            TMotorControlDoubleSpeed(aComp).Status := MDtaStop_FailExhaustHigh;
          end;
          Byte(seSpeed1FailedToStop) : //
          begin
            TMotorControlDoubleSpeed(aComp).Status := MDtaRunSupplyLow_FailStop;
          end;
          Byte(seSpeed2FailedToStop) : //
          begin
            TMotorControlDoubleSpeed(aComp).Status := MDtaRunExhaustHigh_FailSupplyLow2;
          end;
          Byte(seInvalid) : //
          begin
            TMotorControlDoubleSpeed(aComp).Status := MDtaUndeterminedFaulted;
          end;

        end;
      end;
    end
    else if aComp is TMotorControlElement then
    begin
      if TMotorControlElement(aComp).ElementID = aElementID then
      begin
        case aStatus of
          Byte(seDisabled) :
            TMotorControlElement(aComp).Status := MCtaDisableUnavailable;
          Byte(seStopped) :
            TMotorControlElement(aComp).Status := MCtaStopped;
          Byte(seRunning) :
            TMotorControlElement(aComp).Status := MCtaRunning;
          Byte(seNotRFU) :
            TMotorControlElement(aComp).Status := MCtaNotReadyForUse;
          Byte(seRunFailure) :
            TMotorControlElement(aComp).Status := MCtaFailedToStart;
          Byte(seInvalid) :
            TMotorControlElement(aComp).Status := MCtaRunningFailStop_Faulted_Undetermined;
        end;

      end;
    end;;
  end

end;

end.
