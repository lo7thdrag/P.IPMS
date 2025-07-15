unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ImgList, VrControls, VrMatrix, Menus, Math, MMSystem,
  ShellAPI, IniFiles,

  uLoadGroupFromXML, uProgressBar, uSocketHandle, uDataVoipRecord, StdCtrls,
  System.ImageList;

type
  TfrmMain = class(TForm)
    imgBackGround: TImage;
    imgBell: TImage;
    imgBright: TImage;
    imgLight: TImage;
    imgSound: TImage;
    imgMin: TImage;
    imgPlus: TImage;
    imgBlank4: TImage;
    imgInt: TImage;
    imgBlank3: TImage;
    imgBlank2: TImage;
    imgBlank1: TImage;
    imgCal: TImage;
    imgArrow: TImage;
    imgPlain: TImage;
    imgChiper: TImage;
    imgBtn3: TImage;
    imgBtn2: TImage;
    imgBtn5: TImage;
    imgBtn6: TImage;
    imgBtn9: TImage;
    imgBtn8: TImage;
    imgBtn7: TImage;
    imgBtn4: TImage;
    imgBtn1: TImage;
    imgBtn0: TImage;
    imgCallPhone: TImage;
    imgDel: TImage;
    imgPgDown: TImage;
    imgPgUp: TImage;
    imgM: TImage;
    imgEnter: TImage;
    imgChangePTT: TImage;
    imgPttExt: TImage;
    imgPttIn: TImage;
    ilImageDown: TImageList;
    ilImageUp: TImageList;
    vrDisplay2: TVrMatrix;
    vrDisplay1: TVrMatrix;
    pnlConnector: TPanel;
    pnlSesVoip: TPanel;
    pnlControl: TPanel;
    pmRestart: TPopupMenu;
    RunConsole1: TMenuItem;
    RestartConnector1: TMenuItem;
    Restart1: TMenuItem;
    RestartPhoneConnector1: TMenuItem;
    ShowConector1: TMenuItem;
    HideConnector1: TMenuItem;
    N1: TMenuItem;
    Reconnect1: TMenuItem;
    Close1: TMenuItem;
    CloseApplication1: TMenuItem;
    N2: TMenuItem;
    Shutdown1: TMenuItem;
    Restart2: TMenuItem;
    N3: TMenuItem;
    Shutdown2: TMenuItem;
    pmMenu: TPopupMenu;
    ArchosHide1: TMenuItem;
    ArchosShow1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure RunConsole1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ArchosHide1Click(Sender: TObject);
  private
    { Private declarations }
    { Tray Icon }
    TrayIconData: TNotifyIconData;

    FBitMap : TBitmap;
    FisPTT_Ext : Boolean;

    GroupList : TFsGroupList;
    GroupInternal : TFsGroupList;

    FTimer : TTimer;

    strData1,
    strData2 : string40;

    isAutoCall : Boolean;

    PageInternal,
    PageExternal,
    PageTotal : Double;

    PageFocus : Double;

    //List Group
    ListInternal : TList;
    ListExternal : Tlist;

    //strfunction
    procedure ClearSect(var s: String40; sec: Integer);
    procedure FillSect(var s: String40; sec: Integer; sInp: string);
    procedure FillChar(var s: String40; sec: Integer; aMode : integer);
    procedure InitializeString(var s:String40);

    //Change Button Image
    procedure LoadFromImageListUp(AIndex: Integer; AImage: TImage; ABitmap: TBitmap);
    procedure LoadFromImageListDown(AIndex: Integer; AImage: TImage; ABitmap: TBitmap);

    //MouseUpDown
    procedure ButtonDown(Sender: TObject; Button: TMouseButton;
              Shift: TShiftState; X, Y: Integer);
    procedure ButtonUp(Sender: TObject; Button: TMouseButton;
              Shift: TShiftState; X, Y: Integer);

    procedure SetPnlStatusConnect(aVisible : Boolean);

    procedure OnTimerCall(Sender : TObject);

    procedure SetEnvironmentPage(PageID : Double);
    procedure KeypadNumber_Set(aNumber, PageID : Double);

    function SetCallInternal(ChName : string):Integer;

    //Tray Icon
    procedure SetIconTray;
    procedure TrayMessage(var Msg: TMessage); message WM_ICONTRAY;

    //Restart n Shutdown
    procedure ClosePhone;
    procedure RestartPhone;
    procedure RestartPhoneNConnector;
    procedure RestartPC;
    procedure ShutdownPC;
  public
    { Public declarations }
     isRunSimulation : boolean;

     //SocketHandler
    procedure ReceiveModeCall(Rec : TRecCallMode);
    procedure ReceiveInternalActivity(Rec : TRecInternal);
    procedure RecvICSData(rec : TICSData);

    procedure RunSimulation;

    procedure RunPhone;
    procedure StopPhone;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

{ TfrmMain }

//=====================================================================
//String Function
procedure TfrmMain.InitializeString(var s:String40);
var
  i : Integer;
begin
  s := '             |        |        |        ';
end;

procedure TfrmMain.ClearSect(var s: String40; sec: Integer);
var i: Integer;
begin
  case sec of
    1: begin
         for i:= 1 to S1W do
         begin
           s[i]:= #32;
         end;
       end;
    2: begin
         for i:= S1W+1 to S1W+S2W do
         begin
           s[i]:= #32;
         end;
       end;
    3: begin
         for i:= S1W+S2W+1 to S1W+S2W+S3W do
         begin
           s[i]:= #32;
         end;
       end;
    4: begin
         for i:= S1W+S2W+S3W+1 to S1W+S2W+S3W+S4W do
         begin
           s[i]:= #32;
         end;
       end;
  end;
end;

