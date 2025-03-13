unit uElement;

interface

uses
  uDataType, Classes, uListener;

type
  { element item parameter }
  TParameter = class
  private
    FParamType: E_ElementParameter;
    FParamDoubleValue: Double;
    FOnParameterChange: TNotifyEvent;
    procedure SetParamType(const Value: E_ElementParameter);
    procedure SetParamDoubleValue(const Value: Double);
    procedure SetOnParameterChange(const Value: TNotifyEvent);

  public
    property ParamType : E_ElementParameter read FParamType write SetParamType;
    property ParamDoubleValue : Double read FParamDoubleValue write SetParamDoubleValue;
    property OnParameterChange : TNotifyEvent read FOnParameterChange write SetOnParameterChange;
  end;

  { element list }
  TParameters = class
  private
    FParamList : TList;
  public
    constructor Create;
    destructor Destroy;override;

    { only add uniq parameter type }
    procedure AddParameter(aParam : E_ElementParameter; aValue : Double);
    procedure RemoveParameter(aParam :E_ElementParameter);
    function GetParameter(aParam : E_ElementParameter) : TParameter;
  end;

  TElement = class
  private
    FElementID: string;
    FElementName: String;
    FElementType: E_ElementType;
    FStateAlarm: E_StateAlarm;
    FStateCommand: E_DesiredState;
    FStateControlPosition: E_ControlMode;
    FStateElement: E_StateElement;
    FStateControlCloseOpen : E_StateActivated;
    FParameters : TParameters;
    FElementMimic: integer;
    FSystemID: String;
    FSystemDesc: String;
    FControllerID: string;
    FAlarmGroupAbbr: String;
    FAlarmGroupID: integer;
    FAlarmGroupDesc: String;
    FElementValue: Double;

    FListeners : TListeners;
    FOnValueChangeSaved: T_OnDoubleValueChange;
    FOnValueM3ChangeSaved: T_OnDoubleValueChange;
    FOnValueMassChangeSaved: T_OnDoubleValueChange;
    FOnValueLevelChangeSaved: T_OnDoubleValueChange;

    procedure SetElementID(const Value: string);
    procedure SetElementName(const Value: String);
    procedure SetElementType(const Value: E_ElementType);
    procedure SetElementMimic(const Value: integer);
    procedure SetSystemDesc(const Value: String);
    procedure SetSystemID(const Value: String);
    procedure SetControllerID(const Value: string);
    procedure SetAlarmGroupDesc(const Value: String);
    procedure SetAlarmGroupAbbr(const Value: String);
    procedure SetAlarmGroupID(const Value: integer);
    procedure SetOnValueChangeSaved(const Value: T_OnDoubleValueChange);
    procedure SetOnValueLevelChangeSaved(const Value: T_OnDoubleValueChange);
    procedure SetOnValueM3ChangeSaved(const Value: T_OnDoubleValueChange);
    procedure SetOnValueMassChangeSaved(const Value: T_OnDoubleValueChange);


  protected
    FStateElementDisabled: E_StateDisabled;

    procedure AppValueConversion;virtual;
    procedure ValueSelection;virtual;
    procedure AlarmEvaluation;virtual;
    procedure RunningDetermination;virtual;
    procedure ControlDetermintaion;virtual;
    procedure PlatformControl;virtual;
    procedure SwitchDetermination;virtual;
    procedure StorageSetPoint;virtual;
    procedure EnableDisabledElement;virtual;
    procedure SignalDelay;virtual;

    procedure SetAlarm(aState : E_StateAlarm);
    procedure SetElement(aState : E_StateElement);
    procedure SetValue(aValue : Double);

    procedure SetElementParameters;virtual;
    procedure SetStateElementDisabled(const Value: E_StateDisabled);virtual;

    procedure OnParameterChange(Sender : TObject);virtual;

  public
    constructor Create; virtual;
    destructor Destroy; override;

    procedure AlarmElementStateCalc;virtual;
    procedure RunEverySecond; virtual;

    procedure DefaultValue;virtual;

    property Listeners    : TListeners read FListeners;
    property Parameters : TParameters read FParameters;
    property ElementID    : string read FElementID write SetElementID;
    property ElementName  : String read FElementName write SetElementName;
    property ElementType  : E_ElementType read FElementType write SetElementType;
    property ElementMimic : integer read FElementMimic write SetElementMimic;
    property SystemID     : String read FSystemID write SetSystemID;
    property SystemDesc   : String read FSystemDesc write SetSystemDesc;
    property ControllerID : string read FControllerID write SetControllerID;
    property AlarmGroupID : integer read FAlarmGroupID write SetAlarmGroupID;
    property AlarmGroupDesc : String read FAlarmGroupDesc write SetAlarmGroupDesc;
    property AlarmGroupAbbr : String read FAlarmGroupAbbr write SetAlarmGroupAbbr;
    { common element output }
    property StateAlarm   : E_StateAlarm read FStateAlarm write setAlarm default saNone;
    property StateCommand : E_DesiredState read FStateCommand default dsNone;
    property StateControlPosition : E_ControlMode read FStateControlPosition default cmNone;
    property StateElement : E_StateElement read FStateElement write SetElement default seDisabled;
    property StateControlCloseOpen : E_StateActivated read FStateControlCloseOpen default sacNotActivated;
    property StateElementDisabled : E_StateDisabled read FStateElementDisabled write SetStateElementDisabled;

    { }
    property OnValueChangeSaved : T_OnDoubleValueChange read FOnValueChangeSaved write SetOnValueChangeSaved;
    property OnValueM3ChangeSaved : T_OnDoubleValueChange read FOnValueM3ChangeSaved write SetOnValueM3ChangeSaved;
    property OnValueMassChangeSaved : T_OnDoubleValueChange read FOnValueMassChangeSaved write SetOnValueMassChangeSaved;
    property OnValueLevelChangeSaved : T_OnDoubleValueChange read FOnValueLevelChangeSaved write SetOnValueLevelChangeSaved;
  end;

