unit ufrmGeneratorPanel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VrControls, VrRotarySwitch, RzBmpBtn,
  Vcl.StdCtrls, VrAngularMeter, Vcl.ExtCtrls;

type
  TfrmGeneratorPanel = class(TForm)
    pnlMainBackground: TPanel;
    img1: TImage;
    img2: TImage;
    img3: TImage;
    img4: TImage;
    img5: TImage;
    img6: TImage;
    pnlkW: TPanel;
    vra1: TVrAngularMeter;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    pnlHz: TPanel;
    vra2: TVrAngularMeter;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    pnlV: TPanel;
    vra3: TVrAngularMeter;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    pnlA: TPanel;
    vra4: TVrAngularMeter;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl18: TLabel;
    lbl19: TLabel;
    lbl20: TLabel;
    vra5: TVrAngularMeter;
    pnlGensys: TPanel;
    imgGensys: TImage;
    btnRzBmpHornOff: TRzBmpButton;
    btnRzBmpFaultPage: TRzBmpButton;
    btnRzBmpAlarmPage: TRzBmpButton;
    btnRzBmpInfoPage: TRzBmpButton;
    btnRzBmpLedTest: TRzBmpButton;
    btnRzBmpEsc: TRzBmpButton;
    btnRzBmpRaise: TRzBmpButton;
    btnRzBmpLower: TRzBmpButton;
    btnRzBmpShift: TRzBmpButton;
    btnRzBmpEnter: TRzBmpButton;
    btnRzBmpF5: TRzBmpButton;
    btnRzBmpF1: TRzBmpButton;
    btnRzBmpF2: TRzBmpButton;
    btnRzBmpF3: TRzBmpButton;
    btnRzBmpF4: TRzBmpButton;
    btnRzBmpAuto: TRzBmpButton;
    btnRzBmpSemiAuto: TRzBmpButton;
    btnRzBmpMan: TRzBmpButton;
    btnRzBmpStart: TRzBmpButton;
    btnRzBmpStop: TRzBmpButton;
    btnRzBmp01: TRzBmpButton;
    btnRzBmpPref: TRzBmpButton;
    btnRzBmpIEngineRunning: TRzBmpButton;
    btnRzBmpIGeneratorSupply: TRzBmpButton;
    btnRzBmpICBClossed: TRzBmpButton;
    btnRzBmpIPreference: TRzBmpButton;
    btnRzBmpIBusbarSupply: TRzBmpButton;
    vr1: TVrRotarySwitch;
    vr2: TVrRotarySwitch;
    lbl21: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeneratorPanel: TfrmGeneratorPanel;

implementation

uses
  uMainSwitchBoardSystem;

{$R *.dfm}
procedure EnableComposited(WinControl:TWinControl);
var
  i:Integer;
  NewExStyle:DWORD;
begin
  NewExStyle := GetWindowLong(WinControl.Handle, GWL_EXSTYLE) or WS_EX_COMPOSITED;
  SetWindowLong(WinControl.Handle, GWL_EXSTYLE, NewExStyle);

  for I := 0 to WinControl.ControlCount - 1 do
    if WinControl.Controls[i] is TWinControl then
      EnableComposited(TWinControl(WinControl.Controls[i]));
end;

procedure TfrmGeneratorPanel.FormCreate(Sender: TObject);
begin
  EnableComposited(pnlMainBackground);
  EnableComposited(pnlGensys);
  EnableComposited(pnlA);
  EnableComposited(pnlHz);
  EnableComposited(pnlkW);
  EnableComposited(pnlV);
end;

end.