procedure TfrmMain.FillSect(var s: String40; sec: Integer; sInp: string);
var i, j, c: Integer;
begin
  c:= Length(sInp);
  case sec of
    1: if c>S1W then
         c:= S1W-2;
    2: if c>S2W then
         c:= S2W-2;
    3: if c>S3W then
         c:= S3W-2;
    4: if c>S4W then
         c:= S4W-2;
  end;

  case sec of
    1: begin
         j:= S1W;
         for i:= c downto 1 do
         begin
           s[j]:= AnsiChar(sInp[i]);
           j:= j-1;
         end;
       end;
    2: begin
         s[S1W+1]:= '|';
         for i:= S1W+2 to S1W+c+1 do
         begin
           s[i]:= AnsiChar(sInp[i-(S1W+1)]);
         end;
       end;
    3: begin
         s[S1W+S2W+1]:= '|';
         for i:= S1W+S2W+2 to S1W+S2W+c+1 do
         begin
           s[i]:= AnsiChar(sInp[i-(S1W+S2W+1)]);
         end;
       end;
    4: begin
         s[S1W+S2W+S3W+1]:= '|';
         for i:= S1W+S2W+S3W+2 to S1W+S2W+S3W+c+1 do
         begin
           s[i]:= AnsiChar(sInp[i-(S1W+S2W+S3W+1)]);
         end;
       end;
  end;
end;

procedure TfrmMain.FillChar(var s: String40; sec: Integer; aMode : integer);
begin
  case sec of
    1 : begin
          case aMode of
            0 : begin
                  s[1] := ' ';
                end;
            1 : begin
                  s[1] := '#';
                end;
            2 : begin
                  s[1] := 'S';
                end;
          end;
        end;
    2 : begin
          case aMode of
            0 : begin
                  s[22] := ' ';
                end;
            1 : begin
                  s[22] := '#';
                end;
            2 : begin
                  s[22] := 'S';
                end;
          end;
        end;
    3 : begin
          case aMode of
            0 : begin
                  s[31] := ' ';
                end;
            1 : begin
                  s[31] := '#';
                end;
            2 : begin
                  s[31] := 'S';
                end;
          end;
        end;
    4 : begin
          case aMode of
            0 : begin
                  s[40] := ' ';
                end;
            1 : begin
                  s[40] := '#';
                end;
            2 : begin
                  s[40] := 'S';
                end;
          end;
        end;
  end;
end;

//=====================================================================

procedure TfrmMain.ClosePhone;
var
  i : integer;
  DiffLeft,
  DiffTop : integer;
  ChMap : TChannelMap;
begin
  VoipManager.isOut := True;

  DiffLeft := (Width - frmProgress.Width) div 2;
  DiffTop  := (Height - frmProgress.Height) div 2;

  for i := 0 to ListInternal.Count - 1 do
  begin
    ChMap := TChannelMap(ListInternal.Items[i]);

    if (ChMap.aMode = 2) or (ChMap.aMode = 1) then
    begin
      VoipManager.SendHangUpTo(VoipManager.SetConfig.aStrCub,
                               VoipManager.SetConfig.aRole,
                               VoipManager.SetConfig.aRole,
                               ChMap.aChannelName);
    end;
  end;

  VoipManager.SendRoleLogOut(VoipManager.SetConfig.aStrCub,
                             VoipManager.SetConfig.aRole,
                             VoipManager.SetConfig.aRole);

  StopPhone;

  frmProgress.aMode := 6;
  frmProgress.Left := Left + DiffLeft;
  frmProgress.Top  := Top + DiffTop;
  frmProgress.Close;
  frmProgress.Show;
  frmProgress.BringToFront;
end;

procedure TfrmMain.RestartPC;
var
  i : integer;
  DiffLeft,
  DiffTop : integer;
  ChMap : TChannelMap;
begin
  VoipManager.isOut := True;

  DiffLeft := (Width - frmProgress.Width) div 2;
  DiffTop  := (Height - frmProgress.Height) div 2;

  for i := 0 to ListInternal.Count - 1 do
  begin
    ChMap := TChannelMap(ListInternal.Items[i]);

    if (ChMap.aMode = 2) or (ChMap.aMode = 1) then
    begin
      VoipManager.SendHangUpTo(VoipManager.SetConfig.aStrCub,
                               VoipManager.SetConfig.aRole,
                               VoipManager.SetConfig.aRole,
                               ChMap.aChannelName);
    end;

  end;

  VoipManager.SendRoleLogOut(VoipManager.SetConfig.aStrCub,
                             VoipManager.SetConfig.aRole,
                             VoipManager.SetConfig.aRole);

  StopPhone;

  frmProgress.aMode := 7;
  frmProgress.Left := Left + DiffLeft;
  frmProgress.Top  := Top + DiffTop;
  frmProgress.Close;
  frmProgress.Show;
  frmProgress.BringToFront;
end;

procedure TfrmMain.ShutdownPC;
var
  i : integer;
  DiffLeft,
  DiffTop : integer;
  ChMap : TChannelMap;
begin
  VoipManager.isOut := True;

  DiffLeft := (Width - frmProgress.Width) div 2;
  DiffTop  := (Height - frmProgress.Height) div 2;

  for i := 0 to ListInternal.Count - 1 do
  begin
    ChMap := TChannelMap(ListInternal.Items[i]);

    if (ChMap.aMode = 2) or (ChMap.aMode = 1) then
    begin
      VoipManager.SendHangUpTo(VoipManager.SetConfig.aStrCub,
                               VoipManager.SetConfig.aRole,
                               VoipManager.SetConfig.aRole,
                               ChMap.aChannelName);
    end;

  end;

  VoipManager.SendRoleLogOut(VoipManager.SetConfig.aStrCub,
                             VoipManager.SetConfig.aRole,
                             VoipManager.SetConfig.aRole);

  StopPhone;

  frmProgress.aMode := 8;
  frmProgress.Left := Left + DiffLeft;
  frmProgress.Top  := Top + DiffTop;
  frmProgress.Close;
  frmProgress.Show;
  frmProgress.BringToFront;
