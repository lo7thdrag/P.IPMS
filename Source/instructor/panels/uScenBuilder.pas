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
    grpGenerator3: TGroupBox;
    Label8: TLabel;
    chkEngine3: TCheckBox;
    chkG3Pref: TCheckBox;
    grpGenerator4: TGroupBox;
    Label7: TLabel;
    chkEngine4: TCheckBox;
    chkG4Pref: TCheckBox;
    grpGenerator1: TGroupBox;
    Label37: TLabel;
    chkEngine1: TCheckBox;
    chkG1Pref: TCheckBox;
    grpGenerator2: TGroupBox;
    Label38: TLabel;
    chkEngine2: TCheckBox;
    chkG2Pref: TCheckBox;
    grpForward: TGroupBox;
    Label40: TLabel;
    lblCBOpenInn1: TLabel;
    lblCBCloseInn1: TLabel;
    Label41: TLabel;
    grpAfter: TGroupBox;
    lblCBOpenInn2: TLabel;
    lblCBCloseInn2: TLabel;
    Label42: TLabel;
    rbManInn2: TRadioButton;
    rbAutInn2: TRadioButton;
    RzBmpButton16: TRzBmpButton;
    RzBmpButton17: TRzBmpButton;
    RzBmpButton18: TRzBmpButton;
    BitBtn9: TBitBtn;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label53: TLabel;
    Label54: TLabel;
    ComboBox3: TComboBox;
    Label55: TLabel;
    ComboBox4: TComboBox;
    Label56: TLabel;
    ComboBox5: TComboBox;
    Label57: TLabel;
    Label58: TLabel;
    ComboBox6: TComboBox;
    Label59: TLabel;
    ComboBox7: TComboBox;
    Label60: TLabel;
    ComboBox8: TComboBox;
    ComboBox9: TComboBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    GroupBox5: TGroupBox;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Label43: TLabel;
    ComboBox10: TComboBox;
    ComboBox11: TComboBox;
    Label64: TLabel;
    GroupBox6: TGroupBox;
    Label44: TLabel;
    Label46: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    ComboBox12: TComboBox;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    GroupBox7: TGroupBox;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    CheckBox49: TCheckBox;
    ComboBox13: TComboBox;
    ComboBox14: TComboBox;
    GroupBox8: TGroupBox;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    ComboBox16: TComboBox;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    Panel5: TPanel;
    Label52: TLabel;
    Panel6: TPanel;
    Label47: TLabel;
    Panel4: TPanel;
    Label39: TLabel;
    GroupBox1: TGroupBox;
    pnlControl: TPanel;
    cbbControl: TComboBox;
    pnlRemoteControl: TPanel;
    Label12: TLabel;
    cbbRemotePort: TComboBox;
    cbbRemoteStar: TComboBox;
    pnlMainEngine: TPanel;
    Label25: TLabel;
    cbbModeEngPort: TComboBox;
    cbbModeEngStar: TComboBox;
    pnlMainEngineStatus: TPanel;
    Label28: TLabel;
    cbbMainEnginePort: TComboBox;
    cbbMainEngineStar: TComboBox;
    pnlGearBox: TPanel;
    Label71: TLabel;
    cbbGearBoxPort: TComboBox;
    cbbGearBoxStar: TComboBox;
    Label11: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl5: TLabel;
    lbl7: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    trckbrHelmEngPort: TTrackBar;
    trckbrHelmEngStar: TTrackBar;
    lblModeEngPort: TLabel;
    lblModeEngStar: TLabel;
    Label13: TLabel;
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
    procedure cbbControlChange(Sender: TObject);
    procedure cbbRemotePortChange(Sender: TObject);
    procedure cbbRemoteStarChange(Sender: TObject);
    procedure cbbMainEnginePortChange(Sender: TObject);
    procedure cbbMainEngineStarChange(Sender: TObject);
    procedure cbbGearBoxPortChange(Sender: TObject);
    procedure cbbGearBoxStarChange(Sender: TObject);
    procedure cbbModeEngPortChange(Sender: TObject);
    procedure cbbModeEngStarChange(Sender: TObject);
    procedure trckbrHelmEngStarChange(Sender: TObject);
    procedure btnFullAllClick(Sender: TObject);
    procedure edtWBPSKeyPress(Sender: TObject; var Key: Char);
    procedure edtMELOTKKeyPress(Sender: TObject; var Key: Char);
    procedure edtGBXLOTKKeyPress(Sender: TObject; var Key: Char);
    procedure Edit3Change(Sender: TObject);

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

