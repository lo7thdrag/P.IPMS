unit uPCSSystem;

interface

uses uPCSNetwork, uListener, uTCPClient, uDataType, ExtCtrls, uFreezeFrom, SysUtils,
  Forms, IniFiles, Classes;

type

  TPCSSystem = class
  private

    FPCSNetwork  : TPCSNetwork;
    FLIstener    : TListeners;
    FFreezed     : boolean;

    FShaftDrivenPS,
    FShaftStopPS,
    FShaftTrailingPS,
    FEmergencyStopPS,
    FLeverInServicePS,
    FTransferOverridePS,
    FShaftDrivenSB,
    FShaftStopSB,
    FShaftTrailingSB,
    FEmergencyStopSB,
    FLeverInServiceSB,
    FTransferOverrideSB,
    FRunningStartPS,
    FRunningStartSB : Boolean;
    FLampTest : Integer;

    procedure NetworkEventAssignment;

    procedure LoadSettingForm(filepath: string);

    {Receive Propulsion state from Engine}
    procedure NetEventPCSCommand(apRec: PAnsiChar; aSize: Word);

    {Receive command from instructur}
    procedure NetEventInstructorCommonCmd(apRec: PAnsiChar; aSize: Word);

    {Receive command form Panel Throttle Button Hardware}
    procedure NetEventStatusThrottleCommand(apRec: PAnsiChar; aSize: Word);

    procedure SetFreezed(const Value: boolean);

    {Kontrol untuk indikator lampu tombol pada Panel Throttle PCS}
    procedure SetShaftDrivenPS(const aOnOff : Boolean);
    procedure SetShaftStopPS(const aOnOff : Boolean);
    procedure SetShaftTrailingPS(const aOnOff : Boolean);
    procedure SetEmergencyStopPS(const aOnOff : Boolean);
    procedure SetLeverInServicePS(const aOnOff : Boolean);
    procedure SetTransferOverridePS(const aOnOff : Boolean);
    procedure SetShaftDrivenSB(const aOnOff : Boolean);
    procedure SetShaftStopSB(const aOnOff : Boolean);
    procedure SetShaftTrailingSB(const aOnOff : Boolean);
    procedure SetEmergencyStopSB(const aOnOff : Boolean);
    procedure SetLeverInServiceSB(const aOnOff : Boolean);
    procedure SetTransferOverrideSB(const aOnOff : Boolean);
    procedure ControlThrottleIndicator(aIDPanel : Byte; aValue : Boolean);
    {--}

  public
    constructor Create;
    destructor Destroy;override;

    {Prosedur untuk mengirimkan paket data dari inputan PCS Panel Touch Screen ke Engine}
    procedure Speed(aPortStarboard : String; aValue : Integer; aOnOff : Boolean);
    procedure RunningStart(aPortStarboard : String; aValue : Boolean);
    procedure Remote(aPortStarboard: string; aVariant : Byte; aOnOff : Boolean);
    procedure StoppedStop(aPortStarboard : String);
    procedure Pitch(aPortStarboard : String; aValue: Integer; aOnOff : Boolean);
    procedure Clutch(aPortStarboard : String; aValue : Boolean);

    procedure MCRBridge(aPortStarboard : string; aControl : Boolean);
    procedure GeneralControl(aControl: Byte; aOnOff : Boolean);
    procedure Mode(aMode : Boolean);
    procedure BackgroundLamp(aValue : Boolean);
    {--}

    {Prosedur untuk mengirimkan nilai inputan dari Lever/Throttle ke Engine}
    procedure LeverControl(aPortStarboard : String; aSpeed : Integer);

    {Send Servo Status to Instructur}
    procedure sendServoLampStatus(nameID : Integer ; status : Boolean);

    {Untuk Testing fungsi Panel Throttle}
    procedure PanelThrottleTesting(IDPanel : Byte; Value : Boolean );

    property Network : TPCSNetwork read FPCSNetwork;
    property Listener :TListeners read FListener;
    property Freezed : boolean read FFreezed write SetFreezed;

    {Property untuk set value indikator button pada Panel Throttle}
    property ShaftDrivenPS: Boolean read FShaftDrivenPS write SetShaftDrivenPS;
    property ShaftStopPS: Boolean read FShaftStopPS write SetShaftStopPS;
    property ShaftTrailingPS: Boolean read FShaftTrailingPS write SetShaftTrailingPS;
    property EmergencyStopPS: Boolean read FEmergencyStopPS write SetEmergencyStopPS;
    property LeverInServicePS: Boolean read FLeverInServicePS write SetLeverInServicePS;
    property TransferOverridePS: Boolean read FTransferOverridePS write SetTransferOverridePS;
    property ShaftDrivenSB: Boolean read FShaftDrivenSB write SetShaftDrivenSB;
    property ShaftStopSB: Boolean read FShaftStopSB write SetShaftStopSB;
    property ShaftTrailingSB: Boolean read FShaftTrailingSB write SetShaftTrailingSB;
    property EmergencyStopSB: Boolean read FEmergencyStopSB write SetEmergencyStopSB;
    property LeverInServiceSB: Boolean read FLeverInServiceSB write SetLeverInServiceSB;
    property TransferOverrideSB: Boolean read FTransferOverrideSB write SetTransferOverrideSB;

    public
      FFormFreezed : array[0..2] of TfrmFreeze;

      servoID : Integer;

      idFormPCS, idFormPCS_PS, idFormPCS_SB, idLampTest,
      SpeedLeverPS, SpeedLeverSB : Integer;
      FClutchAllowedPS, FClutchAllowedSB,
      throttleTest, alarmAcceptControlPS, alarmAcceptControlSB,
      ControlRemotePS, ControlRemoteSB: Boolean;


  end;

