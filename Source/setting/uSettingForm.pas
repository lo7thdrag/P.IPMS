unit uSettingForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TfrmSetting = class(TForm)
    pnlHeader: TPanel;
    img1: TImage;
    pnlMain: TPanel;
    pnlLeft: TPanel;
    pnlSparatorTop: TPanel;
    pnlSparatorLeft: TPanel;
    pnlConsoleHeader: TPanel;
    pnlConsoleSetting: TPanel;
    lbl55: TLabel;
    cbbConsoleSetting: TComboBox;
    pnlDbaseHeader: TPanel;
    pnlDbaseSetting: TPanel;
    lbl53: TLabel;
    lbl1: TLabel;
    lblDBName: TLabel;
    lblPassword: TLabel;
    lblServer: TLabel;
    edtConnection: TEdit;
    edtDBName: TEdit;
    edtDBProtocol: TEdit;
    edtPassword: TEdit;
    edtUser: TEdit;
    pnlInstructorHeader: TPanel;
    pnlInstructorSetting: TPanel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    edtAppName: TEdit;
    edtInsHost: TEdit;
    edtInsPort: TEdit;
    pnlLpuHeader: TPanel;
    pnlLpuSetting: TPanel;
    lblLPUPort: TLabel;
    lblLPUServer: TLabel;
    edtLPUPort: TEdit;
    edtLPUServer: TEdit;
    pnlSimEngineHeader: TPanel;
    pnlSimEngineSetting: TPanel;
    lblSimEnginePort: TLabel;
    lblSimEngineSvr: TLabel;
    edtSimEnginePort: TEdit;
    edtSimEngineSvr: TEdit;
    pnlRight: TPanel;
    pnl3: TPanel;
    pnl1: TPanel;
    lbl27: TLabel;
    lbl28: TLabel;
    lbl29: TLabel;
    lbl30: TLabel;
    lbl31: TLabel;
    lbl32: TLabel;
    lbl33: TLabel;
    lbl34: TLabel;
    lbl35: TLabel;
    lbl22: TLabel;
    lbl37: TLabel;
    lbl38: TLabel;
    lbl39: TLabel;
    lbl40: TLabel;
    lbl41: TLabel;
    lbl42: TLabel;
    lbl43: TLabel;
    lbl44: TLabel;
    lbl45: TLabel;
    lbl46: TLabel;
    lbl47: TLabel;
    lbl48: TLabel;
    lbl49: TLabel;
    lbl50: TLabel;
    lbl51: TLabel;
    lbl5: TLabel;
    lbl36: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    edt3: TEdit;
    edt4: TEdit;
    edt5: TEdit;
    edt6: TEdit;
    edt7: TEdit;
    edt8: TEdit;
    edt9: TEdit;
    edt10: TEdit;
    edt11: TEdit;
    edt12: TEdit;
    edt13: TEdit;
    edt14: TEdit;
    edtGenPSFWD: TEdit;
    edtServer: TEdit;
    edtCCTVIP: TEdit;
    edtEmergencyStopIP: TEdit;
    edtMimicKananIP: TEdit;
    edtPCSKananIP: TEdit;
    edtMimicTengahIP: TEdit;
    edtPCSKiriIP: TEdit;
    edtMimicKiriIP: TEdit;
    edtACSIP: TEdit;
    edtInstrukturIP: TEdit;
    edt15: TEdit;
    edt16: TEdit;
    pnlPage: TPanel;
    pnlPCS: TPanel;
    lbl52: TLabel;
    cbbPCSFormType: TComboBox;
    grpIDServo: TGroupBox;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    edtIDRPMMEPS: TEdit;
    edtIDRPMMESB: TEdit;
    edtIDRPMSHAFTPS: TEdit;
    edtIDRPMSHAFTSB: TEdit;
    edtIDCPPSB: TEdit;
    edtIDRUDDERPS: TEdit;
    edtIDRUDDERSB: TEdit;
    edtIDCPPPS: TEdit;
    pnlInstructor: TPanel;
    lbl54: TLabel;
    cbbInstrukturMonitor: TComboBox;
    pnlRole: TPanel;
    lbl57: TLabel;
    cbbRoleName: TComboBox;
    pnlDG: TPanel;
    lbl58: TLabel;
    cbbDG: TComboBox;
    pnl20: TPanel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl18: TLabel;
    lbl19: TLabel;
    lbl20: TLabel;
    lbl21: TLabel;
    edtDegCPPPS: TEdit;
    edtDegCPPSB: TEdit;
    edtDegRPMMEPS: TEdit;
    edtDegRPMMESB: TEdit;
    edtDegRPMSHAFTPS: TEdit;
    edtDegRPMSHAFTSB: TEdit;
    edtDegRUDDERPS: TEdit;
    edtDegRUDDERSB: TEdit;
    pnl22: TPanel;
    lbl23: TLabel;
    lbl24: TLabel;
    lbl25: TLabel;
    lbl26: TLabel;
    cbbModeServo: TComboBox;
    edtAlarmPort: TEdit;
    edtEmergencyPort: TEdit;
    edtServoPort: TEdit;
    pnlSparatorRight: TPanel;
    pnlFooter: TPanel;
    img6: TImage;
    btnOK: TButton;
    btnCancel: TButton;
    pnlMainEngine: TPanel;
    lbl59: TLabel;
    lbl60: TLabel;
    lbl61: TLabel;
    lbl62: TLabel;
    lbl63: TLabel;
    cbbMEId: TComboBox;
    cbbMEFormType: TComboBox;
    cbbMEScreenGauges: TComboBox;
    cbbMEScreenSignaling: TComboBox;
    cbbMEScreenPMS: TComboBox;
    pnlMainSwitchBoard: TPanel;
    lbl64: TLabel;
    lbl65: TLabel;
    cbbMsbFormType: TComboBox;
    cbbMsbGeneratorID: TComboBox;
    pnlAuxiliary: TPanel;
    lbl66: TLabel;
    lbl67: TLabel;
    cbbAuxFormType: TComboBox;
    lbl68: TLabel;
    cbbAuxScreen1: TComboBox;
    cbbAuxScreen2: TComboBox;
    lbl69: TLabel;
    lbl70: TLabel;
    lbl71: TLabel;
    cbbSBScreen: TComboBox;
    lbl72: TLabel;
    cbbPSScreen: TComboBox;
    pnlMimic: TPanel;
    lbl56: TLabel;
    cbbMimicMonitor: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure cbbConsoleSettingChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbbPCSFormTypeChange(Sender: TObject);
    procedure cbbMsbFormTypeChange(Sender: TObject);
  private
    procedure SetMainFormPanel;
  public
    { Public declarations }
  end;

