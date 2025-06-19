unit uSSL;

interface

uses
  Classes, ExtCtrls, SysUtils, uDataType, uElement;

type
  TSSLElement = class(TElement)
  private
    FTankTable : TList;

    {Input}
    FValueSensor : Double;
    FTrimValue : Double;
    FCompensationSensor : Double;
    FStateInhibited : E_StateInhibit;

    {Output}
    FValueElementPercent : Double; // in  %
    FValueElementM3 : Double; // in m3
    FValueElementMass : Double; // in tons
    FValueElementLevel : Double; // in m

    {Process Variable}
    FMeasuredLevel : Double;
    FLastMeasuredLevel : Double;

    FIsHA : Boolean;
    FIsLA : Boolean;
    FIsOORH : Boolean;
    FIsOORL : Boolean;

    {Process Result}
    FPressValue : Double;

//    FHATimer : TTimer;
//    FLATimer : TTimer;
//    FOORHTimer : TTimer;
//    FOORLTimer : TTimer;
    FHACount : Integer;
    FLACount : Integer;
    FOORHCount : Integer;
    FOORLCount : Integer;

    {Setter & Getter}
    procedure SetValueSensor(const aValue: Double);
    procedure SetTrimValue(const aValue: Double);
    procedure SetCompensationSensor(const aValue: Double);
    procedure SetStateInhibited(const aState: E_StateInhibit);

    procedure SetValueElementLevel(const aValue : Double);

    {Process Procedure/Function}
    function Interpolation(const aX, aX1, aY1, aX2, aY2: Double): Double;
    function GetMaxContent: Double;
  protected
    {Element Process}
    procedure SensorValueConversion;
    procedure TankLevelDetermination;
    procedure TankContentDetermination;
    procedure AlarmEvaluation; override;
    procedure AlarmElementStateDetermination;

    {Unknown Process}
    procedure SetElementParameters; override;
    procedure SetStateElementDisabled(const Value: E_StateDisabled); override;
  public
    constructor Create; override;

    procedure DefaultValue; override;
    procedure RunEverySecond; override;

    {Unknown}
    procedure AlarmElementStateCalc; override;

    {Element Input Property}
    property ValueSensor : Double read FValueSensor write SetValueSensor;
    property TrimValue : Double read FTrimValue write SetTrimValue;
    property CompensationSensor : Double read FCompensationSensor
      write SetCompensationSensor;
    property StateInhibited : E_StateInhibit read FStateInhibited
      write SetStateInhibited;

    {Element Output Property}
    property ValueElement : Double read FValueElementPercent;
    property ValueElementM3 : Double read FValueElementM3;
    property ValueElementMass : Double read FValueElementMass;
    property ValueElementLevel : Double read FValueElementLevel write
      SetValueElementLevel;
  end;

implementation

uses
  uControllerSystem, uDBSupportClasses;

{ TSSLElement }

procedure TSSLElement.AlarmElementStateCalc;
begin
  inherited;

  if (FStateElementDisabled = sdDisabled) then
  begin
    SetAlarm(saNoneDisable);
    SetElement(seDisabled);
  end;

  if (FStateElementDisabled = sdEnabled) then
  begin
    if (FStateInhibited = siInhibited) and FIsOORH and (not FIsOORL) then
    begin
      SetAlarm(saInhibited);
      SetElement(seValueOK);
    end;
    if (FStateInhibited = siNotInhibited) and (not FIsOORH) and
      (not FIsOORL) then
    begin
      if FIsHA and (not FIsLA) then
      begin
        SetAlarm(saHA);
        SetElement(seHA);
      end;
      if (not FIsHA) and FIsLA then
      begin
        SetAlarm(saLA);
        SetElement(seLA);
      end;
      if (not FIsHA) and (not FIsLA) then
      begin
        SetAlarm(saNone);
        SetElement(seValueOK);
      end;
    end
    else
    if (FStateInhibited = siNotInhibited) and FIsOORH and (not FIsOORL) then
    begin
      SetAlarm(saOORH);
      SetElement(seOORH);
    end
    else
    if (FStateInhibited = siNotInhibited) and (not FIsOORH) and FIsOORL then
    begin
      SetAlarm(saOORL);
      SetElement(seOORL);
    end;
  end;
end;

procedure TSSLElement.AlarmElementStateDetermination;
begin
  case FStateElementDisabled of
    sdDisabled:
    begin
      SetAlarm(saNoneDisable);
      SetElement(seDisabled);
    end;
    sdEnabled:
    begin
      case FStateInhibited of
        siInhibited:
        begin
          if FIsOORH and not FIsOORL then
          begin
            SetAlarm(saInhibited);
            SetElement(seValueOK);
          end;
        end;
        siNotInhibited:
        begin
          if FIsOORH then
          begin
            SetAlarm(saOORH);
            SetElement(seOORH);
          end
          else if FIsOORL then
          begin
            SetAlarm(saOORL);
            SetElement(seOORL);
          end
          else
          begin
            if FIsHA and not FIsLA then
            begin
              SetAlarm(saHA);
              SetElement(seHA);
            end
            else if not FIsHA and FIsLA then
            begin
              SetAlarm(saLA);
              SetElement(seLA);
            end
            else if not FIsHA and not FIsLA then
            begin
              SetAlarm(saNone);
              SetElement(seValueOK);
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure TSSLElement.AlarmEvaluation;
const
  C_OORH = 20;
  C_OORL = 0;
