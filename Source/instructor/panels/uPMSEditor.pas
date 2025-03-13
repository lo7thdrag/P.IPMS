unit uPMSEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ActnMan, ActnCtrls, ActnList,
  PlatformDefaultStyleActnCtrls, uDatabase, uDBSupportClasses, VrControls,
  VrButtons;

type
  TfrmPMSEditor = class(TForm)
    actmgr1: TActionManager;
    actNew: TAction;
    actPick: TAction;
    actSave: TAction;
    actDelete: TAction;
    actCancel: TAction;
    acttb1: TActionToolBar;
    Label1: TLabel;
    Label38: TLabel;
    edtCondName: TEdit;
    Label37: TLabel;
    lblWarning2: TLabel;
    grpAfter: TGroupBox;
    Label31: TLabel;
    Label32: TLabel;
    lblCBOpenInn2: TLabel;
    lblCBCloseInn2: TLabel;
    Label33: TLabel;
    rbManInn2: TRadioButton;
    rbAutInn2: TRadioButton;
    btnclose7: TVrDemoButton;
    btnopen7: TVrDemoButton;
    grpCB1: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    btnopen1: TVrDemoButton;
    btnclose1: TVrDemoButton;
    grpCB2: TGroupBox;
    Label17: TLabel;
    Label22: TLabel;
    btnopen2: TVrDemoButton;
    btnclose2: TVrDemoButton;
    grpCB3: TGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    btnopen3: TVrDemoButton;
    btnclose3: TVrDemoButton;
    grpCB4: TGroupBox;
    Label25: TLabel;
    Label27: TLabel;
    btnopen4: TVrDemoButton;
    btnclose4: TVrDemoButton;
    grpCBE: TGroupBox;
    Label28: TLabel;
    Label30: TLabel;
    btnopen5: TVrDemoButton;
    btnclose5: TVrDemoButton;
    grpEmergency: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    lblemergency: TLabel;
    rbManGen5: TRadioButton;
    rbSemGen5: TRadioButton;
    rbAutGen5: TRadioButton;
    chkEngine5: TCheckBox;
    grpEmergencyCon: TGroupBox;
    Label41: TLabel;
    Label40: TLabel;
    Label42: TLabel;
    rbFwdDistrE: TRadioButton;
    rbAftDistrE: TRadioButton;
    btnopen8: TVrDemoButton;
    btnclose8: TVrDemoButton;
    grpForward: TGroupBox;
    Label35: TLabel;
    Label34: TLabel;
    lblCBOpenInn1: TLabel;
    lblCBCloseInn1: TLabel;
    Label36: TLabel;
    rbManInn1: TRadioButton;
    rbAutInn1: TRadioButton;
    btnopen6: TVrDemoButton;
    btnclose6: TVrDemoButton;
    grpGenerator1: TGroupBox;
    Label26: TLabel;
    Label6: TLabel;
    lbl13: TLabel;
    lblgen1: TLabel;
    rbManGen1: TRadioButton;
    rbSemGen1: TRadioButton;
    rbAutGen1: TRadioButton;
    chkEngine1: TCheckBox;
    chkG1Pref: TCheckBox;
    grpGenerator2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lblgen2: TLabel;
    rbManGen2: TRadioButton;
    rbSemGen2: TRadioButton;
    rbAutGen2: TRadioButton;
    chkEngine2: TCheckBox;
    chkG2Pref: TCheckBox;
    grpGenerator3: TGroupBox;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lblgen3: TLabel;
    rbManGen3: TRadioButton;
    rbSemGen3: TRadioButton;
    rbAutGen3: TRadioButton;
    chkEngine3: TCheckBox;
    chkG3Pref: TCheckBox;
    grpGenerator4: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    lblgen4: TLabel;
    rbManGen4: TRadioButton;
    rbSemGen4: TRadioButton;
    rbAutGen4: TRadioButton;
    chkEngine4: TCheckBox;
    chkG4Pref: TCheckBox;
    grpShore: TGroupBox;
    Label43: TLabel;
    Label44: TLabel;
    lblCBOpenShore: TLabel;
    lblCBCloseShore: TLabel;
    Label46: TLabel;
    rbAutShore: TRadioButton;
    rbManShore: TRadioButton;
    VrDemoButton3: TVrDemoButton;
    VrDemoButton4: TVrDemoButton;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label29: TLabel;
    Label39: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    lblWarning: TLabel;
    Label45: TLabel;
    Label49: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actPickExecute(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);

    {Prince}
    procedure Gen1Click(Sender: TObject);
    procedure Gen2Click(Sender: TObject);
    procedure Gen3Click(Sender: TObject);
    procedure Gen4Click(Sender: TObject);
    procedure SwtAftClick(Sender: TObject);
    procedure SwtFwdClick(Sender: TObject);
    procedure chkPrefClick(Sender: TObject);
    procedure chkGen1Click(Sender: TObject);
    procedure chkGen2Click(Sender: TObject);
    procedure chkGen3Click(Sender: TObject);
    procedure chkGen4Click(Sender: TObject);
    procedure btnopenClick(Sender: TObject);
    procedure btncloseClick(Sender: TObject);
    procedure emergencyCheck(Sender: TObject);
    procedure SetMode(index, Val : Integer);
    procedure SetCB(index, Val : Integer);

    function CheckMode(Val : Integer): Integer;
    function CheckCB(Val : Integer): Integer;
    procedure edtCondNameChange(Sender: TObject);



  private
    CondNameBuffer : string;
    FDatabase : TIPMSDatabase;
    FCondition_ID : Integer;
    procedure GetPMSInfo(const aIndex: Integer; var aPMSName: string;
        var aType, aMode, aEngine, aPref, aCB: Integer);
    procedure GetPMSVarInfo(const aIndex: Integer; var aStateRunFull, aStateRunFwd, aStateRunAft : Integer);
  public
    { Public declarations }
    procedure SetDatabase(aDB : TIPMSDatabase);
    procedure GetAllPMSCondition(var aList : TList);
  end;

