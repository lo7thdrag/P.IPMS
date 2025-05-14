unit ufrmSWPumpProvRefrig2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VrControls, VrRotarySwitch,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TfrmSWPumpProvRefrig2 = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Image6: TImage;
    Image3: TImage;
    Image4: TImage;
    VrRotarySwitch2: TVrRotarySwitch;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSWPumpProvRefrig2: TfrmSWPumpProvRefrig2;

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

procedure TfrmSWPumpProvRefrig2.FormCreate(Sender: TObject);
begin
//  EnableComposited(Panel1);
end;

procedure TfrmSWPumpProvRefrig2.FormShow(Sender: TObject);
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

end.
