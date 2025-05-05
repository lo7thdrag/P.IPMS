program Auxilary;

uses
  Vcl.Forms,
  uSludge in 'uSludge.pas' {frmSludge},
  ufrmAuxiliary1 in 'ufrmAuxiliary1.pas' {frmBallast},
  ufrmAuxiliary2 in 'ufrmAuxiliary2.pas' {frmSWPumpProvRefrig},
  ufrmAuxiliary3 in 'ufrmAuxiliary3.pas' {frmSWCoolingPumpChiller1},
  UFireFighting in 'UFireFighting.pas' {frmFireFightingPump},
  UFireProv in 'UFireProv.pas' {frmFirePumpProv};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSludge, frmSludge);
  Application.CreateForm(TfrmBallast, frmBallast);
  Application.CreateForm(TfrmSWPumpProvRefrig, frmSWPumpProvRefrig);
  Application.CreateForm(TfrmSWCoolingPumpChiller1, frmSWCoolingPumpChiller1);
  Application.CreateForm(TfrmFireFightingPump, frmFireFightingPump);
  Application.CreateForm(TfrmFirePumpProv, frmFirePumpProv);
  Application.Run;
end.
