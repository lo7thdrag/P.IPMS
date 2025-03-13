{*------------------------------------------------------------------------------
  Motor Control Standby-element (MCS)

  The motor starter standby-element manages the control and monitoring functions
  relevant to of a motor starter with standby functionality. I.e. the motor is
  started automatically if certain conditions are met provided that the element
  state is ‘Standby’.

  @author  ryu
  @version 2013/07/16 1.0 Initial revision.
  @todo
  @comment
-------------------------------------------------------------------------------}

unit uMCS;

interface

uses uElement, uDataType;

type
  TMCSElement = class(TElement)
  private
    FCommandStandbyApp: E_StateActivated;
    FCommandStartApp: E_StateActivated;
    FCommandStopApp: E_StateActivated;
    FCommandStanbyHMI: E_StateActivated;
    FCommandStartHMI: E_StateActivated;
    FCommandStopHMI: E_StateActivated;
    FStateBlockOut: E_StateActivated;
    FStateRestart: E_StateActivated;
    FStateValueValid: E_StateValid;
    FStateManualAuto: E_StateManualAuto;
    FStateSwitchRFU: E_StateNotRFU;
    FRunCondition: E_StateRunCondition;
    FStateSwitchRemote: E_ExtStatus;
    FStateSwitchRunning: E_ExtStatus;
    FStateSwitchStanby: E_ExtStatus;
    FStateSwitchNoFault: E_ExtStatus;
    FControlMode: E_ControlMode;
    FOnStateMCSToPlatformCmd: T_ONStateMCSToPlatformCmd;
    FDesireState: E_DesiredState;

    procedure SetCommandStandbyApp(const aVal: E_StateActivated);
    procedure SetCommandStartApp(const aVal: E_StateActivated);
    procedure SetCommandStopApp(const aVal: E_StateActivated);
    procedure SetCommandStandbyHMI(const aVal: E_StateActivated);
    procedure SetCommandStartHMI(const aVal: E_StateActivated);
    procedure SetCommandStopHMI(const aVal: E_StateActivated);
    procedure SetStateBlockOut(const aVal: E_StateActivated);
    procedure SetStateRestart(const aVal: E_StateActivated);
    procedure SetStateValueValid(const aVal: E_StateValid);
    procedure SetStateManualAuto(const aVal: E_StateManualAuto);
    procedure SetStateSwitchRFU(const aVal: E_StateNotRFU);
    procedure SetRunCondition(const aVal: E_StateRunCondition);
    procedure SetSwitchRemote(const aVal: E_ExtStatus);
    procedure SetSwitchStandby(const aVal: E_ExtStatus);
    procedure SetSwitchRunning(const aVal: E_ExtStatus);
    procedure SetSwitchNoFault(const aVal: E_ExtStatus);
    procedure SetOnStateMCSToPlatformCmd(const aVal: T_ONStateMCSToPlatformCmd);

    procedure ControlMode;

  protected
    procedure PlatformControl;override;
    procedure SetElementParameters; override;
    procedure SetStateElementDisabled(const aVal: E_StateDisabled);override;

  public
    constructor Create; override;
    procedure AlarmElementStateCalc; override;
    { input from Platform Interface }
    property StateSwitchRemote : E_ExtStatus read FStateSwitchRemote
      write SetSwitchRemote;
    property StateSwitchRunning: E_ExtStatus read FStateSwitchRunning
      write SetSwitchRunning;
    property StateSwitchStandby: E_ExtStatus read FStateSwitchStanby
      write SetSwitchStandby;
    property StateSwitchNoFault: E_ExtStatus read FStateSwitchNoFault
      write SetSwitchNoFault;

    { output to IPMS Interface }
    property CommandStandbyApp: E_StateActivated read FCommandStandbyApp
      write SetCommandStandbyApp;
    property CommandStartApp  : E_StateActivated read FCommandStartApp
      write SetCommandStartApp;
    property CommandStopApp   : E_StateActivated read FCommandStopApp
      write SetCommandStopApp;
    property CommandStandbyHMI: E_StateActivated read FCommandStanbyHMI
      write SetCommandStandbyHMI;
    property CommandStartHMI  : E_StateActivated read FCommandStartHMI
      write SetCommandStartHMI;
    property CommandStopHMI   : E_StateActivated read FCommandStopHMI
      write SetCommandStopHMI;
    property StateBlockOut    : E_StateActivated read FStateBlockOut
      write SetStateBlockOut;
    property StateRestart     : E_StateActivated read FStateRestart
      write SetStateRestart;
    property StateValueValid  : E_StateValid read FStateValueValid
      write SetStateValueValid;
    property StateManualAuto  : E_StateManualAuto read FStateManualAuto
      write SetStateManualAuto;
    property StateSwitchRFU   : E_StateNotRFU read FStateSwitchRFU
      write SetStateSwitchRFU;
    property StateRunCondition: E_StateRunCondition read FRunCondition
      write SetRunCondition;

    { output to Platform Interface }
    property OnStateMCSToPlatformCmd: T_ONStateMCSToPlatformCmd
      read FOnStateMCSToPlatformCmd write SetOnStateMCSToPlatformCmd;
  end;

