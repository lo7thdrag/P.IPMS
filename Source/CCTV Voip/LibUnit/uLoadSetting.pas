unit uLoadSetting;

interface

uses
  Classes, IniFiles, SysUtils;

type
  TIniSet = class
    private
    public
      { Port Connection }
      { Server }
      portListenConnector,
      portListenControl,
      portListenSessionVoip : string;
      { Phone }
      portTCPConnector,
      portTCPSessionVoip,
      portTCPControl,
      portControlServer,
      portBridge  : string;
      { INCS Laucher Listen Port }
      IncsLauncherPort,
      { addr Connection}
      addrTCPConnector,
      addrTCPSessionVoip,
      addrTCPControl,
      addrControlServer,
      addrBridge : string;
      { SSH to Linux Server }
      ParamPutty : string;
      { Waiting Connection }
      TimeWaitPreplay,
      TimeWaitRun : integer;

      aRole : string;
      aCub  : Integer;
      aStrCub : string;

      { Room Phone }
      aRoomExternal,
      aRoomInternal : Integer;
      { Port Phone }
      InternalStartPort_SIP,
      InternalStartPort_VOIP,
      ExternalStartPort_SIP,
      ExternalStartPort_VOIP : Integer;

      TotalCub : integer;

      AutoStart,
      StartMode : Integer;

      TrayMode,
      BorderMode: Integer;

      // Arduino call button
      ComPortNr: string;
      ComBtnEnabled: Integer;
      BaudRate : Byte;
      DataBits : Byte;
      StopBits : Byte;
      ParityBits : Byte;
      FlowControl : Byte;

      isEnableBridge : Boolean;
      isEnableLinux : Boolean;

      { Skin }
      idSkin : Integer;
      { Position Phone }
      Monitor,
      PhoneTop,
      PhoneLeft : integer;

      ExternalIniName,
      InternalIniName,

      ExternalExeName,
      InternalExeName,
      HFExeName,
      UHFExeName,
      UWTExeName,
      FMExeName,
      NoRXExeName,
      NonHFExeName,
      JammingPlayerExeName: string;
      Location: string;
      isConnectorLog: Boolean;

      procedure LoadSet(iniPath : string);

      constructor create;
      destructor Destroy; override;

    published
  end;

  procedure GetWavesDevIDSettings(inipath: string; var wvin, wvout: Integer);

implementation

procedure GetWavesDevIDSettings(inipath: string; var wvin, wvout: Integer);
var
  ini : TIniFile;
begin

  ini := TIniFile.Create(iniPath);

  try
    wvin := ini.ReadInteger('Device', 'WaveInDeviceID', -1);
    wvout := ini.ReadInteger('Device', 'WaveOutDeviceID', -1);
  finally
    ini.Free;
  end;

end;

{ TIniSet }

constructor TIniSet.create;
begin

end;

destructor TIniSet.Destroy;
begin

  inherited;
end;


procedure TIniSet.LoadSet(iniPath: string);
var
  ini : TIniFile;
