unit uSwitchboard;

interface

uses uEntity;

type

  TSwitchboard = class(TEntity)
  private

    FDelay : Double;
    FVoltage: Double;
    FFrequency: Double;
    FPower : Double;
    FTrafo230Volt : Double;
    FTrafo115Volt : Double;

    FMSBIntrMode : Integer;
    FESBIntrMode : Integer;
    FShoreIntrMode : Integer;

    FIsTripReduct : Boolean;
    FIsEmergencyCon : Boolean;

    FIsBusbar  : boolean;
    FIsMsbCBIntr : boolean;
    FIsEsbCBIntr : boolean;
    FIsMsbCBShore : boolean;
    FIsMsbCBNavNaut : boolean;

    procedure SetFrequency (const Value : Double);
    procedure SetVoltage (const Value : Double);
    procedure SetPower (const Value : Double);
    procedure SetTrafo230Volt (const Value : Double);
    procedure SetTrafo115Volt (const Value : Double);

    procedure SetMSBIntrMode(const Value : Integer);
    procedure SetESBIntrMode(const Value : Integer);
    procedure SetShoreIntrMode(const Value : Integer);

    procedure SetMsbCBIntr(const Value : Boolean);
    procedure SetEsbCBIntr(const Value : Boolean);
    procedure SetMsbCBShore(const Value : Boolean);
    procedure SetMsbCBNavNaut(const Value : Boolean);
    procedure SetTripReduct(const Value : Boolean);
    procedure SetBusbar(const Value : Boolean);
    procedure SetEmergencyCon(const Value : Boolean);

  public
    constructor Create;override;
    destructor Destroy;override;

    procedure Run(const aDt : Double);override;

    {1:Man; 2:Off; 3:Aut}
    property MSBIntrMode : Integer read FMSBIntrMode write SetMSBIntrMode;
    {1:Aft; 2:Off; 3:Fwd; 4:Dbl}
    property ESBIntrMode : Integer read FESBIntrMode write SetESBIntrMode;
    {1:Man; 2:Off; 3:Aut}
    property ShoreIntrMode : Integer read FShoreIntrMode write SetShoreIntrMode;

    property MsbCBIntr : Boolean read FIsMsbCBIntr write SetMsbCBIntr;
    property EsbCBIntr : Boolean read FIsEsbCBIntr write SetEsbCBIntr;
    property MsbCBShore : Boolean read FIsMsbCBShore write SetMsbCBShore;
    property MsbCBNavNaut : Boolean read FIsMsbCBNavNaut write SetMsbCBNavNaut;
    property Busbar : Boolean read FIsBusbar write SetBusbar;
    property TripReduct : Boolean read FIsTripReduct write SetTripReduct;
    property EmergencyCon : Boolean read FIsEmergencyCon write SetEmergencyCon;

    property Frequency : Double read FFrequency write SetFrequency;
    property Voltage : Double read FVoltage write SetVoltage;
    property Power : Double read FPower write SetPower;
    property Trafo230Volt : Double read FTrafo230Volt write SetTrafo230Volt;
    property Trafo115Volt : Double read FTrafo115Volt write SetTrafo115Volt;


  end;

implementation

uses uDataType;

{ TSwitchboard }

constructor TSwitchboard.Create;
begin
  inherited;
  FFrequency  := 0;
  FVoltage    := 0;
  FTrafo230Volt := 0;
  FTrafo115Volt := 0;
  FDelay      := 0;

  ShoreIntrMode  := 2;
  MSBIntrMode := 2;
  ESBIntrMode := 2;

  MsbCBShore := False;
  MsbCBIntr := False;
  EsbCBIntr := False;
end;

destructor TSwitchboard.Destroy;
begin

  inherited;
end;

procedure TSwitchboard.Run(const aDt: Double);
begin
  inherited;
  if ShoreIntrMode = 2 then
  begin
    MsbCBShore := False;
  end;
  if MSBIntrMode = 2 then
  begin
    MsbCBIntr := False;
  end;
  if MSBIntrMode = 3 then
  begin
    if Busbar then
    begin
      if not MsbCBIntr then
      begin
        if FDelay < 60 then
          FDelay := FDelay +1
        else
        begin
          MsbCBIntr := True;
          FDelay := 0;
        end;
      end;
    end
    else
      MsbCBIntr := False
  end;

  Trafo230Volt := 63;
  Trafo115Volt := 61;
