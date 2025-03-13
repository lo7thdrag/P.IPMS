unit uAlarm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, VrControls, VrSystem, VrDesign, ImgList, Buttons,
  SpeedButtonImage, StdCtrls, Menus, pngimage, TFlatListBoxUnit, MPlayer,
  uDataACS, TFlatRadioButtonUnit, ComCtrls, RzDTP;

type

  TfAlarm = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    SpeedButtonImage1: TSpeedButtonImage;
    ImageList1: TImageList;
    SpeedButtonImage2: TSpeedButtonImage;
    SpeedButtonImage3: TSpeedButtonImage;
    SpeedButtonImage4: TSpeedButtonImage;
    ImageList2: TImageList;
    ImageList3: TImageList;
    SpeedButtonImage5: TSpeedButtonImage;
    SpeedButtonImage6: TSpeedButtonImage;
    ImageList4: TImageList;
    ImageList5: TImageList;
    ImageList6: TImageList;
    imgFire: TVrBitmapImage;
    VrBitmapList1: TVrBitmapList;
    imgDischarge: TVrBitmapImage;
    imgFault: TVrBitmapImage;
    imgTest: TVrBitmapImage;
    imgDisabled: TVrBitmapImage;
    imgPower: TVrBitmapImage;
    VrBitmapList2: TVrBitmapList;
    VrBitmapList3: TVrBitmapList;
    pnlMain: TPanel;
    pnlButton1: TPanel;
    pnlButton2: TPanel;
    pnlButton3: TPanel;
    pnlButton4: TPanel;
    PopupMenu1: TPopupMenu;
    mniExitProgram1: TMenuItem;
    Panel8: TPanel;
    Label1: TLabel;
    lblDisplayMsg: TLabel;
    pnlMenu: TPanel;
    pnlEventLog: TPanel;
    imgEventLog: TImage;
    imgMenu: TImage;
    lstMenu: TFlatListBox;
    lstEventLog: TFlatListBox;
    pnlEvent: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Splitter1: TSplitter;
    MediaPlayer1: TMediaPlayer;
    lblEvent: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    tmrFlashing: TTimer;
    pnlDisableEnable: TPanel;
    imgDisableEnable: TImage;
    lstDisableEnable: TFlatListBox;
    pnlTestFunction: TPanel;
    imgTestFunction: TImage;
    lstTestFunction: TFlatListBox;
    pnlSystemInfo: TPanel;
    imgSystemInfo: TImage;
    lstSystemInfo: TFlatListBox;
    pnlLanguage: TPanel;
    pnlDatetime: TPanel;
    lbl10: TLabel;
    lbl11: TLabel;
    tmrTest: TTimer;
    pnlSystemConfiguration: TPanel;
    lbl12: TLabel;
    lbl13: TLabel;
    pnlModuleVersion: TPanel;
    lbl14: TLabel;
    lbl15: TLabel;
    pnlCanBus: TPanel;
    pnlReset: TPanel;
    lbl16: TLabel;
    lblDate: TLabel;
    lblHour: TLabel;
    lblMinute: TLabel;
    lblMonth: TLabel;
    lblYear: TLabel;
    lbl17: TLabel;
    lbl18: TLabel;
    lbl19: TLabel;
    pnlShowDisable: TPanel;
    imgShowDisable: TImage;
    lstShowDiable: TFlatListBox;
    lstLanguage: TFlatListBox;
    imgLanguage: TImage;
    procedure mniExitProgram1Click(Sender: TObject);
    procedure Panel8DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButtonImage4Click(Sender: TObject);
    procedure SpeedButtonImage1Click(Sender: TObject);
    procedure SpeedButtonImage2Click(Sender: TObject);
    procedure SpeedButtonImage3Click(Sender: TObject);
    procedure SpeedButtonImage5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MediaPlayer1Notify(Sender: TObject);
    procedure SpeedButtonImage6Click(Sender: TObject);
    procedure tmrFlashingTimer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tmrTestTimer(Sender: TObject);
  private
    { Private declarations }
    FActivePage : Byte;
    FActiveList : TFlatListBox;
    ActiveIndex : Integer;
    ActivePointer : TImage;
    SimTime, DtTime : TDateTime;
    timeActivated, whc : Integer;
    yy,mm,dd,hh,nn, lblTag : Integer;
    indxLanguage : Byte;
    ackStop : Integer;

    procedure ActiveButton(aButton: TPanel; aName: string);
    procedure DeactiveButton(aButton: TPanel);
    procedure ActiveLabel(aLabel: TLabel);
    procedure DeactiveLabel(aLabel : TLabel);
    procedure DefaultButton;
    procedure SetActiveList(aList: TFlatListBox);
    procedure SetActivePage(val: Byte);
    procedure RefreshDisplay(aIndex: Integer);
    procedure ChangeLanguage(indx : Byte);
    procedure DeleteAlarm;

    property ActiveList: TFlatListBox read FActiveList write SetActiveList;
    property ActivePage: Byte read FActivePage write SetActivePage;
  public
    { Public declarations }
    AlarmList : TList;

    flag, ftime : Integer;
    silence: Boolean;

    procedure SetMonitor;
    procedure AddAlarm(state: TAlarmState);
    procedure SetAlarmOff(state: TAlarmState);

  end;

const
  PageMain = 1;
  PageMenu = 2;
    PageEventLog     = 21;
      PageEvent      = 211;
    PageShowDisable  = 22;
    PageDisableEnable        = 23;
      PageFireDetecttor      = 231;
      PageAlarmDevice        = 232;
      PageAutomaticDischarge = 233;
    PageTestFunction  = 24;
      PageLampTest    = 241;
      PageTestAudible = 242;
      PageTestRelays  = 243;
    PageSetDatetime   = 25;
    PageSystemInfo    = 26;
      PageSystemConf  = 216;
      PageModule      = 226;
      PageCanBusState = 236;
    PageLanguage = 27;
    PageReset = 28;

