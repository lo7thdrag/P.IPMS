unit uLoadConsoleIP;

interface

uses
  Classes, GmXml, GmXMLInterface;

type
  //==============================================================================
  TConsoleIP = class
    ConsoleIP,
    ConsoleName : string;
  end;

  TNodeIP = class(TXMLObjInterface)
  private
    function getValue(const Index: Integer): string;
  public
    property ConsoleIP    : string index 1 read getValue;
    property ConsoleName  : string index 2 read getValue;
  end;

  //==============================================================================
  TFsGroupIP = class(TXMLObjInterface)
  private
    FXML    : TGmXML;
    FLoaded : Boolean;

    FNodeIP : TGmXmlNode;

    iNodeCons : TNodeIP;
  public
    ListIP : Tlist;

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

function TNodeIP.getValue(const Index: Integer): string;
begin
  case index of
    1 : result := getAttribValueByName('ip');
    2 : result := getAttribValueByName('name');
  end;
end;

{ TFsGroupList }

procedure TFsGroupIP.CloseFile;
begin
  FXML.Free;
  FXML := nil;

  FNodeIP        := nil;
end;

constructor TFsGroupIP.Create;
begin
  FNodeIP      := nil;

  ListIP := TList.Create;

  FXML := nil;
  FLoaded := False;

  iNodeCons := TNodeIP.Create;
end;

destructor TFsGroupIP.Destroy;
var
  i : integer;
begin
  for i := ListIP.Count - 1 downto 0 do
  begin
    ListIP.Delete(i);
  end;
  ListIP.Clear;
  ListIP.Free;

  iNodeCons.Free;

  FNodeIP      := nil;
  FXML.Free;

  inherited;
end;

procedure TFsGroupIP.LoadFromFile(const fName: string);
var
  i     : integer;
  nRoom : TNodeIP;

  Con   : TConsoleIP;
begin
  FXML := TGmXML.Create(nil);
  FXML.LoadFromFile(fName);

  FNodeIP       := FXML.Nodes.Node[0].Children.NodeByName[cTag_roles];

  for I := ListIP.Count - 1 downto 0 do
  begin
    ListIP.Delete(i);
  end;
  ListIP.Clear;

  try
    nRoom := TNodeIP.Create;

    for i := 0 to FNodeIP.Children.Count - 1 do
    begin
      nRoom.Assign(FNodeIP.Children[i]);

      Con := TConsoleIP.Create;
      Con.ConsoleIP := nRoom.ConsoleIP;
      Con.ConsoleName := nRoom.ConsoleName;

      ListIP.Add(Con);
    end;

  finally
    nRoom.Free;
  end;
end;

end.
