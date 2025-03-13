unit uGenerator;

interface

uses uEntity;

type

  TGenerator = class(TEntity)
  private
    FFlagStart,
    FIdleState : Integer;

    FFlagOff, FStopDelay,
    FStateOnDelay, FStartDelay,
    FEmergencyStartState : Double;

    FCosPhi: Double;
    FCurrent: Double;
    FVoltage: Double;
    FFrequency: Double;
    FSwitchFrequency: Double;
    FPower: Double;
    Fu, Fv, Fw : Double;

    FGeneratorMode : Integer;
    FGeneratorState : Integer;

    FIsFuelRunsOut: Boolean;
    FIsEngineRun : Boolean;
    FIsGeneratorSupplied : Boolean;
    FIsCBClosed : Boolean;
    FIsPreference : Boolean;
    FBusbar  : boolean;
    FRunHourState : Boolean;
    FEmergencyStop : Boolean;
    FEmergencyStart : Boolean;

    FIsNotStandby,
    FIsCanBusFailure,
    FIsMeasPowFailure,
    FIsDCPowFailure,
    FIsEngineAlarm,
    FIsShutDown,
    FFaultPageLed,
    FIsFailureCBClosed : Boolean;

    procedure SetPower(const Value: Double);
    procedure SetFrequency(const Value: Double);
    procedure SetSwitchFrequency(const Value: Double);
    procedure SetCurrent(const Value: Double);
    procedure SetVoltage(const Value: Double);
    procedure SetCosPhi(const Value: Double);
    procedure SetU(const Value: Double);
    procedure SetV(const Value: Double);
    procedure SetW(const Value: Double);

    procedure SetEngineRun(const Value: Boolean);
    procedure SetGeneratorSupplied(const Value : Boolean);
    procedure SetGeneratorState(const Value : Integer);
    procedure SetGeneratorMode(const Value : Integer);
    procedure SetFuelRunsOut(const Value : Boolean);
    procedure SetCBClosed(const Value : Boolean);
    procedure SetPreference(const Value : Boolean);
    procedure SetBusbar(const Value : Boolean);
    procedure SetRunHourState(const Value : Boolean);
    procedure SetEmergencyStop(const Value : Boolean);
    procedure SetEmergencyStart(const Value : Boolean);

    procedure SetNotStandby(const Value : Boolean);
    procedure SetCanBusFailure(const Value : Boolean);
    procedure SetMeasPowFailure(const Value : Boolean);
    procedure SetDCPowFailure(const Value : Boolean);
    procedure SetEngineAlarm(const Value : Boolean);
    procedure SetShutDown(const Value : Boolean);
    procedure SetFaultPageLed(const Value : Boolean);
    procedure SetFailureCBClosed(const Value : Boolean);

    procedure SetUVW(const ValU, ValV, ValW: Double);

  public
    IsConnectToMsb : Boolean;
    FrequencyState, VoltageState, CurrentState, PowerState, CosPhiState: Double;

    {---Dipakai jg oleh PMS System---}
    PowerMax : Double;    {batas atas ketika awal DG dinyalakan}
    CurrentMax: Double;
    VoltageMax : Double;


    constructor Create;override;
    destructor Destroy;override;

    procedure IncreaseSpeed;
    procedure DecreaseSpeed;

    procedure Run(const aDt : Double);override;

    procedure NormalStartGenerator(const aDt : Double);
    procedure EmergencyStartGenerator(const aDt : Double);
    procedure StopGenerator(const aDt : Double);
    procedure StateOnGenerator(const aDt : Double);
    procedure StateOffGenerator(const aDt : Double);
    procedure EmergencyStopGenerator(const aDt : Double);


    property Power : Double read FPower write SetPower;
    property Frequency : Double read FFrequency write SetFrequency;
    property SwitchFrequency : Double read FSwitchFrequency write SetSwitchFrequency;
    property Current : Double read FCurrent write SetCurrent;
    property Voltage : Double read FVoltage write SetVoltage;
    property CosPhi : Double read FCosPhi write SetCosPhi;
    property U : Double read Fu write SetU;
    property V : Double read Fv write SetV;
    property W : Double read Fw write SetW;

    {1:Man; 2:SemiMan; 3:Aut; 4:SemiAut}
    property GeneratorMode : Integer read FGeneratorMode write SetGeneratorMode;
    property EngineRun : Boolean read FIsEngineRun write SetEngineRun;
    property GeneratorSupplied : Boolean read FIsGeneratorSupplied write SetGeneratorSupplied;
    property GeneratorState : Integer read FGeneratorState write SetGeneratorState;
    property FuelRunsOut : Boolean read FIsFuelRunsOut write SetFuelRunsOut;
    property CBClosed : Boolean read FIsCBClosed write SetCBClosed;
    property Preference : Boolean read FIsPreference write SetPreference;
    property Busbar : Boolean read FBusbar write SetBusbar;
    property RunHourState : Boolean read FRunHourState write SetRunHourState;
    property EmergencyStop : Boolean read FEmergencyStop write SetEmergencyStop;
    property EmergencyStart : Boolean read FEmergencyStart write SetEmergencyStart;

    {Generator Alarm}
    property NotStandby : Boolean read FIsNotStandby write SetNotStandby;
    property CanBusFailure : Boolean read FIsCanBusFailure write SetCanBusFailure;
    property MeasPowFailure : Boolean read FIsMeasPowFailure write SetMeasPowFailure;
    property DCPowFailure : Boolean read FIsDCPowFailure write SetDCPowFailure;
    property EngineAlarm : Boolean read FIsEngineAlarm write SetEngineAlarm;
    property ShutDown : Boolean read FIsShutDown write SetShutDown;
    property FaultPageLed : Boolean read FFaultPageLed write SetFaultPageLed;
    property FailureCBClosed : Boolean read FIsFailureCBClosed write SetFailureCBClosed;
  end;

  TPower = class(TEntity)
  private

    FPowerMode : Integer;
    FPowerConsmr : Double;

    procedure SetPowerMode(const Value: Integer);
    procedure SetPowerConsmr(const Value: Double);

  public
    constructor Create;override;
    destructor Destroy;override;

    procedure Run(const aDt : Double);override;

    property PowerMode : Integer read FPowerMode write SetPowerMode;
    property PowerConsmr : Double read FPowerConsmr write SetPowerConsmr;

  end;

