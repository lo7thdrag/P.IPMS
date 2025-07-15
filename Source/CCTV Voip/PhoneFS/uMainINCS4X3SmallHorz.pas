unit uMainINCS4X3SmallHorz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, Menus, uSocketHandle, StdCtrls;

type
  TfrmLenSmallHorz = class(TForm)
    imgBgk: TImage;
    pmPopUp: TPopupMenu;
    Close1: TMenuItem;
    lblStationName: TLabel;
    procedure Close1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLenSmallHorz: TfrmLenSmallHorz;

implementation

{$R *.dfm}

procedure TfrmLenSmallHorz.Close1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmLenSmallHorz.FormShow(Sender: TObject);
begin
  if VoipManager.SetConfig.Monitor < Screen.MonitorCount then
  begin
    Top := Screen.Monitors[VoipManager.SetConfig.Monitor].Top + VoipManager.SetConfig.PhoneTop;
    Left := Screen.Monitors[VoipManager.SetConfig.Monitor].Left + VoipManager.SetConfig.PhoneLeft;
  end
  else
  begin
    Top := VoipManager.SetConfig.PhoneTop;
    Left := VoipManager.SetConfig.PhoneLeft;
  end;
end;

end.
