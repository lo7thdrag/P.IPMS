 {*------------------------------------------------------------------------------
  Control Element (CTR)

  The control-element supports a button or checkbox object within the HMI.
  Buttons and checkboxes might be used by HMI mimics to achieve remote operator
  access relevant to control/configure a platform process. Whenever the state
  of a button or checkbox is toggled, a HMI command is send to the LPU involved
  with that process. If the IPMS accepts the command then this has to be
  designated by an element status change. To acknowledge the operator command
  the HMI uses the control element status for animation purposes regarding
  the button/checkbox symbol.

  @author  DID
  @version 2013/07/16 1.0 Initial revision.
  @todo
  @comment
-------------------------------------------------------------------------------}

unit uCTR;

interface

uses uElement, uDataType;

type
  TCTRElement = class(TElement)
  private
    FStateNoFault: E_StateNotFault;
    FStateNoRFU: E_StateNotRFU;
    FStateTransition: E_StateTransition;
    FProcesStatus: E_StateProcesStatus;
    FCommandHMI: E_StateActivated;
    FCommandState: E_StateActivated;
    FTime : integer;

    procedure SetStateNotFault(const aVal: E_StateNotFault);
    procedure setStateNotRFU(const aVal: E_StateNotRFU);
    procedure setStateTransition(const aVal: E_StateTransition);
    procedure SetProcesStatus(const aVal: E_StateProcesStatus);
    procedure setCommandHMI(const aVal: E_StateActivated);

  protected
    procedure PlatformControl;override;
    procedure SetElementParameters; override;
  public
    constructor Create; override;

    procedure DefaultValue;override;
    procedure AlarmElementStateCalc; override;
    procedure RunEverySecond;override;

    { element input }
    property StateNoFault: E_StateNotFault read FStateNoFault
      write SetStateNotFault;
    property StateNoRFU  : E_StateNotRFU read FStateNoRFU write setStateNotRFU;
    property StateTransition: E_StateTransition read FStateTransition
      write setStateTransition;
    property ProcesStatus: E_StateProcesStatus read FProcesStatus
      write SetProcesStatus;
    property CommandHMI  : E_StateActivated read FCommandHMI write setCommandHMI;
  end;

implementation

{ TCTRElement }

procedure TCTRElement.AlarmElementStateCalc;
begin
  inherited;

  if StateNoFault = snfFault then
    SetElement(seFault);

  if (StateNoFault = snfNotFault) and
     (StateNoRFU = snrNotRFU) then
    SetElement(seNotRFU);

  if (StateNoFault = snfNotFault) and
     (StateNoRFU = snrRFU) then
  begin
    if StateTransition = stInTransition then
      SetElement(seInTransition)
    else
    if StateTransition = stNotInTransition then
    begin
      if ProcesStatus = spsNormal then
        SetElement(seNormal)
      else
      if ProcesStatus = spsActive then
        SetElement(seActive)
    end;
  end;
end;

constructor TCTRElement.Create;
begin
  inherited;
  ElementType := eltCTR;

end;

procedure TCTRElement.DefaultValue;
begin
  inherited;
  FStateNoFault := snfNotFault;
  FStateNoRFU   := snrRFU;
  FStateTransition := stNotInTransition;
  FProcesStatus := spsNormal;

  FTime := 0;
end;

procedure TCTRElement.PlatformControl;
var
//  aTime: Integer;
  TCTRL : Double;
begin
//  aTime := 10;  //sementara tok
  TCTRL := Parameters.GetParameter(epTCTRL).ParamDoubleValue;

  if FCommandHMI = sacActivated then  {for t = TCtrl >> apa'an ya ini?} //>> dibuat pake FTime
  begin
    if FTime = TCTRL then
      FCommandState := sacActivated;
  end;
end;

procedure TCTRElement.RunEverySecond;
begin
  inherited;
  AlarmElementStateCalc;

  inc(FTime);
end;

procedure TCTRElement.setCommandHMI(const aVal: E_StateActivated);
begin
  FCommandHMI := aVal;
  PlatformControl;
end;

procedure TCTRElement.SetElementParameters;
begin
  inherited;

  { default parameter, must be set on database }
  Parameters.AddParameter(epTCTRL, 0);
end;

procedure TCTRElement.SetProcesStatus(const aVal: E_StateProcesStatus);
begin
  FProcesStatus := aVal;
//  AlarmElementStateCalc;
end;

procedure TCTRElement.SetStateNotFault(const aVal: E_StateNotFault);
begin
  FStateNoFault := aVal;
//  AlarmElementStateCalc;
end;

procedure TCTRElement.setStateNotRFU(const aVal: E_StateNotRFU);
begin
  FStateNoRFU := aVal;
//  AlarmElementStateCalc;
end;

procedure TCTRElement.setStateTransition(const aVal: E_StateTransition);
begin
  FStateTransition := aVal;
//  AlarmElementStateCalc;
end;

end.
