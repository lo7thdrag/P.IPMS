unit uThreadTimer;

interface

uses
  Classes, Windows, Vcl.ExtCtrls;

type

//==============================================================================
  TRunningEvent = procedure(const dt: double) of object;

  TCustomTimer = class(TTimer)
  private
    FLastPerfCount,
    FPerfFreq: Int64;

    FOnRunning: TRunningEvent;

    procedure DoByMySelf(Sender: TObject);

  public
    constructor Create;
    destructor Destroy; override;

    property OnRunning: TRunningEvent read FOnRunning write FOnRunning;

  end;

  TMSTimer = class(TThread)
  private
    FLastPerfCount,
      FPerfFreq: Int64;

    function GetEnabled: boolean;
    procedure SetEnabled(const Value: boolean);

  protected
    FInterval: Word; // millisecond;
    FOnTimer: TNotifyEvent;
    FOnRunning: TRunningEvent;

    procedure SetInterval(const Value: Word);  // millisecond

    procedure Execute; override;
    procedure DoByMySelf; virtual;

  public
    constructor Create;
    destructor Destroy; override;

  public

    property OnRunning: TRunningEvent read FOnRunning write FOnRunning;

    property OnTimer: TNotifyEvent read FOnTimer write FOnTimer;

    property Interval: Word read FInterval write SetInterval;

    property Enabled: boolean read GetEnabled write SetEnabled;

  end;

  TZTimer = class(TMSTimer)
  protected
    procedure Execute; override;
  end;


implementation

//==============================================================================
{ TCustomTimer }

constructor TCustomTimer.Create;
begin
  inherited Create(nil);
  Enabled:= False;

//  timeBeginPeriod(10);
  Interval := 10;
  OnTimer:= DoByMySelf;

  QueryPerformanceFrequency(FPerfFreq);
  QueryPerformanceCounter(FLastPerfCount);

end;

destructor TCustomTimer.Destroy;
begin
  FOnRunning := nil;
  OnTimer:= nil;

//  timeEndPeriod(10);
  inherited;
end;

procedure TCustomTimer.DoByMySelf(Sender: TObject);
var
  Count: Int64;
  Sec: double;
begin
  QueryPerformanceCounter(Count);
  Sec := (Count - FLastPerfCount) / FPerfFreq;
  FLastPerfCount := Count;
  if Assigned(FOnRunning) then begin
    FOnRunning(Sec); // detik.
  end;
end;

//==============================================================================
{ TMSTimer }

constructor TMSTimer.Create;
begin

//  timeBeginPeriod(10);
  FInterval := 10;

  QueryPerformanceFrequency(FPerfFreq);
  QueryPerformanceCounter(FLastPerfCount);

  inherited Create(TRUE);
end;

destructor TMSTimer.Destroy;
begin
  FOnTimer := nil;
  FOnRunning := nil;

//  timeEndPeriod(10);
  inherited;
end;

procedure TMSTimer.DoByMySelf;
var
  Count: Int64;
  Sec: double;
begin
  QueryPerformanceCounter(Count);
  Sec := (Count - FLastPerfCount) / FPerfFreq;
  FLastPerfCount := Count;
  if Assigned(FOnRunning) then begin
    FOnRunning(Sec); // detik.
  end;
end;

procedure TMSTimer.Execute;
begin
  while not Terminated do begin

    Synchronize(DoByMySelf);
//    Queue(DoByMySelf);

    Sleep(FInterval);
  end;
end;

procedure TMSTimer.SetInterval(const Value: Word);
begin
  FInterval := Value;
end;

function TMSTimer.GetEnabled: boolean;
begin
  result := not Suspended;
end;

procedure TMSTimer.SetEnabled(const Value: boolean);
begin
  if Value <> Suspended then Exit;
  Suspended := not Value;

  if Value then
    QueryPerformanceCounter(FLastPerfCount);
end;

{ TZTimer }

procedure TZTimer.Execute;
begin
  while not Terminated do begin
    DoByMySelf;

    Sleep(FInterval);
  end;

end;

end.
