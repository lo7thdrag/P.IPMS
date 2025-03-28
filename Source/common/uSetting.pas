unit uSetting;

interface

uses
  IniFiles, Classes;

type

  TSetting = class
  private
    FIniFile : TIniFile;
    FDatabase : string;
    FDBName : string;
    FPassword : string;
    FUserName : string;
    FPassApp : string;
    FUserApp : string;
    FServer : string;
    FSimEnginePort : string;
    FLPUPort : string;
    FSimEngineServer : string;
    FLPUServer : string;
    FRole : string;
    FInstructorPort : string;
    FInstructorHost : string;
    FExecutedApp : string;
    FProtocol : string;
    FExecutedApp2 : string;
    FExecutedApp3 : string;
    FMonitorMimic : Integer;

    FServerIP : string;
    FInstrukturIP : string;
    FAcsIP : string;
    FMimicKiriIP : string;
    FPcsKiriIP : string;
    FMimicTengahIP : string;
    FPcsKananIP : string;
    FMimicKananIP : string;
    FEmergencyStopIP : string;
    FCctvIP : string;

    FGenPsFwdIP : string;
    FGenSbFwdIP : string;
    FGenPsAftIP : string;
    FGenSbAftIP : string ;
    FGenEmergencyIP : string ;
    FShoreIP: string;

    FMainEngine1PsIP : string;
    FMainEngine2PsIP : string;
    FMainEngine1SbIP: string ;
    FMainEngine2SbIP: string;

    FAuxiliary1IP: string;
    FAuxiliary2IP: string;
    FAuxiliary3IP: string;

    FDieselGenerator1IP: string ;
    FDieselGenerator2IP: string ;
    FDieselGenerator3IP: string ;
    FDieselGenerator4IP: string ;


    FManualIPMS : string;
    FOperationalInstruktur : string;
    FOperationalACS : string;
    FOperationalVoip : string;
    FModulPCS : string;
    FCatalogHardware : string;
    FMaintenanceIPMS : string;

    function GetDatabase : string;
    function GetPassword : string;
    function GetUserName : string;

    function GetServer : string;
    function GetPassApp : string;
    function GetUserApp : string;

    procedure SetDatabase(const Value: string);
    procedure SetPassword(const Value: string);
    procedure SetUserName(const Value: string);
    procedure SetPassApp(const Value: string);
    procedure SetServer(const Value: string);
    procedure SetUserApp(const Value: string);
    function GetDBName: String;
    procedure SetDBName(const Value: string);
    procedure SetLPUPort(const Value: string);
    procedure SetLPUServer(const Value: string);
    procedure SetSimEnginePort(const Value: string);
    procedure SetSimEngineServer(const Value: string);
    function GetLPUPort: string;
    function GetLPUServer: string;
    function GetSimEnginePort: string;
    function GetSimEngineServer: string;
    procedure SetRole(const aValue: string);
    function GetRole: string;
    procedure SetInstructorHost(const Value: string);
    procedure SetInstructorPort(const Value: string);
    function GetInstructorHost: string;
    function GetInstructorPort: string;
    procedure SetExecutedApp(const Value: string);
    function GetExecutedApp: string;
    procedure SetProtocol(const Value: string);
    function GetProtocol: string;
    procedure SetExecutedApp2(const Value: string);
    procedure SetExecutedApp3(const Value: string);
    function GetExecutedApp2: string;
    function GetExecutedApp3: string;
    function GetMonitorMimic: Integer;
    procedure SetMonitorMimic(const Value: Integer);

    //yoga setting.ini
    {procedure setServoID(const serIDRPMMEPS : Integer; const serIDRPMMESB : Integer; const serIDRPMSHAFTPS : Integer;
              const serIDRPMSHAFTSB : Integer; const serIDCPPPS : Integer; const serIDCPPSB : Integer; const serIDRUDDERPS : Integer;
              const serIDRUDDERSB : Integer);}
    procedure setServoID(liststring: TStringList);
    function getServoID: TStringList;

    procedure setServoDegree(liststring: TStringList);
    function getServoDegree: TStringList;

    procedure setMode(liststring: TStringList);
    function getMode: TStringList;

    procedure setFormPCS(liststring: TStringList);
    function getFormPCS: TStringList;
    function GetInstrukturIP: string;
    procedure SetInstrukturIP(const Value: string);
    function GetAcsIP: string;
    procedure SetAcsIP(const Value: string);
    function GetMimicKiriIP: string;
    procedure SetMimicKiriIP(const Value: string);
    function GetPcsKiriIp: string;
    procedure SetPcsKiriIP(const Value: string);
    function GetMimicTengahIP: string;
    procedure SetMimicTengahIP(const Value: string);
    function GetPcsKananIP: string;
    procedure SetPcsKananIP(const Value: string);
    function GetMimicKananIP: string;
    procedure SetMimicKananIP(const Value: string);
    function GetEmergencyStopIP: string;
    procedure SetEmergencyStopIP(const Value: string);
    function GetCctvIP: string;
    procedure SetCctvIP(const Value: string);
    function GetManualIPMS: string;
    function GetModulPCS: string;
    function GetOperationalACS: string;
    function GetOperationalInstruktur: string;
    function GetOperationalVoip: string;
    procedure SetCatalogHardware(const Value: string);
    procedure SetMaintenanceIPMS(const Value: string);
    procedure SetManualIPMS(const Value: string);
    procedure SetModulPCS(const Value: string);
    procedure SetOperationalACS(const Value: string);
    procedure SetOperationalInstruktur(const Value: string);
    procedure SetOperationalVoip(const Value: string);
    function GetCatalogHardware: string;
    function GetMaintenanceIPMS: string;
    function GetServerIP: string;

    function GetGenPsFwdIP: string;
    procedure SetGenPsFwdIP(const Value: string);
    function GetGenSbFwdIP: string;
    procedure SetGenSbFwdIP(const Value: string);
    function GetGenPsAftIP: string;
    procedure SetGenPsAftIP(const Value: string);
    function GetGenSbAftIP: string;
    procedure SetGenSbAftIP(const Value: string);
    function GetGenEmergencyIP: string;
    procedure SetGenEmergencyIP(const Value: string);
    function GetShoreIP: string;
    procedure SetShoreIP(const Value: string);
    function GetMainEngine1PsIP: string;
    procedure SetMainEngine1PsIP(const Value: string);
    function GetMainEngine2PsIP: string;
    procedure SetMainEngine2PsIP(const Value: string);
    function GetMainEngine1SbIP: string;
    procedure SetMainEngine1SbIP(const Value: string);
    function GetMainEngine2SbIP: string;
    procedure SetMainEngine2SbIP(const Value: string);
    function GetAuxiliary1IP: string;
    procedure SetAuxiliary1IP(const Value: string);
    function GetAuxiliary2IP: string;
    procedure SetAuxiliary2IP(const Value: string);
    function GetAuxiliary3IP: string;
    procedure SetAuxiliary3IP(const Value: string);
    function GetDieselGenerator1IP: string;
    procedure SetDieselGenerator1IP(const Value: string);
    function GetDieselGenerator2IP: string;
    procedure SetDieselGenerator2IP(const Value: string);
    function GetDieselGenerator3IP: string;
    procedure SetDieselGenerator3IP(const Value: string);
    function GetDieselGenerator4IP: string;
    procedure SetDieselGenerator4IP(const Value: string);


    procedure SetServerIP(const Value: string);  public
    constructor Create;
    destructor Destroy; override;

    property Database : string read GetDatabase write SetDatabase;
    property DBName : string read GetDBName write SetDBName;
    property UserName : string read GetUserName write SetUserName;
    property Password : string read GetPassword write SetPassword;
    property Protocol : string read GetProtocol write SetProtocol;

    property Server : string read GetServer write SetServer;
    property UserApp : string read GetPassApp write SetUserApp;
    property PassApp : string read GetUserApp write SetPassApp;

    property SimEngineServer : string read GetSimEngineServer write SetSimEngineServer;
    property SimEnginePort : string read GetSimEnginePort write SetSimEnginePort;

    property InstructorHost : string read GetInstructorHost write SetInstructorHost;
    property InstructorPort : string read GetInstructorPort write SetInstructorPort;

    property LPUServer : string read GetLPUServer write SetLPUServer;
    property LPUPort : string read GetLPUPort write SetLPUPort;
    property Role : string read GetRole write SetRole;

    property ExecutedApp : string read GetExecutedApp write SetExecutedApp;
    property ExecutedApp2 : string read GetExecutedApp2 write SetExecutedApp2;
    property ExecutedApp3 : string read GetExecutedApp3 write SetExecutedApp3;

    property MonitorMimic : Integer read GetMonitorMimic write SetMonitorMimic;

    property ServoID : TStringList read getServoID write setServoID;
    property servoDegree : TStringList read getServoDegree write setServoDegree;
    property mode : TStringList read getMode write setMode;
    property formPCS : TStringList read getFormPCS write setFormPCS;

    property ServerIP : string read GetServerIP write SetServerIP;
    property InstrukturIP : string read GetInstrukturIP write SetInstrukturIP;
    property AcsIP : string read GetAcsIP write SetAcsIP;
    property MimicKiriIP : string read GetMimicKiriIP write SetMimicKiriIP;
    property PcsKiriIP : string read GetPcsKiriIP write SetPcsKiriIP;
    property MimicTengahIP : string read GetMimicTengahIP write SetMimicTengahIP;
    property PcsKananIP : string read GetPcsKananIP write SetPcsKananIP;
    property MimicKananIP : string read GetMimicKananIP write SetMimicKananIP;
    property EmergencyStopIP : string read GetEmergencyStopIP write SetEmergencyStopIP;
    property CctvIP : string read GetCctvIP write SetCctvIP;

    property GenPsFwdIP : string read GetGenPsFwdIP write SetGenPsFwdIP;
    property GenSbFwdIP : string read GetGenSbFwdIP write SetGenSbFwdIP;
    property GenPsAftIP : string read GetGenPsAftIP  write SetGenPsAftIP ;
    property GenSbAftIP : string read GetGenSbAftIP write SetGenSbAftIP;
    property GenEmergencyIP : string read GetGenEmergencyIP write SetGenEmergencyIP;
    property ShoreIP: string read GetShoreIP write SetShoreIP;

    property MainEngine1PsIP : string read GetMainEngine1PsIP write SetMainEngine1PsIP;
    property MainEngine2PsIP: string read GetMainEngine2PsIP write SetMainEngine2PsIP;
    property MainEngine1Sb: string read GetMainEngine1SbIP write SetMainEngine1SbIP;
    property MainEngine2Sb: string read GetMainEngine2SbIP write SetMainEngine2SbIP;

    property Auxiliary1: string read GetAuxiliary1IP write SetAuxiliary1IP;
    property Auxiliary2: string read GetAuxiliary2IP write SetAuxiliary2IP;
    property Auxiliary3: string read GetAuxiliary3IP write SetAuxiliary3IP;

    property DieselGenerator1: string read GetDieselGenerator1IP write SetDieselGenerator1IP;
    property DieselGenerator2: string read GetDieselGenerator2IP write SetDieselGenerator2IP;
    property DieselGenerator3: string read GetDieselGenerator3IP write SetDieselGenerator3IP;
    property DieselGenerator4: string read GetDieselGenerator4IP write SetDieselGenerator4IP;

    property ManualIPMS : string read GetManualIPMS write SetManualIPMS;
    property OperationalInstruktur : string read GetOperationalInstruktur write SetOperationalInstruktur;
    property OperationalACS : string read GetOperationalACS write SetOperationalACS;
    property OperationalVoip : string read GetOperationalVoip write SetOperationalVoip;
    property ModulPCS : string read GetModulPCS write SetModulPCS;
    property CatalogHardware : string read GetCatalogHardware write SetCatalogHardware;
    property MaintenanceIPMS : string read GetMaintenanceIPMS write SetMaintenanceIPMS;
  end;

