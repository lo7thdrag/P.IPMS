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

    procedure NetworkEventAssignment;

    {Receive Diesel Generator state from Engine}
    procedure NetEventMCRMachineLeftCommand(apRec: PAnsiChar; aSize: Word);

    {Receive command from instructur}
    procedure NetEventInstructorCommonCmd(apRec: PAnsiChar; aSize: Word);

    procedure LoadSettingForm(filepath: string);
    procedure SetFreezed(const Value: boolean);

  public
    FFormFreezed : array[0..1] of TfrmFreeze;

    constructor Create;
    destructor Destroy;override;

    procedure sendTelegram(ProsId : E_PropsID; i: Integer; val: Boolean; Status : Byte);
    procedure sendPumpStatus(sideId : byte; pumpId, stadeId: Integer; status: Boolean);

    property Network : TMCRMachineLeftNetwork read FMCRMachineLeftNetwork;
    property Listener :TListeners read FListener;
    property Freezed : boolean read FFreezed write SetFreezed;

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

    end;
  end;

  case E_PropsID(rec^.aProps) of
    epBoardAlarmLamp:
    begin
      {$REGION ' Set Alarm Indicator '}

      if rec.Value then
      begin
        MainForm.silence := True;
        MainForm.mpAlarm.OnNotify := MainForm.mpAlarmNotify;
        MainForm.mpAlarm.Open;
        MainForm.mpAlarm.Play;
      end;

      for I := 0 to  Length(MainForm.FAlarmIndicator)- 1 do
      begin
        if rec.ID = (i+1) then  //penyesuaian arraynya>> mulai dari 0 sedangkan ID mulai dari 1
        begin
          MainForm.FAlarmIndicator[i] := rec.Value;
          MainForm.SetAlarmIndicator;
        end;
      end;

      {$ENDREGION}
    end;
    epRudderIndicator :
    begin
      {$REGION ' Set Pump Rudder Indicator '}

      for I := 0 to  Length(MainForm.FPumpRudderIndicator)- 1 do
      begin
        if rec.ID = (i+1) then  //penyesuaian arraynya>> mulai dari 0 sedangkan ID mulai dari 1
        begin
          MainForm.FPumpRudderIndicator[i] := rec.Value;
          MainForm.SetPumpRudderIndicator;
          break;
        end;
      end;

      {$ENDREGION}
    end;
    epBoardTelegramKiri :
    begin
      {$REGION ' Set Telegrap Indicator '}

      if rec.ValueByte = 1 then {Terima Pesan, status telegrap hrs membalas}
      begin
        MainForm.IdReceive := rec.ID;
        MainForm.TelegrapStatus := tsReply;
        MainForm.SetTelegrap;
      end

      else if rec.ValueByte = 2 then {Terima Balasan, status telegrap siap mengirim lagi}
      begin
        MainForm.IdReceive := rec.ID;
        MainForm.TelegrapStatus  := tsReceive;
        MainForm.SetTelegrap;
      end;

      {$ENDREGION}
    end;
  end;
end;

procedure TMCRMachineLeftSystem.NetEventMCRMachineLeftCommand(apRec: PAnsiChar; aSize: Word);
var
  rec: ^R_Common_PCS_Command;