var
  fAlarm: TfAlarm;

implementation

uses uFormUtil, uFunction, uDataType, uAlarmSystem;

{$R *.dfm}

procedure TfAlarm.ActiveButton(aButton: TPanel; aName: string);
begin
  aButton.Color   := clGray;
  aButton.Caption := UpperCase(aName);
  aButton.Font.Size := 15;
end;

procedure TfAlarm.ActiveLabel(aLabel: TLabel);
begin
  aLabel.Color := clBlue;
  aLabel.Font.Color := clWhite;
end;

procedure TfAlarm.AddAlarm(state: TAlarmState);
begin
  AlarmList.Add(state);
  tmrFlashing.Enabled := True;

  if ActivePage = PageMain then
  begin
    if ((state.alarmMessage <> '') and (state.faultMessage = '')) or
       ((state.alarmMessageGRM <> '') and (state.faultMessageGRM = ''))then
    begin;
      case indxLanguage of
        0:
        begin
          lblDisplayMsg.Caption := state.alarmMessage;
          flag := 1;
        end;
        1:
        begin
          lblDisplayMsg.Caption := state.alarmMessageGRM;
          flag := 1;
        end;
      end;
    end;

    if ((state.alarmMessage = '') and (state.faultMessage <> '')) or
       ((state.alarmMessageGRM = '') and (state.faultMessageGRM <> ''))then
    begin;
      case indxLanguage of
        0:
        begin
          lblDisplayMsg.Caption := state.faultMessage;
          flag := 2;
        end;
        1:
        begin
          lblDisplayMsg.Caption := state.faultMessageGRM;
          flag := 2;
        end;
      end;
    end;

    if ((state.alarmMessage <> '') and (state.faultMessage <> '')) or
       ((state.alarmMessageGRM <> '') and (state.faultMessageGRM <> ''))then
    begin;
      case indxLanguage of
        0:
        begin
          lblDisplayMsg.Caption := state.alarmMessage + #13#10 + state.faultMessage;
          flag := 3;
        end;
        1:
        begin
          lblDisplayMsg.Caption := state.alarmMessageGRM + #13#10 + state.faultMessageGRM;
          flag := 3;
        end;
      end;
    end;
  end;

  if ActivePage = PageEvent then
    RefreshDisplay(AlarmList.Count-1);
end;

