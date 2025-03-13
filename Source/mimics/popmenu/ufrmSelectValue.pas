unit ufrmSelectValue;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, CheckLst, uDataType;

type
  TOnDateTimeValueChange = procedure(aMode: E_LogicalMode; aDate1, aTime1,
    aDate2, aTime2: TDateTime) of object;
  TOnStrValueChange = procedure(aMode: E_LogicalMode; aValue1,
    aValue2: string) of object;
  TOnCheckListValueChange = procedure(aObj: TObject) of object;
  TOnCancel = procedure of object;

  TfrmSelectValue = class(TForm)
    rbDT_Equals: TRadioButton;
    rbDT_Between: TRadioButton;
    rbDT_LessThan: TRadioButton;
    rbDT_GreaterThan: TRadioButton;
    rbDT_IsNull: TRadioButton;
    dtpDT_Date1: TDateTimePicker;
    btnOK: TButton;
    btnCancel: TButton;
    btnHelp: TButton;
    pnlField_DateTime: TPanel;
    pnlField_IntegerDouble: TPanel;
    edtID_Value1: TEdit;
    rbID_Between: TRadioButton;
    rbID_Equals: TRadioButton;
    rbID_GreaterThan: TRadioButton;
    rbID_IsNull: TRadioButton;
    rbID_LessThan: TRadioButton;
    pnlField_CheckList: TPanel;
    dtpDT_Date2: TDateTimePicker;
    edtID_Value2: TEdit;
    chklstCL_List: TCheckListBox;
    dtpDT_Time1: TDateTimePicker;
    dtpDT_Time2: TDateTimePicker;
    procedure btnHelpClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RadioButtonClick(Sender: TObject);
    procedure KeyPress(Sender: TObject; var Key: Char);
  private
    FSelectedLogicalMode : E_LogicalMode;

    FDate1 : TDateTime;
    FTime1 : TDateTime;
    FDate2 : TDateTime;
    FTime2 : TDateTime;
    FValue1 : string;
    FValue2 : string;
    FCheckArray : array[0..4] of Boolean;

    FSelectedIndex : Integer;
    FShowMode : E_ShowMode;
    FOnDateTimeValueChange : TOnDateTimeValueChange;
    FOnStrValueChange : TOnStrValueChange;
    FOnCheckListValueChange : TOnCheckListValueChange;
    FOnCancel : TOnCancel;

    procedure SetSelectedIndex(aIndex: Integer);
    procedure SetShowMode(aMode: E_ShowMode);
    procedure SetOnDateTimeValueChange(aEvent: TOnDateTimeValueChange);
    procedure SetOnStrValueChange(aEvent: TOnStrValueChange);
    procedure SetOnCheckListValueChange(aEvent: TOnCheckListValueChange);
    procedure SetOnCancel(aEvent: TOnCancel);
  public
    procedure SetFormByData(aLogicalMode: E_LogicalMode; aDate1, aTime1, aDate2,
      aTime2: TDateTime; aValue1, aValue2: string; aCheckArray: array of Boolean);

    property SelectedIndex : Integer read FSelectedIndex write SetSelectedIndex;
    property ShowMode : E_ShowMode read FShowMode write SetShowMode;
    property OnDateTimeValueChange : TOnDateTimeValueChange
      read FOnDateTimeValueChange write SetOnDateTimeValueChange;
    property OnStrValueChange : TOnStrValueChange
      read FOnStrValueChange write SetOnStrValueChange;
    property OnCheckListValueChange : TOnCheckListValueChange
      read FOnCheckListValueChange write SetOnCheckListValueChange;
    property OnCancel : TOnCancel read FOnCancel write SetOnCancel;
  end;

var
  frmSelectValue: TfrmSelectValue;

implementation

uses
  ShellAPI, uMimicsSystem;

{$R *.dfm}

