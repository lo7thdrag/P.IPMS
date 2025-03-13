program ERSimulator;

uses
  Forms,
  ufrmMain in 'ufrmMain.pas' {frmControlPanel},
  uEngineRoom in '..\engines\uEngineRoom.pas',
  uERManager in 'uERManager.pas',
  uThreadTimer in '..\framework\LibBaseUtils\Counter\uThreadTimer.pas',
  uSteppers in '..\framework\LibBaseUtils\Counter\uSteppers.pas',
  uListener in '..\common\uListener.pas',
  uDataType in '..\common\uDataType.pas',
  uCommonSystem in '..\engines\system\uCommonSystem.pas',
  uBallastSystem in '..\engines\system\uBallastSystem.pas',
  uFuelOilSystem in '..\engines\system\uFuelOilSystem.pas',
  uPMSSystem in '..\engines\system\uPMSSystem.pas',
  uEntity in '..\engines\entity\uEntity.pas',
  uGenerator in '..\engines\entity\uGenerator.pas',
  uPump in '..\engines\entity\uPump.pas',
  uTank in '..\engines\entity\uTank.pas',
  uPropulsionSystem in '..\engines\system\uPropulsionSystem.pas',
  uConsumption in '..\engines\entity\uConsumption.pas',
  uFireFightingSystem in '..\engines\system\uFireFightingSystem.pas',
  uNavComSystem in '..\engines\system\uNavComSystem.pas',
  uSeaFWSystem in '..\engines\system\uSeaFWSystem.pas',
  uAuxSystem in '..\engines\system\uAuxSystem.pas',
  uNetBaseSocket in '..\network\uNetBaseSocket.pas',
  uNetworkManager in '..\network\uNetworkManager.pas',
  uPacketRegister in '..\network\uPacketRegister.pas',
  uTCPClient in '..\network\uTCPClient.pas',
  uTCPDatatype in '..\network\uTCPDatatype.pas',
  uERNetwork in 'uERNetwork.pas',
  uSetting in '..\common\uSetting.pas',
  uTCPServer in '..\network\uTCPServer.pas',
  uDataBuffer in '..\network\uDataBuffer.pas',
  uVirtualTime in '..\framework\LibBaseUtils\Counter\uVirtualTime.pas',
  uFunction in '..\common\uFunction.pas',
  uERSystem in 'uERSystem.pas',
  uDatabase in '..\common\uDatabase.pas',
  uBallastSystemPanel in 'panel\uBallastSystemPanel.pas' {frmBallastSystemPanel},
  uPCSLocalControlPanel in 'panel\uPCSLocalControlPanel.pas' {frmPCSLocalControlPanel},
  uSwitchboard in '..\engines\entity\uSwitchboard.pas',
  uDBSupportClasses in '..\common\uDBSupportClasses.pas',
  uCPP in '..\engines\entity\uCPP.pas',
  uGearBox in '..\engines\entity\uGearBox.pas',
  uMainEngine in '..\engines\entity\uMainEngine.pas',
  uPMSSystemPanel in 'panel\uPMSSystemPanel.pas' {frmPMSSystemPanel},
  uElementTables in '..\elements\uElementTables.pas',
  uFreezeFrom in '..\common\uFreezeFrom.pas' {frmFreeze},
  uTrendDataType in '..\components\TrendChart\uTrendDataType.pas',
  uBaseComponent in '..\components\uBaseComponent.pas',
  uIPMS_Data in '..\components\uIPMS_Data.pas',
  uMotorControlStandby in '..\components\uMotorControlStandby.pas',
  uRunningHour in '..\components\uRunningHour.pas',
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
  uTrendData in '..\components\TrendChart\uTrendData.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  Setting   := TSetting.Create;
  ERSystem  := TERSystem.Create;

  Application.CreateForm(TfrmControlPanel, frmControlPanel);
  Application.Run;

  ERSystem.Free;
  Setting.Free;
end.
