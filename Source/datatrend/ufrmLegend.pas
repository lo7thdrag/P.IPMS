unit ufrmLegend;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, RzSpnEdt, RzLstBox, RzChkLst, ImgList,
  ComCtrls, ToolWin, uTrendChart;

type
  TfrmLegend = class(TForm)
    chkShowLegend: TCheckBox;
    chkShowLegendTitle: TCheckBox;
    lbl1: TLabel;
    cbbDisplayFormat: TComboBox;
    lbl2: TLabel;
    rzedtDisplayHeight: TRzSpinEdit;
    rzlstLineAttr: TRzCheckList;
    lbl3: TLabel;
    chkShowStatusLine: TCheckBox;
    grp1: TGroupBox;
    chkCurrDate: TCheckBox;
    chkCurrTime: TCheckBox;
    chkSliderDate: TCheckBox;
    chkSliderTime: TCheckBox;
    chk2ndSliderDate: TCheckBox;
    chk2ndSliderTime: TCheckBox;
    chkSliderDelta: TCheckBox;
    chkStatusTitle: TCheckBox;
    tlb1: TToolBar;
    btnNew: TToolButton;
    btnCopy: TToolButton;
    il1: TImageList;
    btnFonts: TButton;
    procedure btnNewClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
  private
    { Private declarations }
    FChart : TTrendChart;
  public
    { Public declarations }
    procedure SetChart(aChart : TTrendChart);
    procedure Apply;
  end;

var
  frmLegend: TfrmLegend;

implementation

{$R *.dfm}

uses uLegendAttribute, uTrendDataType;

{ TfrmLegend }

procedure TfrmLegend.Apply;
  function GetTitle(value : String) : String;
  var
    i : Integer;
    found : Boolean;
  begin
    found := False;
    for i := 0 to Length(C_LINE_ATTR) - 1 do
    begin
      if value = C_LINE_ATTR[i] then
      begin
        found := True;
        Break;
      end;
    end;

    if found then
      result := C_LINE_TITILE[i];

  end;
var
  i : Integer;
  item : TLegendLineAttr;
begin
  with FChart.Legend do
  begin
    ShowLegend := chkShowLegend.Checked;
    ShowLegendTitle := chkShowLegendTitle.Checked;
    ShowStatusLine := chkShowStatusLine.Checked;

    CurrentDate := chkCurrDate.Checked;
    currentTime := chkCurrTime.Checked;
    SliderDate := chkSliderDate.Checked;
    SliderTime := chkSliderTime.Checked;
    SliderDate2nd := chk2ndSliderDate.Checked;
    SliderTime2nd := chk2ndSliderTime.Checked;
    SliderTimeDelta := chkSliderDelta.Checked;
    StatusTitle := chkStatusTitle.Checked;

    DisplayHeight := StrToInt(rzedtDisplayHeight.Text);

    ClearLegend;

    for i := 0 to rzlstLineAttr.Count - 1 do
    begin
      item := TLegendLineAttr.Create;
      item.LegendItemID := rzlstLineAttr.Items[i];
      item.LegendItemName := rzlstLineAttr.Items[i];

      if item.LegendItemName = 'Y axis limits' then
      begin
        item.LegendItemNameTitle := 'Lower Limit';
        item.LegendItemNameTitle2 := 'Upper Limit';
      end else
        item.LegendItemNameTitle := GetTitle(item.LegendItemName);

      item.LegendItemVisible := rzlstLineAttr.ItemChecked[i];

      AddLegend(item);
    end;
  end;
end;

procedure TfrmLegend.btnCopyClick(Sender: TObject);
var
  item : String;
  chk : boolean;
  selIdx : integer;
begin

  selIdx := rzlstLineAttr.ItemIndex;

  if selIdx < rzlstLineAttr.Count - 1 then
  begin
    item := rzlstLineAttr.Items[selIdx];
    chk := rzlstLineAttr.ItemChecked[selIdx];

    rzlstLineAttr.Delete(selIdx);
    rzlstLineAttr.Insert(selIdx + 1,item);
    rzlstLineAttr.ItemChecked[selIdx + 1] := chk;
    rzlstLineAttr.ItemIndex := selIdx + 1;
  end;
end;

procedure TfrmLegend.btnNewClick(Sender: TObject);
var
  item : String;
  chk : boolean;
  selIdx : integer;
begin

  selIdx := rzlstLineAttr.ItemIndex;

  if selIdx > 0 then
  begin
    item := rzlstLineAttr.Items[selIdx];
    chk := rzlstLineAttr.ItemChecked[selIdx];

    rzlstLineAttr.Delete(selIdx);
    rzlstLineAttr.Insert(selIdx - 1,item);
    rzlstLineAttr.ItemChecked[selIdx - 1] := chk;
    rzlstLineAttr.ItemIndex := selIdx - 1;
  end;

end;

procedure TfrmLegend.SetChart(aChart: TTrendChart);
var
  i : Integer;
  item : TLegendLineAttr;
begin
  FChart := aChart;

  rzlstLineAttr.Clear;
  for i := 0 to FChart.Legend.LegendCount - 1 do
  begin
    item := FChart.Legend.GetLegendItem(i);

    rzlstLineAttr.Items.Add(item.LegendItemName);
    rzlstLineAttr.ItemChecked[i] := item.LegendItemVisible;
  end;

  with FChart.Legend do
  begin
    chkShowLegend.Checked := ShowLegend;
    chkShowLegendTitle.Checked := ShowLegendTitle;
    chkShowStatusLine.Checked := ShowStatusLine;

    chkCurrDate.Checked := CurrentDate;
    chkCurrTime.Checked := currentTime;
    chkSliderDate.Checked := SliderDate;
    chkSliderTime.Checked := SliderTime;
    chk2ndSliderDate.Checked := SliderDate2nd;
    chk2ndSliderTime.Checked := SliderTime2nd;
    chkSliderDelta.Checked := SliderTimeDelta;
    chkStatusTitle.Checked := StatusTitle;

    rzedtDisplayHeight.Text := IntToStr(DisplayHeight);
  end;
end;

end.
