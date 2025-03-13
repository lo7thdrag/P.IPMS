{*------------------------------------------------------------------------------
  Dual speed Motor Control element (MCD)

  The dual speed motor control element interfaces a motor starter unit that
  supports a dual speed motor. I.e. the motor either runs at low/high speed
  or in two different directions.

  @author  did
  @version 2013/07/16 1.0 Initial revision.
  @todo
  @comment
-------------------------------------------------------------------------------}

unit uMCD;

interface

uses uElement, uDataType;

type
  TMCDElement = class(TElement)
  private
    FStateSwitchSpeed1: E_ExtStatus;
    FStateSwitchSpeed2: E_ExtStatus;
    FStateSwitchRemote: E_ExtStatus;
    FStateSwitchNoFault: E_ExtStatus;
    FCommandStartSpeed1App: E_StateActivated;
    FCommandStartSpeed2App: E_StateActivated;
    FCommandStopApp: E_StateActivated;
    FCommandStartSpeed1HMI: E_StateActivated;
    FCommandStartSpeed2HMI: E_StateActivated;
    FCommandStopHMI: E_StateActivated;
    FStateBlockOut: E_StateActivated;
    FStateRestart: E_StateActivated;
    FStateManualAuto: E_StateManualAuto;
    FStateValueValid: E_StateValid;
    FRFU: E_StateNotRFU;
    FRunCondition: E_StateRunCondition;
    FDesireState: E_DesiredState;
    FControlMode: E_ControlMode;
    FOnStateMCDToPlatformCmd: T_ONStateMCDToPlatformCmd;
    FTime : integer;

    procedure SetStateSwitchSpeed1(const aVal: E_ExtStatus);
    procedure SetStateSwitchSpeed2(const aVal: E_ExtStatus);
    procedure SetStateSwitchRemote(const aVal: E_ExtStatus);
    procedure SetStateSwitchNoFault(const aVal: E_ExtStatus);
    procedure SetCommandStartSpeed1App(const aVal: E_StateActivated);
    procedure SetCommandStartSpeed2App(const aVal: E_StateActivated);
    procedure SetCommandStopApp(const aVal: E_StateActivated);
    procedure SetCommandStartSpeed1HMI(const aVal: E_StateActivated);
    procedure SetCommandStartSpeed2HMI(const aVal: E_StateActivated);
    procedure SetCommandStopHMI(const aVal: E_StateActivated);
    procedure SetStateBlockOut(const aVal: E_StateActivated);
    procedure SetStateRestart(const aVal: E_StateActivated);
    procedure SetStateManualAuto(const aVal: E_StateManualAuto);
    procedure SetStateValueValid(const aVal: E_StateValid);
    procedure SetRFU(const aVal: E_StateNotRFU);
    procedure SetRunCondition(const aVal: E_StateRunCondition);
    procedure SetOnStateMCDToPlatformCmd(const aVal: T_ONStateMCDToPlatformCmd);

    procedure ControlMode;

  protected
    procedure PlatformControl;override;
    procedure SetElementParameters; override;
    procedure SetStateElementDisabled(const aVal: E_StateDisabled); override;
  public
    constructor Create; override;

    procedure DefaultValue;override;
    procedure AlarmElementStateCalc; override;
    procedure RunEverySecond;override;
  { input from Platform Interface }
  property StateSwitchSpeed1: E_ExtStatus read FStateSwitchSpeed1
    write SetStateSwitchSpeed1;
  property StateSwitchSpeed2: E_ExtStatus read FStateSwitchSpeed2
    write SetStateSwitchSpeed2;
  property StateSwitchRemote: E_ExtStatus read FStateSwitchRemote
    write SetStateSwitchRemote;
  property StateSwitchNoFault: E_ExtStatus read FStateSwitchNoFault
    write SetStateSwitchNoFault;

  { output to Platform Interface }
  property OnStateMCDToPlatformCmd: T_ONStateMCDToPlatformCmd
    read FOnStateMCDToPlatformCmd write SetOnStateMCDToPlatformCmd;

  { input from IPMS Interface }
  property CommandStartSpeed1App: E_StateActivated read FCommandStartSpeed1App
    write SetCommandStartSpeed1App;
  property CommandStartSpeed2App: E_StateActivated read FCommandStartSpeed2App
    write SetCommandStartSpeed2App;
  property CommandStopApp: E_StateActivated  read FCommandStopApp
    write SetCommandStopApp;
  property CommandStartSpeed1HMI: E_StateActivated read FCommandStartSpeed1HMI
    write SetCommandStartSpeed1HMI;
  property CommandStartSpeed2HMI: E_StateActivated read FCommandStartSpeed2HMI
    write SetCommandStartSpeed2HMI;
  property CommandStopHMI: E_StateActivated  read FCommandStopHMI
    write SetCommandStopHMI;
  property StateBlokOut: E_StateActivated read FStateBlockOut
    write SetStateBlockOut;
  property StateRestart: E_StateActivated read FStateRestart
    write SetStateRestart;
  property StateManualAuto: E_StateManualAuto read FStateManualAuto
    write SetStateManualAuto;
  property StateValueValid: E_StateValid read FStateValueValid
    write SetStateValueValid;
  property RFU: E_StateNotRFU  read FRFU write SetRFU;
  property RunCondition: E_StateRunCondition read FRunCondition
    write SetRunCondition;

  end;

