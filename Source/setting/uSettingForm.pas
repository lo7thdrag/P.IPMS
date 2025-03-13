unit uSettingForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmSetting = class(TForm)
    grpDatabase: TGroupBox;
    edtConnection: TEdit;
    lblServer: TLabel;
    lbl1: TLabel;
    edtUser: TEdit;
    lblPassword: TLabel;
    edtPassword: TEdit;
    btnOK: TButton;
    btnCancel: TButton;
    grp1: TGroupBox;
    lblDBName: TLabel;
    edtDBName: TEdit;
    grpSimEngineSet: TGroupBox;
    lblSimEngineSvr: TLabel;
    lblSimEnginePort: TLabel;
    edtSimEngineSvr: TEdit;
    edtSimEnginePort: TEdit;
    grpLPUSet: TGroupBox;
    lblLPUServer: TLabel;
    lblLPUPort: TLabel;
    edtLPUServer: TEdit;
    edtLPUPort: TEdit;
    grpRole: TGroupBox;
    Label1: TLabel;
    cbbRoleName: TComboBox;
    edtAppName: TEdit;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    edtInsHost: TEdit;
    edtInsPort: TEdit;
    Label2: TLabel;
    edtDBProtocol: TEdit;
    grp2: TGroupBox;
    lbl5: TLabel;
    grpIDServo: TGroupBox;
    lbl6: TLabel;
    edtIDRPMMEPS: TEdit;
    lbl7: TLabel;
    edtIDRPMMESB: TEdit;
    lbl8: TLabel;
    edtIDRPMSHAFTPS: TEdit;
    lbl9: TLabel;
    edtIDRPMSHAFTSB: TEdit;
    lbl10: TLabel;
    lbl11: TLabel;
    edtIDCPPSB: TEdit;
    lbl12: TLabel;
    edtIDRUDDERPS: TEdit;
    lbl13: TLabel;
    edtIDRUDDERSB: TEdit;
    edtIDCPPPS: TEdit;
    grpServoDegree: TGroupBox;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl18: TLabel;
    lbl19: TLabel;
    lbl20: TLabel;
    lbl21: TLabel;
    edtDegRPMMEPS: TEdit;
    edtDegRPMMESB: TEdit;
    edtDegRPMSHAFTPS: TEdit;
    edtDegRPMSHAFTSB: TEdit;
    edtDegCPPSB: TEdit;
    edtDegRUDDERPS: TEdit;
    edtDegRUDDERSB: TEdit;
    edtDegCPPPS: TEdit;
    grp3: TGroupBox;
    lbl22: TLabel;
    grp4: TGroupBox;
    lbl23: TLabel;
    lbl24: TLabel;
    lbl25: TLabel;
    lbl26: TLabel;
    edtServoPort: TEdit;
    edtAlarmPort: TEdit;
    edtEmergencyPort: TEdit;
    cbbModeServo: TComboBox;
    cbbidFormPCS: TComboBox;
    cbbMimicMonitor: TComboBox;
    grpConsoleIP: TGroupBox;
    edtInstrukturIP: TEdit;
    edtACSIP: TEdit;
    edtMimicKiriIP: TEdit;
    edtPCSKiriIP: TEdit;
    edtPCSKananIP: TEdit;
    edtMimicTengahIP: TEdit;
    edtMimicKananIP: TEdit;
    edtEmergencyStopIP: TEdit;
    edtCCTVIP: TEdit;
    lbl27: TLabel;
    lbl28: TLabel;
    lbl29: TLabel;
    lbl30: TLabel;
    lbl31: TLabel;
    lbl32: TLabel;
    lbl33: TLabel;
    lbl34: TLabel;
    lbl35: TLabel;
    lbl36: TLabel;
    edtServer: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
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
  listServoID : TStringList;
  listServoDeg: TStringList;
  listMode : TStringList;
  listFormPCS : TStringList;
  modeServo : Integer;
  idFormPCS : Integer;
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

  if cbbidFormPCS.Text = 'PCS Kiri' then
    idFormPCS := 1
  else if cbbidFormPCS.Text = 'PCS Tengah' then
    idFormPCS := 2
  else if cbbidFormPCS.Text = 'PCS Kanan' then
    idFormPCS := 3;

  listFormPCS := TStringList.Create;
  listFormPCS.Add(IntToStr(idFormPCS));

  with Setting do
  begin
    Database  := edtConnection.Text;
    UserName  := edtUser.Text;
    Password  := edtPassword.Text;
    DBName    := edtDBName.Text;
    Protocol  := edtDBProtocol.Text;

    InstructorHost := edtInsHost.Text;
    InstructorPort := edtInsPort.Text;
    ExecutedApp := edtAppName.Text;

    SimEngineServer := edtSimEngineSvr.Text;
    SimEnginePort   := edtSimEnginePort.Text;

    LPUServer := edtLPUServer.Text;
    LPUPort   := edtLPUPort.Text;

    Role := cbbRoleName.Text;
    MonitorMimic := StrToInt(cbbMimicMonitor.Text);
    ServoID := listServoID;
    servoDegree := listServoDeg;
    mode := listMode;
    formPCS := listFormPCS;

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

  {Setting.setServoID(StrToInt(edtIDRPMMEPS.Text), StrToInt(edtIDRPMMESB.Text),StrToInt(edtIDRPMSHAFTPS.Text)
  ,StrToInt(edtIDRPMSHAFTSB.Text),StrToInt(edtIDCPPPS.Text), StrToInt(edtIDCPPSB.Text), StrToInt(edtIDRUDDERPS.Text)
  ,StrToInt(edtIDRUDDERSB.Text));}

  Application.Terminate;
