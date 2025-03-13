unit uVCE;

interface

uses uElement, uDataType, SysUtils;

type
  TVCEElement = class(TElement)
  private
    FStateRFU: E_StateNotRFU;
    FStateSwitchRemote: E_ExtStatus;
    FStateSwitchClosed: E_ExtStatus;
    FStateSwitchOpen: E_ExtStatus;
    FDesireState: E_DesiredState;
    FControlClose, FControlOpen : E_StateActivated;
    FCommandClose, FCommandOpen: E_StateActivated;
    FStateControlPosition: E_ControlMode;
    FStateAutoManual: E_StateManualAuto;

    FTime : integer;

    procedure SetStateRFU(const Value: E_StateNotRFU);
    procedure SetStateSwitchRemote(const Value: E_ExtStatus);
    procedure SetStateSwitchClosed(const Value: E_ExtStatus);
    procedure SetStateSwitchOpen(const Value: E_ExtStatus);
    procedure SetCommandClose(const Value: E_StateActivated);
    procedure SetCommandOpen(const Value: E_StateActivated);
    procedure SetStateAutoManual(const Value: E_StateManualAuto);

  protected
    procedure SetElementParameters;override;
    procedure PlatformControl;override;
    procedure ControlModeDetermination;
    procedure SetStateElementDisabled(const Value: E_StateDisabled);override;
  public
    constructor Create; override;

    procedure DefaultValue;override;
    procedure AlarmElementStateCalc;override;
    procedure RunEverySecond;override;

    { element input }
    property StateRFU : E_StateNotRFU read FStateRFU write SetStateRFU;
    property StateSwitchRemote : E_ExtStatus read FStateSwitchRemote write SetStateSwitchRemote;
    property StateSwitchClosed : E_ExtStatus read FStateSwitchClosed write SetStateSwitchClosed;
    property StateSwitchOpen : E_ExtStatus read FStateSwitchOpen write SetStateSwitchOpen;
    property CommandClose: E_StateActivated read FCommandClose write SetCommandClose;
    property CommandOpen: E_StateActivated read FCommandOpen write SetCommandOpen;
    property StateAutoManual: E_StateManualAuto read FStateAutoManual write SetStateAutoManual;

    { output that use to the next process }
    property DesireState : E_DesiredState read FDesireState write FDesireState;

    { element output }
    property ControlClose : E_StateActivated read FControlClose;
    property ControlOpen : E_StateActivated read FControlOpen;
    property StateControlPosition: E_ControlMode read FStateControlPosition;

  end;

implementation

{ TVCEElement }

procedure TVCEElement.AlarmElementStateCalc;
var
  TTRANS : Double;
begin
  inherited;

  TTRANS := Parameters.GetParameter(epTTRANS).ParamDoubleValue;

  if FStateElementDisabled = sdDisabled then
  begin
    SetAlarm(saNoneDisable);
    SetElement(seDisabled);
  end
  else
  if FStateElementDisabled = sdEnabled then
  begin
    if (FStateSwitchClosed = esClosed) and (FStateSwitchOpen = esOpen) then
    begin
      SetAlarm(saUnknown);
      SetElement(seUnknown);
    end
    else
    if (FStateRFU = snrNotRFU) and
       (FDesireState = dsCLose) and
       (FStateSwitchClosed = esClosed) and
       (FStateSwitchOpen = esNotOpen) then
    begin
      SetAlarm(saNone);
      SetElement(seNotRFU);
    end
    else
    if (FStateRFU = snrNotRFU) and
       (FDesireState = dsOpen) and
       (FStateSwitchClosed = esNotClosed) and
       (FStateSwitchOpen = esOpen) then
    begin
      SetAlarm(saNone);
      SetElement(seNotRFU);
    end
    else
    if (FStateRFU = snrRFU) and (FStateSwitchRemote = esLocal) then
    begin
      if (FStateSwitchClosed = esClosed) and (FStateSwitchOpen = esNotOpen) then
      begin
        SetAlarm(saNone);
        SetElement(seClosed);
      end
      else
      if (FStateSwitchClosed = esNotClosed) and (FStateSwitchOpen = esNotOpen) then
      begin
        SetAlarm(saNone);
        SetElement(seTransition);
      end
      else
      if (FStateSwitchClosed = esNotClosed) and (FStateSwitchOpen = esOpen) then
      begin
        SetAlarm(saNone);
        SetElement(seOpen);
      end;
    end
    else
    if (FStateRFU = snrRFU) and (FStateSwitchRemote = esRemote) then
    begin
      if (FDesireState = dsCLose) and (FStateSwitchClosed = esClosed) and (FStateSwitchOpen = esNotOpen) then
      begin
        SetAlarm(saNone);
        SetElement(seClosed);
      end
      else
      if (FDesireState = dsCLose) and (FStateSwitchClosed = esNotClosed) and (TTRANS > 0) then
      begin
        if FTime < TTRANS then
        begin
          SetAlarm(saNone);
          SetElement(seTransition);
        end
        else if FTime >= TTRANS then
        begin
          SetAlarm(saCLoseFailure);
          SetElement(seCloseFailure);
        end;
      end
      else
      if (FStateSwitchClosed = esNotClosed) and (FStateSwitchOpen = esNotOpen) and (TTRANS = 0) then
      begin
        SetAlarm(saNone);
        SetElement(seTransition);
      end
      else
      if (FDesireState = dsOpen) and (FStateSwitchOpen = esNotOpen) and (TTRANS > 0) then
      begin
        if FTime < TTRANS then
        begin
          SetAlarm(saNone);
          SetElement(seTransition);
        end
        else if FTime >= TTRANS then
        begin
          SetAlarm(saOpenFailure);
          SetElement(seOpenFailure);
        end;
      end
      else
      if (FDesireState = dsOpen) and (FStateSwitchClosed = esNotClosed) and (FStateSwitchOpen = esOpen) then
      begin
        SetAlarm(saNone);
        SetElement(seOpen);
      end;
    end;
  end;