end;

procedure TfrmMain.RestartPhone;
var
  i : integer;
  DiffLeft,
  DiffTop : integer;
  ChMap : TChannelMap;
begin
  VoipManager.isOut := True;

  DiffLeft := (Width - frmProgress.Width) div 2;
  DiffTop  := (Height - frmProgress.Height) div 2;

  for i := 0 to ListInternal.Count - 1 do
  begin
    ChMap := TChannelMap(ListInternal.Items[i]);

    if (ChMap.aMode = 2) or (ChMap.aMode = 1) then
    begin
      VoipManager.SendHangUpTo(VoipManager.SetConfig.aStrCub,
                               VoipManager.SetConfig.aRole,
                               VoipManager.SetConfig.aRole,
                               ChMap.aChannelName);
    end;

  end;

  VoipManager.SendRoleLogOut(VoipManager.SetConfig.aStrCub,
                             VoipManager.SetConfig.aRole,
                             VoipManager.SetConfig.aRole);

  StopPhone;

  frmProgress.aMode := 2;
  frmProgress.Left := Left + DiffLeft;
  frmProgress.Top  := Top + DiffTop;
  frmProgress.Close;
  frmProgress.Show;
  frmProgress.BringToFront;
end;

procedure TfrmMain.RestartPhoneNConnector;
var
  i : integer;
  DiffLeft,
  DiffTop : integer;
  ChMap : TChannelMap;
begin
  VoipManager.isOut := True;

  DiffLeft := (Width - frmProgress.Width) div 2;
  DiffTop  := (Height - frmProgress.Height) div 2;

  for i := 0 to ListInternal.Count - 1 do
  begin
    ChMap := TChannelMap(ListInternal.Items[i]);

    if (ChMap.aMode = 2) or (ChMap.aMode = 1) then
    begin
      VoipManager.SendHangUpTo(VoipManager.SetConfig.aStrCub,
                               VoipManager.SetConfig.aRole,
                               VoipManager.SetConfig.aRole,
                               ChMap.aChannelName);
    end;
  end;

  VoipManager.SendRoleLogOut(VoipManager.SetConfig.aStrCub,
                             VoipManager.SetConfig.aRole,
                             VoipManager.SetConfig.aRole);

  StopPhone;

  frmProgress.aMode := 3;
  frmProgress.Left := Left + DiffLeft;
  frmProgress.Top  := Top + DiffTop;
  frmProgress.Close;
  frmProgress.Show;
  frmProgress.BringToFront;
end;

procedure TfrmMain.ArchosHide1Click(Sender: TObject);
begin
  case TComponent(sender).Tag of
    1 : Show;
    2 : Hide;
  end;
end;

procedure TfrmMain.ButtonDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  aTag : Integer;
  aTImage : TImage;
begin
  aTag    := TImage(sender).Tag;
  aTImage := TImage(sender);

  //There Some Button Not Use Mouse Down
  if(aTag = 16) or (aTag = 18) then Exit;

  LoadFromImageListDown(aTag, aTImage, FBitMap);

  case aTag of
    //Button 0-9
    0,1,2,3,4,5,6,7,8,9 :
    begin
      KeypadNumber_Set(aTag, PageFocus);
    end;
    //Button PgUp/PgDown
    //Page Up
    14 :
    begin
      PageFocus := PageFocus + 1;
      if PageFocus > PageTotal then
        PageFocus := PageTotal;

      SetEnvironmentPage(PageFocus);
    end;
    //Page Down
    13 :
    begin
      PageFocus := PageFocus - 1;
      if PageFocus < 1 then
        PageFocus := 1;

      SetEnvironmentPage(PageFocus);
    end;
    //Button ChangePTT
    17 :
    begin
      if FisPTT_Ext then
      begin
        FisPTT_Ext := False;

        LoadFromImageListDown(18, imgPttIn, FBitMap);
        LoadFromImageListUp(16, imgPttExt, FBitMap);
      end
      else
      if not FisPTT_Ext then
      begin
        FisPTT_Ext := True;

        LoadFromImageListDown(16, imgPttExt, FBitMap);
        LoadFromImageListUp(18, imgPttIn, FBitMap);
      end;
    end;
    // Call incoming indicator test
    22:
    begin
      LoadFromImageListDown(22, imgLight, FBitMap);
    end;
    //Button Set Sound, Light, Bright
    31 :
    begin
      LoadFromImageListUp(32, imgLight, FBitMap);
      LoadFromImageListUp(33, imgBright, FBitMap);
    end;
    32 :
    begin
      LoadFromImageListUp(31, imgSound, FBitMap);
      LoadFromImageListUp(33, imgBright, FBitMap);
    end;
    33 :
    begin
      LoadFromImageListUp(31, imgSound, FBitMap);
      LoadFromImageListUp(32, imgLight, FBitMap);
    end;

  end;
end;

procedure TfrmMain.ButtonUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  aTag : Integer;
  aTImage : TImage;
begin
  aTag    := TImage(sender).Tag;
  aTImage := TImage(sender);

  //There Some Button Not Use Mouse Up
  if (aTag = 31) or (aTag = 32) or (aTag = 33)
      or (aTag = 16) or (aTag = 18) then Exit;

  LoadFromImageListUp(aTag, aTImage, FBitMap);
end;

procedure TfrmMain.OnTimerCall(Sender: TObject);
var
  i : integer;
  ChMap : TChannelMap;
begin
  for i := 0 to ListInternal.Count - 1 do
  begin
    ChMap := TChannelMap(ListInternal.Items[i]);
    if not ChMap.isEnableTimer then Continue;

    ChMap.aIdTimer := ChMap.aIdTimer + 1;
    if ChMap.aIdTimer > 10 then
    begin
      ChMap.isEnableTimer := False;
      ChMap.aIdTimer := 0;

      if ChMap.aMode = 1 then
      begin
        ChMap.aMode := 0;
        ChMap.isReceive := False;
        VoipManager.SendHangUpTo(VoipManager.SetConfig.aStrCub, VoipManager.SetConfig.aRole,
                                VoipManager.SetConfig.aRole, ChMap.aChannelName);
      end;
    end;

    SetEnvironmentPage(PageFocus);
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  i : Integer;
  hMenuHandle: Integer;

