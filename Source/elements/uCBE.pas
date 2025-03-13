{*------------------------------------------------------------------------------
  Circuit Breaker Element (CBE)

  The function of the circuit breaker element is support monitoring
    and control functions relevant for a circuit breaker such as commands,
    statuses and alarms. This element supports alarm inhibition. To use this
    feature, an external logical expression must define all platform states
    that might cause a spurious CBE alarm.

  author  ryu
  @version 2013/07/16 1.0 Initial revision.
  @todo
  @comment
-------------------------------------------------------------------------------}

unit uCBE;

interface

uses uElement, uDataType;

type
  TCBEElement = class(TElement)
  private
    FStateCommandOpenApp: E_StateActivated;
    FStateAlarmInhibited: E_StateInhibit;
    FStateSwitchClosed: E_ExtStatus;
    FStateCommandCloseApp: E_StateActivated;
    FStateRFO: E_StateRFO;
    FStateManualAuto: E_StateManualAuto;
    FStateCommandOpenHMI: E_StateActivated;
    FStateRFC: E_StateRFC;
    FStateCommandCloseHMI: E_StateActivated;
    FStateSwitchRemote: E_ExtStatus;
    FStateSwitchNoFault: E_ExtStatus;
    FStateSwitchTripped: E_ExtStatus;
    FStateSwitchOpen: E_ExtStatus;
    FOnStateCBEToPlatformCmd: T_ONStateCBEToPlatformCmd;
    FDesiredState: E_DesiredState;
//    FControlMode: E_ControlMode;
    FTime : integer;

    FStatePMSSwitchClosedOpen : E_StateElement;

    procedure SetStateAlarmInhibited(const aVal: E_StateInhibit);
    procedure SetStateCommandCloseApp(const aVal: E_StateActivated);
    procedure SetStateCommandCloseHMI(const aVal: E_StateActivated);
    procedure SetStateCommandOpenApp(const aVal: E_StateActivated);
    procedure SetStateCommandOpenHMI(const aVal: E_StateActivated);
    procedure SetStateManualAuto(const aVal: E_StateManualAuto);
    procedure SetStateRFC(const aVal: E_StateRFC);
    procedure SetStateRFO(const aVal: E_StateRFO);
    procedure SetStateSwitchClosed(const aVal: E_ExtStatus);
    procedure SetStateSwitchNoFault(const aVal: E_ExtStatus);
    procedure SetStateSwitchOpen(const aVal: E_ExtStatus);
    procedure SetStateSwitchRemote(const aVal: E_ExtStatus);
    procedure SetStateSwitchTripped(const aVal: E_ExtStatus);
    procedure SetOnStateCBEToPlatformCmd(
      const aVal: T_ONStateCBEToPlatformCmd);

    procedure SetStatePMSSwitchClosedOpen(const aVal: E_StateElement);

//    procedure ControlMode;

  protected
    procedure PlatformControl;override;
    procedure SetElementParameters;override;
    procedure SetStateElementDisabled(const aVal: E_StateDisabled);override;
  public
    constructor Create; override;

    procedure DefaultValue;override;
    procedure AlarmElementStateCalc;override;
    procedure RunEverySecond;override;

    { input from IPMS interface }
    property StateCommandCloseApp : E_StateActivated read FStateCommandCloseApp
      write SetStateCommandCloseApp;
    property StateCommandOpenApp  : E_StateActivated read FStateCommandOpenApp
      write SetStateCommandOpenApp;
    property StateCommandCloseHMI : E_StateActivated read FStateCommandCloseHMI
      write SetStateCommandCloseHMI;
    property StateCommandOpenHMI  : E_StateActivated read FStateCommandOpenHMI
      write SetStateCommandOpenHMI;
    property StateAlarmInhibited  : E_StateInhibit read FStateAlarmInhibited
      write SetStateAlarmInhibited;
    property StateManualAuto      : E_StateManualAuto read FStateManualAuto
      write SetStateManualAuto;
    property StateRFC             : E_StateRFC read FStateRFC write SetStateRFC;
    property StateRFO             : E_StateRFO read FStateRFO write SetStateRFO;

    { input from platform interface }
    property StateSwitchClosed    : E_ExtStatus read FStateSwitchClosed
      write SetStateSwitchClosed;
    property StateSwitchOpen      : E_ExtStatus read FStateSwitchOpen
      write SetStateSwitchOpen;
    property StateSwitchRemote    : E_ExtStatus read FStateSwitchRemote
      write SetStateSwitchRemote;
    property StateSwitchTripped   : E_ExtStatus read FStateSwitchTripped
      write SetStateSwitchTripped;
    property StateSwitchNoFault   : E_ExtStatus read FStateSwitchNoFault
      write SetStateSwitchNoFault;

    { Prince : input from PMS interface }
    property StatePMSSwitchClosedOpen    : E_StateElement read FStatePMSSwitchClosedOpen
      write SetStatePMSSwitchClosedOpen;

    { output to Platform inteface }
    property OnStateCBEToPlatformCmd : T_ONStateCBEToPlatformCmd
      read FOnStateCBEToPlatformCmd write SetOnStateCBEToPlatformCmd;

  end;

