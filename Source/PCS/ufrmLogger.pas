unit ufrmLogger;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uDataType, ComCtrls, ExtCtrls;

type
  TfrmLogs = class(TForm)
    pgcLogger: TPageControl;
    tsNetwork: TTabSheet;
    mmoNetLogs: TMemo;
    pnlInfo: TPanel;
    lblAsLPUClient: TLabel;
    lblAsVREngineClient: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

    procedure LoggerEvent(Sender : TObject;aPropID : E_PropsID;Value : string);overload;
    procedure LoggerEvent(Sender : TObject;aPropID : E_PropsID;Value : TObject);overload;
  public
    { Public declarations }
  end;

var
  frmLogs: TfrmLogs;

implementation

uses uPCSSystem, uListener,uNetBaseSocket,uTCPClient;

{$R *.dfm}

procedure TfrmLogs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caHide;
end;

procedure TfrmLogs.FormCreate(Sender: TObject);
begin
  with PCSSystem.Network.Listeners.Add('Logger') as TPropertyEventListener do begin
    OnPropertyStringChange := LoggerEvent;
    OnPropertyObjectChange := LoggerEvent;
  end;
end;

procedure TfrmLogs.LoggerEvent(Sender: TObject; aPropID: E_PropsID;
  Value: TObject);
begin
  case aPropID of
    epNetworkConnectedToServer  :
    begin
      if TTCPClient(Value).SocketIdentifier = 'AsControllerClient' then
        lblAsLPUClient.Caption := 'AsControllerClient : Connected to ' + TTCPClient(Value).ServerAddress;

      if TTCPClient(Value).SocketIdentifier = 'AsSimEngineClient' then
        lblAsVREngineClient.Caption := 'AsSimEngineClient : Connected to ' + TTCPClient(Value).ServerAddress;
    end;

    epNetworkDisconnectedFromServer   :
    begin
      if TTCPClient(Value).SocketIdentifier = 'AsControllerClient' then
        lblAsLPUClient.Caption := 'AsControllerClient : Disconnected';

      if TTCPClient(Value).SocketIdentifier = 'AsSimEngineClient' then
        lblAsVREngineClient.Caption := 'AsSimEngineClient : Disconnected';
    end;
  end;
end;

procedure TfrmLogs.LoggerEvent(Sender: TObject; aPropID: E_PropsID;
  Value: string);
begin
//  case aPropID of
//    epNetworkDebugInfo,
//    epSystemDebugInfo   : mmoNetLogs.Lines.Add(Value);
//  end;
end;

end.
