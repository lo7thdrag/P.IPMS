unit uMCRMachineLeftSystem;

interface

uses uMCRMachineLeftNetwork, uListener, uTCPClient, uDataType, ExtCtrls, uFreezeFrom, SysUtils,
  Forms, IniFiles, Classes;

type

  TMCRMachineLeftSystem = class
  private

    FMCRMachineLeftNetwork  : TMCRMachineLeftNetwork;
    FLIstener    : TListeners;
    FFreezed     : boolean;

//    FIdFormDieselGenerator : String;

    procedure NetworkEventAssignment;

    {Receive Diesel Generator state from Engine}
    procedure NetEventMCRMachineLeftCommand(apRec: PAnsiChar; aSize: Word);

    {Receive command from instructur}
    procedure NetEventInstructorCommonCmd(apRec: PAnsiChar; aSize: Word);

    procedure LoadSettingForm(filepath: string);
    procedure SetFreezed(const Value: boolean);

  public
    FFormFreezed : array[0..2] of TfrmFreeze;

    constructor Create;
    destructor Destroy;override;

    procedure sendTelegram(ProsId : E_PropsID; i: Integer; val: Boolean; Status : Byte);
    procedure sendPumpStatus(sideId : byte; pumpId, stadeId: Integer; status: Boolean);

    property Network : TMCRMachineLeftNetwork read FMCRMachineLeftNetwork;
    property Listener :TListeners read FListener;
    property Freezed : boolean read FFreezed write SetFreezed;

//    property IdFormDieselGenerator: String read FIdFormDieselGenerator write FIdFormDieselGenerator;

  end;

var
  MCRMachineLeftSystem : TMCRMachineLeftSystem;

implementation

uses
  uMainForm;

{ TMCRMachineLeftSystem }

constructor TMCRMachineLeftSystem.Create;
begin
  FMCRMachineLeftNetwork := TMCRMachineLeftNetwork.Create;
  FLIstener := TListeners.Create;

  LoadSettingForm('..\bin\setting.ini');

  NetworkEventAssignment;

  FMCRMachineLeftNetwork.StartNetwork;

end;

destructor TMCRMachineLeftSystem.Destroy;
begin

  FLIstener.Free;

  FMCRMachineLeftNetwork.StopNetwork;
  FMCRMachineLeftNetwork.Free;

  inherited;
end;

procedure TMCRMachineLeftSystem.LoadSettingForm(filepath: string);
var
  inifile : TIniFile;
  tempstring : TStringList;
begin
  inifile := TIniFile.Create(filepath);
  tempstring := TStringList.Create;

  inifile.ReadSection('Form MCR Machine Left', tempstring);

//  FIdFormDieselGenerator := inifile.ReadString('Form DieselGenerator', tempstring[0],'Default');

  inifile.Free;
  tempstring.Free;
end;

procedure TMCRMachineLeftSystem.SetFreezed(const Value: boolean);
var
  setFreezed : Integer;
begin
  if FFreezed = Value then
    Exit;

  FFreezed := Value;
  if FFreezed then
  begin
    setFreezed := 1;
    FLIstener.TriggerEvents(Self,epPMSFreezed,setFreezed)
  end
  else
  begin
    setFreezed := 0;
    FLIstener.TriggerEvents(Self,epPMSFreezed,setFreezed);
  end;
end;

{ fungsi untuk menangani event dari jaringan untuk PCSCommand }
procedure TMCRMachineLeftSystem.NetEventInstructorCommonCmd(apRec: PAnsiChar; aSize: Word);
var
  rec: ^R_Common_Instr_Command;
  i,aCount : integer;
begin
  rec := @apRec^;

  case rec.CommandID of
    C_ORD_FREEZE_APP : Freezed := True;

    C_ORD_UNFREEZE_APP : Freezed := False;

    C_ORD_CLOSE_APP :
    begin
//      if servoID = 1 then
//        PCSSystem.sendServoLampStatus(C_ORD_SERVO_PS, False)
//      else if servoID = 3  then
//        PCSSystem.sendServoLampStatus(C_ORD_SERVO_SB, False);
    end;

  end;

  case E_PropsID(rec^.aProps) of
    epBoardAlarmLamp:
    begin
      {setAlarmLamp}

      for I := 0 to  Length(MainForm.FAlarmIndicator)- 1 do
      begin
        if rec.ID = (i+1) then  //penyesuaian arraynya>> mulai dari 0 sedangkan ID mulai dari 1
        begin
          MainForm.FAlarmIndicator[i] := rec.Value;