begin
  SetIconTray;

  hMenuHandle := GetSystemMenu(Handle, False);
  if (hMenuHandle <> 0) then
  begin
    DeleteMenu(hMenuHandle, SC_CLOSE, MF_BYCOMMAND);
    DeleteMenu(hMenuHandle, SC_MINIMIZE, MF_BYCOMMAND);
    DeleteMenu(hMenuHandle, SC_MAXIMIZE, MF_BYCOMMAND);
  end;

  FBitmap     := TBitmap.Create;
  FisPTT_Ext  := True;

  PageInternal := 0;
  PageExternal := 0;
  PageTotal    := 0;

  isAutoCall := False;
  PageFocus := 1;

  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i].ClassType <> TImage then Continue;
    if Components[i].Tag >= 50 then Continue;

    (Components[i] as TImage).OnMouseDown := ButtonDown;
    (Components[i] as TImage).OnMouseUp   := ButtonUp;
  end;

  SetPnlStatusConnect(false);

  ListInternal  := TList.Create;
  ListExternal  := TList.Create;
  GroupList     := TFsGroupList.Create;
  GroupInternal := TFsGroupList.Create;

  isRunSimulation := False;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
var
  i : Integer;
begin
   for i:= ListInternal.Count -1 downto 0 do
   begin
     ListInternal.Delete(i);
   end;
   ListInternal.Clear;
   ListInternal.Free;

   for i:= ListExternal.Count -1 downto 0 do
   begin
     ListExternal.Delete(i);
   end;
   ListExternal.Clear;
   ListExternal.Free;

   GroupList.Free;
   GroupInternal.Free;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  if VoipManager.SetConfig.Monitor < Screen.MonitorCount then
  begin
    Top := Screen.Monitors[VoipManager.SetConfig.Monitor].Top + VoipManager.SetConfig.PhoneTop;
    Left := Screen.Monitors[VoipManager.SetConfig.Monitor].Left + VoipManager.SetConfig.PhoneLeft;
  end
  else
  begin
    Top := VoipManager.SetConfig.PhoneTop;
    Left := VoipManager.SetConfig.PhoneLeft;
  end;

  if VoipManager.SetConfig.TrayMode <> 1 then Show;
end;

procedure TfrmMain.LoadFromImageListDown(AIndex: Integer; AImage: TImage;
  ABitmap: TBitmap);
begin
  ilImageDown.GetBitmap(AIndex, ABitmap);
  AImage.Picture.Assign(ABitmap);
end;

procedure TfrmMain.LoadFromImageListUp(AIndex: Integer; AImage: TImage;
  ABitmap: TBitmap);
begin
  ilImageUp.GetBitmap(AIndex, ABitmap);
  AImage.Picture.Assign(ABitmap);
end;

procedure TfrmMain.ReceiveInternalActivity(Rec: TRecInternal);
var
  i : Integer;
  ChMap : TChannelMap;

  strSound : string;
  id : integer;
