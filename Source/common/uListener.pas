{*------------------------------------------------------------------------------

  Listener use for triggering event when class property value change.

  @author  Ryu
  @version 2013/07/23 1.0 Initial revision.
  @todo
  @comment
-------------------------------------------------------------------------------}
unit uListener;

interface

uses
  uDataType, classes, SysUtils;

type
  TPropsIntProc = procedure (Sender: TObject; Props: E_PropsID;
    Value: Integer) of object;
  TPropsDblProc = procedure (Sender: TObject; Props: E_PropsID;
    Value: Double) of object;
  TPropsBoolProc = procedure (Sender: TObject; Props: E_PropsID;
    Value: Boolean) of object;
  TPropsByteProc = procedure (Sender: TObject; Props: E_PropsID;
    Value: Byte) of object;
  TPropsObjProc = procedure (Sender: TObject; Props: E_PropsID;
    Value: TObject) of object;
  TPropsStrProc = procedure (Sender: TObject; Props: E_PropsID;
    Value: String) of object;

  TEventListener = class
  private
    FListenerID : string;
    procedure SetListenerID(const Value: string);
  public
    property ListenerID : string read FListenerID write SetListenerID;
  end;

  TPropertyEventListener = class (TEventListener)
  private
    FOnPropertyByteChange : TPropsByteProc;
    FOnPropertyDblChange : TPropsDblProc;
    FOnPropertyIntChange : TPropsIntProc;
    FOnPropertyBoolChange : TPropsBoolProc;
    FOnPropertyObjectChange : TPropsObjProc;
    FOnPropertyStringChange : TPropsStrProc;
    FSilent : Boolean;
    procedure SetOnPropertyBoolChange(const Value: TPropsBoolProc);
    procedure SetOnPropertyByteChange(const Value: TPropsByteProc);
    procedure SetOnPropertyDblChange(const Value: TPropsDblProc);
    procedure SetOnPropertyIntChange(const Value: TPropsIntProc);
    procedure SetOnPropertyObjectChange(const Value: TPropsObjProc);
    procedure SetOnPropertyStringChange(const Value: TPropsStrProc);
    procedure SetSilent(const Value: Boolean);
  public
    procedure TriggerEvent(Sender: TObject; PropsID: E_PropsID;
      Value: Integer); overload;
    procedure TriggerEvent(Sender: TObject; PropsID: E_PropsID;
      Value: Double); overload;
    procedure TriggerEvent(Sender: TObject; PropsID: E_PropsID;
      Value: Boolean); overload;
    procedure TriggerEvent(Sender: TObject; PropsID: E_PropsID;
      Value: Byte); overload;
    procedure TriggerEvent(Sender: TObject; PropsID: E_PropsID;
      Value: TObject); overload;
    procedure TriggerEvent(Sender: TObject; PropsID: E_PropsID;
      Value: string); overload;

    procedure ReleaseEvent;
    destructor Destroy; override;

    property OnPropertyIntChange : TPropsIntProc read FOnPropertyIntChange
      write SetOnPropertyIntChange;
    property OnPropertyDblChange : TPropsDblProc read FOnPropertyDblChange
      write SetOnPropertyDblChange;
    property OnPropertyBoolChange : TPropsBoolProc read FOnPropertyBoolChange
      write SetOnPropertyBoolChange;
    property OnPropertyByteChange : TPropsByteProc read FOnPropertyByteChange
      write SetOnPropertyByteChange;
    property OnPropertyObjectChange: TPropsObjProc read FOnPropertyObjectChange
      write SetOnPropertyObjectChange;
    property OnPropertyStringChange: TPropsStrProc read FOnPropertyStringChange
      write SetOnPropertyStringChange;

    property Silent : Boolean  read FSilent write SetSilent default False;
  end;

  {
    You can create your custom listener here..
  }

  TListeners = class
  private
    FList : TList;
    FSilent : Boolean;
    FOnExceptionMessage : TGetStrProc;

    function getCount : Integer;
    procedure SetSilent(const Value: Boolean);
    procedure SetOnExceptionMessage(const Value: TGetStrProc);
  public
    constructor Create;
    destructor Destroy; override;

    function Get(aKey: string): TEventListener; overload;
    function Get(aIndex: Integer): TEventListener; overload;
    function Add(aKey: string): TEventListener;
    procedure Remove(aKey: string);

    procedure TriggerEvents(Sender: TObject; PropsID: E_PropsID;
      Value: Integer); overload;
    procedure TriggerEvents(Sender: TObject; PropsID: E_PropsID;
      Value: Double); overload;
    procedure TriggerEvents(Sender: TObject; PropsID: E_PropsID;
      Value: Boolean); overload;
    procedure TriggerEvents(Sender: TObject; PropsID: E_PropsID;
      Value: Byte); overload;
    procedure TriggerEvents(Sender: TObject; PropsID: E_PropsID;
      Value: TObject); overload;
    procedure TriggerEvents(Sender: TObject; PropsID: E_PropsID;
      Value: string); overload;

    property Count : Integer read getCount;
    property Silent : Boolean  read FSilent write SetSilent default False;
    property OnExceptionMessage : TGetStrProc  read FOnExceptionMessage
      write SetOnExceptionMessage;
  end;