var
  frmPMSEditor: TfrmPMSEditor;

implementation

uses
  uAvailablePMSCondition, uInstructorSystem,
  uDataType;

{$R *.dfm}

procedure TfrmPMSEditor.actCancelExecute(Sender: TObject);
var
  pmsList : TList;
  i : Integer;
  pmsData : TPMSCond_Data;
begin
  if FCondition_ID = 0 then
    actNewExecute(nil)
  else
  begin
    pmsList := nil;
    InstructorSys.Scenario.GetPMSCondition(FCondition_ID, pmsList);

    if pmsList.Count = 0 then
      Exit;

    edtCondName.Text := frmAvailPMSCondition.PMSCondName;

    for i := 0 to pmsList.Count - 1 do
    begin
      pmsData := TPMSCond_Data(pmsList.Items[i]);

      case i of
        0:
        begin
          SetMode(1, pmsData.PMS_Mode);
          chkEngine1.Checked := (pmsData.PMS_OnOff = 1);
          chkG1Pref.Checked := (pmsData.PMS_Pref = 1);
          SetCB(1, pmsData.PMS_CB);
        end;
        1:
        begin
          SetMode(2, pmsData.PMS_Mode);
          chkEngine1.Checked := (pmsData.PMS_OnOff = 1);
          chkG1Pref.Checked := (pmsData.PMS_Pref = 1);
          SetCB(2, pmsData.PMS_CB);
        end;
        2:
        begin
          SetMode(3, pmsData.PMS_Mode);
          chkEngine1.Checked := (pmsData.PMS_OnOff = 1);
          chkG1Pref.Checked := (pmsData.PMS_Pref = 1);
          SetCB(3, pmsData.PMS_CB);
        end;
        3:
        begin
          SetMode(4, pmsData.PMS_Mode);
          chkEngine1.Checked := (pmsData.PMS_OnOff = 1);
          chkG1Pref.Checked := (pmsData.PMS_Pref = 1);
          SetCB(4, pmsData.PMS_CB);
        end;
        4:
        begin
          SetMode(5, pmsData.PMS_Mode);
          chkEngine5.Checked := (pmsData.PMS_OnOff = 1);
          SetCB(5, pmsData.PMS_CB);
        end;
        5:
        begin
          SetMode(6, pmsData.PMS_SWB_MSBIntrMode);
          SetCB(5, pmsData.PMS_SWB_MsbCBIntr);
        end;
        6:
        begin
          SetMode(7, pmsData.PMS_SWB_MSBIntrMode);
          SetCB(7, pmsData.PMS_SWB_MsbCBIntr);
        end;
        7:
        begin
          SetMode(8, pmsData.PMS_SWB_ESBIntrMode);
          SetCB(8, pmsData.PMS_SWB_EsbCBIntr);
        end;
      end;
    end;

    pmsList.Free;
  end;
end;

procedure TfrmPMSEditor.actDeleteExecute(Sender: TObject);
var
  conname : string;
