unit uMainEngine2System;

interface

uses uMainEngine2Network, uListener, uTCPClient, uDataType, ExtCtrls, uFreezeFrom, SysUtils,
  Forms, IniFiles, Classes;

type

 TMainEngine2System = class
  private

    FMainEngine2Network : TMainEngine2Network;
    FLIstener   : TListeners;
    FFreezed    : Boolean;

    FIdFormMainEngine2 : string;

    {Screen Monitor}
    FIdPosisi : string;
    FIdNumber : Integer;
    FIdScreenGauges : Integer;
    FIdScreenPmsHmi : Integer;
    FIdScreenSignaling : Integer;

    procedure NetworkEventAssignment;

    {Receive Main Engine state from Engine}
    procedure NetEventMainEngine2Command(apRec: PAnsiChar; aSize: Word);

    {Receive command from instructur}
    procedure NetEventMainEngine2CommonCmd(apRec: PAnsiChar; aSize: Word);

    procedure LoadSettingForm(filepath: string);
    procedure SetFreezed(const Value: boolean);

  public
    FFormFreezed : array[0..2] of TfrmFreeze;

    constructor Create;
    destructor Destroy;override;

    procedure StartStopEngine(aValue : Boolean);
    procedure vrtryswtchRemotePS(aPortStarboard: string);

    procedure sendPumpStatus(sideId : byte; pumpId, stadeId: Integer; status: Boolean);

    property Network : TMainEngine2Network read FMainEngine2Network;
    property Listener :TListeners read FListener;
    property Freezed : boolean read FFreezed write SetFreezed;

    property IdFormMainEngine2: string read FIdFormMainEngine2 write FIdFormMainEngine2;
    property IdPosisi: string read FIdPosisi write FIdPosisi;
    property IdNumber: Integer read FIdNumber write FIdNumber;
    property IdScreenGauges: Integer read FIdScreenGauges write FIdScreenGauges;
    property IdScreenPmsHmi: Integer read FIdScreenPmsHmi write FIdScreenPmsHmi;
    property IdScreenSignaling: Integer read FIdScreenSignaling write FIdScreenSignaling;
  end;

var
  MainEngine2System : TMainEngine2System;

implementation

uses
  ufrmSignalingLightME2, ufrmMenu, ufrmSetofPressureGaugesME2;

{TMainEngine2System}

constructor TMainEngine2System.Create;
begin
  FMainEngine2Network := TMainEngine2Network.Create;
  FLIstener := TListeners.Create;

  LoadSettingForm('..\bin\setting.ini');

  NetworkEventAssignment;

  FMainEngine2Network.StartNetwork;
end;

destructor TMainEngine2System.Destroy;
begin
  FLIstener.Free;

  FMainEngine2Network.StopNetwork;
  FMainEngine2Network.Free;

  inherited;
end;

procedure TMainEngine2System.LoadSettingForm(filepath: string);
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

procedure TMainEngine2System.SetFreezed(const Value: boolean);
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

procedure TMainEngine2System.StartStopEngine(aValue: Boolean);
var
  recCmd : R_Common_PCS_Command;
begin
  recCmd.ValueBool := aValue;

  Network.MainEngine2ControllerSocket.SendData(C_PCS_COMMAND,@recCmd);
end;

{ fungsi untuk menangani event dari jaringan untuk PCSCommand }
procedure TMainEngine2System.NetEventMainEngine2CommonCmd(apRec: PAnsiChar; aSize: Word);
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

procedure TMainEngine2System.NetEventMainEngine2Command(apRec: PAnsiChar; aSize: Word);
var
  rec: ^R_Common_PCS_Command;
begin

  rec := @apRec^;

  case rec.CommandPropsID of
    epPCSMERunningHour:
    begin
      FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueInt)
    end;
  end;
end;

procedure TMainEngine2System.NetworkEventAssignment;
var
  client : TTCPClient;
begin
  { set all network event here.. as simengine client }
  client := FMainEngine2Network.AsClients.Get('AsSimEngineClient');
  if Assigned(client) then
  begin
    with  client do
    begin
      RegisterProcedure(C_PCS_COMMAND, NetEventMainEngine2Command, SizeOf(R_Common_PCS_Command));
    end;
  end;

  { set all network event here.. as instructor client}
  client := FMainEngine2Network.AsClients.Get('AsInstructorClient');
  if Assigned(client) then
  begin
    with  client do
    begin
      RegisterProcedure(C_INSTRUCTOR_COMMAND, NetEventMainEngine2Command, SizeOf(R_Common_PCS_Command));
    end;
  end;

   client := FMainEngine2Network.AsClients.Get('AsControllerClient');
   if Assigned(client) then
   begin
     with client do
     begin
      {kirim paket dari ME ke controller}
       RegisterProcedure(C_PCS_COMMAND, nil, SizeOf(R_Common_PCS_Command));
     end;
   end;
end;

procedure TMainEngine2System.sendPumpStatus(sideId: Byte; pumpId: Integer; stadeId: Integer; status: Boolean);
var
  recCmd : R_Common_PumpStatus_Command;
begin
  recCmd.SideId    := sideId;
  recCmd.PumpId    := pumpId;
  recCmd.StadeId   := stadeId;
  recCmd.ValueBool := status;
  Network.MainEngine2ControllerSocket.SendData(C_PUMP_COMMAND, @recCmd);
end;

procedure TMainEngine2System.vrtryswtchRemotePS(aPortStarboard: string);
var
  recCmd : R_Common_PCS_Command;
begin
  recCmd.PortStaboardID := aPortStarboard;
  recCmd.CommandPropsID := epPCSMERemoteControl;
  recCmd.CommandID      := C_ORD_ME_REMOTEAUTO;
  recCmd.ValueBool      := True;

  Network.MainEngine2ControllerSocket.SendData(C_PCS_COMMAND,@recCmd);
end;

end.
