unit uPanelThrottle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, CPort, StdCtrls, uDataType, IniFiles,
  VrControls, VrButtons;

const
  PANEL_COUNT = 16;
  LAMP_COUNT = 15;    //total Lamp
type
  TfrmPanelThrottle = class(TForm)
    ComPort: TComPort;
    tmrComport: TTimer;
    GroupBox6: TGroupBox;
    Label26: TLabel;
    Label27: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    GroupBox3: TGroupBox;
    btn_Settings: TVrDemoButton;
    btnload: TVrDemoButton;
    btnSetAll: TVrDemoButton;
    mmo1: TMemo;
    edtRxBin: TEdit;
    edt1: TEdit;
    CheckBox1: TCheckBox;
    grpComApp: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    grp3: TGroupBox;
    lbl8: TLabel;
    lbl9: TLabel;
    Hdwr1: TShape;
    Hdwr2: TShape;
    Hdwr3: TShape;
    Hdwr4: TShape;
    Hdwr5: TShape;
    Hdwr6: TShape;
    Hdwr7: TShape;
    Hdwr8: TShape;
    Hdwr9: TShape;
    Hdwr10: TShape;
    Hdwr11: TShape;
    grp4: TGroupBox;
    lbl10: TLabel;
    lbl11: TLabel;
    Instr1: TShape;
    Instr2: TShape;
    Instr3: TShape;
    Instr4: TShape;
    Instr5: TShape;
    Instr6: TShape;
    Instr7: TShape;
    Instr8: TShape;
    Instr9: TShape;
    Instr10: TShape;
    Instr11: TShape;
    grpTester: TGroupBox;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    grpPumpPs: TGroupBox;
    lbl15: TLabel;
    lbl16: TLabel;
    grpPumpSb: TGroupBox;
    lbl17: TLabel;
    lbl18: TLabel;
    grpTelegraph: TGroupBox;
    lbl19: TLabel;
    lbl20: TLabel;
    InputF3: TShape;
    InputF4: TShape;
    InputF5: TShape;
    InputF6: TShape;
    InputF7: TShape;
    InputF8: TShape;
    InputF9: TShape;
    InputF10: TShape;
    InputH3: TShape;
    InputH4: TShape;
    InputH5: TShape;
    grpAlarm: TGroupBox;
    lbl21: TLabel;
    lbl22: TLabel;
    grpPumpSbLamp: TGroupBox;
    lbl23: TLabel;
    lbl24: TLabel;
    grpPumpPsLamp: TGroupBox;
    lbl25: TLabel;
    lbl26: TLabel;
    grpTelegraphLamp: TGroupBox;
    lbl27: TLabel;
    lbl28: TLabel;
    grp5: TGroupBox;
    lbl34: TLabel;
    lbl35: TLabel;
    InputH10: TShape;
    InputH9: TShape;
    InputD3: TShape;
    InputD4: TShape;
    InputD6: TShape;
    InputD5: TShape;
    InputD7: TShape;
    InputC3: TShape;
    InputC4: TShape;
    InputC5: TShape;
    InputC7: TShape;
    InputC6: TShape;
    PanelOutA3: TPanel;
    PanelOutA4: TPanel;
    PanelOutA5: TPanel;
    PanelOutA6: TPanel;
    PanelOutA7: TPanel;
    PanelOutA8: TPanel;
    PanelOutC3: TPanel;
    PanelOutC4: TPanel;
    PanelOutC5: TPanel;
    PanelOutC6: TPanel;
    PanelOutC7: TPanel;
    PanelOutC8: TPanel;
    PanelOutA9: TPanel;
    PanelOutA10: TPanel;
    PanelOutC9: TPanel;
    PanelOutC10: TPanel;
    PanelOutK3: TPanel;
    PanelOutK4: TPanel;
    PanelOutK5: TPanel;
    PanelOutK6: TPanel;
    PanelOutK7: TPanel;
    PanelOutK8: TPanel;
    PanelOutK9: TPanel;
    PanelOutK10: TPanel;
    PanelOutB4: TPanel;
    PanelOutB3: TPanel;
    PanelOutB5: TPanel;
    PanelOutB7: TPanel;
    PanelOutD7: TPanel;
    PanelOutD6: TPanel;
    PanelOutD5: TPanel;
    PanelOutD4: TPanel;
    PanelOutD3: TPanel;
    PanelOutD8: TPanel;
    PanelOutD9: TPanel;
    PanelOutD10: TPanel;
    PanelOutF5: TPanel;
    PanelOutF4: TPanel;
    PanelOutF3: TPanel;
    PanelOutF6: TPanel;
    PanelOutF8: TPanel;
    PanelOutF9: TPanel;
    PanelOutF7: TPanel;
    PanelOutB8: TPanel;
    PanelOutF10: TPanel;
    tmrBzr: TTimer;

    procedure ComPortRxChar(Sender: TObject; Count: Integer);
    procedure tmrComportTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    {Prince}
    procedure CekInput(isVal : Boolean; i : Integer);
    procedure SettingClick(Sender: TObject);
    procedure ConnectClick(Sender: TObject);
    procedure SetAllClick(Sender: TObject);
    procedure setIndikator(i: Integer);
    procedure PanelOutClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure tmrBzrTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    FIsConnFlag,
    LampButtonBuzzer,LampButtonCek, Buzzer, CekAll : boolean;
    KodeLampButtonBuzzer, KodeLampButtonCek, KodeBuzzer, Gedung : string;
    StatusPermainan   : Byte; {1:Load 2:Start}

    function CekBuzzer : boolean;//cek lampu
    procedure loadSettingAlarm(filepath : string);

    {Prince: Penggabungan tester dan ipms}
    procedure TmrKetikaLoad();
    procedure TmrKetikaStart();
    procedure ComKetikaLoad(Count: Integer);
    procedure ComKetikaStart(Count: Integer);
    procedure Enabledbtn(val : Boolean);
    procedure EnabledShp(val : Boolean);

  public
    { Public declarations }
    FPanel : array of boolean;
    FLamp : array of boolean;
    AlarmStop : boolean;
    portThrottle : string;

    {Prince}
    Counter,
    d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11 : Integer;
    FTelegrm : array [1..11] of Boolean;
    FTempTelegrm : array [1..11] of Boolean;
    iterasi : array [1..11] of Integer;
    isI : array [1..11] of Boolean;
    isInput, isFirst : Boolean;
    tempfirst, tempIn, tempOut, flag : Integer;
    ProsId   : E_PropsID;
    Status   : Byte; {1:Kirim 2:Terima 3:Standby }

  end;