var
  PCSSystem : TPCSSystem;

implementation

{ TPCSSystem }


procedure TPCSSystem.Clutch(aPortStarboard: String; aValue : Boolean);
var
  recCmd : R_Common_PCS_Command;
begin
  recCmd.PortStaboardID := aPortStarboard;
  recCmd.CommandID := C_ORD_GB_CLUTCH_ENGAGED;
  recCmd.ValueBool := aValue;

  Network.VREngineSocket.SendData(C_PCS_COMMAND,@recCmd);
end;

procedure TPCSSystem.ControlThrottleIndicator(aIDPanel: Byte; aValue: Boolean);
var
  recCmd : R_Common_PanelThrottle_Command;
begin
  recCmd.aID := aIDPanel;
  recCmd.aValue := aValue;
  Network.PCSControllerSocket.SendData(C_PANELTHROTTLE_COMMAND2, @recCmd);
end;

constructor TPCSSystem.Create;
begin
  FPCSNetwork := TPCSNetwork.Create;
  FLIstener := TListeners.Create;

  LoadSettingForm('..\bin\setting.ini');

  SpeedLeverPS := 0;
  SpeedLeverSB := 0;
  throttleTest := False;

  NetworkEventAssignment;

  FPCSNetwork.StartNetwork;

end;

procedure TPCSSystem.Speed(aPortStarboard: String; aValue : Integer; aOnOff : Boolean);
var
  recCmd : R_Common_PCS_Command;
begin
  recCmd.PortStaboardID := aPortStarboard;
  recCmd.CommandID := C_ORD_ME_SPEED;
  recCmd.ValueInt  := aValue;
  recCmd.ValueBool := aOnOff;

  Network.VREngineSocket.SendData(C_PCS_COMMAND,@recCmd);
end;

destructor TPCSSystem.Destroy;
begin

  FLIstener.Free;

  FPCSNetwork.StopNetwork;
  FPCSNetwork.Free;

  inherited;
end;


procedure TPCSSystem.GeneralControl(aControl: Byte; aOnOff: Boolean);
var
  recCmd : R_Common_PCS_Command;
begin
  recCmd.CommandID := aControl;
  recCmd.ValueBool := aOnOff;

  Network.VREngineSocket.SendData(C_PCS_COMMAND,@recCmd);
end;

procedure TPCSSystem.Remote(aPortStarboard : string; aVariant: Byte; aOnOff: Boolean);
var
  recCmd : R_Common_PCS_Command;
begin
  recCmd.PortStaboardID := aPortStarboard;
  recCMD.CommandID := aVariant;
  recCmd.ValueBool := aOnOff;

  Network.VREngineSocket.SendData(C_PCS_COMMAND,@recCmd);
end;

procedure TPCSSystem.RunningStart(aPortStarboard: String; aValue: Boolean);
var
  recCmd : R_Common_PCS_Command;
begin
  recCmd.PortStaboardID := aPortStarboard;
  recCmd.CommandID := C_ORD_ME_RUNSTART;
  recCmd.ValueBool := aValue;

  Network.VREngineSocket.SendData(C_PCS_COMMAND,@recCmd);
end;

procedure TPCSSystem.sendServoLampStatus(nameID: Integer; status: Boolean);
var
  recCmd : R_ServoAndLamp_Command;
begin
  recCmd.nameID := nameID;
  recCmd.status := status;

  Network.servoLampSocket.SendData(C_Servo_COMMAND , @recCmd);
end;

procedure TPCSSystem.StoppedStop(aPortStarboard: String);
var
  recCmd : R_Common_PCS_Command;
begin
  recCmd.PortStaboardID := aPortStarboard;
  recCmd.CommandID := C_ORD_ME_STOP;

  Network.VREngineSocket.SendData(C_PCS_COMMAND,@recCmd);
end;


procedure TPCSSystem.Pitch(aPortStarboard: String; aValue : Integer; aOnOff : Boolean);
var
  recCmd : R_Common_PCS_Command;
begin
  recCmd.PortStaboardID := aPortStarboard;
  recCmd.CommandID := C_ORD_CPP_PITCH;
  recCmd.ValueInt := aValue;
  recCmd.ValueBool := aOnOff;

  Network.VREngineSocket.SendData(C_PCS_COMMAND,@recCmd);
end;

procedure TPCSSystem.BackgroundLamp(aValue: Boolean);
var
  recCmd : R_Common_PCS_Command;
begin
  recCmd.CommandID := C_ORD_CTRL_BACKGROUND_LAMP;
  recCmd.ValueBool := aValue;

  Network.VREngineSocket.SendData(C_PCS_COMMAND,@recCmd);
end;

procedure TPCSSystem.LeverControl(aPortStarboard: String; aSpeed : Integer);
var
  recCmd : R_Common_PCS_Command;
