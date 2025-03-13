unit uVCP;

interface

uses uElement, uDataType;

type
  TVCPElement = class(TElement)
  private
    FStateSwitchRemote: E_StateSwitchRemote;
    //FDesireCommand: E_DesiredState;
    FSetPoint, FValueValve, FDesireCommand, Ft: Integer;
    FControlOpen, FControlClose: E_StateActivated;
    FStateControlPosition: E_ControlMode;

    procedure SetStateSwitchRemote(const Value: E_StateSwitchRemote);
    procedure SetSetPoint(const Value: Integer);
    procedure SetValueValve(const Value: Integer);

  protected
    procedure SetElementParameters;override;
    procedure PlatformControl;override;
    procedure ControlModeDetermination;
    procedure SetStateElementDisabled(const Value: E_StateDisabled);override;

  public
    constructor Create; override;
    procedure AlarmElementStateCalc;override;

    { element input }
    property StateSwitchRemote : E_StateSwitchRemote read FStateSwitchRemote write SetStateSwitchRemote;
    property SetPoint: Integer read FSetPoint write SetSetPoint;
    property ValueValve: Integer read FValueValve write SetValueValve;

    { element output }
    property ControlOpen : E_StateActivated read FControlOpen;
    property ControlClose : E_StateActivated read FControlClose;
    property StateControlPosition : E_ControlMode read FStateControlPosition;
    property DesireCommand: Integer read FDesireCommand;

  end;

implementation

{ TVCPElement }

procedure TVCPElement.AlarmElementStateCalc;
begin
  inherited;

  if FStateElementDisabled = sdDisabled then
  begin
    SetAlarm(saNoneDisable);
    SetElement(seDisabled);
  end;

  if (FStateElementDisabled = sdEnabled) then
  begin

    if FValueValve = Integer(epTOORL) then
    begin
      setAlarm(saOORL);
      setElement(seOORL)
    end;
    if FValueValve = Integer(epTOORH) then
    begin
      setAlarm(saOORH);
      setElement(seOORH);
    end;

    if FStateSwitchRemote = ssrLocal then
    begin
      SetAlarm(saNone);
//      SetElement(closed/open %);
    end
    else if (FStateSwitchRemote = ssrRemote) and (FDesireCommand = FSetPoint) then
    begin
      if FValueValve = FSetPoint then
      begin
        SetAlarm(saNone);
//        SetElement(closed/open %);
      end
      else if (Ft < Integer(epTTRANS)) then
      begin
        SetAlarm(saNone);
        SetElement(seTransition);
      end
      else if (Ft >= Integer(epTTRANS)) then
      begin
        SetAlarm(saControlFailure);
        SetElement(seControlFailure);
      end;
    end;
  end;
end;

procedure TVCPElement.ControlModeDetermination;
begin
  FStateControlPosition := cmNone;
  if FStateSwitchRemote = ssrLocal then
    FStateControlPosition := cmLocal
  else if FStateSwitchRemote = ssrRemote then
    FStateControlPosition := cmRemote;
end;

constructor TVCPElement.Create;
begin
  inherited;

  ElementType := eltVCP;

end;

procedure TVCPElement.PlatformControl;
begin
  if (FSetPoint > FValueValve) then
  begin
    FControlOpen := sacActivated;
    FControlClose := sacNotActivated;
  end
  else if (FSetPoint < FValueValve) then
  begin
    FControlOpen := sacNotActivated;
    FControlClose := sacActivated;
  end
  else
  begin
    FControlOpen := sacNotActivated;
    FControlClose := sacNotActivated;
  end;

  { -- belum tau --}
  if ({initialising OR FStateSwitchRemote = Open _> Closed OR}
    FStateElementDisabled = sdDisabled {_> enabled}) then
  begin
    {FSetPoint := FValueValve 'open'}
  end;
end;

procedure TVCPElement.SetElementParameters;
begin
  inherited;

  Parameters.AddParameter(epTTRANS,0);
end;

procedure TVCPElement.SetSetPoint(const Value: Integer);
begin
  FSetPoint := Value;
  PlatformControl;
end;

procedure TVCPElement.SetStateElementDisabled(const Value: E_StateDisabled);
begin
  inherited;
  PlatformControl;
end;

procedure TVCPElement.SetStateSwitchRemote(const Value: E_StateSwitchRemote);
begin
  if FStateSwitchRemote = Value then Exit;

  FStateSwitchRemote := Value;
  Listeners.TriggerEvents(Self,epStateSwitchRemoteChange,Byte(Value));

  AlarmElementStateCalc;
  PlatformControl;
  ControlModeDetermination;
end;

procedure TVCPElement.SetValueValve(const Value: Integer);
begin
  if FValueValve = Value then Exit;

  FValueValve := Value;
  Listeners.TriggerEvents(Self,epElementValueValveChange,Integer(Value));

  AlarmElementStateCalc;
  PlatformControl;
end;

end.
