unit ufrmEdtFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ufrmSelectValue, uDataType;

type
  TOnWhereChange = procedure(aClause: string) of object;

  E_Condition = (cNone, cAND, cOR);

  TWhereDetail = class
  private
    FHasValue : Boolean;

    FCHField : E_CommandHistoryFieldName;
    FAHField : E_AlarmHistoryFieldName;
    FLogicalMode : E_LogicalMode;
    FDate1 : TDateTime;
    FTime1 : TDateTime;
    FDate2 : TDateTime;
    FTime2 : TDateTime;
    FValue1 : string;
    FValue2 : string;
    FCondition : E_Condition;
    FIsOpenParentheses : Boolean;
    FIsCloseParentheses : Boolean;
    FIsNOT : Boolean;
  public
    CheckArray : array[0..4] of Boolean;

    property HasValue : Boolean read FHasValue write FHasValue;

    property CHField : E_CommandHistoryFieldName read FCHField write FCHField;
    property AHField : E_AlarmHistoryFieldName read FAHField write FAHField;
    property LogicalMode : E_LogicalMode read FLogicalMode write FLogicalMode;
    property Date1 : TDateTime read FDate1 write FDate1;
    property Time1 : TDateTime read FTime1 write FTime1;
    property Date2 : TDateTime read FDate2 write FDate2;
    property Time2 : TDateTime read FTime2 write FTime2;
    property Value1 : string read FValue1 write FValue1;
    property Value2 : string read FValue2 write FValue2;
    property Condition : E_Condition read FCondition write FCondition;
    property IsOpenParentheses : Boolean read FIsOpenParentheses
      write FIsOpenParentheses;
    property IsCloseParentheses : Boolean read FIsCloseParentheses
      write FIsCloseParentheses;
    property IsNOT : Boolean read FIsNOT write FIsNOT;
  end;

  TfrmEdtFilter = class(TForm)
    lblFields: TLabel;
    lstFields: TListBox;
    lblSelect: TLabel;
    lstSelect: TListBox;
    lblSqlClause: TLabel;
    btnOK: TButton;
    btnCancel: TButton;
    btnHelp: TButton;
    btnAddCondition: TButton;
    btnModify: TButton;
    btnRemove: TButton;
    btnAND: TButton;
    btnOR: TButton;
    btnOpenParentheses: TButton;
    btnCloseParentheses: TButton;
    btnNOT: TButton;
    mmoSqlClause: TMemo;
    procedure FormShow(Sender: TObject);
    procedure btnAddConditionClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnModifyClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnANDClick(Sender: TObject);
    procedure btnORClick(Sender: TObject);
    procedure btnOpenParenthesesClick(Sender: TObject);
    procedure btnCloseParenthesesClick(Sender: TObject);
    procedure btnNOTClick(Sender: TObject);
  private
    FOnWhereChange : TOnWhereChange;

    procedure SetOnWhereChange(aEvent: TOnWhereChange);

    procedure SetCustomEvent(Sender: TObject);
    procedure ValueChange(aMode: E_LogicalMode; aDate1, aTime1, aDate2,
      aTime2: TDateTime); overload;
    procedure ValueChange(aMode: E_LogicalMode; aValue1,
      aValue2: string); overload;
    procedure ValueChange(aObj: TObject); overload;
    procedure ValueChange; overload;

    procedure WriteListWhere(aIndex: Integer);
    procedure WriteSqlClause;
  public
    property OnWhereChange : TOnWhereChange read FOnWhereChange
      write SetOnWhereChange;
  end;

const
  C_CheckString : array[0..4] of string = ('A', 'D', 'G', 'N', 'R');

var
  frmEdtFilter: TfrmEdtFilter;

implementation

uses
  ShellAPI, StrUtils, CheckLst, uMimicsSystem;

{$R *.dfm}

procedure TfrmEdtFilter.btnAddConditionClick(Sender: TObject);
var
  detail : TWhereDetail;
