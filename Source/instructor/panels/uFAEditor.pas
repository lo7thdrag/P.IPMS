unit uFAEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ToolWin, ActnMan, ActnCtrls, ActnList,
  PlatformDefaultStyleActnCtrls, ExtCtrls, ComCtrls, uDatabase;

type
  TfrmFAEditor = class(TForm)
    actmgr1: TActionManager;
    actNew: TAction;
    actPick: TAction;
    actSave: TAction;
    actDelete: TAction;
    actCancel: TAction;
    acttb1: TActionToolBar;
    edtName: TEdit;
    lblName: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    CheckBox27: TCheckBox;
    CheckBox28: TCheckBox;
    CheckBox25: TCheckBox;
    CheckBox26: TCheckBox;
    CheckBox31: TCheckBox;
    CheckBox32: TCheckBox;
    CheckBox29: TCheckBox;
    CheckBox30: TCheckBox;
    CheckBox19: TCheckBox;
    CheckBox20: TCheckBox;
    CheckBox17: TCheckBox;
    CheckBox18: TCheckBox;
    CheckBox23: TCheckBox;
    CheckBox24: TCheckBox;
    CheckBox21: TCheckBox;
    CheckBox22: TCheckBox;
    CheckBox43: TCheckBox;
    CheckBox44: TCheckBox;
    CheckBox41: TCheckBox;
    CheckBox42: TCheckBox;
    CheckBox47: TCheckBox;
    CheckBox48: TCheckBox;
    CheckBox45: TCheckBox;
    CheckBox46: TCheckBox;
    CheckBox35: TCheckBox;
    CheckBox36: TCheckBox;
    CheckBox33: TCheckBox;
    CheckBox34: TCheckBox;
    CheckBox39: TCheckBox;
    CheckBox40: TCheckBox;
    CheckBox37: TCheckBox;
    CheckBox38: TCheckBox;
    lblAlarm_IPMS: TLabel;
    lblAlarm_IAS: TLabel;
    lblAlarm_Navigation: TLabel;
    lblAlarm_Ballast: TLabel;
    lblRole_PCS: TLabel;
    lblRole_E: TLabel;
    lblRole_IPMS: TLabel;
    lblRole_AUX: TLabel;
    lblAlarm_Propultion: TLabel;
    lblAlarm_Auxiliary: TLabel;
    lblAlarm_DGSETS: TLabel;
    lblAlarm_Distribution: TLabel;
    lblAlarm_HVAC: TLabel;
    lblAlarm_FFDC: TLabel;
    lblAlarm_Fuel: TLabel;
    lblAlarm_Domest: TLabel;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox15: TCheckBox;
    CheckBox16: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    lblWarning2: TLabel;
    procedure actNewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actPickExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtNameChange(Sender: TObject);
  private
    CondNameBuffer : string;
    FDatabase : TIPMSDatabase;
    FCondition_ID : Integer;
  public
    procedure SetDatabase(aDB : TIPMSDatabase);
  end;

var
  frmFAEditor: TfrmFAEditor;

implementation

uses
  uAvailableFACondition, uInstructorSystem, uDBSupportClasses;

{$R *.dfm}

procedure TfrmFAEditor.actCancelExecute(Sender: TObject);
var
  faList : TList;
  i : Integer;
  faData : TFACond_Data;
