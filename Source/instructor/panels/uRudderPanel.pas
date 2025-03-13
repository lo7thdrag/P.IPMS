unit uRudderPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, VrControls, VrWheel, ExtCtrls, RzPanel;

type
  TfrmRudderPanel = class(TForm)
    vrwhlRudderLeft: TVrWheel;
    vrwhlRudderPanelRight: TVrWheel;
    RzStatusBar1: TRzStatusBar;
    edtRudderLeft: TEdit;
    edtRudderLeftInp: TEdit;
    btnInpRudderLeft: TButton;
    edtRudderValue: TEdit;
    tmr1: TTimer;
    procedure vrwhlRudderLeftMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnInpRudderLeftClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
  private
    { Private declarations }
    counter : Integer;
    rudderValue : Integer;
  public
    { Public declarations }
  end;

var
  frmRudderPanel: TfrmRudderPanel;

implementation
uses uERSystem;

{$R *.dfm}

procedure TfrmRudderPanel.btnInpRudderLeftClick(Sender: TObject);
var
  rudderValue : Integer;
begin
vrwhlRudderLeft.Position := StrToInt(edtRudderLeftInp.Text);
rudderValue := Round((vrwhlRudderLeft.Position - 30)/1.4);
if rudderValue > 80 then
begin
  rudderValue := rudderValue - 1;
end;

edtRudderValue.Text := IntToStr(rudderValue);
end;

procedure TfrmRudderPanel.FormCreate(Sender: TObject);
begin
  counter := 0;
end;

procedure TfrmRudderPanel.tmr1Timer(Sender: TObject);
begin
  {counter := counter + 1;
  if counter > 2 then
  begin
    ERSystem.ERManager.EngineRoom.getPCSSystem.SetRudder('Main Engine PS',rudderValue);
    counter = 0;
  end;
   }
end;

procedure TfrmRudderPanel.vrwhlRudderLeftMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
edtRudderLeft.Text := IntToStr(vrwhlRudderLeft.Position);

if vrwhlRudderLeft.Position < 30 then
begin
  vrwhlRudderLeft.Position := 30;
end;

if vrwhlRudderLeft.Position > 172 then
begin
  vrwhlRudderLeft.Position := 172;
end;

rudderValue := Round((vrwhlRudderLeft.Position - 30)/1.4);
if rudderValue > 80 then
begin
  rudderValue := rudderValue - 1;
end;


edtRudderValue.Text := IntToStr(rudderValue);

end;

end.