var
  frmPanelThrottle: TfrmPanelThrottle;

implementation

uses uPanelThrottleSystem;

{$R *.dfm}

function HexToBin(HexChar:ShortString):ShortString;
begin
  result:='1111';
  if HexChar='0' then result:='0000';
  if HexChar='1' then result:='0001';
  if HexChar='2' then result:='0010';
  if HexChar='3' then result:='0011';
  if HexChar='4' then result:='0100';
  if HexChar='5' then result:='0101';
  if HexChar='6' then result:='0110';
  if HexChar='7' then result:='0111';
  if HexChar='8' then result:='1000';
  if HexChar='9' then result:='1001';
  if HexChar='A' then result:='1010';
  if HexChar='B' then result:='1011';
  if HexChar='C' then result:='1100';
  if HexChar='D' then result:='1101';
  if HexChar='E' then result:='1110';
  if HexChar='F' then result:='1111';
end;

function TfrmPanelThrottle.CekBuzzer: boolean;
var
  i : integer;
begin
  if CekAll then
  exit;

  result := false;

  if AlarmStop then exit;

  for I := 0 to Length(FLamp) - 1 do
  begin
    if FLamp[i] = true then
    begin
      result := true;
      break;
    end;
  end;

end;
procedure TfrmPanelThrottle.CekInput(isVal: Boolean; i: Integer);
var
  j : Integer;
begin
  if isFirst then
  begin
    if isVal then
    begin
      tempfirst := i;
      isFirst := False;
    end;
    exit;
  end
  else
  begin
    if isVal and (i <> tempfirst) then
      tempfirst := 100 {agar tidak masuk kesini lagi}
    else
      Exit;
  end;

  if isVal then
  begin
    isI[i] := True;
    if iterasi[i] = 5 then
    begin
      iterasi[i] := 0;
      isI[i] := False;

      if isInput then {ketika ada kiriman dr instruktur masuk ksini dulu}
      begin
        if i = tempIn then
        begin
          {urutan lampu yg diminta menyala instruktur disimpan disini dulu}
          FTempTelegrm[i] := True;
          isInput := False;
        end;
      end
      else
      begin

        for j := 1 to 11 do
        begin
          if FTelegrm[j] then
            tempOut := j;

          FTelegrm[j] := False;
          FTempTelegrm[j] := False;
        end;

        FTempTelegrm[i] := True;

        if i = tempOut then
        begin
          FTelegrm[tempOut] := True;
          flag := i;

          if Status = 2 then
          begin
            {telegrap membalas pesan}
            ShipAlarmSystem.sendTelegram(epBoardTelegramKanan, i, True, 2);
            Status := 1;
          end;

        end
        else
        begin
          if flag = i  then
            exit;

          {telegrap mengirim pesan}
          ShipAlarmSystem.sendTelegram(epBoardTelegramKanan, i, True, 1);
          flag := i;
        end;
      end;
    end;
  end
  else
  begin
    iterasi[i] := 0;
    isI[i] := False;
    FTempTelegrm[i] := False;
  end;
end;

procedure TfrmPanelThrottle.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    StatusPermainan := 1;
    grpTester.Left := 217;
    grpComApp.Left := 864;
    btnSetAll.Enabled := True;
    Self.Width := 866;
  end
  else
  begin
    StatusPermainan := 2;
    grpTester.Left := 864;
    grpComApp.Left := 217;
    btnSetAll.Enabled := False;
    Self.Width := 445;
  end;
end;

var
 old_sID,sID:ShortString;

procedure TfrmPanelThrottle.ComKetikaLoad(Count: Integer);
var
  Str: String;
  S:ShortString;
