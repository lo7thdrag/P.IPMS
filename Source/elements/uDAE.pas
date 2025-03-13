{*------------------------------------------------------------------------------
  The discrete application-element is able to designate 15 different statuses
  either derived from a process or from the platform. Although alarm statuses
  may be indicated by the matching HMI symbol, the DAE itself is not capable of
  generating an alarm.

  @author  DID
  @version 2013/07/16 1.0 Initial revision.
  @todo
  @comment
-------------------------------------------------------------------------------}

unit uDAE;

interface
uses uElement, uDataType, Classes, SysUtils;

type
  TDAEElement = class(TElement)
  private
    FCommand: E_StateDisabled;
    FState: E_State;
    FStateElementCaption : E_State;

    procedure SetCommand(const aVal: E_StateDisabled);
    procedure SetState(const aVal: E_State);

  protected
    procedure SetStateElementCaption(const Value: E_State);virtual;
  public
    constructor Create; override;

    procedure DefaultValue;override;
    procedure AlarmElementStateCalc; override;
    procedure RunEverySecond;override;
    property Command: E_StateDisabled read FCommand write SetCommand;
    property State  : E_State read FState write SetState default sState15;
    property StateElementCaption : E_State read FStateElementCaption write SetStateElementCaption;
  end;

implementation

{ TDAEElement }
constructor TDAEElement.Create;
begin
  inherited;
  ELementType := eltDAE;
  FStateElementCaption := sState15;
end;

procedure TDAEElement.DefaultValue;
begin
  inherited;
  FCommand := sdEnabled;

end;

procedure TDAEElement.RunEverySecond;
begin
  inherited;
  AlarmElementStateCalc;
end;

procedure TDAEElement.AlarmElementStateCalc;
begin
  inherited;
  SetStateElementCaption(state);

//  if Command = sdDisabled then
//  begin
//    SetElement(seDisabled);
//
//    {Prince : sState15 sementara saya gunakan sebagai penanda disable}
//    SetStateElementCaption(sState15);
//  end
//  else if Command = sdEnabled then
//  begin
//    case state of
//      sState1: SetElement(seState);
//      sState2: SetElement(seState);
//      sState3: SetElement(seState);
//      sState4: SetElement(seState);
//      sState5: SetElement(seState);
//      sState6: SetElement(seState);
//      sState7: SetElement(seState);
//      sState8: SetElement(seState);
//      sState9: SetElement(seState);
//      sState10: SetElement(seState);
//      sState11: SetElement(seState);
//      sState12: SetElement(seState);
//      sState13: SetElement(seState);
//      sState14: SetElement(seState);
//      sState15: SetElement(seState);
//    end;
//    {Prince : tambahan saya buat ganti caption DAE, untuk keperluan saya}
//    SetStateElementCaption(state);
//  end;


end;

procedure TDAEElement.SetCommand(const aVal: E_StateDisabled);
begin
  FCommand := aVal;
//  AlarmElementStateCalc;
end;

procedure TDAEElement.SetState(const aVal: E_State);
begin
  FState := aVal;
//  AlarmElementStateCalc;
end;

procedure TDAEElement.SetStateElementCaption(const Value: E_State);
begin


  if Command = sdDisabled  then
  begin
//    FStateElementCaption := sState15;
    SetElement(seDisabled);
  end
  else
  begin
    SetElement(seValueOK);

    {sementara dikomen agar gensys bisa jalan}
//    if FStateElementCaption = Value then
//    Exit;

    FStateElementCaption := Value;
    Listeners.TriggerEvents(Self,epElementCaptionChange,Byte(Value));
  end;



end;

end.
