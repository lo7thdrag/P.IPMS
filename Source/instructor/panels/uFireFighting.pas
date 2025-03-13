unit uFireFighting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, jpeg, ComCtrls, uBaseComponent, uSwitchTriangle,
  Menus, uSwitchElement, uFireFightingControlSystem;

type
  TfrmFireFighting = class(TForm)
    pgcFireFighting: TPageControl;
    tsDeckBottom: TTabSheet;
    tsDeckTop: TTabSheet;
    imgDeckBottom: TImage;
    imgDeckTop: TImage;
    SwitchTriangle1: TSwitchTriangle;
    SwitchTriangle10: TSwitchTriangle;
    SwitchTriangle100: TSwitchTriangle;
    SwitchTriangle101: TSwitchTriangle;
    SwitchTriangle102: TSwitchTriangle;
    SwitchTriangle103: TSwitchTriangle;
    SwitchTriangle104: TSwitchTriangle;
    SwitchTriangle105: TSwitchTriangle;
    SwitchTriangle106: TSwitchTriangle;
    SwitchTriangle107: TSwitchTriangle;
    SwitchTriangle108: TSwitchTriangle;
    SwitchTriangle109: TSwitchTriangle;
    SwitchTriangle11: TSwitchTriangle;
    SwitchTriangle110: TSwitchTriangle;
    SwitchTriangle111: TSwitchTriangle;
    SwitchTriangle112: TSwitchTriangle;
    SwitchTriangle113: TSwitchTriangle;
    SwitchTriangle114: TSwitchTriangle;
    SwitchTriangle12: TSwitchTriangle;
    SwitchTriangle13: TSwitchTriangle;
    SwitchTriangle14: TSwitchTriangle;
    SwitchTriangle15: TSwitchTriangle;
    SwitchTriangle16: TSwitchTriangle;
    SwitchTriangle17: TSwitchTriangle;
    SwitchTriangle18: TSwitchTriangle;
    SwitchTriangle19: TSwitchTriangle;
    SwitchTriangle2: TSwitchTriangle;
    SwitchTriangle20: TSwitchTriangle;
    SwitchTriangle21: TSwitchTriangle;
    SwitchTriangle22: TSwitchTriangle;
    SwitchTriangle23: TSwitchTriangle;
    SwitchTriangle24: TSwitchTriangle;
    SwitchTriangle25: TSwitchTriangle;
    SwitchTriangle26: TSwitchTriangle;
    SwitchTriangle27: TSwitchTriangle;
    SwitchTriangle28: TSwitchTriangle;
    SwitchTriangle29: TSwitchTriangle;
    SwitchTriangle3: TSwitchTriangle;
    SwitchTriangle30: TSwitchTriangle;
    SwitchTriangle31: TSwitchTriangle;
    SwitchTriangle32: TSwitchTriangle;
    SwitchTriangle33: TSwitchTriangle;
    SwitchTriangle34: TSwitchTriangle;
    SwitchTriangle35: TSwitchTriangle;
    SwitchTriangle36: TSwitchTriangle;
    SwitchTriangle37: TSwitchTriangle;
    SwitchTriangle38: TSwitchTriangle;
    SwitchTriangle39: TSwitchTriangle;
    SwitchTriangle4: TSwitchTriangle;
    SwitchTriangle40: TSwitchTriangle;
    SwitchTriangle41: TSwitchTriangle;
    SwitchTriangle42: TSwitchTriangle;
    SwitchTriangle43: TSwitchTriangle;
    SwitchTriangle44: TSwitchTriangle;
    SwitchTriangle45: TSwitchTriangle;
    SwitchTriangle46: TSwitchTriangle;
    SwitchTriangle47: TSwitchTriangle;
    SwitchTriangle48: TSwitchTriangle;
    SwitchTriangle49: TSwitchTriangle;
    SwitchTriangle5: TSwitchTriangle;
    SwitchTriangle50: TSwitchTriangle;
    SwitchTriangle51: TSwitchTriangle;
    SwitchTriangle52: TSwitchTriangle;
    SwitchTriangle53: TSwitchTriangle;
    SwitchTriangle54: TSwitchTriangle;
    SwitchTriangle55: TSwitchTriangle;
    SwitchTriangle56: TSwitchTriangle;
    SwitchTriangle57: TSwitchTriangle;
    SwitchTriangle58: TSwitchTriangle;
    SwitchTriangle59: TSwitchTriangle;
    SwitchTriangle6: TSwitchTriangle;
    SwitchTriangle60: TSwitchTriangle;
    SwitchTriangle61: TSwitchTriangle;
    SwitchTriangle62: TSwitchTriangle;
    SwitchTriangle63: TSwitchTriangle;
    SwitchTriangle64: TSwitchTriangle;
    SwitchTriangle65: TSwitchTriangle;
    SwitchTriangle66: TSwitchTriangle;
    SwitchTriangle67: TSwitchTriangle;
    SwitchTriangle68: TSwitchTriangle;
    SwitchTriangle69: TSwitchTriangle;
    SwitchTriangle7: TSwitchTriangle;
    SwitchTriangle70: TSwitchTriangle;
    SwitchTriangle71: TSwitchTriangle;
    SwitchTriangle72: TSwitchTriangle;
    SwitchTriangle73: TSwitchTriangle;
    SwitchTriangle74: TSwitchTriangle;
    SwitchTriangle75: TSwitchTriangle;
    SwitchTriangle76: TSwitchTriangle;
    SwitchTriangle77: TSwitchTriangle;
    SwitchTriangle78: TSwitchTriangle;
    SwitchTriangle79: TSwitchTriangle;
    SwitchTriangle8: TSwitchTriangle;
    SwitchTriangle80: TSwitchTriangle;
    SwitchTriangle81: TSwitchTriangle;
    SwitchTriangle82: TSwitchTriangle;
    SwitchTriangle83: TSwitchTriangle;
    SwitchTriangle84: TSwitchTriangle;
    SwitchTriangle85: TSwitchTriangle;
    SwitchTriangle86: TSwitchTriangle;
    SwitchTriangle87: TSwitchTriangle;
    SwitchTriangle88: TSwitchTriangle;
    SwitchTriangle89: TSwitchTriangle;
    SwitchTriangle9: TSwitchTriangle;
    SwitchTriangle90: TSwitchTriangle;
    SwitchTriangle91: TSwitchTriangle;
    SwitchTriangle92: TSwitchTriangle;
    SwitchTriangle93: TSwitchTriangle;
    SwitchTriangle94: TSwitchTriangle;
    SwitchTriangle95: TSwitchTriangle;
    SwitchTriangle96: TSwitchTriangle;
    SwitchTriangle97: TSwitchTriangle;
    SwitchTriangle98: TSwitchTriangle;
    SwitchTriangle99: TSwitchTriangle;
    SwitchTriangle115: TSwitchTriangle;
    SwitchTriangle116: TSwitchTriangle;
    SwitchTriangle117: TSwitchTriangle;
    SwitchTriangle118: TSwitchTriangle;
    SwitchTriangle119: TSwitchTriangle;
    SwitchTriangle120: TSwitchTriangle;
    SwitchTriangle121: TSwitchTriangle;
    SwitchTriangle122: TSwitchTriangle;
    SwitchTriangle123: TSwitchTriangle;
    SwitchTriangle124: TSwitchTriangle;
    SwitchTriangle125: TSwitchTriangle;
    SwitchTriangle126: TSwitchTriangle;
    SwitchTriangle127: TSwitchTriangle;
    SwitchTriangle128: TSwitchTriangle;
    SwitchTriangle129: TSwitchTriangle;
    SwitchTriangle130: TSwitchTriangle;
    SwitchTriangle131: TSwitchTriangle;
    SwitchTriangle132: TSwitchTriangle;
    SwitchTriangle133: TSwitchTriangle;
    SwitchTriangle134: TSwitchTriangle;
    SwitchTriangle135: TSwitchTriangle;
    SwitchTriangle136: TSwitchTriangle;
    SwitchTriangle137: TSwitchTriangle;
    SwitchTriangle138: TSwitchTriangle;
    SwitchTriangle139: TSwitchTriangle;
    SwitchTriangle140: TSwitchTriangle;
    SwitchTriangle141: TSwitchTriangle;
    SwitchTriangle142: TSwitchTriangle;
    SwitchTriangle143: TSwitchTriangle;
    SwitchTriangle144: TSwitchTriangle;
    SwitchTriangle145: TSwitchTriangle;
    SwitchTriangle146: TSwitchTriangle;
    SwitchTriangle147: TSwitchTriangle;
    SwitchTriangle148: TSwitchTriangle;
    SwitchTriangle149: TSwitchTriangle;
    SwitchTriangle150: TSwitchTriangle;
    SwitchTriangle151: TSwitchTriangle;
    SwitchTriangle152: TSwitchTriangle;
    SwitchTriangle153: TSwitchTriangle;
    SwitchTriangle154: TSwitchTriangle;
    SwitchTriangle155: TSwitchTriangle;
    SwitchTriangle156: TSwitchTriangle;
    SwitchTriangle157: TSwitchTriangle;
    pm1: TPopupMenu;
    Alarm1: TMenuItem;
    mniEnabled1: TMenuItem;
    Disabled1: TMenuItem;
    SwitchElement1: TSwitchElement;
    SwitchElement2: TSwitchElement;
    SwitchElement3: TSwitchElement;
    SwitchElement4: TSwitchElement;
    SwitchElement5: TSwitchElement;
    SwitchElement6: TSwitchElement;
    img3: TImage;
    img21: TImage;
    procedure SwitchTriangle1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Alarm1Click(Sender: TObject);
    procedure State1Click(Sender: TObject);
    procedure Disabled1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure img1Click(Sender: TObject);
    procedure img21Click(Sender: TObject);
    procedure pgcFireFightingChange(Sender: TObject);
    procedure SwitchElement1Click(Sender: TObject);
    procedure SwitchElement2Click(Sender: TObject);
    procedure mniFalse1Click(Sender: TObject);
    procedure img3Click(Sender: TObject);
  private
    { Private declarations }
    swElementID : string;
    swMimicID  : integer;
    swObj : TObject;
  public
    { Public declarations }
    procedure UpdateControlStatus(aMimicID, aStatus : byte; aElementID : string);
  end;

