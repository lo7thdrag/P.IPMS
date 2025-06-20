unit ufrmBallastnBilgePump;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VrControls, VrRotarySwitch,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls,

  uDataType, uMainForm;

type
  TfrmBallastnBilgePump = class(TForm)
    pnlMainBackground: TPanel;
    imgMainBackground: TImage;
    imgACHeating: TImage;
    imgStart: TImage;
    imgStop: TImage;
    Image5: TImage;
    Image6: TImage;
    vrAcHeating: TVrRotarySwitch;
    vrPowerSupply: TVrRotarySwitch;
    imgShadowStart: TImage;
    imgShadowStop: TImage;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure vrAcHeatingClick(Sender: TObject);
    procedure imgShadowStartClick(Sender: TObject);
    procedure imgShadowStopClick(Sender: TObject);
    procedure vrPowerSupplyClick(Sender: TObject);

  private

  public
    { Public declarations }
  end;

var
  frmBallastnBilgePump: TfrmBallastnBilgePump;

implementation

uses
  uAuxiliarySystem;

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

{$REGION ' Form Procedure '}

procedure TfrmBallastnBilgePump.FormCreate(Sender: TObject);
begin
  EnableComposited(pnlMainBackground);
end;

procedure TfrmBallastnBilgePump.FormShow(Sender: TObject);
begin
  if Screen.MonitorCount > 1 then
  begin
    Left   := Screen.Monitors[AuxiliarySystem.IdScreen1].Left;
    Top    := Screen.Monitors[AuxiliarySystem.IdScreen1].Top;
    Width  := Screen.Monitors[AuxiliarySystem.IdScreen1].Width;
    Height := Screen.Monitors[AuxiliarySystem.IdScreen1].Height;
  end
  else
  begin
    Left   := Screen.Monitors[0].Left;
    Top    := Screen.Monitors[0].Top;
    Width  := Screen.Monitors[0].Width;
    Height := Screen.Monitors[0].Height;
  end;
end;

{$ENDREGION}

{$REGION ' Button Handle Procedure '}

procedure TfrmBallastnBilgePump.imgShadowStartClick(Sender: TObject);
begin
  if frmMainForm.pumpTemp[0].PowerSupply then
    AuxiliarySystem.EngineRun(C_PUMP_ID[0], True);

end;

procedure TfrmBallastnBilgePump.imgShadowStopClick(Sender: TObject);
begin
  if frmMainForm.pumpTemp[0].PowerSupply then
    AuxiliarySystem.EngineRun(C_PUMP_ID[0], False);
end;

procedure TfrmBallastnBilgePump.vrAcHeatingClick(Sender: TObject);
begin
  imgACHeating.Visible := not (vrAcHeating.SwitchPosition = 1);
end;

procedure TfrmBallastnBilgePump.vrPowerSupplyClick(Sender: TObject);
begin
  case vrPowerSupply.SwitchPosition of
    0: AuxiliarySystem.PowerSupply(C_PUMP_ID[0], False);
    1: AuxiliarySystem.PowerSupply(C_PUMP_ID[0], True)
  end;
end;

{$ENDREGION}

end.
