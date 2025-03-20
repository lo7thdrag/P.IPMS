unit uScenBuilder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ActnList, PlatformDefaultStyleActnCtrls, ActnMan, ToolWin,
  ActnCtrls, Mask, Buttons, uDBSupportClasses, ComCtrls, ExtCtrls, StrUtils,
  Grids, System.Actions;

type
  TfrmScenBuilder = class(TForm)
    scrlbx1: TScrollBox;
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
    grpScenario: TGroupBox;
    lblName: TLabel;
    lblDescription: TLabel;
    edtName: TEdit;
    mmoDescription: TMemo;
    pgc1: TPageControl;
    tsPMS: TTabSheet;
    lblPMSState: TLabel;
    lblPMSInfo: TLabel;
    edtPMSName: TEdit;
    btnPMSPick: TButton;
    mmoPMSInfo: TMemo;
    btnClearPMS: TButton;
    tsPCS: TTabSheet;
    lblPCSState: TLabel;
    lblPCSInfo: TLabel;
    edtPCSName: TEdit;
    btnPCSPick: TButton;
    mmoPCSInfo: TMemo;
    btnClearPCS: TButton;
    tsElement: TTabSheet;
    lbl1: TLabel;
    edtElementName: TEdit;
    btnPickElement: TButton;
    btnClearElement: TButton;
    tsTANK: TTabSheet;
    lblFFState: TLabel;
    lblFFInfo: TLabel;
    edtTANKName: TEdit;
    btnFFPick: TButton;
    mmoTANKInfo: TMemo;
    btnClearTANK: TButton;
    tsFA: TTabSheet;
    lblFAState: TLabel;
    lblFAInfo: TLabel;
    edtFAName: TEdit;
    btnFAPick: TButton;
    mmoFAInfo: TMemo;
    btnClearFA: TButton;
    acttb2: TActionToolBar;
    actmgr2: TActionManager;
    Action1: TAction;
    actDeleteRS: TAction;
    actChooseRS: TAction;
    lbl2: TLabel;
    edt1: TEdit;
    lbl3: TLabel;
    mmo1: TMemo;
    lblSessionID: TLabel;
    actDeleteAll: TAction;
    lbl4: TLabel;
    actmgr3: TActionManager;
    act2: TAction;
    act4: TAction;
    act5: TAction;
    pnlRunningSessionBackground: TPanel;
    pnlScenarioBuilderBackgraound: TPanel;
    pnlPMSBackgraound: TPanel;
    pnlPCSBackgraound: TPanel;
    pnlTANkBackgraound: TPanel;
    pnlFABackgraound: TPanel;
    Label1: TLabel;
    procedure actNewExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actPickExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure btnPickClick(Sender: TObject);
    procedure btnClearPMSClick(Sender: TObject);
    procedure btnClearPCSClick(Sender: TObject);
    procedure btnClearElementClick(Sender: TObject);
    procedure btnClearFAClick(Sender: TObject);
    procedure btnClearTANKClick(Sender: TObject);
    procedure actChooseRSExecute(Sender: TObject);
    procedure actDeleteRSExecute(Sender: TObject);
    procedure actDeleteAllExecute(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure act2Execute(Sender: TObject);
    procedure strngrdConditionSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure act4Execute(Sender: TObject);
  private
    { Private declarations }
    FScenarioID : Integer;
    FPMSConditionID : Integer;
    FPCSConditionID : Integer;
    FElementConditionID : Integer;
    FTANKConditionID : Integer;
    FFAConditionID : Integer;
    FSelectedConditionID : integer;
  public
    { Public declarations }
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
    edtName.Text := scenData.Name;

    mmoDescription.Lines.Clear;
    mmoDescription.Lines.Add(scenData.Description);

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

  conname := edtName.Text;

  if MessageDlg('Are You Sure To Delete "' + edtName.Text + '" Scenario ? '+#13+#10+
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
  edtName.Text := '';
  mmoDescription.Text := '';

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
    edtName.Text := scenData.Name;

    mmoDescription.Lines.Clear;
    mmoDescription.Lines.Add(scenData.Description);

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
  if Trim(edtName.Text) = '' then
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


  FScenarioID := InstructorSys.Scenario.insertScenario(FScenarioID, edtName.Text,
    mmoDescription.Lines.Text, intArr);
end;

procedure TfrmScenBuilder.btnClearElementClick(Sender: TObject);
begin
  edtElementName.Text := '<None>';
  FElementConditionID := 0;
end;

procedure TfrmScenBuilder.btnClearFAClick(Sender: TObject);
begin
  edtFAName.Text := '<None>';
  FFAConditionID := 0;
  mmoFAInfo.Lines.Clear;
end;

procedure TfrmScenBuilder.btnClearTANKClick(Sender: TObject);
begin
  edtTANKName.Text := '<None>';
  FTANKConditionID := 0;
  mmoTANKInfo.Lines.Clear;
end;

procedure TfrmScenBuilder.btnClearPCSClick(Sender: TObject);
begin
  edtPCSName.Text := '<None>';
  FPCSConditionID := 0;
  mmoPCSInfo.Lines.Clear;
end;

procedure TfrmScenBuilder.btnClearPMSClick(Sender: TObject);
begin
  edtPMSName.Text := '<None>';
  FPMSConditionID := 0;
  mmoPMSInfo.Lines.Clear;
end;

procedure TfrmScenBuilder.btnPickClick(Sender: TObject);
var
  pickList,l : TStrings;
begin
  pickList := nil;

  case TButton(Sender).Tag of
    1:
    begin
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
    end;
    2:
    begin
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
    end;
    3:
    begin
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
    end;
    4:
    begin
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
    end;
    5:
    begin
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
    end;
  end;
end;

procedure TfrmScenBuilder.FormCreate(Sender: TObject);
begin
  FScenarioID := 0;
  FSelectedConditionID := 0;

//  strngrdCondition.Cells[0,0] := 'ID';
//  strngrdCondition.Cells[1,0] := 'Condition Name';

end;

procedure TfrmScenBuilder.strngrdConditionSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
//  mmo2.Clear;
//
//  if ARow > 0 then
//  begin
//    mmo2.Lines.Add(strngrdCondition.Cells[1,ARow]);
//    mmo2.Lines.Add(InstructorSys.Database.GetConditionInfo(
//      StrToInt(strngrdCondition.Cells[0,ARow])));
//
//    FSelectedConditionID := StrToInt(strngrdCondition.Cells[0,ARow]);
//  end;

end;

end.
