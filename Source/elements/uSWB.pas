unit uSWB;

interface

uses uElement, uDataType;

type
  TSWBElement = class(TElement)
  private
    FInState : Boolean;

    procedure SetInState(const Value: Boolean);

  public
    constructor Create; override;
    procedure AlarmElementStateCalc;override;

    { element input }
    property InState: Boolean read FInState write SetInState;

    { element output }

  end;


implementation

{ TSWBElement }

procedure TSWBElement.AlarmElementStateCalc;
begin
  inherited;

  if FInState then SetElement(seState1);
  if not FInState then SetElement(seState0);

end;

constructor TSWBElement.Create;
begin
  inherited;

  ELementType := eltSWB;
end;

procedure TSWBElement.SetInState(const Value: Boolean);
begin
  FInState := Value;
  AlarmElementStateCalc;
end;

end.