begin
  if LeverInServicePS then
  begin
    if aPortStarboard = C_PCS_ME_PORTS then
    begin
      if SpeedLeverPS <> aSpeed then
      begin
        SpeedLeverPS := aSpeed;
        recCmd.ValueInt := SpeedLeverPS;
        if aSpeed > 0 then
        begin
          ControlThrottleIndicator(C_ORD_AHEAD_PS,True);
          ControlThrottleIndicator(C_ORD_ASTERN_PS,False);
        end
        else
        if aSpeed < 0 then
        begin
          ControlThrottleIndicator(C_ORD_AHEAD_PS,False);
          ControlThrottleIndicator(C_ORD_ASTERN_PS,True);
        end
        else
        if aSpeed = 0 then
        begin
          ControlThrottleIndicator(C_ORD_AHEAD_PS,False);
          ControlThrottleIndicator(C_ORD_ASTERN_PS,False);
        end;

        recCmd.CommandID := C_ORD_LEVER_SPEED;
        recCmd.PortStaboardID := aPortStarboard;

        Network.VREngineSocket.SendData(C_PCS_COMMAND,@recCmd);
      end;
    end;
  end;

  if LeverInServiceSB then
  begin
    if aPortStarboard = C_PCS_ME_STARBOARD then
    begin
      if SpeedLeverSB <> aSpeed then
      begin
        SpeedLeverSB := aSpeed;
        recCmd.ValueInt := SpeedLeverSB;
        if aSpeed > 0 then
        begin
          ControlThrottleIndicator(C_ORD_AHEAD_SB,True);
          ControlThrottleIndicator(C_ORD_ASTERN_SB,False);
        end
        else
        if aSpeed < 0 then
        begin
          ControlThrottleIndicator(C_ORD_AHEAD_SB,False);
          ControlThrottleIndicator(C_ORD_ASTERN_SB,True);
        end
        else
        if aSpeed = 0 then
        begin
          ControlThrottleIndicator(C_ORD_AHEAD_SB,False);
          ControlThrottleIndicator(C_ORD_ASTERN_SB,False);
        end;

        recCmd.CommandID := C_ORD_LEVER_SPEED;
        recCmd.PortStaboardID := aPortStarboard;

        Network.VREngineSocket.SendData(C_PCS_COMMAND,@recCmd);
      end;
    end;
  end;

end;

procedure TPCSSystem.LoadSettingForm(filepath: string);
var
  inifile : TIniFile;
  tempstring : TStringList;
begin
  inifile := TIniFile.Create(filepath);
  tempstring := TStringList.Create;

  inifile.ReadSection('Form PCS', tempstring);

  idFormPCS := StrToInt(inifile.ReadString('Form PCS', tempstring[0],'Default'));
  idFormPCS_PS := StrToInt(inifile.ReadString('Form PCS', tempstring[1],'Default'));
  idFormPCS_SB := StrToInt(inifile.ReadString('Form PCS', tempstring[2],'Default'));
  idLampTest := StrToInt(inifile.ReadString('Form PCS', tempstring[3],'Default'));

  inifile.Free;
  tempstring.Free;
end;

procedure TPCSSystem.MCRBridge(aPortStarboard: string; aControl: Boolean);
var
  recCmd : R_Common_PCS_Command;
begin
  recCmd.PortStaboardID := aPortStarboard;
  recCmd.CommandID := C_ORD_CTRL_MCR_BRIDGE;
  recCmd.ValueBool := aControl;

  Network.VREngineSocket.SendData(C_PCS_COMMAND,@recCmd);
end;

procedure TPCSSystem.Mode(aMode: Boolean);
var
  recCmd : R_Common_PCS_Command;
begin
  recCmd.CommandID := C_ORD_CTRL_MODE;
  recCmd.ValueBool := aMode;

  Network.VREngineSocket.SendData(C_PCS_COMMAND,@recCmd);
end;

procedure TPCSSystem.SetEmergencyStopPS(const aOnOff: Boolean);
begin
  if FEmergencyStopPS = aOnOff then
    Exit;

  FEmergencyStopPS := aOnOff;
  ControlThrottleIndicator(C_ORD_EMERGENCY_STOP_PS,aOnOff);
end;

procedure TPCSSystem.SetEmergencyStopSB(const aOnOff: Boolean);
begin
  if FEmergencyStopSB = aOnOff then
    Exit;

  FEmergencyStopSB := aOnOff;
  ControlThrottleIndicator(C_ORD_EMERGENCY_STOP_SB,aOnOff);
end;

procedure TPCSSystem.SetFreezed(const Value: boolean);
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

procedure TPCSSystem.SetLeverInServicePS(const aOnOff: Boolean);
begin
  if FLeverInServicePS = aOnOff then
    Exit;

  FLeverInServicePS := aOnOff;
//  if LeverInServicePS = False then
//  begin
//    FShaftDrivenPS := False;
//    FShaftStopPS := False;
//    FShaftTrailingPS := False;
//    FEmergencyStopPS := False;
//    FTransferOverridePS := False;
//  end;
  ControlThrottleIndicator(C_ORD_LEVER_IN_SERVICE_PS,aOnOff);
end;

procedure TPCSSystem.SetLeverInServiceSB(const aOnOff: Boolean);
begin
  if FLeverInServiceSB = aOnOff then
    Exit;

  FLeverInServiceSB := aOnOff;
//  if FLeverInServiceSB = False then
//  begin
//    FShaftDrivenSB := False;
//    FShaftStopSB := False;
//    FShaftTrailingSB := False;
//    FEmergencyStopSB := False;
//    FTransferOverrideSB := False;
//  end;
  ControlThrottleIndicator(C_ORD_LEVER_IN_SERVICE_SB,aOnOff);
end;

procedure TPCSSystem.SetShaftDrivenPS(const aOnOff: Boolean);
begin
  if FShaftDrivenPS = aOnOff then
    Exit;

  FShaftDrivenPS := aOnOff;
  ControlThrottleIndicator(C_ORD_SHAFT_DRIVEN_PS,aOnOff);
end;

procedure TPCSSystem.SetShaftDrivenSB(const aOnOff: Boolean);
begin
  if FShaftDrivenSB = aOnOff then
    Exit;

  FShaftDrivenSB := aOnOff;
  ControlThrottleIndicator(C_ORD_SHAFT_DRIVEN_SB,aOnOff);
end;

procedure TPCSSystem.SetShaftStopPS(const aOnOff: Boolean);
begin
  if FShaftStopPS = aOnOff then
    Exit;

  FShaftStopPS := aOnOff;
  ControlThrottleIndicator(C_ORD_SHAFT_STOP_PS,aOnOff);
