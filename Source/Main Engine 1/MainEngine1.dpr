program MainEngine1;

uses
  Vcl.Forms,
  ufrmPMSDieselEngineSafetiesME1 in 'ufrmPMSDieselEngineSafetiesME1.pas' {frmPMSDieselEngineSafetiesME1},
  ufrmSetofPressureGaugesME1 in 'ufrmSetofPressureGaugesME1.pas' {frmSetofPressureGaugesME1},
  ufrmSignalingLightME1 in 'ufrmSignalingLightME1.pas' {frmSignalingLightME1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPMSDieselEngineSafetiesME1, frmPMSDieselEngineSafetiesME1);
  Application.CreateForm(TfrmSetofPressureGaugesME1, frmSetofPressureGaugesME1);
  Application.CreateForm(TfrmSignalingLightME1, frmSignalingLightME1);
  Application.Run;
end.