begin
  ComPort.ReadStr(Str, Count);
  mmo1.Text := mmo1.Text + Str;
  str:=mmo1.Lines[0];
  if pos('$168',str)=1 then edt1.Text:=str;
  if mmo1.Lines.Count>=2 then mmo1.Lines.Delete(0);
  s:=Str;

  sID:=Copy(s,6,2);
  if ((pos('$168',s)=1) and (pos('*',s)=22) and (sID<>old_sID))  then
  begin
     old_sID := sID;
     Delete(s,1,7);
     edt1.Text :=s ;
     edtRxBin.Text := HexToBin('5')+ HexToBin('5')+
                      HexToBin(Copy(s,1,1))+ HexToBin(Copy(s,2,1))+ HexToBin(Copy(s,3,1))+
                      HexToBin(Copy(s,4,1))+ HexToBin(Copy(s,5,1))+ HexToBin(Copy(s,6,1))+
                      HexToBin(Copy(s,7,1))+ HexToBin(Copy(s,8,1))+ HexToBin(Copy(s,9,1))+
                      HexToBin(Copy(s,10,1))+HexToBin(Copy(s,11,1))+HexToBin(Copy(s,12,1))+
                      HexToBin(Copy(s,13,1))+HexToBin(Copy(s,14,1))+HexToBin(Copy(s,15,1))+
                      HexToBin(Copy(s,16,1));
     s := EdtRxBin.Text;

     {panel throtel sb}
     if s[24]='0' then InputC3.Brush.Color:=cllime else InputC3.Brush.Color:=clGray;
     if s[23]='0' then InputC4.Brush.Color:=cllime else InputC4.Brush.Color:=clGray;
     if s[22]='0' then InputC5.Brush.Color:=cllime else InputC5.Brush.Color:=clGray;
     if s[21]='0' then InputC6.Brush.Color:=cllime else InputC6.Brush.Color:=clGray;
     if s[20]='0' then InputC7.Brush.Color:=cllime else InputC7.Brush.Color:=clGray;

     {panel throtel ps}
     if s[32]='0' then InputD3.Brush.Color:=cllime else InputD3.Brush.Color:=clGray;
     if s[31]='0' then InputD4.Brush.Color:=cllime else InputD4.Brush.Color:=clGray;
     if s[30]='0' then InputD5.Brush.Color:=cllime else InputD5.Brush.Color:=clGray;
     if s[29]='0' then InputD6.Brush.Color:=cllime else InputD6.Brush.Color:=clGray;
     if s[28]='0' then InputD7.Brush.Color:=cllime else InputD7.Brush.Color:=clGray;

     {telegraph}
     if s[40]='0' then InputF3.Brush.Color:=cllime else InputF3.Brush.Color:=clGray;
     if s[39]='0' then InputF4.Brush.Color:=cllime else InputF4.Brush.Color:=clGray;
     if s[38]='0' then InputF5.Brush.Color:=cllime else InputF5.Brush.Color:=clGray;
     if s[37]='0' then InputF6.Brush.Color:=cllime else InputF6.Brush.Color:=clGray;
     if s[36]='0' then InputF7.Brush.Color:=cllime else InputF7.Brush.Color:=clGray;
     if s[35]='0' then InputF8.Brush.Color:=cllime else InputF8.Brush.Color:=clGray;
     if s[34]='0' then InputF9.Brush.Color:=cllime else InputF9.Brush.Color:=clGray;
     if s[33]='0' then InputF10.Brush.Color:=cllime else InputF10.Brush.Color:=clGray;

     if s[48]='0' then InputH3.Brush.Color:=cllime else InputH3.Brush.Color:=clGray;
     if s[47]='0' then InputH4.Brush.Color:=cllime else InputH4.Brush.Color:=clGray;
     if s[46]='0' then InputH5.Brush.Color:=cllime else InputH5.Brush.Color:=clGray;

     {alarm test}
     if (Gedung = 'Kodikal') or ((Gedung = 'Armabar')) then
     begin
       if s[44]='0' then InputH9.Brush.Color:=cllime else InputH9.Brush.Color:=clGray;   {Kantor: 42; kodikal/ Armabar: 44;}
       if s[45]='0' then InputH10.Brush.Color:=cllime else InputH10.Brush.Color:=clGray; {Kantor: 41; kodikal/ Armabar: 45;}
     end
     else if Gedung = 'Kantor' then
     begin
       if s[42]='0' then InputH9.Brush.Color:=cllime else InputH9.Brush.Color:=clGray;   {Kantor: 42; kodikal/ Armabar: 44}
       if s[41]='0' then InputH10.Brush.Color:=cllime else InputH10.Brush.Color:=clGray; {Kantor: 41; kodikal/ Armabar: 45}
     end;
  end;
end;

procedure TfrmPanelThrottle.ComKetikaStart(Count: Integer);
var
  Str: String;
  S:ShortString;