implementation

uses uFunction, SysUtils;

{ TElement }

procedure TElement.AlarmElementStateCalc;
begin

end;

procedure TElement.AlarmEvaluation;
begin

end;

procedure TElement.AppValueConversion;
begin

end;

procedure TElement.ControlDetermintaion;
begin

end;

constructor TElement.Create;
var
  i : integer;
  aParam : TParameter;
begin
  FParameters := TParameters.Create;
  FListeners := TListeners.Create;

  { custom element parameter }
  SetElementParameters;

  { notify changed parameter }
  for I := 0 to FParameters.FParamList.Count - 1 do
  begin
    aParam := FParameters.FParamList.Items[i];
    aParam.OnParameterChange := OnParameterChange;
  end;

  { set default }
  DefaultValue;
  AlarmElementStateCalc;
end;

procedure TElement.DefaultValue;
begin
  FStateElementDisabled :=  sdEnabled;
  FStateAlarm := saNone;
  FStateElement := seUnavailable;
end;

destructor TElement.Destroy;
var
  i : integer;
  aParam : TParameter;
begin

  for I := 0 to FParameters.FParamList.Count - 1 do
  begin
    aParam := FParameters.FParamList.Items[i];
    aParam.OnParameterChange := nil;
  end;

  FListeners.Free;
  FParameters.Free;
  inherited;
end;

procedure TElement.EnableDisabledElement;
begin

end;

procedure TElement.OnParameterChange(Sender: TObject);
begin
//  AlarmElementStateCalc;
end;

procedure TElement.PlatformControl;
begin

end;

procedure TElement.RunEverySecond;
begin

end;

procedure TElement.RunningDetermination;
begin

end;

procedure TElement.SetAlarm(aState: E_StateAlarm);
begin
  if aState = FStateAlarm then Exit;

  FStateAlarm := aState;

  Listeners.TriggerEvents(Self,epElementAlarmChange,Byte(aState));
  Listeners.TriggerEvents(Self,epElementDebugInfo,'State Alarm : ' + ElementAlarmStateToStr(aState));
end;

procedure TElement.SetAlarmGroupDesc(const Value: String);
begin
  FAlarmGroupDesc := Value;
end;

procedure TElement.SetAlarmGroupAbbr(const Value: String);
begin
  FAlarmGroupAbbr := Value;
end;

procedure TElement.SetAlarmGroupID(const Value: integer);
begin
  FAlarmGroupID := Value;
end;

procedure TElement.SetControllerID(const Value: string);
begin
  FControllerID := Value;
end;

