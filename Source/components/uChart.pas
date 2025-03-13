unit uChart;

interface

uses
  Classes, Controls, ExtCtrls, Graphics, uIPMS_Data;

type

  TData = class(TPersistent)
  private
    FLevel : Double;
    FContent : Double;

    procedure SetLevel(aValue: Double);
    procedure SetContent(aValue: Double);
  published
    property Level : Double read FLevel write SetLevel;
    property Content : Double read FContent write SetContent;
  end;

  TDataset = class(TPersistent)
  private
    FData1 : TData;
    FData2 : TData;
    FData3 : TData;
    FData4 : TData;
    FData5 : TData;
    FData6 : TData;
    FData7 : TData;
    FData8 : TData;
    FData9 : TData;
    FData10 : TData;
    FData11 : TData;
    FData12 : TData;
    FData13 : TData;
    FData14 : TData;
    FData15 : TData;
    FData16 : TData;

    procedure SetData1(aData: TData);
    procedure SetData2(aData: TData);
    procedure SetData3(aData: TData);
    procedure SetData4(aData: TData);
    procedure SetData5(aData: TData);
    procedure SetData6(aData: TData);
    procedure SetData7(aData: TData);
    procedure SetData8(aData: TData);
    procedure SetData9(aData: TData);
    procedure SetData10(aData: TData);
    procedure SetData11(aData: TData);
    procedure SetData12(aData: TData);
    procedure SetData13(aData: TData);
    procedure SetData14(aData: TData);
    procedure SetData15(aData: TData);
    procedure SetData16(aData: TData);
  public
    constructor Create;
  published
    property Data1 : TData read FData1 write SetData1;
    property Data2 : TData read FData2 write SetData2;
    property Data3 : TData read FData3 write SetData3;
    property Data4 : TData read FData4 write SetData4;
    property Data5 : TData read FData5 write SetData5;
    property Data6 : TData read FData6 write SetData6;
    property Data7 : TData read FData7 write SetData7;
    property Data8 : TData read FData8 write SetData8;
    property Data9 : TData read FData9 write SetData9;
    property Data10 : TData read FData10 write SetData10;
    property Data11 : TData read FData11 write SetData11;
    property Data12 : TData read FData12 write SetData12;
    property Data13 : TData read FData13 write SetData13;
    property Data14 : TData read FData14 write SetData14;
    property Data15 : TData read FData15 write SetData15;
    property Data16 : TData read FData16 write SetData16;
  end;

  TIPMSChart = class(TGraphicControl)
  private
    FDataset : TDataset;

    procedure SetDataset(aDataset: TDataset);
  protected
    procedure Paint; override;
  public
    constructor Create(aOwner: TComponent); override;
  published
    property Dataset : TDataset read FDataset write SetDataset;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('IPMS', [TIPMSChart]);
end;

{ TChart }

constructor TIPMSChart.Create(aOwner: TComponent);
begin
  inherited;

  if (csDesigning in ComponentState) and
     not (csLoading in ComponentState) then
  begin
    Height := 350;
    Width := 530;
  end;

  Margins.SetBounds(50, 5, 5, 50);

  FDataset := TDataset.Create;
end;

procedure TIPMSChart.Paint;
var
  i, GLSpace_X, GLSpace_Y, GLMax_X, GLMax_Y : Integer;
begin
  inherited;

  with Canvas do
  begin
    { background }
    Brush.Color := TPanel(Parent).Color;
    Pen.Color := TPanel(Parent).Color;
    Rectangle(0, 0, Width, Height);

    { gridline }
    Brush.Style := bsClear;
    Pen.Color := colDarkGrey;
    Pen.Style := psDot;
    Pen.Width := 1;

    GLMax_X := 5;
    GLMax_Y := 10;

    GLSpace_X := (Height - Margins.Bottom - Margins.Top) div (GLMax_X + 1);
    GLSpace_Y := (Width - Margins.Left - Margins.Right) div (GLMax_Y + 1);

    for i := 0 to 10 - 1 do
    begin
      { x }
      if i < 5 then
      begin
        MoveTo(Margins.Left, Height - Margins.Bottom - (GLSpace_X * (i + 1)));
        LineTo(Width - Margins.Right, Height - Margins.Bottom - (GLSpace_X * (i + 1)));
      end;

      { y }
      MoveTo(Margins.Left + (GLSpace_Y * (i + 1)), Height - Margins.Bottom);
      LineTo(Margins.Left + (GLSpace_Y * (i + 1)), Margins.Top);
    end;

    { X-Axis & Y-Axis }
    Pen.Color := clBlack;
    Pen.Style := psSolid;
    Pen.Width := 2;

    MoveTo(Margins.Left, Height - Margins.Bottom);
    LineTo(Width - Margins.Right, Height - Margins.Bottom);

    MoveTo(Margins.Left, Height - Margins.Bottom);
    LineTo(Margins.Left, Margins.Top);
  end;
end;

procedure TIPMSChart.SetDataset(aDataset: TDataset);
begin
  FDataset := aDataset;
end;

{ TData }

procedure TData.SetContent(aValue: Double);
begin
  FContent := aValue;
end;

procedure TData.SetLevel(aValue: Double);
begin
  FLevel := aValue;
end;

{ TDataset }

constructor TDataset.Create;
begin
  FData1 := TData.Create;
  FData2 := TData.Create;
  FData3 := TData.Create;
  FData4 := TData.Create;
  FData5 := TData.Create;
  FData6 := TData.Create;
  FData7 := TData.Create;
  FData8 := TData.Create;
  FData9 := TData.Create;
  FData10 := TData.Create;
  FData11 := TData.Create;
  FData12 := TData.Create;
  FData13 := TData.Create;
  FData14 := TData.Create;
  FData15 := TData.Create;
  FData16 := TData.Create;
end;

procedure TDataset.SetData1(aData: TData);
begin
  FData1 := aData;
end;

procedure TDataset.SetData10(aData: TData);
begin
  FData10 := aData;
end;

procedure TDataset.SetData11(aData: TData);
begin
  FData11 := aData;
end;

procedure TDataset.SetData12(aData: TData);
begin
  FData12 := aData;
end;

procedure TDataset.SetData13(aData: TData);
begin
  FData13 := aData;
end;

procedure TDataset.SetData14(aData: TData);
begin
  FData14 := aData;
end;

procedure TDataset.SetData15(aData: TData);
begin
  FData15 := aData;
end;

procedure TDataset.SetData16(aData: TData);
begin
  FData16 := aData;
end;

procedure TDataset.SetData2(aData: TData);
begin
  FData2 := aData;
end;

procedure TDataset.SetData3(aData: TData);
begin
  FData3 := aData;
end;

procedure TDataset.SetData4(aData: TData);
begin
  FData4 := aData;
end;

procedure TDataset.SetData5(aData: TData);
begin
  FData5 := aData;
end;

procedure TDataset.SetData6(aData: TData);
begin
  FData6 := aData;
end;

procedure TDataset.SetData7(aData: TData);
begin
  FData7 := aData;
end;

procedure TDataset.SetData8(aData: TData);
begin
  FData8 := aData;
end;

procedure TDataset.SetData9(aData: TData);
begin
  FData9 := aData;
end;

end.