implementation

uses uDataType, math;

{ TDieselGenerator }

constructor TGenerator.Create;
begin
  inherited;
  FCosPhi := 0;
  FCurrent := 0;
  FVoltage := 0;
  FFrequency := 0;
  FSwitchFrequency := 0;
  FPower := 0;

  VoltageMax := 448;
  PowerMax := 89;
  CurrentMax := 211;

  FFlagOff := 1; // Ryu : second
  FFlagStart := 1;

  FGeneratorMode := 0;
  FRunHourState := False;
  IsConnectToMsb := False;
  FIsFuelRunsOut := False;

  { unit : second }
  FStopDelay := 0;
  FStateOnDelay := 0;
  FStartDelay := 0;
  FEmergencyStartState := 0;
end;

procedure TGenerator.DecreaseSpeed;
begin

end;

destructor TGenerator.Destroy;
begin

  inherited;
end;

procedure TGenerator.EmergencyStartGenerator(const aDt: Double);
begin
  FEmergencyStartState := FEmergencyStartState + 1;
  if FEmergencyStartState = 1 then
  begin
    {detik ke 1}
    Frequency := 6000;
    Voltage   := (random(10)+ 247);
  end
  else if FEmergencyStartState = 20 then
  begin
    {detik ke 2}
    Voltage := (VoltageMax/2) + random(2);
    CosPhi := 81;

    SetUVW(52, 53, 49);

  end
  else if FEmergencyStartState > 40 then
  begin
    {detik ke 3}
    GeneratorState := 5;{Gen Ready}
    GeneratorSupplied := True;

    if (GeneratorMode = 3) and (not FailureCBClosed) then
      CBClosed := True;

    Voltage := VoltageMax + random(2);

    FrequencyState  := Frequency;
    VoltageState    := Voltage;
    CosPhiState     := CosPhi;

    if Identifier = 'Emergency Generator' then
      PowerState      := 90
    else
      PowerState      := 0;


    SetUVW(71, 73, 70);

    EmergencyStart := False;
    FEmergencyStartState := 0;
  end;
end;

procedure TGenerator.EmergencyStopGenerator(const aDt : Double);
begin
  EngineRun := False;
  GeneratorSupplied := False;
  Preference := False;
  CBClosed := False;
  FailureCBClosed := False;
  GeneratorState := 1;
//  Busbar := False;
  Power := 0;
  Voltage := 0;
  Frequency := 0;
  Current := 0;
  CosPhi  := 0;

  SetUVW(54, 57, 56);
end;

procedure TGenerator.IncreaseSpeed;
begin

end;