var
  Setting : TSetting;

implementation

uses
  uFunction, SysUtils, Forms;

{ default value }
const
  C_Section_DB      = 'DATABASE';
  C_Ident_DB        = 'Server';
  C_Ident_DBName    = 'DatabaseName';
  C_Ident_User      = 'User';
  C_Ident_Pass      = 'Password';
  C_Ident_Protocol  = 'Protocol';

  C_Database_Conn   = '192.168.1.2';
  C_Database_Name   = 'CimDbase_IPMS_V2';
  C_UserName        = 'sa';
  C_Password        = 'T3server!';
  C_Protocol        = 'mssql';

  C_Section_APP     = 'APPLICATION';
  C_Ident_Server    = 'Server';
  C_Ident_User_App  = 'User';
  C_Ident_Pass_App  = 'Password';
  C_Ident_App       = 'AppName';
  C_Ident_App2      = 'AppName1';
  C_Ident_App3      = 'AppName2';

  C_Server_Conn     = '192.168.1.144';
  C_UserName_App    = 'MCS_E';
  C_Password_App    = 'admin';

  C_Section_LPU     = 'LPU';
  C_LPU_Server      = '192.168.1.144';
  C_LPU_Port        = '1920';

  C_Section_SimEng  = 'SIM ENGINE';
  C_SimEngine_Svr   = '192.168.1.144';
  C_SimEngine_Port  = '2990';

  C_Ident_Port      = 'Port';

  C_Section_Role    = 'ROLE';
  C_Ident_Role      = 'Name';
  C_Role_Name       = 'IPMS';

  C_Section_Instructor = 'INSTRUCTOR';
  C_Instructor_Host = '192.168.1.144';
  C_Instructor_Port = '9898';

  C_Section_Monitor = 'MIMICSCREEN';
  C_Ident_Mimic   = 'SCREEN';
  C_Monitor_Mimic = 1;

  //servo
  C_Section_ServoID = 'Servo';
  C_serID_RPMME_PS = 'idServoRPMME';
  C_serID_RPMME_SB = 'idServoRPMME_2';
  C_serID_RPMSHAFT_PS = 'idServoRPMSHAFT';
  C_serID_RPMSHAFT_SB = 'idServoRPMSHAFT_2';
  C_serID_CPP_PS = 'idServoCPP';
  C_serID_CPP_SB = 'idServoCPP_2';
  C_serID_RUDDER_PS = 'idServoRudder';
  C_serID_RUDDER_SB = 'idServoRudder_2';
  C_serDeg_RPMME_PS = 'RPMME';
  C_serDeg_RPMME_SB = 'RPMME_2';
  C_serDeg_RPMSHAFT_PS = 'RPMSHAFT';
  C_serDeg_RPMSHAFT_SB = 'RPMSHAFT_2';
  C_serDeg_CPP_PS = 'CPP';
  C_serDeg_CPP_SB = 'CPP_2';
  C_serDeg_RUDDER_PS = 'rudder';
  C_serDeg_RUDDER_SB = 'rudder_2';

  //nilai awal servo jika tidak ada setting.ini
  servoIDRPMMEPS = '1';
  servoIDRPMMESB = '5';
  servoIDRPMSHAFTPS = '2';
  servoIDRPMSHAFTSB = '6';
  servoIDCPPPS = '3';
  servoIDCPPSB = '7';
  servoIDRUDDERPS = '4';
  servoIDRUDDERSB = '8';

  servoDEGRPMMEPS = '920';
  servoDEGRPMMESB = '920';
  servoDEGRPMSHAFTPS = '210';
  servoDEGRPMSHAFTSB = '210';
  servoDEGCPPPS = '130';
  servoDEGCPPSB = '130';
  servoDEGRUDDERPS = '70';
  servoDEGRUDDERSB = '70';

  modeServoDef = '1';
  servoPortDef = 'COM1';
  alarmPortDef = 'COM2';
  emergencyPortDef = 'COM3';

  idFormPCSDef = '1';

  //mode
  C_Section_Mode = 'Mode';
  C_ModeServo = 'modeservo';
  C_ServoPort = 'servoPort';
  C_AlarmPort = 'SettingAlarm';
  C_EmergencyPort = 'SettingEmergency';

  //Form PCS
  C_Section_PCS = 'Form PCS';
  C_idFormPCS = 'idFormPCS';

  C_Section_Help = 'HELP';
  C_Ident_PDF = 'PDF';
  C_ManualIPMS = 'Manual IPMS.pdf';
  C_OperationalInstrukur = 'Operational Instruktur.pdf';
  C_OperationalACS = 'Operational ACS.pdf';
  C_OperationalVoip = 'Operational VOIP.pdf';
  C_ModulPCS = 'Modul ACS.pdf';
  C_CatalogHardware = 'Catalog Hardware IPMS.pdf';
  C_MaintenanceIPMS = 'Maintenance IPMS.pdf';



