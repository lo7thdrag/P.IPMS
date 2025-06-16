unit uMainEngine2System;

interface

uses uMainEngine2Network, uListener, uTCPClient, uDataType, ExtCtrls, uFreezeFrom, SysUtils,
  Forms, IniFiles, Classes;

type

 TMainEngine2System = class
  private

    FMainEngine2Network : TMainEngine2Network;
    FLIstener   : TListeners;
    FFreezed    : Boolean;

    {Screen Monitor}
    FIdPosisi : string;
    FIdNumber : Integer;
    FIdScreenGauges : Integer;
    FIdScreenPmsHmi : Integer;
    FIdScreenSignaling : Integer;

    procedure NetworkEventAssignment;

    {Receive Main Engine state from Engine}
    procedure NetEventMainEngine2Command(apRec: PAnsiChar; aSize: Word);

    {Receive command from instructur}
    procedure NetEventInstructorCommonCmd(apRec: PAnsiChar; aSize: Word);

    procedure LoadSettingForm(filepath: string);
    procedure SetFreezed(const Value: boolean);

  public
    FFormFreezed : array[0..2] of TfrmFreeze;

    ControlRemotePS : Boolean;

    constructor Create;
    destructor Destroy;override;

    procedure StartStopEngine(aValue : Boolean);

    {Signaling}
    procedure vrtryswtchRemotePS(aPortStarboard: string; aValue: Boolean);
    procedure vrtryswtchLowerSpeedPS(aPortStarboard: string; aSwitchPos: Boolean);
    procedure vrtryswtchRiseSpeedPS(aPortStarboard: string; aSwitchPos: Integer);
    procedure vrtryswtchOffSpeedPS(aPortStarboard: string; aSwitchPos: Boolean);

    procedure vrtryswtchAutoSTC_PS(aPortStarboard: string; aSwitchPos: Integer);
    procedure vrtryswtchPreStartInhibitionPS(aPortStarboard: string; aValue: Boolean);

    procedure RunningStart(aPortStarboard: String);
    procedure EmergencyShutdown(aPortStarboard: string; aValue: Boolean);

    property Network : TMainEngine2Network read FMainEngine2Network;
    property Listener :TListeners read FListener;
    property Freezed : boolean read FFreezed write SetFreezed;

    property IdPosisi: string read FIdPosisi write FIdPosisi;
    property IdNumber: Integer read FIdNumber write FIdNumber;
    property IdScreenGauges: Integer read FIdScreenGauges write FIdScreenGauges;
    property IdScreenPmsHmi: Integer read FIdScreenPmsHmi write FIdScreenPmsHmi;
    property IdScreenSignaling: Integer read FIdScreenSignaling write FIdScreenSignaling;
  end;

var
  MainEngine2System : TMainEngine2System;

implementation

uses
  ufrmSignalingLightME2, ufrmMenu, ufrmSetofPressureGaugesME2;

{TMainEngine2System}

constructor TMainEngine2System.Create;
begin
  FMainEngine2Network := TMainEngine2Network.Create;
  FLIstener := TListeners.Create;

  LoadSettingForm('..\bin\setting.ini');

  NetworkEventAssignment;

  FMainEngine2Network.StartNetwork;
end;

destructor TMainEngine2System.Destroy;
begin
  FLIstener.Free;

  FMainEngine2Network.StopNetwork;
  FMainEngine2Network.Free;

  inherited;
end;

procedure TMainEngine2System.LoadSettingForm(filepath: string);
var
  inifile    : TIniFile;
  tempstring : TStringList;
begin
  inifile    := TIniFile.Create(filepath);
  tempstring := TStringList.Create;

  inifile.ReadSection('MAIN ENGINE', tempstring);

  FIdPosisi := inifile.ReadString('MAIN ENGINE', tempstring[0],'KIRI');
  FIdNumber := inifile.ReadInteger('MAIN ENGINE', tempstring[1],1);
  FIdScreenGauges := inifile.ReadInteger('MAIN ENGINE', tempstring[2],0);
  FIdScreenPmsHmi := inifile.ReadInteger('MAIN ENGINE', tempstring[3],1);
  FIdScreenSignaling := inifile.ReadInteger('MAIN ENGINE', tempstring[4],2);

  inifile.Free;
  tempstring.Free;
