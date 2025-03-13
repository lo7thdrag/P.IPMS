unit ufrmLineAttribute;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uTrendDataType;

type
  TfrmLineAttribute = class(TForm)
  private
    FInLegend: boolean;
    FLineColor: TCOlor;
    FLineID: String;
    FLineVisible: boolean;
    FLineType: E_LinesType;
    FLineData: TObject;
    procedure SetInLegend(const Value: boolean);
    procedure SetLineColor(const Value: TCOlor);
    procedure SetLineID(const Value: String);
    procedure SetLineType(const Value: E_LinesType);
    procedure SetLineVisible(const Value: boolean);
    procedure SetLineData(const Value: TObject);
    { Private declarations }
  public
    { Public declarations }
    property LineColor : TCOlor read FLineColor write SetLineColor;
    property LineID : String read FLineID write SetLineID;
    property InLegend : boolean read FInLegend write SetInLegend;
    property LineVisible : boolean read FLineVisible write SetLineVisible;
    property LineType : E_LinesType read FLineType write SetLineType;
    property LineData : TObject read FLineData write SetLineData;
  end;

var
  frmLineAttribute: TfrmLineAttribute;

implementation

{$R *.dfm}

{ TfrmLineAttribute }

procedure TfrmLineAttribute.SetInLegend(const Value: boolean);
begin
  FInLegend := Value;
end;

procedure TfrmLineAttribute.SetLineColor(const Value: TCOlor);
begin
  FLineColor := Value;
end;

procedure TfrmLineAttribute.SetLineData(const Value: TObject);
begin
  FLineData := Value;
end;

procedure TfrmLineAttribute.SetLineID(const Value: String);
begin
  FLineID := Value;
end;

procedure TfrmLineAttribute.SetLineType(const Value: E_LinesType);
begin
  FLineType := Value;
end;

procedure TfrmLineAttribute.SetLineVisible(const Value: boolean);
begin
  FLineVisible := Value;
end;

end.
