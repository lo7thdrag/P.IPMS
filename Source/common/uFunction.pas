unit uFunction;

interface

uses
  uDataType, SysUtils, TlHelp32, Windows, Messages, Classes;

function processExists(exeFileName: string): Boolean;
function processExit(exeFileName: string): Integer;

function Decode64(S: string): string;
function Encode64(S: string): string;

function MimicNumber(aMimicType: E_MimicType): string;
function MimicTitle(aMimicType: E_MimicType): string;

function ElementTypeAbbreviate(aElemType: E_ElementType): string;
function ElementAbbreviateToType(aElemName: string): E_ElementType;
function ElementAlarmStateToStr(aState: E_StateAlarm): string;
function ElementStateCommandToStr(aState: E_DesiredState): string;
function ElementStateControlPositionToStr(aState: E_ControlMode): string;
function ElementStateToStr(aState: E_StateElement): string;
function ElementStateValidToStr(aState: E_StateValid): string;
function ElementStateWireToStr(aState: E_StateWireBreak): string;
function ElementStateDisabledToStr(aState: E_StateDisabled): string;
function ElementStateInhibitedToStr(aState: E_StateInhibit): string;
function ElementStateDisplayToStr(aState: E_StateDisplayStationery): string;
function ElementStateExtStatusToStr(aState: E_ExtStatus): string;
function ElementStateManualToStr(aState: E_StateManualAuto): string;
function ElementStateLowToStr(aState: E_StateLowAlarm): string;
function ElementStateHighToStr(aState: E_StateHighAlarm): string;
function ElementStateHighighStr(aState: E_StateHighHigh): string;
function ElementStateControlCloseOpenToStr(aState: E_StateActivated): string;

//Prince
function ElementStateToCaption(aState: E_State): string;

function SecondToHMS(aValue: Integer): string;
procedure EmptyBulkElementData(var Data: R_Bulk_Common_Elmt_Command);
procedure EmptyHugeElementData(var Data: R_Huge_Common_Elmt_Command);
procedure FreeList(var aList: TList);

implementation

const
  Codes64 = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz+/';

procedure FreeList(var aList: TList);
var
  i : Integer;
  obj : TObject;
begin
  if not Assigned(aList) then
    Exit;

  for i := 0 to aList.Count - 1 do
  begin
    obj := aList.Items[i];
    FreeAndNil(obj);
  end;

  aList.Free;
end;

function ElementStateToCaption(aState: E_State): string;
begin
  case aState of
    sState1: Result := 'WAITING';
    sState2: Result := 'WARM UP';
    sState3: Result := 'NOMINAL SPEED';
    sState4: Result := 'ENGINE READY';
    sState5: Result := 'GEN READY';
    sState6: Result := 'COOL DOWN';
    sState7: Result := 'STOP';
    sState8: Result := 'IDLE';
    sState9: Result := 'sState9';
    sState10: Result := 'sState10';
    sState11: Result := 'sState11';
    sState12: Result := 'sState12';
    sState13: Result := 'sState13';
    sState14: Result := 'sState14';
    sState15: Result := 'sState15';
  end;
end;

function ElementStateManualToStr(aState: E_StateManualAuto): string;
begin
  case aState of
    smaManual: Result := 'Manual';
    smaAuto: Result := 'Auto';
    smaLocal: Result := 'Local';
  end;
end;