var
  frmFireFighting: TfrmFireFighting;

implementation

uses uDataType, uIPMS_Data, uControllerSystem, uElement, uSWE, uMimicsSystem ;

{$R *.dfm}

procedure TfrmFireFighting.Alarm1Click(Sender: TObject);
var
  aElm : TElement;
begin
  //set kondisi alarm
  aElm := CtrlSystem.Controller.getElement(swElementID);
  TSWEElement(aElm).StateInState := True;
  TSWEElement(aElm).StateAlarmInhibited := siNotInhibited;
  TSWEElement(aElm).NONC := 0; //NO
  TSWEElement(aElm).Mode := 0; // Mode Alarm
  TSWEElement(aElm).Parameters.GetParameter(epTDELAY).ParamDoubleValue := 0;
  TSWEElement(aElm).StateElementDisabled := sdEnabled;

//  TSWEElement(aElm).AlarmElementStateCalc;

  if swObj is TSwitchTriangle then
    TSwitchTriangle(swObj).Status := SWtaAlarm
  else if swObj is TSwitchElement then
    TSwitchElement(swObj).Status := SWtaAlarm;

end;

procedure TfrmFireFighting.Disabled1Click(Sender: TObject);
var
  aElm : TElement;
begin
  aElm := CtrlSystem.Controller.getElement(swElementID);
  TSWEElement(aElm).StateElementDisabled := sdDisabled;