implementation

{ TMCDElement }
constructor TMCDElement.Create;
begin
  inherited;
  ELementType := eltMCD;

end;

procedure TMCDElement.DefaultValue;
begin
  inherited;
  FStateSwitchSpeed1 := esNotSpeed1;
  FStateSwitchSpeed2 := esNotSpeed2;
  FStateSwitchNoFault:= esNoFault;

  FTime := 0;
end;

procedure TMCDElement.AlarmElementStateCalc;
var
//  t : Integer;
  TTRANS : Double;
begin
  inherited;

//  t := 10;
  TTRANS := Parameters.GetParameter(epTTRANS).ParamDoubleValue;

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

    if StateSwitchNoFault = esFault then
    begin
      SetAlarm(saFault);
      SetElement(seFault);

      if StateSwitchSpeed2 = esSpeed2 then
      begin
        SetAlarm(saUnknown);
        SetElement(seUnknown);
      end else
      if StateSwitchSpeed1 = esSpeed1 then
      begin
        SetAlarm(saUnknown);
        SetElement(seUnknown);
      end;
    end else
    if StateSwitchNoFault = esNoFault then
    begin

      if (StateSwitchSpeed2 = esSpeed2) and
         (StateSwitchSpeed1 = esSpeed1) then
      begin
        SetAlarm(saUnknown);
        SetElement(seUnknown);
      end;

      if StateSwitchRemote = esLocal then
      begin

        if (StateSwitchSpeed2 = esSpeed2) and
           (StateSwitchSpeed1 = esNotSpeed1) then
        begin
          SetAlarm(saNone);
          SetElement(seSpeed2);
        end else
        if (StateSwitchSpeed2 = esNotSpeed2) and
           (StateSwitchSpeed1 = esSpeed1) then
        begin
          SetAlarm(saNone);
          SetElement(seSpeed1);
        end else
        if (StateSwitchSpeed2 = esNotSpeed2) and
           (StateSwitchSpeed1 = esNotSpeed1) then
        begin
          SetAlarm(saNone);
          SetElement(seStopped);
        end;
      end else
      if StateSwitchRemote = esRemote then
      begin

        if RFU = snrNotRFU then
        begin
          SetAlarm(saNone);
          SetElement(seNotRFU);
        end else
        if RFU = snrRFU then
        begin
          PlatformControl;

          if FDesireState = dsNone then
          begin

            if (StateSwitchSpeed2 = esNotSpeed2) and
               (StateSwitchSpeed1 = esNotSpeed1) then
            begin
              SetAlarm(saNone);
              SetElement(seStopped);
            end else
            if (StateSwitchSpeed2 = esSpeed2) and
               (StateSwitchSpeed1 = esNotSpeed1) then
            begin
              SetAlarm(saNone);
              SetElement(seSpeed2);
            end else
            if (StateSwitchSpeed2 = esNotSpeed2) and
               (StateSwitchSpeed1 = esSpeed1) then
            begin
              SetAlarm(saNone);
              SetElement(seSpeed1);
            end;
          end else
          if FDesireState = dsStop then begin

            if (StateSwitchSpeed2 = esNotSpeed2) and
               (StateSwitchSpeed1 = esNotSpeed1) then
            begin
              SetAlarm(saNone);
              SetElement(seStopped);
            end else
            if (StateSwitchSpeed2 = esSpeed2) and
               (StateSwitchSpeed1 = esNotSpeed1) then
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
                  SetAlarm(saSpeed2FailedToStop);
                  SetElement(seSpeed2FailedToStop);
              end else
              if TTRANS = 0 then
              begin
                SetAlarm(saNone);
                SetElement(seSpeed2);
              end;
            end else
            if (StateSwitchSpeed2 = esNotSpeed2) and
               (StateSwitchSpeed1 = esSpeed1) then
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
                SetAlarm(saSpeed1FailedToStop);
                SetElement(seSpeed1FailedToStop);
              end;
            end;
          end else
          if FDesireState = dsSpeed2 then
          begin

            if (StateSwitchSpeed2 = esNotSpeed2) and
               (TTRANS > 0) then
            begin

              if (FTime < TTRANS) then
              begin
                SetAlarm(saNone);
                SetElement(seTransition);
              end else
              if (FTime >= TTRANS) then
              begin
                SetAlarm(saSpeed2Failure);
                SetElement(seSpeed2Failure);
              end;
            end else
            if (StateSwitchSpeed2 = esSpeed2) and
               (StateSwitchSpeed1 = esNotSpeed1) and
               (TTRANS > 0) then
            begin
              SetAlarm(saNone);
              SetElement(seSpeed2);
            end;
          end else
          if FDesireState = dsSpeed1 then
          begin

            if (StateSwitchSpeed1 = esNotSpeed1) and
               (TTRANS > 0) then
            begin

              if (FTime < TTRANS) then
              begin
                SetAlarm(saNone);
                SetElement(seTransition);
              end else
              if (FTime >= TTRANS) then
              begin
                SetAlarm(saSpeed1Failure);
                SetElement(seSpeed1Failure);
              end;
            end else
            if (StateSwitchSpeed1 = esSpeed1) and
               (StateSwitchSpeed2 = esNotSpeed2) and
               (TTRANS > 0) then
            begin
              SetAlarm(saNone);
              SetElement(seSpeed1);
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure TMCDElement.ControlMode;
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