begin
  if lstFields.ItemIndex = -1 then
    Exit;

  detail := TWhereDetail.Create;

  case SysMimics.Mimic.ActiveMimic.MimicID of
    mtCmdHist: detail.CHField := E_CommandHistoryFieldName(lstFields.ItemIndex);
    mtHistory: detail.AHField := E_AlarmHistoryFieldName(lstFields.ItemIndex);
  end;

  if lstSelect.Count = 0 then
    detail.Condition := cNone
  else
    detail.Condition := cAND;

  lstSelect.AddItem('', detail);

  lstSelect.ItemIndex := lstSelect.Count - 1;

  WriteListWhere(lstSelect.ItemIndex);

  frmSelectValue.SelectedIndex := lstFields.ItemIndex;
  frmSelectValue.ShowMode := smAdd;
  frmSelectValue.ShowModal;
end;

procedure TfrmEdtFilter.btnANDClick(Sender: TObject);
var
  detail : TWhereDetail;
begin
  if (lstSelect.ItemIndex = -1) or (lstSelect.ItemIndex = 0) then
    Exit;

  detail := TWhereDetail(lstSelect.Items.Objects[lstSelect.ItemIndex]);
  detail.Condition := cAND;

  WriteListWhere(lstSelect.ItemIndex);
end;

procedure TfrmEdtFilter.btnCancelClick(Sender: TObject);
begin
  lstSelect.Clear;
  mmoSqlClause.Clear;

  Close;
end;

procedure TfrmEdtFilter.btnCloseParenthesesClick(Sender: TObject);
var
  detail : TWhereDetail;
begin
  if lstSelect.ItemIndex = -1 then
    Exit;

  detail := TWhereDetail(lstSelect.Items.Objects[lstSelect.ItemIndex]);
  detail.IsCloseParentheses := not detail.IsCloseParentheses;

  WriteListWhere(lstSelect.ItemIndex);
end;

procedure TfrmEdtFilter.btnHelpClick(Sender: TObject);
var
  tempStr : string;
begin
  tempStr := ExtractFilePath(Application.ExeName) + 'help\WelcometoHMI.chm';

  ShellExecute(Handle, 'Open', 'C:\Windows\hh.exe', PChar(tempStr), nil,
    SW_SHOWNORMAL);
end;

procedure TfrmEdtFilter.btnModifyClick(Sender: TObject);
var
  detail : TWhereDetail;
begin
  if lstSelect.ItemIndex = -1 then
    Exit;

  detail := TWhereDetail(lstSelect.Items.Objects[lstSelect.ItemIndex]);

  with detail do
  begin
    frmSelectValue.SetFormByData(LogicalMode, Date1, Time1, Date2, Time2,
      Value1, Value2, CheckArray);

    case SysMimics.Mimic.ActiveMimic.MimicID of
      mtCmdHist: frmSelectValue.SelectedIndex := Ord(CHField);
      mtHistory: frmSelectValue.SelectedIndex := Ord(AHField);
    end;
  end;

  frmSelectValue.ShowMode := smModify;
  frmSelectValue.ShowModal;
end;

procedure TfrmEdtFilter.btnNOTClick(Sender: TObject);
var
  detail : TWhereDetail;
begin
  if lstSelect.ItemIndex = -1 then
    Exit;

  detail := TWhereDetail(lstSelect.Items.Objects[lstSelect.ItemIndex]);
  detail.IsNOT := not detail.IsNOT;

  WriteListWhere(lstSelect.ItemIndex);
end;

procedure TfrmEdtFilter.btnOKClick(Sender: TObject);
begin
  if Assigned(FOnWhereChange) then
    FOnWhereChange(RightStr(mmoSqlClause.Text, Length(mmoSqlClause.Text) - 6));

  Close;
end;

procedure TfrmEdtFilter.btnOpenParenthesesClick(Sender: TObject);
var
  detail : TWhereDetail;
begin
  if lstSelect.ItemIndex = -1 then
    Exit;

  detail := TWhereDetail(lstSelect.Items.Objects[lstSelect.ItemIndex]);
  detail.IsOpenParentheses := not detail.IsOpenParentheses;

  WriteListWhere(lstSelect.ItemIndex);