var
  frmSetting: TfrmSetting;

implementation

uses
  uSetting;

{$R *.dfm}

procedure TfrmSetting.btnCancelClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmSetting.btnOKClick(Sender: TObject);
var
  listServoID: TStringList;
  listServoDeg: TStringList;
  listMode: TStringList;
  modeServo: Integer;
  listFormPCS: TStringList;
  listMainEngine: TStringList;
  listDG: TStringList;
  listMainSwitchboard: TStringList;
  listAuxiliary: TStringList;
begin
  listServoID := TStringList.Create;
  listServoID.Add(edtIDRPMMEPS.Text);
  listServoID.Add(edtIDRPMMESB.Text);
  listServoID.Add(edtIDRPMSHAFTPS.Text);
  listServoID.Add(edtIDRPMSHAFTSB.Text);
  listServoID.Add(edtIDCPPPS.Text);
  listServoID.Add(edtIDCPPSB.Text);
  listServoID.Add(edtIDRUDDERPS.Text);
  listServoID.Add(edtIDRUDDERSB.Text);

  listServoDeg := TStringList.Create;
  listServoDeg.Add(edtDegRPMMEPS.Text);
  listServoDeg.Add(edtDegRPMMESB.Text);
  listServoDeg.Add(edtDegRPMSHAFTPS.Text);
  listServoDeg.Add(edtDegRPMSHAFTSB.Text);
  listServoDeg.Add(edtDegCPPPS.Text);
  listServoDeg.Add(edtDegCPPSB.Text);
  listServoDeg.Add(edtDegRUDDERPS.Text);
  listServoDeg.Add(edtDegRUDDERSB.Text);

  if cbbModeServo.Text = 'On' then
    modeServo := 0
  else if cbbModeServo.Text = 'Off' then
    modeServo := 1;
  listMode := TStringList.Create;
  listMode.Add(IntToStr(modeServo));
  listMode.Add(edtServoPort.Text);
  listMode.Add(edtAlarmPort.Text);
  listMode.Add(edtEmergencyPort.Text);

  with Setting do
  begin
    {$REGION ' Save Database Setting  '}
    Database := edtConnection.Text;
    UserName := edtUser.Text;
    Password := edtPassword.Text;
    DBName := edtDBName.Text;
    Protocol := edtDBProtocol.Text;
    {$ENDREGION}

    {$REGION ' Save Instructor Setting  '}
    InstructorHost := edtInsHost.Text;
    InstructorPort := edtInsPort.Text;
    ExecutedApp := edtAppName.Text;
    {$ENDREGION}
    {$REGION ' Save Sim Engine Setting  '}
    SimEngineServer := edtSimEngineSvr.Text;
    SimEnginePort := edtSimEnginePort.Text;
    {$ENDREGION}

    {$REGION ' Save LPU Setting  '}
    LPUServer := edtLPUServer.Text;
    LPUPort := edtLPUPort.Text;
    {$ENDREGION}

    {$REGION ' Save IP Setting  '}
    InstrukturIP := edtInstrukturIP.Text;
    Setting.AcsIP := edtACSIP.Text;
    Setting.MimicKiriIP := edtMimicKiriIP.Text;
    Setting.PcsKiriIP := edtPCSKiriIP.Text;
    Setting.MimicTengahIP := edtMimicTengahIP.Text;
    Setting.PcsKananIP := edtPCSKananIP.Text;
    Setting.MimicKananIP := edtMimicKananIP.Text;
    Setting.EmergencyStopIP := edtEmergencyStopIP.Text;
    Setting.CctvIP := edtCCTVIP.Text;
    Setting.ServerIP := edtServer.Text;
    {$ENDREGION}

    {$REGION ' Save Instructor Screen '}
    MonitorInstructor := StrToInt(cbbInstrukturMonitor.Text);
    {$ENDREGION}

    {$REGION ' Save Mimic Screen '}
    MonitorMimic := StrToInt(cbbMimicMonitor.Text);
    {$ENDREGION}

    {$REGION ' Save Mimic Role '}
    Role := cbbRoleName.Text;
    {$ENDREGION}

    {$REGION ' Save Form PCS '}
    listFormPCS := TStringList.Create;
    listFormPCS.Add(IntToStr(cbbPCSFormType.ItemIndex + 1));
    listFormPCS.Add(IntToStr(cbbPSScreen.ItemIndex + 1));
    listFormPCS.Add(IntToStr(cbbSBScreen.ItemIndex + 1));
    formPCS := listFormPCS;
    {$ENDREGION}

    {$REGION ' Save Form Diesel Generator '}
    listDG := TStringList.Create;
    listDG.Add(cbbDG.Text);
    ConsoleDG := listDG;
    {$ENDREGION}

    {$REGION ' Save Form Main Switchboard '}
    listMainSwitchboard := TStringList.Create;
    listMainSwitchboard.Add(cbbMsbFormType.Text);
    listMainSwitchboard.Add(cbbMsbGeneratorID.Text);
    ConsoleMainSwitchboard := listMainSwitchboard;
    {$ENDREGION}

    {$REGION ' Save Form Auxiliary '}
    listAuxiliary := TStringList.Create;
    listAuxiliary.Add(cbbAuxFormType.Text);
    listAuxiliary.Add(IntToStr(cbbAuxScreen1.ItemIndex));
    listAuxiliary.Add(IntToStr(cbbAuxScreen2.ItemIndex));
    ConsoleAuxiliary := listAuxiliary;
    {$ENDREGION}

    {$REGION ' Save Form Main Engine '}
    listMainEngine := TStringList.Create;
    listMainEngine.Add(cbbMEFormType.Text);
    listMainEngine.Add(IntToStr(cbbMEId.ItemIndex + 1));
    listMainEngine.Add(IntToStr(cbbMEScreenGauges.ItemIndex + 1));
    listMainEngine.Add(IntToStr(cbbMEScreenPMS.ItemIndex + 1));
    listMainEngine.Add(IntToStr(cbbMEScreenSignaling.ItemIndex + 1));
    ConsoleMainEngine := listMainEngine;
    {$ENDREGION}

    ServoID := listServoID;
    servoDegree := listServoDeg;
    mode := listMode;

    Setting.ManualIPMS := 'Manual IPMS.pdf';
    Setting.OperationalInstruktur := 'Operational Instruktur.pdf';
    Setting.OperationalACS := 'Operational ACS.pdf';
    Setting.OperationalVoip := 'Operational VOIP.pdf';
    Setting.ModulPCS := 'Modul PCS.pdf';
    Setting.CatalogHardware := 'Catalog Hardware IPMS.pdf';
    Setting.MaintenanceIPMS := 'Maintenance IPMS.pdf';

  end;

  listServoID.Free;
  listServoDeg.Free;
  listMode.Free;
  listFormPCS.Free;
  listMainEngine.Free;
  listDG.Free;
  listMainSwitchboard.Free;
  listAuxiliary.Free;

  Application.Terminate;
