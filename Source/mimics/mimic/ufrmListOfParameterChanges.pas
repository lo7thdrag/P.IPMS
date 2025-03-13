unit ufrmListOfParameterChanges;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMimics, ExtCtrls, jpeg, StdCtrls, DateUtils,
  ComCtrls, uDatabase, uDBSupportClasses, uMimicsSystem, Grids, DBGrids, DB,
  ZDataset;

type
  TfrmListOfParameterChanges = class(TfrmMimics)
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

    FSpanClause : string;

    procedure SetSpanClause(aClause: string);

    procedure ExecNewQuery;

    procedure SpanUpdate(aDTMin, aDTMax: TDateTime);

    procedure SetCustomEvent;
  public
    procedure EditTime(aCommand: string);
    procedure PrintReport;

    property DTMin : TDateTime read FDTMin;
    property DTMax : TDateTime read FDTMax;

    property SpanClause : string read FSpanClause write SetSpanClause;
  end;

var
  frmListOfParameterChanges: TfrmListOfParameterChanges;

const
  C_ReportDir = 'ReportDir';

implementation

uses
  ufrmConfDateTime, ShellApi, IOUtils;

{$R *.dfm}

procedure TfrmListOfParameterChanges.EditTime(aCommand: string);
var
  dt : TDateTime;
begin
  if aCommand = '30 days <' then
  begin
    dt := SysMimics.Mimic.ServerRunningTime;
    FDTMin := IncDay(dt, -30);
    FDTMax := dt;

    SpanClause := 'timestamp >= ' + QuotedStr(DateTimeToStr(FDTMin)) +
      ' AND timestamp <= ' + QuotedStr(DateTimeToStr(FDTMax));

    lblDatePrev.Caption := FormatDateTime('dd-mm-yyyy hh:nn:ss', FDTMin);
    lblDateNext.Caption := FormatDateTime('dd-mm-yyyy hh:nn:ss', FDTMax);
  end;
end;

procedure TfrmListOfParameterChanges.ExecNewQuery;
var
  query : string;
begin
  with FQuery do
  begin
    if not Connection.Connected then
      Exit;

    SQL.Clear;

    query := 'SELECT timestamp, point_id, _ENG, _PREV, _VAL FROM RS_PARAMETERS';

    if FSpanClause <> '' then
      query := query + ' WHERE Running_ID = ' + IntToStr(SysMimics.Mimic.Running_ID)
                     + ' AND ' + FSpanClause ;

    SQL.Add(query);
    Open;
  end;
end;

procedure TfrmListOfParameterChanges.FormCreate(Sender: TObject);
begin
  inherited;

  FQuery := TZQuery.Create(Self);
  FQuery.Connection := SysMimics.Database.Connection;

  FDataSource := TDataSource.Create(Self);
  FDataSource.DataSet := FQuery;

  DBGrid1.DataSource := FDataSource;
end;

procedure TfrmListOfParameterChanges.FormResize(Sender: TObject);
begin
  inherited;

  pnlRightClick.Height := Round(0.02 * Height);
  pnlRightClick.Width := Width;
  pnlRightClick.Left := 0;
  pnlRightClick.Top := Round(0.047 * Height);

  DBGrid1.Height := Round(0.933 * Height);
end;

procedure TfrmListOfParameterChanges.FormShow(Sender: TObject);
var
  dt : TDateTime;
begin
  inherited;

  SetCustomEvent;

  dt := SysMimics.Mimic.ServerRunningTime;
  FDTMin := IncDay(dt, -30);
  FDTMax := dt;

  SpanClause := 'timestamp >= ' + QuotedStr(DateTimeToStr(FDTMin)) +
    ' AND timestamp <= ' + QuotedStr(DateTimeToStr(FDTMax));

  lblDatePrev.Caption := FormatDateTime('dd-mm-yyyy hh:nn:ss', FDTMin);
  lblDateNext.Caption := FormatDateTime('dd-mm-yyyy hh:nn:ss', FDTMax);
end;

