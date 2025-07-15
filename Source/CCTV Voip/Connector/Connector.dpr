program Connector;

uses
  Forms,
  uMain in 'uMain.pas' {fConnectorFrm},
  uDataVoipRecord in '..\DataRecordType\uDataVoipRecord.pas',
  Logger in '..\LibUnit\Logger.pas',
  uLoadSetting in '..\LibUnit\uLoadSetting.pas',
  uThreadTimer in '..\LibUnit\uThreadTimer.pas',
  uFastLogger in '..\Common\uFastLogger.pas',
  uDataBuffer in '..\SharedNetworkLib\uDataBuffer.pas',
  uNetBaseSocket in '..\SharedNetworkLib\uNetBaseSocket.pas',
  uNetUDPnode in '..\SharedNetworkLib\uNetUDPnode.pas',
  uPacketBuffer in '..\SharedNetworkLib\uPacketBuffer.pas',
  uPacketRegister in '..\SharedNetworkLib\uPacketRegister.pas',
  uSockDatatype in '..\SharedNetworkLib\uSockDatatype.pas',
  uTCPClient in '..\SharedNetworkLib\uTCPClient.pas',
  uTCPDatatype in '..\SharedNetworkLib\uTCPDatatype.pas',
  uTCPServer in '..\SharedNetworkLib\uTCPServer.pas',
  uDevErrMsg in 'uDevErrMsg.pas' {frmDeviceFailedMsg};

{$R *.res}

begin
  Application.Initialize;
  Application.ShowMainForm := False;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfConnectorFrm, fConnectorFrm);
  Application.CreateForm(TfrmDeviceFailedMsg, frmDeviceFailedMsg);
  Application.Run;
end.

