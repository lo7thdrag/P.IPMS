program ACS;

uses
  Forms,
  uPitchRoll in 'uPitchRoll.pas' {frmPitchRoll},
  uAlarm in 'uAlarm.pas' {fAlarm},
  uFormUtil in 'uFormUtil.pas',
  uAlarmManager in 'uAlarmManager.pas',
  uListener in '..\common\uListener.pas',
  uAlarmNetwork in 'uAlarmNetwork.pas',
  uAlarmSystem in 'uAlarmSystem.pas',
  uDataType in '..\common\uDataType.pas',
  uDBSupportClasses in '..\common\uDBSupportClasses.pas',
  uFunction in '..\common\uFunction.pas',
  uSetting in '..\common\uSetting.pas',
  uPacketRegister in '..\network\uPacketRegister.pas',
  uTCPClient in '..\network\uTCPClient.pas',
  uTCPDatatype in '..\network\uTCPDatatype.pas',
  uTCPServer in '..\network\uTCPServer.pas',
  uDataBuffer in '..\network\uDataBuffer.pas',
  uNetBaseSocket in '..\network\uNetBaseSocket.pas',
  uNetworkManager in '..\network\uNetworkManager.pas',
  uSteppers in '..\framework\LibBaseUtils\Counter\uSteppers.pas',
  uThreadTimer in '..\framework\LibBaseUtils\Counter\uThreadTimer.pas',
  uVirtualTime in '..\framework\LibBaseUtils\Counter\uVirtualTime.pas',
  uDatabase in '..\common\uDatabase.pas',
  uDataACS in 'uDataACS.pas',
  uElementTables in '..\elements\uElementTables.pas',
  uTrendDataType in '..\components\TrendChart\uTrendDataType.pas',
  uIPMS_Data in '..\components\uIPMS_Data.pas',
  uBaseComponent in '..\components\uBaseComponent.pas',
  uAnalogSensor in '..\components\uAnalogSensor.pas',
  uCircuitBreakerElement in '..\components\uCircuitBreakerElement.pas',
  uComputer in '..\components\uComputer.pas',
  uControlElement in '..\components\uControlElement.pas',
  uHorizontalBar in '..\components\uHorizontalBar.pas',
  uMotorControlDoubleSpeed in '..\components\uMotorControlDoubleSpeed.pas',
  uMotorControlElement in '..\components\uMotorControlElement.pas',
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
  uTrendData in '..\components\TrendChart\uTrendData.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  SysAlarm := TAlarmSystem.Create;

  Application.CreateForm(TfAlarm, fAlarm);
  fAlarm.SetMonitor;

  SysAlarm.Network.StartNetwork;

//  Application.CreateForm(TfrmPitchRoll, frmPitchRoll);
  Application.Run;

end.