{ TSetting }

constructor TSetting.Create;
var
  fIni : string;
begin
  fIni := ExtractFilePath(Application.ExeName) + '\setting.ini';
  FIniFile := TIniFile.Create(fIni);
end;

destructor TSetting.Destroy;
begin
  FIniFile.Free;
  inherited;
end;

function TSetting.GetAcsIP: string;
begin
  Result := FIniFile.ReadString('CONSOLE', 'acs', '192.168.1.11');
end;

function TSetting.GetAuxiliary1IP: string;
begin
  Result := FIniFile.ReadString('CONSOLE', 'Auxiliary1', '192.168.1.18');
end;

function TSetting.GetAuxiliary2IP: string;
begin
  Result := FIniFile.ReadString('CONSOLE', 'Auxiliary2', '192.168.1.18');
end;

function TSetting.GetAuxiliary3IP: string;
begin
  Result := FIniFile.ReadString('CONSOLE', 'Auxiliary3', '192.168.1.18');
end;

function TSetting.GetCatalogHardware: string;
begin
  Result := FIniFile.ReadString(C_Section_Help, 'CatalogHardware',
    'Catalog Hardware IPMS.pdf');
end;

function TSetting.GetCctvIP: string;
begin
  Result := FIniFile.ReadString('CONSOLE', 'cctv', '192.168.1.18');
