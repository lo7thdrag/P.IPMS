unit uTCPDatatype;
{versi lengkap, urut}

interface

uses
  Classes, Windows, OverbyteIcswSocket;

//==============================================================================
const

  CTMR_INTRVL_SINGLEPUMP_RDR = 225;
  CTMR_INTRVL_DUALPUMP_RDR = 125;
  CSOCK_BUFFER_SIZE = 2048 * 2048;
    CSOCK_DEF_PROTO = 'tcp';

  CSOCK_DEF_PORT = '1809';
  CMAX_PACKET_BYTESIZE = 2;      // 2 byte = 64KB

  HC_RECID_STRING: word = 0;

  function TimeStr: string;
  function DateStr: string;

  function LongIp_To_StrIp(const lIP: LongWord): string;
  function StrIp_To_LongIp(const s: string): LongWord;

  function SockStateToString(const st: TSocketState): string;

type

  TSingleDualPumpsOps = (tSinglePump, tDualPumps);
  TAlarmCause = (tacGuardZone, tacTCPA);

  TReplayStatus = (rsCreated, rsOpenFile, rsRePlay, rsRePlayPause, rsEnd);
  TRecorderStatus = (rcCreated, rcInitialized, rcRecording);

  TClutchState = (csEngaged, csDisengage, csDiff);
  TRudderControlMode = (rcmIndependent, rcmSync, rcmAuto); // for Sigma

  TMovementControlType = (mcManual, mcWaypoint);

  TInterfaceType  = (iTelegraf, iAlarm, iBell, iLeverControl, iRudder, iAutoPilot,
                    iMOB, iCO2Control, iRadar, iRemoteControlSystem, iEngineTelegraph,
                    iNorseLight, iPot_NLCU_Illum_Hor,iPot_NLCU_Illum_Ver,
                    iPot_IPMS2_Illum_Hor,iPot_IPMS2_Illum_Ver,
                    iPot_Norse_Hor_Speed_PS,iPot_Norse_Ver_Speed_PS,
                    iPot_Norse_Left_Right_PS,iPot_Norse_Up_Down_PS,
                    iPot_Radar_Rain,iPot_Radar_Gain,iPot_Radar_SEA,iPot_Radar_EBL,
                    iPot_Radar_VRM,
                    iNLCU, iLifeBuoy, iStartUp, iThrottleJL,iWiper,iSteerJL,iVisualSignal
                    );
  TCommand_Mode = (cThrottle, cPCS, cTelegraph);

  TLedArray = array of Integer;
  TDataSendArray = array of Single;

  TInputType = (toggleBtn, pressBtn,LampTest,pressBtnPoll, selector, pressBtnOff,
                toggleSwitch, turnOnOneLED, blinkLED,potensioAsButton,
                toggleBtnCheck);

  // for JNL Raytheon Radar
  TDisplayModeView     = (dmvPrimary,dmvAdvance,dmvBlur,dmvSweep,dmvRings,dmvTrack,dmvNoise);

  TButtonInterface = record
      buttonPressed   : Boolean;
      inputType       : TInputType;
      sendData3D      : Boolean;
      sendData        : Boolean;
      ordIDs          : TDataSendArray;
      pinButton       : Integer;
      TurnOnLed       : Boolean;
      portIndicators  : TLedArray;
      interfaceType   : TInterfaceType;
      buttonState     : word;
      end;
  TPotensio = record
      pinPotensio     : Integer;
      bClockWise      : Boolean;
      minValRange     : Single;
      maxValRange     : Single;
      minPotRange     : Single;
      maxPotRange     : Single;
      interfaceType   : TInterfaceType;
      lastVal         : Double;
      sendData3D      : Boolean;
      inputType       : TInputType;
      ordIDs          : TDataSendArray;
      portIndicators  : TLedArray;
      msDelay,lastMsDelay :double;
      msInitCheck :double;
      TurnOnLed       : Boolean;
      countError      : integer;
      end;


//==============================================================================
  TPacketID = record            // 16 byte header
    recSize     : Word;         //    2  size of packet.
    recID       : Word;         //    2  record ID.
    ipSender    : LongWord;     //    4  original sender,
    ipReceiver  : LongWord;     //    4  message destination
    recTime     : LongWord;     //    4  time, recording
  end;

{  TPacketAddr  = record
    ipSender    : LongWord;     //    4  original sender,
    ipReceiver  : LongWord;     //    4  message destination
    recTime     : LongWord;     //    4  time, recording
  end;
}

//==============================================================================

  tDouble3DPoint = record
    X, Y, Z: double;
  end;

  tSingle3DPoint = record
    X, Y, Z: single;
  end;

  //moved to BaseDataType
//  tDouble2DPoint = record
//    X, Y: double;
//  end;

  TAlarm = record
    subject : string;
    messages : string;
    dateTime : TDateTime;
    objIndex : Array of Integer;
    cause : TAlarmCause;
  end;

  // -- { User Settings } ------------------------------------------------------
  TUser = Record
    Group, Title : String[20];
    gain, tune : integer;
    range : double;
    rangeRings : Boolean;
    vrmVisible, eblVisible : array [0..3] of Boolean;
    vrm, ebl : array [0..3] of double;
    pilVisible : array [0..9] of Boolean;
    pilDistance, pilBearing : array [0..9] of double;
    TMRMmode, Orientation : integer;
    offCenter : Boolean;
//    Stabilization :
    Trails : Integer;
    PastPositionPeriod : integer;
    TrueVector : Boolean;
    VectorLength : Integer;
//    AisDisplay, AIStargetAlert, AISactivation, Chart, AISatoNs, AISoutline,
//    PCP/CPASymbol, CPAwarning, TargetLabel,  : Boolean
//    AISfilterRange : Integer
  end;

  TPacketCheck = record
    recSize     : Word;         //    2  size of packet.
    ID          : Word;         //    2  record ID.
    ipSender    : LongWord;     //    4  original sender,
    ipReceiver  : LongWord;     //    4  message destination
    recTime     : LongWord;
  end;

  TRecObjID = record
    ObjDBID: Word;
    EntityID: Integer;
  end;

  TRecPositionData = record
    PosX, PosY, PosZ: Double;
  end;


  //----------------------------------------------------------------------------
  //REC_3D_WAYPOINT = 12;
{  TRec3DDataWaypoint = record
    ID: byte;
    Pass: array[0..2] of char;
    ParentUID: string[12];
    UniqueID: string[12];
    Order: integer;
    ProfileType: byte;
    X: double;
    Y: double;
    Speed: single;
    Halu: single;
    Durasi: longword;
    ETA: longword;
  end;
 }

 TRecDataEnvi = record
    Rain,
    Fog,//: Byte;
    RainIntensityValue,
    RainDropValue,
    SimTimeHour,
    SimTimeMin,
    FogIntensityValue,
    WindDir,
    WindSpeed,
    WaveDir,
    WaveSpeed: Single;
  end;

  //REC_3D_POSITION = 1; -----------------------------------------------------
  TRecData3DPosition = record
    pc: TPacketCheck;
    ConsoleID, ShipDbID: word;
    EntityID : LongWord;
    x, y, z: single;
    heading: single;
    speed: single;
    pitch: single;
    roll: single;
    rudder: single; //
    groundSpeed : single;
  end;

//  TRecData3DPositionReplay = record
//    pc: TPacketCheck;
//    ConsoleID, ShipDbID: word;
//    EntityID : LongWord;
//    x, y, z: single;
//    heading: single;
//    speed: single;
//    pitch: single;
//    roll: single;
//    rudder: single; //
//    Timestamp: Double;
//  end;

  // MISC POSIT = 65
  TRecDataMiscPosition = record
    pc: TPacketCheck;
    ObjID: TRecObjID;
    Position: TRecPositionData;
    ConsoleID: Word;
  end;

  TRecDataGameArea = record
    pc: TPacketCheck;
    ConsoleID : Word;
    AreaRadius : double;
  end;

  //--------------------------------- AIS GROUP --------------------------------

  TRecAutopilot = record
    pc: TPacketCheck;
    shipID: word;
    order: Byte;
    mode: Byte;
    heading: single;
  end;

  TRecThrottleRudderMode = record
    pc: TPacketCheck;
    shipID: word;
    speed, rudder: single;
    mode: byte;
    leftRudder, rightRudder: single;
    leftThrottle, rightThrottle: single;
    PSShaftMode, SBShaftMode: Byte;
  end;

  TRecDepthValue = record
    pc: TPacketCheck;
    shipID: Word;
    depthVal: Single;
  end;

  TRecAISNotif = record
    pc : TPacketCheck;
    shipID: word;
  end;

  //----------------------------------------------------------------------------
  
  spPosition = TRecData3DPosition;

  //REC_POSITION = 2; -------------------------------------------------------
  TRecDataPosition = record
    pc : TPacketCheck;
    UID: string[15];

    position: tDouble3DPoint;
    heading,
    speed,
    pitch,
    roll,
    rudder, // combined
    fuel    : single;
    status  : byte;
  end;

  //REC_3D_ORDER= 3; -------------------------test------------------------------
  TRecData3DOrder = record
    pc: TPacketCheck;
    shipID: Longword;     ///entity(entityid) \ dbid(2d client) -,-"
    sOrder: byte;
    mValue: single;
  end;

  TRecDataCollReg = record
    pc: TPacketCheck;
    shipID: Longword;
    sOrder: byte;
    CombinationId: single;
    State: single;
  end;

  TRecNorse = record
    pc: TPacketCheck;
    OrderID: word;
    c1,c2,c3,c4,c6 :word;
    UniqueID : LongWord;
    c5: double;
  end;

  TRecDataInterface = record
    pc: TPacketCheck;
    shipID: word;
    interfaceID: TInterfaceType;
    sOrder: byte;
    mValue: single;
  end;

  TRecDataInterface3D = record
    pc: TPacketCheck;
    shipID: Longword;
    sOrder,interfaceID: byte;
    mValue: single;
  end;

  // lamp
  TRecDataLampStat = record
    pc: TPacketCheck;
    ConsoleID, ShipDbID: word;
    EntityID : LongWord;
    An_Li, StBd_Li, Port_Li, MH_Li1, MH_Li2, SP_Li1, SP_Li2, SP_Li3, Stn_Li, OD_Li : Integer;

  end;

  TRecDataNorseStat = record
    ShipDbID: word;
    EntityID : LongWord;
    FocusR, OnR, SwitchR,  FocusL, OnL, SwitchL : Word;
    PotHorR, PotVerR, PotHorL, PotVerL : Single;
  end;

  TRecVehcCollRegState = record
    CollReg1, CollReg2, CollReg3, CollReg4, CollReg5, CollReg6, CollReg7,
      CollReg8: single;
  end;

  //REC_BUOY_DATA = 66   -------------------------------------------------------
  TRecBuoyData = record
    pc: TPacketCheck;
    ConsoleID, BuoyDbID: word;
    EntityID : LongWord;
  end;

    //02102015
