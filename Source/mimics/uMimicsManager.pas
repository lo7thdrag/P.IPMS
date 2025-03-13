unit uMimicsManager;

{
  Class to manage IPMS forms
}

interface

uses
  Windows, uDataType, ufrmMimics, Forms, Controls, Graphics,
  Sysutils, classes, Dialogs, uDatabase, ExtCtrls,
  uListener, uDBSupportClasses, uFreezeFrom, uBaseComponent,
  DateUtils, uThreadTimer, uSteppers, ComCtrls;

type

  TMimicManager = class
  private
    // flag
    LagiProses : Boolean;

    FMimicsList  :  TList;

    FCEPairedList : TComponentElement;

    FElementList : TThreadList;
    FAlarmList    : TList;

    FActiveMimic : TfrmMimics;
    FOldMimic    : TfrmMimics;
    FMainForm    : TForm;

    FDatabase    : TIPMSDatabase;
    FListener    : TListeners;

    FControlMode : Byte;
    FElemStatus  : Byte;
    FEnbAlm      : Byte;
    FValApp      : Double;
//    FAlarm       : Byte;

    FSelectedElementID : string;
    FNewSelectedElementID : string;
    FRoleName : string;
//    FGrupAlarm: string;
    FCurrentMimicIndex : Integer;
    FRole : string;

    FFreezed : Boolean;
    FFormFreeze : TfrmFreeze;

    FMimicHistoryList : TStrings;

    FTanksDataList : TList;

    FSeqNumber : Integer;
    FChecked   : Boolean;

    FRunner : TMSTimer;
    FDelayer : TDelayer;
    FPingDelayer : TDelayer;
    FAsInstructor: boolean;
    FOnLogEvent: TGetStrProc;

    FRunningScenario : Integer;
    FServerRunningTime : TDateTime;
    FServerNoResponse : Boolean;

    procedure OnRunnerEvent(const aDt : Double);
    procedure OnDelayedRun(Sender : TObject);
    procedure OnPingDelayedRun(Sender : TObject);
    procedure PairingComponentElement(aList : TStrings);

    { access priviledge for specific mimic }
    function UserPriviledge(aMimicType : E_MimicType): Boolean;

    { custom event to comunicate to or from other mimics or mimic manager }
    procedure SetCustomFormEvent(Sender : TObject);

    {
      Event handling for the mimic interface
      note : start function name with OnMimic[MimicName][Event]
    }
    procedure OnMimicsShowCIPData(aElementID: string; aControlMode: Byte;
      aElemStatus: Byte; aEnbAlmInhibited: Byte; aValApp: Double);
    procedure OnMimicTOCCommand(Sender : TObject; MimicType : E_MimicType);
    procedure OnShortcutClick(aPage: Byte);
    procedure OnAlarmChange(aElemID: string; aValue : Byte);
    procedure OnListAlarm(aElement: string; aValue: Byte);
    procedure OnRemoveAlarm(aElementID: string);
    procedure OnDisableAlarm(aElementID: string);
    procedure OnAlarmSoundChange(aIndex: Byte; aEnabled: Boolean);
    procedure OnStatusControlIns(aMimicID, aStatus : byte; aElementID : string);

    procedure SetElementSelected(aElementID: string);
    procedure SetFreezed(const Value: boolean);

    function Interpolate(xSearch, x0,y0,x1,y1 : Double):double;
    procedure SetAsInstructor(const Value: boolean);
    procedure SetOnLogEvent(const Value: TGetStrProc);

    { procedure ini dipanggil waktu load scenario instruktur }
    procedure LoadFACondition(aScenarioID : Integer);
    procedure LoadTankCondition(aScenarioID : Integer);
    procedure LoadTankCondition2(aScenarioID: Integer);
    procedure LoadAlarmList(aScenario: Integer);
    procedure LoadAlarmSound(aScenario: Integer; isFreezed: Boolean);
    procedure SetRunningScenario(aScenID : Integer);
    procedure SetRunningTime(aRunTime : TDateTime);

    procedure SortElementList(aElmList : TList; aIndex: Integer);
    procedure AlertOnOff(status: Byte);

    { clear list and free item list }
    procedure ClearList(List : TList);

  public
    FFuncAllocSoundArray : array[1..12] of Boolean;
    FFuncAllocDataList : TList;

    constructor Create(aDatabase : TIPMSDatabase);
    destructor Destroy; override;

    { procedure ini dipanggil waktu load scenario instruktur }
    procedure LoadMimic(aScenarioID : Integer);

    { show mimic base on type of mimic }
    function ShowMimic(aMimicType : E_MimicType) : TfrmMimics;
    procedure ShowNextMimic;
    procedure ShowPrevMimic;
    procedure ShowNextHistory;
    procedure ShowPrevHistory;

    procedure ReturnWithNewElementID(aElementID: string);

    { form factory to produce mimic form }
    function FormFactory(aMimicType : E_MimicType) : TfrmMimics;

    { set parent form for mimic }
    procedure SetForm(aForm : TForm);

    { network event }
    procedure NetEvent_BulkElmtCommonCmd(apRec: PAnsiChar; aSize: Word);
    procedure NetEvent_ControlCommonCmd(apRec: PAnsiChar; aSize: Word);
    procedure NetEvent_InstructorCommonCmd(apRec: PAnsiChar; aSize: Word);
//    procedure NetEvent_ScenarioConditionCmd(apRec: PAnsiChar; aSize: Word);
    procedure NetEvent_FuncAllocCommand(apRec: PAnsiChar; aSize: Word);

    { note : exahust search of mimic }
    function SearchMimic(aElementID : String; SetSelected : Boolean = True) : TfrmMimics;overload;
    { search mimic form list }
    function SearchMimic(aType : E_MimicType) : TfrmMimics; overload;

    procedure AddMimicHistory(aDestPage: Integer);

    property ActiveMimic : TfrmMimics read FActiveMimic;
    property OldMimic : TfrmMimics read FOldMimic;

    property NewSelectedElementID : string read FNewSelectedElementID write FNewSelectedElementID;
    property ElementSelected : string read FSelectedElementID write SetElementSelected;
    property RoleName : string read FRoleName;
//    property GrupAlarm: string read FGrupAlarm;

    property ControlMode : Byte read FControlMode;
    property ElemStatus : Byte read FElemStatus;
    property EnbAlm : Byte read FEnbAlm;
    property ValApp : Double read FValApp;
    property Freezed : boolean read FFreezed write SetFreezed;
    property Listeners : TListeners read FListener;

    { set true jika dijalankan di instruktur }
    property AsInstructor : boolean read FAsInstructor write SetAsInstructor default False;

    { Arin Alarm }
    property ListElement : TThreadList read FElementList;
    property Running_ID : Integer read FRunningScenario;
    property ServerRunningTime : TDateTime read FServerRunningTime;

    property PairedElements : TComponentElement read FCEPairedList;

    property OnLogEvent : TGetStrProc read FOnLogEvent write SetOnLogEvent;

    property checked : Boolean read FChecked write FChecked;

  end;

implementation

uses
  uFunction,
  ufrmLogin, ufrmMain, ufrmEmptyPage, ufrmTOC, ufrmFunctionAllocation,
  ufrmNavComSystem, ufrmNetArchitect, ufrmPowerManagementOverview,
  ufrm230v115vPowerDistribution, ufrm24vDCPowerDistribution,
  ufrmUninterruptiblePS, ufrmPropultionSystemOverview, ufrmCPP, ufrmMEPS,
  ufrmMESB, ufrmMEPS_Exhaust, ufrmMESB_Exhaust, ufrmPropultionConditions,
  ufrmFireDetectionDeckBottom, ufrmFireDetectionDeckTop,
  ufrmMachinerySpaceVentSystem, ufrmFireFightingSystem, ufrmBallastSystem,
  ufrmBilgeSystem, ufrmAuxiliarySystemOverview, ufrmFuelOilSystem,
  ufrmTankOverview, ufrmSeaAndFreshWaterSystem, ufrmRunningHours,
  ufrmListOfDisabledElement, ufrmListOfParameterChanges, ufrmCommandHistory,
  ufrmAlarmHistory, ufrmAlarmPresentation, ufrmCAP, uSetting,
  ufrmAlarmSummary, ufrmAlarmSummaryAUX, ufrmAlarmSummaryBALL,
  ufrmAlarmSummaryDG, ufrmAlarmSummaryDIST, ufrmAlarmSummaryDMST,
  ufrmAlarmSummaryFFDC, ufrmAlarmSummaryFUEL, ufrmAlarmSummaryHVAC,
  ufrmAlarmSummaryIPMS, ufrmAlarmSummaryNAV, ufrmAlarmSummaryPROP,
  uMimicsSystem;

{ TMimicManager }

procedure TMimicManager.AddMimicHistory(aDestPage: Integer);
var
  i : Integer;
  found : Boolean;
begin
  found := False;

  for i := 0 to Length(A_MimicType) - 1 do
  begin
    if A_MimicType[i] = aDestPage then
    begin
      found := True;
      Break;
    end;
  end;

  if not found then
    Exit;

  Inc(FCurrentMimicIndex);

  for i := FMimicHistoryList.Count - 1 downto FCurrentMimicIndex do
    FMimicHistoryList.Delete(i);

  FMimicHistoryList.Add(IntToStr(aDestPage));
