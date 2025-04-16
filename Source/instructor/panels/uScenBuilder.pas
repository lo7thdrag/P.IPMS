unit uScenBuilder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ActnList, PlatformDefaultStyleActnCtrls, ActnMan, ToolWin,
  ActnCtrls, Mask, Buttons, uDBSupportClasses, ComCtrls, ExtCtrls, StrUtils,
  Grids, System.Actions, RzBmpBtn, Vcl.Imaging.pngimage, VrControls, VrButtons;

type
  TfrmScenBuilder = class(TForm)
    actmgr1: TActionManager;
    actNew: TAction;
    actPick: TAction;
    actSave: TAction;
    actDelete: TAction;
    actCancel: TAction;
    actmgr2: TActionManager;
    Action1: TAction;
    actDeleteRS: TAction;
    actChooseRS: TAction;
    actDeleteAll: TAction;
    actmgr3: TActionManager;
    act2: TAction;
    act4: TAction;
    act5: TAction;
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
    edtSessionName: TEdit;
    mmo1: TMemo;
    lbl4: TLabel;
    lblSessionID: TLabel;
    pnlPMS: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    lstPMS: TListBox;
    edtPMSConditionName: TEdit;
    pnlPCS: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    lstPCS: TListBox;
    edtPCSConditionName: TEdit;
    pnlTank: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    lstTank: TListBox;
    edtTankConditionName: TEdit;
    pnlFA: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    lstFA: TListBox;
    edtFAConditionName: TEdit;
    btnNewPCS: TRzBmpButton;
    btnEditPCS: TRzBmpButton;
    btnDeletePCS: TRzBmpButton;
    Label21: TLabel;
    pnlVariasi: TPanel;
    Image1: TImage;
    btnNewScenario: TRzBmpButton;
    btnEditScenario: TRzBmpButton;
    btnDeleteScenario: TRzBmpButton;
    btnNewSession: TRzBmpButton;
    btnEditSession: TRzBmpButton;
    btnDeleteSession: TRzBmpButton;
    btnNewFA: TRzBmpButton;
    btnEditFA: TRzBmpButton;
    btnDeleteFA: TRzBmpButton;
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
    btnNewTANK: TRzBmpButton;
    btnEditTANK: TRzBmpButton;
    btnDeleteTANK: TRzBmpButton;
    GroupBox3: TGroupBox;
    Label23: TLabel;
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
    grpAfter: TGroupBox;
    btnNewPMS: TRzBmpButton;
    btnEditPMS: TRzBmpButton;
    btnDeletePMS: TRzBmpButton;
    cbbModeGen3: TComboBox;
    cbbModeGen1: TComboBox;
    Label53: TLabel;
    Label54: TLabel;
    cbbModeGen2: TComboBox;
    Label55: TLabel;
    cbbModeGen4: TComboBox;
    Label56: TLabel;
    cbbCircuitBreaker1: TComboBox;
    Label57: TLabel;
    Label58: TLabel;
    cbbCircuitBreaker2: TComboBox;
    Label59: TLabel;
    cbbCircuitBreaker3: TComboBox;
    Label60: TLabel;
    cbbCircuitBreaker4: TComboBox;
    cbbCircuitBreakerFwd: TComboBox;
    GroupBox5: TGroupBox;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label43: TLabel;
    cbbCircuitBreakerAft: TComboBox;
    cbbCircuitBreakerEmFwd: TComboBox;
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
    chkEngineE: TCheckBox;
    cbbModeGenE: TComboBox;
    cbbCircuitBreakerE: TComboBox;
    GroupBox8: TGroupBox;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    cbbCircuitBreakerEmAft: TComboBox;
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
    lbl13: TLabel;
    lbl5: TLabel;
    lbl7: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    Label13: TLabel;
    btnSaveScenario: TRzBmpButton;
    btnRefreshScenario: TRzBmpButton;
    btnRefreshSession: TRzBmpButton;
    btnRefreshPMS: TRzBmpButton;
    btnSavePMS: TRzBmpButton;
    btnRefreshPCS: TRzBmpButton;
    btnSavePCS: TRzBmpButton;
    btnRefreshTANK: TRzBmpButton;
    btnSaveTANK: TRzBmpButton;
    btnRefreshFA: TRzBmpButton;
    btnSaveFA: TRzBmpButton;
    Panel1: TPanel;
    cbbSetValue: TComboBox;
    edtPersen: TEdit;
    lbl38: TLabel;
    btnFullAll: TButton;
    Panel2: TPanel;
    edtBILGEWTK: TEdit;
    edtFODAILYPS: TEdit;
    edtFODAILYSB: TEdit;
    edtFOLOADTRUNK: TEdit;
    edtFOOVTK: TEdit;
    edtFOTK1: TEdit;
    edtFOTK2: TEdit;
    edtFOTK3: TEdit;
    edtFOTK4: TEdit;
    edtFWROLLSTABTK: TEdit;
    edtFWTKPS: TEdit;
    edtFWTKSB: TEdit;
    edtGBXLOTK: TEdit;
    edtMELOTK: TEdit;
    edtSLDIRTYTK: TEdit;
    edtWBFWD: TEdit;
    edtWBPS: TEdit;
    edtWBSB: TEdit;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl18: TLabel;
    lbl19: TLabel;
    lbl20: TLabel;
    lbl21: TLabel;
    lbl22: TLabel;
    lbl23: TLabel;
    lbl24: TLabel;
    lbl25: TLabel;
    lbl26: TLabel;
    lbl27: TLabel;
    lbl28: TLabel;
    lbl29: TLabel;
    lbl30: TLabel;
    lbl31: TLabel;
    lbl32: TLabel;
    lbl33: TLabel;
    lbl34: TLabel;
    lbl35: TLabel;
    lbl36: TLabel;
    lbl37: TLabel;
    lbl6: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    cbbModeInnAft: TComboBox;
    cbbModeInnFwd: TComboBox;
    lbl39: TLabel;
    lbl40: TLabel;
    lbl43: TLabel;
    lbl44: TLabel;
    cbbModeInnEmAft: TComboBox;
    lbl45: TLabel;
    cbbModeInnEmFwd: TComboBox;
    lbl46: TLabel;
    lbl41: TPanel;
    lbl42: TLabel;
    lbl47: TPanel;
    lbl48: TLabel;
    trckbrHelmEngPort: TTrackBar;
    lblModeEngPort: TLabel;
    trckbrHelmEngStar: TTrackBar;
    lblModeEngStar: TLabel;
    img1: TImage;
    img2: TImage;
    img3: TImage;

    {$REGION ' Form Section '}
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    {$ENDREGION}

    {$REGION ' Scenario Section '}
    procedure btnRefreshScenarioClick(Sender: TObject);
    procedure btnNewScenarioClick(Sender: TObject);
    procedure btnEditScenarioClick(Sender: TObject);
    procedure btnDeleteScenarioClick(Sender: TObject);
    procedure btnSaveScenarioClick(Sender: TObject);