begin

  if VoipManager.SetConfig.idSkin <> 1 then Exit;
  if Rec.RoleCub <> VoipManager.SetConfig.aStrCub then Exit;

  //For Caller
  if Rec.Mode = 3 then
  begin
    if isAutoCall then
    begin
      if (Rec.CallFrom = VoipManager.SetConfig.aRole) then
      begin
        for i := 0 to ListInternal.Count - 1 do
        begin
          ChMap := TChannelMap(ListInternal.Items[i]);

          if ChMap.aChannelName = Rec.CallTo then
          begin
            id := SetCallInternal(ChMap.aChannelName);
            if id <> -1 then
            begin
              VoipManager.SetToMode_Receiver(VoipManager.SetConfig.InternalStartPort_VOIP + id);
              VoipManager.SetToMode_Transeiver(VoipManager.SetConfig.InternalStartPort_VOIP + id);
              VoipManager.SetToMode_OnPTT(VoipManager.SetConfig.InternalStartPort_VOIP + id);
            end;
          end;
        end;
      end;
    end;
  end;

  for i := 0 to ListInternal.Count - 1 do
  begin
    ChMap := TChannelMap(ListInternal.Items[i]);

    case Rec.Mode of
      //Set Login
      1 : begin
            if Rec.Login = ChMap.aChannelName then
            begin
              ChMap.isOnline := True;
              SetEnvironmentPage(PageFocus);

              Break;
            end;
          end;
      //Set Logout
      2 : begin
            if Rec.Logout = ChMap.aChannelName then
            begin
              ChMap.isOnline := False;
              SetEnvironmentPage(PageFocus);

              Break;
            end;
          end;
      //Call
      3 : begin
            if isAutoCall then
            begin
              //For Receiver
              if (Rec.CallFrom = ChMap.aChannelName)
              and (rec.CallTo = VoipManager.SetConfig.aRole) then
              begin
                ChMap.aMode := 2;
                SetEnvironmentPage(PageFocus);

                id := SetCallInternal(ChMap.aChannelName);
                if id <> -1 then
                begin
                  VoipManager.SetToMode_Receiver(VoipManager.SetConfig.InternalStartPort_VOIP + id);
                  VoipManager.SetToMode_Transeiver(VoipManager.SetConfig.InternalStartPort_VOIP + id);
                  VoipManager.SetToMode_OnPTT(VoipManager.SetConfig.InternalStartPort_VOIP + id);
                end;

                Break;
              end;
            end
            else
            begin
              if (Rec.CallFrom = ChMap.aChannelName)
              and (rec.CallTo = VoipManager.SetConfig.aRole) then
              begin
                ChMap.aMode := 1;
                ChMap.isReceive := True;
                ChMap.aIdTimer  := 0;
                ChMap.isEnableTimer := True;

                strSound := ExtractFileDir(Application.ExeName);
                strSound := strSound + '\' + 'Ring.wav';
                sndPlaySound(PChar(strSound), SND_ASYNC);

                VoipManager.PlaySound;
                SetEnvironmentPage(PageFocus);

                Break;
              end;
            end;
          end;
      //Hangup
      4 : begin
            if isAutoCall then
            begin
              if (Rec.DisConnectFrom = ChMap.aChannelName)
              and (rec.DisConnectTo = VoipManager.SetConfig.aRole) then
              begin
                ChMap.aMode := 0;
                SetEnvironmentPage(PageFocus);

                id := SetCallInternal(ChMap.aChannelName);
                if id <> -1 then
                begin
                  VoipManager.SetToMode_OffPTT(VoipManager.SetConfig.InternalStartPort_VOIP + id);
                  VoipManager.SetToMode_Off(VoipManager.SetConfig.InternalStartPort_VOIP + id);
                end;

                Break;
              end;
            end
            else
            begin
              if (Rec.DisConnectFrom = ChMap.aChannelName)
              and (rec.DisConnectTo = VoipManager.SetConfig.aRole) then
              begin
                if ChMap.aMode = 2 then
                begin
                  id := SetCallInternal(ChMap.aChannelName);
                  if id <> -1 then
                  begin
                    VoipManager.SetToMode_OffPTT(VoipManager.SetConfig.InternalStartPort_VOIP + id);
                    VoipManager.SetToMode_Off(VoipManager.SetConfig.InternalStartPort_VOIP + id);
                  end;
                end;

                ChMap.aMode := 0;
                ChMap.isReceive := False;
                ChMap.isCall    := False;
                ChMap.aIdTimer  := 0;
                ChMap.isEnableTimer := False;
                SetEnvironmentPage(PageFocus);

                Break;
              end;
            end;
          end;
      //Accept Call
      5 : begin
            if (Rec.CallFrom = ChMap.aChannelName)
            and (rec.CallTo = VoipManager.SetConfig.aRole) then
            begin
              ChMap.aMode := 2;
              ChMap.isReceive := True;
              ChMap.aIdTimer  := 0;
              ChMap.isEnableTimer := False;
              SetEnvironmentPage(PageFocus);

              id := SetCallInternal(ChMap.aChannelName);
              if id <> -1 then
              begin
                VoipManager.SetToMode_Receiver(VoipManager.SetConfig.InternalStartPort_VOIP + id);
                VoipManager.SetToMode_Transeiver(VoipManager.SetConfig.InternalStartPort_VOIP + id);
                VoipManager.SetToMode_OnPTT(VoipManager.SetConfig.InternalStartPort_VOIP + id);
              end;

              Break;
            end;
          end;
      //Cannot Call Because Because Console is Offline
      6 : begin
            if isAutoCall then
            begin
              if (Rec.DisConnectFrom = ChMap.aChannelName)
              and (rec.DisConnectTo = VoipManager.SetConfig.aRole) then
              begin
                ChMap.aMode := 0;
                SetEnvironmentPage(PageFocus);

                Break;
              end;
            end
            else
            begin
              if (Rec.DisConnectFrom = ChMap.aChannelName)
              and (rec.DisConnectTo = VoipManager.SetConfig.aRole) then
              begin
                if ChMap.aMode = 2 then
                begin
                  id := SetCallInternal(ChMap.aChannelName);
                  if id <> -1 then
                  begin
                    VoipManager.SetToMode_OffPTT(VoipManager.SetConfig.InternalStartPort_VOIP + id);
                    VoipManager.SetToMode_Off(VoipManager.SetConfig.InternalStartPort_VOIP + id);
                  end;
                end;

                ChMap.aMode := 0;
                ChMap.isReceive := False;
                ChMap.isCall    := False;
                ChMap.aIdTimer  := 0;
                ChMap.isEnableTimer := False;
                SetEnvironmentPage(PageFocus);

                Break;
              end;
            end;
          end;
    end;
  end;
end;

procedure TfrmMain.ReceiveModeCall(Rec: TRecCallMode);
begin
  if VoipManager.SetConfig.idSkin <> 1 then Exit;
  isAutoCall := Rec.IsAutoCall;
end;

procedure TfrmMain.RecvICSData(rec: TICSData);
begin
  if VoipManager.SetConfig.idSkin <> 1 then Exit;

  if rec.Mode = 10 then
  begin
    if not VoipManager.isOut and isRunSimulation then
    begin
      RestartPhone;
    end;
  end
  else
  if rec.Mode = 11 then
  begin
    if not VoipManager.isOut then
    begin
      RestartPhone;
    end;
  end
  else
  if rec.Mode = 12 then
  begin
    if not VoipManager.isOut then
    begin
      ShutdownPC;
    end;
  end
  else
  if rec.Mode = 13 then
  begin
    if not VoipManager.isOut then
    begin
      ClosePhone;
    end;
  end;
end;

procedure TfrmMain.RunConsole1Click(Sender: TObject);
var
  i, id , aTag : Integer;
  sExeRestart : string;

  DiffTop, DiffLeft : Integer;
  ChMap : TChannelMap;
