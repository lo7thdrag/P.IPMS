unit ufrmLogged;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Menus, ufrmLineAttribute, uTrendDataType,
  uDBSupportClasses;

type
  TfrmLogged = class(TfrmLineAttribute)
    lbl2: TLabel;
    cbbDatasource: TComboBox;
    edtUserID: TEdit;
    lbl4: TLabel;
    lbl6: TLabel;
    edtTableID: TEdit;
    btnTableID: TButton;
    edtPointID: TEdit;
    lbl7: TLabel;
    lbl5: TLabel;
    edtPassword: TEdit;
    btnPickDataSource: TButton;
    btnPointID: TButton;
    procedure btnTableIDClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FDataSource: E_DataSource;
    FUserId: String;
    FPassword: String;
    FTableId: String;
    FPointId: String;

    procedure SetDataSource(const Value: E_DataSource);
    procedure SetUserId(const Value: String);
    procedure SetPassword(const Value: String);
    procedure SetTableId(const Value: String);
    procedure SetPointId(const Value: String);

  public
    property DataSource : E_DataSource read FDataSource write SetDataSource;
    property UserId : String read FUserId write SetUserId;
    property Password : String read FPassword write SetPassword;
    property TableId : String read FTableId write SetTableId;
    property PointId : String read FPointId write SetPointId;
  end;

var
  frmLogged: TfrmLogged;

implementation

uses ufrmTableSelect;

{$R *.dfm}

procedure TfrmLogged.btnTableIDClick(Sender: TObject);
var
  data : TFieldDataTrend;
begin
  inherited;
  case cbbDatasource.ItemIndex of
    { IO }
    0 : ;
    { alarm }
    1 : ;
    { point }
    2 :
    begin
      frmTableSelect := TfrmTableSelect.Create(Self);

      if frmTableSelect.ShowModal = mrOK then
      begin
        data := frmTableSelect.Data;
        if Assigned(data) then
        begin
          edtTableID.Text := data.TableName;
          edtPointID.Text := data.ColumnName;

          LineID := data.ColumnName;
          UserId := edtUserID.Text;
          Password := edtPassword.Text;
          TableId := data.TableName;
          PointId := data.ColumnName;
          DataSource := E_DataSource(cbbDatasource.ItemIndex);
        end;
      end;

      frmTableSelect.Free;
      frmTableSelect := nil;
    end;
  end;

end;

procedure TfrmLogged.FormCreate(Sender: TObject);
begin
  inherited;
  LineType := eltLogged;
end;

procedure TfrmLogged.SetDataSource(const Value: E_DataSource);
begin
  FDataSource := Value;
end;

procedure TfrmLogged.SetPassword(const Value: String);
begin
  FPassword := Value;
end;

procedure TfrmLogged.SetPointId(const Value: String);
begin
  FPointId := Value;
end;

procedure TfrmLogged.SetTableId(const Value: String);
begin
  FTableId := Value;
end;

procedure TfrmLogged.SetUserId(const Value: String);
begin
  FUserId := Value;
end;

end.