end;

procedure TMimicManager.AlertOnOff(status: Byte);
begin
  case status of
    0:
    begin
      try
        if FChecked = False then
        begin
          frmMainDisplay.mpAlarm.Open;
          frmMainDisplay.mpAlarm.AutoRewind := True;
          frmMainDisplay.mpAlarm.Play;
          frmMainDisplay.mpAlarm.Notify:= True;
        end
        else
          Exit;
      except
          on E:Exception do
            MessageDlg(E.Message,mtError,[mbOK],0);
      end;
        frmMainDisplay.silence := True;
    end;
    1:
    begin
      try
        frmMainDisplay.mpAlarm.Open;
        frmMainDisplay.mpAlarm.Stop;
      finally
      end;
      frmMainDisplay.mpAlarm.Notify := True;
      frmMainDisplay.silence := False;
    end;
  end;
end;

procedure TMimicManager.ClearList(List: TList);
var
  i: Integer;
  obj : TObject;
begin
  if not Assigned(List) then Exit;

  i := 0;

  while i <= List.Count - 1 do
  begin

    obj := List.Items[i];
    FreeAndNil(obj);

    Inc(i);
  end;

  List.Clear;

end;

constructor TMimicManager.Create(aDatabase : TIPMSDatabase);
var
  enum : E_MimicType;
  aList : TStrings;
begin
  FMimicsList := TList.Create;
  FListener   := TListeners.Create;
  FElementList := TThreadList.Create;
  FAlarmList := TList.Create;
  FFormFreeze := nil;

  FDatabase := aDatabase;

  if not FDatabase.ConnectDB then
    Application.Terminate;

  FRoleName := Setting.Role;

  FMimicHistoryList := TStringList.Create;
  FFuncAllocDataList := TList.Create;
  FTanksDataList := TList.Create;

  FFuncAllocSoundArray[11] := True;

  { create all mimic }
  for enum := mtNavCom to mtRunHours do
    FormFactory(enum);

  FCEPairedList := TComponentElement.Create;

  aDatabase.getAllElementIDs(aList);
  PairingComponentElement(aList);

  FCurrentMimicIndex := -1;
  FRunningScenario := 0;

  FRunner     := TMSTimer.Create;
  FRunner.Interval := 10; // sleep milisecond
  FRunner.OnRunning  := OnRunnerEvent;
  FRunner.Enabled := True;

  FDelayer := TDelayer.Create;
  FDelayer.DInterval := 0.5;
  FDelayer.OnTime := OnDelayedRun;
  FDelayer.Enabled := True;

  FServerNoResponse := False;
  FPingDelayer := TDelayer.Create;
  FPingDelayer.DInterval := 5;
  FPingDelayer.OnTime := OnPingDelayedRun;
  FPingDelayer.Enabled := True;
end;

destructor TMimicManager.Destroy;
var
  i : integer;
  mimics : TfrmMimics;
  l : TList;
  obj : TObject;
begin
  FCEPairedList.Free;

  ClearList(FMimicsList);

  l := FElementList.LockList;
  ClearList(l);
  FElementList.UnlockList;

  FRunner.Free;
  FElementList.Free;
  FAlarmList.Free;
  FListener.Free;
  FreeAndNil(FMimicsList);
end;

function TMimicManager.FormFactory(aMimicType : E_MimicType): TfrmMimics;
begin
  Result := SearchMimic(aMimicType);

  if not Assigned(Result) then
  begin
    case aMimicType of
      mtLogin         : Result := TfrmEmptyPage.Create(nil);
      mtTOC           : Result := TfrmTOC.Create(nil);
      mtFAlloc        : Result := TfrmFuncAllocation.Create(nil);
      mtNavCom        : Result := TfrmNavComs.Create(nil);
      mtNetArc        : Result := TfrmNetArchitect.Create(nil) ;
      mtPowerMan      : Result := TfrmPowerManagementOverview.Create(nil);
      mt230VPower     : Result := Tfrm230v115vPowerDistribution.Create(nil);
      mt24VPower      : Result := Tfrm24vDCPowerDistribution.Create(nil);
      mtUPSPower      : Result := TfrmUninterruptiblePS.Create(nil);
      mtPropulsion    : Result := TfrmPropultionSystemOverview.Create(nil);
      mtCPP           : Result := TfrmCPP.Create(nil);
      mtMEPS          : Result := TfrmMEPS.Create(nil);
      mtMESB          : Result := TfrmMESB.Create(nil);
      mtMEPSExh       : Result := TfrmMEPS_Exhaust.Create(nil);
      mtMESBExh       : Result := TfrmMESB_Exhaust.Create(nil);
      mtPropCond      : Result := TfrmPropultionConditions.Create(nil);
      mtFireDet1      : Result := TfrmFireDetectionDeckBottom.Create(nil);
      mtFireDet2      : Result := TfrmFireDetectionDeckTop.Create(nil);
      mtMachineVent   : Result := TfrmMachinerySpaceVentSystem.Create(nil);
      mtFireFS        : Result := TfrmFireFightingSystem.Create(nil);
      mtBallast       : Result := TfrmBallastSystem.Create(nil);
      mtBilge         : Result := TfrmBilgeSystem.Create(nil);
      mtAux           : Result := TfrmAuxiliarySystemOverview.Create(nil);
      mtFuel          : Result := TfrmFuelOilSystem.Create(nil);
      mtTanks         : Result := TfrmTankOverview.Create(nil);
      mtSeaWater      : Result := TfrmSeaAndFreshWaterSystem.Create(nil);
      mtRunHours      : Result := TfrmRunningHours.Create(nil);
      mtListDisElm    : Result := TfrmListOfDisabledElement.Create(nil);
      mtListParmCh    : Result := TfrmListOfParameterChanges.Create(nil);
      mtCmdHist       : Result := TfrmCommandHistory.Create(nil);
      mtDGALRM        : Result := TfrmAlarmSummaryDG.Create(nil);
      mtDISTRALRM     : Result := TfrmAlarmSummaryDIST.Create(nil);
      mtPROPALRM      : Result := TfrmAlarmSummaryPROP.Create(nil);
      mtAUXALRM       : Result := TfrmAlarmSummaryAUX.Create(nil);
      mtFUELALRM      : Result := TfrmAlarmSummaryFUEL.Create(nil);
      mtDMSTALRM      : Result := TfrmAlarmSummaryDMST.Create(nil);
      mtHVACALRM      : Result := TfrmAlarmSummaryHVAC.Create(nil);
      mtFFDCALRM      : Result := TfrmAlarmSummaryFFDC.Create(nil);
      mtNAVALRM       : Result := TfrmAlarmSummaryNAV.Create(nil);
      mtBALLALRM      : Result := TfrmAlarmSummaryBALL.Create(nil);
      mtIPMSALRM      : Result := TfrmAlarmSummaryIPMS.Create(nil);
      mtIASALRM,
      mtReserved      : Result := TfrmAlarmSummary.Create(nil);
      mtAssist        : Result := TfrmCAP.Create(nil);
      mtAlarm         : Result := TfrmAlarmPresentation.create(nil);
      mtHistory       : Result := TfrmAlarmHistory.Create(nil);
    else
      Result := nil;
    end;

    { set up view }
    if Assigned(Result) then
    begin
      Result.MimicID  := aMimicType;
      Result.Parent   := FMainForm;
      Result.Align    := alClient;
      Result.Color    := clBlack;
      Result.SetDatabase(FDatabase);
      Result.SetMouseDownPopupMenu;

      { set mimic custom event }
      SetCustomFormEvent(Result);

      { add to mimics list }
      FMimicsList.Add(Result);
    end;
  end;
end;

function TMimicManager.Interpolate(xSearch, x0, y0, x1, y1: Double): double;
begin
  result := ( ( ( xSearch - x0 ) * y1 ) + ( ( x1 - xSearch ) * y0 ) ) / ( x1 - x0 );
end;

procedure TMimicManager.LoadAlarmList(aScenario: Integer);
var
  objElm : TElementData;
  objAlm : TAlarmData;
  i : Integer;
  bfElementID, afElementID : string;
  aMimicID : E_MimicType;
  list, lAlarm : TList;
  obj : TObject;