//  TSWEElement(aElm).AlarmElementStateCalc;

  if swObj is TSwitchTriangle then
    TSwitchTriangle(swObj).Status := SWtaDisabled
  else if swObj is TSwitchElement then
    TSwitchElement(swObj).Status := SWtaDisabled;

end;

procedure TfrmFireFighting.State1Click(Sender: TObject);
var
  aElm : TElement;
begin
   //set kondisi state 1

  aElm := CtrlSystem.Controller.getElement(swElementID);
//  TSWEElement(aElm).StateInState := True;
//  TSWEElement(aElm).NONC := 1; //NC
//  TSWEElement(aElm).Mode := 1; // Mode No Alarm
//  TSWEElement(aElm).Parameters.GetParameter(epTDELAY).ParamDoubleValue := 0;
//  TSWEElement(aElm).StateElementDisabled := sdEnabled;

  TSWEElement(aElm).StateElementDisabled := sdUnavailable;

  if swObj is TSwitchTriangle then
    TSwitchTriangle(swObj).Status := SWtaFalse
  else if swObj is TSwitchElement then
    TSwitchElement(swObj).Status := SWtaFalse;

end;

procedure TfrmFireFighting.FormCreate(Sender: TObject);
begin
  swObj := TObject.Create;
end;

procedure TfrmFireFighting.img1Click(Sender: TObject);
begin
  pgcFireFighting.ActivePage := tsDeckBottom;

  SysMimics.Mimic.ShowMimic(mtFireDet1);
  SysMimics.Mimic.AddMimicHistory(Ord(mtFireDet1));
end;

procedure TfrmFireFighting.img21Click(Sender: TObject);
begin
  pgcFireFighting.ActivePage := tsDeckBottom;

  SysMimics.Mimic.ShowMimic(mtFireDet1);
  SysMimics.Mimic.AddMimicHistory(Ord(mtFireDet1));

end;

procedure TfrmFireFighting.img3Click(Sender: TObject);
begin
  pgcFireFighting.ActivePage := tsDeckTop;

  SysMimics.Mimic.ShowMimic(mtFireDet2);
  SysMimics.Mimic.AddMimicHistory(Ord(mtFireDet2));
end;

procedure TfrmFireFighting.mniFalse1Click(Sender: TObject);
var
  aElm : TElement;
begin
  aElm := CtrlSystem.Controller.getElement(swElementID);
  TSWEElement(aElm).StateElementDisabled := sdUnavailable;

  if swObj is TSwitchTriangle then
    TSwitchTriangle(swObj).Status := SWtaFalse
  else if swObj is TSwitchElement then
    TSwitchElement(swObj).Status := SWtaFalse;
