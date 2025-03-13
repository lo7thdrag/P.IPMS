unit ufrmSelectFieldView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst;

type
  TOnSelectChange = procedure(aClause: string) of object;

  TfrmSelectFieldView = class(TForm)
    lblAvailableField: TLabel;
    chklstAvailableField: TCheckListBox;
    btnUp: TButton;
    btnDown: TButton;
    lblSqlClause: TLabel;
    btnOK: TButton;
    btnCancel: TButton;
    btnHelp: TButton;
    chkSelectAll: TCheckBox;
    mmoSqlClause: TMemo;
    procedure FormShow(Sender: TObject);
    procedure chkSelectAllClick(Sender: TObject);
    procedure btnUpClick(Sender: TObject);
    procedure btnDownClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
    procedure chklstAvailableFieldClickCheck(Sender: TObject);
    procedure chklstAvailableFieldDblClick(Sender: TObject);
  private
    FOnSelectChange : TOnSelectChange;

    procedure SetOnSelectChange(aEvent: TOnSelectChange);
    procedure WriteSqlClause;
  public
    property OnSelectChange : TOnSelectChange read FOnSelectChange
      write SetOnSelectChange;
  end;

var
  frmSelectFieldView: TfrmSelectFieldView;

implementation

uses
  ShellAPI, StrUtils, uDataType, uMimicsSystem;

{$R *.dfm}

procedure TfrmSelectFieldView.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSelectFieldView.btnDownClick(Sender: TObject);
begin
  if chklstAvailableField.ItemIndex = Length(C_AlarmHistoryField) - 1 then
    Exit;

  chklstAvailableField.Items.Exchange(chklstAvailableField.ItemIndex, chklstAvailableField.ItemIndex + 1);
  WriteSqlClause;
end;

procedure TfrmSelectFieldView.btnHelpClick(Sender: TObject);
var
  tempStr : string;
begin
  tempStr := ExtractFilePath(Application.ExeName) + 'help\WelcometoHMI.chm';

  ShellExecute(Handle, 'Open', 'C:\Windows\hh.exe', PChar(tempStr), nil,
    SW_SHOWNORMAL);
end;

procedure TfrmSelectFieldView.btnOKClick(Sender: TObject);
begin
  if Assigned(FOnSelectChange) then
    FOnSelectChange(RightStr(mmoSqlClause.Text, Length(mmoSqlClause.Text) - 7));

  Close;
end;

procedure TfrmSelectFieldView.btnUpClick(Sender: TObject);
begin
  if chklstAvailableField.ItemIndex = 0 then
    Exit;

  chklstAvailableField.Items.Exchange(chklstAvailableField.ItemIndex, chklstAvailableField.ItemIndex - 1);
  WriteSqlClause;
end;

procedure TfrmSelectFieldView.chklstAvailableFieldClickCheck(Sender: TObject);
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
    end
    else
    begin
      for i := ItemIndex + 1 to Count - 1 do
        if Checked[i] then
          Items.Exchange(ItemIndex, i);
    end;
  end;

  WriteSqlClause;
end;

procedure TfrmSelectFieldView.chklstAvailableFieldDblClick(Sender: TObject);
begin
  with TCheckListBox(Sender) do
    Checked[ItemIndex] := not Checked[ItemIndex];

  chklstAvailableFieldClickCheck(Sender);
end;

procedure TfrmSelectFieldView.chkSelectAllClick(Sender: TObject);
begin
  lblAvailableField.Enabled := not chkSelectAll.Checked;
  chklstAvailableField.Enabled := not chkSelectAll.Checked;

  WriteSqlClause;
end;

procedure TfrmSelectFieldView.FormShow(Sender: TObject);
var
  i : Integer;
begin
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;

  chklstAvailableField.Clear;

  case SysMimics.Mimic.ActiveMimic.MimicID of
    mtCmdHist:
    begin
      for i := 0 to Length(C_CommandHistoryField) - 1 do
        chklstAvailableField.Items.AddObject(C_CommandHistoryField[i], nil);
    end;
    mtHistory:
    begin
      for i := 0 to Length(C_AlarmHistoryField) - 1 do
        chklstAvailableField.Items.AddObject(C_AlarmHistoryField[i], nil);
    end;
  end;

  chkSelectAll.Checked := True;
  chklstAvailableField.ItemIndex := 0;
end;

procedure TfrmSelectFieldView.SetOnSelectChange(aEvent: TOnSelectChange);
begin
  FOnSelectChange := aEvent;
end;

procedure TfrmSelectFieldView.WriteSqlClause;
var
  sqlClause : string;
  i : Integer;
  itemCheck : Boolean;
begin
  mmoSqlClause.Clear;

  if chkSelectAll.Checked then
    mmoSqlClause.Text := 'SELECT *'
  else
  begin
    sqlClause := '';
    itemCheck := False;

    for i := 0 to chklstAvailableField.Count - 1 do
    begin
      if chklstAvailableField.Checked[i] then
      begin
        itemCheck := True;
        sqlClause := sqlClause + '"' + chklstAvailableField.Items[i] + '", ';
      end
      else
      begin
        sqlClause := LeftStr(sqlClause, Length(sqlClause)- 2);
        Break;
      end;
    end;

    if itemCheck then
      sqlClause := 'SELECT ' + sqlClause;

    mmoSqlClause.Text := sqlClause;
  end;
end;

end.
