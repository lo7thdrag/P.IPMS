unit ufrmSelectSort;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst, ExtCtrls;

type
  TOnSortChange = procedure(aClause: string) of object;

  E_Flag = (fNone, fAsc, fDesc);

  TChecklistObject = class
    Flag : E_Flag;
  end;

  TfrmSelectSort = class(TForm)
    lblSortBy: TLabel;
    chklstSort: TCheckListBox;
    rbASC: TRadioButton;
    rbDESC: TRadioButton;
    btnUp: TButton;
    btnDown: TButton;
    lblSqlClause: TLabel;
    btnOK: TButton;
    btnCancel: TButton;
    btnHelp: TButton;
    mmoSqlClause: TMemo;
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure chklstSortClickCheck(Sender: TObject);
    procedure btnUpClick(Sender: TObject);
    procedure btnDownClick(Sender: TObject);
    procedure rbASCClick(Sender: TObject);
    procedure rbDESCClick(Sender: TObject);
    procedure chklstSortClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure chklstSortDblClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
  private
    FOnSortChange : TOnSortChange;

    procedure SetOnSortChange(aEvent: TOnSortChange);
    procedure WriteSqlClause;
  public
    property OnSortChange : TOnSortChange read FOnSortChange
      write SetOnSortChange;
  end;

var
  frmSelectSort: TfrmSelectSort;

implementation

uses
  ShellAPI, uDataType, StrUtils, uMimicsSystem;

{$R *.dfm}

procedure TfrmSelectSort.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSelectSort.btnDownClick(Sender: TObject);
begin
  if chklstSort.ItemIndex = Length(C_AlarmHistoryField) - 1 then
    Exit;

  chklstSort.Items.Exchange(chklstSort.ItemIndex, chklstSort.ItemIndex + 1);
  WriteSqlClause;
end;

procedure TfrmSelectSort.btnHelpClick(Sender: TObject);
var
  tempStr : string;
begin
  tempStr := ExtractFilePath(Application.ExeName) + 'help\WelcometoHMI.chm';

  ShellExecute(Handle, 'Open', 'C:\Windows\hh.exe', PChar(tempStr), nil,
    SW_SHOWNORMAL);
end;

procedure TfrmSelectSort.btnOKClick(Sender: TObject);
begin
  if Assigned(FOnSortChange) then
    FOnSortChange(RightStr(mmoSqlClause.Text, Length(mmoSqlClause.Text) - 9));

  Close;
end;

procedure TfrmSelectSort.btnUpClick(Sender: TObject);
begin
  if chklstSort.ItemIndex = 0 then
    Exit;

  chklstSort.Items.Exchange(chklstSort.ItemIndex, chklstSort.ItemIndex - 1);
  WriteSqlClause;
end;

procedure TfrmSelectSort.chklstSortClick(Sender: TObject);
var
  clObj : TChecklistObject;
begin
  with chklstSort do
    clObj := TChecklistObject(Items.Objects[ItemIndex]);

  case clObj.Flag of
    fNone:
    begin
      rbASC.Checked := False;
      rbDESC.Checked := False;
    end;
    fAsc: rbASC.Checked := True;
    fDesc: rbDESC.Checked := True;
  end;
end;

procedure TfrmSelectSort.chklstSortClickCheck(Sender: TObject);
var
  i : Integer;
begin
  with TCheckListBox(Sender) do
  begin
    if Checked[ItemIndex] then
    begin
      for i := ItemIndex - 1 downto 0 do
        if not Checked[i] then
          Items.Exchange(ItemIndex, i);

      TChecklistObject(Items.Objects[ItemIndex]).Flag := fAsc;
    end
    else
    begin
      for i := ItemIndex + 1 to Count - 1 do
        if Checked[i] then
          Items.Exchange(ItemIndex, i);

      TChecklistObject(Items.Objects[ItemIndex]).Flag := fNone;
    end;
  end;

  WriteSqlClause;
end;

procedure TfrmSelectSort.chklstSortDblClick(Sender: TObject);
begin
  with TCheckListBox(Sender) do
    Checked[ItemIndex] := not Checked[ItemIndex];

  chklstSortClickCheck(Sender);
  chklstSortClick(Sender);
end;

procedure TfrmSelectSort.FormShow(Sender: TObject);
var
  i : Integer;
  clObj : TChecklistObject;
begin
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;

  chklstSort.Clear;

  case SysMimics.Mimic.ActiveMimic.MimicID of
    mtCmdHist:
    begin
      for i := 0 to Length(C_CommandHistoryField) - 1 do
      begin
        clObj := TChecklistObject.Create;
        clObj.Flag := fNone;
        chklstSort.Items.AddObject(C_CommandHistoryField[i], clObj);
      end;
    end;
    mtHistory:
    begin
      for i := 0 to Length(C_AlarmHistoryField) - 1 do
      begin
        clObj := TChecklistObject.Create;
        clObj.Flag := fNone;
        chklstSort.Items.AddObject(C_AlarmHistoryField[i], clObj);
      end;
    end;
  end;

  chklstSort.ItemIndex := 0;
end;

procedure TfrmSelectSort.rbASCClick(Sender: TObject);
begin
  with chklstSort do
    TChecklistObject(Items.Objects[ItemIndex]).Flag := fAsc;

  WriteSqlClause;
end;

procedure TfrmSelectSort.rbDESCClick(Sender: TObject);
begin
  with chklstSort do
    TChecklistObject(Items.Objects[ItemIndex]).Flag := fDesc;

  WriteSqlClause;
end;

procedure TfrmSelectSort.SetOnSortChange(aEvent: TOnSortChange);
begin
  FOnSortChange := aEvent;
end;

procedure TfrmSelectSort.WriteSqlClause;
var
  i : Integer;
  sqlClause : string;
  itemCheck : Boolean;
begin
  mmoSqlClause.Clear;
  sqlClause := '';
  itemCheck := False;

  for i := 0 to chklstSort.Count - 1 do
  begin
    if chklstSort.Checked[i] then
    begin
      itemCheck := True;
      sqlClause := sqlClause + '"' + chklstSort.Items[i] + '"';

      if TChecklistObject(chklstSort.Items.Objects[i]).Flag = fDesc then
        sqlClause := sqlClause + ' DESC, '
      else
        sqlClause := sqlClause + ', '
    end
    else
    begin
      sqlClause := LeftStr(sqlClause, Length(sqlClause)- 2);
      Break;
    end;
  end;

  if itemCheck then
    sqlClause := 'ORDER BY ' + sqlClause;

  mmoSqlClause.Text := sqlClause;
end;

end.
