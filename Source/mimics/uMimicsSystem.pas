unit uMimicsSystem;

interface

uses
  uDatabase, uMimicsManager, uMimicsNetwork, uDataType, uListener,
  SysUtils;

type
  TMimicSystem = class
  private

    FIPMSDatabase  : TIPMSDatabase;
    FMimicManager  : TMimicManager;
    FMimicNetwork  : TMimicsNetwork;
    FListener      : TListeners;
    FFreedDatabase : Boolean;

    procedure NetworkEventAssignment;

  public
    constructor Create;overload;
    constructor Create(aDatabase : TIPMSDatabase);overload;
    destructor  Destroy; override;

    property Mimic    : TMimicManager read FMimicManager;
    property Network  : TMimicsNetwork read FMimicNetwork;
    property Database : TIPMSDatabase read FIPMSDatabase;

    property Listeners: TListeners read FListener;
  end;

var
  SysMimics : TMimicSystem;

implementation

uses uTCPClient;

{ TMimicSystem }

constructor TMimicSystem.Create;
begin
  FFreedDatabase:= True;
  FIPMSDatabase := TIPMSDatabase.Create;
  FMimicManager := TMimicManager.Create(FIPMSDatabase);
  FMimicNetwork := TMimicsNetwork.Create;
  FListener     := TListeners.Create;

  NetworkEventAssignment;
end;

constructor TMimicSystem.Create(aDatabase: TIPMSDatabase);
begin
  FFreedDatabase:= False;
  FIPMSDatabase := aDatabase;
  FMimicManager := TMimicManager.Create(FIPMSDatabase);
  FMimicNetwork := TMimicsNetwork.Create;
  FListener     := TListeners.Create;

  NetworkEventAssignment;
end;

destructor TMimicSystem.Destroy;
begin
  if FFreedDatabase then
    FreeAndNil(FIPMSDatabase);

  FListener.Free;
  FMimicManager.Free;
  FMimicNetwork.Free;

  inherited;
end;

procedure TMimicSystem.NetworkEventAssignment;
var
  client : TTCPClient;
begin
  { set all network event here.. as client }
  client := FMimicNetwork.AsClients.Get('AsControllerClient');

  if Assigned(client) then
  begin
    with  client do
    begin

      RegisterProcedure(C_BULK_ELEMENT_COMMAND,
        Mimic.NetEvent_BulkElmtCommonCmd, SizeOf(R_Bulk_Common_Elmt_Command));

      RegisterProcedure(C_INSTRUCTOR_COMMAND,
        {Mimic.NetEvent_ScenarioConditionCmd,} nil,
        SizeOf(R_Common_ScenarioCondition_Command));

      {register paket dr mimic k controller}
      RegisterProcedure(C_MIMICS_COMMAND, Mimic.NetEvent_ControlCommonCmd,
        SizeOf(R_Common_Mimic_Command));
      RegisterProcedure(C_VENTSTATUS_COMMAND, nil,
        SizeOf(R_Common_VentStatus_Command));

      RegisterProcedure(C_FUNCTIONALLOCATION_COMMAND,
        Mimic.NetEvent_FuncAllocCommand, SizeOf(R_Common_FuncAlloc_Command));
    end;
  end;

  { set all network event here.. as client }
  client := FMimicNetwork.AsClients.Get('AsInstructorClient');

  if Assigned(client) then
  begin
    with  client do
    begin
      RegisterProcedure(C_INSTRUCTOR_COMMAND,
        Mimic.NetEvent_InstructorCommonCmd, SizeOf(R_Common_Instr_Command));

      RegisterProcedure(C_STATUS_CONTROL_INS_COMMAND, nil,
        SizeOf(R_Command_StatCtrl_Ins));
    end;
  end;
end;

end.
