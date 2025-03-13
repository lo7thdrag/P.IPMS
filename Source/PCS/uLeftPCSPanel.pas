unit uLeftPCSPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, VrMeter, VrControls, VrAngularMeter, ExtCtrls, StdCtrls, Buttons,
  SpeedButtonImage, ImgList, VrGauge, VrRotarySwitch, uDataType, uListener;

type
  Tfrm_LeftPCS = class(TForm)
    pnlLeftAlarm: TPanel;
    pnlCPPHydraulic: TPanel;
    pnlRightPumpControl: TPanel;
    imgPCS_RR_A: TImage;
    imgPCS_RR_B: TImage;
    ilPCS_RR2: TImageList;
    btnRunPump1: TSpeedButtonImage;
    btnRunPump2: TSpeedButtonImage;
    btnRunPump3: TSpeedButtonImage;
    btnRunPump4: TSpeedButtonImage;
    btnAutoStartPump1: TSpeedButtonImage;
    btnAutoStartPump2: TSpeedButtonImage;
    btnAutoStartPump3: TSpeedButtonImage;
    btnAutoStartPump4: TSpeedButtonImage;
    btnStopPump1: TSpeedButtonImage;
    btnStopPump2: TSpeedButtonImage;
    btnStopPump3: TSpeedButtonImage;
    btnStopPump4: TSpeedButtonImage;
    imgCPP_Hydraulic: TImage;
    imgBackgroundLeft: TImage;
    pnlLeftPumpControl: TPanel;
    imgPump1Standby_SP: TImage;
    imgPump1Start_SP: TImage;
    imgPump1Standby_SB: TImage;
    imgPump1Start_SB: TImage;
    imgPump2Standby_PS: TImage;
    imgPump3Standby_PS: TImage;
    imgPump2Start_PS: TImage;
    imgPump2Standby_SB: TImage;
    imgPump2Start_SB: TImage;
    imgPump3Start_PS: TImage;
    imgPump3Standby_SB: TImage;
    imgPump3Start_SB: TImage;
    img_PCS_RR2: TImage;
    imgOverloadPump1: TImage;
    imgPhaseFailurePump1: TImage;
    imgPowerFailurePump1: TImage;
    imgPowerFailureControl1: TImage;
    imgLowOilLevelPump1: TImage;
    imgOverloadPump2: TImage;
    imgHydraulicLockPump1: TImage;
    imgCloggedFilterPump1: TImage;
    imgCloggedFilterPump2: TImage;
    imgSystemTest: TImage;
    imgPhaseFailurePump2: TImage;
    imgPowerFailurePump2: TImage;
    imgPowerFailureControl2: TImage;
    imgLowOilLevelPump2: TImage;
    imgHydraulicLockPump2: TImage;
    imgPowerFailAuxSteering: TImage;
    imgAudible: TImage;
    imgO: TImage;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    Label1: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    lblRunPump3: TLabel;
    lblRunPump1: TLabel;
    lblRunPump2: TLabel;
    lblRunPump4: TLabel;
    lblStopPump1: TLabel;
    lblStopPump2: TLabel;
    lblAutoStartPump1: TLabel;
    lblAutoStartPump2: TLabel;
    lblStopPump3: TLabel;
    lblStopPump4: TLabel;
    lblAutoStartPump3: TLabel;
    lblAutoStartPump4: TLabel;
    pnlRPMMeter: TPanel;
    imgControlPump1_PS: TImage;
    imgControlPump2_PS: TImage;
    imgControlPump3_PS: TImage;
    imgControlPump1_SB: TImage;
    imgControlPump2_SB: TImage;
    imgControlPump3_SB: TImage;
    imgRPMMeter: TImage;
    imgRPMMeter2: TImage;
    imgRPMMeter3: TImage;
    imgRuddle: TImage;
    imgRPMMeterBackground: TImage;
    VrAngularMeter1: TVrAngularMeter;
    vrnglrmtr2: TVrAngularMeter;
    vrnglrmtrRudder: TVrAngularMeter;
    lblRudder: TLabel;
    vrnglrmtr3: TVrAngularMeter;
    lblRPM3_1: TLabel;
    lblRPMMeter3_2: TLabel;
    lblRPMMeter3_3: TLabel;
    lblRPMMeter3_4: TLabel;
    procedure btnRunPump1Click(Sender: TObject);
    procedure btnRunPump2Click(Sender: TObject);

    procedure btnAutoStartPump1Click(Sender: TObject);
    procedure btnAutoStartPump2Click(Sender: TObject);
    procedure btnRunPump3Click(Sender: TObject);
    procedure btnRunPump4Click(Sender: TObject);

    procedure btnAutoStartPump3Click(Sender: TObject);
    procedure btnAutoStartPump4Click(Sender: TObject);
    procedure lblStopPump1Click(Sender: TObject);
    procedure btnStopPump2Click(Sender: TObject);
    procedure btnStopPump3Click(Sender: TObject);
    procedure btnStopPump4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);




  private
    { Private declarations }
    procedure PCSSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Integer);overload;

  public
    { Public declarations }
    // Cek Button
    CheckRunPump1, CheckRunPump2, CheckRunPump3, CheckRunPump4,
    CheckStopPump1, CheckStopPump2, CheckStopPump3, CheckStopPump4,
    CheckAutoStart1, CheckAutoStart2, CheckAutoStart3, CheckAutoStart4 : Boolean;

  end;

var
  frm_LeftPCS: Tfrm_LeftPCS;

