program DieselGenerator;

uses
  Vcl.Forms,
  uMainForm in 'uMainForm.pas' {MainForm},
  uDieselGeneratorNetwork in 'uDieselGeneratorNetwork.pas',
  uDieselGeneratorSystem in 'uDieselGeneratorSystem.pas',
  uDataBuffer in '..\network\uDataBuffer.pas',
  uNetBaseSocket in '..\network\uNetBaseSocket.pas',
  uNetworkManager in '..\network\uNetworkManager.pas',
  uPacketRegister in '..\network\uPacketRegister.pas',
  uTCPClient in '..\network\uTCPClient.pas',
  uTCPDatatype in '..\network\uTCPDatatype.pas',
  uTCPServer in '..\network\uTCPServer.pas',
  uSteppers in '..\framework\LibBaseUtils\Counter\uSteppers.pas',
  uThreadTimer in '..\framework\LibBaseUtils\Counter\uThreadTimer.pas',
  uVirtualTime in '..\framework\LibBaseUtils\Counter\uVirtualTime.pas',
  uDataType in '..\common\uDataType.pas',
  uFreezeFrom in '..\common\uFreezeFrom.pas' {frmFreeze},
  uFunction in '..\common\uFunction.pas',
  uListener in '..\common\uListener.pas',
  uSetting in '..\common\uSetting.pas',
  uNetworkManagerTimer in '..\network\uNetworkManagerTimer.pas',
  uConsumption in '..\engines\entity\uConsumption.pas',
  uEntity in '..\engines\entity\uEntity.pas',
  uGenerator in '..\engines\entity\uGenerator.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TfrmFreeze, frmFreeze);
  Application.Run;
end.