procedure TElement.SetElement(aState: E_StateElement);
begin
  {Ryu : ini dibuka biar g update trus, berat jaringan nya}
  if aState = FStateElement then Exit;

  FStateElement := aState;

  Listeners.TriggerEvents(Self,epElementStateChange,Byte(aState));
end;

procedure TElement.SetElementID(const Value: string);
begin
  FElementID := Value;
end;

procedure TElement.SetElementMimic(const Value: integer);
begin
  FElementMimic := Value;
end;

procedure TElement.SetElementName(const Value: String);
begin
  FElementName := Value;
end;

procedure TElement.SetElementParameters;
begin

end;

procedure TElement.SetElementType(const Value: E_ElementType);
begin
  FELementType := Value;
end;

procedure TElement.SetOnValueChangeSaved(const Value: T_OnDoubleValueChange);
begin
  FOnValueChangeSaved := Value;
end;

procedure TElement.SetOnValueLevelChangeSaved(const Value: T_OnDoubleValueChange);
begin
  FOnValueLevelChangeSaved := Value;
end;

procedure TElement.SetOnValueM3ChangeSaved(const Value: T_OnDoubleValueChange);
begin
  FOnValueM3ChangeSaved := Value;
end;

procedure TElement.SetOnValueMassChangeSaved(
  const Value: T_OnDoubleValueChange);
begin
  FOnValueMassChangeSaved := Value;
end;

procedure TElement.SetStateElementDisabled(const Value: E_StateDisabled);
begin
  if FStateElementDisabled = Value then
    Exit;

  FStateElementDisabled := Value;
//  Listeners.TriggerEvents(Self,epElementDisabledChange,Byte(Value));

end;

procedure TElement.SetSystemDesc(const Value: String);
begin
  FSystemDesc := Value;
end;

procedure TElement.SetSystemID(const Value: String);
begin
  FSystemID := Value;
end;

procedure TElement.SetValue(aValue: Double);
begin
  FElementValue := aValue;

  Listeners.TriggerEvents(Self,epElementValueChange,aValue);
  Listeners.TriggerEvents(Self,epElementDebugInfo,'Element Value : ' + FloatToStr(aValue));
end;

procedure TElement.SignalDelay;
begin

end;

procedure TElement.StorageSetPoint;
begin

end;

procedure TElement.SwitchDetermination;
begin

end;

procedure TElement.ValueSelection;
begin

end;

{ TParameter }

procedure TParameter.SetParamType(const Value: E_ElementParameter);
begin
  FParamType := Value;
end;

procedure TParameter.SetOnParameterChange(const Value: TNotifyEvent);
begin
  FOnParameterChange := Value;
end;

procedure TParameter.SetParamDoubleValue(const Value: Double);
begin
  FParamDoubleValue := Value;
  if Assigned(FOnParameterChange) then
    FOnParameterChange(Self);
end;

{ TParameters }

procedure TParameters.AddParameter(aParam: E_ElementParameter; aValue: Double);
var
  param : TParameter;
begin
  param := GetParameter(aParam);

  if Assigned(param) then
    param.ParamDoubleValue := aValue
  else
  begin
    param := TParameter.Create;
    param.ParamType := aParam;
    param.ParamDoubleValue := aValue;
    FParamList.Add(param);
  end;
end;

constructor TParameters.Create;
begin
  FParamList := TList.Create;
end;

destructor TParameters.Destroy;
var
 param : TParameter;
begin
  while FParamList.Count > 0 do begin
    param := TParameter(FParamList.Items[0]);
    FParamList.Delete(0);
    param.Free;
  end;
  FParamList.Free;
  inherited;
end;

function TParameters.GetParameter(aParam: E_ElementParameter): TParameter;
var
  i : integer;
  param : TParameter;
begin
  Result := nil;

  for i := 0 to FParamList.Count - 1 do
  begin
    param := TParameter(FParamList.Items[i]);

    if param.ParamType = aParam then
    begin
      Result := param;
      Exit;
    end;
  end;
end;

procedure TParameters.RemoveParameter(aParam: E_ElementParameter);
var
  i : integer;
  param : TParameter;
begin
  for I := 0 to FParamList.Count - 1 do begin
    param := TParameter(FParamList.Items[i]);
    if param.ParamType = aParam then begin
      FParamList.Remove(param);
      exit;
    end;
  end;
end;

end.
