unit uScenBuilder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ActnList, PlatformDefaultStyleActnCtrls, ActnMan, ToolWin,
  ActnCtrls, Mask, Buttons, uDBSupportClasses, ComCtrls, ExtCtrls, StrUtils,
  Grids, System.Actions, RzBmpBtn, Vcl.Imaging.pngimage, VrControls, VrButtons;

type
  TfrmScenBuilder = class(TForm)
    acttb1: TActionToolBar;
    actmgr1: TActionManager;
    actNew: TAction;
    actPick: TAction;
    actSave: TAction;
    actDelete: TAction;
    actCancel: TAction;
    pgc2: TPageControl;
    tsBuilder: TTabSheet;
    tsRunScenario: TTabSheet;
    acttb2: TActionToolBar;
    actmgr2: TActionManager;
    Action1: TAction;
    actDeleteRS: TAction;
    actChooseRS: TAction;
    actDeleteAll: TAction;
    actmgr3: TActionManager;
    act2: TAction;
    act4: TAction;
    act5: TAction;
    pnlRunningSessionBackground: TPanel;
    pnlScenarioBuilderBackgraound: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    lstAvail: TListBox;
    pnlMenu: TPanel;
    btnScenario: TRzBmpButton;
    btnSession: TRzBmpButton;
    btnPMS: TRzBmpButton;
    btnPCS: TRzBmpButton;
    btnTank: TRzBmpButton;
    btnFA: TRzBmpButton;
    pnlHeader: TPanel;
    lblHeader: TLabel;
    pnlScenario: TPanel;
    lblNames: TLabel;
    lstScenario: TListBox;
    btnLoad: TBitBtn;
    btnRefreshScen: TBitBtn;
    lblName: TLabel;
    lblDescription: TLabel;
    edtScenarioName: TEdit;
    mmoScenarioDescription: TMemo;
    pgc1: TPageControl;
    tsPMS: TTabSheet;
    pnlPMSBackgraound: TPanel;
    lblPMSState: TLabel;
    lblPMSInfo: TLabel;
    edtPMSName: TEdit;
    btnPMSPick: TButton;
    mmoPMSInfo: TMemo;
    btnClearPMS: TButton;
    tsPCS: TTabSheet;
    pnlPCSBackgraound: TPanel;
    lblPCSState: TLabel;
    lblPCSInfo: TLabel;
    btnPCSPick: TButton;
    mmoPCSInfo: TMemo;
    btnClearPCS: TButton;
    edtPCSName: TEdit;
    tsElement: TTabSheet;
    lbl1: TLabel;
    edtElementName: TEdit;
    btnPickElement: TButton;
    btnClearElement: TButton;
    tsTANK: TTabSheet;
    pnlTANkBackgraound: TPanel;
    lblFFState: TLabel;
    lblFFInfo: TLabel;
    btnFFPick: TButton;
    mmoTANKInfo: TMemo;
    btnClearTANK: TButton;
    edtTANKName: TEdit;
    tsFA: TTabSheet;
    pnlFABackgraound: TPanel;
    lblFAState: TLabel;
    lblFAInfo: TLabel;
    edtFAName: TEdit;
    btnFAPick: TButton;
    mmoFAInfo: TMemo;
    btnClearFA: TButton;
    pnlSession: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lstSession: TListBox;
    BitBtn2: TBitBtn;
    edt1: TEdit;
    mmo1: TMemo;
    lbl4: TLabel;
    lblSessionID: TLabel;
    pnlPMS: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    lstPMS: TListBox;
    BitBtn1: TBitBtn;
    edtPMSCond: TEdit;
    pnlPCS: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    lstPropulsion: TListBox;
    BitBtn3: TBitBtn;
    edtPCSConditionName: TEdit;
    pnlTank: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    lstTank: TListBox;
    BitBtn4: TBitBtn;
    Edit2: TEdit;
    pnlFA: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    lstFA: TListBox;
    BitBtn5: TBitBtn;
    Edit3: TEdit;
    BitBtn6: TBitBtn;
    GroupBox1: TGroupBox;
    Label11: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl5: TLabel;
    lbl7: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    cbbControl: TComboBox;
    cbbRemotePort: TComboBox;
    cbbRemoteStar: TComboBox;
    cbbMainEnginePort: TComboBox;
    cbbMainEngineStar: TComboBox;
    cbbGearBoxPort: TComboBox;
    cbbGearBoxStar: TComboBox;
    cbbModeEngPort: TComboBox;
    cbbModeEngStar: TComboBox;
    trckbrHelmEngPort: TTrackBar;
    trckbrHelmEngStar: TTrackBar;
    lblModeEngPort: TLabel;
    lblModeEngStar: TLabel;
    RzBmpButton1: TRzBmpButton;
    RzBmpButton2: TRzBmpButton;
    RzBmpButton3: TRzBmpButton;
    Label21: TLabel;
    Panel3: TPanel;
    Image1: TImage;
    RzBmpButton4: TRzBmpButton;
    RzBmpButton5: TRzBmpButton;
    RzBmpButton6: TRzBmpButton;
    RzBmpButton7: TRzBmpButton;
    RzBmpButton8: TRzBmpButton;
    RzBmpButton9: TRzBmpButton;
    RzBmpButton10: TRzBmpButton;
    RzBmpButton11: TRzBmpButton;
    RzBmpButton12: TRzBmpButton;
    GroupBox2: TGroupBox;
    lblAlarm_DGSETS: TLabel;
    lblAlarm_Distribution: TLabel;
    lblAlarm_Propultion: TLabel;
    lblAlarm_Auxiliary: TLabel;
    lblAlarm_Fuel: TLabel;
    lblAlarm_Domest: TLabel;
    lblAlarm_HVAC: TLabel;
    lblAlarm_FFDC: TLabel;
    lblAlarm_Navigation: TLabel;
    lblAlarm_Ballast: TLabel;
    lblAlarm_IPMS: TLabel;
    lblAlarm_IAS: TLabel;
    lblRole_IPMS: TLabel;
    lblRole_AUX: TLabel;
    lblRole_PCS: TLabel;
    lblRole_E: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    CheckBox16: TCheckBox;
    CheckBox17: TCheckBox;
    CheckBox18: TCheckBox;
    CheckBox19: TCheckBox;
    CheckBox20: TCheckBox;
    CheckBox21: TCheckBox;
    CheckBox22: TCheckBox;
    CheckBox23: TCheckBox;
    CheckBox24: TCheckBox;
    CheckBox25: TCheckBox;
    CheckBox26: TCheckBox;
    CheckBox27: TCheckBox;
    CheckBox28: TCheckBox;
    CheckBox29: TCheckBox;
    CheckBox30: TCheckBox;
    CheckBox31: TCheckBox;
    CheckBox32: TCheckBox;
    CheckBox33: TCheckBox;
    CheckBox34: TCheckBox;
    CheckBox35: TCheckBox;
    CheckBox36: TCheckBox;
    CheckBox37: TCheckBox;
    CheckBox38: TCheckBox;
    CheckBox39: TCheckBox;
    CheckBox40: TCheckBox;
    CheckBox41: TCheckBox;
    CheckBox42: TCheckBox;
    CheckBox43: TCheckBox;
    CheckBox44: TCheckBox;
    CheckBox45: TCheckBox;
    CheckBox46: TCheckBox;
    CheckBox47: TCheckBox;
    CheckBox48: TCheckBox;
    Label22: TLabel;
    BitBtn7: TBitBtn;
    RzBmpButton13: TRzBmpButton;
    RzBmpButton14: TRzBmpButton;
    RzBmpButton15: TRzBmpButton;
    GroupBox3: TGroupBox;
    cbbSetValue: TComboBox;
    edtPersen: TEdit;
    lbl38: TLabel;
    btnFullAll: TButton;
    Label16: TLabel;
    edtWBPS: TEdit;
    lbl20: TLabel;
    Label17: TLabel;
    edtWBSB: TEdit;
    Label18: TLabel;
    Label31: TLabel;
    edtWBFWD: TEdit;
    lbl6: TLabel;
    Label32: TLabel;
    edtFWTKPS: TEdit;
    lbl8: TLabel;
    lbl9: TLabel;
    edtFWTKSB: TEdit;
    Label34: TLabel;
    Label33: TLabel;
    edtFWROLLSTABTK: TEdit;
    Label35: TLabel;
    Label36: TLabel;
    edtFOTK1: TEdit;
    lbl14: TLabel;
    lbl15: TLabel;
    edtFOTK2: TEdit;
    lbl16: TLabel;
    lbl17: TLabel;
    edtFOTK3: TEdit;
    lbl18: TLabel;
    lbl19: TLabel;
    edtFOTK4: TEdit;
    lbl21: TLabel;
    lbl22: TLabel;
    edtFOOVTK: TEdit;
    lbl23: TLabel;
    lbl24: TLabel;
    edtFOLOADTRUNK: TEdit;
    lbl25: TLabel;
    lbl26: TLabel;
    edtFODAILYPS: TEdit;
    lbl27: TLabel;
    lbl28: TLabel;
    edtFODAILYSB: TEdit;
    lbl29: TLabel;
    lbl30: TLabel;
    edtMELOTK: TEdit;
    lbl31: TLabel;
    lbl32: TLabel;
    edtGBXLOTK: TEdit;
    lbl33: TLabel;
    lbl34: TLabel;
    edtBILGEWTK: TEdit;
    lbl35: TLabel;
    lbl36: TLabel;
    edtSLDIRTYTK: TEdit;
    lbl37: TLabel;
    Label23: TLabel;
    BitBtn8: TBitBtn;
    Label6: TLabel;
    GroupBox4: TGroupBox;
    Label47: TLabel;
    Label39: TLabel;
    grpGenerator3: TGroupBox;
    Label8: TLabel;
    rbManGen3: TRadioButton;
    rbSemGen3: TRadioButton;
    rbAutGen3: TRadioButton;
    chkEngine3: TCheckBox;
    chkG3Pref: TCheckBox;
    grpGenerator4: TGroupBox;
    Label7: TLabel;
    rbManGen4: TRadioButton;
    rbSemGen4: TRadioButton;
    rbAutGen4: TRadioButton;
    chkEngine4: TCheckBox;
    chkG4Pref: TCheckBox;
    grpGenerator1: TGroupBox;
    Label37: TLabel;
    rbManGen1: TRadioButton;
    rbSemGen1: TRadioButton;
    rbAutGen1: TRadioButton;
    chkEngine1: TCheckBox;
    chkG1Pref: TCheckBox;
    grpGenerator2: TGroupBox;
    Label38: TLabel;
    rbManGen2: TRadioButton;
    rbSemGen2: TRadioButton;
    rbAutGen2: TRadioButton;
    chkEngine2: TCheckBox;
    chkG2Pref: TCheckBox;
    grpCB3: TGroupBox;
    btnopen3: TVrDemoButton;
    btnclose3: TVrDemoButton;
    grpCB4: TGroupBox;
    btnopen4: TVrDemoButton;
    btnclose4: TVrDemoButton;
    grpCB1: TGroupBox;
    btnopen1: TVrDemoButton;
    btnclose1: TVrDemoButton;
    grpCB2: TGroupBox;
    btnopen2: TVrDemoButton;
    btnclose2: TVrDemoButton;
    grpForward: TGroupBox;
    Label40: TLabel;
    lblCBOpenInn1: TLabel;
    lblCBCloseInn1: TLabel;
    Label41: TLabel;
    rbManInn1: TRadioButton;
    rbAutInn1: TRadioButton;
    btnopen6: TVrDemoButton;
    btnclose6: TVrDemoButton;
    grpAfter: TGroupBox;
    lblCBOpenInn2: TLabel;
    lblCBCloseInn2: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    rbManInn2: TRadioButton;
    rbAutInn2: TRadioButton;
    btnclose7: TVrDemoButton;
    btnopen7: TVrDemoButton;
    grpShore: TGroupBox;
    Label44: TLabel;
    lblCBOpenShore: TLabel;
    lblCBCloseShore: TLabel;
    Label46: TLabel;
    rbAutShore: TRadioButton;
    rbManShore: TRadioButton;
    VrDemoButton3: TVrDemoButton;
    VrDemoButton4: TVrDemoButton;
    grpEmergencyCon: TGroupBox;
    Label45: TLabel;
    Label48: TLabel;
    rbFwdDistrE: TRadioButton;
    rbAftDistrE: TRadioButton;
    btnopen8: TVrDemoButton;
    btnclose8: TVrDemoButton;
    grpCBE: TGroupBox;
    Label49: TLabel;
    btnopen5: TVrDemoButton;
    btnclose5: TVrDemoButton;
    grpEmergency: TGroupBox;
    Label50: TLabel;
    Label51: TLabel;
    lblemergency: TLabel;
    rbManGen5: TRadioButton;
    rbSemGen5: TRadioButton;
    rbAutGen5: TRadioButton;
    chkEngine5: TCheckBox;
    Label52: TLabel;
    RzBmpButton16: TRzBmpButton;
    RzBmpButton17: TRzBmpButton;
    RzBmpButton18: TRzBmpButton;
    BitBtn9: TBitBtn;
    procedure actNewExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actPickExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure btnPickClick(Sender: TObject);
    procedure btnClearPickClick(Sender: TObject);
    procedure actChooseRSExecute(Sender: TObject);
    procedure actDeleteRSExecute(Sender: TObject);
    procedure actDeleteAllExecute(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure act2Execute(Sender: TObject);
    procedure act4Execute(Sender: TObject);
    procedure btnMenuClick(Sender: TObject);
    procedure trckbrHelmEngPortChange(Sender: TObject);

  private
    FScenarioID : Integer;
    FPMSConditionID : Integer;
    FPCSConditionID : Integer;
    FElementConditionID : Integer;
    FTANKConditionID : Integer;
    FFAConditionID : Integer;
    FSelectedConditionID : integer;

    procedure ClearTabPickScen(value : Integer);

  public
    procedure UpdateScenarioList;
    procedure UpdateSessionList;
    procedure UpdatePMSList;
    procedure UpdatePCSList;
    procedure UpdateTankList;
    procedure UpdateFAList;

  end;

var
  frmScenBuilder: TfrmScenBuilder;

implementation

uses uAvailableScenario, uAvailablePMSCondition, uInstructorSystem,
  uAvailablePCSCondition, uAvailableFACondition, uAvailableTanksCondition,
  uFunction;

{$R *.dfm}

procedure TfrmScenBuilder.act2Execute(Sender: TObject);
var
  aList : TList;
  condData : TConditionData;
  i : integer;
begin
//  aList := nil;
//  InstructorSys.Database.GetAllCondition(aList);
//  strngrdCondition.RowCount := aList.Count + 1;
//  for I := 0 to aList.Count - 1 do
//  begin
//    condData := aList.Items[i];
//    strngrdCondition.Cells[0,i + 1] := IntToStr(condData.ConditionID);
//    strngrdCondition.Cells[1,i + 1] := condData.ConditionName;
//  end;
//  FreeList(aList);
end;

procedure TfrmScenBuilder.act4Execute(Sender: TObject);
var
  used : String;
begin
  if FSelectedConditionID > 0 then
  begin

    used := InstructorSys.Database.GetConditionInfo(FSelectedConditionID);

    if used <> 'NONE' then
      MessageDlg('Delete failed, selected condition used by other scenario!', mtWarning, [mbOK], 0)
    else
    begin
      if MessageDlg('Are you sure to delete Condition?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin

      end;
    end;


  end;

end;

procedure TfrmScenBuilder.actCancelExecute(Sender: TObject);
var
  scenData : TScenario_Data;
  i : Integer;
  l : TStrings;
begin
  if FScenarioID = 0 then
    actNewExecute(nil)
  else
  begin
    scenData := InstructorSys.Scenario.getScenario(FScenarioID);

    if not Assigned(scenData) then
      Exit;

    FScenarioID := scenData.ID;
    edtScenarioName.Text := scenData.Name;

    mmoScenarioDescription.Lines.Clear;
    mmoScenarioDescription.Lines.Add(scenData.Description);

    for i := 1 to 4 do
    begin
      ClearTabPickScen(i);
    end;

    for i := 0 to Length(scenData.ArrConditionID) - 1 do
    begin
      if scenData.ArrConditionType[i] = 'PMS' then
      begin
        FPMSConditionID := scenData.ArrConditionID[i];
        edtPMSName.Text := scenData.ArrConditionName[i];

        l := InstructorSys.Database.GetScenarioConditions(scenData.Name,'PMS');
        mmoPMSInfo.Lines.AddStrings(l);
        l.Free;
      end;

      if scenData.ArrConditionType[i] = 'PCS' then
      begin
        FPCSConditionID := scenData.ArrConditionID[i];
        edtPCSName.Text := scenData.ArrConditionName[i];

        l := InstructorSys.Database.GetScenarioConditions(scenData.Name,'PCS');
        mmoPCSInfo.Lines.AddStrings(l);
        l.Free;
      end;

      if scenData.ArrConditionType[i] = 'ELEMENT' then
      begin
        FElementConditionID := scenData.ArrConditionID[i];
        edtElementName.Text := scenData.ArrConditionName[i];
      end;

      if scenData.ArrConditionType[i] = 'TANK' then
      begin
        FTANKConditionID := scenData.ArrConditionID[i];
        edtTANKName.Text := scenData.ArrConditionName[i];
      end;

      if scenData.ArrConditionType[i] = 'FA' then
      begin
        FFAConditionID := scenData.ArrConditionID[i];
        edtFAName.Text := scenData.ArrConditionName[i];
      end;
    end;

    scenData.Free;
  end;
end;

procedure TfrmScenBuilder.actChooseRSExecute(Sender: TObject);
var
  scenarios : TStrings;
  scenData : TSession_Data;
//  i : integer;
//  l : TStrings;
begin
  if not (Assigned(frmAvailScenario)) then
    frmAvailScenario := TfrmAvailScenario.Create(Self);

  scenarios := nil;
  InstructorSys.Scenario.getSessions(scenarios);
  frmAvailScenario.SetAvailableScenario(scenarios);
  scenarios.Free;
  lblSessionID.Caption := '0';

  if frmAvailScenario.ShowModal = mrOk then
  begin

    if (frmAvailScenario.ScenarioName = '') then
      Exit;

    mmo1.Lines.Clear;
    edt1.Text := '';

    scenData := InstructorSys.Scenario.getSession(frmAvailScenario.ScenarioName);

    if not Assigned(scenData) then
      Exit;

    edt1.Text := scenData.SessionName;

    mmo1.Lines.Add('Session ' + IntToStr(scenData.SessionID) + ' from ' + scenData.OriginalScenario +
        ' scenario');
    mmo1.Lines.Add('Started at ' + DateTimeToStr(scenData.SessionStart));
    mmo1.Lines.Add('Stopped at ' + DateTimeToStr(scenData.SessionStop));
    lblSessionID.Caption := IntToStr(scenData.SessionID);
  end;
end;

procedure TfrmScenBuilder.actDeleteAllExecute(Sender: TObject);
begin
  if MessageDlg('Are You Sure To Delete All Sessions?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Screen.Cursor := crHourGlass;
    InstructorSys.Database.DeleteSession(True);
    MessageDlg('Delete Success', mtInformation, [mbOK], 0);

    lblSessionID.Caption := '0';
    mmo1.Lines.Clear;
    edt1.Text := '';

    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmScenBuilder.actDeleteExecute(Sender: TObject);
var
  conname : string;
begin
  if FScenarioID = 0then
    Exit;

  conname := edtScenarioName.Text;

  if MessageDlg('Are You Sure To Delete "' + edtScenarioName.Text + '" Scenario ? '+#13+#10+
      'All Sessions Linked To Scenario Will Be Deleted..!', mtWarning, [mbYes, mbNo], 0) = mrYes then;
  begin
    InstructorSys.Scenario.deleteScenario(FScenarioID);
    actNewExecute(nil);
    MessageDlg('Delete "' + conname + '" Scenario Success', mtInformation, [mbOK], 0)
  end;
end;

procedure TfrmScenBuilder.actDeleteRSExecute(Sender: TObject);
var
  conname : string;
begin
  if edt1.Text = '' then
    Exit;

  conname := edt1.Text;

  if MessageDlg('Are You Sure To Delete "' + conname + '" ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    if lblSessionID.Caption <> '0' then
    begin
      Screen.Cursor := crHourGlass;
      InstructorSys.Database.DeleteSession(False,StrToInt(lblSessionID.Caption));

      lblSessionID.Caption := '0';
      mmo1.Lines.Clear;
      edt1.Text := '';

      MessageDlg('Delete "' + conname + '" Success', mtInformation, [mbOK], 0);
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmScenBuilder.Action1Execute(Sender: TObject);
var
  newName : string;
begin
  if lblSessionID.Caption <> '0' then
    if InputQuery('New Scenario from Snapshot','Save As..',newName) then begin
      Screen.Cursor := crHourGlass;
      Application.ProcessMessages;
      InstructorSys.Database.SnapshotScenario(newName,StrToInt(lblSessionID.Caption));
      Screen.Cursor := crDefault;
    end;

end;

procedure TfrmScenBuilder.actNewExecute(Sender: TObject);
begin
  edtScenarioName.Text := '';
  mmoScenarioDescription.Text := '';

  edtPMSName.Text := '<None>';
  mmoPMSInfo.Clear;
  edtPCSName.Text := '<None>';
  mmoPCSInfo.Clear;
  edtElementName.Text := '<None>';
  edtTANKName.Text := '<None>';
  mmoTANKInfo.Clear;
  edtFAName.Text := '<None>';
  mmoFAInfo.Clear;

  FScenarioID := 0;
  FPMSConditionID := 0;
  FPCSConditionID := 0;
  FElementConditionID := 0;
  FTANKConditionID := 0;
  FFAConditionID := 0;
end;

procedure TfrmScenBuilder.actPickExecute(Sender: TObject);
var
  scenarios : TStrings;
  scenData : TScenario_Data;
  i : integer;
  l : TStrings;
begin
  if not (Assigned(frmAvailScenario)) then
    frmAvailScenario := TfrmAvailScenario.Create(Self);

  scenarios := nil;
  InstructorSys.Scenario.getScenarios(scenarios);
  frmAvailScenario.SetAvailableScenario(scenarios);
  scenarios.Free;

  if frmAvailScenario.ShowModal = mrOk then
  begin
    if (frmAvailScenario.ScenarioName = '') then
      Exit;

    scenData := InstructorSys.Scenario.getScenario(frmAvailScenario.ScenarioName);

    if not Assigned(scenData) then
      Exit;

    FScenarioID := scenData.ID;
    edtScenarioName.Text := scenData.Name;

    mmoScenarioDescription.Lines.Clear;
    mmoScenarioDescription.Lines.Add(scenData.Description);

    FPMSConditionID := 0;
    edtPMSName.Text := '<None>';
    FPCSConditionID := 0;
    edtPCSName.Text := '<None>';
    FElementConditionID := 0;
    edtElementName.Text := '<None>';
    FTANKConditionID := 0;
    edtTANKName.Text := '<None>';
    FFAConditionID := 0;
    edtFAName.Text := '<None>';

    mmoPMSInfo.Lines.Clear;
    mmoPCSInfo.Lines.Clear;
    mmoTANKInfo.Lines.Clear;
    mmoFAInfo.Lines.Clear;

    for i := 0 to Length(scenData.ArrConditionID) - 1 do
    begin
      if scenData.ArrConditionType[i] = 'PMS' then
      begin
        FPMSConditionID := scenData.ArrConditionID[i];
        edtPMSName.Text := scenData.ArrConditionName[i];

        l := InstructorSys.Database.GetScenarioConditions(scenData.Name,'PMS');
        mmoPMSInfo.Lines.AddStrings(l);
        l.Free;
      end;

      if scenData.ArrConditionType[i] = 'PCS' then
      begin
        FPCSConditionID := scenData.ArrConditionID[i];
        edtPCSName.Text := scenData.ArrConditionName[i];

        l := InstructorSys.Database.GetScenarioConditions(scenData.Name,'PCS');
        mmoPCSInfo.Lines.AddStrings(l);
        l.Free;
      end;

      if scenData.ArrConditionType[i] = 'ELEMENT' then
      begin
        FElementConditionID := scenData.ArrConditionID[i];
        edtElementName.Text := scenData.ArrConditionName[i];
      end;

      if scenData.ArrConditionType[i] = 'TANK' then
      begin
        FTANKConditionID := scenData.ArrConditionID[i];
        edtTANKName.Text := scenData.ArrConditionName[i];
      end;

      if scenData.ArrConditionType[i] = 'FA' then
      begin
        FFAConditionID := scenData.ArrConditionID[i];
        edtFAName.Text := scenData.ArrConditionName[i];
      end;
    end;

    scenData.Free;
  end;

end;

procedure TfrmScenBuilder.actSaveExecute(Sender: TObject);
var
  intArr : array of integer;
  i : integer;
begin
  if Trim(edtScenarioName.Text) = '' then
  begin
    ShowMessage('Scenario Name Is Empty, Please Insert Scenario Name');
    Exit;
  end;

  i := 1;
  if FPMSConditionID > 0 then
  begin
    SetLength(intArr,i);
    intArr[i-1] := FPMSConditionID;
    Inc(i);
  end;

  if FPCSConditionID > 0 then
  begin
    SetLength(intArr,i);
    intArr[i-1] := FPCSConditionID;
    Inc(i);
  end;

  if FElementConditionID > 0 then
  begin
    SetLength(intArr,i);
    intArr[i-1] := FElementConditionID;
    Inc(i);
  end;

  if FFAConditionID > 0 then
  begin
    SetLength(intArr, i);
    intArr[i-1] := FFAConditionID;
    Inc(i);
  end;

  if FTANKConditionID > 0 then
  begin
    SetLength(intArr, i);
    intArr[i-1] := FTANKConditionID;
  end;


  FScenarioID := InstructorSys.Scenario.insertScenario(FScenarioID, edtScenarioName.Text,
    mmoScenarioDescription.Lines.Text, intArr);
end;

procedure TfrmScenBuilder.btnMenuClick(Sender: TObject);
begin
  case TRzBmpButton(Sender).Tag of
    0:
    begin
      pnlScenario.BringToFront;
      lblHeader.Caption := 'SCENARIO EDITOR';
      UpdateScenarioList;
    end;
    1:
    begin
      pnlSession.BringToFront;
      lblHeader.Caption := 'SESSION EDITOR';
      UpdateSessionList;
    end;
    2:
    begin
      pnlPMS.BringToFront;
      lblHeader.Caption := 'POWER EDITOR';
      UpdatePMSList;
    end;
    3:
    begin
      pnlPCS.BringToFront;
      lblHeader.Caption := 'PPROPULSION EDITOR';
      UpdatePCSList;
    end;
    4:
    begin
      pnlTank.BringToFront;
      lblHeader.Caption := 'TANK EDITOR';
      UpdateTankList;
    end;
    5:
    begin
      pnlFA.BringToFront;
      lblHeader.Caption := 'FUNCTION ALLOCATION EDITOR';
      UpdateFAList;
    end;
  end;
end;

procedure TfrmScenBuilder.FormCreate(Sender: TObject);
begin
  FScenarioID := 0;
  FSelectedConditionID := 0;
end;

procedure TfrmScenBuilder.trckbrHelmEngPortChange(Sender: TObject);
begin

end;

{$REGION ' Scenario Section '}

procedure TfrmScenBuilder.btnPickClick(Sender: TObject);
var
  pickList,l : TStrings;
begin
  pickList := nil;

  case TButton(Sender).Tag of
    1:
    begin
      {$REGION ' PMS '}
      if not Assigned(frmAvailPMSCondition)  then
        frmAvailPMSCondition := TfrmAvailPMSCondition.Create(self);

      frmAvailPMSCondition.Caption := 'Available PMS';

      InstructorSys.Scenario.GetPMSConditions(pickList);
      frmAvailPMSCondition.SetAvailableCondition(pickList);
      pickList.Free;

      if frmAvailPMSCondition.ShowModal = mrOk then
      begin
        if frmAvailPMSCondition.PMSCondName = '' then
          Exit;

        edtPMSName.Text := frmAvailPMSCondition.PMSCondName;
        FPMSConditionID := InstructorSys.Database.GetConditionID(edtPMSName.Text);

        mmoPMSInfo.Lines.Clear;
        l := InstructorSys.Database.GetConditions(edtPMSName.Text,'PMS');
        mmoPMSInfo.Lines.AddStrings(l);
        l.Free;
      end;
      {$ENDREGION}
    end;
    2:
    begin
      {$REGION ' PCS '}
      if not Assigned(frmAvailPCSCondition)  then
        frmAvailPCSCondition := TfrmAvailPCSCondition.Create(self);

      InstructorSys.Scenario.GetPCSConditions(pickList);
      frmAvailPCSCondition.SetAvailableCondition(pickList);
      pickList.Free;

      if frmAvailPCSCondition.ShowModal = mrOk then
      begin
        if frmAvailPCSCondition.PCSCondName = '' then
          Exit;

        edtPCSName.Text := frmAvailPCSCondition.PCSCondName;
        FPCSConditionID := InstructorSys.Database.GetConditionID(edtPCSName.Text);

        mmoPCSInfo.Lines.Clear;
        l := InstructorSys.Database.GetConditions(edtPCSName.Text,'PCS');
        mmoPCSInfo.Lines.AddStrings(l);
        l.Free;
      end;
      {$ENDREGION}
    end;
    3:
    begin
      {$REGION ' Element Data '}
      if not Assigned(frmAvailPMSCondition)  then
        frmAvailPMSCondition := TfrmAvailPMSCondition.Create(self);
      frmAvailPMSCondition.Caption := 'Available Element Data';

      InstructorSys.Scenario.GetElementConditions(pickList);
      frmAvailPMSCondition.SetAvailableCondition(pickList);
      pickList.Free;

      if frmAvailPMSCondition.ShowModal = mrOk then
      begin
        if frmAvailPMSCondition.PMSCondName = '' then
          Exit;

        edtElementName.Text := frmAvailPMSCondition.PMSCondName;
        FElementConditionID := InstructorSys.Database.GetConditionID(edtElementName.Text);
      end;
      {$ENDREGION}
    end;
    4:
    begin
      {$REGION ' TANK '}
      if not Assigned(frmTanksCondition)  then
        frmTanksCondition := TfrmTanksCondition.Create(self);

      InstructorSys.Scenario.GetTanksConditions(pickList);
      frmTanksCondition.SetAvailableCondition(pickList);
      pickList.Free;

      if frmTanksCondition.ShowModal = mrOk then
      begin
        if frmTanksCondition.TanksCondName = '' then
          Exit;

        edtTANKName.Text := frmTanksCondition.TanksCondName;
        FTANKConditionID := InstructorSys.Database.GetConditionID(edtTANKName.Text);
      end;
      {$ENDREGION}
    end;
    5:
    begin
      {$REGION ' FA '}
      if not Assigned(frmAvailFACondition)  then
        frmAvailFACondition := TfrmAvailFACondition.Create(self);

      InstructorSys.Scenario.GetFAConditions(pickList);
      frmAvailFACondition.SetAvailableCondition(pickList);
      pickList.Free;

      if frmAvailFACondition.ShowModal = mrOk then
      begin
        if frmAvailFACondition.FACondName = '' then
          Exit;

        edtFAName.Text := frmAvailFACondition.FACondName;
        FFAConditionID := InstructorSys.Database.GetConditionID(edtFAName.Text);
      end;
      {$ENDREGION}
    end;
  end;
end;

procedure TfrmScenBuilder.btnClearPickClick(Sender: TObject);
begin
  ClearTabPickScen(TButton(Sender).Tag)
end;

procedure TfrmScenBuilder.ClearTabPickScen(value: Integer);
begin
  case value of
    1:
    begin
      {$REGION ' PMS '}
      edtPMSName.Text := '<None>';
      FPMSConditionID := 0;
      mmoPMSInfo.Lines.Clear;
      {$ENDREGION}
    end;
    2:
    begin
      {$REGION ' PCS '}
      edtPCSName.Text := '<None>';
      FPCSConditionID := 0;
      mmoPCSInfo.Lines.Clear;
      {$ENDREGION}
    end;
    3:
    begin
      {$REGION ' Element Data '}
      edtElementName.Text := '<None>';
      FElementConditionID := 0;
      {$ENDREGION}
    end;
    4:
    begin
      {$REGION ' TANK '}
      edtTANKName.Text := '<None>';
      FTANKConditionID := 0;
      mmoTANKInfo.Lines.Clear;
      {$ENDREGION}
    end;
    5:
    begin
      {$REGION ' FA '}
      edtFAName.Text := '<None>';
      FFAConditionID := 0;
      mmoFAInfo.Lines.Clear;
      {$ENDREGION}
    end;
  end;
end;

{$ENDREGION}

{$REGION ' Update Procedure Section '}

procedure TfrmScenBuilder.UpdateScenarioList;
var
  i : Integer;
  tempList : TStrings;
begin
  tempList := nil;
  InstructorSys.Scenario.getScenarios(tempList);

  if not Assigned(tempList) then
    Exit;

  if lstAvail.Count > 0 then
  lstAvail.Clear;

  for i := 0 to tempList.Count - 1 do
  begin
    lstAvail.Items.Add(tempList[i]);
  end;

  tempList.Free;
end;

procedure TfrmScenBuilder.UpdateSessionList;
var
  i : Integer;
  tempList : TStrings;

begin
  tempList := nil;
  InstructorSys.Scenario.GetPMSConditions(tempList);

  if not Assigned(tempList) then
    Exit;

  if lstPMS.Count > 0 then
  lstAvail.Clear;

  for i := 0 to tempList.Count - 1 do
  begin
    lstPMS.Items.Add(tempList[i]);
  end;

  tempList.Free;
end;

procedure TfrmScenBuilder.UpdatePMSList;
var
  i : Integer;
  tempList : TStrings;

begin
  tempList := nil;
  InstructorSys.Scenario.GetPMSConditions(tempList);

  if not Assigned(tempList) then
    Exit;

  if lstPMS.Count > 0 then
  lstPMS.Clear;

  for i := 0 to tempList.Count - 1 do
  begin
    lstPMS.Items.Add(tempList[i]);
  end;

  tempList.Free;
end;

procedure TfrmScenBuilder.UpdatePCSList;
var
  i : Integer;
  tempList : TStrings;

begin
  tempList := nil;
  InstructorSys.Scenario.GetPCSConditions(tempList);

  if not Assigned(tempList) then
    Exit;

  if lstPropulsion.Count > 0 then
  lstPropulsion.Clear;

  for i := 0 to tempList.Count - 1 do
  begin
    lstPropulsion.Items.Add(tempList[i]);
  end;

  tempList.Free;
end;

procedure TfrmScenBuilder.UpdateTankList;
var
  i : Integer;
  tempList : TStrings;

begin
  tempList := nil;
  InstructorSys.Scenario.GetTanksConditions(tempList);

  if not Assigned(tempList) then
    Exit;

  if lstTank.Count > 0 then
  lstTank.Clear;

  for i := 0 to tempList.Count - 1 do
  begin
    lstTank.Items.Add(tempList[i]);
  end;

  tempList.Free;
end;

procedure TfrmScenBuilder.UpdateFAList;
var
  i : Integer;
  tempList : TStrings;

begin
  tempList := nil;
  InstructorSys.Scenario.GetFAConditions(tempList);

  if not Assigned(tempList) then
    Exit;

  if lstFA.Count > 0 then
  lstFA.Clear;

  for i := 0 to tempList.Count - 1 do
  begin
    lstFA.Items.Add(tempList[i]);
  end;

  tempList.Free;
end;

{$ENDREGION}

end.