begin
  if FCondition_ID = 0 then
    Exit;

  conname := edtCondName.Text;

  if (MessageDlg('Are You Sure To Delete "' + edtCondName.Text + '" Condition ?', mtWarning, [mbYes, mbNo], 0)) = mrYes then
  begin
    if InstructorSys.Scenario.DeletePMSCondition(FCondition_ID) then
    begin
      actNewExecute(nil);
      MessageDlg('Delete "' + conname + '" Condition Success', mtInformation, [mbOK], 0)
    end
    else
      MessageDlg('Delete "' + conname + '" Condition Failed', mtError, [mbOK], 0);
  end;

end;

procedure TfrmPMSEditor.actNewExecute(Sender: TObject);
begin
  FCondition_ID := 0;

  edtCondName.Text := '';
  rbAutGen1.Checked := True;
  rbAutGen2.Checked := True;
  rbAutGen3.Checked := True;
  rbAutGen4.Checked := True;

  chkEngine1.Checked := True;
  chkEngine2.Checked := False;
  chkEngine3.Checked := False;
  chkEngine4.Checked := False;

  chkG1Pref.Checked := False;
  chkG2Pref.Checked := False;
  chkG3Pref.Checked := False;
  chkG4Pref.Checked := False;

  rbAutInn1.Checked := True;
  rbAutInn2.Checked := True;
end;

procedure TfrmPMSEditor.actPickExecute(Sender: TObject);
var
  pmsNames : TStrings;
  pmsData : TPMSCond_Data;
  pmsList : TList;
  i : Integer;
begin
  if not Assigned(frmAvailPMSCondition)  then
    frmAvailPMSCondition := TfrmAvailPMSCondition.Create(Self);

  pmsList := nil;
  pmsNames := nil;
  InstructorSys.Scenario.GetPMSConditions(pmsNames);
  frmAvailPMSCondition.SetAvailableCondition(pmsNames);
  pmsNames.Free;

  if frmAvailPMSCondition.ShowModal = mrOk then
  begin
    if frmAvailPMSCondition.PMSCondName = '' then
      Exit;

    FCondition_ID := InstructorSys.Scenario.GetConditionID(frmAvailPMSCondition.PMSCondName);

    InstructorSys.Scenario.GetPMSCondition(FCondition_ID, pmsList);

    if pmsList.Count = 0 then
      Exit;

    edtCondName.Text := frmAvailPMSCondition.PMSCondName;

    {untuk flag ketika update dengan nama yang berbeda}
    CondNameBuffer := frmAvailPMSCondition.PMSCondName;

    for i := 0 to pmsList.Count - 1 do
    begin
      pmsData := TPMSCond_Data(pmsList.Items[i]);

      case i of
        0:
        begin
          SetMode(1, pmsData.PMS_Mode);
          chkEngine1.Checked := (pmsData.PMS_OnOff = 1);
          chkG1Pref.Checked := (pmsData.PMS_Pref = 1);
          SetCB(1, pmsData.PMS_CB);
        end;
        1:
        begin
          SetMode(2, pmsData.PMS_Mode);
          chkEngine2.Checked := (pmsData.PMS_OnOff = 1);
          chkG2Pref.Checked := (pmsData.PMS_Pref = 1);
          SetCB(2, pmsData.PMS_CB);
        end;
        2:
        begin
          SetMode(3, pmsData.PMS_Mode);
          chkEngine3.Checked := (pmsData.PMS_OnOff = 1);
          chkG3Pref.Checked := (pmsData.PMS_Pref = 1);
          SetCB(3, pmsData.PMS_CB);
        end;
        3:
        begin
          SetMode(4, pmsData.PMS_Mode);
          chkEngine4.Checked := (pmsData.PMS_OnOff = 1);
          chkG4Pref.Checked := (pmsData.PMS_Pref = 1);
          SetCB(4, pmsData.PMS_CB);
        end;
        4:
        begin
          SetMode(5, pmsData.PMS_Mode);
          chkEngine5.Checked := (pmsData.PMS_OnOff = 1);
          SetCB(5, pmsData.PMS_CB);
        end;
        5:
        begin
          SetMode(6, pmsData.PMS_SWB_MSBIntrMode);
          SetCB(6, pmsData.PMS_SWB_MsbCBIntr);
        end;
        6:
        begin
          SetMode(7, pmsData.PMS_SWB_MSBIntrMode);
          SetCB(7, pmsData.PMS_SWB_MsbCBIntr);
        end;
        7:
        begin
          SetMode(8, pmsData.PMS_SWB_ESBIntrMode);
          SetCB(8, pmsData.PMS_SWB_EsbCBIntr);
        end;
      end;
    end;

    pmsList.Free;
  end;
end;

procedure TfrmPMSEditor.GetPMSInfo(const aIndex: Integer; var aPMSName: string;
  var aType, aMode, aEngine, aPref, aCB: Integer);