procedure TfrmSelectValue.btnCancelClick(Sender: TObject);
begin
  if FShowMode = smAdd then
    if Assigned(FOnCancel) then
      FOnCancel;

  Close;
end;

procedure TfrmSelectValue.btnHelpClick(Sender: TObject);
var
  tempStr : string;
begin
  tempStr := ExtractFilePath(Application.ExeName) + 'help\WelcometoHMI.chm';

  ShellExecute(Handle, 'Open', 'C:\Windows\hh.exe', PChar(tempStr), nil,
    SW_SHOWNORMAL);
end;

procedure TfrmSelectValue.btnOKClick(Sender: TObject);
begin
  case SysMimics.Mimic.ActiveMimic.MimicID of
    mtCmdHist:
    begin
      case E_CommandHistoryFieldName(FSelectedIndex) of
        CHfnTimeStamp:
        begin
          if Assigned(FOnDateTimeValueChange) then
            FOnDateTimeValueChange(FSelectedLogicalMode, dtpDT_Date1.DateTime,
              dtpDT_Time1.DateTime, dtpDT_Date2.DateTime, dtpDT_Time2.DateTime);
        end;
        CHfnPointId, CHfn_VAL:
        begin
          if Assigned(FOnStrValueChange) then
            FOnStrValueChange(FSelectedLogicalMode, edtID_Value1.Text,
              edtID_Value2.Text);
        end;
      end;
    end;
    mtHistory:
    begin
      case E_AlarmHistoryFieldName(FSelectedIndex) of
        AHfnTimeStamp, AHfnGenerationTime:
        begin
          if Assigned(FOnDateTimeValueChange) then
            FOnDateTimeValueChange(FSelectedLogicalMode, dtpDT_Date1.DateTime,
              dtpDT_Time1.DateTime, dtpDT_Date2.DateTime, dtpDT_Time2.DateTime);
        end;
        AHfnSequenceNumber, AHfnAlarmId, AHfnAlarmClass, AHfnResource,
        AHfnLoggedBy, AHfnReference, AHfnAlarmMessage:
        begin
          if Assigned(FOnStrValueChange) then
            FOnStrValueChange(FSelectedLogicalMode, edtID_Value1.Text,
              edtID_Value2.Text);
        end;
        AHfnPrevState, AHfnLogAction, AHfnFinalState:
        begin
          if Assigned(FOnCheckListValueChange) then
            FOnCheckListValueChange(chklstCL_List);
        end;
      end;
    end;
  end;

  Close;
end;

procedure TfrmSelectValue.FormShow(Sender: TObject);
var
  timeNow : TDateTime;
  i : Integer;
  c : TComponent;
