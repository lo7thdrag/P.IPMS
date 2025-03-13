unit ComMainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, CPort, CPortCtl, ComCtrls, Spin, uDataType, uListener, IniFiles;

type
  TFormServo = class(TForm)
    ComPort: TComPort;
    Button_Open: TButton;
    Button_Settings: TButton;
    Bt_Store: TButton;
    Bt_Load: TButton;
    GroupBox1: TGroupBox;
    TrackBar1: TTrackBar;
    GroupBox2: TGroupBox;
    TrackBar2: TTrackBar;
    GroupBox3: TGroupBox;
    Button2: TButton;
    EditMotorID: TEdit;
    GroupBox4: TGroupBox;
    TrackBar3: TTrackBar;
    GroupBox5: TGroupBox;
    TrackBar4: TTrackBar;
    GroupBox6: TGroupBox;
    TrackBar5: TTrackBar;
    GroupBox7: TGroupBox;
    TrackBar6: TTrackBar;
    GroupBox8: TGroupBox;
    TrackBar7: TTrackBar;
    GroupBox9: TGroupBox;
    TrackBar8: TTrackBar;
    btnCenter1: TButton;
    btnCenter2: TButton;
    btnCenter3: TButton;
    btnCenter4: TButton;
    btnCenter5: TButton;
    btnCenter6: TButton;
    btnCenter7: TButton;
    btnCenter8: TButton;
    SpinEditMaxTorque: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    EditServoID1: TEdit;
    EditServoID2: TEdit;
    EditServoID3: TEdit;
    EditServoID4: TEdit;
    EditServoID5: TEdit;
    EditServoID6: TEdit;
    EditServoID7: TEdit;
    EditServoID8: TEdit;
    edttrackbar1: TEdit;
    edtRPMME: TEdit;
    btn1: TButton;
    edtRPMSHAFT: TEdit;
    edtRudder: TEdit;
    edtCPP: TEdit;
    edt4: TEdit;
    edt5: TEdit;
    edt6: TEdit;
    edt7: TEdit;
    btn2: TButton;
    tmr1: TTimer;
    tmr2: TTimer;
    pnl1: TPanel;
    lbl2: TLabel;
    lbl1: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    tmrActualSpeed: TTimer;
    tmrShaftSpeedServo: TTimer;
    tmrActualPitchServo: TTimer;
    procedure Button_OpenClick(Sender: TObject);
    procedure Button_SettingsClick(Sender: TObject);
    procedure ComPortOpen(Sender: TObject);
    procedure ComPortClose(Sender: TObject);
    procedure Bt_LoadClick(Sender: TObject);
    procedure Bt_StoreClick(Sender: TObject);
    procedure PanelOutA10Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure TrackBar3Change(Sender: TObject);
    procedure TrackBar4Change(Sender: TObject);
    procedure TrackBar5Change(Sender: TObject);
    procedure TrackBar6Change(Sender: TObject);
    procedure TrackBar7Change(Sender: TObject);
    procedure TrackBar8Change(Sender: TObject);
    procedure btnCenter1Click(Sender: TObject);
    procedure btnCenter2Click(Sender: TObject);
    procedure btnCenter3Click(Sender: TObject);
    procedure btnCenter4Click(Sender: TObject);
    procedure btnCenter5Click(Sender: TObject);
    procedure btnCenter6Click(Sender: TObject);
    procedure btnCenter7Click(Sender: TObject);
    procedure btnCenter8Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tmr2Timer(Sender: TObject);
    procedure tmrActualSpeedTimer(Sender: TObject);
    procedure tmrShaftSpeedServoTimer(Sender: TObject);
    procedure tmrActualPitchServoTimer(Sender: TObject);
  private
    { Private declarations }

    FActualSpeedServoPS,
    FActualSpeedServoSB,
    FShaftSpeedServoPS,
    FShaftSpeedServoSB,
    FActualPitchServoPS,
    FActualPitchServoSB : Double;

    procedure PCSSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Integer);overload;
    procedure PCSSystemEvent(Sender : TObject; PropsID : E_PropsID; Value : Double); overload;
    procedure loadSettingservo(filepath : string);
    procedure checkConnect(servoSIDE : Integer);

  public
    { Public declarations }

    TempSpeedMELeft, TempSpeedCPPLeft, TempSpeedSHAFTLeft, tempRudderRight,
    tempRudderLeft, TempSpeedMERight, TempSpeedCPPRight, TempSpeedSHAFTRight : Double;

    Ahead,
    TestSpeedPS, TestSpeedSB, TestShaftPS, TestShaftSB,
    TestCPPPS, TestCPPSB, TestRudderPS, TestRudderSB : Boolean;

    idServoRPMME, idServoRPMSHAFT
    , idServoCPP, idServoRudder,
     modeUse, idServoRPMME_2, idServoRPMSHAFT_2
    , idServoCPP_2, idServoRudder_2, counter, servoLocation : Integer;

    degRPMME, degRPMME_2, degRPMSHAFT,
    degRPMSHAFT_2, degCPP,
     degCPP_2, degRud, degRud_2 : Double;

