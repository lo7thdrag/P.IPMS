unit uRudderIndicator;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uAlarmRudderClass, ExtCtrls, StdCtrls;

type
  TfrmRudderIndicator = class(TForm)
    pnlKiriRudInd1: TPanel;
    pnlKiriRudInd2: TPanel;
    pnlKiriRudInd3: TPanel;
    pnlKiriRudInd4: TPanel;
    pnlKiriRudInd5: TPanel;
    pnlKiriRudInd6: TPanel;
    lbl1: TLabel;
    pnlKananRudInd1: TPanel;
    pnlKananRudInd2: TPanel;
    pnlKananRudInd3: TPanel;
    pnlKananRudInd4: TPanel;
    pnlKananRudInd5: TPanel;
    pnlKananRudInd6: TPanel;
    lbl2: TLabel;
    procedure pnlKiriRudInd1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Alarm : TAlarmObj;
  public
    { Public declarations }
  end;

var
  frmRudderIndicator: TfrmRudderIndicator;

implementation

uses uInstructorSystem, uDataType;

{$R *.dfm}

procedure TfrmRudderIndicator.FormCreate(Sender: TObject);
begin
  pnlKiriRudInd1.Tag := 1;
  pnlKiriRudInd2.Tag := 2;
  pnlKiriRudInd3.Tag := 3;
  pnlKiriRudInd4.Tag := 4;
  pnlKiriRudInd5.Tag := 5;
  pnlKiriRudInd6.Tag := 6;
  pnlKananRudInd1.Tag := 7;
  pnlKananRudInd2.Tag := 8;
  pnlKananRudInd3.Tag := 9;
  pnlKananRudInd4.Tag := 10;
  pnlKananRudInd5.Tag := 11;
  pnlKananRudInd6.Tag := 12;
  Alarm := TAlarmObj.Create;
end;

procedure TfrmRudderIndicator.pnlKiriRudInd1Click(Sender: TObject);
begin
  if TPanel(sender).Color = clGray then
  begin
    with Alarm do
    begin
      props := epRudderIndicator;
      Value := true;
      aID   := TPanel(sender).tag;
    end;

   InstructorSys.ClassAlarm.setLamp(Alarm);
    TPanel(sender).Color := clRed;
  end
  else
  begin
    with Alarm do
    begin
      props := epRudderIndicator;
      Value := false;
      aID   := TPanel(sender).tag;;
    end;

    InstructorSys.ClassAlarm.setLamp(Alarm);
    TPanel(sender).Color := clGray;
  end;
end;

end.