procedure TfAlarm.ChangeLanguage(indx: Byte);
var
  i,j : Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TLabel then
    begin
      case indx of
        0:
        begin
          if (TLabel(Components[i]).Name) = 'Label1' then
            Label1.Caption := 'Normal Operation';
          if (TLabel(Components[i]).Name) = 'lbl10' then
            lbl10.Caption := 'Date :';
          if (TLabel(Components[i]).Name) = 'lbl11' then
            lbl11.Caption := 'Time :';
          if (TLabel(Components[i]).Name) = 'lbl16' then
          begin
            lbl16.Caption := 'The systems reset deletes ' +#13#10+
                             'all actual alarm and fault message.' +#13#10+#13#10+
                             'Are you sure to do that?';

            if pnlButton4.Caption = '' then
              lbl16.Caption := 'Reset Data Success';
          end;

        end;
        1:
        begin
          if (TLabel(Components[i]).Name) = 'Label1' then
            Label1.Caption := 'Normalbetrieb';
          if (TLabel(Components[i]).Name) = 'lbl10' then
            lbl10.Caption := 'Datum :';
          if (TLabel(Components[i]).Name) = 'lbl11' then
            lbl11.Caption := 'Uhrzeit :';
          if (TLabel(Components[i]).Name) = 'lbl16' then
          begin
            lbl16.Caption := 'Die Systeme Reset löscht '+#13#10+
                             'alle aktuellen Alarm- und Fehlermeldung.'+#13#10+#13#10+
                             'Sind Sie sicher, das zu tun?';

            if pnlButton4.Caption = '' then
              lbl16.Caption := 'Daten Neu Setzen Erfolg';;
          end;
        end;
      end;
    end;

    if Components[i] is TPanel then
    begin
      case indx of
        0:
        begin
          if (TPanel(Components[i]).Name) = 'pnlEventLog' then
            pnlEventLog.Caption := 'DISPLAY FILTER for EVENT LOG';
          if (TPanel(Components[i]).Name) = 'pnlEvent' then
            pnlEvent.Caption := 'EVENT No. 1018 of 1018';
          if (TPanel(Components[i]).Name) = 'pnlDisableEnable' then
            pnlDisableEnable.Caption := 'DISABLE/ENABLE SYSTEM FUNCTIONS';
          if (TPanel(Components[i]).Name) = 'pnlTestFunction' then
            pnlTestFunction.Caption := 'TEST FUNCTIONS';
          if (TPanel(Components[i]).Name) = 'pnlSystemInfo' then
            pnlSystemInfo.Caption := 'SYSTEM INFO';
          if (TPanel(Components[i]).Name) = 'pnlLanguage' then
            pnlLanguage.Caption := 'LANGUAGE/SPRACHE';
          if (TPanel(Components[i]).Name) = 'pnlDatetime' then
            pnlDatetime.Caption := 'SET DATE AND TIME';
          if (TPanel(Components[i]).Name) = 'pnlCanBus' then
            pnlCanBus.Caption := 'CAN-BUS STATE';
          if (TPanel(Components[i]).Name) = 'pnlReset' then
            pnlReset.Caption := 'RESET';
          if (TPanel(Components[i]).Name) = 'pnlModuleVersion' then
            pnlModuleVersion.Caption := 'MODULE TYPE AND VERSION';
          if (TPanel(Components[i]).Name) = 'pnlSystemConfiguration' then
            pnlSystemConfiguration.Caption := 'SYSTEM CONFIGURATION';
        end;
        1:
        begin
          if (TPanel(Components[i]).Name) = 'pnlEventLog' then
            pnlEventLog.Caption := 'Anzeigefilter für Ereignisprotokoll';
          if (TPanel(Components[i]).Name) = 'pnlEvent' then
            pnlEvent.Caption := 'Ereignis Nr. 1080 von 1080';
          if (TPanel(Components[i]).Name) = 'pnlDisableEnable' then
            pnlDisableEnable.Caption := 'Deaktivieren/Aktiviert System Funktionen';
          if (TPanel(Components[i]).Name) = 'pnlTestFunction' then
            pnlTestFunction.Caption := 'Test Funktionen';
          if (TPanel(Components[i]).Name) = 'pnlSystemInfo' then
            pnlSystemInfo.Caption := 'Systeminfo';
          if (TPanel(Components[i]).Name) = 'pnlLanguage' then
            pnlLanguage.Caption := 'Sprache';
          if (TPanel(Components[i]).Name) = 'pnlDatetime' then
            pnlDatetime.Caption := 'Datum und Uhrzeit Einstellen';
          if (TPanel(Components[i]).Name) = 'pnlCanBus' then
            pnlCanBus.Caption := 'Zeigen CAN-Bus Zustand';
          if (TPanel(Components[i]).Name) = 'pnlReset' then
            pnlReset.Caption := 'Neu Setzen';
          if (TPanel(Components[i]).Name) = 'pnlModuleVersion' then
            pnlModuleVersion.Caption := 'Zeigen Modul-Typen und Versionen';
          if (TPanel(Components[i]).Name) = 'pnlSystemConfiguration' then
            pnlSystemConfiguration.Caption := 'Zeigen System Konfigutation';
        end;
      end;
    end;

    if Components[i] is TFlatListBox then
    begin
      case indx of
        0:
        begin
          if (TFlatListBox(Components[i]).Name) = 'lstLanguage' then
          begin
            lstLanguage.Items.Clear;

            lstLanguage.Items.Add('English');
            lstLanguage.Items.Add('German');
          end;

          if (TFlatListBox(Components[i]).Name) = 'lstMenu' then
          begin
            lstMenu.Items.Clear;

            lstMenu.Items.Add('Event Log');
            lstMenu.Items.Add('Show Disabled System Functions');
            lstMenu.Items.Add('Disable/Enable System Functions');
            lstMenu.Items.Add('Test Functions');
            lstMenu.Items.Add('Set Date and Time');
            lstMenu.Items.Add('System Info');
            lstMenu.Items.Add('Language/Sprache');
            lstMenu.Items.Add('RESET');
          end;

          if (TFlatListBox(Components[i]).Name) = 'lstEventLog' then
          begin
            lstEventLog.Items.Clear;

            lstEventLog.Items.Add('Show All Events');
            lstEventLog.Items.Add('Show Fire and Discharge Alarms');
            lstEventLog.Items.Add('Show Pump Events');
            lstEventLog.Items.Add('Show Circuit Faults');
            lstEventLog.Items.Add('Show Module Faults');
            lstEventLog.Items.Add('Show Power Supply Faults');
            lstEventLog.Items.Add('Show Disabled System Parts');
            lstEventLog.Items.Add('Show CAN-Bus Events');
            lstEventLog.Items.Add('Show System Starts');
          end;

          if (TFlatListBox(Components[i]).Name) = 'lstDisableEnable' then
          begin
            lstDisableEnable.Items.Clear;

            lstDisableEnable.Items.Add('Fire Detectors');
            lstDisableEnable.Items.Add('Alarm Devices');
            lstDisableEnable.Items.Add('Automatic Discharge (FWBLAFFS)');
          end;

          if (TFlatListBox(Components[i]).Name) = 'lstTestFunction' then
          begin
            lstTestFunction.Items.Clear;

            lstTestFunction.Items.Add('Lamp Test');
            lstTestFunction.Items.Add('Test Visible/Audible Alarms');
            lstTestFunction.Items.Add('Test Relays');
          end;

          if (TFlatListBox(Components[i]).Name) = 'lstSystemInfo' then
          begin
            lstSystemInfo.Items.Clear;

            lstSystemInfo.Items.Add('Show System Configuration');
            lstSystemInfo.Items.Add('Show Module Types and Versions');
            lstSystemInfo.Items.Add('Show CAN-Bus State');
          end;

          if (TFlatListBox(Components[i]).Name) = 'lstShowDiable' then
          begin
            lstShowDiable.Items.Clear;

            lstShowDiable.Items.Add('Automatic Fire Detector');
            lstShowDiable.Items.Add('Alarm Device (Visible/Audible)');
            lstShowDiable.Items.Add('Solenoid or Motor Driven Valve');
            lstShowDiable.Items.Add('Automatic Function of Main Pump');
          end;
        end;
        1:
        begin
          if (TFlatListBox(Components[i]).Name) = 'lstLanguage' then
          begin
            lstLanguage.Items.Clear;

            lstLanguage.Items.Add('Englisch');
            lstLanguage.Items.Add('Deutsch');
          end;

          if (TFlatListBox(Components[i]).Name) = 'lstMenu' then
          begin
            lstMenu.Items.Clear;

            lstMenu.Items.Add('Ereignisprotokoll');
            lstMenu.Items.Add('Zeigen Deaktivieren System Funktionen');
            lstMenu.Items.Add('Deaktivieren/Aktiviert System Funktionen');
            lstMenu.Items.Add('Test Funktionen');
            lstMenu.Items.Add('Datum und Uhrzeit Einstellen');
            lstMenu.Items.Add('System Info');
            lstMenu.Items.Add('Sprache');
            lstMenu.Items.Add('Neu Setzen');
          end;

          if (TFlatListBox(Components[i]).Name) = 'lstEventLog' then
          begin
            lstEventLog.Items.Clear;

            lstEventLog.Items.Add('Zeigen Alle Veranstaltungen');
            lstEventLog.Items.Add('Zeigen Feuer und Entladung Alarme');
            lstEventLog.Items.Add('Zeigen Pumpe Veranstaltungen');
            lstEventLog.Items.Add('Zeigen Schlussfehler');
            lstEventLog.Items.Add('Zeigen Modulfehler');
            lstEventLog.Items.Add('Zeigen Versorgungsfehler');
            lstEventLog.Items.Add('Zeigen Behinderte Systembauteile');
            lstEventLog.Items.Add('Zeigen CAN-Bus Veranstaltungen');
            lstEventLog.Items.Add('Zeigen System Startet');
          end;

          if (TFlatListBox(Components[i]).Name) = 'lstDisableEnable' then
          begin
            lstDisableEnable.Items.Clear;

            lstDisableEnable.Items.Add('Detektoren des Feuers');
            lstDisableEnable.Items.Add('Vorrichtungen der Alarm');
            lstDisableEnable.Items.Add('Automatische Entladung (FWBLAFFS)');
          end;

          if (TFlatListBox(Components[i]).Name) = 'lstTestFunction' then
          begin
            lstTestFunction.Items.Clear;

            lstTestFunction.Items.Add('Lamp Test');
            lstTestFunction.Items.Add('Test Visible/Audible Alarms');
            lstTestFunction.Items.Add('Test Relays');
          end;

          if (TFlatListBox(Components[i]).Name) = 'lstSystemInfo' then
          begin
            lstSystemInfo.Items.Clear;

            lstSystemInfo.Items.Add('Show System Configuration');
            lstSystemInfo.Items.Add('Show Module Types and Versions');
            lstSystemInfo.Items.Add('Show CAN-Bus State');
          end;

          if (TFlatListBox(Components[i]).Name) = 'lstShowDiable' then
          begin
            lstShowDiable.Items.Clear;

            lstShowDiable.Items.Add('Automatische Brandmelder');
            lstShowDiable.Items.Add('Alarm Gerät (Sichtbar / Akustische)');
            lstShowDiable.Items.Add('Magnet oder Motor Angetrieben Ventil');
            lstShowDiable.Items.Add('Automatische Funktion der Haupt Pumpe');
          end;
        end;
      end;
    end;
  end;