end;

function TSetting.GetDatabase: string;
begin
  Result := FIniFile.ReadString(C_Section_DB, C_Ident_DB, C_Database_Conn);
end;

function TSetting.GetDBName: string;
begin
  Result := FIniFile.ReadString(C_Section_DB, C_Ident_DBName, C_Database_Name);
end;

function TSetting.GetDieselGenerator1IP: string;
begin
   Result := FIniFile.ReadString('CONSOLE', 'DieselGenerator1', '192.168.1.18');
end;

function TSetting.GetDieselGenerator2IP: string;
begin
  Result := FIniFile.ReadString('CONSOLE', 'DieselGenerator2', '192.168.1.18');
end;

function TSetting.GetDieselGenerator3IP: string;
begin
  Result := FIniFile.ReadString('CONSOLE', 'DieselGenerator3', '192.168.1.18');
end;

function TSetting.GetDieselGenerator4IP: string;
begin
  Result := FIniFile.ReadString('CONSOLE', 'DieselGenerator4', '192.168.1.18');
end;

function TSetting.GetEmergencyStopIP: string;
begin
  Result := FIniFile.ReadString('CONSOLE', 'emergencystop', '192.168.1.17');
end;

function TSetting.GetExecutedApp: string;
begin
  Result := FIniFile.ReadString(C_Section_APP, C_Ident_App, '');
end;

function TSetting.GetExecutedApp2: string;
begin
  Result := FIniFile.ReadString(C_Section_APP, C_Ident_App2, '');
end;

function TSetting.GetExecutedApp3: string;
begin
  Result := FIniFile.ReadString(C_Section_APP, C_Ident_App3, '');
end;

function TSetting.getFormPCS: TStringList;
begin
  Result := TStringList.Create;
  Result.Add(FIniFile.ReadString(C_Section_PCS, C_idFormPCS, idFormPCSDef));
end;

function TSetting.GetModulPCS: string;
begin
  Result := FIniFile.ReadString(C_Section_Help, 'ModulPCS', 'Modul PCS.pdf');
end;

function TSetting.GetMonitorMimic: Integer;
begin
  Result := FIniFile.ReadInteger(C_Section_Monitor, C_Ident_Mimic,
    C_Monitor_Mimic);
end;

function TSetting.GetOperationalACS: string;
begin
  Result := FIniFile.ReadString(C_Section_Help, 'OperationalACS',
    'Operational ACS.pdf');
end;

function TSetting.GetOperationalInstruktur: string;
begin
  Result := FIniFile.ReadString(C_Section_Help, 'OperationalInstruktur',
    'Operational Instruktur.pdf');
end;

function TSetting.GetOperationalVoip: string;
begin
  Result := FIniFile.ReadString(C_Section_Help, 'OperationalVOIP',
    'Operational VOIP.pdf');
end;

function TSetting.GetGenEmergencyIP: string;
begin
  Result := FIniFile.ReadString('CONSOLE', 'GenEmergency', '192.168.1.18');
end;

function TSetting.GetGenPsAftIP: string;
begin
  Result := FIniFile.ReadString('CONSOLE', 'GenPsAft', '192.168.1.18');
end;

function TSetting.GetGenPsFwdIP: string;
begin
  Result := FIniFile.ReadString('CONSOLE', 'GenPsFwdIP', '192.168.1.18');
end;

function TSetting.GetGenSbAftIP: string;
begin
  Result := FIniFile.ReadString('CONSOLE', 'GenSbAft', '192.168.1.18');
end;

function TSetting.GetGenSbFwdIP: string;
begin
  Result := FIniFile.ReadString('CONSOLE', 'GenSbFwd', '192.168.1.18');
end;

function TSetting.GetInstructorHost: string;
begin
  Result := FIniFile.ReadString(C_Section_Instructor, C_Ident_Server,
    C_Instructor_Host);
end;

function TSetting.GetInstructorPort: string;
begin
  Result := FIniFile.ReadString(C_Section_Instructor, C_Ident_Port,
    C_Instructor_Port);
end;

function TSetting.GetInstrukturIP: string;
begin
  Result := FIniFile.ReadString('CONSOLE', 'instruktur', '192.168.1.1');
