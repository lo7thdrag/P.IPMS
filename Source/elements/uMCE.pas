{*------------------------------------------------------------------------------
  Motor Control Element (MCE)

  The Motor Control Element interfaces a motor starter unit on the platform.
  Though the MCE supports a wide range of platform components it usually
  processes the monitoring and control functions of a single speed motor.

  @author  DID
  @version 2013/07/16 1.0 Initial revision.
  @todo
  @comment
-------------------------------------------------------------------------------}

unit uMCE;

interface

uses uElement, uDataType;

type
  TMCEElement = class(TElement)
  private
    FCommandStartApp: E_StateActivated;
    FCommandStopApp: E_StateActivated;
    FCommandStartHMI: E_StateActivated;
    FCommandStopHMI: E_StateActivated;
    FStateManualAuto: E_StateManualAuto;
    FStateBlockOut: E_StateActivated;
    FStateRestart: E_StateActivated;
    FStateValueValid: E_StateValid;
    FRunCondition: E_StateRunCondition;
    FRFU: E_StateNotRFU;
    FDesireState: E_DesiredState;
    FStateSwitchRemote: E_ExtStatus;
    FStateSwitchRunning: E_ExtStatus;
    FStateSwitchNoFault: E_ExtStatus;
    FSetControl: E_ControlMode;
    FTimer : integer;

    procedure SetCommandStartApp(const aVal: E_StateActivated);
    procedure SetCommandStopApp(const aVal: E_StateActivated);
    procedure SetCommandStartHMI(const aVal: E_StateActivated);
    procedure SetCommandStopHMI(const aVal: E_StateActivated);
    procedure SetStateManualAuto(const aVal: E_StateManualAuto);
    procedure SetStateBlockOut(const aVal: E_StateActivated);
    procedure SetStateRestart(const aVal: E_StateActivated);
    procedure SetStateValueValid(const aVal: E_StateValid);
    procedure SetRunCondition(const aVal: E_StateRunCondition);
    procedure SetRFU(const aVal: E_StateNotRFU);
//    procedure SetStateSwitchRunning(const aVal: E_ExtStatus);
    procedure SetStateSwitchRemote(const aVal: E_ExtStatus);
//    procedure SetStateSwitchNoFault(const aVal: E_ExtStatus);

  protected
    procedure SetElementParameters; override;
    procedure SetStateElementDisabled(const aVal: E_StateDisabled);override;
  public
    constructor Create; override;

    procedure DefaultValue;override;
    procedure AlarmElementStateCalc; override;
    procedure ControlDetermintaion;override;
    procedure PlatformControl;override;
    procedure RunEverySecond;override;

    { input from Platform Interface }
    property StateSwitchRemote  : E_ExtStatus read FStateSwitchRemote
      write SetStateSwitchRemote default esLocal;
    property StateSwitchRunning : E_ExtStatus read FStateSwitchRunning
      write FStateSwitchRunning default esNotRunning;
    property StateSwitchNoFault : E_ExtStatus read FStateSwitchNoFault
      write FStateSwitchNoFault default esNoFault;

    { input from IPMS Interface }
    property CommandStartApp : E_StateActivated read FCommandStartApp
      write SetCommandStartApp;
    property CommandStartHMI : E_StateActivated read FCommandStartHMI
      write SetCommandStartHMI;
    property CommandStopApp  : E_StateActivated read FCommandStopApp
      write SetCommandStopApp;
    property CommandStopHMI  : E_StateActivated read FCommandStopHMI
      write SetCommandStopHMI;
    property StateManualAuto : E_StateManualAuto read FStateManualAuto
      write SetStateManualAuto;
    property StateBlockOut   : E_StateActivated read FStateBlockOut
      write SetStateBlockOut;
    property StateRestart    : E_StateActivated read FStateRestart
      write SetStateRestart;
    property StateValueValid : E_StateValid read FStateValueValid
      write SetStateValueValid;
    property RunCondition    : E_StateRunCondition read FRunCondition
      write SetRunCondition;
    property StateRFU        : E_StateNotRFU read FRFU write SetRFU;

  end;

implementation

{ TMCEElement }

procedure TMCEElement.AlarmElementStateCalc;
var

  TTRANS{, TCTRL}: Double;
begin
  inherited;

  TTRANS := Parameters.GetParameter(epTTRANS).ParamDoubleValue;
