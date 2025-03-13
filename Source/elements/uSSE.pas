unit uSSE;

interface

uses uElement, uDataType;

type
  TSSEElement = class(TElement)
  private
    FStateInhibited: E_StateInhibit;
    FStateDisplayStationary: E_StateDisplayStationery;
    FValueElement: Double;
    FValueApplication: Double;
    FValueSensor: Double;
    FHA, FLA, FOORH, FOORL : boolean;
    FTHA, FTLA, FTOORH, FTOORL, FHAV, FLAV,
    FHYHA, FHYLA : double;

    FTime : integer;
    FHAEval, FLAEval, FOORHEval, FOORLEval : boolean;

    procedure SetStateInhibited(const Value: E_StateInhibit);
    procedure SetStateDisplayStationary(const Value: E_StateDisplayStationery);
    procedure SetValueSensor(const Value: Double);
//    procedure SetValueElement(const Value : Double);

    procedure SensorValConversion;
  protected
    procedure SetElementParameters;override;
    procedure SetStateElementDisabled(const Value: E_StateDisabled);override;
    procedure AlarmEvaluation;override;
    procedure OnParameterChange(Sender : TObject);override;

  public
    constructor Create; override;

    procedure DefaultValue;override;
    procedure AlarmElementStateCalc;override;
    procedure RunEverySecond;override;

    { element input from platform }
    property ValueSensor: Double read FValueSensor write SetValueSensor;

    { element input from ipms }
    property StateInhibited : E_StateInhibit read FStateInhibited write SetStateInhibited;
    property StateDisplayStationary : E_StateDisplayStationery read FStateDisplayStationary write SetStateDisplayStationary;

    { element output }
    property ValueElement : Double read FValueElement {write SetValueElement};
    property ValueApplication : Double read FValueApplication;

  end;

implementation

uses uFunction;

{ TSSEElement }

procedure TSSEElement.AlarmElementStateCalc;
begin
  inherited;


  if (StateElementDisabled = sdDisabled) then
  begin
    SetAlarm(saNoneDisable);
    SetElement(seDisabled);
  end;

  if (StateElementDisabled = sdEnabled) and (StateInhibited = siInhibited) then
  begin
    SetAlarm(saInhibited);
    SetElement(seValueOK);
  end;

  if (StateElementDisabled = sdEnabled) and (StateInhibited = siNotInhibited) then
  begin
    if (not FOORH) and (not FOORL) and (not FHA) and (FLA) then
    begin
      SetAlarm(saLA);
      SetElement(seLA);
    end else
    if (not FOORH) and (not FOORL) and (FHA) and (not FLA) then
    begin
      SetAlarm(saHA);
      SetElement(seHA);
    end else
    if (not FOORH) and (FOORL) then
    begin
      SetAlarm(saOORL);
      SetElement(seOORL);
    end else
    if (FOORH) and (not FOORL) then
    begin
      SetAlarm(saOORH);
      SetElement(seOORH);
    end else
    begin
      SetAlarm(saNone);
      SetElement(seValueOK);
    end;
  end;
end;

procedure TSSEElement.AlarmEvaluation;
begin
  inherited;

  if FTime >= FTOORH then
  begin
    if ValueSensor > 20 then
      FOORH := True
    else
      FOORH := False;

    FOORHEval := True;
  end;

  if FTime >= FTOORL then
  begin
    if ValueSensor < 4 then
      FOORL := True
    else
      FOORL := False;

    FOORLEval := True;
  end;

  if FTime > FTHA then
  begin
    if (not FOORH) and (FValueElement > FHAV) then
      FHA := True
    else
    if (FValueElement <= FHAV - FHYHA) then
      FHA := False;

    FHAEval := True;
  end;

  if FTime > FTLA then
  begin
    if (not FOORL) and (FValueElement < FLAV) then
      FLA := True
    else
    if (FValueElement >= FLAV - FHYLA) then
      FLA := False;

    FLAEval := True;
  end;

  Inc(FTime);
end;

constructor TSSEElement.Create;
begin
  inherited;

  ELementType := eltSSE;
  FHA := False;
  FLA := False;
  FOORH := False;
  FOORL := False;

  FTime := 0;
end;

