unit uVCH;

interface

uses uElement, uDataType;

type
  TVCHElement = class(TElement)
  private
    FStateRFU: E_StateNotRFU;
    FStateSwitchRemote: E_StateSwitchRemote;
    FDesireState: E_DesiredState;
    FStateSwitchClosed: E_StateSwitchClosed;
    FStateSwitchOpen: E_StateSwitchOpen;
    FTrans, Ft : Integer;
    FControlRun : E_ControlRun;
    FControlDirection : E_ControlDirection;
    FCommandOpen, FCommandClose : E_StateActivated;
    FStateControlPosition : E_ControlMode;
    FStateAutoManual: E_StateManualAuto;

    procedure SetStateRFU(const Value: E_StateNotRFU);
    procedure SetStateSwitchRemote(const Value: E_StateSwitchRemote);
    procedure SetDesireState(const Value: E_DesiredState);
    procedure SetStateSwitchClosed(const Value: E_StateSwitchClosed);
    procedure SetStateSwitchOpen(const Value: E_StateSwitchOpen);
    procedure SetCommandOpen(const Value: E_StateActivated);
    procedure SetCommandClose(const Value: E_StateActivated);
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

    { element input }
    property StateRFU : E_StateNotRFU read FStateRFU write SetStateRFU;
    property StateSwitchRemote : E_StateSwitchRemote read FStateSwitchRemote write SetStateSwitchRemote;
    property DesireState : E_DesiredState read FDesireState write SetDesireState;
    property StateSwitchClosed : E_StateSwitchClosed read FStateSwitchClosed write SetStateSwitchClosed;
    property StateSwitchOpen : E_StateSwitchOpen read FStateSwitchOpen write SetStateSwitchOpen;
    property CommandOpen: E_StateActivated read FCommandOpen write SetCommandOpen;
    property CommandClose: E_StateActivated read FCommandClose write SetCommandClose;
    property StateAutoManual: E_StateManualAuto read FStateAutoManual write SetStateAutoManual;

    { element output }
    property ControlRun : E_ControlRun read FControlRun;
    property ControlDirection : E_ControlDirection read FControlDirection;
    property StateControlPosition : E_ControlMode read FStateControlPosition;

  end;

implementation

{ TVCHElement }

procedure TVCHElement.AlarmElementStateCalc;
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
    if (FStateSwitchClosed = sscClosed) and (FStateSwitchOpen = ssoOpen) then
    begin
      SetAlarm(saUnknown);
      SetElement(seUnknown);
    end
    else
    if (FStateSwitchRemote = ssrLocal) then
    begin
      if (FStateSwitchClosed = sscClosed) and (FStateSwitchOpen = ssoNotOpened) then
      begin
        SetAlarm(saNone);
        SetElement(seClosed);
      end
      else
      if (FStateSwitchClosed = sscNotClosed) and (FStateSwitchOpen = ssoNotOpened) then
      begin
        SetAlarm(saNone);
        SetElement(seNone);
      end
      else
      if (FStateSwitchClosed = sscNotClosed) and (FStateSwitchOpen = ssoOpen) then
      begin
        SetAlarm(saNone);
        SetElement(seOpen);
      end;
    end
    else
    if (FStateRFU = snrNotRFU) and (FStateSwitchRemote = ssrRemote) then
    begin
      SetAlarm(saNone);
      SetElement(seNotRFU);
    end
    else
    if (FStateRFU = snrRFU) and (FStateSwitchRemote = ssrRemote) then
    begin
      if (FDesireState = dsNone) then
      begin
        if (FStateSwitchClosed = sscNotClosed) and (FStateSwitchOpen = ssoNotOpened) then
        begin
          SetAlarm(saNone);
          SetElement(seNone);
        end
        else if (FStateSwitchClosed = sscClosed) and (FStateSwitchOpen = ssoNotOpened) then
        begin
          SetAlarm(saNone);
          SetElement(seClosed);
        end
        else if (FStateSwitchClosed = sscNotClosed) and (FStateSwitchOpen = ssoOpen) then
        begin
          SetAlarm(saNone);
          SetElement(seOpen);
        end;
      end
      else
      if (FDesireState = dsCLose) and (FStateSwitchClosed = sscNotClosed) and (FStateSwitchOpen = ssoNotOpened) then
      begin
        if Ft < FTrans then
        begin
          SetAlarm(saNone);
          SetElement(seTransition);
        end
        else if Ft >= FTrans then
        begin
          SetAlarm(saCLoseFailure);
          SetElement(seCloseFailure);
        end;
      end
      else
      if (FDesireState = dsCLose) and (FStateSwitchClosed = sscClosed) and (FStateSwitchOpen = ssoNotOpened) then
      begin
        SetAlarm(saNone);
        SetElement(seClosed);
      end
      else
      if (FDesireState = dsCLose) and (FStateSwitchClosed = sscNotClosed) and (FStateSwitchOpen = ssoOpen) then
      begin
        if Ft < FTrans then
        begin
          SetAlarm(saNone);
          SetElement(seTransition);
        end
        else if Ft >= FTrans then
        begin
          SetAlarm(saCLoseFailure);
          SetElement(seCloseFailure);
        end;
      end
      else
      if (FDesireState = dsOpen) and (FStateSwitchClosed = sscNotClosed) and (FStateSwitchOpen = ssoNotOpened) then
      begin
        if Ft < FTrans then
        begin
          SetAlarm(saNone);
          SetElement(seTransition);
        end
        else if Ft >= FTrans then
        begin
          SetAlarm(saOpenFailure);
          SetElement(seOpenFailure);
        end;
      end
      else
      if (FDesireState = dsOpen) and (FStateSwitchClosed = sscNotClosed) and (FStateSwitchOpen = ssoOpen) then
      begin
        SetAlarm(saNone);
        SetElement(seOpen);
      end
      else
      if (FDesireState = dsOpen) and (FStateSwitchClosed = sscClosed) and (FStateSwitchOpen = ssoNotOpened) then
      begin
        if Ft < FTrans then
        begin
          SetAlarm(saNone);
          SetElement(seTransition);
        end
        else if Ft >= FTrans then
        begin
          SetAlarm(saOpenFailure);
          SetElement(seOpenFailure);
        end;
      end;
    end;
  end;
