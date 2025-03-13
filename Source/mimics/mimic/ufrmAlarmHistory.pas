unit ufrmAlarmHistory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, jpeg, DateUtils, ufrmMimics,
  ComCtrls, uDatabase, uDBSupportClasses, uMimicsSystem, ufrmCAP, DB, ZDataset;

type
  TfrmAlarmHistory = class(TfrmMimics)
    pnlRightClick: TPanel;
    lblTimePrev: TLabel;
    lblDatePrev: TLabel;
    lblDateNext: TLabel;
    lblTimeNext: TLabel;
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure pnlRightClickMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    FDTMin : TDateTime;
    FDTMax : TDateTime;

    FDataSource : TDataSource;
    FQuery : TZQuery;

    FSelectClause : string;
    FWhereClause : string;
    FSpanClause : string;
    FOrderByClause : string;

    procedure SetSelectClause(aClause: string);
    procedure SetWhereClause(aClause: string);
    procedure SetSpanClause(aClause: string);
    procedure SetOrderByClause(aClause: string);

    procedure ExecNewQuery;

    procedure SelectUpdate(aClause: string);
    procedure SpanUpdate(aDTMin, aDTMax: TDateTime);
    procedure WhereUpdate(aClause: string);
    procedure SortUpdate(aClause: string);

    procedure SetCustomEvent;
  public
    procedure EditTime(aCommand: string);

    property DTMin : TDateTime read FDTMin;
    property DTMax : TDateTime read FDTMax;

    property SelectClause : string read FSelectClause write SetSelectClause;
    property WhereClause : string read FWhereClause write SetWhereClause;
    property SpanClause : string read FSpanClause write SetSpanClause;
    property OrderByClause : string read FOrderByClause write SetOrderByClause;
  end;

var
  frmAlarmHistory: TfrmAlarmHistory;

implementation

uses
  ufrmConfDateTime, ufrmSelectSort, ufrmEdtFilter, ufrmSelectFieldView;

{$R *.dfm}

{ TfrmAlarmHistory }

procedure TfrmAlarmHistory.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  grid : TDBGrid;
  i : Integer;
  finalState : string;
begin
  inherited;

  grid := TDBGrid(Sender);

  with grid.DataSource.DataSet do
  begin
    for i := 0 to FieldDefs.Count - 1 do
    begin
      if FieldDefs.Items[i].Name = 'final_state' then
      begin
        finalState := FieldByName('final_state').AsString;

        if finalState = 'G' then
        begin
          grid.Canvas.Brush.Color := clWhite;
          grid.Canvas.Font.Color := clBlack;
        end
        else if finalState = 'A' then
        begin
          grid.Canvas.Brush.Color := clSilver;
          grid.Canvas.Font.Color := clBlack;
        end
        else if finalState = 'R' then
        begin
          grid.Canvas.Brush.Color := clDkGray;
          grid.Canvas.Font.Color := clWhite;
        end
        else if finalState = 'D' then
        begin
          grid.Canvas.Brush.Color := clBlack;
          grid.Canvas.Font.Color := clWhite;
        end;

        Break;
      end;
    end;
  end;

  grid.DefaultDrawColumnCell(Rect, DataCol, Column, State) ;
end;

procedure TfrmAlarmHistory.EditTime(aCommand: string);
var
  dt : TDateTime;
begin
  if aCommand = '1 h <' then
  begin
    dt := SysMimics.Mimic.ServerRunningTime;
    FDTMin := IncHour(dt, -1);
    FDTMax := dt;

    SpanClause := 'timestamp >= ' + QuotedStr(DateTimeToStr(FDTMin)) +
      ' AND timestamp <= ' + QuotedStr(DateTimeToStr(FDTMax));

    lblDatePrev.Caption := FormatDateTime('dd-mm-yyyy hh:nn:ss', FDTMin);
    lblDateNext.Caption := FormatDateTime('dd-mm-yyyy hh:nn:ss', FDTMax);
  end;
end;

procedure TfrmAlarmHistory.ExecNewQuery;
var
  query : string;
