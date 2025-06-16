unit uEntity;

interface

uses Windows,uListener, classes, SysUtils, uConsumption;

type

  TEntity = class
  private
    FListener : TListeners;
    FIdentifier: string;
    procedure SetIdentifier(const Value: string);
  protected
    { not all entity have consumption object }
    FConsumption : TConsumptions;
  public
    constructor Create;virtual;
    destructor Destroy;override;

    procedure Run(const aDt : Double); virtual;

    property Listener : TListeners read FListener;
    property Identifier : string read FIdentifier write SetIdentifier;
    property Consumption : TConsumptions read FConsumption;
  end;

  TEntities = class
  private
    FList : TThreadList;
  public
    constructor Create;
    destructor Destroy;override;

    function getCount : integer;
    function Get(aKey : string) : TEntity;overload;
    function Get(aIndex : integer) : TEntity;overload;

    procedure Add(aEntity : TEntity);
    procedure Remove(aKey : string);
    procedure Run(const aDt : double);
  end;

implementation

{ TEntity }

constructor TEntity.Create;
begin
  FListener := TListeners.Create;
end;

destructor TEntity.Destroy;
begin

  FListener.Free;

  inherited;
end;

procedure TEntity.Run(const aDt: Double);
begin

end;

procedure TEntity.SetIdentifier(const Value: string);
begin
  FIdentifier := Value;
end;

{ TEntities }

procedure TEntities.Add(aEntity : TEntity);
var
  l: TList;
begin
//  FList.LockList.Add(aEntity);
//  FList.UnlockList;

  l:= FList.LockList;
  try
    l.Add(aEntity);
  finally
    FList.UnlockList;
  end;
end;

constructor TEntities.Create;
begin
  FList := TThreadList.Create;
end;

destructor TEntities.Destroy;
var
  l : TList;
  obj : TObject;
begin
  l := Flist.LockList;
  try
    while l.Count > 0 do
    begin
      obj := l.Items[0];
      FreeAndNil(obj);
      l.Delete(0);
    end;
  finally
    FList.UnlockList;
    FList.Free;
  end;
  inherited;
end;

function TEntities.Get(aKey: string): TEntity;
var
  found : boolean;
  obj : TObject;
  i : integer;
  l : TList;
begin
  i := 0;
  found := False;
  obj := nil;
  Result := nil;

  l := FList.LockList;
  try
    if l.Count <= 0 then
      Exit;

    while (not found) and (i<l.Count) do
    begin
      obj := l.Items[i];

      if CompareStr(TEntity(obj).Identifier,aKey) = 0 then
        found := True;

      Inc(i);
    end;

    if found then
      Result := TEntity(obj);
  finally
    Flist.UnlockList;
  end;
end;

function TEntities.Get(aIndex: integer): TEntity;
var
  l : TList;
begin
  Result := nil;

  l := FList.LockList;
  try
    if l.Count <= aIndex then begin
      FList.UnlockList;
      Exit;
    end;

    Result := TEntity(l.Items[aIndex]);
  finally
    Flist.UnlockList;
  end;
end;

function TEntities.getCount: integer;
var
  l: TList;
begin
  l:= FList.LockList;
  try
    result := l.Count;
  finally
    FList.UnlockList;
  end;
end;

procedure TEntities.Remove(aKey: string);
var
  ent : TEntity;
  l: TList;
begin
  ent := Get(aKey);

  if Assigned(ent) then
  begin
    l:= FList.LockList;
    try
      l.Remove(ent);
      ent.Free;
    finally
      FList.UnlockList;
    end;
  end;
end;

procedure TEntities.Run(const aDt: double);
var
  l : TList;
  obj : TEntity;
  i : integer;
begin

  l := Flist.LockList;
  try
    for i := 0 to l.Count - 1 do
    begin
      obj := l.Items[i];
      obj.Run(aDt);
    end;
  finally
    FList.UnlockList;
  end;
end;

end.
