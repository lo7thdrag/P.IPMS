unit uNetworkStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uDataType, uTCPServer;

type
  TfrmNetStatus = class(TForm)
    grp1: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lblInsHost: TLabel;
    lblInsPort: TLabel;
    lblERServer: TLabel;
    lblERPort: TLabel;
    lblLPUServer: TLabel;
    lblLPUPort: TLabel;
    lbl7: TLabel;
    lblInsState: TLabel;
    lbl9: TLabel;
    lblERState: TLabel;
    lbl11: TLabel;
    lblLPUState: TLabel;
    grp2: TGroupBox;
    mmoInstructor: TMemo;
    lbl8: TLabel;
    lbl10: TLabel;
    mm0ER: TMemo;
    lbl12: TLabel;
    mmoCtrl: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure UpdateClientsInfo(aServer : TTCPServer);
    procedure EventPropIntChange(Sender : TObject; PropsID : E_PropsID; Value : Integer);
    procedure EventPropObjChange(Sender : TObject; PropsID : E_PropsID; Value : TObject);
  public
    { Public declarations }
  end;

var
  frmNetStatus: TfrmNetStatus;

implementation

uses
  uSetting, uNetworkManager, uInstructorSystem, uERSystem, uListener,
    uControllerSystem;

{$R *.dfm}

procedure TfrmNetStatus.EventPropIntChange(Sender: TObject; PropsID: E_PropsID;
  Value: Integer);
begin
  if not (Sender is TNetworkManager) then Exit;

  case PropsID of
    epNetworkStart :
      if Assigned(TNetworkManager(Sender).AsServer) then
      begin
        if TNetworkManager(Sender).AsServer.SocketIdentifier = 'AsControllerServer' then
          lblLPUState.Caption := 'Started'
        else
        if TNetworkManager(Sender).AsServer.SocketIdentifier = 'AsSimulatorServer' then
          lblERState.Caption := 'Started'
        else
        if TNetworkManager(Sender).AsServer.SocketIdentifier = 'AsInstructorServer' then
          lblInsState.Caption := 'Started'
      end;
    epNetworkStop :
      if Assigned(TNetworkManager(Sender).AsServer) then
      begin
        if TNetworkManager(Sender).AsServer.SocketIdentifier = 'AsControllerServer' then
          lblLPUState.Caption := 'Stopped'
        else
        if TNetworkManager(Sender).AsServer.SocketIdentifier = 'AsSimulatorServer' then
          lblERState.Caption := 'Stopped'
        else
        if TNetworkManager(Sender).AsServer.SocketIdentifier = 'AsInstructorServer' then
          lblInsState.Caption := 'Stopped'
      end;
  end;
end;

procedure TfrmNetStatus.EventPropObjChange(Sender: TObject; PropsID: E_PropsID;
  Value: TObject);
begin
  case PropsID of
    epNetworkClientConnect, epNetworkClientDisconnect :
      if Value is TTCPServer then
        UpdateClientsInfo(TTCPServer(Value))
  end;
end;

procedure TfrmNetStatus.FormCreate(Sender: TObject);
begin
  lblInsHost.Caption := Setting.InstructorHost;
  lblInsPort.Caption := Setting.InstructorPort;

  lblERServer.Caption := Setting.SimEngineServer;
  lblERPort.Caption   := Setting.SimEnginePort;

  lblLPUServer.Caption := Setting.LPUServer;
  lblLPUPort.Caption   := Setting.LPUPort;


  with InstructorSys.Network.Listeners.Add('NetworkStatus') as TPropertyEventListener do begin
    OnPropertyIntChange := EventPropIntChange;
    OnPropertyObjectChange :=  EventPropObjChange;
  end;

  with ERSystem.Network.Listeners.Add('NetworkStatus') as TPropertyEventListener do begin
    OnPropertyIntChange := EventPropIntChange;
    OnPropertyObjectChange :=  EventPropObjChange;
  end;

  with CtrlSystem.Network.Listeners.Add('NetworkStatus') as TPropertyEventListener do begin
    OnPropertyIntChange := EventPropIntChange;
    OnPropertyObjectChange :=  EventPropObjChange;
  end;
end;

procedure TfrmNetStatus.UpdateClientsInfo;
var
  i : integer;
begin
  with TTCPServer(aServer) do begin

    if SocketIdentifier = 'AsInstructorServer' then begin
      mmoInstructor.Lines.Clear;
      for i := 0 to ClientCount - 1 do begin
        mmoInstructor.Lines.Add(Clients[i].ConnectedIP);
      end;
    end;
    if SocketIdentifier = 'AsSimulatorServer' then begin
      mm0ER.Lines.Clear;
      for i := 0 to ClientCount - 1 do begin
        mm0ER.Lines.Add(Clients[i].ConnectedIP);
      end;
    end;
    if SocketIdentifier = 'AsControllerServer' then begin
      mmoCtrl.Lines.Clear;
      for i := 0 to ClientCount - 1 do begin
        mmoCtrl.Lines.Add(Clients[i].ConnectedIP);
      end;
    end;
  end;

end;

end.
