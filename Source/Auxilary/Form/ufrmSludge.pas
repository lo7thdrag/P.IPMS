unit ufrmSludge;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VrControls, VrRotarySwitch,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TfrmSludge = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    VrRotarySwitch1: TVrRotarySwitch;
    VrRotarySwitch2: TVrRotarySwitch;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSludge: TfrmSludge;

implementation

{$R *.dfm}

end.
