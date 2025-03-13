program AlarmRudder;

uses
  Forms,
  uShipAlarm in 'uShipAlarm.pas' {frmShipAlarm},
  uShipAlarmSystem in 'uShipAlarmSystem.pas',
  uEntity in '..\engines\entity\uEntity.pas',
  uConsumption in '..\engines\entity\uConsumption.pas',
  uListener in '..\common\uListener.pas',
  uDataType in '..\common\uDataType.pas',
  uTCPDatatype in '..\network\uTCPDatatype.pas',
  uCommonSystem in '..\engines\system\uCommonSystem.pas',
  uTCPClient in '..\network\uTCPClient.pas',
  uDataBuffer in '..\network\uDataBuffer.pas',
  uPacketRegister in '..\network\uPacketRegister.pas',
  uNetBaseSocket in '..\network\uNetBaseSocket.pas',
  uShipAlarmNetwork in 'uShipAlarmNetwork.pas',
  uShipAlarmManager in 'uShipAlarmManager.pas',
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

  Application.CreateForm(TfrmShipAlarm, frmShipAlarm);
  Application.Run;
end.