begin
  try
    ini := TIniFile.Create(iniPath);

    //Address
    addrTCPConnector := Trim(ini.ReadString('Server', 'addrConnector', '127.0.0.1'));
    addrTCPSessionVoip := Trim(ini.ReadString('Server', 'addrSessionVoip', '127.0.0.1'));
    addrTCPControl := Trim(ini.ReadString('Server', 'addrControl', '127.0.0.1'));
    addrControlServer := Trim(ini.ReadString('Server', 'addrServer', '127.0.0.1'));
    addrBridge := Trim(ini.ReadString('Server', 'addrBridge', '127.0.0.1'));

    //Port
    portTCPConnector := Trim(ini.ReadString('Server', 'portConnector', '8388'));
    portTCPSessionVoip := Trim(ini.ReadString('Server', 'portSessionVoip', '8188'));
    portTCPControl := Trim(ini.ReadString('Server', 'portControl', '8888'));
    portControlServer := Trim(ini.ReadString('Server', 'portServer', '5001'));
    portBridge := Trim(ini.ReadString('Server', 'portBridge', '8889'));

    //ssh
    ParamPutty := Trim(ini.ReadString('Putty', 'Param', ''));

    //Listen
    portListenConnector := Trim(ini.ReadString('Listen', 'PortlistenConnector', ''));
    portListenControl := Trim(ini.ReadString('Listen', 'PortlistenControl', ''));
    portListenSessionVoip := Trim(ini.ReadString('Listen', 'PortlistenSessionVoip', ''));
    IncsLauncherPort := Trim(ini.ReadString('Server', 'IncsLauncherPort', '1308'));

    aCub := ini.ReadInteger('Role', 'Cubicle', 0);
    aRole := trim(ini.ReadString('Role', 'Console', ''));
    aStrCub := 'Cubicle' + IntToStr(aCub);

    TimeWaitPreplay := ini.ReadInteger('AutoStart', 'WtPreplay', 30);
    TimeWaitRun := ini.ReadInteger('AutoStart', 'WtRun', 30);
    isEnableBridge := ini.ReadBool('AutoStart', 'EnableBridge', false);
    isEnableLinux := ini.ReadBool('AutoStart', 'EnableLinux', false);

    aRoomExternal := ini.ReadInteger('Room', 'External', 0);
    aRoomInternal := ini.ReadInteger('Room', 'Internal', 0);

    InternalStartPort_SIP := ini.ReadInteger('Port', 'InternalSIPPort', 0);
    InternalStartPort_VOIP := ini.ReadInteger('Port', 'InternalVoipPort', 0);
    ExternalStartPort_SIP := ini.ReadInteger('Port', 'ExternalSIPPort', 0);
    ExternalStartPort_VOIP := ini.ReadInteger('Port', 'ExternalVoipPort', 0);

    AutoStart := ini.ReadInteger('Start', 'Auto', 0);
    StartMode := ini.ReadInteger('Start', 'Mode', 0);

    TrayMode := ini.ReadInteger('App', 'Tray', 0);
    BorderMode := ini.ReadInteger('App', 'Border', 0);

    // Arduino button
    ComPortNr := trim(ini.ReadString('ArduinoBtn', 'Name', 'COM1'));
    ComBtnEnabled := ini.ReadInteger('ArduinoBtn', 'Enable', 0);
    BaudRate := ini.ReadInteger('ArduinoBtn', 'BaudRate', 0);
    DataBits := ini.ReadInteger('ArduinoBtn', 'DataBits', 0);
    StopBits := ini.ReadInteger('ArduinoBtn', 'StopBits', 0);
    ParityBits := ini.ReadInteger('ArduinoBtn', 'ParityBits', 0);
    FlowControl := ini.ReadInteger('ArduinoBtn', 'FlowControl', 0);


    TotalCub := ini.ReadInteger('Cub', 'TotalCubicle', 0);

    Monitor := ini.ReadInteger('Position', 'Monitor',0);

    PhoneTop := ini.ReadInteger('Position', 'Top', 0);
    PhoneLeft := ini.ReadInteger('Position', 'Left', 0);

    idSkin := ini.ReadInteger('SkinPhone', 'Skin', 1);

    ExternalIniName := trim(ini.ReadString('App', 'ExternalIniName', 'clVoip_external.ini'));
    InternalIniName := trim(ini.ReadString('App', 'InternalIniName', 'clVoip_internal.ini'));

    ExternalExeName := trim(ini.ReadString('App', 'ExternalExeName', 'clVoip_external.exe'));
    InternalExeName := trim(ini.ReadString('App', 'InternalExeName', 'clVoip_internal.exe'));
    HFExeName := trim(ini.ReadString('App', 'HFExeName', 'clVoip_HF.exe'));
    UHFExeName := trim(ini.ReadString('App', 'UHFExeName', 'clVoip_UHF.exe'));
    UWTExeName := trim(ini.ReadString('App', 'UWTExeName', 'clVoip_UWT.exe'));
    FMExeName := trim(ini.ReadString('App', 'FMExeName', 'clVoip_FM.exe'));
    NoRXExeName := trim(ini.ReadString('App', 'NoRXExeName', 'clVoip_NoRx.exe'));
    NonHFExeName := trim(ini.ReadString('App', 'NonHFExeName', 'clVoip_nonHF.exe'));
    JammingPlayerExeName := trim(ini.ReadString('App', 'JammingPlayerExeName', ''));

    isConnectorLog := True;

  finally
    ini.Free;
  end;
end;

end.
