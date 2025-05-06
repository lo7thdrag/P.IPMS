program MainEngine2;

uses
  Vcl.Forms,
  ufrmSetofPressureGaugesME2 in 'ufrmSetofPressureGaugesME2.pas' {frmSetofPressureGaugesME2},
  ufrmSignalingLightME2 in 'ufrmSignalingLightME2.pas' {frmSignalingLightME2},
  ufrmAirGasCircuit in 'HMI Safeties\ufrmAirGasCircuit.pas' {frmAirGasCircuit},
  ufrmClutchingAssitance in 'HMI Safeties\ufrmClutchingAssitance.pas' {frmClutchingAssistance},
  ufrmCompressedAirCircuit in 'HMI Safeties\ufrmCompressedAirCircuit.pas' {frmCompressedAirCircuit},
  ufrmCrankinOilTemperature in 'HMI Safeties\ufrmCrankinOilTemperature.pas' {frmCrankpinOilTemperature},
  ufrmEngineBearingTemperature in 'HMI Safeties\ufrmEngineBearingTemperature.pas' {frmEngineBearingTemperature},
  ufrmFuelOilCircuit in 'HMI Safeties\ufrmFuelOilCircuit.pas' {frmFuelOilCircuit},
  ufrmFWSeaWaterCircuit in 'HMI Safeties\ufrmFWSeaWaterCircuit.pas' {frmFWSeaWaterCircuit},
  ufrmGeneralScreen in 'HMI Safeties\ufrmGeneralScreen.pas' {frmGeneralScreen},
  ufrmLineAExhaustGasTemperature in 'HMI Safeties\ufrmLineAExhaustGasTemperature.pas' {frmLineAExhaustGasTemperature},
  ufrmLineBExhaustGasTemperature in 'HMI Safeties\ufrmLineBExhaustGasTemperature.pas' {frmLineBExhaustGasTemperature},
  ufrmLubOilCircuit in 'HMI Safeties\ufrmLubOilCircuit.pas' {frmLubOilCircuit},
  ufrmMenu in 'HMI Safeties\ufrmMenu.pas' {frmMenu},
  ufrmPCOTFilteringDeviations in 'HMI Safeties\ufrmPCOTFilteringDeviations.pas' {frmPCOTFilteringDeviations},
  ufrmPLCNetwork in 'HMI Safeties\ufrmPLCNetwork.pas' {frmPLCNetwork},
  ufrmSafetiesStop in 'HMI Safeties\ufrmSafetiesStop.pas' {frmSafetiesStop},
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
  uMainEngine2Network in 'uMainEngine2Network.pas',
  uMainEngine2System in 'uMainEngine2System.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  Setting   := TSetting.Create;
  MainEngine2System := TMainEngine2System.Create;

  Application.CreateForm(TfrmSetofPressureGaugesME2, frmSetofPressureGaugesME2);
  frmSetofPressureGaugesME2.Show;
  Application.CreateForm(TfrmSignalingLightME2, frmSignalingLightME2);
  frmSignalingLightME2.Show;
  Application.CreateForm(TfrmMenu, frmMenu);
  frmMenu.Show;
  Application.CreateForm(TfrmGeneralScreen, frmGeneralScreen);
  Application.CreateForm(TfrmClutchingAssistance, frmClutchingAssistance);
  Application.CreateForm(TfrmPLCNetwork, frmPLCNetwork);
  Application.CreateForm(TfrmLubOilCircuit, frmLubOilCircuit);
  Application.CreateForm(TfrmFuelOilCircuit, frmFuelOilCircuit);
  Application.CreateForm(TfrmFWSeaWaterCircuit, frmFWSeaWaterCircuit);
  Application.CreateForm(TfrmAirGasCircuit, frmAirGasCircuit);
  Application.CreateForm(TfrmEngineBearingTemperature, frmEngineBearingTemperature);
  Application.CreateForm(TfrmCrankpinOilTemperature, frmCrankpinOilTemperature);
  Application.CreateForm(TfrmPCOTFilteringDeviations, frmPCOTFilteringDeviations);
  Application.CreateForm(TfrmLineAExhaustGasTemperature, frmLineAExhaustGasTemperature);
  Application.CreateForm(TfrmLineBExhaustGasTemperature, frmLineBExhaustGasTemperature);
  Application.CreateForm(TfrmSafetiesStop, frmSafetiesStop);
  Application.CreateForm(TfrmCompressedAirCircuit, frmCompressedAirCircuit);
  Application.CreateForm(TfrmFreeze, frmFreeze);
  Application.Run;
end.