end;

procedure TfrmEdtFilter.btnORClick(Sender: TObject);
var
  detail : TWhereDetail;
begin
  if (lstSelect.ItemIndex = -1) or (lstSelect.ItemIndex = 0) then
    Exit;

  detail := TWhereDetail(lstSelect.Items.Objects[lstSelect.ItemIndex]);
  detail.Condition := cOR;

  WriteListWhere(lstSelect.ItemIndex);
end;

procedure TfrmEdtFilter.btnRemoveClick(Sender: TObject);
begin
  lstSelect.DeleteSelected;

  if lstSelect.Count > 0 then
  begin
    lstSelect.ItemIndex := 0;
    TWhereDetail(lstSelect.Items.Objects[0]).Condition := cNone;
    WriteListWhere(0);
  end
  else
    WriteSqlClause;
end;

procedure TfrmEdtFilter.FormCreate(Sender: TObject);
begin
  if not Assigned(frmSelectValue) then
  begin
    frmSelectValue := TfrmSelectValue.Create(Self);
    SetCustomEvent(frmSelectValue);
  end;
end;

procedure TfrmEdtFilter.FormShow(Sender: TObject);
var
  i : Integer;
begin
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;

  lstFields.Clear;

  case SysMimics.Mimic.ActiveMimic.MimicID of
    mtCmdHist:
    begin
      for i := 0 to Length(C_CommandHistoryField) - 1 do
        lstFields.AddItem(C_CommandHistoryField[i], nil);
    end;
    mtHistory:
    begin
      for i := 0 to Length(C_AlarmHistoryField) - 1 do
        lstFields.AddItem(C_AlarmHistoryField[i], nil);
    end;
  end;

  lstFields.ItemIndex := -1;
  lstSelect.ItemIndex := -1;
end;

procedure TfrmEdtFilter.SetCustomEvent(Sender: TObject);
begin
  if Sender is TfrmSelectValue then
  begin
    TfrmSelectValue(Sender).OnDateTimeValueChange := ValueChange;
    TfrmSelectValue(Sender).OnStrValueChange := ValueChange;
    TfrmSelectValue(Sender).OnCheckListValueChange := ValueChange;
    TfrmSelectValue(Sender).OnCancel := ValueChange;
  end;
end;

procedure TfrmEdtFilter.SetOnWhereChange(aEvent: TOnWhereChange);
begin
  FOnWhereChange := aEvent;
end;

procedure TfrmEdtFilter.ValueChange(aMode: E_LogicalMode; aDate1, aTime1,
  aDate2, aTime2: TDateTime);
var
  i : Integer;
  whereDetail : TWhereDetail;
begin
  for i := 0 to lstSelect.Count - 1 do
  begin
    if lstSelect.Selected[i] then
    begin
      whereDetail := TWhereDetail(lstSelect.Items.Objects[i]);
      whereDetail.HasValue := True;
      whereDetail.LogicalMode := aMode;
      whereDetail.Date1 := aDate1;
      whereDetail.Time1 := aTime1;
      whereDetail.Date2 := aDate2;
      whereDetail.Time2 := aTime2;

      WriteListWhere(i);
      Break;
    end;
  end;
end;

procedure TfrmEdtFilter.ValueChange(aMode: E_LogicalMode; aValue1,
  aValue2: string);
var
  i : Integer;
  whereDetail : TWhereDetail;