begin
  ComPort.ReadStr(Str, Count);
  mmo1.Text := mmo1.Text + Str;
  str:=mmo1.Lines[0];
  if pos('$168',str)=1 then edt1.Text:=str;
  if mmo1.Lines.Count>=2 then mmo1.Lines.Delete(0);
  s:=Str;

  sID:=Copy(s,6,2);
  if ((pos('$168',s)=1) and (pos('*',s)=22) and (sID<>old_sID))  then
  begin
     old_sID := sID;
     Delete(s,1,7);
     edt1.Text :=s ;
     edtRxBin.Text := HexToBin('5')+ HexToBin('5')+
                      HexToBin(Copy(s,1,1))+ HexToBin(Copy(s,2,1))+ HexToBin(Copy(s,3,1))+
                      HexToBin(Copy(s,4,1))+ HexToBin(Copy(s,5,1))+ HexToBin(Copy(s,6,1))+
                      HexToBin(Copy(s,7,1))+ HexToBin(Copy(s,8,1))+ HexToBin(Copy(s,9,1))+
                      HexToBin(Copy(s,10,1))+HexToBin(Copy(s,11,1))+HexToBin(Copy(s,12,1))+
                      HexToBin(Copy(s,13,1))+HexToBin(Copy(s,14,1))+HexToBin(Copy(s,15,1))+
                      HexToBin(Copy(s,16,1));
     s := EdtRxBin.Text;

    {panel throtel sb : C3-C4}
    if s[24]='0' then ShipAlarmSystem.setStatusThrottle(24, true);
    if s[23]='0' then ShipAlarmSystem.setStatusThrottle(25, true);
    if s[22]='0' then ShipAlarmSystem.setStatusThrottle(26, true);
    if s[21]='0' then ShipAlarmSystem.setStatusThrottle(22, true);
    if s[20]='0' then ShipAlarmSystem.setStatusThrottle(23, true);

    {panel throtel ps: D3-D4}
    if s[32]='0' then ShipAlarmSystem.setStatusThrottle(17, true);
    if s[31]='0' then ShipAlarmSystem.setStatusThrottle(18, true);
    if s[30]='0' then ShipAlarmSystem.setStatusThrottle(19, true);
    if s[29]='0' then ShipAlarmSystem.setStatusThrottle(20, true);
    if s[28]='0' then ShipAlarmSystem.setStatusThrottle(21, true);

    {telegraph : F3-F10}
    if s[40]='0' then begin
      CekInput(True, 1);
      Hdwr1.Brush.Color := clRed;
    end
    else begin
      CekInput(False, 1);
      Hdwr1.Brush.Color := clGray
    end;

    if s[39]='0' then begin
      CekInput(True, 2);
      Hdwr2.Brush.Color := clRed;
    end
    else begin
      CekInput(False, 2);
      Hdwr2.Brush.Color := clGray
    end;

    if s[38]='0' then begin
      CekInput(True, 3);
      Hdwr3.Brush.Color := clRed;
    end
    else begin
      CekInput(False, 3);
      Hdwr3.Brush.Color := clGray
    end;

    if s[37]='0' then begin
      CekInput(True, 4);
      Hdwr4.Brush.Color := clRed;
    end
    else begin
      CekInput(False, 4);
      Hdwr4.Brush.Color := clGray
    end;

    if s[36]='0' then begin
      CekInput(True, 5);
      Hdwr5.Brush.Color := clWhite;
    end
    else begin
      CekInput(False, 5);
      Hdwr5.Brush.Color := clGray
    end;

    if s[35]='0' then begin
      CekInput(True, 6);
      Hdwr6.Brush.Color := clWhite;
    end
    else begin
      CekInput(False, 6);
      Hdwr6.Brush.Color := clGray
    end;

    if s[34]='0' then begin
      CekInput(True, 7);
      Hdwr7.Brush.Color := clWhite;
    end
    else begin
      CekInput(False, 7);
      Hdwr7.Brush.Color := clGray
    end;

    if s[33]='0' then begin
      CekInput(True, 8);
      Hdwr8.Brush.Color := clGreen;
    end
    else begin
      CekInput(False, 8);
      Hdwr8.Brush.Color := clGray
    end;

    {telegraph : H3-H5}
    if s[48]='0' then begin
      CekInput(True, 9);
      Hdwr9.Brush.Color := clGreen;
    end
    else begin
      CekInput(False, 9);
      Hdwr9.Brush.Color := clGray
    end;

    if s[47]='0' then begin
      CekInput(True, 10);
      Hdwr10.Brush.Color := clGreen;
    end
    else begin
      CekInput(False, 10);
      Hdwr10.Brush.Color := clGray
    end;

    if s[46]='0' then begin
      CekInput(True, 11);
      Hdwr11.Brush.Color := clGreen;
    end
    else begin
      CekInput(False, 11);
      Hdwr11.Brush.Color := clGray
    end;

    {alarm tes : H4-H5}
    if s[44]='0' then begin
      AlarmStop := true;
      LampButtonBuzzer := true;
    end
    else begin
      LampButtonBuzzer := false;
    end;

    if s[45]='0' then begin
      LampButtonCek := true;
      CekAll := true;
      buzzer := true;
    end
    else begin
      LampButtonCek := false;
      CekAll := false;
      buzzer := false;
    end;
  end;
end;

procedure TfrmPanelThrottle.ComPortRxChar(Sender: TObject; Count: Integer);
begin
  if StatusPermainan = 1 then
    ComKetikaLoad(Count)
  else
    ComKetikaStart(Count);
end;

procedure TfrmPanelThrottle.ConnectClick(Sender: TObject);
begin
  if TButton(Sender).Caption = 'Connect' then
  begin
    FIsConnFlag := False;
    ComPort.Connected := True;
    tmrComport.Enabled := True;
    TButton(Sender).Caption := 'Disconnect'
  end
  else
  begin
    Enabledbtn(False);
    FIsConnFlag := True;
    TButton(Sender).Caption := 'Connect'
  end
end;

procedure TfrmPanelThrottle.Enabledbtn(val: Boolean);
var
  i: Integer;
begin
  if val then
  begin
    for i := 0 to ComponentCount - 1 do
    begin
      if Components[i] is TPanel then
      begin
        if (TPanel(Components[i]).Color = clGray) then
        begin
          case TPanel(Components[i]).Tag of
            0 : TPanel(Components[i]).Color := clRed;
            1 : TPanel(Components[i]).Color := clLime;
            2 : TPanel(Components[i]).Color := clWindow;
            3 : TPanel(Components[i]).Color := clBlue;
          end;
        end;
      end;
    end;
  end
  else
  begin
    for i := 0 to ComponentCount - 1 do
    begin
      if Components[i] is TPanel then
      begin
        if (TPanel(Components[i]).Color <> clGray) then
          TPanel(Components[i]).Color := clGray
      end;
    end;
  end;