end;

procedure TfAlarm.DeactiveButton(aButton: TPanel);
begin
  aButton.Color   := clMedGray;
  aButton.Caption := '';
end;

procedure TfAlarm.DeactiveLabel(aLabel: TLabel);
begin
  aLabel.Color := clSkyBlue;
  aLabel.Font.Color := clBlack;
end;

procedure TfAlarm.DefaultButton;
begin
  ActiveButton(pnlButton1,'DOWN');
  ActiveButton(pnlButton2,'UP');
  ActiveButton(pnlButton3,'RETURN');
  ActiveButton(pnlButton4,'SELECT');

  if ActiveIndex = 0 then DeactiveButton(pnlButton2);

  if ActiveIndex = ActiveList.Items.Count-1 then
    DeactiveButton(pnlButton1);
end;

procedure TfAlarm.DeleteAlarm;
var
  i : Integer;
begin
  if AlarmList.Count = 0 then
    Exit
  else
  begin
    AlarmList.Clear;

    imgFire.BitmapIndex := 0;
    imgDischarge.BitmapIndex := 0;
    imgFault.BitmapIndex := 0;
    imgTest.BitmapIndex := 0;
    imgDisabled.BitmapIndex := 0;
    imgPower.BitmapIndex := 0;
    imgTest.BitmapIndex := 0;

    SysAlarm.Alarm.AlertOnOff(1);
    SysAlarm.Alarm.checked := False;
    silence := False;
  end;
end;

procedure TfAlarm.FormCreate(Sender: TObject);
begin
  if not Assigned(AlarmList) then
    AlarmList := TList.create;

  if not FileExists(ExtractFilePath(Application.Exename) + 'Alarm08.wav') then
  begin
    raise Exception.Create('Alarm08.wav Not found');
  end
  else
    MediaPlayer1.FileName := (ExtractFilePath(Application.Exename) + 'Alarm08.wav');

  silence := False;

  timeActivated := 0;
  lblTag := 0;

  indxLanguage := 0;
  ChangeLanguage(indxLanguage);

  lblYear.Caption  := FormatDateTime('yyyy', Now);
  lblMonth.Caption := FormatDateTime('mm', Now);
  lblDate.Caption   := FormatDateTime('dd', Now);
  lblHour.Caption  := FormatDateTime('hh', Now);
  lblMinute.Caption:= FormatDateTime('nn', Now);
end;

procedure TfAlarm.FormDestroy(Sender: TObject);
begin
  AlarmList.Free;
  MediaPlayer1.Free;
end;

procedure TfAlarm.FormShow(Sender: TObject);
begin
  ActivePage := PageMain;
end;

procedure TfAlarm.MediaPlayer1Notify(Sender: TObject);
begin
  if (MediaPlayer1.NotifyValue = nvSuccessful) and silence then begin
    MediaPlayer1.Play;
    MediaPlayer1.Notify := True;
  end;