end;

function TSetting.GetLPUPort: string;
begin
  Result := FIniFile.ReadString(C_Section_LPU, C_Ident_Port, C_LPU_Port);
end;

function TSetting.GetLPUServer: string;
begin
  Result := FIniFile.ReadString(C_Section_LPU, C_Ident_Server, C_LPU_Server);
end;

function TSetting.GetMainEngine1PsIP: string;
begin
  Result := FIniFile.ReadString('CONSOLE', 'MainEngine1Ps', '192.168.1.18');
end;

function TSetting.GetMainEngine1SbIP: string;
begin
  Result := FIniFile.ReadString('CONSOLE', 'MainEngine1Sb', '192.168.1.18');
end;

function TSetting.GetMainEngine2PsIP: string;
begin
  Result := FIniFile.ReadString('CONSOLE', 'MainEngine2Ps', '192.168.1.18');
end;

function TSetting.GetMainEngine2SbIP: string;
begin
  Result := FIniFile.ReadString('CONSOLE', 'MainEngine2Sb', '192.168.1.18');
end;

function TSetting.GetMaintenanceIPMS: string;
begin
  Result := FIniFile.ReadString(C_Section_Help, 'MaintenanceIPMS',
    'Maintenance IPMS.pdf');
end;

function TSetting.GetManualIPMS: string;
begin
  Result := FIniFile.ReadString(C_Section_Help, 'ManualIPMS',
    'Manual IPMS.pdf');
end;

function TSetting.GetMimicKananIP: string;
begin
  Result := FIniFile.ReadString('CONSOLE', 'mimickanan', '192.168.1.16');
end;

function TSetting.GetMimicKiriIP: string;
begin
  Result := FIniFile.ReadString('CONSOLE', 'mimickiri', '192.168.1.12');
end;

function TSetting.GetMimicTengahIP: string;
begin
  Result := FIniFile.ReadString('CONSOLE', 'mimictengah', '192.168.1.14');
end;

function TSetting.getMode: TStringList;
begin
  Result := TStringList.Create;
  Result.Add(FIniFile.ReadString(C_Section_Mode, C_ModeServo, modeServoDef));
  Result.Add(FIniFile.ReadString(C_Section_Mode, C_ServoPort, servoPortDef));
  Result.Add(FIniFile.ReadString(C_Section_Mode, C_AlarmPort, alarmPortDef));
  Result.Add(FIniFile.ReadString(C_Section_Mode, C_EmergencyPort,
    emergencyPortDef));
end;

function TSetting.GetPassApp: string;
var
  pass : string;
begin
  pass := FIniFile.ReadString(C_Section_APP, C_Ident_Pass_App, C_UserName_App);

  if CompareStr(pass, C_Password_App) = 0 then
    Result := pass
  else
    Result := Decode64(pass);
end;

function TSetting.GetPassword: string;
var
  pass : string;
begin
  pass := FIniFile.ReadString(C_Section_DB, C_Ident_Pass, C_Password);

  if CompareStr(pass, C_Password) = 0 then
    Result := pass
  else
    Result := Decode64(pass);
end;

function TSetting.GetPcsKananIP: string;
begin
  Result := FIniFile.ReadString('CONSOLE', 'pcskanan', '192.168.1.15');
end;

function TSetting.GetPcsKiriIP: string;
begin
  Result := FIniFile.ReadString('CONSOLE', 'pcskiri', '192.168.1.13');
end;

function TSetting.GetProtocol: string;
begin
  Result := FIniFile.ReadString(C_Section_DB, C_Ident_Protocol, C_Protocol);
end;

function TSetting.GetRole: string;
begin
  Result := FIniFile.ReadString(C_Section_Role, C_Ident_Role, C_Role_Name);
end;

function TSetting.GetServer: string;
begin
  Result := FIniFile.ReadString(C_Section_APP, C_Ident_Server, C_Server_Conn);
end;

function TSetting.GetServerIP: string;
begin
  Result := FIniFile.ReadString('CONSOLE', 'server', '192.168.1.2');
end;

function TSetting.getServoDegree: TStringList;
begin
  Result := TStringList.Create;
  Result.Add(FIniFile.ReadString(C_Section_ServoID, C_serDeg_RPMME_PS,
    servoDEGRPMMEPS));
  Result.Add(FIniFile.ReadString(C_Section_ServoID, C_serDeg_RPMME_SB,
    servoDEGRPMMESB));
  Result.Add(FIniFile.ReadString(C_Section_ServoID, C_serDeg_RPMSHAFT_PS,
    servoDEGRPMSHAFTPS));
  Result.Add(FIniFile.ReadString(C_Section_ServoID, C_serDeg_RPMSHAFT_SB,
    servoDEGRPMSHAFTSB));
  Result.Add(FIniFile.ReadString(C_Section_ServoID, C_serDeg_CPP_PS,
    servoDEGCPPPS));
  Result.Add(FIniFile.ReadString(C_Section_ServoID, C_serDeg_CPP_SB,
    servoDEGCPPSB));
  Result.Add(FIniFile.ReadString(C_Section_ServoID, C_serDeg_RUDDER_PS,
    servoDEGRUDDERPS));
  Result.Add(FIniFile.ReadString(C_Section_ServoID, C_serDeg_RUDDER_SB,
    servoDEGRUDDERSB));
end;

