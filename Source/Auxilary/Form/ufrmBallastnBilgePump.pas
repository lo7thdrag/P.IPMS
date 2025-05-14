unit ufrmBallastnBilgePump;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VrControls, VrRotarySwitch,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls,

  uDataType;

type
  TfrmBallastnBilgePump = class(TForm)
    pnlMainBackground: TPanel;
    imgMainBackground: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    VrRotarySwitch1: TVrRotarySwitch;
    VrRotarySwitch2: TVrRotarySwitch;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);

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

end.
