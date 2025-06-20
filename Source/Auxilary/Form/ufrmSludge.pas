unit ufrmSludge;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VrControls, VrRotarySwitch, Vcl.Imaging.pngimage, Vcl.ExtCtrls,

  uDataType, uMainForm;

type
  TfrmSludge = class(TForm)
    pnlMainBackground: TPanel;
    Image1: TImage;
    imgACHeating: TImage;
    imgStart: TImage;
    imgStop: TImage;
    Image5: TImage;
    Image6: TImage;
    vrAcHeating: TVrRotarySwitch;
    vrPowerSupply: TVrRotarySwitch;
    imgShadowStart: TImage;
    imgShadowStop: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure vrAcHeatingClick(Sender: TObject);
    procedure imgShadowStartClick(Sender: TObject);
    procedure imgShadowStopClick(Sender: TObject);
    procedure vrPowerSupplyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSludge: TfrmSludge;

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

procedure TfrmSludge.FormCreate(Sender: TObject);
begin
  EnableComposited(pnlMainBackground);
end;

procedure TfrmSludge.FormShow(Sender: TObject);
begin
  if Screen.MonitorCount > 1 then
  begin
    Left   := Screen.Monitors[AuxiliarySystem.IdScreen2].Left;
    Top    := Screen.Monitors[AuxiliarySystem.IdScreen2].Top;
    Width  := Screen.Monitors[AuxiliarySystem.IdScreen2].Width;
    Height := Screen.Monitors[AuxiliarySystem.IdScreen2].Height;
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

procedure TfrmSludge.imgShadowStartClick(Sender: TObject);
begin
  if frmMainForm.pumpTemp[2].PowerSupply then
    AuxiliarySystem.EngineRun(C_PUMP_ID[2], True);

end;

procedure TfrmSludge.imgShadowStopClick(Sender: TObject);
begin
  if frmMainForm.pumpTemp[2].PowerSupply then
    AuxiliarySystem.EngineRun(C_PUMP_ID[2], False);
end;

procedure TfrmSludge.vrAcHeatingClick(Sender: TObject);
begin
  imgACHeating.Visible := not (vrAcHeating.SwitchPosition = 1);
end;

procedure TfrmSludge.vrPowerSupplyClick(Sender: TObject);
begin
  case vrPowerSupply.SwitchPosition of
    0: AuxiliarySystem.PowerSupply(C_PUMP_ID[2], False);
    1: AuxiliarySystem.PowerSupply(C_PUMP_ID[2], True)
  end;
end;

{$ENDREGION}

end.
