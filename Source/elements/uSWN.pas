unit uSWN;

interface

uses uElement, uDataType;

type
  TSWNElement = class(TElement)
  private
    FStateAlarmInhibited: E_StateInhibit;
    FMode, FEvaluate, FStateSwitchDelayed, FStateSwitch : boolean;
    Ft : Integer;

    procedure SetStateAlarmInhibited(const Value: E_StateInhibit);
    procedure SetMode(const Value: Boolean);
    procedure SetEvaluate(const Value: Boolean);
    procedure SetStateSwitch(const Value: Boolean);

  protected
    procedure SetElementParameters;override;
    procedure SignalDelay;override;
    procedure SetStateElementDisabled(const Value: E_StateDisabled);override;

  public
    constructor Create; override;
    procedure AlarmElementStateCalc;override;

    { element input }
    property StateAlarmInhibited : E_StateInhibit read FStateAlarmInhibited write SetStateAlarmInhibited;
    property Mode : Boolean read FMode write SetMode;
    property Evaluate : Boolean read FEvaluate write SetEvaluate;
    property StateSwitch : Boolean read FStateSwitch write SetStateSwitch;

    { element output }
    property StateSwitchDelay : Boolean read FStateSwitchDelayed;

  end;

implementation

{ TSWNElement }

procedure TSWNElement.AlarmElementStateCalc;
begin
  inherited;

  if FStateElementDisabled = sdDisabled then
  begin
    SetAlarm(saNoneDisable);
    SetElement(seDisabled);
  end
  else
  if FStateElementDisabled = sdEnabled then
  begin
    if FStateAlarmInhibited = siInhibited then
    begin
      if (not FEvaluate) and (not FStateSwitchDelayed) then
      begin
        SetAlarm(saInhibited);
        SetElement(seState1);
      end
      else if (not FEvaluate) and FStateSwitchDelayed then
      begin
        SetAlarm(saInhibited);
        SetElement(seState0);
      end
      else if FEvaluate and (not FStateSwitchDelayed) then
      begin
        SetAlarm(saInhibited);
        SetElement(seState1);
      end
      else if FEvaluate and FStateSwitchDelayed then
      begin
        SetAlarm(saInhibited);
        SetElement(seWarning);
      end
    end
    else
    if FStateAlarmInhibited = siNotInhibited then
    begin
      if (not FMode) and (not FStateSwitchDelayed) then
      begin
        SetAlarm(saNone);
        SetElement(seState1);
      end
      else if (not FMode) and FStateSwitchDelayed then
      begin
        SetAlarm(saNone);
        SetElement(seState0);
      end
      else if FMode and (not FStateSwitchDelayed) then
      begin
        SetAlarm(saNone);
        SetElement(seState1);
      end
      else if FMode and FStateSwitchDelayed then
      begin
        SetAlarm(saAlarm);
        SetElement(seAlarm);
      end;
    end;
  end;
end;

constructor TSWNElement.Create;
begin
  inherited;

  ElementType := eltSWN;
end;

procedure TSWNElement.SetElementParameters;
begin
  inherited;

  Parameters.AddParameter(epTDELAY,0);
  Parameters.AddParameter(epMODE,0);

  SignalDelay;
end;

procedure TSWNElement.SetEvaluate(const Value: Boolean);
begin
  if FEvaluate = Value then Exit;

  FEvaluate := Value;
  Listeners.TriggerEvents(Self,epEvaluateStateChange,Boolean(Value));

  AlarmElementStateCalc;
end;

procedure TSWNElement.SetMode(const Value: Boolean);
begin
  FMode := Value;
  AlarmElementStateCalc;
end;

procedure TSWNElement.SetStateAlarmInhibited(const Value: E_StateInhibit);
begin
  if FStateAlarmInhibited = Value then Exit;

  FStateAlarmInhibited := Value;
  Listeners.TriggerEvents(Self,epElementAlrmInhibited,Byte(Value));

  AlarmElementStateCalc;
end;

procedure TSWNElement.SetStateElementDisabled(const Value: E_StateDisabled);
begin
  inherited;
  AlarmElementStateCalc;
end;

procedure TSWNElement.SetStateSwitch(const Value: Boolean);
begin
  if FStateSwitch = Value then Exit;

  FStateSwitch := Value;
  Listeners.TriggerEvents(Self,epStateSwitchChange,Boolean(Value));

  SignalDelay;
end;

procedure TSWNElement.SignalDelay;
begin
  if (FStateSwitch) and (Ft > Integer(epTDELAY)) then
    FStateSwitchDelayed := True
  else if (not FStateSwitch) then
    FStateSwitchDelayed := False;

  AlarmElementStateCalc;
end;

end.
