unit U_Main;

{-$DEFINE CONSOLE} // debug SIP protocol

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, IniFiles, Winsock, MMSystem, uTCPDatatype ,

  SIP, RTP, RTCP, g711a,

  U_Options, U_Helper, IPC, uNetUDPnode, uDataVoipRecord;

type
  PIPCDataPhone = ^TIPCDataPhone;
  TIPCDataPhone = record
    //PacketID : TPacketID;
    cmd: string[15];
    Mode: Integer;
    Id : Integer;
  end;

  PIPCRecRespon = ^TIPCRecRespon;
  TIPCRecRespon = record              // Can Change Mode Phone if Respon form Server is 1
    Respon : byte;
  end;

  TMainFrm = class(TForm)
    btnDial: TButton;
    btnHangup: TButton;
    edtAddr: TEdit;
    btnCancel: TButton;
    btnConnect: TButton;
    btnDisconnect: TButton;
    btnOptions: TButton;
    IPCServer: TIPCServer;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnHangupClick(Sender: TObject);
    procedure btnDisconnectClick(Sender: TObject);
    procedure btnDialClick(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbTXClick(Sender: TObject);
    procedure IPCServerClientData(MsgPointer: Pointer; AHwnd: HWND);
  private
    { Private declarations }
    IPCID: string;
    FClientHwnd: HWND;
    isQuit: Boolean;

    isCall: Boolean;
    isConnect : Boolean;

    isOnlyTX : Boolean;

    CallDate:TDateTime;
    CallTime:cardinal;

    NetUDPHandler : TNetUDPNode;
    procedure ReceiveCommand(apRec: PAnsiChar; aSize: Word);

    procedure WMSIPMessage(var Msg); message WM_USER+1; // SIP Callback message
    procedure WMPCMAMessage(var Msg:TMessage); message WM_USER+3; // PCMA Callback message
    procedure WAVEInData(Var Msg:TMessage); message MM_WIM_DATA; // waveIn callback message
    procedure WMDeviceChange(Var Msg:TMessage); message WM_DEVICECHANGE;
    procedure OnError(Sender:TObject);
    procedure OnStep(Sender:TObject);
    procedure OnOpen(Sender:TObject);
    procedure OnClose(Sender:TObject);
    procedure OnStart(Sender:TObject);
    procedure OnStop(Sender:TObject);
{-$IFDEF CONSOLE}
    procedure OnSend(Sender:TObject);
    procedure OnRecv(Sender:TObject);
{-$ENDIF}

    procedure Open_IPCServer(ASessionName: string);
    procedure SendData(ACmd: string; AMode: Integer);
    procedure Close_IPC;

    procedure SendResponse(AHwnd: HWND; AResponse: Byte);

  public
    { Public declarations }
    isTX: Boolean;
    PTT : Boolean;
    isWaveInOff : Boolean;

    isHaveDial : Boolean;

    Conf: TConfig;
    LogFile: TLogFile;
    Options: TOptionsFrm;
    SIP :TSIPClient;
    RTP :TRTPClient;  // RTP protocol
    RTCP:TRTCPClient; // RTCP protocol
    PCMA:TPCMA;       // g711a codes

    procedure GetParameter(session,registrar, user, pass, wavein, waveout: string;
                           SIP_Port, RTP_Port, Channel: Integer;
                           autoconnect, autodial, issilent, islogged: Boolean);
    procedure Initialize;
    procedure InitializeLogFile;
    procedure Dial(const Number:string);
  end;

var
  MainFrm: TMainFrm;

implementation

uses InfoDialog, SoudTest;

{$R *.dfm}

procedure TMainFrm.Open_IPCServer(ASessionName: string);
begin
  LogFile.Log('Open_IPCServer','Open IPC Server ... (Session Name : '+ASessionName+')');
  if not IPCServer.Active then
    IPCServer.SessionName := ASessionName;
  IPCServer.Open;
end;

procedure TMainFrm.SendData(ACmd: string; AMode: Integer);
var
  MsgData: TIPCDataPhone;
begin
  if IPCServer.Active then
  begin
    MsgData.cmd := ACmd;
    MsgData.Mode := AMode;
    IPCServer.SendMsg(@MsgData, FClientHwnd, Sizeof(MsgData));
  end;
end;


procedure TMainFrm.Close_IPC;
begin
  LogFile.Log('Close_IPC','Close IPC Server ... ');
  IPCServer.Close;
end;

procedure TMainFrm.GetParameter(session,registrar, user, pass, wavein, waveout: string;
                                SIP_Port, RTP_Port, Channel: Integer;
                                autoconnect, autodial, issilent, islogged: Boolean);
begin

  if Length(session)<> 0 then
    IPCID:= session;

  if Length(registrar)<> 0 then
    Conf.Registrar:= registrar;

  Conf.Domain:= Conf.Registrar;

  if Length(user)<> 0 then
    Conf.Username:= user;

  if Length(pass)<> 0 then
    Conf.Passwd:= pass;

  if Length(wavein)<> 0 then
    Conf.WaveIn:= wavein;

  if Length(waveout)<> 0 then
    Conf.WaveOut:= waveout;

  if SIP_Port<> 0 then
    Conf.SIP_Local_Port:= SIP_Port;
    //Conf.SIP_Local_Port:= 6000;

  if RTP_Port<> 0 then
    Conf.RTP_Local_Port:= RTP_Port;
    //Conf.RTP_Local_Port:= 6002;

  if Channel<> 0 then
    Conf.Channel:= Channel;

  Conf.IsAutoConnect:= autoconnect;

  Conf.IsAutoDial:= autodial;

  Conf.IsSilent:= issilent;

  Conf.IsLogged:= islogged;

end;

procedure TMainFrm.InitializeLogFile;
begin
  LogFile.IsLog:= Conf.IsLogged;
  LogFile.Init;
end;

procedure TMainFrm.Initialize;
begin
  isTX:= True;
  PTT := False;

  isCall := False;

  isHaveDial := True;

  LogFile:= TLogFile.Create;
  LogFile.FileName:= ChangeFileExt(Application.ExeName,'-'+IPCID+'.log');
  InitializeLogFile;

  LogFile.Log('GetParameter','Parsing parameter from command line ... ');
  LogFile.Log('GetParameter','IPCID = '+IPCID);
  LogFile.Log('GetParameter','Registrar = '+Conf.Registrar);
  LogFile.Log('GetParameter','Domain = '+Conf.Domain);
  LogFile.Log('GetParameter','User = '+Conf.Username);
  LogFile.Log('GetParameter','Password = '+Conf.Passwd);
  LogFile.Log('GetParameter','WaveIn = '+Conf.WaveIn);
  LogFile.Log('GetParameter','WaveOut = '+Conf.WaveOut);
  LogFile.Log('GetParameter','SIP Local Port = '+IntToStr(Conf.SIP_Local_Port));
  LogFile.Log('GetParameter','RTP Local Port = '+IntToStr(Conf.RTP_Local_Port));
  LogFile.Log('GetParameter','Channel = '+IntToStr(Conf.Channel));
  LogFile.Log('GetParameter','Auto Connect = '+BoolToStr(Conf.IsAutoConnect,True));
  LogFile.Log('GetParameter','Auto Dial = '+BoolToStr(Conf.IsAutoDial,True));
  LogFile.Log('GetParameter','Silent = '+BoolToStr(Conf.IsSilent,True));
  LogFile.Log('GetParameter','Log = '+BoolToStr(Conf.IsLogged,True));

  LogFile.Log('Initialize','Open IPC Server ... ');
  Open_IPCServer(IPCID);

  //LogFile.Log('Initialize','Create Info Dialog ... ');
  //InfoDlg:= TInfoDlg.Create(Application);
  LogFile.Log('Initialize','Create TOptionsFrm Object ... ');
  Options:= TOptionsFrm.Create(Application);

  LogFile.Log('Initialize','Create SIP Object ... ');
  {$IFDEF CONSOLE}
  System.Write('Create SIP Object ... ');
  {$ENDIF}
  SIP:=TSIPClient.Create(Handle,WM_USER+1, Conf.SIP_Local_Port, Conf.SIP_Remote_Port);
  LogFile.Log('Initialize','Assign SIP event handler ... ');
  SIP.OnError:=OnError;
  SIP.OnStep:=OnStep;
  SIP.OnOpen:=OnOpen;
  SIP.OnClose:=OnClose;
  SIP.OnStart:=OnStart;
  SIP.OnStop:=OnStop;
  SIP.OnSend:=OnSend;
  SIP.OnRecv:=OnRecv;
  {$IFDEF CONSOLE}
  System.Writeln('done.');
  {$ENDIF}

  LogFile.Log('Initialize','Create RTP Object ... ');
  RTP :=TRTPClient.Create(Conf.RTP_Local_Port);
  LogFile.Log('Initialize','Create RTCP Object ... ');
  RTCP:=TRTCPClient.Create(RTP);
  LogFile.Log('Initialize','Create PCMA Object ... ');
  PCMA:=TPCMA.Create(Handle, IPCID); // Handle needed for waveIn callback message

  edtAddr.Text:=RTP.LocalAddr;
  SIP.SetLocal(RTP.LocalAddr,RTP.Port);

  LogFile.Log('Initialize','Get Wave Device Info ... ');
  Options.CheckDevices;
  LogFile.Log('Initialize','Determine Wave Device for use ... ');
  Options.SetWaveIn(Conf.WaveIn);
  Options.SetWaveOut(Conf.WaveOut);

  SIP.Accept:= Conf.IsDoNotDisturb;

  if Conf.WaveOut = '' then
  begin
    isOnlyTX := True;
    PCMA.isNoRx := True;
    LogFile.Log('Initialize', 'Mode Tx Only');
  end
  else
  begin
    isOnlyTX := False;
    PCMA.isNoRx := False;
    LogFile.Log('Initialize', 'Mode Tx or Rx');
  end;

  LogFile.Log('Initialize','Do autologin to VOIP server ... ');
  if Conf.IsAutoConnect then
    btnConnect.Click;

  NetUDPHandler := TNetUDPNode.Create;
  NetUDPHandler.RegisterProcedure(CPID_ICSDataPhone, ReceiveCommand, SizeOf(TICSdataPhone));
  NetUDPHandler.Listen(IPCID);
end;

procedure TMainFrm.FormCreate(Sender: TObject);
begin

  isQuit      := False;
  isWaveInOff := False;
  isOnlyTX    := False;

    {$IFDEF CONSOLE}
  AllocConsole;
  {$ENDIF}


  {$IFDEF CONSOLE}
  System.Write('Create Config Object ... ');
  {$ENDIF}
  conf:= TConfig.Create;
  {$IFDEF CONSOLE}
  System.Writeln('done.');
  {$ENDIF}
  conf.FileName:= ChangeFileExt(Application.ExeName,'.ini');
  
  {$IFDEF CONSOLE}
  System.Write('Loading Config from '+conf.Filename+' ... ');
  {$ENDIF}
  conf.Load;
  {$IFDEF CONSOLE}
  System.Writeln('done.');
  {$ENDIF}
end;

procedure TMainFrm.FormDestroy(Sender: TObject);
begin
  LogFile.Log('FormDestroy','Close IPC ... ');
  Close_IPC;
  LogFile.Log('FormDestroy','Destroy Conf ... ');
  conf.Free;
  LogFile.Log('FormDestroy','Destroy PCMA ... ');
  PCMA.Free;
  LogFile.Log('FormDestroy','Destroy RTCP ... ');
  RTCP.Free;
  LogFile.Log('FormDestroy','Destroy RTP ... ');
  RTP.Free;
  LogFile.Log('FormDestroy','Destroy SIP ... ');
  SIP.Free;
  LogFile.Free  
end;

procedure TMainFrm.WMSIPMessage(var Msg);
begin
  LogFile.Log('WMSIPMessage','SIP message event triggered ... ');
  SIP.ProcessMessage(Msg);
end;

procedure TMainFrm.WMPCMAMessage(var Msg:TMessage);
{var
 cl:TColor;}
begin
 {
 case Msg.wParam of
  0: ;cl:=clYellow;
  1: begin
   cl:=clLime;
   //Options.Log('<--RECV RTP from '+inet_ntoa(RTP.From.sin_addr)+':'+IntToStr(ntohs(RTP.From.sin_port))+'-->');
  end;
  2: cl:=clWhite;
  3: cl:=clRed;
  5: begin AllocConsole; WriteLn('Not enough buffer ...'); exit; end; // Not enough buffer
  6: exit;
  7: begin AllocConsole; WriteLn('Windows Error #',Msg.lParam); exit; end; // Windows error #
  8: begin if Msg.lParam<>252 then begin AllocConsole; WriteLn('Error '+IntToStr(Msg.lParam)); end; exit;  end;
 end;
 if shpRX.Brush.Color=cl then
   shpRX.Brush.Color:=clWhite
 else
   shpRX.Brush.Color:=cl;
 }
end;

function IntToStr2(i:integer):string;
begin
 Str(i,Result);
 if Length(Result)=1 then Result:='0'+Result;
end;

procedure TMainFrm.WAVEInData(Var Msg:TMessage);
// waveIn callback
var
 Header:PWaveHdr;
 maxamp:integer;
 time  :cardinal;
 h,m   :cardinal;
 str   :string;
begin
// we took the opportunity to update the timer
 {time:=(GetTickCount-CallTime) div 1000;
 m:=(time div 60); dec(time,m*60);
 h:=(m div 60); dec(m,60*h);
 if h>0 then str:=IntToStr(h)+':' else str:='';
 lblTalkTime.Caption:=str+IntToStr2(m)+':'+IntToStr2(time);}

// there will
 Header:=pointer(Msg.LParam);

 //maxamp:=DrawSound(Header.lpData,PaintBox1.Canvas,clLime);
 maxamp:=GetMaxAmp(Header.lpData);

// enough amplitude ?
 if isTX and ((not Conf.IsSilent) or (maxamp>1)) and PTT then begin
 // send buffer to the remote client
   PCMA.WaveInMessage(Msg.wParam,Header);
   //if shpTX.Brush.Color=clRed then
   //  shpTX.Brush.Color:=clWhite
   //else
   //  shpTX.Brush.Color:=clRed;
 end else begin
 // just add the buffer to the listen queue
   waveInAddBuffer(Msg.wParam,Header,SizeOf(TWaveHdr));
   //shpTX.Brush.Color:=clWhite
 end
end;

procedure TMainFrm.WMDeviceChange(Var Msg:TMessage);
begin
// do not refresh the list during a conversation
 //if PageControl.ActivePageIndex=0 then CheckDevices else ConnexionPanel.Tag:=1;
// if fActivePage=0 then CheckDevices else ConnexionPanel.Tag:=1;
  LogFile.Log('WMDeviceChange','Device Change event triggered ... ');
  Options.CheckDevices;
end;

procedure TMainFrm.OnError(Sender:TObject);
begin
{
 case SIP.Error of
  SIP_HOST_NOT_FOUND  : ShowMessage('Domain/Host : '+SIP.Domain+' not found !');
  SIP_NO_SOCKET       : ShowMessage('Error opening socket !');
  SIP_SEND_ERROR      : ShowMessage('Send Error !');
  SIP_RECV_ERROR      : ShowMessage('Receive Error !');
  SIP_INVALID_RESPONSE: ShowMessage('Invalid Response !'#13+SIP.Head);
  SIP_UNAUTHORIZED    : ShowMessage('Access Denied !');
  SIP_NOT_CONNECTED   : ShowMessage('Invalid operation when not connected to server !');
  else ShowMessage('SIP Error #'+IntToStr(SIP.Error));
 end;
}
case SIP.Error of
  SIP_HOST_NOT_FOUND  : LogFile.Log('OnError','Domain/Host : '+SIP.Domain+' not found !');
  SIP_NO_SOCKET       : LogFile.Log('OnError','Error opening socket !');
  SIP_SEND_ERROR      : LogFile.Log('OnError','Send Error !');
  SIP_RECV_ERROR      : LogFile.Log('OnError','Receive Error !');
  SIP_INVALID_RESPONSE: LogFile.Log('OnError','Invalid Response !'#13+SIP.Head);
  SIP_UNAUTHORIZED    : LogFile.Log('OnError','Access Denied !');
  SIP_NOT_CONNECTED   : LogFile.Log('OnError','Invalid operation when not connected to server !');
  else LogFile.Log('OnError','SIP Error #'+IntToStr(SIP.Error));
 end;
end;

procedure TMainFrm.OnStep(Sender:TObject);
{$IFDEF CONSOLE}
const
 Steps:array[TSIPStep] of string=(
  'csNONE',
  'csREGISTER',
  'csREGISTERED',
  'csINVITE',
  'csAUTH',
  'csTRYING',
  'csWRONG',
  'csRINGING',
  'csCANCEL',
  'csCANCELED',
  'csUNAVAILABLE',
  'csERROR',
  'csONLINE',
  'csSENDBYE',
  'csRECVBYE',
  'csRECVINVITE',
  'csCALLREFUSED',
  'csCALLACCEPTED',
  'csRECVCANCEL'
 );
{$ENDIF}
begin
{$IFDEF CONSOLE}
 Caption:=Steps[SIP.Step];
{$ENDIF}
 //lblError.Caption:='';
 case SIP.Step of
  csNONE       : begin
                  //InfoDlg.Say('You are disconnected','All call can not be received');
                  LogFile.Log('OnStep','csNONE: Disconnected.');
                  if isQuit then
                    Close
                 end;
  csREGISTER   : LogFile.Log('OnStep','csREGISTER: Trying to connect ...');//lblStatus.Caption:='Trying to connect ...';
  csAUTH       : LogFile.Log('OnStep','csAUTH: Trying to authenticate ...');//lblStatus.Caption:='Trying to Authenticate ...';
  csREGISTERED : begin
                   //lblStatus.Caption:='Connection established ...';
                   LogFile.Log('OnStep','csREGISTERED: Connection established ...');
                   if Conf.IsAutoDial then
                   begin
                     if isHaveDial then
                     begin
                        btnDial.Click;
                        isTX := False;

                        isHaveDial := False;
                     end;
                   end;
                 end;
  csINVITE     : LogFile.Log('OnStep','csINVITE: Waiting for server ...');//lblStatus.Caption:='Waiting for server ...';

  csTRYING     : LogFile.Log('OnStep','csTRYING: Trying to call ...');//lblStatus.Caption:='Trying to call ...'; // call in progress ...
  csRINGING    : LogFile.Log('OnStep','csRINGING: It sounds ...');//lblStatus.Caption:='It sounds ...'; // it sounds ...
  csCANCEL     : LogFile.Log('OnStep','csCANCEL: Call canceled ...');//lblStatus.Caption:='Call canceled ...'; // call cancelled
  csCANCELED   : begin
                   if SIP.Mode=smLOGIN then
                      LogFile.Log('OnStep','csCANCELED: Connection failed ...')
                      //lblStatus.Caption:='Connection failed' // the connection failed
                   else
                      LogFile.Log('OnStep','csCANCELED: Call failed ...');
                      //lblStatus.Caption:='Call failed'; // call failed
                 end;
  csUNAVAILABLE: begin
                   //lblStatus.Caption:='Server temporary unavailable'; // Server Temporarily Unavailable
                   //lblError.Caption:=SIP.ErrMsg;
                   LogFile.Log('OnStep','csUNAVAILABLE: Server temporary unavailable ... (Error : '+SIP.ErrMsg+')');
                 end;
  csERROR      : begin
                   //lblStatus.Caption:='General Error'; // General Error
                   //lblError.Caption:=SIP.ErrMsg;
                   LogFile.Log('OnStep','csERROR: General Error ... (Error : '+SIP.ErrMsg+')');
                 end;
  csONLINE     : begin
                   //CallDate:=Now;
                   //CallTime:=GetTickCount;
                   //if PCMA.OpenIn=False then
                   //  CancelClick(Self); // en version 0.3.2, PCMA.Listen() est démarré plus tôt
                   LogFile.Log('OnStep','csONLINE: Conversation is online ... ');
                 end;
  csSENDBYE    : LogFile.Log('OnStep','csSENDBYE: Hangup ... ');//lblStatus.Caption:='Hangup ...'; // it hangs ...
  csRECVBYE    : LogFile.Log('OnStep','csRECVBYE: Caller Hangup ... ');//lblStatus.Caption:='Caller hung up ...'; // Caller hung up
  csWRONG      : LogFile.Log('OnStep','csWRONG: Username or password invalid ! ... ');//lblStatus.Caption:='Username or password invalid !'; // Username or password invalid!
  csRECVINVITE : begin
                  //lblCallerID.Caption:=SIP.Caller;
                  //InfoDlg.Say('Incoming Call',SIP.Caller,-1,icShow); // Incoming Call
                  LogFile.Log('OnStep','csRECVINVITE: Incoming Call from '+SIP.Caller+' ...')
                 end;
  csCALLREFUSED : begin
                   //lblStatus.Caption:='Call Denied'; // Call Denied
                   LogFile.Log('OnStep','csCALLREFUSED: Call Denied ... '+SIP.Caller)
                  end;
  csCALLACCEPTED: begin
                    LogFile.Log('OnStep','csCALLACCEPTED: Call accepted ... '+SIP.Caller)
                  end;
  csRECVCANCEL  : begin
                   //lblStatus.Caption:='Missed Call !'+#13+SIP.Phone; // Missed call!
                   LogFile.Log('OnStep','csRCVCANCEL: Missed Call ... '+SIP.Phone)
                  end;
 end;
// if SIP.Step=csONLINE then WaitPanel.Height:=225 else WaitPanel.Height:=113;
end;

procedure TMainFrm.OnOpen(Sender:TObject);
var
 s:string;
 i:integer;
begin
// update INI

// Ini.WriteString('SIPInside','LastID',SIP.UserID);
// Ini.WriteString(SIP.UserID,'Name',SIP.Name);
// if Options.RememberPassword.Checked then begin
//  Ini.WriteString(SIP.UserID,'Pass','{'+SIP.Crunch(SIP.UserID,SIP.Domain,Password.Text)+'}')
{ end else begin
  Ini.DeleteKey(SIP.UserID,'Pass');
 end;
 Ini.WriteBool(SIP.UserID,'AutoConnect',Options.AutoConnect.Checked);
 Ini.WriteString(SIP.UserID,'Domain',SIP.Domain);
 Ini.WriteString(SIP.UserID,'WaveIn',Options.WaveInName);
 Ini.WriteString(SIP.UserID,'WaveOut',Options.WaveOutName);
 Ini.WriteBool(SIP.UserID,'DoNotDisturb',Options.DoNotDisturb.Checked);
 Ini.WriteBool(SIP.UserID,'Silence',Options.Silence.Checked);
}
// -

{ lblConnectedName.Caption:=SIP.Name;
 lblConnectedID.Caption:=SIP.UserID+'@'+SIP.Domain;
}
// TrayInfo(NID,'Vous êtes connecté au serveur '+SIP.Domain); // You're connected to the server

{ InfoDlg.Say('You are logged in !',SIP.Name+#13+SIP.UserID+'@'+SIP.Domain); // You are logged in!
}

// Appel automatique du numéro en ligne de commande
// Automatic call number on the command line
 {if Tag>0 then exit;
 Tag:=1;
 if ParamCount<>1 then exit;
 s:=ParamStr(1);
 if copy(s,1,6)='sip://' then begin
  s:=copy(s,7,MaxInt);
  i:=pos('/',s);
  if i>0 then SetLength(s,i-1);
 end;
 PhoneBook.Number.Text:=s;
 PhoneBook.Call.Click;}

 LogFile.Log('OnOpen','Logged in ... (Name : '+SIP.Name+', ID : '+SIP.UserID+'@'+SIP.Domain+')');
end;

procedure TMainFrm.OnClose(Sender:TObject);
begin
  LogFile.Log('OnClose','Logged out ... ');
end;

procedure TMainFrm.OnStart(Sender:TObject);
var
 s:string;
 i:integer;
 p:integer;
begin
  LogFile.Log('OnStart','Preparing for Conversation ... ');
  s:=SIP.RemoteSDP;
  // quick check for Freephonie.net only ! don't expect that to work with any SIP server !!!

  // port
  i:=pos('m=audio ',s);
  if i=0 then exit;
  s:=copy(s,i+8,MaxInt);
  val(s,p,i);

  // ip
  s:=SIP.RemoteSDP;
  i:=pos('c=IN IP4 ',s);
  if i=0 then
    exit;
  s:=copy(s,i+9,MaxInt);
  i:=pos(#13,s);
  SetLength(s,i-1);
  
  LogFile.Log('OnStart','Create Socket for RTP and RTCP ...');
  RTCP.Start(SIP.UserID,s,p);   // create sockets
  LogFile.Log('OnStart','Prepare Waveout for incoming conversation from remote ...');
  PCMA.Listen(WM_USER+3,RTCP); // start waveIn/waveOut
  LogFile.Log('OnStart','Prepare Wavein for outgoing conversation to remote ...');
  PCMA.OpenIn;
  LogFile.Log('OnStart','Send Initial RTP Payload ...');
  RTCP.Enter;        // send initial RTP Payload
  s:=s+':'+IntToStr(p);
  { lblRemoteRTP.Caption:=s;
  InfoDlg.Say('Communication established',SIP.Phone+#13+s);
  }
  LogFile.Log('OnStart','Communication established ... (Phone : '+SIP.Phone+', Remote RTP : '+s+')');
end;

procedure TMainFrm.OnStop(Sender:TObject);
const
  CallTypes:array[TSIPCallType ] of string=(
    'Incoming',
    'Outgoing',
    'Failed'
  );
var
  s,mrc,n:string;
  key:char;
  Dummy:Word;
  Year:Word;
begin
  if SIP.CallType=ctOUT then
    n:=SIP.Phone
  else
    n:=SIP.Caller;
  if n<>'' then begin
  {s:=SIP.UserID+'.Calls';
  mrc:=Ini.ReadString(s,'MRC','');
  if length(mrc)<15 then begin
   key:=chr(ord('A')+Length(mrc));
   mrc:=key+mrc;
  end else begin
   key:=mrc[15];
   move(mrc[1],mrc[2],14);
   mrc[1]:=key;
  end;
  Ini.WriteString(s,'MRC',mrc);}
  // If call has not been established the call date is now...
  //DecodeDateFully(CallDate, Year, Dummy, Dummy, Dummy);
  //If Year<2000 then begin
   //CallDate:=Now;
   {lblTalkTime.Caption:='--:--';
   }
  //end;
  //Ini.WriteString(s,key,DateTimeToStr(CallDate)+#9+TalkTime.Caption+#9+n+#9+CallTypes[SIP.CallType]);
  {InfoDlg.Say('Communication terminated',SIP.Phone+#13'Talk time : '+lblTalkTime.Caption);
  }
    LogFile.Log('OnStop','Communication terminated ... (Phone : '+SIP.Phone+')');
  end;
  LogFile.Log('OnStop','Send RTP Report ...');
  RTCP.Leave;
  LogFile.Log('OnStop','Close Wave Device ...');
  PCMA.Close;
  LogFile.Log('OnStop','Destroy Socket for RTP/RTCP ...');
  RTCP.Stop;

  if isQuit then
    btnDisconnect.Click;
  // If Call Type = missed we need the Cancel
  //If SIP.CallType<>ctMISSED then btnCancel.Tag:=1;
  //btnCancel.Caption:='CLOSE';
end;

procedure TMainFrm.OnSend(Sender:TObject);
begin
 {$IFDEF CONSOLE}
 WriteLn('<--SEND '+TimeToStr(Now)+'-->');
 WriteLn(SIP.Send);
{$ENDIF}
 LogFile.Log('OnSend','SEND to '+inet_ntoa(SIP.Remote.sin_addr)+':'+IntToStr(htons(SIP.Remote.sin_port))+#13#10+SIP.Send);
end;

procedure TMainFrm.OnRecv(Sender:TObject);
begin
 {$IFDEF CONSOLE}
 WriteLn('<--RECV from '+inet_ntoa(SIP.From.sin_addr)+':'+IntToStr(htons(SIP.From.sin_port))+' -->');
 WriteLn(SIP.Head);
 Write('<---');
 Write(SIP.Data);
 WriteLn('--->');
{$ENDIF}
 LogFile.Log('OnRecv','RECV from '+inet_ntoa(SIP.From.sin_addr)+':'+IntToStr(htons(SIP.From.sin_port))+#13#10+
             SIP.Head+#13#10+SIP.Data+#13#10);
end;

procedure TMainFrm.Dial(const Number:string);
begin
  LogFile.Log('Dial','Dial '+Number+' ...');
  //lblStatus.Caption:='Dialing '+Number+' in progress ...';
  btnCancel.Caption:='CANCEL';
  btnCancel.Tag:=0;
  SIP.Dial(Number);
end;

procedure TMainFrm.btnConnectClick(Sender: TObject);
begin
  LogFile.Log('btnConnect','Login to voip server ...');
  btnCancel.Caption:='CANCEL';
  btnCancel.Tag:=0;
  // Start the SIP login (see SIP.OnXXX, CancelClick for more)
  SIP.Login(conf.Username,conf.Domain,conf.Username,conf.Passwd);

  //SIP.Login('1001', '192.168.1.107','1001','1234');
end;

procedure TMainFrm.btnCancelClick(Sender: TObject);
begin
  LogFile.Log('btnCancel','Cancel curent Conversation ...');
  // premier cancel
  if btnCancel.Tag=0 then begin
    SIP.Cancel; // voir SIP.OnXXX pour les changements / See SIP.OnXXX Change
    RTCP.Leave;
    PCMA.Close;
  end else begin
    if SIP.Registered then
      SIP.Step:=csREGISTERED
    else
  end;
end;

procedure TMainFrm.btnHangupClick(Sender: TObject);
begin
  LogFile.Log('btnHangup','Hangup the current conversation ...');
  if SIP.Step=csONLINE then
    SIP.Cancel // voir SIP.OnXXX pour les changements  / see SIP.OnXXX Change
  //else
   //btnDisconnect.Click;
  //RTCP.Leave;
  //PCMA.Close;
end;

procedure TMainFrm.btnDisconnectClick(Sender: TObject);
begin
  //if SIP.Status
  LogFile.Log('btnDisconnect','Logout from voip server ...');
  SIP.Logout;
end;

procedure TMainFrm.btnDialClick(Sender: TObject);
begin
  Dial(IntToStr(Conf.Channel));

 // Dial(IntToStr(3000));
end;

procedure TMainFrm.btnOptionsClick(Sender: TObject);
begin
  Options.Show
end;

procedure TMainFrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Options.Free;
  //InfoDlg.Free
end;

procedure TMainFrm.cbTXClick(Sender: TObject);
begin
  {isTX:= cbTX.Checked
  }
end;

procedure TMainFrm.SendResponse(AHwnd: HWND; AResponse: Byte);
var
  MsgData : TIPCRecRespon;
begin
  MsgData.Respon := AResponse;
  IPCServer.SendMsg(@MsgData, AHwnd, SizeOf(MsgData));
end;

procedure TMainFrm.IPCServerClientData(MsgPointer: Pointer; AHwnd: HWND);
var AMsg: TIPCDataPhone;
    s: string;
begin
  LogFile.Log('IPCServerClientData','Receive data from IPC Client ...');
  FClientHwnd:= AHwnd;
  AMsg := TIPCDataPhone(MsgPointer^);
  s:= LowerCase(Trim(AMsg.cmd));

  if s='quit' then begin
    LogFile.Log('IPCServerClientData','cmd : QUIT');
    isQuit:= True;
    //btnHangup.Click

    btnDisconnect.Click;
  end else
  if s='mode' then begin
    isQuit:= False;
    case AMsg.Mode of
      1: begin
           btnHangup.Click; // off
           SendResponse(FClientHwnd,1);
           LogFile.Log('IPCServerClientData','cmd : MODE 1');
         end;
      2: begin
           isTx:= False;
           btnDial.Click;
           SendResponse(FClientHwnd,2);
           LogFile.Log('IPCServerClientData','cmd : MODE 2');
         end; // rx
      3: begin
           isTx:= True; // tx/rx
           SendResponse(FClientHwnd,3);
           LogFile.Log('IPCServerClientData','cmd : MODE 3');
         end;
      4: begin
            PTT := True; //PTT On
            SendResponse(FClientHwnd,4);
            LogFile.Log('IPCServerClientData','cmd : MODE 4');
         end;
      5: begin
            PTT := False; //PTT Off
            SendResponse(FClientHwnd,5);
            LogFile.Log('IPCServerClientData','cmd : MODE 5');
         end;
      6: begin
            if not isWaveInOff then
            begin
              PCMA.Close; //Close Wave in Device
              isWaveInOff := True;
            end;

            LogFile.Log('IPCServerClientData','cmd : MODE 6');
         end;
      7: begin
            if isWaveInOff then
            begin
              PCMA.Listen(WM_USER+3,RTCP);  //Start Wave In Device
              isWaveInOff := False;
            end;

            LogFile.Log('IPCServerClientData','cmd : MODE 7');
         end;
    end
  end
end;

procedure TMainFrm.ReceiveCommand(apRec: PAnsiChar; aSize: Word);
var
  RecRecv : ^TICSDataPhone;
  s : string;
begin
  RecRecv := @aprec^;

  LogFile.Log('Receive','Receive from connector');
  s:= LowerCase(Trim(RecRecv^.cmd));

  if s='quit' then
  begin
    LogFile.Log('ICSData','cmd : QUIT');
    isQuit:= True;
    //btnHangup.Click

    btnDisconnect.Click;
  end
  else
  if s='mode' then begin
    isQuit:= False;
    case RecRecv^.Mode of
      1: begin
           btnHangup.Click; // off
           PCMA.isRecord := False;
           LogFile.Log('ICSData','cmd : MODE 1, Off');
         end;
      2: begin
           isTx:= False;
           btnDial.Click;
           LogFile.Log('ICSData','cmd : MODE 2, Rx');
         end; // rx
      3: begin
           isTx:= True; // tx/rx
           LogFile.Log('ICSData','cmd : MODE 3, Tx,Rx');
         end;
      4: begin
            PTT := True; //PTT On
            LogFile.Log('ICSData','cmd : MODE 4, PTT On');
         end;
      5: begin
            PTT := False; //PTT Off
            LogFile.Log('ICSData','cmd : MODE 5, PTT Off');
         end;
      6: begin
            if not isWaveInOff then
            begin
              PCMA.Close; //Close Wave in Device
              isWaveInOff := True;
            end;

            LogFile.Log('ICSData','cmd : MODE 6');
         end;
      7: begin
            if isWaveInOff then
            begin
              PCMA.Listen(WM_USER+3,RTCP);  //Start Wave In Device
              isWaveInOff := False;
            end;

            LogFile.Log('ICSData','cmd : MODE 7');
         end;
      8: begin
           isTx:= False;
           btnDial.Click;

           PCMA.isRecord := True;
           LogFile.Log('ICSData','cmd : MODE 8, Rx + Record');
         end;
    end
  end

end;

end.