end;

procedure TPCSSystem.SetShaftStopSB(const aOnOff: Boolean);
begin
  if FShaftStopSB = aOnOff then
    Exit;

  FShaftStopSB := aOnOff;
  ControlThrottleIndicator(C_ORD_SHAFT_STOP_SB,aOnOff);
end;

procedure TPCSSystem.SetShaftTrailingPS(const aOnOff: Boolean);
begin
  if FShaftTrailingPS = aOnOff then
    Exit;

  FShaftTrailingPS := aOnOff;
  ControlThrottleIndicator(C_ORD_SHAFT_TRAILING_PS,aOnOff);
end;

procedure TPCSSystem.SetShaftTrailingSB(const aOnOff: Boolean);
begin
  if FShaftTrailingSB = aOnOff then
    Exit;

  FShaftTrailingSB := aOnOff;
  ControlThrottleIndicator(C_ORD_SHAFT_TRAILING_SB,aOnOff);
end;

procedure TPCSSystem.SetTransferOverridePS(const aOnOff: Boolean);
begin
  if FTransferOverridePS = aOnOff then
    Exit;

  FTransferOverridePS := aOnOff;
  ControlThrottleIndicator(C_ORD_TRANSFER_OVERRIDE_PS,aOnOff);
end;

procedure TPCSSystem.SetTransferOverrideSB(const aOnOff: Boolean);
begin
  if FTransferOverrideSB = aOnOff then
    Exit;

  FTransferOverrideSB := aOnOff;
  ControlThrottleIndicator(C_ORD_TRANSFER_OVERRIDE_SB,aOnOff);
end;

{ fungsi untuk menangani event dari jaringan untuk PCSCommand }
procedure TPCSSystem.NetEventInstructorCommonCmd(apRec: PAnsiChar; aSize: Word);
var
  rec: ^R_Common_Instr_Command;
begin
  rec := @apRec^;

  case rec.CommandID of
    C_ORD_FREEZE_APP : Freezed := True;

    C_ORD_UNFREEZE_APP : Freezed := False;

    C_ORD_CLOSE_APP :
    begin
      if servoID = 1 then
        PCSSystem.sendServoLampStatus(C_ORD_SERVO_PS, False)
      else if servoID = 3  then
        PCSSystem.sendServoLampStatus(C_ORD_SERVO_SB, False);
    end;

  end;
end;

procedure TPCSSystem.NetEventPCSCommand(apRec: PAnsiChar; aSize: Word);
var
  rec: ^R_Common_PCS_Command;
begin

  rec := @apRec^;

  case rec.CommandPropsID of

    { untuk contoh case runstart, simengine akan mengirim balik result berupa
       0: off 1:on, sehingga ketika mendapatkan sinyal 0, tombol berhenti flashing
       dan mati. atau jika sinyal 1 maka berhenti flashing dan tombol nyala,
       case lainnya yg mengubah state tombol ketika event jaringan bisa ditambahkan.
    }

    epPCSMESetPointSpeed:
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
        FLIstener.TriggerEvents(Self,epPCSMEActualSpeedPS,rec.ValueDouble)
      else
      if rec.PortStaboardID = C_PCS_ME_STARBOARD then
        FLIstener.TriggerEvents(Self,epPCSMEActualSpeedSB,rec.ValueDouble);
    end;

    epPCSGBSetpShaftSpeed:
    begin
      if rec.PortStaboardID = C_PCS_GB_PORTS then
        FLIstener.TriggerEvents(Self,epPCSGBShaftSpeedPS,rec.ValueDouble)
      else
      if rec.PortStaboardID = C_PCS_GB_STARBOARD then
        FLIstener.TriggerEvents(Self,epPCSGBShaftSpeedSB,rec.ValueDouble);
    end;

    epPCSCPPSetPointPitch:
    begin
      if rec.PortStaboardID = C_PCS_CPP_PORTS then
        FLIstener.TriggerEvents(Self,epPCSCPPActualPitchPS,Round(rec.ValueDouble))
      else
      if rec.PortStaboardID = C_PCS_CPP_STARBOARD then
        FLIstener.TriggerEvents(Self,epPCSCPPActualPitchSB,Round(rec.ValueDouble));
    end;

    epPCSMERunning:
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
        FLIstener.TriggerEvents(Self,epPCSMEPSRunStart,rec.ValueBool);
        EmergencyStopPS := not rec.ValueBool;
        FRunningStartPS := rec.ValueBool;
      end
      else
      if rec.PortStaboardID = C_PCS_ME_STARBOARD then
      begin
        FLIstener.TriggerEvents(Self,epPCSMESBRunStart,rec.ValueBool);
        EmergencyStopSB := not rec.ValueBool;
        FRunningStartSB := rec.ValueBool;
      end;
    end;

    epPCSMERemoteAuto:
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
        FLIstener.TriggerEvents(Self,epPCSMEPSRemoteAuto,rec.ValueBool);
        LeverInServicePS := rec.ValueBool;
      end
      else
      if rec.PortStaboardID = C_PCS_ME_STARBOARD then
      begin
        FLIstener.TriggerEvents(Self,epPCSMESBRemoteAuto,rec.ValueBool);
        LeverInServiceSB := rec.ValueBool;
      end;
    end;

    epPCSMERemoteManual:
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
        FLIstener.TriggerEvents(Self,epPCSMEPSRemoteManual,rec.ValueBool);
        if rec.ValueBool then
        begin
          LeverInServicePS := not rec.ValueBool;