begin
  if Assigned(FElementList) then
  begin
    list := FElementList.LockList;
    ClearList(list);
    FElementList.UnlockList;
  end;

  try
    lAlarm := TList.Create;
    FDatabase.GetAlarmByRunningID(FRunningScenario, lAlarm);

  if lAlarm.Count = 0 then
  begin
    TfrmAlarmPresentation(FormFactory(mtAlarm)).SetListAlarm(lAlarm,mtAlarm);

    TfrmAlarmSummaryDG(FormFactory(mtDGALRM)).SetAlarmList(lAlarm,mtDGALRM);
    TfrmAlarmSummaryDIST(FormFactory(mtDISTRALRM)).SetAlarmList(lAlarm,mtDISTRALRM);
    TfrmAlarmSummaryPROP(FormFactory(mtPROPALRM)).SetAlarmList(lAlarm,mtPROPALRM);
    TfrmAlarmSummaryAUX(FormFactory(mtAUXALRM)).SetAlarmList(lAlarm,mtAUXALRM);
    TfrmAlarmSummaryFUEL(FormFactory(mtFUELALRM)).SetAlarmList(lAlarm,mtFUELALRM);
    TfrmAlarmSummaryDMST(FormFactory(mtDMSTALRM)).SetAlarmList(lAlarm,mtDMSTALRM);
    TfrmAlarmSummaryHVAC(FormFactory(mtHVACALRM)).SetAlarmList(lAlarm,mtHVACALRM);
    TfrmAlarmSummaryFFDC(FormFactory(mtFFDCALRM)).SetAlarmList(lAlarm,mtFFDCALRM);
    TfrmAlarmSummaryNAV(FormFactory(mtNAVALRM)).SetAlarmList(lAlarm,mtNAVALRM);
    TfrmAlarmSummaryBALL(FormFactory(mtBALLALRM)).SetAlarmList(lAlarm,mtBALLALRM);
    TfrmAlarmSummaryIPMS(FormFactory(mtIPMSALRM)).SetAlarmList(lAlarm,mtIPMSALRM);
    TfrmAlarmSummary(FormFactory(mtIASALRM)).SetListAlarm(lAlarm,mtIASALRM);
  end;

  if lAlarm.Count > 0 then
  begin
    for i := 0 to lAlarm.Count - 1 do
    begin
      objAlm := lAlarm.Items[i];

      bfElementID := objAlm.alarm_id;

      afElementID := StringReplace(bfElementID, '.ALM.TRU', '',
                      [rfReplaceAll, rfIgnoreCase]);

      objElm := FDatabase.GetElement(afElementID);

      if (objAlm.final_state = 'G') or
         (objAlm.final_state = 'R') then
      begin
        objElm.aAck := 'N';
      end
      else
      begin
        objElm.aAck := 'Y';
      end;

      objElm.aTime := objAlm.timestamp;
      objElm.FinalState := objAlm.final_state;

      list := FElementList.LockList;

      if (objAlm.final_state = 'G') or
         (objAlm.final_state = 'A') or
         (objAlm.final_state = 'R') then
      begin
        list.Add(objElm);
      end;

      TfrmAlarmPresentation(FormFactory(mtAlarm)).SetListAlarm(list,mtAlarm);

      if objElm.AlarmgroupAbbreviation = 'DG' then
        TfrmAlarmSummaryDG(FormFactory(mtDGALRM)).SetAlarmList(list,mtDGALRM)
      else if objElm.AlarmgroupAbbreviation = 'DISTR' then
       TfrmAlarmSummaryDIST(FormFactory(mtDISTRALRM)).SetAlarmList(list,mtDISTRALRM)
      else if objElm.AlarmgroupAbbreviation = 'PROP' then
        TfrmAlarmSummaryPROP(FormFactory(mtPROPALRM)).SetAlarmList(list,mtPROPALRM)
      else if objElm.AlarmgroupAbbreviation = 'AUX' then
        TfrmAlarmSummaryAUX(FormFactory(mtAUXALRM)).SetAlarmList(list,mtAUXALRM)
      else if objElm.AlarmgroupAbbreviation = 'FUEL' then
        TfrmAlarmSummaryFUEL(FormFactory(mtFUELALRM)).SetAlarmList(list,mtFUELALRM)
      else if objElm.AlarmgroupAbbreviation = 'DMST' then
        TfrmAlarmSummaryDMST(FormFactory(mtDMSTALRM)).SetAlarmList(list,mtDMSTALRM)
      else if objElm.AlarmgroupAbbreviation = 'HVAC' then
       TfrmAlarmSummaryHVAC(FormFactory(mtHVACALRM)).SetAlarmList(list,mtHVACALRM)
      else if objElm.AlarmgroupAbbreviation = 'FFDC' then
        TfrmAlarmSummaryFFDC(FormFactory(mtFFDCALRM)).SetAlarmList(list,mtFFDCALRM)
      else if objElm.AlarmgroupAbbreviation = 'NAV' then
        TfrmAlarmSummaryNAV(FormFactory(mtNAVALRM)).SetAlarmList(list,mtNAVALRM)
      else if objElm.AlarmgroupAbbreviation = 'BALL' then
       TfrmAlarmSummaryBALL(FormFactory(mtBALLALRM)).SetAlarmList(list,mtBALLALRM)
      else if objElm.AlarmgroupAbbreviation = 'IPMS' then
       TfrmAlarmSummaryIPMS(FormFactory(mtIPMSALRM)).SetAlarmList(list,mtIPMSALRM)
      else if objElm.AlarmgroupAbbreviation = 'IAS' then
        TfrmAlarmSummary(FormFactory(mtIASALRM)).SetListAlarm(list,mtIASALRM);

      FElementList.UnlockList;
    end;
  end;
  finally
    {free object}
    for i := lAlarm.Count -1  downto 0 do
    begin
      TAlarmData(lAlarm.Items[i]).Free;
      lAlarm.Delete(i);
    end;
    lAlarm.Clear;
    lAlarm.Free;
  end;
end;

procedure TMimicManager.LoadAlarmSound(aScenario: Integer; isFreezed: Boolean);
var
  objElm : TElementData;
  objAlm : TAlarmData;
  i, checkState : Integer;
  bfElementID, afElementID : string;
  lAlarm : TList;
  role : string;
begin
  if not isFreezed then
  begin
    checkState := 0;

    role := 'MCR_'+FRoleName;

    try
      lAlarm := TList.Create;

      FDatabase.GetAlarmByRunningID(FRunningScenario, lAlarm);

      if lAlarm.Count = 0 then
      begin
        Exit;
      end;

      for i := 0 to lAlarm.Count - 1 do
      begin
        objAlm := lAlarm.Items[i];

        bfElementID := objAlm.alarm_id;

        afElementID := StringReplace(bfElementID, '.ALM.TRU', '',
                        [rfReplaceAll, rfIgnoreCase]);

        objElm := FDatabase.GetElement(afElementID);

        if (objAlm.final_state = 'G') or (objAlm.final_state = 'R') then
        begin
          Inc(checkState);
        end;

//        if role <> FRole then
//          FFuncAllocSoundArray[objElm.AlarmgroupID] := False;

        if FFuncAllocSoundArray[objElm.AlarmgroupID] then
        begin
          if checkState = 0 then
            begin
              AlertOnOff(1);
              Fchecked := False;
            end
          else
          begin

            if objAlm.final_state <> 'A' then
            begin
              AlertOnOff(0);
              FChecked := True;
            end;
          end;
        end;
      end;
    finally
      {free object}
      for i := lAlarm.Count -1  downto 0 do
      begin
        TAlarmData(lAlarm.Items[i]).Free;
        lAlarm.Delete(i);
      end;
      lAlarm.Clear;
      lAlarm.Free;
    end;
  end
  else
  begin
   AlertOnOff(1);
   Fchecked := False;
  end;
end;

procedure TMimicManager.LoadFACondition(aScenarioID: Integer);
var
  i : integer;
  faData : TFACond_Data;
  list : TList;
  mimics : TfrmMimics;
begin
  list := nil;
  FDatabase.GetRS_FACondition(aScenarioID, list);

  ClearList(FFuncAllocDataList);

  if Assigned(list) then
  begin
    for i := 0 to list.Count - 1 do
    begin
      faData := TFACond_Data(list.Items[i]);

      if faData.Role = 'MCR_' + FRoleName then
      begin
        FFuncAllocSoundArray[1] := (faData.FA_DGSETS_State = 1);
        FFuncAllocSoundArray[2] := (faData.FA_Distribution_State = 1);
        FFuncAllocSoundArray[3] := (faData.FA_Propultion_State = 1);
        FFuncAllocSoundArray[4] := (faData.FA_Auxiliary_State = 1);
        FFuncAllocSoundArray[5] := (faData.FA_Fuel_State = 1);
        FFuncAllocSoundArray[6] := (faData.FA_Domest_State = 1);
        FFuncAllocSoundArray[7] := (faData.FA_HVAC_State = 1);
        FFuncAllocSoundArray[8] := (faData.FA_FFDC_State = 1);
        FFuncAllocSoundArray[9] := (faData.FA_Navigation_State = 1);
        FFuncAllocSoundArray[10] := (faData.FA_Ballast_State = 1);
        FFuncAllocSoundArray[11] := (faData.FA_IPMS_State = 1);
        FFuncAllocSoundArray[12] := (faData.FA_IAS_State = 1);
      end;

      FFuncAllocDataList.Add(faData);
    end;
    list.Free;
  end;

  mimics := FormFactory(mtFAlloc);
  TfrmFuncAllocation(mimics).UpdateCheckState(FFuncAllocDataList);
  frmMainDisplay.AlarmGrupPanelColor(RoleName, FFuncAllocDataList);
end;

procedure TMimicManager.LoadMimic(aScenarioID: Integer);
begin
  LoadTankCondition(aScenarioID);
  LoadTankCondition2(aScenarioID);
  LoadFACondition(aScenarioID);
  LoadAlarmList(aScenarioID);
  FDatabase.LoadMimics(FCEPairedList,'RS_MimicsBlob',aScenarioID);