begin
  aTag := (Sender as TComponent).Tag;

  DiffLeft := (Width - frmProgress.Width) div 2;
  DiffTop  := (Height - frmProgress.Height) div 2;

  case aTag of
    1 : begin
          VoipManager.RunConsole;
        end;
    2 : begin
          frmProgress.aMode := 1;
          frmProgress.Left := Left + DiffLeft;
          frmProgress.Top  := Top + DiffTop;
          frmProgress.Show;
        end;
    3 : begin
          RestartPhone;
        end;
    4 : begin
          RestartPhoneNConnector;
        end;
    5 : begin
          SetPnlStatusConnect(true);
        end;
    6 : begin
          SetPnlStatusConnect(false);
        end;
    7 : begin
          id := SetCallInternal(VoipManager.SetConfig.aRole);
          if id <> -1 then
          begin
            VoipManager.SetToMode_Off(VoipManager.SetConfig.InternalStartPort_VOIP + id);
            Sleep(100);
            VoipManager.SetToMode_Receiver(VoipManager.SetConfig.InternalStartPort_VOIP + id);
          end;
        end;
    8 : begin
          ClosePhone;
        end;
    9 : begin
          RestartPC;
        end;
    10 : begin
            ShutdownPC;
         end;
  end;
end;

procedure TfrmMain.RunPhone;
var
  i : Integer;
  ChMap : TChannelMap;

  aParamPhone, aParamJam    : string;
  SIPPort, RTPport, ICSPort : Integer;
begin
  //External Phone
  for i := 0 to ListExternal.Count - 1 do
  begin
    SIPPort := VoipManager.SetConfig.ExternalStartPort_SIP + (i*3);
    RTPport := SIPPort + 1;
    ICSPort := VoipManager.SetConfig.ExternalStartPort_VOIP + i;

    ChMap := TChannelMap(ListExternal.Items[i]);

    aParamPhone := '-id ' + IntToStr(ICSPort)
      + ' -u ' + ChMap.aUser + ' -p ' + '1234' + ' -sipport ' + IntToStr(SIPPort)
      + ' -rtpport ' + IntToStr(RTPport) + ' -ch ' + ChMap.aChannel
//      + ' -auto -nodial -silent -log -chcode '
      + ' -auto -nodial -silent -nolog -norecord -chcode '
      + ChMap.aChannelName + ' -chband ' + IntToStr(0);

    aParamJam := '';

    VoipManager.RunPhone(1, aParamPhone, aParamJam);
  end;

  for i := 0 to GroupInternal.RoleList.Count - 1 do
  begin
    SIPPort := VoipManager.SetConfig.InternalStartPort_SIP + (i*3);
    RTPport := SIPPort + 1;
    ICSPort := VoipManager.SetConfig.InternalStartPort_VOIP + i;

    if GroupInternal.RoleList[i] = VoipManager.SetConfig.aRole then
    begin
      aParamPhone := '-id ' + IntToStr(ICSPort)
      + ' -u ' + IntToStr(1001 + i) + ' -p ' + '1234' + ' -sipport ' + IntToStr(SIPPort)
      + ' -rtpport ' + IntToStr(RTPport)
      + ' -ch ' + IntToStr(VoipManager.SetConfig.aRoomInternal + VoipManager.SetConfig.aCub * 10 + i)
      + ' -auto -dial -silent -log -chcode '
      + GroupInternal.RoleList[i] + ' -chband ' + IntToStr(0);

      aParamJam := '';

      VoipManager.RunPhone(2, aParamPhone, aParamJam);
    end
    else
    begin
      aParamPhone := '-id ' + IntToStr(ICSPort)
      + ' -u ' + IntToStr(1001 + i) + ' -p ' + '1234' + ' -sipport ' + IntToStr(SIPPort)
      + ' -rtpport ' + IntToStr(RTPport)
      + ' -ch ' + IntToStr(VoipManager.SetConfig.aRoomInternal + VoipManager.SetConfig.aCub * 10 + i)
      + ' -auto -nodial -silent -log -chcode '
      + GroupInternal.RoleList[i] + ' -chband ' + IntToStr(0);

      aParamJam := '';

      VoipManager.RunPhone(5, aParamPhone, aParamJam);
    end;
  end;
end;

procedure TfrmMain.StopPhone;
var
  i : Integer;
begin
  //Exit External Phone
  for i := 0 to ListExternal.Count - 1 do
  begin
    VoipManager.SetToMode_ExitPhone(VoipManager.SetConfig.ExternalStartPort_VOIP + i);
  end;

  //Exit Internal Phone
  for i := 0 to GroupInternal.RoleList.Count - 1 do
  begin
    VoipManager.SetToMode_ExitPhone(VoipManager.SetConfig.InternalStartPort_VOIP + i);
  end;
end;

procedure TfrmMain.TrayMessage(var Msg: TMessage);
var
  P : Tpoint;
begin
  case Msg.lParam of
    WM_RBUTTONDOWN:
    begin
      SetForegroundWindow(Handle);
      GetCursorPos(p);
      pmMenu.Popup(p.x, p.y);
      PostMessage(Handle, WM_NULL, 0, 0);
    end;
  end;
end;

procedure TfrmMain.RunSimulation;
var
  i : Integer;
  strXML : string;

  aChannelMap : TChannelMap;

  aTotInternal,
  aTotExternal : Double;

  aPgID,
  aColSection,
  aRowSection : Double;
