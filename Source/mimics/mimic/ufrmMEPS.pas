unit ufrmMEPS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMimics, ExtCtrls, jpeg, uValveControl, uSwitchNBCD,
  uBaseComponent, uAnalogSensor, uControlElement, uMotorControlElement,
  uSwitchTriangle, uSwitchElement, uShortcut;

type
  TfrmMEPS = class(TfrmMimics)
    Image1: TImage;
    AnalogSensor1: TAnalogSensor;
    AnalogSensor2: TAnalogSensor;
    AnalogSensor3: TAnalogSensor;
    AnalogSensor4: TAnalogSensor;
    AnalogSensor5: TAnalogSensor;
    AnalogSensor6: TAnalogSensor;
    AnalogSensor7: TAnalogSensor;
    AnalogSensor8: TAnalogSensor;
    AnalogSensor9: TAnalogSensor;
    AnalogSensor10: TAnalogSensor;
    AnalogSensor11: TAnalogSensor;
    AnalogSensor12: TAnalogSensor;
    AnalogSensor13: TAnalogSensor;
    AnalogSensor14: TAnalogSensor;
    AnalogSensor15: TAnalogSensor;
    AnalogSensor16: TAnalogSensor;
    AnalogSensor17: TAnalogSensor;
    AnalogSensor18: TAnalogSensor;
    MotorControlElement1: TMotorControlElement;
    MotorControlElement2: TMotorControlElement;
    AnalogSensor19: TAnalogSensor;
    AnalogSensor20: TAnalogSensor;
    AnalogSensor21: TAnalogSensor;
    AnalogSensor22: TAnalogSensor;
    AnalogSensor23: TAnalogSensor;
    SwitchTriangle1: TSwitchTriangle;
    SwitchTriangle2: TSwitchTriangle;
    ValveControl3: TValveControl;
    ValveControl1: TValveControl;
    ValveControl2: TValveControl;
    SwitchTriangle3: TSwitchTriangle;
    SwitchTriangle4: TSwitchTriangle;
    SwitchTriangle5: TSwitchTriangle;
    SwitchTriangle6: TSwitchTriangle;
    SwitchElement1: TSwitchElement;
    SwitchElement2: TSwitchElement;
    SwitchElement3: TSwitchElement;
    SwitchElement4: TSwitchElement;
    SwitchElement5: TSwitchElement;
    SwitchElement6: TSwitchElement;
    SwitchElement7: TSwitchElement;
    SwitchElement8: TSwitchElement;
    SwitchElement9: TSwitchElement;
    SwitchElement10: TSwitchElement;
    SwitchElement11: TSwitchElement;
    SwitchElement12: TSwitchElement;
    SwitchElement13: TSwitchElement;
    Shortcut1: TShortcut;
    Shortcut2: TShortcut;
    Shortcut3: TShortcut;
    Shortcut4: TShortcut;
    Shortcut5: TShortcut;
    Shortcut6: TShortcut;
    SwitchElement14: TSwitchElement;
    SwitchElement15: TSwitchElement;
    SwitchElement16: TSwitchElement;
    SwitchElement17: TSwitchElement;
    SwitchElement18: TSwitchElement;
    SwitchElement19: TSwitchElement;
    SwitchElement20: TSwitchElement;
    SwitchElement21: TSwitchElement;
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMEPS: TfrmMEPS;

implementation

{$R *.dfm}

procedure TfrmMEPS.FormResize(Sender: TObject);
begin
  inherited;

  Image1.Left := 0;
  Image1.Top := 0;
  Image1.Height := Height;
  Image1.Width := Width;
end;

end.
