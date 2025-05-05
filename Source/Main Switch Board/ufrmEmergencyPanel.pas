unit ufrmEmergencyPanel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, VrControls,
  VrRotarySwitch, VrAngularMeter, Vcl.ExtCtrls;

type
  TfrmEmergencyPanel = class(TForm)
    pnlEmergency: TPanel;
    Image2: TImage;
    Image4: TImage;
    Image5: TImage;
    Image1: TImage;
    Image3: TImage;
    Image6: TImage;
    Image7: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    Image8: TImage;
    pnlGensys: TPanel;
    imgGensys: TImage;
    pnlA: TPanel;
    Label9: TLabel;
    VrAngularMeter3: TVrAngularMeter;
    Label15: TLabel;
    Label18: TLabel;
    Label16: TLabel;
    VrAngularMeter5: TVrAngularMeter;
    pnlkW: TPanel;
    VrAngularMeter1: TVrAngularMeter;
    Label2: TLabel;
    Label20: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    pnlV: TPanel;
    VrAngularMeter4: TVrAngularMeter;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    pnlHz: TPanel;
    VrAngularMeter2: TVrAngularMeter;
    Label6: TLabel;
    Label13: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    VrAngularMeter6: TVrAngularMeter;
    VrRotarySwitch4: TVrRotarySwitch;
    VrRotarySwitch2: TVrRotarySwitch;
    VrRotarySwitch3: TVrRotarySwitch;
    VrRotarySwitch1: TVrRotarySwitch;
    Label17: TLabel;
    VrRotarySwitch5: TVrRotarySwitch;
    Button1: TButton;
    ImgEnter: TImage;
    ImgShift: TImage;
    ImgLower: TImage;
    ImgRaise: TImage;
    ImgEsc: TImage;
    ImgLT: TImage;
    ImgIP: TImage;
    ImgAP: TImage;
    ImgFP: TImage;
    ImgHO: TImage;
    ImgF5: TImage;
    ImgF4: TImage;
    ImgF3: TImage;
    ImgF2: TImage;
    ImgF1: TImage;
    ImgAUTO: TImage;
    ImgSA: TImage;
    ImgMAN: TImage;
    ImgStart: TImage;
    ImgStop: TImage;
    ImgOI: TImage;
    ImgPref: TImage;
    ImgIndicatorBS: TImage;
    ImgIndicatorPreference: TImage;
    ImgIndicatorCBC: TImage;
    ImgIndicatorGS: TImage;
    ImgIndicatorER: TImage;
    IMGIndicatorAuto: TImage;
    ImgIndicatorSA: TImage;
    ImgIndicatorMan: TImage;
    ImgIndicatorAP: TImage;
    ImgIndicatorFP: TImage;
    ImgIndicatorHO: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEmergencyPanel: TfrmEmergencyPanel;

implementation

{$R *.dfm}

end.