end;

procedure TfrmPanelThrottle.EnabledShp(val: Boolean);
var
  i : Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TShape then
    begin
      TShape(Components[i]).Brush.Color := clGray
    end;
  end;
end;

procedure TfrmPanelThrottle.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  {Laporan ke instruktur status app}
  ShipAlarmSystem.sendServoLampStatus(C_ORD_LAMP_SB, False);
  Sleep(1000);
end;

procedure TfrmPanelThrottle.FormCreate(Sender: TObject);
  var
 i : integer;
begin
  SetLength(FPanel, PANEL_COUNT);
  SetLength(FLamp, LAMP_COUNT);

  for I := 1 to PANEL_COUNT do
  begin
    FPanel[i] := false;
  end;

  for i := 1 to 11 do
  begin
    FTelegrm[i] := false;
    FTempTelegrm[i] := false;
    isI[i] := False;
    iterasi[i] := 0;
  end;

  isFirst := True;
  tempOut := 0;
  tempIn  := 0;

  buzzer := False;
  AlarmStop := true;
  LampButtonCek := false;
  CekAll := false;
  LampButtonBuzzer := false;
  FIsConnFlag := False;
  StatusPermainan := 1;

  loadSettingAlarm('../Bin/setting.ini');
  ComPort.Port := portThrottle;
  ComPort.BaudRate := br9600;
  ComPort.DataBits := dbEight;
  ComPort.StopBits := sbOneStopBit;
  ComPort.Parity.Bits := prNone;
  ComPort.FlowControl.FlowControl := fcNone;

  if ComPort.Connected then
  begin
    tmrComport.Enabled:=False;
    ComPort.Close;
  end
  else
  begin
    ComPort.Open;
    tmrComport.Enabled:=True;
    Enabledbtn(True);
    tmrBzr.Enabled := True;
  end;
end;

procedure TfrmPanelThrottle.loadSettingAlarm(filepath: string);
  var
    inifile : TIniFile;
    tempstring : TStringList;
begin
  inifile := TIniFile.Create(filepath);
  tempstring := TStringList.Create;

  inifile.ReadSection('Mode', tempstring);

  portThrottle := inifile.ReadString('Mode', tempstring[2],'Default');

  inifile.ReadSection('HARDWARE', tempstring);
  KodeLampButtonBuzzer := inifile.ReadString('HARDWARE', tempstring[0],'Default');
  KodeLampButtonCek := inifile.ReadString('HARDWARE', tempstring[1],'Default');
  KodeBuzzer := inifile.ReadString('HARDWARE', tempstring[2],'Default');
  Gedung := inifile.ReadString('HARDWARE', tempstring[3],'Default');

  inifile.Free;
  tempstring.Free;
end;

procedure TfrmPanelThrottle.PanelOutClick(Sender: TObject);
var
 Panel:TPanel;
 newColor:TColor;
begin
  Panel := (Sender as TPanel);

  if Panel.Color <> clGray then
    newColor := clGray;

  if Panel.Color = clGray then
  begin
    newColor := clRed;

    if Panel.Tag = 1 then
      newColor := clLime
    else if Panel.Tag = 2 then
      newColor := clWindow
    else if Panel.Tag = 3 then
      newColor := clBlue;
  end;

  Panel.Color := newColor;
end;

procedure TfrmPanelThrottle.SetAllClick(Sender: TObject);
begin
  if btnSetAll.Caption = 'Set All' then
  begin
    Enabledbtn(True);
    btnSetAll.Caption := 'Unset All'
  end
  else
  begin
    Enabledbtn(False);
    btnSetAll.Caption := 'Set All'
  end;
end;

procedure TfrmPanelThrottle.setIndikator(i: Integer);
begin
  if i = 1 then
    Instr1.Brush.Color := clRed
  else
    Instr1.Brush.Color := clGray;

  if i = 2 then
    Instr2.Brush.Color := clRed
  else
    Instr2.Brush.Color := clGray;

  if i = 3 then
    Instr3.Brush.Color := clRed
  else
    Instr3.Brush.Color := clGray;

  if i = 4 then
    Instr4.Brush.Color := clRed
  else
    Instr4.Brush.Color := clGray;

  if i = 5 then
    Instr5.Brush.Color := clWhite
  else
    Instr5.Brush.Color := clGray;

  if i = 6 then
    Instr6.Brush.Color := clWhite
  else
    Instr6.Brush.Color := clGray;

  if i = 7 then
    Instr7.Brush.Color := clWhite
  else
    Instr7.Brush.Color := clGray;

  if i = 8 then
    Instr8.Brush.Color := clGreen
  else
    Instr8.Brush.Color := clGray;

  if i = 9 then
    Instr9.Brush.Color := clGreen
  else
    Instr9.Brush.Color := clGray;

  if i = 10 then
    Instr10.Brush.Color := clGreen
  else
    Instr10.Brush.Color := clGray;

  if i = 11 then
    Instr11.Brush.Color := clGreen
  else
    Instr11.Brush.Color := clGray;
end;