//          ShaftDrivenPS := False;
//          ShaftStopPS := False;
//          ShaftTrailingPS := False;
//          EmergencyStopPS := False;
//          TransferOverridePS := False;
        end
        else
          LeverInServicePS := True;
      end
      else
      if rec.PortStaboardID = C_PCS_ME_STARBOARD then
      begin
        FLIstener.TriggerEvents(Self,epPCSMESBRemoteManual,rec.ValueBool);
        if rec.ValueBool then
        begin
          LeverInServiceSB := not rec.ValueBool;
//          ShaftDrivenSB := False;
//          ShaftStopSB := False;
//          ShaftTrailingSB := False;
//          EmergencyStopSB := False;
//          TransferOverrideSB := False;
        end
        else
          LeverInServiceSB := True;
      end;
    end;

    epPCSMEReadyForUse:
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
        FLIstener.TriggerEvents(Self,epPCSMEReadyForUsePS,rec.ValueBool)
      else
      if rec.PortStaboardID = C_PCS_ME_STARBOARD then
        FLIstener.TriggerEvents(Self,epPCSMEReadyForUseSB,rec.ValueBool);
    end;

//    epPCSCPPRemoteAuto:
//     begin
//        if rec.PortStaboardID = 'CPP PS' then
//         FLIstener.TriggerEvents(Self,epPCSCPPRemoteAutoPS,rec.ValueInt)
//        else
//        if rec.PortStaboardID = 'CPP SB' then
//          FLIstener.TriggerEvents(Self,epPCSCPPRemoteAutoSB,rec.ValueInt);
//     end;
//
//
//    epPCSCPPRemoteManual:
//    begin
//      if rec.PortStaboardID = 'CPP PS' then
//        FLIstener.TriggerEvents(Self,epPCSCPPRemoteManualPS,rec.ValueInt)
//      else
//      if rec.PortStaboardID = 'CPP SB' then
//        FLIstener.TriggerEvents(Self,epPCSCPPRemoteManualSB,rec.ValueInt);
//    end;

    epPCSCPPRemote:
    begin
      if rec.PortStaboardID = C_PCS_CPP_PORTS then
        FLIstener.TriggerEvents(Self,epPCSCPPRemotePS,rec.ValueBool)
      else
      if rec.PortStaboardID = C_PCS_CPP_STARBOARD then
        FLIstener.TriggerEvents(Self,epPCSCPPRemoteSB,rec.ValueBool);
    end;

    epPCSCPPReadyForUse:
    begin
      if rec.PortStaboardID = C_PCS_CPP_PORTS then
        FLIstener.TriggerEvents(Self,epPCSCPPReadyForUsePS,rec.ValueBool);
      if rec.PortStaboardID = C_PCS_CPP_STARBOARD then
        FLIstener.TriggerEvents(Self,epPCSCPPReadyForUseSB,rec.ValueBool);
    end;

    epPCSGBRemoteAuto:
    begin
      if rec.PortStaboardID = C_PCS_GB_PORTS then
        FLIstener.TriggerEvents(Self,epPCSGBRemoteAutoPS,rec.ValueBool)
      else
      if rec.PortStaboardID = C_PCS_GB_STARBOARD then
        FLIstener.TriggerEvents(Self,epPCSGBRemoteAutoSB,rec.ValueBool);
    end;

    epPCSGBRemoteManual:
    begin
      if rec.PortStaboardID = C_PCS_GB_PORTS then
        FLIstener.TriggerEvents(Self,epPCSGBRemoteManualPS,rec.ValueBool)
      else
      if rec.PortStaboardID = C_PCS_GB_STARBOARD then
        FLIstener.TriggerEvents(Self,epPCSGBRemoteManualSB,rec.ValueBool);
    end;

    epPCSGBClutchAllowed:
    begin
      if rec.PortStaboardID = C_PCS_GB_PORTS then
      begin
        FClutchAllowedPS := rec.ValueBool;
        FLIstener.TriggerEvents(Self,epPCSGBClutchAllowedPS,rec.ValueBool);
      end
      else
      if rec.PortStaboardID = C_PCS_GB_STARBOARD then
      begin
        FClutchAllowedSB := rec.ValueBool;
        FLIstener.TriggerEvents(Self,epPCSGBClutchAllowedSB,rec.ValueBool);
      end;
    end;

    epPCSGBClutchEngaged:
    begin
      if rec.PortStaboardID = C_PCS_GB_PORTS then
      begin
        FLIstener.TriggerEvents(Self,epPCSGBClutchEngagedPS,rec.ValueBool);
        FLIstener.TriggerEvents(Self,epPCSLeverShaftDrivenPS,rec.ValueBool);
        FLIstener.TriggerEvents(Self,epPCSLeverShaftStopPS,not rec.ValueBool);
        ShaftDrivenPS := rec.ValueBool;
        ShaftStopPS := not rec.ValueBool;
      end
      else
      if rec.PortStaboardID = C_PCS_GB_STARBOARD then
      begin
        FLIstener.TriggerEvents(Self,epPCSGBClutchEngagedSB,rec.ValueBool);
        FLIstener.TriggerEvents(Self,epPCSLeverShaftDrivenSB,rec.ValueBool);
        FLIstener.TriggerEvents(Self,epPCSLeverShaftStopSB,not rec.ValueBool);
        ShaftDrivenSB := rec.ValueBool;
        ShaftStopSB := not rec.ValueBool;
      end;
    end;

    epPCSGBReadyForUse:
    begin
      if rec.PortStaboardID = C_PCS_GB_PORTS then
        FLIstener.TriggerEvents(Self,epPCSGBReadyForUsePS,rec.ValueBool)
      else
      if rec.PortStaboardID = C_PCS_GB_STARBOARD then
        FLIstener.TriggerEvents(Self,epPCSGBReadyForUseSB,rec.ValueBool);
    end;

    epPCSMETransitMode:
    begin
      FLIstener.TriggerEvents(Self,epPCSMETransitMode,rec.ValueBool);
    end;

    epPCSMEManouveringMode:
    begin
      FLIstener.TriggerEvents(Self,epPCSMEManouveringMode,rec.ValueBool);
    end;

    //Lever Control
    epPCSLeverShaftDriven:
    begin
      if rec.PortStaboardID = C_PCS_GB_PORTS then
      begin
        FLIstener.TriggerEvents(Self,epPCSLeverShaftDrivenPS,rec.ValueBool);
        ShaftDrivenPS := rec.ValueBool;
      end
      else
      if rec.PortStaboardID = C_PCS_GB_STARBOARD then
      begin
        FLIstener.TriggerEvents(Self,epPCSLeverShaftDrivenSB,rec.ValueBool);
        ShaftDrivenSB := rec.ValueBool;
      end;
    end;

    epPCSLeverShaftStop:
    begin
      if rec.PortStaboardID = C_PCS_GB_PORTS then
      begin
        FLIstener.TriggerEvents(Self,epPCSLeverShaftStopPS,rec.ValueBool);
        ShaftStopPS := rec.ValueBool;
      end
      else
      if rec.PortStaboardID = C_PCS_GB_STARBOARD then
      begin
        FLIstener.TriggerEvents(Self,epPCSLeverShaftStopSB,rec.ValueBool);
        ShaftStopSB := rec.ValueBool;
      end;
    end;

    epPCSLeverShaftTrailing:
    begin
      if rec.PortStaboardID = C_PCS_GB_PORTS then
      begin
        FLIstener.TriggerEvents(Self,epPCSLeverShaftTrailingPS,rec.ValueBool);
        ShaftTrailingPS := rec.ValueBool;
      end
      else
      if rec.PortStaboardID = C_PCS_GB_STARBOARD then
      begin
        FLIstener.TriggerEvents(Self,epPCSLeverShaftTrailingSB,rec.ValueBool);
        ShaftTrailingSB := rec.ValueBool;
      end;
    end;

    epPCSLeverEmergencyStop:
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
        FLIstener.TriggerEvents(Self,epPCSLeverEmergencyStopPS,rec.ValueBool);
        EmergencyStopPS := rec.ValueBool;
      end
      else
      if rec.PortStaboardID = C_PCS_ME_STARBOARD then
      begin
        FLIstener.TriggerEvents(Self,epPCSLeverEmergencyStopSB,rec.ValueBool);
        EmergencyStopSB := rec.ValueBool;
      end;
    end;

    epPCSLeverTransferOverride:
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
        FLIstener.TriggerEvents(Self,epPCSLeverTransferOverridePS,rec.ValueBool);
        TransferOverridePS := rec.ValueBool;
      end
      else
      if rec.PortStaboardID = C_PCS_ME_STARBOARD then
      begin
        FLIstener.TriggerEvents(Self,epPCSLeverTransferOverrideSB,rec.ValueBool);
        TransferOverrideSB := rec.ValueBool;
      end;
    end;

    epPCSCtrlLocal:
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
        FLIstener.TriggerEvents(Self,epPCSCtrlLocalPS,rec.ValueBool);
        if rec.ValueInt = 0 then
          ControlRemotePS := True
        else
          ControlRemotePS := False;
      end
      else
      if rec.PortStaboardID = C_PCS_ME_STARBOARD then
      begin
        FLIstener.TriggerEvents(Self,epPCSCtrlLocalSB,rec.ValueBool);
        if rec.ValueInt = 0 then
          ControlRemoteSB := True
        else
          ControlRemoteSB := False;
      end;
    end;

    epPCSCtrlMCR:
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
      begin
        FLIstener.TriggerEvents(Self,epPCSCtrlMCRPS,rec.ValueBool);
        ControlRemotePS := rec.ValueBool;
      end
      else
      if rec.PortStaboardID = C_PCS_ME_STARBOARD then
      begin
        FLIstener.TriggerEvents(Self,epPCSCtrlMCRSB,rec.ValueBool);
        ControlRemoteSB := rec.ValueBool;
      end;
    end;

    epPCSCtrlBridge:
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
        FLIstener.TriggerEvents(Self,epPCSCtrlBridgePS,rec.ValueBool)
      else
      if rec.PortStaboardID = C_PCS_ME_STARBOARD then
        FLIstener.TriggerEvents(Self,epPCSCtrlBridgeSB,rec.ValueBool);
    end;

  //Alarm Propulsion
    epPCSMEFailure:
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
        FLIstener.TriggerEvents(Self,epPCSMEFailurePS,rec.ValueBool)
      else
      if rec.PortStaboardID = C_PCS_ME_STARBOARD then
        FLIstener.TriggerEvents(Self,epPCSMEFailureSB,rec.ValueBool);
    end;

    epPCSGBFailure:
    begin
      if rec.PortStaboardID = C_PCS_GB_PORTS then
        FLIstener.TriggerEvents(Self,epPCSGBFailurePS,rec.ValueBool)
      else
        FLIstener.TriggerEvents(Self,epPCSGBFailureSB,rec.ValueBool);
    end;

    epPCSCPPFailure:
    begin
      if rec.PortStaboardID = C_PCS_CPP_PORTS then
        FLIstener.TriggerEvents(Self,epPCSCPPFailurePS,rec.ValueBool)
      else
      if rec.PortStaboardID = C_PCS_CPP_STARBOARD then
        FLIstener.TriggerEvents(Self,epPCSCPPFailureSB,rec.ValueBool);
    end;

    epPCSGBShaftLocked:
    begin
      if rec.PortStaboardID = C_PCS_GB_PORTS then
        FLIstener.TriggerEvents(Self,epPCSGBShaftLockedPS,rec.ValueBool)
      else
      if rec.PortStaboardID = C_PCS_GB_STARBOARD then
        FLIstener.TriggerEvents(Self,epPCSGBShaftLockedSB,rec.ValueBool);
    end;

    epPCSGBShaftPowerLimited:
    begin
      if rec.PortStaboardID = C_PCS_GB_PORTS then
        FLIstener.TriggerEvents(Self,epPCSGBShaftPowerLimitedPS,rec.ValueBool)
      else
        FLIstener.TriggerEvents(Self,epPCSGBShaftPowerLimitedSB,rec.ValueBool);
    end;

    epPCSAlarms:
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
        FLIstener.TriggerEvents(Self,epPCSAlarmsPS,rec.ValueBool)
      else
        FLIstener.TriggerEvents(Self,epPCSAlarmsSB,rec.ValueBool);
    end;

    //Lever Control
    epPCSCtrlLever:
    begin