implementation


{ TCBEElement }
constructor TCBEElement.Create;
begin
  inherited;
  ELementType := eltCBE;
end;

procedure TCBEElement.DefaultValue;
begin
  inherited;
  FStateSwitchTripped := esNotTripped;
  FStateSwitchNoFault := esNoFault;
  FStateRFC := srfNotReadyForClose;

  FTime  := 0;
end;

procedure TCBEElement.AlarmElementStateCalc;
var
  TTRANS{, TCTRL} : Double;
begin
  inherited;

//  t := 10;
  TTRANS := Parameters.GetParameter(epTTRANS).ParamDoubleValue;
//  TCTRL := Parameters.GetParameter(epTTRANS).ParamDoubleValue;

  PlatformControl;

  if StateElementDisabled = sdDisabled then
  begin
    SetAlarm(saNoneDisable);
    SetElement(seDisabled);
  end;

  if (StateElementDisabled = sdEnabled) and
     (StateSwitchTripped = esTripped )then
  begin
    SetAlarm(saTripped);
    SetElement(seTripped);
  end;

  if (StateElementDisabled = sdEnabled) and
     (StateSwitchTripped = esNotTripped) then
  begin

    if StateSwitchNoFault = esFault then
    begin
      SetAlarm(saFault);
      SetElement(seFault);
    end else
    if StateSwitchNoFault = esNoFault then
    begin

      if (StateSwitchClosed = esClosed) and
         (StateSwitchOpen = esOpen)then
      begin
        SetAlarm(saUnknown);
        SetElement(seUnknown);
      end;

      if StateRFC = srfNotReadyForClose then
      begin
        SetAlarm(saNone);
        SetElement(seNotRFC);
      end else
      if StateRFO = sroNotReadyForOpen then
      begin
        SetAlarm(saNone);
        SetElement(seNotRFO);
      end else
      if (StateRFC = srfReadyForClose) and
         (StateRFO = sroReadyForOpen) then
      begin

        if StateSwitchRemote = esLocal then
        begin

          if (StateSwitchClosed = esClosed) and
             (StateSwitchOpen = esNotOpen) then
          begin
            SetAlarm(saNone);
            SetElement(seClosed);
          end else
          if (StateSwitchClosed = esNotClosed) and
             (StateSwitchOpen = esOpen) then
          begin
            SetAlarm(saNone);
            SetElement(seOpen);
          end else
          if (StateSwitchClosed = esNotClosed) and
             (StateSwitchOpen = esNotOpen) then
          begin
            SetAlarm(saNone);
            SetElement(seTransition);
          end;
        end else
        if StateSwitchRemote = esRemote then
        begin
