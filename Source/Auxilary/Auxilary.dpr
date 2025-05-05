program Auxilary;

uses
  Vcl.Forms,
  uMainForm in 'uMainForm.pas' {frmMainForm},
  ufrmAuxiliary1 in 'ufrmAuxiliary1.pas' {frmAuxiliary1},
  ufrmAuxiliary2 in 'ufrmAuxiliary2.pas' {frmAuxiliary2},
  ufrmAuxiliary3 in 'ufrmAuxiliary3.pas' {frmAuxiliary3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMainForm, frmMainForm);
  Application.CreateForm(TfrmAuxiliary1, frmAuxiliary1);
  Application.CreateForm(TfrmAuxiliary2, frmAuxiliary2);
  Application.CreateForm(TfrmAuxiliary3, frmAuxiliary3);
  Application.Run;
end.