function ElementStateExtStatusToStr(aState: E_ExtStatus): string;
begin
  case aState of
    esElementDisabled: Result := 'ElementDisabled';
    esClosed: Result := 'Closed';
    esNotClosed: Result := 'NotClosed';
    esOpen: Result := 'Open';
    esNotOpen: Result := 'NotOpen';
    esTransition: Result := 'Transition';
    esNotRFO: Result := 'NotRFO';
    esNotRFC: Result := 'esNotRFC';
    esFailure: Result := 'Failure';
    esLocal: Result := 'Local';
    esRemote: Result := 'Remote';
    esManual: Result := 'Manual';
    esAuto: Result := 'Auto';
    esUnknown: Result := 'Unknown';
    esFault: Result := 'Fault';
    esNoFault: Result := 'NoFault';
    esTripped: Result := 'Tripped';
    esNotTripped: Result := 'NotTripped';
    esFailedToOpen: Result := 'FailedToOpen';
    esFailedToClose: Result := 'FailedToClose';
    esRunning: Result := 'Running';
    esNotRunning: Result := 'NotRunning';
    esSpeed1: Result := 'Speed1';
    esNotSpeed1: Result := 'NotSpeed1';
    esSpeed2: Result := 'Speed2';
    esNotSpeed2: Result := 'NotSpeed2';
    esStandby: Result := 'Standby';
    esNotStandby: Result := 'NotStandby';
  end;
end;

function ElementStateDisplayToStr(aState: E_StateDisplayStationery): string;
begin
  case aState of
    ssDispStationary: Result := 'Display Stationary';
    ssDispElement: Result := 'Display Element';
  end;
end;

function ElementStateInhibitedToStr(aState: E_StateInhibit): string;
begin
  case aState of
    siInhibited: Result := 'Inhibited';
    siNotInhibited: Result := 'NotInhibited';
  end;
end;

function ElementStateDisabledToStr(aState: E_StateDisabled): string;
begin
  case aState of
    sdDisabled: Result := 'Disabled';
    sdEnabled: Result := 'Enabled';
  end;
end;

function ElementStateWireToStr(aState: E_StateWireBreak): string;
begin
  case aState of
    swbWireBreak: Result := 'WireBreak';
    swbNoWireBreak: Result := 'NoWireBreak';
  end;
end;

function ElementStateValidToStr(aState: E_StateValid): string;
begin
  case aState of
    svValid: Result := 'Valid';
    svInvalid: Result := 'Invalid';
  end;
end;

function ElementStateLowToStr(aState: E_StateLowAlarm): string;
begin
  case aState of
    slaLowAlarm: Result := 'Low Alarm';
    slaNoAlarm: Result := 'No Alarm';
  end;
end;

function ElementStateHighToStr(aState: E_StateHighAlarm): string;
begin
  case aState of
    shaHighAlarm: Result := 'High Alarm';
    shaNoAlarm: Result := 'No Alarm';
  end;
end;

function ElementStateHighighStr(aState: E_StateHighHigh): string;
begin
  case aState of
    shhHighHighAlarm: Result := 'Highhigh Alarm';
    shhNoAlarm: Result := 'No Alarm';
  end;
end;

function ElementStateControlCloseOpenToStr(aState: E_StateActivated): string;
begin
  case aState of
    sacActivated: Result := 'Activated';
    sacNotActivated: Result := 'Not Activated';
  end;
end;

