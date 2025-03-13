unit uNav_CommSystem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;

type
  TfrmNav_CommSystem = class(TForm)
    img1: TImage;
    cbb1: TComboBox;
    cbb2: TComboBox;
    cbb3: TComboBox;
    cbb4: TComboBox;
    cbb5: TComboBox;
    cbb6: TComboBox;
    cbb8: TComboBox;
    cbb9: TComboBox;
    cbb10: TComboBox;
    cbb11: TComboBox;
    cbb12: TComboBox;
    cbb13: TComboBox;
    cbb14: TComboBox;
    cbb15: TComboBox;
    cbb7: TComboBox;
    procedure cbb1Select(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure UpdateControlStatus(aMimicID, aStatus : byte; aElementID : string);
  end;

var
  frmNav_CommSystem: TfrmNav_CommSystem;

implementation

uses uControllerSystem, uDataType,  uElement, uSWE;

{$R *.dfm}

procedure TfrmNav_CommSystem.cbb1Select(Sender: TObject);
var
  aElm : TElement;
begin
  aElm := CtrlSystem.Controller.getElement(TComboBox(sender).Hint);

  if TComboBox(sender).Text = 'Enabled' then
  begin
    TComboBox(sender).Color := clLime;
    TComboBox(sender).Font.Color := clBlack;

    TSWEElement(aElm).StateInState := True;
    TSWEElement(aElm).NONC := 1; //NC
    TSWEElement(aElm).Mode := 1; // Mode No Alarm
    TSWEElement(aElm).Parameters.GetParameter(epTDELAY).ParamDoubleValue := 0;
    TSWEElement(aElm).StateElementDisabled := sdEnabled;

//    TSWEElement(aElm).AlarmElementStateCalc;

  end
  else if TComboBox(sender).Text = 'Disabled' then
  begin
    TComboBox(sender).Color := clFuchsia;
    TComboBox(sender).Font.Color := clWhite;

    TSWEElement(aElm).StateElementDisabled := sdDisabled;

//    TSWEElement(aElm).AlarmElementStateCalc;

  end
  else if TComboBox(sender).Text = 'Alarm' then
  begin
    TComboBox(sender).Color := clRed;
    TComboBox(sender).Font.Color := clWhite;

    TSWEElement(aElm).StateInState := True;
    TSWEElement(aElm).StateAlarmInhibited := siNotInhibited;
    TSWEElement(aElm).NONC := 0; //NO
    TSWEElement(aElm).Mode := 0; // Mode Alarm
    TSWEElement(aElm).Parameters.GetParameter(epTDELAY).ParamDoubleValue := 0;
    TSWEElement(aElm).StateElementDisabled := sdEnabled;

//    TSWEElement(aElm).AlarmElementStateCalc;

  end;

end;

procedure TfrmNav_CommSystem.UpdateControlStatus(aMimicID, aStatus: byte;
  aElementID: string);
var
  i : integer;
  aComp : TComponent;
begin
  for I := 0 to frmNav_CommSystem.ComponentCount - 1 do
  begin
    aComp := frmNav_CommSystem.Components[i];

    if aComp is TComboBox then
    begin
      if TComboBox(aComp).Hint = aElementID then
      begin
        case aStatus of
          Byte(seState1) : //state 1
          begin
            TComboBox(aComp).ItemIndex := 0;
            TComboBox(aComp).Color := clLime;
            TComboBox(aComp).Font.Color := clBlack;
          end;
          Byte(seDisabled) : //Disable
          begin
            TComboBox(aComp).ItemIndex := 1;
            TComboBox(aComp).Color := clFuchsia;
            TComboBox(aComp).Font.Color := clWhite;
          end;
          Byte(seAlarm) : //Alarm
          begin
            TComboBox(aComp).ItemIndex := 2;
            TComboBox(aComp).Color := clRed;
            TComboBox(aComp).Font.Color := clWhite;
          end;
          Byte(seUnavailable) :
          begin
            TComboBox(aComp).Text := '';
            TComboBox(aComp).Color := clGray;
            TComboBox(aComp).Font.Color := clBlack;
          end;
        end;
      end;
    end;

  end;



end;

end.
