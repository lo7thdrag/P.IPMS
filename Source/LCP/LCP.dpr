program LCP;

uses
  Forms,
  uLCPPanel in 'uLCPPanel.pas' {frmLCPPanel},
  uGaugeLCP in 'uGaugeLCP.pas' {frmGaugeLCP},
  uSignalAndButton in 'uSignalAndButton.pas' {frmSignalAndButton},
  uTimerAndSwitch in 'uTimerAndSwitch.pas' {frmTimerAndSwitch},
  uHMIGenScreen in 'HMI\uHMIGenScreen.pas' {frmHMIGenScreen},
  uHMILubOilCircuit in 'HMI\uHMILubOilCircuit.pas' {frmHMILubOilCircuit},
  uHMIAirAndGas in 'HMI\uHMIAirAndGas.pas' {frmHMIAIrAndGas},
  uHMIFWAndSeaWater in 'HMI\uHMIFWAndSeaWater.pas' {frmHMISeaWater},
  uHMILineExhaustGasTemp in 'HMI\uHMILineExhaustGasTemp.pas' {frmLineGasTemp},
  uLineExCont in 'HMI\uLineExCont.pas' {Form8},
  uHMICrankcaseOilTemp in 'HMI\uHMICrankcaseOilTemp.pas' {frmCrankOilTemp},
  uHMISafeStopAndStartInter in 'HMI\uHMISafeStopAndStartInter.pas' {frmHMISafeStopAndStartingInter},
  uHMIClutchAssist in 'HMI\uHMIClutchAssist.pas' {frmHMIClutchingAssist},
  uHMIGearBox in 'HMI\uHMIGearBox.pas' {frmHMIGearBox},
  uHMIDieselGearTemp in 'HMI\uHMIDieselGearTemp.pas' {frmHMIDieselGear},
  uHMIAlarms in 'HMI\uHMIAlarms.pas' {frmHMIAlarms},
  uHMILCP in 'uHMILCP.pas' {frmHMILCP},
  uHMIMenu in 'HMI\uHMIMenu.pas' {frmHMIMenu},
  uDataType in '..\common\uDataType.pas',
  uTCPDatatype in '..\network\uTCPDatatype.pas',
  uLCPManager in 'uLCPManager.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLCPPanel, frmLCPPanel);
  Application.CreateForm(TfrmGaugeLCP, frmGaugeLCP);
  Application.CreateForm(TfrmSignalAndButton, frmSignalAndButton);
  Application.CreateForm(TfrmTimerAndSwitch, frmTimerAndSwitch);
  Application.CreateForm(TfrmHMIGenScreen, frmHMIGenScreen);
  Application.CreateForm(TfrmHMILubOilCircuit, frmHMILubOilCircuit);
  Application.CreateForm(TfrmHMIAIrAndGas, frmHMIAIrAndGas);
  Application.CreateForm(TfrmHMISeaWater, frmHMISeaWater);
  Application.CreateForm(TfrmLineGasTemp, frmLineGasTemp);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TfrmCrankOilTemp, frmCrankOilTemp);
  Application.CreateForm(TfrmHMISafeStopAndStartingInter, frmHMISafeStopAndStartingInter);
  Application.CreateForm(TfrmHMIClutchingAssist, frmHMIClutchingAssist);
  Application.CreateForm(TfrmHMIGearBox, frmHMIGearBox);
  Application.CreateForm(TfrmHMIDieselGear, frmHMIDieselGear);
  Application.CreateForm(TfrmHMIAlarms, frmHMIAlarms);
  Application.CreateForm(TfrmHMILCP, frmHMILCP);
//  Application.CreateForm(TfrmHMIMenu, frmHMIMenu);
  Application.Run;
end.
