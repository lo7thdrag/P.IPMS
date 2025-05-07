unit uMainEngine1System;

interface

uses uMainEngine1Network, uListener, uTCPClient, uDataType, ExtCtrls, uFreezeFrom, SysUtils,
  Forms, IniFiles, Classes;

type

  TMainEngine1System = class
    public
    FFormFreezed : array[0..2] of TfrmFreeze;

    constructor Create;
    destructor Destroy;override;

    {Receive Main Engine state from Engine}
    procedure NetEventMainEngine1Command(apRec: PAnsiChar; aSize: Word);

    {Kontrol untuk panel PCS touch screen dengan Engine}
    procedure RunningStart(aPortStaboard : String);
    procedure StoppedStop(aPortStaboard : String);
    procedure Clutch(aPortStaboard : string);
    procedure SafetiesStop(aPortStaboard: string);
    procedure EmergencyStop(aPortStaboard : String);

    procedure StartStopEngine(aValue : Boolean);

  private
    FMainEngine1Network : TMainEngine1Network;
    FLIstener   : TListeners;
    FFreezed    : Boolean;

    FIdPosisi : string;
    FIdNumber : Integer;
    FIdScreenGauges : Integer;
    FIdScreenPmsHmi : Integer;
    FIdScreenSignaling : Integer;

    procedure NetworkEventAssignment;

    {Receive command from MainEngine}
    procedure NetEventMainEngineCommonCmd(apRec: PAnsiChar; aSize: Word);

    procedure LoadSettingForm(filepath: string);
    procedure SetFreezed(const Value: boolean);

  public
    FEmergencyStopPS, FEmergencyStopSB : Boolean;

    property Network : TMainEngine1Network read FMainEngine1Network;
    property Listener :TListeners read FListener;
    property Freezed : boolean read FFreezed write SetFreezed;

    property IdPosisi: string read FIdPosisi write FIdPosisi;
    property IdNumber: Integer read FIdNumber write FIdNumber;
    property IdScreenGauges: Integer read FIdScreenGauges write FIdScreenGauges;
    property IdScreenPmsHmi: Integer read FIdScreenPmsHmi write FIdScreenPmsHmi;
    property IdScreenSignaling: Integer read FIdScreenSignaling write FIdScreenSignaling;

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

procedure TMainEngine1System.LoadSettingForm(filepath: string);
var
  inifile    : TIniFile;
  tempstring : TStringList;
begin
  inifile    := TIniFile.Create(filepath);
  tempstring := TStringList.Create;

  inifile.ReadSection('MAIN ENGINE', tempstring);

  FIdPosisi := inifile.ReadString('MAIN ENGINE', tempstring[0],'KANAN');
  FIdNumber := inifile.ReadInteger('MAIN ENGINE', tempstring[1],1);
  FIdScreenGauges := inifile.ReadInteger('MAIN ENGINE', tempstring[2],0);
  FIdScreenPmsHmi := inifile.ReadInteger('MAIN ENGINE', tempstring[3],1);
  FIdScreenSignaling := inifile.ReadInteger('MAIN ENGINE', tempstring[4],2);

  inifile.Free;
  tempstring.Free;
end;

destructor TMainEngine1System.Destroy;
begin
  FLIstener.Free;

  FMainEngine1Network.StopNetwork;
  FMainEngine1Network.Free;

  inherited;
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
  recCmd : R_Common_PCS_Command;
begin
//  recCmd.GenSwitchID := IdScreenSignaling;
//  recCmd.CommandPropsID := epPMSGeneratorEngineRun;
//  recCmd.ValueBool := aValue;

  Network.MainEngine1ControllerSocket.SendData(C_PMS_COMMAND,@recCmd);
end;

{ fungsi untuk menangani event dari jaringan untuk PCSCommand }
procedure TMainEngine1System.NetEventMainEngineCommonCmd(apRec: PAnsiChar; aSize: Word);
var
  rec: ^R_Common_PCS_Command;
  i,aCount : integer;
begin
  rec := @apRec^;

  case rec.CommandID of
    C_ORD_FREEZE_APP : Freezed := True;

    C_ORD_UNFREEZE_APP : Freezed := False;
  end;
end;

procedure TMainEngine1System.NetEventMainEngine1Command(apRec: PAnsiChar; aSize: Word);
var
  rec: ^R_Common_PCS_Command;