procedure TMCDElement.PlatformControl;
begin
  ControlMode;
  FDesireState := dsNone; // default

  if FStateElementDisabled = sdDisabled then
  begin
    FDesireState := dsNone;
  end
  else if FStateElementDisabled = sdEnabled then
  begin
    if FControlMode = cmLocal then
    begin
      FDesireState := dsNone;
      exit;
    end
    else
    begin
      if (RunCondition = srcNotOk) and
         (FControlMode = cmAuto) then
      begin
        FDesireState := dsStop;
        exit;
      end;

      if (RunCondition = srcNotOk) and
         (FControlMode = cmManual) then
      begin
        FDesireState := dsStop;
        exit;
      end;

      if (CommandStopApp = sacActivated) and
         (FControlMode = cmAuto) then
      begin
        FDesireState := dsStop;
        exit;
      end;

      if (CommandStartSpeed1App = sacActivated) and
         (RunCondition = srcOk) and (FControlMode = cmAuto) then
      begin
        if RFU = snrRFU then
        begin
          FDesireState := dsSpeed1;
          exit;
        end
        else if RFU = snrNotRFU then
        begin
          FDesireState := dsNone;
          exit;
        end;
      end;

      if (CommandStartSpeed2App = sacActivated) and
         (RunCondition = srcOk) and (FControlMode = cmAuto) then
      begin
        if RFU = snrRFU then
        begin
          FDesireState := dsSpeed2;
          exit;
        end
        else if RFU = snrNotRFU then
        begin
          FDesireState := dsNone;
          exit;
        end;
      end;

      if FControlMode = cmManual then
      begin
        if CommandStopHMI = sacActivated then
        begin
          FDesireState := dsStop;
          exit;
        end;

        if RunCondition = srcOk then
        begin
          if CommandStartSpeed1HMI = sacActivated then
          begin
            if RFU = snrRFU then
            begin
              FDesireState := dsSpeed1;
              exit;
            end
            else if RFU = snrNotRFU then
            begin
              FDesireState := dsNone;
              exit;
            end;
          end;

          if CommandStartSpeed2HMI = sacActivated then
          begin
            if RFU = snrRFU then
            begin
              FDesireState := dsSpeed2;
              exit;
            end
            else if RFU = snrNotRFU then
            begin
              FDesireState := dsNone;
              exit;
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure TMCDElement.RunEverySecond;
begin
  inherited;
  AlarmElementStateCalc;

  Inc(FTime);