function ElementStateToStr(aState: E_StateElement): string;
begin
  case aState of
    seValueOK: Result := 'ValueOK';
    seDisabled: Result := 'Disabled' ;
    seHA: Result := 'HA';
    seLA: Result := 'LA';
    seUnavailable: Result := 'Unavailable';
    seWireBreak: Result := 'WireBreak';
    seClosed: Result := 'Closed';
    seOpen: Result := 'Open';
    seTransition: Result := 'Transition';
    seNotRFO: Result := 'NotRFO';
    seNotRFC: Result := 'NotRFC';
    seCloseFailure: Result := 'CloseFailure';
    seOpenFailure: Result := 'OpenFailure';
    seUndetermined: Result := 'Undetermined';
    seFault: Result := 'Fault';
    seTripped: Result := 'Tripped';
    seUnknown: Result := 'Unknown';
    seFailedToClose: Result := 'FailedToClose';
    seFailedToOpen: Result := 'FailedToOpen';
    seNotRFU: Result := 'NotRFU';
    seInTransition: Result := 'InTransition';
    seNormal: Result := 'Normal';
    seActive: Result := 'Active';
    seInvalid: Result := 'Invalid';
    seStopped: Result := 'Stopped';
    seRunning: Result := 'Running';
    seStopFailure: Result := 'StopFailure';
    seRunFailure: Result := 'RunFailure';
    seSpeed1: Result := 'Speed1';
    seSpeed2: Result := 'Speed2';
    seSpeed1Failure: Result := 'Speed1Failure';
    seSpeed2Failure: Result := 'Speed2Failure';
    seFailedToStop: Result := 'FailedToStop';
    seFailureToStop: Result := 'FailureToStop';
    seSpeed1FailedToStop: Result := 'Speed1FailedToStop';
    seSpeed2FailedToStop: Result := 'Speed2FailedToStop';
    seStandby: Result := 'Standby';
    seStandbyFailure: Result := 'StandbyFailure';
    seStartFailure: Result := 'StartFailure';
    seStandbyFailedToStop: Result := 'StandbyFailedToStop';
    seCounting: Result := 'Counting';
    seState: Result := 'State';
    seHHA: Result := 'HHA';
    seEnabled: Result := 'Enabled';
    seOORL: Result := 'OORL';
    seOORH: Result := 'OORH';
    seXHA: Result := 'XHA';
    seState0: Result := 'State0';
    seState1: Result := 'State1';
    seAlarm: Result := 'Alarm';
    seWarning: Result := 'Warning';
    seNone: Result := 'None';
    seControlFailure: Result := 'ContolFailure';
  end;
end;

function ElementAlarmStateToStr(aState: E_StateAlarm): string;
begin
  Result := '';

  case aState of
    saNone: Result := 'None';
    saHA: Result := 'HA';
    saLA: Result := 'LA';
    saWireBreak: Result := 'WireBreak';
    saInhibited: Result := 'Inhibited';
    saUnknown: Result := 'Unknown' ;
    saFault: Result := 'Fault' ;
    saTripped: Result := 'Tripped';
    saOpenFailure: Result := 'OpenFailure';
    saCLoseFailure: Result := 'CLoseFailure';
    saStopFailure: Result := 'StopFailure';
    saStartFailure: Result := 'StartFailure';
    saSpeed1: Result := 'Speed1';
    saSpeed1Failure: Result := 'Speed1Failure';
    saSpeed2: Result := 'Speed2';
    saSpeed2Failure: Result := 'Speed2Failure';
    saFailedToStop: Result := 'FailedToStop';
    saFailureToStop: Result := 'FailureToStop';
    saSpeed1FailedToStop: Result := 'Speed1FailedToStop';
    saSpeed2FailedToStop: Result := 'Speed2FailedToStop';
    saNotStandby: Result := 'NotStandby';
    saRunningFailedToStop: Result := 'RunningFailedToStop';
    saStandbyFailedToStop: Result := 'StandbyFailedToStop';
    saStandbyFailure: Result := 'StandbyFailure';
    saHHA: Result := 'HHA';
    saOORL: Result := 'OORL';
    saOORH: Result := 'OORH';
    saXHA: Result := 'XHA';
    saAlarm: Result := 'Alarm';
    saControlFailure: Result := 'ContolFailure';
    saNoneDisable: Result := 'None'; {special for state element disable}
  else
    Result := 'Undefined : ' + IntToStr(Byte(aState)) ;
  end;
end;

function ElementStateCommandToStr(aState: E_DesiredState): string;
begin
  Result := '';

  case aState of
    dsNone: Result := 'None';
    dsCLose: Result := 'Close';
    dsOpen: Result := 'Open';
    dsStop: Result := 'Stop';
    dsRun: Result := 'Run';
    dsSpeed1: Result := 'Speed 1';
    dsSpeed2: Result := 'Speed 2';
    dsStart: Result := 'Start';
    dsStandby: Result := 'Stand By';
  end;
end;

function ElementStateControlPositionToStr(aState: E_ControlMode): string;
begin
  Result := '';

  case aState of
    cmNone: Result := 'None';
    cmLocal: Result := 'Local';
    cmManual: Result := 'Manual';
    cmAuto: Result := 'Auto';
    cmRemote: Result := 'Remote';
  end;
