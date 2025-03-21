unit uInstructorPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, TFlatSpeedButtonUnit,
  uDatabase, uScenario, Mask, Buttons, uDataType, uFunction, DateUtils, Menus,
  ShellAPI, Vcl.Imaging.pngimage, VrControls, VrLcd;

type
    TfrmInstructorPanel = class(TForm)
    pnlMain: TPanel;
    pnlMainContent: TPanel;
    pnlHeaderContent: TPanel;
    lblTitle: TLabel;
    btnDocked: TFlatSpeedButton;
    tmrTelegrap: TTimer;
    pnlSparatorHeader: TPanel;
    mm1: TMainMenu;
    mniHelp1: TMenuItem;
    mniManualIPMS1: TMenuItem;
    mniOperationalInstruktur1: TMenuItem;
    mniOperationalACS1: TMenuItem;
    mniOperationalVOIP1: TMenuItem;
    mniModulPCS1: TMenuItem;
    mniKatalogHardwareIPMS1: TMenuItem;
    mniMaintenanceIPMS1: TMenuItem;
    pnlHeader: TPanel;
    pnlSparatorLeft: TPanel;
    Image1: TImage;
    pnlLeft: TPanel;
    ctgrypnlgrpbtnrg1: TCategoryPanelGroup;
    ctgrypnlACS: TCategoryPanel;
    btnACSControl: TFlatSpeedButton;
    ctgrypnlAuxilary: TCategoryPanel;
    btnTanksOverview: TFlatSpeedButton;
    btnBilgeSystem: TFlatSpeedButton;
    btnAuxSystemOverview: TFlatSpeedButton;
    btnFuelOil: TFlatSpeedButton;
    btnBallastPanel: TFlatSpeedButton;
    btn1: TFlatSpeedButton;
    ctgrypnlPropCondition: TCategoryPanel;
    btnRudder1: TFlatSpeedButton;
    btnLocalControl: TFlatSpeedButton;
    ctgrypnlPCSConditions: TCategoryPanel;
    btnPCSConditions: TFlatSpeedButton;
    btnPMS: TFlatSpeedButton;
    ctgrypnlSafety: TCategoryPanel;
    btnFF: TFlatSpeedButton;
    btnVent: TFlatSpeedButton;
    btnFFSystem: TFlatSpeedButton;
    btnAlarmRudder: TFlatSpeedButton;
    ctgrypnlGeneral: TCategoryPanel;
    btnNav_ComSystem: TFlatSpeedButton;
    btnNetArc1: TFlatSpeedButton;
    btnElemntModif: TFlatSpeedButton;
    btnMimic: TFlatSpeedButton;
    btnPropBridge: TFlatSpeedButton;
    ctgrypnlScenario: TCategoryPanel;
    btnScenBuilder: TFlatSpeedButton;
    btnScenLoader: TFlatSpeedButton;
    btnPMSEditor: TFlatSpeedButton;
    btnPCSEditor: TFlatSpeedButton;
    btnFAEditor: TFlatSpeedButton;
    btnTanksEditor: TFlatSpeedButton;
    btnClientApp: TFlatSpeedButton;
    Panel2: TPanel;
    pnlContent: TPanel;
    pnlBottom: TPanel;
    Image2: TImage;
    Panel1: TPanel;
    btnStartSim: TFlatSpeedButton;
    btnPauseSim: TFlatSpeedButton;
    btnStop: TFlatSpeedButton;
    pnlSparatorFooter: TPanel;
    VrClock1: TVrClock;
    Panel5: TPanel;
    lblSimState: TLabel;
    lblScenarioRun: TLabel;
    lblSimTime: TLabel;
    Label1: TLabel;
    ctgrypnlHelp: TCategoryPanel;
    btnHardwareCatalogue: TFlatSpeedButton;
    btnManualBook: TFlatSpeedButton;
    ctgrypnlExit: TCategoryPanel;
    btnClose: TFlatSpeedButton;
    tmr1: TTimer;
    Panel3: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure btnDockedClick(Sender: TObject);
    procedure btnPMSClick(Sender: TObject);
    procedure btnStartSimClick(Sender: TObject);
    procedure btnPauseSimClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure OnCategoryBtnClick(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure tmrTelegrapTimer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure scrlbxContentClick(Sender: TObject);
    procedure mniManualIPMS1Click(Sender: TObject);
  private
    { Private declarations }
    FDockedForm : TForm;

    procedure SaveRunningScenario;
    procedure DockForm(aForm: TForm);
    procedure FormOnClose(Sender: TObject; var Action: TCloseAction);
    procedure FormFactory(aFormType: E_FormType; aDocked: Boolean = False);
    procedure OnPropByteChange(Sender: TObject; Props: E_PropsID; Value: Byte);
    procedure OnPropStrChange(Sender: TObject; Props: E_PropsID; Value: string);
    procedure OnGotoELement(const Value: string);
    {gak yakin}
//    procedure OnTelegramChange(Sender : Tobject; Props :E_PropsID; Value : Integer);
  public
    {Prince}
    TelegrapTimerFlag : Boolean;
    tempTimeSim : TDateTime;
    { Public declarations }
  end;

E_ManualIPMS = (ManualIPMS = 1, OperationalInstruktur, OperationalACS,
  OperationalVOIP, ModulPCS, CatalogHardware, MaintenanceIPMS);

var
  frmInstructorPanel: TfrmInstructorPanel;

implementation

uses
  uScenBuilder, uScenLoader, uElementTesterForm, uPMSSystemPanel, uPMSEditor,
  uMimicPanel, uNetArchitectur, uPCSPanelBridge, uDataLogger, uInstructorSystem,
  uNetworkStatus, uListener, uPCSLocalControlPanel, uMimicsSystem, ufrmMimics,
  uPCSEditor, uDBSupportClasses, uControllerSystem, uERSystem, uProgress,
  uClientControl, uAlarmRudder, uTelegram, uFAEditor, uRudderIndicator,
  uFireFighting, uNav_CommSystem, uTankOverview, uBilgeSystemIns,
  uAuxSystemOverview, uTanksEditor, uPowerManagementSys, uVentSystem,
  uFireFightingControlSystem, uACSControl, uPropulsionConditionsSet, uSetting,
  uTankSystemPanel, uFuelOilPanel, uBallastPanel, uFreshWaterPanel;

{$R *.dfm}

procedure TfrmInstructorPanel.btnDockedClick(Sender: TObject);
begin
  if Assigned(FDockedForm) then
  begin
    FDockedForm.Hide;
    FDockedForm.Parent := nil;
    FDockedForm.BorderStyle := bsToolWindow;
    FDockedForm.Position := poMainFormCenter;
    FDockedForm.Show;
    FDockedForm := nil;
  end;
end;

procedure TfrmInstructorPanel.btnPauseSimClick(Sender: TObject);
begin
  if InstructorSys.Scenario.RunState = esrRun then
    InstructorSys.Scenario.RunState := esrPause;
end;

procedure TfrmInstructorPanel.btnPMSClick(Sender: TObject);
begin
  if not Assigned(frmPMSSystemPanel) then
    frmPMSSystemPanel := TfrmPMSSystemPanel.Create(Self);

  DockForm(frmPMSSystemPanel);
end;

procedure TfrmInstructorPanel.btnStartSimClick(Sender: TObject);
begin
  if (InstructorSys.Scenario.RunState = esrStop) or
    (InstructorSys.Scenario.RunState = esrPause) then
    InstructorSys.Scenario.RunState := esrRun;
end;

procedure TfrmInstructorPanel.btnStopClick(Sender: TObject);
begin
  if (InstructorSys.Scenario.RunState = esrRun) or
     (InstructorSys.Scenario.RunState = esrPause) then
    InstructorSys.Scenario.RunState := esrStop;
end;

procedure TfrmInstructorPanel.DockForm(aForm: TForm);
begin
  if Assigned(FDockedForm) and (FDockedForm <> aForm) then
    FDockedForm.Hide;

  FDockedForm := aForm;

  with FDockedForm do
  begin
    Hide;
    Left := 0;
    Top := 0;
    Position := poDefault;
    BorderStyle := bsNone;
    ParentColor := True;
    Parent := pnlContent;//scrlbxContent;
    lblTitle.Caption := Caption;
    OnClose := FormOnClose;
    Show;
  end;
end;

procedure TfrmInstructorPanel.FormOnClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caHide;
end;


procedure TfrmInstructorPanel.mniManualIPMS1Click(Sender: TObject);
var
  readPath  : string;
begin
  case E_ManualIPMS(TMainMenu(sender).Tag) of
    ManualIPMS: readPath := Setting.ManualIPMS;
    OperationalInstruktur: readPath := Setting.OperationalInstruktur;
    OperationalACS: readPath := Setting.OperationalACS;
    OperationalVOIP: readPath := Setting.OperationalVoip;
    ModulPCS: readPath := Setting.ModulPCS;
    CatalogHardware: readPath := Setting.CatalogHardware;
    MaintenanceIPMS: readPath := Setting.MaintenanceIPMS;
  end;

  ShellExecute(Handle, 'open', PChar('.\help\' + readPath), '', '', 1);
end;

procedure TfrmInstructorPanel.OnCategoryBtnClick(Sender: TObject);
begin
  FormFactory(E_FormType(TComponent(Sender).Tag),True);

  case E_FormType(TComponent(Sender).Tag) of
    ftFFS:
    begin
      SysMimics.Mimic.ShowMimic(mtFireDet1);
      SysMimics.Mimic.AddMimicHistory(Ord(mtFireDet1));

      frmFireFighting.pgcFireFighting.ActivePageIndex := 0;
    end;
    ftNetSystem:
    begin
      SysMimics.Mimic.ShowMimic(mtNetArc);
      SysMimics.Mimic.AddMimicHistory(Ord(mtNetArc));
    end;
    ftNav_ComSys:
    begin
      SysMimics.Mimic.ShowMimic(mtNavCom);
      SysMimics.Mimic.AddMimicHistory(Ord(mtNavCom));
    end;
    ftTanksOverview:
    begin
      SysMimics.Mimic.ShowMimic(mtTanks);
      SysMimics.Mimic.AddMimicHistory(Ord(mtTanks));
    end;
    ftBilgeSystem:
    begin
      SysMimics.Mimic.ShowMimic(mtBilge);
      SysMimics.Mimic.AddMimicHistory(Ord(mtBilge));
    end;
    ftAuxSystemOverview:
    begin
      SysMimics.Mimic.ShowMimic(mtAux);
      SysMimics.Mimic.AddMimicHistory(Ord(mtAux));
    end;
    ftPMS :
    begin
      SysMimics.Mimic.ShowMimic(mtPowerMan);
      SysMimics.Mimic.AddMimicHistory(Ord(mtPowerMan));
    end;
    ftPMSOverview:
    begin
      SysMimics.Mimic.ShowMimic(mtPowerMan);
      SysMimics.Mimic.AddMimicHistory(Ord(mtPowerMan));
    end;
    ftVentSystem:
    begin
      SysMimics.Mimic.ShowMimic(mtMachineVent);
      SysMimics.Mimic.AddMimicHistory(Ord(mtMachineVent));
    end;
    ftFireFightingSystem:
    begin
      SysMimics.Mimic.ShowMimic(mtFireFS);
      SysMimics.Mimic.AddMimicHistory(Ord(mtFireFS));
    end;
    ftPropulsionConditions:
    begin
      SysMimics.Mimic.ShowMimic(mtPropCond);
      SysMimics.Mimic.AddMimicHistory(Ord(mtPropCond));
    end;
    ftFuelOilPanel:
    begin
      SysMimics.Mimic.ShowMimic(mtFuel);
      SysMimics.Mimic.AddMimicHistory(Ord(mtFuel));
    end;
    ftBallastPanel:
    begin
      SysMimics.Mimic.ShowMimic(mtBallast);
      SysMimics.Mimic.AddMimicHistory(Ord(mtBallast));
    end;
    ftFreshWaterPanel:
    begin
      SysMimics.Mimic.ShowMimic(mtSeaWater);
      SysMimics.Mimic.AddMimicHistory(Ord(mtSeaWater));
    end;
  end;
end;

procedure TfrmInstructorPanel.OnGotoELement(const Value: string);
var
  mimic : TfrmMimics;
begin
  if Value <> '' then
  begin
    mimic := SysMimics.Mimic.SearchMimic(Value);

    if Assigned(mimic) then
      SysMimics.Mimic.ShowMimic(mimic.MimicID);
  end;
end;

procedure TfrmInstructorPanel.OnPropByteChange(Sender: TObject;
  Props: E_PropsID; Value: Byte);
begin
  case Props of
    epScenarioRunningTime:
    begin
    end;
    epScenarioLoad:
    begin
      // sedang loading
      if Value = 1 then
      begin
        frmProgress := TfrmProgress.Create(Self);
        InstructorSys.Scenario.OnProgressStep := frmProgress.OnProgressStep ;
        frmProgress.Show;
      end
      else
      begin
        if Assigned(frmProgress) then
          frmProgress.Close;
        frmProgress := nil;
      end;
    end;
    epScenarioRunState:
    begin
      case E_ScenarioRunState(Value) of
        esrRun:
        begin
          btnStartSim.Enabled := false;
          btnStop.Enabled := true;
          btnPauseSim.Enabled := true;

          lblSimState.Caption := 'Running';
          lblSimState.Font.Color := clLime;

//          ctgrypnlControlPanel.Enabled := True;
          ctgrypnlGeneral.Enabled := True;
          ctgrypnlSafety.Enabled := True;
          ctgrypnlPCSConditions.Enabled := True;
          ctgrypnlPropCondition.Enabled := True;
          ctgrypnlAuxilary.Enabled := True;
          ctgrypnlACS.Enabled := True;

//          ctgrypnlControlPanel.Collapsed := False;
//          ctgrypnlGeneral.Collapsed := False;
//          ctgrypnlSafety.Collapsed := False;
//          ctgrypnlPCSConditions.Collapsed := False;
//          ctgrypnlPropCondition.Collapsed := False;
//          ctgrypnlAuxilary.Collapsed := False;
//          ctgrypnlACS.Collapsed := False;

//          pnl2.Enabled := True;
        end;
        esrPause:
        begin
          lblSimState.Caption := 'Paused';
          lblSimState.Font.Color := clRed;
          btnPauseSim.Enabled := False;
          btnStartSim.Enabled := False;

          SaveRunningScenario;

          Screen.Cursor := crHourGlass;
          btnStartSim.Enabled := True;
          btnStop.Enabled := True;

//          ctgrypnlControlPanel.Enabled := False;
          ctgrypnlGeneral.Enabled := False;
          ctgrypnlSafety.Enabled := False;
          ctgrypnlPCSConditions.Enabled := False;
          ctgrypnlPropCondition.Enabled := False;
          ctgrypnlAuxilary.Enabled := False;
          ctgrypnlACS.Enabled := False;

//          ctgrypnlControlPanel.Collapsed := True;
//          ctgrypnlGeneral.Collapsed := True;
//          ctgrypnlSafety.Collapsed := True;
//          ctgrypnlPCSConditions.Collapsed := True;
//          ctgrypnlPropCondition.Collapsed := True;
//          ctgrypnlAuxilary.Collapsed := True;
//          ctgrypnlACS.Collapsed := True;

//          pnl2.Enabled := False;

        end;
        esrStop:
        begin
          lblSimState.Caption := 'Stopped';
          lblSimState.Font.Color := clRed;
          btnStop.Enabled := False;
          btnPauseSim.Enabled := False;
          btnStartSim.Enabled := False;

          SaveRunningScenario;

          btnStartSim.Enabled := True;

//          ctgrypnlControlPanel.Enabled := False;
          ctgrypnlGeneral.Enabled := False;
          ctgrypnlSafety.Enabled := False;
          ctgrypnlPCSConditions.Enabled := False;
          ctgrypnlPropCondition.Enabled := False;
          ctgrypnlAuxilary.Enabled := False;
          ctgrypnlACS.Enabled := False;

//          ctgrypnlControlPanel.Collapsed := True;
          ctgrypnlGeneral.Collapsed := True;
          ctgrypnlSafety.Collapsed := True;
          ctgrypnlPCSConditions.Collapsed := True;
          ctgrypnlPropCondition.Collapsed := True;
          ctgrypnlAuxilary.Collapsed := True;
          ctgrypnlACS.Collapsed := True;

          FormFactory(ftScenarioLoader, true);
//          pnl2.Enabled := True;
        end;
      end;
    end;
  end;
end;

procedure TfrmInstructorPanel.OnPropStrChange(Sender: TObject; Props: E_PropsID;
  Value: string);
var
  scenData : TSession_Data;
begin
  case Props of
    epScenarioLoad:
    begin
      scenData := InstructorSys.Database.GetSession(InstructorSys.Scenario.CurrentRunningScenario);
      lblScenarioRun.Caption := scenData.SessionName + ' [' +
        scenData.OriginalScenario + ' scenario] ' + ' First run : ' +
        FormatDateTime('dddd, dd/mm/yyyy hh:nn:ss',scenData.SessionStart);
      lblSimTime.Caption := FormatDateTime('dddd, dd/mm/yyyy hh:nn:ss',scenData.SessionStop);

      tempTimeSim := scenData.SessionStop;

      CtrlSystem.Controller.SetRunningScenarioTime(InstructorSys.Scenario.CurrentRunningScenarioTime);
      scenData.Free;
    end;
  end;
end;

procedure TfrmInstructorPanel.SaveRunningScenario;
var
  ElementCondList : TList;
begin
  Application.ProcessMessages;

  frmProgress := TfrmProgress.Create(Self);
  frmProgress.Show;

  frmProgress.OnProgressStep(10) ;
  InstructorSys.Database.UpdateStoppedTimeRS(InstructorSys.Scenario.CurrentRunningScenarioTime,
        InstructorSys.Scenario.CurrentRunningScenario);

  frmProgress.OnProgressStep(30) ;
  InstructorSys.Database.SaveMimics(SysMimics.Mimic.PairedElements,'RS_MimicsBlob',
        InstructorSys.Scenario.CurrentRunningScenario);

  frmProgress.OnProgressStep(50) ;
  CtrlSystem.Controller.getElementConditions(ElementCondList);

  frmProgress.OnProgressStep(70) ;
  InstructorSys.Database.SaveElements(ElementCondList,InstructorSys.Scenario.CurrentRunningScenario);
  FreeList(ElementCondList);

  frmProgress.OnProgressStep(80) ;
  InstructorSys.Scenario.SaveRS_PMSCondition(InstructorSys.Scenario.CurrentRunningScenario);

  frmProgress.OnProgressStep(90) ;
  InstructorSys.Scenario.SaveRS_PCSCondition(InstructorSys.Scenario.CurrentRunningScenario);

  //save FACondition belum
  //save tank condition belum
  //save pcs
  //save ff

  frmProgress.OnProgressStep(100) ;

  Screen.Cursor := crDefault;
  frmProgress.Close;
  frmProgress := nil;
end;

procedure TfrmInstructorPanel.scrlbxContentClick(Sender: TObject);
begin

end;

//procedure TfrmInstructorPanel.OnTelegramChange(Sender: Tobject; Props :E_PropsID; Value : Integer);
//var
//  recIns : R_Common_Instr_Command;
//begin
//  recIns.aProps := integer(Props);
//  recIns.ID := TAlarmObj(value).aID;
//  recIns.Value := TAlarmObj(value).Value;

//  Network.AsServer.SendData(C_INSTRUCTOR_COMMAND,@recIns);
//end;

procedure TfrmInstructorPanel.tmr1Timer(Sender: TObject);
var
  t : TTime;
  dt : TDateTime;
  db,yb,mb : Integer;
  y, m, d, h, n, s, nn : Word;
  ss : string;
begin
//  lblRealTime.Caption := FormatDateTime('dddd, dd/mm/yyyy hh:nn:ss',Now);

  if InstructorSys.Scenario.RunState = esrRun then
  begin
    t := EncodeTime(0,0,1,0);
    InstructorSys.Scenario.CurrentRunningScenarioTime :=
        InstructorSys.Scenario.CurrentRunningScenarioTime + t;
    lblSimTime.Caption := FormatDateTime('dddd, dd/mm/yyyy hh:nn:ss',
        InstructorSys.Scenario.CurrentRunningScenarioTime);

    dt := InstructorSys.Scenario.CurrentRunningScenarioTime -
      InstructorSys.Scenario.CurrentRunningScenarioStart;

    DecodeDate(dt,y,m,d);
    DecodeTime(dt,h,n,s,nn);

    db := DaysBetween(InstructorSys.Scenario.CurrentRunningScenarioStart ,
        InstructorSys.Scenario.CurrentRunningScenarioTime);
    yb := YearsBetween(InstructorSys.Scenario.CurrentRunningScenarioStart ,
        InstructorSys.Scenario.CurrentRunningScenarioTime);
    mb := MonthsBetween(InstructorSys.Scenario.CurrentRunningScenarioStart ,
        InstructorSys.Scenario.CurrentRunningScenarioTime);

    ss := '';

    if yb > 0 then
      ss := IntToStr(yb) + ' year ';

    if mb > 0 then
      ss := ss + IntToStr(mb) + ' month ';

    if db > 0 then
      ss := IntToStr(db) + ' day ';

    if h > 0 then
      ss := ss + IntToStr(h) + ' hour ';

    if n > 0 then
      ss := ss + IntToStr(n) + ' min. ';

    if s > 0 then
      ss := ss + IntToStr(s) + ' sec ';

//    lblRunTime.Caption := ss;

    CtrlSystem.Controller.SetRunningScenarioTime(InstructorSys.Scenario.CurrentRunningScenarioTime);
  end;
end;

procedure TfrmInstructorPanel.tmrTelegrapTimer(Sender: TObject);
begin
  if Enabled then
  begin
    if TelegrapTimerFlag then
    begin
      frmInstructorPanel.btnPropBridge.Color := clRed;
      TelegrapTimerFlag := False;
    end
    else
    begin
      frmInstructorPanel.btnPropBridge.Color := clBtnFace;
      TelegrapTimerFlag := True;
    end;
  end
end;

procedure TfrmInstructorPanel.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (InstructorSys.Scenario.RunState = esrRun) then
  begin
    MessageDlg('Simulation at running state, please Stop simulation first...! ', mtWarning, [mbOK], 0);
    CanClose := False;
  end else
    CanClose := True;
end;

procedure TfrmInstructorPanel.FormCreate(Sender: TObject);
var
  i : integer;
  enumForm : E_FormType;
begin

  FDockedForm := nil;

  { Set view }
  DefaultMonitor := dmDesktop;
  i := 0;

  Height := Screen.Monitors[i].Height;
  Top    := Screen.Monitors[i].Top;
  Left   := Screen.Monitors[i].Left;
  width  := Screen.Monitors[i].Width;

  { create all form }
  for enumForm := Low(E_FormType) to High(E_FormType) do
    FormFactory(enumForm);

  with InstructorSys.Scenario.Listener.Add('InstructorPanel') as TPropertyEventListener do begin
    OnPropertyByteChange := OnPropByteChange;
    OnPropertyStringChange := OnPropStrChange;
  end;

  with CtrlSystem.Controller.Listeners.Add('InstructorPanel') as TPropertyEventListener do begin
    OnPropertyByteChange := OnPropByteChange;
  end;

  frmTester.OnGotoElement := OnGotoELement;

  { default view }
  FormFactory(ftClientControl,True);

end;

procedure TfrmInstructorPanel.FormFactory(aFormType : E_FormType;aDocked : Boolean = false);
var
  aForm : TForm;
begin
  aForm := nil;

  case aFormType of
    ftScenarioBuilder :
    begin
      if not Assigned(frmScenBuilder) then
        frmScenBuilder := TfrmScenBuilder.Create(Self);

      aForm := frmScenBuilder;
    end;

    ftPMSEditor :
    begin
      if not Assigned(frmPMSEditor) then
        frmPMSEditor := TfrmPMSEditor.Create(Self);

      frmPMSEditor.SetDatabase(InstructorSys.Database);
      aForm := frmPMSEditor;
    end;

    ftPCSEditor :
    begin
      if not Assigned(frmPCSEditor) then
        frmPCSEditor := TfrmPCSEditor.Create(Self);

      frmPCSEditor.SetDatabase(InstructorSys.Database);
      aForm := frmPCSEditor;
    end;

    ftFAEditor :
    begin
      if not Assigned(frmFAEditor) then
        frmFAEditor := TfrmFAEditor.Create(Self);

      aForm := frmFAEditor;
    end;

    ftScenarioLoader :
    begin
      if not Assigned(frmScenarioLoader) then
        frmScenarioLoader := TfrmScenarioLoader.Create(Self);

      aForm := frmScenarioLoader;
    end;

    ftPMS :
    begin
      if not Assigned(frmPMSSystemPanel) then
        frmPMSSystemPanel := TfrmPMSSystemPanel.Create(Self);

      aForm := frmPMSSystemPanel;
    end;

    ftFFS :
    begin
      if not Assigned(frmFireFighting) then
        frmFireFighting := TfrmFireFighting.Create(Self);

      aForm := frmFireFighting;

    end;

    ftMimicSys:
    begin
      if not Assigned(frmMimicPanel) then
        frmMimicPanel := TfrmMimicPanel.Create(nil);

      frmMimicPanel.SetFormLayout;
      frmMimicPanel.Show;
    end;

    ftNetSystem :
    begin
      if not Assigned(frmNetPanel) then
        frmNetPanel := TfrmNetPanel.Create(Self);

      aForm := frmNetPanel;

    end;

    ftTelegraph :
    begin
      if not Assigned(frmTelegram) then
        frmTelegram := TfrmTelegram.Create(Self);

      aForm := frmTelegram;
    end;

    ftPCSLocalControl :
    begin
      if not Assigned(frmPCSLocalControlPanel) then
        frmPCSLocalControlPanel := TfrmPCSLocalControlPanel.Create(Self);

      aForm := frmPCSLocalControlPanel;
    end;

    ftElemtMod  :
    begin
      if not Assigned(frmTester) then
        frmTester := TfrmTester.Create(Self);

      aForm := frmTester;
    end;

//    ftNetStatus :           //tag 18
//    begin
//      if not Assigned(frmNetStatus) then
//        frmNetStatus := TfrmNetStatus.Create(Self);

//      aForm := frmNetStatus;
//    end;

//    ftDataLogger:           // tag 19
//    begin
//      if not Assigned(frmLogger) then
//        frmLogger := TfrmLogger.Create(Self);

//      aForm := frmLogger;
//    end;

    ftClientControl:
    begin
      if not Assigned(frmClientControl) then
        frmClientControl := TfrmClientControl.Create(Self);

      aForm := frmClientControl;
    end;

    ftShipAlarm:
    begin
      if not Assigned(frmAlarmRudder) then
        frmAlarmRudder := TfrmAlarmRudder.Create(Self);
      aForm := frmAlarmRudder;
    end;

    ftNav_ComSys:
    begin
      if not Assigned(frmNav_CommSystem) then
        frmNav_CommSystem := TfrmNav_CommSystem.Create(Self);

      aForm := frmNav_CommSystem;

    end;

    ftTanksOverview :
    begin
      if not Assigned(frmTanksOverview) then
        frmTanksOverview := TfrmTanksOverview.Create(Self);

      aForm := frmTanksOverview;
    end;

    ftBilgeSystem :
    begin
      if not Assigned(frmBilgeSystemIns) then
        frmBilgeSystemIns := TfrmBilgeSystemIns.Create(Self);

      aForm := frmBilgeSystemIns;
    end;

    ftAuxSystemOverview :
    begin
      if not Assigned(frmAuxSystemOverview) then
        frmAuxSystemOverview := TfrmAuxSystemOverview.Create(Self);

      aForm := frmAuxSystemOverview;
    end;

    ftTanksEditor :
    begin
      if not Assigned(frmTanksEditor) then
        frmTanksEditor := TfrmTanksEditor.Create(Self);

      aForm := frmTanksEditor;
    end;

    ftPMSOverview :
    begin
      if not Assigned(frmPowerManagementSyst) then
        frmPowerManagementSyst := TfrmPowerManagementSyst.Create(Self);

      aForm := frmPowerManagementSyst;
    end;

    ftVentSystem :
    begin
      if not Assigned(frmVentSystem) then
        frmVentSystem := TfrmVentSystem.Create(Self);

      aForm := frmVentSystem;
    end;

    ftFireFightingSystem :
    begin
      if not Assigned(frmFFSystem) then
        frmFFSystem := TfrmFFSystem.Create(Self);

      aForm := frmFFSystem;
    end;

    ftACSControl :
    begin
      if not Assigned(frmACSControl) then
        frmACSControl := TfrmACSControl.Create(Self);

      aForm := frmACSControl;
    end;

    ftPropulsionConditions :
    begin
      if not Assigned(frmPropulsionConditions) then
        frmPropulsionConditions := TfrmPropulsionConditions.Create(Self);

      aForm := frmPropulsionConditions;
    end;

    ftTankSys :
    begin
      if not Assigned(frmTankSystemPanel) then
        frmTankSystemPanel := TfrmTankSystemPanel.Create(Self);

      aForm := frmTankSystemPanel;
    end;

    ftFuelOilPanel :
    begin
      if not Assigned(frmFuelOilPanel) then
        frmFuelOilPanel := TfrmFuelOilPanel.Create(Self);

      aForm := frmFuelOilPanel;
    end;

    ftBallastPanel :
    begin
      if not Assigned(frmBallastPanel) then
        frmBallastPanel := TfrmBallastPanel.Create(Self);

      aForm := frmBallastPanel;
    end;

    ftFreshWaterPanel :
    begin
      if not Assigned(frmFreshWaterPanel) then
        frmFreshWaterPanel := TfrmFreshWaterPanel.Create(Self);

      aForm := frmFreshWaterPanel;
    end;
  end;

  if Assigned(aForm) and aDocked then
    DockForm(aForm);
end;

end.
