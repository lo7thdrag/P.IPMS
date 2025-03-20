unit uPCSEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ActnMan, ActnCtrls, ActnList,
  PlatformDefaultStyleActnCtrls, uDatabase, System.Actions;

type
  TfrmPCSEditor = class(TForm)
    actmgr1: TActionManager;
    actNew: TAction;
    actPick: TAction;
    actSave: TAction;
    actDelete: TAction;
    actCancel: TAction;
    acttb1: TActionToolBar;
    edtName: TEdit;
    lblName: TLabel;
    cbbControl: TComboBox;
    lbl1: TLabel;
    lbl5: TLabel;
    cbbGearBoxPort: TComboBox;
    lbl7: TLabel;
    cbbGearBoxStar: TComboBox;
    lbl10: TLabel;
    cbbModeEngPort: TComboBox;
    lbl11: TLabel;
    cbbModeEngStar: TComboBox;
    lbl12: TLabel;
    cbbMainEnginePort: TComboBox;
    cbbMainEngineStar: TComboBox;
    lbl13: TLabel;
    lbl2: TLabel;
    cbbRemotePort: TComboBox;
    trckbrHelmEngStar: TTrackBar;
    trckbrHelmEngPort: TTrackBar;
    lblModeEngStar: TLabel;
    lblModeEngPort: TLabel;
    lbl3: TLabel;
    cbbRemoteStar: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    lblWarning2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actPickExecute(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbbModeEngPortChange(Sender: TObject);
    procedure cbbModeEngStarChange(Sender: TObject);
    procedure trckbrHelmEngPortChange(Sender: TObject);
    procedure trckbrHelmEngStarChange(Sender: TObject);
    procedure cbbControlChange(Sender: TObject);
    procedure edtNameChange(Sender: TObject);
  private
    CondNameBuffer : string;
    FDatabase : TIPMSDatabase;
    FCondition_ID : Integer;
  public
    procedure SetDatabase(aDB : TIPMSDatabase);
  end;

var
  frmPCSEditor: TfrmPCSEditor;

implementation

uses
  uAvailablePCSCondition, uInstructorSystem, uDBSupportClasses;

{$R *.dfm}

{ TfrmPCSEditor }

procedure TfrmPCSEditor.actCancelExecute(Sender: TObject);
var
  aList : TList;
begin
  aList := nil;
  if FCondition_ID = 0 then
    actNewExecute(nil)
  else
  begin
    InstructorSys.Scenario.GetPCSCondition(FCondition_ID, aList);

    if aList.Count = 0 then
      Exit;

    edtName.Text := frmAvailPCSCondition.PCSCondName;
  end;
end;

procedure TfrmPCSEditor.actDeleteExecute(Sender: TObject);
var
  j : Integer;
  conname : string;
begin
  if FCondition_ID = 0 then
    Exit;

  conname := edtName.Text;

  if (MessageDlg('Are You Sure To Delete "' + edtName.Text + '" Condition ?', mtWarning, [mbYes, mbNo], 0)) = mrYes then
  begin
    if InstructorSys.Scenario.DeletePCSCondition(FCondition_ID) then
    begin
      actNewExecute(nil);
      MessageDlg('Delete "' + conname + '" Condition Success', mtInformation, [mbOK], 0);

      for j := 0 to ComponentCount - 1 do
      begin
        if Components[j] is TComboBox then
        begin
          if TComboBox(Components[j]).Tag > 0 then
          begin
            TComboBox(Components[j]).ItemIndex := -1;
          end;
        end;
      end;
    end
    else
      MessageDlg('Delete "' + conname + '" Condition Failed', mtError, [mbOK], 0);
  end;
end;

procedure TfrmPCSEditor.actNewExecute(Sender: TObject);
begin
  FCondition_ID := 0;

  edtName.Text := '';
end;

procedure TfrmPCSEditor.actPickExecute(Sender: TObject);
var
  pcsNames : TStrings;
  pcsList : TList;
  pcsData : TPCSCond_Data;
  i,j : Integer;
begin
  if not Assigned(frmAvailPCSCondition)  then
    frmAvailPCSCondition := TfrmAvailPCSCondition.Create(self);

  pcsNames := nil;
  pcsList := nil;

  InstructorSys.Scenario.GetPCSConditions(pcsNames);
  frmAvailPCSCondition.SetAvailableCondition(pcsNames);
  pcsNames.Free;

  if frmAvailPCSCondition.ShowModal = mrOk then
  begin
    if frmAvailPCSCondition.PCSCondName = '' then
      Exit;

    FCondition_ID := InstructorSys.Scenario.GetConditionID(frmAvailPCSCondition.PCSCondName);

    InstructorSys.Scenario.GetPCSCondition(FCondition_ID, pcsList);

    if pcsList.Count = 0 then
      Exit;

    edtName.Text := frmAvailPCSCondition.PCSCondName;

    {untuk flag ketika update dengan nama yang berbeda}
    CondNameBuffer := frmAvailPCSCondition.PCSCondName;

    for I := 0 to pcsList.Count - 1 do
    begin
      pcsData := TPCSCond_Data(pcsList.Items[i]);
      for j := 0 to ComponentCount - 1 do
      begin
        if Components[j] is TComboBox then
        begin
          if TComboBox(Components[j]).Hint = pcsData.PCS_Name then
          begin
            TComboBox(Components[j]).ItemIndex := pcsData.PCS_State;
          end;
        end;
      end;

      if pcsData.PCS_Name = 'Mode Engine Port' then
      begin
        trckbrHelmEngPort.Position := pcsData.Value;
      end
      else if pcsData.PCS_Name = 'Mode Engine Starboard' then
      begin
        trckbrHelmEngStar.Position := pcsData.Value;
      end;

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
  end;
end;

procedure TfrmPCSEditor.actSaveExecute(Sender: TObject);
var
  pcsData : TPCSCond_Data;
  pcsList : TList;
  j, i : Integer;
begin
  if Trim(edtName.Text) = '' then
  begin
    lblWarning2.Caption := '* Condition Name Is Empty, Please Insert Condition Name';
    lblWarning2.Visible := True;
    Exit;
  end;

  if FCondition_ID = 0 then
  begin
    if InstructorSys.Scenario.GetConditionID(edtName.Text) > 0 then
    begin
      lblWarning2.Caption := '* Condition Name Is Already In Use, Please Use Another Condition Name';
      lblWarning2.Visible := True;
      Exit;
    end;

    pcsList := TList.Create;

    for I := 1 to 9 do
    begin
      pcsData := TPCSCond_Data.Create;
      for j := 0 to ComponentCount - 1 do
      begin
        if Components[j] is TComboBox then
        begin
          if TComboBox(Components[j]).Tag = i then
          begin
            pcsData.PCS_Name := TComboBox(Components[j]).Hint;
            pcsData.PCS_State := TComboBox(Components[j]).ItemIndex;
            if pcsData.PCS_Name = 'Mode Engine Port' then
            begin
              pcsData.Value := trckbrHelmEngPort.Position;
            end
            else if pcsData.PCS_Name = 'Mode Engine Starboard' then
            begin
              pcsData.Value := trckbrHelmEngStar.Position;
            end;
          end;
        end;
      end;
      pcsList.Add(pcsData);
    end;
    InstructorSys.Scenario.SavePCSCondition(True, edtName.Text, pcsList);
    MessageDlg('"' + edtName.Text + '" Condition Has Been Saved', mtInformation, [mbOK], 0);
    actNewExecute(nil);

    for j := 0 to ComponentCount - 1 do
      begin
        if Components[j] is TComboBox then
        begin
          if TComboBox(Components[j]).Tag > 0 then
          begin
            TComboBox(Components[j]).ItemIndex := -1;
          end;
        end;
      end;


    pcsList.Free;
  end
  else if FCondition_ID > 0 then
  begin
    if CondNameBuffer <> edtName.Text then
    begin
      ShowMessage('Can Not Update PCS Condition With a Different Name');
      Exit;
    end;

    pcsList := TList.Create;

    for I := 1 to 9 do
    begin
      pcsData := TPCSCond_Data.Create;
      for j := 0 to ComponentCount - 1 do
      begin
        if Components[j] is TComboBox then
        begin
          if TComboBox(Components[j]).Tag = i then
          begin
            pcsData.PCS_Name := TComboBox(Components[j]).Hint;
            pcsData.PCS_State := TComboBox(Components[j]).ItemIndex;
            pcsData.Condition_ID := FCondition_ID;
            if pcsData.PCS_Name = 'Mode Engine Port' then
            begin
              pcsData.Value := trckbrHelmEngPort.Position;
            end
            else if pcsData.PCS_Name = 'Mode Engine Starboard' then
            begin
              pcsData.Value := trckbrHelmEngStar.Position;
            end;
          end;
        end;
      end;
      pcsList.Add(pcsData);
    end;
    InstructorSys.Scenario.SavePCSCondition(False, edtName.Text, pcsList);
    MessageDlg('"' + edtName.Text + '" Condition Has Been Updated', mtInformation, [mbOK], 0);
    actNewExecute(nil);
    for j := 0 to ComponentCount - 1 do
      begin
        if Components[j] is TComboBox then
        begin
          if TComboBox(Components[j]).Tag > 0 then
          begin
            TComboBox(Components[j]).ItemIndex := -1;
          end;
        end;
      end;


    pcsList.Free;
  end;
end;

procedure TfrmPCSEditor.cbbControlChange(Sender: TObject);
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

procedure TfrmPCSEditor.cbbModeEngPortChange(Sender: TObject);
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

procedure TfrmPCSEditor.cbbModeEngStarChange(Sender: TObject);
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

procedure TfrmPCSEditor.edtNameChange(Sender: TObject);
begin
  lblWarning2.Visible := False;
end;

procedure TfrmPCSEditor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmPCSEditor := nil;
end;

procedure TfrmPCSEditor.FormShow(Sender: TObject);
begin
  actNewExecute(nil);
  lblModeEngStar.Caption := '';
  lblModeEngPort.Caption := '';
end;

procedure TfrmPCSEditor.SetDatabase(aDB: TIPMSDatabase);
begin
  FDatabase := aDB;
end;

procedure TfrmPCSEditor.trckbrHelmEngPortChange(Sender: TObject);
begin
  lblModeEngPort.Visible := True;
  lblModeEngPort.Caption := IntToStr(trckbrHelmEngPort.Position);
end;

procedure TfrmPCSEditor.trckbrHelmEngStarChange(Sender: TObject);
begin
  lblModeEngStar.Visible := True;
  lblModeEngStar.Caption := IntToStr(trckbrHelmEngStar.Position);
end;

end.