implementation

{ TMCSElement }
constructor TMCSElement.Create;
begin
  inherited;
  ELementType := eltMCS;
end;

procedure TMCSElement.AlarmElementStateCalc;
begin
  inherited;

  if StateElementDisabled = sdDisabled then begin
    SetAlarm(saNoneDisable);
    SetElement(seDisabled);
  end;

  if (StateElementDisabled = sdEnabled)  and
     (StateValueValid = svInvalid) then begin
    SetAlarm(saNone);
    SetElement(seInvalid);
  end;

  if (StateElementDisabled = sdEnabled) and
     (StateValueValid = svValid) then begin

    if StateSwitchNoFault = esFault then begin
      SetAlarm(saFault);
      SetElement(seFault);
    end else
    if (StateSwitchNoFault = esFault) and
       (StateSwitchRunning = esRunning) then begin
      SetAlarm(saUnknown);
      SetElement(seUnknown);
    end else
    if (StateSwitchNoFault = esFault) and
       (StateSwitchStandby = esStandby) then begin
      SetAlarm(saUnknown);
      SetElement(seUnknown);
    end else
    if (StateSwitchNoFault = esNoFault) and
       (StateSwitchRunning = esRunning) and
       (StateSwitchStandby = esStandby) then begin
      SetAlarm(saUnknown);
      SetElement(seUnknown);
    end else
    if (StateSwitchNoFault = esNoFault) then begin

      if StateSwitchRemote = esLocal then begin

        if (StateSwitchRunning = esNotRunning) and
           (StateSwitchStandby = esNotStandby) then begin
          SetAlarm(saNotStandby);
          SetElement(seStopped);
        end else
        if (StateSwitchRunning = esRunning) and
           (StateSwitchStandby = esNotStandby) then begin
          SetAlarm(saNone);
          SetElement(seRunning);
        end else
        if (StateSwitchRunning = esNotRunning) and
           (StateSwitchStandby = esStandby) then begin
          SetAlarm(saNone);
          SetElement(seStopped);
        end;
      end else
      if StateSwitchRemote = esRemote then begin

        if StateSwitchRFU = snrNotRFU then begin
          SetAlarm(saNone);
          SetElement(seNotRFU);
        end else
        if StateSwitchRFU = snrRFU then begin

          if FDesireState = dsNone then begin

            if (StateSwitchRunning = esNotRunning) and
               (StateSwitchStandby = esNotStandby) then begin
              SetAlarm(saNotStandby);
              SetElement(seStopped);
            end else
            if (StateSwitchRunning = esNotRunning) and
               (StateSwitchStandby = esStandby) then begin
              SetAlarm(saNone);
              SetElement(seStandby);
            end else
            if (StateSwitchRunning = esRunning) and
               (StateSwitchStandby = esNotStandby) then begin
              SetAlarm(saNone);
              SetElement(seRunning);
            end;
          end else
          if FDesireState = dsStop then begin

            if (StateSwitchRunning = esNotRunning) and
               (StateSwitchStandby = esNotStandby) and
               (Byte(epTTRANS) > 0) then begin
              SetAlarm(saNotStandby);
              SetElement(seStopped);
            end else
            if (StateSwitchRunning = esRunning) and
               (StateSwitchStandby = esNotStandby) then begin

              if (Byte(epTTRANS) > 0) and (epTCTRL < epTTRANS) then begin
               SetAlarm(saNone);
               SetElement(seTransition);
              end else
              if (Byte(epTTRANS) > 0) and (epTCTRL >= epTTRANS) then begin
               SetAlarm(saRunningFailedToStop);
               SetElement(seStopFailure);
              end else
              if (Byte(epTTRANS) = 0) and (epTCTRL >= epTTRANS) then begin
               SetAlarm(saNone);
               SetElement(seRunning);
              end;
            end else
            if (StateSwitchRunning = esNotRunning) and
               (StateSwitchStandby = esStandby) then begin

              if (Byte(epTTRANS) > 0) and (epTCTRL < epTTRANS) then begin
                SetAlarm(saNone);
                SetElement(seTransition);
              end else
              if (Byte(epTTRANS) > 0) and (epTCTRL >= epTTRANS) then begin
               SetAlarm(saStandbyFailedToStop);
               SetElement(seStandbyFailedToStop);
              end;
            end;
          end else
          if FDesireState = dsStart then begin

            if (StateSwitchRunning = esRunning) and
               (StateSwitchStandby = esNotStandby) and
               (Byte(epTTRANS) > 0) then begin
              SetAlarm(saNone);
              SetElement(seRunning);
            end else
            if StateSwitchRunning = esNotRunning  then begin

              if (Byte(epTTRANS) > 0) and (epTCTRL < epTTRANS) then begin
                SetAlarm(saNotStandby);
                SetElement(seTransition);
              end else
              if (Byte(epTTRANS) > 0) and (epTCTRL >= epTTRANS) then begin
               SetAlarm(saStartFailure);
               SetElement(seStartFailure);
              end;
            end;
          end else
          if FDesireState = dsStandby then begin

            if (StateSwitchRunning = esNotRunning) and
               (StateSwitchStandby = esStandby) and
               (Byte(epTTRANS) > 0) then begin
              SetAlarm(saNone);
              SetElement(seStandby);
            end else
            if StateSwitchStandby = esNotStandby then begin

              if (Byte(epTTRANS) > 0) and (epTCTRL < epTTRANS) then begin
                SetAlarm(saNotStandby);
                SetElement(seTransition);
              end else
              if (Byte(epTTRANS) > 0) and (epTCTRL >= epTTRANS) then begin
               SetAlarm(saStandbyFailure);
               SetElement(seStandbyFailure);
              end;
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure TMCSElement.ControlMode;
begin
  if FStateSwitchRemote = esLocal then
    FControlMode := cmLocal
  else
  if FStateSwitchRemote = esRemote then
  begin

    if FStateManualAuto = smaManual then
      FControlMode := cmManual
    else if FStateManualAuto = smaAuto then
      FControlMode := cmAuto;
  end;