begin
  case aIndex of
    1:
    begin
      aPMSName := C_GENERATOR_ID[0];
      aType := 1;

      {Prince}
      aMode := CheckMode(aIndex);
      aEngine := Ord(chkEngine1.Checked);
      aPref := Ord(chkG1Pref.Checked);
      aCB := CheckCB(aIndex);
    end;
    2:
    begin
      aPMSName := C_GENERATOR_ID[1];
      aType := 1;

      {Prince}
      aMode := CheckMode(aIndex);
      aEngine := Ord(chkEngine2.Checked);
      aPref := Ord(chkG2Pref.Checked);
      aCB := CheckCB(aIndex);
    end;
    3:
    begin
      aPMSName := C_GENERATOR_ID[2];
      aType := 1;

      {Prince}
      aMode := CheckMode(aIndex);
      aEngine := Ord(chkEngine3.Checked);
      aPref := Ord(chkG3Pref.Checked);
      aCB := CheckCB(aIndex);
    end;
    4:
    begin
      aPMSName := C_GENERATOR_ID[3];
      aType := 1;

      {Prince}
      aMode := CheckMode(aIndex);
      aEngine := Ord(chkEngine4.Checked);
      aPref := Ord(chkG4Pref.Checked);
      aCB := CheckCB(aIndex);
    end;
    5:
    begin
      aPMSName := C_GENERATOR_ID[4];
      aType := 1;
      aMode := 3;
      aEngine := Ord(chkEngine5.Checked);
      aCB := CheckCB(aIndex);
    end;
    6:
    begin
      aPMSName := C_SWITCHBOARD_ID[0];
      aType := 2;
      aMode := CheckMode(aIndex);
      aCB := CheckCB(aIndex);
    end;
    7:
    begin
      aPMSName := C_SWITCHBOARD_ID[1];
      aType := 2;
      aMode := CheckMode(aIndex);
      aCB := CheckCB(aIndex);
    end;
    8:
    begin
      aPMSName := C_SWITCHBOARD_ID[2];
      aType := 2;
      aMode := CheckMode(aIndex);
      aCB := CheckCB(aIndex);
    end;
    9:
    begin
      aPMSName := 'Variable';
      aType := 3;
    end;
  end;
end;

procedure TfrmPMSEditor.GetPMSVarInfo(const aIndex: Integer; var aStateRunFull, aStateRunFwd, aStateRunAft : Integer);
begin
  if aIndex <> 9 then
    Exit;

  if lblWarning.Visible then
  begin
    if (btnclose7.Color = clLime) and (btnclose6.Color = clLime) then
    begin
      aStateRunFull := 2;
      aStateRunFwd := 1;
      aStateRunAft := 1;
    end
    else
    begin
      aStateRunFull := 1;
      aStateRunFwd := 2;
      aStateRunAft := 2;
    end;
  end
  else
  begin
    aStateRunFull := 1;
    aStateRunFwd := 1;
    aStateRunAft := 1;
  end;
end;

procedure TfrmPMSEditor.Gen1Click(Sender: TObject);
begin
  if (rbManGen1.Checked) or (rbSemGen1.Checked) then
  begin
    chkG1Pref.Checked := False;
    chkG1Pref.Enabled := False;
    btnclose1.Enabled := True;
    btnopen1.Enabled := True;
  end
  else
  begin
    chkG1Pref.Enabled := True;
    btnopen1.Color := clBtnFace;
    btnclose1.Color := clLime;
    btnclose1.Enabled := False;
    btnopen1.Enabled := False;
  end;
end;

procedure TfrmPMSEditor.Gen2Click(Sender: TObject);
begin
  if (rbManGen2.Checked) or (rbSemGen2.Checked) then
  begin
    chkG2Pref.Checked := False;
    chkG2Pref.Enabled := False;
    btnclose2.Enabled := True;
    btnopen2.Enabled := True;
  end
  else
  begin
    chkG2Pref.Enabled := True;
    btnopen2.Color := clBtnFace;
    btnclose2.Color := clLime;
    btnclose2.Enabled := False;
    btnopen2.Enabled := False;
  end;
end;

procedure TfrmPMSEditor.Gen3Click(Sender: TObject);
begin
  if (rbManGen3.Checked) or (rbSemGen3.Checked) then
  begin
    chkG3Pref.Checked := False;
    chkG3Pref.Enabled := False;

    btnclose3.Enabled := True;
    btnopen3.Enabled := True;
  end
  else
  begin
    chkG3Pref.Enabled := True;
    btnopen3.Color := clBtnFace;
    btnclose3.Color := clLime;
    btnclose3.Enabled := False;
    btnopen3.Enabled := False;
  end;
end;

