unit uTanksEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ActnList, PlatformDefaultStyleActnCtrls, ActnMan, ToolWin,
  ActnCtrls, uDatabase;

type
  TfrmTanksEditor = class(TForm)
    acttb1: TActionToolBar;
    actmgr1: TActionManager;
    actNew: TAction;
    actPick: TAction;
    actSave: TAction;
    actDelete: TAction;
    actCancel: TAction;
    lbl1: TLabel;
    edtName: TEdit;
    lbl20: TLabel;
    lbl2: TLabel;
    edtWBPS: TEdit;
    lbl3: TLabel;
    edtWBSB: TEdit;
    lbl4: TLabel;
    lbl5: TLabel;
    edtWBFWD: TEdit;
    lbl6: TLabel;
    lbl7: TLabel;
    edtFWTKPS: TEdit;
    lbl8: TLabel;
    lbl9: TLabel;
    edtFWTKSB: TEdit;
    lbl10: TLabel;
    lbl11: TLabel;
    edtFWROLLSTABTK: TEdit;
    lbl12: TLabel;
    lbl13: TLabel;
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
    btnFullAll: TButton;
    edtPersen: TEdit;
    lbl38: TLabel;
    cbbSetValue: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    lblWarning2: TLabel;
    procedure actNewExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actPickExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure btnFullAllClick(Sender: TObject);
    procedure edtWBPSKeyPress(Sender: TObject; var Key: Char);
    procedure edtNameChange(Sender: TObject);

  private
    CondNameBuffer : string;
    { Private declarations }
    FCondition_ID : Integer;
  public
    { Public declarations }
  end;

var
  frmTanksEditor: TfrmTanksEditor;

implementation

uses uDBSupportClasses, uInstructorSystem, uAvailableTanksCondition;

{$R *.dfm}

procedure TfrmTanksEditor.actCancelExecute(Sender: TObject);
var
  faList : TList;
  i : Integer;
  TanksData : TTanksCond_Data;
begin
  if FCondition_ID = 0 then
    actNewExecute(nil)
  else
  begin
    faList := nil;
    InstructorSys.Scenario.GetTanksCondition(FCondition_ID, faList);

    if faList.Count = 0 then
      Exit;

    edtName.Text := frmTanksCondition.TanksCondName;

    for i := 0 to faList.Count - 1 do
    begin
      TanksData := TTanksCond_Data(faList.Items[i]);

      if TanksData.Tanks_ElementID = '5292S0002A' then
       edtWBPS.Text := floattostr(TanksData.Tanks_Value)
      else if TanksData.Tanks_ElementID = '5292S0003A' then
       edtWBSB.Text := floattostr(TanksData.Tanks_Value)
      else if TanksData.Tanks_ElementID = '5292S0001A' then
       edtWBFWD.Text := floattostr(TanksData.Tanks_Value)
      else if TanksData.Tanks_ElementID = '5321S0002A' then
       edtFWTKPS.Text := floattostr(TanksData.Tanks_Value)
      else if TanksData.Tanks_ElementID = '5321S0001A' then
       edtFWTKSB.Text := floattostr(TanksData.Tanks_Value)
      else if TanksData.Tanks_ElementID = '5321S0003A' then
       edtFWROLLSTABTK.Text := floattostr(TanksData.Tanks_Value)
      else if TanksData.Tanks_ElementID = '5411S0001A' then
       edtFOTK1.Text := floattostr(TanksData.Tanks_Value)
      else if TanksData.Tanks_ElementID = '5411S0002A' then
       edtFOTK2.Text := floattostr(TanksData.Tanks_Value)
      else if TanksData.Tanks_ElementID = '5411S0003A' then
       edtFOTK3.Text := floattostr(TanksData.Tanks_Value)
      else if TanksData.Tanks_ElementID = '5411S0004A' then
       edtFOTK4.Text := floattostr(TanksData.Tanks_Value)
      else if TanksData.Tanks_ElementID = '5412S0010A' then
       edtFOOVTK.Text := floattostr(TanksData.Tanks_Value)
      else if TanksData.Tanks_ElementID = '5411S0006A' then
       edtFOLOADTRUNK.Text := floattostr(TanksData.Tanks_Value)
      else if TanksData.Tanks_ElementID = '5412S0004A' then
       edtFODAILYPS.Text := floattostr(TanksData.Tanks_Value)
      else if TanksData.Tanks_ElementID = '5412S0001A' then
       edtFODAILYSB.Text := floattostr(TanksData.Tanks_Value)
      else if TanksData.Tanks_ElementID = '2621S0002A' then
       edtMELOTK.Text := floattostr(TanksData.Tanks_Value)
      else if TanksData.Tanks_ElementID = '2621S0001A' then
       edtGBXLOTK.Text := floattostr(TanksData.Tanks_Value)
      else if TanksData.Tanks_ElementID = '5932S0001A' then
       edtBILGEWTK.Text := floattostr(TanksData.Tanks_Value)
      else if TanksData.Tanks_ElementID = '2622S0001A' then
       edtSLDIRTYTK.Text := floattostr(TanksData.Tanks_Value)
    end;

  end;