//    ServoSpeedMEPS, ServoShaftPS, ServoCPPPS,
//    ServoSpeedMESB, ServoShaftSB, ServoCPPSB : Double;

    koefRate, degRate, convTempspeed, convTempspeed_2 : Double;
    outputRPMMERight, outputCPPRight, outputRPMSHAFTRight,
    outputRPMMELeft, outputCPPLeft, outputRPMSHAFTLeft : Integer;

     servoPort : string;

    property ActualSpeedServoPS: Double read FActualSpeedServoPS write FActualSpeedServoPS;
    property ActualSpeedServoSB: Double read FActualSpeedServoSB write FActualSpeedServoSB;
    property ShaftSpeedServoPS: Double read FShaftSpeedServoPS write FShaftSpeedServoPS;
    property ShaftSpeedServoSB: Double read FShaftSpeedServoSB write FShaftSpeedServoSB;
    property ActualPitchServoPS: Double read FActualPitchServoPS write FActualPitchServoPS;
    property ActualPitchServoSB: Double read FActualPitchServoSB write FActualPitchServoSB;
  end;

var
  FormServo: TFormServo;

implementation

uses uPCSSystem;

{$R *.DFM}


function ComPortReady:Boolean;
begin
 if FormServo.button_Open.Caption='Open' then
  begin
   result:=FALSE;
   //ShowMessage('Port belum Aktif !');
   exit; // keluar bila Port belum diaktifkan
  end;
 result:=TRUE;
end;


procedure Servo_SetPosition(MotorID:Word;GoalPosition:Word);
var
 Data:string;
 i,CS:Byte;