begin
  if FCondition_ID = 0 then
    actNewExecute(nil)
  else
  begin
    faList := nil;
    InstructorSys.Scenario.GetPMSCondition(FCondition_ID, faList);

    if faList.Count = 0 then
      Exit;

    edtName.Text := frmAvailFACondition.FACondName;

    for i := 0 to faList.Count - 1 do
    begin
      faData := TFACond_Data(faList.Items[i]);

      case i of
        1:
        begin
          CheckBox1.Checked := (faData.FA_DGSETS_State = 1);
          CheckBox2.Checked := (faData.FA_Distribution_State = 1);
          CheckBox3.Checked := (faData.FA_Propultion_State = 1);
          CheckBox4.Checked := (faData.FA_Auxiliary_State = 1);
          CheckBox5.Checked := (faData.FA_Fuel_State = 1);
          CheckBox6.Checked := (faData.FA_Domest_State = 1);
          CheckBox7.Checked := (faData.FA_HVAC_State = 1);
          CheckBox8.Checked := (faData.FA_FFDC_State = 1);
          CheckBox9.Checked := (faData.FA_Navigation_State = 1);
          CheckBox10.Checked := (faData.FA_Ballast_State = 1);
          CheckBox11.Checked := (faData.FA_IPMS_State = 1);
          CheckBox12.Checked := (faData.FA_IAS_State = 1);
        end;
        2:
        begin
          CheckBox13.Checked := (faData.FA_DGSETS_State = 1);
          CheckBox14.Checked := (faData.FA_Distribution_State = 1);
          CheckBox15.Checked := (faData.FA_Propultion_State = 1);
          CheckBox16.Checked := (faData.FA_Auxiliary_State = 1);
          CheckBox17.Checked := (faData.FA_Fuel_State = 1);
          CheckBox18.Checked := (faData.FA_Domest_State = 1);
          CheckBox19.Checked := (faData.FA_HVAC_State = 1);
          CheckBox20.Checked := (faData.FA_FFDC_State = 1);
          CheckBox21.Checked := (faData.FA_Navigation_State = 1);
          CheckBox22.Checked := (faData.FA_Ballast_State = 1);
          CheckBox23.Checked := (faData.FA_IPMS_State = 1);
          CheckBox24.Checked := (faData.FA_IAS_State = 1);
        end;
        3:
        begin
          CheckBox25.Checked := (faData.FA_DGSETS_State = 1);
          CheckBox26.Checked := (faData.FA_Distribution_State = 1);
          CheckBox27.Checked := (faData.FA_Propultion_State = 1);
          CheckBox28.Checked := (faData.FA_Auxiliary_State = 1);
          CheckBox29.Checked := (faData.FA_Fuel_State = 1);
          CheckBox30.Checked := (faData.FA_Domest_State = 1);
          CheckBox31.Checked := (faData.FA_HVAC_State = 1);
          CheckBox32.Checked := (faData.FA_FFDC_State = 1);
          CheckBox33.Checked := (faData.FA_Navigation_State = 1);
          CheckBox34.Checked := (faData.FA_Ballast_State = 1);
          CheckBox35.Checked := (faData.FA_IPMS_State = 1);
          CheckBox36.Checked := (faData.FA_IAS_State = 1);
        end;
        4:
        begin
          CheckBox37.Checked := (faData.FA_DGSETS_State = 1);
          CheckBox38.Checked := (faData.FA_Distribution_State = 1);
          CheckBox39.Checked := (faData.FA_Propultion_State = 1);
          CheckBox40.Checked := (faData.FA_Auxiliary_State = 1);
          CheckBox41.Checked := (faData.FA_Fuel_State = 1);
          CheckBox42.Checked := (faData.FA_Domest_State = 1);
          CheckBox43.Checked := (faData.FA_HVAC_State = 1);
          CheckBox44.Checked := (faData.FA_FFDC_State = 1);
          CheckBox45.Checked := (faData.FA_Navigation_State = 1);
          CheckBox46.Checked := (faData.FA_Ballast_State = 1);
          CheckBox47.Checked := (faData.FA_IPMS_State = 1);
          CheckBox48.Checked := (faData.FA_IAS_State = 1);
        end;
      end;
    end;    
  end;
end;

procedure TfrmFAEditor.actDeleteExecute(Sender: TObject);
var
  conname : string;
begin
  if FCondition_ID = 0 then
    Exit;

  conname := edtName.Text;

  if (MessageDlg('Are You Sure To Delete "' + edtName.Text + '" Condition ?', mtWarning, [mbYes, mbNo], 0)) = mrYes then
  begin
    if InstructorSys.Scenario.DeleteFACondition(FCondition_ID) then
    begin
      actNewExecute(nil);
      MessageDlg('Delete "' + conname + '" Condition Success', mtInformation, [mbOK], 0)
    end
    else
      MessageDlg('Delete "' + conname + '" Condition Failed', mtError, [mbOK], 0);
  end;
