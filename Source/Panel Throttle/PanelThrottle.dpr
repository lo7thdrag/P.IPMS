program PanelThrottle;

uses
  Forms,
  uPanelThrottle in 'uPanelThrottle.pas' {frmPanelThrottle},
  uPanelThrottleSystem in 'uPanelThrottleSystem.pas',
  uPanelThrottleNetwork in 'uPanelThrottleNetwork.pas',
  uPanelThrottleManager in 'uPanelThrottleManager.pas',
  uEntity in '..\engines\entity\uEntity.pas',
  uListener in '..\common\uListener.pas',
  uDataType in '..\common\uDataType.pas',
  uTCPDatatype in '..\network\uTCPDatatype.pas',
  uConsumption in '..\engines\entity\uConsumption.pas',
  uCommonSystem in '..\engines\system\uCommonSystem.pas',
  uTCPClient in '..\network\uTCPClient.pas',
  uDataBuffer in '..\network\uDataBuffer.pas',
  uPacketRegister in '..\network\uPacketRegister.pas',
  uNetBaseSocket in '..\network\uNetBaseSocket.pas',
  uNetworkManager in '..\network\uNetworkManager.pas',
  uSteppers in '..\framework\LibBaseUtils\Counter\uSteppers.pas',
  uThreadTimer in '..\framework\LibBaseUtils\Counter\uThreadTimer.pas',
  uVirtualTime in '..\framework\LibBaseUtils\Counter\uVirtualTime.pas',
  uTCPServer in '..\network\uTCPServer.pas',
  uSetting in '..\common\uSetting.pas',
  uFunction in '..\common\uFunction.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  Setting := TSetting.Create;
  ShipAlarmSystem := TShipAlarmSystem.Create;

  Application.CreateForm(TfrmPanelThrottle, frmPanelThrottle);
  Application.Run;
end.