procedure TfrmListOfParameterChanges.pnlRightClickMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  tempStr : string;
begin
  inherited;

  if Button = mbRight then
  begin
    PrintReport;

    tempStr := ExtractFilePath(Application.ExeName) + C_ReportDir +
      '\parameter_changes_Report_.log';

    ShellExecute(Handle, 'Open', 'C:\Windows\notepad.exe', PChar(tempStr), nil,
      SW_SHOWNORMAL);
  end;
end;

procedure TfrmListOfParameterChanges.PrintReport;
var
  logFile : TextFile;
  fileName: string;
  ParamData: TParameterChangesData;
  dt : TDateTime;
  i  : Integer;
  l  : TList;
begin
  dt := SysMimics.Mimic.ServerRunningTime;

  ForceDirectories(ExtractFilePath(Application.ExeName) + C_ReportDir);

  fileName := ExtractFilePath(Application.ExeName) + C_ReportDir +
    '\parameter_changes_Report_.log';
  AssignFile(logFile, fileName);
  Rewrite(logFile);

  Writeln(logFile, '');
  Writeln(logFile, 'REPORT MADE BY   : TNI-001');
  Writeln(logFile, 'UTC DATE         : ' + FormatDateTime('d/m/yyyy', dt));
  Writeln(logFile, 'UTC TIME         : ' + FormatDateTime('h:nn:ss AM/PM', dt));
  Writeln(logFile, '');
  Writeln(logFile, '****************************************************************************************************************');
  Writeln(logFile, '*                                                                                                              *');
  Writeln(logFile, '*                                               PARAMETER CHANGES REPORT                                       *');
  Writeln(logFile, '*                                  (template Version 1.0 / date 25 th Jan. 2007)                               *');
  Writeln(logFile, '*                                                                                                              *');
  Writeln(logFile, '*                                             Imtech Marine & Offshore                                         *');
  Writeln(logFile, '*                                                                                                              *');
  Writeln(logFile, '****************************************************************************************************************');
  Writeln(logFile, '');
  Writeln(logFile, '---------------------------------------------------------------------------------------------------------------|');

  SysMimics.Database.getRS_Parameters(SysMimics.Mimic.Running_ID, l);

  if l.Count > 0 then
  begin
    for i := 0 to l.Count - 1 do
    begin
      ParamData := l.Items[i];
      Writeln(logFile, '  UTC DATE      | '+DateToStr(ParamData.timestamp)+'');
      Writeln(logFile, '  UTC TIME      | '+TimeToStr(ParamData.timestamp)+'');
      Writeln(logFile, '  POINT ID      | '+ParamData.point_id+'');
      Writeln(logFile, '  UNIT          | '+ParamData._ENG+'');
      Writeln(logFile, '  PREV VALUE    | '+ParamData._PREV+'');
      Writeln(logFile, '  CURR VALUE    | '+ParamData._VAL+'');
      Writeln(logFile, '---------------------------------------------------------------------------------------------------------------|');
    end;
  end;

  CloseFile(logFile);
end;

procedure TfrmListOfParameterChanges.SetCustomEvent;
begin
  if Assigned(frmConfDateTime) then
    frmConfDateTime.OnSpanChange := SpanUpdate;
end;

procedure TfrmListOfParameterChanges.SetSpanClause(aClause: string);
begin
  FSpanClause := aClause;
  ExecNewQuery;
end;

procedure TfrmListOfParameterChanges.SpanUpdate(aDTMin, aDTMax: TDateTime);
begin
  FDTMin := aDTMin;
  FDTMax := aDTMax;

  SpanClause := 'timestamp >= ' + QuotedStr(DateTimeToStr(FDTMin)) +
    ' AND timestamp <= ' + QuotedStr(DateTimeToStr(FDTMax));

  lblDatePrev.Caption := FormatDateTime('dd-mm-yyyy hh:nn:ss', FDTMin);
  lblDateNext.Caption := FormatDateTime('dd-mm-yyyy hh:nn:ss', FDTMax);
end;

end.
