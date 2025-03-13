unit ufrmSeaAndFreshWaterSystem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMimics, ExtCtrls, jpeg, uControlElement, uBaseComponent,
  uMotorControlElement, uAnalogSensor, uTankSensor, Menus, uShortcut,
  uSwitchElement;

type
  TfrmSeaAndFreshWaterSystem = class(TfrmMimics)
    Image1: TImage;
    MotorControlElement1: TMotorControlElement;
    MotorControlElement2: TMotorControlElement;
    MotorControlElement3: TMotorControlElement;
    MotorControlElement4: TMotorControlElement;
    TankSensor1: TTankSensor;
    TankSensor2: TTankSensor;
    TankSensor3: TTankSensor;
    AnalogSensor1: TAnalogSensor;
    AnalogSensor2: TAnalogSensor;
    AnalogSensor3: TAnalogSensor;
    AnalogSensor4: TAnalogSensor;
    AnalogSensor5: TAnalogSensor;
    AnalogSensor6: TAnalogSensor;
    Shortcut1: TShortcut;
    Shortcut2: TShortcut;
    swtchlmnt14: TSwitchElement;
    swtchlmnt1: TSwitchElement;
    swtchlmnt2: TSwitchElement;
    swtchlmnt3: TSwitchElement;
    swtchlmnt4: TSwitchElement;
    swtchlmnt5: TSwitchElement;
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSeaAndFreshWaterSystem: TfrmSeaAndFreshWaterSystem;

implementation

{$R *.dfm}

procedure TfrmSeaAndFreshWaterSystem.FormResize(Sender: TObject);
begin
  inherited;

  Image1.Left := 0;
  Image1.Top := 0;
  Image1.Height := Height;
  Image1.Width := Width;
end;

end.