end;

procedure TfrmSetting.cbbConsoleSettingChange(Sender: TObject);
begin
  if cbbConsoleSetting.Text = 'INSTRUCTOR' then
  begin
    pnlPage.Caption := '.: ' + cbbConsoleSetting.Text + ' :.';
    SetMainFormPanel;

    pnlInstructor.Left := 6;
    pnlInstructor.Top := 52;

    pnlMimic.Left := 6;
    pnlMimic.Top := 107;

    pnlRole.Left := 271;
    pnlRole.Top := 52;

  end
  else if cbbConsoleSetting.Text = 'MIMIC KIRI' then
  begin
    pnlPage.Caption := '.: ' + cbbConsoleSetting.Text + ' :.';
    SetMainFormPanel;

    pnlMimic.Left := 6;
    pnlMimic.Top := 52;

    pnlRole.Left := 271;
    pnlRole.Top := 52;

  end
  else if cbbConsoleSetting.Text = 'PCS KIRI' then
  begin
    pnlPage.Caption := '.: ' + cbbConsoleSetting.Text + ' :.';
    SetMainFormPanel;

    pnlPCS.Left := 6;
    pnlPCS.Top := 52;
  end
  else if cbbConsoleSetting.Text = 'MIMIC TENGAH' then
  begin
    pnlPage.Caption := '.: ' + cbbConsoleSetting.Text + ' :.';
    SetMainFormPanel;

    pnlMimic.Left := 6;
    pnlMimic.Top := 52;

    pnlRole.Left := 271;
    pnlRole.Top := 52;

    pnlPCS.Left := 6;
    pnlPCS.Top := 107;
  end
  else if cbbConsoleSetting.Text = 'PCS KANAN' then
  begin
    pnlPage.Caption := '.: ' + cbbConsoleSetting.Text + ' :.';
    SetMainFormPanel;

  end
  else if cbbConsoleSetting.Text = 'MIMIC KANAN' then
  begin
    pnlPage.Caption := '.: ' + cbbConsoleSetting.Text + ' :.';
    SetMainFormPanel;

    pnlMimic.Left := 6;
    pnlMimic.Top := 52;

    pnlRole.Left := 271;
    pnlRole.Top := 52;
  end
  else if cbbConsoleSetting.Text = 'EMERGENCY STOP' then
  begin
    pnlPage.Caption := '.: ' + cbbConsoleSetting.Text + ' :.';
    SetMainFormPanel;

  end
  else if cbbConsoleSetting.Text = 'DIESEL GENERATOR' then
  begin
    pnlPage.Caption := '.: ' + cbbConsoleSetting.Text + ' :.';
    SetMainFormPanel;

    pnlDG.Left := 6;
    pnlDG.Top := 52;

  end
  else if cbbConsoleSetting.Text = 'MAIN ENGINE' then
  begin
    pnlPage.Caption := '.: ' + cbbConsoleSetting.Text + ' :.';
    SetMainFormPanel;

    pnlMainEngine.Left := 6;
    pnlMainEngine.Top := 52;

  end
  else if cbbConsoleSetting.Text = 'AUXILIARY' then
  begin
    pnlPage.Caption := '.: ' + cbbConsoleSetting.Text + ' :.';
    SetMainFormPanel;

    pnlAuxiliary.Left := 6;
    pnlAuxiliary.Top := 52;

  end
  else if cbbConsoleSetting.Text = 'MAIN SWITCHBOARD' then
  begin
    pnlPage.Caption := '.: ' + cbbConsoleSetting.Text + ' :.';
    SetMainFormPanel;

    pnlMainSwitchBoard.Left := 6;
    pnlMainSwitchBoard.Top := 52;

  end;
