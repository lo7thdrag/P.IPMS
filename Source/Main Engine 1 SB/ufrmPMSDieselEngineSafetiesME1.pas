unit ufrmPMSDieselEngineSafetiesME1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VrControls, VrRotarySwitch,
  Vcl.StdCtrls, Vcl.Samples.Spin, Vcl.ExtCtrls, VrAngularMeter, RzBmpBtn,
  Vcl.Imaging.jpeg, Vcl.Imaging.pngimage;

type
  TfrmPMSDieselEngineSafetiesME1 = class(TForm)
    pnlMain: TPanel;
    btnInsulationTestATP: TRzBmpButton;
    btnResetRGM: TRzBmpButton;
    btnResetRSP: TRzBmpButton;
    btnResetSPH: TRzBmpButton;
    btnResetSVAE: TRzBmpButton;
    btnTestSPH: TRzBmpButton;
    btnTestSVAE: TRzBmpButton;
    btnTestWithoutStopSPH: TRzBmpButton;
    EngineSpeedMeter: TVrAngularMeter;
    Image2: TImage;
    Image3: TImage;
    imgBackground: TImage;
    Label28: TLabel;
    lblTemperature: TLabel;
    ledOffTestRSP: TRzBmpButton;
    ptSE2: TSpinEdit;
    ptSE3: TSpinEdit;
    ptSE1: TSpinEdit;
    ptSE4: TSpinEdit;
    ptSVAE: TSpinEdit;
    switchATPChannel: TVrRotarySwitch;
    switchModeATP: TVrRotarySwitch;
    Channel1Stop1MTP1: TVrRotarySwitch;
    Channel1Alarm1MTP1: TVrRotarySwitch;
    Channel1Stop2MTP1: TVrRotarySwitch;
    Channel1Alarm2MTP1: TVrRotarySwitch;
    Channel1Stop3MTP1: TVrRotarySwitch;
    Channel1Alarm3MTP1: TVrRotarySwitch;
    Channel1Stop4MTP1: TVrRotarySwitch;
    Channel1Alarm4MTP1: TVrRotarySwitch;
    Channel2Stop1MTP2: TVrRotarySwitch;
    Channel2Alarm1MTP2: TVrRotarySwitch;
    Channel2Stop2MTP2: TVrRotarySwitch;
    Channel2Alarm2MTP2: TVrRotarySwitch;
    Channel2Stop3MTP2: TVrRotarySwitch;
    Channel2Alarm3MTP2: TVrRotarySwitch;
    Channel2Stop4MTP2: TVrRotarySwitch;
    Channel2Alarm4MTP2: TVrRotarySwitch;
    Channel3Stop1MTP3: TVrRotarySwitch;
    Channel3Alarm1MTP3: TVrRotarySwitch;
    Channel3Stop2MTP3: TVrRotarySwitch;
    Channel3Alarm2MTP3: TVrRotarySwitch;
    Channel3Stop3MTP3: TVrRotarySwitch;
    Channel3Alarm3MTP3: TVrRotarySwitch;
    Channel3Stop4MTP3: TVrRotarySwitch;
    Channel3Alarm4MTP3: TVrRotarySwitch;
    imgLedGreenRunSVAE: TImage;
    imgLedRedOverspeedSVAE: TImage;
    imgLedGreenRunSPH: TImage;
    imgLedRedAlarmSPH: TImage;
    imgLedRedStopSPH: TImage;
    imgLedGreenTH1SE: TImage;
    imgLedGreenTH2SE: TImage;
    imgLedGreenTH3SE: TImage;
    imgLedGreenTH4SE: TImage;
    imgLedGreen1AE24: TImage;
    imgLedGreen2AE24: TImage;
    imgLedGreen3AE24: TImage;
    imgLedGreen1AE15: TImage;
    imgLedGreen2AE15: TImage;
    imgLedGreen3AE15: TImage;
    imgLedGreen4AE15: TImage;
    imgLedGreen1AE9: TImage;
    imgLedGreen2AE9: TImage;
    imgLedGreen3AE9: TImage;
    imgLedRedRunSPH: TImage;
    imgLedGreenAIP1: TImage;
    imgLedGreenAIP2: TImage;
    imgLedGreenAIP3: TImage;
    imgLedGreenAIP4: TImage;
    imgLedGreenAIP5: TImage;
    imgLedGreenAIP6: TImage;
    imgLedGreenAIP7: TImage;
    imgLedGreenAIP8: TImage;
    imgLedGreenAIP9: TImage;
    imgLedGreenAIP10: TImage;
    imgLedGreenAIP11: TImage;
    imgLedGreenAIP12: TImage;
    imgLedGreenAIP13: TImage;
    imgLedGreenAIP14: TImage;
    imgLedGreenAIP15: TImage;
    imgLedGreenAIP16: TImage;
    imgLedGreenRunRSP: TImage;
    imgLedRedStopRSP: TImage;
    imgLedRedAlarmRSP: TImage;
    imgLedGreenAlarmRSP: TImage;
    imgledRedAlarmChannel1ICM1: TImage;
    imgledRedNoActiveChannel1ICM1: TImage;
    imgledRedAlarmChannel2ICM1: TImage;
    imgledRedNoActiveChannel2ICM1: TImage;
    imgledGreenAlarmChannel1ICM1: TImage;
    imgledGreenAlarmChannel2ICM1: TImage;
    imgRedAlarmChannel1ICM3: TImage;
    imgRedNoActiveChannel1ICM3: TImage;
    imgRedAlarmChannel3ICM3: TImage;
    imgRedNoActiveChannel1ICM4: TImage;
    imgledGreenAlarmChannel3ICM1: TImage;
    imgledGreenAlarmChannel4ICM1: TImage;
    imgRedAlarmChannel2ICM1: TImage;
    imgRedNoActiveChannel1ICM1: TImage;
    imgRedAlarmChannel2ICM2: TImage;
    imgRedNoActiveChannel2ICM2: TImage;
    imgRedAlarmChannel2ICM3: TImage;
    imgRedNoActiveChannel2ICM3: TImage;
    imgRedAlarmChannel2ICM4: TImage;
    imgRedNoActiveChannel2ICM4: TImage;
    imgledGreenAlarmChannel1ICM2: TImage;
    imgledGreenAlarmChannel2ICM2: TImage;
    imgledGreenAlarmChannel3ICM2: TImage;
    imgledGreenAlarmChannel4ICM2: TImage;
    imgledRedAlarmChannel1ICM3: TImage;
    imgledRedNoActiveChannel1ICM3: TImage;
    imgledRedAlarmChannel2ICM3: TImage;
    imgledRedNoActiveChannel2ICM3: TImage;
    imgledRedAlarmChannel3ICM3: TImage;
    imgledRedNoActiveChannel3ICM3: TImage;
    imgledRedAlarmChannel4ICM3: TImage;
    imgRedNoActiveChannel3ICM4: TImage;
    imgledGreenAlarmChannel1ICM3: TImage;
    imgledGreenAlarmChannel2ICM3: TImage;
    imgledGreenAlarmChannel3ICM3: TImage;
    imgledGreenAlarmChannel4ICM3: TImage;
    imgLedGreenRunRGM: TImage;
    imgLedRedStopRGM: TImage;
    imgLedRedResetRGM: TImage;
    imgLedRedFailACT1ACM: TImage;
    imgLedRedONACT1ACM: TImage;
    imgLedRedFailACT2ACM: TImage;
    imgLedRedONACT2ACM: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label1: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    FuelRackMeter: TVrAngularMeter;
    procedure NextClick(Sender: TObject);
    procedure AdjustSE1Change(Sender: TObject);
    procedure AdjustSE2Change(Sender: TObject);
    procedure AdjustSE3Change(Sender: TObject);
    procedure AdjustSE4Change(Sender: TObject);
    procedure SwitchMTP1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure switchATPChannelClick(Sender: TObject);
  private

  public
    imgLeds: array[0..15] of TImage;
    FBearingTemperatures: array[0..15] of Double;
  end;

