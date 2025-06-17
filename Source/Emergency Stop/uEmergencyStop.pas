unit uEmergencyStop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CPort, ExtCtrls, StdCtrls, uDataType, IniFiles, ShellAPI, Menus,
  VrButtons, VrControls, VrRotarySwitch ;

type
  TfrmEmergencyStop = class(TForm)
    ComPort: TComPort;
    tmrComport: TTimer;
    GroupBox6: TGroupBox;
    Label26: TLabel;
    Label27: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    GroupBox5: TGroupBox;
    btnload: TVrDemoButton;
    edt1: TEdit;
    mmo1: TMemo;
    edtRxBin: TEdit;
    grpTester: TGroupBox;
    Label30: TLabel;
    Label31: TLabel;
    Label8: TLabel;
    grpgen1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    grpgen2: TGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    grpgen3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    grpgen4: TGroupBox;
    Label7: TLabel;
    Label9: TLabel;
    shpInputK4: TShape;
    shpInputK3: TShape;
    shpInputK8: TShape;
    shpInputK7: TShape;
    shpInputK6: TShape;
    shpInputK5: TShape;
    shpInputK10: TShape;
    shpInputK9: TShape;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    CheckBox1: TCheckBox;
    Panel1: TPanel;
    Image1: TImage;
    VrRotarySwitchDG1: TVrRotarySwitch;
    VrRotarySwitchDG2: TVrRotarySwitch;
    VrRotarySwitchDG3: TVrRotarySwitch;
    VrRotarySwitchDG4: TVrRotarySwitch;

    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure VrRotarySwitchDG1Change(Sender: TObject);
    procedure VrRotarySwitchDG2Change(Sender: TObject);
    procedure VrRotarySwitchDG3Change(Sender: TObject);
    procedure VrRotarySwitchDG4Change(Sender: TObject);

  private
    procedure loadSettingEmergency(filepath : string);

  public
    counter : Integer;
    Gen : array [0..3] of Boolean;
    portEmergency : string;
  end;

var
  frmEmergencyStop: TfrmEmergencyStop;

implementation

uses
  uEmergencyStopSystem;

{$R *.dfm}

procedure TfrmEmergencyStop.loadSettingEmergency(filepath: string);
var
  inifile : TIniFile;
  tempstring : TStringList;
begin
  inifile := TIniFile.Create(filepath);
  tempstring := TStringList.Create;

  inifile.ReadSection('Mode', tempstring);

  portEmergency := inifile.ReadString('Mode', tempstring[3],'Default');

  inifile.Free;
  tempstring.Free;
end;

procedure TfrmEmergencyStop.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  {Laporan ke instruktur status app}
  EmergencyStopSystem.sendServoLampStatus(C_ORD_SWITCH_EG, False);
  Sleep(1000);
end;

procedure TfrmEmergencyStop.FormCreate(Sender: TObject);
var
  i : Integer;
begin
  for I := 1 to 4 do
  begin
    Gen[i] := False;
  end;
end;

procedure TfrmEmergencyStop.VrRotarySwitchDG1Change(Sender: TObject);
begin
  if VrRotarySwitchDG1.SwitchPosition = 0 then
    EmergencyStopSystem.sendStatusDG(0, False)
  else
    EmergencyStopSystem.sendStatusDG(0, True)
end;

procedure TfrmEmergencyStop.VrRotarySwitchDG2Change(Sender: TObject);
begin
  if VrRotarySwitchDG2.SwitchPosition = 0 then
    EmergencyStopSystem.sendStatusDG(1, False)
  else
    EmergencyStopSystem.sendStatusDG(1, True)
end;

procedure TfrmEmergencyStop.VrRotarySwitchDG3Change(Sender: TObject);
begin
  if VrRotarySwitchDG3.SwitchPosition = 0 then
    EmergencyStopSystem.sendStatusDG(2, False)
  else
    EmergencyStopSystem.sendStatusDG(2, True)
end;

procedure TfrmEmergencyStop.VrRotarySwitchDG4Change(Sender: TObject);
begin
  if VrRotarySwitchDG4.SwitchPosition = 0 then
    EmergencyStopSystem.sendStatusDG(3, False)
  else
    EmergencyStopSystem.sendStatusDG(3, True)
end;

end.
