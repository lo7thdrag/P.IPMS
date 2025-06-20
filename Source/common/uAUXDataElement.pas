unit uAUXDataElement;

interface

uses uDataType, SysUtils, StrUtils;

type
  TSearchAUXElementID = class
  private
  public
    constructor Create; overload;
    destructor Destroy; override;

    function getMCEElementID(PumpID: string; var value: string; konstanta: Integer): Boolean;

  end;

var
  SearchAUXElementID : TSearchAUXElementID;

implementation

{ TSearchPMSElementID }

constructor TSearchAUXElementID.Create;
begin
  inherited;
end;

destructor TSearchAUXElementID.Destroy;
begin
//
end;

function TSearchAUXElementID.getMCEElementID(PumpID: string; var value: string; konstanta: Integer): Boolean;
begin
  Result := True;
  if PumpID = 'BALLAST PUMP' then
  begin
    value := '5292A0001A';
  end
  else if PumpID = 'SW PUMP PROV REFRIG UNIT 1' then
  begin
    value := '5210A0008A';
  end
  else if PumpID = 'COOLING PUMP CHILLER 1' then
  begin
    value := '5210A0001A';
  end
  else if PumpID = 'FIFI PUMP 2' then
  begin
    value := '5551A0002A';
  end
  else if PumpID = 'SW PUMP PROV REFRIG UNIT 2' then
  begin
    value := '5210A0003A';
  end
  else if PumpID = 'SLUDGE DIRTY OIL PUMP' then
  begin
    value := '5932A0004A';
  end;
end;

end.