implementation

uses uPCSSystem;


{$R *.dfm}





procedure Tfrm_LeftPCS.btnAutoStartPump1Click(Sender: TObject);
begin
  if CheckAutoStart1 = False then
  begin
    btnAutoStartPump1.Color := clWhite;
    CheckAutoStart1 := True;
  end
  else if CheckAutoStart1 = True then
  begin
    btnAutoStartPump1.Color := clSilver;
    CheckAutoStart1 := False;
  end;

end;

procedure Tfrm_LeftPCS.btnAutoStartPump2Click(Sender: TObject);
begin
  if CheckAutoStart2 = False then
  begin
    btnAutoStartPump2.Color := clWhite;
    CheckAutoStart2 := True;
  end
  else if CheckAutoStart2 = True then
  begin
    btnAutoStartPump2.Color := clSilver;
    CheckAutoStart2 := False;
  end;

end;

procedure Tfrm_LeftPCS.btnAutoStartPump3Click(Sender: TObject);
begin
  if CheckAutoStart3 = False then
  begin
    btnAutoStartPump3.Color := clWhite;
    CheckAutoStart3 := True;
  end
  else if CheckAutoStart3 = True then
  begin
    btnAutoStartPump3.Color := clSilver;
    CheckAutoStart3 := False;
  end;

end;

procedure Tfrm_LeftPCS.btnAutoStartPump4Click(Sender: TObject);
begin
  if CheckAutoStart4 = False then
  begin
    btnAutoStartPump4.Color := clWhite;
    CheckAutoStart4 := True;
  end
  else if CheckAutoStart4 = True then
  begin
    btnAutoStartPump4.Color := clSilver;
    CheckAutoStart4 := False;
  end;

end;


procedure Tfrm_LeftPCS.btnRunPump1Click(Sender: TObject);
begin
  if CheckRunPump1 = False then
  begin
    btnRunPump1.Color := clLime;
    CheckRunPump1 := True;
  end
  else if CheckRunPump1 = True then
  begin
    btnRunPump1.Color := clGreen;
    CheckRunPump1 := False;
  end;

end;

procedure Tfrm_LeftPCS.btnRunPump2Click(Sender: TObject);
begin
  if CheckRunPump2 = False then
  begin
    btnRunPump2.Color := clLime;
    CheckRunPump2 := True;
  end
  else if CheckRunPump2 = True then
  begin
    btnRunPump2.Color := clGreen;
    CheckRunPump2 := False;
  end;

end;

procedure Tfrm_LeftPCS.btnRunPump3Click(Sender: TObject);
begin
  if CheckRunPump3 = False then
  begin
    btnRunPump3.Color := clLime;
    CheckRunPump3 := True;
  end
  else if CheckRunPump3 = True then
  begin
    btnRunPump3.Color := clGreen;
    CheckRunPump3 := False;
  end;
end;

procedure Tfrm_LeftPCS.btnRunPump4Click(Sender: TObject);
begin
  if CheckRunPump4 = False then
  begin
    btnRunPump4.Color := clLime;
    CheckRunPump4 := True;
  end
  else if CheckRunPump4 = True then
  begin
    btnRunPump4.Color := clGreen;
    CheckRunPump4 := False;
  end;
end;

procedure Tfrm_LeftPCS.lblStopPump1Click(Sender: TObject);
begin
  if CheckStopPump1 = False then
  begin
    btnStopPump1.Color := clRed;
    CheckStopPump1 := True;
  end
  else if CheckStopPump1 = True then
  begin
    btnStopPump1.Color := clMaroon;
    CheckStopPump1 := False;
  end;

end;



procedure Tfrm_LeftPCS.PCSSystemEvent(Sender: TObject; PropsID: E_PropsID;
  Value: Integer);
begin

end;


procedure Tfrm_LeftPCS.btnStopPump2Click(Sender: TObject);
begin
  if CheckStopPump2 = False then
  begin
    btnStopPump2.Color := clRed;
    CheckStopPump2 := True;
  end
  else if CheckStopPump2 = True then
  begin
    btnStopPump2.Color := clMaroon;
    CheckStopPump2 := False;
  end;
end;

procedure Tfrm_LeftPCS.btnStopPump3Click(Sender: TObject);
begin
  if CheckStopPump3 = False then
  begin
    btnStopPump3.Color := clRed;
    CheckStopPump3 := True;
  end
  else if CheckStopPump3 = True then
  begin
    btnStopPump3.Color := clMaroon;
    CheckStopPump3 := False;
  end;
end;

procedure Tfrm_LeftPCS.btnStopPump4Click(Sender: TObject);
begin
  if CheckStopPump4 = False then
  begin
    btnStopPump4.Color := clRed;
    CheckStopPump4 := True;
  end
  else if CheckStopPump4 = True then
  begin
    btnStopPump4.Color := clMaroon;
    CheckStopPump4 := False;
  end;
end;

procedure Tfrm_LeftPCS.FormCreate(Sender: TObject);
begin
  with PCSSystem.Listener.Add('LEFT') as TPropertyEventListener do begin
      OnPropertyIntChange := PCSSystemEvent;
  end;
end;

procedure Tfrm_LeftPCS.FormShow(Sender: TObject);
var
  i : Integer;
begin
  DefaultMonitor := dmDesktop;
  if Screen.MonitorCount > 1 then i := 1
  else i := 0;

  Top := Screen.Monitors[i].Top;
  Left := Screen.Monitors[i].Left;
end;

end.