begin
  if VoipManager.SetConfig.idSkin <> 1 then Exit;

  isRunSimulation := True;
  strXML := ExtractFileDir(Application.ExeName);
  strXML := strXML+ '\' + 'GroupChannel.xml';

  GroupList.LoadFromFile(strXML);
  GroupInternal.LoadFromFile(strXML);

  for i := 0 to GroupList.RoleList.Count - 1 do
  begin
    if GroupList.RoleList[i] = VoipManager.SetConfig.aRole then
    begin
      GroupList.RoleList.Delete(i);
      Break;
    end;
  end;

  for i := 0 to GroupList.RoleList.Count - 1 do
  begin
    aChannelMap := TChannelMap.Create;
    aChannelMap.aUser         := IntToStr(1001 + i);
    aChannelMap.aChannel      := IntToStr(VoipManager.SetConfig.aRoomInternal +
                                          VoipManager.SetConfig.aCub * 10 + i);
    aChannelMap.aChannelName  := GroupList.RoleList[i];
    aChannelMap.aPass         := '1234';

    aChannelMap.aMode     := 0;
    aChannelMap.aIdTimer  := 0;

    aChannelMap.isEnableTimer   := False;
    aChannelMap.isCall          := False;
    aChannelMap.isReceive       := False;

    aChannelMap.isOnline        := False;

    //Page ID
    aPgID                   := (i+1)/6;
    aChannelMap.aPageID     := Ceil(aPgID);

    //Row (Add to VrMatrix1 or VrMatrix2)
    aRowSection             := (i+1 - ((aChannelMap.aPageID-1)*6))/3;
    aChannelMap.aRowSection := Ceil(aRowSection);

    //Column (add to Section)
    aColSection := i+1 - ((aChannelMap.aRowSection-1)*3) - ((aChannelMap.aPageID - 1)*6);
    aChannelMap.aColSection := Ceil(aColSection);

    ListInternal.Add(aChannelMap);
  end;

  //Calculate PageInternal in Phone
  aTotInternal := ListInternal.Count;
  PageInternal := aTotInternal / 6;
  PageInternal := Ceil(PageInternal);

  for i := 0 to GroupList.ExternalList.Count - 1 do
  begin
    aChannelMap := TChannelMap.Create;
    aChannelMap.aUser         := IntToStr(1001 + i);
    aChannelMap.aChannel      := IntToStr(VoipManager.SetConfig.aRoomExternal + i);
    aChannelMap.aChannelName  := GroupList.ExternalList[i];
    aChannelMap.aPass         := '1234';

    aChannelMap.aMode     := 0;
    aChannelMap.aIdTimer  := 0;

    aChannelMap.isEnableTimer := False;
    aChannelMap.isCall        := False;
    aChannelMap.isReceive     := False;

    aChannelMap.isOnline      := False;

    //Page ID
    aPgID := (i+1)/6;
    aChannelMap.aPageID := PageInternal + Ceil(aPgID);

    //Row (Add to VrMatrix1 or VrMatrix2)
    aRowSection             := (i+1 - ((aChannelMap.aPageID-1-PageInternal)*6))/3;
    aChannelMap.aRowSection := Ceil(aRowSection);

    //Column (add to Section)
    aColSection := i+1 - ((aChannelMap.aRowSection-1)*3) - ((aChannelMap.aPageID-1-PageInternal)*6);
    aChannelMap.aColSection := Ceil(aColSection);

    ListExternal.Add(aChannelMap);
  end;

  //Calculate PageInternal in Phone
  aTotExternal := ListExternal.Count;
  PageExternal := aTotExternal / 6;
  PageExternal := Ceil(PageExternal);

  PageTotal := PageInternal + PageExternal;

  FTimer := TTimer.Create(nil);
  FTimer.Enabled  := True;
  FTimer.Interval := 1000;
  FTimer.OnTimer  := OnTimerCall;

  //Run Phone
  RunPhone;

  //Set Default to Page 1
  SetEnvironmentPage(1);
end;

procedure TfrmMain.KeypadNumber_Set(aNumber, PageID: Double);
var
  i, id : integer;
  ChMap : TChannelMap;

  Section : Double;
  RecSend : TRecInternal;
begin
  //Point To Point
  for i := 0 to ListInternal.Count - 1 do
  begin
    ChMap := TChannelMap(ListInternal.Items[i]);

    Section := ChMap.aColSection + ((ChMap.aRowSection-1)*3);
    if ChMap.aPageID <> PageID then Continue;
    if Section <> aNumber then Continue;

    //Auto Call
    if isAutoCall then
    begin
      if (ChMap.aMode = 2) or (ChMap.aMode = 1) then
      begin
         //Hangup
         ChMap.aMode := 0;
         VoipManager.SendHangUpTo(VoipManager.SetConfig.aStrCub, VoipManager.SetConfig.aRole,
                                  VoipManager.SetConfig.aRole, ChMap.aChannelName);

         id := SetCallInternal(ChMap.aChannelName);
         if id <> -1 then
         begin
           VoipManager.SetToMode_OffPTT(VoipManager.SetConfig.InternalStartPort_VOIP + id);
           VoipManager.SetToMode_Off(VoipManager.SetConfig.InternalStartPort_VOIP + id);
         end;
      end
      else
      if ChMap.aMode = 0 then
      begin
         //Call
         ChMap.aMode := 2;
         VoipManager.SendCallTo(VoipManager.SetConfig.aStrCub, VoipManager.SetConfig.aRole,
                                VoipManager.SetConfig.aRole, ChMap.aChannelName);
      end;
    end
    //Manual Call
    else
    begin
      //Calling
      if ChMap.aMode = 0 then
      begin
        ChMap.aMode := 1;
        ChMap.isCall := True;

        VoipManager.SendCallTo(VoipManager.SetConfig.aStrCub, VoipManager.SetConfig.aRole,
                                VoipManager.SetConfig.aRole, ChMap.aChannelName);
      end
      //HangUp From Caller
      else
      if (ChMap.aMode = 1) and ChMap.isCall and not ChMap.isReceive then
      begin
        ChMap.aMode := 0;
        ChMap.isCall := False;
        ChMap.aIdTimer := 0;
        ChMap.isEnableTimer := False;

        VoipManager.SendHangUpTo(VoipManager.SetConfig.aStrCub, VoipManager.SetConfig.aRole,
                                VoipManager.SetConfig.aRole, ChMap.aChannelName);
      end
      //Accept Call
      else
      if (ChMap.aMode = 1) and ChMap.isReceive and not ChMap.isCall then
      begin
        ChMap.aMode := 2;
        ChMap.aIdTimer := 0;
        ChMap.isEnableTimer := False;

        VoipManager.SendReceiveCall(VoipManager.SetConfig.aStrCub, VoipManager.SetConfig.aRole,
                                VoipManager.SetConfig.aRole, ChMap.aChannelName);

        id := SetCallInternal(ChMap.aChannelName);
        if id <> -1 then
        begin
          VoipManager.SetToMode_Receiver(VoipManager.SetConfig.InternalStartPort_VOIP + id);
          VoipManager.SetToMode_Transeiver(VoipManager.SetConfig.InternalStartPort_VOIP + id);
          VoipManager.SetToMode_OnPTT(VoipManager.SetConfig.InternalStartPort_VOIP + id);
        end;
      end
      //HangUp From Caller or Receiver
      else
      if ChMap.aMode = 2 then
      begin
        ChMap.aMode := 0;
        ChMap.aIdTimer := 0;
        ChMap.isEnableTimer := False;
        ChMap.isReceive := False;
        ChMap.isCall := False;

        VoipManager.SendHangUpTo(VoipManager.SetConfig.aStrCub, VoipManager.SetConfig.aRole,
                                VoipManager.SetConfig.aRole, ChMap.aChannelName);

        id := SetCallInternal(ChMap.aChannelName);
        if id <> -1 then
        begin
          VoipManager.SetToMode_OffPTT(VoipManager.SetConfig.InternalStartPort_VOIP + id);
          VoipManager.SetToMode_Off(VoipManager.SetConfig.InternalStartPort_VOIP + id);
        end;
      end;
    end;

    SetEnvironmentPage(PageFocus);
  end;

  //Conference
  for i := 0 to ListExternal.Count - 1 do
  begin
    ChMap := TChannelMap(ListExternal.Items[i]);

    Section := ChMap.aColSection + ((ChMap.aRowSection-1)*3);

    if ChMap.aPageID <> PageID then Continue;
    if Section <> aNumber then Continue;

    if ChMap.aMode = 2 then
    begin
      ChMap.aMode := 0;

      VoipManager.SetToMode_OffPTT(VoipManager.SetConfig.ExternalStartPort_VOIP + i);
      VoipManager.SetToMode_Off(VoipManager.SetConfig.ExternalStartPort_VOIP + i);
    end
    else
    if ChMap.aMode = 0 then
    begin
      ChMap.aMode := 2;

      VoipManager.SetToMode_Receiver(VoipManager.SetConfig.ExternalStartPort_VOIP + i);
      VoipManager.SetToMode_Transeiver(VoipManager.SetConfig.ExternalStartPort_VOIP + i);
      VoipManager.SetToMode_OnPTT(VoipManager.SetConfig.ExternalStartPort_VOIP + i);
    end;

    SetEnvironmentPage(PageFocus);
  end;

  vrDisplay1.Text := strData1;
  vrDisplay2.Text := strData2;