//          PlatformControl;
          if FDesiredState = dsCLose then
          begin

            if (StateSwitchClosed = esClosed) and
               (StateSwitchOpen = esNotOpen) then
            begin
              SetAlarm(saNone);
              SetElement(seClosed);
            end else
            if StateSwitchClosed = esNotClosed then
            begin

              if (TTRANS > 0) and
                 (FTime < TTRANS) then
              begin
                SetAlarm(saNone);
                SetElement(seTransition);
              end else
              if (TTRANS > 0) and
                 (FTime >= TTRANS) then
              begin
                SetAlarm(saCLoseFailure);
                SetElement(seFailedToClose);
              end else
              if TTRANS = 0 then
              begin
                SetAlarm(saNone);
                SetElement(seTransition);
              end;
            end;
          end else
          if FDesiredState = dsOpen then
          begin

            if (StateSwitchOpen = esOpen) and
               (StateSwitchClosed = esNotClosed) then
            begin
              SetAlarm(saNone);
              SetElement(seOpen);
            end else
            if StateSwitchOpen = esNotOpen then
            begin

              if (TTRANS > 0) and
                 (FTime < TTRANS) then
              begin
                SetAlarm(saNone);
                SetElement(seTransition);
              end else
              if (TTRANS > 0) and
                 (FTime >= TTRANS) then
              begin
                SetAlarm(saOpenFailure);
                SetElement(seFailedToOpen);
              end;
            end;
          end;
        end;
      end;
    end;
  end;
end;

//procedure TCBEElement.ControlMode;
//begin
//  if FStateElementDisabled = sdDisabled then
//    FControlMode := cmNone;
//
//  if FStateElementDisabled = sdEnabled then
//  begin
//
//    if FStateSwitchRemote = esLocal then
//      FControlMode := cmLocal
//    else if (FStateSwitchRemote = esRemote) then
//    begin
//
//      if FStateManualAuto = smaManual then
//        FControlMode := cmManual
//      else if FStateManualAuto = smaAuto then
//        FControlMode := cmAuto;
//    end;
//  end;
//end;

procedure TCBEElement.PlatformControl;
var
  aValControlClose, aValControlopen : E_StateActivated;
  TCTRL : Double;
//  t : integer;
begin
  inherited;

//  t := 10; // sementara dibuat 10
  TCTRL := Parameters.GetParameter(epTCTRL).ParamDoubleValue;

  if FStateElementDisabled  = sdDisabled then
  begin
    aValControlClose := sacNotActivated;
    aValControlOpen := sacNotActivated;

    Listeners.TriggerEvents(Self,epElementWireBreakChange,Byte(aValControlClose));
    Listeners.TriggerEvents(Self,epElementWireBreakChange,Byte(aValControlOpen));

    FDesiredState := dsNone;
  end
  else
  begin
    if (FStateCommandCloseApp = sacActivated) and
       (FStateCommandCloseHMI = sacActivated) then
    begin
      aValControlOpen := sacNotActivated;
      Listeners.TriggerEvents(Self,epElementWireBreakChange,Byte(aValControlOpen));
      FDesiredState := dsCLose;

      if TCTRL = 0 then
      begin
        aValControlClose := sacActivated;
        Listeners.TriggerEvents(Self,epElementWireBreakChange,Byte(aValControlClose));
      end
      else if TCTRL > 0 then
      begin
        if FTime = TCTRL then
        begin
          aValControlClose := sacActivated;
          Listeners.TriggerEvents(Self,epElementWireBreakChange,Byte(aValControlClose));
        end
        else
        begin
          aValControlClose := sacNotActivated;
          Listeners.TriggerEvents(Self,epElementWireBreakChange,Byte(aValControlClose));
        end;
      end;
    end
    else if (FStateCommandOpenApp = sacActivated) and
            (FStateCommandOpenHMI = sacActivated) then
    begin
      aValControlClose := sacNotActivated;
      Listeners.TriggerEvents(Self,epElementWireBreakChange,Byte(aValControlClose));
      FDesiredState := dsOpen;

      if TCTRL = 0 then
      begin
        aValControlOpen := sacActivated;
        Listeners.TriggerEvents(Self,epElementWireBreakChange,Byte(aValControlOpen));
      end
      else if TCTRL > 0 then
      begin
        if FTime = TCTRL then
        begin
          aValControlOpen := sacActivated;
          Listeners.TriggerEvents(Self,epElementWireBreakChange,Byte(aValControlOpen));
        end
        else
        begin
          aValControlOpen := sacNotActivated;
          Listeners.TriggerEvents(Self,epElementWireBreakChange,Byte(aValControlOpen));
        end;
      end;

    end;
  end;

