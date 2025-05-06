program MCRMachineRight;

uses
  Vcl.Forms,
  uMainForm in 'uMainForm.pas' {MainForm},
  uDataType in '..\common\uDataType.pas',
  uFreezeFrom in '..\common\uFreezeFrom.pas' {frmFreeze},
  uFunction in '..\common\uFunction.pas',
  uListener in '..\common\uListener.pas',
  uSetting in '..\common\uSetting.pas',
  uSteppers in '..\framework\LibBaseUtils\Counter\uSteppers.pas',
  uThreadTimer in '..\framework\LibBaseUtils\Counter\uThreadTimer.pas',
  uVirtualTime in '..\framework\LibBaseUtils\Counter\uVirtualTime.pas',
  uDataBuffer in '..\network\uDataBuffer.pas',
  uNetBaseSocket in '..\network\uNetBaseSocket.pas',
  uNetworkManager in '..\network\uNetworkManager.pas',
  uPacketRegister in '..\network\uPacketRegister.pas',
  uTCPClient in '..\network\uTCPClient.pas',
  uTCPDatatype in '..\network\uTCPDatatype.pas',
  uTCPServer in '..\network\uTCPServer.pas',
  uMCRMachineRightNetwork in 'uMCRMachineRightNetwork.pas',
  uMCRMachineRightSystem in 'uMCRMachineRightSystem.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  Setting := TSetting.Create;
  MCRMachineRightSystem := TMCRMachineRightSystem.Create;

  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TfrmFreeze, frmFreeze);
  Application.Run;
end.