end;

procedure TMainEngine2System.SetFreezed(const Value: boolean);
var
  setFreezed : Integer;
begin
  if FFreezed = Value then
    Exit;

  FFreezed := Value;
  if FFreezed then
  begin
    setFreezed := 1;
    FLIstener.TriggerEvents(Self,epPCSFreezed,setFreezed)
  end
  else
  begin
    setFreezed := 0;
    FLIstener.TriggerEvents(Self,epPCSFreezed,setFreezed);
  end;
end;

procedure TMainEngine2System.StartStopEngine(aValue: Boolean);
var
  recCmd : R_Common_PCS_Command;
begin
  recCmd.ValueBool := aValue;

  Network.MainEngine2ControllerSocket.SendData(C_PCS_COMMAND,@recCmd);
end;

{ fungsi untuk menangani event dari jaringan untuk PCSCommand }
procedure TMainEngine2System.NetEventInstructorCommonCmd(apRec: PAnsiChar; aSize: Word);
var
  rec: ^R_Common_Instr_Command;
  i,aCount : integer;
begin
  rec := @apRec^;

  case rec.CommandID of
    C_ORD_FREEZE_APP : Freezed := True;

    C_ORD_UNFREEZE_APP : Freezed := False;
  end;
end;

procedure TMainEngine2System.NetEventMainEngine2Command(apRec: PAnsiChar; aSize: Word);
var
  rec: ^R_Common_PCS_Command;
