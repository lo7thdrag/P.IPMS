program MainSwitchBoard;

uses
  Vcl.Forms,
  uMainForm in 'uMainForm.pas' {frmGenerator};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmGenerator, frmGenerator);
  Application.Run;
end.