end;

procedure TfrmSetting.FormCreate(Sender: TObject);
var
  i : integer;
  listServoID : TStringList;
  listServoDeg : TStringList;
  listMode : TStringList;
  listFormPCS : TStringList;
begin
  Setting := TSetting.Create;
  listServoID := TStringList.Create;
  listServoDeg := TStringList.Create;
  listMode := TStringList.Create;
  listFormPCS := TStringList.Create;

  edtConnection.Text := Setting.Database;
  edtUser.Text       := Setting.UserName;
  edtPassword.Text   := Setting.Password;
  edtDBName.Text     := Setting.DBName;
  edtDBProtocol.Text := Setting.Protocol;

  edtInsHost.Text    := Setting.InstructorHost;
  edtInsPort.Text    := Setting.InstructorPort;
  edtAppName.Text    := Setting.ExecutedApp;

  edtSimEngineSvr.Text := Setting.SimEngineServer;
  edtSimEnginePort.Text := Setting.SimEnginePort;

  edtLPUServer.Text := Setting.LPUServer;
  edtLPUPort.Text := Setting.LPUPort;

  i := cbbRoleName.Items.IndexOf(Setting.Role);
  cbbRoleName.ItemIndex := i;

  cbbMimicMonitor.Text := IntToStr(Setting.MonitorMimic);

  listServoID := Setting.ServoID;
  listServoDeg := Setting.servoDegree;
  listMode := Setting.mode;
  listFormPCS := Setting.formPCS;

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

  if listFormPCS[0] = '1' then
    cbbidFormPCS.Text := 'PCS Kiri'
  else if listFormPCS[0] = '2' then
    cbbidFormPCS.Text := 'PCS Tengah'
  else if listFormPCS[0] = '3' then
    cbbidFormPCS.Text := 'PCS Kanan';

  listServoID.Free;
  listServoDeg.Free;
  listMode.Free;
  listFormPCS.Free;
  {list := setting.getServoID;
  ShowMessage(list[0]);}


  edtInstrukturIP.Text := Setting.InstrukturIP;
  edtACSIP.Text := Setting.AcsIP;
  edtMimicKiriIP.Text := Setting.MimicKiriIP;
  edtPCSKiriIP.Text := Setting.PcsKiriIP;
  edtMimicTengahIP.Text := Setting.MimicTengahIP;
  edtPCSKananIP.Text := Setting.PcsKananIP;
  edtMimicKananIP.Text := Setting.MimicKananIP;
  edtEmergencyStopIP.Text := Setting.EmergencyStopIP;
  edtCCTVIP.Text := Setting.CctvIP;
  edtServer.Text := Setting.ServerIP;

end;

procedure TfrmSetting.FormDestroy(Sender: TObject);
begin
  Setting.Free;
end;

end.
