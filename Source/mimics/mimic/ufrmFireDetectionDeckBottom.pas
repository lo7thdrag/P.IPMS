unit ufrmFireDetectionDeckBottom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMimics, ExtCtrls, jpeg, uBaseComponent, uSwitchTriangle,
  uSwitchElement, uShortcut;

type
  TfrmFireDetectionDeckBottom = class(TfrmMimics)
    Image1: TImage;
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
    SwitchTriangle43: TSwitchTriangle;
    SwitchTriangle44: TSwitchTriangle;
    SwitchTriangle45: TSwitchTriangle;
    SwitchTriangle46: TSwitchTriangle;
    SwitchTriangle47: TSwitchTriangle;
    SwitchTriangle48: TSwitchTriangle;
    SwitchTriangle49: TSwitchTriangle;
    SwitchTriangle50: TSwitchTriangle;
    SwitchTriangle51: TSwitchTriangle;
    SwitchTriangle52: TSwitchTriangle;
    SwitchTriangle53: TSwitchTriangle;
    SwitchTriangle54: TSwitchTriangle;
    SwitchTriangle55: TSwitchTriangle;
    SwitchTriangle56: TSwitchTriangle;
    SwitchTriangle57: TSwitchTriangle;
    SwitchTriangle58: TSwitchTriangle;
    SwitchTriangle59: TSwitchTriangle;
    SwitchTriangle60: TSwitchTriangle;
    SwitchTriangle61: TSwitchTriangle;
    SwitchTriangle62: TSwitchTriangle;
    SwitchTriangle63: TSwitchTriangle;
    SwitchTriangle64: TSwitchTriangle;
    SwitchTriangle65: TSwitchTriangle;
    SwitchTriangle66: TSwitchTriangle;
    SwitchTriangle67: TSwitchTriangle;
    SwitchTriangle68: TSwitchTriangle;
    SwitchTriangle69: TSwitchTriangle;
    SwitchTriangle70: TSwitchTriangle;
    SwitchTriangle71: TSwitchTriangle;
    SwitchTriangle72: TSwitchTriangle;
    SwitchTriangle73: TSwitchTriangle;
    SwitchTriangle74: TSwitchTriangle;
    SwitchTriangle75: TSwitchTriangle;
    SwitchTriangle76: TSwitchTriangle;
    SwitchTriangle77: TSwitchTriangle;
    SwitchTriangle78: TSwitchTriangle;
    SwitchTriangle79: TSwitchTriangle;
    SwitchTriangle80: TSwitchTriangle;
    SwitchTriangle81: TSwitchTriangle;
    SwitchTriangle82: TSwitchTriangle;
    SwitchTriangle83: TSwitchTriangle;
    SwitchTriangle84: TSwitchTriangle;
    SwitchTriangle85: TSwitchTriangle;
    SwitchTriangle86: TSwitchTriangle;
    SwitchTriangle87: TSwitchTriangle;
    SwitchTriangle88: TSwitchTriangle;
    SwitchTriangle89: TSwitchTriangle;
    SwitchTriangle90: TSwitchTriangle;
    SwitchTriangle91: TSwitchTriangle;
    SwitchTriangle92: TSwitchTriangle;
    SwitchTriangle93: TSwitchTriangle;
    SwitchTriangle94: TSwitchTriangle;
    SwitchTriangle95: TSwitchTriangle;
    SwitchTriangle96: TSwitchTriangle;
    SwitchTriangle97: TSwitchTriangle;
    SwitchTriangle98: TSwitchTriangle;
    SwitchTriangle99: TSwitchTriangle;
    SwitchTriangle100: TSwitchTriangle;
    SwitchTriangle101: TSwitchTriangle;
    SwitchTriangle102: TSwitchTriangle;
    SwitchTriangle103: TSwitchTriangle;
    SwitchTriangle104: TSwitchTriangle;
    SwitchTriangle105: TSwitchTriangle;
    SwitchTriangle106: TSwitchTriangle;
    SwitchTriangle107: TSwitchTriangle;
    SwitchTriangle108: TSwitchTriangle;
    SwitchTriangle109: TSwitchTriangle;
    SwitchTriangle110: TSwitchTriangle;
    SwitchTriangle111: TSwitchTriangle;
    SwitchTriangle112: TSwitchTriangle;
    SwitchTriangle113: TSwitchTriangle;
    SwitchTriangle114: TSwitchTriangle;
    SwitchElement1: TSwitchElement;
    SwitchElement2: TSwitchElement;
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
  frmFireDetectionDeckBottom: TfrmFireDetectionDeckBottom;

implementation

uses
  uMimicsSystem, uDataType;

{$R *.dfm}

procedure TfrmFireDetectionDeckBottom.FormResize(Sender: TObject);
begin
  inherited;

  Image1.Left := 0;
  Image1.Top := 0;
  Image1.Height := Height;
  Image1.Width := Width;
end;

procedure TfrmFireDetectionDeckBottom.Image2Click(Sender: TObject);
begin
  inherited;

  SysMimics.Mimic.ShowMimic(mtFireDet2);
end;

end.
