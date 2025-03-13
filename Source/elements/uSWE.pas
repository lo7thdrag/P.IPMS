unit uSWE;

interface

uses uElement, uDataType;

type
  TSWEElement = class(TElement)
  private
    FStateAlarmInhibited: E_StateInhibit;
    FLastStateSwitchDelayed, FStateSwitchDelayed, FStateSwitch : boolean;
    FTime : Integer;
    FMode: Byte;
    FNONC: Byte;

    procedure SetStateAlarmInhibited(const Value: E_StateInhibit);
    procedure SetStateInState(const Value: Boolean);
    procedure SetMode(const Value: Byte);
    procedure SetNONC(const Value: Byte);

  protected
    procedure SetElementParameters;override;
	  procedure SetStateElementDisabled(const Value: E_StateDisabled);override;
  public
    constructor Create; override;

    procedure DefaultValue;override;
    procedure AlarmElementStateCalc;override;
    procedure SignalDelay;override;
    procedure SetFireFighting(aElement : E_StateElement; aAlarm : E_StateAlarm);
    procedure RunEverySecond;override;
    { element input }
    property StateAlarmInhibited : E_StateInhibit read FStateAlarmInhibited write SetStateAlarmInhibited;
    property StateInState : Boolean read FStateSwitch write SetStateInState;

    property Mode : Byte read FMode write SetMode;
    property NONC : Byte read FNONC write SetNONC;
  end;

implementation

{ TSWEElement }

procedure TSWEElement.AlarmElementStateCalc;
//var
//  MODE, NONC : Double;
begin
  inherited;
  {parameter -> sementara NO/NC : NO|0 NC|1 MODE : Alarm|0 No Alarm|1}

//  MODE := Parameters.GetParameter(epMODE).ParamDoubleValue;
//  NONC := Parameters.GetParameter(epNONC).ParamDoubleValue;

  if (FStateElementDisabled = sdUnavailable) then
  begin
    SetAlarm(saNone);
    SetElement(seUnavailable);
  end;

  if (FStateElementDisabled = sdDisabled) then
  begin
    SetAlarm(saNoneDisable);
    SetElement(seDisabled);
  end;

  if (FStateElementDisabled = sdEnabled) then
  begin
    SignalDelay;

    if Mode = 1 then
    begin
      if (NONC = 0) and (FStateSwitchDelayed) then
      begin
        SetAlarm(saNone);
        SetElement(seState0);
      end
      else if (NONC = 1) and (not FStateSwitchDelayed) then
      begin
        SetAlarm(saNone);
        SetElement(seState0);
      end
      else if (NONC = 0) and (not FStateSwitchDelayed) then
      begin
        SetAlarm(saNone);
        SetElement(seState1);
      end
      else if (NONC = 1) and (FStateSwitchDelayed) then
      begin
        SetAlarm(saNone);
        SetElement(seState1);
      end;
    end
    else if (FStateAlarmInhibited = siInhibited) and (Mode = 0) then
    begin
      if (NONC = 0) and (FStateSwitchDelayed) then
      begin
        SetAlarm(saInhibited);
        SetElement(seState0);
      end
      else if (NONC = 1) and (not FStateSwitchDelayed) then
      begin
        SetAlarm(saInhibited);
        SetElement(seState0);
      end;
    end
    else if (FStateAlarmInhibited = siNotInhibited) and (Mode = 0) then
    begin
      if (NONC = 0) and (FStateSwitchDelayed) then
      begin
        SetAlarm(saAlarm);
        SetElement(seAlarm);
      end
      else if (NONC = 1) and (not FStateSwitchDelayed) then
      begin
        SetAlarm(saAlarm);
        SetElement(seAlarm);
      end;
    end;
  end;
end;

constructor TSWEElement.Create;
begin
  inherited;

  ELementType := eltSWE;

end;

procedure TSWEElement.DefaultValue;
begin
  inherited;
  FTime := 0;
  Mode := 1;
  NONC := 1;
  StateInState := false;
  FStateSwitchDelayed := False;
  FLastStateSwitchDelayed := not FStateSwitchDelayed;
end;

procedure TSWEElement.RunEverySecond;
begin
  inherited;
  AlarmElementStateCalc;

  inc(FTime);
end;

procedure TSWEElement.SetElementParameters;
begin
  inherited;

//  Parameters.AddParameter(epNONC,0);
  Parameters.AddParameter(epTDELAY,0);
//  Parameters.AddParameter(epMODE,0);
end;

procedure TSWEElement.SetFireFighting(aElement: E_StateElement;
 aAlarm : E_StateAlarm);
begin
  SetElement(aElement);
  SetAlarm(aAlarm);
end;

procedure TSWEElement.SetMode(const Value: Byte);
begin
  FMode := Value;
end;

procedure TSWEElement.SetNONC(const Value: Byte);
begin
  FNONC := Value;
end;

procedure TSWEElement.SetStateAlarmInhibited(const Value: E_StateInhibit);
begin
  if FStateAlarmInhibited = Value then Exit;

  FStateAlarmInhibited := Value;
  Listeners.TriggerEvents(Self,epElementAlrmInhibited,Byte(Value));

//  AlarmElementStateCalc;
end;

procedure TSWEElement.SetStateElementDisabled(const Value: E_StateDisabled);
begin
  inherited;

//  AlarmElementStateCalc;
end;

procedure TSWEElement.SetStateInState(const Value: Boolean);
begin
  FStateSwitch := Value;
  SignalDelay;

//  AlarmElementStateCalc;
end;

procedure TSWEElement.SignalDelay;
var
  TDELAY : Double;
begin
  inherited;

  TDELAY := Parameters.GetParameter(epTDELAY).ParamDoubleValue;

  if (FStateSwitch) and (FTime > TDELAY) then
    FStateSwitchDelayed := True;
  if (not FStateSwitch) and (FTime > TDELAY) then
    FStateSwitchDelayed := False;

  if FStateSwitchDelayed <> FLastStateSwitchDelayed then
  begin
    FLastStateSwitchDelayed := FStateSwitchDelayed;
    Listeners.TriggerEvents(Self,epStateSwitchDelayed,Byte(FStateSwitchDelayed));
  end;
end;

end.
