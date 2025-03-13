unit uElementTables;

interface

uses Windows, Classes, uDataType, SysUtils;

type

  TFieldValue = class
  private
    FFieldValue: Double;
    FFieldName: string;
    FFieldType: string;

    procedure SetFieldName(const Value: string);
    procedure SetFieldValue(const Value: Double);
    procedure SetFieldType(const Value: string);
  public
    property FieldName : string read FFieldName write SetFieldName;
    property FieldValue : Double read FFieldValue write SetFieldValue;
    property FieldType : string read FFieldType write SetFieldType;

    procedure OnValueChange(Value : Double);

  end;

  TLogElemt = class
  private
    FList : TList;
    FTableName: String;

    procedure SetTableName(const Value: String);
  public
    constructor Create;
    destructor Destroy; override;

    procedure AddField(aField, aType : String; aValue : Double = 0);
    function FieldExist(aField, aType : String) : boolean;
    function GetField(aField, aType : string) : TFieldValue;
    procedure GetFields(aField: string;var aList : TList);
    procedure UpdateValue(aField, aType : String; aValue : Double);
    property TableName : String read FTableName write SetTableName;
  end;

  TElementTables = class
  private
    FList : TThreadList;
    FWait : Boolean;
    function SearchLog(aTable : string) : TLogElemt;
    function SearchField(aField, aType : string) : TLogElemt;

  public
    constructor Create;
    destructor Destroy; override;

    procedure ClearAll;
    function GetField(aField, aType : string) : TFieldValue;
    procedure GetFields(aField: string; var aList : TList);
    procedure AddField(aField, aType, aTable : String; aValue : Double = 0);
    procedure UpdateFieldValue(aField, aType : string; aValue : double);
    procedure SaveFieldsToDB(RunningID : Integer;DBObject : TObject;aLogTime : TDateTime);

  end;

implementation

uses
  uDatabase;

{ TElementTables }

procedure TElementTables.AddField(aField, aType, aTable: String;aValue : Double = 0);
var
  logTable : TLogElemt;
begin
  logTable := SearchLog(aTable);

  if not Assigned(logTable) then begin
    logTable := TLogElemt.Create;
    logTable.TableName := aTable;
    FList.Add(logTable);
  end;

  logTable.AddField(aField, aType ,aValue);

end;

procedure TElementTables.ClearAll;
var
  i : integer;
  logTable : TLogElemt;
  list : TList;
begin
  list := FList.LockList;
  for I := 0 to List.Count - 1 do
  begin

    logTable := list.Items[i];
    logTable.Free;

  end;
  List.Clear;
  Flist.UnlockList;
end;

constructor TElementTables.Create;
begin
  FList := TThreadList.Create;
end;

destructor TElementTables.Destroy;
var
  i : integer;
  logTable : TLogElemt;
  list : TList;
begin
  list := FList.LockList;
  for I := 0 to List.Count - 1 do
  begin

    logTable := list.Items[i];
    logTable.Free;

  end;
  Flist.UnlockList;
  FList.Free;
end;

function TElementTables.GetField(aField, aType: string): TFieldValue;
var
  i : integer;
  logTable : TLogElemt;
  field : TFieldValue;
  list : TList;
begin

  result := nil;
  list := FList.LockList;

  for I := 0 to List.Count - 1 do
  begin

    logTable := list.Items[i];
    field := logTable.GetField(aField, aType);

    if Assigned(field) then
    begin
      result := field;
      Break;
    end;

  end;

  Flist.UnlockList;

end;

procedure TElementTables.GetFields(aField: string;var aList : TList);
var
  i : integer;
  logTable : TLogElemt;
  list : TList;
begin

  if not Assigned(aList) then
    aList := TList.Create;

  list := FList.LockList;

  for I := 0 to List.Count - 1 do
  begin

    logTable := list.Items[i];
    logTable.GetFields(aField,aList);

  end;

  Flist.UnlockList;

end;

procedure TElementTables.SaveFieldsToDB(RunningID : Integer;DBObject : TObject;aLogTime : TDateTime);
var
  fieldName,fieldValue : String;
  list      : TList;
  i,j     : integer;
  logTable  : TLogElemt;
  field     : TFieldValue;
  sqls      : array of string;
