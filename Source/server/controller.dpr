program controller;

uses
  Forms,
  uMainForm in 'uMainForm.pas' {MainForm},
  uAAE in '..\elements\uAAE.pas',
  uCBA in '..\elements\uCBA.pas',
  uCBE in '..\elements\uCBE.pas',
  uCTR in '..\elements\uCTR.pas',
  uDAE in '..\elements\uDAE.pas',
  uElement in '..\elements\uElement.pas',
  uElementController in '..\elements\uElementController.pas',
  uMCD in '..\elements\uMCD.pas',
  uMCE in '..\elements\uMCE.pas',
  uMCS in '..\elements\uMCS.pas',
  uRHE in '..\elements\uRHE.pas',
  uSAE in '..\elements\uSAE.pas',
  uSEE in '..\elements\uSEE.pas',
  uSPE in '..\elements\uSPE.pas',
  uSS1 in '..\elements\uSS1.pas',
  uSS2 in '..\elements\uSS2.pas',
  uSSE in '..\elements\uSSE.pas',
  uSSL in '..\elements\uSSL.pas',
  uSWB in '..\elements\uSWB.pas',
  uSWE in '..\elements\uSWE.pas',
  uSWN in '..\elements\uSWN.pas',
  uVCE in '..\elements\uVCE.pas',
  uVCH in '..\elements\uVCH.pas',
  uVCP in '..\elements\uVCP.pas',
  uDatabase in '..\common\uDatabase.pas',
  uDataType in '..\common\uDataType.pas',
  uSetting in '..\common\uSetting.pas',
  uFunction in '..\common\uFunction.pas',
  uControllerSystem in 'uControllerSystem.pas',
  uListener in '..\common\uListener.pas',
  uControllerManager in 'uControllerManager.pas',
  uElementTesterForm in 'tester\uElementTesterForm.pas' {frmTester},
  uAAETestForm in 'tester\uAAETestForm.pas' {frmAAETest},
  uElementTestForm in 'tester\uElementTestForm.pas' {frmElementTest},
  uNetBaseSocket in '..\network\uNetBaseSocket.pas',
  uPacketRegister in '..\network\uPacketRegister.pas',
  uTCPDatatype in '..\network\uTCPDatatype.pas',
  uTCPClient in '..\network\uTCPClient.pas',
  uTCPServer in '..\network\uTCPServer.pas',
  uDataBuffer in '..\network\uDataBuffer.pas',
  uControllerNetwork in 'uControllerNetwork.pas',
  uNetworkManager in '..\network\uNetworkManager.pas',
  uThreadTimer in '..\framework\LibBaseUtils\Counter\uThreadTimer.pas',
  uVirtualTime in '..\framework\LibBaseUtils\Counter\uVirtualTime.pas',
  uSteppers in '..\framework\LibBaseUtils\Counter\uSteppers.pas',
  uSAETestForm in 'tester\uSAETestForm.pas' {frmSAETest},
  uSEETestForm in 'tester\uSEETestForm.pas' {frmSEETest},
  uSPETestForm in 'tester\uSPETestForm.pas' {frmSPETest},
  uSS1TestForm in 'tester\uSS1TestForm.pas' {frmSS1Test},
  uSS2TestForm in 'tester\uSS2TestForm.pas' {frmSS2Test},
  uSSETestForm in 'tester\uSSETestForm.pas' {frmSSETest},
  uSSLTestForm in 'tester\uSSLTestForm.pas' {frmSSLTest},
  uSWBTestForm in 'tester\uSWBTestForm.pas' {frmSWBTest},
  uSWETestForm in 'tester\uSWETestForm.pas' {frmSWETest},
  uSWNTestForm in 'tester\uSWNTestForm.pas' {frmSWNTest},
  uVCETestForm in 'tester\uVCETestForm.pas' {frmVCETest},
  uVCHTestform in 'tester\uVCHTestform.pas' {frmVCHTest},
  uVCPTestForm in 'tester\uVCPTestForm.pas' {frmVCPTest},
  uCBATestForm in 'tester\uCBATestForm.pas' {frmCBATest},
  uCBETestForm in 'tester\uCBETestForm.pas' {frmCBETest},
  uCTRTestForm in 'tester\uCTRTestForm.pas' {frmCTRTest},
  uDAETestForm in 'tester\uDAETestForm.pas' {frmDAETest},
  uMCDTestForm in 'tester\uMCDTestForm.pas' {frmMCDTest},
  uMCETestForm in 'tester\uMCETestForm.pas' {frmMCETest},
  uMCSTestForm in 'tester\uMCSTestForm.pas' {frmMCSTest},
  uRHEtestForm in 'tester\uRHEtestForm.pas' {frmRHETest},
  uPMSDataElement in '..\common\uPMSDataElement.pas',
  uDBSupportClasses in '..\common\uDBSupportClasses.pas',
  uElementTables in '..\elements\uElementTables.pas',
  uPCSDataElement in '..\common\uPCSDataElement.pas',
  uTrendDataType in '..\components\TrendChart\uTrendDataType.pas',
  uBaseComponent in '..\components\uBaseComponent.pas',
  uIPMS_Data in '..\components\uIPMS_Data.pas',
  uSetpoint in '..\components\uSetpoint.pas',
  uShortcut in '..\components\uShortcut.pas',
  uSwitchElement in '..\components\uSwitchElement.pas',
  uSwitchEvent in '..\components\uSwitchEvent.pas',
  uSwitchNBCD in '..\components\uSwitchNBCD.pas',
  uSwitchTriangle in '..\components\uSwitchTriangle.pas',
  uTankSensor in '..\components\uTankSensor.pas',
  uValveControl in '..\components\uValveControl.pas',
  uValveProportionally in '..\components\uValveProportionally.pas',
  uVerticalBar in '..\components\uVerticalBar.pas',
  uAnalogSensor in '..\components\uAnalogSensor.pas',
  uCircuitBreakerElement in '..\components\uCircuitBreakerElement.pas',
  uComputer in '..\components\uComputer.pas',
  uControlElement in '..\components\uControlElement.pas',
  uHorizontalBar in '..\components\uHorizontalBar.pas',
  uMotorControlDoubleSpeed in '..\components\uMotorControlDoubleSpeed.pas',
  uMotorControlElement in '..\components\uMotorControlElement.pas',
  uMotorControlStandby in '..\components\uMotorControlStandby.pas',
  uRunningHour in '..\components\uRunningHour.pas',
  uTrendData in '..\components\TrendChart\uTrendData.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  Setting   := TSetting.Create;
  CtrlSystem := TControllerlSystem.Create;

  Application.CreateForm(TMainForm, MainForm);
  Application.Run;

  CtrlSystem.Free;
end.
