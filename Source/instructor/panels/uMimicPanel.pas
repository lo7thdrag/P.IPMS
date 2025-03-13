unit uMimicPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TfrmMimicPanel = class(TForm)
    scrlbxMimic: TScrollBox;
    pnlHideShowBarTop: TPanel;
    pnlHideShowBtm: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure HideBar;
    procedure ShowBar;
    procedure pnlHideShowBarTopClick(Sender: TObject);

  private
    { Private declarations }
    FIsShowed : Boolean;
  public
    procedure SetFormLayout;
  end;

var
  frmMimicPanel: TfrmMimicPanel;

implementation

uses ufrmMain, ufrmLogin, uMimicsSystem, uDataType;

{$R *.dfm}

procedure TfrmMimicPanel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caHide;
end;

procedure TfrmMimicPanel.FormCreate(Sender: TObject);
begin
  frmMainDisplay := TfrmMainDisplay.Create(Self);
  frmMainDisplay.Parent := scrlbxMimic;
  HideBar;
  frmMainDisplay.Show;

  Width   := frmMainDisplay.Width;
  Height  := frmMainDisplay.Height;

  SysMimics.Mimic.SetForm(frmMainDisplay);
  SysMimics.Mimic.AddMimicHistory(Byte(mtTOC));
  SysMimics.Mimic.ShowMimic(mtTOC);

  Tag := 290;
end;

procedure TfrmMimicPanel.HideBar;
begin
  FIsShowed := False;

  frmMainDisplay.pnlMimic.Height := frmMainDisplay.Height;

  frmMainDisplay.pnlAlarm.Visible := False;
  frmMainDisplay.pnlCIPInfo.Visible := False;
  frmMainDisplay.pnlCIPButton.Visible := False;
end;

procedure TfrmMimicPanel.pnlHideShowBarTopClick(Sender: TObject);
begin
  if FIsShowed then
    HideBar
  else
    ShowBar;
end;

procedure TfrmMimicPanel.SetFormLayout;
var
  i : integer;
begin
  { Set frmMimicsView }
  DefaultMonitor := dmDesktop;
  if Screen.MonitorCount > 1 then
   i := 1
  else
   i := 0;

  Height := Screen.Monitors[i].Height;
  Top    := Screen.Monitors[i].Top;
  Left   := Screen.Monitors[i].Left;
  width  := Screen.Monitors[i].Width;

  Show;
end;

procedure TfrmMimicPanel.ShowBar;
begin
  FIsShowed := True;

  frmMainDisplay.pnlAlarm.Visible := True;
  frmMainDisplay.pnlCIPInfo.Visible := True;
  frmMainDisplay.pnlCIPButton.Visible := True;

  frmMainDisplay.pnlMimic.Height := frmMainDisplay.Height-(frmMainDisplay.pnlAlarm.Height +
                                    frmMainDisplay.pnlCIPInfo.Height +
                                    frmMainDisplay.pnlCIPButton.Height);

  frmMainDisplay.pnlCIPButton.Top := frmMainDisplay.pnlCIPInfo.Top + frmMainDisplay.pnlCIPInfo.Height;

end;

end.