procedure TfrmPanelThrottle.SettingClick(Sender: TObject);
begin
  ComPort.ShowSetupDialog;
end;

procedure TfrmPanelThrottle.tmrBzrTimer(Sender: TObject);
begin
  if tmrBzr.Enabled then
  begin
    PanelOutF10.Color := clGray;
    tmrBzr.Enabled := False;
  end;
end;

procedure TfrmPanelThrottle.tmrComportTimer(Sender: TObject);
begin
  {Mode app tester : 1; app alrm rudder ; 2;}
  if StatusPermainan = 1 then
    TmrKetikaLoad
  else
    TmrKetikaStart;

  {set jika disconnect}
  if FIsConnFlag then
  begin
    ComPort.Connected := False;
    tmrComport.Enabled := False;
    EnabledShp(False);

    {Laporan ke instruktur status app}
    ShipAlarmSystem.sendServoLampStatus(C_ORD_LAMP_SB, False);
  end
  else
  begin
    counter := counter + 1;

    if counter > 20 then
    begin
      {Laporan ke instruktur status app}
      ShipAlarmSystem.sendServoLampStatus(C_ORD_LAMP_SB, True);
      counter := 0;
    end;
  end;
end;


procedure TfrmPanelThrottle.TmrKetikaLoad;
var
 LEDA,LEDB,LEDC,LEDD:Byte;
 LEDF,LEDH,LEDJ,LEDK:Byte;
begin
  {lampu throtel ps}
  LEDA:=0;
  if PanelOutA10.Color=clGray then inc(LEDA,$80);
  if PanelOutA9.Color=clGray then inc(LEDA,$40);
  if PanelOutA8.Color=clGray then inc(LEDA,$20);
  if PanelOutA7.Color=clGray then inc(LEDA,$10);
  if PanelOutA6.Color=clGray then inc(LEDA,$08);
  if PanelOutA5.Color=clGray then inc(LEDA,$04);
  if PanelOutA4.Color=clGray then inc(LEDA,$02);
  if PanelOutA3.Color=clGray then inc(LEDA,$01);

  LEDB:=0;
  {jk L6/B6 sbg buzzernya, ini yg dipake}
  if KodeBuzzer = 'L6' then
  begin
    if PanelOutF10.Color=clGray then inc(LEDB,$20);
  end;
  {jk L6/B6 sbg Audible, ini yg dipake}
  if KodeLampButtonBuzzer = 'L6' then
  begin
    if PanelOutB8.Color=clGray then inc(LEDB,$20);
  end;


  {jk L5/B5 sbg System tes, ini yg dipake}
  if KodeLampButtonCek = 'L5' then
  begin
    if PanelOutB7.Color=clGray then inc(LEDB,$10);
  end;
  {jk L5/B5 sbg Audible, ini yg dipake}
  if KodeLampButtonBuzzer = 'L5' then
  begin
    if PanelOutB8.Color=clGray then inc(LEDB,$10);
  end;


  {jk L4/B4 sbg System tes, ini yg dipake}
  if KodeLampButtonCek = 'L4' then
  begin
    if PanelOutB7.Color=clGray then inc(LEDB,$08);
  end;
  {jk L4/B4 sbg Audible, ini yg dipake}
  if KodeLampButtonBuzzer = 'L4' then
  begin
    if PanelOutB8.Color=clGray then inc(LEDB,$08);
  end;

  {lampu telegraph}
  if PanelOutB5.Color=clGray then inc(LEDB,$04);
  if PanelOutB4.Color=clGray then inc(LEDB,$02);
  if PanelOutB3.Color=clGray then inc(LEDB,$01);

  {lampu throtel sb}
  LEDC:=0;
  if PanelOutC10.Color=clGray then inc(LEDC,$80);
  if PanelOutC9.Color=clGray then inc(LEDC,$40);
  if PanelOutC8.Color=clGray then inc(LEDC,$20);
  if PanelOutC7.Color=clGray then inc(LEDC,$10);
  if PanelOutC6.Color=clGray then inc(LEDC,$08);
  if PanelOutC5.Color=clGray then inc(LEDC,$04);
  if PanelOutC4.Color=clGray then inc(LEDC,$02);
  if PanelOutC3.Color=clGray then inc(LEDC,$01);

  {lampu alarm failure}
  LEDD:=0;
  if PanelOutD10.Color=clGray then inc(LEDD,$80);
  if PanelOutD9.Color=clGray then inc(LEDD,$40);
  if PanelOutD8.Color=clGray then inc(LEDD,$20);
  if PanelOutD7.Color=clGray then inc(LEDD,$10);
  if PanelOutD6.Color=clGray then inc(LEDD,$08);
  if PanelOutD5.Color=clGray then inc(LEDD,$04);
  if PanelOutD4.Color=clGray then inc(LEDD,$02);
  if PanelOutD3.Color=clGray then inc(LEDD,$01);

  LEDF:=0;
  {jk F8 Sbg buzzernya, ini yg dipake}
  if KodeBuzzer = 'F8' then
  begin
    if PanelOutF10.Color=clGray then inc(LEDF,$80);
  end;

  {jk F8 Sbg System tes, ini yg dipake}
  if KodeLampButtonCek = 'F8' then
  begin
    if PanelOutB7.Color=clGray then inc(LEDF,$80);
  end;

  {lampu alarm failure}
  if PanelOutF9.Color=clGray then inc(LEDF,$40);
  if PanelOutF8.Color=clGray then inc(LEDF,$20);
  if PanelOutF7.Color=clGray then inc(LEDF,$10);
  if PanelOutF6.Color=clGray then inc(LEDF,$08);
  if PanelOutF5.Color=clGray then inc(LEDF,$04);
  if PanelOutF4.Color=clGray then inc(LEDF,$02);
  if PanelOutF3.Color=clGray then inc(LEDF,$01);

  LEDH:=0;
  LEDJ:=0;

  {lampu telegraph}
  LEDK:=0;
  if PanelOutK10.Color=clGray then inc(LEDK,$80);
  if PanelOutK9.Color=clGray then inc(LEDK,$40);
  if PanelOutK8.Color=clGray then inc(LEDK,$20);
  if PanelOutK7.Color=clGray then inc(LEDK,$10);
  if PanelOutK6.Color=clGray then inc(LEDK,$08);
  if PanelOutK5.Color=clGray then inc(LEDK,$04);
  if PanelOutK4.Color=clGray then inc(LEDK,$02);
  if PanelOutK3.Color=clGray then inc(LEDK,$01);

  ComPort.WriteStr(#$FF+
  Char(LEDA)+Char(LEDB)+Char(LEDC)+Char(LEDD)+
  Char(LEDF)+Char(LEDH)+Char(LEDJ)+Char(LEDK)+
  '12345678'); // Dummy Data