end;

procedure TMimicManager.LoadTankCondition(aScenarioID: Integer);
var
  i,j,k : integer;
  tankData : TTanksCond_Data;
  aTankData : TTank_Data;
  list : TList;
  mimics : TfrmMimics;
  pair : TComponentElementPair;
  item : TIPMSBaseComponent;
  maxTankvalue, TankValueInPercent,
  TankValueInMeter,tmpTankValue1,tmpTankValue2 : double;
  aCapData : TCAP_Data;
begin
  FDatabase.GetRS_TanksCondition(aScenarioID, list);

  ClearList(FTanksDataList);
  TankValueInMeter := 0;

  if Assigned(list) then
  begin
    for i := 0 to List.Count - 1 do
    begin
      tankData := TTanksCond_Data(list.Items[i]);

      pair := FCEPairedList.GetPair(tankData.Tanks_ElementID);

      for j := 0 to pair.MimicIndex.Count - 1 do
      begin
        mimics := pair.MimicIndex.Items[j];
        item := pair.ComponentList.Items[j];

        if Assigned(mimics) then
        begin

          mimics.ReceivedElementValue(tankData.Tanks_ElementID, item, C_ORD_STATEVALUEELEMENT_CHANGE,
                                        tankData.Tanks_Value);

          maxTankvalue := Fdatabase.getMaxTankValue(TankData.Tanks_ElementID);

          TankValueInPercent := (TankData.Tanks_Value / maxTankvalue) * 100;

          mimics.ReceivedElementValue(tankData.Tanks_ElementID, item, C_ORD_STATEVALUEELEMENT_CHANGE_IN_PERCENT,
                                       TankValueInPercent);

          aCapData := Fdatabase.GetCAPData(TankData.Tanks_ElementID);
          if aCapData.FTankList.Count > 0 then
          begin
            for k := 0 to aCapData.FTankList.Count - 1 do
            begin
              aTankData := TTank_Data(aCapData.FTankList.Items[k]);

              if tankData.Tanks_Value > StrToFloat(aTankData.FTrim0m) then
                Continue
              else
              begin
                if k = 0 then
                begin
                  TankValueInMeter := StrToFloat(aTankData.FSoundLength);
                  Break;
                end
                else
                begin

                  tmpTankValue1 := StrToFloat(TTank_Data(aCapData.FTankList.Items[k-1]).FSoundLength);
                  tmpTankValue2 := StrToFloat(aTankData.FSoundLength);

                  TankValueInMeter := interpolate(tankData.Tanks_Value,
                                                  StrToFloat(TTank_Data(aCapData.FTankList.Items[k-1]).FTrim0m),
                                                  tmpTankValue1,
                                                  StrToFloat(aTankData.FTrim0m),
                                                  tmpTankValue2);

                  Break;
                end;

              end;

            end;

          end
          else
           TankValueInMeter := 0;

          mimics.ReceivedElementValue(tankData.Tanks_ElementID, item, C_ORD_STATEVALUEELEMENT_CHANGE_IN_METER,
                                       TankValueInMeter);

        end;
      end;
    end;
  end;
end;

procedure TMimicManager.LoadTankCondition2(aScenarioID: Integer);
begin

end;

procedure TMimicManager.NetEvent_FuncAllocCommand(apRec: PAnsiChar;
  aSize: Word);
var
  rFAData : ^R_Common_FuncAlloc_Command;
  i : Integer;
  faData : TFACond_Data;
  mimics : TfrmMimics;
  role : string;
begin
  rFAData := @apRec^;

  FRole := rFAData.role;
  role := 'MCR_'+FRoleName;

  for i := 0 to FFuncAllocDataList.Count - 1 do
  begin
    faData := TFACond_Data(FFuncAllocDataList.Items[i]);

    if faData.Role = rFAData.role then
    begin
      if rFAData.changeAlarm1 then
      begin
        faData.FA_DGSETS_State := Ord(rFAData.changeAlarm1);

        if role = FRole then
          FFuncAllocSoundArray[1] := rFAData.changeAlarm1
        else
          FFuncAllocSoundArray[1] := not rFAData.changeAlarm1;
      end;

      if rFAData.changeAlarm2 then
      begin
        faData.FA_Distribution_State := Ord(rFAData.changeAlarm2);

        if role = FRole then
          FFuncAllocSoundArray[2]:= rFAData.changeAlarm2
        else
          FFuncAllocSoundArray[2]:= not rFAData.changeAlarm2
      end;

      if rFAData.changeAlarm3 then
      begin
        faData.FA_Propultion_State := Ord(rFAData.changeAlarm3);

        if role = FRole then
          FFuncAllocSoundArray[3]:= rFAData.changeAlarm3
        else
          FFuncAllocSoundArray[3]:= not rFAData.changeAlarm3
      end;

      if rFAData.changeAlarm4 then
      begin
        faData.FA_Auxiliary_State := Ord(rFAData.changeAlarm4);

        if role = FRole then
          FFuncAllocSoundArray[4]:= rFAData.changeAlarm4
        else
          FFuncAllocSoundArray[4]:= not rFAData.changeAlarm4
      end;

      if rFAData.changeAlarm5 then
      begin
        faData.FA_Fuel_State := Ord(rFAData.changeAlarm5);

        if role = FRole then
          FFuncAllocSoundArray[5]:= rFAData.changeAlarm5
        else
          FFuncAllocSoundArray[5]:= not rFAData.changeAlarm5
      end;

      if rFAData.changeAlarm6 then
      begin
        faData.FA_Domest_State := Ord(rFAData.changeAlarm6);

        if role = FRole then
          FFuncAllocSoundArray[6]:= rFAData.changeAlarm6
        else
          FFuncAllocSoundArray[6]:= not rFAData.changeAlarm6
      end;

      if rFAData.changeAlarm7 then
      begin
        faData.FA_HVAC_State := Ord(rFAData.changeAlarm7);

        if role = FRole then
          FFuncAllocSoundArray[7]:= rFAData.changeAlarm7
        else
          FFuncAllocSoundArray[7]:= not rFAData.changeAlarm7
      end;

      if rFAData.changeAlarm8 then
      begin
        faData.FA_FFDC_State := Ord(rFAData.changeAlarm8);

        if role = FRole then
          FFuncAllocSoundArray[8]:= rFAData.changeAlarm8
        else
          FFuncAllocSoundArray[8]:= not rFAData.changeAlarm8
      end;

      if rFAData.changeAlarm9 then
      begin
        faData.FA_Navigation_State := Ord(rFAData.changeAlarm9);

        if role = FRole then
          FFuncAllocSoundArray[9]:= rFAData.changeAlarm9
        else
          FFuncAllocSoundArray[9]:= not rFAData.changeAlarm9
      end;

      if rFAData.changeAlarm10 then
      begin
        faData.FA_Ballast_State := Ord(rFAData.changeAlarm10);

        if role = FRole then
          FFuncAllocSoundArray[10]:= rFAData.changeAlarm10
        else
          FFuncAllocSoundArray[10]:= not rFAData.changeAlarm10
      end;

      if rFAData.changeAlarm11 then
      begin
        faData.FA_IPMS_State := Ord(rFAData.changeAlarm11);

        if role = FRole then
          FFuncAllocSoundArray[11]:= rFAData.changeAlarm11
        else
          FFuncAllocSoundArray[11]:= not rFAData.changeAlarm11
      end;

      if rFAData.changeAlarm12 then
      begin
        faData.FA_IAS_State := Ord(rFAData.changeAlarm12);

        if role = FRole then
          FFuncAllocSoundArray[12]:= rFAData.changeAlarm12
        else
          FFuncAllocSoundArray[12]:= not rFAData.changeAlarm12
      end;
    end
    else
    begin
      if rFAData.changeAlarm1 then
      begin
        faData.FA_DGSETS_State := Ord(not rFAData.changeAlarm1);

      end;

      if rFAData.changeAlarm2 then
      begin
        faData.FA_Distribution_State := Ord(not rFAData.changeAlarm2);

      end;

      if rFAData.changeAlarm3 then
      begin
        faData.FA_Propultion_State := Ord(not rFAData.changeAlarm3);

      end;

      if rFAData.changeAlarm4 then
      begin
        faData.FA_Auxiliary_State := Ord(not rFAData.changeAlarm4);

      end;

      if rFAData.changeAlarm5 then
      begin
        faData.FA_Fuel_State := Ord(not rFAData.changeAlarm5);

      end;

      if rFAData.changeAlarm6 then
      begin
        faData.FA_Domest_State := Ord(not rFAData.changeAlarm6);

      end;

      if rFAData.changeAlarm7 then
      begin
        faData.FA_HVAC_State := Ord(not rFAData.changeAlarm7);

      end;

      if rFAData.changeAlarm8 then
      begin
        faData.FA_FFDC_State := Ord(not rFAData.changeAlarm8);

      end;

      if rFAData.changeAlarm9 then
      begin
        faData.FA_Navigation_State := Ord(not rFAData.changeAlarm9);

      end;

      if rFAData.changeAlarm10 then
      begin
        faData.FA_Ballast_State := Ord(not rFAData.changeAlarm10);

      end;

      if rFAData.changeAlarm11 then
      begin
        faData.FA_IPMS_State := Ord(not rFAData.changeAlarm11);

      end;

      if rFAData.changeAlarm12 then
      begin
        faData.FA_IAS_State := Ord(not rFAData.changeAlarm12);

      end;
    end;
  end;

  mimics := FormFactory(mtFAlloc);
  TfrmFuncAllocation(mimics).UpdateCheckState(FFuncAllocDataList);
  frmMainDisplay.AlarmGrupPanelColor(RoleName, FFuncAllocDataList);
