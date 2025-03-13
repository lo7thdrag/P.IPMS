unit ufrmFireFightingSystem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMimics, ExtCtrls, jpeg, uValveControl, uBaseComponent,
  uAnalogSensor, uSwitchElement, uMotorControlElement, uShortcut;

type
  TfrmFireFightingSystem = class(TfrmMimics)
    Image1: TImage;
    AnalogSensor1: TAnalogSensor;
    AnalogSensor2: TAnalogSensor;
    ValveControl1: TValveControl;
    ValveControl2: TValveControl;
    ValveControl3: TValveControl;
    ValveControl4: TValveControl;
    ValveControl5: TValveControl;
    ValveControl6: TValveControl;
    ValveControl7: TValveControl;
    ValveControl8: TValveControl;
    ValveControl9: TValveControl;
    ValveControl10: TValveControl;
    ValveControl11: TValveControl;
    SwitchElement1: TSwitchElement;
    SwitchElement2: TSwitchElement;
    SwitchElement3: TSwitchElement;
    SwitchElement4: TSwitchElement;
    SwitchElement5: TSwitchElement;
    SwitchElement6: TSwitchElement;
    SwitchElement7: TSwitchElement;
    ValveControl12: TValveControl;
    ValveControl13: TValveControl;
    ValveControl14: TValveControl;
    ValveControl15: TValveControl;
    ValveControl16: TValveControl;
    ValveControl17: TValveControl;
    ValveControl18: TValveControl;
    ValveControl19: TValveControl;
    MotorControlElement1: TMotorControlElement;
    MotorControlElement2: TMotorControlElement;
    MotorControlElement3: TMotorControlElement;
    MotorControlElement4: TMotorControlElement;
    Shortcut1: TShortcut;
    Shortcut2: TShortcut;
    Shortcut3: TShortcut;
    Shortcut4: TShortcut;
    Shortcut5: TShortcut;
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFireFightingSystem: TfrmFireFightingSystem;

implementation

{$R *.dfm}

procedure TfrmFireFightingSystem.FormResize(Sender: TObject);
begin
  inherited;

  Image1.Left := 0;
  Image1.Top := 0;
  Image1.Height := Height;
  Image1.Width := Width;
end;

end.
