{*------------------------------------------------------------------------------
  Serial Application Element (SAE)

  Like the AAE type element the SAE is able to manage all
  functions necessary to interface an analogue value that is derived from
  another application. However, unlike the AAE element the SAE type does no
  alarm detection by itself. This is especially useful in case an external
  system (with a native controller inside) not only provides the analogue value
  but its relevant alarm statuses as well. The SAE is able to interface both
  the analogue value and the alarm statuses and will forward all these to the
  HMI in a proper way.

  @author  ryu
  @version 2013/07/16 1.0 Initial revision.
  @todo
  @comment
-------------------------------------------------------------------------------}

unit uSAE;

interface

uses uElement, uDataType, SysUtils;

type
  TSAEElement = class(TElement)
  private
    FValueApplication: Double;
    FStateDisplayStationary: E_StateDisplayStationery;
    FStateAlarmInhibited: E_StateInhibit;
    FStateValueValid: E_StateValid;
    FStateWireBreak: E_StateWireBreak;
    FStateLA: E_StateLowAlarm;
    FStateHA: E_StateHighAlarm;
    FStateHHA: E_StateHighHigh;
    FValueElement: Double;
    FTimer : Integer;

    procedure SetValueApplication(const aVal: Double);
    procedure SetStateDisplayStationary(const aVal: E_StateDisplayStationery);
    procedure SetStateAlarmInhibited(const aVal: E_StateInhibit);
    procedure SetStateValueValid(const aVal: E_StateValid);
    procedure SetStateWireBreak(const aVal: E_StateWireBreak);
    procedure SetStateLA(const aVal: E_StateLowAlarm);
    procedure SetStateHA(const aVal: E_StateHighAlarm);
    procedure SetStateHHA(const aVal: E_StateHighHigh);

  protected

    procedure SetElementParameters; override;
    procedure SetStateElementDisabled(const aVal: E_StateDisabled);override;
  public
    constructor Create; override;

    procedure DefaultValue;override;
    procedure AlarmElementStateCalc; override;
    procedure AppValueConversion; override;
    procedure ValueSelection; override;
    procedure RunEverySecond;override;

    { element input }
     property ValueApplication: Double read FValueApplication
       write SetValueApplication;
     property StateDisplayStationary: E_StateDisplayStationery
       read FStateDisplayStationary write SetStateDisplayStationary;
     property StateAlarmInhibited: E_StateInhibit read FStateAlarmInhibited
       write SetStateAlarmInhibited;
     property StateValueValid: E_StateValid read FStateValueValid
       write SetStateValueValid;
     property StateWireBreak: E_StateWireBreak read FStateWireBreak
       write SetStateWireBreak;
     property StateLA: E_StateLowAlarm read FStateLA write SetStateLA;
     property StateHA: E_StateHighAlarm read FStateHA write SetStateHA;
     property StateHHA: E_StateHighHigh read FStateHHA write SetStateHHA;

     { element output }
     property ValueElement: Double read FValueElement;
  end;

implementation

uses uFunction;

{ TSAEElement }
constructor TSAEElement.Create;
begin
  inherited;
  ELementType := eltSAE;
end;

procedure TSAEElement.DefaultValue;
begin
  inherited;
  FStateValueValid := svValid;
  FStateAlarmInhibited := siNotInhibited;
  FStateWireBreak := swbNoWireBreak;
  FStateHHA := shhNoAlarm;
  FStateHA := shaNoAlarm;
  FStateLA := slaNoAlarm;

  FTimer := 0;
end;

procedure TSAEElement.RunEverySecond;
begin
  inherited;
  AlarmElementStateCalc;

  Inc(FTimer);
end;

procedure TSAEElement.AppValueConversion;
var
  SF : Double;
begin
  inherited;

  SF := Parameters.GetParameter(epSF).ParamDoubleValue;

  if (StateElementDisabled = sdDisabled) or
     (StateValueValid = svInvalid) then
  begin
    ValueApplication := 0;
  end
  else
  begin
    ValueApplication := ValueApplication/SF;
  end;

  Listeners.TriggerEvents(Self,epElementValueAppChange,ValueApplication);
end;

