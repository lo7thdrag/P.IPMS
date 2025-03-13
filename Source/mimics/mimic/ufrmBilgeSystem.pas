unit ufrmBilgeSystem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMimics, ExtCtrls, jpeg, uSwitchElement, uBaseComponent,
  uMotorControlElement, uValveControl, uControlElement, Menus, uSwitchNBCD,
  uShortcut;

type
  TfrmBilgeSystem = class(TfrmMimics)
    Image1: TImage;
    MotorControlElement1: TMotorControlElement;
    MotorControlElement2: TMotorControlElement;
    ValveControl1: TValveControl;
    ValveControl2: TValveControl;
    ControlElement1: TControlElement;
    ControlElement2: TControlElement;
    MotorControlElement3: TMotorControlElement;
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
    Shortcut1: TShortcut;
    Shortcut2: TShortcut;
    Shortcut3: TShortcut;
    Shortcut4: TShortcut;
    Shortcut5: TShortcut;
    Shortcut6: TShortcut;
    Shortcut7: TShortcut;
    Shortcut8: TShortcut;
    Shortcut9: TShortcut;
    procedure FormResize(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBilgeSystem: TfrmBilgeSystem;

implementation

{$R *.dfm}

procedure TfrmBilgeSystem.FormResize(Sender: TObject);
begin
  inherited;

  Image1.Left := 0;
  Image1.Top := 0;
  Image1.Height := Height;
  Image1.Width := Width;
end;

end.