var
  {SG, TAU,} HAV, LAV, HYHA, HYLA, THA, TLA, {V20, V4,} TOORH{, TOORL} : Double;
begin
  inherited;

//  SG := Parameters.GetParameter(epSG).ParamDoubleValue;
//  TAU := Parameters.GetParameter(epTAU).ParamDoubleValue;
  HAV := Parameters.GetParameter(epHAV).ParamDoubleValue;
  LAV := Parameters.GetParameter(epLAV).ParamDoubleValue;
  HYHA := Parameters.GetParameter(epHYHA).ParamDoubleValue;
  HYLA := Parameters.GetParameter(epHYLA).ParamDoubleValue;
  THA := Parameters.GetParameter(epTHA).ParamDoubleValue;
  TLA := Parameters.GetParameter(epTLA).ParamDoubleValue;
//  V20 := Parameters.GetParameter(epV20).ParamDoubleValue;
//  V4 := Parameters.GetParameter(epV4).ParamDoubleValue;
  TOORH := Parameters.GetParameter(epTOORH).ParamDoubleValue;
//  TOORL := Parameters.GetParameter(epTOORL).ParamDoubleValue;

  if FValueElementLevel > HAV then
  begin
    if FHACount > THA then
    begin
      FIsHA := True;
      FHACount := 0;
    end
    else
      Inc(FHACount);
  end
  else if FValueElementLevel <= (HAV - HYHA) then
  begin
    if FHACount > THA then
    begin
      FIsHA := False;
      FHACount := 0;
    end
    else
      Inc(FHACount);
  end;

  if FValueElementLevel < LAV then
  begin
    if FLACount > TLA then
    begin
      FIsLA := True;
      FLACount := 0;
    end
    else
      Inc(FLACount);
  end
  else if FValueElementLevel >= (LAV + HYLA) then
  begin
    if FLACount > TLA then
    begin
      FIsLA := False;
      FLACount := 0;
    end
    else
      Inc(FLACount);
  end;

  if FValueSensor > C_OORH then
  begin
    if FOORHCount > TOORH then
    begin
      FIsOORH := True;
      FOORHCount := 0;
    end
    else
      Inc(FOORHCount);
  end
  else if FValueSensor < C_OORH then
  begin
    if FOORHCount > TOORH then
    begin
      FIsOORH := False;
      FOORHCount := 0;
    end
    else
      Inc(FOORHCount);
  end;

  if FValueSensor < C_OORL then
  begin
    if FOORLCount > TOORH then
    begin
      FIsOORL := True;
      FOORLCount := 0;
    end
    else
      Inc(FOORLCount);
  end
  else if FValueSensor > C_OORL then
  begin
    if FOORLCount > TOORH then
    begin
      FIsOORL := False;
      FOORLCount := 0;
    end
    else
      Inc(FOORLCount);
  end;
end;

constructor TSSLElement.Create;
begin
  inherited;

  ELementType := eltSSL;
end;

procedure TSSLElement.DefaultValue;
begin
  inherited;

  FStateInhibited := siNotInhibited;
end;

function TSSLElement.GetMaxContent: Double;
var
  i : Integer;
  tankData : TTank_Data;
begin
  Result := 0;

  for i := 0 to FTankTable.Count - 1 do
  begin
    tankData := FTankTable.Items[i];

    if tankData.FTrim0m <> '-' then
      Result := StrToFloat(tankData.FTrim0m)
    else
      Break;
  end;
end;

function TSSLElement.Interpolation(const aX, aX1, aY1, aX2,
  aY2: Double): Double;
begin
  Result := ((aX - aX1) * (aY2 - aY1) / (aX2 - aX1)) + aY1;
end;

procedure TSSLElement.RunEverySecond;
begin
  inherited;

//  SensorValueConversion;
//  TankLevelDetermination;
//  TankContentDetermination;
  AlarmEvaluation;
  AlarmElementStateDetermination;
//  AlarmElementStateCalc;
end;

procedure TSSLElement.SensorValueConversion;
var
  V4,V20 : Double;
begin
  V4 := Parameters.GetParameter(epV4).ParamDoubleValue;
  V20 := Parameters.GetParameter(epV20).ParamDoubleValue;

  if FStateElementDisabled = sdDisabled then
    FPressValue := 0
  else
    FPressValue := (FValueSensor / 100) * (V20 - V4) + V4;