procedure TfrmPMSEditor.Gen4Click(Sender: TObject);
begin
  if (rbManGen4.Checked) or (rbSemGen4.Checked) then
  begin
    chkG4Pref.Checked := False;
    chkG4Pref.Enabled := False;
    btnclose4.Enabled := True;
    btnopen4.Enabled := True;
  end
  else
  begin
    chkG4Pref.Enabled := True;
    btnopen4.Color := clBtnFace;
    btnclose4.Color := clLime;
    btnclose4.Enabled := False;
    btnopen4.Enabled := False;
  end;
end;

procedure TfrmPMSEditor.actSaveExecute(Sender: TObject);
var
  pmsData : TPMSCond_Data;
  i, pmsType, pmsMode, pmsEngine, pmsPref, pmsCB,
  StateRunFull, StateRunFwd, StateRunAft : Integer;
  pmsName : string;
  PMSList : TList;
  ConditionID : Integer;
begin
  if Trim(edtCondName.Text) = '' then
  begin
    lblWarning2.Caption := '* Condition Name Is Empty, Please Insert Condition Name';
    lblWarning2.Visible := True;
    Exit;
  end;

  if FCondition_ID = 0 then
  begin
    if InstructorSys.Scenario.GetConditionID(edtCondName.Text) > 0 then
    begin
      lblWarning2.Caption := '* Condition Name Is Already In Use, Please Use Another Condition Name';
      lblWarning2.Visible := True;
      Exit;
    end;

    PMSList := TList.Create;

    for i := 1 to 9 do
    begin
      GetPMSInfo(i, pmsName, pmsType, pmsMode, pmsEngine, pmsPref, pmsCB);
      GetPMSVarInfo(i, StateRunFull, StateRunFwd, StateRunAft);

      pmsData := TPMSCond_Data.Create;
      pmsData.PMS_Name := pmsName;
      pmsData.PMS_Type := pmsType;

      if i <= 5 then {generator}
      begin
        pmsData.PMS_Mode := pmsMode;
        pmsData.PMS_State := 1;
        pmsData.PMS_OnOff := pmsEngine;
        pmsData.PMS_Pref := pmsPref;
        pmsData.PMS_CB := pmsCB;
      end
      else if i = 8 then {Switchboard Emergency}
      begin
        pmsData.PMS_SWB_ESBIntrMode := pmsMode;
        pmsData.PMS_SWB_EsbCBIntr := pmsCB;
      end
      else if i = 9 then {Variable}
      begin
        pmsData.PMS_FirstLoad := 1;
        pmsData.PMS_StateRunFull := StateRunFull;
        pmsData.PMS_StateRunFwd := StateRunFwd;
        pmsData.PMS_StateRunAft := StateRunAft;
      end
      else {Switchboard}
      begin
        pmsData.PMS_SWB_MSBIntrMode := pmsMode;
        pmsData.PMS_SWB_MsbCBIntr := pmsCB;
      end;

      PMSList.Add(pmsData);
    end;
    InstructorSys.Scenario.SavePMSCondition(True, edtCondName.Text, PMSList, ConditionID);
    MessageDlg('"' + edtCondName.Text + '" Condition Has Been Saved', mtInformation, [mbOK], 0);
    actNewExecute(nil);
  end
  else if FCondition_ID > 0 then
  begin
    if CondNameBuffer <> edtCondName.Text then
    begin
      ShowMessage('Can Not Update PMS Condition With a Different Name');
      Exit;
    end;

    PMSList := TList.Create;

    for i := 1 to 9 do
    begin
      GetPMSInfo(i, pmsName, pmsType, pmsMode, pmsEngine, pmsPref, pmsCB);

      pmsData := TPMSCond_Data.Create;
      pmsData.PMS_ID := InstructorSys.Scenario.GetPMSCondID(FCondition_ID, i);
      pmsData.PMS_Name := pmsName;
      pmsData.PMS_Type := pmsType;

      if i <= 5 then {generator}
      begin
        pmsData.PMS_Mode := pmsMode;
        pmsData.PMS_State := 1;
        pmsData.PMS_OnOff := pmsEngine;
        pmsData.PMS_Pref := pmsPref;
        pmsData.PMS_CB := pmsCB;
      end
      else if i >= 8 then {Switchboard Emergency}
      begin
        pmsData.PMS_SWB_ESBIntrMode := pmsMode;
        pmsData.PMS_SWB_EsbCBIntr := pmsCB;
      end
      else if i = 9 then {Variable}
      begin
        pmsData.PMS_FirstLoad := 1;
        pmsData.PMS_StateRunFull := StateRunFull;
        pmsData.PMS_StateRunFwd := StateRunFwd;
        pmsData.PMS_StateRunAft := StateRunAft;
      end
      else {Switchboard}
      begin
        pmsData.PMS_SWB_MSBIntrMode := pmsMode;
        pmsData.PMS_SWB_MsbCBIntr := pmsCB;
      end;

      pmsData.Condition_ID := FCondition_ID;

      PMSList.Add(pmsData);
    end;

    InstructorSys.Scenario.SavePMSCondition(False, edtCondName.Text, PMSList, ConditionID);
    MessageDlg('"' + edtCondName.Text + '" Condition Has Been Updated', mtInformation, [mbOK], 0);
    actNewExecute(nil);
  end;