end;

procedure TMimicManager.NetEvent_BulkElmtCommonCmd(apRec: PAnsiChar;
  aSize: Word);
var
  rec: ^R_Bulk_Common_Elmt_Command;
  mimic : TfrmMimics;
  i,j : integer;
  pair : TComponentElementPair;
  comp : TIPMSBaseComponent;
begin
  rec := @apRec^;

  { search lebih cepat }
  for j := 0 to C_BULK_ELEMENT_MAX - 1 do
  begin
    if rec.bunchData[j].CommandID = 0 then
      Break;

    pair := FCEPairedList.GetPair(rec.bunchData[j].ElementID);

    for i := 0 to pair.ComponentList.Count - 1 do
    begin
      mimic := pair.MimicIndex.Items[i];
      comp  := pair.ComponentList.Items[i];

      if Assigned(mimic) then
      begin

        mimic.UpdateElementData(rec.bunchData[j].ElementID,comp, rec.bunchData[j].CommandID, rec.bunchData[j].ValueByte);
        mimic.ReceivedElementValue(rec.bunchData[j].ElementID, comp, rec.bunchData[j].CommandID, rec.bunchData[j].ValueDouble);

        //if mimic is TfrmNetArchitect then
        //  TfrmNetArchitect(mimic).UpdateServerRole;
      end;
    end;
  end;

  if Assigned(OnLogEvent) then
    OnLogEvent('Bulk Update Completed..');

end;

procedure TMimicManager.NetEvent_ControlCommonCmd(apRec: PAnsiChar; aSize: Word);
var
  rec: ^R_Common_Mimic_Command;
  objElem: TElementData;
  i, unAckedCount : Integer;
  mimic : TfrmMimics;
  l : TList;
  isFound: Boolean;
  index: Integer;
  role : string;
begin
  rec := @apRec^;
  isFound := False;

  role := 'MCR_'+FRoleName;

  if rec.CommandID = C_ORD_MIMIC_ACK  then
  begin
    l := FElementList.LockList;

    for i := 0 to l.Count - 1 do
    begin
      objElem := l.Items[i];

      if (objElem.ElementID = rec.ElementID) and
         (l.Items[i] = l.Items[rec.SelectID]) then
      begin
        objElem.aAck := rec.aAck;
        isFound := True;

        if isFound then
        begin
          if objElem.FinalState = 'R' then
          begin
            OnRemoveAlarm(objElem.ElementID);
          end;
        end;

        Break;
      end;
    end;

    unAckedCount := 0;

    for i := 0 to l.Count - 1 do
    begin
      objElem := l.Items[i];

//      if role <> FRole then
//        FFuncAllocSoundArray[objElem.AlarmgroupID] := False;

      if FFuncAllocSoundArray[objElem.AlarmgroupID]  then
      begin
        if (objElem.aAck = 'N') then
          Inc(unAckedCount);
      end;
    end;

//    if role <> FRole then
//      FFuncAllocSoundArray[objElem.AlarmgroupID] := False;

    if FFuncAllocSoundArray[objElem.AlarmgroupID] then
    begin
      if unAckedCount = 0 then
      begin
        AlertOnOff(1);
        Fchecked := False;
      end
      else
      begin
        AlertOnOff(0);
        FChecked := True;

        if frmMainDisplay.StopHorn = 1 then
        begin
          AlertOnOff(1);
          Fchecked := False;
        end;
      end;
    end;

    FElementList.UnlockList;

    if isFound then
    begin
      index := rec.SelectID;
      SortElementList(FElementList.LockList, index);
      FElementList.UnlockList;
    end;

    if ActiveMimic.ClassType = TfrmAlarmSummaryDG then
    begin
      TfrmAlarmSummaryDG(ActiveMimic).SetAlarmList(FElementList.LockList, ActiveMimic.MimicID);
      FElementList.UnlockList;
    end
    else if ActiveMimic.ClassType = TfrmAlarmSummaryDIST then
    begin
      TfrmAlarmSummaryDIST(ActiveMimic).SetAlarmList(FElementList.LockList, ActiveMimic.MimicID);
      FElementList.UnlockList;
    end
    else if ActiveMimic.ClassType = TfrmAlarmSummaryPROP then
    begin
      TfrmAlarmSummaryPROP(ActiveMimic).SetAlarmList(FElementList.LockList, ActiveMimic.MimicID);
      FElementList.UnlockList;
    end
    else if ActiveMimic.ClassType = TfrmAlarmSummaryAUX then
    begin
      TfrmAlarmSummaryAUX(ActiveMimic).SetAlarmList(FElementList.LockList, ActiveMimic.MimicID);
      FElementList.UnlockList;
    end
    else if ActiveMimic.ClassType = TfrmAlarmSummaryFUEL then
    begin
      TfrmAlarmSummaryFUEL(ActiveMimic).SetAlarmList(FElementList.LockList, ActiveMimic.MimicID);
      FElementList.UnlockList;
    end
    else if ActiveMimic.ClassType = TfrmAlarmSummaryDMST then
    begin
      TfrmAlarmSummaryDMST(ActiveMimic).SetAlarmList(FElementList.LockList, ActiveMimic.MimicID);
      FElementList.UnlockList;
    end
    else if ActiveMimic.ClassType = TfrmAlarmSummaryHVAC then
    begin
      TfrmAlarmSummaryHVAC(ActiveMimic).SetAlarmList(FElementList.LockList, ActiveMimic.MimicID);
      FElementList.UnlockList;
    end
    else if ActiveMimic.ClassType = TfrmAlarmSummaryFFDC then
    begin
      TfrmAlarmSummaryFFDC(ActiveMimic).SetAlarmList(FElementList.LockList, ActiveMimic.MimicID);
      FElementList.UnlockList;
    end
    else if ActiveMimic.ClassType = TfrmAlarmSummaryNAV then
    begin
      TfrmAlarmSummaryNAV(ActiveMimic).SetAlarmList(FElementList.LockList, ActiveMimic.MimicID);
      FElementList.UnlockList;
    end
    else if ActiveMimic.ClassType = TfrmAlarmSummaryBALL then
    begin
      TfrmAlarmSummaryBALL(ActiveMimic).SetAlarmList(FElementList.LockList, ActiveMimic.MimicID);
      FElementList.UnlockList;
    end
    else if ActiveMimic.ClassType = TfrmAlarmSummaryIPMS then
    begin
      TfrmAlarmSummaryIPMS(ActiveMimic).SetAlarmList(FElementList.LockList, ActiveMimic.MimicID);
      FElementList.UnlockList;
    end
    else if ActiveMimic.ClassType = TfrmAlarmSummary then
    begin
      TfrmAlarmSummary(ActiveMimic).SetListAlarm(FElementList.LockList, ActiveMimic.MimicID);
      FElementList.UnlockList;
    end
    else if ActiveMimic.ClassType = TfrmAlarmPresentation then begin
      TfrmAlarmPresentation(ActiveMimic).SetListAlarm(FElementList.LockList, ActiveMimic.MimicID);
      FElementList.UnlockList;
    end;
  end
  else if (rec.CommandID = C_ORD_DISABLE) then
  begin
    mimic := FormFactory(mtListDisElm);
    objElem := FDatabase.GetElement(rec.ElementID);
    TfrmListOfDisabledElement(mimic).SetListElement(objElem);

    mimic := FormFactory(mtAlarm);
    TfrmAlarmPresentation(mimic).FinalState :=  rec.FinalState;
    TfrmAlarmPresentation(mimic).ElementID := rec.ElementID;
  end
  else if (rec.CommandID = C_ORD_ENABLE) then
  begin
    mimic := FormFactory(mtAlarm);
    TfrmAlarmPresentation(mimic).FinalState :=  rec.FinalState;
    TfrmAlarmPresentation(mimic).ElementID := rec.ElementID;
  end
  else if rec.CommandID = C_ORD_UPDATE_ALARM then
  begin
    LoadAlarmList(FRunningScenario);
  end
  else if rec.CommandID = C_ORD_PING then
  begin
    FServerNoResponse := False;
  end;

end;

procedure TMimicManager.NetEvent_InstructorCommonCmd(apRec: PAnsiChar;
  aSize: Word);
var
  rec: ^R_Common_Instr_Command;
  mimic : TfrmMimics;
  i : integer;
begin
  rec := @apRec^;

  case rec.CommandID of
    C_ORD_FREEZE_APP :
    begin
      Freezed := True;
      LoadAlarmSound(FRunningScenario, True);
    end;
    C_ORD_UNFREEZE_APP :
    begin
      Freezed := False;
    end;
    C_ORD_SCENARIO_CHANGE :
    begin
      SetRunningScenario(rec.ValueInt);

      { set mimic form session }
      for i := 0 to FMimicsList.Count - 1 do
      begin
        mimic := FMimicsList.Items[i];
        mimic.SetSession(rec.ValueInt);
      end;

      LoadMimic(rec.ValueInt);
    end;
    C_ORD_SYNC_SCENARIO_TIME :
    begin
      SetRunningTime(rec.ValueDbl);

    end;
  end;