//  TCTRL  := Parameters.GetParameter(epTCTRL).ParamDoubleValue;

  if StateElementDisabled = sdDisabled then
  begin
    SetAlarm(saNoneDisable);
    SetElement(seDisabled);
  end;

  if (StateElementDisabled = sdEnabled) and
     (StateValueValid = svInvalid) then
  begin
    SetAlarm(saNone);
    SetElement(seInvalid);
  end;

  if (StateElementDisabled = sdEnabled) and
     (StateValueValid = svValid) then
  begin
    PlatformControl;

    if (StateSwitchNoFault = esFault) and (StateSwitchRunning = esNotRunning)then
    begin   {x->not running, blm tau caranya}
      SetAlarm(saFault);
      SetElement(seFault);
    end;

    if (StateSwitchNoFault = esFault) and (StateSwitchRunning = esRunning) then
    begin
      SetAlarm(saUnknown);
      SetElement(seUnknown);
    end;

    if (StateSwitchNoFault = esNoFault) then
    begin

      if StateSwitchRemote = esLocal then
      begin

        if StateSwitchRunning = esNotRunning then
        begin
          SetAlarm(saNone);
          SetElement(seStopped);
        end else
        if StateSwitchRunning = esRunning then
        begin
          SetAlarm(saNone);
          SetElement(seRunning);
        end;
      end else
      if StateSwitchRemote = esRemote then
      begin

        if StateRFU = snrNotRFU then
        begin
          SetAlarm(saNone);
          SetElement(seNotRFU);
        end else
        if StateRFU = snrRFU then begin

          if FDesireState = dsNone then begin

            if StateSwitchRunning = esNotRunning then begin
              SetAlarm(saNone);
              SetElement(seStopped);
            end else
            if StateSwitchRunning = esRunning then begin
              SetAlarm(saNone);
              SetElement(seRunning);
            end;
          end else
          if FDesireState = dsStop then begin

            if (StateSwitchRunning = esNotRunning) and (TTRANS > 0) then begin
              SetAlarm(saNone);
              SetElement(seStopped);
            end else
            if (StateSwitchRunning = esRunning) and (TTRANS = 0) then begin
              SetAlarm(saNone);
              SetElement(seRunning);
            end else
            if (StateSwitchRunning = esRunning) and (TTRANS > 0) and (FTimer < TTRANS) then begin
              SetAlarm(saNone);
              SetElement(seTransition);
            end else
            if (StateSwitchRunning = esRunning) and (TTRANS > 0) and (FTimer >= TTRANS) then begin
              SetAlarm(saStopFailure);
              SetElement(seStopFailure);
            end;
          end else
          if FDesireState = dsStart then begin

            if (StateSwitchRunning = esNotRunning) and (TTRANS = 0) then begin
              SetAlarm(saNone);
              SetElement(seStopped);
            end else
            if (StateSwitchRunning = esRunning) and (TTRANS > 0) then begin
              SetAlarm(saNone);
              SetElement(seRunning);
            end else
            if (StateSwitchRunning = esNotRunning) and (TTRANS > 0) and (FTimer < TTRANS) then begin
              SetAlarm(saNone);
              SetElement(seTransition);
            end else
            if (StateSwitchRunning = esNotRunning) and (TTRANS > 0) and (FTimer >= TTRANS) then begin
              SetAlarm(saStartFailure);
              SetElement(seRunFailure);
            end;
          end;
        end;
      end;
    end
  end;
end;

procedure TMCEElement.ControlDetermintaion;
begin
  if StateSwitchRemote = esLocal then
    FSetControl := cmLocal
  else if StateSwitchRemote = esRemote then
  begin
    if StateManualAuto = smaManual then
      FSetControl := cmManual
    else if StateManualAuto = smaAuto then
      FSetControl := cmAuto
  end;

  Listeners.TriggerEvents(Self, epElementStateControlPosChange, Byte(FSetControl));
end;

constructor TMCEElement.Create;
begin
  inherited;

  ELementType := eltMCE;
end;

procedure TMCEElement.DefaultValue;
begin
  inherited;
  FStateSwitchRemote  := esLocal;
  FStateSwitchRunning := esNotRunning;
  FStateSwitchNoFault := esNoFault;
  FStateValueValid    := svValid;

  FTimer := 0;
end;

procedure TMCEElement.PlatformControl;
begin
  ControlDetermintaion;

  if StateElementDisabled = sdDisabled then
    FDesireState := dsNone;

  if StateElementDisabled = sdEnabled then
    FDesireState := dsNone;

  if (StateElementDisabled = sdEnabled) and (FSetControl = cmLocal) then
  begin
    FDesireState := dsNone;
  end;

  if (StateElementDisabled = sdEnabled) and (RunCondition = srcNotOk) then
  begin
    if (FSetControl = cmAuto) or (FSetControl = cmManual) then
      FDesireState := dsStop;
  end
  else if (StateElementDisabled = sdEnabled) and (RunCondition = srcOk) then
  begin
    if (CommandStartApp = sacActivated) and (FSetControl = cmAuto) then
    begin

      if (StateRFU = snrRFU) then
        FDesireState := dsStart
      else if (StateRFU = snrNotRFU) then
        FDesireState := dsNone;
    end
    else if (CommandStartHMI = sacActivated) and (FSetControl = cmManual) then
    begin

      if (StateRFU = snrRFU) or (StateRFU = snrNotRFU) then
        FDesireState := dsStart;
    end
    else if (CommandStopApp = sacActivated) and (FSetControl = cmAuto) then
      FDesireState := dsStop
    else if (CommandStopHMI = sacActivated) and (FSetControl = cmManual) then
      FDesireState := dsStop
    else if (FSetControl = cmManual) or (FSetControl = cmAuto) then
      FDesireState := dsNone;
  end;

  Listeners.TriggerEvents(Self, epElementStateCommandChange, Byte(FDesireState));
