unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  VrControls, VrRotarySwitch, Vcl.StdCtrls,

  uListener, uFreezeFrom, uDataType;

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
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnLampTestMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnLampTestMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

  private
    FListener : TListeners;

    procedure DieselGeneratorSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Integer);overload;
    procedure DieselGeneratorSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Boolean);overload;

  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses
  uDieselGeneratorSystem;

{$R *.dfm}

procedure TMainForm.DieselGeneratorSystemEvent(Sender: TObject; PropsID: E_PropsID; Value: Boolean);
begin
  case PropsID of
    epPMSMeasPowFailure:
    begin
      imgSupplyVoltageLow.Visible := Value;
    end;
  end;
end;

procedure TMainForm.btnLampTestMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  imgSupplyVoltageLow.Visible := True;
  imgAutomaticStartFailed.Visible := True;
  imgSpeedSensorFailure.Visible := True;
  imgLubOilPressLow.Visible := True;
  imgLubOilTempHigh.Visible := True;
  imgCoolingWaterTempHigh.Visible := True;
  imgCoolongWaterLevelLow.Visible := True;
  imgFuelOilLeakage.Visible := True;
  imgSpare.Visible := True;

  imgShutdownOverSpeed.Visible := True;
  imgShutdownLOPressLow.Visible := True;
  imgShutdownCWTempHigh.Visible := True;
  imgShutDownSpare.Visible := True;

  imgRunning.Visible := True;
  imgStartDisable.Visible := True;

  imgStart.Visible := True;
  imgStop.Visible := True;
  imgStandby.Visible := True;
  imgManual.Visible := True;
  imgReset.Visible := True;
end;

procedure TMainForm.btnLampTestMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  imgSupplyVoltageLow.Visible := False;
  imgAutomaticStartFailed.Visible := False;
  imgSpeedSensorFailure.Visible := False;
  imgLubOilPressLow.Visible := False;
  imgLubOilTempHigh.Visible := False;
  imgCoolingWaterTempHigh.Visible := False;
  imgCoolongWaterLevelLow.Visible := False;
  imgFuelOilLeakage.Visible := False;
  imgSpare.Visible := False;

  imgShutdownOverSpeed.Visible := False;
  imgShutdownLOPressLow.Visible := False;
  imgShutdownCWTempHigh.Visible := False;
  imgShutDownSpare.Visible := False;

  imgRunning.Visible := False;
  imgStartDisable.Visible := False;

  imgStart.Visible := False;
  imgStop.Visible := False;
  imgStandby.Visible := False;
  imgManual.Visible := False;
  imgReset.Visible := False;
end;

procedure TMainForm.DieselGeneratorSystemEvent(Sender: TObject; PropsID: E_PropsID; Value: Integer);
begin
  case PropsID of
    epPMSFreezed:
      if Value = 1 then
      begin
        MainForm.Enabled := False;
        DieselGeneratorSystem.FFormFreezed[1] := TfrmFreeze.Create(MainForm);
        with DieselGeneratorSystem.FFormFreezed[1] do
        begin
          Parent := MainForm;
          Position := poOwnerFormCenter;
          BringToFront;
          Show;
        end;
      end
      else if Value = 0 then
      begin
        MainForm.Enabled := True;
        if Assigned(DieselGeneratorSystem.FFormFreezed[1]) then
          FreeAndNil(DieselGeneratorSystem.FFormFreezed[1]);
      end;

//    epPCSCtrlBackgroundLamp:
//      BackgroundLampIndicator(Value);
//
//    epPCSCtrlLamptTest:
//      LampTestIndicator(Value);
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  FListener := TListeners.Create;
  with DieselGeneratorSystem.Listener.Add('DIESELGENERATOR') as TPropertyEventListener do
  begin
    OnPropertyIntChange := DieselGeneratorSystemEvent;
    OnPropertyBoolChange := DieselGeneratorSystemEvent;
  end;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  FListener.Free;
end;

end.
