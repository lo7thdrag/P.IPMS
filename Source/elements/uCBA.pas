{*------------------------------------------------------------------------------
  Circuit Breaker element for Applications (CBA)

  The function of the circuit breaker element for applications is to
    forward both the breaker status (including relevant alarms) and breaker commands
    from/to an external application like a Power Management System.
    As this application  must have full control over the circuit breaker,
    the element processing only  adapts the signals it needs to achieve a proper
    HMI interface

  @author  Ryu
  @version 2013/07/15 1.0 Initial revision.
  @todo
  @comment
-------------------------------------------------------------------------------}

unit uCBA;

interface

uses uElement, uDataType;

type

  TCBAElement = class(TElement)
  private
    FStateStatus: E_ExtStatus;
    FStateCommandOpen: E_StateActivated;
    FStateManualAuto: E_StateManualAuto;
    FStateCommandClose: E_StateActivated;
    FOnCBAToPMACommand: T_OnStateCBAToPMACommand;

    procedure SetStateStatus(const aVal: E_ExtStatus);
    procedure SetStateCommandClose(const aVal: E_StateActivated);
    procedure SetStateCommandOpen(const aVal: E_StateActivated);
    procedure SetStateManualAuto(const aVal: E_StateManualAuto);
    procedure SetOnCBAToPMACommand(const aVal: T_OnStateCBAToPMACommand);


  protected
    procedure PlatformControl;override;
    procedure SetStateElementDisabled(const aVal: E_StateDisabled);override;
  public
    constructor Create; override;

    procedure DefaultValue;override;
    procedure AlarmElementStateCalc;override;

    { input }
    property StateStatus : E_ExtStatus read FStateStatus write SetStateStatus;   { from Power Management }
    property StateCommandClose : E_StateActivated read FStateCommandClose
      write SetStateCommandClose;
    property StateCommandOpen  : E_StateActivated read FStateCommandOpen
      write SetStateCommandOpen;
    property StateManualAuto   : E_StateManualAuto read FStateManualAuto
      write SetStateManualAuto;

    { output to Power Management App }
    property OnCBAToPMACommand : T_OnStateCBAToPMACommand
      read FOnCBAToPMACommand write SetOnCBAToPMACommand;

  end;

implementation

uses uFunction;
{ TCBAElement }

procedure TCBAElement.AlarmElementStateCalc;
begin
  inherited;

  if StateElementDisabled = sdDisabled then
  begin
    SetAlarm(saNoneDisable);
    SetElement(seDisabled);
  end else
  if StateElementDisabled = sdEnabled then
  begin

    if StateStatus = esClosed then
    begin
      SetAlarm(saNone);
      SetElement(seClosed);
    end else
    if StateStatus = esOpen then
    begin
      SetAlarm(saNone);
      SetElement(seOpen);
    end else
    if StateStatus = esNotRFO then
    begin
      SetAlarm(saNone);
      SetElement(seNotRFO);
    end else
    if StateStatus = esNotRFC then
    begin
      SetAlarm(saNone);
      SetElement(seNotRFC);
    end else
    if StateStatus = esTransition then
    begin
      SetAlarm(saNone);
      SetElement(seTransition);
    end else
    if StateStatus = esTripped then
    begin
      SetAlarm(saTripped);
      SetElement(seTripped);
    end else
    if StateStatus = esFault then
    begin
      SetAlarm(saFault);
      SetElement(seFault);
    end else
    if StateStatus = esUnknown then
    begin
      SetAlarm(saUnknown);
      SetElement(seUnknown);
    end else
    if StateStatus = esFailedToClose then
    begin
      SetAlarm(saOpenFailure);
      SetElement(seFailedToClose);
    end else
    if StateStatus = esFailedToOpen then
    begin
      SetAlarm(saCLoseFailure);
      SetElement(seFailedToOpen);
    end;
  end;
end;

constructor TCBAElement.Create;
begin
  inherited;
  ElementType := eltCBA;
end;

procedure TCBAElement.DefaultValue;
begin
  inherited;
  FStateStatus := esOpen;
end;

procedure TCBAElement.PlatformControl;
begin
  inherited;
{perlu revisi}
  if FStateElementDisabled = sdDisabled then
  begin

    if Assigned(FOnCBAToPMACommand) then
    begin
      FOnCBAToPMACommand(Self, ecClose);
      FOnCBAToPMACommand(Self, ecOpen);

      AlarmElementStateCalc;
    end;

    FOnCBAToPMACommand(Self, ecClose);
    FOnCBAToPMACommand(Self, ecOpen);
    FOnCBAToPMACommand(Self, ecDisableElement);
    FOnCBAToPMACommand(Self, ecManual);
  end;
end;

procedure TCBAElement.SetOnCBAToPMACommand(
  const aVal: T_OnStateCBAToPMACommand);
begin
  FOnCBAToPMACommand := aVal;
end;

procedure TCBAElement.SetStateCommandClose(const aVal: E_StateActivated);
begin
  FStateCommandClose := aVal;

  if Assigned(FOnCBAToPMACommand) then
  begin

    if FStateCommandClose = sacActivated then
      FOnCBAToPMACommand(Self, ecClose)
  end;

  PlatformControl;
end;

procedure TCBAElement.SetStateCommandOpen(const aVal: E_StateActivated);
begin
  FStateCommandOpen := aVal;

  if Assigned(FOnCBAToPMACommand) then
  begin

    if FStateCommandOpen = sacActivated then
      FOnCBAToPMACommand(Self, ecOpen)
  end;

  PlatformControl;
end;

procedure TCBAElement.SetStateElementDisabled(const aVal: E_StateDisabled);
begin
  inherited;

  if Assigned(FOnCBAToPMACommand) then begin
    if FStateElementDisabled = sdEnabled then
      FOnCBAToPMACommand(Self, ecDisableElement)
    else
      FOnCBAToPMACommand(Self, ecEnableElement)
  end;

  PlatformControl;
end;

procedure TCBAElement.SetStateManualAuto(const aVal: E_StateManualAuto);
begin
  FStateManualAuto := aVal;

  Listeners.TriggerEvents(Self,epElementDebugInfo,'State Manual : ' + ElementStateManualToStr(aVal));

  if Assigned(FOnCBAToPMACommand) then begin
    if FStateManualAuto = smaManual then
      FOnCBAToPMACommand(Self, ecManual)
    else
      FOnCBAToPMACommand(Self, ecAuto)
  end;

  PlatformControl;
end;

procedure TCBAElement.SetStateStatus(const aVal: E_ExtStatus);
begin
  if FStateStatus = aVal then Exit;

  FStateStatus := aVal;

  if aVal = esClosed then begin
    FStateCommandClose := sacActivated;
    FStateCommandOpen  := sacNotActivated;
  end else
  if aVal = esOpen then begin
    FStateCommandClose := sacNotActivated;
    FStateCommandOpen  := sacActivated;
  end;

  AlarmElementStateCalc;
end;

end.
