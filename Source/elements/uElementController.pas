unit uElementController;

{*------------------------------------------------------------------------------

  This class act as 1 LPU which consist of elements.
  List of Elements obtained from database

  @author  ryu
  @version 2013/08/21 1.0 Initial revision.
  @todo
  @comment
-------------------------------------------------------------------------------}

interface

uses Windows, uElement, Classes, uDatabase, uDataType, uListener, SysUtils,
     uDBSupportClasses, uElementTables;

type
  TElementController = class
  private
    FElements       : TThreadList; { list of element }
    FControllerID   : string;
    FIPMSDatabase   : TIPMSDatabase;

    procedure SetControllerID(const Value: string);
    procedure OnDatabasePropObjChange(Sender : TObject;Props : E_PropsID; Value : TObject);

    { element creator }
    function ElementFactory(ElementType : E_ElementType; DBValue : TObject) : TElement;

  public
    constructor Create(Database : TIPMSDatabase; ControllerID : String);
    destructor Destroy;override;

    function getElements : TStrings;
    function getElement(ElementID : String) : TElement;

    procedure RunEverySecond; virtual;

    property ControllerID : string read FControllerID write SetControllerID;
  end;


implementation

uses
  uFunction, uAAE, uCBA, uCBE, uCTR,
  uDAE, uMCD, uMCE,uMCS,uRHE, uSAE, uSEE,
  uSPE, uSS1, uSS2, uSSE, uSSL, uSWB,
  uSWE, uSWN, uVCE, uVCH, uVCP  ;

{ TElementController }

constructor TElementController.Create(Database : TIPMSDatabase; ControllerID : String);
var
  FListener : TPropertyEventListener;
begin

  FIPMSDatabase := Database;
  FControllerID := ControllerID;
  FElements     := TThreadList.Create;

  FListener := FIPMSDatabase.Listeners.Add(ControllerID) as TPropertyEventListener;
  FListener.OnPropertyObjectChange := OnDatabasePropObjChange;

  FIPMSDatabase.PopulateElements(FControllerID);
  FIPMSDatabase.Listeners.Remove(ControllerID);
end;

destructor TElementController.Destroy;
var
  i : integer;
  element : TObject;
  list : TList;
begin
  list := FElements.LockList;
  for I := 0 to list.Count - 1 do
  begin
    element := list.Items[i];
    element.Free;
  end;
  FElements.UnlockList;
  FElements.Clear;
  FElements.Free;
  inherited;
end;

function TElementController.ElementFactory(
  ElementType: E_ElementType; DBValue : TObject): TElement;
begin
  result := nil;
  case ElementType of
    eltAAE: result := TAAEElement.Create;
    eltCBA: result := TCBAElement.Create;
    eltCBE: Result := TCBEElement.Create;
    eltCTR: result := TCTRElement.Create;
    eltDAE: result := TDAEElement.Create;
    eltMCD: result := TMCDElement.Create;
    eltMCE: result := TMCEElement.Create;
    eltMCS: result := TMCSElement.Create;
    eltRHE: result := TRHEElement.Create;
    eltSAE: result := TSAEElement.Create;
    eltSEE: result := TSEEElement.Create;
    eltSPE: result := TSPEElement.Create;
    eltSSE: result := TSSEElement.Create;
    eltSS1: result := TSS1Element.Create;
    eltSS2: result := TSS2Element.Create;
    eltSSL: result := TSSLElement.Create;
    eltSWB: ;
    eltSWE: result := TSWEElement.Create;
    eltSWN: result := TSWNElement.Create;
    eltVCE: result := TVCEElement.Create;
    eltVCH: result := TVCHElement.Create;
    eltVCP: result := TVCPElement.Create;
    eltUNDEF: result := nil;
  end;

  { fill element prop with data }
  if Assigned(Result) and (DBValue is TElementData)  then
    with TElementData(DBValue) do begin

      Result.ElementID      := ElementID;
      Result.ElementName    := Elementname;
      Result.ElementMimic   := MainMimic_IDfk;
      Result.SystemID       := IntToStr(SystemIDfk);
      Result.SystemDesc     := SystemDescription;
      Result.ControllerID   := Controller_ID;
      Result.AlarmGroupID   := AlarmgroupID;
      Result.AlarmGroupDesc := AlarmgroupDescription;
      Result.AlarmGroupAbbr := AlarmgroupAbbreviation;

    end;
end;

function TElementController.getElement(ElementID : String): TElement;
var
  i : integer;
  element : TElement;
  list : Tlist;
begin

  Result := nil;

  list := FElements.LockList;
  for I := 0 to list.Count - 1 do
  begin
    element := TElement(list.Items[i]);
    if element.ElementID = ElementID then begin
      Result := element;
      Break;
    end;
  end;
  FElements.UnlockList;
end;

function TElementController.getElements: TStrings;
var
  i : integer;
  element : TElement;
  list : Tlist;
begin

  Result := TStringList.Create;

  list := FElements.LockList;
  for I := 0 to list.Count - 1 do
  begin
    element := TElement(list.Items[i]);
    Result.Add(element.ElementID);
  end;
  FElements.UnlockList;
end;

procedure TElementController.OnDatabasePropObjChange(Sender: TObject;
  Props: E_PropsID; Value: TObject);
var
  Element : TElement;
begin
  case Props of
    epQueryElementsByControllerID :
    begin
      if Assigned(Value) then
      begin
        { call element producer }
        Element := ElementFactory(
          ElementAbbreviateToType(TElementData(Value).Elementtype_IDfk), Value);

        if Assigned(Element) then
          FElements.Add(Element);
      end;
    end;
  end;
end;

procedure TElementController.RunEverySecond;
var
  i : integer;
  list : TList;
  element : TObject;
begin
  list := FElements.LockList;

  for i := 0 to list.Count - 1 do
  begin
    element := list.Items[i];
    TElement(element).RunEverySecond;
  end;

  FElements.UnlockList;
end;

procedure TElementController.SetControllerID(const Value: string);
begin
  FControllerID := Value;
end;

end.