//  TRecData3DGUI = record
//    pc      : TPacketCheck;
//    shipID  : Word;
//    sOrder  : word;
//    GUIposID: Word;
//    ipLong  : integer;
//  end;

  //icha
  R_Common_INCS = record
    pc: TPacketCheck;
    actSpeedPS    : Integer;
    actSpeedSB    : Integer;
    shaftSpeedPS  : Integer;
    shaftSpeedSB  : Integer;
  end;

   //icha
  TRecDataPCSThrottle = record
    pc: TPacketCheck;
    PortStaboardID  : string[20];
    CommandID       : Byte;
    ValueInt        : Integer;
  end;

  TRecClientControl = record
    pc: TPacketCheck;
    State: Double;
  end;

  TRecDataSpawn = record
    pc: TPacketCheck;
    OrderID : byte;
    ShipID, ShipDbID : word;
    Range : single;
    Bearing : single;
  end;

  TRecDataLeverControl = record
    pc: TPacketCheck;
    OrderID : byte;
    ShipDbID: word;
    LeverState : Integer;
  end;

  TRecDataEnvironment = record
    pc : TPacketCheck;
    OrderID, Enable, TimeMode : byte;
    v1, v2, v3, v4 : Single;
  end;

  TRecConsoleReady = record
    pc : TPacketCheck;
    ConsoleID, ConsoleState : Word;
  end;

  //chk
  TRec3DClientReady = record
    pc : TPacketCheck;
    ConsoleID : Word;
    longIP : Integer;
  end;

  TRecLightStatus = record
    pc: TPacketCheck;
    OrderID : byte;
    ShipID, ShipDbID : word;

    lightStat: array[1..13] of Integer;
  end;

  //== Damage Order ===========================================================//
  { from uConst  with conflict :(
    REC_ORDER = 3;
    TRecDataOrder = record
      pc: TPacketCheck;         // 4
      shipID: word;             // 2
      sOrder: byte;             // 1
      mValue: single;           // 4
    end;
  }

  // REC_SET_EXOCET  = 4;
{  TRecSetExocet = record
    pc: TPacketCheck;
    shipID: word;
    sOrder: byte;
    mCountID: single;
    mProxFuze: single;
    mAltitude: single;
    mSearchArea: single;
    mRTG: single;
    mManualWidth: single;
    mSelecDepth: single;
    mTBearing: single;
    mTRange: single;
  end;
  }

  // REC_3D_EXOCET   = 4; -----------------------------------------------------
  TRec3DSetExocet = record
    pc: TPacketCheck;
    shipID: word;
    sOrder: byte;
    mCountID: single;
    mProxFuze: single;
    mAltitude: single;
    mSearchArea: single;
    mRTG: single;
    mManualWidth: single;
    mSelecDepth: single;
    mTBearing: single;
    mTRange: single;
  end;

  TRecSetExocet  = TRec3DSetExocet;

  // REC_3D_CHAFF= 5; ----------------------------------------------------------
  TRec3DSetChaff = record
    pc: TPacketCheck;
    ShipID: word;
    OrderID: byte;
    mCountID: integer;
    mDegreeRate: single;
    mPart: integer;
    mPartNo: integer;
  end;
  TRecSetChaff = TRec3DSetChaff;

  //REC_3D_ASROCK   = 6; -------------------------------------------------------
  TRec3DSetAsrock = record
    pc: TPacketCheck;
    ShipID: word;
    OrderID: byte;
    mCountID: integer;
    mTargetBearing: single;
    mTargetRange: single;
    mTargetDepth: single;
  end;
  TRecSetAsrock = TRec3DSetAsrock;

  //C_REC_MERIAM                = 7; -------------------------------------------
  TRecMeriam = record
    PC    : TPacketCheck;                                //17
    ShipID  : word;
    OrderID     : byte;   //
    Gun_number  : integer;
    X, Y, Z     : double;
    TOF         : double;
  end;

{ // REC_3D_TORPEDO = 8;
  TRec3DSetTorpedo = record
    pc: TPacketCheck;
    ShipID: word;
    OrderID: byte;
    mCountID: integer;
  end;
}
  //REC_3D_TORPEDO_MK44 = 8;  --------------------------------------------------
  TRecTorpedoMK44Order = record
    PC: TPacketCheck;
    shipID: word;
    OrderID: byte;
    mID: word;
    mISD: single;
    mFloor: single;
    mGyroRunOut: boolean;
  end;

  //REC_3D_TORPEDO_SUT  = 9; ---------------------------------------------------
  TRecSetTorpedoSUT = record
    pc: TPacketCheck;
    ShipID: word;
    TargetID: word;
    OrderID: byte;
    mCountID: integer;
    mTorpedoCourse: single;
    mTorpedoSpeed: single;
    mTorpedoDepth: single;
  end;


    // C_REC_ORDER                 = 10;  -------------------------------------
    TRecOrder = record
      PC    : TPacketCheck;
      ShipID: string[15];

      OrderID        : byte;
      OrderByteParam : byte;
    end;

    //C_REC_ORDER_XY              = 11;   -------------------------------------
    TRecOrderXY = record
      PC    : TPacketCheck;
      ShipID: string[15];

      OrderID   : byte;
      OrderType : byte;
      X, Y      : double;
    end;

    //C_REC_TRACK_ORDER           = 12;   -------------------------------------
    TRecTrackOrder = record
      PC    : TPacketCheck;
      ShipID: string[15];

      OrderID  : byte;
      OrderType: byte;
      Ship_TID   : byte;
      TrackNumber: byte;
      X, Y     : double;
    end;

    //C_REC_ORDER_ASSIGNMENT      = 13; -------------------------------------
    TRecOrderAssignment = record
      PC    : TPacketCheck;
      ShipID: string[15];

      OrderID    : byte;
      DetectedUID: string[15];

      Ship_TID   : byte;
      TrackNumber: byte;
    end;

    //C_REC_SET_TRACKNUM          = 14; -------------------------------------
    TRecSetTrackNumber = record
      PC    : TPacketCheck;
      ShipID: string[15];

      OrderID    : byte;
      ShipTID    : byte;
      TrackNumber: byte;
    end;

    //C_REC_FIRE_CONTROL          = 15; -------------------------------------
    TRecFireControlOrder = record
      PC    : TPacketCheck;
      ShipID  : string[15];

      OrderID    : byte;
      FC_number  : byte;
      FC_command : byte;
      TrackUID   : string[15];
      Ship_TID   : byte;
      TrackNumber: byte;
      X, Y       : double;
    end;

    //C_REC_GUN_CONTROL           = 16; -------------------------------------
   TRecGunControl = record
      PC    : TPacketCheck;
      ShipID  : string[15];

      OrderID     : byte;   //
      TrackUID   : string[15];
      Ship_TID   : byte;
      TrackNumber: byte;
      Gun_number  : byte;   // gun1,2,3
      AssignedTo  : byte;   // (assign ke FC mana) gun1,2,3
      FireMode    : byte;   // (SINGLE, BURST) * gun1 only
      Bullet1     : byte;   // (PARPROX, IMPACT) gun1,2,3
      Bullet2     : byte;   // (HE_TRACER, PRE_FRAG) * gun2,3 only
      ControlMode : byte;   // (remote, local) gun1,2,3
      IsSync      : boolean;// mengarah ke target ato tidak
      //IsBlind     : boolean;// lg blind ato ga
      //InRange     : boolean;// masuk jarak tembak ato ga
    end;

    {uConst
    //REC_SET_MERIAM              = 17;  --------------------------------------
  TRecMeriam = record
    PC: TPacketCheck; //17
    ShipID: word;
    OrderID: byte; //
    Gun_number: byte;
    X, Y: single;
  end;
    }

    //C_REC_XXX_ORDER             = 17; ---------------------------------------
    TRecXXXOrder = record
      PC    : TPacketCheck;
      ShipID  : string[15];

      OrderID    : byte;
      TrackUID   : string[15];
      Ship_TID   : byte;
      TrackNumber: byte;
      X, Y       : double;

      temp1, temp2, temp3, temp4   : byte;
      temp5, temp6   : double;
      temp7   : string[15];
    end;

    // C_REC_LINK_ORDER            = 18; --------------------------------------
    TRecLinkOrder = record
      PC    : TPacketCheck;
      ShipID  : string[15];

      OrderID     : byte;
      SenderID    : string[15];

      TrackUID    : string[15];
      TrackSymbol : byte;
      TrackAmp1, TrackAmp2 : byte;
      PrivCode    : string[15];
      Ship_TID    : byte;
      TrackNumber : byte;
      Speed, Course : double;
      X, Y, Z       : double;
      Frekwensi     : single;

    end;

  // REC_DB_ORDER                = 20; -----------------------------------------
  TRecDBEffect = record
    pc: TPacketCheck;
    ShipID: word;
    ModulID: byte;
    CompID: byte;
    StatusID: byte;
    StatusVal: single;
  end;
    // andy
  //C_REC_HARPOON_SETTING        = 30;  --------------------------------------
  TRecHarpoonPanelSetting = record  // 30;
    PC        : TPacketCheck;
    ShipID    : string[15];
    OrderID   : byte;
    OrderData : byte;
  end;

  //REC_ENVI                    = 34;
  //REC_ENVIRONMENT             = REC_ENVI;
//  TRecDataEnvironment = record
//      pc: TPacketCheck;
//      windVelocity: Double;
//      windHeading: Double;
//      seaCurrentVelocity: Double;
//      seaCurrentHeading: Double;
//      temperature: Double;
//      humidity: Double;
//      surfacePressure: Double;
//    end;

  // REC_MISSILEPOS              = 50;  ----------------------------------------
  TRecMissilePos = record
    pc: TPacketCheck;
    shipID: word;
    countID: word;
    tipeID: byte;
    status: byte;
    x, y, z: double;
    heading: single;
    speed: single;
  end;
  TRec3DMissilePos = TRecMissilePos;

  //REC_3D_SETCONTROL = 51;  ------------------------------------------------
  spActorsController = record
    pc: TPacketCheck;
    ShipID: word;
    TypeID: word;
    OrderID: word;
    //Nama: string[25];
    x, y, z: double;
    h, p, r : double;
  end;

  // REC_TEXTURE_CAMERA = 52;   ------------------------------------------------
  TRecDataTextureCamera = record
    pc: TPacketCheck;
    ShipID: word;
    LiodID: word;
    ShaderID: word;
   end;

  TRecTextureCamera = TRecDataTextureCamera;

  //REC_3D_UTIL_TOOLS           = 53;
  spUtilityTools = record
    pc: TPacketCheck;
    OrderID: word;
    c1,c2,c3,c4,c6 :word;
    UniqueID : LongWord;
    c5: double;
  end;

  TRecDataFoV = record
    pc: TPacketCheck;
    OrderID: word;
    c1,c2:word;
    c3: Single;
  end;


    TRecDataOrder_noval = record
      ID : Byte;
      Pass : array[0..2] of char;
      order : Byte;
    end;

  //REC_2D_ORDER= 54; -------------------------------------------------------
  TRecData2DOrder = record
    pc: TPacketCheck;
    orderID : byte;
    numValue : integer;
    strValue : string[15];
  end;

  TRecDataDB = record
    pc: TPacketCheck;
    ip_addr : string[15];
    db_proto: string[15];
    db_name : string[15];
    db_user: string[15];
    db_pass: string[15];
  end;

  //icha    =55
  TRec2DOrder = record
    PC    : TPacketCheck;
    speed : Double;
  end;

  //rec_radar  --- 61
  TRecRadarStatus = record
    pc: TPacketCheck;
    shipID : word;
    OrderID: word;
    mValue : word;
  end;

  TRecScenEnvData = record
    ScenID: Integer;
    ScenName: string;
    ScenMapID: Integer;
    ScenType: Word;
    ScenBuildingEnable,
    ScenStaticShipEnable,
    ScenBuoyEnable: Integer;
    ScenWindSpeed, ScenWindDir,
    WindDirXComp, WindDirYComp: Double;
    ScenFogHeight: Double;
    ScenTime: TTime;
    ScenRainEnable: Integer;
    RainIntensity, RaindropsAmount: Double;
  end;

  TRecDataInterfaceSteering = record
    pc: TPacketCheck;
    orderID : word;
    numValue : single;
  end;

  



  TCPC_T_POSITION= procedure(aRec: TRecDataPosition) of object;
  TCPS_T_POSITION= procedure(aRec: TRecDataPosition; s: TWSocket) of object;



const

  //PORT= '2120';
  BUFFER_SIZE= 1024 * 1024 * 20;
  PACKET_PASS= 'SKL';

  //--------------------------------NORSE LIGHT---------------------------------

  // Norselight
  c_AnchorLight = 1;
  c_AnchorLightOff = 2;
  c_SternLight = 3;
  c_SternLightOff = 4;
  c_MastheadLight = 5;
  c_MastheadLightOff = 6;
  c_MastheadLight2 = 7;
  c_MastheadLight2Off = 8;
  c_SpecialLightTop0 = 9;
  c_SpecialLightTop1 = 10;
  c_SpecialLightTop2 = 11;
  c_SpecialLightMid0 = 12;
  c_SpecialLightMid1 = 13;
  c_SpecialLightMid2 = 14;
  c_SpecialLightBot0 = 15;
  c_SpecialLightBot1 = 16;
  c_SpecialLightBot2 = 17;
  c_OpsDangerLightPair0 = 18;
  c_OpsDangerLightPair1 = 19;
  c_OpsDangerLightPair2 = 20;
  c_SpecialCBD0 = 21;
  c_SpecialCBD1 = 22;
  c_SpecialRAM0 = 23;
  c_SpecialRAM1 = 24;
  c_SpecialNUC0 = 25;
  c_SpecialNUC1 = 26;
  /// di 3D tidak menggunakan switch
  c_PortLight = 27;
  c_PortLightOff = 28;
  c_StarboardLight = 29;
  c_StarboardLightOff = 30;

    // Norselight Lamp Name
  C_Lamp_PORT                = 1;
  C_Lamp_PORT_TOP            = 2;
  C_Lamp_PORT_MID            = 3;
  C_Lamp_PORT_BOTTOM         = 4;
  C_Lamp_STARBOARD           = 5;
  C_Lamp_STARBOARD_MID       = 6;
  C_Lamp_STARBOARD_BOTTOM    = 7;
  C_Lamp_MASTHEAD_AFT        = 8;
  C_Lamp_MASTHEAD_FORE       = 9;
  C_Lamp_ASTERN              = 10;
  C_Lamp_ANCHOR_AFT          = 11;
  C_Lamp_TOWING_FWD          = 12;
  C_Lamp_TOWING_AFT          = 13;
  C_Lamp_OBSTR_FWD           = 14;
  C_Lamp_OBSTR_AFT           = 15;
  C_Lamp_CONVOY_BLUE         = 16;
  C_Lamp_ANCHOR_FORE         = 17;

  //----------------------------------------------------------------------------

  C_CONSOLE_3D = 1;
  C_CONSOLE_INS_2D = 2;

  // Record Constan untuk Register Procedure =====================================
  REC_3D_POSITION = 1;
  //REC_3D_WAYPOINT = 12;

  REC_POSITION    = 2;
  REC_3D_ORDER    = 3;
  REC_3D_EXOCET   = 4;
  REC_SET_EXOCET  = REC_3D_EXOCET;

  REC_GAME_AREA = 5;

  REC_3D_ASROCK   = 6;
  REC_SET_ASROCK  = REC_3D_ASROCK;

  C_REC_MERIAM     = 7;
  REC_SET_MERIAM   = C_REC_MERIAM;

  REC_3D_TORPEDO_MK44 = 8;
  REC_3D_TORPEDO_SUT  = 9;

  C_REC_ORDER                 = 10;
  C_REC_ORDER_XY              = 11;
  C_REC_TRACK_ORDER           = 12;
  C_REC_ORDER_ASSIGNMENT      = 13;
  C_REC_SET_TRACKNUM          = 14;
  C_REC_FIRE_CONTROL          = 15;
  C_REC_GUN_CONTROL           = 16;

  //uConst.REC_SET_MERIAM              = 17;
  C_REC_XXX_ORDER             = 17;
  C_REC_LINK_ORDER            = 18;

  REC_DB_ORDER                = 20;
  REC_DATAINTERFACE_FROM2D    = 21;
  REC_DATAINTERFACE_TO2D      = 22;
  REC_DATAINTERFACE_TO3D      = 23;
  REC_DATAINTERFACE_STEERING_TO2D      = 24;

    //alarm PS
    Overload_Pump1_L          = 1;
    Overload_Pump2_L          = 2;
    Hydraulic_Lock_Pump1_L    = 3;
    Clogged_Filter_Pump1_L    = 4;
    Clogged_Filter_Pump2_L    = 5;

    Phase_Failure_Pump1_L     = 6;
    Phase_Failure_Pump2_L     = 7;
    Hydraulic_Lock_Pump2_L    = 8;

    Power_Failure_Pump1_L     = 9;
    Power_Failure_Pump2_L     = 10;
    Power_Fail_Aux_Steering_L = 11;

    Power_Failure_Control1_L  = 12;
    Power_Failure_Control2_L  = 13;

    Low_Oil_Level_Pump1_L     = 14;
    Low_Oil_Level_Pump2_L     = 15;



    //alarm SB
    Overload_Pump3_R          = 16;
    Overload_Pump4_R          = 17;
    Hydraulic_Lock_Pump3_R    = 18;
    Clogged_Filter_Pump3_R    = 19;
    Clogged_Filter_Pump4_R    = 20;

    Phase_Failure_Pump3_R     = 21;
    Phase_Failure_Pump4_R     = 22;
    Hydraulic_Lock_Pump4_R    = 23;

    Power_Failure_Pump3_R     = 24;
    Power_Failure_Pump4_R     = 25;
    Power_Fail_Aux_Steering_R = 26;

    Power_Failure_Control3_R  = 27;
    Power_Failure_Control4_R  = 28;

    Low_Oil_Level_Pump3_R     = 29;
    Low_Oil_Level_Pump4_R     = 30;

    Off_Alarm_L               = 100;
    Off_Alarm_R               = 101;

  //telegraph
    Telegraf_Full_Astern_PS     = 31;
    Telegraf_Half_Astern_PS     = 32;
    Telegraf_Slow_Astern_PS     = 33;
    Telegraf_DeadSlow_Astern_PS = 34;
    Telegraf_FWE_PS             = 35;
    Telegraf_Stop_PS            = 36;
    Telegraf_StandBy_PS         = 37;
    Telegraf_DeadSlow_Ahead_PS  = 38;
    Telegraf_Slow_Ahead_PS      = 39;
    Telegraf_Half_Ahead_PS      = 40;
    Telegraf_Full_Ahead_PS      = 41;

    Telegraf_Full_Astern_SB     = 42;
    Telegraf_Half_Astern_SB     = 43;
    Telegraf_Slow_Astern_SB     = 44;
    Telegraf_DeadSlow_Astern_SB = 45;
    Telegraf_FWE_SB             = 46;
    Telegraf_Stop_SB            = 47;
    Telegraf_StandBy_SB         = 48;
    Telegraf_DeadSlow_Ahead_SB  = 49;
    Telegraf_Slow_Ahead_SB      = 50;
    Telegraf_Half_Ahead_SB      = 51;
    Telegraf_Full_Ahead_SB      = 52;

    Telegraf_Indicator_Clear    = 53;

     // Pump PS
    Start_Run_Pump1           = 60;
    Start_Run_Pump2           = 61;
    Stop_Pump1                = 62;
    Stop_Pump2                = 63;
    Auto_Start_Pump1          = 64;
    Auto_Start_Pump2          = 65;
    Low_Angle_Pump1           = 66;
    Low_Angle_Pump2           = 67;
    High_Low_Angle_Pump12     = 68;

    Override_Pump1            = 69;
    Override_Pump2            = 70;
    Buzzer_Release_L          = 71;
    Release_L                 = 72;
    Off_L                     = 73;
    Override_L                = 74;
    Port_L                    = 75;
    STBD_L                    = 76;

    Start_Run_Pump3           = 77;
    Start_Run_Pump4           = 78;
    Stop_Pump3                = 79;
    Stop_Pump4                = 80;
    Auto_Start_Pump3          = 81;
    Auto_Start_Pump4          = 82;
    Low_Angle_Pump3           = 83;
    Low_Angle_Pump4           = 84;
    High_Low_Angle_Pump34     = 85;

    Override_Pump3            = 86;
    Override_Pump4            = 87;
    Buzzer_Release_R          = 88;
    Release_R                 = 89;
    Off_R                     = 90;
    Override_R                = 91;
    Port_R                    = 92;
    STBD_R                    = 93;

    Cmd_AutoPilot             = 94;
    Cmd_Sync                  = 95;
    Cmd_Indp                  = 96;
    Cmd_Manual                = 97;


  C_REC_HARPOON_SETTING       = 30;
  //icha
  C_REC_2DORDER               = 31;

  REC_ENVI                    = 34;
    ORD_SET_RAIN = 1;
    ORD_SET_RAIN_PARAMS = 2;
    ORD_SET_TIME_OF_DAY = 3;
    ORD_SET_WIND_DIRECTION = 4;
    ORD_SET_FOG_DENSITY = 5;
    ORD_BUOY_INTERVAL = 6;
    ORD_SAVE_WINDDATA = 7;
    ORD_WAVEDATA = 8;
    ORD_WINDDATA = 9;
    ORD_ENVEFFECT = 10;

  REC_ENVIRONMENT             = REC_ENVI;

  REC_SET3D_LEADER            = 167;

  REC_ORD_NOVAL               = 40;
  REC_ORDER_NOVAL             = REC_ORD_NOVAL;

  REC_MISSILEPOS              = 50;
  REC_3D_MISSILEPOS           = REC_MISSILEPOS;

  REC_3D_SETCONTROL           = 51;

  REC_TEXTURE_CAMERA          = 52;
  REC_3D_UTIL_TOOLS           = 53;

  REC_2D_ORDER                = 54;

  REC_DATA_SPAWN = 55;
    ORD_SPAWN_SHIP = 1;
    ORD_SPAWN_HUMAN = 2;
    ORD_SPAWN_DEBRIS = 3;
    ORD_SPAWN_HELI = 4;

  REC_2D_CommORDER = 56;

  REC_DATA_CONSOLE_ID         = 57;
  C_REC_CLIENT_CONTROL        = 58;
  REC_3D_GUI                  = 59; //ICA
  REC_CONSOLE_READY           = 60;
  REC_RADAR                   = 61;

  REC_3DCLIENT_READY          = 62;
  REC_DB_PARAMS               = 63;

  REC_LIGHT_STAT              = 64;
  REC_MISC_POSITION           = 65;
  REC_BUOY_DATA               = 66; //bayu

  C_INCS_COMMAND              = 68;

  REC_COLLREG                 = 210;
  REC_REQENVI                 = 211;
  REC_NORSE                   = 212;
  REC_FOV                     = 213;
    ORD_FOV = 1;


  //--------------------------------AIS GROUP-----------------------------------

  {*>Conflicted with previous entries. Added 100 to original CPID <*}

  C_REC_AUTOPILOT  = 157;
    ORD_MODE = 1;
    ORD_AP_HEADING = 2;
    MODE_MAN = 3;
    MODE_AUTO = 4;
    MODE_NAV = 5;

  REC_LEVERCONTROL_MODE  = 161;
    MODE_AUTOPILOT       = 1;
    MODE_MANUAL_1_RUDDER = 2;
    MODE_MANUAL_2_RUDDER = 3;
    SHAFT_DRIVEN         = 4;
    SHAFT_STOP           = 5;
    SHAFT_TRAILING       = 6;

  C_REC_DEPTH_VALUE           = 162;

  C_REC_BUOY_INTERVAL     = 163;

  //----------------------------------------------------------------------------



  C_REC_PACKETNAME :  array [1 .. 61] of string =  //55
  ('REC_3D_POSITION',
   'REC_POSITION',
   'REC_3D_ORDER',
   'REC_3D_EXOCET',
   'REC_3D_CHAFF',

   'REC_3D_ASROCK',
   'C_REC_MERIAM',
   'REC_3D_TORPEDO_MK44',
   'REC_3D_TORPEDO_SUT',
   'C_REC_ORDER',
{11}
   'C_REC_ORDER_XY',
   'C_REC_TRACK_ORDER',
   'C_REC_ORDER_ASSIGNMENT',
   'C_REC_SET_TRACKNUM',
   'C_REC_FIRE_CONTROL',

   'C_REC_GUN_CONTROL',
   'C_REC_XXX_ORDER',
   'C_REC_LINK_ORDER',
   '',
   'REC_DB_ORDER',

{21}
   'REC_DATAINTERFACE_FROM2D',
   'REC_DATAINTERFACE_TO2D',
   'REC_DATAINTERFACE_TO3D',
   'REC_DATAINTERFACE_STEERING_TO2D',
   '',

   '',
   '',
   '',
   '',
   'C_REC_HARPOON_SETTING',

{31}
   '',
   '',
   '',
   'REC_ENVI',
   '',

   '',
   '',
   '',
   '',
   'REC_ORD_NOVAL',



{41}
   '',
   '',
   '',
   '',
   '',

   '',
   '',
   '',
   '',
   'REC_MISSILEPOS',

{51}
   'REC_3D_SETCONTROL ',
   'REC_TEXTURE_CAMERA',
   'REC_3D_UTIL_TOOLS',
   'REC_2D_ORDER',
   'REC_3D_GUI',
   '',
   '',
   '',
   '',
   '',
   'REC_RADAR'

   );



  // OrderID untuk TDC order Recognizer C_REC_ORDER .. C_REC_LINK_ORDER --------

  OrdID_select_radar_type     = 1;
  OrdID_start_ICM             = 2;
  OrdID_update_ICM            = 3;
  OrdID_end_ICM               = 4;
  OrdID_init_datum            = 5;
  OrdID_FOC_plus              = 6;
  OrdID_FOC_minus             = 7;

  OrdID_change_ident          = 8;
  OrdID_ident_bawah_air       = OrdID_change_ident;    // old value = 8
  OrdID_ident_atas_air        = OrdID_change_ident;    // old value = 16;
  OrdID_ident_udara           = OrdID_change_ident;    // old value = 23;

  OrdID_assign_tor            = 9;
  OrdID_deassign_tor          = 10;
  OrdID_assign_asrl           = 11;
  OrdID_deassign_asrl         = 12;
  OrdID_WIPE                  = 13;

  OrdID_init_ram              = 14;
  OrdID_init_ram_atas_air     = OrdID_init_ram;            // old value = 14;
  OrdID_init_ram_udara        = OrdID_init_ram;            // old value = 21;

  OrdID_assign_ram            = 15;
  OrdID_change_ampl_info      = OrdID_assign_ram;

  OrdID_init_track            = 16;
  OrdID_update_SSM            = 18;

  OrdID_assign_SSM            = 19;
  OrdID_deassign_SSM          = 20;

  OrdID_init_auto             = 21;  // track automatic
  OrdID_CorrectRAM            = 22;

  OrdID_init_DR               = 23;  // track dead recon

  OrdID_init_esm_fix          = 24;
  OrdID_Synch_timebase        = 25;
  OrdID_UpdateTrackPos        = 26;
  OrdID_assign_FC_WCC         = 27;
  OrdID_deassign_FC_WCC       = 28;

  OrdID_assign_FC             = OrdID_assign_FC_WCC;
  OrdID_deassign_FC           = OrdID_deassign_FC_WCC;
  OrdID_BreakTrack            = OrdID_deassign_FC;

  OrdID_assignTrackSinbad   = 29;
  OrdID_InputPeriskop       = 30;
  OrdID_assign_engBox       = 31;

  OrdID_assign_gun          = 32;
  OrdID_deassign_gun        = 33;

  OrdID_assign_FC_OCC       = 34;
  OrdID_deassign_FC_OCC     = 35;

  //OrdID_TrackRepos          = 36;
  OrdID_SwitchPosition      = 37;
  OrdID_TrackLost           = 38;

  OrdID_init_point          = 39;
  OrdID_recv_sonar_owa      = 40;

  OrdID_send_link           = 41;
  OrdID_stop_send_link      = 42;

  OrdID_correlate_track     = 43;
  OrdID_decorrelate_track   = 44;

  OrdID_UpdateTrackPos_Owa  = 45;



  ORD_ASROCK_ASSIGNED         = 51; // Asrock Assign
  ORD_ASROCK_DEASSIGNED       = 52; // Asrock Deassign
  ORD_ASROCK                  = 53; // Asrock Fire


  C_Max_Order_ID        = 53;


  C_ORDER_STR :array[1..C_Max_Order_ID] of string =
  (
    'select_radar_type',
    'start_ICM',
    'update_ICM',
    'end_ICM',
    'init_datum',
    'FOC_plus',
    'FOC_minus',
    'change_ident',
    'assign_tor',
    'deassign_tor',
    'assign_asrl',
    'deassign_asrl',
    'WIPE',
    'init_ram',
    'assign_ram',
    '',
    '',
    'update_SSM',
    'assign_SSM',
    'deassign_SSM',
    'init AUTO',
    'assign_ram_udara',
    'init DR',
    'init_esm_fix',
    'Synch TB',
    'Update Track Pos',
    'assign_FC_WCC',
    'deassign_FC_WCC',
    'fire_gun1',
    'fire_gun2',
    'fire_gun3',
    'assign_gun',
    'deassign_gun',
    'assign_FC_OCC',
    'deassign_FC_OCC',
    '','','','','','','',
    '','','' ,'','','','',''
    ,'Asrock Assign'
    ,'Asrock Deassign'
    ,'Asrock Fire'

  );

  // order for harpoon  C_REC_HARPOON_SETTING
  OrdHpn_None            = 0;
  OrdHpn_LaunchMode      = 1;
  OrdHpn_SearchMode      = 2;
  OrdHpn_SearchArea      = 3;
  OrdHpn_RecSearchArea   = 4;
  OrdHpn_LauncherTube    = 5;

  OrdHpn_Selected        = 10;
  OrdHpn_Sel_Area        = 11;


  C_OrdType_Torpedo_MK44: byte  = 0;
  C_OrdType_Torpedo_A244: byte  = 1;

  C_OrdType_RAM_atasair:byte = 0;    //TTrackDomain tdAtasAir
  C_OrdType_RAM_udara  :byte = 2;    //TTrackDomain tdudaraa

//  CT_EXOCET = 55;

  // -----------------------------------------------------------------
//  ORD_CANNON_LR               = 41;  // left-right
//  ORD_CANNON_UD               = 42;  // up-down
//  ORD_CANNON_F                = 43;  // meriam fire
//  ORD_ASROCK_ASSIGNED         = 101; // Asrock Assign
//  ORD_ASROCK_DEASSIGNED       = 102; // Asrock Deassign
//  ORD_ASROCK                  = 103; // Asrock Fire



////////////////////////  /////////////////////////////////////////////////
  ORD_NETWORK = 11;
  ORD_SETPOS = 12;


  ORD_THROTTLE = 21; // ...
  ORD_THROTTLE_VAL_L = 46;
  ORD_THROTTLE_VAL_R = 47;
    ORD_RMT_THROTTLE_VAL_L = 246;
    ORD_RMT_THROTTLE_VAL_R = 247;
  ORD_HEADING = 48;
  ORD_THROTTLE_STATUS = 49;
  ORD_RUDDER_VAL_L = 50;
  ORD_RUDDER_VAL_R = 51;
  ORD_RUDDER_MODE = 52; // may be obsolete
  ORD_RUDDER_CONTROL_MODE = 53;

  ORD_ALT = 36;
  ORD_RUDDER = 22;
  ORD_STOP = 23;
  ORD_VERRUDDER = 24;
  ORD_CAM_ANJUNGAN = 26;
  ORD_CAM_BLK = 27;
  ORD_DIRECT_SPEED = 29 ;
  ORD_ORD_ADDANGLE = 69; // ...
  ORD_DELETE_OTHERS = 25;
  ORD_ATTACH = 30;
  ORD_DELETE_SHIP = 31;
  ORD_RESUME_GAME = 32;
  ORD_PAUSE_GAME = 34;

  ORD_CSTATE = 90;
  ORD_PCS_SB = 91;
  ORD_PCS_PS = 92;
  ORD_RPM_ME_PS = 93;
  ORD_RPM_ME_SB = 94;
  ORD_RPM_SHAFT_PS = 95;
  ORD_RPM_SHAFT_SB = 96;

  ORD_DEPTH = 97;
  ORD_AHEAD_DEPTH = 135;

  //icha
  ORD_RUDDER_2D = 98;
  ORD_RUDDER_L2D= 99;
  ORD_RUDDER_R2D= 100;

  //ais status
  ORD_AIS_STATUS= 101;

  ORD_CLEAR_S2D_OBJECTS = 102; // del all obj created by 2d server

  ORD_PELORUS_LEFT  = 103;
  ORD_PELORUS_RIGHT = 104;

  //icha 270117
  ORD_CONTROL  = 105;

  ORD_COMMAND_MODE = 110;

  ORD_TIME_SIGN = 73;
  ORD_INTERFACE_STEER = 74;
  ORD_INTERFACE_STEER_READY = 75;
  ORD_INTERFACE_STEER_JOHNLIE = 76;
  ORD_INTERFACE_STEER_HIU = 77;
  ORD_INTERFACE_STEER_HIU_RUN = 78;


  ORD_INTERFACE_DIGITAL_READ     = 106;
  ORD_INTERFACE_POTENSIO         = 107;
    //Pin F
    Lever_Shaft_Driven_L      = 40;
    Lever_Shaft_Stop_L        = 39;
    Lever_Shaft_Trailing_L    = 38;
    Lever_Emergency_Stop_L    = 37;
    Lever_Transfer_Override_L = 36;

    MOB_1     = 35;
    MOB_2     = 34;
    MOB_3     = 33;

    //Pin H
    BellGauge                 = 50;

    //Pin L
    Lever_Shaft_Driven_R      = 80;
    Lever_Shaft_Stop_R        = 79;
    Lever_Shaft_Trailing_R    = 78;
    Lever_Emergency_Stop_R    = 77;
    Lever_Transfer_Override_R = 76;

     // Pump PS
    LC_Start_Run_Pump1           = 200;
    LC_Start_Run_Pump2           = 201;
    LC_Stop_Pump1                = 202;
    LC_Stop_Pump2                = 203;
    LC_Auto_Start_Pump1          = 204;
    LC_Auto_Start_Pump2          = 205;
    LC_Low_Angle_Pump1           = 206;
    LC_Low_Angle_Pump2           = 207;
    LC_High_Low_Angle_Pump12     = 208;

    LC_Override_Pump1            = 209;
    LC_Override_Pump2            = 210;
    LC_Buzzer_Release_L          = 211;
    LC_Release_L                 = 212;
    LC_Off_L                     = 213;
    LC_Override_L                = 214;
    LC_Port_L                    = 215;
    LC_STBD_L                    = 216;

    LC_Start_Run_Pump3           = 217;
    LC_Start_Run_Pump4           = 218;
    LC_Stop_Pump3                = 219;
    LC_Stop_Pump4                = 220;
    LC_Auto_Start_Pump3          = 221;
    LC_Auto_Start_Pump4          = 222;
    LC_Low_Angle_Pump3           = 223;
    LC_Low_Angle_Pump4           = 224;
    LC_High_Low_Angle_Pump34     = 225;

    LC_Override_Pump3            = 226;
    LC_Override_Pump4            = 227;
    LC_Buzzer_Release_R          = 228;
    LC_Release_R                 = 229;
    LC_Off_R                     = 230;
    LC_Override_R                = 231;
    LC_Port_R                    = 232;
    LC_STBD_R                    = 233;

  ORD_LEVER_CONTROL = 76;
    ORD_SHAFT_DRIVEN= 140;
    ORD_SHAFT_STOP  = 141;
    ORD_SHAFT_TRAILING    = 142;
    ORD_EMERGENCY_STOP    = 143;
    ORD_CANCEL_EMERGENCY_STOP    = 243;
    ORD_LEVER_IN_SERVICE  = 144;
    ORD_TRANSFER_OVERRIDE = 145;
    ORD_AHEAD             = 146;
    ORD_ASTERN            = 147;

    ORD_SHAFT_DRIVEN_SB   = 148;
    ORD_SHAFT_STOP_SB     = 149;
    ORD_SHAFT_TRAILING_SB = 150;
    ORD_EMERGENCY_STOP_SB = 151;
    ORD_CANCEL_EMERGENCY_STOP_SB = 251;
    ORD_LEVER_IN_SERVICE_SB  = 152;
    ORD_TRANSFER_OVERRIDE_SB = 153;
    ORD_AHEAD_SB             = 154;
    ORD_ASTERN_SB            = 155;

  CPID_MINS     = 156;
    ORD_MINS_ON  = 56;
    ORD_MINS_OFF = 57;

  ORD_TELEGRAPH   = 74;
    ORD_AST_FULL      = 0;
    ORD_AST_HAFL      = 1;
    ORD_AST_SLOW      = 2;
    ORD_AST_DEAD_SLOW = 3;
    ORD_FINISHED_WITHENGINE = 4;
    ORD_STOP_PS          = 5;
    ORD_STANDBY       = 6;
    ORD_AHD_DEAD_SLOW = 7;
    ORD_AHD_SLOW      = 8;
    ORD_AHD_HALF      = 9;
    ORD_AHD_FULL      = 10;

    ORD_AST_FULL_SB   = 11;
    ORD_AST_HAFL_SB   = 12;
    ORD_AST_SLOW_SB   = 13;
    ORD_AST_DEAD_SLOW_SB = 14;
    ORD_FINISHED_WITHENGINE_SB = 15;
    ORD_STOP_SB       = 16;
    ORD_STANDBY_SB    = 17;
    ORD_AHD_DEAD_SLOW_SB = 18;
    ORD_AHD_SLOW_SB   = 19;
    ORD_AHD_HALF_SB   = 20;
    ORD_AHD_FULL_SB   = 21;


  //===========================================================================//
    // IF-HIU
    // C02 CONTROL SYSTEM
  ORD_READY_FOR_OPERATION_SB = 0;
  ORD_CO_CYLINDER_OPEN_SB    = 1;
  ORD_MAIN_VALVE_OPEN_SB     = 2;
  ORD_LED_TEST_SB            = 3;
  ORD_FAULT_SB               = 4;
  ORD_RESET_SB               = 5;
  ORD_VENTILATION_OPEN_SB    = 6;
  ORD_VENTILATION_OFF_SB     = 7;
  ORD_RELEASE_SB             = 8;
  ORD_MAIN_VALVE_SB          = 9;

  ORD_READY_FOR_OPERATION_PS = 10;
  ORD_CO_CYLINDER_OPEN_PS    = 11;
  ORD_MAIN_VALVE_OPEN_PS     = 12;
  ORD_LED_TEST_PS            = 13;
  ORD_FAULT_PS               = 14;
  ORD_RESET_PS               = 15;
  ORD_VENTILATION_OPEN_PS    = 16;
  ORD_VENTILATION_OFF_PS     = 17;
  ORD_RELEASE_PS             = 18;
  ORD_MAIN_VALVE_PS          = 19;

  // IF-HIU
  // REMOTE CONTROL SYSTEM
  ORD_RCS_SEMI_SB            = 20;
  ORD_RCS_RESET_UP_SB        = 21;
  ORD_RCS_RESET_DOWN_SB      = 22;
  ORD_RCS_SB                 = 23;
  ORD_RCS_RPM1_SB            = 24;
  ORD_RCS_RPM2_SB            = 25;
  ORD_RCS_AHEAD_SB           = 26;
  ORD_RCS_STOP_SB            = 27;
  ORD_RCS_ASTERN_SB          = 28;
  ORD_RCS_LED_MAX_SB         = 29;
  ORD_RCS_LED_MIN_SB         = 30;
  ORD_RCS_LED_REMOTE_SB      = 31;
  ORD_RCS_LED_LOCAL_SB       = 32;

  // IF-HIU
  // REMOTE CONTROL SYSTEM
  ORD_RCS_SEMI_PS            = 30;
  ORD_RCS_RESET_UP_PS        = 31;
  ORD_RCS_RESET_DOWN_PS      = 32;
  ORD_RCS_PS                 = 33;
  ORD_RCS_RPM1_PS            = 34;
  ORD_RCS_RPM2_PS            = 35;
  ORD_RCS_AHEAD_PS           = 36;
  ORD_RCS_STOP_PS            = 37;
  ORD_RCS_ASTERN_PS          = 38;
  ORD_RCS_LED_MAX_PS         = 39;
  ORD_RCS_LED_MIN_PS         = 40;
  ORD_RCS_LED_REMOTE_PS      = 41;
  ORD_RCS_LED_LOCAL_PS       = 42;

  // IF-HIU
  // ENGINE TELEGRAPH
  ORD_ET_SYSTEM_ON_SB           = 40;
  ORD_ET_SYSTEM_OFF_SB          = 41;
  ORD_ET_STANDBY_SB             = 43;
  ORD_ET_FINISHED_ENGINE_SB     = 44;
  ORD_ET_FINISHED_ENGINE_2_SB   = 45;
  ORD_ET_WHEEL_MOUSE_SB         = 46;
  ORD_ET_WHEEL_MOUSE_2_SB       = 47;
  ORD_ET_CONTROL_ROOM_SB        = 48;
  ORD_ET_ENGINE_ROOM_SB         = 49;
  ORD_ET_ENGINE_ROOM_2_SB       = 50;
  ORD_ET_AHEAD_FULL_SB          = 51;
  ORD_ET_AHEAD_HALF_SB          = 52;
  ORD_ET_AHEAD_SLOW_SB          = 53;
  ORD_ET_AHEAD_DEAD_SLOW_SB     = 54;
  ORD_ET_STOP_SB                = 55;
  ORD_ET_ASTERN_DEAD_SLOW_SB    = 56;
  ORD_ET_ASTERN_SLOW_SB         = 57;
  ORD_ET_ASTERN_HALF_SB         = 58;
  ORD_ET_ASTERN_FULL_SB         = 59;
  ORD_ET_SELECTION_SB           = 60;
  ORD_ET_LAMP_TEST_SB           = 61;
  ORD_ET_DIMMER_PLUS_SB         = 62;
  ORD_ET_DIMMER_MINUS_SB        = 63;

  ORD_ET_SYSTEM_ON_PS           = 70;
  ORD_ET_SYSTEM_OFF_PS          = 71;
  ORD_ET_STANDBY_PS             = 73;
  ORD_ET_FINISHED_ENGINE_PS     = 74;
  ORD_ET_FINISHED_ENGINE_2_PS   = 75;
  ORD_ET_WHEEL_MOUSE_PS         = 76;
  ORD_ET_WHEEL_MOUSE_2_PS       = 77;
  ORD_ET_CONTROL_ROOM_PS        = 78;
  ORD_ET_ENGINE_ROOM_PS         = 79;
  ORD_ET_ENGINE_ROOM_2_PS       = 80;
  ORD_ET_AHEAD_FULL_PS          = 81;
  ORD_ET_AHEAD_HALF_PS          = 82;
  ORD_ET_AHEAD_SLOW_PS          = 83;
  ORD_ET_AHEAD_DEAD_SLOW_PS     = 84;
  ORD_ET_STOP_PS                = 85;
  ORD_ET_ASTERN_DEAD_SLOW_PS    = 86;
  ORD_ET_ASTERN_SLOW_PS         = 87;
  ORD_ET_ASTERN_HALF_PS         = 88;
  ORD_ET_ASTERN_FULL_PS         = 89;
  ORD_ET_SELECTION_PS           = 90;
  ORD_ET_LAMP_TEST_PS           = 91;
  ORD_ET_DIMMER_PLUS_PS         = 92;
  ORD_ET_DIMMER_MINUS_PS        = 93;

  // IF-HIU
  // RADAR
  ORD_RADAR_RANGE_UP            = 100;
  ORD_RADAR_RANGE_DOWN          = 101;
  ORD_RADAR_ACK_ALARM           = 102;
  ORD_RADAR_BRILL_UP            = 103;
  ORD_RADAR_BRILL_DOWN          = 104;
  ORD_RADAR_RIGHT_BUTTON        = 105;
  ORD_RADAR_LEFT_BUTTON         = 106;
  ORD_RADAR_RAIN                = 107;
  ORD_RADAR_GAIN                = 108;
  ORD_RADAR_SEA                 = 109;
  ORD_RADAR_EBL                 = 110;
  ORD_RADAR_VRM                 = 111;

  //===========================================================================//
  // IF-JOHNLIE
  // Navigation Lighting Control Unit  (NLCU)
  ORD_NLCU_RED_LIGHTING         = 0;
  ORD_NLCU_WHITE_LIGHTING       = 1;
  ORD_NLCU_SELECT_MAIN          = 2;
  ORD_NLCU_SELECT_FCSLE         = 3;
  ORD_NLCU_DESELECT_MAIN        = 4;
  ORD_NLCU_DESELECT_FCSLE       = 5;
  ORD_NLCU_ILLUMINATION         = 6;
  ORD_NLCU_LAMP_TEST            = 7;
  ORD_NLCU_MORSE_ON             = 8;
  ORD_NLCU_MORSE_OFF            = 9;
  ORD_NLCU_MORSE_KEY            = 10;

  ORD_NORSELIGHT_SWITCH_ON_PS   = 20;
  ORD_NORSELIGHT_SWITCH_OFF_PS  = 21;
  ORD_NORSELIGHT_LAMP_ON_PS     = 22;
  ORD_NORSELIGHT_LAMP_OFF_PS    = 23;
  ORD_NORSELIGHT_FOCUS_PS       = 24;
  ORD_NORSELIGHT_NO_FOCUS_PS    = 25;
  ORD_NORSELIGHT_UP_PS          = 26;
  ORD_NORSELIGHT_DOWN_PS        = 27;
  ORD_NORSELIGHT_LEFT_PS        = 28;
  ORD_NORSELIGHT_RIGHT_PS       = 29;
  ORD_NORSELIGHT_SPEED_HOR_PS   = 30;
  ORD_NORSELIGHT_SPEED_VER_PS   = 31;
  ORD_NORSELIGHT_LED_LEFT_PS    = 32;
  ORD_NORSELIGHT_LED_RIGHT_PS   = 33;
  ORD_NORSELIGHT_NO_MOVE_HOR_PS = 34;
  ORD_NORSELIGHT_NO_MOVE_VER_PS = 35;


  ORD_IPMS1_ILLUMINATION         = 40;
  ORD_IPMS1_LAMP_TEST            = 41;
  ORD_IPMS1_ALARM_ACK            = 42;
  ORD_IPMS1_MEMORY_RESET         = 43;
  ORD_IPMS1_MCSR                 = 44;
  ORD_IPMS1_BRIDGE               = 45;
  ORD_IPMS1_FAULT                = 46;
  ORD_IPMS1_P1_TRIP              = 47;
  ORD_IPMS1_P2_TRIP              = 48;
  ORD_IPMS1_P3_TRIP              = 49;
  ORD_IPMS1_P4_TRIP              = 50;
  ORD_IPMS1_UP_PS                = 51;
  ORD_IPMS1_DOWN_PS              = 52;
  ORD_IPMS1_BUZZER_PS            = 53;
  ORD_IPMS1_UP_SB                = 54;
  ORD_IPMS1_DOWN_SB              = 55;
  ORD_IPMS1_BUZZER_SB            = 56;

  ORD_STEER_SPEAKER_HIGH_PS     = 60;
  ORD_STEER_SPEAKER_LOW_PS      = 61;
  ORD_STEER_SPEAKER_HIGH_SB     = 62;
  ORD_STEER_SPEAKER_LOW_SB      = 63;
  ORD_WIPER_CONTROL_0_PS        = 64;
  ORD_WIPER_CONTROL_INT_PS      = 65;
  ORD_WIPER_CONTROL_SLOW_PS     = 66;
  ORD_WIPER_CONTROL_FAST_PS     = 67;
  ORD_WIPER_CONTROL_0_CENTER    = 68;
  ORD_WIPER_CONTROL_INT_CENTER  = 69;
  ORD_WIPER_CONTROL_SLOW_CENTER = 70;
  ORD_WIPER_CONTROL_FAST_CENTER = 71;
  ORD_WIPER_CONTROL_0_SB        = 72;
  ORD_WIPER_CONTROL_INT_SB      = 73;
  ORD_WIPER_CONTROL_SLOW_SB     = 74;
  ORD_WIPER_CONTROL_FAST_SB     = 75;
  ORD_WIPER_CONTROL_WASH        = 76;
  ORD_MASTER_OVERRIDE_0         = 77;
  ORD_MASTER_OVERRIDE_INT       = 78;
  ORD_MASTER_OVERRIDE_SLOW      = 79;
  ORD_MASTER_OVERRIDE_FAST      = 80;
  ORD_MASTER_OVERRIDE_LEFT      = 81;
  ORD_MASTER_OVERRIDE_RIGHT     = 82;
  ORD_STEER_AUTO                = 83;
  ORD_STEER_HAND                = 84;
  ORD_STEER_ILLUMINATION        = 85;
  ORD_STEER_LAMP_TEST           = 86;
  ORD_BUOY_POWER_AVAILABLE_PS   = 87;
  ORD_BUOY_RELEASE_LIFEBUOY_PS  = 88;
  ORD_BUOY_LIFEBUOY_RELEASED_PS = 89;
  ORD_BUOY_ALARM                = 90;
  ORD_BUOY_POWER_AVAILABLE_SB   = 91;
  ORD_BUOY_RELEASE_LIFEBUOY_SB  = 92;
  ORD_BUOY_LIFEBUOY_RELEASED_SB = 93;
  ORD_BUOY_BUZZER               = 94;


  ORD_VSL_BRIDGE_PS             = 95;
  ORD_VSL_BRIDGE_WING_PS        = 96;
  ORD_VSL_BRIDGE_SB             = 97;
  ORD_VSL_BRIDGE_WING_SB        = 98;


  ORD_IPMS2_ILLUMINATION        = 100;
  ORD_IPMS2_LAMP_TEST           = 101;
  ORD_IPMS2_DISPLAY_ON          = 102;
  ORD_IPMS2_DISPLAY_OFF         = 103;

  ORD_NORSELIGHT_SWITCH_ON_SB   = 104;
  ORD_NORSELIGHT_SWITCH_OFF_SB  = 105;
  ORD_NORSELIGHT_LAMP_ON_SB     = 106;
  ORD_NORSELIGHT_LAMP_OFF_SB    = 107;
  ORD_NORSELIGHT_FOCUS_SB       = 108;
  ORD_NORSELIGHT_NO_FOCUS_SB    = 109;
  ORD_NORSELIGHT_UP_SB          = 110;
  ORD_NORSELIGHT_DOWN_SB        = 111;
  ORD_NORSELIGHT_LEFT_SB        = 112;
  ORD_NORSELIGHT_RIGHT_SB       = 113;
  ORD_NORSELIGHT_SPEED_HOR_SB   = 114;
  ORD_NORSELIGHT_SPEED_VER_SB   = 115;
  ORD_NORSELIGHT_LED_LEFT_SB    = 116;
  ORD_NORSELIGHT_LED_RIGHT_SB   = 117;

  ORD_GMDSS_LAMP_TEST           = 118;
  ORD_GMDSS_ILLUMINATION        = 119;

  ORD_PELORUS_HANDSFREE         = 120;
  ORD_PELORUS_EXT_LS            = 121;
  ORD_PELORUS_INT_MIC           = 122;
  ORD_PELORUS_PTT               = 123;




  ORD_NORSELIGHT_NO_MOVE        = 131;
  //ORD_NORSELIGHT_NO_MOVE_HOR_SB = 131;
  //ORD_NORSELIGHT_NO_MOVE_VER_SB = 132;
	





  ORD_PCS   =75;
    ORD_INC_SPEED_PS  = 1;
    ORD_DEC_SPEED_PS  = 2;

    ORD_INC_SPEED_SB  = 3;
    ORD_DEC_SPEED_SB  = 4;

  ORD_BELL = 28;
    ORD_BELL0 = 0;
    ORD_BELL1 = 1;
    ORD_BELL2 = 2;
    ORD_BELL3 = 3;
    ORD_BELL4 = 4;
    ORD_BELL5 = 5;
    ORD_BELL6 = 6;
    ORD_BELL7 = 7;
    ORD_BELL8 = 8;
    ORD_BELL9 = 9;

  ORD_BOWSPRIT = 81;


  ORD_LAMP = 70;//30;
    ORD_AnchorLight = 1;
    ORD_AnchorLightOff = 2;
    ORD_SternLight = 3;
    ORD_SternLightOff = 4;
    ORD_MastheadLight = 5;
    ORD_MastheadLightOff = 6;
    ORD_MastheadLight2 = 7;
    ORD_MastheadLight2Off = 8;
    ORD_PortLight = 9;
    ORD_PortLightOff = 10;
    ORD_StarboardLight = 11;
    ORD_StarboardLightOff = 12;
    ORD_SpecialLightL1Off = 13;
    ORD_SpecialLightL1Red = 14;
    ORD_SpecialLightL1White = 15;
    ORD_SpecialLightL2Off = 16;
    ORD_SpecialLightL2Red = 17;
    ORD_SpecialLightL2White = 18;
    ORD_SpecialLightL3Off = 19;
    ORD_SpecialLightL3Red = 20;
    ORD_SpecialLightL3White = 21;
    ORD_SpecialLightR1Off = 22;
    ORD_SpecialLightR1Red = 23;
    ORD_SpecialLightR1White = 24;
    ORD_SpecialLightR2Off = 25;
    ORD_SpecialLightR2Red = 26;
    ORD_SpecialLightR2White = 27;
    ORD_SpecialLightR3Off = 28;
    ORD_SpecialLightR3Red = 29;
    ORD_SpecialLightR3White = 30;
    ORD_OpsDangerLightL = 31;
    ORD_OpsDangerLightLOff = 32;
    ORD_OpsDangerLightR = 33;
    ORD_OpsDangerLightROff = 34;

  REC_3D_LAMP_STAT = 72;

  ORD_SOSOK 					= 33;
		ORD_Sosok_BallL1			= 0;
		ORD_Sosok_BallL2			= 1;
		ORD_Sosok_BallL3			= 2;
		ORD_Sosok_BallR1			= 3;
		ORD_Sosok_BallR2			= 4;
		ORD_Sosok_BallR3			= 5;
		ORD_Sosok_BallC1			= 6;
		ORD_Sosok_BallC3			= 7;
		ORD_Sosok_DiaL1			= 8;
		ORD_Sosok_DiaL2			= 9;
		ORD_Sosok_DiaR1			= 10;
		ORD_Sosok_DiaR2			= 11;
		ORD_Sosok_DiaC2			= 12;
		ORD_Sosok_ConeL			= 13;
		ORD_Sosok_ConeR			= 14;
		ORD_Sosok_DConeL			= 15;
		ORD_Sosok_DConeR			= 16;
		ORD_Sosok_CylL			= 17;
		ORD_Sosok_CylR			= 18;

    ORD_Sosok_BallL1_Off			= 50;
		ORD_Sosok_BallL2_Off			= 51;
		ORD_Sosok_BallL3_Off			= 52;
		ORD_Sosok_BallR1_Off			= 53;
		ORD_Sosok_BallR2_Off			= 54;
		ORD_Sosok_BallR3_Off			= 55;
		ORD_Sosok_BallC1_Off			= 56;
		ORD_Sosok_BallC3_Off			= 57;
		ORD_Sosok_DiaL1_Off			= 58;
		ORD_Sosok_DiaL2_Off			= 59;
		ORD_Sosok_DiaR1_Off			= 60;
		ORD_Sosok_DiaR2_Off			= 61;
		ORD_Sosok_DiaC2_Off			= 62;
		ORD_Sosok_ConeL_Off			= 63;
		ORD_Sosok_ConeR_Off			= 64;
		ORD_Sosok_DConeL_Off			= 65;
		ORD_Sosok_DConeR_Off			= 66;
		ORD_Sosok_CylL_Off			= 67;
		ORD_Sosok_CylR_Off			= 68;
  ORD_SOSOK_ALL_OFF				  = 34;

  ORD_SHIP_SET_MPERKNOTSPERSEC  = 35 ;

  ORD_2D_SVR_COMMAND        = 71;
    ORD_Connect_2dBridge = 1;
    ORD_Disconnect_2dBridge = 2;
    ORD_Restart_2dBridge = 3;
    ORD_Restart_and_Reconnect = 4;
    ORD_BroadcastLightsStat = 5;
    ORD_BroadcastCollregStat = 6;
    ORD_BroadcastEnvi = 7;
    ORD_BroadcastNorse = 8;


  ORD_NORSE_LIGHT = 77;
    ORD_NORSE_NO_UPD = 0;

    ORD_LNORSE_ROT_UP = 1;
    ORD_LNORSE_ROT_DW = 2;
    ORD_LNORSE_ROT_LF = 3;
    ORD_LNORSE_ROT_RG = 4;

    ORD_RNORSE_ROT_UP = 5;
    ORD_RNORSE_ROT_DW = 6;
    ORD_RNORSE_ROT_LF = 7;
    ORD_RNORSE_ROT_RG = 8;

    ORD_LNORSE_SWITCH_ON  = 9;
    ORD_LNORSE_SWITCH_OFF = 10;
    ORD_LNORSE_LAMP_ON  = 11;
    ORD_LNORSE_LAMP_OFF = 12;
    ORD_LNORSE_FOCUS  = 13;
    ORD_LNORSE_SPEED_HOR  = 14;
    ORD_LNORSE_SPEED_VER  = 15;
    ORD_LNORSE_LED_LEFT = 16;
    ORD_LNORSE_LED_RIGHT  = 17;

    ORD_RNORSE_SWITCH_ON  = 18;
    ORD_RNORSE_SWITCH_OFF = 19;
    ORD_RNORSE_LAMP_ON  = 20;
    ORD_RNORSE_LAMP_OFF = 21;
    ORD_RNORSE_FOCUS  = 22;
    ORD_RNORSE_SPEED_HOR  = 23;
    ORD_RNORSE_SPEED_VER  = 24;
    ORD_RNORSE_LED_LEFT = 25;
    ORD_RNORSE_LED_RIGHT  = 26;


  // Constant Tipe Of Missile
  CT_TORPEDO_MK46 = 52;
  CT_TORPEDO_SUT = 57;
  CT_HARPOON = 53;
  CT_ASROCK = 54;
  CT_EXOCET = 55;
  CT_CHAFF = 56;

  /////////////////////////////////////////////////////////////////////////
  // spActorController
  TIPE_MISC_OJK			  = 1;
    TIPE_MISC_MODEL_1	= 1;
    TIPE_MISC_MODEL_2	= 2;
    TIPE_MISC_MODEL_3	= 3;
  TIPE_MISC_OLL			  = 2;
    TIPE_MISC_MODEL_4	= 4;
    TIPE_MISC_MODEL_5	= 5;
    TIPE_MISC_MODEL_6	= 6;
    
    ORD_OJK_CLEAR			= 1;
    ORD_OJK_DEL				= 2;
    ORD_OJK_CREATE		= 3;

  TIPE_MISC_RANJAU		= 10;
    ORD_RANJAU_CLEAR  = 1;
    ORD_RANJAU_DEL		= 2;
    ORD_RANJAU_CREATE	= 3;


  ORD_ENVI = 54;
  ORD_SEA_STATE  = 56; //
  //---\

  //REC_3D_UTIL_TOOLS = 53;
  TIPE_UTIL_CAM_OBSERVER	= 1;
  ORD_UTIL_CAMOBS_NO_UPDATE = 0;
		ORD_UTIL_CAMOBS_UP	= 1;  // up
		ORD_UTIL_CAMOBS_FR	= 2;  // front
		ORD_UTIL_CAMOBS_BK	= 3;  // back
		ORD_UTIL_CAMOBS_LF	= 4;  // left
		ORD_UTIL_CAMOBS_RG	= 5;  // right
    ORD_UTIL_CAMOBS_SLIGHT_LF = 6;
    ORD_UTIL_CAMOBS_SLIGHT_RG = 7;
    ORD_UTIL_CAMOBS_SLIGHT_DECK = 8;

    ORD_UTIL_CAMOBS_MOVE_UP	= 11 ;
    ORD_UTIL_CAMOBS_MOVE_DW	= 12 ;
    ORD_UTIL_CAMOBS_MOVE_FR	= 13 ;
    ORD_UTIL_CAMOBS_MOVE_BK	= 14 ;
    ORD_UTIL_CAMOBS_MOVE_LF	= 15 ;
    ORD_UTIL_CAMOBS_MOVE_RG	= 16 ;

    ORD_UTIL_CAMOBS_ROT_UP	= 21 ;
    ORD_UTIL_CAMOBS_ROT_DW	= 22 ;
    ORD_UTIL_CAMOBS_ROT_LF	= 23 ;
    ORD_UTIL_CAMOBS_ROT_RG	= 24 ;

    ORD_UTIL_CAMOBS_LOCK		= 31;  // lock
    ORD_UTIL_CAMOBS_ULOCK	  = 32;  // unlock




    TIPE_UTIL_PAUSE_GAME = 2; //


  //REC_3D_GUI = 59;
  //gui tipe
  TIPE_GUI_COMPASS = 3;
  //gui position
    ORD_GUI_TOPLEFT     = 0;
    ORD_GUI_TOPRIGHT    = 1;
    ORD_GUI_TOPCENTER   = 2;
    ORD_GUI_MIDLEFT     = 3;
    ORD_GUI_MIDCENTER   = 4;
    ORD_GUI_MIDRIGHT    = 5;
//    ORD_GUI

  TIPE_UTIL_TEST_Z = 4;
  TIPE_UTIL_TEST_Y = 5;
  TIPE_UTIL_CAM_PELORUS	= 6;
    ORD_PELORUS_HEADING   = 0;
    ORD_PELORUS_PITCH     = 1;




  _PARTICLE_COUNT      = 6;
  _PARTICLE_LT         = 7;
  _PARTICLE_LT_BASE    = 8;
  _PARTICLE_LT_RANDOM  = 9;
  _EMITTER_ANGLE_BASE  = 10;
  _EMITTER_ANGLE_RANDOM= 11;
  _SIZE_BASE           = 12;
  _SIZE_RANDOM         = 13;
  _CHILD               = 14;

  { constan order untuk client management ( REC_2D_ORDER :: TRecData2DOrder)}
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
    __CM_CLIENT_CONFIRM_LAUNCHED   = 14;
    __CM_CLIENT_CONFIRM_FAILED     = 15;
  _CM_CLIENT_APP                = 2;
    __CM_CLIENT_LAUNCH             = 1;
    __CM_CLIENT_STOP               = 2;
    __CM_CLIENT_RELAUNCH           = 3;
  _CM_CLIENT_REQ_LAUNCHER_STAT  = 203;
  _CM_CLIENT_SEND_LAUNCHER_STAT = 204;
  _CM_CLIENT_SEND_LAUNCHER_STAT_LAUNCHER = 205;
  _CM_CLIENT_SEND_LAUNCHER_STAT_APP = 206;
  _CM_TERMINATE_ALL_LAUNCHERS = 207;
  _CM_RESTART_ALL_CONTROLS = 213;
  _CM_START_ALL_LAUNCHERS = 208;
  //icha
  CM_failure = 209;

  _CM_SERVER3D_DISCONNECT = 210;

  _CM_REQUEST_INSTR_READY         = 211;
  _CM_CONFIRM_INSTR_READY         = 212;
  {
  _CM_CLIENT_REQ_CSTATE = 210;
  _CM_CLIENT_SEND_CSTATE = 211;
  }
    
  ///*****************************////

type
  OrdType_ICM = (icm1, icm2, icm3);
  OrdType_datum_number = (datum_number1, datum_number2, datum_number3, datum_number4, datum_number5);
  OrdType_torpedo = (MK44, A244);
  OrdType_wipe = (kiri_1, kiri_2, kanan_1, kanan_2);

  TOrdType_FC_number = (FC1, FC2, FC3, FC4);

  TOrdType_FC_command = (STO, SBS, ATO, SBA, RATO, RSTO,
    break_track, open_fire, hold_fire,
    GenFix, BlindBomb, IndirectBomb,
    InitTrackSurf
  );

  TOrdType_OWA_command = (InitAir, InitSurf, InitSubRT, InitSubNRT,
        AssLocRT, AssLocNRT, AssRemote, ReposTrack, CorrectTrack);

 //TOrdType_OWA_command = (InitAir, InitSurf, InitSub, AssLocRT, AssLocNRT);


  OrdType_GunNumber   = (Gun1, Gun2, Gun3);
  OrdType_BulletType1 = (PARPROX, IMPACT);
  OrdType_BulletType2 = (HE_TRACER, PRE_FRAG);
  OrdType_FireMode    = (SINGLE_FIRE, BURST_FIRE);
  OrdType_ControlMode = (LOCAL, REMOTE);

  TRecIP = record
  case Integer of
    0: (b3, b2, b1, b0: byte);
    1: (longIP: LongWord);
  end;

  const
  C_SockStatStr :
  array [TSocketState] of string =
   ('InvalidState',
    'Opened' ,
    'Bound',
    'Connecting',
    'SocksConnected',
    'Connected',
    'Accepting',
    'Listening',
    'Closed',
    'DnsLookup');

implementation
uses SysUtils;


function TimeStr: string;
begin
  Result := FormatDateTime('hh:nn:ss.zzz ', now);
end;

function DateStr: string;
begin
  Result := FormatDateTime('dd-mm-yyyy hh:nn:ss ', now);
end;


function LongIp_To_StrIp(const lIP: LongWord): string;
var r: TRecIP;
begin
  r.LongIP := lIp;
  try
    Result := Format('%d.%d.%d.%d', [r.b3, r.b2, r.b1, r.b0]);
  except
    Result := '0.0.0.0';
  end;
end;

function StrIp_To_LongIp(const s: string): LongWord;
//const
//    digits = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
var
  digits : set of AnsiChar;
  i, j, l : integer;
  b : array[0..3] of Byte;
  c : byte;
  cp : string;
begin
  digits := ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  FillChar(result, 4, 0);

  l := Length(s);
  i := 1;
  c := 0;
  cp := '';

  while i <= l do
  begin
    if s[i] <> '.' then
    begin
      if CharInSet(s[i], digits) then //s[i] in digits then
        cp := cp + s[i]
      else
        Exit;
    end
    else begin //get .
      j := StrToInt(cp);
      if j > 255 then exit;
      if j < 0 then exit;

      b[c] := j;
      cp := '';
      Inc(c);
    end;

    Inc(i);
  end;
  if (cp <> '') then
  begin
    j := StrToInt(cp);
    if j > 255 then exit;
    if j < 0 then exit;

    b[c] := StrToInt(cp)
  end
  else exit;

  Move(b, Result, 4);
end;

function SockStateToString(const st: TSocketState): string;
begin
  Result :=  C_SockStatStr[st];
end;

end.

