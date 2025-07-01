unit ufrmFireFightingPump2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VrControls, VrRotarySwitch, Vcl.StdCtrls, VrAngularMeter,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls,

  uDataType, uMainForm;

type
  TfrmFireFightingPump2 = class(TForm)
    pnlMainBackground: TPanel;
    Image1: TImage;
    Image10: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    imgACHeating: TImage;
    imgStart: TImage;
    imgStop: TImage;
    Image9: TImage;
    Image5: TImage;
    pnlV: TPanel;
    vraAmpherMeter: TVrAngularMeter;
    Label11: TLabel;
    Label14: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    vrAcHeating: TVrRotarySwitch;
    vrRemote: TVrRotarySwitch;
    vrPowerSupply: TVrRotarySwitch;
    imgShadowStop: TImage;
    imgShadowStart: TImage;
    img1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure vrAcHeatingClick(Sender: TObject);
    procedure imgShadowStartClick(Sender: TObject);
    procedure imgShadowStopClick(Sender: TObject);
    procedure vrPowerSupplyClick(Sender: TObject);
    procedure vrRemoteClick(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmFireFightingPump2: TfrmFireFightingPump2;

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

procedure TfrmFireFightingPump2.FormCreate(Sender: TObject);
begin
  EnableComposited(pnlMainBackground);
end;

procedure TfrmFireFightingPump2.FormShow(Sender: TObject);
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

procedure TfrmFireFightingPump2.imgShadowStartClick(Sender: TObject);
begin
  if frmMainForm.pumpTemp[3].PowerSupply then
    AuxiliarySystem.EngineRun(C_PUMP_ID[3], True);
end;

procedure TfrmFireFightingPump2.imgShadowStopClick(Sender: TObject);
begin
  if frmMainForm.pumpTemp[3].PowerSupply then
    AuxiliarySystem.EngineRun(C_PUMP_ID[3], False);
end;

procedure TfrmFireFightingPump2.vrAcHeatingClick(Sender: TObject);
begin
  imgACHeating.Visible := (vrAcHeating.SwitchPosition = 1);
end;

procedure TfrmFireFightingPump2.vrPowerSupplyClick(Sender: TObject);
begin
  case vrPowerSupply.SwitchPosition of
    0: AuxiliarySystem.PowerSupply(C_PUMP_ID[3], False);
    1: AuxiliarySystem.PowerSupply(C_PUMP_ID[3], True)
  end;
end;

procedure TfrmFireFightingPump2.vrRemoteClick(Sender: TObject);
begin
  if vrRemote.SwitchPosition = 0 then
    AuxiliarySystem.Mode(C_PUMP_ID[3], 0)
  else if vrRemote.SwitchPosition = 2 then
    AuxiliarySystem.Mode(C_PUMP_ID[3], 1)
end;

{$ENDREGION}

end.
