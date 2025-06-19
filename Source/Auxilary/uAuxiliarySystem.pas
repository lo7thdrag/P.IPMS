unit uAuxiliarySystem;

interface

uses
  uAuxiliaryNetwork, uListener, uTCPClient, uDataType, ExtCtrls, uFreezeFrom, SysUtils,
  Forms, IniFiles, Classes;

type

  TAuxiliarySystem = class
  private

    FAuxiliaryNetwork  : TAuxiliaryNetwork;
    FLIstener    : TListeners;
    FFreezed     : boolean;

    FIdConsole : String;
    FIdScreen1 : Integer;
    FIdScreen2 : Integer;

    procedure NetworkEventAssignment;

    {Receive Auxiliary state from Engine}
    procedure NetEventAuxiliaryCommand(apRec: PAnsiChar; aSize: Word);

    {Receive command from instructur}
    procedure NetEventInstructorCommonCmd(apRec: PAnsiChar; aSize: Word);

    procedure LoadSettingForm(filepath: string);
    procedure SetFreezed(const Value: boolean);

  public
    FFormFreezed : array[0..1] of TfrmFreeze;

    procedure EngineRun(aIdentifier : string; aValue : Boolean);
    procedure PowerSupply(aIdentifier : string; aValue : Boolean);

    constructor Create;
    destructor Destroy;override;

    property Network : TAuxiliaryNetwork read FAuxiliaryNetwork;
    property Listener :TListeners read FListener;
    property Freezed : boolean read FFreezed write SetFreezed;

    property IdConsole: String read FIdConsole write FIdConsole;
    property IdScreen1: Integer read FIdScreen1 write FIdScreen1;
    property IdScreen2: Integer read FIdScreen2 write FIdScreen2;

  end;

var
  AuxiliarySystem : TAuxiliarySystem;

implementation

uses
  uMainForm;

{ TAuxiliarySystem }

constructor TAuxiliarySystem.Create;
begin
  FAuxiliaryNetwork := TAuxiliaryNetwork.Create;
  FLIstener := TListeners.Create;

  LoadSettingForm('..\bin\setting.ini');

  NetworkEventAssignment;

  FAuxiliaryNetwork.StartNetwork;

end;

destructor TAuxiliarySystem.Destroy;
begin

  FLIstener.Free;

  FAuxiliaryNetwork.StopNetwork;
  FAuxiliaryNetwork.Free;

  inherited;
end;

procedure TAuxiliarySystem.LoadSettingForm(filepath: string);
var
  inifile : TIniFile;
  tempstring : TStringList;
begin
  inifile := TIniFile.Create(filepath);
  tempstring := TStringList.Create;

  inifile.ReadSection('CONSOLE AUXILIARY', tempstring);

  FIdConsole := inifile.ReadString('CONSOLE AUXILIARY', tempstring[0],'AUXILIARY 1');
  FIdScreen1 := inifile.ReadInteger('CONSOLE AUXILIARY', tempstring[1],0);
  FIdScreen2 := inifile.ReadInteger('CONSOLE AUXILIARY', tempstring[2],1);

  inifile.Free;
  tempstring.Free;
end;

procedure TAuxiliarySystem.SetFreezed(const Value: boolean);
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

procedure TAuxiliarySystem.EngineRun(aIdentifier : string; aValue: Boolean);
var
  recCmd : R_Common_AUX_Command;
begin
  recCmd.PumpID := aIdentifier;
  recCmd.CommandPropsID := epAuxEngineRun;
  recCmd.ValueBool := aValue;

  Network.AuxiliaryControllerSocket.SendData(C_AUX_COMMAND,@recCmd);
end;

procedure TAuxiliarySystem.PowerSupply(aIdentifier : string; aValue : Boolean);
var
  recCmd : R_Common_AUX_Command;
begin
  recCmd.PumpID := aIdentifier;
  recCmd.CommandPropsID := epAuxPowerSupply;
  recCmd.ValueBool := aValue;

  Network.AuxiliaryControllerSocket.SendData(C_PMS_COMMAND,@recCmd);
end;

procedure TAuxiliarySystem.NetEventInstructorCommonCmd(apRec: PAnsiChar; aSize: Word);
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
end;

procedure TAuxiliarySystem.NetEventAuxiliaryCommand(apRec: PAnsiChar; aSize: Word);
var
  rec: ^R_Common_AUX_Command;
  i : Integer;

begin

  rec := @apRec^;

  i := frmMainForm.GetPumpID(rec.PumpID);

  if i = -1 then
    Exit;

  case rec.CommandPropsID of
    epAuxEngineRun :
    begin
      frmMainForm.pumpTemp[i].EngineRun := rec.ValueBool;
      FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueBool)
    end;
    epAuxPowerSupply :
    begin
      frmMainForm.pumpTemp[i].PowerSupply := rec.ValueBool;
      FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueBool)
    end;
  end;
end;

procedure TAuxiliarySystem.NetworkEventAssignment;
var
  client : TTCPClient;
begin
  { set all network event here.. as simengine client }
  client := FAuxiliaryNetwork.AsClients.Get('AsSimEngineClient');
  if Assigned(client) then
  begin
    with  client do
    begin
      RegisterProcedure(C_AUX_COMMAND, NetEventAuxiliaryCommand, SizeOf(R_Common_AUX_Command));
    end;
  end;

  { set all network event here.. as instructor client}
  client := FAuxiliaryNetwork.AsClients.Get('AsInstructorClient');
  if Assigned(client) then
  begin
    with  client do
    begin
      RegisterProcedure(C_INSTRUCTOR_COMMAND, NetEventInstructorCommonCmd, SizeOf(R_Common_Instr_Command));
    end;
  end;

   client := FAuxiliaryNetwork.AsClients.Get('AsControllerClient');
   if Assigned(client) then
   begin
     with client do
     begin
       client.RegisterProcedure(C_AUX_COMMAND, nil, SizeOf(R_Common_AUX_Command));
     end;
   end;
end;

end.