begin

  rec := @apRec^;

  case rec.CommandPropsID of
    epPCSCPPPumpStandby1:
    begin
      if rec.PortStaboardID = C_PCS_CPP_PORTS then
        FLIstener.TriggerEvents(Self,epPCSCPPPumpStandby1PS,rec.ValueBool)
      else if rec.PortStaboardID = C_PCS_CPP_STARBOARD then
        FLIstener.TriggerEvents(Self,epPCSCPPPumpStandby1SB,rec.ValueBool);
    end;
    epPCSCPPPumpStop1:
    begin
      if rec.PortStaboardID = C_PCS_CPP_PORTS then
        FLIstener.TriggerEvents(Self,epPCSCPPPumpStop1PS,rec.ValueBool)
      else if rec.PortStaboardID = C_PCS_CPP_STARBOARD then
        FLIstener.TriggerEvents(Self,epPCSCPPPumpStop1SB,rec.ValueBool);

    end;
    epPCSCPPPumpStart1:
    begin
      if rec.PortStaboardID = C_PCS_CPP_PORTS then
        FLIstener.TriggerEvents(Self,epPCSCPPPumpStart1PS,rec.ValueBool)
      else if rec.PortStaboardID = C_PCS_CPP_STARBOARD then
        FLIstener.TriggerEvents(Self,epPCSCPPPumpStart1SB,rec.ValueBool);
    end;

    epPCSCPPPumpStandby2:
    begin
      if rec.PortStaboardID = C_PCS_CPP_PORTS then
        FLIstener.TriggerEvents(Self,epPCSCPPPumpStandby2PS,rec.ValueBool)
      else if rec.PortStaboardID = C_PCS_CPP_STARBOARD then
        FLIstener.TriggerEvents(Self,epPCSCPPPumpStandby2SB,rec.ValueBool);
    end;
    epPCSCPPPumpStop2:
    begin
      if rec.PortStaboardID = C_PCS_CPP_PORTS then
        FLIstener.TriggerEvents(Self,epPCSCPPPumpStop2PS,rec.ValueBool)
      else if rec.PortStaboardID = C_PCS_CPP_STARBOARD then
        FLIstener.TriggerEvents(Self,epPCSCPPPumpStop2SB,rec.ValueBool);
    end;
    epPCSCPPPumpStart2:
    begin
      if rec.PortStaboardID = C_PCS_CPP_PORTS then
        FLIstener.TriggerEvents(Self,epPCSCPPPumpStart2PS,rec.ValueBool)
      else if rec.PortStaboardID = C_PCS_CPP_STARBOARD then
        FLIstener.TriggerEvents(Self,epPCSCPPPumpStart2SB,rec.ValueBool);
    end;
    epPCSCPPPumpAuto3:
    begin
      if rec.PortStaboardID = C_PCS_CPP_PORTS then
        FLIstener.TriggerEvents(Self,epPCSCPPPumpAuto3PS,rec.ValueBool)
      else if rec.PortStaboardID = C_PCS_CPP_STARBOARD then
        FLIstener.TriggerEvents(Self,epPCSCPPPumpAuto3SB,rec.ValueBool);
    end;
    epPCSCPPPumpStop3:
    begin
      if rec.PortStaboardID = C_PCS_CPP_PORTS then
        FLIstener.TriggerEvents(Self,epPCSCPPPumpStop3PS,rec.ValueBool)
      else if rec.PortStaboardID = C_PCS_CPP_STARBOARD then
        FLIstener.TriggerEvents(Self,epPCSCPPPumpStop3SB,rec.ValueBool);
    end;
    epPCSCPPPumpStart3:
    begin
      if rec.PortStaboardID = C_PCS_CPP_PORTS then
        FLIstener.TriggerEvents(Self,epPCSCPPPumpStart3PS,rec.ValueBool)
      else if rec.PortStaboardID = C_PCS_CPP_STARBOARD then
        FLIstener.TriggerEvents(Self,epPCSCPPPumpStart3SB,rec.ValueBool);
    end;

    epPCSMESetPointSpeed:
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
        FLIstener.TriggerEvents(Self,epPCSMEActualSpeedPS,rec.ValueDouble);
    end;

    epPCSGBSetpShaftSpeed:
    begin
      if rec.PortStaboardID = C_PCS_GB_PORTS then
        FLIstener.TriggerEvents(Self,epPCSGBShaftSpeedPS,rec.ValueDouble);
    end;

    epPCSCPPSetPointPitch:
    begin
      if rec.PortStaboardID = C_PCS_CPP_PORTS then
        FLIstener.TriggerEvents(Self,epPCSCPPActualPitchPS,Round(rec.ValueDouble));
    end;
  end;

  case rec.CommandID of
    //Rudder
    C_ORD_RUDDER:
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
        FLIstener.TriggerEvents(Self,epRudderValuePS,rec.ValueInt)
      else
      if rec.PortStaboardID = C_PCS_ME_STARBOARD then
        FLIstener.TriggerEvents(Self,epRudderValueSB,rec.ValueInt);
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
