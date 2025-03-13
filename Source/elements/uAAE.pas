{*------------------------------------------------------------------------------
  The analogue application-element handles a derived or calculated
    (i.e. not related to a physical input) value. The element is able to
    generate high and low alarms whenever the analogue input exceeds one of
    the alarm thresholds. Along with these alarms the element supports
    hysteresis and time delay functions as well. Spurious alarms which might be
    caused by a certain platform state can be inhibited as it supports an alarm
    inhibit input also.

  @author  Ryu
  @version 2013/07/15 1.0 Initial revision.
  @todo
  @comment
-------------------------------------------------------------------------------}

unit uAAE;

interface

uses
  uElement, uDataType, SysUtils;

type
  TAAEElement = class(TElement)
  private
    FValueApplication : Double;
    FStateValid : E_StateValid;
    FStateWireBreak : E_StateWireBreak;
    FStateDisplayStationary : E_StateDisplayStationery;
    FStateAlarmInhibited : E_StateInhibit;
    FValueElement : Double;
    FValueHMI, FLastValueHMI : Double;
    FHA, FLA : Boolean;

    FTHA, FTLA, FHAV, FLAV, FHYHA, FHYLA : Double;
    FTime : Integer;
    FHAEval, FLAEval : Boolean;
    FLastValueState : E_ValueState;

    procedure SetValueApplication(const aVal: Double);
    procedure SetStateValid(const aVal: E_StateValid);
    procedure SetStateWireBreak(const aVal: E_StateWireBreak);
    procedure SetStateDisplayStationary(const aVal: E_StateDisplayStationery);
    procedure SetStateAlarmInhibited(const aVal: E_StateInhibit);
    procedure SetValueState(aVal: E_ValueState);
  protected
    procedure SetElementParameters; override;
    procedure ValueSelection; override;
    procedure AlarmEvaluation; override;
    procedure SetStateElementDisabled(const aVal: E_StateDisabled); override;
    procedure OnParameterChange(Sender : TObject); override;
  public
    constructor Create; override;

    procedure DefaultValue; override;
    procedure AlarmElementStateCalc; override;
    procedure RunEverySecond; override;

    { element input }
    property ValueApplication : Double read FValueApplication
      write SetValueApplication;
    property StateValid : E_StateValid read FStateValid write SetStateValid;
    property StateWireBreak : E_StateWireBreak read FStateWireBreak
      write SetStateWireBreak;
    property StateDisplayStationary : E_StateDisplayStationery
      read FStateDisplayStationary write SetStateDisplayStationary;
    property StateAlarmInhibited : E_StateInhibit read FStateAlarmInhibited
      write SetStateAlarmInhibited;

    { element output }
    property ValueElement : Double read FValueElement;
    property ValueHMI : Double read FValueHMI;
  end;

implementation

uses
  uFunction;

{ TAAEElement }

procedure TAAEElement.AlarmElementStateCalc;
begin
  inherited;

  if StateElementDisabled = sdDisabled then
  begin
    SetAlarm(saNoneDisable);
    SetElement(seDisabled);
  end;

  if (StateElementDisabled = sdEnabled) and
    (StateValid = svInvalid) then
  begin
    SetAlarm(saNone);
    SetElement(seUnavailable);
  end;

  if (StateElementDisabled = sdEnabled) and
    (StateValid = svValid) then begin
    if StateAlarmInhibited = siInhibited then
    begin
      SetAlarm(saInhibited);
      SetElement(seValueOK);
    end
    else if StateAlarmInhibited = siNotInhibited then
    begin
      if StateWireBreak = swbWireBreak then
      begin
        SetAlarm(saWireBreak);
        SetElement(seWireBreak);
      end
      else
      begin
        if  FHA and (not FLA) then
        begin
          SetAlarm(saHA);
          SetElement(seHA);
        end
        else if FLA and (not FHA) then
        begin
          SetAlarm(saLA);
          SetElement(seLA);
        end
        else
        begin
          SetAlarm(saNone);
          SetElement(seValueOK);
        end;
      end;
    end;
  end;

  ValueSelection;
end;

procedure TAAEElement.AlarmEvaluation;
begin
  if FTime > FTHA then
  begin
    // high alarm
    if FValueElement > FHAV then
      FHA := True
    else if (FValueElement <= FHAV - FHYHA) then
      FHA := False;

    FHAEval := True;
  end;

  if FTime > FTLA then
  begin
    // low alarm
    if (FValueElement < FLAV) then
      FLA := True
    else
    if (FValueElement >= FLAV - FHYLA) then
      FLA := False;

    FLAEval := True;
  end;

  Inc(FTime);
end;

constructor TAAEElement.Create;
begin
  inherited;

  ELementType := eltAAE;

  DefaultValue;
end;

