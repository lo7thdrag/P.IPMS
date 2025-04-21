program MainEngine2;

uses
  Vcl.Forms,
  ufrmMenu in 'D:\Backup IPMS\ufrmMenu.pas' {frmMenu},
  ufrmGeneralScreen in 'D:\Backup IPMS\ufrmGeneralScreen.pas' {frmGeneralScreen},
  ufrmClutchingAssitance in 'D:\Backup IPMS\ufrmClutchingAssitance.pas' {frmClutchingAssistance},
  ufrmPLCNetwork in 'D:\Backup IPMS\ufrmPLCNetwork.pas' {frmPLCNetwork},
  ufrmLubOilCircuit in 'D:\Backup IPMS\ufrmLubOilCircuit.pas' {frmLubOilCircuit},
  ufrmFuelOilCircuit in 'D:\Backup IPMS\ufrmFuelOilCircuit.pas' {frmFuelOilCircuit},
  ufrmFWSeaWaterCircuit in 'D:\Backup IPMS\ufrmFWSeaWaterCircuit.pas' {frmFWSeaWaterCircuit},
  ufrmAirGasCircuit in 'D:\Backup IPMS\ufrmAirGasCircuit.pas' {frmAirGasCircuit},
  ufrmEngineBearingTemperature in 'D:\Backup IPMS\ufrmEngineBearingTemperature.pas' {frmEngineBearingTemperature},
  ufrmCrankinOilTemperature in 'D:\Backup IPMS\ufrmCrankinOilTemperature.pas' {frmCrankpinOilTemperature},
  ufrmPCOTFilteringDeviations in 'D:\Backup IPMS\ufrmPCOTFilteringDeviations.pas' {frmPCOTFilteringDeviations},
  ufrmLineAExhaustGasTemperature in 'D:\Backup IPMS\ufrmLineAExhaustGasTemperature.pas' {frmLineAExhaustGasTemperature},
  ufrmLineBExhaustGasTemperature in 'D:\Backup IPMS\ufrmLineBExhaustGasTemperature.pas' {frmLineBExhaustGasTemperature},
  ufrmSafetiesStop in 'D:\Backup IPMS\ufrmSafetiesStop.pas' {frmSafetiesStop},
  ufrmCompressedAirCircuit in 'D:\Backup IPMS\ufrmCompressedAirCircuit.pas' {frmCompressedAirCircuit},
  ufrmSetofPressureGaugesME2 in 'ufrmSetofPressureGaugesME2.pas' {frmSetofPressureGaugesME2},
  ufrmSignalingLightME2 in 'ufrmSignalingLightME2.pas' {frmSignalingLightME2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMenu, frmMenu);
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
  Application.CreateForm(TfrmSetofPressureGaugesME2, frmSetofPressureGaugesME2);
  Application.CreateForm(TfrmSignalingLightME2, frmSignalingLightME2);
  Application.Run;
end.
