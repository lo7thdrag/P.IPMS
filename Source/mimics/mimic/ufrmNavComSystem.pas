unit ufrmNavComSystem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMimics, uBaseComponent, uTankSensor, jpeg, ExtCtrls,
  uAnalogSensor, uSwitchElement, uSwitchTriangle;

type
  TfrmNavComs = class(TfrmMimics)
    Image1: TImage;
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
    SwitchTriangle1: TSwitchTriangle;
    SwitchTriangle2: TSwitchTriangle;
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNavComs: TfrmNavComs;

implementation

{$R *.dfm}

procedure TfrmNavComs.FormResize(Sender: TObject);
begin
  inherited;

  Image1.Left := 0;
  Image1.Top := 0;
  Image1.Height := Height;
  Image1.Width := Width;
end;

end.