end;

procedure TfrmPMSEditor.btncloseClick(Sender: TObject);
begin
  if TButton(Sender).Name = 'btnclose1' then
  begin
    btnopen1.Color := clBtnFace;
    btnclose1.Color := clLime;
  end
  else if TButton(Sender).Name = 'btnclose2' then
  begin
    btnopen2.Color := clBtnFace;
    btnclose2.Color := clLime;
  end
  else if TButton(Sender).Name = 'btnclose3' then
  begin
    btnopen3.Color := clBtnFace;
    btnclose3.Color := clLime;
  end
  else if TButton(Sender).Name = 'btnclose4' then
  begin
    btnopen4.Color := clBtnFace;
    btnclose4.Color := clLime;
  end
  else if TButton(Sender).Name = 'btnclose6' then
  begin
    btnopen6.Color := clBtnFace;
    btnclose6.Color := clLime;
  end
  else if TButton(Sender).Name = 'btnclose7' then
  begin
    btnopen7.Color := clBtnFace;
    btnclose7.Color := clLime;
  end
  else if TButton(Sender).Name = 'btnclose8' then
  begin
    btnopen8.Color := clBtnFace;
    btnclose8.Color := clLime;
  end;

  emergencyCheck(nil);
end;

procedure TfrmPMSEditor.btnopenClick(Sender: TObject);
begin
  if TButton(Sender).Name = 'btnopen1' then
  begin
    btnopen1.Color := clRed;
    btnclose1.Color := clBtnFace;
  end
  else if TButton(Sender).Name = 'btnopen2' then
  begin
    btnopen2.Color := clRed;
    btnclose2.Color := clBtnFace;
  end
  else if TButton(Sender).Name = 'btnopen3' then
  begin
    btnopen3.Color := clRed;
    btnclose3.Color := clBtnFace;
  end
  else if TButton(Sender).Name = 'btnopen4' then
  begin
    btnopen4.Color := clRed;
    btnclose4.Color := clBtnFace;
  end
  else if TButton(Sender).Name = 'btnopen6' then
  begin
    btnopen6.Color := clRed;
    btnclose6.Color := clBtnFace;
  end
  else if TButton(Sender).Name = 'btnopen7' then
  begin
    btnopen7.Color := clRed;
    btnclose7.Color := clBtnFace;
  end
  else if TButton(Sender).Name = 'btnopen8' then
  begin
    btnopen8.Color := clRed;
    btnclose8.Color := clBtnFace;
  end;

  emergencyCheck(nil);
end;

function TfrmPMSEditor.CheckCB(Val: Integer): Integer;
begin
  Result := 3;

  case Val of
    1:
    begin
      if btnclose1.Color = clBtnFace then Result := 0
      else Result := 1;
    end;
    2:
    begin
      if btnclose2.Color = clBtnFace then Result := 0
      else Result := 1;
    end;
    3:
    begin
      if btnclose3.Color = clBtnFace then Result := 0
      else Result := 1;
    end;
    4:
    begin
      if btnclose4.Color = clBtnFace then Result := 0
      else Result := 1;
    end;
    5:
    begin
      if btnclose5.Color = clBtnFace then Result := 0
      else Result := 1;
    end;
    6:
    begin
      if btnclose6.Color = clBtnFace then Result := 0
      else Result := 1;
    end;
    7:
    begin
      if btnclose7.Color = clBtnFace then Result := 0
      else Result := 1;
    end;
    8:
    begin
      if btnclose8.Color = clBtnFace then Result := 0
      else Result := 1;
    end;
  end;
end;

