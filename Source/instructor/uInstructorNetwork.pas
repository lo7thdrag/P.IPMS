unit uInstructorNetwork;

{*------------------------------------------------------------------------------
  Network Manager class to manage connection for simulator system.
  Act as server to controller, pcsUi, pmsUI, mimic.

  @author  ryu
  @version 2013/09/27 1.0 Initial revision.
  @todo
  @comment
-------------------------------------------------------------------------------}

interface

uses uNetBaseSocket, uTCPServer, uTCPClient, ExtCtrls, uListener, uNetworkManager,
  uDataType;

type
  TInstructorNetwork = class(TNetworkManager)

  public

    constructor Create; override;
    destructor Destroy; override;

    { start network comm }
    procedure StartNetwork;override;

    { stop network comm }
    procedure StopNetwork;override;

  end;
implementation

uses uSetting;

{ TERNetwork }

constructor TInstructorNetwork.Create;
begin
  inherited;

  CreateServerSocket('AsInstructorServer');
  StopNetwork;

end;

destructor TInstructorNetwork.Destroy;
begin

  inherited;
end;

procedure TInstructorNetwork.StartNetwork;
begin

  AsServer.Listen(Setting.InstructorPort);
  Listeners.TriggerEvents(Self, epNetworkDebugInfo, 'Instructor Network Started at ' + Setting.InstructorPort);

  inherited;

end;

procedure TInstructorNetwork.StopNetwork;
begin

  AsServer.Stop;
  Listeners.TriggerEvents(Self, epNetworkDebugInfo, 'Instructor Network Stopped');

  inherited;

end;

end.