procedure TGenerator.StopGenerator(const aDt : Double);
begin
  { Ryu : diganti setiap +-1 detik }
  FStopDelay := FStopDelay + 1;
  if FStopDelay > 50 then
  begin
    FStopDelay := 0;

    if EngineRun then
    begin
      if (GeneratorMode = 3) or (GeneratorMode = 4) then
        CBClosed := False;

      if Current > 75 then
      begin
        Current := Current  - (random(5)+ 20);
        if (Power - (random(5)+ 10)) < 0 then
          Power := 0
        else
          Power   := Power - (random(5)+ 10);

        CosPhi  := CosPhi   - (random(4)+ 10);
        exit;
      end
      else
      begin
        GeneratorState := 7;{Stop}
        Power := 0;
        Current := 0;
        CosPhi :=0;

        if (Frequency  - (random(5)+ 10)*100) > 1000 then
        begin
          Frequency := Frequency  - (random(5)+ 10)*100;
          Voltage   := Voltage    - (random(5)+ 80);
          exit;
        end
        else
        begin
          Frequency := 0;
          Voltage   := 0;
          EngineRun := False;
        end;
      end;
    end
    else
    begin
      if GeneratorState = 7 then
      begin
        GeneratorState := 8;{Idle}
      end
      else if GeneratorState = 8 then
      begin
        FIdleState := FIdleState + 1;
        if FIdleState = 3 then
        begin
          GeneratorState := 1;{Waiting}
          GeneratorSupplied := False;
          SetUVW(53, 55, 56);
          FIdleState := 0;
          FFlagStart := 1;
        end;
      end
    end;
  end;
end;

procedure TGenerator.Run(const aDt: Double);
begin
  inherited;
  if EmergencyStop or DCPowFailure then
  begin
    EmergencyStopGenerator(aDt);
    exit;
  end;

  if EngineRun then
  begin
    RunHourState := True;
    if (not GeneratorSupplied) then
    begin
      if EmergencyStart then
        EmergencyStartGenerator(aDt) {start berdasarkan pre alarm active}
      else
        NormalStartGenerator(aDt)    {start normal}
    end
    else
    begin
      if (ShutDown) then
      begin
        EngineAlarm := False;
        GeneratorState := 6;
        Preference := False;
      end;

      if (GeneratorState = 6) or (GeneratorState = 7) then {cool down}
      begin
        StopGenerator(aDt);
      end
      else if GeneratorState = 5 then
      begin
        StateOnGenerator(aDt);
      end;
    end;
  end
  else
  begin
    RunHourState := False;
    if GeneratorSupplied then
    begin
      StopGenerator(aDt);
    end
    else
    begin
      StateOffGenerator(aDt);

      if (ShutDown) then
        EngineAlarm := False;
    end;

  end;
end;

procedure TGenerator.NormalStartGenerator(const aDt : Double);
var
  tempVolt : Double;
begin
  {Ryu : setiap 1 detik}
  FStartDelay := FStartDelay + aDt;
  if FStartDelay > 1 then
  begin
    FStartDelay := 0;

    if Voltage < VoltageMax then
    begin
      if Voltage < 247 then
      begin
        GeneratorState := 2;{Warm Up}
        CosPhi := 0;
        Frequency := 5815;
        Voltage := (random(10)+ 247);

        SetUVW(32, 31, 32);
      end
      else
      begin
        {set naik nilai Voltage}
        tempVolt := Voltage + (random(10)+ 50);

        if tempVolt < VoltageMax  then
        begin
          Voltage := tempVolt;
          Frequency := 5845;
        end
        else
        begin
          GeneratorState := 4;{Engine Ready}
          Frequency := 5965;
          Voltage := VoltageMax;
          if (CosPhi + (random(4)+ 10)) < 81 then
            CosPhi  := CosPhi + (random(4)+ 10);
        end;
      end;
    end
    else
    begin
      GeneratorState := 5; {Gen Ready}
      GeneratorSupplied := True;

      Voltage := VoltageMax + random(2);

      FrequencyState  := Frequency;
      VoltageState    := Voltage;
      CosPhiState     := CosPhi;
      PowerState      := 0;

      SetUVW(71, 73, 70);
    end;
  end
end;

procedure TGenerator.SetBusbar(const Value: Boolean);
begin
  if FBusbar = Value then
    exit;
  FBusbar := Value;
  Listener.TriggerEvents(Self,epPMSGeneratorBusbar,Value);
end;

procedure TGenerator.SetCanBusFailure(const Value: Boolean);
begin
  if FIsCanBusFailure = Value then
    exit;
  FIsCanBusFailure := Value;
  Listener.TriggerEvents(Self,epPMSCanBusFailure,Value);
end;