begin

  if FWait then
    Exit;

  if DBObject.ClassType = TIPMSDatabase then
  begin
    FWait := True;
    list := FList.LockList;

    SetLength(sqls,List.Count);
    for I := 0 to List.Count - 1 do
    begin
      fieldName := '';
      fieldValue:= '';

      SetLength(sqls,i+1);
      sqls[i]       := '';

      logTable := list.Items[i];

      for j := 0 to logTable.FList.Count - 1 do
      begin

        field       := logTable.FList.Items[j];
        fieldName   := fieldName  + '[' + field.FieldName + field.FFieldType + ']';
        fieldValue  := fieldValue + FloatToStr(field.FieldValue);

        if j < logTable.FList.Count - 1 then
        begin
          fieldName   := fieldName  + ',';
          fieldValue  := fieldValue + ',';
        end;
      end;

      if fieldName <> '' then
        fieldName := ',' + fieldName;
      if fieldValue <> '' then
        fieldValue := ',' + fieldValue;

      sqls[i]  := 'Insert into ' + logTable.TableName + '(RunningID, timestamp ' +
        fieldName + ') values ( ' + IntToStr(RunningID) + ',' + QuotedStr(DateTimeToStr(aLogTime)) +
        fieldValue + ')';

    end;

    TIPMSDatabase(DBObject).SaveLog(sqls);

    Flist.UnlockList;

    FWait := False;
  end;

end;

function TElementTables.SearchField(aField, aType: string): TLogElemt;
var
  i : integer;
  logTable : TLogElemt;
  list : TList;
begin

  logTable := nil;
  list := FList.LockList;
  for I := 0 to List.Count - 1 do
  begin

    logTable := list.Items[i];
    if logTable.FieldExist(aField, aType) then
      Break;

  end;
  Flist.UnlockList;

  result := logTable;
end;

function TElementTables.SearchLog(aTable: string): TLogElemt;
var
  i : integer;
  logTable : TLogElemt;
  list : TList;
  found : Boolean;
begin
  found := false;
  logTable := nil;
  list := FList.LockList;

  for I := 0 to List.Count - 1 do
  begin

    logTable := list.Items[i];

    if logTable.TableName = aTable then
    begin
      found := true;
      Break;
    end;

  end;
  FList.UnlockList;

  if found then
    result := logTable
  else
    result := nil;
end;

procedure TElementTables.UpdateFieldValue(aField, aType : string; aValue: double);
var
  logTable : TLogElemt;
begin
  logTable := SearchField(aField, aType);

  if Assigned(logTable) then
    logTable.UpdateValue(aField, aType,aValue);

end;

{ TLogElemt }

procedure TLogElemt.AddField(aField, aType: String; aValue : Double = 0);
var
  field : TFieldValue;
begin

  if not FieldExist(aField, aType) then
  begin
    field := TFieldValue.Create;
    field.FieldName := aField;
    field.FieldValue := aValue;
    field.FieldType := aType;
    FList.Add(field);
  end;

end;

constructor TLogElemt.Create;
begin
  FList := TList.Create;
end;

destructor TLogElemt.Destroy;
var
  i : integer;
  field : TFieldValue;
begin
  for I := 0 to FList.Count - 1 do
  begin
    field := FList.Items[i];
    field.Free;
  end;

  FList.Free;
end;

function TLogElemt.FieldExist(aField, aType: String): boolean;
var
  i : integer;
  field : TFieldValue;
begin
  Result := False;

  for I := 0 to FList.Count - 1 do
  begin
    field := FList.Items[i];
    if (field.FieldName = aField) and (field.FieldType = aType) then
    begin
      Result := True;
      Break;
    end;
  end;
end;

function TLogElemt.GetField(aField, aType: string): TFieldValue;
var
  i : integer;
  field : TFieldValue;
begin
  Result := nil;

  for I := 0 to FList.Count - 1 do
  begin
    field := FList.Items[i];
    if (field.FieldName = aField) and (field.FieldType = aType) then
    begin
      Result := field;
      Break;
    end;
  end;
end;

procedure TLogElemt.GetFields(aField: string; var aList : TList);
var
  i : integer;
  field : TFieldValue;
begin
  if not Assigned(aList) then
    aList := TList.Create;

  for I := 0 to FList.Count - 1 do
  begin
    field := FList.Items[i];
    if (field.FieldName = aField) then
      aList.Add(field)
  end;
end;

procedure TLogElemt.SetTableName(const Value: String);
begin
  FTableName := Value;
end;

procedure TLogElemt.UpdateValue(aField, aType: String; aValue: Double);
var
  i : integer;
  field : TFieldValue;
begin

  for I := 0 to FList.Count - 1 do
  begin
    field := FList.Items[i];
    if (field.FieldName = aField) and (field.FieldType = aType) then
    begin
      field.FieldValue := aValue;
      Break;
    end;
  end;
end;

{ TFieldValue }

procedure TFieldValue.OnValueChange(Value: Double);
begin
  FFieldValue := Value;
end;

procedure TFieldValue.SetFieldName(const Value: string);
begin
  FFieldName := Value;
end;

procedure TFieldValue.SetFieldType(const Value: string);
begin
  FFieldType := Value;
end;

procedure TFieldValue.SetFieldValue(const Value: Double);
begin
  FFieldValue := Value;
end;

end.