end;

procedure TfrmSetting.cbbMsbFormTypeChange(Sender: TObject);
begin
  cbbMsbGeneratorID.Clear;

  if cbbMsbFormType.Text = 'GENSYS' then
  begin
    cbbMsbGeneratorID.Items.Add('Generator 1');
    cbbMsbGeneratorID.Items.Add('Generator 2');
    cbbMsbGeneratorID.Items.Add('Generator 3');
    cbbMsbGeneratorID.Items.Add('Generator 4');
  end
  else if cbbMsbFormType.Text = 'EMERGENCY' then
  begin
    cbbMsbGeneratorID.Items.Add('Emergency Generator');
  end
  else if cbbMsbFormType.Text = 'SHORE' then
  begin
    cbbMsbGeneratorID.Items.Add('Shore');
  end;

  cbbMsbGeneratorID.ItemIndex := 0;
end;

procedure TfrmSetting.cbbPCSFormTypeChange(Sender: TObject);
begin
  cbbSBScreen.Enabled := cbbPCSFormType.Text = 'PCS Tengah';
  cbbPSScreen.Enabled := cbbPCSFormType.Text = 'PCS Tengah';
end;

procedure TfrmSetting.FormCreate(Sender: TObject);
var
  i: integer;
  listServoID: TStringList;
  listServoDeg: TStringList;
  listMode: TStringList;
  listFormPCS: TStringList;
  listMainEngine: TStringList;
  listDG: TStringList;
  listMainSwitchboard: TStringList;
  listAuxiliary: TStringList;