end;

function MimicNumber(aMimicType: E_MimicType): string;
begin
  Result := '';

  case aMimicType of
    mtTOC: Result := '1';
    mtFAlloc: Result := '2';
    mtNavCom: Result := '4';
    mtNetArc: Result := '5';
    mtPowerMan: Result := '11';
    mt230VPower: Result := '12';
    mt24VPower: Result := '13';
    mtUPSPower: Result := '14';
    mtPropulsion: Result := '30';
    mtCPP: Result := '31';
    mtMEPS: Result := '32';
    mtMESB: Result := '33';
    mtMEPSExh: Result := '34';
    mtMESBExh: Result := '35';
    mtPropCond: Result := '36';
    mtFireDet1: Result := '41';
    mtFireDet2: Result := '42';
    mtMachineVent:Result := '43' ;
    mtFireFS: Result := '50';
    mtBallast: Result := '60';
    mtBilge: Result := '61';
    mtAux: Result := '70';
    mtFuel: Result := '71';
    mtTanks: Result := '72';
    mtSeaWater: Result := '73';
    mtRunHours: Result := '100';
    mtListDisElm: Result := '200';
    mtListParmCh: Result := '210';
    mtCmdHist: Result := '220';
  end;
end;

function MimicTitle(aMimicType: E_MimicType): string;
begin
  Result := '';

  case aMimicType of
    mtTOC: Result := 'TABLE OF CONTENTS';
    mtFAlloc: Result := 'FUNCTION ALLOCATION';
    mtNavCom: Result := 'NAV && COMMUNICATION SYSTEMS';
    mtNetArc: Result := 'NETWORK ARCHITECTURE';
    mtPowerMan: Result := 'POWER MANAGEMENT OVERVIEW';
    mt230VPower: Result := '230V 115V POWER DISTRIBUTION';
    mt24VPower: Result := '24V DC POWER DISTRIBUTION';
    mtUPSPower: Result := 'UNINTERUPTIBLE POWER SUPPLY';
    mtPropulsion: Result := 'PROPULSION SYSTEM OVERVIEW';
    mtCPP: Result := 'CPP';
    mtMEPS: Result := 'ME PS';
    mtMESB: Result := 'ME SB';
    mtMEPSExh: Result := 'ME PS EXHAUST GAS && BEARINGS';
    mtMESBExh: Result := 'ME SB EXHAUST GAS && BEARINGS';
    mtPropCond: Result := 'PROPULSION CONDITION';
    mtFireDet1: Result := 'FIRE DETECTION DECK 2 && 3 && 4';
    mtFireDet2: Result := 'FIRE DETECTION DECK 1&&01&&02&&03';
    mtMachineVent:Result := 'MACHINERY SPACE VENT SYSTEM' ;
    mtFireFS: Result := 'FIRE FIGHTING SYSTEM';
    mtBallast: Result := 'BALLAST SYSTEM';
    mtBilge: Result := 'BILGE SYSTEM';
    mtAux: Result := 'AUXILIARY SYSTEM OVERVIEW';
    mtFuel: Result := 'FUEL OIL SYSTEM';
    mtTanks: Result := 'TANKS OVERVIEW';
    mtSeaWater: Result := 'SEA AND FRESH WATER SYSTEMS';
    mtRunHours: Result := 'RUNNING HOURS';
    mtListDisElm: Result := 'LIST OF DISABLE ELEMENTS';
    mtListParmCh: Result := 'LIST OF PARAMETER CHANGES';
    mtCmdHist: Result := 'COMMAND HISTORY';
    //assist
    mtAssist: Result := 'COMPONENT ASSIST PAGE';
    //alarm summary (top)
    mtDGALRM: Result := 'DGSETS';
    mtDISTRALRM: Result := 'Distribution';
    mtPROPALRM: Result := 'Propulsion';
    mtAUXALRM: Result := 'Auxiliary';
    mtFUELALRM: Result := 'Fuel';
    mtDMSTALRM: Result := 'Domest';
    mtHVACALRM: Result := 'HVAC';
    mtFFDCALRM: Result := 'FFDC';
    mtNAVALRM: Result := 'Navigation';
    mtBALLALRM: Result := 'Ballast';
    mtIPMSALRM: Result := 'IPMS';
    mtIASALRM: Result := 'IAS';
    mtReserved: Result := 'Reserved';
    //alarm history (bottom)
    mtAlarm: Result := 'Alarm Presentation';
    mtHistory: Result := 'Alarm History';
  end;
