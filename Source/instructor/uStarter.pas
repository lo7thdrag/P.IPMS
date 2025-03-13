unit uStarter;

interface

uses
  uERSystem, uMimicsSystem, uControllerSystem, uPCSSystem, SysUtils,
  uInstructorSystem;

procedure BeginSimulation;
procedure EndSimulation;

procedure StartNetwork;
procedure StopNetwork;

procedure SetAppFormat;

implementation

uses
  uSetting, uDatabase;

var
  FDatabase : TIPMSDatabase;

procedure StartNetwork;
begin
  InstructorSys.Network.StartNetwork;
  ERSystem.Network.StartNetwork;
  CtrlSystem.Network.StartNetwork;

  // bypass command from er system to ctrl system
  ERSystem.OnPCSCommand := CtrlSystem.Controller.ERCommand;
  ERSystem.OnPMSCommand := CtrlSystem.Controller.ERCommand;
  ERSystem.OnTankCommand := CtrlSystem.Controller.ERCommand;

  SysMimics.Network.StartNetwork;
  PCSSystem.Network.StartNetwork;
end;

procedure StopNetwork;
begin
  InstructorSys.Network.StopNetwork;
  ERSystem.Network.StopNetwork;
  CtrlSystem.Network.StopNetwork;
  SysMimics.Network.StopNetwork;
  PCSSystem.Network.StopNetwork;
end;

procedure BeginSimulation;
begin
  SetAppFormat;

  Setting := TSetting.Create;

  FDatabase := TIPMSDatabase.Create;
  FDatabase.ConnectDB;

  { Engine room system }
  ERSystem := TERSystem.Create(FDatabase);

  { controller system }
  CtrlSystem := TControllerlSystem.Create(FDatabase);

  { mimic system }
  SysMimics := TMimicSystem.create(FDatabase);
  SysMimics.Mimic.AsInstructor := True;

  {PCS System }
  PCSSystem := TPCSSystem.Create;

  { instructor system }
  InstructorSys := TInstructorSystem.Create(FDatabase);

end;

procedure EndSimulation;
begin
  StopNetwork;

  InstructorSys.Free;
  PCSSystem.Free;
  CtrlSystem.Free;
  ERSystem.Free;
  SysMimics.Free;

  Setting.Free;

  if Assigned(FDatabase) then
    FreeAndNil(FDatabase);

end;

procedure SetAppFormat;
begin

//  ShortDateFormat := 'yyyy-dd-mm';
//  LongDateFormat  := 'dddd mmmm yyyy';

//  ShortTimeFormat := 'hh:nn:ss';
//  LongTimeFormat := 'hh:mm:ss.zzz';
end;


end.
