unit uTrendDataSeries;

interface

uses
  Classes, uTrendData, uTrendChart;

type

  TTrendDataSeries = class(TComponent)
  private
    FData : TList;
    FChart: TTrendChart;
    procedure SetChart(const Value: TTrendChart);

  public
    constructor Create(AOwner: TComponent);override;
    destructor Destroy;override;
    procedure AddData(aData : TTrendData);
  published
    property Chart : TTrendChart read FChart write SetChart;

  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('IPMS', [TTrendDataSeries]);
end;

{ TTrendDataSeries }


procedure TTrendDataSeries.AddData(aData: TTrendData);
begin
  FData.Add(aData);
end;

constructor TTrendDataSeries.Create;
begin
  inherited;
  FData := TList.Create;
end;

destructor TTrendDataSeries.Destroy;
begin
  FData.Free;
  inherited;
end;

procedure TTrendDataSeries.SetChart(const Value: TTrendChart);
begin
  FChart := Value;
end;

end.