procedure TfrmScenBuilder.Edit3Change(Sender: TObject);
begin

end;

{$ENDREGION}

{$REGION ' Session Section '}
{$ENDREGION}

{$REGION ' PMS Section '}
{$ENDREGION}

{$REGION ' PCS Section '}

procedure TfrmScenBuilder.cbbControlChange(Sender: TObject);
begin
  if cbbControl.ItemIndex = 1 then
  begin
    if (cbbRemotePort.ItemIndex = 0) and (cbbMainEnginePort.ItemIndex = 1)
    and (cbbGearBoxPort.ItemIndex = 0) then
    begin
      lblModeEngPort.Visible := True;
      cbbModeEngPort.Visible := True;
      trckbrHelmEngPort.Visible := True;
      lbl10.Visible := True;
    end
    else
    begin
      lblModeEngPort.Visible := False;
      cbbModeEngPort.Visible := False;
      trckbrHelmEngPort.Visible := False;
      lbl10.Visible := False;
    end;

    if (cbbRemoteStar.ItemIndex = 0) and (cbbMainEngineStar.ItemIndex = 1)
    and (cbbGearBoxStar.ItemIndex = 0) then
    begin
      lblModeEngStar.Visible := True;
      cbbModeEngStar.Visible := True;
      trckbrHelmEngStar.Visible := True;
      lbl11.Visible := True;
    end
    else
    begin
      lblModeEngStar.Visible := False;
      cbbModeEngStar.Visible := False;
      trckbrHelmEngStar.Visible := False;
      lbl11.Visible := False;
    end;
  end
  else
  begin
      lblModeEngStar.Visible := False;
      cbbModeEngStar.Visible := False;
      trckbrHelmEngStar.Visible := False;
      lbl11.Visible := False;

      lblModeEngPort.Visible := False;
      cbbModeEngPort.Visible := False;
      trckbrHelmEngPort.Visible := False;
      lbl10.Visible := False;
  end;
end;

procedure TfrmScenBuilder.cbbGearBoxPortChange(Sender: TObject);
begin
  if cbbControl.ItemIndex = 1 then
  begin
    if (cbbRemotePort.ItemIndex = 0) and (cbbMainEnginePort.ItemIndex = 1)
    and (cbbGearBoxPort.ItemIndex = 0) then
    begin
      lblModeEngPort.Visible := True;
      cbbModeEngPort.Visible := True;
      trckbrHelmEngPort.Visible := True;
      lbl10.Visible := True;
    end
    else
    begin
      lblModeEngPort.Visible := False;
      cbbModeEngPort.Visible := False;
      trckbrHelmEngPort.Visible := False;
      lbl10.Visible := False;
    end;

    if (cbbRemoteStar.ItemIndex = 0) and (cbbMainEngineStar.ItemIndex = 1)
    and (cbbGearBoxStar.ItemIndex = 0) then
    begin
      lblModeEngStar.Visible := True;
      cbbModeEngStar.Visible := True;
      trckbrHelmEngStar.Visible := True;
      lbl11.Visible := True;
    end
    else
    begin
      lblModeEngStar.Visible := False;
      cbbModeEngStar.Visible := False;
      trckbrHelmEngStar.Visible := False;
      lbl11.Visible := False;
    end;
  end
  else
  begin
      lblModeEngStar.Visible := False;
      cbbModeEngStar.Visible := False;
      trckbrHelmEngStar.Visible := False;
      lbl11.Visible := False;

      lblModeEngPort.Visible := False;
      cbbModeEngPort.Visible := False;
      trckbrHelmEngPort.Visible := False;
      lbl10.Visible := False;
  end;