//      if rec.PortStaboardID = C_PCS_ME_PORTS then
//        SpeedLeverPS := rec.ValueInt
//      else if rec.PortStaboardID = C_PCS_ME_STARBOARD then
//        SpeedLeverSB := rec.ValueInt;
    end;
  end;

  case rec.CommandID of
    //General Control
    C_ORD_CTRL_ALARMACCEPT:
      FLIstener.TriggerEvents(Self,epPCSCtrlAlarmAccept,rec.ValueBool);

    C_ORD_CTRL_STOPHORN:
      FLIstener.TriggerEvents(Self,epPCSCtrlStopHorn,rec.ValueBool);

    C_ORD_CTRL_BACKGROUND_LAMP:
    begin
      if rec.ValueInt = 1 then
        FLIstener.TriggerEvents(Self,epPCSCtrlBackgroundLamp,rec.ValueInt)
      else
        FLIstener.TriggerEvents(Self,epPCSCtrlBackgroundLamp,(rec.ValueInt-1));
    end;

    C_ORD_CTRL_LAMPTEST:
    begin
      if idLampTest = 1 then
        FLIstener.TriggerEvents(Self,epPCSCtrlLamptTest,rec.ValueInt);
    end;

    //Rudder
    C_ORD_RUDDER:
    begin
      if rec.PortStaboardID = C_PCS_ME_PORTS then
        FLIstener.TriggerEvents(Self,epRudderValuePS,rec.ValueInt)
      else
      if rec.PortStaboardID = C_PCS_ME_STARBOARD then
        FLIstener.TriggerEvents(Self,epRudderValueSB,rec.ValueInt);
    end;

  end;