end;

procedure TMimicManager.OnAlarmChange(aElemID: string; aValue: Byte);
var
  objElm: TElementData;
  i: Integer;
  l: TList;
begin
  l := FElementList.LockList;

  if (aValue = 0) or (aValue = 4) or (aValue = 30) then
  begin
    for i := 0 to l.Count - 1 do
    begin
      objElm := TElementData(l.Items[i]);

//      if role <> FRole then
//        FFuncAllocSoundArray[objElm.AlarmgroupID] := False;

      if FFuncAllocSoundArray[objElm.AlarmgroupID] then
      begin
        if (objElm.aAck = 'N') then
        begin
          AlertOnOff(0);
          FChecked := True;

          if (frmMainDisplay.StopHorn = 1) or (frmMainDisplay.IsDisEnb = 1) then
          begin
            AlertOnOff(1);
            Fchecked := False;
          end;

          Break;
        end
        else
        begin
          AlertOnOff(1);
          Fchecked := False;
        end;
      end;
    end
  end
  else
  begin
//    for i := 0 to l.Count - 1 do
//    begin
//      objElm := TElementData(l.Items[i]);

//      if role <> FRole then
//        FFuncAllocSoundArray[objElm.AlarmgroupID] := False;

      objElm := FDatabase.GetElement(aElemID);

      objElm.aAck := 'N';

      if FFuncAllocSoundArray[objElm.AlarmgroupID] then
      begin
//        if (objElm.aAck = 'N') then
//        begin
          AlertOnOff(0);
          FChecked := True;

          if FFuncAllocSoundArray[objElm.AlarmgroupID] then
              frmMainDisplay.StopHorn := 0;

          if (frmMainDisplay.StopHorn = 1) or (frmMainDisplay.IsDisEnb = 1) then
          begin
            AlertOnOff(1);
            Fchecked := False;
          end;

//          Break;
//        end;
      end;
//    end;
  end;

//  objElm.Free;
end;

procedure TMimicManager.OnStatusControlIns(aMimicID, aStatus: byte; aElementID : string);
begin
  frmMainDisplay.ChangeStatusControlIns(aMimicID, aStatus, aElementID);
end;

procedure TMimicManager.OnAlarmSoundChange(aIndex: Byte; aEnabled: Boolean);
begin
  FFuncAllocSoundArray[aIndex] := aEnabled;
end;

procedure TMimicManager.OnDelayedRun(Sender: TObject);
var
  temp: TDateTime;
  i,j : Integer;
  objAlm : TAlarmData;
  objElm : TElementData;
  day, hr, mn, sc : Word;
  tempScnd : Integer;
  l: TList;
  bfElementID, afElementID: string;
begin
//  day := 0;
//  hr := 0;
//  mn := 0;
//  sc := 0;

  FDatabase.GetAlarmByRunningID(FRunningScenario, FAlarmList);

  if FAlarmList.Count > 0 then
  begin
    l := FElementList.LockList;

    for i := 0 to FAlarmList.Count - 1 do
    begin
      objAlm := FAlarmList.Items[i];

      bfElementID := objAlm.alarm_id;

      afElementID := StringReplace(bfElementID, '.ALM.TRU', '',
                      [rfReplaceAll, rfIgnoreCase]);

      FDatabase.GetGenerateTime(FRunningScenario, objAlm.alarm_id,
        temp);

      for j := 0 to l.Count - 1 do
      begin
        objElm := l.Items[j];

        if afElementID = objElm.ElementID then
        begin
          if objAlm.final_state <> 'A' then
          begin
            day := DaysBetween(temp, FServerRunningTime);
            hr := HoursBetween(FServerRunningTime,temp) mod 24;
            mn := MinutesBetween(temp, FServerRunningTime) mod 60;
            sc  := SecondsBetween(temp, FServerRunningTime) mod 60;

            tempScnd := (((day*24)*3600) + (hr*3600) + (mn*60));

            objElm.aDuration := (tempScnd + sc)/3600;
          end;
        end;
      end;
    end;

    FElementList.UnlockList;
  end;
end;

procedure TMimicManager.OnDisableAlarm(aElementID: string);
var
  objElm : TElementData;
  i : Integer;
  l : TList;
begin
  l := FElementList.LockList;

  for i := 0 to l.Count - 1 do
  begin
    objElm := l.Items[i];

    if objElm.ElementID = aElementID then
    begin
       objElm.FinalState := 'D';
    end;
  end;

  FElementList.UnlockList;
end;

procedure TMimicManager.OnListAlarm(aElement: string; aValue: Byte);
begin
  FSelectedElementID := aElement;

  // ryu : move to controller

//  frmMainDisplay.StopHorn := 0;
end;

procedure TMimicManager.OnMimicsShowCIPData(aElementID: string; aControlMode: Byte;
  aElemStatus: Byte; aEnbAlmInhibited: Byte; aValApp: Double);
var
  objElm : TElementData;
  objCIP : TCIPInfo;
begin
  FSelectedElementID := aElementID;

  objElm := FDatabase.GetElement(FSelectedElementID);
  objCIP := nil;

  if Assigned(objElm) then
  begin
    if (objElm.Elementtype_IDfk = 'CBE') then
    begin
      if (objElm.ElementID = '3241E50014F') or
         (objElm.ElementID = '3241E50013F') or
         (objElm.ElementID = '3241E50023F') or
         (objElm.ElementID = '3241E50024F')then
      begin
        objCIP := FDatabase.GetCIP_INFO(objElm.Elementtype_IDfk + '1');
      end
      else
      begin
        objCIP := FDatabase.GetCIP_INFO(objElm.Elementtype_IDfk + '2');
      end
    end
    else if (objElm.Elementtype_IDfk = 'MCE') then
    begin
      if (objElm.ElementID = '5131A1004A') or
         (objElm.ElementID = '5131A1002A') or
         (objElm.ElementID = '5551A0002A') or
         (objElm.ElementID = '5551A0001A') or
         (objElm.ElementID = '5551A0003A') or
         (objElm.ElementID = '5131A1014A')then
      begin
        objCIP := FDatabase.GetCIP_INFO(objElm.Elementtype_IDfk + '3');
      end
      else
      begin
        objCIP := FDatabase.GetCIP_INFO(objElm.Elementtype_IDfk + '2');
      end;
    end
    else if (objElm.Elementtype_IDfk = 'MCD') then
    begin
      if (objElm.ElementID = '5131A1003A') or
         (objElm.ElementID = '5131A1001A') or
         (objElm.ElementID = '5131A1013A')then
      begin
        objCIP := FDatabase.GetCIP_INFO(objElm.Elementtype_IDfk + '3');
      end
      else if (objElm.ElementID = '5131A1006A') or
          (objElm.ElementID = '5131A1005A')then
      begin
        objCIP := FDatabase.GetCIP_INFO(objElm.Elementtype_IDfk + '4');
      end;
    end
    else if (objElm.Elementtype_IDfk = 'VCE') then
    begin
      if (objElm.ElementID = '5551M0089A') or
         (objElm.ElementID = '5551M0042A') or
         (objElm.ElementID = '5551M0043A') or
         (objElm.ElementID = '5551M0065A') or
         (objElm.ElementID = '5551M0123A') or
         (objElm.ElementID = '5551M0046A')then
      begin
        objCIP := FDatabase.GetCIP_INFO(objElm.Elementtype_IDfk + '3');
      end
      else
      begin
        objCIP := FDatabase.GetCIP_INFO(objElm.Elementtype_IDfk + '2');
      end;
    end
    else
    begin
      objCIP := FDatabase.GetCIP_INFO(objElm.Elementtype_IDfk + '1');
    end;

    FControlMode := aControlMode;
    FElemStatus  := aElemStatus;
    FEnbAlm      := aEnbAlmInhibited;
    FValApp      := aValApp;
  end;

  frmMainDisplay.UpdateCIPInfo(objElm, objCIP, FControlMode, FElemStatus, FEnbAlm, FValApp);
  frmMainDisplay.UpdateCIPButton(objCIP, msMimic);
  frmMainDisplay.AuthorizeCIPButton(objElm, msMimic);

  objElm.Free;
  objCIP.Free;
end;

procedure TMimicManager.OnMimicTOCCommand(Sender: TObject;
  MimicType: E_MimicType);
begin
  AddMimicHistory(Ord(MimicType));

  ShowMimic(MimicType);
end;

procedure TMimicManager.OnPingDelayedRun(Sender: TObject);
var
  recMimic : R_Common_Mimic_Command;
begin

  if not SysMimics.Network.ControllerSocket.Connected then
    Exit;

  // jika server g respone maka reconnect
  if FServerNoResponse then
  begin
    FServerNoResponse := False;
    SysMimics.Network.ControllerSocket.Disconnect; // then auto reconnect
  end
  else
  begin
    FServerNoResponse := True;
    recMimic.CommandID := C_ORD_PING;
    recMimic.ElementID := '';
    recMimic.ElementName := '';
    recMimic.FinalState := '';
    SysMimics.Network.ControllerSocket.SendData(C_MIMICS_COMMAND, @recMimic);
  end;

