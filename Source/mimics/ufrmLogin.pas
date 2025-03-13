unit ufrmLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMimics, ExtCtrls, StdCtrls, jpeg, pngimage;

type

  TfrmLogin = class(TForm)
    imgLogin: TImage;
    btnProceed: TButton;
    lblOption: TLabel;
    lblAppCaption: TLabel;
    lblComputer: TLabel;
    lblUser: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    pnlIdentity: TPanel;
    imgLogo: TImage;
    procedure btnProceedClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure imgLogoMouseEnter(Sender: TObject);
    procedure imgLogoMouseLeave(Sender: TObject);
  private
    FTimer : TTimer;
    FTimeCount : Integer;

    procedure FormInitialize;
    procedure OnLoginAppeared(Sender: TObject);
  end;

var
  frmLogin: TfrmLogin;

const
  RatioHorizontal = 5;
  RatioVertical = 4;

implementation

uses
  uDataType, ufrmMain, uMimicsSystem, uSetting;

{$R *.dfm}

{ TfrmLogin }

procedure TfrmLogin.btnProceedClick(Sender: TObject);
begin
  inherited;

  frmLogin.Hide;
  frmMainDisplay.Show;
  SysMimics.Mimic.AddMimicHistory(Ord(mtTOC));
  SysMimics.Mimic.ShowMimic(mtTOC);

  FTimer.Enabled := False;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  FTimer := TTimer.Create(Self);
  FTimer.Enabled := False;
  FTimer.Interval := 1000;
  FTimer.OnTimer := OnLoginAppeared;

  if FileExists(ExtractFilePath(Application.Exename) + 'Images\Logo\login_logo.png') then
    imgLogo.Picture.LoadFromFile(ExtractFilePath(Application.Exename) + 'Images\Logo\login_logo.png');

  Show;
end;

procedure TfrmLogin.FormInitialize;
var
  aspectRatio : Double;
begin
  aspectRatio := RatioHorizontal / RatioVertical;

  if (Screen.MonitorCount > 1) and (Setting.MonitorMimic <= Screen.MonitorCount) then
  begin
    // use setting ini
    Height := Screen.Monitors[Setting.MonitorMimic-1].Height;
    Width := Screen.Monitors[Setting.MonitorMimic-1].Width;
    Left := Screen.Monitors[Setting.MonitorMimic-1].Left;
    Top := Screen.Monitors[Setting.MonitorMimic-1].Top;
  end
  else
  begin
    Height := Screen.Height;
    Width := Screen.Width;
    Left := 0;
    Top := 0;
  end;

  lblAppCaption.Left := (Width - lblAppCaption.Width) div 2;
  lblAppCaption.Top := Round(0.15 * Height);

  imgLogin.Height := Height;
  imgLogin.Width := Round(aspectRatio * Height);
  imgLogin.Left := (Width - imgLogin.Width) div 2;
  imgLogin.Top := (Height - imgLogin.Height) div 2;

  imgLogo.Left := Round(0.8 * Width);
  imgLogo.Top := Round(0.08 * Height);

  pnlIdentity.Left := (Width - pnlIdentity.Width) div 2;
  pnlIdentity.Top := Round(0.75 * Height);

  lblOption.Left := (Width - lblOption.Width) div 2;
  lblOption.Top := Round(0.95 * Height);
  lblOption.Visible := False;

  btnProceed.Left := (Width - btnProceed.Width) div 2;
  btnProceed.Top := Round(0.85 * Height);
  btnProceed.Visible := False;

  BorderStyle := bsNone;
  WindowState := wsMaximized;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
  function GetMyComputerName: string;
  var
    buffer : array[0..MAX_COMPUTERNAME_LENGTH + 1] of Char;
    size : Cardinal;
  begin
    size := MAX_COMPUTERNAME_LENGTH + 1;
    GetComputerName(@buffer, size);
    Result := StrPas(buffer);
  end;
begin
  FormInitialize;

  lblComputer.Caption := GetMyComputerName;
  lblUser.Caption := 'MCR_' + SysMimics.Mimic.RoleName;

  FTimeCount := 0;
  FTimer.Enabled := True;
end;

procedure TfrmLogin.imgLogoMouseEnter(Sender: TObject);
begin
  Cursor := crUpArrow;
end;

procedure TfrmLogin.imgLogoMouseLeave(Sender: TObject);
begin
  Cursor := crDefault;
end;

procedure TfrmLogin.OnLoginAppeared(Sender: TObject);
begin
  case FTimeCount of
    0:
    begin
      lblAppCaption.Caption := 'Integrated Platform Management System';
      lblAppCaption.Left := (Width - lblAppCaption.Width) div 2;
    end;
    1:
    begin
      lblAppCaption.Caption := 'Corvette Indonesia';
      lblAppCaption.Left := (Width - lblAppCaption.Width) div 2;
    end;
    2:
    begin
      btnProceed.Visible := True;
      lblOption.Visible := True;
    end;
    12:
    begin
      FTimer.Enabled := False;
      frmLogin.Hide;
      frmMainDisplay.Show;
      SysMimics.Mimic.AddMimicHistory(Ord(mtTOC));
      SysMimics.Mimic.ShowMimic(mtTOC);
    end;
  end;

  Inc(FTimeCount);
end;

end.