implementation

uses Dialogs, TypInfo;

{ TPropertyEventListener }

destructor TPropertyEventListener.Destroy;
begin
  ReleaseEvent;

  inherited;
end;

procedure TPropertyEventListener.TriggerEvent(Sender: TObject;
  PropsID: E_PropsID; Value: Boolean);
begin
  if Silent then
    Exit;

  if Assigned(FOnPropertyBoolChange) then
    FOnPropertyBoolChange(Sender, PropsID, Value);
end;

procedure TPropertyEventListener.TriggerEvent(Sender: TObject;
  PropsID: E_PropsID; Value: Byte);
begin
  if Silent then
    Exit;

  if Assigned(FOnPropertyByteChange) then
    FOnPropertyByteChange(Sender, PropsID, Value);
end;

procedure TPropertyEventListener.TriggerEvent(Sender: TObject;
  PropsID: E_PropsID; Value: Double);
begin
  if Silent then
    Exit;

  if Assigned(FOnPropertyDblChange) then
    FOnPropertyDblChange(Sender, PropsID, Value);
end;

procedure TPropertyEventListener.TriggerEvent(Sender: TObject;
  PropsID: E_PropsID; Value: Integer);
begin
  if Silent then
    Exit;

  if Assigned(FOnPropertyIntChange) then
    FOnPropertyIntChange(Sender, PropsID, Value);
end;

procedure TPropertyEventListener.ReleaseEvent;
begin
  FOnPropertyByteChange := nil;
  FOnPropertyDblChange := nil;
  FOnPropertyIntChange := nil;
  FOnPropertyBoolChange := nil;
  FOnPropertyObjectChange := nil;
  FOnPropertyStringChange := nil;
end;

procedure TPropertyEventListener.SetOnPropertyBoolChange(
  const Value: TPropsBoolProc);
begin
  FOnPropertyBoolChange := Value;
end;

procedure TPropertyEventListener.SetOnPropertyByteChange(
  const Value: TPropsByteProc);
begin
  FOnPropertyByteChange := Value;
end;

procedure TPropertyEventListener.SetOnPropertyDblChange(
  const Value: TPropsDblProc);
begin
  FOnPropertyDblChange := Value;
end;

procedure TPropertyEventListener.SetOnPropertyIntChange(
  const Value: TPropsIntProc);
begin
  FOnPropertyIntChange := Value;
end;

procedure TPropertyEventListener.SetOnPropertyObjectChange(
  const Value: TPropsObjProc);
begin
  FOnPropertyObjectChange := Value;
end;

procedure TPropertyEventListener.SetOnPropertyStringChange(
  const Value: TPropsStrProc);
begin
  FOnPropertyStringChange := Value;
end;