var
  frmPMSDieselEngineSafetiesME1: TfrmPMSDieselEngineSafetiesME1;

implementation

uses
  ufrmSetofPressureGaugesME1, uMainEngine1System;
{$R *.dfm}

procedure TfrmPMSDieselEngineSafetiesME1.FormCreate(Sender: TObject);
begin
  imgLeds[0]  := imgLedGreenAIP9;
  imgLeds[1]  := imgLedGreenAIP10;
  imgLeds[2]  := imgLedGreenAIP11;
  imgLeds[3]  := imgLedGreenAIP12;
  imgLeds[4]  := imgLedGreenAIP13;
  imgLeds[5]  := imgLedGreenAIP14;
  imgLeds[6]  := imgLedGreenAIP15;
  imgLeds[7]  := imgLedGreenAIP16;
  imgLeds[8]  := imgLedGreenAIP1;
  imgLeds[9]  := imgLedGreenAIP2;
  imgLeds[10] := imgLedGreenAIP3;
  imgLeds[11] := imgLedGreenAIP4;
  imgLeds[12] := imgLedGreenAIP5;
  imgLeds[13] := imgLedGreenAIP6;
  imgLeds[14] := imgLedGreenAIP7;
  imgLeds[15] := imgLedGreenAIP8;
end;