function TSetting.getServoID: TStringList;
begin
  Result := TStringList.Create;
  Result.Add(FIniFile.ReadString(C_Section_ServoID, C_serID_RPMME_PS,
    servoIDRPMMEPS));
  Result.Add(FIniFile.ReadString(C_Section_ServoID, C_serID_RPMME_SB,
    servoIDRPMMESB));
  Result.Add(FIniFile.ReadString(C_Section_ServoID, C_serID_RPMSHAFT_PS,
    servoIDRPMSHAFTPS));
  Result.Add(FIniFile.ReadString(C_Section_ServoID, C_serID_RPMSHAFT_SB,
    servoIDRPMSHAFTSB));
  Result.Add(FIniFile.ReadString(C_Section_ServoID, C_serID_CPP_PS,
    servoIDCPPPS));
  Result.Add(FIniFile.ReadString(C_Section_ServoID, C_serID_CPP_SB,
    servoIDCPPSB));
  Result.Add(FIniFile.ReadString(C_Section_ServoID, C_serID_RUDDER_PS,
    servoIDRUDDERPS));
  Result.Add(FIniFile.ReadString(C_Section_ServoID, C_serID_RUDDER_SB,
    servoIDRUDDERSB));
end;

function TSetting.GetShoreIP: string;
begin
  Result := FIniFile.ReadString('CONSOLE', 'Shore', '192.168.1.18');
end;

function TSetting.GetSimEnginePort: string;
begin
  Result := FIniFile.ReadString(C_Section_SimEng, C_Ident_Port,
    C_SimEngine_Port);
end;

function TSetting.GetSimEngineServer: String;
begin
  Result := FIniFile.ReadString(C_Section_SimEng, C_Ident_Server,
    C_SimEngine_Svr);
end;

function TSetting.GetUserApp: string;
var
  user : string;
begin
  user := FIniFile.ReadString(C_Section_APP, C_Ident_User_App, C_UserName_App);

  if CompareStr(user, C_UserName_App) = 0 then
    Result := user
  else
    Result := Decode64(user);
end;

function TSetting.GetUserName: string;
var
  user : string;
begin
  user := FIniFile.ReadString(C_Section_DB, C_Ident_User, C_UserName);

  if CompareStr(user, C_UserName) = 0 then
    Result := user
  else
    Result := Decode64(user);
end;

procedure TSetting.SetAcsIP(const Value: string);
begin
  FAcsIP := Value;
  FIniFile.WriteString('CONSOLE', 'acs', Value);
end;

procedure TSetting.SetAuxiliary1IP(const Value: string);
begin
  FAuxiliary1IP := Value;
  FIniFile.WriteString('CONSOLE', 'Auxiliary1', Value);
end;

procedure TSetting.SetAuxiliary2IP(const Value: string);
begin
  FAuxiliary2IP := Value;
  FIniFile.WriteString('CONSOLE', 'Auxiliary2', Value);
end;

procedure TSetting.SetAuxiliary3IP(const Value: string);
begin
  FAuxiliary3IP := Value;
  FIniFile.WriteString('CONSOLE', 'Auxiliary3', Value);
end;

procedure TSetting.SetCatalogHardware(const Value: string);
begin
  FCatalogHardware := Value;
  FIniFile.WriteString(C_Section_Help, 'CatalogHardware', Value);
end;

procedure TSetting.SetCctvIP(const Value: string);
begin
  FCctvIP := Value;
  FIniFile.WriteString('CONSOLE', 'cctv', Value);
end;

procedure TSetting.SetDatabase(const Value: string);
begin
  FDatabase := Value;
  FIniFile.WriteString(C_Section_DB, C_Ident_DB, Value);
end;

procedure TSetting.SetDBName(const Value: string);
begin
  FDBName := Value;
  FIniFile.WriteString(C_Section_DB, C_Ident_DBName, Value);
end;

procedure TSetting.SetDieselGenerator1IP(const Value: string);
begin
  FDieselGenerator1IP := Value;
  FIniFile.WriteString('CONSOLE', 'DieselGenerator1', Value);
end;

procedure TSetting.SetDieselGenerator2IP(const Value: string);
begin
  FDieselGenerator2IP := Value;
  FIniFile.WriteString('CONSOLE', 'DieselGenerator2', Value);
end;

procedure TSetting.SetDieselGenerator3IP(const Value: string);
begin
  FDieselGenerator3IP := Value;
  FIniFile.WriteString('CONSOLE', 'DieselGenerator3', Value);
end;

procedure TSetting.SetDieselGenerator4IP(const Value: string);
begin
  FDieselGenerator4IP := Value;
  FIniFile.WriteString('CONSOLE', 'DieselGenerator4', Value);
end;

procedure TSetting.SetEmergencyStopIP(const Value: string);
begin
  FEmergencyStopIP := Value;
  FIniFile.WriteString('CONSOLE', 'emergencystop', Value);
end;

procedure TSetting.SetExecutedApp(const Value: string);
begin
  FExecutedApp := Value;
  FIniFile.WriteString(C_Section_APP, C_Ident_App, Value);
end;

procedure TSetting.SetExecutedApp2(const Value: string);
begin
  FExecutedApp2 := Value;
  FIniFile.WriteString(C_Section_APP, C_Ident_App2, Value);
end;

procedure TSetting.SetExecutedApp3(const Value: string);
begin
  FExecutedApp3 := Value;
  FIniFile.WriteString(C_Section_APP, C_Ident_App3, Value);
end;

procedure TSetting.setFormPCS(liststring: TStringList);
begin
  if liststring[0] = 'PCS Kiri' then
    liststring[0] := '1'
  else if liststring[0] = 'PCS Tengah' then
    liststring[0] := '2'
  else if liststring[0] = 'PCS Kanan' then
    liststring[0] := '3';

  FIniFile.WriteString(C_Section_PCS, C_idFormPCS, liststring[0]);