procedure TGenerator.SetCBClosed(const Value: Boolean);
begin
  if FIsCBClosed = Value then
    exit;
  FIsCBClosed := Value;
  Listener.TriggerEvents(Self,epPMSGeneratorCBClosed,Value);
end;

procedure TGenerator.SetCosPhi(const Value: Double);
begin
  if FCosPhi = Value then
    exit;
  FCosPhi := Value;
  Listener.TriggerEvents(Self,epPMSCosPhi,Value);
end;

procedure TGenerator.SetCurrent(const Value: Double);
begin
  if FCurrent = Value then
    exit;
  FCurrent := Value;
  Listener.TriggerEvents(Self,epPMSCurrent,Value);
end;

procedure TGenerator.SetDCPowFailure(const Value: Boolean);
begin
  if FIsDCPowFailure = Value then
    exit;
  FIsDCPowFailure := Value;
  Listener.TriggerEvents(Self,epPMSDCPowFailure,Value);
end;

procedure TGenerator.SetEmergencyStart(const Value: Boolean);
begin
  FEmergencyStart := Value;
end;

procedure TGenerator.SetEmergencyStop(const Value: Boolean);
begin
  FEmergencyStop := Value;
  Listener.TriggerEvents(Self,epPMSGeneratorEmergencyStop,Value);
end;

procedure TGenerator.SetEngineAlarm(const Value: Boolean);
begin
  if FIsEngineAlarm = Value then
    exit;
  FIsEngineAlarm := Value;
  Listener.TriggerEvents(Self,epPMSEngineAlarm,Value);
end;

procedure TGenerator.SetEngineRun(const Value: Boolean);
begin
  if FIsEngineRun = Value then
    exit;
  FIsEngineRun := Value;
  Listener.TriggerEvents(Self,epPMSGeneratorEngineRun,Value);

end;

procedure TGenerator.SetFailureCBClosed(const Value: Boolean);
begin
  if FIsFailureCBClosed = Value then
    exit;
  FIsFailureCBClosed := Value;
  Listener.TriggerEvents(Self,epPMSFailureCBClosed,Value);
end;

procedure TGenerator.SetFaultPageLed(const Value: Boolean);
begin
  if FFaultPageLed = Value then
    exit;
  FFaultPageLed := Value;
  Listener.TriggerEvents(Self,epPMSFaultPageLed,Value);
end;

procedure TGenerator.SetFrequency(const Value: Double);
begin
  if FFrequency = Value then
    exit;
  FFrequency := Value;
  Listener.TriggerEvents(Self,epPMSFrequency,Value);
end;

procedure TGenerator.SetFuelRunsOut(const Value: Boolean);
begin
  if FIsFuelRunsOut = Value then
    exit;
  FIsFuelRunsOut := Value;
  Listener.TriggerEvents(Self,epPMSGeneratorFuelRunsOut,Value);
end;

procedure TGenerator.SetGeneratorMode(const Value: Integer);
begin
  if FGeneratorMode = Value then
    exit;
  FGeneratorMode := Value;
  Listener.TriggerEvents(Self,epPMSGeneratorMode,Value);
end;

procedure TGenerator.SetGeneratorState(const Value: Integer);
begin
  if FGeneratorState = Value then
    exit;

  FGeneratorState := Value;
  Listener.TriggerEvents(Self,epPMSGeneratorState, Value);
end;

procedure TGenerator.SetGeneratorSupplied(const Value: Boolean);
begin
  if FIsGeneratorSupplied = Value then
    exit;

  FIsGeneratorSupplied := Value;
  Listener.TriggerEvents(Self,epPMSGeneratorSupplied, Value);
end;

procedure TGenerator.SetMeasPowFailure(const Value: Boolean);
begin
  if FIsMeasPowFailure = Value then
    exit;
  FIsMeasPowFailure := Value;
  Listener.TriggerEvents(Self,epPMSMeasPowFailure,Value);
end;

procedure TGenerator.SetPower(const Value: Double);
begin
  if FPower = Value then
    exit;
  FPower := Value;
  Listener.TriggerEvents(Self,epPMSPower,Value);
end;

procedure TGenerator.SetPreference(const Value: Boolean);
begin
  if FIsPreference = Value then
    exit;
  FIsPreference := Value;
  Listener.TriggerEvents(Self,epPMSGeneratorPreference,Value);
end;

procedure TGenerator.SetRunHourState(const Value: Boolean);
begin
  if FRunHourState = Value then
    exit;
  FRunHourState := Value;
  Listener.TriggerEvents(Self,epPMSGeneratorRunHour,Value);
end;