procedure TAAEElement.DefaultValue;
begin
  inherited;

  FHA := false;
  FLA := false;

  FStateValid   := svValid;
  FStateAlarmInhibited := siInhibited;
  FStateWireBreak   := swbNoWireBreak;

  FHAEval := False;
  FLAEval := False;

  FLastValueState := evsNone;
  FTime  := 0;
  FLastValueHMI := -1;
end;

procedure TAAEElement.OnParameterChange(Sender: TObject);
begin
  inherited;
  FTHA  := Parameters.GetParameter(epTHA).ParamDoubleValue;
  FTLA  := Parameters.GetParameter(epTLA).ParamDoubleValue;
  FHAV  := Parameters.GetParameter(epHAV).ParamDoubleValue;
  FLAV  := Parameters.GetParameter(epLAV).ParamDoubleValue;
  FHYHA  := Parameters.GetParameter(epHYHA).ParamDoubleValue;
  FHYLA  := Parameters.GetParameter(epHYLA).ParamDoubleValue;
end;

procedure TAAEElement.RunEverySecond;
begin
  inherited;

//  if FHAEval and FLAEval  then
//    Exit;

  AlarmEvaluation;
  AlarmElementStateCalc;
end;

procedure TAAEElement.SetElementParameters;
begin
  inherited;

  { default parameter, must be set from database }
  Parameters.AddParameter(epHAV, 0);
  Parameters.AddParameter(epLAV, 0);
  Parameters.AddParameter(epHYHA, 0);
  Parameters.AddParameter(epHYLA, 0);
  Parameters.AddParameter(epTHA, 0);
  Parameters.AddParameter(epTLA, 0);
  Parameters.AddParameter(epSF, 0);
  Parameters.AddParameter(epSTA, 0);
end;

procedure TAAEElement.SetStateAlarmInhibited(const aVal: E_StateInhibit);
begin
  if FStateAlarmInhibited = aVal then
    Exit;

  FStateAlarmInhibited := aVal;
  Listeners.TriggerEvents(Self,epElementAlrmInhibited,Byte(aVal));

//  AlarmElementStateCalc;
end;

procedure TAAEElement.SetStateDisplayStationary(
  const aVal: E_StateDisplayStationery);
begin
  if FStateDisplayStationary = aVal then
    Exit;

  FStateDisplayStationary := aVal;
  Listeners.TriggerEvents(Self,epElementStateDisplayChange,Byte(aVal));
end;

procedure TAAEElement.SetStateElementDisabled(const aVal: E_StateDisabled);
begin
  inherited;

//  AlarmElementStateCalc;
end;

procedure TAAEElement.SetStateValid(const aVal: E_StateValid);
begin
  if FStateValid = aVal then
    Exit;

  FStateValid := aVal;
  Listeners.TriggerEvents(Self,epElementValidChange,Byte(aVal));

//  AlarmElementStateCalc;
end;

procedure TAAEElement.SetStateWireBreak(const aVal: E_StateWireBreak);
begin
  if FStateWireBreak = aVal then
    Exit;

  FStateWireBreak := aVal;
  Listeners.TriggerEvents(Self,epElementWireBreakChange,Byte(aVal));

//  AlarmElementStateCalc;
end;

procedure TAAEElement.SetValueApplication(const aVal: Double);
begin
  if FValueApplication = aVal then
    Exit;

  FValueApplication := aVal;

  try
    FValueElement := FValueApplication / Parameters.GetParameter(epSF).ParamDoubleValue
  except
    FValueElement := FValueApplication;
  end;

  if FValueApplication > FHAV then
    SetValueState(evsHigh)
  else if FValueApplication < FLAV then
    SetValueState(evsLow)
  else
    SetValueState(evsNormal);

  Listeners.TriggerEvents(Self,epElementValueAppChange,Double(aVal));
  Listeners.TriggerEvents(Self,epElementValueElmntChange,Double(FValueElement));

  { save to virtual table }
  if Assigned(OnValueChangeSaved) then
    OnValueChangeSaved(FValueElement)
end;

procedure TAAEElement.SetValueState(aVal: E_ValueState);
begin
  if FLastValueState <> aVal then
  begin
    FTime := 0;
    FHAEval := False;
    FLAEval := False;

  end;

  FLastValueState := aVal;
end;

procedure TAAEElement.ValueSelection;
begin
  AppValueConversion;

  {FStationaryValue nya belum tau dpt darimana}

//  if StateDisplayStationary = ssDispStationary then
//    FValueHMI := FStationaryValue
//  else
     FValueHMI := FValueElement;

  if FLastValueHMI <> FValueHMI then
  begin
    FLastValueHMI := FValueHMI;
    Listeners.TriggerEvents(Self,epElementHMISetChange,Double(FValueHMI));
  end;
end;

end.