end;

procedure TMCEElement.RunEverySecond;
begin
  inherited;
  AlarmElementStateCalc;

  Inc(FTimer);
end;

procedure TMCEElement.SetCommandStartApp(const aVal: E_StateActivated);
begin
  if FCommandStartApp = aVal then Exit;

  FCommandStartApp := aVal;
  Listeners.TriggerEvents(Self,epElementCommandStartAppChange,Byte(aVal));

//  AlarmElementStateCalc;
end;

procedure TMCEElement.SetCommandStartHMI(const aVal: E_StateActivated);
begin
  if FCommandStartHMI = aVal then Exit;

  FCommandStartHMI := aVal;
  Listeners.TriggerEvents(Self,epElementCommandStartHMIChange,Byte(aVal));

//  AlarmElementStateCalc;
end;

procedure TMCEElement.SetCommandStopApp(const aVal: E_StateActivated);
begin
  if FCommandStopApp = aVal then Exit;

  FCommandStopApp := aVal;
  Listeners.TriggerEvents(Self,epElementCommandStopAppChange,Byte(aVal));

//  AlarmElementStateCalc
end;

procedure TMCEElement.SetCommandStopHMI(const aVal: E_StateActivated);
begin
  if FCommandStopHMI = aVal then Exit;

  FCommandStopHMI := aVal;
  Listeners.TriggerEvents(Self,epElementCommandStopHMIChange,Byte(aVal));

//  AlarmElementStateCalc;
end;

procedure TMCEElement.SetElementParameters;
begin
  inherited;

  { default parameters }
  Parameters.AddParameter(epTTRANS, 0);
  Parameters.AddParameter(epTCTRL, 0);

end;

procedure TMCEElement.SetRFU(const aVal: E_StateNotRFU);
begin
  if FRFU = aVal then Exit;

  FRFU := aVal;
  Listeners.TriggerEvents(Self,epStateNoRFUChange,Byte(aVal));

//  AlarmElementStateCalc;
end;

procedure TMCEElement.SetRunCondition(const aVal: E_StateRunCondition);
begin
  if FRunCondition = aVal then Exit;

  FRunCondition := aVal;
  Listeners.TriggerEvents(Self,epElementRunChange,Byte(aVal));

//  AlarmElementStateCalc;
end;

procedure TMCEElement.SetStateBlockOut(const aVal: E_StateActivated);
begin
  if FStateBlockOut = aVal then Exit;

  FStateBlockOut := aVal;
  Listeners.TriggerEvents(Self,epElementBlackOutChange,Byte(aVal));

//  AlarmElementStateCalc;
end;

procedure TMCEElement.SetStateElementDisabled(const aVal: E_StateDisabled);
begin
  inherited;

//  AlarmElementStateCalc
end;

procedure TMCEElement.SetStateManualAuto(const aVal: E_StateManualAuto);
begin
  if FStateManualAuto = aVal then Exit;

  FStateManualAuto := aVal;
  Listeners.TriggerEvents(Self,epElementManualAutoChange,Byte(aVal));

//  AlarmElementStateCalc;
end;

procedure TMCEElement.SetStateRestart(const aVal: E_StateActivated);
begin
  if FStateRestart = aVal then Exit;

  FStateRestart := aVal;
  Listeners.TriggerEvents(Self,epElementRestartChange,Byte(aVal));

//  AlarmElementStateCalc;
end;

procedure TMCEElement.SetStateValueValid(const aVal: E_StateValid);
begin
  if FStateValueValid = aVal then Exit;

  FStateValueValid := aVal;
  Listeners.TriggerEvents(Self,epElementValidChange,Byte(aVal));

//  AlarmElementStateCalc;
end;

//procedure TMCEElement.SetStateSwitchNoFault(const aVal: E_ExtStatus);
//begin
//  if aVal in [esFault, esNoFault] then
//    FStateSwitchNoFault := aVal;
//
//  Listeners.TriggerEvents(Self,epStateNoFaultChange,Byte(aVal));
////  AlarmElementStateCalc;
//end;

procedure TMCEElement.SetStateSwitchRemote(const aVal: E_ExtStatus);
begin
  if aVal in [esRemote, esLocal] then
    FStateSwitchRemote := aVal;

  Listeners.TriggerEvents(Self,epStateSwitchRemoteChange,Byte(aVal));
//  AlarmElementStateCalc;
end;

//procedure TMCEElement.SetStateSwitchRunning(const aVal: E_ExtStatus);
//begin
//  if aVal in [esRunning, esNotRunning] then
//    FStateSwitchRunning := aVal;
//
//  Listeners.TriggerEvents(Self,epStateSwitchRunningChange,Byte(aVal));
////  AlarmElementStateCalc;
//end;

end.
