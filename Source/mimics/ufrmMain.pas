unit ufrmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, TFlatButtonUnit, ComCtrls, StdCtrls, AppEvnts,
  ufrmMimicKey, StrUtils, Menus, uDatabase, uDataType, uDBSupportClasses,
  MPlayer, DateUtils, pngimage;

type

  TCIPButton = class(TPanel)
  private
    FButtonLabel : TLabel;
    FHotkeyLabel : TLabel;

    function GetButtonID: string;
    procedure SetButtonID(const aStr: string);
    procedure SetHotkeyID(const aStr: string);

    procedure ClickMe(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;

    procedure Initialize;
    property ButtonID : string read GetButtonID write SetButtonID;
    property HotkeyID : string write SetHotkeyID;
  end;

  TfrmMainDisplay = class(TForm)
    pnlAlarm: TPanel;
    pnlGroup: TPanel;
    pnlIndicator: TPanel;
    pnlCIPButton: TPanel;
    pnlCIPInfo: TPanel;
    pnlRight: TPanel;
    pnlLeft: TPanel;
    statBawah: TStatusBar;
    statAtas: TStatusBar;
    lbl1: TLabel;
    statKananAtas: TStatusBar;
    statKananBawah: TStatusBar;
    pnlMain: TPanel;
    pmContainer: TPopupMenu;
    PVCotainer: TMenuItem;
    HlpContainer: TMenuItem;
    PropContainer: TMenuItem;
    pmContainerCIP: TPopupMenu;
    PVContainerCIP: TMenuItem;
    HlpContainerCIP: TMenuItem;
    PropContainerCIP: TMenuItem;
    mpAlarm: TMediaPlayer;
    lbl2: TLabel;
    Debug1: TMenuItem;
    pnlMimic: TPanel;
    imgLogo: TImage;
    tmr1: TTimer;
    aplctnvnts1: TApplicationEvents;
    mniDebug2: TMenuItem;

    procedure FormCreate(Sender: TObject);
    procedure aplctnvntsKEyShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure DrawPanelCenter(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
    procedure DrawPanelLeft(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
    procedure PVCotainerClick(Sender: TObject);
    procedure PropContainerClick(Sender: TObject);
    procedure PVContainerCIPClick(Sender: TObject);
    procedure PropContainerCIPClick(Sender: TObject);
    procedure mpAlarmNotify(Sender: TObject);
    procedure Debug1Click(Sender: TObject);
    procedure statKananAtasMouseEnter(Sender: TObject);
    procedure statKananAtasMouseLeave(Sender: TObject);
    procedure imgLogoMouseEnter(Sender: TObject);
    procedure imgLogoMouseLeave(Sender: TObject);
    procedure imgLogoClick(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure aplctnvnts1Message(var Msg: tagMSG; var Handled: Boolean);

  private
    FAppHeight, FAppWidth : Integer;
    FIsAuthorized : Boolean;
    FSeqNumber: Integer;

//    FDTStart, FDTEnd : TDateTime;
    FServerTime : TDateTime;

    FAssistEnabledTimer : TTimer;
    FAssistEnabledCount : Integer;
    FStopHorn : Integer;
    FIsDisEnb : Integer;

    btnAlarmGroups : array of TPanel;
    btnFunctions   : array of TCIPButton;
//    pnlAllocInfo   : array of TPanel;
    pnlHintAlarm   : array of TPanel;
    lblHintAlarm   : array of TLabel;

    aplctnvntsKey : TApplicationEvents;
    FInterval : Integer;

    procedure CreateAlarmGroups;
    procedure FormInitialize;
    procedure OnAlarmGroupsClick(Sender: TObject);
    procedure OnAlarmGroupsEnter(Sender: TObject);
    procedure OnAlarmGroupsLeave(Sender: TObject);
    procedure OnCIPButtonClick(Sender: TObject);

    procedure SetCustomEvent(Sender: TObject);
    procedure LoginResult(aResult: Boolean);
    procedure SetAuthorization(aAuthorized: Boolean);
    procedure SaveCommandsCIPButton(elmData: TElementData; btnID: string);

    procedure SelectNewElementID(aElementID: string);
  protected
    FElemID : TElementData;

  public
    pnlAllocInfo   : array of TPanel;
    tmrBlinkID : integer;
    tmr : TTimer;
    silence : Boolean;


    procedure UpdateCIPInfo(aInfo: TObject; aCIP: TObject; aCtrlMode: Byte;
      aElmStatus: Byte; aEnbAlmInhibited: Byte; aValApp: Double);
    procedure UpdateCIPButton(aCIP: TObject; aMimicState: E_MimicState);
    procedure UpdateAlrmColorButton(aVal : byte; aClass: string);
    procedure AlarmBlinked(Sender: TObject);
//    procedure AlarmSound(aElmID: string; aVal: Byte);
    procedure AlarmGrupPanelColor(aRole: string; aAlmGroup:TList);
    procedure AssistEnable(Sender: TObject);
    procedure AuthorizeCIPButton(aElmnt: TElementData; aMimicState: E_MimicState);
    procedure SetServerTime(aTime : TDateTime);
    procedure ChangeStatusControlIns(aMimicID, aStatus : byte; aElementID : string);
//    procedure PlayAlarmSound;
//    procedure StopAlarmSound(isStop: Boolean);

    property Authorization : Boolean read FIsAuthorized write SetAuthorization;
    property AssistEnabledTimer : TTimer read FAssistEnabledTimer;
    property StopHorn : Integer read FStopHorn write FStopHorn;
    property IsDisEnb : Integer read FIsDisEnb write FIsDisEnb;
  end;

var
  frmMainDisplay: TfrmMainDisplay;

const
  RatioHorizontal = 5;
  RatioVertical = 4;

  isMCD = 1;   //digunakan untuk mengirim status vent
  isMCE = 2;

implementation

uses
  ufrmLogin, uMimicsSystem, uBaseComponent, uIPMS_Data,
  ufrmPointView, ufrmProperties, ufrmLogger, ufrmMimics, ufrmCAP,
  ufrmAuthorization, ufrmAlarmPresentation, ufrmListOfDisabledElement,
  ufrmConfDateTime, ufrmAlarmHistory, ufrmListOfParameterChanges,
  ufrmCommandHistory, ufrmSelectSort, ufrmEdtFilter,
  ufrmSelectFieldView, ufrmSelectElement ,uSetting,
  ufrmMachinerySpaceVentSystem, PsAPI, ufrmAlarmSummary,
  ufrmAlarmSummaryDG, ufrmAlarmSummaryDIST, ufrmAlarmSummaryPROP,
  ufrmAlarmSummaryAUX, ufrmAlarmSummaryFUEL, ufrmAlarmSummaryDMST,
  ufrmAlarmSummaryHVAC, ufrmAlarmSummaryFFDC, ufrmAlarmSummaryNAV,
  ufrmAlarmSummaryBALL, ufrmAlarmSummaryIPMS;

{$R *.dfm}

var
  LastTick: DWORD; // idle time

const
  MIN_WIDTH = 1300;

// shrink memory...
procedure TrimAppMemorySize;
var
 MainHandle : THandle;
begin
  try
    MainHandle := OpenProcess(PROCESS_ALL_ACCESS, false, GetCurrentProcessID) ;
    SetProcessWorkingSetSize(MainHandle, $FFFFFFFF, $FFFFFFFF) ;
    CloseHandle(MainHandle) ;
  except
  end;

  Application.ProcessMessages;
end;

//current memory size of the current process in bytes
function CurrentMemoryUsage: Cardinal;
var
  pmc: TProcessMemoryCounters;
begin
  pmc.cb := SizeOf(pmc);
  Result := 0;

  if GetProcessMemoryInfo(GetCurrentProcess, @pmc, SizeOf(pmc)) then
    Result := pmc.WorkingSetSize
  else
    RaiseLastOSError;
end;

{ TfrmMainDisplay }

procedure TfrmMainDisplay.AlarmBlinked(Sender: TObject);
var
  i,j : integer;
  isFound, isFound2: Boolean;
  aElementData : TElementData;
  l : TList;
begin
  tmrBlinkID := tmrBlinkID + 1;
  if tmrBlinkID > 2 then
    tmrBlinkID := 1;

  for j := Low(btnAlarmGroups) to High(btnAlarmGroups) - 1 do
  begin
    isFound := false;
    l := SysMimics.Mimic.ListElement.LockList;
    for i := 0 to l.Count - 1 do
    begin
      aElementData := TElementData(l.Items[i]);

      if aElementData.AlarmgroupAbbreviation = btnAlarmGroups[j].Caption then
      begin
        if aElementData.aAck = 'N' then
        begin
          isFound := True;
          Break;
        end;
      end;
    end;
    SysMimics.Mimic.ListElement.UnlockList;

    if isFound then
    begin
      case tmrBlinkID of
        1 :
        begin
          btnAlarmGroups[j].Color := clRed;
        end;

        2 :
        begin
          btnAlarmGroups[j].Color := clSilver;
        end;
      end;
    end
    else
    begin

      if l.Count = 0 then
      begin
        btnAlarmGroups[j].Color := clSilver;
      end
      else
      begin
        isFound2 := true;
        l := SysMimics.Mimic.ListElement.LockList;
        for i := 0 to l.Count - 1 do
        begin
          aElementData := TElementData(l.Items[i]);

          if aElementData.AlarmgroupAbbreviation = btnAlarmGroups[j].Caption  then
          begin
            btnAlarmGroups[j].Color := clRed;
            isFound2 := true;
            Break;
          end
          else
          begin
            isFound2 := false;
          end;
        end;

        if not isFound2 then
          btnAlarmGroups[j].Color := clSilver;

        SysMimics.Mimic.ListElement.UnlockList;
      end;
    end;

  end;

  isFound := False;
  l := SysMimics.Mimic.ListElement.LockList;
  for i := 0 to l.Count - 1 do
  begin
    aElementData := TElementData(l.Items[i]);

    if aElementData.aAck = 'N' then
    begin
      isFound := True;
      Break;
    end;
  end;

  if isFound then
  begin
    case tmrBlinkID of
      1 :
      begin
        btnFunctions[8].Color := clRed;
      end;

      2 :
      begin
        btnFunctions[8].Color := clSilver;
      end;
    end;
  end
  else
  begin
    if l.Count > 0 then
      btnFunctions[8].Color := clRed
    else
      btnFunctions[8].Color := clSilver;
  end;

  SysMimics.Mimic.ListElement.UnlockList;
end;

procedure TfrmMainDisplay.AlarmGrupPanelColor(aRole: string; aAlmGroup: TList);
var
  faData : TFACond_Data;
  i: Integer;
  j: Integer;
begin
  for i := 0 to aAlmGroup.Count - 1 do
  begin
    faData := TFACond_Data(aAlmGroup.Items[i]);

    case i of
      0:
      begin
        if aRole = 'IPMS' then
        begin
          for j := 0 to C_AlarmGroupCount - 1 do
          begin
            case j of
              0:
              begin
                if faData.FA_DGSETS_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
              1:
              begin
                if faData.FA_Distribution_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
              2:
              begin
                if faData.FA_Propultion_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
              3:
              begin
                if faData.FA_Auxiliary_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
              4:
              begin
                if faData.FA_Fuel_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
              5:
              begin
                if faData.FA_Domest_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
              6:
              begin
                if faData.FA_HVAC_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
              7:
              begin
                if faData.FA_FFDC_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
              8:
              begin
                if faData.FA_Navigation_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
              9:
              begin
                if faData.FA_Ballast_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
              10:
              begin
                if faData.FA_IPMS_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
              11:
              begin
                if faData.FA_IAS_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
            end;
          end;
        end;
      end;
      1:
      begin
        if aRole = 'AUX' then
        begin
          for j := 0 to C_AlarmGroupCount - 1 do
          begin
            case j of
              0:
              begin
                if faData.FA_DGSETS_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
              1:
              begin
                if faData.FA_Distribution_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
              2:
              begin
                if faData.FA_Propultion_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
              3:
              begin
                if faData.FA_Auxiliary_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
              4:
              begin
                if faData.FA_Fuel_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
              5:
              begin
                if faData.FA_Domest_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
              6:
              begin
                if faData.FA_HVAC_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
              7:
              begin
                if faData.FA_FFDC_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
              8:
              begin
                if faData.FA_Navigation_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
              9:
              begin
                if faData.FA_Ballast_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
              10:
              begin
                if faData.FA_IPMS_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
              11:
              begin
                if faData.FA_IAS_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
            end;
          end;
        end;
      end;
      2:
      begin
        if aRole = 'PCS' then
        begin
          for j := 0 to C_AlarmGroupCount - 1 do
          begin
            case j of
              0:
              begin
                if faData.FA_DGSETS_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
              1:
              begin
                if faData.FA_Distribution_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
              2:
              begin
                if faData.FA_Propultion_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
              3:
              begin
                if faData.FA_Auxiliary_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
              4:
              begin
                if faData.FA_Fuel_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
              5:
              begin
                if faData.FA_Domest_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
              6:
              begin
                if faData.FA_HVAC_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
              7:
              begin
                if faData.FA_FFDC_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
              8:
              begin
                if faData.FA_Navigation_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
              9:
              begin
                if faData.FA_Ballast_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
              10:
              begin
                if faData.FA_IPMS_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
              11:
              begin
                if faData.FA_IAS_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
            end;
          end;
        end;
      end;
      3:
      begin
        if aRole = 'E' then
        begin
          for j := 0 to C_AlarmGroupCount - 1 do
          begin
            case j of
              0:
              begin
                if faData.FA_DGSETS_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
              1:
              begin
                if faData.FA_Distribution_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
              2:
              begin
                if faData.FA_Propultion_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
              3:
              begin
                if faData.FA_Auxiliary_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
              4:
              begin
                if faData.FA_Fuel_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
              5:
              begin
                if faData.FA_Domest_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
              6:
              begin
                if faData.FA_HVAC_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
              7:
              begin
                if faData.FA_FFDC_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
              8:
              begin
                if faData.FA_Navigation_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
              9:
              begin
                if faData.FA_Ballast_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
              10:
              begin
                if faData.FA_IPMS_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
              11:
              begin
                if faData.FA_IAS_State = 0 then
                  pnlAllocInfo[j].Color := clSilver
                else
                  pnlAllocInfo[j].Color := clYellow;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
end;

//procedure TfrmMainDisplay.AlarmSound(aElmID: string; aVal: Byte);
//var
//  i: Integer;
//  l: TList;
//  aElementData : TElementData;
//begin
//  l := SysMimics.Mimic.ListElement.LockList;
//
//  if (aVal = 0) or (aVal = 4) or (aVal = 30) then
//  begin
//    for i := 0 to l.Count - 1 do
//    begin
//      aElementData := TElementData(l.Items[i]);
//
//      if (aElementData.aAck = 'N') then
//      begin
////        PlayAlarmSound;
//
//        if (FStopHorn = 1) or (FIsDisEnb = 1) then
//        begin
////          StopAlarmSound(True);
//        end;
//
//        Break;
//      end
//      else
//      begin
////        StopAlarmSound(True);
//      end;
//    end;
//  end
//  else
//  begin
//    for i := 0 to l.Count - 1 do
//    begin
//      aElementData := TElementData(l.Items[i]);
//
//      if SysMimics.Mimic.FFuncAllocSoundArray[aElementData.AlarmgroupID] then
//        if (aElementData.aAck = 'N') then
////            PlayAlarmSound;
//    end;
//  end;
//end;

procedure TfrmMainDisplay.aplctnvnts1Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
  case Msg.message of
    WM_RBUTTONDOWN,
    WM_RBUTTONDBLCLK,
    WM_LBUTTONDOWN,
    WM_LBUTTONDBLCLK,
    WM_KEYDOWN:
      LastTick := GetTickCount;
  end;

end;

procedure TfrmMainDisplay.aplctnvntsKEyShortCut(var Msg: TWMKey;
  var Handled: Boolean);
var
  i : integer;
  ipmsComp : TIPMSBaseComponent;
  mimic : TfrmMimics;
  c : TComponent;
begin
  { show logs window }
  //Home ternyata dipakai untuk membuka TOC
//  if Msg.CharCode = VK_HOME then
//  begin
//    if not Assigned(frmLogs) then
//      frmLogs := TfrmLogs.Create(Self);

//    frmLogs.Show;
//  end;

  // disable while application freezed
  if SysMimics.Mimic.Freezed then
    Exit;

  // prevent all others form of mimic to execute this events
  // set all tag window to 290 as aplicable to events
  if not (Screen.ActiveForm.Tag = 290) then
    Exit;

  if SysMimics.Mimic.ActiveMimic.MimicID = mtLogin then
    Exit;

  { Home }
  if Msg.CharCode = VK_HOME then
    SysMimics.Mimic.ShowMimic(mtTOC);

  { F1 - F12 handler }
  case Msg.CharCode of
    VK_F1:
      if btnFunctions[0].Enabled then
        btnFunctions[0].Click;
    VK_F2:
      if btnFunctions[1].Enabled then
        btnFunctions[1].Click;
    VK_F3:
      if btnFunctions[2].Enabled then
        btnFunctions[2].Click;
    VK_F4:
      if btnFunctions[3].Enabled then
        btnFunctions[3].Click;
    VK_F5:
      if btnFunctions[4].Enabled then
        btnFunctions[4].Click;
    VK_F6:
      if btnFunctions[5].Enabled then
        btnFunctions[5].Click;
    VK_F7:
      if btnFunctions[6].Enabled then
        btnFunctions[6].Click;
    VK_F8:
      if btnFunctions[7].Enabled then
        btnFunctions[7].Click;
    VK_F9:
      if btnFunctions[8].Enabled then
        btnFunctions[8].Click;
    VK_F10:
      if btnFunctions[9].Enabled then
        btnFunctions[9].Click;
    VK_F11:
      if btnFunctions[10].Enabled then
        btnFunctions[10].Click;
    VK_F12:
      if btnFunctions[11].Enabled then
        btnFunctions[11].Click;
  end;

  mimic := SysMimics.Mimic.ActiveMimic;
  if (Assigned(mimic)) and (not (mimic.MimicID = mtTOC)) then
  begin
    if GetKeyState(VK_MENU) < 0 then   // ALT+
    begin
      if (Msg.CharCode =  ord('S'))then
      begin
        for i := 0 to mimic.ComponentCount - 1 do
        begin
          c := mimic.Components[i];

          if (c is TIPMSBaseComponent) then
          begin
            ipmsComp := TIPMSBaseComponent(c);

            ipmsComp.ElementVisible := true;
          end;
        end;
      end
      else
      begin
        for i := 0 to mimic.ComponentCount - 1 do
        begin
          c := mimic.Components[i];

          if (c is TIPMSBaseComponent) then
          begin
            ipmsComp := TIPMSBaseComponent(c);

            ipmsComp.ElementVisible := false;
          end;
        end;
      end;
    end;
  end;

  { handling key for mimic open screen }
  if ((Msg.CharCode in [48..57]) or
    (Msg.CharCode in [VK_NUMPAD0..VK_NUMPAD9])) and
    (SysMimics.Mimic.ActiveMimic.MimicID <> mtAssist) then
  begin
    if Assigned(frmMimicKey) then
    begin
      if Length(frmMimicKey.edtKey.Text) < 4 then
      begin
        if Msg.CharCode in [VK_NUMPAD0..VK_NUMPAD9] then
        begin
          case Msg.CharCode of
            VK_NUMPAD0 : frmMimicKey.edtKey.Text := frmMimicKey.edtKey.Text + '0';
            VK_NUMPAD1 : frmMimicKey.edtKey.Text := frmMimicKey.edtKey.Text + '1';
            VK_NUMPAD2 : frmMimicKey.edtKey.Text := frmMimicKey.edtKey.Text + '2';
            VK_NUMPAD3 : frmMimicKey.edtKey.Text := frmMimicKey.edtKey.Text + '3';
            VK_NUMPAD4 : frmMimicKey.edtKey.Text := frmMimicKey.edtKey.Text + '4';
            VK_NUMPAD5 : frmMimicKey.edtKey.Text := frmMimicKey.edtKey.Text + '5';
            VK_NUMPAD6 : frmMimicKey.edtKey.Text := frmMimicKey.edtKey.Text + '6';
            VK_NUMPAD7 : frmMimicKey.edtKey.Text := frmMimicKey.edtKey.Text + '7';
            VK_NUMPAD8 : frmMimicKey.edtKey.Text := frmMimicKey.edtKey.Text + '8';
            VK_NUMPAD9 : frmMimicKey.edtKey.Text := frmMimicKey.edtKey.Text + '9';
          end;
        end
        else
          frmMimicKey.edtKey.Text := frmMimicKey.edtKey.Text +  Char(Msg.CharCode);
      end;

      Exit;
    end;

    frmMimicKey := TfrmMimicKey.Create(Self);

    if Msg.CharCode in [VK_NUMPAD0..VK_NUMPAD9] then
    begin
      case Msg.CharCode of
        VK_NUMPAD0 : frmMimicKey.edtKey.Text := '0';
        VK_NUMPAD1 : frmMimicKey.edtKey.Text := '1';
        VK_NUMPAD2 : frmMimicKey.edtKey.Text := '2';
        VK_NUMPAD3 : frmMimicKey.edtKey.Text := '3';
        VK_NUMPAD4 : frmMimicKey.edtKey.Text := '4';
        VK_NUMPAD5 : frmMimicKey.edtKey.Text := '5';
        VK_NUMPAD6 : frmMimicKey.edtKey.Text := '6';
        VK_NUMPAD7 : frmMimicKey.edtKey.Text := '7';
        VK_NUMPAD8 : frmMimicKey.edtKey.Text := '8';
        VK_NUMPAD9 : frmMimicKey.edtKey.Text := '9';
      end;
    end
    else
      frmMimicKey.edtKey.Text := Char(Msg.CharCode);

    frmMimicKey.ShowModal;

    if frmMimicKey.ModalResult = mrOk then
    begin
      TryStrToInt(frmMimicKey.edtKey.Text, i);
      SysMimics.Mimic.AddMimicHistory(i);
      SysMimics.Mimic.ShowMimic(E_MimicType(i));
    end;

    frmMimicKey := nil;

    Handled := True;
  end;

  { if Arrow Left key press }
  if Msg.CharCode = VK_LEFT then
    SysMimics.Mimic.ShowPrevHistory;

  { if Arrow Up key press }
  if Msg.CharCode = VK_UP then
    if SysMimics.Mimic.ActiveMimic.ClassType <> TfrmAlarmPresentation then
      SysMimics.Mimic.ShowPrevMimic;

  { if Arrow Right key press }
  if Msg.CharCode = VK_RIGHT then
    SysMimics.Mimic.ShowNextHistory;

  { if Arrow Down key press }
  if Msg.CharCode = VK_DOWN then
    if SysMimics.Mimic.ActiveMimic.ClassType <> TfrmAlarmPresentation then
      SysMimics.Mimic.ShowNextMimic;

  { if Enter key press }
  if Msg.CharCode = VK_RETURN then
  begin
    if Assigned(frmMimicKey) then
      frmMimicKey.ModalResult := mrOk;
  end;

  { if Esc key press }
  if Msg.CharCode = VK_ESCAPE then
  begin
    if Assigned(frmMimicKey) then
      frmMimicKey.ModalResult := mrCancel;
  end;

  { if Backspce key press }
  if Msg.CharCode = VK_BACK then
  begin
    if Assigned(frmMimicKey) then
    begin
      if Length(frmMimicKey.edtKey.Text) > 0 then
      begin
        frmMimicKey.edtKey.Text := MidStr(frmMimicKey.edtKey.Text, 0, Length(frmMimicKey.edtKey.Text)-1);
      end;
    end;
  end;
end;

procedure TfrmMainDisplay.AssistEnable(Sender: TObject);
begin
  Inc(FAssistEnabledCount);

  if FAssistEnabledCount = 10 then
  begin
    FAssistEnabledCount := 0;
    FAssistEnabledTimer.Enabled := False;

    btnFunctions[7].Enabled := False;
    btnFunctions[7].FButtonLabel.Font.Color := clMedGray;
  end;
end;

procedure TfrmMainDisplay.AuthorizeCIPButton(aElmnt: TElementData; aMimicState: E_MimicState);
var
  i: Integer;
begin
  if Assigned(aElmnt) then
  begin
    for i := 0 to C_AlarmGroupCount - 1 do
    begin
      if aMimicState = msMimic then
      begin
        if (btnAlarmGroups[i].Caption = aElmnt.AlarmgroupAbbreviation) and
           (pnlAllocInfo[i].Color = clYellow) then
        begin
          btnFunctions[0].Enabled := True;
          btnFunctions[0].FButtonLabel.Font.Color := clBlack;
          btnFunctions[1].Enabled := True;
          btnFunctions[1].FButtonLabel.Font.Color := clBlack;
          btnFunctions[2].Enabled := True;
          btnFunctions[2].FButtonLabel.Font.Color := clBlack;
          btnFunctions[3].Enabled := True;
          btnFunctions[3].FButtonLabel.Font.Color := clBlack;
          btnFunctions[4].Enabled := True;
          btnFunctions[4].FButtonLabel.Font.Color := clBlack;
          btnFunctions[5].Enabled := True;
          btnFunctions[5].FButtonLabel.Font.Color := clBlack;
          btnFunctions[6].Enabled := True;
          btnFunctions[6].FButtonLabel.Font.Color := clBlack;

          Break;
        end
        else
        begin
          btnFunctions[0].Enabled := False;
          btnFunctions[0].FButtonLabel.Font.Color := cl3DDkShadow;
          btnFunctions[1].Enabled := False;
          btnFunctions[1].FButtonLabel.Font.Color := cl3DDkShadow;
          btnFunctions[2].Enabled := False;
          btnFunctions[2].FButtonLabel.Font.Color := cl3DDkShadow;
          btnFunctions[3].Enabled := False;
          btnFunctions[3].FButtonLabel.Font.Color := cl3DDkShadow;
          btnFunctions[4].Enabled := False;
          btnFunctions[4].FButtonLabel.Font.Color := cl3DDkShadow;
          btnFunctions[5].Enabled := False;
          btnFunctions[5].FButtonLabel.Font.Color := cl3DDkShadow;
          btnFunctions[6].Enabled := False;
          btnFunctions[6].FButtonLabel.Font.Color := cl3DDkShadow;
        end;
      end
      else if aMimicState = msAssist then
      begin
        if (btnAlarmGroups[i].Caption = aElmnt.AlarmgroupAbbreviation) and
           (pnlAllocInfo[i].Color = clYellow)then
        begin
          btnFunctions[0].Enabled := False;
          btnFunctions[0].FButtonLabel.Font.Color := cl3DDkShadow;
          btnFunctions[1].Enabled := False;
          btnFunctions[1].FButtonLabel.Font.Color := cl3DDkShadow;
          btnFunctions[2].Enabled := False;
          btnFunctions[2].FButtonLabel.Font.Color := cl3DDkShadow;
          btnFunctions[3].Enabled := True;
          btnFunctions[3].FButtonLabel.Font.Color := clBlack;
          btnFunctions[4].Enabled := True;
          btnFunctions[4].FButtonLabel.Font.Color := clWhite;
          btnFunctions[5].Enabled := True;
          btnFunctions[5].FButtonLabel.Font.Color := clWhite;
          btnFunctions[6].Enabled := True;
          btnFunctions[6].FButtonLabel.Font.Color := clWhite;

          Break;
        end
        else
        begin
          btnFunctions[0].Enabled := False;
          btnFunctions[0].FButtonLabel.Font.Color := cl3DDkShadow;
          btnFunctions[1].Enabled := False;
          btnFunctions[1].FButtonLabel.Font.Color := cl3DDkShadow;
          btnFunctions[2].Enabled := False;
          btnFunctions[2].FButtonLabel.Font.Color := cl3DDkShadow;
          btnFunctions[3].Enabled := False;
          btnFunctions[3].FButtonLabel.Font.Color := cl3DDkShadow;
          btnFunctions[4].Enabled := False;
          btnFunctions[4].FButtonLabel.Font.Color := cl3DDkShadow;
          btnFunctions[5].Enabled := True;
          btnFunctions[5].FButtonLabel.Font.Color := clWhite;;
          btnFunctions[6].Enabled := False;
          btnFunctions[6].FButtonLabel.Font.Color := cl3DDkShadow;
        end;
      end
    end;
  end
  else
  begin
    btnFunctions[0].Enabled := True;
    btnFunctions[0].FButtonLabel.Font.Color := clBlack;
    btnFunctions[1].Enabled := True;
    btnFunctions[1].FButtonLabel.Font.Color := clBlack;
    btnFunctions[2].Enabled := True;
    btnFunctions[2].FButtonLabel.Font.Color := clBlack;
    btnFunctions[3].Enabled := True;
    btnFunctions[3].FButtonLabel.Font.Color := clBlack;
    btnFunctions[4].Enabled := True;
    btnFunctions[4].FButtonLabel.Font.Color := clBlack;
    btnFunctions[5].Enabled := True;
    btnFunctions[5].FButtonLabel.Font.Color := clBlack;
    btnFunctions[6].Enabled := True;
    btnFunctions[6].FButtonLabel.Font.Color := clBlack;
  end;   
end;

procedure TfrmMainDisplay.CreateAlarmGroups;
var
  i, w : Integer;
begin
  w := FAppWidth div C_AlarmGroupCount;

  for i := 0 to C_AlarmGroupCount - 1 do
  begin
    btnAlarmGroups[i] := TPanel.Create(Self);
    btnAlarmGroups[i].Caption := C_AlarmsGroupItem[i];
    btnAlarmGroups[i].Color := clSilver;
    btnAlarmGroups[i].Font.Name := 'Arial';
    btnAlarmGroups[i].Font.Size := 12;
    btnAlarmGroups[i].Font.Style := [fsBold];
    btnAlarmGroups[i].Height := Round(0.8 * pnlGroup.Height);
    btnAlarmGroups[i].Left := i * w;
    btnAlarmGroups[i].OnClick := OnAlarmGroupsClick;
    btnAlarmGroups[i].OnMouseEnter := OnAlarmGroupsEnter;
    btnAlarmGroups[i].OnMouseLeave := OnAlarmGroupsLeave;
    btnAlarmGroups[i].Parent := pnlGroup;
    btnAlarmGroups[i].Tag := i;
    btnAlarmGroups[i].Top := (pnlGroup.Height - btnAlarmGroups[i].Height) div 2;
    btnAlarmGroups[i].Width := w;
    btnAlarmGroups[i].BevelInner := bvRaised;
    btnAlarmGroups[i].BevelOuter := bvRaised;

    pnlAllocInfo[i] := TPanel.Create(Self);
    pnlAllocInfo[i].Color := clSilver;
    pnlAllocInfo[i].Height := Round(0.8 * pnlIndicator.Height);
    pnlAllocInfo[i].Left := i * w;
    pnlAllocInfo[i].Parent := pnlIndicator;
    pnlAllocInfo[i].Top := (pnlIndicator.Height - pnlAllocInfo[i].Height) div 2;
    pnlAllocInfo[i].Width := w;

    pnlHintAlarm[i] := TPanel.Create(Self);
    pnlHintAlarm[i].Color := rgb(255,255,210);
    pnlHintAlarm[i].Height:= 40;
    pnlHintAlarm[i].Left  := i * w;
    pnlHintAlarm[i].Parent := pnlMimic;
    pnlHintAlarm[i].Top   := 0;
    pnlHintAlarm[i].Width := w;
    pnlHintAlarm[i].Visible := False;
    pnlHintAlarm[i].Tag := i;

    lblHintAlarm[i] := TLabel.Create(Self);
    lblHintAlarm[i].Font.Name := 'Arial';
    lblHintAlarm[i].Font.Size := 8;
    lblHintAlarm[i].Font.Color := clBlack;
    lblHintAlarm[i].Color := rgb(255,255,210);
    lblHintAlarm[i].Parent := pnlHintAlarm[i];
    lblHintAlarm[i].Left := 5;
    lblHintAlarm[i].Top  := 5;
    lblHintAlarm[i].Visible := False;
  end;

  w := FAppWidth div C_FunctionCount;

  for i := 0 to C_FunctionCount - 1 do
  begin
    btnFunctions[i] := TCIPButton.Create(Self);

    btnFunctions[i].HotkeyID := 'F' + IntToStr(i+1);

    if (i < 4) or (i > 7) then
      btnFunctions[i].Color := clSilver
    else
    begin
      btnFunctions[i].Color := clDkGray;
      btnFunctions[i].FButtonLabel.Font.Color := clWhite;
    end;

    btnFunctions[i].Font.Name := 'Arial';
    btnFunctions[i].Font.Size := 12;
    btnFunctions[i].Font.Style := [fsBold];
    btnFunctions[i].Height := Round(0.8 * pnlCIPButton.Height);
    btnFunctions[i].Left := i * w;
    btnFunctions[i].Parent := pnlCIPButton;
    btnFunctions[i].Tag := i;
    btnFunctions[i].Top := (pnlCIPButton.Height - btnFunctions[i].Height) div 2;
    btnFunctions[i].Width := w;
    btnFunctions[i].OnClick := OnCIPButtonClick;
    btnFunctions[i].BevelInner := bvRaised;
    btnFunctions[i].BevelOuter := bvRaised;
    btnFunctions[i].Initialize;

    case i of
      8 : btnFunctions[i].ButtonID := 'Alarm';
      9 : btnFunctions[i].ButtonID := 'Stop horn';
    end;
  end;

end;

procedure TfrmMainDisplay.Debug1Click(Sender: TObject);
begin
  if not Assigned(frmLogs) then
    frmLogs := TfrmLogs.Create(Self);

  frmLogs.Show;

end;

procedure TfrmMainDisplay.DrawPanelCenter(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  with StatusBar.Canvas do
  begin
    Brush.Color := clSilver;
    Font.Name := 'Arial';
    Font.Size := 12;
    Font.Style := [fsBold];
    Pen.Color := clSilver;
    TextRect(Rect, Rect.Left + 12, Rect.Top + 4, Panel.Text);
  end;
end;

procedure TfrmMainDisplay.DrawPanelLeft(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  with StatusBar.Canvas do
  begin
    Brush.Color := clSilver;
    Font.Name := 'Arial';
    Font.Size := 12;
    Font.Style := [fsBold];
    Pen.Color := clSilver;
    TextRect(Rect, Rect.Left + 1, Rect.Top + 4, Panel.Text);
  end;
end;

procedure TfrmMainDisplay.FormCreate(Sender: TObject);
begin

  aplctnvntsKEy := TApplicationEvents.Create(self);
  aplctnvntsKEy.OnShortCut := aplctnvntsKEyShortCut;

  SetLength(btnAlarmGroups, C_AlarmGroupCount);
  SetLength(pnlAllocInfo, C_AlarmGroupCount);
  SetLength(btnFunctions, C_FunctionCount);
  SetLength(pnlHintAlarm, C_AlarmGroupCount);
  SetLength(lblHintAlarm, C_AlarmGroupCount);

  FormInitialize;

  CreateAlarmGroups;

  if not Assigned(frmAuthorization) then
  begin
    frmAuthorization := TfrmAuthorization.Create(Self);
    SetCustomEvent(frmAuthorization);
  end;

  if not Assigned(frmConfDateTime) then
    frmConfDateTime := TfrmConfDateTime.Create(Self);

  if not Assigned(frmSelectSort) then
    frmSelectSort := TfrmSelectSort.Create(Self);

  if not Assigned(frmEdtFilter) then
    frmEdtFilter := TfrmEdtFilter.Create(Self);

  if not Assigned(frmSelectFieldView) then
    frmSelectFieldView := TfrmSelectFieldView.Create(Self);

  if not Assigned(frmSelectElement) then
  begin
    frmSelectElement := TfrmSelectElement.Create(Self);
    SetCustomEvent(frmSelectElement);
  end;

  // aplicable to app events
  Tag := 290;

  tmrBlinkID := 1;
  tmr := TTimer.Create(self);
  tmr.Interval := 1000;
  tmr.OnTimer := AlarmBlinked;
  tmr.Enabled := true;

  FAssistEnabledTimer := TTimer.Create(self);
  FAssistEnabledTimer.Interval := 1000;
  FAssistEnabledTimer.OnTimer := AssistEnable;
  FAssistEnabledTimer.Enabled := False;

  FAssistEnabledCount := 0;

  if not FileExists(ExtractFilePath(Application.Exename) + 'IPMS_ALARM.wav') then
  begin
    raise Exception.Create('IPMS_ALARM.wav Not found');
  end
  else
    mpAlarm.FileName:= ExtractFilePath(Application.Exename) + 'IPMS_ALARM.wav';

  silence := False;
  FStopHorn := 0;

  lbl2.Top := statKananAtas.Top + 7;
  lbl2.Left := statKananAtas.Left + statKananAtas.Width + 5;
  lbl2.Caption := FormatDateTime('dd mmm yyyy', date);
  lbl2.Font.Size := 11;
  lbl2.Font.Style := [fsBold];
  lbl2.Color := rgb(255,255,210);
  lbl2.Visible := false;

  if not Assigned(frmLogs) then
    frmLogs := TfrmLogs.Create(Self);
//  frmLogs.Show;

  FInterval := 0;

  if FileExists(ExtractFilePath(Application.Exename) + 'Images\Logo\mimic_logo.png') then
    imgLogo.Picture.LoadFromFile(ExtractFilePath(Application.Exename) + 'Images\Logo\mimic_logo.png');
end;

procedure TfrmMainDisplay.FormInitialize;
var
  aspectRatio : Double;
begin
  if (Screen.MonitorCount > 1) and (Setting.MonitorMimic <= Screen.MonitorCount) then
  begin
    // use setting ini
    Height := Screen.Monitors[Setting.MonitorMimic-1].Height;
    Width := Screen.Monitors[Setting.MonitorMimic-1].Width;
    Left := Screen.Monitors[Setting.MonitorMimic-1].Left;
    Top := Screen.Monitors[Setting.MonitorMimic-1].Top;
  end
  else
  begin
    Height := Screen.Height;
    Width := Screen.Width;
    Left := 0;
    Top := 0;
  end;

  aspectRatio := RatioHorizontal / RatioVertical;

  FAppHeight := Height;
  FAppWidth := Round(aspectRatio * Height);
  if FAppWidth < MIN_WIDTH then
    FAppWidth := MIN_WIDTH;

  pnlMain.Height := FAppHeight;
  pnlMain.Width := FAppWidth;
  pnlMain.Left := Round((Width - FAppWidth) / 2);
  pnlMain.Top := 0;

  pnlAlarm.Height := Round(0.053 * FAppHeight);
  pnlAlarm.Width := FAppWidth;
  pnlGroup.Height := Round(0.8 * pnlAlarm.Height);
  pnlGroup.Width := pnlAlarm.Width;
  pnlIndicator.Height := Round(0.2 * pnlAlarm.Height);
  pnlIndicator.Width := pnlAlarm.Width;

  pnlCIPInfo.Height := Round(0.067 * FAppHeight);
  pnlCIPInfo.Width := FAppWidth;
  pnlLeft.Left := 0;
  pnlLeft.Top := 0;
  pnlLeft.Height := Round(0.8 * pnlCIPInfo.Height);
  pnlLeft.Width := 9 * (FAppWidth div C_FunctionCount);
  statAtas.Left := 0;
  statAtas.Top := 0;
  statAtas.Width := pnlLeft.Width - 2;
  statAtas.Panels[0].Width := Round(1.25 * (FAppWidth div C_FunctionCount));
  statAtas.Panels[1].Width := Round(3.75 * (FAppWidth div C_FunctionCount));
  statAtas.Panels[2].Width := Round(2.5 * (FAppWidth div C_FunctionCount));
  statAtas.Panels[3].Width := Round(1.5 * (FAppWidth div C_FunctionCount));
  statBawah.Left := 0;
  statBawah.Top := statAtas.Top + statAtas.Height;
  statBawah.Width := pnlLeft.Width - 2;
  statBawah.Panels[0].Width := 2 * (FAppWidth div C_FunctionCount);
  statBawah.Panels[1].Width := 2 * (FAppWidth div C_FunctionCount);
  statBawah.Panels[2].Width := 1 * (FAppWidth div C_FunctionCount);
  statBawah.Panels[3].Width := Round(2.5 * (FAppWidth div C_FunctionCount));
  statBawah.Panels[4].Width := Round(1.5 * (FAppWidth div C_FunctionCount));

  pnlRight.Left := pnlLeft.Width + 1;
  pnlRight.Top := 0;
  pnlRight.Height := Round(0.8 * pnlCIPInfo.Height);
  pnlRight.Width := pnlCIPInfo.Width - pnlLeft.Width;
  lbl1.Left := Round(0.25 * (FAppWidth div C_FunctionCount));
  lbl1.Top := (statKananAtas.Height - lbl1.Height) div 2;
  statKananAtas.Left := lbl1.Left + lbl1.Width + 5;
  statKananAtas.Top := 0;
  statKananAtas.Width := FAppWidth div C_FunctionCount;
  statKananBawah.Left := lbl1.Left + lbl1.Width + 5;
  statKananBawah.Top := statKananAtas.Top + statKananAtas.Height;
  statKananBawah.Width := FAppWidth div C_FunctionCount;
  imgLogo.Left := statKananAtas.Left + statKananAtas.Width + 20;
  imgLogo.Top := (pnlRight.Height - imgLogo.Height) div 2;

  pnlCIPButton.Height := Round(0.044 * FAppHeight);

  pnlMimic.Height := FAppHeight;// - (pnlAlarm.Height + pnlCIPInfo.Height + pnlCIPButton.Height);
  pnlMimic.Width := FAppWidth;

  BorderStyle := bsNone;
end;

procedure TfrmMainDisplay.imgLogoClick(Sender: TObject);
var
  i : Integer;
begin
  if not Assigned(frmMimicKey) then
    frmMimicKey := TfrmMimicKey.Create(Self);

  frmMimicKey.ShowModal;

  if frmMimicKey.ModalResult = mrOk then
  begin
    TryStrToInt(frmMimicKey.edtKey.Text, i);
    SysMimics.Mimic.AddMimicHistory(i);
    SysMimics.Mimic.ShowMimic(E_MimicType(i));
  end;

  frmMimicKey := nil;
end;

procedure TfrmMainDisplay.imgLogoMouseEnter(Sender: TObject);
begin
  imgLogo.Cursor := crUpArrow;
end;

procedure TfrmMainDisplay.imgLogoMouseLeave(Sender: TObject);
begin
  imgLogo.Cursor := crDefault;
end;

procedure TfrmMainDisplay.LoginResult(aResult: Boolean);
begin
  if aResult then
  begin
    btnFunctions[0].Enabled := True;
    btnFunctions[0].FButtonLabel.Font.Color := clBlack;
    btnFunctions[1].Enabled := True;
    btnFunctions[1].FButtonLabel.Font.Color := clBlack;
    btnFunctions[2].Enabled := True;
    btnFunctions[2].FButtonLabel.Font.Color := clBlack;
  end;
end;

procedure TfrmMainDisplay.mpAlarmNotify(Sender: TObject);
begin
  if (mpAlarm.NotifyValue = nvSuccessful) and silence then
  begin
    mpAlarm.Play;
    mpAlarm.Notify := True;
  end;
end;

procedure TfrmMainDisplay.OnAlarmGroupsClick(Sender: TObject);
begin
  with SysMimics.Mimic do
  begin
    case E_AlarmGroupType(TPanel(Sender).Tag) of
      agtDG     : ShowMimic(mtDGALRM);
      agtDISTR  : ShowMimic(mtDISTRALRM);
      agtPROP   : ShowMimic(mtPROPALRM);
      agtAUX    : ShowMimic(mtAUXALRM);
      agtFUEL   : ShowMimic(mtFUELALRM);
      agtDMST   : ShowMimic(mtDMSTALRM);
      agtHVAC   : ShowMimic(mtHVACALRM);
      agtFFDC   : ShowMimic(mtFFDCALRM);
      agtNAV    : ShowMimic(mtNAVALRM);
      agtBALL   : ShowMimic(mtBALLALRM);
      agtIPMS   : ShowMimic(mtIPMSALRM);
      agtIAS    : ShowMimic(mtIASALRM);
      agtRSV1,
      agtRSV2,
      agtRSV3,
      agtRSV4   : ShowMimic(mtReserved);
    end;

    btnFunctions[0].Enabled := False;
    btnFunctions[0].FButtonLabel.Font.Color  := cl3DDkShadow;

    UpdateCIPButton(nil, msAlarm);
    UpdateCIPInfo(nil, nil, 0, 0, 0, 0);
  end;
end;

procedure TfrmMainDisplay.OnAlarmGroupsEnter(Sender: TObject);
function GetAlarmGroup(aMimicID: Integer): E_MimicType;
begin
  // initial value
  Result := mtDGALRM;
  case aMimicID of
    0: Result := mtDGALRM;
    1: Result := mtDISTRALRM;
    2: Result := mtPROPALRM;
    3: Result := mtAUXALRM;
    4: Result := mtFUELALRM;
    5: Result := mtDMSTALRM;
    6: Result := mtHVACALRM;
    7: Result := mtFFDCALRM;
    8: Result := mtNAVALRM;
    9: Result := mtBALLALRM;
    10: Result := mtIPMSALRM;
    11: Result := mtIASALRM;
    12,
    13,
    14,
    15: Result := mtReserved;
  end;
end;
var
  i, tag: Integer;
  almStr, ackStr : string;
  aElementData : TElementData;
  aMimicID : E_MimicType;
  aListToolTip : TList;
begin
  aListToolTip := nil;
  almStr := '0';
  ackStr := '0';

  tag := TPanel(Sender).Tag;

  if not Assigned(aListToolTip) then
    aListToolTip := TList.Create;

  aMimicID := GetAlarmGroup(tag);

  if aMimicID = mtDGALRM then
  begin
    TfrmAlarmSummaryDG(SysMimics.Mimic.FormFactory(aMimicID)).SetAlarmList(SysMimics.Mimic.ListElement.LockList, aMimicID);
    SysMimics.Mimic.ListElement.UnlockList;
  end
  else if aMimicID = mtDISTRALRM then
  begin
    TfrmAlarmSummaryDIST(SysMimics.Mimic.FormFactory(aMimicID)).SetAlarmList(SysMimics.Mimic.ListElement.LockList, aMimicID);
    SysMimics.Mimic.ListElement.UnlockList;
  end
  else if aMimicID = mtPROPALRM then
  begin
    TfrmAlarmSummaryPROP(SysMimics.Mimic.FormFactory(aMimicID)).SetAlarmList(SysMimics.Mimic.ListElement.LockList, aMimicID);
    SysMimics.Mimic.ListElement.UnlockList;
  end
  else if aMimicID = mtAUXALRM then
  begin
    TfrmAlarmSummaryAUX(SysMimics.Mimic.FormFactory(aMimicID)).SetAlarmList(SysMimics.Mimic.ListElement.LockList, aMimicID);
    SysMimics.Mimic.ListElement.UnlockList;
  end
  else if aMimicID = mtFUELALRM then
  begin
    TfrmAlarmSummaryFUEL(SysMimics.Mimic.FormFactory(aMimicID)).SetAlarmList(SysMimics.Mimic.ListElement.LockList, aMimicID);
    SysMimics.Mimic.ListElement.UnlockList;
  end
  else if aMimicID = mtDMSTALRM then
  begin
    TfrmAlarmSummaryDMST(SysMimics.Mimic.FormFactory(aMimicID)).SetAlarmList(SysMimics.Mimic.ListElement.LockList, aMimicID);
    SysMimics.Mimic.ListElement.UnlockList;
  end
  else if aMimicID = mtHVACALRM then
  begin
    TfrmAlarmSummaryHVAC(SysMimics.Mimic.FormFactory(aMimicID)).SetAlarmList(SysMimics.Mimic.ListElement.LockList, aMimicID);
    SysMimics.Mimic.ListElement.UnlockList;
  end
  else if aMimicID = mtFFDCALRM then
  begin
    TfrmAlarmSummaryFFDC(SysMimics.Mimic.FormFactory(aMimicID)).SetAlarmList(SysMimics.Mimic.ListElement.LockList, aMimicID);
    SysMimics.Mimic.ListElement.UnlockList;
  end
  else if aMimicID = mtNAVALRM then
  begin
    TfrmAlarmSummaryNAV(SysMimics.Mimic.FormFactory(aMimicID)).SetAlarmList(SysMimics.Mimic.ListElement.LockList, aMimicID);
    SysMimics.Mimic.ListElement.UnlockList;
  end
  else if aMimicID = mtBALLALRM then
  begin
    TfrmAlarmSummaryBALL(SysMimics.Mimic.FormFactory(aMimicID)).SetAlarmList(SysMimics.Mimic.ListElement.LockList, aMimicID);
    SysMimics.Mimic.ListElement.UnlockList;
  end
  else if aMimicID = mtIPMSALRM then
  begin
    TfrmAlarmSummaryIPMS(SysMimics.Mimic.FormFactory(aMimicID)).SetAlarmList(SysMimics.Mimic.ListElement.LockList, aMimicID);
    SysMimics.Mimic.ListElement.UnlockList;
  end
  else if (aMimicID = mtIASALRM) or (aMimicID = mtReserved) then
  begin
    TfrmAlarmSummary(SysMimics.Mimic.FormFactory(aMimicID)).SetListAlarm(SysMimics.Mimic.ListElement.LockList, aMimicID);
    SysMimics.Mimic.ListElement.UnlockList;
  end;

  for i := 0 to SysMimics.Mimic.ListElement.LockList.Count - 1 do
  begin
    aElementData := TElementData(SysMimics.Mimic.ListElement.LockList.Items[i]);

    if aElementData.AlarmgroupAbbreviation = btnAlarmGroups[tag].Caption then
    begin
      aListToolTip.Add(aElementData);

      almStr := IntToStr(aListToolTip.Count);

      if aElementData.aAck = 'N' then
        ackStr := IntToStr(aListToolTip.Count);
    end;
  end;

  SysMimics.Mimic.ListElement.UnlockList;

  pnlHintAlarm[tag].Visible := True;
  pnlHintAlarm[tag].BringToFront;

  lblHintAlarm[tag].Visible := True;
  lblHintAlarm[tag].Caption := 'Alarms:    '+almStr+#13#10+'Unacked:  '+ackStr;
  lblHintAlarm[tag].BringToFront;

  aListToolTip.Free;
end;

procedure TfrmMainDisplay.OnAlarmGroupsLeave(Sender: TObject);
var
 tag: Integer;
begin
  tag := TPanel(Sender).Tag;

  pnlHintAlarm[tag].Visible := False;

  lblHintAlarm[tag].Visible := False;
end;

procedure TfrmMainDisplay.ChangeStatusControlIns(aMimicID, aStatus: byte; aElementID : string);
var
 aRec : R_Command_StatCtrl_Ins;
begin
  aRec.ElementID := aElementID;
  aRec.MimicID := aMimicID;
  aRec.Status := aStatus;
  SysMimics.Network.InstructorSocket.SendData(C_STATUS_CONTROL_INS_COMMAND, @aRec);
end;

procedure TfrmMainDisplay.OnCIPButtonClick(Sender: TObject);
var
  mimic : TfrmMimics;
  elemData : TElementData;
  alarmData: TAlarmData;
  capData : TCAP_Data;
  cipInfo : TCIPInfo;
  recMimic : R_Common_Mimic_Command;
  i : Integer;
  mimicState : E_MimicState;
  histList : TList;
  listElementID : TStrings;
  recVentStatus : R_Common_VentStatus_Command;
  obj : TObject;
begin
  { Add CIP Button Action Here | Group By Button }
  elemData:= nil;
  alarmData := nil;
  capData := nil;
  cipInfo := nil;

  {sementara}
  SysMimics.Database.GetMaxSeqNumber(FSeqNumber);
  FSeqNumber := FSeqNumber + 1;

  with TCIPButton(Sender) do
  begin
    if ButtonID = '' then
      Exit

    {F1 area}
    else if ButtonID = 'Disable' then
    begin
      elemData := SysMimics.Database.GetElement(SysMimics.Mimic.ElementSelected);

      {save to commands history}
      SaveCommandsCIPButton(elemData, ButtonID);

      if Assigned(elemData) then
      begin
        recMimic.CommandID := C_ORD_DISABLE;
        recMimic.ElementID := elemData.ElementID;
        recMimic.ElementName := elemData.Elementname;
        recMimic.FinalState := 'D';
        SysMimics.Network.ControllerSocket.SendData(C_MIMICS_COMMAND, @recMimic);
      end;

      FIsDisEnb := 1;
      ShowMessage('Element has been disabled');
    end
    else if ButtonID = 'Ack' then
    begin
      mimic := SysMimics.Mimic.ActiveMimic;
      if Assigned(mimic) and (mimic.ClassType = TfrmAlarmPresentation) then
      begin
        if TfrmAlarmPresentation(mimic).lvAlarmPresentation.Selected = nil then
          Exit;

        elemData := TfrmAlarmPresentation(mimic).lvAlarmPresentation.Selected.Data;

        if Assigned(elemData) then
        begin
          for i := 0 to C_AlarmGroupCount - 1 do
          begin
            if btnAlarmGroups[i].Caption = elemData.AlarmgroupAbbreviation then
            begin
              SysMimics.Database.GetAlarmByRunningIDElemnID(SysMimics.Mimic.Running_ID,
                elemData.ElementID, alarmData);

              if elemData.aAck = 'Y' then
                Exit;

              if (elemData.aAck = 'N') and
                 (pnlAllocInfo[i].Color = clYellow) then
              begin
                btnFunctions[8].Color := clRed;

                recMimic.ElementName := btnAlarmGroups[i].Caption;
                recMimic.ElementID := elemData.ElementID;
                recMimic.CommandID := C_ORD_MIMIC_ACK;
                recMimic.aAck      := 'Y';
                recMimic.SelectID  := TfrmAlarmPresentation(mimic).lvAlarmPresentation.Selected.index;
                SysMimics.Network.ControllerSocket.SendData(C_MIMICS_COMMAND, @recMimic);

                { save alarm -> Running ID to RS_ALARM_LOG table ->
                state (prev: Generate, action: Ack, final: Ack) by MCR }
                if alarmData.final_state = 'R' then
                  SysMimics.Database.SaveAlarm2(SysMimics.Mimic.Running_ID,
                    SysMimics.Mimic.ServerRunningTime, elemData.ElementID+
                    '.ALM.TRU', IntToStr(elemData.AlarmgroupID),'ALARM','MCR_'+
                    SysMimics.Mimic.RoleName, elemData.ElementID+'.ALM.TRU','A','R',
                    'D', IntToStr(elemData.MainMimic_IDfk)+' '+
                    elemData.AlarmgroupAbbreviation+' '+elemData.ElementID+' '+
                    elemData.Elementname+' '+elemData.Text_0,
                    SysMimics.Mimic.ServerRunningTime)
                else
                  SysMimics.Database.SaveAlarm2(SysMimics.Mimic.Running_ID,
                    SysMimics.Mimic.ServerRunningTime, elemData.ElementID+
                    '.ALM.TRU', IntToStr(elemData.AlarmgroupID),'ALARM','MCR_'+
                    SysMimics.Mimic.RoleName, elemData.ElementID+'.ALM.TRU','G','A',
                    'A', IntToStr(elemData.MainMimic_IDfk)+' '+
                    elemData.AlarmgroupAbbreviation+' '+elemData.ElementID+' '+
                    elemData.Elementname+' '+elemData.Text_0,
                    SysMimics.Mimic.ServerRunningTime);

                break;
              end;
            end;
          end;
        end;
      end;
    end
    else if ButtonID = 'Apply' then
    begin
      elemData := SysMimics.Database.GetElement(SysMimics.Mimic.ElementSelected);

      {save to commands history}
      SaveCommandsCIPButton(elemData, ButtonID);

      if Assigned(elemData) then
      begin
        recMimic.CommandID := C_ORD_APPLY;
        recMimic.ElementID := elemData.ElementID;
        recMimic.ElementName := elemData.Elementname;
        SysMimics.Network.ControllerSocket.SendData(C_MIMICS_COMMAND, @recMimic);
      end;
    end
    else if ButtonID = 'Close' then
    begin
      elemData := SysMimics.Database.GetElement(SysMimics.Mimic.ElementSelected);

      {save to commands history}
      SaveCommandsCIPButton(elemData, ButtonID);

      if Assigned(elemData) then
      begin
        recMimic.CommandID := C_ORD_CLOSE;
        recMimic.ElementID := elemData.ElementID;
        recMimic.ElementName := elemData.Elementname;
        SysMimics.Network.ControllerSocket.SendData(C_MIMICS_COMMAND, @recMimic);
      end;
    end
    else if ButtonID = 'Span' then
    begin
      mimic := SysMimics.Mimic.ActiveMimic;

      case mimic.MimicID of
        mtListParmCh:
        begin
          with TfrmCommandHistory(mimic) do
            frmConfDateTime.SetCurrentDateTime(DTMin, DTMax);
        end;
        mtCmdHist:
        begin
          with TfrmCommandHistory(mimic) do
            frmConfDateTime.SetCurrentDateTime(DTMin, DTMax);
        end;
        mtHistory:
        begin
          with TfrmAlarmHistory(mimic) do
            frmConfDateTime.SetCurrentDateTime(DTMin, DTMax);
        end;
      end;

      frmConfDateTime.ShowModal;
    end

    {F2 area}
    else if ButtonID = 'Open' then
    begin
      elemData := SysMimics.Database.GetElement(SysMimics.Mimic.ElementSelected);

      {save to commands history}
      SaveCommandsCIPButton(elemData, ButtonID);

      if Assigned(elemData) then
      begin
        recMimic.CommandID := C_ORD_OPEN;
        recMimic.ElementID := elemData.ElementID;
        recMimic.ElementName := elemData.Elementname;
        SysMimics.Network.ControllerSocket.SendData(C_MIMICS_COMMAND, @recMimic);
      end;
    end
    else if ButtonID = 'Goto' then
    begin
      mimic := SysMimics.Mimic.ActiveMimic;
      if Assigned(mimic) and (mimic.ClassType = TfrmAlarmPresentation) then
      begin
        if TfrmAlarmPresentation(mimic).lvAlarmPresentation.Selected = nil then
          Exit;

        elemData := TfrmAlarmPresentation(mimic).lvAlarmPresentation.Selected.Data;

        if Assigned(elemData) then
        begin
          SysMimics.Mimic.ShowMimic(E_MimicType(elemData.MainMimic_IDfk));
        end;
      end
      //1
      else if Assigned(mimic) and (mimic.ClassType = TfrmAlarmSummaryDG) then
      begin
        if TfrmAlarmSummaryDG(mimic).lvAlarmSummary.Selected = nil then
          Exit;

        elemData := TfrmAlarmSummaryDG(mimic).lvAlarmSummary.Selected.Data;

        if Assigned(elemData) then
          SysMimics.Mimic.ShowMimic(E_MimicType(elemData.MainMimic_IDfk));
      end
      //2
      else if Assigned(mimic) and (mimic.ClassType = TfrmAlarmSummaryDIST) then
      begin
        if TfrmAlarmSummaryDIST(mimic).lvAlarmSummary.Selected = nil then
          Exit;

        elemData := TfrmAlarmSummaryDIST(mimic).lvAlarmSummary.Selected.Data;

        if Assigned(elemData) then
          SysMimics.Mimic.ShowMimic(E_MimicType(elemData.MainMimic_IDfk));
      end
      //3
      else if Assigned(mimic) and (mimic.ClassType = TfrmAlarmSummaryPROP) then
      begin
        if TfrmAlarmSummaryPROP(mimic).lvAlarmSummary.Selected = nil then
          Exit;

        elemData := TfrmAlarmSummaryPROP(mimic).lvAlarmSummary.Selected.Data;

        if Assigned(elemData) then
          SysMimics.Mimic.ShowMimic(E_MimicType(elemData.MainMimic_IDfk));
      end
      //4
      else if Assigned(mimic) and (mimic.ClassType = TfrmAlarmSummaryAUX) then
      begin
        if TfrmAlarmSummaryAUX(mimic).lvAlarmSummary.Selected = nil then
          Exit;

        elemData := TfrmAlarmSummaryAUX(mimic).lvAlarmSummary.Selected.Data;

        if Assigned(elemData) then
          SysMimics.Mimic.ShowMimic(E_MimicType(elemData.MainMimic_IDfk));
      end
      //5
      else if Assigned(mimic) and (mimic.ClassType = TfrmAlarmSummaryFUEL) then
      begin
        if TfrmAlarmSummaryFUEL(mimic).lvAlarmSummary.Selected = nil then
          Exit;

        elemData := TfrmAlarmSummaryFUEL(mimic).lvAlarmSummary.Selected.Data;

        if Assigned(elemData) then
          SysMimics.Mimic.ShowMimic(E_MimicType(elemData.MainMimic_IDfk));
      end
      //6
      else if Assigned(mimic) and (mimic.ClassType = TfrmAlarmSummaryDMST) then
      begin
        if TfrmAlarmSummaryDMST(mimic).lvAlarmSummary.Selected = nil then
          Exit;

        elemData := TfrmAlarmSummaryDMST(mimic).lvAlarmSummary.Selected.Data;

        if Assigned(elemData) then
          SysMimics.Mimic.ShowMimic(E_MimicType(elemData.MainMimic_IDfk));
      end
      //7
      else if Assigned(mimic) and (mimic.ClassType = TfrmAlarmSummaryHVAC) then
      begin
        if TfrmAlarmSummaryHVAC(mimic).lvAlarmSummary.Selected = nil then
          Exit;

        elemData := TfrmAlarmSummaryHVAC(mimic).lvAlarmSummary.Selected.Data;

        if Assigned(elemData) then
          SysMimics.Mimic.ShowMimic(E_MimicType(elemData.MainMimic_IDfk));
      end
      //8
      else if Assigned(mimic) and (mimic.ClassType = TfrmAlarmSummaryFFDC) then
      begin
        if TfrmAlarmSummaryFFDC(mimic).lvAlarmSummary.Selected = nil then
          Exit;

        elemData := TfrmAlarmSummaryFFDC(mimic).lvAlarmSummary.Selected.Data;

        if Assigned(elemData) then
          SysMimics.Mimic.ShowMimic(E_MimicType(elemData.MainMimic_IDfk));
      end
      //9
      else if Assigned(mimic) and (mimic.ClassType = TfrmAlarmSummaryNAV) then
      begin
        if TfrmAlarmSummaryNAV(mimic).lvAlarmSummary.Selected = nil then
          Exit;

        elemData := TfrmAlarmSummaryNAV(mimic).lvAlarmSummary.Selected.Data;

        if Assigned(elemData) then
          SysMimics.Mimic.ShowMimic(E_MimicType(elemData.MainMimic_IDfk));
      end
      //10
      else if Assigned(mimic) and (mimic.ClassType = TfrmAlarmSummaryBALL) then
      begin
        if TfrmAlarmSummaryBALL(mimic).lvAlarmSummary.Selected = nil then
          Exit;

        elemData := TfrmAlarmSummaryBALL(mimic).lvAlarmSummary.Selected.Data;

        if Assigned(elemData) then
          SysMimics.Mimic.ShowMimic(E_MimicType(elemData.MainMimic_IDfk));
      end
      //11
      else if Assigned(mimic) and (mimic.ClassType = TfrmAlarmSummaryIPMS) then
      begin
        if TfrmAlarmSummaryIPMS(mimic).lvAlarmSummary.Selected = nil then
          Exit;

        elemData := TfrmAlarmSummaryIPMS(mimic).lvAlarmSummary.Selected.Data;

        if Assigned(elemData) then
          SysMimics.Mimic.ShowMimic(E_MimicType(elemData.MainMimic_IDfk));
      end
      //12
      else if Assigned(mimic) and (mimic.ClassType = TfrmAlarmSummary) then
      begin
        if TfrmAlarmSummary(mimic).lvAlarmSummary.Selected = nil then
          Exit;

        elemData := TfrmAlarmSummary(mimic).lvAlarmSummary.Selected.Data;

        if Assigned(elemData) then
          SysMimics.Mimic.ShowMimic(E_MimicType(elemData.MainMimic_IDfk));
      end;
    end
    else if ButtonID = 'Enable' then
    begin
      elemData := SysMimics.Database.GetElement(SysMimics.Mimic.ElementSelected);

      {save to commands history}
      SaveCommandsCIPButton(elemData, ButtonID);

      if Assigned(elemData) then
      begin
        recMimic.CommandID := C_ORD_ENABLE;
        recMimic.ElementID := elemData.ElementID;
        recMimic.ElementName := elemData.Elementname;
        recMimic.FinalState := 'R';
        SysMimics.Network.ControllerSocket.SendData(C_MIMICS_COMMAND, @recMimic);
      end;

      FIsDisEnb := 1;
      ShowMessage('Element has been enabled');
    end
    else if ButtonID = '1 h <' then
    begin
      mimic := SysMimics.Mimic.ActiveMimic;

      if mimic.ClassType = TfrmAlarmHistory then
        TfrmAlarmHistory(mimic).EditTime(ButtonID);
    end
    else if ButtonID = '30 days <' then
    begin
      mimic := SysMimics.Mimic.ActiveMimic;

      if mimic.ClassType = TfrmListOfParameterChanges then
        TfrmListOfParameterChanges(mimic).EditTime(ButtonID);
    end
    else if ButtonID = '24 h <' then
    begin
      mimic := SysMimics.Mimic.ActiveMimic;

      if mimic.ClassType = TfrmCommandHistory then
        TfrmCommandHistory(mimic).EditTime(ButtonID);
    end

    {F3 area}
    else if ButtonID = 'History' then
    begin
      with SysMimics.Mimic do
      begin
        AddMimicHistory(Ord(mtHistory));
        ShowMimic(mtHistory);
      end;
    end

    {F4 area}

    {F5 area}
    else if ButtonID = 'Top' then
    begin
      mimic := SysMimics.Mimic.ActiveMimic;

      if Assigned(mimic) and (mimic.ClassType = TfrmAlarmPresentation) then
      begin
        if TfrmAlarmPresentation(mimic).lbl2.Caption <> '0'  then
        begin
          TfrmAlarmPresentation(mimic).lvAlarmPresentation.Items[0].Selected := True;
          TfrmAlarmPresentation(mimic).lvAlarmPresentation.Items[0].Focused := True;
        end;
      end
      //1
      else if Assigned(mimic) and (mimic.ClassType = TfrmAlarmSummaryDG) then
      begin
        if TfrmAlarmSummaryDG(mimic).lvAlarmSummary.Items.Count > 0 then
        begin
          TfrmAlarmSummaryDG(mimic).lvAlarmSummary.Items[0].Selected := True;
          TfrmAlarmSummaryDG(mimic).lvAlarmSummary.Items[0].Focused := True;
        end;
      end
      //2
      else if Assigned(mimic) and (mimic.ClassType = TfrmAlarmSummaryDIST) then
      begin
        if TfrmAlarmSummaryDIST(mimic).lvAlarmSummary.Items.Count > 0 then
        begin
          TfrmAlarmSummaryDIST(mimic).lvAlarmSummary.Items[0].Selected := True;
          TfrmAlarmSummaryDIST(mimic).lvAlarmSummary.Items[0].Focused := True;
        end;
      end
      //3
      else if Assigned(mimic) and (mimic.ClassType = TfrmAlarmSummaryPROP) then
      begin
        if TfrmAlarmSummaryPROP(mimic).lvAlarmSummary.Items.Count > 0 then
        begin
          TfrmAlarmSummaryPROP(mimic).lvAlarmSummary.Items[0].Selected := True;
          TfrmAlarmSummaryPROP(mimic).lvAlarmSummary.Items[0].Focused := True;
        end;
      end
      //4
      else if Assigned(mimic) and (mimic.ClassType = TfrmAlarmSummaryAUX) then
      begin
        if TfrmAlarmSummaryAUX(mimic).lvAlarmSummary.Items.Count > 0 then
        begin
          TfrmAlarmSummaryAUX(mimic).lvAlarmSummary.Items[0].Selected := True;
          TfrmAlarmSummaryAUX(mimic).lvAlarmSummary.Items[0].Focused := True;
        end;
      end
      //5
      else if Assigned(mimic) and (mimic.ClassType = TfrmAlarmSummaryFUEL) then
      begin
        if TfrmAlarmSummaryFUEL(mimic).lvAlarmSummary.Items.Count > 0 then
        begin
          TfrmAlarmSummaryFUEL(mimic).lvAlarmSummary.Items[0].Selected := True;
          TfrmAlarmSummaryFUEL(mimic).lvAlarmSummary.Items[0].Focused := True;
        end;
      end
      //6
      else if Assigned(mimic) and (mimic.ClassType = TfrmAlarmSummaryDMST) then
      begin
        if TfrmAlarmSummaryDMST(mimic).lvAlarmSummary.Items.Count > 0 then
        begin
          TfrmAlarmSummaryDMST(mimic).lvAlarmSummary.Items[0].Selected := True;
          TfrmAlarmSummaryDMST(mimic).lvAlarmSummary.Items[0].Focused := True;
        end;
      end
      //7
      else if Assigned(mimic) and (mimic.ClassType = TfrmAlarmSummaryHVAC) then
      begin
        if TfrmAlarmSummaryHVAC(mimic).lvAlarmSummary.Items.Count > 0 then
        begin
          TfrmAlarmSummaryHVAC(mimic).lvAlarmSummary.Items[0].Selected := True;
          TfrmAlarmSummaryHVAC(mimic).lvAlarmSummary.Items[0].Focused := True;
        end;
      end
      //8
      else if Assigned(mimic) and (mimic.ClassType = TfrmAlarmSummaryFFDC) then
      begin
        if TfrmAlarmSummaryFFDC(mimic).lvAlarmSummary.Items.Count > 0 then
        begin
          TfrmAlarmSummaryFFDC(mimic).lvAlarmSummary.Items[0].Selected := True;
          TfrmAlarmSummaryFFDC(mimic).lvAlarmSummary.Items[0].Focused := True;
        end;
      end
      //9
      else if Assigned(mimic) and (mimic.ClassType = TfrmAlarmSummaryNAV) then
      begin
        if TfrmAlarmSummaryNAV(mimic).lvAlarmSummary.Items.Count > 0 then
        begin
          TfrmAlarmSummaryNAV(mimic).lvAlarmSummary.Items[0].Selected := True;
          TfrmAlarmSummaryNAV(mimic).lvAlarmSummary.Items[0].Focused := True;
        end;
      end
      //10
      else if Assigned(mimic) and (mimic.ClassType = TfrmAlarmSummaryBALL) then
      begin
        if TfrmAlarmSummaryBALL(mimic).lvAlarmSummary.Items.Count > 0 then
        begin
          TfrmAlarmSummaryBALL(mimic).lvAlarmSummary.Items[0].Selected := True;
          TfrmAlarmSummaryBALL(mimic).lvAlarmSummary.Items[0].Focused := True;
        end;
      end
      //11
      else if Assigned(mimic) and (mimic.ClassType = TfrmAlarmSummaryIPMS) then
      begin
        if TfrmAlarmSummaryIPMS(mimic).lvAlarmSummary.Items.Count > 0 then
        begin
          TfrmAlarmSummaryIPMS(mimic).lvAlarmSummary.Items[0].Selected := True;
          TfrmAlarmSummaryIPMS(mimic).lvAlarmSummary.Items[0].Focused := True;
        end;
      end
      //12
      else if Assigned(mimic) and (mimic.ClassType = TfrmAlarmSummary) then
      begin
        if TfrmAlarmSummary(mimic).lvAlarmSummary.Items.Count > 0 then
        begin
          TfrmAlarmSummary(mimic).lvAlarmSummary.Items[0].Selected := True;
          TfrmAlarmSummary(mimic).lvAlarmSummary.Items[0].Focused := True;
        end;
      end;
    end
    else if ButtonID = 'Sort' then
    begin
      frmSelectSort.ShowModal;
    end

    {F6 area}
    else if ButtonID = 'Filter' then
    begin     
      frmEdtFilter.ShowModal;
    end
	  else if ButtonID = 'Manual' then
    begin
      elemData := SysMimics.Database.GetElement(SysMimics.Mimic.ElementSelected);

      {save to commands history}
      SaveCommandsCIPButton(elemData, ButtonID);

      if Assigned(elemData) then
      begin
        recMimic.CommandID := C_ORD_MANUAL;
        recMimic.ElementID := elemData.ElementID;
        recMimic.ElementName := elemData.Elementname;
        SysMimics.Network.ControllerSocket.SendData(C_MIMICS_COMMAND, @recMimic);
      end;
    end
    else if ButtonID = 'Select' then
    begin
      elemData := SysMimics.Database.GetElement(SysMimics.Mimic.ElementSelected);

      {save to commands history}
      SaveCommandsCIPButton(elemData, ButtonID);

      if Assigned(elemData) then
      begin
        frmSelectElement.edtElementID.Text := elemData.ElementID;
        frmSelectElement.lblElementDesc.Caption := elemData.Elementname;
      end;

      SysMimics.Database.getAllElementIDs(listElementID);

      frmSelectElement.SetListElementID(listElementID);

      frmSelectElement.Show;
    end

    {F7 area}
    else if ButtonID = 'Auto' then
    begin
      elemData := SysMimics.Database.GetElement(SysMimics.Mimic.ElementSelected);

      {save to commands history}
      SaveCommandsCIPButton(elemData, ButtonID);

      if Assigned(elemData) then
      begin
        recMimic.CommandID := C_ORD_AUTO;
        recMimic.ElementID := elemData.ElementID;
        recMimic.ElementName := elemData.Elementname;
        SysMimics.Network.ControllerSocket.SendData(C_MIMICS_COMMAND, @recMimic);
      end;
    end
    else if ButtonID = 'Authorize' then
    begin
      if not (SysMimics.Mimic.ElementSelected = '') then
        elemData := SysMimics.Database.GetElement(SysMimics.Mimic.ElementSelected);

      {save to commands history}
      SaveCommandsCIPButton(elemData, ButtonID);

      frmAuthorization.Show;
    end
    else if ButtonID = 'Fields' then
    begin
      frmSelectFieldView.ShowModal;
    end

    {F8 area}
    else if ButtonID = 'Assist' then
    begin
      mimic := SysMimics.Mimic.ShowMimic(mtAssist);

      if Assigned(mimic) and (mimic.ClassType = TfrmCAP) then
      begin
        elemData := SysMimics.Database.GetElement(SysMimics.Mimic.ElementSelected);
        capData := SysMimics.Database.GetCAPData(SysMimics.Mimic.ElementSelected);
        cipInfo := SysMimics.Database.GetCIP_INFO(capData.FElementtype_IDfk + '1');

        TfrmCAP(mimic).CAPData := capData;

        with SysMimics.Mimic do
        begin
          UpdateCIPInfo(elemData, cipInfo, ControlMode, ElemStatus, EnbAlm, ValApp);
          UpdateCIPButton(cipInfo, msAssist);
          AuthorizeCIPButton(elemData, msAssist);
        end;
      end;

      {save to commands history}
      SaveCommandsCIPButton(elemData, 'Assist');
    end
    else if ButtonID = 'Return' then
    begin
      if (SysMimics.Mimic.ActiveMimic.MimicID = mtAssist) and
        (SysMimics.Mimic.NewSelectedElementID <> '') then
        SysMimics.Mimic.ReturnWithNewElementID(SysMimics.Mimic.NewSelectedElementID)
      else
        SysMimics.Mimic.ShowPrevHistory;

      SysMimics.Mimic.NewSelectedElementID := '';

      {save to commands history}
      elemData := SysMimics.Database.GetElement(SysMimics.Mimic.ElementSelected);
      SaveCommandsCIPButton(elemData, 'Return');
    end

    {F9 area}
    else if ButtonID = 'Alarm' then
    begin
      with SysMimics.Mimic do
      begin
        AddMimicHistory(Ord(mtAlarm));
        ShowMimic(mtAlarm);

        UpdateCIPInfo(nil, nil, 0, 0, 0, 0);
        UpdateCIPButton(nil, msAlarm);
        AuthorizeCIPButton(nil, msAlarm);
      end;
    end

    {F10 area}
    else if ButtonID = 'Stop horn' then
    begin
      try
        mpAlarm.Open;
        mpAlarm.Stop;
      finally
      end;
      SysMimics.Mimic.checked := False;
      silence := False;

      FStopHorn := 1;
    end
    else if ButtonID = 'Stop' then
    begin
      mimic := SysMimics.Mimic.ActiveMimic;
      if Assigned(mimic) and (mimic.ClassType = TfrmMachinerySpaceVentSystem) then
      begin
        elemData := SysMimics.Database.GetElement(SysMimics.Mimic.ElementSelected);
        if Assigned(elemData) then
        begin
          if elemData.Elementtype_IDfk = 'MCD'  then
          begin
            recVentStatus.ElementID := elemData.ElementID;
            recVentStatus.ElementType := isMCD;  // 1 = MCD, 2 = MCE
            recVentStatus.Status := Byte(seStopped);
            SysMimics.Network.ControllerSocket.SendData(C_VENTSTATUS_COMMAND, @recVentStatus);
          end
          else if elemData.Elementtype_IDfk = 'MCE' then
          begin
            recVentStatus.ElementID := elemData.ElementID;
            recVentStatus.ElementType := isMCE;  // 1 = MCD, 2 = MCE
            recVentStatus.Status := Byte(seStopped);
            SysMimics.Network.ControllerSocket.SendData(C_VENTSTATUS_COMMAND, @recVentStatus);
          end;
        end;
      end;

      {save to commands history}
      SaveCommandsCIPButton(elemData, ButtonID);
    end
    else if ButtonID = 'Start'   then
    begin
      mimic := SysMimics.Mimic.ActiveMimic;
      if Assigned(mimic) and (mimic.ClassType = TfrmMachinerySpaceVentSystem) then
      begin
        elemData := SysMimics.Database.GetElement(SysMimics.Mimic.ElementSelected);
        if Assigned(elemData) then
        begin
          if elemData.Elementtype_IDfk = 'MCE' then
          begin
            recVentStatus.ElementID := elemData.ElementID;
            recVentStatus.ElementType := isMCE;  // 1 = MCD, 2 = MCE
            recVentStatus.Status := Byte(seRunning);
            SysMimics.Network.ControllerSocket.SendData(C_VENTSTATUS_COMMAND, @recVentStatus);
          end;
        end;
      end;

      {save to commands history}
      SaveCommandsCIPButton(elemData, ButtonID);
    end
    else if (ButtonID = 'Supply') or (ButtonID = 'Low Speed') then
    begin
      mimic := SysMimics.Mimic.ActiveMimic;
      if Assigned(mimic) and (mimic.ClassType = TfrmMachinerySpaceVentSystem) then
      begin
        elemData := SysMimics.Database.GetElement(SysMimics.Mimic.ElementSelected);
        if Assigned(elemData) then
        begin
          if elemData.Elementtype_IDfk = 'MCD' then
          begin
            recVentStatus.ElementID := elemData.ElementID;
            recVentStatus.ElementType := isMCD;  // 1 = MCD, 2 = MCE
            recVentStatus.Status := Byte(seSpeed1);
            SysMimics.Network.ControllerSocket.SendData(C_VENTSTATUS_COMMAND, @recVentStatus);
          end;
        end;
      end;

      {save to commands history}
      SaveCommandsCIPButton(elemData, ButtonID);
    end
    else if (ButtonID = 'Exhaust') or (ButtonID = 'Hgh Speed') then
    begin
      mimic := SysMimics.Mimic.ActiveMimic;
      if Assigned(mimic) and (mimic.ClassType = TfrmMachinerySpaceVentSystem) then
      begin
        elemData := SysMimics.Database.GetElement(SysMimics.Mimic.ElementSelected);
        if Assigned(elemData) then
        begin
          if elemData.Elementtype_IDfk = 'MCD' then
          begin
            recVentStatus.ElementID := elemData.ElementID;
            recVentStatus.ElementType := isMCD;  // 1 = MCD, 2 = MCE
            recVentStatus.Status := Byte(seSpeed2);
            SysMimics.Network.ControllerSocket.SendData(C_VENTSTATUS_COMMAND, @recVentStatus);
          end;
        end;
      end;

      {save to commands history}
      SaveCommandsCIPButton(elemData, ButtonID);
    end

  end;

  capData.Free;
  cipInfo.Free;
end;

//procedure TfrmMainDisplay.PlayAlarmSound;
//begin
//  try
//    mpAlarm.AutoRewind := True;
//    mpAlarm.Open;
//    mpAlarm.Play;
//    mpAlarm.Notify := True;
//  except
//    on E:Exception do
//      MessageDlg(E.Message,mtError,[mbOK],0);
//  end;
//  silence := False;
//end;

procedure TfrmMainDisplay.PropContainerCIPClick(Sender: TObject);
begin
  frmProperts.Show;
  frmProperts.Caption := 'Properties - Link Container (CIP)';
end;

procedure TfrmMainDisplay.PropContainerClick(Sender: TObject);
begin
  frmProperts.Show;
  frmProperts.Caption := 'Properties - Link Container';
end;

procedure TfrmMainDisplay.PVContainerCIPClick(Sender: TObject);
begin
  frmPointView.Show;
  frmPointView.Caption := 'Point View - Link Container (CIP)';
end;

procedure TfrmMainDisplay.PVCotainerClick(Sender: TObject);
begin
  frmPointView.Show;
  frmPointView.Caption := 'Point View - Link Container';
end;

procedure TfrmMainDisplay.SaveCommandsCIPButton(elmData: TElementData; btnID: string);
begin
  if not Assigned(elmData) then
    Exit;

  SysMimics.Database.SaveCommands(SysMimics.Mimic.Running_ID,
    SysMimics.Mimic.ServerRunningTime, 'USER.MCR_'+SysMimics.Mimic.RoleName+'.CMD',
    elmData.ElementID+' '+' - '+
    elmData.Elementname+' '+'       - '+'"'+btnID+'"');
end;

procedure TfrmMainDisplay.SelectNewElementID(aElementID: string);
var
  capData : TCAP_Data;
begin
  SysMimics.Mimic.NewSelectedElementID := aElementID;

  if SysMimics.Mimic.ActiveMimic is TfrmCAP then
  begin
    capData := SysMimics.Database.GetCAPData(aElementID);
    TfrmCAP(SysMimics.Mimic.ActiveMimic).CAPData := capData;
  end;
end;

procedure TfrmMainDisplay.SetAuthorization(aAuthorized: Boolean);
begin
  FIsAuthorized := aAuthorized;
end;

procedure TfrmMainDisplay.SetCustomEvent(Sender: TObject);
begin
  if Sender is TfrmAuthorization then
    TfrmAuthorization(Sender).OnLoginInMain := LoginResult;

  if Sender is TfrmSelectElement then
    TfrmSelectElement(Sender).OnSelectNewElementID := SelectNewElementID;
end;

procedure TfrmMainDisplay.SetServerTime(aTime: TDateTime);
begin
  FServerTime := aTime;
  lbl2.Caption := FormatDateTime('dd mmmm yyyy',aTime);
  statKananAtas.Panels[0].Text := FormatDateTime('hh : nn : ss', FServerTime);
end;

procedure TfrmMainDisplay.statKananAtasMouseEnter(Sender: TObject);
begin
  lbl2.Visible := True;
end;

procedure TfrmMainDisplay.statKananAtasMouseLeave(Sender: TObject);
begin
  lbl2.Visible := False;
end;

//procedure TfrmMainDisplay.StopAlarmSound(isStop: Boolean);
//begin
//  if isStop then
//  begin
//    try
//      mpAlarm.Stop;
//      mpAlarm.Close;
//    finally
//    end;
//    mpAlarm.Notify := True;
//    silence := True;
//  end;
//end;

procedure TfrmMainDisplay.tmr1Timer(Sender: TObject);
begin
//  Inc(FInterval);
  // time to shrink??
  if (((GetTickCount - LastTick) / 1000) > 120) or (Self.WindowState = wsMinimized) then
    //TrimAppMemorySize
  else
  begin
//    if FInterval > 600 then // every 10 min
//      if (CurrentMemoryUsage / 1024 ) > 100 then
//      begin
//        // force memory shrink
//        Enabled := False;
//        TrimAppMemorySize;
//        Sleep(1000);
//        Enabled := True;
//      end;
  end;

end;

procedure TfrmMainDisplay.UpdateAlrmColorButton(aVal : byte; aClass: string);
begin
  if (aVal = 0) or (aVal = 4)  then
  begin
    Exit;
  end
  else
  begin
    tmr.Enabled := true;
  end;
end;

procedure TfrmMainDisplay.UpdateCIPButton(aCIP: TObject; aMimicState: E_MimicState);
var
  btnData : TCIPInfo;
begin         
  if aMimicState = msAlarm then
  begin
    btnFunctions[0].ButtonID := 'Ack';
    btnFunctions[1].ButtonID := 'Goto';
    btnFunctions[2].ButtonID := 'History';
    btnFunctions[3].ButtonID := '';
    btnFunctions[4].ButtonID := 'Top';
    btnFunctions[5].ButtonID := '';
    btnFunctions[6].ButtonID := '';
    btnFunctions[7].ButtonID := 'Return';
    FAssistEnabledTimer.Enabled := False;
    btnFunctions[7].Enabled := True;
    btnFunctions[7].FButtonLabel.Font.Color := clWhite;
  end
  else if aMimicState = msHistory then
  begin
    btnFunctions[0].ButtonID := 'Span';
    btnFunctions[1].ButtonID := '1 h <';
    btnFunctions[2].ButtonID := '';
    btnFunctions[3].ButtonID := '';
    btnFunctions[4].ButtonID := 'Sort';
    btnFunctions[5].ButtonID := 'Filter';
    btnFunctions[6].ButtonID := 'Fields';
    btnFunctions[7].ButtonID := 'Return';
    FAssistEnabledTimer.Enabled := False;
    btnFunctions[7].Enabled := True;
    btnFunctions[7].FButtonLabel.Font.Color := clWhite;
  end
  else if aMimicState = msParameter then
  begin
    btnFunctions[0].ButtonID := 'Span';
    btnFunctions[1].ButtonID := '30 days <';
    btnFunctions[2].ButtonID := '';
    btnFunctions[3].ButtonID := '';
    btnFunctions[4].ButtonID := '';
    btnFunctions[5].ButtonID := '';
    btnFunctions[6].ButtonID := '';
    btnFunctions[7].ButtonID := 'Return';
    FAssistEnabledTimer.Enabled := False;
    btnFunctions[7].Enabled := True;
    btnFunctions[7].FButtonLabel.Font.Color := clWhite;
  end
  else if aMimicState = msCommand then
  begin
    btnFunctions[0].ButtonID := 'Span';
    btnFunctions[1].ButtonID := '24 h <';
    btnFunctions[2].ButtonID := '';
    btnFunctions[3].ButtonID := '';
    btnFunctions[4].ButtonID := 'Sort';
    btnFunctions[5].ButtonID := 'Filter';
    btnFunctions[6].ButtonID := 'Fields';
    btnFunctions[7].ButtonID := 'Return';
    FAssistEnabledTimer.Enabled := False;
    btnFunctions[7].Enabled := True;
    btnFunctions[7].FButtonLabel.Font.Color := clWhite;
  end
  else
  begin
    if Assigned(aCIP) then
    begin
      btnData := TCIPInfo(aCIP);

      case aMimicState of
        msMimic:
        begin
          btnFunctions[0].ButtonID := btnData.F1;
          btnFunctions[1].ButtonID := btnData.F2;
          btnFunctions[2].ButtonID := btnData.F3;
          btnFunctions[3].ButtonID := btnData.F4;
          btnFunctions[4].ButtonID := btnData.F5;
          btnFunctions[5].ButtonID := btnData.F6;
          btnFunctions[6].ButtonID := btnData.F7;
          btnFunctions[7].ButtonID := btnData.F8;
          FAssistEnabledTimer.Enabled := True;

          btnFunctions[7].Enabled := True;
          btnFunctions[7].FButtonLabel.Font.Color := clWhite;
        end;
        msAssist:
        begin
          btnFunctions[0].ButtonID := btnData.F1A;
          btnFunctions[1].ButtonID := btnData.F2A;
          btnFunctions[2].ButtonID := btnData.F3A;
          btnFunctions[3].ButtonID := btnData.F4A;
          btnFunctions[4].ButtonID := btnData.F5A;
          btnFunctions[5].ButtonID := btnData.F6A;
          btnFunctions[6].ButtonID := btnData.F7A;
          btnFunctions[7].ButtonID := btnData.F8A;
          FAssistEnabledTimer.Enabled := False;
        end;
      end;
    end
    else
    begin
      btnFunctions[0].ButtonID := '';
      btnFunctions[1].ButtonID := '';
      btnFunctions[2].ButtonID := '';
      btnFunctions[3].ButtonID := '';
      btnFunctions[4].ButtonID := '';
      btnFunctions[5].ButtonID := '';
      btnFunctions[6].ButtonID := '';
      btnFunctions[7].ButtonID := '';
    end;
  end;
end;

procedure TfrmMainDisplay.UpdateCIPInfo(aInfo: TObject; aCIP: TObject; aCtrlMode: Byte;
  aElmStatus: Byte; aEnbAlmInhibited: Byte; aValApp: Double);
var
  elem : TElementData;
  cip  : TCIPInfo;

  sm, ai, cm : Byte;
begin
  if Assigned(aInfo) then
  begin
    elem := TElementData(aInfo);
    cip  := TCIPInfo(aCIP);
    sm   := aElmStatus;
    ai   := aEnbAlmInhibited;
    cm   := aCtrlMode;

    with statAtas do
    begin
      Panels[0].Text := elem.ElementID;
      Panels[1].Text := UpperCase(elem.Elementname);

      case sm of
        0: Panels[2].Text := 'STATUS: Enabled' {+ cip.SM0};
        1: Panels[2].Text := 'STATUS: ' + cip.SM1;
        2: Panels[2].Text := 'STATUS: ' + cip.SM2;
        3: Panels[2].Text := 'STATUS: ' + cip.SM3;
        4: Panels[2].Text := 'STATUS: ' + cip.SM4;
        5: Panels[2].Text := 'STATUS: ' + cip.SM5;
        6: Panels[2].Text := 'STATUS: ' + cip.SM6;
        7: Panels[2].Text := 'STATUS: ' + cip.SM7;
        8: Panels[2].Text := 'STATUS: ' + cip.SM8;
        9: Panels[2].Text := 'STATUS: ' + cip.SM9;
        10: Panels[2].Text := 'STATUS: ' + cip.SM10;
        11: Panels[2].Text := 'STATUS: ' + cip.SM11;
        12: Panels[2].Text := 'STATUS: ' + cip.SM12;
        13: Panels[2].Text := 'STATUS: ' + cip.SM13;
        14: Panels[2].Text := 'STATUS: ' + cip.SM14;
        15: Panels[2].Text := 'STATUS: ' + cip.SM15;
      end;

      case ai of
        0: Panels[3].Text := '';
        1: Panels[3].Text := cip.ENBL;
        2: Panels[3].Text := cip.INH;
      end;
    end;

    with statBawah do
    begin
      Panels[0].Text := elem.AlarmgroupDescription;
      Panels[1].Text := ''; //NBCD atau ''
      Panels[2].Text := '';

      if (cip.F1 = '') or
         (cip.F2 = '') or
         (cip.F6 = '') or
         (cip.F7 = '') then
        Panels[3].Text := 'Value : '+ FormatFloat('0.00',aValApp)
      else
        Panels[3].Text := 'Command : *****';

      case cm of
        0: Panels[4].Text := '';
        1: Panels[4].Text := cip.LOC;
        2: Panels[4].Text := cip.MAN;
        3: Panels[4].Text := cip.AUTO;
        4: Panels[4].Text := '';
      end;
    end;
  end
  else
  begin
    with statAtas do
    begin
      Panels[0].Text := '';
      Panels[1].Text := '';
      Panels[2].Text := '';
      Panels[3].Text := '';
    end;

    with statBawah do
    begin
      Panels[0].Text := '';
      Panels[1].Text := '';
      Panels[2].Text := '';
      Panels[3].Text := '';
      Panels[4].Text := '';
    end;
  end;
end;

{ TCIPButton }

procedure TCIPButton.ClickMe(Sender: TObject);
begin
  Click;
end;

constructor TCIPButton.Create(AOwner: TComponent);
begin
  inherited;

  FButtonLabel := TLabel.Create(Self);
  FButtonLabel.Color := clWindow;
  FButtonLabel.Font.Color := clBlack;
  FButtonLabel.Font.Name := 'Arial';
  FButtonLabel.Font.Size := 12;
//  FButtonLabel.Font.Style := [fsBold];
  FButtonLabel.Parent := Self;
  FButtonLabel.Top := 7;
  FButtonLabel.OnClick := ClickMe;

  FHotkeyLabel := TLabel.Create(Self);
  FHotkeyLabel.Color := clWindow;
  FHotkeyLabel.Font.Color := clBlack;
  FHotkeyLabel.Font.Name := 'Arial';
  FHotkeyLabel.Font.Size := 7;
  FHotkeyLabel.Left := 2;
  FHotkeyLabel.Parent := Self;
  FHotkeyLabel.Top := 2;
  FHotkeyLabel.OnClick := ClickMe;

end;

function TCIPButton.GetButtonID: string;
begin
  Result := FButtonLabel.Caption;
end;

procedure TCIPButton.Initialize;
begin
  FButtonLabel.Left := (Width - FButtonLabel.Width) div 2;
end;

procedure TCIPButton.SetButtonID(const aStr: string);
begin
  FButtonLabel.Caption := aStr;

  FButtonLabel.Left := (Self.Width - FButtonLabel.Width) div 2;
end;

procedure TCIPButton.SetHotkeyID(const aStr: string);
begin
  FHotkeyLabel.Caption := aStr;
end;

end.
