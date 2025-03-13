unit ufrmUninterruptiblePS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMimics, ExtCtrls, jpeg, uMotorControlElement,
  uCircuitBreakerElement, uBaseComponent, uAnalogSensor, uSwitchElement,
  uShortcut;

type
  TfrmUninterruptiblePS = class(TfrmMimics)
    Image1: TImage;
    AnalogSensor1: TAnalogSensor;
    AnalogSensor10: TAnalogSensor;
    AnalogSensor11: TAnalogSensor;
    AnalogSensor12: TAnalogSensor;
    AnalogSensor13: TAnalogSensor;
    AnalogSensor14: TAnalogSensor;
    AnalogSensor15: TAnalogSensor;
    AnalogSensor16: TAnalogSensor;
    AnalogSensor17: TAnalogSensor;
    AnalogSensor18: TAnalogSensor;
    AnalogSensor19: TAnalogSensor;
    AnalogSensor2: TAnalogSensor;
    AnalogSensor20: TAnalogSensor;
    AnalogSensor21: TAnalogSensor;
    AnalogSensor22: TAnalogSensor;
    AnalogSensor23: TAnalogSensor;
    AnalogSensor24: TAnalogSensor;
    AnalogSensor25: TAnalogSensor;
    AnalogSensor26: TAnalogSensor;
    AnalogSensor27: TAnalogSensor;
    AnalogSensor28: TAnalogSensor;
    AnalogSensor29: TAnalogSensor;
    AnalogSensor3: TAnalogSensor;
    AnalogSensor4: TAnalogSensor;
    AnalogSensor5: TAnalogSensor;
    AnalogSensor6: TAnalogSensor;
    AnalogSensor7: TAnalogSensor;
    AnalogSensor8: TAnalogSensor;
    AnalogSensor9: TAnalogSensor;
    CircuitBreakerElement1: TCircuitBreakerElement;
    CircuitBreakerElement2: TCircuitBreakerElement;
    CircuitBreakerElement3: TCircuitBreakerElement;
    CircuitBreakerElement4: TCircuitBreakerElement;
    CircuitBreakerElement5: TCircuitBreakerElement;
    CircuitBreakerElement6: TCircuitBreakerElement;
    CircuitBreakerElement7: TCircuitBreakerElement;
    MotorControlElement1: TMotorControlElement;
    MotorControlElement2: TMotorControlElement;
    MotorControlElement3: TMotorControlElement;
    MotorControlElement4: TMotorControlElement;
    MotorControlElement5: TMotorControlElement;
    SwitchElement1: TSwitchElement;
    SwitchElement2: TSwitchElement;
    SwitchElement3: TSwitchElement;
    SwitchElement4: TSwitchElement;
    SwitchElement5: TSwitchElement;
    SwitchElement6: TSwitchElement;
    CircuitBreakerElement8: TCircuitBreakerElement;
    CircuitBreakerElement9: TCircuitBreakerElement;
    CircuitBreakerElement10: TCircuitBreakerElement;
    Shortcut1: TShortcut;
    Shortcut2: TShortcut;
    Shortcut3: TShortcut;
    Shortcut4: TShortcut;
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUninterruptiblePS: TfrmUninterruptiblePS;

implementation

{$R *.dfm}

procedure TfrmUninterruptiblePS.FormResize(Sender: TObject);
begin
  inherited;

  Image1.Left := 0;
  Image1.Top := 0;
  Image1.Height := Height;
  Image1.Width := Width;
end;

end.
