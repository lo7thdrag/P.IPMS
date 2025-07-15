unit uLoadGroupFromXML;

interface

uses
  Classes, GmXml, GmXMLInterface;

type
  //==============================================================================
  TNodeGroupChannel = class(TXMLObjInterface)
  private
    function getValue(const Index: Integer): string;
  public
    property GroupName  : string index 1 read getValue;
  end;

  //==============================================================================
  TFsGroupList = class(TXMLObjInterface)
  private
    FXML    : TGmXML;
    FLoaded : Boolean;

    FNodeGroup,
    FNodeExternal   : TGmXmlNode;

    iNodeCons : TNodeGroupChannel;
  public
    RoleList,
    ExternalList : TStrings;

    constructor Create;
    destructor Destroy; override;

    procedure LoadFromFile(const fName: string);
    procedure CloseFile;
  end;


implementation

const
  cTag_fsgroups     = 'fsgroups';
  cTag_roles        = 'roles';
  cTag_External     = 'external';
  cTag_console      = 'console';

{ TNodeGroupChannel }

function TNodeGroupChannel.getValue(const Index: Integer): string;
begin
  case index of
    1 : result := getAttribValueByName('name');
  end;
end;

{ TFsGroupList }

procedure TFsGroupList.CloseFile;
begin
  FXML.Free;
  FXML := nil;

  FNodeGroup        := nil;
  FNodeExternal     := nil;
end;

constructor TFsGroupList.Create;
begin
  FNodeGroup      := nil;
  FNodeExternal   := nil;

  RoleList        := TStringList.Create;
  ExternalList    := TStringList.Create;

  FXML := nil;
  FLoaded := False;

  iNodeCons := TNodeGroupChannel.Create;
end;

destructor TFsGroupList.Destroy;
begin
  RoleList.Free;
  ExternalList.Free;

  iNodeCons.Free;

  FNodeGroup      := nil;
  FNodeExternal   := nil;
  FXML.Free;

  inherited;
end;

procedure TFsGroupList.LoadFromFile(const fName: string);
var
  i     : integer;
  nRoom : TNodeGroupChannel;
begin
  FXML := TGmXML.Create(nil);
  FXML.LoadFromFile(fName);

  FNodeGroup       := FXML.Nodes.Node[0].Children.NodeByName[cTag_roles];
  FNodeExternal    := FXML.Nodes.Node[0].Children.NodeByName[cTag_External];

  RoleList.Clear;
  ExternalList.Clear;

  try
    nRoom := TNodeGroupChannel.Create;

    for i := 0 to FNodeGroup.Children.Count - 1 do
    begin
      nRoom.Assign(FNodeGroup.Children[i]);
      RoleList.Add(nRoom.GroupName);
    end;

    for i := 0 to FNodeExternal.Children.Count - 1 do
    begin
      nRoom.Assign(FNodeExternal.Children[i]);
      ExternalList.Add(nRoom.GroupName);
    end;

  finally
    nRoom.Free;
  end;
end;

end.
