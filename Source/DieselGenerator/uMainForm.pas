unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  VrControls, VrRotarySwitch, Vcl.StdCtrls;

type
  TMainForm = class(TForm)
    imgBackground: TImage;
    VrMainSwitch: TVrRotarySwitch;
    imgSupplyVoltageLow: TImage;
    imgAutomaticStartFailed: TImage;
    imgSpeedSensorFailure: TImage;
    imgLubOilPressLow: TImage;
    imgLubOilTempHigh: TImage;
    imgCoolingWaterTempHigh: TImage;
    imgCoolongWaterLevelLow: TImage;
    imgFuelOilLeakage: TImage;
    imgSpare: TImage;
    imgShutdownOverSpeed: TImage;
    imgShutdownLOPressLow: TImage;
    imgShutdownCWTempHigh: TImage;
    imgShutDownSpare: TImage;
    imgRunning: TImage;
    imgStartDisable: TImage;
    imgReset: TImage;
    imgManual: TImage;
    imgStandby: TImage;
    imgStop: TImage;
    imgStart: TImage;
    btnStart: TImage;
    btnStop: TImage;
    btnStandby: TImage;
    btnManual: TImage;
    btnReset: TImage;
    btnSirenOff: TImage;
    btnLampTest: TImage;
    lblRunningHours: TLabel;
    procedure btnLampTestClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.btnLampTestClick(Sender: TObject);
begin
//  imgSupplyVoltageLow.Visible := True;
//  imgAutomaticStartFailed.Visible := True;
//  imgSpeedSensorFailure.Visible := True;
//  imgLubOilPressLow.Visible := True;
//  imgLubOilTempHigh.Visible := True;
//  imgCoolingWaterTempHigh.Visible := True;
//  imgCoolongWaterLevelLow.Visible := True;
//  imgFuelOilLeakage.Visible := True;
//  imgSpare.Visible := True;
//
//  imgShutdownOverSpeed.Visible := True;
//  imgShutdownLOPressLow.Visible := True;
//  imgShutdownCWTempHigh.Visible := True;
//  imgShutDownSpare.Visible := True;
//
//  imgRunning.Visible := True;
//  imgStartDisable.Visible := True;
//
//  imgStart.Visible := True;
//  imgStop.Visible := True;
//  imgStandby.Visible := True;
//  imgManual.Visible := True;
//  imgReset.Visible := True;
end;

end.
