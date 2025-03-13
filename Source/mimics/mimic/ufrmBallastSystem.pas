unit ufrmBallastSystem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMimics, ExtCtrls, uTankSensor, uBaseComponent,
  uMotorControlElement, jpeg, uAnalogSensor, uControlElement, Menus, uShortcut;

type
  TfrmBallastSystem = class(TfrmMimics)
    Image1: TImage;
    TankSensor1: TTankSensor;
    TankSensor2: TTankSensor;
    TankSensor3: TTankSensor;
    MotorControlElement1: TMotorControlElement;
    MotorControlElement2: TMotorControlElement;
    AnalogSensor1: TAnalogSensor;
    AnalogSensor2: TAnalogSensor;
    AnalogSensor3: TAnalogSensor;
    AnalogSensor4: TAnalogSensor;
    AnalogSensor5: TAnalogSensor;
    AnalogSensor6: TAnalogSensor;
    ControlElement1: TControlElement;
    ControlElement2: TControlElement;
    ControlElement3: TControlElement;
    ControlElement4: TControlElement;
    ControlElement5: TControlElement;
    ControlElement6: TControlElement;
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
  frmBallastSystem: TfrmBallastSystem;

implementation

{$R *.dfm}

procedure TfrmBallastSystem.FormResize(Sender: TObject);
begin
  inherited;

  Image1.Left := 0;
  Image1.Top := 0;
  Image1.Height := Height;
  Image1.Width := Width;
end;

end.
