unit ufrmFireDetectionDeckTop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMimics, ExtCtrls, jpeg, uBaseComponent, uSwitchTriangle,
  uSwitchElement, uShortcut;

type
  TfrmFireDetectionDeckTop = class(TfrmMimics)
    Image1: TImage;
    SwitchTriangle43: TSwitchTriangle;
    SwitchTriangle1: TSwitchTriangle;
    SwitchTriangle2: TSwitchTriangle;
    SwitchTriangle3: TSwitchTriangle;
    SwitchTriangle4: TSwitchTriangle;
    SwitchTriangle5: TSwitchTriangle;
    SwitchTriangle6: TSwitchTriangle;
    SwitchTriangle7: TSwitchTriangle;
    SwitchTriangle8: TSwitchTriangle;
    SwitchTriangle9: TSwitchTriangle;
    SwitchTriangle10: TSwitchTriangle;
    SwitchTriangle11: TSwitchTriangle;
    SwitchTriangle12: TSwitchTriangle;
    SwitchTriangle13: TSwitchTriangle;
    SwitchTriangle14: TSwitchTriangle;
    SwitchTriangle15: TSwitchTriangle;
    SwitchTriangle16: TSwitchTriangle;
    SwitchTriangle17: TSwitchTriangle;
    SwitchTriangle18: TSwitchTriangle;
    SwitchTriangle19: TSwitchTriangle;
    SwitchTriangle20: TSwitchTriangle;
    SwitchTriangle21: TSwitchTriangle;
    SwitchTriangle22: TSwitchTriangle;
    SwitchTriangle23: TSwitchTriangle;
    SwitchTriangle24: TSwitchTriangle;
    SwitchTriangle25: TSwitchTriangle;
    SwitchTriangle26: TSwitchTriangle;
    SwitchTriangle27: TSwitchTriangle;
    SwitchTriangle28: TSwitchTriangle;
    SwitchTriangle29: TSwitchTriangle;
    SwitchTriangle30: TSwitchTriangle;
    SwitchTriangle31: TSwitchTriangle;
    SwitchTriangle32: TSwitchTriangle;
    SwitchTriangle33: TSwitchTriangle;
    SwitchTriangle34: TSwitchTriangle;
    SwitchTriangle35: TSwitchTriangle;
    SwitchTriangle36: TSwitchTriangle;
    SwitchTriangle37: TSwitchTriangle;
    SwitchTriangle38: TSwitchTriangle;
    SwitchTriangle39: TSwitchTriangle;
    SwitchTriangle40: TSwitchTriangle;
    SwitchTriangle41: TSwitchTriangle;
    SwitchTriangle42: TSwitchTriangle;
    SwitchElement1: TSwitchElement;
    SwitchElement2: TSwitchElement;
    SwitchElement3: TSwitchElement;
    SwitchElement4: TSwitchElement;
    Shortcut1: TShortcut;
    Image2: TImage;
    procedure FormResize(Sender: TObject);
    procedure Image2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFireDetectionDeckTop: TfrmFireDetectionDeckTop;

implementation

uses
  uMimicsSystem, uDataType;

{$R *.dfm}

procedure TfrmFireDetectionDeckTop.FormResize(Sender: TObject);
begin
  inherited;

  Image1.Left := 0;
  Image1.Top := 0;
  Image1.Height := Height;
  Image1.Width := Width;
end;

procedure TfrmFireDetectionDeckTop.Image2Click(Sender: TObject);
begin
  inherited;

  SysMimics.Mimic.ShowMimic(mtFireDet1);
end;

end.
