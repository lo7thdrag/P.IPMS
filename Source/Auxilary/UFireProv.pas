unit UFireProv;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VrControls, VrRotarySwitch,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TfrmFirePumpProv = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Image6: TImage;
    Image3: TImage;
    Image4: TImage;
    VrRotarySwitch2: TVrRotarySwitch;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFirePumpProv: TfrmFirePumpProv;

implementation

{$R *.dfm}

end.
