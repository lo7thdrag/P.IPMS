unit ufrmSetpoint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uDBSupportClasses;

type
  TOnAlterParameter = procedure (aParamList: TList) of object;

  TfrmSetpoint = class(TForm)
    edtValPoint: TEdit;
    btnOk: TButton;
    btnCancel: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    FSelectedID : Integer;
    FOnAlterParameter : TOnAlterParameter;

    procedure SetOnAlterParameter(const val: TOnAlterParameter);
  public
    procedure ShowWithValue(aTag: Integer; aValue: Double);

    property OnAlterParameter : TOnAlterParameter read FOnAlterParameter
      write SetOnAlterParameter;
  end;

var
  frmSetpoint: TfrmSetpoint;

implementation

uses
  uMimicsSystem;

{$R *.dfm}

procedure TfrmSetpoint.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSetpoint.btnOkClick(Sender: TObject);
var
  capData : TCAP_Data;
  paramData : TParameter_Data;
begin
  capData := SysMimics.Database.GetCAPData(SysMimics.Mimic.ElementSelected);
  paramData := capData.FParamList.Items[FSelectedID - 1];
  capData.Free;

  SysMimics.Database.SaveParameterChange(SysMimics.Mimic.Running_ID,
    SysMimics.Mimic.ServerRunningTime, SysMimics.Mimic.ElementSelected +
    '.PRM.' + paramData.FParamName, paramData.FParamUnit, paramData.FParamValue,
    edtValPoint.Text);

  SysMimics.Database.AlterParameterChange(SysMimics.Mimic.ElementSelected,
    edtValPoint.Text, paramData.FParamName);

  capData := SysMimics.Database.GetCAPData(SysMimics.Mimic.ElementSelected);

  if Assigned(FOnAlterParameter) then
    FOnAlterParameter(capData.FParamList);

  Close;
end;

procedure TfrmSetpoint.FormCreate(Sender: TObject);
begin
//
end;

procedure TfrmSetpoint.FormShow(Sender: TObject);
var
  l : DWORD;
begin
  l := GetWindowLong(Self.Handle, GWL_STYLE);
  l := l and not (WS_MINIMIZEBOX);
  l := l and not (WS_MAXIMIZEBOX);
  SetWindowLong(Self.Handle, GWL_STYLE, l);

  Left := (Screen.Width - Width)  div 2;
  Top := (Screen.Height - Height) div 2;
end;

procedure TfrmSetpoint.SetOnAlterParameter(const val: TOnAlterParameter);
begin
  FOnAlterParameter := val;
end;

procedure TfrmSetpoint.ShowWithValue(aTag: Integer; aValue: Double);
begin
  edtValPoint.Text := FloatToStr(aValue);
  FSelectedID := aTag;

  ShowModal;
end;

end.