begin

  rec := @apRec^;

  case rec.CommandPropsID of
    epPCSMERunning:
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
        FLIstener.TriggerEvents(Self,epPCSMEPSRunStart,rec.ValueBool);
      end
      else
      if rec.PortStaboardID = C_PCS_ME_STARBOARD then
      begin
        FLIstener.TriggerEvents(Self,epPCSMESBRunStart,rec.ValueBool);
      end;
    end;

    epPCSMEClutched :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
        FLIstener.TriggerEvents(Self,epPCSMEClutched,rec.ValueBool);
      end
      else
      if rec.PortStaboardID = C_PCS_ME_STARBOARD then
      begin
        FLIstener.TriggerEvents(Self,epPCSMEClutched,rec.ValueBool);
      end;
    end;

    epPCSMELocalEmergencyStop :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
        FLIstener.TriggerEvents(Self,epPCSMELocalEmergencyStop,rec.ValueBool);
      end
      else
      if rec.PortStaboardID = C_PCS_ME_STARBOARD then
      begin
        FLIstener.TriggerEvents(Self,epPCSMELocalEmergencyStop,rec.ValueBool);
      end;
    end;

    epPCSMESafetyStop :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
        FLIstener.TriggerEvents(Self,epPCSMESafetyStop,rec.ValueBool);
      end
      else
      if rec.PortStaboardID = C_PCS_ME_STARBOARD then
      begin
        FLIstener.TriggerEvents(Self,epPCSMESafetyStop,rec.ValueBool);
      end;
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
    with client do
    begin
      RegisterProcedure(C_INSTRUCTOR_COMMAND, NetEventMainEngineCommonCmd, SizeOf(R_Common_Instr_Command));
    end;
  end;

   client := FMainEngine1Network.AsClients.Get('AsControllerClient');
   if Assigned(client) then
   begin
     with client do
     begin
      {kirim paket dari ME ke controller}
       RegisterProcedure(C_PCS_COMMAND, nil, SizeOf(R_Common_PCS_Command));
     end;
   end;
end;

procedure TMainEngine1System.RunningStart(aPortStaboard: String);
var
  recCmd : R_Common_PCS_Command;

begin
  recCmd.PortStaboardID := aPortStaboard;
  recCmd.CommandPropsID := epPCSMERunning;
  recCmd.CommandID      := C_ORD_ME_RUNSTART;
  recCmd.ValueBool      := True;

  Network.MainEngine1ControllerSocket.SendData(C_PCS_COMMAND,@recCmd);
end;

procedure TMainEngine1System.StoppedStop(aPortStaboard: String);
var
  recCmd : R_Common_PCS_Command;
begin
  recCmd.PortStaboardID := aPortStaboard;
  recCmd.CommandID := C_ORD_ME_STOP;

  Network.MainEngine1ControllerSocket.SendData(C_PCS_COMMAND,@recCmd);
end;

procedure TMainEngine1System.Clutch(aPortStaboard: string);
var
  recCmd : R_Common_PCS_Command;
begin
  recCmd.PortStaboardID := aPortStaboard;
  recCmd.CommandPropsID := epPCSMEClutched;
  recCmd.CommandID := C_ORD_GB_CLUTCH_ENGAGED;
  recCmd.ValueBool := True;

  Network.MainEngine1ControllerSocket.SendData(C_PCS_COMMAND,@recCmd);
end;

procedure TMainEngine1System.EmergencyStop(aPortStaboard: String);
var
  recCmd : R_Common_PCS_Command;
begin
  recCmd.PortStaboardID := aPortStaboard;
  recCmd.CommandPropsID := epPCSMELocalEmergencyStop;
  recCmd.CommandID := C_ORD_LEVER_EMERGENCYSTOP;
  recCmd.ValueBool := True;

  Network.MainEngine1ControllerSocket.SendData(C_PCS_COMMAND,@recCmd);
end;

procedure TMainEngine1System.SafetiesStop(aPortStaboard: string);
var
  recCmd : R_Common_PCS_Command;
begin
  recCmd.PortStaboardID := aPortStaboard;
  recCmd.CommandPropsID := epPCSMESafetyStop;
  recCmd.CommandID := C_ORD_LEVER_SHAFTSTOP;
  recCmd.ValueBool := True;

  Network.MainEngine1ControllerSocket.SendData(C_PCS_COMMAND,@recCmd);
end;
end.