end;

procedure TMCSElement.PlatformControl;
begin
  inherited;
  { PMS apa'an ya??  }

  if FStateElementDisabled = sdDisabled then
  begin
    FDesireState := dsNone;
  end;

  if FStateElementDisabled = sdEnabled then {kurang Command any -> none. gag tau}
  begin
    FDesireState := dsNone;
  end;

  if FStateElementDisabled = sdEnabled then
  begin

    if Assigned(FOnStateMCSToPlatformCmd) then
    begin
      FDesireState := dsNone;

      if (FCommandStopApp = sacActivated) and
         (FControlMode = cmAuto) then
        FDesireState := dsStop
      else
      if (FCommandStartApp = sacActivated) and
         (FRunCondition = srcOk) and
         (FStateSwitchRFU = snrRFU) and
         (FControlMode = cmAuto) then
        FDesireState := dsStart
      else
      if (FCommandStartApp = sacActivated) and
         (FRunCondition = srcOk) and
         (FStateSwitchRFU = snrNotRFU) and
         (FControlMode = cmAuto) then
        FDesireState := dsNone
      else
      if (FCommandStandbyApp = sacActivated) and
         (FStateSwitchRFU = snrRFU) and
         (FControlMode = cmAuto) then
        FDesireState := dsStandby
      else
      if (FCommandStopHMI = sacActivated) and
         (FControlMode = cmManual) then
        FDesireState := dsStop
      else
      if (FCommandStartHMI = sacActivated) and
         (FRunCondition = srcOk) and
         (FStateSwitchRFU = snrRFU) and
         (FControlMode = cmManual) then
        FDesireState := dsStart
      else
      if (FCommandStartHMI = sacActivated) and
         (FRunCondition = srcOk) and
         (FStateSwitchRFU = snrNotRFU) and
         (FControlMode = cmManual) then
        FDesireState := dsNone
      else
      if (FCommandStanbyHMI = sacActivated) and
         (FStateSwitchRFU = snrRFU) and
         (FControlMode = cmManual) then
        FDesireState := dsStandby;
    end else
    if FControlMode = cmLocal  then  {ini ndak tau controlnya start apa stop}
      FDesireState := dsNone
    else
    if FRunCondition = srcNotOk then
    begin

      if (FControlMode = cmManual) or
         (FControlMode = cmAuto) then
        FDesireState := dsStop;
    end
  end;
end;

procedure TMCSElement.SetCommandStandbyApp(const aVal: E_StateActivated);
begin
  FCommandStandbyApp := aVal;
  PlatformControl;
end;

procedure TMCSElement.SetCommandStandbyHMI(const aVal: E_StateActivated);
begin
  FCommandStanbyHMI := aVal;
  PlatformControl;
end;

procedure TMCSElement.SetCommandStartApp(const aVal: E_StateActivated);
begin
  FCommandStartApp := aVal;
  PlatformControl;
end;

procedure TMCSElement.SetCommandStartHMI(const aVal: E_StateActivated);
begin
  FCommandStartHMI := aVal;
  PlatformControl;
end;

procedure TMCSElement.SetCommandStopApp(const aVal: E_StateActivated);
begin
  FCommandStopApp := aVal;
  PlatformControl;
end;

procedure TMCSElement.SetCommandStopHMI(const aVal: E_StateActivated);
begin
  FCommandStopHMI := aVal;
  PlatformControl;
end;

procedure TMCSElement.SetElementParameters;
begin
  inherited;

  { default parameters }
  Parameters.AddParameter(epTTRANS, 0);
  Parameters.AddParameter(epTCTRL, 0);

end;

procedure TMCSElement.SetOnStateMCSToPlatformCmd(
  const aVal: T_ONStateMCSToPlatformCmd);
begin
  FOnStateMCSToPlatformCmd := aVal;
end;

procedure TMCSElement.SetRunCondition(const aVal: E_StateRunCondition);
begin
  FRunCondition := aVal;
  PlatformControl;
end;

procedure TMCSElement.SetStateBlockOut(const aVal: E_StateActivated);
begin
  FStateBlockOut := aVal;
  PlatformControl;
end;

procedure TMCSElement.SetStateElementDisabled(const aVal: E_StateDisabled);
begin
  inherited;

  PlatformControl;
  AlarmElementStateCalc;
end;

procedure TMCSElement.SetStateManualAuto(const aVal: E_StateManualAuto);
begin
  FStateManualAuto := aVal;
  ControlMode;
end;

procedure TMCSElement.SetStateRestart(const aVal: E_StateActivated);
begin
  FStateRestart := aVal;
  PlatformControl;
end;

procedure TMCSElement.SetStateSwitchRFU(const aVal: E_StateNotRFU);
begin
  FStateSwitchRFU := aVal;

  PlatformControl;
  AlarmElementStateCalc;
end;

procedure TMCSElement.SetStateValueValid(const aVal: E_StateValid);
begin
  FStateValueValid := aVal;

  PlatformControl;
  AlarmElementStateCalc;
end;

procedure TMCSElement.SetSwitchNoFault(const aVal: E_ExtStatus);
begin
  if aVal in [esFault, esNoFault] then
    FStateSwitchNoFault := aVal;

  PlatformControl;
  AlarmElementStateCalc;
end;

procedure TMCSElement.SetSwitchRemote(const aVal: E_ExtStatus);
begin
  if aVal in [esRemote, esLocal] then
    FStateSwitchRemote := aVal;

  PlatformControl;
  AlarmElementStateCalc;
  ControlMode;
end;

procedure TMCSElement.SetSwitchRunning(const aVal: E_ExtStatus);
begin
  if aVal in [esRunning, esNotRunning] then
    FStateSwitchRunning := aVal;

  PlatformControl;
  AlarmElementStateCalc;
end;

procedure TMCSElement.SetSwitchStandby(const aVal: E_ExtStatus);
begin
  if aVal in [esStandby, esNotStandby] then
    FStateSwitchStanby := aVal;

  PlatformControl;
  AlarmElementStateCalc;
end;

end.
