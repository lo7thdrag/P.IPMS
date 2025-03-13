unit ufrmNetArchitect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,ufrmMimics, uBaseComponent, uMotorControlElement, ExtCtrls, jpeg,
  uSwitchElement, uComputer, StdCtrls;

type
  TfrmNetArchitect = class(TfrmMimics)
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
    SwitchElement28: TSwitchElement;
    SwitchElement20: TSwitchElement;
    SwitchElement21: TSwitchElement;
    SwitchElement22: TSwitchElement;
    SwitchElement23: TSwitchElement;
    SwitchElement24: TSwitchElement;
    SwitchElement25: TSwitchElement;
    SwitchElement26: TSwitchElement;
    SwitchElement27: TSwitchElement;
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
    SwitchElement41: TSwitchElement;
    SwitchElement42: TSwitchElement;
    SwitchElement43: TSwitchElement;
    SwitchElement44: TSwitchElement;
    SwitchElement45: TSwitchElement;
    SwitchElement46: TSwitchElement;
    SwitchElement47: TSwitchElement;
    SwitchElement48: TSwitchElement;
    SwitchElement49: TSwitchElement;
    SwitchElement50: TSwitchElement;
    SwitchElement51: TSwitchElement;
    SwitchElement52: TSwitchElement;
    SwitchElement53: TSwitchElement;
    SwitchElement54: TSwitchElement;
    SwitchElement55: TSwitchElement;
    SwitchElement56: TSwitchElement;
    SwitchElement57: TSwitchElement;
    SwitchElement58: TSwitchElement;
    SwitchElement59: TSwitchElement;
    SwitchElement60: TSwitchElement;
    SwitchElement61: TSwitchElement;
    SwitchElement62: TSwitchElement;
    SwitchElement63: TSwitchElement;
    SwitchElement64: TSwitchElement;
    SwitchElement65: TSwitchElement;
    SwitchElement66: TSwitchElement;
    SwitchElement67: TSwitchElement;
    SwitchElement68: TSwitchElement;
    SwitchElement69: TSwitchElement;
    SwitchElement70: TSwitchElement;
    SwitchElement71: TSwitchElement;
    SwitchElement72: TSwitchElement;
    SwitchElement73: TSwitchElement;
    SwitchElement74: TSwitchElement;
    SwitchElement75: TSwitchElement;
    SwitchElement76: TSwitchElement;
    SwitchElement77: TSwitchElement;
    SwitchElement78: TSwitchElement;
    SwitchElement79: TSwitchElement;
    SwitchElement80: TSwitchElement;
    SwitchElement81: TSwitchElement;
    SwitchElement82: TSwitchElement;
    SwitchElement83: TSwitchElement;
    SwitchElement84: TSwitchElement;
    SwitchElement85: TSwitchElement;
    SwitchElement86: TSwitchElement;
    SwitchElement87: TSwitchElement;
    SwitchElement88: TSwitchElement;
    SwitchElement89: TSwitchElement;
    SwitchElement90: TSwitchElement;
    SwitchElement91: TSwitchElement;
    SwitchElement92: TSwitchElement;
    SwitchElement93: TSwitchElement;
    SwitchElement94: TSwitchElement;
    SwitchElement95: TSwitchElement;
    SwitchElement96: TSwitchElement;
    SwitchElement97: TSwitchElement;
    SwitchElement98: TSwitchElement;
    SwitchElement99: TSwitchElement;
    SwitchElement100: TSwitchElement;
    SwitchElement101: TSwitchElement;
    Computer1: TComputer;
    Computer2: TComputer;
    Computer3: TComputer;
    Computer4: TComputer;
    Computer5: TComputer;
    Computer6: TComputer;
    Computer7: TComputer;
    Computer8: TComputer;
    Computer9: TComputer;
    Computer10: TComputer;
    Computer11: TComputer;
    Computer12: TComputer;
    pnlServerRole1: TPanel;
    pnlServerRole2: TPanel;
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    procedure UpdateServerRole;
  end;

var
  frmNetArchitect: TfrmNetArchitect;

implementation

uses
  uIPMS_Data;

{$R *.dfm}

procedure TfrmNetArchitect.FormResize(Sender: TObject);
begin
  inherited;

  Image1.Left := 0;
  Image1.Top := 0;
  Image1.Height := Height;
  Image1.Width := Width;
end;

procedure TfrmNetArchitect.UpdateServerRole;
begin
  if (Computer12.Status = SWtaDisabled) and
    (Computer6.Status = SWtaDisabled) then
  begin
    pnlServerRole1.Caption := 'OFFLINE';
    pnlServerRole1.Color := colRed;
    pnlServerRole1.Font.Color := colWhite;

    pnlServerRole2.Caption := 'OFFLINE';
    pnlServerRole2.Color := colRed;
    pnlServerRole2.Font.Color := colWhite;
  end
  else if (Computer12.Status = SWtaOk) and
    (Computer6.Status = SWtaDisabled) then
  begin
    pnlServerRole1.Caption := 'MASTER';
    pnlServerRole1.Color := colBrightGreen;
    pnlServerRole1.Font.Color := colBlack;

    pnlServerRole2.Caption := 'OFFLINE';
    pnlServerRole2.Color := colRed;
    pnlServerRole2.Font.Color := colWhite;
  end
  else if (Computer12.Status = SWtaDisabled) and
    (Computer6.Status = SWtaOk) then
  begin
    pnlServerRole1.Caption := 'OFFLINE';
    pnlServerRole1.Color := colRed;
    pnlServerRole1.Font.Color := colWhite;

    pnlServerRole2.Caption := 'MASTER';
    pnlServerRole2.Color := colBrightGreen;
    pnlServerRole2.Font.Color := colBlack;
  end
  else if (Computer12.Status = SWtaOk) and
    (Computer6.Status = SWtaOk) then
  begin
    pnlServerRole1.Caption := 'MASTER';
    pnlServerRole1.Color := colBrightGreen;
    pnlServerRole1.Font.Color := colBlack;

    pnlServerRole2.Caption := 'SLAVE';
    pnlServerRole2.Color := colBrightGreen;
    pnlServerRole2.Font.Color := colBlack;
  end
end;

end.
