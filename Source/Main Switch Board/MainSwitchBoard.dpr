program MainSwitchBoard;

uses
  Vcl.Forms,
  uMainForm in 'uMainForm.pas' {frmMainForm},
  ufrmGeneratorPanel in 'ufrmGeneratorPanel.pas' {frmGeneratorPanel},
  ufrmEmergencyPanel in 'ufrmEmergencyPanel.pas' {frmEmergencyPanel},
  ufrmShorePanel in 'ufrmShorePanel.pas' {frmShorePanel},
  uMainSwitchBoardNetwork in 'uMainSwitchBoardNetwork.pas',
  uMainSwitchBoardSystem in 'uMainSwitchBoardSystem.pas',
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
  uGenerator in '..\engines\entity\uGenerator.pas',
  uEntity in '..\engines\entity\uEntity.pas',
  uConsumption in '..\engines\entity\uConsumption.pas',
  uNetworkManagerTimer in '..\network\uNetworkManagerTimer.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown:= True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

//  Setting   := TSetting.Create;
//  MainSwitchBoardSystem := TMainSwitchBoardSystem.Create;

  Application.CreateForm(TfrmMainForm, frmMainForm);
  //  Application.CreateForm(TfrmGeneratorPanel, frmGeneratorPanel);
//  Application.CreateForm(TfrmEmergencyPanel, frmEmergencyPanel);
//  Application.CreateForm(TfrmShorePanel, frmShorePanel);
//  Application.CreateForm(TfrmFreeze, frmFreeze);
  Application.Run;
end.
