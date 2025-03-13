unit uSS1;

interface

uses uElement, uDataType;

type
  TSS1Element = class(TElement)
  private
    FStateDisplayStationary: E_StateDisplayStationery;
    FStateAlarmInhibited: E_StateInhibit;
    FValueApplication: Double;
    FValueElement: Double;
    FValueSensor : Double;
//    FPMSValueSensor : Double;

    FOORH, FOORL, FHA, FHHA, FXHA : boolean;
    FHAV, FTA, FTOORH, FHY, FHHAV, FXHAV, FTOORL : Double;
    FXHAEval, FHAEval, FHHAEval, FOORHEval, FOORLEval : boolean;
    FTime : integer;

    procedure SetStateAlarmInhibited(const Value: E_StateInhibit);
    procedure SetStateDisplayStationary(const Value: E_StateDisplayStationery);
    procedure SetValueSensor(const Value: Double);
//    procedure SetPMSValueSensor(const Value: Double);

    procedure SensorValConversion;

  protected
    procedure AlarmEvaluation;override;
    procedure SetElementParameters;override;
    procedure SetStateElementDisabled(const Value: E_StateDisabled);override;
    procedure OnParameterChange(Sender : TObject);override;
  public
    constructor Create; override;

    procedure DefaultValue;override;
    procedure AlarmElementStateCalc;override;
    procedure RunEverySecond;override;

    { element input }
    property ValueSensor: Double  read FValueSensor write SetValueSensor;
    property StateAlarmInhibited : E_StateInhibit read FStateAlarmInhibited
      write SetStateAlarmInhibited;
    property StateDisplayStationary : E_StateDisplayStationery
      read FStateDisplayStationary write SetStateDisplayStationary;

    { Prince : input from PMS interface }
    {property PMSValueSensor  : Double read FPMSValueSensor write SetPMSValueSensor;}

    { element output }
    property ValueElement : Double read FValueElement;
    property ValueApplication : Double read FValueApplication;
  end;

implementation

{ TSS1Element }

procedure TSS1Element.AlarmElementStateCalc;
begin
  inherited;

  if (StateElementDisabled = sdDisabled) then
  begin
    SetAlarm(saNoneDisable);
    SetElement(seDisabled);
  end;

  if (StateElementDisabled = sdEnabled) and (StateAlarmInhibited = siInhibited) then
  begin
    SetAlarm(saInhibited);
    SetElement(seValueOK);
  end;

  if (StateElementDisabled = sdEnabled) and (StateAlarmInhibited = siNotInhibited) then
  begin
    if (not FOORH) and (not FOORL) then
    begin
      if (not FHA) and (not FHHA) and FXHA then
      begin
        SetAlarm(saXHA);
        SetElement(seXHA);
      end
      else if (not FHA) and FHHA and (not FXHA) then
      begin
        SetAlarm(saHHA);
        SetElement(seHHA);
      end
      else if FHA and (not FHHA) and (not FXHA) then
      begin
        SetAlarm(saHA);
        SetElement(seHA);
      end
      else if (not FHA) and (not FHHA) and (not FXHA) then
      begin
        SetAlarm(saNone);
        SetElement(seValueOK);
      end;
    end
    else if (not FOORH) and FOORL then
    begin
      SetAlarm(saOORL);
      SetElement(seOORL);
    end
    else if FOORH and (not FOORL) then
    begin
      SetAlarm(saOORH);
      SetElement(seOORH);
    end;
  end;
end;

procedure TSS1Element.AlarmEvaluation;
begin

  {HA}
  if FTime > FTA then
  begin
    if (not FOORH) and (FValueElement > FHAV) then
      FHA := True
    else
    if (FValueElement <= FHAV - FHY) then
      FHA := False;

    FHAEval := True;
  end;

  {HHA}
  if FTime > FTA then
  begin
    if (not FOORH) and (FValueElement > FHHAV) then
      FHHA := True
    else
    if (FValueElement <= FHHAV - FHY) then
      FHHA := False;

    FHHAEval := True;
  end;

  {XHA}
  if FTime > FTA then
  begin
    if (not FOORH) and (FValueElement > FXHAV) then
      FXHA := True
    else
    if (FValueElement <= FXHAV - FHY) then
      FXHA := False;

    FXHAEval := True;
  end;

  {OORh}
  if FTime >= FTOORH then
  begin
    if ValueSensor > 20 then
      FOORH := True
    else
      FOORH := False;

    FOORHEval := True;
  end;

  {OORL}
  if FTime >= FTOORL then
  begin
    if ValueSensor < 4 then
      FOORL := True
    else
      FOORL := False;

    FOORLEval := True;
  end;

  Inc(FTime);

end;

