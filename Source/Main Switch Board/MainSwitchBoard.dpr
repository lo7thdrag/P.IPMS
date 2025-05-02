program MainSwitchBoard;

uses
  Vcl.Forms,
  uMainForm in 'uMainForm.pas' {Form6};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm6, Form6);
  Application.Run;
end.
