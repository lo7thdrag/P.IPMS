unit uSS2;

interface

uses uElement, uDataType;

type
  TSS2Element = class(TElement)
  private
    FValueApplication: Integer;
    FStateDisplayStationary: E_StateDisplayStationery;
    FStateAlarmInhibited: E_StateInhibit;
    FValueElement: integer;
    FStateWireBreak: E_StateWireBreak;
    FHA, FHHA, FXHA : boolean;

    procedure SetValueApplication(const Value: Integer);
    procedure SetStateAlarmInhibited(const Value: E_StateInhibit);
    procedure SetStateDisplayStationary(const Value: E_StateDisplayStationery);
    procedure SetStateWireBreak(const Value: E_StateWireBreak);

  protected
    procedure AlarmEvaluation;override;
    procedure ValueSelection;override;
    procedure SetElementParameters;override;
    procedure SetStateElementDisabled(const Value: E_StateDisabled);override;

  public
    constructor Create; override;
    procedure AlarmElementStateCalc;override;

    { element input }
    property ValueApplication : Integer read FValueApplication write SetValueApplication;
    property StateAlarmInhibited : E_StateInhibit read FStateAlarmInhibited write SetStateAlarmInhibited;
    property StateDisplayStationary : E_StateDisplayStationery read FStateDisplayStationary write SetStateDisplayStationary;
    property StateWireBreak : E_StateWireBreak read FStateWireBreak write SetStateWireBreak;

    { element output }
    property ValueElement : integer read FValueElement;

  end;

implementation

{ TSS2Element }

procedure TSS2Element.AlarmElementStateCalc;
begin
  inherited;

  if FStateElementDisabled = sdDisabled then
  begin
    SetAlarm(saNoneDisable);
    SetElement(seDisabled);
  end;

  if (FStateElementDisabled = sdEnabled) then
  begin
    if (FStateWireBreak = swbWireBreak) then
    begin
      SetAlarm(saWireBreak);
      SetElement(seWireBreak);

    end
    else if (FStateWireBreak = swbNoWireBreak) then
    begin
      if FXHA then
      begin
        SetAlarm(saXHA);
        SetElement(seXHA);
      end
      else if FHHA and (not FXHA) then
      begin
        SetAlarm(saHHA);
        SetElement(seHHA);
      end
      else if (FStateAlarmInhibited = siInhibited) and FHA and (not FHHA) and (not FXHA) then
      begin
        SetAlarm(saInhibited);
        SetElement(seValueOK);
      end
      else if (FStateAlarmInhibited = siNotInhibited) and (not FHHA) and (not FXHA) then
      begin
        if FHA then
        begin
          SetAlarm(saHA);
          SetElement(seHA);
        end
        else if not FHA then
        begin
          SetAlarm(saNone);
          SetElement(seValueOK);
        end;
      end;
    end;
  end;
end;

procedure TSS2Element.AlarmEvaluation;
begin
  inherited;
end;

constructor TSS2Element.Create;
begin
  inherited;

  ELementType := eltSS2;
end;

procedure TSS2Element.SetElementParameters;
begin
  inherited;

  Parameters.AddParameter(epHAV,0);
  Parameters.AddParameter(epHHAV,0);
  Parameters.AddParameter(epXHAV,0);
  Parameters.AddParameter(epHY,0);
  Parameters.AddParameter(epTA,0);
  Parameters.AddParameter(epV20,0);
  Parameters.AddParameter(epV4,0);
  Parameters.AddParameter(epSTA,0);
end;

procedure TSS2Element.SetStateAlarmInhibited(const Value: E_StateInhibit);
begin
  FStateAlarmInhibited := Value;
  AlarmElementStateCalc;
end;

procedure TSS2Element.SetStateDisplayStationary(
  const Value: E_StateDisplayStationery);
begin
  FStateDisplayStationary := Value;
  AlarmElementStateCalc;
end;

procedure TSS2Element.SetStateElementDisabled(const Value: E_StateDisabled);
begin
  inherited;
  AlarmElementStateCalc;
end;

procedure TSS2Element.SetStateWireBreak(const Value: E_StateWireBreak);
begin
  FStateWireBreak := Value;
  AlarmElementStateCalc;
end;

procedure TSS2Element.SetValueApplication(const Value: Integer);
begin
  FValueApplication := Value;
  AlarmElementStateCalc;
end;

procedure TSS2Element.ValueSelection;
begin
  inherited;
end;

end.
