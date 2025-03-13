unit uBilgeSystemIns;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, Menus, uBaseComponent, uSwitchElement;

type
  TfrmBilgeSystemIns = class(TForm)
    imgBilgeSystem: TImage;
    SwitchElement1: TSwitchElement;
    SwitchElement10: TSwitchElement;
    SwitchElement11: TSwitchElement;
    SwitchElement12: TSwitchElement;
    SwitchElement13: TSwitchElement;
    SwitchElement14: TSwitchElement;
    SwitchElement15: TSwitchElement;
    SwitchElement16: TSwitchElement;
    SwitchElement17: TSwitchElement;
    SwitchElement18: TSwitchElement;
    SwitchElement19: TSwitchElement;
    SwitchElement2: TSwitchElement;
    SwitchElement20: TSwitchElement;
    SwitchElement21: TSwitchElement;
    SwitchElement22: TSwitchElement;
    SwitchElement23: TSwitchElement;
    SwitchElement24: TSwitchElement;
    SwitchElement25: TSwitchElement;
    SwitchElement26: TSwitchElement;
    SwitchElement27: TSwitchElement;
    SwitchElement28: TSwitchElement;
    SwitchElement29: TSwitchElement;
    SwitchElement3: TSwitchElement;
    SwitchElement30: TSwitchElement;
    SwitchElement31: TSwitchElement;
    SwitchElement32: TSwitchElement;
    SwitchElement33: TSwitchElement;
    SwitchElement34: TSwitchElement;
    SwitchElement35: TSwitchElement;
    SwitchElement36: TSwitchElement;
    SwitchElement37: TSwitchElement;
    SwitchElement38: TSwitchElement;
    SwitchElement39: TSwitchElement;
    SwitchElement4: TSwitchElement;
    SwitchElement40: TSwitchElement;
    SwitchElement5: TSwitchElement;
    SwitchElement6: TSwitchElement;
    SwitchElement7: TSwitchElement;
    SwitchElement8: TSwitchElement;
    SwitchElement9: TSwitchElement;
    pm1: TPopupMenu;
    mniAlarm1: TMenuItem;
    mniEnable1: TMenuItem;
    mniDisable1: TMenuItem;
    mniFalse1: TMenuItem;
    procedure SwitchElement1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mniAlarm1Click(Sender: TObject);
    procedure mniEnable1Click(Sender: TObject);
    procedure mniDisable1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mniFalse1Click(Sender: TObject);
  private
    { Private declarations }
    aElementID : string;
    aObj : TObject;
  public
    { Public declarations }
  end;

var
  frmBilgeSystemIns: TfrmBilgeSystemIns;

implementation

uses uSWEInput, uControllerSystem, uDataType, uSWE, uIPMS_Data;
{$R *.dfm}


procedure TfrmBilgeSystemIns.FormCreate(Sender: TObject);
begin
  aObj := TObject.Create;
end;

procedure TfrmBilgeSystemIns.mniAlarm1Click(Sender: TObject);
begin
  TSWEElement(CtrlSystem.Controller.getElement(aElementID)).StateAlarmInhibited := siNotInhibited;
  TSWEElement(CtrlSystem.Controller.getElement(aElementID)).Mode := 0;

  if TSWEElement(CtrlSystem.Controller.getElement(aElementID)).NONC = 0 then
    TSWEElement(CtrlSystem.Controller.getElement(aElementID)).StateInState := True
  else if TSWEElement(CtrlSystem.Controller.getElement(aElementID)).NONC = 1 then
    TSWEElement(CtrlSystem.Controller.getElement(aElementID)).StateInState := False;

  TSwitchElement(aObj).Status := SWtaAlarm;
end;

procedure TfrmBilgeSystemIns.mniDisable1Click(Sender: TObject);
begin
  TSWEElement(CtrlSystem.Controller.getElement(aElementID)).StateElementDisabled := sdDisabled;
  TSwitchElement(aObj).Status := SWtaDisabled;
end;

procedure TfrmBilgeSystemIns.mniEnable1Click(Sender: TObject);
begin
  TSWEElement(CtrlSystem.Controller.getElement(aElementID)).StateAlarmInhibited := siInhibited;
  TSWEElement(CtrlSystem.Controller.getElement(aElementID)).Mode := 1;
  TSWEElement(CtrlSystem.Controller.getElement(aElementID)).StateElementDisabled := sdEnabled;

  if TSWEElement(CtrlSystem.Controller.getElement(aElementID)).NONC = 0 then
    TSWEElement(CtrlSystem.Controller.getElement(aElementID)).StateInState := False
  else if TSWEElement(CtrlSystem.Controller.getElement(aElementID)).NONC = 1 then
    TSWEElement(CtrlSystem.Controller.getElement(aElementID)).StateInState := True;

  TSwitchElement(aObj).Status := SWtaOk;
end;

procedure TfrmBilgeSystemIns.mniFalse1Click(Sender: TObject);
begin
  TSWEElement(CtrlSystem.Controller.getElement(aElementID)).StateElementDisabled := sdUnavailable;
  TSwitchElement(aObj).Status := SWtaFalse;
end;

procedure TfrmBilgeSystemIns.SwitchElement1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  pt : TPoint;
begin
//  if not Assigned(frmSWEInput) then
//    frmSWEInput := TfrmSWEInput.Create(Self);

  if Button = mbRight then
  begin
    GetCursorPos(pt);
    pm1.Popup(pt.x,pt.y);

    aElementID := TSwitchElement(sender).ElementID;
    aObj := Sender;
  end;

//  frmSWEInput.setElementID(TSwitchElement(Sender).ElementID);
//  frmSWEInput.Top := pt.Y;
//  frmSWEInput.Left := pt.X;
//  frmSWEInput.Show;

end;

end.