end;

procedure TCBEElement.RunEverySecond;
begin
  inherited;

  AlarmElementStateCalc;

  Inc(FTime);
end;

procedure TCBEElement.SetElementParameters;
begin
  inherited;

  { default parameter, must be set from database }
  Parameters.AddParameter(epTTRANS, 0);
  Parameters.AddParameter(epTCTRL, 0);

end;

procedure TCBEElement.SetOnStateCBEToPlatformCmd(
  const aVal: T_ONStateCBEToPlatformCmd);
begin
  FOnStateCBEToPlatformCmd := aVal;
end;

procedure TCBEElement.SetStateAlarmInhibited(const aVal: E_StateInhibit);
begin
  FStateAlarmInhibited := aVal;
//  AlarmElementStateCalc;
end;

procedure TCBEElement.SetStateCommandCloseApp(const aVal: E_StateActivated);
begin
  FStateCommandCloseApp := aVal;
//  AlarmElementStateCalc;
end;

procedure TCBEElement.SetStateCommandCloseHMI(const aVal: E_StateActivated);
begin
  FStateCommandCloseHMI := aVal;
//  AlarmElementStateCalc;
end;

procedure TCBEElement.SetStateCommandOpenApp(const aVal: E_StateActivated);
begin
  FStateCommandOpenApp := aVal;
//  AlarmElementStateCalc;
end;

procedure TCBEElement.SetStateCommandOpenHMI(const aVal: E_StateActivated);
begin
  FStateCommandOpenHMI := aVal;
//  AlarmElementStateCalc;
end;

procedure TCBEElement.SetStateElementDisabled(const aVal: E_StateDisabled);
begin
  inherited;
//  AlarmElementStateCalc;
end;

procedure TCBEElement.SetStateManualAuto(const aVal: E_StateManualAuto);
begin
  FStateManualAuto := aVal;
//  AlarmElementStateCalc;
end;

procedure TCBEElement.SetStatePMSSwitchClosedOpen(const aVal: E_StateElement);
begin
  if FStatePMSSwitchClosedOpen = aVal then
    Exit;

  FStatePMSSwitchClosedOpen := aVal;
  Listeners.TriggerEvents(Self,epElementStateChange,Byte(aVal));
end;

procedure TCBEElement.SetStateRFC(const aVal: E_StateRFC);
begin
  FStateRFC := aVal;
//  AlarmElementStateCalc;
end;

procedure TCBEElement.SetStateRFO(const aVal: E_StateRFO);
begin
  FStateRFO := aVal;
//  AlarmElementStateCalc;
end;

procedure TCBEElement.SetStateSwitchClosed(const aVal: E_ExtStatus);
begin
  if aVal in [esClosed, esNotClosed] then
    FStateSwitchClosed := aVal;

//  AlarmElementStateCalc;
end;

procedure TCBEElement.SetStateSwitchNoFault(const aVal: E_ExtStatus);
begin
  if aVal in [esFault, esNoFault] then
    FStateSwitchNoFault := aVal;

//  AlarmElementStateCalc;
end;

procedure TCBEElement.SetStateSwitchOpen(const aVal: E_ExtStatus);
begin
  if aVal in [esOpen, esNotOpen] then
    FStateSwitchOpen := aVal;

//  AlarmElementStateCalc;
end;

procedure TCBEElement.SetStateSwitchRemote(const aVal: E_ExtStatus);
begin
  if aVal in [esRemote, esLocal] then
    FStateSwitchRemote := aVal;

//  AlarmElementStateCalc;
end;

procedure TCBEElement.SetStateSwitchTripped(const aVal: E_ExtStatus);
begin
  if aVal in [esTripped, esNotTripped] then
    FStateSwitchTripped := aVal;

//  AlarmElementStateCalc;
end;

end.
