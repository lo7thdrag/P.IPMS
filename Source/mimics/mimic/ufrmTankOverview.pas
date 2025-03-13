unit ufrmTankOverview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMimics, ExtCtrls, jpeg, uBaseComponent, uSwitchElement, Menus;

type
  TfrmTankOverview = class(TfrmMimics)
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
    procedure FormResize(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTankOverview: TfrmTankOverview;

implementation


{$R *.dfm}

procedure TfrmTankOverview.FormResize(Sender: TObject);
begin
  inherited;
  Image1.Left := 0;
  Image1.Top := 0;
  Image1.Height := Height;
  Image1.Width := Width;
end;


end.