end;

procedure TfAlarm.mniExitProgram1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfAlarm.Panel8DblClick(Sender: TObject);
begin
  PopupMenu1.Popup(Left+70, Top+41);
end;

procedure TfAlarm.RefreshDisplay(aIndex: Integer);
var
  state: string;
begin
  if AlarmList.Count = 0 then
  begin
    pnlEvent.Caption := 'EVENT No. 0 of 0';
    lblEvent.Caption := '';
    DeactiveButton(pnlButton1);
    DeactiveButton(pnlButton2);
    Exit;
  end;

  pnlEvent.Caption := 'EVENT No. ' + IntToStr(aIndex+1) + ' of ' + IntToStr(AlarmList.Count);

  with TAlarmState(AlarmList[aIndex]) do
  begin

    if ftime = 7 then
    begin
      DtTime := Now;
      SimTime := dtTime;
    end
    else if ftime = 8 then
      SimTime := scenTime;

    case indxLanguage of
      0:
      begin
        state := state + DateTimeToStr(SimTime) + #13#10;

        if alarmMessage <> '' then
          state := state + 'ALARM : ' + alarmMessage + #13#10;

        if faultMessage <> '' then
          state := state + faultMessage + #13#10;

        if sandiRuangan <> '' then
          state := state + 'Deck : ' + deck + ' ' +sandiRuangan + ' ' + lokasi;
      end;
      1:
      begin
        state := state + DateTimeToStr(SimTime) + #13#10;

        if alarmMessageGRM <> '' then
          state := state + 'ALARM : ' + alarmMessageGRM + #13#10;

        if faultMessageGRM <> '' then
          state := state + faultMessageGRM + #13#10;

        if sandiRuangan <> '' then
          state := state + 'Deck : ' + deck + ' ' +sandiRuangan + ' ' + lokasiGRM;
      end;
    end;


  end;

  lblEvent.Caption := WrapText(state,47);

  ActiveIndex := aIndex;

  //refresh button
  ActiveButton(pnlButton1,'<EARLIER');
  ActiveButton(pnlButton2,'LATER>');
  if AlarmList.Count = 1 then
  begin
    DeactiveButton(pnlButton1);
    DeactiveButton(pnlButton2);
  end
  else if aIndex = 0 then
    DeactiveButton(pnlButton1)
  else if aIndex = AlarmList.Count-1 then
    DeactiveButton(pnlButton2);
end;

procedure TfAlarm.SetActiveList(aList: TFlatListBox);
begin
  FActiveList := aList;

  if ActiveList = lstMenu then
    ActivePointer := imgMenu;

  if ActiveList = lstEventLog then
    ActivePointer := imgEventLog;

  if ActiveList = lstShowDiable then
    ActivePointer := imgShowDisable;

  if ActiveList = lstDisableEnable then
    ActivePointer := imgDisableEnable;

  if ActiveList = lstTestFunction then
    ActivePointer := imgTestFunction;

  if ActiveList = lstSystemInfo then
    ActivePointer := imgSystemInfo;

  if ActiveList = lstLanguage then
    ActivePointer := imgLanguage;

  ActiveIndex := 0;
  ActivePointer.Top := 38; //reset pionter pict position
end;

procedure TfAlarm.SetActivePage(val: Byte);
begin
  FActivePage := val;

  case FActivePage of
    PageMain:
    begin
      pnlMain.BringToFront;
      DeactiveButton(pnlButton1);
      DeactiveButton(pnlButton2);
      DeactiveButton(pnlButton3);
      ActiveButton(pnlButton4,'MENU');
    end;
    PageMenu:
    begin
      pnlMenu.BringToFront;
      ActiveList := lstMenu;
      DefaultButton;
    end;
    PageEventLog:
    begin
      pnlEventLog.BringToFront;
      ActiveList := lstEventLog;
      DefaultButton;
    end;
    PageEvent:
    begin
      pnlEvent.BringToFront;
      RefreshDisplay(AlarmList.Count-1);
      ActiveButton(pnlButton3,'RETURN');
      DeactiveButton(pnlButton4);
    end;
    PageShowDisable:
    begin
      pnlShowDisable.BringToFront;
      ActiveList := lstShowDiable;
      DefaultButton;
    end;
    PageDisableEnable:
    begin
      pnlDisableEnable.BringToFront;
      ActiveList := lstDisableEnable;
      DefaultButton;
    end;
    PageTestFunction:
    begin
      pnlTestFunction.BringToFront;
      ActiveList := lstTestFunction;
      DefaultButton;
    end;
    PageSystemInfo:
    begin
      pnlSystemInfo.BringToFront;
      ActiveList := lstSystemInfo;
      DefaultButton;
    end;
    PageSystemConf:
    begin
      pnlSystemConfiguration.BringToFront;
      DeactiveButton(pnlButton1);
      DeactiveButton(pnlButton2);
      ActiveButton(pnlButton3,'RETURN');
      DeactiveButton(pnlButton4);
    end;
    PageModule:
    begin
      pnlModuleVersion.BringToFront;
      DeactiveButton(pnlButton1);
      DeactiveButton(pnlButton2);
      ActiveButton(pnlButton3,'RETURN');
      DeactiveButton(pnlButton4);
    end;
    PageCanBusState:
    begin
      pnlCanBus.BringToFront;
      DeactiveButton(pnlButton1);
      DeactiveButton(pnlButton2);
      ActiveButton(pnlButton3,'RETURN');
      DeactiveButton(pnlButton4);
    end;
    PageSetDatetime:
    begin
      pnlDatetime.BringToFront;
      ActiveButton(pnlButton1,'DOWN');
      ActiveButton(pnlButton2,'UP');
      ActiveButton(pnlButton3,'RETURN');
      ActiveButton(pnlButton4,'NEXT');
    end;
    PageLanguage:
    begin
      pnlLanguage.BringToFront;
      ActiveList := lstLanguage;
      DefaultButton;
    end;
    PageReset:
    begin
      pnlReset.BringToFront;
      DeactiveButton(pnlButton1);
      DeactiveButton(pnlButton2);
      ActiveButton(pnlButton3,'RETURN');
      ActiveButton(pnlButton4, 'YES');
    end;
  end;
