unit ufrmPowerManagementOverview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMimics, uSwitchElement, uControlElement, uCircuitBreakerElement,
  uBaseComponent, uAnalogSensor, ExtCtrls, jpeg, uMotorControlElement, uIPMS_Data,
  uShortcut;

type
  TfrmPowerManagementOverview = class(TfrmMimics)
    Image1: TImage;
    ControlElement1: TControlElement;
    ControlElement2: TControlElement;
    ControlElement3: TControlElement;
    ControlElement4: TControlElement;
    ControlElement5: TControlElement;
    AnalogSensor1: TAnalogSensor;
    AnalogSensor2: TAnalogSensor;
    AnalogSensor3: TAnalogSensor;
    AnalogSensor4: TAnalogSensor;
    AnalogSensor6: TAnalogSensor;
    AnalogSensor5: TAnalogSensor;
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
    AnalogSensor19: TAnalogSensor;
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
    AnalogSensor30: TAnalogSensor;
    AnalogSensor31: TAnalogSensor;
    AnalogSensor32: TAnalogSensor;
    AnalogSensor33: TAnalogSensor;
    AnalogSensor34: TAnalogSensor;
    AnalogSensor35: TAnalogSensor;
    AnalogSensor36: TAnalogSensor;
    AnalogSensor37: TAnalogSensor;
    AnalogSensor38: TAnalogSensor;
    AnalogSensor39: TAnalogSensor;
    AnalogSensor40: TAnalogSensor;
    AnalogSensor41: TAnalogSensor;
    AnalogSensor42: TAnalogSensor;
    SwitchElement1: TSwitchElement;
    MotorControlElement1: TMotorControlElement;
    MotorControlElement2: TMotorControlElement;
    MotorControlElement3: TMotorControlElement;
    MotorControlElement4: TMotorControlElement;
    MotorControlElement5: TMotorControlElement;
    CircuitBreakerElement1: TCircuitBreakerElement;
    CircuitBreakerElement2: TCircuitBreakerElement;
    CircuitBreakerElement3: TCircuitBreakerElement;
    CircuitBreakerElement4: TCircuitBreakerElement;
    CircuitBreakerElement5: TCircuitBreakerElement;
    CircuitBreakerElement6: TCircuitBreakerElement;
    CircuitBreakerElement7: TCircuitBreakerElement;
    CircuitBreakerElement8: TCircuitBreakerElement;
    CircuitBreakerElement9: TCircuitBreakerElement;
    CircuitBreakerElement10: TCircuitBreakerElement;
    SwitchElement3: TSwitchElement;
    SwitchElement4: TSwitchElement;
    SwitchElement5: TSwitchElement;
    SwitchElement6: TSwitchElement;
    SwitchElement7: TSwitchElement;
    SwitchElement8: TSwitchElement;
    SwitchElement9: TSwitchElement;
    SwitchElement10: TSwitchElement;
    SwitchElement2: TSwitchElement;
    SwitchElement11: TSwitchElement;
    SwitchElement12: TSwitchElement;
    ControlElement6: TControlElement;
    ControlElement7: TControlElement;
    ControlElement8: TControlElement;
    ControlElement9: TControlElement;
    ControlElement10: TControlElement;
    SwitchElement13: TSwitchElement;
    SwitchElement14: TSwitchElement;
    SwitchElement15: TSwitchElement;
    SwitchElement16: TSwitchElement;
    SwitchElement17: TSwitchElement;
    SwitchElement18: TSwitchElement;
    SwitchElement19: TSwitchElement;
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
    SwitchElement30: TSwitchElement;
    SwitchElement31: TSwitchElement;
    SwitchElement32: TSwitchElement;
    SwitchElement33: TSwitchElement;
    SwitchElement34: TSwitchElement;
    SwitchElement35: TSwitchElement;
    SwitchElement36: TSwitchElement;
    ControlElement11: TControlElement;
    ControlElement12: TControlElement;
    ControlElement13: TControlElement;
    ControlElement14: TControlElement;
    ControlElement15: TControlElement;
    ControlElement16: TControlElement;
    ControlElement17: TControlElement;
    ControlElement18: TControlElement;
    ControlElement19: TControlElement;
    ControlElement20: TControlElement;
    SwitchElement37: TSwitchElement;
    SwitchElement38: TSwitchElement;
    SwitchElement39: TSwitchElement;
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
    Shortcut1: TShortcut;
    Shortcut2: TShortcut;
    Shortcut3: TShortcut;
    Shortcut4: TShortcut;
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public


  end;

var
  frmPowerManagementOverview: TfrmPowerManagementOverview;

implementation

{$R *.dfm}

procedure TfrmPowerManagementOverview.FormResize(Sender: TObject);
begin
  inherited;

  Image1.Left := 0;
  Image1.Top := 0;
  Image1.Height := Height;
  Image1.Width := Width;
end;

end.
