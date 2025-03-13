program IPMSLoader;

uses
  Forms,
  Windows,
  uMainLoader in 'uMainLoader.pas' {frrmLoader},
  uSetting in '..\common\uSetting.pas',
  uFunction in '..\common\uFunction.pas',
  uDataType in '..\common\uDataType.pas',
  uTCPDatatype in '..\network\uTCPDatatype.pas',
  uLoaderNetwork in 'uLoaderNetwork.pas',
  uDataBuffer in '..\network\uDataBuffer.pas',
  uNetBaseSocket in '..\network\uNetBaseSocket.pas',
  uNetworkManager in '..\network\uNetworkManager.pas',
  uPacketRegister in '..\network\uPacketRegister.pas',
  uTCPClient in '..\network\uTCPClient.pas',
  uTCPServer in '..\network\uTCPServer.pas',
  uListener in '..\common\uListener.pas',
  uSteppers in '..\framework\LibBaseUtils\Counter\uSteppers.pas',
  uThreadTimer in '..\framework\LibBaseUtils\Counter\uThreadTimer.pas',
  uVirtualTime in '..\framework\LibBaseUtils\Counter\uVirtualTime.pas';

{$R *.res}

var
  Mutex : THandle;

begin

  Mutex := CreateMutex(nil, True, 'IPMS Loader');
  if (Mutex = 0) OR (GetLastError = ERROR_ALREADY_EXISTS) then
  begin

    // do nothing
    Halt;
  end
  else
  begin
    Application.Initialize;
    Application.Title := 'IPMS Loader';
    Application.MainFormOnTaskbar := False;
    Application.CreateForm(TfrrmLoader, frrmLoader);
    Application.Run;

    if Mutex <> 0 then
      CloseHandle(Mutex);
  end;
end.