procedure TPropertyEventListener.SetSilent(const Value: Boolean);
begin
  FSilent := Value;
end;

procedure TPropertyEventListener.TriggerEvent(Sender: TObject;
  PropsID: E_PropsID; Value: TObject);
begin
  if Silent then
    Exit;

  if Assigned(FOnPropertyObjectChange) then
    FOnPropertyObjectChange(Sender, PropsID, Value);
end;

procedure TPropertyEventListener.TriggerEvent(Sender: TObject;
  PropsID: E_PropsID; Value: string);
begin
  if Silent then
    Exit;

  if Assigned(FOnPropertyStringChange) then
    FOnPropertyStringChange(Sender, PropsID, Value);
end;

{ TEventListener }

procedure TEventListener.SetListenerID(const Value: string);
begin
  FListenerID := Value;
end;

{ TListeners }

function TListeners.Add(aKey: string): TEventListener;
begin
  Result := Get(aKey);

  if not Assigned(Result) then
  begin
    Result := TPropertyEventListener.Create;
    Result.ListenerID := aKey;
    FList.Add(Result);
  end;
end;

constructor TListeners.Create;
begin
  FList := TList.Create;
end;

destructor TListeners.Destroy;
var
  obj : TObject;
begin
  while Flist.Count > 0 do
  begin
    obj := Flist.Items[0];
    FreeAndNil(obj);
    FList.Delete(0);
  end;

  FList.Free;

  inherited;
end;

function TListeners.Get(aIndex: Integer): TEventListener;
begin
  Result := nil;

  if FList.Count <= aIndex then
    Exit;

  Result := TEventListener(Flist.Items[aIndex]);
end;

function TListeners.Get(aKey: string): TEventListener;
var
  found : boolean;
  obj : TObject;
  i : integer;
begin
  i := 0;
  found := False;
  obj := nil;
  Result := nil;

  if FList.Count <= 0 then
    Exit;

  while (not found) and (i<FList.Count) do
  begin
    obj := Flist.Items[i];

    if CompareStr(TEventListener(obj).ListenerID,aKey) = 0 then
      found := True;

    Inc(i);
  end;

  if found then
    Result := TEventListener(obj);
end;

function TListeners.getCount: Integer;
begin
  Result := FList.Count;
end;

procedure TListeners.Remove(aKey: string);
var
  l : TEventListener;
begin
  l := Get(aKey);

  if Assigned(l) then
  begin
    FList.Remove(l);
    l.Free;
  end;
end;

procedure TListeners.SetOnExceptionMessage(const Value: TGetStrProc);
begin
  FOnExceptionMessage := Value;
end;

procedure TListeners.SetSilent(const Value: Boolean);
begin
  FSilent := Value;
end;

procedure TListeners.TriggerEvents(Sender: TObject; PropsID: E_PropsID;
  Value: Boolean);
var
  i : Integer;
  l : TPropertyEventListener;
begin
  if Silent then
    Exit;

  for i := 0 to FList.Count - 1 do
  begin
    l := TPropertyEventListener(FList.Items[i]);

    if Assigned(l) then
    begin
      try
        l.TriggerEvent(Sender, PropsID, Value)
      except
        on E:Exception do
        begin
          if Assigned(FOnExceptionMessage) then
          begin
            FOnExceptionMessage(l.ListenerID + ' : [' +
              GetEnumName(TypeInfo(E_PropsID), Integer(PropsID)) + ',' +
              BoolToStr(Value) + ']' + #13 + E.Message + #13 + ' Trace : [' +
              E.StackTrace + ']');
          end;
        end
      end;
    end;
  end;
end;

procedure TListeners.TriggerEvents(Sender: TObject; PropsID: E_PropsID;
  Value: Double);
var
  i : Integer;
  l : TPropertyEventListener;
