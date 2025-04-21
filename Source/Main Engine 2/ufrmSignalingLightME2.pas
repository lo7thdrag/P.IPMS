unit ufrmSignalingLightME2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VrControls, VrRotarySwitch,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmSignalingLightME2 = class(TForm)
    pnlMain: TPanel;
    grpRemote: TGroupBox;
    lbl1: TLabel;
    vrtryswtchRemotePS: TVrRotarySwitch;
    grpSpeed: TGroupBox;
    lbl7: TLabel;
    vrtryswtchSpeedPS: TVrRotarySwitch;
    grpPreStartingInhibition: TGroupBox;
    lbl11: TLabel;
    vrtryswtchPreStartPS: TVrRotarySwitch;
    grpSTCControl: TGroupBox;
    lbl10: TLabel;
    vrtryswtchSTC_PS: TVrRotarySwitch;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    tmrHoorCounter: TTimer;
    Label13: TLabel;
    Panel1: TPanel;
    lblCounter1: TLabel;
    lblCounter2: TLabel;
    lblCounter3: TLabel;
    lblCounter4: TLabel;
    lblCounter5: TLabel;
    lblCounter6: TLabel;
    lblCounter7: TLabel;
    lblCounter8: TLabel;
    lblHoorCounter: TLabel;
    procedure MenuClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tmrHoorCounterTimer(Sender: TObject);
  private
    FCounter: Integer;
  public
    { Public declarations }
  end;

var
  frmSignalingLightME2: TfrmSignalingLightME2;

implementation

uses
  ufrmMenu;

{$R *.dfm}

procedure TfrmSignalingLightME2.FormCreate(Sender: TObject);
begin
  FCounter := 0000000;
  lblHoorCounter.Caption := IntToStr(FCounter);
  tmrHoorCounter.Enabled := True;
end;

procedure TfrmSignalingLightME2.MenuClick(Sender: TObject);
begin
  frmMenu.Show;
  Self.Hide;
end;

procedure TfrmSignalingLightME2.tmrHoorCounterTimer(Sender: TObject);
begin
  Inc(FCounter);
  lblHoorCounter.Caption := IntToStr(FCounter);
end;

end.