begin
  case aMode of
    lmEquals, lmLessThan, lmGreaterThan:
    begin
      if aValue1 = '' then
      begin
        lstSelect.DeleteSelected;
        WriteSqlClause;
      end
      else
      begin
        for i := 0 to lstSelect.Count - 1 do
        begin
          if lstSelect.Selected[i] then
          begin
            whereDetail := TWhereDetail(lstSelect.Items.Objects[i]);
            whereDetail.LogicalMode := aMode;
            whereDetail.Value1 := aValue1;
            whereDetail.Value2 := aValue2;

            WriteListWhere(i);
            Break;
          end;
        end;
      end;
    end;
    lmBetween:
    begin
      if (aValue1 = '') or (aValue2 = '') then
      begin
        lstSelect.DeleteSelected;
        WriteSqlClause;
      end
      else
      begin
        for i := 0 to lstSelect.Count - 1 do
        begin
          if lstSelect.Selected[i] then
          begin
            whereDetail := TWhereDetail(lstSelect.Items.Objects[i]);
            whereDetail.LogicalMode := aMode;
            whereDetail.Value1 := aValue1;
            whereDetail.Value2 := aValue2;

            WriteListWhere(i);
            Break;
          end;
        end;
      end;
    end;
    lmIsNull:
    begin
      lstSelect.DeleteSelected;
      WriteSqlClause;
    end
  end;
end;

procedure TfrmEdtFilter.ValueChange(aObj: TObject);
var
  i, j : Integer;
  whereDetail : TWhereDetail;
begin
  for i := 0 to lstSelect.Count - 1 do
  begin
    if lstSelect.Selected[i] then
    begin
      whereDetail := TWhereDetail(lstSelect.Items.Objects[i]);
      whereDetail.HasValue := True;
//      whereDetail.CheckList := aObj;

      for j := 0 to Length(whereDetail.CheckArray) - 1 do
        whereDetail.CheckArray[j] := TCheckListBox(aObj).Checked[j];

      WriteListWhere(i);
      Break;
    end;
  end;
end;

procedure TfrmEdtFilter.ValueChange;
begin
  lstSelect.DeleteSelected;
  WriteSqlClause;
end;

procedure TfrmEdtFilter.WriteListWhere(aIndex: Integer);
var
  whereDetail : TWhereDetail;
  whereClause, check1Str, check2Str : string;
  checkCount, i : Integer;