end;

procedure TVCEElement.ControlModeDetermination;
begin
  if StateSwitchRemote = esLocal then
    FStateControlPosition := cmLocal;
  if StateSwitchRemote = esRemote then
  begin
    if StateAutoManual = smaManual then
      FStateControlPosition := cmManual
    else if StateAutoManual = smaAuto then
      FStateControlPosition := cmAuto;
  end;
end;

constructor TVCEElement.Create;
begin
  inherited;

  ElementType := eltVCE;
end;

procedure TVCEElement.DefaultValue;
begin
  inherited;

  FStateSwitchClosed := esClosed;
  FStateSwitchOpen := esNotOpen;

  FTime := 0;
end;

procedure TVCEElement.PlatformControl;
var
  TCTRL : Double;
begin

  TCTRL := Parameters.GetParameter(epTCTRL).ParamDoubleValue;

  if StateElementDisabled = sdDisabled then
  begin
    FControlClose := sacNotActivated;
    FControlOpen  := sacNotActivated;
    FDesireState  := dsNone;
  end
  else if CommandClose = sacActivated then
  begin
    FControlOpen := sacNotActivated;
    FDesireState := dsCLose;
    if TCTRL = 0 then
      FControlClose := sacActivated
    else if FTime <> TCTRL then
      FControlClose := sacNotActivated;
  end
  else if (FCommandOpen = sacActivated) then
  begin
    FControlClose := sacNotActivated;
    FDesireState  := dsOpen;
    if TCTRL = 0 then
      FControlOpen := sacActivated
    else if FTime <> TCTRL then
      FControlOpen := sacNotActivated;
  end;
end;

procedure TVCEElement.RunEverySecond;
begin
  inherited;

  PlatformControl;
  AlarmElementStateCalc;

  Inc(FTime);
end;

procedure TVCEElement.SetCommandClose(const Value: E_StateActivated);
begin
  if FCommandClose = Value then Exit;

  FCommandClose := Value;
  Listeners.TriggerEvents(Self,epElementCommandCloseChange,Byte(Value));

//  AlarmElementStateCalc;
end;

procedure TVCEElement.SetCommandOpen(const Value: E_StateActivated);
begin
  if FCommandOpen = Value then Exit;

  FCommandOpen := Value;
  Listeners.TriggerEvents(Self,epElementCommandOpenChange,Byte(Value));

//  AlarmElementStateCalc;
end;

procedure TVCEElement.SetElementParameters;
begin
  inherited;

  Parameters.AddParameter(epTTRANS,0);
  Parameters.AddParameter(epTCTRL,0);

end;

procedure TVCEElement.SetStateAutoManual(const Value: E_StateManualAuto);
begin
  if FStateAutoManual = Value then Exit;

  FStateAutoManual := Value;
  Listeners.TriggerEvents(Self,epElementManualAutoChange,Byte(Value));

//  AlarmElementStateCalc;
end;

procedure TVCEElement.SetStateElementDisabled(const Value: E_StateDisabled);
begin
  inherited;

//  AlarmElementStateCalc;
end;

procedure TVCEElement.SetStateRFU(const Value: E_StateNotRFU);
begin
  if FStateRFU = Value then Exit;

  FStateRFU := Value;
  Listeners.TriggerEvents(Self,epStateNoRFUChange,Byte(Value));

//  AlarmElementStateCalc;
end;

procedure TVCEElement.SetStateSwitchClosed(const Value: E_ExtStatus);
begin
  if FStateSwitchClosed = Value then Exit;

  FStateSwitchClosed := Value;
  Listeners.TriggerEvents(Self,epStateSwitchCloseChange,Byte(Value));

//  AlarmElementStateCalc;
end;

procedure TVCEElement.SetStateSwitchOpen(const Value: E_ExtStatus);
begin
  if FStateSwitchOpen = Value then Exit;

  FStateSwitchOpen := Value;
  Listeners.TriggerEvents(Self,epStateSwitchOpenChange,Byte(Value));

//  AlarmElementStateCalc;
end;

procedure TVCEElement.SetStateSwitchRemote(const Value: E_ExtStatus);
begin
  if FStateSwitchRemote = Value then Exit;

  FStateSwitchRemote := Value;
  Listeners.TriggerEvents(Self,epStateSwitchRemoteChange,Byte(Value));

//  AlarmElementStateCalc;
end;

end.