begin

  rec := @apRec^;

  case rec.CommandPropsID of
    epPCSMERemoteControl:
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
        FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueBool);
        ControlRemotePS := rec.ValueBool;
      end;
    end;

    epPCSCtrlMCR :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
        FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueBool);
        ControlRemotePS := rec.ValueBool;
      end;
    end;

    epPCSCtrlLocal :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
        FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueBool);
        ControlRemotePS := rec.ValueBool;
      end;
    end;

    epPCSMERunning :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
        FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueBool);
      end;
    end;

    epPCSMEPreStart :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
        FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueBool);
      end;
    end;

    epPCSMERunningHourState :            // Awalnya menggunakan epPCSMERunningHours
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
        FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueInt)
      end;
    end;

    epPCSSpeedState :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
        FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueInt)
      end;
    end;

    epPCSMESTCInManual :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
        FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueInt)
      end;
    end;

    // Gauges
    epPCSMEPressFWHTInlet :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMEPressAirInlet :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;

    // HMI
    epPCSMEEmergencyShutdown:
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
        FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueBool);
      end;
    end;
    epPCSMEOverspeedAlarm :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
        FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueBool);
      end;
    end;
    epPCSMELOPressVeryLow :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
        FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueBool);
      end;
    end;
    epPCSMERedGearSafetyStop :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
        FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueBool);
      end;
    end;
    epPCSMEFwHtExpTkLevelVeryLow :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
        FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueBool);
      end;
    end;
    epPCSMEFwTempVeryHigh :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
        FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueBool);
      end;
    end;
    epPCSMEConRodBearingTempVeryHigh :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
        FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueBool);
      end;
    end;
    epPCSMEEngInletLubOilVeryHigh :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
        FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueBool);
      end;
    end;
    epPCSMEOilMistDetSafety :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
        FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueBool);
      end;
    end;
    epPCSMETurningGearEngaged :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
        FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueBool);
      end;
    end;
    epPCSMEManHandleAtStop :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
        FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueBool);
      end;
    end;
    epPCSMEFuelRackAtStop :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
        FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueBool);
      end;
    end;
    epPCSMEPrelubInProgress :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
        FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueBool);
      end;
    end;
    epPCSMEPrelubricationFailure :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
        FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueBool);
      end;
    end;
    epPCSMEStartingFault :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
        FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueBool);
      end;
    end;
    epPCSMESTCSequenceFail :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
        FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueBool);
      end;
    end;
    epPCSMESlowTurningFault :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
        FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueBool);
      end;
    end;
    epPCSMESafetyShutdown :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
        FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueBool);
      end;
    end;

    epPCSMETurboChargerSpeedA :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;

    epPCSMETurboChargerSpeedB :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;

    epPCSGBPCSClutchInterlock :
    begin
     if rec.PortStaboardID = C_PCS_GB_PORTS then
     begin
      FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
     end;
    end;
     // Line Exhaust A
    epPCSMETempExhCylA1 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMEDevTempExhCylA1 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMETempExhCylA2 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMEDevTempExhCylA2 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMETempExhCylA3 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMEDevTempExhCylA3 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMETempExhCylA4 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMEDevTempExhCylA4 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMETempExhCylA5 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMEDevTempExhCylA5 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMETempExhCylA6 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMEDevTempExhCylA6 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMETempExhCylA7 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMEDevTempExhCylA7 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMETempExhCylA8 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMEDevTempExhCylA8 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMETempExhCylA9 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMEDevTempExhCylA9 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMETempExhCylA10 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMEDevTempExhCylA10 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMETempTCInletA :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMETempTCOutletA :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMEAvgTempA :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMECompProbA :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    // Line Exhaust B
    epPCSMETempExhCylB1 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMEDevTempExhCylB1 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMETempExhCylB2 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMEDevTempExhCylB2 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMETempExhCylB3 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMEDevTempExhCylB3 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMETempExhCylB4 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMEDevTempExhCylB4 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMETempExhCylB5 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMEDevTempExhCylB5 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMETempExhCylB6 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMEDevTempExhCylB6 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMETempExhCylB7 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMEDevTempExhCylB7 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMETempExhCylB8 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMEDevTempExhCylB8 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMETempExhCylB9 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMEDevTempExhCylB9 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMETempExhCylB10 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMEDevTempExhCylB10 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMETempTCInletB :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMETempTCOutletB :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMEAvgTempB :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMECompProbB :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    // Engine Bearing
    epPCSMETempBear1 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMETempBear2 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMETempBear3 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMETempBear4 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMETempBear5 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMETempBear6 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMETempBear7 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMETempBear8 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMETempBear9 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMETempBear10 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMETempBear11 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    // PCOT dan Crankin
    epPCSMETempConRodBear1 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMETempConRodBear2 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMETempConRodBear3 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMETempConRodBear4 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMETempConRodBear5 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMETempConRodBear6 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMETempConRodBear7 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMETempConRodBear8 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMETempConRodBear9 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMETempConRodBear10 :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;

    epPCSMESpeed :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMEFuelRack :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMESetPointSpeed :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMELOTempInlet :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMETempFWHTOutlet :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMEControlAir :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMEStartingAir :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMETCAirSeal :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMEPressFOInlet :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMETempFWHTInlet :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMEPressSeaWaterOutlet :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMELOPressInlet :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMETCOutlLOTempA :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMETCOutlLOTempB :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
    epPCSMETCLOPressInlet :
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
       FLIstener.TriggerEvents(Self,rec.CommandPropsID,rec.ValueDouble);
      end;
    end;
  end;
end;

procedure TMainEngine2System.NetworkEventAssignment;
var
  client : TTCPClient;
begin
  { set all network event here.. as simengine client }
  client := FMainEngine2Network.AsClients.Get('AsSimEngineClient');
  if Assigned(client) then
  begin
    client.RegisterProcedure(C_PCS_COMMAND, NetEventMainEngine2Command, SizeOf(R_Common_PCS_Command));
  end;

  { set all network event here.. as instructor client}
  client := FMainEngine2Network.AsClients.Get('AsInstructorClient');
  if Assigned(client) then
  begin
    client.RegisterProcedure(C_INSTRUCTOR_COMMAND, NetEventInstructorCommonCmd, SizeOf(R_Common_Instr_Command));
  end;

  client := FMainEngine2Network.AsClients.Get('AsControllerClient');
  if Assigned(client) then
  begin
    {kirim paket dari ME ke controller}
    client.RegisterProcedure(C_PCS_COMMAND, nil, SizeOf(R_Common_PCS_Command));
  end;
