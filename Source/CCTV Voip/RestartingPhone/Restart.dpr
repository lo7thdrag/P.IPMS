program Restart;

uses
  Forms,
  uMain in 'uMain.pas' {fRestart};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfRestart, fRestart);
  Application.Run;
end.
