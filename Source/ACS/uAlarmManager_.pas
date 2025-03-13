unit uAlarmManager;

interface

uses
  uListener, SysUtils;

type
  TAlarmManager = class
  private

    FListener      : TListeners;

    procedure NetworkEventAssignment;

  public
    constructor Create;
    destructor  Destroy; override;

    property Listeners: TListeners read FListener;
  end;

var
  AlarmMgr : TAlarmManager;

implementation

uses uAlarm, uTCPClient;

{ TMimicSystem }

constructor TAlarmManager.Create;
begin
  FListener     := TListeners.Create;

  NetworkEventAssignment;
end;

destructor TAlarmManager.Destroy;
begin
  FListener.Free;

  inherited;
end;

procedure TAlarmManager.NetworkEventAssignment;
var
  client : TTCPClient;
begin

  { set all network event here.. as client }
  client := FMimicNetwork.AsClients.Get('AsControllerClient');
  if Assigned(client) then
    with  client do
    begin
      RegisterProcedure(C_ELEMENTS_COMMAND, Mimic.NetEvent_ElmtCommonCmd,
              SizeOf(R_Common_ELmt_Command));
    end;

end;
end.
