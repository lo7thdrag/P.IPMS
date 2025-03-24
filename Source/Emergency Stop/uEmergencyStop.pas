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
    procedure btnSettingClick(Sender: TObject);
    procedure ConnectClick(Sender: TObject);

    procedure ComPortRxChar(Sender: TObject; Count: Integer);
    procedure tmrComportTimer(Sender: TObject);
    procedure SendStatus(id: Integer; status : Boolean);
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
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


procedure TfrmEmergencyStop.btnSettingClick(Sender: TObject);
begin
//  ComPort.ShowSetupDialog;
end;

procedure TfrmEmergencyStop.btn1Click(Sender: TObject);
begin
//  ComPort.Connected := False;
end;

procedure TfrmEmergencyStop.btn2Click(Sender: TObject);
begin
//  ComPort.Connected := True;
end;

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

procedure TfrmEmergencyStop.FormClose(Sender: TObject;
  var Action: TCloseAction);
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

//  loadSettingEmergency('..\Bin\setting.ini');
//  ComPort.Port := portEmergency;
//  ComPort.BaudRate := br9600;
//  ComPort.DataBits := dbEight;
//  ComPort.StopBits := sbOneStopBit;
//  ComPort.Parity.Bits := prNone;
//  ComPort.FlowControl.FlowControl := fcNone;
//
//
//  if ComPort.Connected then
//  begin
//    tmrComport.Enabled:=False;
//    ComPort.Close;
//  end
//  else
//  begin
//    ComPort.Open;
//    tmrComport.Enabled := True;
//  end;
end;

procedure TfrmEmergencyStop.SendStatus(id: Integer; status: Boolean);
//var
//  i: Integer;
begin
//  for I := 0 to 3 do
//  begin
//    if i = id then
//    begin
//      if Gen[i] <> status then
//      begin
//        EmergencyStopSystem.sendStatusDG(i, status);
//      end;
//    end;
//  end;
end;

var
  MyCounter:Word;

procedure TfrmEmergencyStop.tmrComportTimer(Sender: TObject);
//var
// LEDA,LEDB,LEDC,LEDD:Byte;
// LEDF,LEDH,LEDJ,LEDK:Byte;
begin
//  if ComPort.Connected then
//  begin
//    counter := counter + 1;
//
//    if counter > 20 then
//    begin
//      {Laporan ke instruktur status app}
//      EmergencyStopSystem.sendServoLampStatus(C_ORD_SWITCH_EG, True);
//      counter := 0;
//    end;
//
//    ComPort.WriteStr(#$FF+
//    Char(LEDA)+Char(LEDB)+Char(LEDC)+Char(LEDD)+
//    Char(LEDF)+Char(LEDH)+Char(LEDJ)+Char(LEDK)+
//    '12345678');
//  end;
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

function HexToBin(HexChar:ShortString):ShortString;
begin
// result:='1111';
// if HexChar='0' then result:='0000';
// if HexChar='1' then result:='0001';
// if HexChar='2' then result:='0010';
// if HexChar='3' then result:='0011';
// if HexChar='4' then result:='0100';
// if HexChar='5' then result:='0101';
// if HexChar='6' then result:='0110';
// if HexChar='7' then result:='0111';
// if HexChar='8' then result:='1000';
// if HexChar='9' then result:='1001';
// if HexChar='A' then result:='1010';
// if HexChar='B' then result:='1011';
// if HexChar='C' then result:='1100';
// if HexChar='D' then result:='1101';
// if HexChar='E' then result:='1110';
// if HexChar='F' then result:='1111';
end;

var
 old_sID,sID:ShortString;

procedure TfrmEmergencyStop.ComPortRxChar(Sender: TObject; Count: Integer);
//var
//  Str: String;
//  S:ShortString;
begin
//  ComPort.ReadStr(Str, Count);
//  mmo1.Text := mmo1.Text + Str;
//  str:=mmo1.Lines[0];
//  if pos('$168',str)=1 then edt1.Text:=str;
//  if mmo1.Lines.Count>=2 then mmo1.Lines.Delete(0);
//  s:=Str;
//
//  sID:=Copy(s,6,2);
//  if ((pos('$168',s)=1) and (pos('*',s)=22) and (sID<>old_sID)) then
//  begin
//    old_sID:=sID;
//    Delete(s,1,7);
//    Edt1.Text:=s;
//    EdtRxBin.Text:=
//    HexToBin('5')+
//    HexToBin('5')+
//    HexToBin(Copy(s,1,1))+
//    HexToBin(Copy(s,2,1))+
//    HexToBin(Copy(s,3,1))+
//    HexToBin(Copy(s,4,1))+
//    HexToBin(Copy(s,5,1))+
//    HexToBin(Copy(s,6,1))+
//    HexToBin(Copy(s,7,1))+
//    HexToBin(Copy(s,8,1))+
//    HexToBin(Copy(s,9,1))+
//    HexToBin(Copy(s,10,1))+
//    HexToBin(Copy(s,11,1))+
//    HexToBin(Copy(s,12,1))+
//    HexToBin(Copy(s,13,1))+
//    HexToBin(Copy(s,14,1))+
//    HexToBin(Copy(s,15,1))+
//    HexToBin(Copy(s,16,1));
//    s:=EdtRxBin.Text;
//
//
//    if s[64]='0' then
//    begin
//      shpInputK3.Brush.Color:=clRed;
//      SendStatus(0, True);
//    end
//    else shpInputK3.Brush.Color:=clGray;
//    if s[63]='0' then
//    begin
//      shpInputK4.Brush.Color:=clBlue;
//      SendStatus(0, False)
//    end
//    else shpInputK4.Brush.Color:=clGray;
//    if s[62]='0' then
//    begin
//      shpInputK5.Brush.Color:=clRed;
//      SendStatus(1, True)
//    end
//    else shpInputK5.Brush.Color:=clGray;
//    if s[61]='0' then
//    begin
//      shpInputK6.Brush.Color:=clBlue;
//      SendStatus(1, False);
//    end
//    else shpInputK6.Brush.Color:=clGray;
//    if s[60]='0' then
//    begin
//       shpInputK7.Brush.Color:=clRed;
//       SendStatus(2, True)
//    end
//    else shpInputK7.Brush.Color:=clGray;
//    if s[59]='0' then
//    begin
//       shpInputK8.Brush.Color:=clBlue;
//       SendStatus(2, False)
//    end
//    else shpInputK8.Brush.Color:=clGray;
//    if s[58]='0' then
//    begin
//      shpInputK9.Brush.Color:=clRed;
//      SendStatus(3, True)
//    end
//    else shpInputK9.Brush.Color:=clGray;
//    if s[57]='0' then
//    begin
//      shpInputK10.Brush.Color:=clBlue;
//      SendStatus(3, False)
//    end
//    else shpInputK10.Brush.Color:=clGray;
//  end;
end;
procedure TfrmEmergencyStop.ConnectClick(Sender: TObject);
begin
//  if TButton(Sender).Caption = 'Connect' then
//  begin
//    ComPort.Connected := True;
//    tmrComport.Enabled := True;
//    TButton(Sender).Caption := 'Disconnect';
//  end
//  else
//  begin
//    ComPort.Connected := False;
//    tmrComport.Enabled := False;
//    TButton(Sender).Caption := 'Connect';
//    {Laporan ke instruktur status app}
//    EmergencyStopSystem.sendServoLampStatus(C_ORD_SWITCH_EG, False);
//  end;
end;

end.
