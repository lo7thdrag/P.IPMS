unit uACSTestFunction;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uSwitchElement, uBaseComponent, uSwitchTriangle, jpeg, ExtCtrls,
  ComCtrls, TFlatButtonUnit, TFlatPanelUnit;

type
  TfrmACSTestFunction = class(TForm)
    imgDeckBottom: TImage;
    btntoBottom: TFlatButton;
    btntoTop: TFlatButton;
    pnlTop: TPanel;
    pnlBottom: TPanel;
    fltpnl1: TFlatPanel;
    fltpnl2: TFlatPanel;
    fltpnl3: TFlatPanel;
    fltpnl4: TFlatPanel;
    fltpnl5: TFlatPanel;
    fltpnl6: TFlatPanel;
    fltpnl22: TFlatPanel;
    fltpnl21: TFlatPanel;
    fltpnl23: TFlatPanel;
    fltpnl24: TFlatPanel;
    fltpnl25: TFlatPanel;
    fltpnl26: TFlatPanel;
    fltpnl27: TFlatPanel;
    fltpnl29: TFlatPanel;
    fltpnl30: TFlatPanel;
    fltpnl28: TFlatPanel;
    fltpnl31: TFlatPanel;
    fltpnl32: TFlatPanel;
    fltpnl33: TFlatPanel;
    fltpnl34: TFlatPanel;
    fltpnl35: TFlatPanel;
    fltpnl37: TFlatPanel;
    fltpnl38: TFlatPanel;
    fltpnl39: TFlatPanel;
    fltpnl40: TFlatPanel;
    fltpnl41: TFlatPanel;
    fltpnl42: TFlatPanel;
    fltpnl43: TFlatPanel;
    fltpnl44: TFlatPanel;
    fltpnl45: TFlatPanel;
    fltpnl46: TFlatPanel;
    fltpnl47: TFlatPanel;
    fltpnl8: TFlatPanel;
    fltpnl48: TFlatPanel;
    fltpnl49: TFlatPanel;
    fltpnl51: TFlatPanel;
    fltpnl52: TFlatPanel;
    fltpnl53: TFlatPanel;
    fltpnl55: TFlatPanel;
    fltpnl56: TFlatPanel;
    fltpnl57: TFlatPanel;
    fltpnl10: TFlatPanel;
    imgDecktop: TImage;
    fltpnl7: TFlatPanel;
    fltpnl36: TFlatPanel;
    fltpnl50: TFlatPanel;
    fltpnl9: TFlatPanel;
    fltpnl11: TFlatPanel;
    fltpnl12: TFlatPanel;
    fltpnl13: TFlatPanel;
    fltpnl14: TFlatPanel;
    fltpnl15: TFlatPanel;
    fltpnl16: TFlatPanel;
    fltpnl17: TFlatPanel;
    fltpnl18: TFlatPanel;
    fltpnl19: TFlatPanel;
    fltpnl20: TFlatPanel;
    procedure btntoBottomClick(Sender: TObject);
    procedure btntoTopClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmACSTestFunction: TfrmACSTestFunction;

implementation

{$R *.dfm}

procedure TfrmACSTestFunction.btntoBottomClick(Sender: TObject);
begin
  pnlBottom.BringToFront;;

  btntoBottom.Visible := False;

  btntoTop.Visible := True;
  btntoTop.BringToFront;
end;

procedure TfrmACSTestFunction.btntoTopClick(Sender: TObject);
begin
  pnlTop.BringToFront;

  btntoBottom.Visible := True;
  btntoBottom.BringToFront;

  btntoTop.Visible := False;
end;

end.