end;
procedure TfrmTanksEditor.actDeleteExecute(Sender: TObject);
var
  conname : string;
begin
  if FCondition_ID = 0 then
    Exit;

  conname := edtName.Text;

  if (MessageDlg('Are You Sure To Delete "' + edtName.Text + '" Condition ?', mtWarning, [mbYes, mbNo], 0)) = mrYes then
  begin
    if InstructorSys.Scenario.DeleteTanksCondition(FCondition_ID) then
    begin
      actNewExecute(nil);
      MessageDlg('Delete "' + conname + '" Condition Success', mtInformation, [mbOK], 0)
    end
    else
      MessageDlg('Delete "' + conname + '" Condition Failed', mtError, [mbOK], 0);
  end;
end;

procedure TfrmTanksEditor.actNewExecute(Sender: TObject);
var
  i: Integer;
begin
  FCondition_ID := 0;

  edtName.Text := '';

  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TEdit then
    begin
      if TEdit(Components[i]).Tag = 0 then
        TEdit(Components[i]).Text := ''
      else
        TEdit(Components[i]).Text := '0';
    end;
  end;
end;

procedure TfrmTanksEditor.actPickExecute(Sender: TObject);
var
  TanksNames : TStrings;
  TanksList : TList;
  TanksData : TTanksCond_Data;
  i : Integer;
begin
  if not Assigned(frmTanksCondition)  then
    frmTanksCondition := TfrmTanksCondition.Create(self);

  TanksList := nil;
  TanksNames := nil;
  InstructorSys.Scenario.GetTanksConditions(TanksNames);
  frmTanksCondition.SetAvailableCondition(TanksNames);
  TanksNames.Free;

  if frmTanksCondition.ShowModal = mrOk then
  begin
    if frmTanksCondition.TanksCondName = '' then
      Exit;

    FCondition_ID := InstructorSys.Scenario.GetConditionID(frmTanksCondition.TanksCondName);

    InstructorSys.Scenario.GetTanksCondition(FCondition_ID, TanksList);

    if TanksList.Count = 0 then
      Exit;

    edtName.Text := frmTanksCondition.TanksCondName;
    {untuk flag ketika update dengan nama yang berbeda}
    CondNameBuffer := frmTanksCondition.TanksCondName;

    for i := 0 to TanksList.Count - 1 do
    begin
      TanksData := TTanksCond_Data(TanksList.Items[i]);

      if TanksData.Tanks_ElementID = '5292S0002A' then
       edtWBPS.Text := floattostr(TanksData.Tanks_Value)
      else if TanksData.Tanks_ElementID = '5292S0003A' then
       edtWBSB.Text := floattostr(TanksData.Tanks_Value)
      else if TanksData.Tanks_ElementID = '5292S0001A' then
       edtWBFWD.Text := floattostr(TanksData.Tanks_Value)
      else if TanksData.Tanks_ElementID = '5321S0002A' then
       edtFWTKPS.Text := floattostr(TanksData.Tanks_Value)
      else if TanksData.Tanks_ElementID = '5321S0001A' then
       edtFWTKSB.Text := floattostr(TanksData.Tanks_Value)
      else if TanksData.Tanks_ElementID = '5321S0003A' then
       edtFWROLLSTABTK.Text := floattostr(TanksData.Tanks_Value)
      else if TanksData.Tanks_ElementID = '5411S0001A' then
       edtFOTK1.Text := floattostr(TanksData.Tanks_Value)
      else if TanksData.Tanks_ElementID = '5411S0002A' then
       edtFOTK2.Text := floattostr(TanksData.Tanks_Value)
      else if TanksData.Tanks_ElementID = '5411S0003A' then
       edtFOTK3.Text := floattostr(TanksData.Tanks_Value)
      else if TanksData.Tanks_ElementID = '5411S0004A' then
       edtFOTK4.Text := floattostr(TanksData.Tanks_Value)
      else if TanksData.Tanks_ElementID = '5412S0010A' then
       edtFOOVTK.Text := floattostr(TanksData.Tanks_Value)
      else if TanksData.Tanks_ElementID = '5411S0006A' then
       edtFOLOADTRUNK.Text := floattostr(TanksData.Tanks_Value)
      else if TanksData.Tanks_ElementID = '5412S0004A' then
       edtFODAILYPS.Text := floattostr(TanksData.Tanks_Value)
      else if TanksData.Tanks_ElementID = '5412S0001A' then
       edtFODAILYSB.Text := floattostr(TanksData.Tanks_Value)
      else if TanksData.Tanks_ElementID = '2621S0002A' then
       edtMELOTK.Text := floattostr(TanksData.Tanks_Value)
      else if TanksData.Tanks_ElementID = '2621S0001A' then
       edtGBXLOTK.Text := floattostr(TanksData.Tanks_Value)
      else if TanksData.Tanks_ElementID = '5932S0001A' then
       edtBILGEWTK.Text := floattostr(TanksData.Tanks_Value)
      else if TanksData.Tanks_ElementID = '2622S0001A' then
       edtSLDIRTYTK.Text := floattostr(TanksData.Tanks_Value)

    end;
  end;