begin
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;

  case FShowMode of
    smAdd:
    begin
      case SysMimics.Mimic.ActiveMimic.MimicID of
        mtCmdHist:
        begin
          case E_CommandHistoryFieldName(FSelectedIndex) of
            CHfnTimeStamp:
            begin
              pnlField_DateTime.Visible := True;
              pnlField_IntegerDouble.Visible := False;
              pnlField_CheckList.Visible := False;

              timeNow := Now;

              dtpDT_Date1.DateTime := timeNow;
              dtpDT_Time1.DateTime := timeNow;
              dtpDT_Date2.DateTime := timeNow;
              dtpDT_Time2.DateTime := timeNow;

              rbDT_Equals.Checked := True;
            end;
            CHfnPointId, CHfn_VAL:
            begin
              pnlField_DateTime.Visible := False;
              pnlField_IntegerDouble.Visible := True;
              pnlField_CheckList.Visible := False;

              edtID_Value1.Text := '';
              edtID_Value2.Text := '';

              rbID_Equals.Checked := True;
            end;
          end;
        end;
        mtHistory:
        begin
          case E_AlarmHistoryFieldName(FSelectedIndex) of
            AHfnTimeStamp, AHfnGenerationTime:
            begin
              pnlField_DateTime.Visible := True;
              pnlField_IntegerDouble.Visible := False;
              pnlField_CheckList.Visible := False;

              timeNow := Now;

              dtpDT_Date1.DateTime := timeNow;
              dtpDT_Time1.DateTime := timeNow;
              dtpDT_Date2.DateTime := timeNow;
              dtpDT_Time2.DateTime := timeNow;

              rbDT_Equals.Checked := True;
            end;
            AHfnSequenceNumber, AHfnAlarmId, AHfnAlarmClass, AHfnResource,
            AHfnLoggedBy, AHfnReference, AHfnAlarmMessage:
            begin
              pnlField_DateTime.Visible := False;
              pnlField_IntegerDouble.Visible := True;
              pnlField_CheckList.Visible := False;

              edtID_Value1.Text := '';
              edtID_Value2.Text := '';

              rbID_Equals.Checked := True;
            end;
            AHfnPrevState, AHfnLogAction, AHfnFinalState:
            begin
              pnlField_DateTime.Visible := False;
              pnlField_IntegerDouble.Visible := False;
              pnlField_CheckList.Visible := True;

              for i := 0 to chklstCL_List.Count - 1 do
                chklstCL_List.Checked[i] := False;
            end;
          end;
        end;
      end;
    end;
    smModify:
    begin
      case SysMimics.Mimic.ActiveMimic.MimicID of
        mtCmdHist:
        begin
          case E_CommandHistoryFieldName(FSelectedIndex) of
            CHfnTimeStamp:
            begin
              pnlField_DateTime.Visible := True;
              pnlField_IntegerDouble.Visible := False;
              pnlField_CheckList.Visible := False;

              for i := 0 to ComponentCount - 1 do
              begin
                c := Components[i];

                if (c is TRadioButton) and
                  (E_LogicalMode(TRadioButton(c).Tag) = FSelectedLogicalMode) then
                  TRadioButton(c).Checked := True;
              end;

              dtpDT_Date1.DateTime := FDate1;
              dtpDT_Time1.DateTime := FTime1;
              dtpDT_Date2.DateTime := FDate2;
              dtpDT_Time2.DateTime := FTime2;
            end;
            CHfnPointId, CHfn_VAL:
            begin
              pnlField_DateTime.Visible := False;
              pnlField_IntegerDouble.Visible := True;
              pnlField_CheckList.Visible := False;

              for i := 0 to ComponentCount - 1 do
              begin
                c := Components[i];

                if (c is TRadioButton) and
                  (E_LogicalMode(TRadioButton(c).Tag) = FSelectedLogicalMode) then
                  TRadioButton(c).Checked := True;
              end;

              edtID_Value1.Text := FValue1;
              edtID_Value2.Text := FValue2;
            end;
          end;
        end;
        mtHistory:
        begin
          case E_AlarmHistoryFieldName(FSelectedIndex) of
            AHfnTimeStamp, AHfnGenerationTime:
            begin
              pnlField_DateTime.Visible := True;
              pnlField_IntegerDouble.Visible := False;
              pnlField_CheckList.Visible := False;

              for i := 0 to ComponentCount - 1 do
              begin
                c := Components[i];

                if (c is TRadioButton) and
                  (E_LogicalMode(TRadioButton(c).Tag) = FSelectedLogicalMode) then
                  TRadioButton(c).Checked := True;
              end;

              dtpDT_Date1.DateTime := FDate1;
              dtpDT_Time1.DateTime := FTime1;
              dtpDT_Date2.DateTime := FDate2;
              dtpDT_Time2.DateTime := FTime2;
            end;
            AHfnSequenceNumber, AHfnAlarmId, AHfnAlarmClass, AHfnResource,
            AHfnLoggedBy, AHfnReference, AHfnAlarmMessage:
            begin
              pnlField_DateTime.Visible := False;
              pnlField_IntegerDouble.Visible := True;
              pnlField_CheckList.Visible := False;

              for i := 0 to ComponentCount - 1 do
              begin
                c := Components[i];

                if (c is TRadioButton) and
                  (E_LogicalMode(TRadioButton(c).Tag) = FSelectedLogicalMode) then
                  TRadioButton(c).Checked := True;
              end;

              edtID_Value1.Text := FValue1;
              edtID_Value2.Text := FValue2;
            end;
            AHfnPrevState, AHfnLogAction, AHfnFinalState:
            begin
              pnlField_DateTime.Visible := False;
              pnlField_IntegerDouble.Visible := False;
              pnlField_CheckList.Visible := True;

              for i := 0 to chklstCL_List.Count - 1 do
                chklstCL_List.Checked[i] := FCheckArray[i];
            end;
          end;
        end;
      end;
    end;
  end;

  btnOK.Focused;
