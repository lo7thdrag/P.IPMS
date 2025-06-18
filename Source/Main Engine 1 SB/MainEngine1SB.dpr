program MainEngine1SB;

uses
  Vcl.Forms,
  ufrmPMSDieselEngineSafetiesME1 in 'ufrmPMSDieselEngineSafetiesME1.pas' {frmPMSDieselEngineSafetiesME1},
  ufrmSetofPressureGaugesME1 in 'ufrmSetofPressureGaugesME1.pas' {frmSetofPressureGaugesME1},
  ufrmSignalingLightME1 in 'ufrmSignalingLightME1.pas' {frmSignalingLightME1},
  uMainEngine1Network in 'uMainEngine1Network.pas',
  uMainEngine1System in 'uMainEngine1System.pas',
  uMainForm in 'uMainForm.pas' {frmMainForm},
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
  uTCPServer in '..\network\uTCPServer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  Setting   := TSetting.Create;
  MainEngine1System := TMainEngine1System.Create;

  Application.CreateForm(TfrmMainForm, frmMainForm);

  Application.CreateForm(TfrmSetofPressureGaugesME1, frmSetofPressureGaugesME1);
  frmSetofPressureGaugesME1.Show;
  Application.CreateForm(TfrmSignalingLightME1, frmSignalingLightME1);
  frmSignalingLightME1.Show;
  Application.CreateForm(TfrmPMSDieselEngineSafetiesME1, frmPMSDieselEngineSafetiesME1);
  frmPMSDieselEngineSafetiesME1.Show;
//  Application.CreateForm(TfrmFreeze, frmFreeze);
  Application.Run;
end.
