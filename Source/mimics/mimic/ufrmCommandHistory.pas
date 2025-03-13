unit ufrmCommandHistory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, DateUtils, ufrmMimics,
  ComCtrls, uDatabase, uDBSupportClasses, uMimicsSystem, Grids, DBGrids, DB,
  ZDataset;

type
  TfrmCommandHistory = class(TfrmMimics)
    pnlRightClick: TPanel;
    lblDateNext: TLabel;
    lblDatePrev: TLabel;
    lblTimeNext: TLabel;
    lblTimePrev: TLabel;
    DBGrid1: TDBGrid;
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pnlRightClickMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
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
    procedure PrintReport;

    property DTMin : TDateTime read FDTMin;
    property DTMax : TDateTime read FDTMax;

    property SelectClause : string read FSelectClause write SetSelectClause;
    property WhereClause : string read FWhereClause write SetWhereClause;
    property SpanClause : string read FSpanClause write SetSpanClause;
    property OrderByClause : string read FOrderByClause write SetOrderByClause;
  end;

var
  frmCommandHistory: TfrmCommandHistory;

const
  C_ReportDir = 'ReportDir';

implementation

uses
  ufrmConfDateTime, ufrmSelectSort, ufrmEdtFilter, ufrmSelectFieldView,
  ShellApi, IOUtils;

{$R *.dfm}

procedure TfrmCommandHistory.EditTime(aCommand: string);
var
  dt : TDateTime;
begin
  if aCommand = '24 h <' then
  begin
    dt := SysMimics.Mimic.ServerRunningTime;
    FDTMin := IncHour(dt, -24);
    FDTMax := dt;

    SpanClause := 'timestamp >= ' + QuotedStr(DateTimeToStr(FDTMin)) +
      ' AND timestamp <= ' + QuotedStr(DateTimeToStr(FDTMax));

    lblDatePrev.Caption := FormatDateTime('dd-mm-yyyy hh:nn:ss', FDTMin);
    lblDateNext.Caption := FormatDateTime('dd-mm-yyyy hh:nn:ss', FDTMax);
  end;
end;

procedure TfrmCommandHistory.ExecNewQuery;
var
  query : string;
begin
  with FQuery do
  begin
    if not Connection.Connected then
      Exit;

    SQL.Clear;

    query := 'SELECT ' + FSelectClause + ' FROM RS_COMMANDS';

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

procedure TfrmCommandHistory.FormCreate(Sender: TObject);
begin
  inherited;

  FQuery := TZQuery.Create(Self);
  FQuery.Connection := SysMimics.Database.Connection;

  FDataSource := TDataSource.Create(Self);
  FDataSource.DataSet := FQuery;

  DBGrid1.DataSource := FDataSource;

  FSelectClause := '*';
end;

procedure TfrmCommandHistory.FormResize(Sender: TObject);
begin
  inherited;

  pnlRightClick.Height := Round(0.02 * Height);
  pnlRightClick.Width := Width;
  pnlRightClick.Left := 0;
  pnlRightClick.Top := Round(0.047 * Height);

  DBGrid1.Height := Round(0.933 * Height);
end;

procedure TfrmCommandHistory.FormShow(Sender: TObject);
var
  dt : TDateTime;
begin
  inherited;

  SetCustomEvent;

  dt := SysMimics.Mimic.ServerRunningTime;
  FDTMin := IncHour(dt, -24);
  FDTMax := dt;

  SpanClause := 'timestamp >= ' + QuotedStr(DateTimeToStr(FDTMin)) +
    ' AND timestamp <= ' + QuotedStr(DateTimeToStr(FDTMax));

  lblDatePrev.Caption := FormatDateTime('dd-mm-yyyy hh:nn:ss', FDTMin);
  lblDateNext.Caption := FormatDateTime('dd-mm-yyyy hh:nn:ss', FDTMax);
end;

procedure TfrmCommandHistory.pnlRightClickMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  tempStr : string;
begin
  inherited;

  if Button = mbRight then
  begin
    PrintReport;

    tempStr := ExtractFilePath(Application.ExeName) + C_ReportDir +
      '\command_history_Report_.log';

    ShellExecute(Handle, 'Open', 'C:\Windows\notepad.exe', PChar(tempStr), nil,
      SW_SHOWNORMAL);
  end;