end;

procedure TPCSSystem.NetEventStatusThrottleCommand(apRec: PAnsiChar; aSize: Word);
var
  rec: ^R_Common_PanelThrottle_Command;
  recCmd : R_Common_PCS_Command;
  IDPanel : Byte;
  Value : Boolean;
begin
  rec := @apRec^;            {terima dari controller}
  IDPanel := rec.aID;
  Value := rec.aValue;

  case IDPanel of
    C_ORD_BTN_SHAFT_DRIVEN_PS, C_ORD_BTN_SHAFT_DRIVEN_SB: //Shaft Driven
    begin
      if (IDPanel = C_ORD_BTN_SHAFT_DRIVEN_PS) and LeverInServicePS and FClutchAllowedPS then
        recCmd.PortStaboardID := C_PCS_GB_PORTS
      else if (IDPanel = C_ORD_BTN_SHAFT_DRIVEN_SB) and LeverInServiceSB and FClutchAllowedSB then
        recCmd.PortStaboardID := C_PCS_GB_STARBOARD;

      recCmd.CommandID := C_ORD_GB_CLUTCH_ENGAGED;
      recCmd.ValueBool := True;
    end;

    C_ORD_BTN_SHAFT_STOP_PS, C_ORD_BTN_SHAFT_STOP_SB: //Shaft Stop
    begin
      if IDPanel = C_ORD_BTN_SHAFT_STOP_PS then
        recCmd.PortStaboardID := C_PCS_GB_PORTS
      else
        recCmd.PortStaboardID := C_PCS_GB_STARBOARD;

      recCmd.CommandID := C_ORD_GB_CLUTCH_ENGAGED;
      recCmd.ValueBool := False;
    end;

    C_ORD_BTN_SHAFT_TRAILING_PS, C_ORD_BTN_SHAFT_TRAILING_SB: //Shaft Trailing
    begin
      if IDPanel = C_ORD_BTN_SHAFT_TRAILING_PS then
        recCmd.PortStaboardID := C_PCS_GB_PORTS
      else
        recCmd.PortStaboardID := C_PCS_GB_STARBOARD;

      recCmd.CommandID := C_ORD_LEVER_SHAFTTRAILING;
    end;

    C_ORD_BTN_EMERGENCY_STOP_PS, C_ORD_BTN_EMERGENCY_STOP_SB: //Emergency Stop
    begin
      if IDPanel = C_ORD_BTN_EMERGENCY_STOP_PS then
        recCmd.PortStaboardID := C_PCS_ME_PORTS
      else
        recCmd.PortStaboardID := C_PCS_ME_STARBOARD;

      recCmd.CommandID := C_ORD_LEVER_EMERGENCYSTOP;
    end;

    C_ORD_TRANSFER_OVERRIDE_PS, C_ORD_TRANSFER_OVERRIDE_SB: //Transfer Override
    begin
      if (IDPanel = C_ORD_TRANSFER_OVERRIDE_PS) and LeverInServicePS then
        recCmd.PortStaboardID := C_PCS_ME_PORTS
      else if (IDPanel = C_ORD_TRANSFER_OVERRIDE_SB) and LeverInServiceSB then
        recCmd.PortStaboardID := C_PCS_ME_STARBOARD;

      recCmd.CommandID := C_ORD_LEVER_TRANSFEROVERRIDE;
    end;
  end;

  if (((recCmd.PortStaboardID = C_PCS_ME_PORTS) or (recCmd.PortStaboardID = C_PCS_GB_PORTS))
    and ControlRemotePS) or
    (((recCmd.PortStaboardID = C_PCS_ME_STARBOARD) or (recCmd.PortStaboardID = C_PCS_GB_STARBOARD))
    and ControlRemoteSB) then
  Network.VREngineSocket.SendData(C_PCS_COMMAND,@recCmd);
