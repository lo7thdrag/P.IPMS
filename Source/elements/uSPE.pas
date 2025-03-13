{*------------------------------------------------------------------------------
  Setpoint Element (SPE)

  The setpoint element supports numerical input from remote. By using this
  element a remote operator is able to readjust setpoint values regarding a
  certain process.

  @author  DID
  @version 2013/07/16 1.0 Initial revision.
  @todo
  @comment
-------------------------------------------------------------------------------}

unit uSPE;

interface
uses uElement, uDataType;

type
  TSPEElement = class(TElement)
  private
    FCommandEnableDisable: E_StateDisabled;
    FHMISetPoint: Integer;
    FActualPoint: Integer;
    FSensorValue : Double;

    procedure SetCommandEnableDisable(const aVal: E_StateDisabled);
    procedure SetHMISetPoint(const aVal: Integer);
    procedure SetSensorValue(aVal: Double);

  protected
    procedure EnableDisabledElement;override;
    procedure StorageSetPoint;override;

  public
    constructor Create; override;
    procedure AlarmElementStateCalc; override;

    property SensorValue : Double read FSensorValue write SetSensorValue;

    { element input }
    property CommandEnableDisable: E_StateDisabled  read FCommandEnableDisable
      write SetCommandEnableDisable;
    property HMISetPoint         : Integer read FHMISetPoint
      write SetHMISetPoint;

    { element output }
    property ActualPoint         : Integer read FActualPoint;
  end;

implementation

{ TSPEElement }

procedure TSPEElement.EnableDisabledElement;
begin
  if CommandEnableDisable = sdDisabled then
  begin
    SetElement(seDisabled);
  end
  else if CommandEnableDisable = sdEnabled then
  begin
    SetElement(seEnabled);
  end;
end;

procedure TSPEElement.SetCommandEnableDisable(const aVal: E_StateDisabled);
begin
  FCommandEnableDisable := aVal;
end;

procedure TSPEElement.SetHMISetPoint(const aVal: Integer);
begin
  FHMISetPoint := aVal;
end;

procedure TSPEElement.StorageSetPoint;
begin
  if StateElement = seDisabled then
    FActualPoint := 0
  else
    FActualPoint := HMISetPoint;

end;

procedure TSPEElement.AlarmElementStateCalc;
begin
  inherited;

end;

constructor TSPEElement.Create;
begin
  inherited;

  ElementType := eltSPE;
  SensorValue := 0;
end;

procedure TSPEElement.SetSensorValue(aVal: Double);
begin
  FSensorValue := aVal;
end;

end.