begin
  if Silent then
    Exit;

  for i := 0 to FList.Count - 1 do
  begin
    l := TPropertyEventListener(FList.Items[i]);

    if Assigned(l) then
    begin
      try
        l.TriggerEvent(Sender, PropsID, Value)
      except
        on E:Exception do
        begin
          if Assigned(FOnExceptionMessage) then
          begin
            FOnExceptionMessage(l.ListenerID + ' : [' +
              GetEnumName(TypeInfo(E_PropsID), Integer(PropsID)) + ',' +
              FloatToStr(Value) + ']' + #13 + E.Message + #13 + ' Trace : [' +
              E.StackTrace + ']');
          end;
        end
      end;
    end;
  end;
end;

procedure TListeners.TriggerEvents(Sender: TObject; PropsID: E_PropsID;
  Value: Integer);
var
  i : Integer;
  l : TPropertyEventListener;
begin
  if Silent then
    Exit;

  for i := 0 to FList.Count - 1 do
  begin
    l := TPropertyEventListener(FList.Items[i]);

    if Assigned(l) then
    begin
      try
        l.TriggerEvent(Sender, PropsID, Value)
      except
        on E:Exception do
        begin
          if Assigned(FOnExceptionMessage) then
          begin
            FOnExceptionMessage(l.ListenerID + ' : [' +
              GetEnumName(TypeInfo(E_PropsID),integer(PropsID)) + ',' +
              IntToStr(Value) + ']' + #13 + E.Message + #13 + ' Trace : [' +
              E.StackTrace + ']');
          end;
        end
      end;
    end;
  end;
end;

procedure TListeners.TriggerEvents(Sender: TObject; PropsID: E_PropsID;
  Value: string);
var
  i : Integer;
  l : TPropertyEventListener;
begin
  if Silent then
    Exit;

  for i := 0 to FList.Count - 1 do
  begin
    l := TPropertyEventListener(FList.Items[i]);

    if Assigned(l) then
    begin
      try
        l.TriggerEvent(Sender, PropsID, Value)
      except
        on E:Exception do
        begin
          if Assigned(FOnExceptionMessage) then
          begin
            FOnExceptionMessage(l.ListenerID + ' : [' +
              GetEnumName(TypeInfo(E_PropsID),integer(PropsID)) + ',' +
              Value + ']' + #13 + E.Message + #13 + ' Trace : [' +
              E.StackTrace + ']');
          end;
        end
      end;
    end;
  end;
end;

procedure TListeners.TriggerEvents(Sender: TObject; PropsID: E_PropsID;
  Value: TObject);
var
  i : Integer;
  l : TPropertyEventListener;
begin
  if Silent then
    Exit;

  for i := 0 to FList.Count - 1 do
  begin
    l := TPropertyEventListener(FList.Items[i]);

    if Assigned(l) then
    begin
      try
        l.TriggerEvent(Sender, PropsID, Value)
      except
        on E:Exception do
        begin
          if Assigned(FOnExceptionMessage) then
          begin
            FOnExceptionMessage(l.ListenerID + ' : [' +
              GetEnumName(TypeInfo(E_PropsID),integer(PropsID)) + ',' +
              Value.ClassName + ']' + #13 + E.Message + #13 + ' Trace : [' +
              E.StackTrace + ']');
          end;
        end
      end;
    end;
  end;
end;

procedure TListeners.TriggerEvents(Sender: TObject; PropsID: E_PropsID;
  Value: Byte);
var
  i : Integer;
  l : TPropertyEventListener;
begin
  if Silent then
    Exit;

  for i := 0 to FList.Count - 1 do
  begin
    l := TPropertyEventListener(FList.Items[i]);

    if Assigned(l) then
    begin
      try
        l.TriggerEvent(Sender, PropsID, Value)
      except
        on E:Exception do
        begin
          if Assigned(FOnExceptionMessage) then
          begin
            FOnExceptionMessage(l.ListenerID + ' : [' +
              GetEnumName(TypeInfo(E_PropsID),integer(PropsID)) + ',' +
              IntToStr(Value) + ']' + #13 + E.Message + #13 + ' Trace : [' +
              E.StackTrace + ']');
          end;
        end
      end;
    end;
  end;
end;

end.