end;

procedure TSetting.SetGenEmergencyIP(const Value: string);
begin
  FGenEmergencyIP := Value;
  FIniFile.WriteString('CONSOLE', 'GenEmergency', Value);
end;

procedure TSetting.SetGenPsAftIP(const Value: string);
begin
  FGenPsAftIP := Value;
  FIniFile.WriteString('CONSOLE', 'GenPsAft', Value);
end;

procedure TSetting.SetGenPsFwdIP(const Value: string);
begin
  FGenPsFwdIP := Value;
  FIniFile.WriteString('CONSOLE', 'GenPsFwd', Value);
end;

procedure TSetting.SetGenSbAftIP(const Value: string);
begin
  FGenSbAftIP := Value;
  FIniFile.WriteString('CONSOLE', 'GenSbAft', Value);
end;

procedure TSetting.SetGenSbFwdIP(const Value: string);
begin
  FGenSbFwdIP := Value;
  FIniFile.WriteString('CONSOLE', 'GenSbFwd', Value);
end;

procedure TSetting.SetInstructorHost(const Value: string);
begin
  FInstructorHost := Value;
  FIniFile.WriteString(C_Section_Instructor, C_Ident_Server, Value);
end;

procedure TSetting.SetInstructorPort(const Value: string);
begin
  FInstructorPort := Value;
  FIniFile.WriteString(C_Section_Instructor, C_Ident_Port, Value);
end;

procedure TSetting.SetInstrukturIP(const Value: string);
begin
  FInstrukturIP := Value;
  FIniFile.WriteString('CONSOLE', 'instruktur', Value);
end;

procedure TSetting.SetLPUPort(const Value: string);
begin
  FLPUPort := Value;
  FIniFile.WriteString(C_Section_LPU, C_Ident_Port, Value);
end;

procedure TSetting.SetLPUServer(const Value: string);
begin
  FLPUServer := Value;
  FIniFile.WriteString(C_Section_LPU, C_Ident_Server, Value);
end;

procedure TSetting.SetMainEngine1PsIP(const Value: string);
begin
  FMainEngine1PsIP := Value;
  FIniFile.WriteString('CONSOLE', 'MainEngine1Ps', Value);
end;

procedure TSetting.SetMainEngine1SbIP(const Value: string);
begin
  FMainEngine1SbIP := Value;
  FIniFile.WriteString('CONSOLE', 'MainEngine1Sb', Value);
end;

procedure TSetting.SetMainEngine2PsIP(const Value: string);
begin
  FMainEngine2PsIP := Value;
  FIniFile.WriteString('CONSOLE', 'MainEngine2Ps', Value);
end;

procedure TSetting.SetMainEngine2SbIP(const Value: string);
begin
  FMainEngine2SbIP := Value;
  FIniFile.WriteString('CONSOLE', 'MainEngine2Sb', Value);
end;

procedure TSetting.SetMaintenanceIPMS(const Value: string);
begin
  FMaintenanceIPMS := Value;
  FIniFile.WriteString(C_Section_Help, 'MaintenanceIPMS', Value);
end;

procedure TSetting.SetManualIPMS(const Value: string);
begin
  FManualIPMS := Value;
  FIniFile.WriteString(C_Section_Help, 'ManualIPMS', Value);
end;

procedure TSetting.SetMimicKananIp(const Value: string);
begin
  FMimicKananIP := Value;
  FIniFile.WriteString('CONSOLE', 'mimickanan', Value);
end;

procedure TSetting.SetMimicKiriIP(const Value: string);
begin
  FMimicKiriIP := Value;
  FIniFile.WriteString('CONSOLE', 'mimickiri', Value);
end;

procedure TSetting.SetMimicTengahIP(const Value: string);
begin
  FMimicTengahIP := Value;
  FIniFile.WriteString('CONSOLE', 'mimictengah', Value);
end;

procedure TSetting.setMode(liststring: TStringList);
begin
  if liststring[0] = 'On' then
    liststring[0] := '0'
  else if liststring[0] = 'OFF' then
    liststring[0] := '1';

  FIniFile.WriteString(C_Section_Mode, C_ModeServo, liststring[0]);
  FIniFile.WriteString(C_Section_Mode, C_ServoPort, liststring[1]);
  FIniFile.WriteString(C_Section_Mode, C_AlarmPort, liststring[2]);
  FIniFile.WriteString(C_Section_Mode, C_EmergencyPort, liststring[3]);
end;

procedure TSetting.SetModulPCS(const Value: string);
begin
  FModulPCS := Value;
  FIniFile.WriteString(C_Section_Help, 'ModulPCS', Value);
end;

procedure TSetting.SetMonitorMimic(const Value: Integer);
begin
  FMonitorMimic := Value;
  FIniFile.WriteInteger(C_Section_Monitor, C_Ident_Mimic, Value);
end;

procedure TSetting.SetOperationalACS(const Value: string);
begin
  FOperationalACS := Value;
  FIniFile.WriteString(C_Section_Help, 'OperationalACS', Value);
end;

procedure TSetting.SetOperationalInstruktur(const Value: string);
begin
  FOperationalInstruktur := Value;
  FIniFile.WriteString(C_Section_Help, 'OperationalInstruktur', Value);
end;

procedure TSetting.SetOperationalVoip(const Value: string);
begin
  FOperationalVoip := Value;
  FIniFile.WriteString(C_Section_Help, 'OperationalVOIP', Value);
end;

procedure TSetting.SetPassApp(const Value: string);
begin
  FPassApp := Value;
  FIniFile.WriteString(C_Section_APP, C_Ident_Pass_App, Encode64(Value));
