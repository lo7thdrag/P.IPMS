unit UFireFighting;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VrControls, VrRotarySwitch,
  Vcl.StdCtrls, VrAngularMeter, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TfrmFireFightingPump = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Image10: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image5: TImage;
    pnlV: TPanel;
    VrAngularMeter4: TVrAngularMeter;
    Label11: TLabel;
    Label14: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    VrRotarySwitch1: TVrRotarySwitch;
    VrRotarySwitch2: TVrRotarySwitch;
    VrRotarySwitch3: TVrRotarySwitch;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFireFightingPump: TfrmFireFightingPump;

implementation

{$R *.dfm}

end.
