program CCTV;

uses
  Vcl.Forms,
  uCCTV in 'uCCTV.pas' {uMainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TuMainForm, uMainForm);
  Application.Run;
end.
