program Auxilary;

uses
  Vcl.Forms,
  uMainForm in 'uMainForm.pas' {frmAuxBallastnBilgePump},
  uAuxiliaryNetwork in 'uAuxiliaryNetwork.pas',
  uAuxiliarySystem in 'uAuxiliarySystem.pas',
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
  ufrmBallastnBilgePump in 'Form\ufrmBallastnBilgePump.pas' {frmBallastnBilgePump},
  ufrmFireFightingPump2 in 'Form\ufrmFireFightingPump2.pas' {frmFireFightingPump2},
  ufrmSWPumpProvRefrig2 in 'Form\ufrmSWPumpProvRefrig2.pas' {frmSWPumpProvRefrig2},
  ufrmSludge in 'Form\ufrmSludge.pas' {frmSludge},
  ufrmSWCoolingPumpChiller1 in 'Form\ufrmSWCoolingPumpChiller1.pas' {frmSWCoolingPumpChiller1},
  ufrmSWPumpProvRefrig1 in 'Form\ufrmSWPumpProvRefrig1.pas' {frmSWPumpProvRefrig1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  Setting   := TSetting.Create;
  AuxiliarySystem := TAuxiliarySystem.Create;

  Application.CreateForm(TfrmMainForm, frmMainForm);
  Application.CreateForm(TfrmFreeze, frmFreeze);
  Application.Run;
end.