end;

procedure TMimicManager.OnRemoveAlarm(aElementID: string);
var
  objElm : TElementData;
  i : Integer;
  aMimicID : E_MimicType;
  l : TList;
begin
  l := FElementList.LockList;
  for i := 0 to l.Count - 1 do
  begin

    objElm := l.Items[i];

//    FDatabase.GetMaxSeqNumber(FSeqNumber);
//    FSeqNumber := FSeqNumber + 1;

    if (objElm.ElementID = aElementID) and (objElm.aAck = 'Y') then
    begin
      if FAsInstructor then
      begin
      // ryu : dipindah ke controller
//        { save alarm -> Running ID to RS_ALARM_LOG table ->
//          state (prev: Ack, action: Reset, final: Delete) }
//        FDatabase.SaveAlarm(FRunningScenario,FServerRunningTime, FSeqNumber,
//          objElm.ElementID+'.ALM.TRU', IntToStr(objElm.AlarmgroupID), 'ALARM',
//          'MCR_Instructor', objElm.ElementID+'.ALM.TRU','A','R','D',
//          IntToStr(objElm.MainMimic_IDfk)+' '+objElm.AlarmgroupAbbreviation+
//          ' '+objElm.ElementID+' '+objElm.Elementname+' '+objElm.Text_0,
//          FServerRunningTime);
      end;

      l.Delete(i);

      TfrmAlarmPresentation(FormFactory(mtAlarm)).SetListAlarm(l,mtAlarm);

      if objElm.AlarmgroupAbbreviation = 'DG' then
        TfrmAlarmSummaryDG(FormFactory(mtDGALRM)).SetAlarmList(l,mtDGALRM)
      else if objElm.AlarmgroupAbbreviation = 'DISTR' then
       TfrmAlarmSummaryDIST(FormFactory(mtDISTRALRM)).SetAlarmList(l,mtDISTRALRM)
      else if objElm.AlarmgroupAbbreviation = 'PROP' then
        TfrmAlarmSummaryPROP(FormFactory(mtPROPALRM)).SetAlarmList(l,mtPROPALRM)
      else if objElm.AlarmgroupAbbreviation = 'AUX' then
        TfrmAlarmSummaryAUX(FormFactory(mtAUXALRM)).SetAlarmList(l,mtAUXALRM)
      else if objElm.AlarmgroupAbbreviation = 'FUEL' then
        TfrmAlarmSummaryFUEL(FormFactory(mtFUELALRM)).SetAlarmList(l,mtFUELALRM)
      else if objElm.AlarmgroupAbbreviation = 'DMST' then
        TfrmAlarmSummaryDMST(FormFactory(mtDMSTALRM)).SetAlarmList(l,mtDMSTALRM)
      else if objElm.AlarmgroupAbbreviation = 'HVAC' then
       TfrmAlarmSummaryHVAC(FormFactory(mtHVACALRM)).SetAlarmList(l,mtHVACALRM)
      else if objElm.AlarmgroupAbbreviation = 'FFDC' then
        TfrmAlarmSummaryFFDC(FormFactory(mtFFDCALRM)).SetAlarmList(l,mtFFDCALRM)
      else if objElm.AlarmgroupAbbreviation = 'NAV' then
        TfrmAlarmSummaryNAV(FormFactory(mtNAVALRM)).SetAlarmList(l,mtNAVALRM)
      else if objElm.AlarmgroupAbbreviation = 'BALL' then
       TfrmAlarmSummaryBALL(FormFactory(mtBALLALRM)).SetAlarmList(l,mtBALLALRM)
      else if objElm.AlarmgroupAbbreviation = 'IPMS' then
       TfrmAlarmSummaryIPMS(FormFactory(mtIPMSALRM)).SetAlarmList(l,mtIPMSALRM)
      else if objElm.AlarmgroupAbbreviation = 'IAS' then
        TfrmAlarmSummary(FormFactory(mtIASALRM)).SetListAlarm(l,mtIASALRM);

      Break;
    end;

    if (objElm.ElementID = aElementID) and (objElm.aAck = 'N') then
    begin
      objElm.FinalState := 'R';

      if FAsInstructor then
      begin
      // ryu : dipindah ke controller
//        { save alarm -> Running ID to RS_ALARM_LOG table ->
//            state (prev: Generate, action: Reset, final: Reset) }
//        FDatabase.SaveAlarm(FRunningScenario, FServerRunningTime, FSeqNumber,
//          objElm.ElementID+'.ALM.TRU',IntToStr(objElm.AlarmgroupID),
//          'ALARM','MCR_Instructor',objElm.ElementID+'.ALM.TRU','G','R','R',
//          IntToStr(objElm.MainMimic_IDfk)+' '+
//          objElm.AlarmgroupAbbreviation+' '+objElm.ElementID+' '+
//          objElm.Elementname+' '+objElm.Text_0,
//          FServerRunningTime);
      end;

      Break;
    end;
  end;

  FElementList.UnlockList;
end;

procedure TMimicManager.OnRunnerEvent(const aDt: Double);
begin

  if FRunningScenario = 0 then
    Exit;

  FDelayer.Run(aDt);
  FPingDelayer.Run(aDt);

end;

procedure TMimicManager.OnShortcutClick(aPage: Byte);
begin
  AddMimicHistory(aPage);

  ShowMimic(E_MimicType(aPage));
end;

procedure TMimicManager.PairingComponentElement(aList: TStrings);
var
  i,j,k,l,m : Integer;
  mimic : TfrmMimics;
  pair : TComponentElementPair;
begin
  for i := 0 to aList.Count - 1 do
  begin
    m := 1;
    pair := TComponentElementPair.Create;
    pair.ElementID := aList[i];
    pair.ComponentList := TList.Create;
    pair.MimicIndex := TList.Create;

    for j := 0 to FMimicsList.Count - 1 do
    begin
      mimic := FMimicsList.Items[j];

      if Byte(mimic.MimicID) > 100 then
        continue;

      k := mimic.GetElements(aList[i],pair.ComponentList);
      if k > 0 then
      begin
        for l := 0 to k - 1 do
        begin
          SetLength(pair.MimicType,m);
          pair.MimicIndex.Add(mimic);
          pair.MimicType[m-1] := mimic.MimicID;
          Inc(m);
        end;
      end;

    end;

    FCEPairedList.AddPair(pair);
  end;
end;

procedure TMimicManager.ReturnWithNewElementID(aElementID: string);
var
  elementData : TElementData;
  mimic : TfrmMimics;
  i : Integer;
  c : TComponent;
begin
  FSelectedElementID := aElementID;

  elementData := FDatabase.GetElement(FSelectedElementID);

  if not Assigned(elementData) then
    Exit;

  FMimicHistoryList.Clear;
  FCurrentMimicIndex := -1;

  AddMimicHistory(elementData.MainMimic_IDfk);
  mimic := ShowMimic(E_MimicType(elementData.MainMimic_IDfk));

  for i := 0 to mimic.ComponentCount - 1 do
  begin
    c := mimic.Components[i];

    if c is TIPMSBaseComponent then
    begin
      if TIPMSBaseComponent(c).ElementID = FSelectedElementID then
        TIPMSBaseComponent(c).Clicked := True
      else
        TIPMSBaseComponent(c).Clicked := False;
    end;
  end;
end;

//procedure TMimicManager.SaveMimic(aScenarioID : integer;aSnapshot : Boolean = True);
//begin
//  if aSnapshot then // create as new scenario
//    FDatabase.SaveMimics(FCEPairedList,'MimicsBlob',aScenarioID)
//  else // save to running scenario
//    FDatabase.SaveMimics(FCEPairedList,'RS_MimicsBlob',aScenarioID)
//end;

function TMimicManager.SearchMimic(aType: E_MimicType): TfrmMimics;
var
  mimic : TfrmMimics;
  i : integer;
  found : Boolean;
begin
  Result := nil;

  for i := 0 to FMimicsList.Count - 1 do
  begin
    mimic := FMimicsList.Items[i];

    found := mimic.MimicID = aType;

    if found then
    begin
      Result := mimic;
      Break;
    end;
  end;
end;

procedure TMimicManager.SetAsInstructor(const Value: boolean);
begin
  FAsInstructor := Value;
end;

procedure TMimicManager.SetCustomFormEvent(Sender: TObject);
begin
  { custom event for ALL mimic }
  TfrmMimics(Sender).OnMimicsShowCIPData := OnMimicsShowCIPData;
  TfrmMimics(Sender).OnShortcutClick := OnShortcutClick;
  TfrmMimics(sender).OnAlarmChange := OnAlarmChange;
  TfrmMimics(sender).OnListAlarm := OnListAlarm;
  TfrmMimics(Sender).OnRemoveAlarm := OnRemoveAlarm;
  TfrmMimics(Sender).OnDisableAlarm := OnDisableAlarm;
  TfrmMimics(sender).OnStatusControlIns := OnStatusControlIns;

  { custom event for TOC mimic }
  if Sender is TfrmTOC then
  begin
    TfrmTOC(Sender).OnMimicTOCCommand := OnMimicTOCCommand;
  end;
  
  { custom event for FuncAllocation mimic }
  if Sender is TfrmFuncAllocation then
    TfrmFuncAllocation(Sender).OnAlarmSoundChange := OnAlarmSoundChange;
