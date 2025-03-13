program setting;

uses
  Forms,
  uSettingForm in 'uSettingForm.pas' {frmSetting},
  uSetting in '..\common\uSetting.pas',
  uFunction in '..\common\uFunction.pas',
  uDataType in '..\common\uDataType.pas',
  uTCPDatatype in '..\network\uTCPDatatype.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSetting, frmSetting);
  Application.Run;
end.