end;

procedure TfAlarm.SetAlarmOff(state: TAlarmState);
begin
  if state.statusRec = 1 then
  begin
    tmrFlashing.Enabled := False;
    lblDisplayMsg.Font.Color := clBlack;
  end
end;

procedure TfAlarm.SetMonitor;
begin
  case Screen.MonitorCount of
    1 :
    begin
      AlignFormToMonitor(0, apLeftTop, 0, Round(Screen.Width/2)-40, TForm(fAlarm));
    end;
    2 :
    begin
      AlignFormToMonitor(1, apLeftTop, 0, Round(Screen.Width/2)-40, TForm(fAlarm));
    end;
  end;

  fAlarm.Show;
end;

procedure TfAlarm.SpeedButtonImage1Click(Sender: TObject);
begin
  if pnlButton1.Caption = 'DOWN' then
  begin
    case ActivePage of
      PageMenu,
      PageEventLog,
      PageShowDisable,
      PageDisableEnable,
      PageTestFunction,
      PageSystemInfo,
      PageReset,
      PageLanguage:
      begin
        if ActiveIndex < ActiveList.Items.Count-1 then
        begin
          ActiveIndex := ActiveIndex + 1;
          ActivePointer.Top := 38 + (19*ActiveIndex);
        end;

        if ActiveList.Items.Count = 2 then
        begin
          ActiveButton(pnlButton2,'UP');
          Exit;
        end;

        if ActiveIndex = ActiveList.Items.Count-1 then
          DeactiveButton(pnlButton1)
        else
          ActiveButton(pnlButton2,'UP');
      end;

      PageSetDatetime:
      begin
        case lblTag of
          1:
          begin
            yy := StrToInt(lblYear.Caption);

            if (yy > 2050) or (yy < 2000) then
              Exit
            else
            begin
              yy := yy - 1;
              lblYear.Caption := IntToStr(yy);
            end;
          end;
          2:
          begin
            mm := StrToInt(lblMonth.Caption);

            if (mm > 12) or (mm < 1) then
              Exit
            else
            begin
              mm := mm - 1;
              lblMonth.Caption := IntToStr(mm);
            end;
          end;
          3:
          begin
            dd := StrToInt(lblDate.Caption);

            if (dd > 31) or (dd < 1) then
              Exit
            else
            begin
              dd := dd - 1;
              lblDate.Caption := IntToStr(dd);
            end;
          end;
          4:
          begin
            hh := StrToInt(lblHour.Caption);

            if (hh > 24) or (hh < 1) then
              Exit
            else
            begin
              hh := hh - 1;
              lblHour.Caption := IntToStr(hh);
            end;
          end;
          5:
          begin
            nn := StrToInt(lblMinute.Caption);

            if (nn > 60) or (nn < 1) then
              Exit
            else
            begin
              nn := nn - 1;
              lblMinute.Caption := IntToStr(nn);
            end;
          end;
        end;
      end;
    end;
  end
  else if pnlButton1.Caption = '<EARLIER' then
  begin
    case ActivePage of
      PageEvent, PageLanguage, PageSetDatetime,
      PageSystemConf, PageModule, PageCanBusState:
      begin
        if ActiveIndex <> 0 then
          RefreshDisplay(ActiveIndex - 1);
      end;
    end;
  end;
end;

procedure TfAlarm.SpeedButtonImage2Click(Sender: TObject);
begin
  if pnlButton2.Caption = 'UP' then
  begin
    case ActivePage of
      PageMenu,
      PageEventLog,
      PageShowDisable,
      PageDisableEnable,
      PageTestFunction,
      PageSystemInfo,
      PageReset,
      PageLanguage:
      begin
        if ActiveIndex <> 0 then
        begin
          ActiveIndex := ActiveIndex - 1;
          ActivePointer.Top := 38 + (19*ActiveIndex);
        end;

        if ActiveIndex = 0 then
          DeactiveButton(pnlButton2)
        else
          ActiveButton(pnlButton1,'DOWN');
      end;

      PageSetDatetime:
      begin
        case lblTag of
          1:
          begin
            yy := StrToInt(lblYear.Caption);

            if (yy > 2050) or (yy < 2000) then
              Exit
            else
            begin
              yy := yy + 1;
              lblYear.Caption := IntToStr(yy);
            end;
          end;
          2:
          begin
            mm := StrToInt(lblMonth.Caption);

            if (mm > 12) or (mm < 1) then
              Exit
            else
            begin
              mm := mm + 1;
              lblMonth.Caption := IntToStr(mm);
            end;
          end;
          3:
          begin
            dd := StrToInt(lblDate.Caption);

            if (dd > 31) or (dd < 1) then
              Exit
            else
            begin
              dd := dd + 1;
              lblDate.Caption := IntToStr(dd);
            end;
          end;
          4:
          begin
            hh := StrToInt(lblHour.Caption);

            if (hh > 24) or (hh < 1) then
              Exit
            else
            begin
              hh := hh + 1;
              lblHour.Caption := IntToStr(hh);
            end;
          end;
          5:
          begin
            nn := StrToInt(lblMinute.Caption);

            if (nn > 60) or (nn < 1) then
              Exit
            else
            begin
              nn := nn + 1;
              lblMinute.Caption := IntToStr(nn);
            end;
          end;
        end;
      end;
    end;
  end
  else if pnlButton2.Caption = 'LATER>' then
  begin
    case ActivePage of
      PageEvent, PageLanguage, PageSetDatetime, PageSystemConf,
      PageModule, PageCanBusState:
      begin
        if ActiveIndex <> AlarmList.Count-1 then
          RefreshDisplay(ActiveIndex + 1);
      end;
    end;
  end;
