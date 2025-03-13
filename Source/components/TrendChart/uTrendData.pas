unit uTrendData;

interface

uses Classes, Graphics;

type

  TItemData = class
  private
    FTimestamp: TDateTime;
    FValue: Double;
    procedure SetTimestamp(const Value: TDateTime);
    procedure SetValue(const Value: Double);
  public
    constructor Create(Value : Double; Date : TDateTime);
    property Value : Double read FValue write SetValue;
    property Timestamp : TDateTime read FTimestamp write SetTimestamp;
  end;

  TTrendData = class
  private
    FTitle: String;
    FUpperLimit: double;
    FLineID: String;
    FDescription: String;
    FLowerLimit: double;
    FUnits: String;

    FPairData : TList;
    FColor: TColor;

    procedure SetTitle(const Value: String);
    procedure SetDescription(const Value: String);
    procedure SetLineID(const Value: String);
    procedure SetLowerLimit(const Value: double);
    procedure SetUnits(const Value: String);
    procedure SetUpperLimit(const Value: double);
    procedure SetColor(const Value: TColor);
  public
    constructor Create;
    destructor Destroy;override;

    procedure AddItem(aItem : TItemData);

    property Title : String read FTitle write SetTitle ;
    property LowerLimit : double read FLowerLimit write SetLowerLimit;
    property UpperLimit : double read FUpperLimit write SetUpperLimit;
    property LineID : String read FLineID write SetLineID;
    property Units : String read FUnits write SetUnits;
    property Description : String read FDescription write SetDescription;
    property Color : TColor read FColor write SetColor;

  end;

implementation

{ TTrendData }

procedure TTrendData.AddItem(aItem: TItemData);
begin

  { asumsi data terurut tanggal }
  FPairData.Add(aItem)

end;

constructor TTrendData.Create;
begin
  FPairData := TList.Create;
  FTitle := 'Untitled';
end;

destructor TTrendData.Destroy;
begin
  FPairData.Free;
  inherited;
end;

procedure TTrendData.SetColor(const Value: TColor);
begin
  FColor := Value;
end;

procedure TTrendData.SetDescription(const Value: String);
begin
  FDescription := Value;
end;

procedure TTrendData.SetLineID(const Value: String);
begin
  FLineID := Value;
end;

procedure TTrendData.SetLowerLimit(const Value: double);
begin
  FLowerLimit := Value;
end;

procedure TTrendData.SetTitle(const Value: String);
begin
  FTitle := Value;
end;

procedure TTrendData.SetUnits(const Value: String);
begin
  FUnits := Value;
end;

procedure TTrendData.SetUpperLimit(const Value: double);
begin
  FUpperLimit := Value;
end;

{ TItemData }

constructor TItemData.Create(Value: Double; Date: TDateTime);
begin
  FValue := Value;
  FTimestamp := Date;
end;

procedure TItemData.SetTimestamp(const Value: TDateTime);
begin
  FTimestamp := Value;
end;

procedure TItemData.SetValue(const Value: Double);
begin
  FValue := Value;
end;

end.