end;

function ElementTypeAbbreviate(aElemType: E_ElementType): string;
begin
  case aElemType of
    eltAAE: Result := 'AAE';
    eltCBA: Result := 'CBA';
    eltCBE: Result := 'CBE';
    eltCTR: Result := 'CTR';
    eltDAE: Result := 'DAE';
    eltMCD: Result := 'MCD';
    eltMCE: Result := 'MCE';
    eltMCS: Result := 'MCS';
    eltRHE: Result := 'RHE';
    eltSAE: Result := 'SAE';
    eltSEE: Result := 'SEE';
    eltSPE: Result := 'SPE';
    eltSSE: Result := 'SSE';
    eltSS1: Result := 'SS1';
    eltSS2: Result := 'SS2';
    eltSSL: Result := 'SSL';
    eltSWB: Result := 'SWB';
    eltSWE: Result := 'SWE';
    eltSWN: Result := 'SWN';
    eltVCE: Result := 'VCE';
    eltVCH: Result := 'VCH';
    eltVCP: Result := 'VCP';
  end;
end;

function ElementAbbreviateToType(aElemName: string): E_ElementType;
begin
  if CompareStr(aElemName, 'AAE') = 0 then
    Result := eltAAE
  else if CompareStr(aElemName, 'CBA') = 0 then
    Result := eltCBA
  else if CompareStr(aElemName, 'CBE') = 0 then
    Result := eltCBE
  else if CompareStr(aElemName, 'CTR') = 0 then
    Result := eltCTR
  else if CompareStr(aElemName, 'DAE') = 0 then
    Result := eltDAE
  else if CompareStr(aElemName, 'MCD') = 0 then
    Result := eltMCD
  else if CompareStr(aElemName, 'MCE') = 0 then
    Result := eltMCE
  else if CompareStr(aElemName, 'MCS') = 0 then
    Result := eltMCS
  else if CompareStr(aElemName, 'RHE') = 0 then
    Result := eltRHE
  else if CompareStr(aElemName, 'SAE') = 0 then
    Result := eltSAE
  else if CompareStr(aElemName, 'SEE') = 0 then
    Result := eltSEE
  else if CompareStr(aElemName, 'SPE') = 0 then
    Result := eltSPE
  else if CompareStr(aElemName, 'SSE') = 0 then
    Result := eltSSE
  else if CompareStr(aElemName, 'SS1') = 0 then
    Result := eltSS1
  else if CompareStr(aElemName, 'SS2') = 0 then
    Result := eltSS2
  else if CompareStr(aElemName, 'SSL') = 0 then
    Result := eltSSL
  else if CompareStr(aElemName, 'SWB') = 0 then
    Result := eltSWB
  else if CompareStr(aElemName, 'SWE') = 0 then
    Result := eltSWE
  else if CompareStr(aElemName, 'SWN') = 0 then
    Result := eltSWN
  else if CompareStr(aElemName, 'VCE') = 0 then
    Result := eltVCE
  else if CompareStr(aElemName, 'VCH') = 0 then
    Result := eltVCH
  else if CompareStr(aElemName, 'VCP') = 0 then
    Result := eltVCP
  else
    Result := eltUNDEF;
end;

function Encode64(S: string): string;
var
  i : Integer;
  a : Integer;
  x : Integer;
  b : Integer;
