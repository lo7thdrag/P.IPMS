unit ufrmPropultionConditions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMimics, ExtCtrls, jpeg, uBaseComponent, uAnalogSensor,
  uSwitchElement, uControlElement, uShortcut;

type
  TfrmPropultionConditions = class(TfrmMimics)
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
    SwitchElement37: TSwitchElement;
    SwitchElement38: TSwitchElement;
    SwitchElement39: TSwitchElement;
    SwitchElement40: TSwitchElement;
    SwitchElement41: TSwitchElement;
    SwitchElement42: TSwitchElement;
    SwitchElement43: TSwitchElement;
    SwitchElement44: TSwitchElement;
    ControlElement1: TControlElement;
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
    ControlElement2: TControlElement;
    SwitchElement100: TSwitchElement;
    SwitchElement101: TSwitchElement;
    SwitchElement102: TSwitchElement;
    SwitchElement103: TSwitchElement;
    SwitchElement104: TSwitchElement;
    SwitchElement106: TSwitchElement;
    SwitchElement107: TSwitchElement;
    SwitchElement108: TSwitchElement;
    SwitchElement109: TSwitchElement;
    SwitchElement105: TSwitchElement;
    SwitchElement110: TSwitchElement;
    SwitchElement111: TSwitchElement;
    Shortcut1: TShortcut;
    Shortcut2: TShortcut;
    Shortcut3: TShortcut;
    SwitchElement112: TSwitchElement;
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPropultionConditions: TfrmPropultionConditions;

implementation

{$R *.dfm}

procedure TfrmPropultionConditions.FormResize(Sender: TObject);
begin
  inherited;

  Image1.Left := 0;
  Image1.Top := 0;
  Image1.Height := Height;
  Image1.Width := Width;
end;

end.