end;

procedure TMimicManager.SetElementSelected(aElementID: string);
begin
  FSelectedElementID := aElementID;
end;

procedure TMimicManager.SetForm(aForm: TForm);
begin
  FMainForm := aForm;
end;

procedure TMimicManager.SetFreezed(const Value: boolean);
begin
  FFreezed := Value;

  if FFreezed then
  begin
  begin
    frmMainDisplay.Enabled := False;

    if Assigned(FFormFreeze) then Exit;

    FFormFreeze := TfrmFreeze.Create(frmMainDisplay);
    with FFormFreeze do begin

      Parent := frmMainDisplay;
      Left := Round(frmMainDisplay.Left + (frmMainDisplay.Width / 2) - (Width / 2));
      Top  := Round(frmMainDisplay.Top + (frmMainDisplay.Height / 2) - (Height / 2));
      BringToFront;
      Show;

    end;
  end;
  end else
  begin
    frmMainDisplay.Enabled := True;

    if Assigned(FFormFreeze) then
      FreeAndNil(FFormFreeze);
  end;
end;

procedure TMimicManager.SetOnLogEvent(const Value: TGetStrProc);
begin
  FOnLogEvent := Value;
end;

procedure TMimicManager.SetRunningScenario(aScenID: Integer);
begin
  FRunningScenario := aScenID;
end;

procedure TMimicManager.SetRunningTime(aRunTime: TDateTime);
var
  mimic : TfrmMimics;
  i : integer;
begin
  FServerRunningTime := aRunTime;
  frmMainDisplay.SetServerTime(aRunTime);

  for i := 0 to FMimicsList.Count - 1 do
  begin
    mimic := FMimicsList.Items[i];
    mimic.SetServerTime(aRunTime);
  end;
end;

function TMimicManager.ShowMimic(aMimicType: E_MimicType) : TfrmMimics;
//var
//  obj : TObject;
begin
  Result := nil;

  if not UserPriviledge(aMimicType) then
  begin
    MessageDlg('You don''t have access to application!!', mtError, [mbOK], 0);
    Exit;
  end;

  if FActiveMimic = FormFactory(aMimicType) then
    Exit;

  FOldMimic := FActiveMimic;

  if Assigned(OldMimic) then
    FOldMimic.Hide;

  FActiveMimic := FormFactory(aMimicType);

  if Assigned(FActiveMimic) then
  begin
    if not Assigned(frmMainDisplay)  then
      Exit;

    FActiveMimic.Parent := frmMainDisplay.pnlMimic;

    FActiveMimic.Show;

    case aMimicType of
      mtLogin:
      begin
        FActiveMimic.ShowTitle := False;

        { TODO : Periksa mekanisme tampilan login ini. }
        if Assigned(frmLogin) then
          frmLogin.Show;
      end;
      mtNetArc: TfrmNetArchitect(FActiveMimic).UpdateServerRole;
      mtListParmCh:
      begin
        frmMainDisplay.UpdateCIPButton(nil, msParameter);
        frmMainDisplay.AuthorizeCIPButton(nil, msParameter);
      end;
      mtCmdHist:
      begin
        frmMainDisplay.UpdateCIPButton(nil, msCommand);
        frmMainDisplay.AuthorizeCIPButton(nil, msCommand);
      end;
      mtHistory:
      begin
        frmMainDisplay.UpdateCIPInfo(nil, nil, 0, 0, 0, 0);
        frmMainDisplay.UpdateCIPButton(nil, msHistory);
      end;
      mtAssist:
      begin
        FActiveMimic.pnlTitle.BringToFront;
      end;
      mtListDisElm :
      begin
        TfrmListOfDisabledElement(FActiveMimic).pnl1.Visible := True;
        TfrmListOfDisabledElement(FActiveMimic).tmr1.Enabled := True;
        TfrmListOfDisabledElement(FActiveMimic).tmr1.Interval := 10;
        TfrmListOfDisabledElement(FActiveMimic).ProgressBar1.Position := 0;

        TfrmListOfDisabledElement(FActiveMimic).ShowListElement;
      end;
    else
      begin
        frmMainDisplay.UpdateCIPInfo(nil, nil, 0, 0, 0, 0);
        frmMainDisplay.UpdateCIPButton(nil, msMimic);
      end;
    end;

    if MimicNumber(aMimicType) = '' then
      FActiveMimic.SetTitle(MimicTitle(aMimicType))
    else
      FActiveMimic.SetTitle(MimicNumber(aMimicType) + ' - ' + MimicTitle(aMimicType));
  end
  else
  begin
    if Assigned(OldMimic) then
      OldMimic.Show;

    FActiveMimic := OldMimic;

    MessageDlg('Mimics not found!!', mtError, [mbOK], 0);
  end;

  Result := FActiveMimic;
end;

procedure TMimicManager.ShowNextHistory;
var
  mimicID : Integer;
  found : Boolean;
begin
  found := False;
  mimicID := 1;
  if not (FCurrentMimicIndex + 1 >= FMimicHistoryList.Count) then
  begin
    FCurrentMimicIndex := FCurrentMimicIndex + 1;
    mimicID := StrToInt(FMimicHistoryList[FCurrentMimicIndex]);
    found := True;
  end;

  if found then
    ShowMimic(E_MimicType(mimicID))
  else
    MessageDlg('No next screen available', mtWarning, [mbOK], 0);
end;

procedure TMimicManager.ShowNextMimic;
var
  i : Integer;
begin
  if FActiveMimic.MimicID = mtCmdHist then
    Exit;

  for i := 0 to Length(A_MimicType) - 1 do
  begin
    if A_MimicType[i] = Ord(FActiveMimic.MimicID) then
    begin
      AddMimicHistory(A_MimicType[i + 1]);
      ShowMimic(E_MimicType(A_MimicType[i + 1]));
      Break;
    end;
  end;
end;

procedure TMimicManager.ShowPrevHistory;
var
  mimicID : Integer;
  found : Boolean;
begin
  found := False;
  mimicID := 1;
  if FActiveMimic.MimicID = mtAssist then
  begin
    mimicID := StrToInt(FMimicHistoryList[FCurrentMimicIndex]);
    found := True;
  end
  else if not (FCurrentMimicIndex - 1 < 0) then
  begin
    FCurrentMimicIndex := FCurrentMimicIndex - 1;
    mimicID := StrToInt(FMimicHistoryList[FCurrentMimicIndex]);
    found := True;
  end;

  if found then
    ShowMimic(E_MimicType(mimicID))
  else
    MessageDlg('No prev screen available', mtWarning, [mbOK], 0);
end;

procedure TMimicManager.ShowPrevMimic;
var
  i : Integer;
begin
  if FActiveMimic.MimicID = mtLogin then
    Exit;

  for i := 0 to Length(A_MimicType) - 1 do
  begin
    if A_MimicType[i] = Ord(FActiveMimic.MimicID) then
    begin
      AddMimicHistory(A_MimicType[i - 1]);
      ShowMimic(E_MimicType(A_MimicType[i - 1]));
      Break;
    end;
  end;
end;

procedure TMimicManager.SortElementList(aElmList: Tlist; aIndex: Integer);
var
  i : Integer;
  objElm : TElementData;
//  li : TListItem;
begin
  if aElmList.Count > 0 then
  begin
    for i := 0 to aElmList.Count - 1 do
    begin
      if i = aIndex then
      begin
        objElm := aElmList.Items[i];

        if objElm.aAck = 'Y' then
        begin
          aElmList.Move(i, ((aElmList.Count)-1));
//          TfrmAlarmPresentation(FormFactory(mtAlarm)).ChangeColor := True;
//          TfrmAlarmPresentation(FormFactory(mtAlarm)).lvAlarmPresentation.Items[i].Selected := True;
//          TfrmAlarmPresentation(FormFactory(mtAlarm)).lvAlarmPresentation.Items[i].Focused := True;

          Break;
        end;
      end;
    end;
  end;

  TfrmAlarmPresentation(FormFactory(mtAlarm)).SetListAlarm(aElmList, mtAlarm);
end;

function TMimicManager.UserPriviledge(aMimicType: E_MimicType): Boolean;
begin
  Result := True;
end;

function TMimicManager.SearchMimic(aElementID: String;SetSelected : Boolean = True): TfrmMimics;
var
  mimic : TfrmMimics;
  comp : TIPMSBaseComponent;
  i : integer;
begin
  result := nil;
  for i := 0 to FMimicsList.Count - 1 do
  begin
    mimic := FMimicsList.Items[i];

    if Byte(mimic.MimicID) > 100 then
      continue;

    if mimic.ElementExist(aElementID) then
    begin
      result := mimic;

      if SetSelected then begin
        comp := mimic.GetElement(aElementID);
        mimic.SetCIPData(comp);
      end;

      Break;
    end;

  end;
end;



end.