procedure TGenerator.SetShutDown(const Value: Boolean);
begin
  if FIsShutDown = Value then
    exit;
  FIsShutDown := Value;
  Listener.TriggerEvents(Self,epPMSShutDown,Value);
end;

procedure TGenerator.SetSwitchFrequency(const Value: Double);
begin
  if FSwitchFrequency = Value then
    exit;
  FSwitchFrequency := Value;
  Listener.TriggerEvents(Self,epPMSSwitchFrequency,Value);
end;

procedure TGenerator.SetU(const Value: Double);
begin
  if Fu = Value then
    exit;
  Fu := Value;
  Listener.TriggerEvents(Self,epPMSU,Value);
end;

procedure TGenerator.SetUVW(const ValU, ValV, ValW: Double);
begin
  U := ValU;
  V := ValV;
  W := ValW;
end;

procedure TGenerator.SetV(const Value: Double);
begin
  if Fv = Value then
    exit;
  Fv := Value;
  Listener.TriggerEvents(Self,epPMSV,Value);
end;

procedure TGenerator.SetW(const Value: Double);
begin
  if Fw = Value then
    exit;
  Fw := Value;
  Listener.TriggerEvents(Self,epPMSW,Value);
end;

procedure TGenerator.StateOffGenerator(const aDt : Double);
begin
  if (Abs(Frequency - SwitchFrequency) >= 100) and (CBClosed) then
  begin
    CBClosed := False;
    FailureCBClosed := True;
  end;

//  Busbar := False;
  Power := 0;
  PowerState := 0;
  Voltage := 0;
  Frequency := 0;
  Current := 0;
end;

procedure TGenerator.StateOnGenerator(const aDt : Double);
var
  dt : Integer;
  flag : Double;
begin
  if ((GeneratorMode = 3) or (GeneratorMode = 4)) and (GeneratorState <> 6) and (not FailureCBClosed)then
      CBClosed := True;

  if (GeneratorMode <> 3) and (not CBClosed) then
    PowerState := 0;


  FStateOnDelay := FStateOnDelay + aDt;

  if Power < (PowerState - 2) then
  begin
    if FStateOnDelay > 1 then
    begin
      flag := Power + (random(3) + 20);

      if (flag < PowerState) then
        Power   := flag
      else
        Power   := PowerState;

      Current   := 4/3 * Power;
      FStateOnDelay := 0;
    end;
  end
  else if Power > (PowerState + 2) then
  begin
    if FStateOnDelay > 1 then
    begin
      flag := Power - (random(3) + 20);
      if (flag > PowerState) then
        Power   := flag
      else
        Power   := PowerState;

      Current   := 4/3 * Power;
      FStateOnDelay := 0;
    end;
  end
  else
  begin
    if FStateOnDelay < 10 then
    begin
      dt := Round ( FStateOnDelay ) - Round ( FStateOnDelay - aDt );
      if dt = 0 then
        Exit;

      if ( Round(FStateOnDelay) mod 2 = 0) then
      begin
        Frequency := FrequencyState + (random(3)+ (-1))*10;
        Voltage := VoltageState  + random(2) + (-1);
      end;

      if (Round(FStateOnDelay) mod 5 = 0) then
      begin
        Power   := PowerState + random(2) + (-1);
        if Power < 0 then
          Power := 0;

        Current   := 4/3 * Power;
        CosPhi  := 81 + random(2) + (-1);
      end;
    end
    else
    begin
      FStateOnDelay := 0;
    end;
  end;
end;

procedure TGenerator.SetVoltage(const Value: Double);
begin
  if FVoltage = Value then
    exit;
  FVoltage := Value;
  Listener.TriggerEvents(Self,epPMSVoltage,Value);
end;

procedure TGenerator.SetNotStandby(const Value: Boolean);
begin
  if FIsNotStandby = Value then
    exit;
  FIsNotStandby := Value;
  Listener.TriggerEvents(Self,epPMSNotStandby,Value);
end;

{ TBeban }

constructor TPower.Create;
begin
  inherited;
  FPowerConsmr := 45;
end;

destructor TPower.Destroy;
begin

  inherited;
end;

procedure TPower.Run(const aDt: Double);
begin
  inherited;

end;

procedure TPower.SetPowerConsmr(const Value: Double);
begin
  if FPowerConsmr = Value then
    exit;
  FPowerConsmr := Value;
  Listener.TriggerEvents(Self,epPMSPowerConsmr,Value);
end;

procedure TPower.SetPowerMode(const Value: Integer);
begin
  if FPowerMode = Value then
    exit;
  FPowerMode := Value;
  Listener.TriggerEvents(Self,epPMSPowerMode,Value);
end;

end.