begin
  with FQuery do
  begin
    if not Connection.Connected then
      Exit;

    SQL.Clear;

    query := 'SELECT ' + FSelectClause + ' FROM RS_ALARM_LOG';

    if FSpanClause <> '' then
      query := query + ' WHERE Running_ID = ' + IntToStr(SysMimics.Mimic.Running_ID)
                     + ' AND ' + FSpanClause ;

    if FWhereClause <> '' then
      query := query + ' AND ' + FWhereClause;

    if FOrderByClause <> '' then
      query := query + ' ORDER BY ' + FOrderByClause;

    SQL.Add(query);
    Open;
  end;
end;

procedure TfrmAlarmHistory.FormCreate(Sender: TObject);
begin
  inherited;

  FQuery := TZQuery.Create(Self);
  FQuery.Connection := SysMimics.Database.Connection;

  FDataSource := TDataSource.Create(Self);
  FDataSource.DataSet := FQuery;

  DBGrid1.DataSource := FDataSource;

  FSelectClause := '*';
end;

procedure TfrmAlarmHistory.FormResize(Sender: TObject);
begin
  inherited;

  pnlRightClick.Height := Round(0.02 * Height);
  pnlRightClick.Width := Width;
  pnlRightClick.Left := 0;
  pnlRightClick.Top := Round(0.047 * Height);

  DBGrid1.Height := Round(0.933 * Height);
end;

procedure TfrmAlarmHistory.FormShow(Sender: TObject);
var
  dt : TDateTime;
begin
  inherited;

  SetCustomEvent;

  dt := SysMimics.Mimic.ServerRunningTime;
  FDTMin := IncHour(dt, -1);
  FDTMax := dt;

  SpanClause := 'timestamp >= ' + QuotedStr(DateTimeToStr(FDTMin)) +
    ' AND timestamp <= ' + QuotedStr(DateTimeToStr(FDTMax));

  lblDatePrev.Caption := FormatDateTime('dd-mm-yyyy hh:nn:ss', FDTMin);
  lblDateNext.Caption := FormatDateTime('dd-mm-yyyy hh:nn:ss', FDTMax);
end;

procedure TfrmAlarmHistory.pnlRightClickMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;

  if Button = mbRight then
  begin
    //show pop-up (refresh, export, print) -> enable, select fields, select filters, select sorting
  end;
end;

procedure TfrmAlarmHistory.SelectUpdate(aClause: string);
begin
  SelectClause := aClause;
end;

procedure TfrmAlarmHistory.SetCustomEvent;
begin
  if Assigned(frmSelectFieldView) then
    frmSelectFieldView.OnSelectChange := SelectUpdate;

  if Assigned(frmConfDateTime) then
    frmConfDateTime.OnSpanChange := SpanUpdate;

  if Assigned(frmEdtFilter) then
    frmEdtFilter.OnWhereChange := WhereUpdate;

  if Assigned(frmSelectSort) then
    frmSelectSort.OnSortChange := SortUpdate;
end;

procedure TfrmAlarmHistory.SetOrderByClause(aClause: string);
begin
  FOrderByClause := aClause;
  ExecNewQuery;
end;

procedure TfrmAlarmHistory.SetSelectClause(aClause: string);
begin
  FSelectClause := aClause;
  ExecNewQuery;
end;

procedure TfrmAlarmHistory.SetSpanClause(aClause: string);
begin
  FSpanClause := aClause;
  ExecNewQuery;
end;

procedure TfrmAlarmHistory.SetWhereClause(aClause: string);
begin
  FWhereClause := aClause;
  ExecNewQuery;
end;

procedure TfrmAlarmHistory.SortUpdate(aClause: string);
begin
  OrderByClause := aClause;
end;

procedure TfrmAlarmHistory.SpanUpdate(aDTMin, aDTMax: TDateTime);
begin
  FDTMin := aDTMin;
  FDTMax := aDTMax;

  SpanClause := 'timestamp >= ' + QuotedStr(DateTimeToStr(FDTMin)) +
    ' AND timestamp <= ' + QuotedStr(DateTimeToStr(FDTMax));

  lblDatePrev.Caption := FormatDateTime('dd-mm-yyyy hh:nn:ss', FDTMin);
  lblDateNext.Caption := FormatDateTime('dd-mm-yyyy hh:nn:ss', FDTMax);
end;

procedure TfrmAlarmHistory.WhereUpdate(aClause: string);
begin
  WhereClause := aClause;
end;

end.