constructor TSS1Element.Create;
begin
  inherited;

  ELementType := eltSS1;
  DefaultValue;

end;

procedure TSS1Element.DefaultValue;
begin
  inherited;

  FStateDisplayStationary := ssDispElement;
  FStateAlarmInhibited := siNotInhibited;
  FHA := False;
  FXHA := False;
  FOORH := False;
  FOORL := False;
  FValueSensor := 4;

  FTime := 0;

  FHAEval := False;
  FHHAEval := False;
  FXHAEval := False;
  FOORHEval := False;
  FOORLEval := False;

end;

procedure TSS1Element.OnParameterChange(Sender: TObject);
begin
  inherited;

  FHAV   := Parameters.GetParameter(epHAV).ParamDoubleValue;
  FTA    := Parameters.GetParameter(epTA).ParamDoubleValue;
  FTOORH := Parameters.GetParameter(epTOORH).ParamDoubleValue;
  FHY    := Parameters.GetParameter(epHY).ParamDoubleValue;
  FHHAV  := Parameters.GetParameter(epHHAV).ParamDoubleValue;
  FXHAV  := Parameters.GetParameter(epXHAV).ParamDoubleValue;
  FTOORL := Parameters.GetParameter(epTOORL).ParamDoubleValue;

end;

procedure TSS1Element.RunEverySecond;
begin
  inherited;

//  if FHAEval and FHHAEval and FXHAEval and FOORHEval and FOORLEval then
//    Exit;

  AlarmEvaluation;
  AlarmElementStateCalc;

  Inc(FTime);

end;

procedure TSS1Element.SensorValConversion;
var
  valV20,valV4: Double;
begin
  valV20 := Parameters.GetParameter(epV20).ParamDoubleValue;
  valV4 := Parameters.GetParameter(epV4).ParamDoubleValue;

  if FStateElementDisabled = sdDisabled then
  begin
    FValueElement := 0;
    { save to virtual table }
    if Assigned(OnValueChangeSaved) then
      OnValueChangeSaved(FValueElement)
  end
  else
  begin
    FValueElement     := ((valV20-valV4)/16*(FValueSensor-4))+valV4;
    FValueApplication := ((valV20-valV4)/16*(FValueSensor-4))+valV4;

    Listeners.TriggerEvents(Self,epElementValueElmntChange,double(FValueElement));
    Listeners.TriggerEvents(Self,epElementValueAppChange,double(FValueApplication));

    { save to virtual table }
    if Assigned(OnValueChangeSaved) then
      OnValueChangeSaved(FValueElement)
  end;

end;

procedure TSS1Element.SetElementParameters;
begin
  inherited;

  Parameters.AddParameter(epHAV,0);
  Parameters.AddParameter(epHHAV,0);
  Parameters.AddParameter(epXHAV,0);
  Parameters.AddParameter(epHY,0);
  Parameters.AddParameter(epTA,0);
  Parameters.AddParameter(epTOORL,0);
  Parameters.AddParameter(epTOORH,0);
  Parameters.AddParameter(epV20,0);
  Parameters.AddParameter(epV4,0);
  Parameters.AddParameter(epSTA,0);
end;

//procedure TSS1Element.SetPMSValueSensor(const Value: Double);
//begin
//  if FPMSValueSensor = Value then
//    Exit;
//
//  FPMSValueSensor := Value;
//  Listeners.TriggerEvents(Self,epElementValueElmntChange,double(FPMSValueSensor));
//end;

procedure TSS1Element.SetStateAlarmInhibited(const Value: E_StateInhibit);
begin
  if FStateAlarmInhibited = Value then Exit;

  FStateAlarmInhibited  := Value;
  Listeners.TriggerEvents(Self,epElementAlrmInhibited,Byte(Value));

//  AlarmElementStateCalc;
end;

procedure TSS1Element.SetStateDisplayStationary(
  const Value: E_StateDisplayStationery);
begin
  if FStateDisplayStationary = Value then Exit;

  FStateDisplayStationary := Value;
  Listeners.TriggerEvents(Self,epElementStateDisplayChange,Byte(Value));

//  AlarmElementStateCalc;
end;

procedure TSS1Element.SetStateElementDisabled(const Value: E_StateDisabled);
begin
  inherited;

//  AlarmElementStateCalc;
end;

procedure TSS1Element.SetValueSensor(const Value: Double);
begin
  FValueSensor := Value;
  SensorValConversion;

  FTime     := 0;
  FHAEval   := False;
  FHHAEval  := False;
  FXHAEval  := False;
  FOORHEval := False;
  FOORLEval := False;

  Listeners.TriggerEvents(Self,epElementValueSensorChange,double(FValueSensor));
end;

end.