begin
  whereDetail := TWhereDetail(lstSelect.Items.Objects[aIndex]);

  case whereDetail.Condition of
    cNone: whereClause := '';
    cAND: whereClause := 'And ';
    cOR: whereClause := 'Or ';
  end;

  if whereDetail.IsOpenParentheses then
    whereClause := whereClause + '(';

  if whereDetail.IsNOT then
    whereClause := whereClause + 'NOT ';

  case SysMimics.Mimic.ActiveMimic.MimicID of
    mtCmdHist:
    begin
      whereClause := whereClause +
        C_CommandHistoryField[Ord(whereDetail.CHField)];

      case whereDetail.CHField of
        CHfnTimeStamp:
        begin
          case whereDetail.LogicalMode of
            lmNone: whereClause := whereClause + ' =';
            lmEquals:
            begin
              whereClause := whereClause + ' = ' +
                FormatDateTime('dd/MM/yyyy', whereDetail.Date1) + ' ' +
                FormatDateTime('HH:mm:ss', whereDetail.Time1);
            end;
            lmBetween:
            begin
              whereClause := whereClause + ' Between ' +
                FormatDateTime('dd/MM/yyyy', whereDetail.Date1) + ' ' +
                FormatDateTime('HH:mm:ss', whereDetail.Time1) + ' And ' +
                FormatDateTime('dd/MM/yyyy', whereDetail.Date2) + ' ' +
                FormatDateTime('HH:mm:ss', whereDetail.Time2);
            end;
            lmLessThan:
            begin
              whereClause := whereClause + ' Before ' +
                FormatDateTime('dd/MM/yyyy', whereDetail.Date1) + ' ' +
                FormatDateTime('HH:mm:ss', whereDetail.Time1);
            end;
            lmGreaterThan:
            begin
              whereClause := whereClause + ' After ' +
                FormatDateTime('dd/MM/yyyy', whereDetail.Date1) + ' ' +
                FormatDateTime('HH:mm:ss', whereDetail.Time1);
            end;
            lmIsNull: whereClause := whereClause + ' Is Null';
          end;
        end;
        CHfnPointId, CHfn_VAL:
        begin
          case whereDetail.LogicalMode of
            lmNone: whereClause := whereClause + ' =';
            lmEquals: whereClause := whereClause + ' = ' + whereDetail.Value1;
            lmBetween: whereClause := whereClause + ' Between ' +
              whereDetail.Value1 + ' And ' + whereDetail.Value2;
            lmLessThan: whereClause := whereClause + ' < ' + whereDetail.Value1;
            lmGreaterThan: whereClause := whereClause + ' > ' + whereDetail.Value1;
          end;
        end;
      end;
    end;
    mtHistory:
    begin
      whereClause := whereClause +
        C_AlarmHistoryField[Ord(whereDetail.AHField)];

      case whereDetail.AHField of
        AHfnTimeStamp, AHfnGenerationTime:
        begin
          case whereDetail.LogicalMode of
            lmNone: whereClause := whereClause + ' =';
            lmEquals:
            begin
              whereClause := whereClause + ' = ' +
                FormatDateTime('dd/MM/yyyy', whereDetail.Date1) + ' ' +
                FormatDateTime('HH:mm:ss', whereDetail.Time1);
            end;
            lmBetween:
            begin
              whereClause := whereClause + ' Between ' +
                FormatDateTime('dd/MM/yyyy', whereDetail.Date1) + ' ' +
                FormatDateTime('HH:mm:ss', whereDetail.Time1) + ' And ' +
                FormatDateTime('dd/MM/yyyy', whereDetail.Date2) + ' ' +
                FormatDateTime('HH:mm:ss', whereDetail.Time2);
            end;
            lmLessThan:
            begin
              whereClause := whereClause + ' Before ' +
                FormatDateTime('dd/MM/yyyy', whereDetail.Date1) + ' ' +
                FormatDateTime('HH:mm:ss', whereDetail.Time1);
            end;
            lmGreaterThan:
            begin
              whereClause := whereClause + ' After ' +
                FormatDateTime('dd/MM/yyyy', whereDetail.Date1) + ' ' +
                FormatDateTime('HH:mm:ss', whereDetail.Time1);
            end;
            lmIsNull: whereClause := whereClause + ' Is Null';
          end;
        end;
        AHfnSequenceNumber, AHfnAlarmId, AHfnAlarmClass, AHfnResource, AHfnLoggedBy,
        AHfnReference, AHfnAlarmMessage:
        begin
          case whereDetail.LogicalMode of
            lmNone: whereClause := whereClause + ' =';
            lmEquals: whereClause := whereClause + ' = ' + whereDetail.Value1;
            lmBetween: whereClause := whereClause + ' Between ' +
              whereDetail.Value1 + ' And ' + whereDetail.Value2;
            lmLessThan: whereClause := whereClause + ' < ' + whereDetail.Value1;
            lmGreaterThan: whereClause := whereClause + ' > ' + whereDetail.Value1;
          end;
        end;
        AHfnPrevState, AHfnLogAction, AHfnFinalState:
        begin
          checkCount := 0;
          check1Str := '';
          check2Str := '';

          for i := 0 to Length(whereDetail.CheckArray) - 1 do
          begin
            if whereDetail.CheckArray[i] then
            begin
              Inc(checkCount);

              if checkCount = 1 then
                check1Str := C_CheckString[i]
              else
                check2Str := C_CheckString[i];
            end;
          end;

          case checkCount of
            0, 1:
              whereClause := whereClause + ' = ' + check1Str;
            2:
              whereClause := whereClause + ' = (' + check1Str + ' Or ' +
                check2Str + ')';
            3, 4, 5:
              whereClause := whereClause + ' = (' + check1Str + ' Or ... Or ' +
                check2Str + ')';
          end;
        end;
      end;
    end;
  end;

  if whereDetail.IsCloseParentheses then
    whereClause := whereClause + ')';

  lstSelect.Items[aIndex] := whereClause;

  WriteSqlClause;
end;

procedure TfrmEdtFilter.WriteSqlClause;
var
  sqlClause : string;
  hasWhere : Boolean;
  i, j, checkCount : Integer;
  whereDetail : TWhereDetail;
