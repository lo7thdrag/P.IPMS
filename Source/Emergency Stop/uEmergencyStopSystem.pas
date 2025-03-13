unit uEmergencyStopSystem;

interface

uses uEntity, uLIstener, uCommonSystem, Classes, uDataType, uTCPClient, uEmergencyStopNetwork, uEmergencyStopManager,
      Dialogs;

type
  TEmergencyStopSystem = class
  private

    FEmergencyStopNetwork : TEmergencyStopNetwork;
    FEmergencyStopManager : TEmergencyStopManager;
    FLIstener             : TListeners;

    procedure NetworkEventAssignment;

  public
    constructor Create;
    destructor Destroy;override;

    procedure sendStatusDG(Name: Integer; val:Boolean);
    procedure sendServoLampStatus(nameID : Integer ; status : Boolean);
    property EmergencyStopNetwork : TEmergencyStopNetwork read FEmergencyStopNetwork;
    property EmergencyStopManager : TEmergencyStopManager read FEmergencyStopManager;
  end;

var
  EmergencyStopSystem : TEmergencyStopSystem;

implementation

{ TPMSSystem }

constructor TEmergencyStopSystem.Create;
begin
  FEmergencyStopNetwork := TEmergencyStopNetwork.Create;
  FEmergencyStopManager := TEmergencyStopManager.Create;
  FLIstener := TListeners.Create;

  NetworkEventAssignment;

  FEmergencyStopNetwork.StartNetwork;
end;

destructor TEmergencyStopSystem.Destroy;
begin
  FLIstener.Free;

  FEmergencyStopNetwork.StopNetwork;
  FEmergencyStopNetwork.Free;
  FEmergencyStopNetwork.Destroy;

  inherited;
end;

procedure TEmergencyStopSystem.sendServoLampStatus(nameID: Integer;
  status: Boolean);
var
   recCmd : R_ServoAndLamp_Command;
begin
  recCmd.nameID := nameID;
  recCmd.status := status;

  EmergencyStopNetwork.InstrukturSocket.SendData(C_Servo_COMMAND , @recCmd);
end;

procedure TEmergencyStopSystem.sendStatusDG(Name: Integer; val: Boolean);
var
  recCmd : R_Common_EmergencyStop_Command;
begin
  if Name = 0 then recCmd.GenId :='Generator 1' else
  if Name = 1 then recCmd.GenId :='Generator 2' else
  if Name = 2 then recCmd.GenId :='Generator 3' else
  if Name = 3 then recCmd.GenId :='Generator 4';

  recCmd.ValueBool := val;
  EmergencyStopNetwork.ControllerSocket.SendData(C_EMERGENCYSTOP_COMMAND, @recCmd);
end;

procedure TEmergencyStopSystem.NetworkEventAssignment;
var
  client : TTCPClient;
begin
  { set all network event here.. as simengine client }
  client := FEmergencyStopNetwork.AsClients.Get('AsControllerClient');
  if Assigned(client) then
  begin
    {kirim paket dari emergencystop ke controller}
    client.RegisterProcedure(C_EMERGENCYSTOP_COMMAND, nil, SizeOf(R_Common_EmergencyStop_Command));

    {terima dari controler}
    client.RegisterProcedure(C_PMS_COMMAND, EmergencyStopManager.NetEventControllerCommonCmd, SizeOf(R_Common_EmergencyStop_Command));
  end;

  { set all network event here.. as simengine client }
  client := FEmergencyStopNetwork.AsClients.Get('AsInstructorClient');
  if Assigned(client) then
  with  client do
  begin
    {register paket dr Emergencystop k instructor}
    RegisterProcedure(C_INSTRUCTOR_COMMAND,  EmergencyStopManager.NetEventInstructorCommonCmd, SizeOf(R_Common_Instr_Command));
    RegisterProcedure(C_Servo_COMMAND, nil, SizeOf(R_ServoAndLamp_Command));
  end;
end;

end.