end;

procedure TfAlarm.SpeedButtonImage3Click(Sender: TObject);
begin
  if pnlButton3.Caption = 'RETURN' then
  begin
    case ActivePage of
      PageMenu        : ActivePage := PageMain;
      PageEventLog,
      PageShowDisable,
      PageDisableEnable,
      PageTestFunction,
      PageSystemInfo,
      PageSetDatetime,
      PageLanguage,
      PageReset       : ActivePage := PageMenu;
      PageEvent       : ActivePage := PageEventLog;
      PageSystemConf,
      PageModule,
      PageCanBusState : ActivePage := PageSystemInfo;
    end;

    ChangeLanguage(indxLanguage);
  end;
end;

procedure TfAlarm.SpeedButtonImage4Click(Sender: TObject);
begin
  if pnlButton4.Caption = 'MENU' then
    ActivePage := PageMenu
  else if pnlButton4.Caption = 'SELECT' then
  begin
    case ActivePage of
      PageMenu:
      begin
        case ActiveIndex of
          0: ActivePage := PageEventLog;
          1: ActivePage := PageShowDisable;
          2: ActivePage := PageDisableEnable;
          3: ActivePage := PageTestFunction;
          4: ActivePage := PageSetDatetime;
          5: ActivePage := PageSystemInfo;
          6: ActivePage := PageLanguage;
          7: ActivePage := PageReset;
        end;
      end;
      PageEventLog:
      begin
        case ActiveIndex of
          0: ActivePage := PageEvent;
          1: ActivePage := PageEvent;     //temporary
        end;
      end;
      PageTestFunction:
      begin
        whc := ActiveIndex;

        tmrTest.Enabled := True;
      end;
      PageSystemInfo:
      begin
        case ActiveIndex of
          0: ActivePage := PageSystemConf;
          1: ActivePage := PageModule;
          2: ActivePage := PageCanBusState;
        end;
      end;
      PageLanguage:
      begin
        indxLanguage := ActiveIndex;

        ChangeLanguage(indxLanguage);
      end;
    end;
  end
  else if pnlButton4.Caption = 'YES' then
  begin
    DeleteAlarm;
    DeactiveButton(pnlButton4);
    ChangeLanguage(indxLanguage);

    tmrFlashing.Enabled := False;
    imgFire.BitmapIndex := 0;
    imgFault.BitmapIndex := 0;

    SysAlarm.sendStatusACS(epFaultStatus, 1);
  end
  else if pnlButton4.Caption = 'NEXT' then
  begin
    if lblTag > 4 then
    begin
      lblTag := 0;
      pnlButton4.Caption := 'SAVE';
      DeactiveButton(pnlButton1);
      DeactiveButton(pnlButton2);
      ftime := 7;

      DtTime := StrToDateTime(lblYear.Caption+'-'+lblMonth.Caption+'-'+lbldate.Caption+' '+
                              lblHour.Caption+':'+lblMinute.Caption+':00');
    end;

    lblTag := lblTag + 1;

    if lblTag = lblYear.Tag then
    begin
      ActiveLabel(lblYear);
      DeactiveLabel(lblMonth);
      DeactiveLabel(lblDate);
      DeactiveLabel(lblHour);
      DeactiveLabel(lblMinute);
    end
    else if lblTag = lblMonth.Tag then
    begin
      DeactiveLabel(lblYear);
      ActiveLabel(lblMonth);
      DeactiveLabel(lblDate);
      DeactiveLabel(lblHour);
      DeactiveLabel(lblMinute);
    end
    else if lblTag = lblDate.Tag then
    begin
      DeactiveLabel(lblYear);
      DeactiveLabel(lblMonth);
      ActiveLabel(lblDate);
      DeactiveLabel(lblHour);
      DeactiveLabel(lblMinute);
    end
    else if lblTag = lblHour.Tag then
    begin
      DeactiveLabel(lblYear);
      DeactiveLabel(lblMonth);
      DeactiveLabel(lblDate);
      ActiveLabel(lblHour);
      DeactiveLabel(lblMinute);
    end
    else if lblTag = lblMinute.Tag then
    begin
      DeactiveLabel(lblYear);
      DeactiveLabel(lblMonth);
      DeactiveLabel(lblDate);
      DeactiveLabel(lblHour);
      ActiveLabel(lblMinute);
    end;
  end;
end;

procedure TfAlarm.SpeedButtonImage5Click(Sender: TObject);
begin
  if AlarmList.Count > 0 then
  begin
    if SpeedButtonImage5.ImageIndex = 1 then
    begin
      SysAlarm.Alarm.AlertOnOff(1);
      SysAlarm.Alarm.checked := False;
      silence := False;
    end
    else
    begin
      SysAlarm.Alarm.AlertOnOff(0);
      SysAlarm.Alarm.checked := True;
      silence := True;
    end;
  end
  else
  begin
    SysAlarm.Alarm.AlertOnOff(1);
    SysAlarm.Alarm.checked := False;
    silence := False;
  end;
end;

procedure TfAlarm.SpeedButtonImage6Click(Sender: TObject);
var
  i, unAcked : Integer;
  objACS : TAlarmState;