end;

procedure TfrmScenBuilder.cbbGearBoxStarChange(Sender: TObject);
begin
  if cbbControl.ItemIndex = 1 then
  begin
    if (cbbRemotePort.ItemIndex = 0) and (cbbMainEnginePort.ItemIndex = 1)
    and (cbbGearBoxPort.ItemIndex = 0) then
    begin
      lblModeEngPort.Visible := True;
      cbbModeEngPort.Visible := True;
      trckbrHelmEngPort.Visible := True;
      lbl10.Visible := True;
    end
    else
    begin
      lblModeEngPort.Visible := False;
      cbbModeEngPort.Visible := False;
      trckbrHelmEngPort.Visible := False;
      lbl10.Visible := False;
    end;

    if (cbbRemoteStar.ItemIndex = 0) and (cbbMainEngineStar.ItemIndex = 1)
    and (cbbGearBoxStar.ItemIndex = 0) then
    begin
      lblModeEngStar.Visible := True;
      cbbModeEngStar.Visible := True;
      trckbrHelmEngStar.Visible := True;
      lbl11.Visible := True;
    end
    else
    begin
      lblModeEngStar.Visible := False;
      cbbModeEngStar.Visible := False;
      trckbrHelmEngStar.Visible := False;
      lbl11.Visible := False;
    end;
  end
  else
  begin
      lblModeEngStar.Visible := False;
      cbbModeEngStar.Visible := False;
      trckbrHelmEngStar.Visible := False;
      lbl11.Visible := False;

      lblModeEngPort.Visible := False;
      cbbModeEngPort.Visible := False;
      trckbrHelmEngPort.Visible := False;
      lbl10.Visible := False;
  end;
end;

procedure TfrmScenBuilder.cbbMainEnginePortChange(Sender: TObject);
begin
  if cbbControl.ItemIndex = 1 then
  begin
    if (cbbRemotePort.ItemIndex = 0) and (cbbMainEnginePort.ItemIndex = 1)
    and (cbbGearBoxPort.ItemIndex = 0) then
    begin
      lblModeEngPort.Visible := True;
      cbbModeEngPort.Visible := True;
      trckbrHelmEngPort.Visible := True;
      lbl10.Visible := True;
    end
    else
    begin
      lblModeEngPort.Visible := False;
      cbbModeEngPort.Visible := False;
      trckbrHelmEngPort.Visible := False;
      lbl10.Visible := False;
    end;

    if (cbbRemoteStar.ItemIndex = 0) and (cbbMainEngineStar.ItemIndex = 1)
    and (cbbGearBoxStar.ItemIndex = 0) then
    begin
      lblModeEngStar.Visible := True;
      cbbModeEngStar.Visible := True;
      trckbrHelmEngStar.Visible := True;
      lbl11.Visible := True;
    end
    else
    begin
      lblModeEngStar.Visible := False;
      cbbModeEngStar.Visible := False;
      trckbrHelmEngStar.Visible := False;
      lbl11.Visible := False;
    end;
  end
  else
  begin
      lblModeEngStar.Visible := False;
      cbbModeEngStar.Visible := False;
      trckbrHelmEngStar.Visible := False;
      lbl11.Visible := False;

      lblModeEngPort.Visible := False;
      cbbModeEngPort.Visible := False;
      trckbrHelmEngPort.Visible := False;
      lbl10.Visible := False;
  end;
end;

