unit uDataVoipRecord;

interface

uses
  Classes, uTCPDatatype, StdCtrls, ExtCtrls, Messages;

const
  WM_ICONTRAY = WM_USER + 1;
  WM_ICONTRAY_IPMS = WM_USER + 2;

  btn_width = 190;
  btn_height = 80;
  btn_separator = 10;

  Pnl_Width = 190;
  Pnl_height = 20;
  Pnl_Separator = 10;

  lbl_width = 190;
  lbl_height = 20;
  lbl_separator = 10;

  CPID_ICSData = 1;
  CPID_ICSDataPhone = 2;
  CPID_ICSDataJam = 3;
  CPID_ICSRespon = 4;
  CPID_Internal = 5;
  CPID_GroupID = 6;                // Get Group ID
  CPID_ReqGroup = 7;               // Request Group ID
  CPID_ReqLogin = 8;               // Request Role Login
  CPID_ControllerLogin = 9;        // Get Controller Login
  CPID_Termination_Option = 10;
  CPID_Request_DeviceCheck = 11;

  CPID_REQ          = 10;
    //RequestID
    CREQID_DBEDIT_SESSION    = 1;
    CREQID_GAME_SESSION      = 2;
    CREQID_ONLINE_LIST       = 3;

  CPID_SESSIONSTATE = 12;
    // OrderID
    CID_INFO        = 0;  //server send info
    CID_CREATE      = 1;
    CID_DESTROY     = 2;
    CID_CONNECT     = 3; //client connect to a game /
    CID_DISCONNECT  = 4; //client connect to a game /

  CPID_SESSIONJOIN = 13;
  CPID_SESSIONONLINELIST = 14;
  CPID_CUBICLEASSIGN = 15;
  CPID_MODECALL = 16;

  CPID_RecArchos = 20;             // Archos Restart
  CPID_ResponPTT = 21;
  CPID_Distance = 22;
  CPID_SessionPlay = 30;
  CPID_OnlineCub = 31;
  CPID_OnlineCon = 32;
  CPID_Server_Stat = 33;
  REC_2D_ORDER  = 54;

  CPID_Jamming = 200;

  //REC_2D_ORDER= 54; ----------------------------------------------------------
  ///*****************************////
  _CM_CLIENT_MANAGE             = 1;
    __CM_CLIENT_CONNECT            = 1;
    __CM_CLIENT_DISCONNECT         = 2;
    __CM_CLIENT_WELCOME            = 3;
    __CM_CLIENT_RESTART            = 4;
    __CM_CLIENT_SHUTDOWN           = 5;
    __CM_CLIENT_RESET              = 6;
    __CM_CLIENT_REQDB_ADDR         = 7;
    __CM_CLIENT_SETDB_ADDR         = 8;
    __CM_CLIENT_REQ3D_ADDR         = 9;
    __CM_CLIENT_SET3D_ADDR         = 10;
    __CM_CLIENT_CLOSE_LAUNCHER     = 11;
    __CM_CLIENT_REQ_SIM_TIME       = 12;
    __CM_CLIENT_SET_SIM_TIME       = 13;
    __CM_CLIENT_RESTART_ALL        = 14;
    __CM_CLIENT_SHUTDOWN_ALL       = 15;
    __CM_CLIENT_RESTARTALLCOMM     = 16;
    __CM_CLIENT_SHUTDOWNALLCOM     = 17;
    __CM_CLIENT_RESTARTSERVERCOMM  = 18;
    __CM_CLIENT_SHUTDOWNSERVERCOMM = 19;
    __CM_CLIENT_CLOSEALLCOM        = 20;
  _CM_CLIENT_APP                = 2;
    __CM_CLIENT_LAUNCH             = 1;
    __CM_CLIENT_STOP               = 2;
    __CM_CLIENT_RELAUNCH           = 3;
    __CM_CLIENT_LAUNCHALL          = 4;
  _CM_CLIENT_CHECK              = 3;
  _CM_CLIENT_CHECKSCENARIOID    = 4;
  _CM_CLIENT_CONNECT            = 5;
    __CM_CLIENT_INST               = 1;
    __CM_CLIENT_CONSOLE            = 2;
    __CM_CLIENT_LAUNCHER           = 3;
  _CM_REQ_SYNCPACKET            = 6;

  ///*****************************////