end;

procedure TfrmFAEditor.actNewExecute(Sender: TObject);
var
  i: Integer;
begin
  FCondition_ID := 0;

  edtName.Text := '';

  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TCheckBox then
    begin
      if TCheckBox(Components[i]).Tag = 12 then
        TCheckBox(Components[i]).Checked := True
      else
        TCheckBox(Components[i]).Checked := False;
    end;
  end;
end;

procedure TfrmFAEditor.actPickExecute(Sender: TObject);
var
  faNames : TStrings;
  faList : TList;
  faData : TFACond_Data;
  i : Integer;
begin
  if not Assigned(frmAvailFACondition)  then
    frmAvailFACondition := TfrmAvailFACondition.Create(self);

  faList := nil;
  faNames := nil;
  InstructorSys.Scenario.GetFAConditions(faNames);
  frmAvailFACondition.SetAvailableCondition(faNames);
  faNames.Free;

  if frmAvailFACondition.ShowModal = mrOk then
  begin
    if frmAvailFACondition.FACondName = '' then
      Exit;

    FCondition_ID := InstructorSys.Scenario.GetConditionID(frmAvailFACondition.FACondName);

    InstructorSys.Scenario.GetFACondition(FCondition_ID, faList);

    if faList.Count = 0 then
      Exit;

    edtName.Text := frmAvailFACondition.FACondName;
    {untuk flag ketika update dengan nama yang berbeda}
    CondNameBuffer := frmAvailFACondition.FACondName;

    for i := 0 to faList.Count - 1 do
    begin
      faData := TFACond_Data(faList.Items[i]);

      case i of
        0:
        begin
          CheckBox1.Checked := (faData.FA_DGSETS_State = 1);
          CheckBox2.Checked := (faData.FA_Distribution_State = 1);
          CheckBox3.Checked := (faData.FA_Propultion_State = 1);
          CheckBox4.Checked := (faData.FA_Auxiliary_State = 1);
          CheckBox5.Checked := (faData.FA_Fuel_State = 1);
          CheckBox6.Checked := (faData.FA_Domest_State = 1);
          CheckBox7.Checked := (faData.FA_HVAC_State = 1);
          CheckBox8.Checked := (faData.FA_FFDC_State = 1);
          CheckBox9.Checked := (faData.FA_Navigation_State = 1);
          CheckBox10.Checked := (faData.FA_Ballast_State = 1);
          CheckBox11.Checked := (faData.FA_IPMS_State = 1);
          CheckBox12.Checked := (faData.FA_IAS_State = 1);
        end;
        1:
        begin
          CheckBox13.Checked := (faData.FA_DGSETS_State = 1);
          CheckBox14.Checked := (faData.FA_Distribution_State = 1);
          CheckBox15.Checked := (faData.FA_Propultion_State = 1);
          CheckBox16.Checked := (faData.FA_Auxiliary_State = 1);
          CheckBox17.Checked := (faData.FA_Fuel_State = 1);
          CheckBox18.Checked := (faData.FA_Domest_State = 1);
          CheckBox19.Checked := (faData.FA_HVAC_State = 1);
          CheckBox20.Checked := (faData.FA_FFDC_State = 1);
          CheckBox21.Checked := (faData.FA_Navigation_State = 1);
          CheckBox22.Checked := (faData.FA_Ballast_State = 1);
          CheckBox23.Checked := (faData.FA_IPMS_State = 1);
          CheckBox24.Checked := (faData.FA_IAS_State = 1);
        end;
        2:
        begin
          CheckBox25.Checked := (faData.FA_DGSETS_State = 1);
          CheckBox26.Checked := (faData.FA_Distribution_State = 1);
          CheckBox27.Checked := (faData.FA_Propultion_State = 1);
          CheckBox28.Checked := (faData.FA_Auxiliary_State = 1);
          CheckBox29.Checked := (faData.FA_Fuel_State = 1);
          CheckBox30.Checked := (faData.FA_Domest_State = 1);
          CheckBox31.Checked := (faData.FA_HVAC_State = 1);
          CheckBox32.Checked := (faData.FA_FFDC_State = 1);
          CheckBox33.Checked := (faData.FA_Navigation_State = 1);
          CheckBox34.Checked := (faData.FA_Ballast_State = 1);
          CheckBox35.Checked := (faData.FA_IPMS_State = 1);
          CheckBox36.Checked := (faData.FA_IAS_State = 1);
        end;
        3:
        begin
          CheckBox37.Checked := (faData.FA_DGSETS_State = 1);
          CheckBox38.Checked := (faData.FA_Distribution_State = 1);
          CheckBox39.Checked := (faData.FA_Propultion_State = 1);
          CheckBox40.Checked := (faData.FA_Auxiliary_State = 1);
          CheckBox41.Checked := (faData.FA_Fuel_State = 1);
          CheckBox42.Checked := (faData.FA_Domest_State = 1);
          CheckBox43.Checked := (faData.FA_HVAC_State = 1);
          CheckBox44.Checked := (faData.FA_FFDC_State = 1);
          CheckBox45.Checked := (faData.FA_Navigation_State = 1);
          CheckBox46.Checked := (faData.FA_Ballast_State = 1);
          CheckBox47.Checked := (faData.FA_IPMS_State = 1);
          CheckBox48.Checked := (faData.FA_IAS_State = 1);
        end;
      end;
    end;
  end;
