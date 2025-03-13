{*------------------------------------------------------------------------------
  Running hours-element (RHE)

  The RHE element is used to count up the hours whenever a platform component
  is in operation. If the relevant platform component is in operation,
  the value will accumulate. The operator can reset the counter provided that
  he is authorized to. This might be of use in case the platform component
  is replaced or overhauled. In case the accumulated value is lost the last
  known value may be put in. This is realized by setting the offset parameter.
  Again the operator must have sufficient privileges to do so.

  @author  ryu
  @version 2013/07/16 1.0 Initial revision.
  @todo
  @comment
-------------------------------------------------------------------------------}

unit uRHE;

interface

uses uElement, uDataType, ExtCtrls;

type
  TRHEElement = class(TElement)
  private
    FCommandReset: E_StateActivated;
    FEnableCounting: E_StateEnableCount;
    FValueElement: Double;
    FTimer : Integer;

    procedure SetCommandReset(const aVal: E_StateActivated);
    procedure SetEnableCounting(const aVal: E_StateEnableCount);

  protected
    procedure SetElementParameters; override;
    procedure SetStateElementDisabled(const aVal: E_StateDisabled);override;
  public
    constructor Create; override;

    procedure DefaultValue;override;
    procedure AlarmElementStateCalc; override;
    procedure RunEverySecond;override;
    { element input }
    property CommandReset  : E_StateActivated read FCommandReset
      write SetCommandReset;
    property EnableCounting: E_StateEnableCount read FEnableCounting
      write SetEnableCounting;

    { element output }
    property ValueElement : Double read FValueElement;

  end;

implementation

{ TRHEElement }
constructor TRHEElement.Create;
begin
  inherited;
  ELementType := eltRHE;
end;

procedure TRHEElement.DefaultValue;
begin
  inherited;

  FCommandReset := sacNotActivated;
  FEnableCounting := secNotEnabled;

  FTimer := 0;
end;

procedure TRHEElement.AlarmElementStateCalc;
begin
  inherited;

  if StateElementDisabled = sdDisabled then
  begin
    SetElement(seDisabled);
  end;
  if (StateElementDisabled = sdEnabled) then
  begin
    if (EnableCounting = secNotEnabled) and
       (CommandReset = sacNotActivated) then
    begin
      SetElement(seStopped);
    end else
    if (EnableCounting = secEnabled) and
       (CommandReset = sacNotActivated) then
    begin
      SetElement(seCounting);
    end else
    if CommandReset = sacActivated then
    begin
      SetElement(seNone);
    end;
  end;

end;

procedure TRHEElement.RunEverySecond;
begin
  inherited;
  AlarmElementStateCalc;

  Inc(FTimer);
end;

procedure TRHEElement.SetCommandReset(const aVal: E_StateActivated);
begin
  if FCommandReset = aVal then Exit;

  FCommandReset := aVal;
  Listeners.TriggerEvents(Self, epElementResetChange,Byte(aVal));

//  AlarmElementStateCalc;
end;

procedure TRHEElement.SetElementParameters;
begin
  inherited;

  { default parameters }
  Parameters.AddParameter(epOFFSET, 0);
end;

procedure TRHEElement.SetEnableCounting(const aVal: E_StateEnableCount);
begin
  if FEnableCounting = aVal then Exit;

  FEnableCounting := aVal;
  Listeners.TriggerEvents(Self, epElementCountingChange,Byte(aVal));

//  AlarmElementStateCalc;
end;

procedure TRHEElement.SetStateElementDisabled(const aVal: E_StateDisabled);
begin
  inherited;

//  AlarmElementStateCalc;
end;

end.
