unit ufrmMEPS_Exhaust;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMimics, ExtCtrls, jpeg, uBaseComponent, uAnalogSensor,
  uMotorControlStandby, uSwitchElement, uSwitchNBCD, uControlElement,
  uCircuitBreakerElement, uRunningHour, uValveProportionally, uVerticalBar,
  uShortcut;

type
  TfrmMEPS_Exhaust = class(TfrmMimics)
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
    AnalogSensor43: TAnalogSensor;
    AnalogSensor44: TAnalogSensor;
    AnalogSensor45: TAnalogSensor;
    AnalogSensor46: TAnalogSensor;
    AnalogSensor47: TAnalogSensor;
    AnalogSensor48: TAnalogSensor;
    AnalogSensor49: TAnalogSensor;
    AnalogSensor50: TAnalogSensor;
    AnalogSensor51: TAnalogSensor;
    VerticalBar1: TVerticalBar;
    VerticalBar2: TVerticalBar;
    VerticalBar3: TVerticalBar;
    VerticalBar4: TVerticalBar;
    VerticalBar5: TVerticalBar;
    VerticalBar6: TVerticalBar;
    VerticalBar7: TVerticalBar;
    VerticalBar8: TVerticalBar;
    VerticalBar9: TVerticalBar;
    VerticalBar10: TVerticalBar;
    VerticalBar11: TVerticalBar;
    VerticalBar12: TVerticalBar;
    VerticalBar13: TVerticalBar;
    VerticalBar14: TVerticalBar;
    VerticalBar15: TVerticalBar;
    VerticalBar16: TVerticalBar;
    VerticalBar17: TVerticalBar;
    VerticalBar18: TVerticalBar;
    VerticalBar19: TVerticalBar;
    VerticalBar20: TVerticalBar;
    Shortcut1: TShortcut;
    AnalogSensor52: TAnalogSensor;
    AnalogSensor53: TAnalogSensor;
    AnalogSensor54: TAnalogSensor;
    AnalogSensor55: TAnalogSensor;
    AnalogSensor56: TAnalogSensor;
    AnalogSensor57: TAnalogSensor;
    AnalogSensor58: TAnalogSensor;
    AnalogSensor59: TAnalogSensor;
    AnalogSensor60: TAnalogSensor;
    AnalogSensor61: TAnalogSensor;
    AnalogSensor62: TAnalogSensor;
    AnalogSensor63: TAnalogSensor;
    AnalogSensor64: TAnalogSensor;
    AnalogSensor65: TAnalogSensor;
    AnalogSensor66: TAnalogSensor;
    AnalogSensor67: TAnalogSensor;
    AnalogSensor68: TAnalogSensor;
    AnalogSensor69: TAnalogSensor;
    AnalogSensor70: TAnalogSensor;
    AnalogSensor71: TAnalogSensor;
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMEPS_Exhaust: TfrmMEPS_Exhaust;

implementation

{$R *.dfm}

procedure TfrmMEPS_Exhaust.FormResize(Sender: TObject);
begin
  inherited;

  Image1.Left := 0;
  Image1.Top := 0;
  Image1.Height := Height;
  Image1.Width := Width;
end;

end.