end;

procedure TVCHElement.ControlModeDetermination;
begin
  if FStateSwitchRemote = ssrLocal then
    FStateControlPosition := cmLocal;
  if FStateSwitchRemote = ssrRemote then
  begin
    if FStateAutoManual = smaManual then
      FStateControlPosition := cmManual
    else if FStateAutoManual = smaAuto then
      FStateControlPosition := cmAuto;
  end;
end;

constructor TVCHElement.Create;
begin
  inherited;

  ElementType := eltVCH;
end;

procedure TVCHElement.DefaultValue;
begin
  inherited;

end;

procedure TVCHElement.PlatformControl;
begin
  inherited;
  if (FStateElementDisabled = sdDisabled) then
  begin
    if (FStateElementDisabled = sdDisabled) then
    begin
      FControlRun := crStop;
      FControlDirection := cdClose;
      FDesireState := dsNone;
    end;
  end
  else if (FCommandOpen = sacActivated) then
  begin
    FControlDirection := cdClose;
    FDesireState := dsOpen;
    if Integer(epTCTRL) = 0 then
      FControlRun := crRun
    else if (Ft <> (Integer(epTCTRL)+ Integer(epTCDD))) then
      FControlRun := crStop;
  end
  else if (FCommandClose = sacActivated) then
  begin
    FControlDirection := cdOpen;
    FDesireState := dsCLose;
    if Integer(epTCTRL) = 0 then
      FControlRun := crRun
    else if (Ft <> (Integer(epTCTRL)+ Integer(epTCDD))) then
      FControlRun := crStop;
  end;

  { -- belum tau --}
  if ({initialising OR FStateSwitchRemote = Open _> Closed OR}
    FStateElementDisabled = sdDisabled {_> enabled}) then
  begin
    if FStateSwitchClosed = sscClosed then
      FDesireState  := dsCLose
    else if FStateSwitchOpen = ssoOpen then
      FDesireState  := dsOpen
    else
      FDesireState  := dsNone;
  end;
end;

procedure TVCHElement.SetCommandClose(const Value: E_StateActivated);
begin
  if FCommandOpen = Value then Exit;

  FCommandOpen := Value;
  Listeners.TriggerEvents(Self,epElementCommandOpenChange,Byte(Value));

  PlatformControl;
end;

procedure TVCHElement.SetCommandOpen(const Value: E_StateActivated);
begin
  if FCommandClose = Value then Exit;

  FCommandClose := Value;
  Listeners.TriggerEvents(Self,epElementCommandCloseChange,Integer(Value));

  PlatformControl;
end;

procedure TVCHElement.SetDesireState(const Value: E_DesiredState);
begin
  FDesireState := Value;
  AlarmElementStateCalc;
end;

procedure TVCHElement.SetElementParameters;
begin
  inherited;

  Parameters.AddParameter(epTTRANS,0);
  Parameters.AddParameter(epTCDD,0);
  Parameters.AddParameter(epTCTRL,0);
end;

procedure TVCHElement.SetStateAutoManual(const Value: E_StateManualAuto);
begin
  if FStateAutoManual = Value then Exit;

  FStateAutoManual := Value;
  Listeners.TriggerEvents(Self,epElementManualAutoChange,Byte(Value));

  ControlModeDetermination;
end;

procedure TVCHElement.SetStateElementDisabled(const Value: E_StateDisabled);
begin
  inherited;
  AlarmElementStateCalc;
  PlatformControl;
end;

procedure TVCHElement.SetStateRFU(const Value: E_StateNotRFU);
begin
  if FStateRFU = Value then Exit;

  FStateRFU := Value;
  Listeners.TriggerEvents(Self,epStateNoRFUChange,Byte(Value));

  AlarmElementStateCalc;
end;

procedure TVCHElement.SetStateSwitchClosed(const Value: E_StateSwitchClosed);
begin
  if FStateSwitchClosed = Value then Exit;

  FStateSwitchClosed := Value;
  Listeners.TriggerEvents(Self,epStateSwitchCloseChange,Byte(Value));

  AlarmElementStateCalc;
  PlatformControl;
end;

procedure TVCHElement.SetStateSwitchOpen(const Value: E_StateSwitchOpen);
begin
  if FStateSwitchOpen = Value then Exit;

  FStateSwitchOpen := Value;
  Listeners.TriggerEvents(Self,epStateSwitchOpenChange,Byte(Value));

  AlarmElementStateCalc;
  PlatformControl;
end;

procedure TVCHElement.SetStateSwitchRemote(const Value: E_StateSwitchRemote);
begin
  if FStateSwitchRemote = Value then Exit;

  FStateSwitchRemote := Value;
  Listeners.TriggerEvents(Self,epStateSwitchRemoteChange,Byte(Value));

  AlarmElementStateCalc;
  PlatformControl;
  ControlModeDetermination;
end;

end.
