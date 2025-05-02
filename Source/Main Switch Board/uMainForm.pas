unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, VrControls,
  VrRotarySwitch, RzBmpBtn, VrAngularMeter, Vcl.ExtCtrls;

type
  TfrmGenPSFWD = class(TForm)
    pnlGenPSFwd: TPanel;
    Image2: TImage;
    Image1: TImage;
    Image4: TImage;
    Image5: TImage;
    Image3: TImage;
    Image6: TImage;
    pnlkW: TPanel;
    VrAngularMeter1: TVrAngularMeter;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    pnlHz: TPanel;
    VrAngularMeter2: TVrAngularMeter;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label13: TLabel;
    pnlV: TPanel;
    VrAngularMeter4: TVrAngularMeter;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    pnlA: TPanel;
    VrAngularMeter3: TVrAngularMeter;
    Label9: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label16: TLabel;
    VrAngularMeter5: TVrAngularMeter;
    pnlGensys: TPanel;
    imgGensys: TImage;
    RzBmpHornOff: TRzBmpButton;
    RzBmpFaultPage: TRzBmpButton;
    RzBmpAlarmPage: TRzBmpButton;
    RzBmpInfoPage: TRzBmpButton;
    RzBmpLedTest: TRzBmpButton;
    RzBmpEsc: TRzBmpButton;
    RzBmpRaise: TRzBmpButton;
    RzBmpLower: TRzBmpButton;
    RzBmpShift: TRzBmpButton;
    RzBmpEnter: TRzBmpButton;
    RzBmpF5: TRzBmpButton;
    RzBmpF1: TRzBmpButton;
    RzBmpF2: TRzBmpButton;
    RzBmpF3: TRzBmpButton;
    RzBmpF4: TRzBmpButton;
    RzBmpAuto: TRzBmpButton;
    RzBmpSemiAuto: TRzBmpButton;
    RzBmpMan: TRzBmpButton;
    RzBmpStart: TRzBmpButton;
    RzBmpStop: TRzBmpButton;
    RzBmp01: TRzBmpButton;
    RzBmpPref: TRzBmpButton;
    RzBmpIEngineRunning: TRzBmpButton;
    RzBmpIGeneratorSupply: TRzBmpButton;
    RzBmpICBClossed: TRzBmpButton;
    RzBmpIPreference: TRzBmpButton;
    RzBmpIBusbarSupply: TRzBmpButton;
    VrRotarySwitch1: TVrRotarySwitch;
    VrRotarySwitch2: TVrRotarySwitch;
    Label21: TLabel;
    Button1: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGenPSFWD: TfrmGenPSFWD;

implementation

{$R *.dfm}

end.
