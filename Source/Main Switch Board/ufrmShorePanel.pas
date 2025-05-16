unit ufrmShorePanel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RzBmpBtn, VrControls, VrRotarySwitch,
  Vcl.StdCtrls, VrAngularMeter, Vcl.ExtCtrls;

type
  TfrmShorePanel = class(TForm)
    pnlShoreConnection: TPanel;
    Image2: TImage;
    Image1: TImage;
    Image6: TImage;
    Image4: TImage;
    pnlA: TPanel;
    VrAngularMeter3: TVrAngularMeter;
    Label9: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label16: TLabel;
    VrAngularMeter5: TVrAngularMeter;
    pnlkW: TPanel;
    VrAngularMeter1: TVrAngularMeter;
    Label20: TLabel;
    Label19: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    VrRotarySwitch2: TVrRotarySwitch;
    VrRotarySwitch3: TVrRotarySwitch;
    Image8: TImage;
    ImgIndicatorCBOpen: TImage;
    ImgIndicatorCBClose: TImage;
    procedure ImgIndicatorCBOpenClick(Sender: TObject);
    procedure ImgIndicatorCBCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmShorePanel: TfrmShorePanel;

implementation

uses
  uMainSwitchBoardSystem;

{$R *.dfm}

procedure TfrmShorePanel.ImgIndicatorCBCloseClick(Sender: TObject);
begin
  MainSwitchBoardSystem.CBShore(True);
end;

procedure TfrmShorePanel.ImgIndicatorCBOpenClick(Sender: TObject);
begin
  MainSwitchBoardSystem.CBShore(False);
end;

end.