type
  PChannelMapping = ^TChannelMapping;
  TChannelMapping = record
    User: string;
    Pass: string;
    Channel: string;
    Mode: Integer;
    Button: TButton;
    ChannelName : string;
    Labl : TLabel;
    Pnl : TPanel;
    Jamming : integer;
    UsrLogin : Boolean;
    Band : Integer;
    Frek : Double;
    Security : Integer;
  end;

  PLoginMapping = ^TLoginMapping;
  TLoginMapping = record
    StudentRoleLogin : string;
    Button : TButton;
  end;

  //  CPID_ICSData = 1;
  PICSData = ^TICSData;
  TICSData = record
    PacketID : TPacketID;
    Mode : integer;                //1. Run External Phone; 2. Run Internal Phone
    ParamPhone : string[150];      //Parameter Phone
    ParamJam   : string[60];       //Parameter Jamming Player
  end;

  //  CPID_ICSDataPhone = 2;
  //  ICS Data
  PICSDataPhone = ^TICSDataPhone;
  TICSDataPhone = record
    PacketID : TPacketID;
    cmd: string[15];               //Mode = Mode Phone; Quit = Terminate Phone
    Mode: Integer;                 //1. Off; 2. Rx; 3. Tx/Rx; 4. Ptt On; 5. Ptt Off
    Id : Integer;
  end;

  //  IPC Data
  PIPCDataPhone = ^TIPCDataPhone;
  TIPCDataPhone = record
    cmd: string[15];               //Mode = Mode Phone; Quit = Terminate Phone
    Mode: Integer;                 //1. Off; 2. Rx; 3. Tx/Rx; 4. Ptt On; 5. Ptt Off
    Id : Integer;
  end;

  //  CPID_IPCDataJam = 3;
  //  ICS Data
  PICSDataJam = ^TICSDataJam;
  TICSDataJam = record
    PacketID : TPacketID;
    cmd: string[15];              //Mode = Mode Jamming; Quit = Terminate Jamming PLayer
    Mode: Integer;                //1. Jamming; 2. Noise; 3. MHTones; 4. Clear
    Id : Integer;

    Volume : Integer;
  end;

  //  IPC Data
  PIPCDataJam = ^TIPCDataJam;
  TIPCDataJam = record
    cmd: string[15];              //Mode = Mode Jamming; Quit = Terminate Jamming PLayer
    channel : string[20];
    Mode: Integer;                //1. Jamming; 2. Noise; 3. MHTones; 4. Clear
    Id : Integer;

    Volume : Integer;
  end;

  //  CPID_ICSRespon = 4;
  //  ICS Data
  PICSRecRespon = ^TICSRecRespon;
  TICSRecRespon = record              // Can Change Mode Phone if Respon form Server is 1
    PacketID : TPacketID;
    Respon : byte;
  end;

  // IPC Data
  PIPCRecRespon = ^TIPCRecRespon;
  TIPCRecRespon = record              // Can Change Mode Phone if Respon form Server is 1
    Respon : byte;
  end;

  //  CPID_Internal = 5;
  PRecInternal = ^TRecInternal;
  TRecInternal = Record
    PacketID : TPacketID;
    Mode : integer;                   //1 : Login, 2: Call, 3: Disconnect
    RoleCub : String[20];
    RoleAs : string[20];
    Login : string[20];               //For Login and Call Internal (for Traine)
    Logout : string[20];
    CallFrom  : String[60];
    CallTo    : String[60];
    DisConnectFrom : string[60];
    DisConnectTo : string[60];
  End;

  //  CPID_GroupID = 6;
  PRecGroupID = ^TRecGroupID;
  TRecGroupID = Record
    PacketID : TPacketID;
    Cubicle : String[15];
    GroupID : integer;
  End;

  TRecServerStat = record
    pid          : TPacketID;
    Mode         : Byte;
    StateServer1 : Byte;
    StateServer2 : Byte;
  end;

  //REC_2D_ORDER= 54; -------------------------------------------------------
  TRecData2DOrder = record
    pc         : TPacketCheck;
    orderID    : byte;
    numValue   : integer;
    strValue   : string[15];
    strValue2  : string[15];
    strValue3  : string[15];
    ipConsole  : string[15];
  end;

  //  CPID_ReqGroup = 7;
  PRecReqGroupID = ^TRecReqGroupID;
  TRecReqGroupID = Record
    PacketID : TPacketID;
    Cubicle : String[15];
    Mode : integer;
  End;

  //  CPID_ReqLogin = 8;
  PRecReqLogin = ^TRecReqLogin;
  TRecReqLogin = Record
    PacketID : TPacketID;
    Cubicle : String[15];
    Mode : integer;
  End;

  //  CPID_ControllerLogin = 9;
  TRecControllerLogin = record
    PacketID : TPacketID;
    ControllerCom : string[30];
    Mode : Integer;                      // 1 : Controller Login, 2 : Request
  end;

  //  CPID_REQ     = 10;
  TRecRequest = packed record
    pid           : TPacketID;
    RequestID     : Byte;
    RequestParam  : Byte;
  end;

  //  CPID_SessionPlay
  TRecSessionPlay = record
    PacketID  : TPacketID;
    Mode      : Integer;
    CubName   : string[20];
    CubAs     : string[20];
  end;

  TRecOnlineCub = record
    PacketID : TPacketID;
    mode : Integer;
    CubOnline : string[50];
  end;

  TRecOnlineCon = record
    PacketID : TPacketID;
    mode : Integer;
    ConOnline : string[50];
  end;

  //  CPID_SESSIONSTATE = 12;
  //  record dari Instruktur
  TRecSessionState = packed record   // packet of TSessionVar
    pid           : TPacketID;
    Order         : Byte;    // info or update
    SessionType   : Byte;
    SessionStat   : Byte;
    ScenarioID    : Integer;
    SessionID     : Integer; // reserverd for multisession
    ExerciseName  : string[60];
  end;

  //  CPID_SESSIONJOIN = 13;
  //  record dari siswa
  TRecSessionJoin = packed record   // packet of TSessionVar
    pid           : TPacketID;
    Order         : Byte;           // connect or disconnect
    SessionType   : Byte;
    SessionID     : Integer; // reserverd for multisession
    HostName      : string[32];
  end;

  //  CPID_SESSIONONLINELIST = 14;
  TRecNodeOnlineList = packed record
    pid       : TPacketID;
    NodeOrder : Word;  // info / update
    B3        : byte;
    B2        : byte;
    B1        : byte;
    B0        : array [0..7] of LongWord;
  end;

  //  CPID_CUBICLE ASSIGN = 15;
  PRecCubAssign = ^TRecCubAssign;
  TRecCubAssign = packed record
    pid       : TPacketID;
    cmdID     : Byte;
    GroupID   : Integer;
    LongIP    : LongWord;
  end;

  //  CPID_Jamming = 200;
  TrecJamming = record
    Pid : TPacketID;

    Cmd : string[20];
    Channel : string[30];
    Mode : Integer;
    Volume : Integer;
  end;

  //  CPID_RecArchos = 20;
  PRecArchos = ^TRecArchos;
  TRecArchos = record
    PacketID : TPacketID;
    Mode: Integer;
    Id : Integer;
  end;

  PIPCResponPTT = ^TIPCResponPTT;
  TIPCResponPTT = record
    Freq : string[10];
    Respon : byte;       //1 : Ready For Speak (On), 0 : Can't Speak (Off)
  end;

  PICSResponPTT = ^TICSResponPTT;
  TICSResponPTT = record
    PacketID : TPacketID;
    Freq : string[10];
    Respon : byte;       //1 : Ready For Speak (On), 0 : Can't Speak (Off)
  end;

  PIPCDataDistance = ^TIPCDataDistance;
  TIPCDataDistance = record
    cmd : string[10];
    mode : Integer;
    ShipOutRange : string[10];
  end;

  PICSDataDistance = ^TICSDataDistance;
  TICSDataDistance = record
    PacketID : TPacketID;
    cmd : string[10];
    mode : Integer;
    ShipOutRange : string[10];
  end;

  TRecCallMode = record
    PacketID : TPacketID;
    IsAutoCall : Boolean;
  end;

  TRecOrder = record
    PacketID : TPacketID;
    OrderMsg: string[100];
    OrderVal : Byte;
  end;

implementation


end.