begin
  Result := '';
  a := 0;
  b := 0;

  for i := 1 to Length(s) do
  begin
    x := Ord(s[i]);
    b := b * 256 + x;
    a := a + 8;

    while a >= 6 do
    begin
      a := a - 6;
      x := b div (1 shl a);
      b := b mod (1 shl a);
      Result := Result + Codes64[x + 1];
    end;
  end;

  if a > 0 then
  begin
    x := b shl (6 - a);
    Result := Result + Codes64[x + 1];
  end;
end;

function Decode64(S: string): string;
var
  i : Integer;
  a : Integer;
  x : Integer;
  b : Integer;
begin
  Result := '';
  a := 0;
  b := 0;

  for i := 1 to Length(s) do
  begin
    x := Pos(s[i], codes64) - 1;

    if x >= 0 then
    begin
      b := b * 64 + x;
      a := a + 6;

      if a >= 8 then
      begin
        a := a - 8;
        x := b shr a;
        b := b mod (1 shl a);
        x := x mod 256;
        Result := Result + chr(x);
      end;
    end
    else
      Exit;
  end;
end;

function processExists(exeFileName: string): Boolean;
var
  ContinueLoop : BOOL;
  FSnapshotHandle : THandle;
  FProcessEntry32 : TProcessEntry32;
begin
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  Result := False;

  while Integer(ContinueLoop) <> 0 do
  begin
    if (UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) = UpperCase(ExeFileName)) or
      (UpperCase(FProcessEntry32.szExeFile) = UpperCase(ExeFileName)) then
      Result := True;

    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;

  CloseHandle(FSnapshotHandle);
end;

function processExit(exeFileName: string): integer;
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop : BOOL;
  FSnapshotHandle : THandle;
  FProcessEntry32 : TProcessEntry32;
begin
  Result := 0;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);

  while Integer(ContinueLoop) <> 0 do
  begin
    if (UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) = UpperCase(ExeFileName)) or
      (UpperCase(FProcessEntry32.szExeFile) = UpperCase(ExeFileName)) then
      Result := Integer(TerminateProcess(OpenProcess(PROCESS_TERMINATE, BOOL(0),
        FProcessEntry32.th32ProcessID), 0));

     ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;

  CloseHandle(FSnapshotHandle);
end;

function SecondToHMS(aValue: Integer): string;
  function Fill2Digit(aNum: Integer): string;
  var
    snum : string;
  begin
    snum := IntToStr(aNum);

    if Length(snum) <= 1 then
      snum := '0' + snum;

    Result := snum;
  end;
var
  tempVal, h, m, s : Integer;
begin
  tempVal := aValue;

  h := tempVal div 3600;
  tempVal := tempVal mod 3600;
  m := tempVal div 60;
  tempVal := tempVal mod 60;
  s := tempVal;

  Result := Fill2Digit(h) + ':' + Fill2Digit(m) + ':' + Fill2Digit(s);
end;

procedure EmptyHugeElementData(var Data: R_Huge_Common_Elmt_Command);
var
  i : integer;
begin
  for i := 0 to C_HUGE_ELEMENT_COUNT - 1 do
  begin
    Data.bunchData[i].ElementID := '';
    Data.bunchData[i].MimicID := 0;
    Data.bunchData[i].CommandID := 0;
    Data.bunchData[i].ValueByte := 0;
    Data.bunchData[i].ValueDouble := 0;
    Data.bunchData[i].ValueBool := False;
  end;
end;


procedure  EmptyBulkElementData(var Data : R_Bulk_Common_Elmt_Command);
var
  i : integer;
begin
  for i := 0 to C_BULK_ELEMENT_MAX - 1 do
  begin
    Data.bunchData[i].ElementID := '';
    Data.bunchData[i].MimicID := 0;
    Data.bunchData[i].CommandID := 0;
    Data.bunchData[i].ValueByte := 0;
    Data.bunchData[i].ValueDouble := 0;
    Data.bunchData[i].ValueBool := False;
  end;
end;

end.
