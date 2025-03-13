unit uCommonSystem;

interface

uses uEntity, uListener;

type

  TCommonSystem = class
  private
    FEntities : TEntities;
    FListener : TListeners;
  protected
    procedure addEntity(aEntity : TEntity);
  public
    constructor Create; virtual;
    destructor Destroy; override;

    procedure Run(const aDt : Double); virtual;
    procedure addEntityListener(aListenerID : string; aEvent : TPropsIntProc); overload;
    procedure addEntityListener(aListenerID : string; aEvent : TPropsDblProc); overload;
    procedure addEntityListener(aListenerID : string; aEvent : TPropsByteProc); overload;
    procedure addEntityListener(aListenerID : string; aEvent : TPropsObjProc); overload;
    procedure addEntityListener(aListenerID : string; aEvent : TPropsStrProc); overload;
    procedure addEntityListener(aListenerID : string; aEvent : TPropsBoolProc); overload;

    property Entities : TEntities read FEntities;
    property Listener : TListeners read FListener;
  end;

implementation

{ TCommonSystem }

procedure TCommonSystem.addEntityListener(aListenerID: string;
  aEvent: TPropsDblProc);
var
  i : Integer;
begin
  for i := 0 to FEntities.getCount - 1 do
    with FEntities.Get(i).Listener.Add(aListenerID) as TPropertyEventListener do
      OnPropertyDblChange := aEvent;
end;

procedure TCommonSystem.addEntityListener(aListenerID: string;
  aEvent: TPropsIntProc);
var
  i : Integer;
begin
  for i := 0 to FEntities.getCount - 1 do
    with FEntities.Get(i).Listener.Add(aListenerID) as TPropertyEventListener do
      OnPropertyIntChange := aEvent;
end;

procedure TCommonSystem.addEntityListener(aListenerID: string;
  aEvent: TPropsByteProc);
var
  i : Integer;
begin
  for i := 0 to FEntities.getCount - 1 do
    with FEntities.Get(i).Listener.Add(aListenerID) as TPropertyEventListener do
      OnPropertyByteChange := aEvent;
end;

procedure TCommonSystem.addEntity(aEntity: TEntity);
begin
  FEntities.Add(aEntity);
end;

procedure TCommonSystem.addEntityListener(aListenerID: string;
  aEvent: TPropsStrProc);
var
  i : Integer;
begin
  for i := 0 to FEntities.getCount - 1 do
    with FEntities.Get(i).Listener.Add(aListenerID) as TPropertyEventListener do
      OnPropertyStringChange := aEvent;
end;

constructor TCommonSystem.Create;
begin
  FEntities := TEntities.Create;
  FListener := TListeners.Create;
end;

destructor TCommonSystem.Destroy;
begin
  Flistener.Free;
  FEntities.Free;

  inherited;
end;

procedure TCommonSystem.addEntityListener(aListenerID: string;
  aEvent: TPropsObjProc);
var
  i : Integer;
begin
  for i := 0 to FEntities.getCount - 1 do
    with FEntities.Get(i).Listener.Add(aListenerID) as TPropertyEventListener do
      OnPropertyObjectChange := aEvent;
end;

procedure TCommonSystem.Run(const aDt: Double);
begin
  Entities.Run(aDt);
end;

procedure TCommonSystem.addEntityListener(aListenerID: string;
  aEvent: TPropsBoolProc);
var
  i : Integer;
begin
  for i := 0 to FEntities.getCount - 1 do
    with FEntities.Get(i).Listener.Add(aListenerID) as TPropertyEventListener do
      OnPropertyBoolChange := aEvent;
end;

end.
