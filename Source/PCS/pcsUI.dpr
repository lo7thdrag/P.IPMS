program pcsUI;

uses
  Forms,
  MainForm in 'MainForm.pas' {Form1},
  uPSPanel in 'uPSPanel.pas' {frmPSPanel},
  uSBPanel in 'uSBPanel.pas' {frmSBPanel},
  uGeneralPanel in 'uGeneralPanel.pas' {frm_GeneralPanel},
  uLibPCS in 'uLibPCS.pas',
  uPCSNetwork in 'uPCSNetwork.pas',
  uDataBuffer in '..\network\uDataBuffer.pas',
  uNetBaseSocket in '..\network\uNetBaseSocket.pas',
  uNetworkManager in '..\network\uNetworkManager.pas',
  uPacketRegister in '..\network\uPacketRegister.pas',
  uTCPClient in '..\network\uTCPClient.pas',
  uTCPDatatype in '..\network\uTCPDatatype.pas',
  uTCPServer in '..\network\uTCPServer.pas',
  uSetting in '..\common\uSetting.pas',
  uListener in '..\common\uListener.pas',
  uDataType in '..\common\uDataType.pas',
  uVirtualTime in '..\framework\LibBaseUtils\Counter\uVirtualTime.pas',
  uSteppers in '..\framework\LibBaseUtils\Counter\uSteppers.pas',
  uThreadTimer in '..\framework\LibBaseUtils\Counter\uThreadTimer.pas',
  uFunction in '..\common\uFunction.pas',
  uPCSSystem in 'uPCSSystem.pas',
  ufrmLogger in 'ufrmLogger.pas' {frmLogs},
  uFreezeFrom in '..\common\uFreezeFrom.pas' {frmFreeze},
  uLeverControl in 'uLeverControl.pas' {frmLeverControl},
  ComMainForm in 'servo\ComMainForm.pas' {FormServo},
  CPort in 'servo\CPort.pas',
  CPortCtl in 'servo\CPortCtl.pas',
  CPortEsc in 'servo\CPortEsc.pas',
  CPortSetup in 'servo\CPortSetup.pas' {ComSetupFrm},
  CPortTrmSet in 'servo\CPortTrmSet.pas' {ComTrmSetForm},
  MTMainForm in 'servo\MTMainForm.pas' {MainFormServo},
  uPCSPanelBridge in 'uPCSPanelBridge.pas' {frmPCSPanelBridge},
  uTrendDataType in '..\components\TrendChart\uTrendDataType.pas',
  uAlarmPCS in 'uAlarmPCS.pas' {frmPCSAlarm};

//  uAlarmPCS in 'uAlarmPCS.pas' {frmPCSAlarm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  Setting   := TSetting.Create;
  PCSSystem := TPCSSystem.Create;

  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmPSPanel, frmPSPanel);
  Application.CreateForm(TfrmSBPanel, frmSBPanel);
  Application.CreateForm(Tfrm_GeneralPanel, frm_GeneralPanel);
  Application.CreateForm(TfrmPCSPanelBridge, frmPCSPanelBridge);
  Application.CreateForm(TfrmLeverControl, frmLeverControl);
  Application.CreateForm(TFormServo, FormServo);
  Application.CreateForm(TMainFormServo, MainFormServo);
  Application.CreateForm(TfrmPCSPanelBridge, frmPCSPanelBridge);
  //Application.CreateForm(TfrmPCSAlarm, frmPCSAlarm);
  Application.Run;

  PCSSystem.Free;
  Setting.Free;
end.
