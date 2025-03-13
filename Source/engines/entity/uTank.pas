unit uTank;

{*------------------------------------------------------------------------------

  General Tank class definition. Use to store fuel, oil, water, etc.
  Unit : m3 (cubic meter)


  @author  ryu
  @version 2013/09/13 1.0 Initial revision.
  @todo
  @comment
-------------------------------------------------------------------------------}

interface

uses
  Classes, uDatabase, uEntity, uSteppers;

type

  TTank = class(TEntity)
  private
    FElementID : string;
    FTankTable : TList;

    FCurrentContent : Double;
    FCurrentLevel : Double;
    FFilling : Boolean; //content increase
    FTransferring : Boolean; //content decrease
    FFillPerSec : Double;
    FTransferPerSec : Double;
    FValueSensor : Double;

    FDelayer : TDelayer;

    function GetMaxContent: Double;

    procedure SetElementID(const aElementID: string);
    procedure SetCurrentContent(const aContent: Double);
    procedure SetCurrentLevel(const aContent: Double);
    procedure SetFill(const aIsFilling: Boolean);
    procedure SetTransfer(const aIsTransfer: Boolean);
    procedure SetFillPerSec(const aValue: Double);
    procedure SetTransferPerSec(const aValue: Double);
    procedure SetValueSensor(const aValue: Double);

    function Interpolation(const aX, aX1, aY1, aX2, aY2: Double): Double;
    procedure OnDelayedRun(Sender : TObject);
  public
    constructor Create(const aElementID: string; const aDB: TIPMSDatabase);
    destructor Destroy; override;

    procedure Run(const aDt: Double); override;
    procedure RPMChange(aRPM: Double);

    property ElementID : string read FElementID write SetElementID;
    property Content : Double read FCurrentContent write SetCurrentContent;
    property Filling : Boolean read FFilling write SetFill;
    property Transferring : Boolean read FTransferring write SetTransfer;
    property FillPerSec : Double read FFillPerSec write SetFillPerSec;
    property TransferPerSec : Double read FTransferPerSec write SetTransferPerSec;
    property ValueSensor : Double read FValueSensor write SetValueSensor;
  end;

const
  C_RPM : array[0..13] of Double = (400, 450, 500, 550, 600, 650, 700, 750, 800,
    850, 900, 950, 1000, 1050);
  C_TransferRate : array[0..13] of Double = (0.225, 0.313, 0.409, 0.515,
    0.639, 0.784, 0.96, 1.2, 1.498, 1.875, 2.305, 2.772, 3.259, 3.5);

implementation

uses
  uDataType, uDBSupportClasses, SysUtils, uERSystem;

{ TTank }

constructor TTank.Create(const aElementID: string; const aDB: TIPMSDatabase);
begin
  inherited Create;

  FElementID := aElementID;
  aDB.GetTankTableByElementID(FElementID, FTankTable);
  FFillPerSec := 36 / 3600;
  FTransferPerSec := 0;
  FCurrentContent := 3;

  FValueSensor := Random(21);

  FDelayer := TDelayer.Create;
  FDelayer.DInterval := 1; // sec
  FDelayer.OnTime := OnDelayedRun;
  FDelayer.Enabled := True;

end;

destructor TTank.Destroy;
begin

  inherited;
end;

function TTank.GetMaxContent: Double;
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

function TTank.Interpolation(const aX, aX1, aY1, aX2, aY2: Double): Double;
begin
  Result := ((aX - aX1) * (aY2 - aY1) / (aX2 - aX1)) + aY1;
end;

procedure TTank.OnDelayedRun(Sender: TObject);
begin
  Listener.TriggerEvents(Self, epTankLevel, FCurrentLevel);
end;

procedure TTank.RPMChange(aRPM: Double);
var
  i : Integer;
begin
  for i := 0 to Length(C_RPM) - 1 do
  begin
    if aRPM = C_RPM[i] then
    begin
      FTransferPerSec := C_TransferRate[i] / 3600;
      Break;
    end
    else if (aRPM < C_RPM[i]) and (aRPM > 400) then
    begin
      FTransferPerSec := Interpolation(aRPM, C_RPM[i-1], C_TransferRate[i-1],
        C_RPM[i], C_TransferRate[i]) / 3600;

      Break;
    end;
  end;
end;

procedure TTank.Run(const aDt: Double);
begin
  inherited;

  if FFilling then
    SetCurrentContent(FCurrentContent + aDt * FFillPerSec);

  if FTransferring then
    SetCurrentContent(FCurrentContent - aDt * FTransferPerSec);

  FDelayer.Run(aDt);
end;

procedure TTank.SetCurrentContent(const aContent: Double);
begin
  if aContent > GetMaxContent then
    FCurrentContent := GetMaxContent
  else if aContent < 0 then
    FCurrentContent := 0
  else
    FCurrentContent := aContent;

  SetCurrentLevel(FCurrentContent);
end;

procedure TTank.SetCurrentLevel(const aContent: Double);
var
  i : Integer;
  content : Double;
  tankData1, tankData2 : TTank_Data;
begin
  tankData1 := nil;

  //FSoundLength = level | FTrim0m = content
  for i := 0 to FTankTable.Count - 1 do
  begin
    tankData2 := FTankTable.Items[i];
    content := StrToFloat(tankData2.FTrim0m);

    if aContent = content then
    begin
      FCurrentLevel := StrToFloat(tankData2.FSoundLength);

      //Listener.TriggerEvents(Self, epTankLevel, FCurrentLevel);
      Break;
    end
    else if aContent < content then
    begin
      if Assigned(tankData1) then
        FCurrentLevel := Interpolation(aContent,
          StrToFloat(tankData1.FTrim0m), StrToFloat(tankData1.FSoundLength),
          StrToFloat(tankData2.FTrim0m), StrToFloat(tankData2.FSoundLength));

      //Listener.TriggerEvents(Self, epTankLevel, FCurrentLevel);
      Break;
    end;

    tankData1 := tankData2;
  end;
end;

procedure TTank.SetElementID(const aElementID: string);
begin
  FElementID := aElementID;
end;

procedure TTank.SetFill(const aIsFilling: Boolean);
begin
  FFilling := aIsFilling;
end;

procedure TTank.SetFillPerSec(const aValue: Double);
begin
  FFillPerSec := aValue;
end;

procedure TTank.SetTransfer(const aIsTransfer: Boolean);
begin
  FTransferring := aIsTransfer;
end;

procedure TTank.SetTransferPerSec(const aValue: Double);
begin
  FTransferPerSec := aValue;
end;

procedure TTank.SetValueSensor(const aValue: Double);
begin
  FValueSensor := aValue;

  Listener.TriggerEvents(Self, epTankValueSensor, FValueSensor);
end;

end.