end;

procedure TfrmPanelThrottle.TmrKetikaStart;
var
 LEDA,LEDB,LEDC,LEDD:Byte;
 LEDF,LEDH,LEDJ,LEDK:Byte;
 i : integer;
begin
  Buzzer := CekBuzzer;

  {utk delay telegram}
  for I := 1 to 11 do
  begin
    if isI[i] then
      iterasi[i] := iterasi[i] + 1;

    if iterasi[i] > 5 then
      iterasi[i] := 0;
  end;

  LEDA:=0;
  if not FPanel[5] then  inc(LEDA,$80);
  if not FPanel[1] then  inc(LEDA,$40);
  if not FPanel[8] then inc(LEDA,$20);
  if not FPanel[7] then inc(LEDA,$10);
  if not FPanel[6] then inc(LEDA,$08);
  if not FPanel[4] then inc(LEDA,$04);
  if not FPanel[3] then inc(LEDA,$02);
  if not FPanel[2] then inc(LEDA,$01);

  {ini pengganti L}
  LEDB:=0;
  inc(LEDB,$80);
  inc(LEDB,$40);

  if KodeBuzzer = 'L6' then
  begin
    if not Buzzer then  inc(LEDB,$20);
  end
  else
    inc(LEDB,$20);

  if KodeLampButtonBuzzer = 'L5' then
  begin
    if not LampButtonBuzzer then inc(LEDB,$10);
  end
  else
    inc(LEDB,$10);

  if KodeLampButtonCek = 'L4' then
  begin
    if not LampButtonCek then inc(LEDB,$08);
  end
  else if KodeLampButtonBuzzer = 'L4' then
  begin
    if not LampButtonBuzzer then inc(LEDB,$08);
  end
  else
    inc(LEDB,$08);


  if (not FTelegrm[11]) or (not FTempTelegrm[11]) then //inc(LEDB,$04);
  begin
    if (FTelegrm[11]and isInput) or (FTempTelegrm[11]and (not isInput)) then
    begin
      d11 := d11 + 1;
      if d11 = 2 then inc(LEDB,$04)
      else if d11 = 3 then d11 := 0
      else inc(LEDB,$04);
    end
    else
      inc(LEDB,$04);
  end;

  if (not FTelegrm[10]) or (not FTempTelegrm[10]) then //inc(LEDB,$02);
  begin
    if (FTelegrm[10]and isInput) or (FTempTelegrm[10]and (not isInput)) then
    begin
      d10 := d10 + 1;
      if d10 = 2 then inc(LEDB,$02)
      else if d10 = 3 then d10 := 0
      else inc(LEDB,$02);
    end
    else
      inc(LEDB,$02);
  end;

  if (not FTelegrm[9]) or (not FTempTelegrm[9]) then //inc(LEDB,$01);
  begin
    if (FTelegrm[9]and isInput) or (FTempTelegrm[9]and (not isInput)) then
    begin
      d9 := d9 + 1;
      if d9 = 2 then inc(LEDB,$01)
      else if d9 = 3 then d9 := 0
      else inc(LEDB,$01);
    end
    else
      inc(LEDB,$01);
  end;

 LEDC:=0;
  if not FPanel[16] then  inc(LEDC,$80);
  if not FPanel[12] then  inc(LEDC,$40);
  if not FPanel[11] then  inc(LEDC,$20);
  if not FPanel[10] then  inc(LEDC,$10);
  if not FPanel[9] then  inc(LEDC,$08);
  if not FPanel[15] then  inc(LEDC,$04);
  if not FPanel[14] then  inc(LEDC,$02);
  if not FPanel[13] then  inc(LEDC,$01);

 LEDD:=0;
  if not FLamp[7] then inc(LEDD,$80);
  if not FLamp[6] then inc(LEDD,$40);
  if not FLamp[5] then inc(LEDD,$20);
  if not FLamp[4] then inc(LEDD,$10);
  if not FLamp[3] then inc(LEDD,$08);
  if not FLamp[2] then inc(LEDD,$04);
  if not FLamp[1] then inc(LEDD,$02);
  if not FLamp[0] then inc(LEDD,$01);

 LEDF:=0;
  if KodeBuzzer = 'F8' then
  begin
    if not Buzzer then inc(LEDF,$80);
  end
  else if KodeLampButtonCek = 'F8' then
  begin
    if not LampButtonCek then inc(LEDF,$80);
  end
  else
    inc(LEDF,$80);

  if not FLamp[14] then inc(LEDF,$40);
  if not FLamp[13] then inc(LEDF,$20);
  if not FLamp[12] then inc(LEDF,$10);
  if not FLamp[11] then inc(LEDF,$08);
  if not FLamp[10] then inc(LEDF,$04);
  if not FLamp[9] then inc(LEDF,$02);
  if not FLamp[8] then inc(LEDF,$01);

  if CekAll then
  begin
   LEDD:=0;
   LEDF:=0;
  end;

  LEDH:=0;
  inc(LEDH,$80);
  inc(LEDH,$40);
  inc(LEDH,$20);
  inc(LEDH,$10);
  inc(LEDH,$08);
  inc(LEDH,$04);
  inc(LEDH,$02);
  inc(LEDH,$01);

  LEDJ:=0;
  inc(LEDJ,$80);
  inc(LEDJ,$40);
  inc(LEDJ,$20);
  inc(LEDJ,$10);
  inc(LEDJ,$08);
  inc(LEDJ,$04);
  inc(LEDJ,$02);
  inc(LEDJ,$01);

  LEDK:=0;
  if (not FTelegrm[8]) or (not FTempTelegrm[8]) then
  begin
    if (FTelegrm[8]and isInput) or (FTempTelegrm[8]and (not isInput)) then
    begin
      d8 := d8 + 1;
      if d8 = 2 then inc(LEDK,$80)
      else if d8 = 3 then d8 := 0
      else inc(LEDK,$80);
    end
    else
      inc(LEDK,$80);
  end;

  if (not FTelegrm[7]) or (not FTempTelegrm[7]) then
  begin
    if (FTelegrm[7]and isInput) or (FTempTelegrm[7]and (not isInput)) then
    begin
      d7 := d7 + 1;
      if d7 = 2 then inc(LEDK,$40)
      else if d7 = 3 then d7 := 0
      else inc(LEDK,$40);
    end
    else
      inc(LEDK,$40);
  end;

  if (not FTelegrm[6]) or (not FTempTelegrm[6]) then //inc(LEDK,$20);
  begin
    if (FTelegrm[6] and isInput) or (FTempTelegrm[6] and (not isInput)) then
    begin
      d6 := d6 + 1;
      if d6 = 2 then inc(LEDK,$20)
      else if d6 = 3 then d6 := 0
      else inc(LEDK,$20);
    end
    else
      inc(LEDK,$20);
  end;

  if (not FTelegrm[5]) or (not FTempTelegrm[5]) then //inc(LEDK,$10);
  begin
    if (FTelegrm[5] and isInput) or (FTempTelegrm[5] and (not isInput)) then
    begin
      d5 := d5 + 1;
      if d5 = 2 then inc(LEDK,$10)
      else if d5 = 3 then d5 := 0
      else inc(LEDK,$10);
    end
    else
      inc(LEDK,$10);
  end;

  if (not FTelegrm[4]) or (not FTempTelegrm[4]) then //inc(LEDK,$08);
  begin
    if (FTelegrm[4] and isInput) or (FTempTelegrm[4]and (not isInput)) then
    begin
      d4 := d4 + 1;
      if d4 = 2 then inc(LEDK,$08)
      else if d4 = 3 then d4 := 0
      else inc(LEDK,$08);
    end
    else
      inc(LEDK,$08);
  end;

  if (not FTelegrm[3]) or (not FTempTelegrm[3]) then //inc(LEDK,$04);
  begin
    if (FTelegrm[3] and isInput) or (FTempTelegrm[3]and (not isInput)) then
    begin
      d3 := d3 + 1;
      if d3 = 2 then inc(LEDK,$04)
      else if d3 = 3 then d3 := 0
      else inc(LEDK,$04);
    end
    else
      inc(LEDK,$04);
  end;

  if (not FTelegrm[2]) or (not FTempTelegrm[2]) then //inc(LEDK,$02);
  begin
    if (FTelegrm[2] and isInput) or (FTempTelegrm[2] and (not isInput)) then
    begin
      d2 := d2 + 1;
      if d2 = 2 then inc(LEDK,$02)
      else if d2 = 3 then d2 := 0
      else inc(LEDK,$02);
    end
    else
      inc(LEDK,$02);
  end;

  if (not FTelegrm[1]) or (not FTempTelegrm[1]) then //inc(LEDK,$01);
  begin
    if (FTelegrm[1] and isInput) or (FTempTelegrm[1] and (not isInput)) then
    begin
      d1 := d1 + 1;
      if d1 = 2 then inc(LEDK,$01)
      else if d1 = 3 then d1 := 0
      else inc(LEDK,$01);
    end
    else
      inc(LEDK,$01);
  end;

  if ComPort.Connected then
  begin
    ComPort.WriteStr(#$FF+
    Char(LEDA)+Char(LEDB)+Char(LEDC)+Char(LEDD)+
    Char(LEDF)+Char(LEDH)+Char(LEDJ)+Char(LEDK)+
    '12345678'); // Dummy Data
  end;
end;

end.