function TfrmPMSEditor.CheckMode(Val: Integer): Integer;
begin
  Result := 0;

  case Val of
    1:
    begin
      if rbManGen1.Checked then Result := 1
      else if rbSemGen1.Checked then Result := 2
      else if rbAutGen1.Checked then Result := 3;
    end;
    2:
    begin
      if rbManGen2.Checked then Result := 1
      else if rbSemGen2.Checked then Result := 2
      else if rbAutGen2.Checked then Result := 3;
    end;
    3:
    begin
      if rbManGen3.Checked then Result := 1
      else if rbSemGen3.Checked then Result := 2
      else if rbAutGen3.Checked then Result := 3;
    end;
    4:
    begin
      if rbManGen4.Checked then Result := 1
      else if rbSemGen4.Checked then Result := 2
      else if rbAutGen4.Checked then Result := 3;
    end;
    6:
    begin
      if rbManInn1.Checked then Result := 1
      else if rbAutInn1.Checked then Result := 3;
    end;
    7:
    begin
      if rbManInn2.Checked then Result := 1
      else if rbAutInn2.Checked then Result := 3;
    end;
    8:
    begin
      if rbAftDistrE.Checked then Result := 1
      else if rbFwdDistrE.Checked then Result := 3;
    end;
  end;
end;

procedure TfrmPMSEditor.chkGen1Click(Sender: TObject);
begin
  if (chkEngine1.Checked) then
    lblgen1.Visible := True
  else
  begin
    if (chkG1Pref.Checked) then
    begin
      chkEngine1.Checked := True;
      Exit;
    end;
    lblgen1.Visible := False;
  end;

  emergencyCheck(Sender);
end;

procedure TfrmPMSEditor.chkGen2Click(Sender: TObject);
begin
  if (chkEngine2.Checked) then
    lblgen2.Visible := True
  else
  begin
    if (chkG2Pref.Checked) then
    begin
      chkEngine2.Checked := True;
      Exit;
    end;
    lblgen2.Visible := False;
  end;

  emergencyCheck(Sender);
end;

procedure TfrmPMSEditor.chkGen3Click(Sender: TObject);
begin
  if (chkEngine3.Checked)then
    lblgen3.Visible := True
  else
  begin
    if (chkG3Pref.Checked) then
    begin
      chkEngine3.Checked := True;
      Exit;
    end;
    lblgen3.Visible := False;
  end;

  emergencyCheck(Sender);
end;

procedure TfrmPMSEditor.chkGen4Click(Sender: TObject);
begin
  if (chkEngine4.Checked)then
    lblgen4.Visible := True
  else
  begin
    if (chkG4Pref.Checked) then
    begin
      chkEngine4.Checked := True;
      Exit;
    end;
    lblgen4.Visible := False;
  end;

  emergencyCheck(Sender);
end;

procedure TfrmPMSEditor.chkPrefClick(Sender: TObject);
begin
  if (chkG1Pref.Checked)  then
    chkEngine1.Checked := True
  else if (chkG2Pref.Checked)  then
    chkEngine2.Checked := True
  else if (chkG3Pref.Checked)  then
    chkEngine3.Checked := True
  else if (chkG4Pref.Checked)  then
    chkEngine4.Checked := True
end;

procedure TfrmPMSEditor.edtCondNameChange(Sender: TObject);
begin
  lblWarning2.Visible := False;
end;

procedure TfrmPMSEditor.emergencyCheck(Sender: TObject);
begin
  if (not ((btnclose1.Color = clLime) and chkEngine1.Checked)) and
     (not ((btnclose2.Color = clLime) and chkEngine2.Checked)) and
     (not ((btnclose3.Color = clLime) and chkEngine3.Checked)) and
     (not ((btnclose4.Color = clLime) and chkEngine4.Checked)) then
  begin
    lblWarning.Visible := True;
    chkEngine5.Checked := True;
  end
  else
  begin
    lblWarning.Visible := False;
    chkEngine5.Checked := False;
  end;
end;

procedure TfrmPMSEditor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmPMSEditor := nil;
end;

procedure TfrmPMSEditor.FormShow(Sender: TObject);
begin
  actNewExecute(nil);
end;

procedure TfrmPMSEditor.GetAllPMSCondition(var aList: TList);
var
  pmsData : TPMSCond_Data;
  i, pmsType, pmsMode, pmsEngine, pmsPref, pmsCB{, pmsState, pmsSwitch}  : Integer;
  pmsName : string;
begin

  if not Assigned(aList) then
    aList := TList.Create;

  for i := 1 to 8 do
  begin
    GetPMSInfo(i, pmsName, pmsType, pmsMode, pmsEngine, pmsPref, pmsCB);

    pmsData := TPMSCond_Data.Create;
    pmsData.PMS_Name := pmsName;
    pmsData.PMS_Type := pmsType;
//    pmsData.PMS_State := pmsState;
//    pmsData.PMS_OnOff := pmsSwitch;

    aList.Add(pmsData);
  end;

end;

