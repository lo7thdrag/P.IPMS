unit ufrmCPP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMimics, ExtCtrls, jpeg, uMotorControlElement, uBaseComponent,
  uAnalogSensor, uSwitchElement, uSwitchTriangle, uShortcut;

type
  TfrmCPP = class(TfrmMimics)
    Image1: TImage;
    AnalogSensor1: TAnalogSensor;
    AnalogSensor2: TAnalogSensor;
    AnalogSensor3: TAnalogSensor;
    AnalogSensor4: TAnalogSensor;
    AnalogSensor5: TAnalogSensor;
    MotorControlElement1: TMotorControlElement;
    MotorControlElement2: TMotorControlElement;
    MotorControlElement3: TMotorControlElement;
    MotorControlElement4: TMotorControlElement;
    MotorControlElement5: TMotorControlElement;
    MotorControlElement6: TMotorControlElement;
    AnalogSensor6: TAnalogSensor;
    AnalogSensor7: TAnalogSensor;
    AnalogSensor8: TAnalogSensor;
    AnalogSensor9: TAnalogSensor;
    SwitchElement1: TSwitchElement;
    AnalogSensor10: TAnalogSensor;
    AnalogSensor11: TAnalogSensor;
    AnalogSensor12: TAnalogSensor;
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
    SwitchTriangle1: TSwitchTriangle;
    SwitchTriangle2: TSwitchTriangle;
    SwitchTriangle3: TSwitchTriangle;
    SwitchTriangle4: TSwitchTriangle;
    Shortcut1: TShortcut;
    Shortcut2: TShortcut;
    Shortcut3: TShortcut;
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCPP: TfrmCPP;

implementation

{$R *.dfm}

procedure TfrmCPP.FormResize(Sender: TObject);
begin
  inherited;

  Image1.Left := 0;
  Image1.Top := 0;
  Image1.Height := Height;
  Image1.Width := Width;
end;

end.
