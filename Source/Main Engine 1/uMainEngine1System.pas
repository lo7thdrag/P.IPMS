unit uMainEngine1System;

interface

uses uMainEngine1Network, uListener, uTCPClient, uDataType, ExtCtrls, uFreezeFrom, SysUtils,
  Forms, IniFiles, Classes;

type

  TMainEngine1System = class
  private

    FMainEngine1Network : TMainEngine1Network;
    FLIstener   : TListeners;
    FFreezed    : Boolean;

    FIdFormMainEngine1 : string;

    procedure NetworkEventAssignment;

    {Receive Main Engine state from Engine}
    procedure NetEventMainEngine1Command(apRec: PAnsiChar; aSize: Word);

    {Receive command from instructur}
    procedure NetEventInstructorCommonCmd(apRec: PAnsiChar; aSize: Word);

    procedure LoadSettingForm(filepath: string);
    procedure SetFreezed(const Value: boolean);

  public
    FFormFreezed : array[0..2] of TfrmFreeze;

    constructor Create;
    destructor Destroy;override;

    procedure StartStopEngine(aValue : Boolean);

    procedure sendPumpStatus(sideId : byte; pumpId, stadeId: Integer; status: Boolean);

    property Network : TMainEngine1Network read FMainEngine1Network;
    property Listener :TListeners read FListener;
    property Freezed : boolean read FFreezed write SetFreezed;

    property IdFormMainEngine1: string read FIdFormMainEngine1 write FIdFormMainEngine1;
  end;

var
  MainEngine1System : TMainEngine1System;

implementation

uses
  ufrmSignalingLightME1, ufrmPMSDieselEngineSafetiesME1, ufrmSetofPressureGaugesME1;

{TMainEngine1System}

constructor TMainEngine1System.Create;
begin
  FMainEngine1Network := TMainEngine1Network.Create;
  FLIstener := TListeners.Create;

  LoadSettingForm('..\bin\setting.ini');

  NetworkEventAssignment;

  FMainEngine1Network.StartNetwork;
end;

destructor TMainEngine1System.Destroy;
begin
  FLIstener.Free;

  FMainEngine1Network.StopNetwork;
  FMainEngine1Network.Free;

  inherited;
end;

procedure TMainEngine1System.LoadSettingForm(filepath: string);
var
  inifile    : TIniFile;
  tempstring : TStringList;
begin
  inifile    := TIniFile.Create(filepath);
  tempstring := TStringList.Create;

  inifile.ReadSection('Form Main Engine 1', tempstring);

  FIdFormMainEngine1 := inifile.ReadString('Form Main Engine 1', tempstring[0],'Default');

  inifile.Free;
  tempstring.Free;
end;

procedure TMainEngine1System.SetFreezed(const Value: boolean);
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

procedure TMainEngine1System.StartStopEngine(aValue: Boolean);
var
  recCmd : R_Common_PMS_Command;
begin
  recCmd.GenSwitchID := IdFormMainEngine1;
  recCmd.CommandPropsID := epPMSGeneratorEngineRun;
  recCmd.ValueBool := aValue;

  Network.MainEngine1ControllerSocket.SendData(C_PMS_COMMAND,@recCmd);
end;

{ fungsi untuk menangani event dari jaringan untuk PCSCommand }
procedure TMainEngine1System.NetEventInstructorCommonCmd(apRec: PAnsiChar; aSize: Word);
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
end;

procedure TMainEngine1System.NetEventMainEngine1Command(apRec: PAnsiChar; aSize: Word);
var
  rec: ^R_Common_PMS_Command;
begin

  rec := @apRec^;

  if FIdFormMainEngine1 <> rec.GenSwitchID then
     Exit;

  case rec.CommandPropsID of
    epPMSMeasPowFailure:
    begin
      FLIstener.TriggerEvents(Self, epPMSMeasPowFailure, rec.ValueBool);
    end;
  end;
end;

procedure TMainEngine1System.NetworkEventAssignment;
var
  client : TTCPClient;
begin
  { set all network event here.. as simengine client }
  client := FMainEngine1Network.AsClients.Get('AsSimEngineClient');
  if Assigned(client) then
  begin
    with  client do
    begin
      RegisterProcedure(C_PCS_COMMAND, NetEventMainEngine1Command, SizeOf(R_Common_PCS_Command));
    end;
  end;

  { set all network event here.. as instructor client}
  client := FMainEngine1Network.AsClients.Get('AsInstructorClient');
  if Assigned(client) then
  begin
    with  client do
    begin
      RegisterProcedure(C_INSTRUCTOR_COMMAND, NetEventInstructorCommonCmd, SizeOf(R_Common_Instr_Command));
      RegisterProcedure(C_TELEGRAM_COMMAND, nil, SizeOf(R_Common_Telegram_Command));
      RegisterProcedure(C_Servo_COMMAND, nil, SizeOf(R_ServoAndLamp_Command));
    end;
  end;

   client := FMainEngine1Network.AsClients.Get('AsControllerClient');
   if Assigned(client) then
   begin
     with client do
     begin
//       RegisterProcedure(C_PUMP_COMMAND, NetEventStatusThrottleCommand, SizeOf(R_Common_PanelThrottle_Command));
       RegisterProcedure(C_PUMP_COMMAND, nil, SizeOf(R_Common_PumpStatus_Command));
     end;
   end;
end;

procedure TMainEngine1System.sendPumpStatus(sideId: Byte; pumpId: Integer; stadeId: Integer; status: Boolean);
var
  recCmd : R_Common_PumpStatus_Command;
begin
  recCmd.SideId   := sideId;
  recCmd.PumpId   := pumpId;
  recCmd.StadeId  := stadeId;
  recCmd.ValueBool := status;
  Network.MainEngine1ControllerSocket.SendData(C_PUMP_COMMAND, @recCmd);
end;

end.
