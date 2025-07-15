unit SIP;

// SIP Client for Delphi 6PE, (c)2006 by Paul TOTH <tothpaul@free.fr>
// http://tothpaul.free.fr

{
This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
}

(* Documentation :
 ---------------

 Session Initiation Protocol (RFC 3261) :

  http://fr.wikipedia.org/wiki/Session_Initiation_Protocol
  ftp://ftp.rfc-editor.org/in-notes/rfc3261.txt

 Session Description Protocol (RFC 2327) :

 Other links :

  http://abcdrfc.free.fr/ [RFC en français]


 Historique :
 ------------

 4 août 2007 - 0.4.9 (Paul TOTH)
  - augmentation du nombre de buffer sond (g711a.pas) pour améliorer la qualité du son
    sur certaines config.

 3 août 2007 - 0.4.8 (Paul TOTH)
  - ajout de la gestion d'un INVITE en retour (problème de la coupure au bout de 32s)
  - ajout du numéro à composer en ligne de commande

 13 mai 2007 - 0.4.7 (Paul TOTH)
  - première release de la version RTCP
  - correction de l'enchainement des écrans sur une connexion impossible (bouton ANNULER)

 18 avril 2007
  - ajout de RTCP (pas sur de moi)
  - changement du "tag" de From car il n'était pas possible d'appeler deux fois de suite **1 (#patch2)

 9 avril 2007 - 0.4.6 (Paul TOTH)
  - 500 Internal Error...ça marche encore une fois pas bien chez Freephone :S

 2 avril 2007
  - inversion des messages chez Free ? il faut maintenant gérer le 407 sur un csTRYING

 9 mars 2007 #patch1
  - ne pas répondre aux appels entrant refusés

 4 novembre 2006 - 0.4.4 (Paul TOTH)
  - ajout des états 18x et 48x (notamment Busy)
  - suppression du filre RTP (à voir)
  - ajout de l'option "Silence" (voir main)

 20 octobre 2006 - 0.4.3 (Paul TOTH)
  - ajout du TrayIcon

 5 octobre 2006 - 0.4.2 (Paul TOTH)
  - ajout de la réponse "481 Call/Transaction Does Not Exist" par défaut
  - filtrage des packets RTP entrant (Adresse IP, Port et SSRC)

 29 septembre 2006 - 0.4.1 (Paul TOTH)
  - ajout de l'objet TSession pour gérer correctement les appels entrant
 (todo: gérer le login dans un objet TSession pour rendre l'ensemble plus cohérant)

 27 septembre 2006 - 0.4.0 (Paul TOTH)
  - validation du code de Fritivi
  - modification de l'interface graphique

 20 septembre 2006 - x.x.x (by Fritivi - http://fritivi.free.fr)
  - réception des appels entrants
  - modification de l'historique des appels : ajout du type d'appel, séparation des colonnes avec tabulation

 11 septembre 2006 - 0.3.3 (Paul TOTH)
  - correction d'un erreur dans l'ordre d'appel de Start et Step:=csONLINE
  - ajout de l'historique des 15 derniers appels

 30 août 2006 - 0.3.2  (Paul TOTH)
  - merci à Nicolas qui m'a ouvert les yeux !
  - la session audio doit démarrer dès que possible (document SDP), ce qui peut se
    produire lors du TRYING, donc bien avant que le correspondant décroche.
    Du coup, on a maintenant la sonnerie :D

 28 août 2006 - 0.3.1 (Paul TOTH)
  - ajout du check de version (dans main.pas)
  - utilise le MD5 par défault (rend SIPInside compatible avec sip.1und1.de).

 11 août 2006 - 0.3.0 (Paul TOTH)
  - passage en mode multithread
  - utilisation de REGISTER

 11 août 2006 - 0.2.3 (Paul TOTH)
  - petit bug de Crunch()

 5 août 2006 - 0.2.2 (Paul TOTH)
  - codage du mot de passe, le calcul A1 peut remplacer le mot de passe sous la forme {A1}

 1er août 2006 (Paul TOTH)
 - première release des sources

 17 juillet 2006 - b0.1.2 :
  - réécriture partie UDP

 12 juillet 2006 - b0.1.1 :
  - passage en mode asynchrone
  - avec gestion de l'état de la "communication" avec OnStep
  - gestion de l'interactivité (SIP.Cancel)

  NB: il faut revoir tout l'aspect socket I/O car en UDP ça ne devrait pas fonctionner comme je l'ai fait

 11 juillet 2006 - b0.1 :
  - premiers tests en mode bloquant, ça fonctionne en UDP, mais il reste la partie RTP/AVP !

 SDP (RFC 2327)

*)

interface

uses
 Windows, Messages, Winsock,
 Classes, SysUtils, UDP;

const
 SIP_VERSION  = 'SIPInside 0.4.9';
 SIP_RELEASE  = SIP_VERSION+' (2007-08-04)';

// SIP_DEFAULT_PORT = 5060;

// SIP Error
 SIP_NO_ERROR        = 0;
 SIP_HOST_NOT_FOUND  = 1;
 SIP_NO_SOCKET       = 2;
 SIP_SEND_ERROR      = 3;
 SIP_RECV_ERROR      = 4;
 SIP_INVALID_RESPONSE= 5;
 SIP_UNAUTHORIZED    = 6;
 SIP_NOT_CONNECTED   = 7;

 SIP_RECVDATA        = 1;

type
 TSIPStep=(
  csNONE,       // before or after a conversation
  csREGISTER,   // send REGISTER
  csREGISTERED, // Registered
  csINVITE,     // send INVITE
  csAUTH,       // 40x Authenticate
  csTRYING,     // 101 Trying
  csWRONG,      // 403 Wrong login or password
  csRINGING,    // 108 Ringing
  csCANCEL,     // send CANCEL
  csCANCELED,   // 487 Canceled, or cancel INVITE (no response from server)
  csUNAVAILABLE,// 480 Temporarily Unavailable
  csERROR,      // 500 Internal Error
  csONLINE,     // 200 OK after INVITE, TRYING or RINGING
  csSENDBYE,    // send BYE
  csRECVBYE,     // BYE received

  csRECVINVITE,  // Incoming call !
  csCALLREFUSED, // Don't talk to me ! => 486 busy here
  csCALLACCEPTED,// OK envoyé,
  csRECVCANCEL   // Caller has cancelled the call...
 );

 TSIPMode=(
  smLOGIN,  // REGISTER to the SIP server
  smCALL,   // send INVITE
  smRECV,   // receive INVITE
  smLOGOUT  // "UNREGISTER"
 );

 TSIPCallType=(
  ctIN,
  ctOUT,
  ctMISSED
 );

 TCustomSIPClient=class;

 TSession=class
  Owner   :TCustomSIPClient;
  CallID  :string;
  Via     :string;
  URI     :string;
  From    :string;
  Target  :string;
  Header  :string;
  Sequence:integer;
  constructor Create(AOwner:TCustomSIPClient);
  procedure Release;
  procedure SendReply(const Status:string);
  procedure SendSDPReply(const Status:string);
  procedure ExecRequest(const Request:string);
  procedure RecvRequest;
  procedure RecvStatus;
 end;

 TSessionList=class(TList)
  procedure Clear; override;
  function FindSession(const ID:string; var Session:TSession):boolean;
 end;

 TCustomSIPClient=class(TCustomUDPClient)
 private
  fHWnd      :THandle;   // Window Handle used for Async sockets
  fMsg       :integer;   // Message for Async sockets
  fActive    :boolean;
  fThread    :THandle;
  fErrMsg    :string;
  fSIP_LOCAL_PORT,fSIP_REMOTE_PORT : Integer;
 private
  fSessions  :TSessionList;
  fSession   :TSession;
  fSessionID :integer;   // SDP session
 // Socket
  fRemote    :TSockAddr; // SockAddr to send data to fDomain
  fReceived  :string;    // fDomain IP address
  fExpires   :string;    // 1800 or 0 for Logout
  fVia       :string;    // SIP Via header line
  fContact   :string;    // SIP Contact header line
  fBranch    :string;    // SIP Via header line Branch value
  fFrom      :string;    // SIP From header line
  fCallID    :string;    // SIP Call-ID
  fRequest   :string;    // last Request
  fURI       :string;    // URI
  fTarget    :string;    // Target
  fTagged    :string;    // Tagged target
  fSequence  :cardinal;  // Request sequence
  fStep      :TSIPStep; // Phone call step
  fMode      :TSIPMode;
  fCallType  :TSIPCallType;
 // socket I/O
  procedure WriteData;
 // extract header info
  function IntegerAt(Offset:integer):integer;
  function getHeader(const Tag:string):string;
 // generic send request method
  procedure SendRequest(const Request,Target,Headers,Content:string);
 // send a request with a new Request number
  procedure ExecRequest(const Request,Target,Headers,Content:string);
 // retreive SIP status code
  function GetStatus:integer;
 // send a status code for a SIP request (BYE)
  procedure SendReply(const Status:string);
  procedure SendSDPReply(const Status:string);
 // compute authorisation response (RFC 2617)
  function GetAuthorization(const Method,URI:string):string;
 // resend request with authorization response
  procedure SendAuthorization;
  procedure ThreadProc;
 protected
  fName      :string;    // User name
  fUserID    :string;    // SIP userid
  fPasswd    :string;    // SIP password
  fPhone     :string;    // Phone number to call -> <sip:fPhone@fDomain>
  fDomain    :string;    // SIP domain
  fData      :string;    // request body
  fSend      :string;    // send buffer
  fHead      :string;    // request header
  fStatus    :integer;   // request status code
  fLocalSDP  :string;
  fLocalTag  :string;
  fRemoteSDP :string;
  fRegistered:boolean;
  fCaller    :string;
  fAccept    :boolean;
  procedure RecvStatus;
  procedure RecvRequest;
  procedure RecvData; virtual;
  procedure SendData; virtual;
  procedure Open; virtual;   // REGISTERED
  procedure Start; virtual;  // start conversation
  procedure Stop; virtual;   // end communication
  procedure SetStep(Value:TSIPStep); virtual;
  property Error:integer read fError write SetError;
  property Step:TSIPStep read fStep write SetStep;
  property CallType:TSIPCallType read fCallType write fCallType;
 public
  procedure Close; override; // UNREGISTER, close socket
  constructor Create(AHandle:HWnd; AMsg:integer; ASIP_Local_Port,ASIP_Remote_Port: Integer);
  destructor Destroy; override;
  procedure SetLocal(const Addr:string; Port:word);
  procedure Login(const AUsername, ADomain, AUserID, APassword:string);
  procedure Logout;
  procedure Dial(const APhoneNumber:string);
  procedure AnswerCall;
  procedure RefuseCall;
  function Crunch(const UserID, Realm, Password:string):string;
  procedure Cancel;
  procedure ProcessMessage(var Msg);
  property Mode:TSIPMode read fMode;
  property Caller:string read fCaller;
  property Accept:boolean read fAccept write fAccept;
  property Remote:TSockAddr read fRemote;
 end;

 TSIPClient=class(TCustomSIPClient)
 private
  EOnSend :TNotifyEvent;
  EOnRecv :TNotifyEvent;
  EOnStep :TNotifyEvent;
  EOnOpen :TNotifyEvent;
  EOnClose:TNotifyEvent;
  EOnError:TNotifyEvent;
  EOnStart:TNotifyEvent;
  EOnStop :TNotifyEvent;
 protected
  procedure RecvData; override;
  procedure SendData; override;
  procedure Open; override;
  procedure Start; override;
  procedure Stop; override;
  procedure SetStep(Value:TSIPStep); override;
 public
  procedure Close; override;
  property Name:string read fName;
  property UserID:string read fUserID;
  property Domain:string read fDomain;
  property Phone:string read fPhone;
  property Registered:boolean read fRegistered;
  property Error;
  property Step;
  property CallType;
  property Status:integer read fStatus;
  property Head:string read fHead;
  property Data:string read fData;
  property Send:string read fSend;
  property LocalSDP:string read fLocalSDP write fLocalSDP;
  property RemoteSDP:string read fRemoteSDP;
  property ErrMsg:string read fErrMsg;
  property OnSend:TNotifyEvent read EOnSend write EOnSend;
  property OnRecv:TNotifyEvent read EOnRecv write EOnRecv;
  property OnStep:TNotifyEvent read EOnStep write EOnStep;
  property OnOpen:TNotifyEvent read EOnOpen write EOnOpen;
  property OnClose:TNotifyEvent read EOnClose write EOnClose;
  property OnStart:TNotifyEvent read EOnStart write EOnStart;
  property OnStop:TNotifyEvent read EOnStop write EOnStop;
  property OnError:TNotifyEvent read EOnError write EOnError;
 end;

implementation

uses md5;

function getValue(const key,str:string):string;
var
 i,j:integer;
begin
 Result:='';
 i:=pos(key,str);
 if i=0 then exit;
 inc(i,length(key));
 if i+2>length(str) then exit;
 if str[i]<>'=' then exit;
 inc(i);
 if str[i]='"' then begin
  inc(i);
  j:=i;
  while (j<=length(str)) and (str[j]<>'"') do inc(j);
 end else begin
  j:=i;
  while (j<=length(str))and(not (str[j] in [' ',','])) do inc(j);
 end;
 Result:=copy(str,i,j-i);
end;

function StartMe(Sender:TCustomSIPClient):integer; stdcall;
begin
 try
  Sender.ThreadProc;
  Result:=0;
 except
  Result:=-1;
 end;
end;

//----------------------------------------------------------------------------//
constructor TSession.Create(AOwner:TCustomSIPClient);
var
 s:string;
 i:integer;
begin
 Owner:=AOwner;
 CallID:=Owner.getHeader('Call-ID');
 Owner.fSessions.Add(Self);
 From:=Owner.getHeader('From')+#13#10;
 Target:=Owner.getHeader('To')+';tag='+IntToStr(getTickCount)+#13#10;
 Header:='From: '+From+
         'To: '+Target+
         'Call-ID: '+CallID+#13#10+
         'Max-Forwards: 70'#13#10+
         'Expires: 1800'+#13#10+
         'User-Agent: '+SIP_RELEASE+#13#10;
 SendReply('180 RINGING');
 Owner.Start;

 s:=From;
 i:=pos(';',s); if i>0 then SetLength(s,i-1);
 if s[length(s)]<>'>' then s:=s+'>';

// From: "Name" <sip:id@domain;user=phone>;tag=123
 URI:=From;
 i:=pos('<',URI); if i>0 then delete(URI,1,i);
 i:=pos('>',URI); if i>0 then SetLength(URI,i-1);
 i:=pos(';',URI); if i>0 then SetLength(URI,i-1);

 Owner.fCaller:=s;
 Owner.fCallType:=ctIN;
 Owner.Step:=csRECVINVITE;
end;

procedure TSession.Release;
begin
 Owner.fSessions.Remove(Self);
 Free;
end;

procedure TSession.SendReply(const Status:string);
begin
 Owner.fSend:='SIP/2.0 '+Status+#13#10+
              'Via: '+Owner.getHeader('Via')+';received='+inet_ntoa(Owner.From.sin_addr)+#13#10+
              Header+
              'CSeq: '+Owner.getHeader('CSeq')+#13#10+
              'Content-Length: 0'#13#10+
              #13#10;
 Owner.SendData;
end;

procedure TSession.SendSDPReply(const Status:string);
begin
 Owner.fSend:='SIP/2.0 '+Status+#13#10+
              'Via: '+Owner.getHeader('Via')+';received='+inet_ntoa(Owner.From.sin_addr)+#13#10+
              Header+
              'CSeq:'+Owner.getHeader('CSeq')+#13#10+
              Owner.fContact+
              'Content-Type: application/sdp'#13#10+
              'Content-Length: '+IntToStr(Length(Owner.fLocalSDP))+#13#10+
              #13#10+
              Owner.fLocalSDP;
 Owner.SendData;
end;


procedure TSession.ExecRequest(const Request:string);
begin
 inc(Sequence);
 Owner.fSend:=Request+' '+URI+' SIP/2.0'#13#10+
              Owner.fVia+CreateID+#13#10+
              'From: '+Target+
              'To: '+From+
              'Call-ID: '+CallID+#13#10+
              'CSeq: '+IntToStr(Sequence)+' '+Request+#13#10+
              'Max-Forwards: 70'#13#10+
              'Expires: 1800'+#13#10+
              'User-Agent: '+SIP_RELEASE+#13#10+
              'Content-Length: 0'#13#10+
              #13#10;
 Owner.SendData;
end;

procedure TSession.RecvRequest;
begin
 // BYE from the remote client ?
 if copy(Owner.fHead,1,4)='BYE ' then begin
  SendReply('200 OK');
  if Owner.fStep=csONLINE then begin
   Owner.Step:=csRECVBYE;
   Owner.Stop;
   Release;
  end;
 end else
 if copy(Owner.fHead,1,7)='CANCEL ' then begin
  SendReply('200 OK');
  if Owner.fStep=csRECVINVITE then begin
   Owner.fCallType:=ctMISSED;
   Owner.Step:=csRECVCANCEL;
   Owner.Stop;
   Release;
  end;
 end;
end;

procedure TSession.RecvStatus;
begin
// handle BYE 200 reply
 if Owner.GetStatus=200 then begin
  if Owner.Step=csSENDBYE then begin
   Owner.Stop;
   Owner.Step:=csREGISTERED;
   Release;
  end;
 end;
end;

//----------------------------------------------------------------------------//
procedure TSessionList.Clear;
var
 i:integer;
begin
 for i:=0 to Count-1 do TObject(List[i]).Free;
 inherited;
end;

function TSessionList.FindSession(const ID:string; var Session:TSession):boolean;
var
 i:integer;
begin
 Result:=False;
 for i:=0 to Count-1 do begin
  Session:=List[i];
  if Session.CallID=ID then begin
   Result:=True;
   exit;
  end;
 end;
 Session:=nil; 
end;

//----------------------------------------------------------------------------//

constructor TCustomSIPClient.Create(AHandle:HWnd; AMsg:integer; ASIP_Local_Port,ASIP_Remote_Port: Integer);
begin
 inherited Create;
 fHwnd  :=AHandle;
 fMsg   :=AMsg;
 fSessions:=TSessionList.Create;
 fSessionID:=getTickCount;
 fSIP_LOCAL_PORT:= ASIP_Local_Port;
 fSIP_REMOTE_PORT:= ASIP_Remote_Port;
end;

destructor TCustomSIPClient.Destroy;
begin
 fSessions.Free;
 inherited;
end;

procedure TCustomSIPClient.SetLocal(const Addr:string; Port:word);
begin
 fLocalSDP:='v=0'#13#10+
            'o=SIPInside '+IntToStr(fSessionID)+' '+IntToStr(getTickCount)+' IN IP4 '+Addr+#13#10+
            's=SIP Call'#13#10+
            'c=IN IP4 '+Addr+#13#10+
            't=0 0'#13#10+
            'm=audio '+IntToStr(Port)+' RTP/AVP 8'#13#10+
            'b=AS:64'#13#10+
            'a=rtpmap:8 PCMA/8000/1'#13#10+
            'a=ptime:30'#13#10;
end;

procedure TCustomSIPClient.Login(const AUsername, ADomain, AUserID, APassword:string);
var
 ad:integer;
 id:cardinal;
begin
 Close;
// Parms
 fName  :=AUsername;
 fDomain:=ADomain;
 fUserID:=AUserID;
 fPasswd:=APassword;
// call ID
 fCallID:=CreateID+'@'+fDomain;
// Socket
 fHead:='';
 fData:='';
// find host address
 ad:=INetAddr(fDomain);
 if ad=INADDR_NONE then begin
  Cancel;
  FatalError(SIP_HOST_NOT_FOUND);
 end;
 fReceived:=inet_ntoa(in_addr(ad));
 // open a socket
 OpenSocket;
 BindSocket(fSIP_LOCAL_PORT);
 IsMultiThread:=True;
 fActive:=True;
 fThread:=CreateThread(nil,0,@StartMe,pointer(Self),0,id);
 // call server
 FillChar(fRemote,SizeOf(fRemote),0);
 fRemote.sin_family:=AF_INET;
 fRemote.sin_port:=htons(fSIP_REMOTE_PORT);
 fRemote.sin_addr.S_addr:=ad;
// Setup request header
 fExpires:='1800';
 fVia    :='Via: SIP/2.0/UDP '+fDomain+';rport='+IntToStr(fSIP_LOCAL_PORT)+';branch=z9hG4bK';
 fFrom   :='From: '+fName+' <sip:'+fUserID+'@'+fDomain+'>;tag='+IntToStr(GetTickCount)+#13#10;
 fContact:='Contact: '+fName+' <sip:'+fUserID+'@'+fDomain+'>'#13#10;
 fRegistered:=False;
 fTagged:='';
 fStep:=csNONE;
 fMode:=smLOGIN;
 Step:=csREGISTER;
 fURI:='sip:'+fDomain;
 fTarget:=fName+' <sip:'+fUserID+'@'+fDomain+'>';
 ExecRequest('REGISTER',fName+' <sip:'+fUserID+'@'+fDomain+'>','','');
end;

procedure TCustomSIPClient.Logout;
begin
 if fRegistered=False then exit;
 fExpires:='0';
 Step:=csREGISTER;
 fURI:='sip:'+fDomain;
 fTarget:=fName+' <sip:'+fUserID+'@'+fDomain+'>';
 fMode:=smLOGOUT;
 ExecRequest('REGISTER',fName+' <sip:'+fUserID+'@'+fDomain+'>','','');
end;

procedure TCustomSIPClient.Dial(const APhoneNumber:string);
begin
 if not (Step in [csREGISTERED,csCANCELED,csRECVBYE]) then exit;
 fPhone :=APhoneNumber;
 if pos('@',fPhone)=0 then
  fURI   :='sip:'+fPhone+'@'+fDomain
 else begin
  if (copy(fPhone,1,4)<>'sip:') then fURI:='sip:'+fPhone else fURI:=fPhone;
 end;
// fTarget:=AName+' <'+fURI+'>'; todo: AName charset encoding
 fFrom   :='From: '+fName+' <sip:'+fUserID+'@'+fDomain+'>;tag='+IntToStr(GetTickCount)+#13#10;  // patch#2
 fTarget:='<'+fURI+'>';
 fTagged:='';
 Step:=csINVITE;
 fMode:=smCALL;
 fRemoteSDP:='';
 fCallType:=ctOUT;
 ExecRequest('INVITE',fTarget,'Content-Type: application/sdp'#13#10,fLocalSDP);
end;

procedure TCustomSIPClient.AnswerCall;
begin
 if not (Step in [csRECVINVITE]) then exit;
 if (fSession=nil) then exit;
 Step:=csCALLACCEPTED;
 fSession.SendSDPReply('200 OK');
// fLocalTag:=IntToStr(getTickCount);
// SendSDPReply('200 OK');
 fMode:=smRECV;
 Step:=csONLINE;
end;

procedure TCustomSIPClient.RefuseCall;
begin
 if not (Step in [csRECVINVITE]) then exit;
 if (fSession=nil) then exit;
// fLocalTag:=IntToStr(getTickCount);
 Step:=csCALLREFUSED;
// SendSDPReply('486 Busy here');
 fSession.SendReply('486 Busy here');
 Cancel;
end;


procedure TCustomSIPClient.Cancel;
begin
 case fStep of
  csUNAVAILABLE : begin
   Step:=csREGISTERED;
  end;
  csNONE, csREGISTER, csINVITE : begin
   Step:=csCANCELED;
   Stop;
  end;
  csAUTH, csTRYING, csRINGING : begin
   Step:=csCANCEL;
  // use SendRequest to keep the same Request number
   SendRequest('CANCEL',fTarget,'','');
  end;
  csONLINE : begin
   Step:=csSENDBYE;
   if (fMode=smRECV) then begin
    if (fSession<>nil) then fSession.ExecRequest('BYE');
   end else begin
    ExecRequest('BYE',fTagged,'','');
   end;
  end;
  csREGISTERED : Logout;
  csCALLREFUSED,csRECVCANCEL : begin
   Step:=csREGISTERED;
  end;
  else Stop;
 end;
end;

procedure TCustomSIPClient.Close;
begin
 if fRegistered then Logout;
 fActive:=False;
 WaitOrKill(fThread,10);
 inherited;
end;

procedure TCustomSIPClient.ThreadProc;
var
 head,i,len:integer;
begin
 try
  while fActive do begin
   fData:=Read;
   // Cirpack KeepAlive Packet ?!
   if copy(fData,1,24)='Cirpack KeepAlive Packet' then continue;
   // get Header first
   head:=pos(#13#10#13#10,fData);
   if head=0 then continue; // no header
   fHead:=copy(fData,1,head+1);
   i:=pos('Content-Length: ',fHead);
   if i=0 then continue;//FatalError(SIP_INVALID_RESPONSE);
   len:=IntegerAt(i+16);
   // now content
   if Length(fData)<head+len then continue; // need more data
   fData:=copy(fData,head+4,len);
   SendMessage(fHWnd,fMsg,SIP_RECVDATA,0);
  end;
 finally
  CloseHandle(fThread);
  fThread:=0;
 end;
end;

procedure TCustomSIPClient.ProcessMessage(var Msg);
begin
 with TMessage(Msg) do begin
  case wParam of
   SIP_RECVDATA : RecvData;
  end;
 end;
end;

procedure TCustomSIPClient.WriteData;
var
 e,len:integer;
begin
 len:=Length(fSend);
 while len>0 do begin
  e:=sendto(fSocket,fSend[1],len,0,fRemote,SizeOf(fRemote));
  if e=0 then FatalError(SIP_SEND_ERROR);
  if e<0 then begin
   e:=WSAGetLastError;
   if e=WSAEWOULDBLOCK then break;
   FatalError(e);
  end;
  if e=len then begin
   len:=0;
   fSend:='';
  end;
 end;
end;

procedure TCustomSIPClient.RecvData;
var
 id :string;
 sip:boolean;
begin
 sip:=copy(fHead,1,8)='SIP/2.0 ';
 id:=GetHeader('Call-ID');
 if fSessions.FindSession(id,fSession) then begin
  if sip then fSession.RecvStatus else fSession.RecvRequest;
 end else begin
  if sip then begin
   if id=fCallID then RecvStatus else SendReply('481 Call/Transaction Does Not Exist');
  end else begin
   if id=fCallID then begin
   // fix -- receive INVITE ?!
    if copy(fHead,1,7)='INVITE ' then
     SendSDPReply('200 OK')
    else
    if copy(fHead,1,4)='BYE ' then begin
     SendReply('200 OK');
     if fStep=csONLINE then begin
      Step:=csRECVBYE;
      Stop;
     end;
    end;
   end else
    RecvRequest;
  end;
 end;
end;

procedure TCustomSIPClient.RecvRequest;
begin
// nouvelle connexion
 if copy(fHead,1,7)='INVITE ' then begin
  if (fAccept)and(Step in [csREGISTERED,csCANCELED,csRECVBYE,csRECVCANCEL]) then begin
   fSession:=TSession.Create(Self);
  end else begin
//   SendReply('486 Busy here'); #patch1
  end;
  exit;
 end;
 SendReply('481 Call/Transaction Does Not Exist');
end;

procedure TCustomSIPClient.RecvStatus;
begin
 fTagged:=getHeader('To');
 if fTagged='' then fTagged:=fTarget;
 case GetStatus of
 // 100 Trying
  100: if fStep in [csREGISTER, csINVITE, csAUTH] then begin
        Step:=csTRYING;
        if fData<>'' then Start; // received remote SDP, start listen
       end;
 // 180 Ringing
  180: if fStep in [csINVITE, csAUTH, csTRYING] then begin
        Step:=csRINGING;
        if (fRemoteSDP='')and(fData<>'') then Start;
       end;
  181..189: if (fRemoteSDP='')and(fData<>'') then Start;
 // 200 OK
  200: case fStep of
        csREGISTER,
        csINVITE,
        csAUTH,
        csTRYING,
        csRINGING : begin
         case fMode of
          smLOGIN: begin
           Step:=csREGISTERED;
           Open;
          end;
          smCALL: begin
           if fRemoteSDP='' then Start; // place this line before the change in Step
           Step:=csONLINE;              // for PCMA.Listen bp sequence () and PCMA.OpenIn;
           SendRequest('ACK',fTagged,'','');
          end;
          smLOGOUT: begin
           fRegistered:=False;
           Step:=csNONE;
           Close;
          end;
         end;
        end;
        csSENDBYE: begin
         Stop;
         Step:=csREGISTERED;
        end;
       end;
 // 403 Wrong login or password
 // 403 Too many simultaneous sessions
 // 406 Too many open session
  403,
  406: begin
        fErrMsg:=copy(fHead,9,pos(#13,fHead)-9);
        SendRequest('ACK',fTagged,'',''); // WRONG
        if fMode=smLOGIN then begin
         Step:=csWRONG;
         Stop;
        end else begin
         Step:=csUNAVAILABLE;
       //  fStep:=csSENDBYE;
       //  ExecRequest('BYE',fTagged,'','');
       //  Cancel;
        end;
       end;
 // 404 Contact not found in database (25 mars 2007)
  404: if fMode=smLOGOUT then begin
        fRegistered:=False;
        Step:=csNONE;
        Close;
       end;
 // 401 WWW-Authenticate
 // 407 Proxy-Authenticate
  401,
  407: if fStep in [csREGISTER,csINVITE,csTRYING] then begin // Added csTRYING (2 avril 2007)
        Step:=csAUTH;
        SendAuthorization;
       end;
 // 480 Temporarily Unavailable
 // 486 Busy
  480,
  486: begin
        Step:=csUNAVAILABLE;
        SendRequest('ACK',fTagged,'','');
       end;
 // 487 Canceled
 // 487 Request terminated
  487: if fStep in [csCANCEL,csTRYING] then begin
        Step:=csCANCELED;
        SendRequest('ACK',fTagged,'',''); // CANCELED
        Stop;//Close;
       end;
 // 500 Internal Error
  500: begin
        fErrMsg:=copy(fHead,9,pos(#13,fHead)-9);
        Step:=csERROR;
        SendRequest('ACK',fTagged,'',''); // ERROR
        Stop;
       end;
 end;
end;

procedure TCustomSIPClient.Open;
begin
 fRegistered:=True;
end;

procedure TCustomSIPClient.Start;
begin
// fData = remote SDP
 if (Step<>csCALLACCEPTED) then fRemoteSDP:=fData;
end;

procedure TCustomSIPClient.Stop;
begin
// if fRegistered then Step:=csREGISTERED else Step:=csNONE;
end;

procedure TCustomSIPClient.SendData;
begin
 if fSocket=INVALID_SOCKET then FatalError(SIP_NOT_CONNECTED);
 WriteData;
end;

function TCustomSIPClient.IntegerAt(Offset:integer):integer;
var
 num:char;
begin
 Result:=0;
 while (Offset<=Length(fHead)) do begin
  num:=fHead[Offset];
  if num in ['0'..'9'] then
   Result:=10*Result+ord(num)-ord('0')
  else
   exit;
  inc(Offset);
 end;
end;

function TCustomSIPClient.getHeader(const Tag:string):string;
var
 i,j:integer;
begin
 Result:='';
 i:=pos(#13#10+Tag+':',fHead);
 if i=0 then exit;
 inc(i,2+Length(Tag)+1);
 while (i<=Length(fHead))and(fHead[i]=' ') do inc(i);
 j:=i;
 while (j<=Length(fHead))and(fHead[j]<>#13) do inc(j);
 Result:=copy(fHead,i,j-i);
end;

procedure TCustomSIPClient.SendRequest(const Request,Target,Headers,Content:string);
begin
 fRequest:=Request;
 fSend:=Request+' '+fURI+' SIP/2.0'#13#10+
        fVia+fBranch+#13#10+
        fFrom+
        'To: '+Target+#13#10+
        'Call-ID: '+fCallID+#13#10+
        'CSeq: '+IntToStr(fSequence)+' '+Request+#13#10+
        'Max-Forwards: 70'#13#10+
        Headers+
        'Content-Length: '+IntToStr(Length(Content))+#13#10+
        #13#10+
        Content;
 SendData;
end;

function TCustomSIPClient.GetStatus:integer;
begin
 if (copy(fHead,1,8)<>'SIP/2.0 ') then FatalError(SIP_INVALID_RESPONSE);
 fStatus:=IntegerAt(9);
 if (fStatus<100)or(fStatus>699)  then FatalError(SIP_INVALID_RESPONSE);
 Result:=fStatus;
end;

procedure TCustomSIPClient.SendReply(const Status:string);
begin
 fSend:='SIP/2.0 '+Status+#13#10+
        'Via: '+getHeader('Via')+';received='+fReceived+#13#10+
        'From: '+getHeader('From')+#13#10+
        'To: '+getHeader('To')+#13#10+
        'Call-ID: '+getHeader('Call-ID')+#13#10+
        'CSeq: '+getHeader('CSeq')+#13#10+
        'Content-Length: 0'#13#10+
        #13#10;
 SendData;
end;

procedure TCustomSIPClient.SendSDPReply(const Status:string);
begin
 fSend:='SIP/2.0 '+Status+#13#10+
        'Via:'+getHeader('Via')+';received='+fReceived+#13#10+
        'From:'+getHeader('From')+#13#10+
        'To:'+getHeader('To'){+';tag='+fLocalTag}+#13#10+ // fix INVITE callback ?!
        'Call-ID:'+getHeader('Call-ID')+#13#10+
        'CSeq:'+getHeader('CSeq')+#13#10+
        fContact+
        'Content-Type: application/sdp'#13#10+
        'Content-Length: '+IntToStr(Length(fLocalSDP))+#13#10+
        #13#10+
        fLocalSDP;
 SendData;
end;

procedure TCustomSIPClient.ExecRequest(const Request,Target,Headers,Content:string);
begin
 fBranch:=CreateID;
 inc(fSequence);
 SendRequest(
  Request,Target,
  fContact+
 'Expires: '+fExpires+#13#10+
 'User-Agent: '+SIP_RELEASE+#13#10+
  Headers,
  Content
 );
end;

procedure TCustomSIPClient.SendAuthorization;
var
 reqs:string;
 auth:string;
begin
 reqs:=fRequest;
 auth:=GetAuthorization(fRequest,fURI);
 if reqs='INVITE' then begin
  SendRequest('ACK',fTagged,'','');
  ExecRequest(reqs,fTarget,auth+'Content-Type: application/sdp'#13#10,fLocalSDP)
 end else begin
  ExecRequest(reqs,fTarget,auth,'');
 end;
end;

function TCustomSIPClient.Crunch(const UserID, Realm, Password:string):string;
begin
 if (Length(Password)=2+32)and(Password[1]='{')and(Password[34]='}') then
  Result:=copy(Password,2,32)
 else
  Result:=MD5Print(MD5String(UserID+':'+Realm+':'+Password));
end;

function TCustomSIPClient.GetAuthorization(const Method,URI:string):string; // RFC 2617
var
 auth  :string;
 algo  :string;
 realm :string;
 nonce :string;
 opaque:string;
 A1,A2 :string;
 resp  :string;
begin
 Result:='';
 if fStatus=407 then begin
  auth:=getHeader('Proxy-Authenticate');
  if auth='' then FatalError(SIP_UNAUTHORIZED);
  Result:='Proxy-';
 end else begin
  auth:=getHeader('WWW-Authenticate');
  if auth='' then FatalError(SIP_UNAUTHORIZED);
 end;

 algo:=getValue('algorithm',auth);
// MD5 is the default algorithm, and now SIPInside work with most popular
// SIP provider in Germany sip.1und1.de :D
 if (algo<>'')and(algo<>'MD5') then FatalError(SIP_UNAUTHORIZED);

 realm :=getValue('realm' ,auth);
 nonce :=getValue('nonce' ,auth);
 opaque:=getValue('opaque',auth);

 A1:=Crunch(fUserID,realm,fPasswd);
 A2:=MD5Print(MD5String(Method+':'+URI));
 resp:=MD5Print(MD5String(A1+':'+nonce+':'+A2));

 Result:=Result+'Authorization: Digest username="'+fUserID+'",realm="'+realm+'",nonce="'+nonce+'",response="'+resp+'",uri="'+URI+'",algorithm=MD5,opaque="'+opaque+'"'#13#10;
end;

procedure TCustomSIPClient.SetStep(Value:TSIPStep);
begin
 fStep:=Value;
end;

//----------------------------------------------------------------------------//
procedure TSIPClient.RecvData;
begin
 if Assigned(EOnRecv) then EOnRecv(Self);
 inherited;
end;

procedure TSIPClient.SendData;
begin
 if Assigned(EOnSend) then EOnSend(Self);
 inherited;
end;

procedure TSIPClient.Open;
begin
 inherited;
 if Assigned(EOnOpen) then EOnOpen(Self);
end;

procedure TSIPClient.Start;
begin
 inherited;
 if Assigned(EOnStart) then EOnStart(Self);
end;

procedure TSIPClient.Stop;
begin
 inherited;
 if Assigned(EOnStop) then EOnStop(Self);
end;

procedure TSIPClient.SetStep(Value:TSIPStep);
begin
 inherited;
 if Assigned(EOnStep) then EOnStep(Self)
end;

procedure TSIPClient.Close;
begin
 if (fSocket<>INVALID_SOCKET) and Assigned(EOnClose) then EOnClose(Self);
 inherited;
end;

//----------------------------------------------------------------------------//

end.

