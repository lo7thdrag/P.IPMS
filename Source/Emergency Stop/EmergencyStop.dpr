program EmergencyStop;

uses
  Forms,
  uEmergencyStop in 'uEmergencyStop.pas' {frmEmergencyStop},
  uSetting in '..\common\uSetting.pas',
  uDataType in '..\common\uDataType.pas',
  uEmergencyStopSystem in 'uEmergencyStopSystem.pas',
  uEmergencyStopNetwork in 'uEmergencyStopNetwork.pas',
  uEmergencyStopManager in 'uEmergencyStopManager.pas',
  uDataBuffer in '..\network\uDataBuffer.pas',
  uNetBaseSocket in '..\network\uNetBaseSocket.pas',
  uNetworkManager in '..\network\uNetworkManager.pas',
  uPacketRegister in '..\network\uPacketRegister.pas',
  uTCPClient in '..\network\uTCPClient.pas',
  uTCPDatatype in '..\network\uTCPDatatype.pas',
  uTCPServer in '..\network\uTCPServer.pas',
  uConsumption in '..\engines\entity\uConsumption.pas',
  uEntity in '..\engines\entity\uEntity.pas',
  uGenerator in '..\engines\entity\uGenerator.pas',
  uSwitchboard in '..\engines\entity\uSwitchboard.pas',
  uPMSDataElement in '..\common\uPMSDataElement.pas',
  uCommonSystem in '..\engines\system\uCommonSystem.pas',
  uPMSSystem in '..\engines\system\uPMSSystem.pas',
  uFunction in '..\common\uFunction.pas',
  uListener in '..\common\uListener.pas',
  uSteppers in '..\framework\LibBaseUtils\Counter\uSteppers.pas',
  uThreadTimer in '..\framework\LibBaseUtils\Counter\uThreadTimer.pas',
  uVirtualTime in '..\framework\LibBaseUtils\Counter\uVirtualTime.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  Setting := TSetting.Create;
  EmergencyStopSystem := TEmergencyStopSystem.Create;

  Application.CreateForm(TfrmEmergencyStop, frmEmergencyStop);
  Application.Run;
end.