end;

procedure TSSLElement.SetCompensationSensor(const aValue: Double);
begin
  FCompensationSensor := aValue;
end;

procedure TSSLElement.SetElementParameters;
begin
  inherited;

  Parameters.AddParameter(epSG, 850);
  Parameters.AddParameter(epTAU, 20);
  Parameters.AddParameter(epHAV, 2);
  Parameters.AddParameter(epLAV, 0);
  Parameters.AddParameter(epHYHA, 0.05);
  Parameters.AddParameter(epHYLA, 0.05);
  Parameters.AddParameter(epTHA, 2);
  Parameters.AddParameter(epTLA, 2);
  Parameters.AddParameter(epV20, 350);
  Parameters.AddParameter(epV4, 0);
  Parameters.AddParameter(epTOORL,0);
  Parameters.AddParameter(epTOORH,0);
end;

procedure TSSLElement.SetStateElementDisabled(const Value: E_StateDisabled);
begin
  inherited;
//  AlarmElementStateCalc;
end;

procedure TSSLElement.SetStateInhibited(const aState: E_StateInhibit);
begin
  if FStateInhibited = aState then
    Exit;

  FStateInhibited := aState;
  Listeners.TriggerEvents(Self, epElementAlrmInhibited, Byte(aState));

//  AlarmElementStateCalc;
end;

procedure TSSLElement.SetTrimValue(const aValue: Double);
begin
  FTrimValue := aValue;
end;

procedure TSSLElement.SetValueElementLevel(const aValue: Double);
begin
  FValueElementLevel := aValue;

  TankContentDetermination;
end;

procedure TSSLElement.SetValueSensor(const aValue: Double);
begin
  FValueSensor := aValue;
end;

procedure TSSLElement.TankContentDetermination;
var
  i: Integer;
  oldTankData, newTankData : TTank_Data;
  level : Double;
begin
  {Process}
  oldTankData := nil;
  CtrlSystem.Database.GetTankTableByElementID(ElementID, FTankTable);

  for i := 0 to FTankTable.Count - 1 do
  begin
    newTankData := FTankTable.Items[i];
    level := StrToFloat(newTankData.FSoundLength);

    if FValueElementLevel = level then
    begin
      FValueElementM3 := StrToFloat(newTankData.FTrim0m);

      Break;
    end
    else if FValueElementLevel < level then
    begin
      FValueElementM3 := Interpolation(FValueElementLevel,
        StrToFloat(oldTankData.FSoundLength), StrToFloat(oldTankData.FTrim0m),
        StrToFloat(newTankData.FSoundLength), StrToFloat(newTankData.FTrim0m));

      Break;
    end;

    oldTankData := newTankData;
  end;

  FValueElementPercent := 100 * FValueElementM3 / GetMaxContent;
  FValueElementMass := FValueElementM3 *
    Parameters.GetParameter(epSG).ParamDoubleValue / 1000;

  {Update View}
  Listeners.TriggerEvents(Self, epValElementPercentChange, FValueElementPercent);
  Listeners.TriggerEvents(Self, epValElementMChange, FValueElementLevel);
  Listeners.TriggerEvents(Self, epValElementM3Change, FValueElementM3);
  Listeners.TriggerEvents(Self, epValElementMassChange, FValueElementMass);

  { save to virtual table }
  if Assigned(OnValueChangeSaved) then
    OnValueChangeSaved(FValueElementPercent);

  if Assigned(OnValueLevelChangeSaved) then
    OnValueChangeSaved(FValueElementLevel);

  if Assigned(OnValueM3ChangeSaved) then
    OnValueChangeSaved(FValueElementM3);

  if Assigned(OnValueMassChangeSaved) then
    OnValueChangeSaved(FValueElementMass);

  { jgn lupa data tank di hapus dari list }
  while FTankTable.Count > 0 do
  begin
    oldTankData := FTankTable.Items[0];
    oldTankData.Free;
    FTankTable.Delete(0);
  end;
  FTankTable.Clear;

end;

procedure TSSLElement.TankLevelDetermination;
const
  C_Rho = 9.8;
  C_TCycle = 2;
  C_Offset = 3;
var
  P_SG, P_Tau: Double;
begin
  P_SG := Parameters.GetParameter(epSG).ParamDoubleValue;
  P_Tau := Parameters.GetParameter(epTAU).ParamDoubleValue;

  FLastMeasuredLevel := FMeasuredLevel;
  FMeasuredLevel := (FPressValue + FCompensationSensor) / P_SG * C_Rho;
  FMeasuredLevel := FMeasuredLevel - FLastMeasuredLevel * C_TCycle / P_Tau +
    FLastMeasuredLevel;

  FValueElementLevel := FMeasuredLevel + C_Offset;
end;

end.