procedure TfrmPMSDieselEngineSafetiesME1.AdjustSE1Change(Sender: TObject);
begin
  EngineSpeedMeter.Position := ptSE1.Value * 10;

  if ptSE1.Value = 0 then
  begin
    imgLedGreenTH1SE.Visible := False;
  end
  else if ptSE1.Value < 400 then
  begin
    imgLedGreenTH1SE.Visible := True;
  end
  else if ptSE1.Value > 400 then
  begin
    imgLedGreenTH1SE.Visible := False;
  end;
end;

procedure TfrmPMSDieselEngineSafetiesME1.AdjustSE2Change(Sender: TObject);
begin
  EngineSpeedMeter.Position := ptSE2.Value * 10;

  if ptSE2.Value = 0 then
  begin
    imgLedGreenTH2SE.Visible := False;
  end
  else if ptSE2.Value < 400 then
  begin
    imgLedGreenTH2SE.Visible := True;
  end
  else if ptSE2.Value > 400 then
  begin
    imgLedGreenTH2SE.Visible := False;
  end
end;

procedure TfrmPMSDieselEngineSafetiesME1.AdjustSE3Change(Sender: TObject);
begin
  EngineSpeedMeter.Position := ptSE3.Value * 10;

  if ptSE3.Value = 0 then
  begin
    imgLedGreenTH3SE.Visible := False;
  end
  else if ptSE3.Value > 405 then
  begin
    imgLedGreenTH3SE.Visible := True;
  end
  else if ptSE3.Value < 405 then
  begin
    imgLedGreenTH3SE.Visible := False;
  end
end;

procedure TfrmPMSDieselEngineSafetiesME1.AdjustSE4Change(Sender: TObject);
begin
  EngineSpeedMeter.Position := ptSE4.Value * 10;

  if ptSE4.Value = 0 then
  begin
    imgLedGreenTH4SE.Visible := False;
  end
  else if ptSE4.Value > 500 then
  begin
    imgLedGreenTH4SE.Visible := True;
  end
  else if ptSE4.Value < 500 then
  begin
    imgLedGreenTH4SE.Visible := False;
  end
end;

procedure TfrmPMSDieselEngineSafetiesME1.NextClick(Sender: TObject);
begin
  frmSetofPressureGaugesME1.Show;
  Self.Hide;
end;

procedure TfrmPMSDieselEngineSafetiesME1.switchATPChannelClick(Sender: TObject);
var
  i, SwitchPositionIndex : Integer;
begin
  SwitchPositionIndex := switchATPChannel.SwitchPosition;

  for i := 0 to 15 do
    imgLeds[i].Visible := False;

  if (SwitchPositionIndex >= 0) and (SwitchPositionIndex <= 15) then
    imgLeds[SwitchPositionIndex].Visible := True;
    lblTemperature.Caption := FloatToStr(FBearingTemperatures[SwitchPositionIndex]);
end;

procedure TfrmPMSDieselEngineSafetiesME1.SwitchMTP1Change(Sender: TObject);
var
  SwitchPositionIndex : Integer;
begin
  SwitchPositionIndex := Channel1Stop1MTP1.SwitchPosition;

  if SwitchPositionIndex < 10 then
  begin
    imgledRedAlarmChannel1ICM1.Visible := True;
  end
  else if SwitchPositionIndex > 10 then
  begin
   imgledRedAlarmChannel1ICM1.Visible := False;
  end;
end;

end.