end;

procedure TfrmSelectValue.KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnOK.Click;
end;

procedure TfrmSelectValue.RadioButtonClick(Sender: TObject);
begin
  FSelectedLogicalMode := E_LogicalMode(TRadioButton(Sender).Tag);

  if pnlField_DateTime.Visible then
  begin
    case FSelectedLogicalMode of
      lmEquals, lmLessThan, lmGreaterThan:
      begin
        dtpDT_Date1.Visible := True;
        dtpDT_Time1.Visible := True;
        dtpDT_Date2.Visible := False;
        dtpDT_Time2.Visible := False;
      end;
      lmBetween:
      begin
        dtpDT_Date1.Visible := True;
        dtpDT_Time1.Visible := True;
        dtpDT_Date2.Visible := True;
        dtpDT_Time2.Visible := True;
      end;
      lmIsNull:
      begin
        dtpDT_Date1.Visible := False;
        dtpDT_Time1.Visible := False;
        dtpDT_Date2.Visible := False;
        dtpDT_Time2.Visible := False;
      end;
    end;
  end;

  if pnlField_IntegerDouble.Visible then
  begin
    case FSelectedLogicalMode of
      lmEquals, lmLessThan, lmGreaterThan:
      begin
        edtID_Value1.Visible := True;
        edtID_Value2.Visible := False;
      end;
      lmBetween:
      begin
        edtID_Value1.Visible := True;
        edtID_Value2.Visible := True;
      end;
      lmIsNull:
      begin
        edtID_Value1.Visible := False;
        edtID_Value2.Visible := False;
      end;
    end;
  end;
end;

procedure TfrmSelectValue.SetFormByData(aLogicalMode: E_LogicalMode; aDate1,
  aTime1, aDate2, aTime2: TDateTime; aValue1, aValue2: string;
  aCheckArray: array of Boolean);
var
  i : Integer;
begin
  FSelectedLogicalMode := aLogicalMode;
  FDate1 := aDate1;
  FTime1 := aTime1;
  FDate2 := aDate2;
  FTime2 := aTime2;
  FValue1 := aValue1;
  FValue2 := aValue2;

  for i := 0 to Length(aCheckArray) - 1 do
    FCheckArray[i] := aCheckArray[i];
end;

procedure TfrmSelectValue.SetOnCancel(aEvent: TOnCancel);
begin
  FOnCancel := aEvent;
end;

procedure TfrmSelectValue.SetOnCheckListValueChange(
  aEvent: TOnCheckListValueChange);
begin
  FOnCheckListValueChange := aEvent;
end;

procedure TfrmSelectValue.SetOnDateTimeValueChange(
  aEvent: TOnDateTimeValueChange);
begin
  FOnDateTimeValueChange := aEvent;
end;

procedure TfrmSelectValue.SetOnStrValueChange(aEvent: TOnStrValueChange);
begin
  FOnStrValueChange := aEvent;
end;

procedure TfrmSelectValue.SetSelectedIndex(aIndex: Integer);
begin
  FSelectedIndex := aIndex;
end;

procedure TfrmSelectValue.SetShowMode(aMode: E_ShowMode);
begin
  FShowMode := aMode;
end;

end.
