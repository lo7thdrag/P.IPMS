unit ufrmAuthorization;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TOnLoginResult = procedure(aResult: Boolean) of object;
  TOnLoginInMain = procedure(aResult: Boolean) of object;
  TOnLoginAlterParameter = procedure(aResult: Boolean) of object;

  TfrmAuthorization = class(TForm)
    edtPassword: TEdit;
    Label1: TLabel;
    btnOk: TButton;
    btnCancel: TButton;
    procedure CommitChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtPasswordKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    FOnLoginResult : TOnLoginResult;
    FOnLoginInMain : TOnLoginInMain;
    FOnLoginAlterParameter : TOnLoginAlterParameter;
    FShowTimer : TTimer;
    FShowCount : Integer;

    procedure SetLoginResult(aLS: TOnLoginResult);
    procedure SetLoginInMain(aInMain: TOnLoginInMain);
    procedure SetOnLoginAlterParameter(aAlterParameter: TOnLoginAlterParameter);
    procedure ShowTimerRunning(Sender: TObject);
  public
    property OnLoginResult : TOnLoginResult  read FOnLoginResult write SetLoginResult;
    property OnLoginInMain : TOnLoginInMain read FOnLoginInMain write SetLoginInMain;
    property OnLoginAlterParameter : TOnLoginAlterParameter read FOnLoginAlterParameter
      write SetOnLoginAlterParameter;
  end;

var
  frmAuthorization: TfrmAuthorization;

implementation

{$R *.dfm}

{ TfrmAuthorization }

procedure TfrmAuthorization.CommitChange(Sender: TObject);
begin
  if TButton(Sender).Tag = 1 then //ok
  begin
    if edtPassword.Text = 'simulasiipms' then
    begin
      if Assigned(FOnLoginResult) then
        FOnLoginResult(True);

      if Assigned(FOnLoginInMain) then
        FOnLoginInMain(True);

      if Assigned(FOnLoginAlterParameter) then
        FOnLoginAlterParameter(True);
    end
    else
    begin
      if Assigned(FOnLoginResult) then
        FOnLoginResult(False);

      if Assigned(FOnLoginInMain) then
        FOnLoginInMain(False);

      if Assigned(FOnLoginAlterParameter) then
        FOnLoginAlterParameter(False);

      ShowMessage('Authorization Failed !');
    end;
  end
  else
    ShowMessage('Authorization Failed !');

  Close;
end;

procedure TfrmAuthorization.edtPasswordKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if edtPassword.Text = 'simulasiipms' then
    begin
      if Assigned(FOnLoginResult) then
        FOnLoginResult(True);

      if Assigned(FOnLoginInMain) then
        FOnLoginInMain(True);

      if Assigned(FOnLoginAlterParameter) then
        FOnLoginAlterParameter(True);
    end
    else
    begin
      if Assigned(FOnLoginResult) then
        FOnLoginResult(False);

      if Assigned(FOnLoginInMain) then
        FOnLoginInMain(False);

      if Assigned(FOnLoginAlterParameter) then
        FOnLoginAlterParameter(False);

      ShowMessage('Authorization Failed !');
    end;

    Close;
  end;
end;

procedure TfrmAuthorization.FormCreate(Sender: TObject);
begin
  FShowTimer := TTimer.Create(Self);
  FShowTimer.Enabled := False;
  FShowTimer.Interval := 1000;
  FShowTimer.OnTimer := ShowTimerRunning;

  FShowCount := 0;
end;

procedure TfrmAuthorization.FormShow(Sender: TObject);
begin
  Left := (Screen.Width - Width)  div 2;
  Top := (Screen.Height - Height) div 2;

  FShowTimer.Enabled := True;
  edtPassword.Text := '';
  edtPassword.SetFocus;
end;

procedure TfrmAuthorization.SetLoginInMain(aInMain: TOnLoginInMain);
begin
  FOnLoginInMain := aInMain;
end;

procedure TfrmAuthorization.SetLoginResult(aLS: TOnLoginResult);
begin
  FOnLoginResult := aLS;
end;

procedure TfrmAuthorization.SetOnLoginAlterParameter(
  aAlterParameter: TOnLoginAlterParameter);
begin
  FOnLoginAlterParameter := aAlterParameter;
end;

procedure TfrmAuthorization.ShowTimerRunning(Sender: TObject);
begin
  if FShowCount = 30 then
  begin
    FShowCount := 0;
    FShowTimer.Enabled := False;
    Close;
  end;

  Inc(FShowCount);
end;

end.
