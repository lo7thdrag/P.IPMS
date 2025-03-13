unit uERManager;

interface

uses uThreadTimer, uSteppers, uEngineRoom,
    uERNetwork, uVirtualTime, uListener;

type

  TERManager = class

  private

    FEngineThread : TMSTimer;
    FEngineRoom   : TEngineRoom;
    FVTimer       : TVirtualTime;

    procedure OnRunningThread (const aDelta : Double);

  public

    constructor Create;
    destructor  Destroy;override;

    procedure NetEvent_InstructorCommand(apRec: PAnsiChar; aSize: Word);

    property EngineRoom : TEngineRoom read FEngineRoom;


  end;

implementation

uses uDataType;

{ TERManager }

constructor TERManager.Create;
begin

  FEngineThread := TMSTimer.Create;
  FEngineThread.OnRunning := OnRunningThread;
  FEngineThread.Interval := 10;

  FEngineRoom := TEngineRoom.Create;

  FEngineThread.Enabled := true;

  FVTimer := TVirtualTime.Create;
  FVTimer.Reset;

end;

destructor TERManager.Destroy;
begin

  FEngineThread.Enabled := false;
  FEngineThread.OnRunning := nil;
  FEngineThread.Free;

  FEngineRoom.Free;

  inherited;
end;

procedure TERManager.NetEvent_InstructorCommand(apRec: PAnsiChar; aSize: Word);
var
  rec: ^R_Common_Instr_Command;
begin
  rec := @apRec^;

  case rec.CommandID of

    C_ORD_FREEZE_APP    : FEngineRoom.Freeze;
    C_ORD_UNFREEZE_APP  : FEngineRoom.UnFreeze;
  end;
end;

procedure TERManager.OnRunningThread(const aDelta: Double);
begin
  if not FEngineRoom.Freezed then
    FVTimer.IncreaseMillisecond(aDelta);

  FEngineRoom.Run(aDelta);
end;

end.