//          if rec.Value then
//           MainForm.AlarmStop := false;
        end;
      end;

    end;

    epBoardTelegramKiri :
    begin

      for I := 1 to 11 do
      begin
        if rec.ID = (i) then
        begin
          MainForm.FTelegrapIndicator[i] := rec.Value;
//          MainForm.tempIn := i;
//          MainForm.isInput := True;
//          MainForm.isFirst := False;

//          if rec.ValueByte = 1 then {Terima Pesan, status telegrap hrs membalas}
//            MainForm.Status  := 2
//
//          else if rec.ValueByte = 2 then {Terima Balasan, status telegrap siap mengirim lagi}
//            MainForm.Status  := 1;

//          MainForm.ProsId := epBoardTelegramKiri;
//          MainForm.setIndikator(i);
        end
        else
          MainForm.FTelegrapIndicator[i] := False;
        MainForm.FTempTelegrap[i] := False;
      end;
    end;

    epRudderIndicator :
    begin
//      for I := 0 to  Length(MainForm.FRudderIndicator)- 1 do
//      begin
//        if rec.ID = (i+1) then  //penyesuaian arraynya>> mulai dari 0 sedangkan ID mulai dari 1
//        begin
//          MainForm.FRudderIndicator[i] := rec.Value;
//          break;
//        end;
//      end;
    end;

  end;
end;

procedure TMCRMachineLeftSystem.NetEventMCRMachineLeftCommand(apRec: PAnsiChar; aSize: Word);
var
  rec: ^R_Common_PMS_Command;
begin

  rec := @apRec^;

//  if FIdFormDieselGenerator <> rec.GenSwitchID then
//    Exit;

  case rec.CommandID of
    epPMSMeasPowFailure:
    begin
      FLIstener.TriggerEvents(Self,epPMSMeasPowFailure,rec.ValueBool)
    end;
  end;
end;

procedure TMCRMachineLeftSystem.NetworkEventAssignment;
var
  client : TTCPClient;
begin
  { set all network event here.. as simengine client }
  client := FMCRMachineLeftNetwork.AsClients.Get('AsSimEngineClient');
  if Assigned(client) then
  begin
    with  client do
    begin
      RegisterProcedure(C_PCS_COMMAND, NetEventMCRMachineLeftCommand, SizeOf(R_Common_PCS_Command));
    end;
  end;

  { set all network event here.. as instructor client}
  client := FMCRMachineLeftNetwork.AsClients.Get('AsInstructorClient');
  if Assigned(client) then
  begin
    with  client do
    begin
      RegisterProcedure(C_INSTRUCTOR_COMMAND, NetEventInstructorCommonCmd, SizeOf(R_Common_Instr_Command));
      RegisterProcedure(C_TELEGRAM_COMMAND, nil, SizeOf(R_Common_Telegram_Command));
      RegisterProcedure(C_Servo_COMMAND, nil, SizeOf(R_ServoAndLamp_Command));
    end;
  end;

   client := FMCRMachineLeftNetwork.AsClients.Get('AsControllerClient');
   if Assigned(client) then
   begin
     with client do
     begin
//       RegisterProcedure(C_PUMP_COMMAND, NetEventStatusThrottleCommand, SizeOf(R_Common_PanelThrottle_Command));
       RegisterProcedure(C_PUMP_COMMAND, nil, SizeOf(R_Common_PumpStatus_Command));
     end;
   end;
end;

procedure TMCRMachineLeftSystem.sendPumpStatus(sideId: byte; pumpId, stadeId: Integer; status: Boolean);
var
  recCmd : R_Common_PumpStatus_Command;
begin
  recCmd.SideId   := sideId;
  recCmd.PumpId   := pumpId;
  recCmd.StadeId  := stadeId;
  recCmd.ValueBool := status;
  Network.MCRMachineLeftControllerSocket.SendData(C_PUMP_COMMAND, @recCmd);
end;

procedure TMCRMachineLeftSystem.sendTelegram(ProsId: E_PropsID; i: Integer; val: Boolean; Status: Byte);
var
  recCmd : R_Common_Telegram_Command;
begin
  recCmd.CommandID := ProsId;
  recCmd.ValueInt  := i;
  recCmd.ValueBool := val;
  recCmd.ValueByte := Status;
  Network.MCRMachineLeftAlarmSocket.SendData(C_TELEGRAM_COMMAND, @recCmd);
end;

end.