end;

procedure TfrmFireFighting.pgcFireFightingChange(Sender: TObject);
begin
  if pgcFireFighting.ActivePage = tsDeckBottom then
  begin
    SysMimics.Mimic.ShowMimic(mtFireDet1);
    SysMimics.Mimic.AddMimicHistory(Ord(mtFireDet1));
  end
  else
  begin
    SysMimics.Mimic.ShowMimic(mtFireDet2);
    SysMimics.Mimic.AddMimicHistory(Ord(mtFireDet2));
  end;
end;

procedure TfrmFireFighting.SwitchElement1Click(Sender: TObject);
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

//    TSWEElement(aElm).AlarmElementStateCalc;

    TSwitchElement(Sender).Status := SWtaOK;
    frmFFSystem.SwitchElement1.Status := SWtaOk;

    TSWEElement(CtrlSystem.Controller.getElement('5552E0021B')).StateElementDisabled := sdUnavailable;
//    TSWEElement(CtrlSystem.Controller.getElement('5552E0021B')).StateAlarm := saNone;
    SwitchElement2.Status := SWtaFalse;//unavailable
    frmFFSystem.SwitchElement2.Status := SWtaFalse;
  end
  else if SwitchElement1.Status = SWtaOk then
  begin
    TSwitchElement(Sender).Status := SWtaFalse;
    frmFFSystem.SwitchElement1.Status := SWtaFalse;
    TSWEElement(CtrlSystem.Controller.getElement('5552E0021A')).StateElementDisabled := sdUnavailable;
  end;

end;

procedure TfrmFireFighting.SwitchElement2Click(Sender: TObject);
var
  aElm : TElement;
begin
  if SwitchElement2.Status = SWtaFalse then
  begin

    //set kondisi alarm
    aElm := CtrlSystem.Controller.getElement('5552E0021B');
    TSWEElement(aElm).StateInState := True;
    TSWEElement(aElm).StateAlarmInhibited := siNotInhibited;
    TSWEElement(aElm).NONC:= 0; //NO
    TSWEElement(aElm).Mode := 0; // Mode Alarm
    TSWEElement(aElm).Parameters.GetParameter(epTDELAY).ParamDoubleValue := 0;
    TSWEElement(aElm).StateElementDisabled := sdEnabled;

//    TSWEElement(aElm).AlarmElementStateCalc;

    SwitchElement2.Status := SWtaAlarm;
    frmFFSystem.SwitchElement2.Status := SWtaAlarm;

    TSWEElement(CtrlSystem.Controller.getElement('5552E0021A')).StateElementDisabled := sdUnavailable;
    SwitchElement1.Status := SWtaFalse;
    frmFFSystem.SwitchElement1.Status := SWtaFalse;
  end
  else if SwitchElement2.Status = SWtaAlarm then
  begin
    SwitchElement2.Status := SWtaFalse;
    frmFFSystem.SwitchElement2.Status := SWtaFalse;
    TSWEElement(CtrlSystem.Controller.getElement('5552E0021B')).StateElementDisabled := sdUnavailable;
//    TSWEElement(CtrlSystem.Controller.getElement('5552E0021B')).StateAlarm := saNone;
  end;
end;

procedure TfrmFireFighting.SwitchTriangle1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  pt : Tpoint;
begin
  if button = mbright then
  begin
    getcursorpos(pt);
    pm1.Popup(pt.x,pt.y);
  end;

  swElementID := TSwitchTriangle(sender).ElementID;
  swObj := sender;
  if pgcFireFighting.ActivePage = tsDeckBottom then
    swMimicID := 41
  else if pgcFireFighting.ActivePage = tsDeckTop then
    swMimicID := 42;

end;

procedure TfrmFireFighting.UpdateControlStatus(aMimicID, aStatus: byte;
  aElementID: string);
var
  i : integer;
  aComp : TComponent;
begin
  for I := 0 to frmFireFighting.ComponentCount - 1 do
  begin
    aComp := frmFireFighting.Components[i];

    if aComp is TSwitchTriangle then
    begin
      if TSwitchTriangle(aComp).ElementID = aElementID then
      begin
        case aStatus of
          Byte(seDisabled) : //disable
          begin
            TSwitchTriangle(aComp).Status := SWtaDisabled
          end;
          Byte(seUnavailable) : //seUnavailable >> anggapan enable
          begin
            TSwitchTriangle(aComp).Status := SWtaFalse
          end;
          Byte(seAlarm) : //Alarm
          begin
            TSwitchTriangle(aComp).Status := SWtaAlarm;
          end;
        end;
      end;
    end;

  end;

end;

end.
