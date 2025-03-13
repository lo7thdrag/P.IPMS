unit uAlarmManager;

{
  Class to manage IPMS forms
}

interface

uses
  uDataType, Forms, Controls, Graphics,
  Sysutils, classes, Dialogs, ExtCtrls,
  uListener, uDBSupportClasses, uAlarm;

type

  TAlarmManager = class
  private
    FListener    : TListeners;

    FRoleName : string;
    FChecked  : Boolean;

    procedure OnThreadRunning(Sender: TObject);
  public
    FOnThreadData_Running : TTimer;
    FCurrentDataIndex : Integer;
    FIPMSData_List : TList;

    constructor Create;
    destructor Destroy; override;

    procedure AlertOnOff(status : Byte);

    { network event }
    procedure NetEvent_ACSCommonCmd(apRec: PAnsiChar; aSize: Word);
    procedure NetEventInstructorCommonCmd(apRec: PAnsiChar; aSize: Word);

    property checked: Boolean read FChecked write FChecked;
  end;

implementation

uses
  uFunction,uSetting, uAlarmSystem, uDataACS;

{ TAlarmManager }

procedure TAlarmManager.AlertOnOff(status: Byte);
begin
  case status of
    0:
    begin
      try
        if FChecked = False then
        begin
          fAlarm.MediaPlayer1.Open;
          fAlarm.MediaPlayer1.AutoRewind := True;
          fAlarm.MediaPlayer1.Play;
          fAlarm.MediaPlayer1.Notify:= True;
        end
        else
          Exit;
      except
        on E:Exception do
          MessageDlg(E.Message,mtError,[mbOK],0);
      end;
      fAlarm.silence := True;
    end;
    1:
    begin
      try
        fAlarm.MediaPlayer1.Open;
        fAlarm.MediaPlayer1.Stop;
      finally
      end;
      fAlarm.MediaPlayer1.Notify := True;
      fAlarm.silence := False;
    end;
  end;
end;

constructor TAlarmManager.Create;
begin
  FListener   := TListeners.Create;

  FOnThreadData_Running := TTimer.Create(nil);
  FOnThreadData_Running.Interval := 500;
  FOnThreadData_Running.OnTimer := OnThreadRunning;
  FOnThreadData_Running.Enabled := False;

  FCurrentDataIndex := 0;

  FRoleName := Setting.Role;
end;

destructor TAlarmManager.Destroy;
begin
  FListener.Free;
end;

procedure TAlarmManager.NetEventInstructorCommonCmd(apRec: PAnsiChar;
  aSize: Word);
var
  rec : ^R_Common_Instr_Command;
  i,aCount : integer;
begin
  rec := @apRec^;

  case rec.CommandID of
    C_ORD_FREEZE_APP :
    begin
      fAlarm.Enabled := False;
    end;

    C_ORD_UNFREEZE_APP :
    begin
      fAlarm.Enabled := True;
    end;
  end;
end;

procedure TAlarmManager.NetEvent_ACSCommonCmd(apRec: PAnsiChar; aSize: Word);
var
  rec: ^R_Common_ACS_Command;
  aTempData  : TACSData;
  stateAlarm : TAlarmState;
begin
  rec := @apRec^;

  stateAlarm := TAlarmState.Create;
  aTempData  := TACSData.Create;

  if rec.Status = 1 then
  begin
    stateAlarm.statusRec := rec.Status;
    AlertOnOff(rec.Status);
    FChecked := False;

    fAlarm.tmrFlashing.Enabled := False;
    case fAlarm.flag of
      1: fAlarm.imgFire.BitmapIndex := 1;
      2: fAlarm.imgFault.BitmapIndex := 1;
      3:
      begin
        fAlarm.imgFire.BitmapIndex := 1;
        fAlarm.imgFault.BitmapIndex := 1;
      end;
    end;

    fAlarm.SetAlarmOff(stateAlarm);
  end
  else
  begin
    case rec.AlarmID of
      1,2,3:
      begin
        aTempData := SysAlarm.Database.GetAlarmMsgGRM(rec.AlarmID);

        stateAlarm.alarmMessage := aTempData.alarmMessage;
        stateAlarm.alarmMessageGRM := aTempData.alarmMessageGRM;
      end;
    end;

    case rec.AlarmID of
      1, 2, 3 :
      begin
        aTempData := SysAlarm.Database.GetLocationByRoomID(rec.RoomID);
        stateAlarm.sandiRuangan := aTempData.sandiRuangan;
        stateAlarm.deck   := aTempData.deck;
        stateAlarm.lokasi := aTempData.lokasi;
        stateAlarm.lokasiGRM := aTempData.lokasiGRM;
      end;
    end;

    case rec.FaultID of
      1..11 :
      begin
        aTempData := SysAlarm.Database.GetFaultMsgGRM(rec.FaultID);

        stateAlarm.faultMessage := aTempData.faultMessage;
        stateAlarm.faultMessageGRM := aTempData.faultMessageGRM;
      end;
    end;

    case rec.FaultID of
      3, 9, 10 :
      begin
        aTempData := SysAlarm.Database.GetLocationByRoomID(rec.RoomID);
        stateAlarm.sandiRuangan := aTempData.sandiRuangan;
        stateAlarm.deck   := aTempData.deck;
        stateAlarm.lokasi := aTempData.lokasi;
        stateAlarm.lokasiGRM := aTempData.lokasiGRM;
      end;
    end;

    if fAlarm.SpeedButtonImage5.ImageIndex = 1 then
    begin
      AlertOnOff(1);
      checked := False;
      fAlarm.silence := False;
    end
    else
    begin
      AlertOnOff(rec.Status);
      FChecked := True;
      fAlarm.silence := True;
    end;

    fAlarm.ftime := 8;
    stateAlarm.scenTime := rec.SimTime;

    fAlarm.AddAlarm(stateAlarm);
  end;
end;

procedure TAlarmManager.OnThreadRunning(Sender: TObject);
begin
//
end;

end.