procedure TSSEElement.DefaultValue;
begin
  inherited;

  FStateInhibited := siInhibited;
  FStateDisplayStationary := ssDispElement;
  FHA := False;
  FLA := False;
  FOORH := False;
  FOORL := False;
  FValueSensor := 4;

  FTime := 0;
  FTime := 0;

  FHAEval := False;
  FLAEval := False;
  FOORHEval := False;
  FOORLEval := False;

end;

procedure TSSEElement.OnParameterChange(Sender: TObject);
begin
  inherited;

  FTHA  := Parameters.GetParameter(epTHA).ParamDoubleValue;
  FTLA  := Parameters.GetParameter(epTLA).ParamDoubleValue;
  FTOORH:= Parameters.GetParameter(epTOORH).ParamDoubleValue;
  FTOORL:= Parameters.GetParameter(epTOORL).ParamDoubleValue;
  FHAV  := Parameters.GetParameter(epHAV).ParamDoubleValue;
  FLAV  := Parameters.GetParameter(epLAV).ParamDoubleValue;
  FHYHA  := Parameters.GetParameter(epHYHA).ParamDoubleValue;
  FHYLA  := Parameters.GetParameter(epHYLA).ParamDoubleValue;

end;

procedure TSSEElement.RunEverySecond;
begin
  inherited;

//  if FHAEval and FLAEval and FOORHEval and FOORLEval then
//    Exit;

  AlarmEvaluation;
  AlarmElementStateCalc;

end;

procedure TSSEElement.SensorValConversion;
var
  valElm, valApp : Double;
begin
  valElm := Parameters.GetParameter(epV20).ParamDoubleValue;
  valApp := Parameters.GetParameter(epV4).ParamDoubleValue;

  if FStateElementDisabled = sdDisabled then
  begin
    FValueElement := 0;

    { save to virtual table }
    if Assigned(OnValueChangeSaved) then
      OnValueChangeSaved(FValueElement)
  end
  else
  begin
    FValueElement := (((valElm-valApp)/16)*(FValueSensor-4))+valApp;
    FValueApplication :=( ((valElm-valApp)/16)*(FValueSensor-4))+valApp;

    Listeners.TriggerEvents(Self,epElementValueElmntChange,double(FValueElement));
    Listeners.TriggerEvents(Self,epElementValueAppChange,double(FValueApplication));

    { save to virtual table }
    if Assigned(OnValueChangeSaved) then
      OnValueChangeSaved(FValueElement)
  end;

end;

procedure TSSEElement.SetElementParameters;
begin
  inherited;

  Parameters.AddParameter(epHA,0);
  Parameters.AddParameter(epLA,0);
  Parameters.AddParameter(epTOORL,0);
  Parameters.AddParameter(epTOORH,0);
  Parameters.AddParameter(epSTA,0);

  Parameters.AddParameter(epHAV,0);
  Parameters.AddParameter(epLAV,0);
  Parameters.AddParameter(epHYHA,0);
  Parameters.AddParameter(epHYLA,0);
  Parameters.AddParameter(epTHA,0);
  Parameters.AddParameter(epTLA,0);
  Parameters.AddParameter(epV20,0);
  Parameters.AddParameter(epV4,0);

end;

procedure TSSEElement.SetStateDisplayStationary(
  const Value: E_StateDisplayStationery);
begin
  if FStateDisplayStationary = Value then Exit;

  FStateDisplayStationary := Value;
  Listeners.TriggerEvents(Self,epElementStateDisplayChange,Byte(Value));

//  AlarmElementStateCalc;
end;

procedure TSSEElement.SetStateElementDisabled(const Value: E_StateDisabled);
begin
inherited;
  SensorValConversion;
//  AlarmElementStateCalc;
end;

procedure TSSEElement.SetStateInhibited(const Value: E_StateInhibit);
begin
  if FStateInhibited = Value then Exit;

  FStateInhibited := Value;
  Listeners.TriggerEvents(Self,epElementAlrmInhibited,Byte(Value));

//  AlarmElementStateCalc;
end;

//procedure TSSEElement.SetValueElement(const Value: Double);
//begin
//  FValueElement := Value;
//  Listeners.TriggerEvents(Self,epElementValueElmntChange,double(FValueElement));
//end;

procedure TSSEElement.SetValueSensor(const Value: Double);
begin
  if FValueSensor = Value then Exit;

  FValueSensor := Value;
  SensorValConversion;

  FTime := 0;
  FHAEval := False;
  FLAEval := False;
  FOORHEval := False;
  FOORLEval := False;

end;

end.