procedure TfrmPMSEditor.SetCB(index, Val: Integer);
begin
  case index of
    1:
    begin
      if Val= 0 then
      begin
        btnclose1.Color := clBtnFace;
        btnopen1.Color := clRed
      end
      else
      begin
        btnclose1.Color := clLime;
        btnopen1.Color := clBtnFace
      end;
    end;
    2:
    begin
      if Val= 0 then
      begin
        btnclose2.Color := clBtnFace;
        btnopen2.Color := clRed
      end
      else
      begin
        btnclose2.Color := clLime;
        btnopen2.Color := clBtnFace
      end;
    end;
    3:
    begin
      if Val= 0 then
      begin
        btnclose3.Color := clBtnFace;
        btnopen3.Color := clRed
      end
      else
      begin
        btnclose3.Color := clLime;
        btnopen3.Color := clBtnFace
      end;
    end;
    4:
    begin
      if Val= 0 then
      begin
        btnclose4.Color := clBtnFace;
        btnopen4.Color := clRed
      end
      else
      begin
        btnclose4.Color := clLime;
        btnopen4.Color := clBtnFace
      end;
    end;
    5:
    begin
      if Val= 0 then
      begin
        btnclose5.Color := clBtnFace;
        btnopen5.Color := clRed
      end
      else
      begin
        btnclose5.Color := clLime;
        btnopen5.Color := clBtnFace
      end;
    end;
    6:
    begin
      if Val= 0 then
      begin
        btnclose6.Color := clBtnFace;
        btnopen6.Color := clRed
      end
      else
      begin
        btnclose6.Color := clLime;
        btnopen6.Color := clBtnFace
      end;
    end;
    7:
    begin
      if Val= 0 then
      begin
        btnclose7.Color := clBtnFace;
        btnopen7.Color := clRed
      end
      else
      begin
        btnclose7.Color := clLime;
        btnopen7.Color := clBtnFace
      end;
    end;
    8:
    begin
      if Val= 0 then
      begin
        btnclose8.Color := clBtnFace;
        btnopen8.Color := clRed
      end
      else
      begin
        btnclose8.Color := clLime;
        btnopen8.Color := clBtnFace
      end;
    end;
  end;
end;

procedure TfrmPMSEditor.SetDatabase(aDB: TIPMSDatabase);
begin
  FDatabase := aDB;
end;

procedure TfrmPMSEditor.SetMode(index, Val: Integer);
begin
  case index of
    1:
    begin
      if Val = 1 then rbManGen1.Checked := True
      else if Val = 2 then rbSemGen1.Checked := True
      else if Val = 3 then rbAutGen1.Checked := True
    end;
    2:
    begin
      if Val = 1 then rbManGen2.Checked := True
      else if Val = 2 then rbSemGen2.Checked := True
      else if Val = 3 then rbAutGen2.Checked := True
    end;
    3:
    begin
      if Val = 1 then rbManGen3.Checked := True
      else if Val = 2 then rbSemGen3.Checked := True
      else if Val = 3 then rbAutGen3.Checked := True
    end;
    4:
    begin
      if Val = 1 then rbManGen4.Checked := True
      else if Val = 2 then rbSemGen4.Checked := True
      else if Val = 3 then rbAutGen4.Checked := True
    end;
    5:
    begin
      if Val = 1 then rbManGen5.Checked := True
      else if Val = 2 then rbSemGen5.Checked := True
      else if Val = 3 then rbAutGen5.Checked := True
    end;
    6:
    begin
      if Val = 1 then rbManInn1.Checked := True
      else if Val = 3 then rbAutInn1.Checked := True
    end;
    7:
    begin
      if Val = 1 then rbManInn2.Checked := True
      else if Val = 3 then rbAutInn2.Checked := True
    end;
    8:
    begin
      if Val = 1 then rbAftDistrE.Checked := True
      else if Val = 3 then rbFwdDistrE.Checked := True
    end;
  end;
end;

procedure TfrmPMSEditor.SwtAftClick(Sender: TObject);
begin
  if rbManInn2.Checked then
  begin
    btnclose7.Enabled := True;
    btnopen7.Enabled := True;
  end
  else
  begin
    btnopen7.Color := clBtnFace;
    btnclose7.Color := clLime;
    btnclose7.Enabled := False;
    btnopen7.Enabled := False;
  end;
end;

procedure TfrmPMSEditor.SwtFwdClick(Sender: TObject);
begin
  if rbManInn1.Checked then
  begin
    btnclose6.Enabled := True;
    btnopen6.Enabled := True;
  end
  else
  begin
    btnopen6.Color := clBtnFace;
    btnclose6.Color := clLime;
    btnclose6.Enabled := False;
    btnopen6.Enabled := False;
  end;
end;

end.
