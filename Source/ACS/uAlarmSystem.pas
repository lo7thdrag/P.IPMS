unit uAlarmSystem;

interface

uses
  uDatabase, uAlarmManager, uAlarmNetwork, uDataType, uListener,
  SysUtils;

type
  TAlarmSystem = class
  private

    FIPMSDatabase  : TIPMSDatabase;
    FAlarmManager  : TAlarmManager;
    FAlarmNetwork  : TAlarmNetwork;
    FListener      : TListeners;

    procedure NetworkEventAssignment;

  public
    procedure sendStatusACS(PropID: E_PropsID; indx: Byte);

    constructor Create;
    destructor  Destroy; override;

    property Alarm    : TAlarmManager read FAlarmManager;
    property Network  : TAlarmNetwork read FAlarmNetwork;
    property Database : TIPMSDatabase read FIPMSDatabase;
    property EventManager : TAlarmManager read FAlarmManager;

    property Listeners: TListeners read FListener;
  end;

var
  SysAlarm : TAlarmSystem;

implementation

uses uTCPClient;

{ TAlarmSystem }

constructor TAlarmSystem.Create;
begin
  FIPMSDatabase := TIPMSDatabase.Create;
  FAlarmManager := TAlarmManager.Create;
  FAlarmNetwork := TAlarmNetwork.Create;
  FListener     := TListeners.Create;

  NetworkEventAssignment;
end;

destructor TAlarmSystem.Destroy;
begin
  FListener.Free;
  FAlarmManager.Free;
  FIPMSDatabase.Free;
  FAlarmNetwork.Free;

  inherited;
end;

procedure TAlarmSystem.NetworkEventAssignment;
var
  client : TTCPClient;
begin

  { set all network event here.. as client }
  client := FAlarmNetwork.AsClients.Get('AsInstructorClient');
  if Assigned(client) then
  with  client do
  begin
      RegisterProcedure(C_FIRE_ACS_COMMAND, Alarm.NetEvent_ACSCommonCmd,
            SizeOf(R_Common_ACS_Command));

      RegisterProcedure(C_INSTRUCTOR_COMMAND, EventManager.NetEventInstructorCommonCmd, SizeOf(R_Common_ACS_Command));
  end;
end;

procedure TAlarmSystem.sendStatusACS(PropID: E_PropsID; indx: Byte);
var
  recCmd : R_Common_ACS_Command;
begin
  recCmd.CommandID := PropID;
  recCmd.Status := indx;
  Network.AlarmSocket.SendData(C_FIRE_ACS_COMMAND, @recCmd);
end;

end.