end;

procedure TMCDElement.SetCommandStartSpeed1App(const aVal: E_StateActivated);
begin
  FCommandStartSpeed1App := aVal;
//  AlarmElementStateCalc;
end;

procedure TMCDElement.SetCommandStartSpeed1HMI(const aVal: E_StateActivated);
begin
  FCommandStartSpeed1HMI := aVal;
//  AlarmElementStateCalc;
end;

procedure TMCDElement.SetCommandStartSpeed2App(const aVal: E_StateActivated);
begin
  FCommandStartSpeed2App := aVal;
//  AlarmElementStateCalc;
end;

procedure TMCDElement.SetCommandStartSpeed2HMI(const aVal: E_StateActivated);
begin
  FCommandStartSpeed2HMI := aVal;
//  AlarmElementStateCalc;
end;

procedure TMCDElement.SetCommandStopApp(const aVal: E_StateActivated);
begin
  FCommandStopApp := aVal;
//  AlarmElementStateCalc;
end;

procedure TMCDElement.SetCommandStopHMI(const aVal: E_StateActivated);
begin
  FCommandStopHMI := aVal;
//  AlarmElementStateCalc;
end;

procedure TMCDElement.SetElementParameters;
begin
  inherited;

  { default parameters }
  Parameters.AddParameter(epTTRANS, 0);
  Parameters.AddParameter(epTCTRL, 0);
  Parameters.AddParameter(epTRO, 0);

end;

procedure TMCDElement.SetOnStateMCDToPlatformCmd(
  const aVal: T_ONStateMCDToPlatformCmd);
begin
  FOnStateMCDToPlatformCmd := aVal;
end;

procedure TMCDElement.SetRFU(const aVal: E_StateNotRFU);
begin
  FRFU := aVal;
//  AlarmElementStateCalc;
end;

procedure TMCDElement.SetRunCondition(const aVal: E_StateRunCondition);
begin
  FRunCondition := aVal;
//  AlarmElementStateCalc;
end;

procedure TMCDElement.SetStateBlockOut(const aVal: E_StateActivated);
begin
  FStateBlockOut := aVal;
//  AlarmElementStateCalc;
end;

procedure TMCDElement.SetStateElementDisabled(const aVal: E_StateDisabled);
begin
  inherited;

//  AlarmElementStateCalc;
end;

procedure TMCDElement.SetStateManualAuto(const aVal: E_StateManualAuto);
begin
  FStateManualAuto := aVal;
//  AlarmElementStateCalc;
end;

procedure TMCDElement.SetStateRestart(const aVal: E_StateActivated);
begin
  FStateRestart := aVal;
//  AlarmElementStateCalc;
end;

procedure TMCDElement.SetStateSwitchNoFault(const aVal: E_ExtStatus);
begin
  if aVal in [esFault, esNoFault] then
    FStateSwitchNoFault := aVal;

//  AlarmElementStateCalc;
end;

procedure TMCDElement.SetStateSwitchRemote(const aVal: E_ExtStatus);
begin
  if aVal in [esLocal, esRemote] then
    FStateSwitchRemote := aVal;

//  AlarmElementStateCalc;
end;

procedure TMCDElement.SetStateSwitchSpeed1(const aVal: E_ExtStatus);
begin
  if aVal in [esSpeed1, esNotSpeed1] then
    FStateSwitchSpeed1 := aVal;

//  AlarmElementStateCalc;
end;

procedure TMCDElement.SetStateSwitchSpeed2(const aVal: E_ExtStatus);
begin
  if aVal in [esSpeed2, esNotSpeed2] then
    FStateSwitchSpeed2 := aVal;

//  AlarmElementStateCalc;
end;

procedure TMCDElement.SetStateValueValid(const aVal: E_StateValid);
begin
  FStateValueValid := aVal;
//  AlarmElementStateCalc;
end;

end.