end;

procedure TfrmFAEditor.actSaveExecute(Sender: TObject);
var
  i, ConditionID : Integer;
  faData : TFACond_Data;
  faList : TList;
begin
  if Trim(edtName.Text) = '' then
  begin
    lblWarning2.Caption := '* Condition Name Is Empty, Please Insert Condition Name';
    lblWarning2.Visible := True;
    Exit;
  end;

  faList := nil;
  faData := nil;

  if FCondition_ID = 0 then
  begin
    faList := TList.Create;

    for i := 1 to 4 do
    begin
      if InstructorSys.Scenario.GetConditionID(edtName.Text) > 0 then
      begin
        lblWarning2.Caption := '* Condition Name Is Already In Use, Please Use Another Condition Name';
        lblWarning2.Visible := True;
        Exit;
      end;

      faData := TFACond_Data.Create;

      case i of
        1:
        begin
          faData.Role := 'MCR_IPMS';
          faData.FA_DGSETS_State := Ord(CheckBox1.Checked);
          faData.FA_Distribution_State := Ord(CheckBox2.Checked);
          faData.FA_Propultion_State := Ord(CheckBox3.Checked);
          faData.FA_Auxiliary_State := Ord(CheckBox4.Checked);
          faData.FA_Fuel_State := Ord(CheckBox5.Checked);
          faData.FA_Domest_State := Ord(CheckBox6.Checked);
          faData.FA_HVAC_State := Ord(CheckBox7.Checked);
          faData.FA_FFDC_State := Ord(CheckBox8.Checked);
          faData.FA_Navigation_State := Ord(CheckBox9.Checked);
          faData.FA_Ballast_State := Ord(CheckBox10.Checked);
          faData.FA_IPMS_State := Ord(CheckBox11.Checked);
          faData.FA_IAS_State := Ord(CheckBox12.Checked);
        end;
        2:
        begin
          faData.Role := 'MCR_AUX';
          faData.FA_DGSETS_State := Ord(CheckBox13.Checked);
          faData.FA_Distribution_State := Ord(CheckBox14.Checked);
          faData.FA_Propultion_State := Ord(CheckBox15.Checked);
          faData.FA_Auxiliary_State := Ord(CheckBox16.Checked);
          faData.FA_Fuel_State := Ord(CheckBox17.Checked);
          faData.FA_Domest_State := Ord(CheckBox18.Checked);
          faData.FA_HVAC_State := Ord(CheckBox19.Checked);
          faData.FA_FFDC_State := Ord(CheckBox20.Checked);
          faData.FA_Navigation_State := Ord(CheckBox21.Checked);
          faData.FA_Ballast_State := Ord(CheckBox22.Checked);
          faData.FA_IPMS_State := Ord(CheckBox23.Checked);
          faData.FA_IAS_State := Ord(CheckBox24.Checked);
        end;
        3:
        begin
          faData.Role := 'MCR_PCS';
          faData.FA_DGSETS_State := Ord(CheckBox25.Checked);
          faData.FA_Distribution_State := Ord(CheckBox26.Checked);
          faData.FA_Propultion_State := Ord(CheckBox27.Checked);
          faData.FA_Auxiliary_State := Ord(CheckBox28.Checked);
          faData.FA_Fuel_State := Ord(CheckBox29.Checked);
          faData.FA_Domest_State := Ord(CheckBox30.Checked);
          faData.FA_HVAC_State := Ord(CheckBox31.Checked);
          faData.FA_FFDC_State := Ord(CheckBox32.Checked);
          faData.FA_Navigation_State := Ord(CheckBox33.Checked);
          faData.FA_Ballast_State := Ord(CheckBox34.Checked);
          faData.FA_IPMS_State := Ord(CheckBox35.Checked);
          faData.FA_IAS_State := Ord(CheckBox36.Checked);
        end;
        4:
        begin
          faData.Role := 'MCR_E';
          faData.FA_DGSETS_State := Ord(CheckBox37.Checked);
          faData.FA_Distribution_State := Ord(CheckBox38.Checked);
          faData.FA_Propultion_State := Ord(CheckBox39.Checked);
          faData.FA_Auxiliary_State := Ord(CheckBox40.Checked);
          faData.FA_Fuel_State := Ord(CheckBox41.Checked);
          faData.FA_Domest_State := Ord(CheckBox42.Checked);
          faData.FA_HVAC_State := Ord(CheckBox43.Checked);
          faData.FA_FFDC_State := Ord(CheckBox44.Checked);
          faData.FA_Navigation_State := Ord(CheckBox45.Checked);
          faData.FA_Ballast_State := Ord(CheckBox46.Checked);
          faData.FA_IPMS_State := Ord(CheckBox47.Checked);
          faData.FA_IAS_State := Ord(CheckBox48.Checked);
        end;
      end;

      faList.Add(faData);
    end;

    InstructorSys.Scenario.SaveFACondition(True, edtName.Text, faList, ConditionID);
    MessageDlg('"' + edtName.Text + '" Condition Has Been Saved', mtInformation, [mbOK], 0);
    actNewExecute(nil);
  end
  else if FCondition_ID > 0 then
  begin
    if CondNameBuffer <> edtName.Text then
    begin
      ShowMessage('Can Not Update FA Condition With a Different Name');
      Exit;
    end;

    faList := TList.Create;

    for i := 1 to 4 do
    begin
      faData := TFACond_Data.Create;
      faData.FA_ID := InstructorSys.Scenario.GetFACondID(FCondition_ID, i);

      case i of
        1:
        begin
          faData.Role := 'MCR_IPMS';
          faData.FA_DGSETS_State := Ord(CheckBox1.Checked);
          faData.FA_Distribution_State := Ord(CheckBox2.Checked);
          faData.FA_Propultion_State := Ord(CheckBox3.Checked);
          faData.FA_Auxiliary_State := Ord(CheckBox4.Checked);
          faData.FA_Fuel_State := Ord(CheckBox5.Checked);
          faData.FA_Domest_State := Ord(CheckBox6.Checked);
          faData.FA_HVAC_State := Ord(CheckBox7.Checked);
          faData.FA_FFDC_State := Ord(CheckBox8.Checked);
          faData.FA_Navigation_State := Ord(CheckBox9.Checked);
          faData.FA_Ballast_State := Ord(CheckBox10.Checked);
          faData.FA_IPMS_State := Ord(CheckBox11.Checked);
          faData.FA_IAS_State := Ord(CheckBox12.Checked);
        end;
        2:
        begin
          faData.Role := 'MCR_AUX';
          faData.FA_DGSETS_State := Ord(CheckBox13.Checked);
          faData.FA_Distribution_State := Ord(CheckBox14.Checked);
          faData.FA_Propultion_State := Ord(CheckBox15.Checked);
          faData.FA_Auxiliary_State := Ord(CheckBox16.Checked);
          faData.FA_Fuel_State := Ord(CheckBox17.Checked);
          faData.FA_Domest_State := Ord(CheckBox18.Checked);
          faData.FA_HVAC_State := Ord(CheckBox19.Checked);
          faData.FA_FFDC_State := Ord(CheckBox20.Checked);
          faData.FA_Navigation_State := Ord(CheckBox21.Checked);
          faData.FA_Ballast_State := Ord(CheckBox22.Checked);
          faData.FA_IPMS_State := Ord(CheckBox23.Checked);
          faData.FA_IAS_State := Ord(CheckBox24.Checked);
        end;
        3:
        begin
          faData.Role := 'MCR_PCS';
          faData.FA_DGSETS_State := Ord(CheckBox25.Checked);
          faData.FA_Distribution_State := Ord(CheckBox26.Checked);
          faData.FA_Propultion_State := Ord(CheckBox27.Checked);
          faData.FA_Auxiliary_State := Ord(CheckBox28.Checked);
          faData.FA_Fuel_State := Ord(CheckBox29.Checked);
          faData.FA_Domest_State := Ord(CheckBox30.Checked);
          faData.FA_HVAC_State := Ord(CheckBox31.Checked);
          faData.FA_FFDC_State := Ord(CheckBox32.Checked);
          faData.FA_Navigation_State := Ord(CheckBox33.Checked);
          faData.FA_Ballast_State := Ord(CheckBox34.Checked);
          faData.FA_IPMS_State := Ord(CheckBox35.Checked);
          faData.FA_IAS_State := Ord(CheckBox36.Checked);
        end;
        4:
        begin
          faData.Role := 'MCR_E';
          faData.FA_DGSETS_State := Ord(CheckBox37.Checked);
          faData.FA_Distribution_State := Ord(CheckBox38.Checked);
          faData.FA_Propultion_State := Ord(CheckBox39.Checked);
          faData.FA_Auxiliary_State := Ord(CheckBox40.Checked);
          faData.FA_Fuel_State := Ord(CheckBox41.Checked);
          faData.FA_Domest_State := Ord(CheckBox42.Checked);
          faData.FA_HVAC_State := Ord(CheckBox43.Checked);
          faData.FA_FFDC_State := Ord(CheckBox44.Checked);
          faData.FA_Navigation_State := Ord(CheckBox45.Checked);
          faData.FA_Ballast_State := Ord(CheckBox46.Checked);
          faData.FA_IPMS_State := Ord(CheckBox47.Checked);
          faData.FA_IAS_State := Ord(CheckBox48.Checked);
        end;
      end;

      faData.Condition_ID := FCondition_ID;
      faList.Add(faData);
    end;

    InstructorSys.Scenario.SaveFACondition(False, edtName.Text, faList, ConditionID);
    MessageDlg('"' + edtName.Text + '" Condition Has Been Updated', mtInformation, [mbOK], 0);
    actNewExecute(nil);
  end;

  if Assigned(faData) then
    faData.Free;

  if Assigned(faList) then
    faList.Free;
end;

procedure TfrmFAEditor.edtNameChange(Sender: TObject);
begin
  lblWarning2.Visible := False;
end;

procedure TfrmFAEditor.FormShow(Sender: TObject);
begin
  actNewExecute(nil);
end;

procedure TfrmFAEditor.SetDatabase(aDB: TIPMSDatabase);
begin
  FDatabase := aDB;
end;

end.
