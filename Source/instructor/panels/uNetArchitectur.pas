unit uNetArchitectur;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uComputer, uSwitchElement, uBaseComponent, jpeg, ExtCtrls,
  Menus;

type
  E_NetState = (nsOFF, nsON);

  TfrmNetPanel = class(TForm)
    pmNetArch: TPopupMenu;
    mniON: TMenuItem;
    mniOFF: TMenuItem;
    pnlBackground: TPanel;
    Computer1: TComputer;
    Computer10: TComputer;
    Computer11: TComputer;
    Computer12: TComputer;
    Computer2: TComputer;
    Computer3: TComputer;
    Computer4: TComputer;
    Computer5: TComputer;
    Computer6: TComputer;
    Computer7: TComputer;
    Computer8: TComputer;
    Computer9: TComputer;
    Image1: TImage;
    SwitchElement1: TSwitchElement;
    SwitchElement10: TSwitchElement;
    SwitchElement100: TSwitchElement;
    SwitchElement101: TSwitchElement;
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
    SwitchElement41: TSwitchElement;
    SwitchElement42: TSwitchElement;
    SwitchElement43: TSwitchElement;
    SwitchElement44: TSwitchElement;
    SwitchElement45: TSwitchElement;
    SwitchElement46: TSwitchElement;
    SwitchElement47: TSwitchElement;
    SwitchElement48: TSwitchElement;
    SwitchElement49: TSwitchElement;
    SwitchElement5: TSwitchElement;
    SwitchElement50: TSwitchElement;
    SwitchElement51: TSwitchElement;
    SwitchElement52: TSwitchElement;
    SwitchElement53: TSwitchElement;
    SwitchElement54: TSwitchElement;
    SwitchElement55: TSwitchElement;
    SwitchElement56: TSwitchElement;
    SwitchElement57: TSwitchElement;
    SwitchElement58: TSwitchElement;
    SwitchElement59: TSwitchElement;
    SwitchElement6: TSwitchElement;
    SwitchElement60: TSwitchElement;
    SwitchElement61: TSwitchElement;
    SwitchElement62: TSwitchElement;
    SwitchElement63: TSwitchElement;
    SwitchElement64: TSwitchElement;
    SwitchElement65: TSwitchElement;
    SwitchElement66: TSwitchElement;
    SwitchElement67: TSwitchElement;
    SwitchElement68: TSwitchElement;
    SwitchElement69: TSwitchElement;
    SwitchElement7: TSwitchElement;
    SwitchElement70: TSwitchElement;
    SwitchElement71: TSwitchElement;
    SwitchElement72: TSwitchElement;
    SwitchElement73: TSwitchElement;
    SwitchElement74: TSwitchElement;
    SwitchElement75: TSwitchElement;
    SwitchElement76: TSwitchElement;
    SwitchElement77: TSwitchElement;
    SwitchElement78: TSwitchElement;
    SwitchElement79: TSwitchElement;
    SwitchElement8: TSwitchElement;
    SwitchElement80: TSwitchElement;
    SwitchElement81: TSwitchElement;
    SwitchElement82: TSwitchElement;
    SwitchElement83: TSwitchElement;
    SwitchElement84: TSwitchElement;
    SwitchElement85: TSwitchElement;
    SwitchElement86: TSwitchElement;
    SwitchElement87: TSwitchElement;
    SwitchElement88: TSwitchElement;
    SwitchElement89: TSwitchElement;
    SwitchElement9: TSwitchElement;
    SwitchElement90: TSwitchElement;
    SwitchElement91: TSwitchElement;
    SwitchElement92: TSwitchElement;
    SwitchElement93: TSwitchElement;
    SwitchElement94: TSwitchElement;
    SwitchElement95: TSwitchElement;
    SwitchElement96: TSwitchElement;
    SwitchElement97: TSwitchElement;
    SwitchElement98: TSwitchElement;
    SwitchElement99: TSwitchElement;
    procedure IPMSComponentMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ChangeState(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FSelectedElement : TIPMSBaseComponent;
    aObj : TObject;
  public
    { Public declarations }
  end;

var
  frmNetPanel: TfrmNetPanel;

implementation

uses uControllerSystem, uDataType, uSWE, uElement, uIPMS_Data;

{$R *.dfm}

procedure TfrmNetPanel.ChangeState(Sender: TObject);
var
  element : TElement;
begin
  element := CtrlSystem.Controller.getElement(FSelectedElement.ElementID);

  case E_NetState(TMenuItem(Sender).Tag) of
    nsON:
    begin
      TSWEElement(element).StateInState := True;
      TSWEElement(element).NONC := 1; //NC
      TSWEElement(element).Mode := 1; // Mode No Alarm
      TSWEElement(element).Parameters.GetParameter(epTDELAY).ParamDoubleValue := 0;
      TSWEElement(element).StateElementDisabled := sdEnabled;

      if aObj is TComputer then
        TComputer(aObj).Status := SWtaOk
      else if aObj is TSwitchElement then
        TSwitchElement(aObj).Status := SWtaOk;
//      TSWEElement(element).AlarmElementStateCalc;
    end;
    nsOFF:
    begin
      TSWEElement(element).StateElementDisabled := sdDisabled;

      if aObj is TComputer then
        TComputer(aObj).Status := SWtaDisabled
      else if aObj is TSwitchElement then
        TSwitchElement(aObj).Status := SWtaDisabled;
//      TSWEElement(element).AlarmElementStateCalc;
    end;
  end;
end;

procedure TfrmNetPanel.FormCreate(Sender: TObject);
begin
  aObj := TObject.Create;
end;

procedure TfrmNetPanel.IPMSComponentMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  pt : TPoint;
begin
  if Button = mbRight then
  begin
    aObj := sender;
    FSelectedElement := TIPMSBaseComponent(Sender);
    GetCursorPos(pt);
    pmNetArch.Popup(pt.X, pt.Y);
  end;
end;

end.