//    procedure btnPickClick(Sender: TObject);
    procedure btnClearPickClick(Sender: TObject);
    {$ENDREGION}

    {$REGION ' Session Section '}
    procedure btnRefreshSessionClick(Sender: TObject);
    procedure btnNewSessionClick(Sender: TObject);
    procedure btnEditSessionClick(Sender: TObject);
    procedure btnDeleteSessionClick(Sender: TObject);
    procedure btnSaveSessionClick(Sender: TObject);
    {$ENDREGION}

    {$REGION ' PMS Section '}
    procedure lstPMSClick(Sender: TObject);
    procedure btnRefreshPMSClick(Sender: TObject);
    procedure btnNewPMSClick(Sender: TObject);
    procedure btnEditPMSClick(Sender: TObject);
    procedure btnDeletePMSClick(Sender: TObject);
    procedure btnSavePMSClick(Sender: TObject);
    {$ENDREGION}

    {$REGION ' PCS Section '}
    procedure lstPCSClick(Sender: TObject);
    procedure btnRefreshPCSClick(Sender: TObject);
    procedure btnNewPCSClick(Sender: TObject);
    procedure btnEditPCSClick(Sender: TObject);
    procedure btnDeletePCSClick(Sender: TObject);
    procedure btnSavePCSClick(Sender: TObject);

    procedure cbbControlChange(Sender: TObject);
    procedure cbbModeEngPortChange(Sender: TObject);
    procedure cbbModeEngStarChange(Sender: TObject);
    procedure trckbrHelmEngPortChange(Sender: TObject);
    procedure trckbrHelmEngStarChange(Sender: TObject);
    {$ENDREGION}

    {$REGION ' TANK Section '}
    procedure lstTankClick(Sender: TObject);
    procedure btnRefreshTANKClick(Sender: TObject);
    procedure btnNewTANKClick(Sender: TObject);
    procedure btnEditTANKClick(Sender: TObject);
    procedure btnDeleteTANKClick(Sender: TObject);
    procedure btnSaveTANKClick(Sender: TObject);

    procedure btnFullAllClick(Sender: TObject);
    procedure edtOnKeyPress(Sender: TObject; var Key: Char);
    {$ENDREGION}

    {$REGION ' FA Section '}
    procedure btnRefreshFAClick(Sender: TObject);
    procedure btnNewFAClick(Sender: TObject);
    procedure btnEditFAClick(Sender: TObject);
    procedure btnDeleteFAClick(Sender: TObject);
    procedure btnSaveFAClick(Sender: TObject);
    {$ENDREGION}

    procedure actSaveExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actPickExecute(Sender: TObject);
    procedure actChooseRSExecute(Sender: TObject);
    procedure actDeleteRSExecute(Sender: TObject);
    procedure actDeleteAllExecute(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure act2Execute(Sender: TObject);
    procedure act4Execute(Sender: TObject);
    procedure btnMenuClick(Sender: TObject);

  private
    FScenarioID : Integer;
    FPMSConditionID : Integer;
    FPCSConditionID : Integer;
    FElementConditionID : Integer;
    FTANKConditionID : Integer;
    FFAConditionID : Integer;
    FSelectedConditionID : integer;

    FPMSConditionName : string;
    PMSNameBuffer : string;

    FPCSConditionName : string;
    PCSNameBuffer : string;

    FTANKConditionName : string;
    TANKNameBuffer : string;

    FPmsIDBuffer : array [0..8] of Integer;

    procedure ClearTabPickScen(value : Integer);

    {$REGION ' PMS Section '}
    function CekPMSInput: Boolean;

    procedure UpdatePMSList;
    {$ENDREGION}

    {$REGION ' PMS Section '}
    function CekPCSInput: Boolean;

    procedure UpdatePCSList;
    {$ENDREGION}

    {$REGION ' TANK Section '}
    function CekTANKInput: Boolean;

    procedure UpdateTankList;
    {$ENDREGION}

    {$REGION ' FA Section '}
    function CekFAInput: Boolean;

    procedure UpdateFAList;
    {$ENDREGION}

    //Global
    function GetNumberOfKoma(s : string): Boolean;

  public
    procedure UpdateScenarioList;
    procedure UpdateSessionList;

  end;

var
  frmScenBuilder: TfrmScenBuilder;

implementation

uses
  uDataType, uInstructorSystem, uFunction;

{$R *.dfm}

procedure EnableComposited(WinControl:TWinControl);
var
  i:Integer;
  NewExStyle:DWORD;
begin
  NewExStyle := GetWindowLong(WinControl.Handle, GWL_EXSTYLE) or WS_EX_COMPOSITED;
  SetWindowLong(WinControl.Handle, GWL_EXSTYLE, NewExStyle);

  for I := 0 to WinControl.ControlCount - 1 do
    if WinControl.Controls[i] is TWinControl then
      EnableComposited(TWinControl(WinControl.Controls[i]));
end;

{$REGION ' Form Section '}

procedure TfrmScenBuilder.FormCreate(Sender: TObject);
begin
  EnableComposited(pnlFA);
  EnableComposited(pnlHeader);
  EnableComposited(pnlMenu);
  EnableComposited(pnlPCS);
  EnableComposited(pnlPMS);
  EnableComposited(pnlScenario);
  EnableComposited(pnlSession);
  EnableComposited(pnlTank);
  EnableComposited(pnlVariasi);

  FScenarioID := 0;
  FSelectedConditionID := 0;
end;

procedure TfrmScenBuilder.FormShow(Sender: TObject);
begin
  pnlScenario.BringToFront;
  lblHeader.Caption := 'SCENARIO EDITOR';
  UpdateScenarioList;
end;

{$ENDREGION}

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
    btnNewScenarioClick(nil)
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
//  if not (Assigned(frmAvailScenario)) then
//    frmAvailScenario := TfrmAvailScenario.Create(Self);
//
//  scenarios := nil;
//  InstructorSys.Scenario.getSessions(scenarios);
//  frmAvailScenario.SetAvailableScenario(scenarios);
//  scenarios.Free;
//  lblSessionID.Caption := '0';

//  if frmAvailScenario.ShowModal = mrOk then
//  begin
//
//    if (frmAvailScenario.ScenarioName = '') then
//      Exit;
//
//    mmo1.Lines.Clear;
////    edt1.Text := '';
//
//    scenData := InstructorSys.Scenario.getSession(frmAvailScenario.ScenarioName);
//
//    if not Assigned(scenData) then
//      Exit;
//
////    edt1.Text := scenData.SessionName;
//
//    mmo1.Lines.Add('Session ' + IntToStr(scenData.SessionID) + ' from ' + scenData.OriginalScenario +
//        ' scenario');
//    mmo1.Lines.Add('Started at ' + DateTimeToStr(scenData.SessionStart));
//    mmo1.Lines.Add('Stopped at ' + DateTimeToStr(scenData.SessionStop));
//    lblSessionID.Caption := IntToStr(scenData.SessionID);
//  end;
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
//    edt1.Text := '';

    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmScenBuilder.actDeleteRSExecute(Sender: TObject);
var
  conname : string;
begin
//  if edt1.Text = '' then
//    Exit;

//  conname := edt1.Text;

  if MessageDlg('Are You Sure To Delete "' + conname + '" ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    if lblSessionID.Caption <> '0' then
    begin
      Screen.Cursor := crHourGlass;
      InstructorSys.Database.DeleteSession(False,StrToInt(lblSessionID.Caption));

      lblSessionID.Caption := '0';
      mmo1.Lines.Clear;
//      edt1.Text := '';

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

procedure TfrmScenBuilder.actPickExecute(Sender: TObject);
var
  scenarios : TStrings;
  scenData : TScenario_Data;
  i : integer;
  l : TStrings;
begin
//  if not (Assigned(frmAvailScenario)) then
//    frmAvailScenario := TfrmAvailScenario.Create(Self);
//
//  scenarios := nil;
//  InstructorSys.Scenario.getScenarios(scenarios);
//  frmAvailScenario.SetAvailableScenario(scenarios);
//  scenarios.Free;

//  if frmAvailScenario.ShowModal = mrOk then
//  begin
//    if (frmAvailScenario.ScenarioName = '') then
//      Exit;
//
//    scenData := InstructorSys.Scenario.getScenario(frmAvailScenario.ScenarioName);
//
//    if not Assigned(scenData) then
//      Exit;
//
//    FScenarioID := scenData.ID;
//    edtScenarioName.Text := scenData.Name;
//
//    mmoScenarioDescription.Lines.Clear;
//    mmoScenarioDescription.Lines.Add(scenData.Description);
//
//    FPMSConditionID := 0;
//    edtPMSName.Text := '<None>';
//    FPCSConditionID := 0;
//    edtPCSName.Text := '<None>';
//    FElementConditionID := 0;
//    edtElementName.Text := '<None>';
//    FTANKConditionID := 0;
//    edtTANKName.Text := '<None>';
//    FFAConditionID := 0;
//    edtFAName.Text := '<None>';
//
//    mmoPMSInfo.Lines.Clear;
//    mmoPCSInfo.Lines.Clear;
//    mmoTANKInfo.Lines.Clear;
//    mmoFAInfo.Lines.Clear;
//
//    for i := 0 to Length(scenData.ArrConditionID) - 1 do
//    begin
//      if scenData.ArrConditionType[i] = 'PMS' then
//      begin
//        FPMSConditionID := scenData.ArrConditionID[i];
//        edtPMSName.Text := scenData.ArrConditionName[i];
//
//        l := InstructorSys.Database.GetScenarioConditions(scenData.Name,'PMS');
//        mmoPMSInfo.Lines.AddStrings(l);
//        l.Free;
//      end;
//
//      if scenData.ArrConditionType[i] = 'PCS' then
//      begin
//        FPCSConditionID := scenData.ArrConditionID[i];
//        edtPCSName.Text := scenData.ArrConditionName[i];
//
//        l := InstructorSys.Database.GetScenarioConditions(scenData.Name,'PCS');
//        mmoPCSInfo.Lines.AddStrings(l);
//        l.Free;
//      end;
//
//      if scenData.ArrConditionType[i] = 'ELEMENT' then
//      begin
//        FElementConditionID := scenData.ArrConditionID[i];
//        edtElementName.Text := scenData.ArrConditionName[i];
//      end;
//
//      if scenData.ArrConditionType[i] = 'TANK' then
//      begin
//        FTANKConditionID := scenData.ArrConditionID[i];
//        edtTANKName.Text := scenData.ArrConditionName[i];
//      end;
//
//      if scenData.ArrConditionType[i] = 'FA' then
//      begin
//        FFAConditionID := scenData.ArrConditionID[i];
//        edtFAName.Text := scenData.ArrConditionName[i];
//      end;
//    end;
//
//    scenData.Free;
//  end;

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
      btnNewPMSClick(nil);
    end;
    3:
    begin
      pnlPCS.BringToFront;
      lblHeader.Caption := 'PPROPULSION EDITOR';
      UpdatePCSList;
      btnNewPCSClick(nil);
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


{$REGION ' Scenario Section '}

procedure TfrmScenBuilder.btnRefreshScenarioClick(Sender: TObject);
begin
  UpdatePMSList;
end;

procedure TfrmScenBuilder.btnNewScenarioClick(Sender: TObject);
begin
  edtScenarioName.Text := '';
  mmoScenarioDescription.Text := '';
  FScenarioID := 0;

  ClearTabPickScen(1);
  ClearTabPickScen(2);
  ClearTabPickScen(3);
  ClearTabPickScen(4);
  ClearTabPickScen(5);

//  edtPMSName.Text := '<None>';
//  mmoPMSInfo.Clear;
//  FPMSConditionID := 0;

//  edtPCSName.Text := '<None>';
//  mmoPCSInfo.Clear;
//  FPCSConditionID := 0;

//  edtElementName.Text := '<None>';
//  FElementConditionID := 0;

//  edtTANKName.Text := '<None>';
//  mmoTANKInfo.Clear;

//  edtFAName.Text := '<None>';
//  mmoFAInfo.Clear;
//  FFAConditionID := 0;
end;

procedure TfrmScenBuilder.btnEditScenarioClick(Sender: TObject);
var
  pmsNames : TStrings;
  pmsData : TPMSCond_Data;
  pmsList : TList;
  i : Integer;
begin
//  if not Assigned(frmAvailPMSCondition)  then
//    frmAvailPMSCondition := TfrmAvailPMSCondition.Create(Self);
//
//  pmsList := nil;
//  pmsNames := nil;
//  InstructorSys.Scenario.GetPMSConditions(pmsNames);
//  frmAvailPMSCondition.SetAvailableCondition(pmsNames);
//  pmsNames.Free;

//  if frmAvailPMSCondition.ShowModal = mrOk then
//  begin
//    if frmAvailPMSCondition.PMSCondName = '' then
//      Exit;

//    FCondition_ID := InstructorSys.Scenario.GetConditionID(frmAvailPMSCondition.PMSCondName);

//    InstructorSys.Scenario.GetPMSCondition(FCondition_ID, pmsList);

//    if pmsList.Count = 0 then
//      Exit;

//    edtCondName.Text := frmAvailPMSCondition.PMSCondName;

    {untuk flag ketika update dengan nama yang berbeda}
//    CondNameBuffer := frmAvailPMSCondition.PMSCondName;

//    for i := 0 to pmsList.Count - 1 do
//    begin
//      pmsData := TPMSCond_Data(pmsList.Items[i]);
//
//      case i of
//        0:
//        begin
////          SetMode(1, pmsData.PMS_Mode);
////          chkEngine1.Checked := (pmsData.PMS_OnOff = 1);
////          chkG1Pref.Checked := (pmsData.PMS_Pref = 1);
////          SetCB(1, pmsData.PMS_CB);
//        end;
//        1:
//        begin
////          SetMode(2, pmsData.PMS_Mode);
//          chkEngine2.Checked := (pmsData.PMS_OnOff = 1);
//          chkG2Pref.Checked := (pmsData.PMS_Pref = 1);
////          SetCB(2, pmsData.PMS_CB);
//        end;
//        2:
//        begin
////          SetMode(3, pmsData.PMS_Mode);
//          chkEngine3.Checked := (pmsData.PMS_OnOff = 1);
//          chkG3Pref.Checked := (pmsData.PMS_Pref = 1);
////          SetCB(3, pmsData.PMS_CB);
//        end;
//        3:
//        begin
//          SetMode(4, pmsData.PMS_Mode);
//          chkEngine4.Checked := (pmsData.PMS_OnOff = 1);
//          chkG4Pref.Checked := (pmsData.PMS_Pref = 1);
//          SetCB(4, pmsData.PMS_CB);
//        end;
//        4:
//        begin
//          SetMode(5, pmsData.PMS_Mode);
//          chkEngine5.Checked := (pmsData.PMS_OnOff = 1);
//          SetCB(5, pmsData.PMS_CB);
//        end;
//        5:
//        begin
//          SetMode(6, pmsData.PMS_SWB_MSBIntrMode);
//          SetCB(6, pmsData.PMS_SWB_MsbCBIntr);
//        end;
//        6:
//        begin
//          SetMode(7, pmsData.PMS_SWB_MSBIntrMode);
//          SetCB(7, pmsData.PMS_SWB_MsbCBIntr);
//        end;
//        7:
//        begin
//          SetMode(8, pmsData.PMS_SWB_ESBIntrMode);
//          SetCB(8, pmsData.PMS_SWB_EsbCBIntr);
//        end;
//      end;
//    end;

//    pmsList.Free;
//  end;
end;

procedure TfrmScenBuilder.btnDeleteScenarioClick(Sender: TObject);
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
//    btnNewScenario(nil);
//    MessageDlg('Delete "' + conname + '" Scenario Success', mtInformation, [mbOK], 0)
  end;
end;

procedure TfrmScenBuilder.btnSaveScenarioClick(Sender: TObject);
var
  pmsData : TPMSCond_Data;
  i, pmsType, pmsMode, pmsEngine, pmsPref, pmsCB,
  StateRunFull, StateRunFwd, StateRunAft : Integer;
  pmsName : string;
  PMSList : TList;
  ConditionID : Integer;
begin
//
end;

//procedure TfrmScenBuilder.btnPickClick(Sender: TObject);
//var
//  pickList,l : TStrings;
//begin
//  pickList := nil;
//
//  case TButton(Sender).Tag of
//    1:
//    begin
//      {$REGION ' PMS '}
//      if not Assigned(frmAvailPMSCondition)  then
//        frmAvailPMSCondition := TfrmAvailPMSCondition.Create(self);
//
//      frmAvailPMSCondition.Caption := 'Available PMS';
//
//      InstructorSys.Scenario.GetPMSConditions(pickList);
//      frmAvailPMSCondition.SetAvailableCondition(pickList);
//      pickList.Free;
//
//      if frmAvailPMSCondition.ShowModal = mrOk then
//      begin
//        if frmAvailPMSCondition.PMSCondName = '' then
//          Exit;
//
//        edtPMSName.Text := frmAvailPMSCondition.PMSCondName;
//        FPMSConditionID := InstructorSys.Database.GetConditionID(edtPMSName.Text);
//
//        mmoPMSInfo.Lines.Clear;
//        l := InstructorSys.Database.GetConditions(edtPMSName.Text,'PMS');
//        mmoPMSInfo.Lines.AddStrings(l);
//        l.Free;
//      end;
//      {$ENDREGION}
//    end;
//    2:
//    begin
//      {$REGION ' PCS '}
//      if not Assigned(frmAvailPCSCondition)  then
//        frmAvailPCSCondition := TfrmAvailPCSCondition.Create(self);
//
//      InstructorSys.Scenario.GetPCSConditions(pickList);
//      frmAvailPCSCondition.SetAvailableCondition(pickList);
//      pickList.Free;
//
//      if frmAvailPCSCondition.ShowModal = mrOk then
//      begin
//        if frmAvailPCSCondition.PCSCondName = '' then
//          Exit;
//
//        edtPCSName.Text := frmAvailPCSCondition.PCSCondName;
//        FPCSConditionID := InstructorSys.Database.GetConditionID(edtPCSName.Text);
//
//        mmoPCSInfo.Lines.Clear;
//        l := InstructorSys.Database.GetConditions(edtPCSName.Text,'PCS');
//        mmoPCSInfo.Lines.AddStrings(l);
//        l.Free;
//      end;
//      {$ENDREGION}
//    end;
//    3:
//    begin
//      {$REGION ' Element Data '}
//      if not Assigned(frmAvailPMSCondition)  then
//        frmAvailPMSCondition := TfrmAvailPMSCondition.Create(self);
//      frmAvailPMSCondition.Caption := 'Available Element Data';
//
//      InstructorSys.Scenario.GetElementConditions(pickList);
//      frmAvailPMSCondition.SetAvailableCondition(pickList);
//      pickList.Free;
//
//      if frmAvailPMSCondition.ShowModal = mrOk then
//      begin
//        if frmAvailPMSCondition.PMSCondName = '' then
//          Exit;
//
//        edtElementName.Text := frmAvailPMSCondition.PMSCondName;
//        FElementConditionID := InstructorSys.Database.GetConditionID(edtElementName.Text);
//      end;
//      {$ENDREGION}
//    end;
//    4:
//    begin
//      {$REGION ' TANK '}
//      if not Assigned(frmTanksCondition)  then
//        frmTanksCondition := TfrmTanksCondition.Create(self);
//
//      InstructorSys.Scenario.GetTanksConditions(pickList);
//      frmTanksCondition.SetAvailableCondition(pickList);
//      pickList.Free;
//
//      if frmTanksCondition.ShowModal = mrOk then
//      begin
//        if frmTanksCondition.TanksCondName = '' then
//          Exit;
//
//        edtTANKName.Text := frmTanksCondition.TanksCondName;
//        FTANKConditionID := InstructorSys.Database.GetConditionID(edtTANKName.Text);
//      end;
//      {$ENDREGION}
//    end;
//    5:
//    begin
//      {$REGION ' FA '}
//      if not Assigned(frmAvailFACondition)  then
//        frmAvailFACondition := TfrmAvailFACondition.Create(self);
//
//      InstructorSys.Scenario.GetFAConditions(pickList);
//      frmAvailFACondition.SetAvailableCondition(pickList);
//      pickList.Free;
//
//      if frmAvailFACondition.ShowModal = mrOk then
//      begin
//        if frmAvailFACondition.FACondName = '' then
//          Exit;
//
//        edtFAName.Text := frmAvailFACondition.FACondName;
//        FFAConditionID := InstructorSys.Database.GetConditionID(edtFAName.Text);
//      end;
//      {$ENDREGION}
//    end;
//  end;
//end;

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

{$REGION ' Session Section '}

procedure TfrmScenBuilder.btnRefreshSessionClick(Sender: TObject);
begin
  UpdatePMSList;
end;

procedure TfrmScenBuilder.btnNewSessionClick(Sender: TObject);
begin
//  FCondition_ID := 0;
//
//  edtCondName.Text := '';
//  rbAutGen1.Checked := True;
//  rbAutGen2.Checked := True;
//  rbAutGen3.Checked := True;
//  rbAutGen4.Checked := True;

  chkEngine1.Checked := True;
  chkEngine2.Checked := False;
  chkEngine3.Checked := False;
  chkEngine4.Checked := False;

  chkG1Pref.Checked := False;
  chkG2Pref.Checked := False;
  chkG3Pref.Checked := False;
  chkG4Pref.Checked := False;

//  rbAutInn1.Checked := True;
//  rbAutInn2.Checked := True;
end;

procedure TfrmScenBuilder.btnEditSessionClick(Sender: TObject);
var
  pmsNames : TStrings;
  pmsData : TPMSCond_Data;
  pmsList : TList;
  i : Integer;
begin
//  if not Assigned(frmAvailPMSCondition)  then
//    frmAvailPMSCondition := TfrmAvailPMSCondition.Create(Self);
//
//  pmsList := nil;
//  pmsNames := nil;
//  InstructorSys.Scenario.GetPMSConditions(pmsNames);
//  frmAvailPMSCondition.SetAvailableCondition(pmsNames);
//  pmsNames.Free;
//
//  if frmAvailPMSCondition.ShowModal = mrOk then
//  begin
//    if frmAvailPMSCondition.PMSCondName = '' then
//      Exit;
//
//    FCondition_ID := InstructorSys.Scenario.GetConditionID(frmAvailPMSCondition.PMSCondName);
//
//    InstructorSys.Scenario.GetPMSCondition(FCondition_ID, pmsList);
//
//    if pmsList.Count = 0 then
//      Exit;
//
//    edtCondName.Text := frmAvailPMSCondition.PMSCondName;
//
//    {untuk flag ketika update dengan nama yang berbeda}
//    CondNameBuffer := frmAvailPMSCondition.PMSCondName;
//
//    for i := 0 to pmsList.Count - 1 do
//    begin
//      pmsData := TPMSCond_Data(pmsList.Items[i]);
//
//      case i of
//        0:
//        begin
//          SetMode(1, pmsData.PMS_Mode);
//          chkEngine1.Checked := (pmsData.PMS_OnOff = 1);
//          chkG1Pref.Checked := (pmsData.PMS_Pref = 1);
//          SetCB(1, pmsData.PMS_CB);
//        end;
//        1:
//        begin
//          SetMode(2, pmsData.PMS_Mode);
//          chkEngine2.Checked := (pmsData.PMS_OnOff = 1);
//          chkG2Pref.Checked := (pmsData.PMS_Pref = 1);
//          SetCB(2, pmsData.PMS_CB);
//        end;
//        2:
//        begin
//          SetMode(3, pmsData.PMS_Mode);
//          chkEngine3.Checked := (pmsData.PMS_OnOff = 1);
//          chkG3Pref.Checked := (pmsData.PMS_Pref = 1);
//          SetCB(3, pmsData.PMS_CB);
//        end;
//        3:
//        begin
//          SetMode(4, pmsData.PMS_Mode);
//          chkEngine4.Checked := (pmsData.PMS_OnOff = 1);
//          chkG4Pref.Checked := (pmsData.PMS_Pref = 1);
//          SetCB(4, pmsData.PMS_CB);
//        end;
//        4:
//        begin
//          SetMode(5, pmsData.PMS_Mode);
//          chkEngine5.Checked := (pmsData.PMS_OnOff = 1);
//          SetCB(5, pmsData.PMS_CB);
//        end;
//        5:
//        begin
//          SetMode(6, pmsData.PMS_SWB_MSBIntrMode);
//          SetCB(6, pmsData.PMS_SWB_MsbCBIntr);
//        end;
//        6:
//        begin
//          SetMode(7, pmsData.PMS_SWB_MSBIntrMode);
//          SetCB(7, pmsData.PMS_SWB_MsbCBIntr);
//        end;
//        7:
//        begin
//          SetMode(8, pmsData.PMS_SWB_ESBIntrMode);
//          SetCB(8, pmsData.PMS_SWB_EsbCBIntr);
//        end;
//      end;
//    end;
//
//    pmsList.Free;
//  end;
end;

procedure TfrmScenBuilder.btnDeleteSessionClick(Sender: TObject);
var
  conname : string;
begin
//  if FCondition_ID = 0 then
//    Exit;
//
//  conname := edtCondName.Text;
//
//  if (MessageDlg('Are You Sure To Delete "' + edtCondName.Text + '" Condition ?', mtWarning, [mbYes, mbNo], 0)) = mrYes then
//  begin
//    if InstructorSys.Scenario.DeletePMSCondition(FCondition_ID) then
//    begin
//      actNewExecute(nil);
//      MessageDlg('Delete "' + conname + '" Condition Success', mtInformation, [mbOK], 0)
//    end
//    else
//      MessageDlg('Delete "' + conname + '" Condition Failed', mtError, [mbOK], 0);
//  end;

end;

procedure TfrmScenBuilder.btnSaveSessionClick(Sender: TObject);
var
  pmsData : TPMSCond_Data;
  i, pmsType, pmsMode, pmsEngine, pmsPref, pmsCB,
  StateRunFull, StateRunFwd, StateRunAft : Integer;
  pmsName : string;
  PMSList : TList;
  ConditionID : Integer;
begin
//  if Trim(edtCondName.Text) = '' then
//  begin
//    lblWarning2.Caption := '* Condition Name Is Empty, Please Insert Condition Name';
//    lblWarning2.Visible := True;
//    Exit;
//  end;
//
//  if FCondition_ID = 0 then
//  begin
//    if InstructorSys.Scenario.GetConditionID(edtCondName.Text) > 0 then
//    begin
//      lblWarning2.Caption := '* Condition Name Is Already In Use, Please Use Another Condition Name';
//      lblWarning2.Visible := True;
//      Exit;
//    end;
//
//    PMSList := TList.Create;
//
//    for i := 1 to 9 do
//    begin
//      GetPMSInfo(i, pmsName, pmsType, pmsMode, pmsEngine, pmsPref, pmsCB);
//      GetPMSVarInfo(i, StateRunFull, StateRunFwd, StateRunAft);
//
//      pmsData := TPMSCond_Data.Create;
//      pmsData.PMS_Name := pmsName;
//      pmsData.PMS_Type := pmsType;
//
//      if i <= 5 then {generator}
//      begin
//        pmsData.PMS_Mode := pmsMode;
//        pmsData.PMS_State := 1;
//        pmsData.PMS_OnOff := pmsEngine;
//        pmsData.PMS_Pref := pmsPref;
//        pmsData.PMS_CB := pmsCB;
//      end
//      else if i = 8 then {Switchboard Emergency}
//      begin
//        pmsData.PMS_SWB_ESBIntrMode := pmsMode;
//        pmsData.PMS_SWB_EsbCBIntr := pmsCB;
//      end
//      else if i = 9 then {Variable}
//      begin
//        pmsData.PMS_FirstLoad := 1;
//        pmsData.PMS_StateRunFull := StateRunFull;
//        pmsData.PMS_StateRunFwd := StateRunFwd;
//        pmsData.PMS_StateRunAft := StateRunAft;
//      end
//      else {Switchboard}
//      begin
//        pmsData.PMS_SWB_MSBIntrMode := pmsMode;
//        pmsData.PMS_SWB_MsbCBIntr := pmsCB;
//      end;
//
//      PMSList.Add(pmsData);
//    end;
//    InstructorSys.Scenario.SavePMSCondition(True, edtCondName.Text, PMSList, ConditionID);
//    MessageDlg('"' + edtCondName.Text + '" Condition Has Been Saved', mtInformation, [mbOK], 0);
//    actNewExecute(nil);
//  end
//  else if FCondition_ID > 0 then
//  begin
//    if CondNameBuffer <> edtCondName.Text then
//    begin
//      ShowMessage('Can Not Update PMS Condition With a Different Name');
//      Exit;
//    end;
//
//    PMSList := TList.Create;
//
//    for i := 1 to 9 do
//    begin
//      GetPMSInfo(i, pmsName, pmsType, pmsMode, pmsEngine, pmsPref, pmsCB);
//
//      pmsData := TPMSCond_Data.Create;
//      pmsData.PMS_ID := InstructorSys.Scenario.GetPMSCondID(FCondition_ID, i);
//      pmsData.PMS_Name := pmsName;
//      pmsData.PMS_Type := pmsType;
//
//      if i <= 5 then {generator}
//      begin
//        pmsData.PMS_Mode := pmsMode;
//        pmsData.PMS_State := 1;
//        pmsData.PMS_OnOff := pmsEngine;
//        pmsData.PMS_Pref := pmsPref;
//        pmsData.PMS_CB := pmsCB;
//      end
//      else if i >= 8 then {Switchboard Emergency}
//      begin
//        pmsData.PMS_SWB_ESBIntrMode := pmsMode;
//        pmsData.PMS_SWB_EsbCBIntr := pmsCB;
//      end
//      else if i = 9 then {Variable}
//      begin
//        pmsData.PMS_FirstLoad := 1;
//        pmsData.PMS_StateRunFull := StateRunFull;
//        pmsData.PMS_StateRunFwd := StateRunFwd;
//        pmsData.PMS_StateRunAft := StateRunAft;
//      end
//      else {Switchboard}
//      begin
//        pmsData.PMS_SWB_MSBIntrMode := pmsMode;
//        pmsData.PMS_SWB_MsbCBIntr := pmsCB;
//      end;
//
//      pmsData.Condition_ID := FCondition_ID;
//
//      PMSList.Add(pmsData);
//    end;
//
//    InstructorSys.Scenario.SavePMSCondition(False, edtCondName.Text, PMSList, ConditionID);
//    MessageDlg('"' + edtCondName.Text + '" Condition Has Been Updated', mtInformation, [mbOK], 0);
//    actNewExecute(nil);
//  end;
end;

{$ENDREGION}

{$REGION ' PMS Section '}

procedure TfrmScenBuilder.lstPMSClick(Sender: TObject);
var
  i : Integer;

begin
  if lstPMS.ItemIndex = -1 then
  begin
    btnNewPMSClick(nil);
    Exit;
  end;

  with lstPMS do
  begin
    for i := Items.Count - 1 downto 0 do
    begin
      if Selected[i] then
      begin
        FPMSConditionName := Items[i];
        FPMSConditionID := InstructorSys.Scenario.GetConditionID(FPMSConditionName);
        Break;
      end;
    end;
  end;
end;

procedure TfrmScenBuilder.btnRefreshPMSClick(Sender: TObject);
begin
  UpdatePMSList;
end;

procedure TfrmScenBuilder.btnNewPMSClick(Sender: TObject);
begin
  FPMSConditionID := 0;
  FPMSConditionName := '';
  PMSNameBuffer := '';
  edtPMSConditionName.Text := '';

  {$REGION ' Generator 1 '}
  cbbModeGen1.ItemIndex := 2;
  chkEngine1.Checked := False;
  chkG1Pref.Checked := False;
  cbbCircuitBreaker1.ItemIndex := 0;
  {$ENDREGION}

  {$REGION ' Generator 2 '}
  cbbModeGen2.ItemIndex := 2;
  chkEngine2.Checked := False;
  chkG2Pref.Checked := False;
  cbbCircuitBreaker2.ItemIndex := 0;
  {$ENDREGION}

  {$REGION ' Generator 3 '}
  cbbModeGen3.ItemIndex := 2;
  chkEngine3.Checked := False;
  chkG3Pref.Checked := False;
  cbbCircuitBreaker3.ItemIndex := 0;
  {$ENDREGION}

  {$REGION ' Generator 4 '}
  cbbModeGen4.ItemIndex := 2;
  chkEngine4.Checked := False;
  chkG4Pref.Checked := False;
  cbbCircuitBreaker4.ItemIndex := 0;
  {$ENDREGION}

  {$REGION ' Generator Emergency '}
  cbbModeGenE.ItemIndex := 2;
  chkEngineE.Checked := False;
  cbbCircuitBreakerE.ItemIndex := 0;
  {$ENDREGION}

  {$REGION ' Switchboard Forward '}
  cbbModeInnFwd.ItemIndex := 0;
  cbbCircuitBreakerFwd.ItemIndex := 0;
  {$ENDREGION}

  {$REGION ' Switchboard After '}
  cbbModeInnAft.ItemIndex := 0;
  cbbCircuitBreakerAft.ItemIndex := 0;
  {$ENDREGION}

  {$REGION ' Switchboard Emergency FWD '}
  cbbModeInnEmFwd.ItemIndex := 0;
  cbbCircuitBreakerEmFwd.ItemIndex := 0;
  {$ENDREGION}

  {$REGION ' Switchboard Emergency AFT '}
  cbbModeInnEmAft.ItemIndex := 0;
  cbbCircuitBreakerEmAft.ItemIndex := 0;
  {$ENDREGION}

end;

procedure TfrmScenBuilder.btnEditPMSClick(Sender: TObject);
var
  pmsDataTemp : TPMSCond_Data;
  pmsListTemp : TList;
  i : Integer;
begin

  if FPMSConditionID = 0 then
    Exit;

  pmsListTemp := nil;
  InstructorSys.Scenario.GetPMSCondition(FPMSConditionID, pmsListTemp);

  if pmsListTemp.Count = 0 then
    Exit;

  edtPMSConditionName.Text := FPMSConditionName;

  {untuk flag ketika update dengan nama yang berbeda}
  PMSNameBuffer := FPMSConditionName;

  for i := 0 to pmsListTemp.Count - 1 do
  begin
    pmsDataTemp := TPMSCond_Data(pmsListTemp.Items[i]);
    FPmsIDBuffer[i] := pmsDataTemp.PMS_ID;

    if pmsDataTemp.PMS_Name = C_GENERATOR_ID[0] then
    begin
      {$REGION ' Generator 1 '}
      cbbModeGen1.ItemIndex := pmsDataTemp.PMS_Mode;
      chkEngine1.Checked := (pmsDataTemp.PMS_OnOff = 1);
      chkG1Pref.Checked := (pmsDataTemp.PMS_Pref = 1);
      cbbCircuitBreaker1.ItemIndex := pmsDataTemp.PMS_CB;
      {$ENDREGION}
    end
    else if pmsDataTemp.PMS_Name = C_GENERATOR_ID[1] then
    begin
      {$REGION ' Generator 2 '}
      cbbModeGen2.ItemIndex := pmsDataTemp.PMS_Mode;
      chkEngine2.Checked := (pmsDataTemp.PMS_OnOff = 1);
      chkG2Pref.Checked := (pmsDataTemp.PMS_Pref = 1);
      cbbCircuitBreaker2.ItemIndex := pmsDataTemp.PMS_CB;
      {$ENDREGION}
    end
    else if pmsDataTemp.PMS_Name = C_GENERATOR_ID[2] then
    begin
      {$REGION ' Generator 3 '}
      cbbModeGen3.ItemIndex := pmsDataTemp.PMS_Mode;
      chkEngine3.Checked := (pmsDataTemp.PMS_OnOff = 1);
      chkG3Pref.Checked := (pmsDataTemp.PMS_Pref = 1);
      cbbCircuitBreaker3.ItemIndex := pmsDataTemp.PMS_CB;
      {$ENDREGION}
    end
    else if pmsDataTemp.PMS_Name = C_GENERATOR_ID[3] then
    begin
      {$REGION ' Generator 4 '}
      cbbModeGen4.ItemIndex := pmsDataTemp.PMS_Mode;
      chkEngine4.Checked := (pmsDataTemp.PMS_OnOff = 1);
      chkG4Pref.Checked := (pmsDataTemp.PMS_Pref = 1);
      cbbCircuitBreaker4.ItemIndex := pmsDataTemp.PMS_CB;
      {$ENDREGION}
    end
    else if pmsDataTemp.PMS_Name = C_GENERATOR_ID[4] then
    begin
      {$REGION ' Generator Emergency '}
      cbbModeGenE.ItemIndex := pmsDataTemp.PMS_Mode;
      chkEngineE.Checked := (pmsDataTemp.PMS_OnOff = 1);
      cbbCircuitBreakerE.ItemIndex := pmsDataTemp.PMS_CB;
      {$ENDREGION}
    end
    else if pmsDataTemp.PMS_Name = C_SWITCHBOARD_ID[0] then
    begin
      {$REGION ' Switchboard FWD '}
      cbbModeInnFwd.ItemIndex := pmsDataTemp.PMS_SWB_MSBIntrMode;
      cbbCircuitBreakerFwd.ItemIndex := pmsDataTemp.PMS_SWB_MsbCBIntr;
      {$ENDREGION}
    end
    else if pmsDataTemp.PMS_Name = C_SWITCHBOARD_ID[1] then
    begin
      {$REGION ' Switchboard AFT '}
      cbbModeInnAft.ItemIndex := pmsDataTemp.PMS_SWB_MSBIntrMode;
      cbbCircuitBreakerAft.ItemIndex := pmsDataTemp.PMS_SWB_MsbCBIntr;
      {$ENDREGION}
    end
    else if pmsDataTemp.PMS_Name = C_SWITCHBOARD_ID[2] then
    begin
      {$REGION ' Switchboard Emergency FWD '}
      cbbModeInnEmFwd.ItemIndex := pmsDataTemp.PMS_SWB_MSBIntrMode;
      cbbCircuitBreakerEmFwd.ItemIndex := pmsDataTemp.PMS_SWB_MsbCBIntr;
      {$ENDREGION}
    end
    else if pmsDataTemp.PMS_Name = C_SWITCHBOARD_ID[3] then
    begin
      {$REGION ' Switchboard Emergency AFT '}
      cbbModeInnEmAft.ItemIndex := pmsDataTemp.PMS_SWB_MSBIntrMode;
      cbbCircuitBreakerEmAft.ItemIndex := pmsDataTemp.PMS_SWB_MsbCBIntr;
      {$ENDREGION}
    end;
  end;

  pmsListTemp.Free;
end;

procedure TfrmScenBuilder.btnDeletePMSClick(Sender: TObject);
begin
  if FPMSConditionID = 0 then
    Exit;

  if (MessageDlg('Are You Sure To Delete "' + FPMSConditionName + '" Condition ?', mtWarning, [mbYes, mbNo], 0)) = mrYes then
  begin
    if InstructorSys.Scenario.DeletePMSCondition(FPMSConditionID) then
    begin
      MessageDlg('Delete "' + FPMSConditionName + '" Condition Success', mtInformation, [mbOK], 0);
      UpdatePMSList;
      btnNewPMSClick(nil);
    end
    else
      MessageDlg('Delete "' + FPMSConditionName + '" Condition Failed', mtError, [mbOK], 0);
  end;


end;

procedure TfrmScenBuilder.btnSavePMSClick(Sender: TObject);
var
  pmsDataTemp : TPMSCond_Data;
  pmsListTemp : TList;
begin

  if not CekPMSInput then
  begin
    Exit;
  end;

  pmsListTemp := TList.Create;

  {$REGION ' Generator 1 '}
  pmsDataTemp := TPMSCond_Data.Create;
  pmsDataTemp.PMS_Name := C_GENERATOR_ID[0];
  pmsDataTemp.PMS_Type := 1;
  pmsDataTemp.PMS_ID := FPmsIDBuffer[0];
  pmsDataTemp.Condition_ID := FPMSConditionID;

  pmsDataTemp.PMS_Mode := cbbModeGen1.ItemIndex;
  pmsDataTemp.PMS_State := 1;
  pmsDataTemp.PMS_OnOff := Ord(chkEngine1.Checked);
  pmsDataTemp.PMS_Pref := Ord(chkG1Pref.Checked);
  pmsDataTemp.PMS_CB := cbbCircuitBreaker1.ItemIndex;

  pmsListTemp.Add(pmsDataTemp);
  {$ENDREGION}

  {$REGION ' Generator 2 '}
  pmsDataTemp := TPMSCond_Data.Create;
  pmsDataTemp.PMS_Name := C_GENERATOR_ID[1];
  pmsDataTemp.PMS_Type := 1;
  pmsDataTemp.PMS_ID := FPmsIDBuffer[1];
  pmsDataTemp.Condition_ID := FPMSConditionID;

  pmsDataTemp.PMS_Mode := cbbModeGen2.ItemIndex;
  pmsDataTemp.PMS_State := 1;
  pmsDataTemp.PMS_OnOff := Ord(chkEngine2.Checked);
  pmsDataTemp.PMS_Pref := Ord(chkG2Pref.Checked);
  pmsDataTemp.PMS_CB := cbbCircuitBreaker2.ItemIndex;

  pmsListTemp.Add(pmsDataTemp);
  {$ENDREGION}

  {$REGION ' Generator 3 '}
  pmsDataTemp := TPMSCond_Data.Create;
  pmsDataTemp.PMS_Name := C_GENERATOR_ID[2];
  pmsDataTemp.PMS_Type := 1;
  pmsDataTemp.PMS_ID := FPmsIDBuffer[2];
  pmsDataTemp.Condition_ID := FPMSConditionID;

  pmsDataTemp.PMS_Mode := cbbModeGen3.ItemIndex;
  pmsDataTemp.PMS_State := 1;
  pmsDataTemp.PMS_OnOff := Ord(chkEngine3.Checked);
  pmsDataTemp.PMS_Pref := Ord(chkG3Pref.Checked);
  pmsDataTemp.PMS_CB := cbbCircuitBreaker3.ItemIndex;

  pmsListTemp.Add(pmsDataTemp);
  {$ENDREGION}

  {$REGION ' Generator 4 '}
  pmsDataTemp := TPMSCond_Data.Create;
  pmsDataTemp.PMS_Name := C_GENERATOR_ID[3];
  pmsDataTemp.PMS_Type := 1;
  pmsDataTemp.PMS_ID := FPmsIDBuffer[3];
  pmsDataTemp.Condition_ID := FPMSConditionID;

  pmsDataTemp.PMS_Mode := cbbModeGen4.ItemIndex;
  pmsDataTemp.PMS_State := 1;
  pmsDataTemp.PMS_OnOff := Ord(chkEngine4.Checked);
  pmsDataTemp.PMS_Pref := Ord(chkG4Pref.Checked);
  pmsDataTemp.PMS_CB := cbbCircuitBreaker4.ItemIndex;

  pmsListTemp.Add(pmsDataTemp);
  {$ENDREGION}

  {$REGION ' Generator Emergency '}
  pmsDataTemp := TPMSCond_Data.Create;
  pmsDataTemp.PMS_Name := C_GENERATOR_ID[4];
  pmsDataTemp.PMS_Type := 1;
  pmsDataTemp.PMS_ID := FPmsIDBuffer[4];
  pmsDataTemp.Condition_ID := FPMSConditionID;

  pmsDataTemp.PMS_Mode := cbbModeGenE.ItemIndex;
  pmsDataTemp.PMS_State := 1;
  pmsDataTemp.PMS_OnOff := Ord(chkEngineE.Checked);
  pmsDataTemp.PMS_CB := cbbCircuitBreakerE.ItemIndex;

  pmsListTemp.Add(pmsDataTemp);
  {$ENDREGION}

  {$REGION ' Switchboard Forward '}
  pmsDataTemp := TPMSCond_Data.Create;
  pmsDataTemp.PMS_Name := C_SWITCHBOARD_ID[0];
  pmsDataTemp.PMS_Type := 2;
  pmsDataTemp.PMS_ID := FPmsIDBuffer[5];
  pmsDataTemp.Condition_ID := FPMSConditionID;

  case cbbModeInnFwd.ItemIndex of
    0 : pmsDataTemp.PMS_SWB_MSBIntrMode := 1;
    1: pmsDataTemp.PMS_SWB_MSBIntrMode := 3;
  end;

  pmsDataTemp.PMS_SWB_MsbCBIntr := cbbCircuitBreakerFwd.ItemIndex;

  pmsListTemp.Add(pmsDataTemp);
  {$ENDREGION}

  {$REGION ' Switchboard After '}
  pmsDataTemp := TPMSCond_Data.Create;
  pmsDataTemp.PMS_Name := C_SWITCHBOARD_ID[1];
  pmsDataTemp.PMS_Type := 2;
  pmsDataTemp.PMS_ID := FPmsIDBuffer[6];
  pmsDataTemp.Condition_ID := FPMSConditionID;

  case cbbModeInnAft.ItemIndex of
    0 : pmsDataTemp.PMS_SWB_MSBIntrMode := 1;
    1: pmsDataTemp.PMS_SWB_MSBIntrMode := 3;
  end;

  pmsDataTemp.PMS_SWB_MsbCBIntr := cbbCircuitBreakerAft.ItemIndex;

  pmsListTemp.Add(pmsDataTemp);
  {$ENDREGION}

  {$REGION ' Switchboard Emergency FWD '}
  pmsDataTemp := TPMSCond_Data.Create;
  pmsDataTemp.PMS_Name := C_SWITCHBOARD_ID[2];
  pmsDataTemp.PMS_Type := 2;
  pmsDataTemp.PMS_ID := FPmsIDBuffer[7];
  pmsDataTemp.Condition_ID := FPMSConditionID;

  case cbbModeInnEmFwd.ItemIndex of
    0 : pmsDataTemp.PMS_SWB_MSBIntrMode := 1;
    1: pmsDataTemp.PMS_SWB_MSBIntrMode := 3;
  end;

  pmsDataTemp.PMS_SWB_MsbCBIntr := cbbCircuitBreakerEmFwd.ItemIndex;

  pmsListTemp.Add(pmsDataTemp);
  {$ENDREGION}

  {$REGION ' Switchboard Emergency AFT '}
  pmsDataTemp := TPMSCond_Data.Create;
  pmsDataTemp.PMS_Name := C_SWITCHBOARD_ID[3];
  pmsDataTemp.PMS_Type := 2;
  pmsDataTemp.PMS_ID := FPmsIDBuffer[8];
  pmsDataTemp.Condition_ID := FPMSConditionID;

  case cbbModeInnEmAft.ItemIndex of
    0 : pmsDataTemp.PMS_SWB_MSBIntrMode := 1;
    1: pmsDataTemp.PMS_SWB_MSBIntrMode := 3;
  end;

  pmsDataTemp.PMS_SWB_MsbCBIntr := cbbCircuitBreakerEmAft.ItemIndex;

  pmsListTemp.Add(pmsDataTemp);
  {$ENDREGION}

  if FPMSConditionID = 0 then
  begin
    InstructorSys.Scenario.SavePMSCondition(True, edtPMSConditionName.Text, pmsListTemp, FPMSConditionID);
    MessageDlg('"' + edtPMSConditionName.Text + '" Condition Has Been Saved', mtInformation, [mbOK], 0);
  end
  else
  begin
    InstructorSys.Scenario.SavePMSCondition(False, edtPMSConditionName.Text, pmsListTemp, FPMSConditionID);
    MessageDlg('"' + edtPMSConditionName.Text + '" Condition Has Been Updated', mtInformation, [mbOK], 0);
  end;

  btnNewPMSClick(nil);
  UpdatePMSList;
  pmsListTemp.Free;
end;

procedure TfrmScenBuilder.UpdatePMSList;
var
  i : Integer;
  tempList : TStrings;

begin
  tempList := nil;
  InstructorSys.Scenario.GetAllPMSConditions(tempList);

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

function TfrmScenBuilder.CekPMSInput: Boolean;
begin
  Result := False;

  if Trim(edtPMSConditionName.Text) = '' then
  begin
    ShowMessage('Condition Name Is Empty, Please Insert Condition Name');
    Exit;
  end;

  if InstructorSys.Scenario.GetConditionID(edtPMSConditionName.Text) > 0 then
  begin
    {Jika inputan baru}
    if FPMSConditionID = 0 then
    begin
      ShowMessage('Condition Name Is Already In Use, Please Use Another Condition Name');
      Exit;
    end
    else if PMSNameBuffer <> edtPMSConditionName.Text then
    begin
      ShowMessage('Condition Name Is Already In Use, Please Use Another Condition Name');
      Exit;
    end;
  end;

  Result := True;
end;

{$ENDREGION}

{$REGION ' PCS Section '}

procedure TfrmScenBuilder.lstPCSClick(Sender: TObject);
var
  i : Integer;

begin
  if lstPCS.ItemIndex = -1 then
  begin
    btnNewPCSClick(nil);
    Exit;
  end;

  with lstPCS do
  begin
    for i := Items.Count - 1 downto 0 do
    begin
      if Selected[i] then
      begin
        FPCSConditionName := Items[i];
        FPCSConditionID := InstructorSys.Scenario.GetConditionID(FPCSConditionName);
        Break;
      end;
    end;
  end;
end;

procedure TfrmScenBuilder.btnRefreshPCSClick(Sender: TObject);
begin
  UpdatePCSList;
end;

procedure TfrmScenBuilder.btnNewPCSClick(Sender: TObject);
begin
  FPCSConditionID := 0;
  FPCSConditionName := '';
  PCSNameBuffer := '';
  edtPCSConditionName.Text := '';

  cbbControl.ItemIndex := 0;

  cbbRemotePort.ItemIndex := 0;
  cbbRemoteStar.ItemIndex := 0;

  cbbMainEnginePort.ItemIndex := 0;
  cbbMainEngineStar.ItemIndex := 0;

  cbbGearBoxPort.ItemIndex := 0;
  cbbGearBoxStar.ItemIndex := 0;

  cbbModeEngPort.ItemIndex := 0;
  cbbModeEngStar.ItemIndex := 0;

  cbbControlChange(nil)
end;

procedure TfrmScenBuilder.btnEditPCSClick(Sender: TObject);
var
  pcsDataTemp : TPCSCond_Data;
  pcsListTemp : TList;
  i,j : Integer;

begin

  if FPCSConditionID = 0 then
    Exit;

  pcsListTemp := nil;
  InstructorSys.Scenario.GetPCSCondition(FPCSConditionID, pcsListTemp);

  if pcsListTemp.Count = 0 then
    Exit;

  edtPCSConditionName.Text := FPCSConditionName;

  {untuk flag ketika update dengan nama yang berbeda}
  PCSNameBuffer := FPCSConditionName;

  for i := 0 to pcsListTemp.Count - 1 do
  begin
    pcsDataTemp := TPCSCond_Data(pcsListTemp.Items[i]);
    for j := 0 to ComponentCount - 1 do
    begin
      if Components[j] is TComboBox then
      begin
        if TComboBox(Components[j]).Hint = pcsDataTemp.PCS_Name then
        begin
          TComboBox(Components[j]).ItemIndex := pcsDataTemp.PCS_State;
        end;
      end;
    end;

    if pcsDataTemp.PCS_Name = 'Mode Engine Port' then
    begin
      trckbrHelmEngPort.Position := pcsDataTemp.Value;
    end
    else if pcsDataTemp.PCS_Name = 'Mode Engine Starboard' then
    begin
      trckbrHelmEngStar.Position := pcsDataTemp.Value;
    end;

    cbbControlChange(nil);
  end;

  pcsListTemp.Free;
end;

procedure TfrmScenBuilder.btnDeletePCSClick(Sender: TObject);
begin
  if FPCSConditionID = 0 then
    Exit;

  if (MessageDlg('Are You Sure To Delete "' + FPCSConditionName + '" Condition ?', mtWarning, [mbYes, mbNo], 0)) = mrYes then
  begin
    if InstructorSys.Scenario.DeletePMSCondition(FPCSConditionID) then
    begin
      MessageDlg('Delete "' + FPCSConditionName + '" Condition Success', mtInformation, [mbOK], 0);
      UpdatePCSList;
      btnNewPMSClick(nil);
    end
    else
      MessageDlg('Delete "' + FPCSConditionName + '" Condition Failed', mtError, [mbOK], 0);
  end;

end;

procedure TfrmScenBuilder.btnSavePCSClick(Sender: TObject);
var
  pcsDataTemp : TPCSCond_Data;
  pcsListTemp : TList;
  j, i : Integer;

begin

  if not CekPCSInput then
  begin
    Exit;
  end;

  pcsListTemp := TList.Create;

  for i := 1 to 9 do
  begin
    pcsDataTemp := TPCSCond_Data.Create;

    for j := 0 to ComponentCount - 1 do
    begin
      if Components[j] is TComboBox then
      begin
        if TComboBox(Components[j]).Tag = i then
        begin

          pcsDataTemp.PCS_Name := TComboBox(Components[j]).Hint;
          pcsDataTemp.PCS_State := TComboBox(Components[j]).ItemIndex;
          pcsDataTemp.Condition_ID := FPCSConditionID;

          if pcsDataTemp.PCS_Name = 'Mode Engine Port' then
          begin
            pcsDataTemp.Value := trckbrHelmEngPort.Position;
          end
          else if pcsDataTemp.PCS_Name = 'Mode Engine Starboard' then
          begin
            pcsDataTemp.Value := trckbrHelmEngStar.Position;
          end;

        end;
      end;
    end;
    pcsListTemp.Add(pcsDataTemp);

  end;

  if FPCSConditionID = 0 then
  begin
    InstructorSys.Scenario.SavePCSCondition(True, edtPCSConditionName.Text, pcsListTemp, FPCSConditionID);
    MessageDlg('"' + edtPCSConditionName.Text + '" Condition Has Been Saved', mtInformation, [mbOK], 0);
  end
  else
  begin
    InstructorSys.Scenario.SavePCSCondition(False, edtPCSConditionName.Text, pcsListTemp, FPCSConditionID);
    MessageDlg('"' + edtPCSConditionName.Text + '" Condition Has Been Updated', mtInformation, [mbOK], 0);
  end;

  btnNewPCSClick(nil);
  UpdatePCSList;

  pcsListTemp.Free;
end;

procedure TfrmScenBuilder.cbbControlChange(Sender: TObject);
begin
  if cbbControl.ItemIndex = 1 then
  begin
    if (cbbRemotePort.ItemIndex = 0) and (cbbMainEnginePort.ItemIndex = 1) and (cbbGearBoxPort.ItemIndex = 0) then
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

    if (cbbRemoteStar.ItemIndex = 0) and (cbbMainEngineStar.ItemIndex = 1) and (cbbGearBoxStar.ItemIndex = 0) then
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

procedure TfrmScenBuilder.UpdatePCSList;
var
  i : Integer;
  tempList : TStrings;

begin
  tempList := nil;
  InstructorSys.Scenario.GetAllPCSConditions(tempList);

  if not Assigned(tempList) then
    Exit;

  if lstPCS.Count > 0 then
  lstPCS.Clear;

  for i := 0 to tempList.Count - 1 do
  begin
    lstPCS.Items.Add(tempList[i]);
  end;

  tempList.Free;
end;

function TfrmScenBuilder.CekFAInput: Boolean;
begin
 //
end;

function TfrmScenBuilder.CekPCSInput: Boolean;
begin
  Result := False;

  if Trim(edtPCSConditionName.Text) = '' then
  begin
    ShowMessage('Condition Name Is Empty, Please Insert Condition Name');
    Exit;
  end;

  if InstructorSys.Scenario.GetConditionID(edtPCSConditionName.Text) > 0 then
  begin
    {Jika inputan baru}
    if FPCSConditionID = 0 then
    begin
      ShowMessage('Condition Name Is Already In Use, Please Use Another Condition Name');
      Exit;
    end
    else if PCSNameBuffer <> edtPCSConditionName.Text then
    begin
      ShowMessage('Condition Name Is Already In Use, Please Use Another Condition Name');
      Exit;
    end;
  end;

  Result := True;
end;

{$ENDREGION}

{$REGION ' TANK Section '}

procedure TfrmScenBuilder.lstTankClick(Sender: TObject);
var
  i : Integer;

begin
  if lstTank.ItemIndex = -1 then
  begin
    btnNewTANKClick(nil);
    Exit;
  end;

  with lstTank do
  begin
    for i := Items.Count - 1 downto 0 do
    begin
      if Selected[i] then
      begin
        FTANKConditionName := Items[i];
        FTANKConditionID := InstructorSys.Scenario.GetConditionID(FTANKConditionName);
        Break;
      end;
    end;
  end;
end;

procedure TfrmScenBuilder.btnRefreshTANKClick(Sender: TObject);
begin
  UpdatePMSList;
end;

procedure TfrmScenBuilder.btnNewTANKClick(Sender: TObject);
var
  i: Integer;
begin
  FTANKConditionID := 0;
  FTANKConditionName := '';
  TANKNameBuffer := '';
  edtTANKConditionName.Text := '';

  edtWBPS.Text := '0';
  edtWBSB.Text := '0';
  edtWBFWD.Text := '0';
  edtFWTKPS.Text := '0';
  edtFWTKSB.Text := '0';
  edtFWROLLSTABTK.Text := '0';
  edtFOTK1.Text := '0';
  edtFOTK2.Text := '0';
  edtFOTK3.Text := '0';
  edtFOTK4.Text := '0';
  edtFOOVTK.Text := '0';
  edtFOLOADTRUNK.Text := '0';
  edtFODAILYPS.Text := '0';
  edtFODAILYSB.Text := '0';
  edtMELOTK.Text := '0';
  edtBILGEWTK.Text := '0';
  edtSLDIRTYTK.Text := '0';
  edtGBXLOTK.Text := '0';
 end;

procedure TfrmScenBuilder.btnEditTANKClick(Sender: TObject);
var
  tankDataTemp : TTanksCond_Data;
  tankListTemp : TList;
  i : Integer;

begin

  if FTANKConditionID = 0 then
    Exit;

  tankListTemp := nil;
  InstructorSys.Scenario.GetTanksCondition(FTANKConditionID, tankListTemp);

  if tankListTemp.Count = 0 then
    Exit;

  edtTankConditionName.Text := FTANKConditionName;

  {untuk flag ketika update dengan nama yang berbeda}
  TANKNameBuffer := FTANKConditionName;

  for i := 0 to tankListTemp.Count - 1 do
  begin
    tankDataTemp := TTanksCond_Data(tankListTemp.Items[i]);

    if tankDataTemp.Tanks_ElementID = '5292S0002A' then
     edtWBPS.Text := floattostr(tankDataTemp.Tanks_Value)
    else if tankDataTemp.Tanks_ElementID = '5292S0003A' then
     edtWBSB.Text := floattostr(tankDataTemp.Tanks_Value)
    else if tankDataTemp.Tanks_ElementID = '5292S0001A' then
     edtWBFWD.Text := floattostr(tankDataTemp.Tanks_Value)
    else if tankDataTemp.Tanks_ElementID = '5321S0002A' then
     edtFWTKPS.Text := floattostr(tankDataTemp.Tanks_Value)
    else if tankDataTemp.Tanks_ElementID = '5321S0001A' then
     edtFWTKSB.Text := floattostr(tankDataTemp.Tanks_Value)
    else if tankDataTemp.Tanks_ElementID = '5321S0003A' then
     edtFWROLLSTABTK.Text := floattostr(tankDataTemp.Tanks_Value)
    else if tankDataTemp.Tanks_ElementID = '5411S0001A' then
     edtFOTK1.Text := floattostr(tankDataTemp.Tanks_Value)
    else if tankDataTemp.Tanks_ElementID = '5411S0002A' then
     edtFOTK2.Text := floattostr(tankDataTemp.Tanks_Value)
    else if tankDataTemp.Tanks_ElementID = '5411S0003A' then
     edtFOTK3.Text := floattostr(tankDataTemp.Tanks_Value)
    else if tankDataTemp.Tanks_ElementID = '5411S0004A' then
     edtFOTK4.Text := floattostr(tankDataTemp.Tanks_Value)
    else if tankDataTemp.Tanks_ElementID = '5412S0010A' then
     edtFOOVTK.Text := floattostr(tankDataTemp.Tanks_Value)
    else if tankDataTemp.Tanks_ElementID = '5411S0006A' then
     edtFOLOADTRUNK.Text := floattostr(tankDataTemp.Tanks_Value)
    else if tankDataTemp.Tanks_ElementID = '5412S0004A' then
     edtFODAILYPS.Text := floattostr(tankDataTemp.Tanks_Value)
    else if tankDataTemp.Tanks_ElementID = '5412S0001A' then
     edtFODAILYSB.Text := floattostr(tankDataTemp.Tanks_Value)
    else if tankDataTemp.Tanks_ElementID = '2621S0002A' then
     edtMELOTK.Text := floattostr(tankDataTemp.Tanks_Value)
    else if tankDataTemp.Tanks_ElementID = '2621S0001A' then
     edtGBXLOTK.Text := floattostr(tankDataTemp.Tanks_Value)
    else if tankDataTemp.Tanks_ElementID = '5932S0001A' then
     edtBILGEWTK.Text := floattostr(tankDataTemp.Tanks_Value)
    else if tankDataTemp.Tanks_ElementID = '2622S0001A' then
     edtSLDIRTYTK.Text := floattostr(tankDataTemp.Tanks_Value)
  end;

  tankListTemp.Free;
end;

procedure TfrmScenBuilder.btnDeleteTANKClick(Sender: TObject);
begin
  if FTANKConditionID = 0 then
    Exit;

  if (MessageDlg('Are You Sure To Delete "' + FTANKConditionName + '" Condition ?', mtWarning, [mbYes, mbNo], 0)) = mrYes then
  begin
    if InstructorSys.Scenario.DeleteTanksCondition(FTANKConditionID) then
    begin
      MessageDlg('Delete "' + FTANKConditionName + '" Condition Success', mtInformation, [mbOK], 0);
      UpdateTankList;
      btnNewTANKClick(nil);
    end
    else
      MessageDlg('Delete "' + FTANKConditionName + '" Condition Failed', mtError, [mbOK], 0);
  end;

end;

procedure TfrmScenBuilder.btnSaveTANKClick(Sender: TObject);
var
  tankDataTemp : TTanksCond_Data;
  tankListTemp : TList;
  j, i : Integer;

begin
  if not CekTANKInput then
  begin
    Exit;
  end;

  tankListTemp := TList.Create;

  {$REGION ' WBPS '}
  tankDataTemp := TTanksCond_Data.Create;
  tankDataTemp.Condition_ID := FTANKConditionID;
  tankDataTemp.Tanks_ElementID := edtWBPS.Hint;
  tankDataTemp.Tanks_Value := StrToFloat(edtWBPS.Text);
  tankListTemp.Add(tankDataTemp);
  {$ENDREGION}

  {$REGION ' WBSB '}
  tankDataTemp := TTanksCond_Data.Create;
  tankDataTemp.Condition_ID := FTANKConditionID;
  tankDataTemp.Tanks_ElementID := edtWBSB.Hint;
  tankDataTemp.Tanks_Value := StrToFloat(edtWBSB.Text);
  tankListTemp.Add(tankDataTemp);
  {$ENDREGION}

  {$REGION ' WBFWD '}
  tankDataTemp := TTanksCond_Data.Create;
  tankDataTemp.Condition_ID := FTANKConditionID;
  tankDataTemp.Tanks_ElementID := edtWBFWD.Hint;
  tankDataTemp.Tanks_Value := StrToFloat(edtWBFWD.Text);
  tankListTemp.Add(tankDataTemp);
  {$ENDREGION}

  {$REGION ' FWTKPS '}
  tankDataTemp := TTanksCond_Data.Create;
  tankDataTemp.Condition_ID := FTANKConditionID;
  tankDataTemp.Tanks_ElementID := edtFWTKPS.Hint;
  tankDataTemp.Tanks_Value := StrToFloat(edtFWTKPS.Text);
  tankListTemp.Add(tankDataTemp);
  {$ENDREGION}

  {$REGION ' FWTKSB '}
  tankDataTemp := TTanksCond_Data.Create;
  tankDataTemp.Condition_ID := FTANKConditionID;
  tankDataTemp.Tanks_ElementID := edtFWTKSB.Hint;
  tankDataTemp.Tanks_Value := StrToFloat(edtFWTKSB.Text);
  tankListTemp.Add(tankDataTemp);
  {$ENDREGION}

  {$REGION ' FWROLLSTABTK '}
  tankDataTemp := TTanksCond_Data.Create;
  tankDataTemp.Condition_ID := FTANKConditionID;
  tankDataTemp.Tanks_ElementID := edtFWROLLSTABTK.Hint;
  tankDataTemp.Tanks_Value := StrToFloat(edtFWROLLSTABTK.Text);
  tankListTemp.Add(tankDataTemp);
  {$ENDREGION}

  {$REGION ' FOTK1 '}
  tankDataTemp := TTanksCond_Data.Create;
  tankDataTemp.Condition_ID := FTANKConditionID;
  tankDataTemp.Tanks_ElementID := edtFOTK1.Hint;
  tankDataTemp.Tanks_Value := StrToFloat(edtFOTK1.Text);
  tankListTemp.Add(tankDataTemp);
  {$ENDREGION}

  {$REGION ' FOTK2 '}
  tankDataTemp := TTanksCond_Data.Create;
  tankDataTemp.Condition_ID := FTANKConditionID;
  tankDataTemp.Tanks_ElementID := edtFOTK2.Hint;
  tankDataTemp.Tanks_Value := StrToFloat(edtFOTK2.Text);
  tankListTemp.Add(tankDataTemp);
  {$ENDREGION}

  {$REGION ' FOTK3 '}
  tankDataTemp := TTanksCond_Data.Create;
  tankDataTemp.Condition_ID := FTANKConditionID;
  tankDataTemp.Tanks_ElementID := edtFOTK3.Hint;
  tankDataTemp.Tanks_Value := StrToFloat(edtFOTK3.Text);
  tankListTemp.Add(tankDataTemp);
  {$ENDREGION}

  {$REGION ' FOTK4 '}
  tankDataTemp := TTanksCond_Data.Create;
  tankDataTemp.Condition_ID := FTANKConditionID;
  tankDataTemp.Tanks_ElementID := edtFOTK4.Hint;
  tankDataTemp.Tanks_Value := StrToFloat(edtFOTK4.Text);
  tankListTemp.Add(tankDataTemp);
  {$ENDREGION}

  {$REGION ' FOOVTK '}
  tankDataTemp := TTanksCond_Data.Create;
  tankDataTemp.Condition_ID := FTANKConditionID;
  tankDataTemp.Tanks_ElementID := edtFOOVTK.Hint;
  tankDataTemp.Tanks_Value := StrToFloat(edtFOOVTK.Text);
  tankListTemp.Add(tankDataTemp);
  {$ENDREGION}

  {$REGION ' FOLOADTRUNK '}
  tankDataTemp := TTanksCond_Data.Create;
  tankDataTemp.Condition_ID := FTANKConditionID;
  tankDataTemp.Tanks_ElementID := edtFOLOADTRUNK.Hint;
  tankDataTemp.Tanks_Value := StrToFloat(edtFOLOADTRUNK.Text);
  tankListTemp.Add(tankDataTemp);
  {$ENDREGION}

  {$REGION ' FODAILYPS '}
  tankDataTemp := TTanksCond_Data.Create;
  tankDataTemp.Condition_ID := FTANKConditionID;
  tankDataTemp.Tanks_ElementID := edtFODAILYPS.Hint;
  tankDataTemp.Tanks_Value := StrToFloat(edtFODAILYPS.Text);
  tankListTemp.Add(tankDataTemp);
  {$ENDREGION}

  {$REGION ' FODAILYSB '}
  tankDataTemp := TTanksCond_Data.Create;
  tankDataTemp.Condition_ID := FTANKConditionID;
  tankDataTemp.Tanks_ElementID := edtFODAILYSB.Hint;
  tankDataTemp.Tanks_Value := StrToFloat(edtFODAILYSB.Text);
  tankListTemp.Add(tankDataTemp);
  {$ENDREGION}

  {$REGION ' MELOTK '}
  tankDataTemp := TTanksCond_Data.Create;
  tankDataTemp.Condition_ID := FTANKConditionID;
  tankDataTemp.Tanks_ElementID := edtMELOTK.Hint;
  tankDataTemp.Tanks_Value := StrToFloat(edtMELOTK.Text);
  tankListTemp.Add(tankDataTemp);
  {$ENDREGION}

  {$REGION ' BILGEWTK '}
  tankDataTemp := TTanksCond_Data.Create;
  tankDataTemp.Condition_ID := FTANKConditionID;
  tankDataTemp.Tanks_ElementID := edtBILGEWTK.Hint;
  tankDataTemp.Tanks_Value := StrToFloat(edtBILGEWTK.Text);
  tankListTemp.Add(tankDataTemp);
  {$ENDREGION}

  {$REGION ' SLDIRTYTK '}
  tankDataTemp := TTanksCond_Data.Create;
  tankDataTemp.Condition_ID := FTANKConditionID;
  tankDataTemp.Tanks_ElementID := edtSLDIRTYTK.Hint;
  tankDataTemp.Tanks_Value := StrToFloat(edtSLDIRTYTK.Text);
  tankListTemp.Add(tankDataTemp);
  {$ENDREGION}

  {$REGION ' GBXLOTK '}
  tankDataTemp := TTanksCond_Data.Create;
  tankDataTemp.Condition_ID := FTANKConditionID;
  tankDataTemp.Tanks_ElementID := edtGBXLOTK.Hint;
  tankDataTemp.Tanks_Value := StrToFloat(edtGBXLOTK.Text);
  tankListTemp.Add(tankDataTemp);
  {$ENDREGION}

  if FTANKConditionID = 0 then
  begin
    InstructorSys.Scenario.SaveTanksCondition(True, edtTankConditionName.Text, tankListTemp, FTANKConditionID);
    MessageDlg('"' + edtTankConditionName.Text + '" Condition Has Been Saved', mtInformation, [mbOK], 0);
  end
  else
  begin
    InstructorSys.Scenario.SaveTanksCondition(False, edtTankConditionName.Text, tankListTemp, FTANKConditionID);
    MessageDlg('"' + edtTankConditionName.Text + '" Condition Has Been Updated', mtInformation, [mbOK], 0);
  end;

  btnNewTANKClick(nil);
  UpdateTankList;

  tankListTemp.Free;
end;

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

procedure TfrmScenBuilder.edtOnKeyPress(Sender: TObject; var Key: Char);
var
  value : Double;

begin
  if not (Key in[#48 .. #57, #8, #13, #46]) then
  begin
    Key := #0;
    Exit;
  end;

  if GetNumberOfKoma(TEdit(sender).Text) then
  begin
    if Key = #46 then
      Key := #0;
  end;
end;

function TfrmScenBuilder.CekTANKInput: Boolean;
begin
  Result := False;

  if Trim(edtTankConditionName.Text) = '' then
  begin
    ShowMessage('Condition Name Is Empty, Please Insert Condition Name');
    Exit;
  end;

  if InstructorSys.Scenario.GetConditionID(edtTankConditionName.Text) > 0 then
  begin
    {Jika inputan baru}
    if FTANKConditionID = 0 then
    begin
      ShowMessage('Condition Name Is Already In Use, Please Use Another Condition Name');
      Exit;
    end
    else if TANKNameBuffer <> edtTankConditionName.Text then
    begin
      ShowMessage('Condition Name Is Already In Use, Please Use Another Condition Name');
      Exit;
    end;
  end;

  {$REGION ' Cek Input WATER BALLAST TANK PS '}
  if not InstructorSys.Scenario.cekValidateTankValue(edtWBPS.Hint, StrToFloat(edtWBPS.Text)) then
  begin
    edtWBPS.Color := clRed;
    ShowMessage('WATER BALLAST TANK PS input out of range');
    Exit;
  end
  else
    edtWBPS.Color := clWindow;
  {$ENDREGION}

  {$REGION ' Cek Input WATER BALLAST TANK SB '}
  if not InstructorSys.Scenario.cekValidateTankValue(edtWBSB.Hint, StrToFloat(edtWBSB.Text)) then
  begin
    edtWBSB.Color := clRed;
    ShowMessage('WATER BALLAST TANK PS input out of range');
    Exit;
  end
  else
    edtWBSB.Color := clWindow;
  {$ENDREGION}

  {$REGION ' Cek Input WATER BALLAST TANK FWD '}
  if not InstructorSys.Scenario.cekValidateTankValue(edtWBFWD.Hint, StrToFloat(edtWBFWD.Text)) then
  begin
    edtWBFWD.Color := clRed;
    ShowMessage('WATER BALLAST TANK PS input out of range');
    Exit;
  end
  else
    edtWBFWD.Color := clWindow;
  {$ENDREGION}

  {$REGION ' Cek Input FRESH WATER TANK PS '}
  if not InstructorSys.Scenario.cekValidateTankValue(edtFWTKPS.Hint, StrToFloat(edtFWTKPS.Text)) then
  begin
    edtFWTKPS.Color := clRed;
    ShowMessage('WATER BALLAST TANK PS input out of range');
    Exit;
  end
  else
    edtFWTKPS.Color := clWindow;
  {$ENDREGION}

  {$REGION ' Cek Input FRESH WATER BALLAST SB '}
  if not InstructorSys.Scenario.cekValidateTankValue(edtFWTKSB.Hint, StrToFloat(edtFWTKSB.Text)) then
  begin
    edtFWTKSB.Color := clRed;
    ShowMessage('WATER BALLAST TANK PS input out of range');
    Exit;
  end
  else
    edtFWTKSB.Color := clWindow;
  {$ENDREGION}

  {$REGION ' Cek Input FRESH WATER ROLL STABLE TANK '}
  if not InstructorSys.Scenario.cekValidateTankValue(edtFWROLLSTABTK.Hint, StrToFloat(edtFWROLLSTABTK.Text)) then
  begin
    edtFWROLLSTABTK.Color := clRed;
    ShowMessage('WATER BALLAST TANK PS input out of range');
    Exit;
  end
  else
    edtFWROLLSTABTK.Color := clWindow;
  {$ENDREGION}

  {$REGION ' Cek Input FUEL OIL TANK 1 '}
  if not InstructorSys.Scenario.cekValidateTankValue(edtFOTK1.Hint, StrToFloat(edtFOTK1.Text)) then
  begin
    edtFOTK1.Color := clRed;
    ShowMessage('WATER BALLAST TANK PS input out of range');
    Exit;
  end
  else
    edtFOTK1.Color := clWindow;
  {$ENDREGION}

  {$REGION ' Cek Input FUEL OIL TANK 2 '}
  if not InstructorSys.Scenario.cekValidateTankValue(edtFOTK2.Hint, StrToFloat(edtFOTK2.Text)) then
  begin
    edtFOTK2.Color := clRed;
    ShowMessage('WATER BALLAST TANK PS input out of range');
    Exit;
  end
  else
    edtFOTK2.Color := clWindow;
  {$ENDREGION}

  {$REGION ' Cek Input FUEL OIL TANK 3 '}
  if not InstructorSys.Scenario.cekValidateTankValue(edtFOTK3.Hint, StrToFloat(edtFOTK3.Text)) then
  begin
    edtFOTK3.Color := clRed;
    ShowMessage('WATER BALLAST TANK PS input out of range');
    Exit;
  end
  else
    edtFOTK3.Color := clWindow;
  {$ENDREGION}

  {$REGION ' Cek Input FUEL OIL TANK 4 '}
  if not InstructorSys.Scenario.cekValidateTankValue(edtFOTK4.Hint, StrToFloat(edtFOTK4.Text)) then
  begin
    edtFOTK4.Color := clRed;
    ShowMessage('WATER BALLAST TANK PS input out of range');
    Exit;
  end
  else
    edtFOTK4.Color := clWindow;
  {$ENDREGION}

  {$REGION ' Cek Input FUEL OVERFLOW TANK '}
  if not InstructorSys.Scenario.cekValidateTankValue(edtFOOVTK.Hint, StrToFloat(edtFOOVTK.Text)) then
  begin
    edtFOOVTK.Color := clRed;
    ShowMessage('WATER BALLAST TANK PS input out of range');
    Exit;
  end
  else
    edtFOOVTK.Color := clWindow;
  {$ENDREGION}

  {$REGION ' Cek Input FUEL OIL LOADING TRUNK '}
  if not InstructorSys.Scenario.cekValidateTankValue(edtFOLOADTRUNK.Hint, StrToFloat(edtFOLOADTRUNK.Text)) then
  begin
    edtFOLOADTRUNK.Color := clRed;
    ShowMessage('WATER BALLAST TANK PS input out of range');
    Exit;
  end
  else
    edtFOLOADTRUNK.Color := clWindow;
  {$ENDREGION}

  {$REGION ' Cek Input FUEL DAILY TANK PS '}
  if not InstructorSys.Scenario.cekValidateTankValue(edtFODAILYPS.Hint, StrToFloat(edtFODAILYPS.Text)) then
  begin
    edtFODAILYPS.Color := clRed;
    ShowMessage('WATER BALLAST TANK PS input out of range');
    Exit;
  end
  else
    edtFODAILYPS.Color := clWindow;
  {$ENDREGION}

  {$REGION ' Cek Input FUEL DAILY TANK SB '}
  if not InstructorSys.Scenario.cekValidateTankValue(edtFODAILYSB.Hint, StrToFloat(edtFODAILYSB.Text)) then
  begin
    edtFODAILYSB.Color := clRed;
    ShowMessage('WATER BALLAST TANK PS input out of range');
    Exit;
  end
  else
    edtFODAILYSB.Color := clWindow;
  {$ENDREGION}

  {$REGION ' Cek Input ME LO TANK '}
  if not InstructorSys.Scenario.cekValidateTankValue(edtMELOTK.Hint, StrToFloat(edtMELOTK.Text)) then
  begin
    edtMELOTK.Color := clRed;
    ShowMessage('WATER BALLAST TANK PS input out of range');
    Exit;
  end
  else
    edtMELOTK.Color := clWindow;
  {$ENDREGION}

  {$REGION ' Cek Input BILGE WATER TANK '}
  if not InstructorSys.Scenario.cekValidateTankValue(edtBILGEWTK.Hint, StrToFloat(edtBILGEWTK.Text)) then
  begin
    edtBILGEWTK.Color := clRed;
    ShowMessage('WATER BALLAST TANK PS input out of range');
    Exit;
  end
  else
    edtBILGEWTK.Color := clWindow;
  {$ENDREGION}

  {$REGION ' Cek Input SLUDGE DIRTY OIL TANK '}
  if not InstructorSys.Scenario.cekValidateTankValue(edtSLDIRTYTK.Hint, StrToFloat(edtSLDIRTYTK.Text)) then
  begin
    edtSLDIRTYTK.Color := clRed;
    ShowMessage('WATER BALLAST TANK PS input out of range');
    Exit;
  end
  else
    edtSLDIRTYTK.Color := clWindow;
  {$ENDREGION}

  {$REGION ' Cek Input GEARBOX LO TANK '}
  if not InstructorSys.Scenario.cekValidateTankValue(edtGBXLOTK.Hint, StrToFloat(edtGBXLOTK.Text)) then
  begin
    edtGBXLOTK.Color := clRed;
    ShowMessage('WATER BALLAST TANK PS input out of range');
    Exit;
  end
  else
    edtGBXLOTK.Color := clWindow;
  {$ENDREGION}

  Result := True;
end;

{$ENDREGION}

{$REGION ' FA Section '}

procedure TfrmScenBuilder.btnRefreshFAClick(Sender: TObject);
begin
  UpdateFAList
end;

procedure TfrmScenBuilder.btnNewFAClick(Sender: TObject);
begin
//  FCondition_ID := 0;
//
//  edtCondName.Text := '';
//  rbAutGen1.Checked := True;
//  rbAutGen2.Checked := True;
//  rbAutGen3.Checked := True;
//  rbAutGen4.Checked := True;
//
//  chkEngine1.Checked := True;
//  chkEngine2.Checked := False;
//  chkEngine3.Checked := False;
//  chkEngine4.Checked := False;
//
//  chkG1Pref.Checked := False;
//  chkG2Pref.Checked := False;
//  chkG3Pref.Checked := False;
//  chkG4Pref.Checked := False;
//
//  rbAutInn1.Checked := True;
//  rbAutInn2.Checked := True;
end;

procedure TfrmScenBuilder.btnEditFAClick(Sender: TObject);
var
  pmsNames : TStrings;
  pmsData : TPMSCond_Data;
  pmsList : TList;
  i : Integer;
begin
//  if not Assigned(frmAvailPMSCondition)  then
//    frmAvailPMSCondition := TfrmAvailPMSCondition.Create(Self);
//
//  pmsList := nil;
//  pmsNames := nil;
//  InstructorSys.Scenario.GetPMSConditions(pmsNames);
//  frmAvailPMSCondition.SetAvailableCondition(pmsNames);
//  pmsNames.Free;

//  if frmAvailPMSCondition.ShowModal = mrOk then
//  begin
//    if frmAvailPMSCondition.PMSCondName = '' then
//      Exit;
//
//    FCondition_ID := InstructorSys.Scenario.GetConditionID(frmAvailPMSCondition.PMSCondName);
//
//    InstructorSys.Scenario.GetPMSCondition(FCondition_ID, pmsList);
//
//    if pmsList.Count = 0 then
//      Exit;
//
//    edtCondName.Text := frmAvailPMSCondition.PMSCondName;
//
//    {untuk flag ketika update dengan nama yang berbeda}
//    CondNameBuffer := frmAvailPMSCondition.PMSCondName;
//
//    for i := 0 to pmsList.Count - 1 do
//    begin
//      pmsData := TPMSCond_Data(pmsList.Items[i]);
//
//      case i of
//        0:
//        begin
//          SetMode(1, pmsData.PMS_Mode);
//          chkEngine1.Checked := (pmsData.PMS_OnOff = 1);
//          chkG1Pref.Checked := (pmsData.PMS_Pref = 1);
//          SetCB(1, pmsData.PMS_CB);
//        end;
//        1:
//        begin
//          SetMode(2, pmsData.PMS_Mode);
//          chkEngine2.Checked := (pmsData.PMS_OnOff = 1);
//          chkG2Pref.Checked := (pmsData.PMS_Pref = 1);
//          SetCB(2, pmsData.PMS_CB);
//        end;
//        2:
//        begin
//          SetMode(3, pmsData.PMS_Mode);
//          chkEngine3.Checked := (pmsData.PMS_OnOff = 1);
//          chkG3Pref.Checked := (pmsData.PMS_Pref = 1);
//          SetCB(3, pmsData.PMS_CB);
//        end;
//        3:
//        begin
//          SetMode(4, pmsData.PMS_Mode);
//          chkEngine4.Checked := (pmsData.PMS_OnOff = 1);
//          chkG4Pref.Checked := (pmsData.PMS_Pref = 1);
//          SetCB(4, pmsData.PMS_CB);
//        end;
//        4:
//        begin
//          SetMode(5, pmsData.PMS_Mode);
//          chkEngine5.Checked := (pmsData.PMS_OnOff = 1);
//          SetCB(5, pmsData.PMS_CB);
//        end;
//        5:
//        begin
//          SetMode(6, pmsData.PMS_SWB_MSBIntrMode);
//          SetCB(6, pmsData.PMS_SWB_MsbCBIntr);
//        end;
//        6:
//        begin
//          SetMode(7, pmsData.PMS_SWB_MSBIntrMode);
//          SetCB(7, pmsData.PMS_SWB_MsbCBIntr);
//        end;
//        7:
//        begin
//          SetMode(8, pmsData.PMS_SWB_ESBIntrMode);
//          SetCB(8, pmsData.PMS_SWB_EsbCBIntr);
//        end;
//      end;
//    end;
//
//    pmsList.Free;
//  end;
end;

procedure TfrmScenBuilder.btnDeleteFAClick(Sender: TObject);
var
  conname : string;
begin
//  if FCondition_ID = 0 then
//    Exit;
//
//  conname := edtCondName.Text;
//
//  if (MessageDlg('Are You Sure To Delete "' + edtCondName.Text + '" Condition ?', mtWarning, [mbYes, mbNo], 0)) = mrYes then
//  begin
//    if InstructorSys.Scenario.DeletePMSCondition(FCondition_ID) then
//    begin
//      actNewExecute(nil);
//      MessageDlg('Delete "' + conname + '" Condition Success', mtInformation, [mbOK], 0)
//    end
//    else
//      MessageDlg('Delete "' + conname + '" Condition Failed', mtError, [mbOK], 0);
//  end;

end;

procedure TfrmScenBuilder.btnSaveFAClick(Sender: TObject);
//var
//  i, ConditionID : Integer;
//  faData : TFACond_Data;
//  faList : TList;
begin
  if edtFAConditionName.Text = '' then
  begin
    ShowMessage('Condition Name Is Empty, Please Insert Condition Name');
    Exit;
  end;

//  faList := nil;
//  faData := nil;

//  if FCondition_ID = 0 then
//  begin
//    faList := TList.Create;
//
//    for i := 1 to 4 do
//    begin
//      if InstructorSys.Scenario.GetConditionID(edtName.Text) > 0 then
//      begin
//        lblWarning2.Caption := '* Condition Name Is Already In Use, Please Use Another Condition Name';
//        lblWarning2.Visible := True;
//        Exit;
//      end;
//
//      faData := TFACond_Data.Create;
//
//      case i of
//        1:
//        begin
//          faData.Role := 'MCR_IPMS';
//          faData.FA_DGSETS_State := Ord(CheckBox1.Checked);
//          faData.FA_Distribution_State := Ord(CheckBox2.Checked);
//          faData.FA_Propultion_State := Ord(CheckBox3.Checked);
//          faData.FA_Auxiliary_State := Ord(CheckBox4.Checked);
//          faData.FA_Fuel_State := Ord(CheckBox5.Checked);
//          faData.FA_Domest_State := Ord(CheckBox6.Checked);
//          faData.FA_HVAC_State := Ord(CheckBox7.Checked);
//          faData.FA_FFDC_State := Ord(CheckBox8.Checked);
//          faData.FA_Navigation_State := Ord(CheckBox9.Checked);
//          faData.FA_Ballast_State := Ord(CheckBox10.Checked);
//          faData.FA_IPMS_State := Ord(CheckBox11.Checked);
//          faData.FA_IAS_State := Ord(CheckBox12.Checked);
//        end;
//        2:
//        begin
//          faData.Role := 'MCR_AUX';
//          faData.FA_DGSETS_State := Ord(CheckBox13.Checked);
//          faData.FA_Distribution_State := Ord(CheckBox14.Checked);
//          faData.FA_Propultion_State := Ord(CheckBox15.Checked);
//          faData.FA_Auxiliary_State := Ord(CheckBox16.Checked);
//          faData.FA_Fuel_State := Ord(CheckBox17.Checked);
//          faData.FA_Domest_State := Ord(CheckBox18.Checked);
//          faData.FA_HVAC_State := Ord(CheckBox19.Checked);
//          faData.FA_FFDC_State := Ord(CheckBox20.Checked);
//          faData.FA_Navigation_State := Ord(CheckBox21.Checked);
//          faData.FA_Ballast_State := Ord(CheckBox22.Checked);
//          faData.FA_IPMS_State := Ord(CheckBox23.Checked);
//          faData.FA_IAS_State := Ord(CheckBox24.Checked);
//        end;
//        3:
//        begin
//          faData.Role := 'MCR_PCS';
//          faData.FA_DGSETS_State := Ord(CheckBox25.Checked);
//          faData.FA_Distribution_State := Ord(CheckBox26.Checked);
//          faData.FA_Propultion_State := Ord(CheckBox27.Checked);
//          faData.FA_Auxiliary_State := Ord(CheckBox28.Checked);
//          faData.FA_Fuel_State := Ord(CheckBox29.Checked);
//          faData.FA_Domest_State := Ord(CheckBox30.Checked);
//          faData.FA_HVAC_State := Ord(CheckBox31.Checked);
//          faData.FA_FFDC_State := Ord(CheckBox32.Checked);
//          faData.FA_Navigation_State := Ord(CheckBox33.Checked);
//          faData.FA_Ballast_State := Ord(CheckBox34.Checked);
//          faData.FA_IPMS_State := Ord(CheckBox35.Checked);
//          faData.FA_IAS_State := Ord(CheckBox36.Checked);
//        end;
//        4:
//        begin
//          faData.Role := 'MCR_E';
//          faData.FA_DGSETS_State := Ord(CheckBox37.Checked);
//          faData.FA_Distribution_State := Ord(CheckBox38.Checked);
//          faData.FA_Propultion_State := Ord(CheckBox39.Checked);
//          faData.FA_Auxiliary_State := Ord(CheckBox40.Checked);
//          faData.FA_Fuel_State := Ord(CheckBox41.Checked);
//          faData.FA_Domest_State := Ord(CheckBox42.Checked);
//          faData.FA_HVAC_State := Ord(CheckBox43.Checked);
//          faData.FA_FFDC_State := Ord(CheckBox44.Checked);
//          faData.FA_Navigation_State := Ord(CheckBox45.Checked);
//          faData.FA_Ballast_State := Ord(CheckBox46.Checked);
//          faData.FA_IPMS_State := Ord(CheckBox47.Checked);
//          faData.FA_IAS_State := Ord(CheckBox48.Checked);
//        end;
//      end;
//
//      faList.Add(faData);
//    end;
//
//    InstructorSys.Scenario.SaveFACondition(True, edtName.Text, faList, ConditionID);
//    MessageDlg('"' + edtName.Text + '" Condition Has Been Saved', mtInformation, [mbOK], 0);
//    actNewExecute(nil);
//  end
//  else if FCondition_ID > 0 then
//  begin
//    if CondNameBuffer <> edtName.Text then
//    begin
//      ShowMessage('Can Not Update FA Condition With a Different Name');
//      Exit;
//    end;
//
//    faList := TList.Create;
//
//    for i := 1 to 4 do
//    begin
//      faData := TFACond_Data.Create;
//      faData.FA_ID := InstructorSys.Scenario.GetFACondID(FCondition_ID, i);
//
//      case i of
//        1:
//        begin
//          faData.Role := 'MCR_IPMS';
//          faData.FA_DGSETS_State := Ord(CheckBox1.Checked);
//          faData.FA_Distribution_State := Ord(CheckBox2.Checked);
//          faData.FA_Propultion_State := Ord(CheckBox3.Checked);
//          faData.FA_Auxiliary_State := Ord(CheckBox4.Checked);
//          faData.FA_Fuel_State := Ord(CheckBox5.Checked);
//          faData.FA_Domest_State := Ord(CheckBox6.Checked);
//          faData.FA_HVAC_State := Ord(CheckBox7.Checked);
//          faData.FA_FFDC_State := Ord(CheckBox8.Checked);
//          faData.FA_Navigation_State := Ord(CheckBox9.Checked);
//          faData.FA_Ballast_State := Ord(CheckBox10.Checked);
//          faData.FA_IPMS_State := Ord(CheckBox11.Checked);
//          faData.FA_IAS_State := Ord(CheckBox12.Checked);
//        end;
//        2:
//        begin
//          faData.Role := 'MCR_AUX';
//          faData.FA_DGSETS_State := Ord(CheckBox13.Checked);
//          faData.FA_Distribution_State := Ord(CheckBox14.Checked);
//          faData.FA_Propultion_State := Ord(CheckBox15.Checked);
//          faData.FA_Auxiliary_State := Ord(CheckBox16.Checked);
//          faData.FA_Fuel_State := Ord(CheckBox17.Checked);
//          faData.FA_Domest_State := Ord(CheckBox18.Checked);
//          faData.FA_HVAC_State := Ord(CheckBox19.Checked);
//          faData.FA_FFDC_State := Ord(CheckBox20.Checked);
//          faData.FA_Navigation_State := Ord(CheckBox21.Checked);
//          faData.FA_Ballast_State := Ord(CheckBox22.Checked);
//          faData.FA_IPMS_State := Ord(CheckBox23.Checked);
//          faData.FA_IAS_State := Ord(CheckBox24.Checked);
//        end;
//        3:
//        begin
//          faData.Role := 'MCR_PCS';
//          faData.FA_DGSETS_State := Ord(CheckBox25.Checked);
//          faData.FA_Distribution_State := Ord(CheckBox26.Checked);
//          faData.FA_Propultion_State := Ord(CheckBox27.Checked);
//          faData.FA_Auxiliary_State := Ord(CheckBox28.Checked);
//          faData.FA_Fuel_State := Ord(CheckBox29.Checked);
//          faData.FA_Domest_State := Ord(CheckBox30.Checked);
//          faData.FA_HVAC_State := Ord(CheckBox31.Checked);
//          faData.FA_FFDC_State := Ord(CheckBox32.Checked);
//          faData.FA_Navigation_State := Ord(CheckBox33.Checked);
//          faData.FA_Ballast_State := Ord(CheckBox34.Checked);
//          faData.FA_IPMS_State := Ord(CheckBox35.Checked);
//          faData.FA_IAS_State := Ord(CheckBox36.Checked);
//        end;
//        4:
//        begin
//          faData.Role := 'MCR_E';
//          faData.FA_DGSETS_State := Ord(CheckBox37.Checked);
//          faData.FA_Distribution_State := Ord(CheckBox38.Checked);
//          faData.FA_Propultion_State := Ord(CheckBox39.Checked);
//          faData.FA_Auxiliary_State := Ord(CheckBox40.Checked);
//          faData.FA_Fuel_State := Ord(CheckBox41.Checked);
//          faData.FA_Domest_State := Ord(CheckBox42.Checked);
//          faData.FA_HVAC_State := Ord(CheckBox43.Checked);
//          faData.FA_FFDC_State := Ord(CheckBox44.Checked);
//          faData.FA_Navigation_State := Ord(CheckBox45.Checked);
//          faData.FA_Ballast_State := Ord(CheckBox46.Checked);
//          faData.FA_IPMS_State := Ord(CheckBox47.Checked);
//          faData.FA_IAS_State := Ord(CheckBox48.Checked);
//        end;
//      end;
//
//      faData.Condition_ID := FCondition_ID;
//      faList.Add(faData);
//    end;
//
//    InstructorSys.Scenario.SaveFACondition(False, edtName.Text, faList, ConditionID);
//    MessageDlg('"' + edtName.Text + '" Condition Has Been Updated', mtInformation, [mbOK], 0);
//    actNewExecute(nil);
//  end;
//
//  if Assigned(faData) then
//    faData.Free;
//
//  if Assigned(faList) then
//    faList.Free;
end;

{$ENDREGION}

{$REGION ' Update Procedure Section '}

function TfrmScenBuilder.GetNumberOfKoma(s: string): Boolean;
var
  a, i : Integer;
begin
  Result := False;
  a := 0;

  for i := 1 to length(s) do
  begin
    if s[i] = '.' then
      a := a + 1;
  end;

  if a > 0 then
    Result := True;
end;

procedure TfrmScenBuilder.UpdateScenarioList;
var
  i : Integer;
  tempList : TStrings;
begin
  tempList := nil;
  InstructorSys.Scenario.getScenarios(tempList);

  if not Assigned(tempList) then
    Exit;

//  if lstAvail.Count > 0 then
//  lstAvail.Clear;
//
//  for i := 0 to tempList.Count - 1 do
//  begin
//    lstAvail.Items.Add(tempList[i]);
//  end;

  tempList.Free;
end;

procedure TfrmScenBuilder.UpdateSessionList;
var
  i : Integer;
  tempList : TStrings;

begin
  tempList := nil;
  InstructorSys.Scenario.GetAllPMSConditions(tempList);

  if not Assigned(tempList) then
    Exit;

  if lstPMS.Count > 0 then
//  lstAvail.Clear;

  for i := 0 to tempList.Count - 1 do
  begin
    lstPMS.Items.Add(tempList[i]);
  end;

  tempList.Free;
end;

procedure TfrmScenBuilder.UpdateTankList;
var
  i : Integer;
  tempList : TStrings;

begin
  tempList := nil;
  InstructorSys.Scenario.GetAllTanksConditions(tempList);

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