end;

{Untuk Testing Throttle}
procedure TPCSSystem.PanelThrottleTesting(IDPanel: Byte;
  Value: Boolean);
  var recCmd : R_Common_PCS_Command;
begin
  case IDPanel of
    C_ORD_BTN_SHAFT_DRIVEN_PS, C_ORD_BTN_SHAFT_DRIVEN_SB: //Shaft Driven
    begin
      if (IDPanel = C_ORD_BTN_SHAFT_DRIVEN_PS) and LeverInServicePS and FClutchAllowedPS then
        recCmd.PortStaboardID := C_PCS_GB_PORTS
      else if (IDPanel = C_ORD_BTN_SHAFT_DRIVEN_SB) and LeverInServiceSB and FClutchAllowedSB then
        recCmd.PortStaboardID := C_PCS_GB_STARBOARD;

      recCmd.CommandID := C_ORD_GB_CLUTCH_ENGAGED;
      recCmd.ValueBool := True;
    end;

    C_ORD_BTN_SHAFT_STOP_PS, C_ORD_BTN_SHAFT_STOP_SB: //Shaft Stop
    begin
      if IDPanel = C_ORD_BTN_SHAFT_STOP_PS then
        recCmd.PortStaboardID := C_PCS_GB_PORTS
      else
        recCmd.PortStaboardID := C_PCS_GB_STARBOARD;

      recCmd.CommandID := C_ORD_GB_CLUTCH_ENGAGED;
      recCmd.ValueBool := False;
    end;

    C_ORD_BTN_SHAFT_TRAILING_PS, C_ORD_BTN_SHAFT_TRAILING_SB: //Shaft Trailing
    begin
      if IDPanel = C_ORD_BTN_SHAFT_TRAILING_PS then
        recCmd.PortStaboardID := C_PCS_GB_PORTS
      else
        recCmd.PortStaboardID := C_PCS_GB_STARBOARD;

      recCmd.CommandID := C_ORD_LEVER_SHAFTTRAILING;
    end;

    C_ORD_BTN_EMERGENCY_STOP_PS, C_ORD_BTN_EMERGENCY_STOP_SB: //Emergency Stop
    begin
      if IDPanel = C_ORD_BTN_EMERGENCY_STOP_PS then
        recCmd.PortStaboardID := C_PCS_ME_PORTS
      else
        recCmd.PortStaboardID := C_PCS_ME_STARBOARD;

      recCmd.CommandID := C_ORD_LEVER_EMERGENCYSTOP;
    end;

    C_ORD_TRANSFER_OVERRIDE_PS, C_ORD_TRANSFER_OVERRIDE_SB: //Transfer Override
    begin
      if (IDPanel = C_ORD_TRANSFER_OVERRIDE_PS) and LeverInServicePS then
        recCmd.PortStaboardID := C_PCS_ME_PORTS
      else if (IDPanel = C_ORD_TRANSFER_OVERRIDE_SB) and LeverInServiceSB then
        recCmd.PortStaboardID := C_PCS_ME_STARBOARD;

      recCmd.CommandID := C_ORD_LEVER_TRANSFEROVERRIDE;
    end;
  end;

  if (((recCmd.PortStaboardID = C_PCS_ME_PORTS) or (recCmd.PortStaboardID = C_PCS_GB_PORTS))
    and ControlRemotePS) or
    (((recCmd.PortStaboardID = C_PCS_ME_STARBOARD) or (recCmd.PortStaboardID = C_PCS_GB_STARBOARD))
    and ControlRemoteSB) then
    Network.VREngineSocket.SendData(C_PCS_COMMAND,@recCmd);
end;

procedure TPCSSystem.NetworkEventAssignment;
var
  client : TTCPClient;
begin
  { set all network event here.. as simengine client }
  client := FPCSNetwork.AsClients.Get('AsSimEngineClient');
  if Assigned(client) then
    with  client do
    begin
      RegisterProcedure(C_PCS_COMMAND, NetEventPCSCommand, SizeOf(R_Common_PCS_Command));
    end;

  { set all network event here.. as instructor client}
  client := FPCSNetwork.AsClients.Get('AsInstructorClient');
  if Assigned(client) then
    with  client do
    begin
      RegisterProcedure(C_INSTRUCTOR_COMMAND, NetEventInstructorCommonCmd, SizeOf(R_Common_Instr_Command));
      //yoga
      RegisterProcedure(C_Servo_COMMAND, nil, SizeOf(R_ServoAndLamp_Command));
    end;

   client := FPCSNetwork.AsClients.Get('AsControllerClient');
   if Assigned(client) then
     with client do
     begin
       RegisterProcedure(C_PANELTHROTTLE_COMMAND, NetEventStatusThrottleCommand, SizeOf(R_Common_PanelThrottle_Command));
       RegisterProcedure(C_PANELTHROTTLE_COMMAND2, nil, SizeOf(R_Common_PanelThrottle_Command));
     end;
end;
end.
