unit uRightPCSPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, VrControls, VrAngularMeter, uDataType, uListener;

type
  Tfrm_RightPCS = class(TForm)
    pnlRightAlarm: TPanel;
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
    lbl18: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    imgbackgroundRightPanel: TImage;
    pnlRPMMeter: TPanel;
    imgRPMMeterBackground: TImage;
    imgRPMMeter: TImage;
    imgRPMMeter2: TImage;
    imgRPMMeter3: TImage;
    imgRuddle: TImage;
    vrnglrmtrRight: TVrAngularMeter;
    vrnglrmtr2: TVrAngularMeter;
    vrnglrmtrRudder: TVrAngularMeter;
    lblRudder: TLabel;
    vrnglrmtr3: TVrAngularMeter;
    lblRPM3_1: TLabel;
    lblRPMMeter3_2: TLabel;
    lblRPMMeter3_3: TLabel;
    lblRPMMeter3_4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure PCSSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Integer);overload;

  public
    { Public declarations }
  end;

var
  frm_RightPCS: Tfrm_RightPCS;

implementation

uses uPCSSystem;

{$R *.dfm}

procedure Tfrm_RightPCS.FormCreate(Sender: TObject);
begin
  with PCSSystem.Listener.Add('RIGHT') as TPropertyEventListener do begin
      OnPropertyIntChange := PCSSystemEvent;
  end;
end;

procedure Tfrm_RightPCS.FormShow(Sender: TObject);
var
  i : Integer;
begin
  DefaultMonitor := dmDesktop;
  if Screen.MonitorCount > 1 then i := 0
  else i := 0;

  Top := Screen.Monitors[i].Top;
  Left := Screen.Monitors[i].Left;
end;

procedure Tfrm_RightPCS.PCSSystemEvent(Sender: TObject; PropsID: E_PropsID;
  Value: Integer);
begin

end;


end.
