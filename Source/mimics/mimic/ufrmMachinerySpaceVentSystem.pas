unit ufrmMachinerySpaceVentSystem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMimics, ExtCtrls, uMotorControlElement, uBaseComponent,
  uMotorControlDoubleSpeed, jpeg;

type
  TfrmMachinerySpaceVentSystem = class(TfrmMimics)
    Image1: TImage;
    MotorControlDoubleSpeed1: TMotorControlDoubleSpeed;
    MotorControlElement1: TMotorControlElement;
    MotorControlDoubleSpeed2: TMotorControlDoubleSpeed;
    MotorControlDoubleSpeed3: TMotorControlDoubleSpeed;
    MotorControlElement2: TMotorControlElement;
    MotorControlDoubleSpeed4: TMotorControlDoubleSpeed;
    MotorControlDoubleSpeed5: TMotorControlDoubleSpeed;
    MotorControlElement3: TMotorControlElement;
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMachinerySpaceVentSystem: TfrmMachinerySpaceVentSystem;

implementation

{$R *.dfm}

procedure TfrmMachinerySpaceVentSystem.FormResize(Sender: TObject);
begin
  inherited;

  Image1.Left := 0;
  Image1.Top := 0;
  Image1.Height := Height;
  Image1.Width := Width;
end;

end.