end;

procedure TfrmTanksEditor.actSaveExecute(Sender: TObject);
var
  i, j, ConditionID : Integer;
  TanksData : TTanksCond_Data;
  TanksList : TList;
  isValid, isAllValid : boolean;
  isValidName : boolean;
begin
  isAllValid := true;
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

    TanksList := TList.Create;

    for I := 1 to 18 do
    begin
      TanksData := TTanksCond_Data.Create;

      for j := 0 to ComponentCount - 1 do
      begin
        if Components[j] is TEdit then
        begin
          if TEdit(Components[j]).Tag = i then
          begin
            TanksData.Tanks_ElementID := TEdit(Components[j]).Hint;
            isValid := InstructorSys.Scenario.cekValidateTankValue(TanksData.Tanks_ElementID,
                      strtofloat(TEdit(Components[j]).Text));
            if isValid then
            begin
              TEdit(Components[j]).Color := clWindow;
              TanksData.Tanks_Value := StrToFloat(TEdit(Components[j]).Text)
            end
            else
            begin
              isAllValid := false;
              TEdit(Components[j]).Color := clRed;;
            end;
          end;
        end;

      end;

      TanksList.Add(TanksData);

    end;

    InstructorSys.Scenario.SaveTanksCondition(True, edtName.Text, '', TanksList, ConditionID);
    MessageDlg('"' + edtName.Text + '" Condition Has Been Saved', mtInformation, [mbOK], 0);
    actNewExecute(nil);
  end
  else if FCondition_ID > 0 then
  begin
    if CondNameBuffer <> edtName.Text then
    begin
      ShowMessage('Can Not Update TANK Condition With a Different Name');
      Exit;
    end;

    TanksList := TList.Create;

    for I := 1 to 18 do
    begin
      TanksData := TTanksCond_Data.Create;
      TanksData.Tanks_ID := InstructorSys.Scenario.GetTanksCondID(FCondition_ID, i);

      for j := 0 to ComponentCount - 1 do
      begin
        if Components[j] is TEdit then
        begin
          if TEdit(Components[j]).Tag = i then
          begin
            TanksData.Tanks_ElementID := TEdit(Components[j]).Hint;
            isValid := InstructorSys.Scenario.cekValidateTankValue(TanksData.Tanks_ElementID,
                      strtofloat(TEdit(Components[j]).Text));
            if isValid then
            begin
              TEdit(Components[j]).Color := clWindow;
              TanksData.Tanks_Value := StrToFloat(TEdit(Components[j]).Text)
            end
            else
            begin
              isAllValid := false;
              TEdit(Components[j]).Color := clRed;
            end;
          end;
        end;
      end;

      TanksData.Condition_ID := FCondition_ID;
      TanksList.Add(TanksData);

    end;

    InstructorSys.Scenario.SaveTanksCondition(false, edtName.Text, frmTanksCondition.TanksCondName, TanksList, ConditionID);
    MessageDlg('"' + edtName.Text + '" Condition Has Been Updated', mtInformation, [mbOK], 0);
    actNewExecute(nil);
  end;

end;

procedure TfrmTanksEditor.btnFullAllClick(Sender: TObject);
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

procedure TfrmTanksEditor.edtNameChange(Sender: TObject);
begin
  lblWarning2.Visible := False;
end;

procedure TfrmTanksEditor.edtWBPSKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9', #8, #13, #46]) then
    key := #0;
end;

end.