end;

procedure TSetting.SetPassword(const Value: string);
begin
  FPassword := Value;
  FIniFile.WriteString(C_Section_DB, C_Ident_Pass, Encode64(Value));
end;

procedure TSetting.SetPcsKananIP(const Value: string);
begin
  FPcsKananIP := Value;
  FIniFile.WriteString('CONSOLE', 'pcskanan', Value);
end;

procedure TSetting.SetPcsKiriIP(const Value: string);
begin
  FPcsKiriIP := Value;
  FIniFile.WriteString('CONSOLE', 'pcskiri', Value);
end;

procedure TSetting.SetProtocol(const Value: string);
begin
  FProtocol := Value;
  FIniFile.WriteString(C_Section_DB, C_Ident_Protocol, Value);
end;

procedure TSetting.SetRole(const aValue: string);
begin
  FRole := aValue;
  FIniFile.WriteString(C_Section_Role, C_Ident_Role, FRole);
end;

procedure TSetting.SetServer(const Value: string);
begin
  FServer := Value;
  FIniFile.WriteString(C_Section_APP, C_Ident_Server, Value);
end;

procedure TSetting.SetServerIP(const Value: string);
begin
  FServerIP := Value;
  FIniFile.WriteString('CONSOLE', 'server', Value);
end;

procedure TSetting.setServoDegree(liststring: TStringList);
begin
  FIniFile.WriteString(C_Section_ServoID, C_serDeg_RPMME_PS, liststring[0]);
  FIniFile.WriteString(C_Section_ServoID, C_serDeg_RPMME_SB, liststring[1]);
  FIniFile.WriteString(C_Section_ServoID, C_serDeg_RPMSHAFT_PS, liststring[2]);
  FIniFile.WriteString(C_Section_ServoID, C_serDeg_RPMSHAFT_SB, liststring[3]);
  FIniFile.WriteString(C_Section_ServoID, C_serDeg_CPP_PS, liststring[4]);
  FIniFile.WriteString(C_Section_ServoID, C_serDeg_CPP_SB, liststring[5]);
  FIniFile.WriteString(C_Section_ServoID, C_serDeg_RUDDER_PS, liststring[6]);
  FIniFile.WriteString(C_Section_ServoID, C_serDeg_RUDDER_SB, liststring[7]);
end;

procedure TSetting.setServoID(liststring: TStringList);
begin
  FIniFile.WriteString(C_Section_ServoID, C_serID_RPMME_PS, liststring[0]);
  FIniFile.WriteString(C_Section_ServoID, C_serID_RPMME_SB, liststring[1]);
  FIniFile.WriteString(C_Section_ServoID, C_serID_RPMSHAFT_PS, liststring[2]);
  FIniFile.WriteString(C_Section_ServoID, C_serID_RPMSHAFT_SB, liststring[3]);
  FIniFile.WriteString(C_Section_ServoID, C_serID_CPP_PS, liststring[4]);
  FIniFile.WriteString(C_Section_ServoID, C_serID_CPP_SB, liststring[5]);
  FIniFile.WriteString(C_Section_ServoID, C_serID_RUDDER_PS, liststring[6]);
  FIniFile.WriteString(C_Section_ServoID, C_serID_RUDDER_SB, liststring[7]);
end;

{procedure TSetting.setServoID(const serIDRPMMEPS, serIDRPMMESB, serIDRPMSHAFTPS,
  serIDRPMSHAFTSB, serIDCPPPS, serIDCPPSB, serIDRUDDERPS,
  serIDRUDDERSB: Integer);
begin
  FIniFile.WriteString(C_Section_ServoID, C_serID_RPMME_PS, IntToStr(serIDRPMMEPS));
  FIniFile.WriteString(C_Section_ServoID, C_serID_RPMME_SB, IntToStr(serIDRPMMESB));
  FIniFile.WriteString(C_Section_ServoID, C_serID_RPMSHAFT_PS, IntToStr(serIDRPMSHAFTPS));
  FIniFile.WriteString(C_Section_ServoID, C_serID_RPMSHAFT_SB, IntToStr(serIDRPMSHAFTSB));
  FIniFile.WriteString(C_Section_ServoID, C_serID_CPP_PS, IntToStr(serIDCPPPS));
  FIniFile.WriteString(C_Section_ServoID, C_serID_CPP_SB, IntToStr(serIDCPPSB));
  FIniFile.WriteString(C_Section_ServoID, C_serID_RUDDER_PS, IntToStr(serIDRUDDERPS));
  FIniFile.WriteString(C_Section_ServoID, C_serID_RUDDER_SB, IntToStr(serIDRUDDERSB));
end;
}

procedure TSetting.SetShoreIP(const Value: string);
begin
  FShoreIP := Value;
  FIniFile.WriteString('CONSOLE', 'Shore', Value);
end;

procedure TSetting.SetSimEnginePort(const Value: string);
begin
  FSimEnginePort := Value;
  FIniFile.WriteString(C_Section_SimEng, C_Ident_Port, Value);
end;

procedure TSetting.SetSimEngineServer(const Value: string);
begin
  FSimEngineServer := Value;
  FIniFile.WriteString(C_Section_SimEng, C_Ident_Server, Value);
end;

procedure TSetting.SetUserApp(const Value: string);
begin
  FUserApp := Value;
  FIniFile.WriteString(C_Section_APP, C_Ident_User_App, Encode64(Value));
end;

procedure TSetting.SetUserName(const Value: string);
begin
  FUserName := Value;
  FIniFile.WriteString(C_Section_DB, C_Ident_User, Encode64(Value));
end;

end.