procedure TfrmScenBuilder.cbbMainEngineStarChange(Sender: TObject);
begin
  if cbbControl.ItemIndex = 1 then
  begin
    if (cbbRemotePort.ItemIndex = 0) and (cbbMainEnginePort.ItemIndex = 1)
    and (cbbGearBoxPort.ItemIndex = 0) then
    begin
      lblModeEngPort.Visible := True;
      cbbModeEngPort.Visible := True;
      trckbrHelmEngPort.Visible := True;
      lbl10.Visible := True;
    end
    else
    begin
      lblModeEngPort.Visible := False;
      cbbModeEngPort.Visible := False;
      trckbrHelmEngPort.Visible := False;
      lbl10.Visible := False;
    end;

    if (cbbRemoteStar.ItemIndex = 0) and (cbbMainEngineStar.ItemIndex = 1)
    and (cbbGearBoxStar.ItemIndex = 0) then
    begin
      lblModeEngStar.Visible := True;
      cbbModeEngStar.Visible := True;
      trckbrHelmEngStar.Visible := True;
      lbl11.Visible := True;
    end
    else
    begin
      lblModeEngStar.Visible := False;
      cbbModeEngStar.Visible := False;
      trckbrHelmEngStar.Visible := False;
      lbl11.Visible := False;
    end;
  end
  else
  begin
      lblModeEngStar.Visible := False;
      cbbModeEngStar.Visible := False;
      trckbrHelmEngStar.Visible := False;
      lbl11.Visible := False;

      lblModeEngPort.Visible := False;
      cbbModeEngPort.Visible := False;
      trckbrHelmEngPort.Visible := False;
      lbl10.Visible := False;
  end;
end;

procedure TfrmScenBuilder.cbbModeEngPortChange(Sender: TObject);
begin
  if cbbModeEngPort.ItemIndex = 0 then
  begin
    trckbrHelmEngPort.Min := -10;
  end
  else if cbbModeEngPort.ItemIndex = 1 then
  begin
    trckbrHelmEngPort.Min := 0;
  end;
end;

procedure TfrmScenBuilder.cbbModeEngStarChange(Sender: TObject);
begin
    if cbbModeEngStar.ItemIndex = 0 then
  begin
    trckbrHelmEngStar.Min := -10;
  end
  else if cbbModeEngStar.ItemIndex = 1 then
  begin
    trckbrHelmEngStar.Min := 0;
  end;
end;

procedure TfrmScenBuilder.cbbRemotePortChange(Sender: TObject);
begin
if cbbControl.ItemIndex = 1 then
  begin
    if (cbbRemotePort.ItemIndex = 0) and (cbbMainEnginePort.ItemIndex = 1)
    and (cbbGearBoxPort.ItemIndex = 0) then
    begin
      lblModeEngPort.Visible := True;
      cbbModeEngPort.Visible := True;
      trckbrHelmEngPort.Visible := True;
      lbl10.Visible := True;
    end
    else
    begin
      lblModeEngPort.Visible := False;
      cbbModeEngPort.Visible := False;
      trckbrHelmEngPort.Visible := False;
      lbl10.Visible := False;
    end;

    if (cbbRemoteStar.ItemIndex = 0) and (cbbMainEngineStar.ItemIndex = 1)
    and (cbbGearBoxStar.ItemIndex = 0) then
    begin
      lblModeEngStar.Visible := True;
      cbbModeEngStar.Visible := True;
      trckbrHelmEngStar.Visible := True;
      lbl11.Visible := True;
    end
    else
    begin
      lblModeEngStar.Visible := False;
      cbbModeEngStar.Visible := False;
      trckbrHelmEngStar.Visible := False;
      lbl11.Visible := False;
    end;
  end
  else
  begin
      lblModeEngStar.Visible := False;
      cbbModeEngStar.Visible := False;
      trckbrHelmEngStar.Visible := False;
      lbl11.Visible := False;

      lblModeEngPort.Visible := False;
      cbbModeEngPort.Visible := False;
      trckbrHelmEngPort.Visible := False;
      lbl10.Visible := False;
  end;
end;

