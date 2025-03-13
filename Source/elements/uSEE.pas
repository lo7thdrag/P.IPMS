{*------------------------------------------------------------------------------
  Switch Event Element (SEE)

  The Switch Event Element is used to count the number of switch events of a
  platform component. If a relevant change of state of the component is
  detected a positive edge applied on the event input will increment the count
  by one. The operator can reset the counter provided that he is authorized to.
  This might be of use in case the relevant component has been replaced of
  overhauled. In case the accumulated value is lost the last known value
  may be put in by setting an offset parameter. Again the operator needs
  sufficient privileges to able to.

  @author  DID
  @version 2013/07/16 1.0 Initial revision.
  @todo
  @comment
-------------------------------------------------------------------------------}

unit uSEE;

interface

uses uElement, uDataType;

type
  TSEEElement = class(TElement)
  private
    FCommandReset: E_StateActivated;
    FEventInput: E_StateActivated;
    FStateElementDisabled: E_StateDisabled;
    FValueElement: Integer;

    procedure SetCommandReset(const aVal: E_StateActivated);
    procedure SetEventInput(const aVal: E_StateActivated);

  protected
    procedure SetStateElementDisabled(const aVal: E_StateDisabled); override;
    procedure SwitchDetermination; override;
    procedure SetElementParameters; override;

  public
    { element input }
    procedure AlarmElementStateCalc; override;
    property CommandReset: E_StateActivated read FCommandReset
      write SetCommandReset;
    property EventInput: E_StateActivated read FEventInput
      write SetEventInput;
    property StateElementDisabled: E_StateDisabled read FStateElementDisabled
      write SetStateElementDisabled;

    { element output }
    property ValueElement: Integer read FValueElement;

  end;

implementation

{ TSEEElement }

procedure TSEEElement.AlarmElementStateCalc;
begin
  inherited;

  if StateElementDisabled = sdDisabled then
    SetElement(seDisabled)
  else
    SetElement(seNormal);
end;

procedure TSEEElement.SwitchDetermination;
begin
  inherited;

  if (EventInput = sacActivated) then
  begin
    FValueElement := FValueElement + 1
  end
  else if (FCommandReset = sacActivated) or
          (FValueElement > 2147483647) then
  begin
    FValueElement := 0;
  end
  else
    FValueElement := FValueElement;
end;

procedure TSEEElement.SetCommandReset(const aVal: E_StateActivated);
begin
  FCommandReset := aVal;
  SwitchDetermination;
end;

procedure TSEEElement.SetElementParameters;
begin
  inherited;

  { default parameter, must be set from database }
  Parameters.AddParameter(epOFFSET, 0);
end;

procedure TSEEElement.SetEventInput(const aVal: E_StateActivated);
begin
  FEventInput := aVal;
  SwitchDetermination;
  AlarmElementStateCalc;
end;

procedure TSEEElement.SetStateElementDisabled(const aVal: E_StateDisabled);
begin
  inherited;
  FStateElementDisabled := aVal;
  SwitchDetermination;
  AlarmElementStateCalc;
end;

end.