end;

procedure TMainEngine2System.RunningStart(aPortStarboard: String);
var
  recCmd : R_Common_PCS_Command;

begin
  recCmd.PortStaboardID := aPortStarboard;
  recCmd.CommandPropsID := epPCSMERunning;
  recCmd.CommandID      := C_ORD_ME_RUNSTART;
  recCmd.ValueBool      := True;

  Network.MainEngine2ControllerSocket.SendData(C_PCS_COMMAND,@recCmd);
end;

procedure TMainEngine2System.vrtryswtchPreStartInhibitionPS(aPortStarboard: string; aValue: Boolean);
var
  recCmd : R_Common_PCS_Command;
begin
  recCmd.PortStaboardID := aPortStarboard;
  recCmd.CommandPropsID := epPCSMEPreStart;
  recCmd.ValueBool      := aValue;

  Network.MainEngine2ControllerSocket.SendData(C_PCS_COMMAND,@recCmd);
end;

procedure TMainEngine2System.vrtryswtchRemotePS(aPortStarboard: string; aValue: Boolean);
var
  recCmd : R_Common_PCS_Command;
begin
  recCmd.PortStaboardID := aPortStarboard;
  recCmd.CommandPropsID := epPCSMERemoteControl;
  recCmd.CommandID      := C_ORD_ME_REMOTEAUTO;
  recCmd.ValueBool      := aValue;

  Network.MainEngine2ControllerSocket.SendData(C_PCS_COMMAND,@recCmd);
end;

procedure TMainEngine2System.vrtryswtchRiseSpeedPS(aPortStarboard: string; aSwitchPos: Integer);
var
  recCmd : R_Common_PCS_Command;
begin
  recCmd.PortStaboardID := aPortStarboard;
  recCmd.CommandPropsID := epPCSSpeedState;
  recCmd.ValueInt       := aSwitchPos;

  Network.MainEngine2ControllerSocket.SendData(C_PCS_COMMAND,@recCmd);
end;

procedure TMainEngine2System.vrtryswtchLowerSpeedPS(aPortStarboard: string; aSwitchPos: Boolean);
var
  recCmd : R_Common_PCS_Command;
begin
  recCmd.PortStaboardID := aPortStarboard;
  recCmd.CommandPropsID := epPCSMEStopDecrease;
  recCmd.ValueBool      := not aSwitchPos;

  Network.MainEngine2ControllerSocket.SendData(C_PCS_COMMAND,@recCmd);

  recCmd.PortStaboardID := aPortStarboard;
  recCmd.CommandPropsID := epPCSMEStopIncrease;
  recCmd.ValueBool      := aSwitchPos;

  Network.MainEngine2ControllerSocket.SendData(C_PCS_COMMAND,@recCmd);
end;

procedure TMainEngine2System.vrtryswtchOffSpeedPS(aPortStarboard: string; aSwitchPos: Boolean);
begin

end;


procedure TMainEngine2System.vrtryswtchAutoSTC_PS(aPortStarboard: string; aSwitchPos: Integer);
var
  recCmd : R_Common_PCS_Command;
begin
  recCmd.PortStaboardID := aPortStarboard;
  recCmd.CommandPropsID := epPCSMESTCInManual;
  recCmd.ValueInt       := aSwitchPos;

  Network.MainEngine2ControllerSocket.SendData(C_PCS_COMMAND,@recCmd);
end;

procedure TMainEngine2System.EmergencyShutdown(aPortStarboard: string; aValue: Boolean);
var
  recCmd : R_Common_PCS_Command;
begin
  recCmd.PortStaboardID := aPortStarboard;
  recCmd.CommandPropsID := epPCSMEEmergencyShutdown;
  recCmd.ValueBool      := aValue;

  Network.MainEngine2ControllerSocket.SendData(C_PCS_COMMAND,@recCmd);
end;

end.