end;

procedure TfrmCommandHistory.PrintReport;
var
  logFile : TextFile;
  fileName: string;
  CommandData: TCommandsData;
  dt : TDateTime;
  i  : Integer;
  l  : TList;
begin
  dt := SysMimics.Mimic.ServerRunningTime;

  ForceDirectories(ExtractFilePath(Application.ExeName) + C_ReportDir);

  fileName := ExtractFilePath(Application.ExeName) + C_ReportDir +
    '\command_history_Report_.log';
  AssignFile(logFile, fileName);
  Rewrite(logFile);

  Writeln(logFile, '');
  Writeln(logFile, 'REPORT MADE BY   : TNI-001');
  Writeln(logFile, 'UTC DATE         : ' + FormatDateTime('d/m/yyyy', dt));
  Writeln(logFile, 'UTC TIME         : ' + FormatDateTime('h:nn:ss AM/PM', dt));
  Writeln(logFile, '');
  Writeln(logFile, '****************************************************************************************************************');
  Writeln(logFile, '*                                                                                                              *');
  Writeln(logFile, '*                                               COMMAND HISTORY REPORT                                         *');
  Writeln(logFile, '*                                  (template Version 1.0 / date 25 th Jan. 2007)                               *');
  Writeln(logFile, '*                                                                                                              *');
  Writeln(logFile, '*                                             Imtech Marine & Offshore                                         *');
  Writeln(logFile, '*                                                                                                              *');
  Writeln(logFile, '****************************************************************************************************************');
  Writeln(logFile, '');
  Writeln(logFile, '---------------------------------------------------------------------------------------------------------------|');

  SysMimics.Database.getRS_CommandHistory(SysMimics.Mimic.Running_ID, l);

  if l.Count > 0 then
  begin
    for i := 0 to l.Count - 1 do
    begin
      CommandData := l.Items[i];
      Writeln(logFile, '  UTC DATE      | '+DateToStr(CommandData.timestamp)+'');
      Writeln(logFile, '  UTC TIME      | '+TimeToStr(CommandData.timestamp)+'');
      Writeln(logFile, '  POINT ID      | '+CommandData.point_id+'');
      Writeln(logFile, '  COMMAND MSG   | '+CommandData._VAL+'');
      Writeln(logFile, '---------------------------------------------------------------------------------------------------------------|');
    end;
  end;

  CloseFile(logFile);
end;

procedure TfrmCommandHistory.SelectUpdate(aClause: string);
begin
  SelectClause := aClause;
end;

procedure TfrmCommandHistory.SetCustomEvent;
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

procedure TfrmCommandHistory.SetOrderByClause(aClause: string);
begin
  FOrderByClause := aClause;
  ExecNewQuery;
end;

procedure TfrmCommandHistory.SetSelectClause(aClause: string);
begin
  FSelectClause := aClause;
  ExecNewQuery;
end;

procedure TfrmCommandHistory.SetSpanClause(aClause: string);
begin
  FSpanClause := aClause;
  ExecNewQuery;
end;

procedure TfrmCommandHistory.SetWhereClause(aClause: string);
begin
  FWhereClause := aClause;
  ExecNewQuery;
end;

procedure TfrmCommandHistory.SortUpdate(aClause: string);
begin
  OrderByClause := aClause;
end;

procedure TfrmCommandHistory.SpanUpdate(aDTMin, aDTMax: TDateTime);
begin
  FDTMin := aDTMin;
  FDTMax := aDTMax;

  SpanClause := 'timestamp >= ' + QuotedStr(DateTimeToStr(FDTMin)) +
    ' AND timestamp <= ' + QuotedStr(DateTimeToStr(FDTMax));

  lblDatePrev.Caption := FormatDateTime('dd-mm-yyyy hh:nn:ss', FDTMin);
  lblDateNext.Caption := FormatDateTime('dd-mm-yyyy hh:nn:ss', FDTMax);
end;

procedure TfrmCommandHistory.WhereUpdate(aClause: string);
begin
  WhereClause := aClause;
end;

end.