procedure TfrmScenBuilder.cbbRemoteStarChange(Sender: TObject);
begin
  if cbbControl.ItemIndex = 1 then
  begin
    if (cbbRemotePort.ItemIndex = 0) and (cbbMainEnginePort.ItemIndex = 1)
    and (cbbGearBoxPort.ItemIndex = 0) then
    begin
      lblModeEngPort.Visible := True;
      cbbModeEngPort.Visible := True;
      trckbrHelmEngPort.Visible := True;
      lbl10.Visible := True;
    end
    else
    begin
      lblModeEngPort.Visible := False;
      cbbModeEngPort.Visible := False;
      trckbrHelmEngPort.Visible := False;
      lbl10.Visible := False;
    end;

    if (cbbRemoteStar.ItemIndex = 0) and (cbbMainEngineStar.ItemIndex = 1)
    and (cbbGearBoxStar.ItemIndex = 0) then
    begin
      lblModeEngStar.Visible := True;
      cbbModeEngStar.Visible := True;
      trckbrHelmEngStar.Visible := True;
      lbl11.Visible := True;
    end
    else
    begin
      lblModeEngStar.Visible := False;
      cbbModeEngStar.Visible := False;
      trckbrHelmEngStar.Visible := False;
      lbl11.Visible := False;
    end;
  end
  else
  begin
      lblModeEngStar.Visible := False;
      cbbModeEngStar.Visible := False;
      trckbrHelmEngStar.Visible := False;
      lbl11.Visible := False;

      lblModeEngPort.Visible := False;
      cbbModeEngPort.Visible := False;
      trckbrHelmEngPort.Visible := False;
      lbl10.Visible := False;
  end;
end;

procedure TfrmScenBuilder.trckbrHelmEngPortChange(Sender: TObject);
begin
  lblModeEngPort.Visible := True;
  lblModeEngPort.Caption := IntToStr(trckbrHelmEngPort.Position);
end;

procedure TfrmScenBuilder.trckbrHelmEngStarChange(Sender: TObject);
begin
  lblModeEngStar.Visible := True;
  lblModeEngStar.Caption := IntToStr(trckbrHelmEngStar.Position);
end;

{$ENDREGION}

{$REGION ' TANK Section '}

procedure TfrmScenBuilder.btnFullAllClick(Sender: TObject);
var
  i, j : integer;
begin
  if cbbSetValue.Text = '' then
  begin
    MessageDlg('Select the tank to be filled..!!', mtInformation, [mbOK], 0);
    Exit;
  end;

  if strtofloat(edtPersen.Text) > 100 then
    edtPersen.Text := '100'
  else if strtofloat(edtPersen.Text) < 0 then
    edtPersen.Text := '0';

  if cbbSetValue.ItemIndex = 0 then
  begin

    for I := 1 to 18 do
    begin
      for j := 0 to ComponentCount - 1 do
      begin
        if Components[j] is TEdit then
        begin
          if TEdit(Components[j]).Tag = i then
          begin
            TEdit(Components[j]).Text := floattostr(InstructorSys.Scenario.getMaxTankValue(TEdit(Components[j]).Hint)*
                                                    (strtofloat(edtPersen.Text)/100));
            break;
          end;
        end;
      end;
    end;
  end
  else
  begin
    for j := 0 to ComponentCount - 1 do
    begin
      if Components[j] is TEdit then
      begin
        if TEdit(Components[j]).Tag = (cbbSetValue.ItemIndex) then
        begin
          TEdit(Components[j]).Text := floattostr(InstructorSys.Scenario.getMaxTankValue(TEdit(Components[j]).Hint)*
                                                  (strtofloat(edtPersen.Text)/100));
          break;
        end;
      end;
    end;
  end;


end;

procedure TfrmScenBuilder.edtGBXLOTKKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9', #8, #13, #46]) then
    key := #0;
end;

procedure TfrmScenBuilder.edtMELOTKKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9', #8, #13, #46]) then
    key := #0;
end;

procedure TfrmScenBuilder.edtWBPSKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9', #8, #13, #46]) then
    key := #0;
end;

{$ENDREGION}

{$REGION ' FA Section '}
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