end;

function TfrmMain.SetCallInternal(ChName: string): Integer;
begin
  Result := -1;
  Result := GroupInternal.RoleList.IndexOf(ChName);
end;

procedure TfrmMain.SetEnvironmentPage(PageID: Double);
var
  strPg : string;
  i: Integer;

  ChMap : TChannelMap;
begin
  //First Initialize
  InitializeString(strData1);
  InitializeString(strData2);

  if PageID > 9 then
    strPg := '01|M0/P' + FloatToStr(pageID)
  else
    strPg := '01|M0/P0' + FloatToStr(pageID);

  FillSect(strData1, 1, strPg);

  for i := 0 to ListInternal.Count - 1 do
  begin
    ChMap := TChannelMap(ListInternal.Items[i]);
    if ChMap.aPageID <> PageID then  Continue;

    if ChMap.aRowSection = 1 then
    begin
      FillSect(strData1, ChMap.aColSection+1, ChMap.aChannelName);
      FillChar(strData1, ChMap.aColSection+1, ChMap.aMode);
    end
    else
    if ChMap.aRowSection = 2 then
    begin
      FillSect(strData2, ChMap.aColSection+1, ChMap.aChannelName);
      FillChar(strData2, ChMap.aColSection+1, ChMap.aMode);
    end;
  end;

  for i := 0 to ListExternal.Count - 1 do
  begin
    ChMap := TChannelMap(ListExternal.Items[i]);

    if ChMap.aPageID <> PageID then  Continue;

    if ChMap.aRowSection = 1 then
    begin
      FillSect(strData1, ChMap.aColSection+1, ChMap.aChannelName);
      FillChar(strData1, ChMap.aColSection+1, ChMap.aMode);
    end
    else
    if ChMap.aRowSection = 2 then
    begin
      FillSect(strData2, ChMap.aColSection+1, ChMap.aChannelName);
      FillChar(strData2, ChMap.aColSection+1, ChMap.aMode);
    end;
  end;

  vrDisplay1.Text := strData1;
  vrDisplay2.Text := strData2;
end;

procedure TfrmMain.SetIconTray;
var
  hMenuHandle: Integer;
begin
  hMenuHandle := GetSystemMenu(Handle, False);
  if (hMenuHandle <> 0) then
  begin
    DeleteMenu(hMenuHandle, SC_CLOSE, MF_BYCOMMAND);
    DeleteMenu(hMenuHandle, SC_MINIMIZE, MF_BYCOMMAND);
    DeleteMenu(hMenuHandle, SC_MAXIMIZE, MF_BYCOMMAND);
  end;

  with TrayIconData do
  begin
    //cbSize := SizeOf(TrayIconData);
    Wnd := Handle;
    uID := 0;
    uFlags := NIF_MESSAGE + NIF_ICON + NIF_TIP;
    uCallbackMessage := WM_ICONTRAY;
    hIcon := Application.Icon.Handle;
    StrPCopy(szTip, Application.Title);
  end;

  Shell_NotifyIcon(NIM_ADD, @TrayIconData);
end;

procedure TfrmMain.SetPnlStatusConnect(aVisible: Boolean);
begin
  pnlConnector.Visible := aVisible;
  pnlSesVoip.Visible   := aVisible;
  pnlControl.Visible   := aVisible;
end;

end.
