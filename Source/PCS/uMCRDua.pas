unit uMCRDua;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, VrMeter, VrControls, VrAngularMeter, ExtCtrls, StdCtrls, Buttons,
  SpeedButtonImage, ImgList, VrGauge;

type
  Tfrm_MCRDua = class(TForm)
    pnl1: TPanel;
    vrnglrmtr1: TVrAngularMeter;
    vrnglrmtr2: TVrAngularMeter;
    vrnglrmtr3: TVrAngularMeter;
    vrnglrmtr4: TVrAngularMeter;
    pnl2: TPanel;
    img_PCS_RR2: TImage;
    pnl3: TPanel;
    pnl4: TPanel;
    imgPCS_RR_A: TImage;
    imgPCS_RR_B: TImage;
    ilPCS_RR2: TImageList;
    btnPhaseFailurePump1: TSpeedButtonImage;
    btnOverloadPump1: TSpeedButtonImage;
    btnPowerFailurePump1: TSpeedButtonImage;
    btnPowerFailureControl1: TSpeedButtonImage;
    btnLowOilLevelPump1: TSpeedButtonImage;
    btnOverloadPump2: TSpeedButtonImage;
    btnPhaseFailurePump2: TSpeedButtonImage;
    btnPowerFailurePump2: TSpeedButtonImage;
    btnPowerFailureControl2: TSpeedButtonImage;
    btnLowoilLevelPump2: TSpeedButtonImage;
    btnHydraulicLockPump1: TSpeedButtonImage;
    btnCloggedFilterPump1: TSpeedButtonImage;
    btnCloggedFilterPump2: TSpeedButtonImage;
    btnSystemTest: TSpeedButtonImage;
    btnHydraulicLockPump2: TSpeedButtonImage;
    btnPowerFailAuxSteering: TSpeedButtonImage;
    btnAudible: TSpeedButtonImage;
    btnO: TSpeedButtonImage;
    btnRunPump1: TSpeedButtonImage;
    btnRunPump2: TSpeedButtonImage;
    btnRunPump3: TSpeedButtonImage;
    btnRunPump4: TSpeedButtonImage;
    btnAutoStartPump1: TSpeedButtonImage;
    btnAutoStartPump2: TSpeedButtonImage;
    btnAutoStartPump3: TSpeedButtonImage;
    btnAutoStartPump4: TSpeedButtonImage;
    btnRedLamp1: TSpeedButtonImage;
    btnRedLamp2: TSpeedButtonImage;
    btnRedLamp3: TSpeedButtonImage;
    btnRedLamp4: TSpeedButtonImage;
    VrGauge1: TVrGauge;
    imgCPP_Hydraulic: TImage;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_MCRDua: Tfrm_MCRDua;

implementation

{$R *.dfm}


end.
