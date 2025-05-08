unit uMCRMachineRightSystem;

interface

uses uMCRMachineRightNetwork, uListener, uTCPClient, uDataType, ExtCtrls, uFreezeFrom, SysUtils,
  Forms, IniFiles, Classes;

type

  TMCRMachineRightSystem = class
  private

    FMCRMachineRightNetwork  : TMCRMachineRightNetwork;
    FLIstener    : TListeners;
    FFreezed     : boolean;

    procedure NetworkEventAssignment;

    {Receive Diesel Generator state from Engine}
    procedure NetEventMCRMachineRightCommand(apRec: PAnsiChar; aSize: Word);

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

    property Network : TMCRMachineRightNetwork read FMCRMachineRightNetwork;
    property Listener :TListeners read FListener;
    property Freezed : boolean read FFreezed write SetFreezed;

  end;

var
  MCRMachineRightSystem : TMCRMachineRightSystem;

implementation

uses
  uMainForm;

{ TMCRMachineLeftSystem }

constructor TMCRMachineRightSystem.Create;
begin
  FMCRMachineRightNetwork := TMCRMachineRightNetwork.Create;
  FLIstener := TListeners.Create;

  LoadSettingForm('..\bin\setting.ini');

  NetworkEventAssignment;

  FMCRMachineRightNetwork.StartNetwork;

end;

destructor TMCRMachineRightSystem.Destroy;
begin

  FLIstener.Free;

  FMCRMachineRightNetwork.StopNetwork;
  FMCRMachineRightNetwork.Free;

  inherited;
end;

procedure TMCRMachineRightSystem.LoadSettingForm(filepath: string);
var
  inifile : TIniFile;
  tempstring : TStringList;
begin
  inifile := TIniFile.Create(filepath);
  tempstring := TStringList.Create;

  inifile.ReadSection('Form MCR Machine Right', tempstring);

  inifile.Free;
  tempstring.Free;
end;

procedure TMCRMachineRightSystem.SetFreezed(const Value: boolean);
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
procedure TMCRMachineRightSystem.NetEventInstructorCommonCmd(apRec: PAnsiChar; aSize: Word);
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
    epBoardAlarmLampKanan:
    begin
      {$REGION ' Set Alarm Indicator '}

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
    epBoardTelegramKanan :
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

procedure TMCRMachineRightSystem.NetEventMCRMachineRightCommand(apRec: PAnsiChar; aSize: Word);
var
  rec: ^R_Common_PCS_Command;
begin

  rec := @apRec^;

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

procedure TMCRMachineRightSystem.NetworkEventAssignment;
var
  client : TTCPClient;
begin
  { set all network event here.. as simengine client }
  client := FMCRMachineRightNetwork.AsClients.Get('AsSimEngineClient');
  if Assigned(client) then
  begin
    with  client do
    begin
      RegisterProcedure(C_PCS_COMMAND, NetEventMCRMachineRightCommand, SizeOf(R_Common_PCS_Command));
    end;
  end;

  { set all network event here.. as instructor client}
  client := FMCRMachineRightNetwork.AsClients.Get('AsInstructorClient');
  if Assigned(client) then
  begin
    with  client do
    begin
      RegisterProcedure(C_INSTRUCTOR_COMMAND, NetEventInstructorCommonCmd, SizeOf(R_Common_Instr_Command));
      RegisterProcedure(C_TELEGRAM_COMMAND, nil, SizeOf(R_Common_Telegram_Command));
    end;
  end;

   client := FMCRMachineRightNetwork.AsClients.Get('AsControllerClient');
   if Assigned(client) then
   begin
     with client do
     begin
       RegisterProcedure(C_PUMP_COMMAND, nil, SizeOf(R_Common_PumpStatus_Command));
     end;
   end;
end;

procedure TMCRMachineRightSystem.sendPumpStatus(sideId: byte; pumpId, stadeId: Integer; status: Boolean);
var
  recCmd : R_Common_PumpStatus_Command;
begin
  recCmd.SideId   := sideId;
  recCmd.PumpId   := pumpId;
  recCmd.StadeId  := stadeId;
  recCmd.ValueBool := status;
  Network.MCRMachineRightControllerSocket.SendData(C_PUMP_COMMAND, @recCmd);
end;

procedure TMCRMachineRightSystem.sendTelegram(ProsId: E_PropsID; i: Integer; val: Boolean; Status: Byte);
var
  recCmd : R_Common_Telegram_Command;
begin
  recCmd.CommandID := ProsId;
  recCmd.ValueInt  := i;
  recCmd.ValueBool := val;
  recCmd.ValueByte := Status;
  Network.MCRMachineRightAlarmSocket.SendData(C_TELEGRAM_COMMAND, @recCmd);
end;

end.
