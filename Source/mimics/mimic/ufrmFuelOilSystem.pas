unit ufrmFuelOilSystem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMimics, ExtCtrls, jpeg, uAnalogSensor, uBaseComponent,
  uTankSensor, uControlElement, uMotorControlElement, Menus, uSwitchTriangle;

type
  TfrmFuelOilSystem = class(TfrmMimics)
    Image1: TImage;
    TankSensor30: TTankSensor;
    TankSensor31: TTankSensor;
    TankSensor32: TTankSensor;
    TankSensor34: TTankSensor;
    TankSensor35: TTankSensor;
    TankSensor36: TTankSensor;
    TankSensor37: TTankSensor;
    TankSensor38: TTankSensor;
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
    ControlElement1: TControlElement;
    MotorControlElement1: TMotorControlElement;
    MotorControlElement2: TMotorControlElement;
    ControlElement2: TControlElement;
    ControlElement3: TControlElement;
    SwitchTriangle1: TSwitchTriangle;
    SwitchTriangle2: TSwitchTriangle;
    SwitchTriangle3: TSwitchTriangle;
    SwitchTriangle4: TSwitchTriangle;
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFuelOilSystem: TfrmFuelOilSystem;

implementation

{$R *.dfm}

procedure TfrmFuelOilSystem.FormResize(Sender: TObject);
begin
  inherited;

  Image1.Left := 0;
  Image1.Top := 0;
  Image1.Height := Height;
  Image1.Width := Width;
end;

end.
