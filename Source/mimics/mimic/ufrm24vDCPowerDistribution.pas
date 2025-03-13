unit ufrm24vDCPowerDistribution;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMimics, ExtCtrls, uBaseComponent, uAnalogSensor, jpeg,
  uCircuitBreakerElement, uMotorControlElement, uSwitchElement, uShortcut;

type
  Tfrm24vDCPowerDistribution = class(TfrmMimics)
    Image1: TImage;
    MotorControlElement1: TMotorControlElement;
    CircuitBreakerElement1: TCircuitBreakerElement;
    AnalogSensor1: TAnalogSensor;
    AnalogSensor2: TAnalogSensor;
    AnalogSensor3: TAnalogSensor;
    AnalogSensor4: TAnalogSensor;
    AnalogSensor5: TAnalogSensor;
    AnalogSensor26: TAnalogSensor;
    AnalogSensor27: TAnalogSensor;
    MotorControlElement2: TMotorControlElement;
    CircuitBreakerElement2: TCircuitBreakerElement;
    AnalogSensor6: TAnalogSensor;
    AnalogSensor7: TAnalogSensor;
    AnalogSensor8: TAnalogSensor;
    AnalogSensor9: TAnalogSensor;
    AnalogSensor10: TAnalogSensor;
    CircuitBreakerElement3: TCircuitBreakerElement;
    CircuitBreakerElement4: TCircuitBreakerElement;
    MotorControlElement3: TMotorControlElement;
    CircuitBreakerElement5: TCircuitBreakerElement;
    AnalogSensor11: TAnalogSensor;
    AnalogSensor12: TAnalogSensor;
    AnalogSensor13: TAnalogSensor;
    AnalogSensor14: TAnalogSensor;
    AnalogSensor15: TAnalogSensor;
    AnalogSensor29: TAnalogSensor;
    AnalogSensor28: TAnalogSensor;
    MotorControlElement4: TMotorControlElement;
    CircuitBreakerElement6: TCircuitBreakerElement;
    AnalogSensor16: TAnalogSensor;
    AnalogSensor17: TAnalogSensor;
    AnalogSensor18: TAnalogSensor;
    AnalogSensor19: TAnalogSensor;
    AnalogSensor20: TAnalogSensor;
    MotorControlElement5: TMotorControlElement;
    AnalogSensor21: TAnalogSensor;
    AnalogSensor22: TAnalogSensor;
    AnalogSensor23: TAnalogSensor;
    AnalogSensor24: TAnalogSensor;
    AnalogSensor25: TAnalogSensor;
    CircuitBreakerElement7: TCircuitBreakerElement;
    AnalogSensor30: TAnalogSensor;
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
  frm24vDCPowerDistribution: Tfrm24vDCPowerDistribution;

implementation

{$R *.dfm}

procedure Tfrm24vDCPowerDistribution.FormResize(Sender: TObject);
begin
  inherited;

  Image1.Left := 0;
  Image1.Top := 0;
  Image1.Height := Height;
  Image1.Width := Width;
end;

end.