begin
  tmrFlashing.Enabled := False;
  lblDisplayMsg.Font.Color := clBlack;

  case flag of
    1: imgFire.BitmapIndex := 1;
    2: imgFault.BitmapIndex := 1;
    3:
    begin
      imgFire.BitmapIndex := 1;
      imgFault.BitmapIndex := 1;
    end;
  end;

  SysAlarm.sendStatusACS(epFaultStatus, 2);
end;

procedure TfAlarm.tmrFlashingTimer(Sender: TObject);
var
  i,j : Integer;
  state  : TAlarmState;
  isFound : Boolean;
begin
  for j := 0 to 2 do
  begin
    isFound := False;
    for i := 0 to AlarmList.Count - 1 do
    begin
      state := AlarmList.Items[i];

      if state.statusRec = 0 then
      begin
        isFound := True;
        Break;
      end;
    end;

    if isFound then
    begin
      case flag of
        1:
        begin
          case imgFire.BitmapIndex of
            0: imgFire.BitmapIndex := 1;
            1: imgFire.BitmapIndex := 0;
          end;
        end;
        2:
        begin
          case imgFault.BitmapIndex of
            0: imgFault.BitmapIndex := 1;
            1: imgFault.BitmapIndex := 0;
          end;
        end;
        3:
        begin
          case imgFire.BitmapIndex of
            0: imgFire.BitmapIndex := 1;
            1: imgFire.BitmapIndex := 0;
          end;

          case imgFault.BitmapIndex of
            0: imgFault.BitmapIndex := 1;
            1: imgFault.BitmapIndex := 0;
          end;
        end;
      end;
    end
    else
    begin
      case flag of
        1: imgFire.BitmapIndex := 0;
        2: imgFault.BitmapIndex := 0;
        3:
        begin
          imgFire.BitmapIndex := 0;
          imgFault.BitmapIndex := 0;
        end;
      end;
    end;
  end;

  if lblDisplayMsg.Font.Color = clBlack then
    lblDisplayMsg.Font.Color := clRed
  else
    lblDisplayMsg.Font.Color := clBlack;

//  for i := 0 to AlarmList.Count - 1 do
//  begin
//    state := AlarmList.Items[i];
//
//    if i = 0 then
//    begin
//      if ((state.alarmMessage <> '') and (state.faultMessage <> '')) or
//       ((state.alarmMessageGRM <> '') and (state.faultMessageGRM <> ''))then
//      begin
//        case imgFire.BitmapIndex of
//          0: imgFire.BitmapIndex := 1;
//          1: imgFire.BitmapIndex := 0;
//        end;
//
//        case imgFault.BitmapIndex of
//          0: imgFault.BitmapIndex := 1;
//          1: imgFault.BitmapIndex := 0;
//        end;

//        Break;
//      end;
//    end
//    else
//    if ((state.alarmMessage <> '') and (state.faultMessage <> '')) or
//       ((state.alarmMessageGRM <> '') and (state.faultMessageGRM <> ''))then
//    begin
//
//      Continue;
//    end;
//
//    if (state.alarmMessage <> '') or (state.alarmMessageGRM <> '') then
//    begin
//      case imgFire.BitmapIndex of
//        0: imgFire.BitmapIndex := 1;
//        1: imgFire.BitmapIndex := 0;
//      end;
//    end;
//
//    if (state.faultMessage <> '') or (state.faultMessageGRM <> '') then
//    begin
//      case imgFault.BitmapIndex of
//        0: imgFault.BitmapIndex := 1;
//        1: imgFault.BitmapIndex := 0;
//      end;
//    end;
//
//  end;
end;

procedure TfAlarm.tmrTestTimer(Sender: TObject);
begin
  tmrFlashing.Enabled := True;

  case whc of
    0:
    begin

      timeActivated := timeActivated + 1;

      if timeActivated > 6 then
      begin
        tmrTest.Enabled := False;
        timeActivated := 0;

        imgFire.BitmapIndex := 0;
        imgDischarge.BitmapIndex := 0;
        imgFault.BitmapIndex := 0;
        imgTest.BitmapIndex := 0;
        imgDisabled.BitmapIndex := 0;
        imgPower.BitmapIndex := 0;
        imgTest.BitmapIndex := 0;
      end
      else
      begin
        tmrFlashing.Enabled := False;

        if imgFire.BitmapIndex = 0 then
          imgFire.BitmapIndex := 1
        else
          imgFire.BitmapIndex := 0;

        if imgDischarge.BitmapIndex = 0 then
          imgDischarge.BitmapIndex := 1
        else
          imgDischarge.BitmapIndex := 0;

        if imgFault.BitmapIndex = 0 then
          imgFault.BitmapIndex := 1
        else
          imgFault.BitmapIndex := 0;

        if imgTest.BitmapIndex = 0 then
          imgTest.BitmapIndex := 1
        else
          imgTest.BitmapIndex := 0;

        if imgDisabled.BitmapIndex = 0 then
          imgDisabled.BitmapIndex := 1
        else
          imgDisabled.BitmapIndex := 0;

        if imgPower.BitmapIndex = 0 then
          imgPower.BitmapIndex := 1
        else
          imgPower.BitmapIndex := 0;


      end;
    end;
    1,2:
    begin
      timeActivated := timeActivated + 1;

      if timeActivated > 6 then
      begin
        tmrTest.Enabled := False;
        timeActivated := 0;

        imgTest.BitmapIndex := 0;
      end
      else
      begin
        tmrFlashing.Enabled := False;

        if imgTest.BitmapIndex = 0 then
          imgTest.BitmapIndex := 1
        else
          imgTest.BitmapIndex := 0;
      end;
    end;
  end;
end;

end.