begin
  Setting := TSetting.Create;
  listServoID := TStringList.Create;
  listServoDeg := TStringList.Create;
  listMode := TStringList.Create;

  {$REGION ' Load Database Setting  '}
  edtConnection.Text := Setting.Database;
  edtUser.Text := Setting.UserName;
  edtPassword.Text := Setting.Password;
  edtDBName.Text := Setting.DBName;
  edtDBProtocol.Text := Setting.Protocol;
  {$ENDREGION}

  {$REGION ' Load Instructor Setting  '}
  edtInsHost.Text := Setting.InstructorHost;
  edtInsPort.Text := Setting.InstructorPort;
  edtAppName.Text := Setting.ExecutedApp;
  {$ENDREGION}

  {$REGION ' Load Sim Engine Setting  '}
  edtSimEngineSvr.Text := Setting.SimEngineServer;
  edtSimEnginePort.Text := Setting.SimEnginePort;
  {$ENDREGION}

  {$REGION ' Load LPU Setting  '}
  edtLPUServer.Text := Setting.LPUServer;
  edtLPUPort.Text := Setting.LPUPort;
  {$ENDREGION}

  {$REGION ' Load IP Setting  '}
  edtServer.Text := Setting.ServerIP;
  edtInstrukturIP.Text := Setting.InstrukturIP;
  edtACSIP.Text := Setting.AcsIP;
  edtMimicKiriIP.Text := Setting.MimicKiriIP;
  edtPCSKiriIP.Text := Setting.PcsKiriIP;
  edtMimicTengahIP.Text := Setting.MimicTengahIP;
  edtPCSKananIP.Text := Setting.PcsKananIP;
  edtMimicKananIP.Text := Setting.MimicKananIP;
  edtEmergencyStopIP.Text := Setting.EmergencyStopIP;
  edtCCTVIP.Text := Setting.CctvIP;
  // Kurang
  {$ENDREGION}

  {$REGION ' Load Instructor Screen '}
  cbbInstrukturMonitor.ItemIndex := cbbInstrukturMonitor.Items.IndexOf(intTostr(Setting.MonitorInstructor));
  {$ENDREGION}

  {$REGION ' Load Mimic Screen '}
  cbbMimicMonitor.ItemIndex := cbbMimicMonitor.Items.IndexOf(intTostr(Setting.MonitorMimic));
  {$ENDREGION}

  {$REGION ' Load Mimic Role '}
  cbbRoleName.ItemIndex := cbbRoleName.Items.IndexOf(Setting.Role);
  {$ENDREGION}

  {$REGION ' Load Form PCS '}
  listFormPCS := Setting.formPCS;
  cbbPCSFormType.ItemIndex := StrToInt(listFormPCS[0]) - 1;
  cbbPSScreen.ItemIndex := StrToInt(listFormPCS[1]) - 1;
  cbbSBScreen.ItemIndex := StrToInt(listFormPCS[2]) - 1;
  {$ENDREGION}

  {$REGION ' Load Form Diesel Generator '}
  listDG := Setting.ConsoleDG;
  cbbDG.ItemIndex := cbbDG.Items.IndexOf(listDG[0]);
  {$ENDREGION}

  {$REGION ' Load Form Main Switchboard '}
  listMainSwitchboard := Setting.ConsoleMainSwitchboard;
  cbbMsbFormType.ItemIndex := cbbMsbFormType.Items.IndexOf(listMainSwitchboard[0]);
  cbbMsbFormTypeChange(nil);
  cbbMsbGeneratorID.ItemIndex := cbbMsbGeneratorID.Items.IndexOf(listMainSwitchboard[1]);
  {$ENDREGION}

  {$REGION ' Load Form Auxiliary '}
  listAuxiliary := Setting.ConsoleAuxiliary;
  cbbAuxFormType.ItemIndex := cbbAuxFormType.Items.IndexOf(listAuxiliary[0]);
  cbbAuxScreen1.ItemIndex := StrToInt(listAuxiliary[1]);
  cbbAuxScreen2.ItemIndex := StrToInt(listAuxiliary[2]);
  {$ENDREGION}

  {$REGION ' Load Form Main Engine '}
  listMainEngine := Setting.ConsoleMainEngine;
  cbbMEFormType.ItemIndex := cbbMEFormType.Items.IndexOf(listMainEngine[0]);
  cbbMEId.ItemIndex := StrToInt(listMainEngine[1]) - 1;
  cbbMEScreenGauges.ItemIndex := StrToInt(listMainEngine[2]) - 1;
  cbbMEScreenPMS.ItemIndex := StrToInt(listMainEngine[3]) - 1;
  cbbMEScreenSignaling.ItemIndex := StrToInt(listMainEngine[4]) - 1;
  {$ENDREGION}

  {$REGION ' Sepertinya gak kepake '}
  listServoID := Setting.ServoID;
  listServoDeg := Setting.servoDegree;
  listMode := Setting.mode;

  edtIDRPMMEPS.Text := listServoID[0];
  edtIDRPMMESB.Text := listServoID[1];
  edtIDRPMSHAFTPS.Text := listServoID[2];
  edtIDRPMSHAFTSB.Text := listServoID[3];
  edtIDCPPPS.Text := listServoID[4];
  edtIDCPPSB.Text := listServoID[5];
  edtIDRUDDERPS.Text := listServoID[6];
  edtIDRUDDERSB.Text := listServoID[7];

  edtDegRPMMEPS.Text := listServoDeg[0];
  edtDegRPMMESB.Text := listServoDeg[1];
  edtDegRPMSHAFTPS.Text := listServoDeg[2];
  edtDegRPMSHAFTSB.Text := listServoDeg[3];
  edtDegCPPPS.Text := listServoDeg[4];
  edtDegCPPSB.Text := listServoDeg[5];
  edtDegRUDDERPS.Text := listServoDeg[6];
  edtDegRUDDERSB.Text := listServoDeg[7];

  if listMode[0] = '0' then
    cbbModeServo.Text := 'On'
  else if listMode[0] = '1' then
  begin
    cbbModeServo.Text := 'Off'
  end;
  edtServoPort.Text := listMode[1];
  edtAlarmPort.Text := listMode[2];
  edtEmergencyPort.Text := listMode[3];
  {$ENDREGION}

  listServoID.Free;
  listServoDeg.Free;
  listMode.Free;
  listFormPCS.Free;
  listMainEngine.Free;
  listDG.Free;
  listMainSwitchboard.Free;
  listAuxiliary.Free;
end;

procedure TfrmSetting.FormDestroy(Sender: TObject);
begin
  Setting.Free;
end;

procedure TfrmSetting.FormShow(Sender: TObject);
begin
  cbbConsoleSetting.ItemIndex := 0;
  cbbConsoleSettingChange(nil);
end;

procedure TfrmSetting.SetMainFormPanel;
begin
  pnlInstructor.Left := 1000;
  pnlInstructor.Top := 1000;

  pnlMimic.Left := 1000;
  pnlMimic.Top := 1000;

  pnlRole.Left := 1000;
  pnlRole.Top := 1000;

  pnlDG.Left := 1000;
  pnlDG.Top := 1000;

  pnlPCS.Left := 1000;
  pnlPCS.Top := 1000;

  pnlAuxiliary.Left := 1000;
  pnlAuxiliary.Top := 1000;

  pnlMainEngine.Left := 1000;
  pnlMainEngine.Top := 1000;

  pnlMainSwitchBoard.Left := 1000;
  pnlMainSwitchBoard.Top := 1000;
end;

end.

