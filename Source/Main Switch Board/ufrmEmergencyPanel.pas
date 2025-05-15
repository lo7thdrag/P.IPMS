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
    ImgIndicatorCBC: TImage;
    ImgIndicatorCKC: TImage;
    ImgIndicatorGS: TImage;
    ImgIndicatorER: TImage;
    IMGIndicatorAuto: TImage;
    ImgIndicatorSA: TImage;
    ImgIndicatorMan: TImage;
    ImgIndicatorAP: TImage;
    ImgIndicatorFP: TImage;
    ImgIndicatorHO: TImage;
    procedure ImgStartClick(Sender: TObject);
    procedure ImgStopClick(Sender: TObject);
    procedure ImgOIClick(Sender: TObject);
    procedure ImgPrefClick(Sender: TObject);
    procedure DoLedTest(OnOff : Boolean);
    procedure ImgLTMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImgLTMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure ImgAUTOClick(Sender: TObject);
    procedure ImgSAClick(Sender: TObject);
    procedure ImgMANClick(Sender: TObject);
  private
    { Private declarations }
    Led  : array of TImage;
    LedStatus  : array of Boolean;
  public
    { Public declarations }
  end;

var
  frmEmergencyPanel: TfrmEmergencyPanel;

implementation

uses
  uMainSwitchBoardSystem;

{$R *.dfm}

procedure TfrmEmergencyPanel.DoLedTest(OnOff: Boolean);
var
  i : Integer;
begin
  if OnOff then
  begin
    for i := 0 to High(Led) do
    begin
      LedStatus[i] := Led[i].Visible;
      Led[i].Visible := True;
    end;
  end
  else
  begin
     for i := 0 to High(Led) do
    begin
      Led[i].Visible := LedStatus[i];
    end;
  end;
end;

procedure TfrmEmergencyPanel.FormCreate(Sender: TObject);
begin
  Led := [IMGIndicatorAuto, ImgIndicatorSA, ImgIndicatorMan,
          ImgIndicatorER, ImgIndicatorGS, ImgIndicatorCKC, ImgIndicatorCBC, ImgIndicatorBS,
          ImgIndicatorHO, ImgIndicatorFP, ImgIndicatorAP];
  SetLength(LedStatus, Length(Led));
end;

procedure TfrmEmergencyPanel.ImgMANClick(Sender: TObject);
begin
  MainSwitchBoardSystem.GeneratorMode(1);
end;

procedure TfrmEmergencyPanel.ImgSAClick(Sender: TObject);
begin
  MainSwitchBoardSystem.GeneratorMode(2);
end;

procedure TfrmEmergencyPanel.ImgAUTOClick(Sender: TObject);
begin
  MainSwitchBoardSystem.GeneratorMode(3);
end;

procedure TfrmEmergencyPanel.ImgLTMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DoLedTest(True);
end;

procedure TfrmEmergencyPanel.ImgLTMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  DoLedTest(False);
end;

procedure TfrmEmergencyPanel.ImgOIClick(Sender: TObject);
begin
  MainSwitchBoardSystem.CKClosed(True);
end;

procedure TfrmEmergencyPanel.ImgPrefClick(Sender: TObject);
begin
  MainSwitchBoardSystem.GeneratorPreference(True);
end;

procedure TfrmEmergencyPanel.ImgStartClick(Sender: TObject);
begin
  MainSwitchBoardSystem.EngineRun(True);
end;

procedure TfrmEmergencyPanel.ImgStopClick(Sender: TObject);
begin
  MainSwitchBoardSystem.EngineStop(True);
end;

end.