procedure TSAEElement.AlarmElementStateCalc;
begin
  inherited;

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

    if StateHHA = shhHighHighAlarm then
    begin
      SetAlarm(saHHA);
      SetElement(seHHA);
    end;

    if FStateWireBreak = swbWireBreak then
    begin
      SetAlarm(saWireBreak);
      SetElement(seWireBreak);
    end;

    if StateAlarmInhibited = siInhibited then
    begin

      if (StateHA = shaHighAlarm) or (StateLA = slaLowAlarm) then
      begin
        SetAlarm(saInhibited);
        SetElement(seValueOK);
      end;
    end
    else if StateAlarmInhibited = siNotInhibited then
    begin

      if (StateWireBreak = swbNoWireBreak) and
         (StateHHA = shhNoAlarm) and
         (StateHA = shaNoAlarm) and
         (StateLA = slaLowAlarm) then
      begin
        SetAlarm(saLA);
        SetElement(seLA);
      end else
      if (StateWireBreak = swbNoWireBreak) and
         (StateHHA = shhNoAlarm) and
         (StateLA = slaNoAlarm) and
         (StateHA = shaHighAlarm) then
      begin
        SetAlarm(saHA);
        SetElement(seHA);
      end else
      if (StateWireBreak = swbNoWireBreak) and
         (StateHHA = shhNoAlarm) and
         (StateHA = shaNoAlarm) and
         (StateLA = slaNoAlarm) then
      begin
        SetAlarm(saNone);
        SetElement(seValueOK);
      end;
    end;
  end;

  ValueSelection;
end;

procedure TSAEElement.SetElementParameters;
begin
  inherited;

  Parameters.AddParameter(epSF, 0);
  Parameters.AddParameter(epSTA, 0);
end;

procedure TSAEElement.SetStateAlarmInhibited(const aVal: E_StateInhibit);
begin
//  if FStateAlarmInhibited = aVal then Exit;

  FStateAlarmInhibited := aVal;
  Listeners.TriggerEvents(Self,epElementAlrmInhibited,Byte(aVal));

//  AlarmElementStateCalc;
end;

procedure TSAEElement.SetStateDisplayStationary(
  const aVal: E_StateDisplayStationery);
begin
  if FStateDisplayStationary = aVal then Exit;

  FStateDisplayStationary := aVal;
  Listeners.TriggerEvents(Self,epElementStateDisplayChange,Byte(aVal));
end;

procedure TSAEElement.SetStateElementDisabled(const aVal: E_StateDisabled);
begin
  inherited;

//  AlarmElementStateCalc;
end;

procedure TSAEElement.SetStateHA(const aVal: E_StateHighAlarm);
begin
  if FStateHA = aVal then Exit;

  FStateHA := aVal;
  Listeners.TriggerEvents(Self,epElementHighChange,Byte(aVal));

//  AlarmElementStateCalc;
end;

procedure TSAEElement.SetStateHHA(const aVal: E_StateHighHigh);
begin
  if FStateHHA = aVal then Exit;

  FStateHHA := aVal;
  Listeners.TriggerEvents(Self,epElementHighHighChange,Byte(aVal));

//  AlarmElementStateCalc;
end;

procedure TSAEElement.SetStateLA(const aVal: E_StateLowAlarm);
begin
  if FStateLA = aVal then Exit;

  FStateLA := aVal;
  Listeners.TriggerEvents(Self,epElementLowChange,Byte(aVal));

//  AlarmElementStateCalc;
end;

procedure TSAEElement.SetStateValueValid(const aVal: E_StateValid);
begin
  if FStateValueValid = aVal then Exit;

  FStateValueValid := aVal;
  Listeners.TriggerEvents(Self,epElementValidChange,Byte(aVal));

//  AlarmElementStateCalc;
end;

procedure TSAEElement.SetStateWireBreak(const aVal: E_StateWireBreak);
begin
  if FStateWireBreak = aVal then Exit;

  FStateWireBreak := aVal;
  Listeners.TriggerEvents(Self,epElementWireBreakChange,Byte(aVal));

//  AlarmElementStateCalc;
end;

procedure TSAEElement.SetValueApplication(const aVal: Double);
begin
  if FValueApplication = aVal then Exit;

  FValueApplication := aVal;
  Listeners.TriggerEvents(Self,epElementValueAppChange,Double(aVal));
end;

procedure TSAEElement.ValueSelection;
begin
  FValueElement := FValueApplication;

  Listeners.TriggerEvents(Self,epElementValueElmntChange,Double(FValueElement));
end;

end.
