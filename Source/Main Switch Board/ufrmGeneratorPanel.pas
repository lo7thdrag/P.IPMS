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
    VraPower: TVrAngularMeter;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    pnlHz: TPanel;
    VraFrequency: TVrAngularMeter;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    pnlV: TPanel;
    VraV: TVrAngularMeter;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    pnlA: TPanel;
    vraAmpere1: TVrAngularMeter;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl18: TLabel;
    lbl19: TLabel;
    lbl20: TLabel;
    vraAmpere2: TVrAngularMeter;
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
    tmrFrequency: TTimer;
    tmrAmpere: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ImgStartClick(Sender: TObject);
    procedure ImgStopClick(Sender: TObject);
    procedure ImgPrefClick(Sender: TObject);
    procedure ImgOIClick(Sender: TObject);
    procedure DoLedTest(OnOff : Boolean);
    procedure ImgLTMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImgLTMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImgAUTOClick(Sender: TObject);
    procedure ImgSAClick(Sender: TObject);
    procedure ImgMANClick(Sender: TObject);
    procedure ImgHOClick(Sender: TObject);
    procedure ImgFPClick(Sender: TObject);
    procedure ImgAPClick(Sender: TObject);
    procedure ImgIPClick(Sender: TObject);
    procedure tmrFrequencyTimer(Sender: TObject);
    procedure tmrAmpereTimer(Sender: TObject);
    procedure ImgRaiseClick(Sender: TObject);
  private
    { Private declarations }
    FListener : TListeners;
    Led  : array of TImage;
    LedStatus  : array of Boolean;
    ShiftMode : Boolean;

    procedure GeneratorPanelSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Integer);overload;
    procedure GeneratorPanelSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Boolean);overload;

  public
    OrderFrequency : Double;
    OrderAmpere : Double;
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

procedure TfrmGeneratorPanel.DoLedTest(OnOff: Boolean);
var
  i : Integer;
begin
  if OnOff then
  begin
    for i := 0 to High(Led) do
    begin
      LedStatus[i] := Led[i].Visible;
      Led[i].Visible := True;
    end;
  end
  else
  begin
     for i := 0 to High(Led) do
    begin
      Led[i].Visible := LedStatus[i];
    end;
  end;
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

  Led := [ImgIndicatorAuto, ImgIndicatorSA, ImgIndicatorMan,
          ImgIndicatorER, ImgIndicatorGS, ImgIndicatorCBC, ImgIndicatorPreference, ImgIndicatorBS,
          ImgIndicatorHO, ImgIndicatorFP, ImgIndicatorAP];
  SetLength(LedStatus, Length(Led));
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

procedure TfrmGeneratorPanel.ImgMANClick(Sender: TObject);
begin
  MainSwitchBoardSystem.GeneratorMode(1);
end;

procedure TfrmGeneratorPanel.ImgSAClick(Sender: TObject);
begin
  MainSwitchBoardSystem.GeneratorMode(2);
end;

procedure TfrmGeneratorPanel.ImgAPClick(Sender: TObject);
begin
//
end;

procedure TfrmGeneratorPanel.ImgAUTOClick(Sender: TObject);
begin
  MainSwitchBoardSystem.GeneratorMode(3);
end;

procedure TfrmGeneratorPanel.ImgFPClick(Sender: TObject);
begin
//
end;

procedure TfrmGeneratorPanel.ImgHOClick(Sender: TObject);
begin
//
end;

procedure TfrmGeneratorPanel.ImgIPClick(Sender: TObject);
begin
//
end;

procedure TfrmGeneratorPanel.ImgLTMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DoLedTest(True);
end;

procedure TfrmGeneratorPanel.ImgLTMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  DoLedTest(False);
end;

procedure TfrmGeneratorPanel.ImgOIClick(Sender: TObject);
begin
  MainSwitchBoardSystem.CBClosed(True);
end;

procedure TfrmGeneratorPanel.ImgPrefClick(Sender: TObject);
begin
  MainSwitchBoardSystem.GeneratorPreference(True);
end;

procedure TfrmGeneratorPanel.ImgRaiseClick(Sender: TObject);
begin
  ShiftMode := not ShiftMode;
  if ShiftMode then
    ShowMessage('Shift Mode ON')
  else
    ShowMessage('Shift Mode OFF');
end;

procedure TfrmGeneratorPanel.ImgStartClick(Sender: TObject);
begin
  MainSwitchBoardSystem.EngineRun(True);
end;

procedure TfrmGeneratorPanel.ImgStopClick(Sender: TObject);
begin
  MainSwitchBoardSystem.EngineStop(True);
end;

procedure TfrmGeneratorPanel.tmrAmpereTimer(Sender: TObject);
begin
  if vraAmpere1.Position > OrderAmpere then
  begin
    vraAmpere1.Position := vraAmpere1.Position - 1;
  end
  else if vraAmpere1.Position < OrderAmpere then
  begin
    vraAmpere1.Position := vraAmpere1.Position + 1;
  end
  else
  begin
    tmrAmpere.Enabled := False;
  end;
end;

procedure TfrmGeneratorPanel.tmrFrequencyTimer(Sender: TObject);
begin
  if VraFrequency.Position > OrderFrequency then
  begin
    VraFrequency.Position := VraFrequency.Position - 1;
  end
  else if VraFrequency.Position < OrderFrequency then
  begin
    VraFrequency.Position := VraFrequency.Position + 1;
  end
  else
  begin
    tmrFrequency.Enabled := False;
  end;
end;

end.