begin
 if not ComPortReady then exit;
 Data:=Char(MotorID)+#5#3#30;
 Data:=Data+CHar(Lo(GoalPosition))+CHar(Hi(GoalPosition)); //CS=#224
 CS:=0;
 for i:= 1 to Length(Data) do
  begin
   CS:=CS+Ord(Data[i]);
  end;
 FormServo.ComPort.WriteStr(#255#255+Data+Char(not CS));
end;

procedure Servo_SetMaxTorque(MotorID:Word;MaxTorque:Word);
var
 Data:string;
 i,CS:Byte;
begin
 if not ComPortReady then exit;
 Data:=Char(MotorID)+#5#3#34;
 Data:=Data+CHar(Lo(MaxTorque))+CHar(Hi(MaxTorque)); //CS=#224
 CS:=0;
 for i:= 1 to Length(Data) do
  begin
   CS:=CS+Ord(Data[i]);
  end;
 FormServo.ComPort.WriteStr(#255#255+Data+Char(not CS));
end;

procedure TFormServo.loadSettingservo(filepath : string);
var
  inifile : TIniFile;
  tempstring, tempstring_2, tempstring_3 : TStringList;

begin
  inifile := TIniFile.Create(filepath);
  tempstring := TStringList.Create;
  tempstring_2 := TStringList.Create;
  tempstring_3 := TStringList.Create;

  inifile.ReadSection('Servo', tempstring);
  inifile.ReadSection('Mode', tempstring_2);
  inifile.ReadSection('Form PCS', tempstring_3);


  idServoRPMME := StrToInt(inifile.ReadString('Servo', tempstring[0],'Default'));
  idServoRPMME_2 := StrToInt(inifile.ReadString('Servo', tempstring[1],'Default'));
  idServoRPMSHAFT := StrToInt(inifile.ReadString('Servo', tempstring[2],'Default'));
  idServoRPMSHAFT_2 := StrToInt(inifile.ReadString('Servo', tempstring[3],'Default'));
  idServoCPP := StrToInt(inifile.ReadString('Servo', tempstring[4],'Default'));
  idServoCPP_2 := StrToInt(inifile.ReadString('Servo', tempstring[5],'Default'));
  idServoRudder := StrToInt(inifile.ReadString('Servo', tempstring[6],'Default'));
  idServoRudder_2 := StrToInt(inifile.ReadString('Servo', tempstring[7],'Default'));
  degRPMME := StrToInt(inifile.ReadString('Servo', tempstring[8],'Default'));
  degRPMME_2 := StrToInt(inifile.ReadString('Servo', tempstring[9],'Default'));
  degRPMSHAFT := StrToInt(inifile.ReadString('Servo', tempstring[10],'Default'));
  degRPMSHAFT_2 := StrToInt(inifile.ReadString('Servo', tempstring[11],'Default'));
  degCPP := StrToFloat(inifile.ReadString('Servo', tempstring[12],'Default'));
  degCPP_2 := StrToFloat(inifile.ReadString('Servo', tempstring[13],'Default'));
  degRud := StrToInt(inifile.ReadString('Servo', tempstring[14],'Default'));
  degRud_2 := StrToInt(inifile.ReadString('Servo', tempstring[15],'Default'));


  modeUse := StrToInt(inifile.ReadString('Mode', tempstring_2[0],'Default'));
  servoPort := inifile.ReadString('Mode', tempstring_2[1],'Default');

  servoLocation := StrToInt(inifile.ReadString('Form PCS', tempstring_3[0],'Default'));

  PCSSystem.servoID := servoLocation;

  inifile.Free;
  tempstring.Free;
  tempstring_2.Free;
  tempstring_3.Free;
end;

procedure TFormServo.btnCenter8Click(Sender: TObject);
begin
 TrackBar8.Position:=50;
 TestRudderSB := True;
end;

procedure TFormServo.Button2Click(Sender: TObject);
begin
 Servo_SetMaxTorque(StrToInt(EditMotorID.Text),SpinEditMaxTorque.Value);
end;

procedure TFormServo.btn1Click(Sender: TObject);
var
  outputCPPRight  : Integer;
  degRate, koefRate, convTempspeed      : Double;
begin
        TempSpeedCPPRight := StrToFloat(edt4.Text);
        edt6.Text := FloatToStr(TempSpeedCPPRight);

        koefRate := 625/180;
        degRate := 180/150;

        if TempSpeedCPPRight >= 0 then
          Ahead := True
        else if TempSpeedCPPRight < 0 then
          Ahead := False;

        if Ahead = True then
        begin
          if  TempSpeedCPPRight > 100 then
          begin
            TempSpeedCPPRight := 100;
          end;

          convTempspeed := 100 + TempSpeedCPPRight;
        end
        else
        begin
          if TempSpeedCPPRight < -100 then
          begin
            TempSpeedCPPRight := -100;
          end;
          convTempspeed := 100 + TempSpeedCPPRight;
        end;
        outputCPPRight := Round(convTempspeed * degRate * koefRate);
        Servo_SetPosition(12,(927 - outputCPPRight));
end;

procedure TFormServo.btn2Click(Sender: TObject);
begin
  ComPort.Connected := False;
end;

procedure TFormServo.btnCenter1Click(Sender: TObject);
begin
// if TestSpeedPS then
//   TestSpeedPS := False
// else
// begin
   TrackBar1.Position:=0;
   TestSpeedPS := True;
// end;

end;

procedure TFormServo.btnCenter2Click(Sender: TObject);
begin
 TrackBar2.Position:=0;
 TestShaftPS := True;
end;

procedure TFormServo.btnCenter3Click(Sender: TObject);
begin
 TrackBar3.Position:=50;
 TestCPPPS := True;
end;

procedure TFormServo.btnCenter4Click(Sender: TObject);
begin
 TrackBar4.Position:=50;
 TestRudderPS := True;
end;

procedure TFormServo.btnCenter5Click(Sender: TObject);
begin
 TrackBar5.Position:=0;
 TestSpeedSB := True;
end;

procedure TFormServo.btnCenter6Click(Sender: TObject);
begin
 TrackBar6.Position:=0;
 TestShaftSB := True;
end;

procedure TFormServo.btnCenter7Click(Sender: TObject);
begin
 TrackBar7.Position:=50;
 TestCPPSB := True;
end;

procedure TFormServo.Button_OpenClick(Sender: TObject);
begin
  if ComPort.Connected then
   begin
    ComPort.Close;
    TrackBar1.Enabled:=False;
    TrackBar2.Enabled:=False;
    TrackBar3.Enabled:=False;
    TrackBar4.Enabled:=False;
    TrackBar5.Enabled:=False;
    TrackBar6.Enabled:=False;
    TrackBar7.Enabled:=False;
    TrackBar8.Enabled:=False;
   end
  else
   begin
    ComPort.Open;
    TrackBar1.Enabled:=True;
    TrackBar2.Enabled:=True;
    TrackBar3.Enabled:=True;
    TrackBar4.Enabled:=True;
    TrackBar5.Enabled:=True;
    TrackBar6.Enabled:=True;
    TrackBar7.Enabled:=True;
    TrackBar8.Enabled:=True;
    btnCenter1.Click;
   end;
end;

procedure TFormServo.Button_SettingsClick(Sender: TObject);
begin
  ComPort.ShowSetupDialog;
end;

procedure TFormServo.checkConnect(servoSIDE: Integer);
begin
  if ComPort.Connected = True then
  begin
    PCSSystem.sendServoLampStatus(servoSIDE, True);
  end
  else
  begin
     PCSSystem.sendServoLampStatus(servoSIDE, False);
  end;
end;

procedure TFormServo.ComPortOpen(Sender: TObject);
begin
  Button_Open.Caption := 'Close';
end;

procedure TFormServo.FormCreate(Sender: TObject);
begin
with PCSSystem.Listener.Add('SERVO') as TPropertyEventListener do begin
      OnPropertyIntChange := PCSSystemEvent;
      OnPropertyDblChange := PCSSystemEvent;
  end;
  Ahead := False;

  idServoRPMME := 0;
  idServoRPMSHAFT:=0;
  idServoCPP:=0;
  idServoRudder:= 0;

  loadSettingservo('..\Bin\setting.ini');
  if modeUse = 0 then
  begin
    ComPort.Port := servoPort;
    ComPort.BaudRate := br57600;
    ComPort.DataBits := dbEight;
    ComPort.StopBits := sbOneStopBit;
    ComPort.Parity.Bits := prNone;
    ComPort.FlowControl.FlowControl := fcNone;

    ComPort.Open;
    TrackBar1.Enabled:=True;
    TrackBar2.Enabled:=True;
    Servo_SetPosition(idServoRPMME,(1023));
    Servo_SetPosition(idServoRPMME_2,(1023));
    Servo_SetPosition(idServoRPMSHAFT,(1023));
    Servo_SetPosition(idServoRPMSHAFT_2,(1023));
    Servo_SetPosition(idServoCPP,(512));
    Servo_SetPosition(idServoCPP_2,(512));
    Servo_SetPosition(idServoRudder,(512));
    Servo_SetPosition(idServoRudder_2,(512));
  end;

  counter := 0;
end;

procedure TFormServo.FormDestroy(Sender: TObject);
begin
  if modeUse = 0 then
  begin
    Servo_SetPosition(idServoRPMME,(1023));
    Servo_SetPosition(idServoRPMME_2,(1023));
    Servo_SetPosition(idServoRPMSHAFT,(1023));
    Servo_SetPosition(idServoRPMSHAFT_2,(1023));
    Servo_SetPosition(idServoCPP,(512));
    Servo_SetPosition(idServoCPP_2,(512));
    Servo_SetPosition(idServoRudder,(512));
    Servo_SetPosition(idServoRudder_2,(512));
  end;
  ComPort.Close;
end;



procedure TFormServo.FormShow(Sender: TObject);
begin
  Top := 200;
  Left := 200;
end;

procedure TFormServo.ComPortClose(Sender: TObject);
begin
  if Button_Open <> nil then
    Button_Open.Caption := 'Open';
end;

function HexToBin(HexChar:ShortString):ShortString;
begin
end;

procedure TFormServo.PanelOutA10Click(Sender: TObject);
var
 Panel:TPanel;
 newColor:TColor;
begin
  newColor := clRed;
 Panel:=(Sender as TPanel);
 if Panel.Color<>clGray then newColor:=clGray;
 if Panel.Color=clGray then
  begin
   newColor:=clRed;
   if Panel.Tag=1 then newColor:=clLime;
  end;
 Panel.Color:=newColor;
end;


procedure TFormServo.PCSSystemEvent(Sender: TObject; PropsID: E_PropsID;
  Value: Integer);
  var
    koefRate, degRate : Double;
    outputRudderLeft, outputRudderRight : Integer;
begin
  if modeUse = 0 then
  begin
    case PropsID of
      epRudderValuePS:
       begin
          tempRudderLeft := Value + 50;

          lbl12.Caption := IntToStr(Value);

          koefRate := 616/180;
          degRate := 180/degRud;

          outputRudderLeft := Round(tempRudderLeft * degRate * koefRate);
          Servo_SetPosition(idServoRudder,(950 - outputRudderLeft));
          edtRudder.Text := FloatToStr(tempRudderLeft);
       end;

       epRudderValueSB:
       begin
          tempRudderRight := Value + 50;

          lbl16.Caption := IntToStr(Value);

          koefRate := 616/180;
          degRate := 180/degRud_2;

          outputRudderRight := Round(tempRudderRight * degRate * koefRate);
          Servo_SetPosition(idServoRudder_2,(950 - outputRudderRight));
          edtRudder.Text := FloatToStr(tempRudderRight);
       end;
    end;
  end;
end;

procedure TFormServo.PCSSystemEvent(Sender: TObject; PropsID: E_PropsID;
  Value: Double);
begin
  if modeUse = 0 then
  begin
    case PropsID of
      epPCSMEActualSpeedPS:
      begin
        TempSpeedMELeft := Value;
        edtRPMME.Text := FloatToStr(TempSpeedMELeft);
      end;

      epPCSGBShaftSpeedPS:
      begin
        TempSpeedSHAFTLeft := Value;
        edtRPMSHAFT.Text := FloatToStr(TempSpeedSHAFTLeft);
      end;

      epPCSCPPActualPitchPS:
      begin
        TempSpeedCPPLeft := Value;
        edt7.Text := FloatToStr(TempSpeedCPPLeft);
      end;

      epPCSMEActualSpeedSB :
      begin
        TempSpeedMERight := Value;
        edtRPMME.Text := FloatToStr(TempSpeedMERight);
      end;

      epPCSGBShaftSpeedSB :
      begin
        TempSpeedSHAFTRight := Value;
        edtRPMSHAFT.Text := FloatToStr(TempSpeedSHAFTRight);
      end;

      epPCSCPPActualPitchSB :
      begin
        TempSpeedCPPRight := Value;
        edt6.Text := FloatToStr(TempSpeedCPPRight);
      end;
    end;
  end;
end;

procedure TFormServo.tmr1Timer(Sender: TObject);
begin
  counter := counter + 1;
  if counter > 10 then
  begin
    if servoLocation = 1 then // 1 = PS , 3 = SB
      checkConnect(C_ORD_SERVO_PS);

    if servoLocation = 3 then
      checkConnect(C_ORD_SERVO_SB);

    counter := 0;

  end;
end;

procedure TFormServo.tmr2Timer(Sender: TObject);
begin
  if TestSpeedPS and (TrackBar1.Position<820) then
    TrackBar1.Position:=TrackBar1.Position+5;

  if TestShaftPS and (TrackBar2.Position<720) then
    TrackBar2.Position:=TrackBar2.Position+5;

  if TestCPPPS and (TrackBar3.Position<920) then
    TrackBar3.Position:=TrackBar3.Position+5;

  if TestRudderPS and (TrackBar4.Position<920)then
    TrackBar4.Position:=TrackBar4.Position+5;

  if TestSpeedSB and (TrackBar5.Position<820) then
    TrackBar5.Position:=TrackBar5.Position+5;

  if TestShaftSB and (TrackBar6.Position<720)then
    TrackBar6.Position:=TrackBar6.Position+5;

  if TestCPPSB and (TrackBar7.Position<920)then
    TrackBar7.Position:=TrackBar7.Position+5;

  if TestRudderSB and (TrackBar8.Position<920) then
    TrackBar8.Position:=TrackBar8.Position+5;
end;

procedure TFormServo.tmrActualPitchServoTimer(Sender: TObject);
begin
  if ActualPitchServoPS <> TempSpeedCPPLeft then
  begin
    if ActualPitchServoPS < TempSpeedCPPLeft then
      ActualPitchServoPS := ActualPitchServoPS + 1
    else if ActualPitchServoPS > TempSpeedCPPLeft then
      ActualPitchServoPS := ActualPitchServoPS - 1;

    degRate := 180/degCPP;
    koefRate := 625/180;

    if ActualPitchServoPS >= 0 then
      Ahead := True
    else if ActualPitchServoPS < 0 then
      Ahead := False;

    if Ahead then
    begin
      if  ActualPitchServoPS > 100 then
      begin
        ActualPitchServoPS := 100;
      end;

      convTempspeed_2 := 100 + ActualPitchServoPS;
    end
    else
    begin
      if ActualPitchServoPS < -100 then
      begin
        ActualPitchServoPS := -100;
      end;
      convTempspeed_2 := 100 + ActualPitchServoPS;
    end;
    outputCPPLeft := Round(convTempspeed_2 * degRate * koefRate);
    Servo_SetPosition(idServoCPP,(927 - outputCPPLeft));

    lbl11.Caption := FloatToStr(ActualPitchServoPS);
  end;

  if ActualPitchServoSB <> TempSpeedCPPRight then
  begin
    if ActualPitchServoSB < TempSpeedCPPRight then
      ActualPitchServoSB := ActualPitchServoSB + 1
    else if ActualPitchServoSB > TempSpeedCPPRight then
      ActualPitchServoSB := ActualPitchServoSB - 1;

    degRate := 180/degCPP_2;
    koefRate := 625/180;

    if ActualPitchServoSB >= 0 then
      Ahead := True
    else if ActualPitchServoSB < 0 then
      Ahead := False;

    if Ahead then
    begin
      if  ActualPitchServoSB > 100 then
      begin
        ActualPitchServoSB := 100;
      end;

      convTempspeed := 100 + ActualPitchServoSB;
    end
    else
    begin
      if ActualPitchServoSB < -100 then
      begin
        ActualPitchServoSB := -100;
      end;
      convTempspeed := 100 + ActualPitchServoSB;
    end;
    outputCPPRight := Round(convTempspeed * degRate * koefRate);
        Servo_SetPosition(idServoCPP_2,(927 - outputCPPRight));

    lbl15.Caption := FloatToStr(ActualPitchServoSB);
  end;
end;

procedure TFormServo.tmrActualSpeedTimer(Sender: TObject);
begin
  if ActualSpeedServoPS <> TempSpeedMELeft then
  begin
    if ActualSpeedServoPS < TempSpeedMELeft then
      ActualSpeedServoPS := ActualSpeedServoPS + 1
    else if ActualSpeedServoPS > TempSpeedMELeft then
      ActualSpeedServoPS := ActualSpeedServoPS - 1;

    degRate := 180/degRPMME;
    koefRate := 628/180;
    outputRPMMELeft := Round(ActualSpeedServoPS * degRate* koefRate);
    Servo_SetPosition(idServoRPMME,(1023 - outputRPMMELeft));

    lbl9.Caption := FloatToStr(ActualSpeedServoPS);
  end;

  if ActualSpeedServoSB <> TempSpeedMERight then
  begin
    if ActualSpeedServoSB < TempSpeedMERight then
      ActualSpeedServoSB := ActualSpeedServoSB + 1
    else if ActualSpeedServoSB > TempSpeedMERight then
      ActualSpeedServoSB := ActualSpeedServoSB - 1;

    degRate := 180/degRPMME_2;
    koefRate := 628/180;
    outputRPMMERight := Round(ActualSpeedServoSB * degRate* koefRate);
    Servo_SetPosition(idServoRPMME_2,(1023 - outputRPMMERight));

    lbl13.Caption := FloatToStr(ActualSpeedServoSB);
  end;
end;

procedure TFormServo.tmrShaftSpeedServoTimer(Sender: TObject);
begin
  if ShaftSpeedServoPS <> TempSpeedSHAFTLeft then
  begin
    if ShaftSpeedServoPS < TempSpeedSHAFTLeft then
      ShaftSpeedServoPS := ShaftSpeedServoPS + 1
    else if ShaftSpeedServoPS > TempSpeedSHAFTLeft then
      ShaftSpeedServoPS := ShaftSpeedServoPS - 1;

    degRate := 180/degRPMSHAFT;
    koefRate := 589/180;

    outputRPMSHAFTLeft := Round(ShaftSpeedServoPS * degRate * koefRate);
    Servo_SetPosition(idServoRPMSHAFT,(1023 - outputRPMSHAFTLeft));

    lbl10.Caption := FloatToStr(ShaftSpeedServoPS);
  end;

  if ShaftSpeedServoSB <> TempSpeedSHAFTRight then
  begin
    if ShaftSpeedServoSB < TempSpeedSHAFTRight then
      ShaftSpeedServoSB := ShaftSpeedServoSB + 1
    else if ShaftSpeedServoSB > TempSpeedSHAFTRight then
      ShaftSpeedServoSB := ShaftSpeedServoSB - 1;

    degRate := 180/degRPMSHAFT_2;
    koefRate := 589/180;
    outputRPMSHAFTRight := Round(ShaftSpeedServoSB * degRate* koefRate);
    Servo_SetPosition(idServoRPMSHAFT_2,(1023 - outputRPMSHAFTRight));

    lbl14.Caption := FloatToStr(ShaftSpeedServoSB);
  end;
end;

procedure TFormServo.TrackBar1Change(Sender: TObject);
begin
 Servo_SetPosition(StrToInt(EditServoID1.Text),1023-TrackBar1.Position);
 edttrackbar1.Text := IntToStr(1023 - TrackBar1.Position);
end;

procedure TFormServo.TrackBar2Change(Sender: TObject);
begin
 Servo_SetPosition(StrToInt(EditServoID2.Text),1023-TrackBar2.Position);
end;

procedure TFormServo.TrackBar3Change(Sender: TObject);
begin
 Servo_SetPosition(StrToInt(EditServoID3.Text),1023-TrackBar3.Position);
end;

procedure TFormServo.TrackBar4Change(Sender: TObject);
begin
 Servo_SetPosition(StrToInt(EditServoID4.Text),1023-TrackBar4.Position);
end;

procedure TFormServo.TrackBar5Change(Sender: TObject);
begin
 Servo_SetPosition(StrToInt(EditServoID5.Text),1023-TrackBar5.Position);
end;

procedure TFormServo.TrackBar6Change(Sender: TObject);
begin
 Servo_SetPosition(StrToInt(EditServoID6.Text),1023-TrackBar6.Position);
end;

procedure TFormServo.TrackBar7Change(Sender: TObject);
begin
 Servo_SetPosition(StrToInt(EditServoID7.Text),1023-TrackBar7.Position);
end;

procedure TFormServo.TrackBar8Change(Sender: TObject);
begin
 Servo_SetPosition(StrToInt(EditServoID8.Text),1023-TrackBar8.Position);
end;

procedure TFormServo.Bt_LoadClick(Sender: TObject);
begin
  //ComPort.LoadSettings(stRegistry, 'HKEY_LOCAL_MACHINE\Software\Dejan');
//  ComPort.LoadSettings(stIniFile, 'e:\Test.ini');
end;

procedure TFormServo.Bt_StoreClick(Sender: TObject);
begin
  ComPort.StoreSettings(stIniFile, '..\PCS\Test.ini');
  //ComPort.StoreSettings(stRegistry, 'HKEY_LOCAL_MACHINE\Software\Dejan');
end;

end.
