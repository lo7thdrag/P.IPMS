unit ufrmAuxiliarySystemOverview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMimics, ExtCtrls, jpeg, uTankSensor, uAnalogSensor,
  uBaseComponent, uControlElement, uMotorControlElement, Menus, uHorizontalBar,
  uSwitchElement;

type
  TfrmAuxiliarySystemOverview = class(TfrmMimics)
    Image1: TImage;
    AnalogSensor1: TAnalogSensor;
    AnalogSensor2: TAnalogSensor;
    AnalogSensor3: TAnalogSensor;
    AnalogSensor4: TAnalogSensor;
    AnalogSensor5: TAnalogSensor;
    AnalogSensor6: TAnalogSensor;
    TankSensor: TTankSensor;
    AnalogSensor7: TAnalogSensor;
    AnalogSensor8: TAnalogSensor;
    AnalogSensor9: TAnalogSensor;
    MotorControlElement1: TMotorControlElement;
    HorizontalBar1: THorizontalBar;
    HorizontalBar2: THorizontalBar;
    swtchlmnt1: TSwitchElement;
    swtchlmnt2: TSwitchElement;
    swtchlmnt3: TSwitchElement;
    swtchlmnt4: TSwitchElement;
    swtchlmnt5: TSwitchElement;
    swtchlmnt6: TSwitchElement;
    swtchlmnt7: TSwitchElement;
    swtchlmnt8: TSwitchElement;
    swtchlmnt9: TSwitchElement;
    swtchlmnt10: TSwitchElement;
    swtchlmnt11: TSwitchElement;
    swtchlmnt12: TSwitchElement;
    swtchlmnt13: TSwitchElement;
    swtchlmnt14: TSwitchElement;
    swtchlmnt15: TSwitchElement;
    procedure FormResize(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAuxiliarySystemOverview: TfrmAuxiliarySystemOverview;

implementation

{$R *.dfm}

procedure TfrmAuxiliarySystemOverview.FormResize(Sender: TObject);
begin
  inherited;

  Image1.Left := 0;
  Image1.Top := 0;
  Image1.Height := Height;
  Image1.Width := Width;
end;

end.