end;

procedure TSwitchboard.SetBusbar(const Value: Boolean);
begin
  if FIsBusbar = Value then
    exit;
  FIsBusbar := Value;
  Listener.TriggerEvents(Self,epPMSMsbBusbar,Value);
end;

procedure TSwitchboard.SetVoltage(const Value: Double);
begin
  if FVoltage = Value then
    exit;
  FVoltage := Value;
  Listener.TriggerEvents(Self,epPMSVoltage,Value);
end;

procedure TSwitchboard.SetPower(const Value: Double);
begin
  if FPower = Value then
    exit;
  FPower := Value;
  Listener.TriggerEvents(Self,epPMSPower,Value);
end;

procedure TSwitchboard.SetFrequency(const Value: Double);
begin
  if FFrequency = Value then
    exit;
  FFrequency := Value;
  Listener.TriggerEvents(Self,epPMSFrequency,Value);
end;

procedure TSwitchboard.SetEmergencyCon(const Value: Boolean);
begin
  if FIsEmergencyCon = Value then
    exit;
  FIsEmergencyCon := Value;
  Listener.TriggerEvents(Self,epPMSEmergencyCon,Value);
end;

procedure TSwitchboard.SetEsbCBIntr(const Value: Boolean);
begin
  if FIsEsbCBIntr = Value then
    exit;
  FIsEsbCBIntr := Value;
  Listener.TriggerEvents(Self,epPMSEsbCBIntr,Value);
end;

procedure TSwitchboard.SetESBIntrMode(const Value: Integer);
begin
  if FESBIntrMode = Value then
    exit;
  FESBIntrMode := Value;
  Listener.TriggerEvents(Self,epPMSEsbIntrMode,Value);
end;

procedure TSwitchboard.SetMSBIntrMode(const Value: Integer);
begin
  if FMSBIntrMode = Value then
    exit;
  FMSBIntrMode := Value;
  Listener.TriggerEvents(Self,epPMSMsbIntrMode,Value);
end;

procedure TSwitchboard.SetMsbCBIntr(const Value: Boolean);
begin
  if FIsMsbCBIntr = Value then
    exit;
  FIsMsbCBIntr := Value;
  Listener.TriggerEvents(Self,epPMSMsbCBIntr,Value);
end;

procedure TSwitchboard.SetMsbCBNavNaut(const Value: Boolean);
begin
  if FIsMsbCBNavNaut = Value then
    exit;
  FIsMsbCBNavNaut := Value;
  Listener.TriggerEvents(Self,epPMSMsbCBNavNaut,Value);
end;

procedure TSwitchboard.SetMsbCBShore(const Value: Boolean);
begin
  if FIsMsbCBShore = Value then
    exit;
  FIsMsbCBShore := Value;
  Listener.TriggerEvents(Self,epPMSMsbCBShore,Value);
end;

procedure TSwitchboard.SetShoreIntrMode(const Value: Integer);
begin
  if FShoreIntrMode = Value then
    exit;
  FShoreIntrMode := Value;
  Listener.TriggerEvents(Self,epPMSMsbShoreMode,Value);
end;

procedure TSwitchboard.SetTrafo115Volt(const Value: Double);
begin
  if FTrafo115Volt = Value then
    exit;
  FTrafo115Volt := Value;
  Listener.TriggerEvents(Self,epPMSTrafo115Volt,Value);
end;

procedure TSwitchboard.SetTrafo230Volt(const Value: Double);
begin
  if FTrafo230Volt = Value then
    exit;
  FTrafo230Volt := Value;
  Listener.TriggerEvents(Self,epPMSTrafo230Volt,Value);
end;

procedure TSwitchboard.SetTripReduct(const Value: Boolean);
begin
  if FIsTripReduct = Value then
    exit;
  FIsTripReduct := Value;
  Listener.TriggerEvents(Self,epPMSMsbTripReduct,Value);
end;

end.