begin
  hasWhere := False;

  for i := 0 to lstSelect.Count - 1 do
  begin
    whereDetail := TWhereDetail(lstSelect.Items.Objects[i]);

    case whereDetail.Condition of
      cNone: sqlClause := '';
      cAND: sqlClause := sqlClause + ' AND ';
      cOR: sqlClause := sqlClause + ' OR ';
    end;

    if whereDetail.IsOpenParentheses then
      sqlClause := sqlClause + '(';

    if whereDetail.IsNOT then
      sqlClause := sqlClause + 'NOT ';

    case SysMimics.Mimic.ActiveMimic.MimicID of
      mtCmdHist:
      begin
        sqlClause := sqlClause + '"' +
          C_CommandHistoryField[Ord(whereDetail.CHField)] + '"';

        case whereDetail.CHField of
          CHfnTimeStamp:
          begin
            if whereDetail.HasValue then
            begin
              case whereDetail.LogicalMode of
                lmNone: sqlClause := sqlClause + '=';
                lmEquals:
                begin
                  sqlClause := sqlClause + '={ts ''' +
                    FormatDateTime('yyyy-MM-dd', whereDetail.Date1) + ' ' +
                    FormatDateTime('HH:mm:ss', whereDetail.Time1) + '''}';
                end;
                lmBetween:
                begin
                  sqlClause := sqlClause + ' BETWEEN {ts ''' +
                    FormatDateTime('yyyy-MM-dd', whereDetail.Date1) + ' ' +
                    FormatDateTime('HH:mm:ss', whereDetail.Time1) + '''} AND ' +
                    '{ts ''' + FormatDateTime('yyyy-MM-dd', whereDetail.Date2) +
                    ' ' + FormatDateTime('HH:mm:ss', whereDetail.Time2) + '''}';
                end;
                lmLessThan:
                begin
                  sqlClause := sqlClause + '<{ts ''' +
                    FormatDateTime('yyyy-MM-dd', whereDetail.Date1) + ' ' +
                    FormatDateTime('HH:mm:ss', whereDetail.Time1) + '''}';
                end;
                lmGreaterThan:
                begin
                  sqlClause := sqlClause + '>{ts ''' +
                    FormatDateTime('yyyy-MM-dd', whereDetail.Date1) + ' ' +
                    FormatDateTime('HH:mm:ss', whereDetail.Time1) + '''}';
                end;
                lmIsNull: sqlClause := sqlClause + ' Is Null';
              end;
            end
            else
              sqlClause := sqlClause + '='
          end;
          CHfnPointId, CHfn_VAL:
          begin
            case whereDetail.LogicalMode of
              lmNone: sqlClause := sqlClause + '=''''';
              lmEquals: sqlClause := sqlClause + '=''' + whereDetail.Value1 +
                '''';
              lmBetween:
              begin
                sqlClause := sqlClause + ' BETWEEN ''' + whereDetail.Value1 +
                  ''' AND ''' + whereDetail.Value2 + '''';
              end;
              lmLessThan: sqlClause := sqlClause + '<''' + whereDetail.Value1 +
                '''';
              lmGreaterThan: sqlClause := sqlClause + '>''' +
                whereDetail.Value1 + '''';
            end;
          end;
        end;
      end;
      mtHistory:
      begin
        sqlClause := sqlClause + '"' +
          C_AlarmHistoryField[Ord(whereDetail.AHField)] + '"';

        case whereDetail.AHField of
          AHfnTimeStamp, AHfnGenerationTime:
          begin
            if whereDetail.HasValue then
            begin
              case whereDetail.LogicalMode of
                lmNone: sqlClause := sqlClause + '=';
                lmEquals:
                begin
                  sqlClause := sqlClause + '={ts ''' +
                    FormatDateTime('yyyy-MM-dd', whereDetail.Date1) + ' ' +
                    FormatDateTime('HH:mm:ss', whereDetail.Time1) + '''}';
                end;
                lmBetween:
                begin
                  sqlClause := sqlClause + ' BETWEEN {ts ''' +
                    FormatDateTime('yyyy-MM-dd', whereDetail.Date1) + ' ' +
                    FormatDateTime('HH:mm:ss', whereDetail.Time1) + '''} AND ' +
                    '{ts ''' + FormatDateTime('yyyy-MM-dd', whereDetail.Date2) +
                    ' ' + FormatDateTime('HH:mm:ss', whereDetail.Time2) + '''}';
                end;
                lmLessThan:
                begin
                  sqlClause := sqlClause + '<{ts ''' +
                    FormatDateTime('yyyy-MM-dd', whereDetail.Date1) + ' ' +
                    FormatDateTime('HH:mm:ss', whereDetail.Time1) + '''}';
                end;
                lmGreaterThan:
                begin
                  sqlClause := sqlClause + '>{ts ''' +
                    FormatDateTime('yyyy-MM-dd', whereDetail.Date1) + ' ' +
                    FormatDateTime('HH:mm:ss', whereDetail.Time1) + '''}';
                end;
                lmIsNull: sqlClause := sqlClause + ' Is Null';
              end;
            end
            else
              sqlClause := sqlClause + '='
          end;
          AHfnSequenceNumber:
          begin
            case whereDetail.LogicalMode of
              lmNone: sqlClause := sqlClause + '=';
              lmEquals: sqlClause := sqlClause + '=' + whereDetail.Value1;
              lmBetween:
              begin
                sqlClause := sqlClause + ' BETWEEN ' + whereDetail.Value1 +
                  ' AND ' + whereDetail.Value2;
              end;
              lmLessThan: sqlClause := sqlClause + '<' + whereDetail.Value1;
              lmGreaterThan: sqlClause := sqlClause + '>' + whereDetail.Value1;
            end;
          end;
          AHfnAlarmId, AHfnAlarmClass, AHfnResource, AHfnLoggedBy,
          AHfnReference, AHfnAlarmMessage:
          begin
            case whereDetail.LogicalMode of
              lmNone: sqlClause := sqlClause + '=''''';
              lmEquals: sqlClause := sqlClause + '=''' + whereDetail.Value1 +
                '''';
              lmBetween:
              begin
                sqlClause := sqlClause + ' BETWEEN ''' + whereDetail.Value1 +
                  ''' AND ''' + whereDetail.Value2 + '''';
              end;
              lmLessThan: sqlClause := sqlClause + '<''' + whereDetail.Value1 +
                '''';
              lmGreaterThan: sqlClause := sqlClause + '>''' +
                whereDetail.Value1 + '''';
            end;
          end;
          AHfnPrevState, AHfnLogAction, AHfnFinalState:
          begin
            if whereDetail.HasValue then
            begin
              checkCount := 0;

              for j := 0 to Length(whereDetail.CheckArray) - 1 do
                if whereDetail.CheckArray[j] then
                  Inc(checkCount);

              if checkCount > 1 then
              begin
                sqlClause := sqlClause + ' in (';

                for j := 0 to Length(whereDetail.CheckArray) - 1 do
                begin
                  if whereDetail.CheckArray[j] then
                  begin
                    checkCount := checkCount - 1;

                    if checkCount = 0 then
                      sqlClause := sqlClause + '''' + C_CheckString[j] + ''''
                    else
                      sqlClause := sqlClause + '''' + C_CheckString[j] + ''',';
                  end;
                end;

                sqlClause := sqlClause + ')';
              end
              else
              begin
                sqlClause := sqlClause + '=';

                for j := 0 to Length(whereDetail.CheckArray) - 1 do
                  if whereDetail.CheckArray[j] then
                    sqlClause := sqlClause + '''' + C_CheckString[j] + '''';
              end;
            end
            else
              sqlClause := sqlClause + '=';
          end;
        end;
      end;
    end;

    if whereDetail.IsCloseParentheses then
      sqlClause := sqlClause + ')';

    hasWhere := True;
  end;

  if hasWhere then
    sqlClause := 'WHERE ' + sqlClause;

  mmoSqlClause.Clear;
  mmoSqlClause.Text := sqlClause;
end;

end.
