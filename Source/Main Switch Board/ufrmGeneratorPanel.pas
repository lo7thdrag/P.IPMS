unit ufrmGeneratorPanel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VrControls, VrRotarySwitch, RzBmpBtn,
  Vcl.StdCtrls, VrAngularMeter, Vcl.ExtCtrls,

  uListener, uFreezeFrom, uDataType;

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
    vr1: TVrRotarySwitch;
    vr2: TVrRotarySwitch;
    lbl21: TLabel;
    ImgIndicatorHO: TImage;
    ImgIndicatorFP: TImage;
    ImgIndicatorAP: TImage;
    ImgIndicatorBS: TImage;
    ImgIndicatorPreference: TImage;
    ImgIndicatorCBC: TImage;
    ImgIndicatorGS: TImage;
    ImgIndicatorER: TImage;
    ImgIndicatorAuto: TImage;
    ImgIndicatorSA: TImage;
    ImgIndicatorMan: TImage;
    ImgF1: TImage;
    ImgF2: TImage;
    ImgF3: TImage;
    ImgF4: TImage;
    ImgF5: TImage;
    ImgEsc: TImage;
    ImgRaise: TImage;
    ImgLower: TImage;
    ImgShift: TImage;
    ImgEnter: TImage;
    ImgHO: TImage;
    ImgFP: TImage;
    ImgAP: TImage;
    ImgIP: TImage;
    ImgLT: TImage;
    ImgAUTO: TImage;
    ImgSA: TImage;
    ImgMAN: TImage;
    ImgStart: TImage;
    ImgStop: TImage;
    ImgOI: TImage;
    ImgPref: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ImgStartClick(Sender: TObject);
    procedure ImgStopClick(Sender: TObject);
    procedure ImgPrefClick(Sender: TObject);
    procedure ImgOIClick(Sender: TObject);
  private
    { Private declarations }
    FListener : TListeners;

    procedure GeneratorPanelSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Integer);overload;
    procedure GeneratorPanelSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Boolean);overload;

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
  FListener := TListeners.Create;
  with MainSwitchBoardSystem.Listener.Add('GENERATORPANEL') as TPropertyEventListener do
  begin
    OnPropertyBoolChange := GeneratorPanelSystemEvent;
    OnPropertyIntChange := GeneratorPanelSystemEvent;
  end;

  EnableComposited(pnlMainBackground);
  EnableComposited(pnlGensys);
  EnableComposited(pnlA);
  EnableComposited(pnlHz);
  EnableComposited(pnlkW);
  EnableComposited(pnlV);
end;

procedure TfrmGeneratorPanel.FormDestroy(Sender: TObject);
begin
 FListener.Free;
end;

procedure TfrmGeneratorPanel.GeneratorPanelSystemEvent(Sender: TObject;
  PropsID: E_PropsID; Value: Integer);
begin
//
end;

procedure TfrmGeneratorPanel.GeneratorPanelSystemEvent(Sender: TObject;
  PropsID: E_PropsID; Value: Boolean);
begin
//
end;

procedure TfrmGeneratorPanel.ImgOIClick(Sender: TObject);
begin
  MainSwitchBoardSystem.CBClosed(True);
end;

procedure TfrmGeneratorPanel.ImgPrefClick(Sender: TObject);
begin
  MainSwitchBoardSystem.GeneratorPreference(True);
end;

procedure TfrmGeneratorPanel.ImgStartClick(Sender: TObject);
begin
  MainSwitchBoardSystem.EngineRun(True);
end;

procedure TfrmGeneratorPanel.ImgStopClick(Sender: TObject);
begin
  MainSwitchBoardSystem.EngineRun(False);
end;

end.
