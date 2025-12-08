unit uLeverControl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NLDJoystick, ExtCtrls, StdCtrls, math, uDataType, uListener, IniFiles,
  CPort, CPortCtl, UBinaryPacketizer, System.Generics.Collections;

var
  LeverValuesPositionManouverSB: array[0..21] of Double = (10,9,8,6,4,2,1,0,-0.5,-1,-2,-4,-6,-8,-9,-10,-10,-10,-10,-10,-10,10);
  LeverValuesPositionManouverPS: array[0..21] of Double = (-0.5,-1,-2,-4,-6,-8,-9,-10,-10,-10,-10,10,10,10,10,9,8,6,4,2,1,0);
  LeverValuesPositionTransit   : array[0..12] of Double = (10,9,8,7,6,5,4,3.5,3,2,1,0.5,0);

type
  TfrmLeverControl = class(TForm)
    nldjystck1: TNLDJoystick;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl5: TLabel;
    tmrLever: TTimer;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    ComPort1: TComPort;
    procedure nldjystck1Move(Sender: TNLDJoystick; const JoyPos: TJoyRelPos;
      const Buttons: TJoyButtons);
    procedure FormCreate(Sender: TObject);
    procedure tmrLeverTimer(Sender: TObject);
    procedure LoadSettingForm(filepath : string);
    procedure FormShow(Sender: TObject);
    procedure ComPort1RxChar(Sender: TObject; Count: Integer);

  private
    LastLeverIndexPS : Integer;
    LastLeverIndexSB : Integer;

    FListener : TListeners;
    FTransit, FManouvre : Boolean;

    LastSentLeverInServicePS: Boolean;
    LastSentLeverInServiceSB: Boolean;

    LastSentAheadPS: Boolean;
    LastSentAsternPS: Boolean;

    LastSentAheadSB: Boolean;
    LastSentAsternSB: Boolean;

    procedure PCSSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Boolean);overload;
    function ThrottleValue(Position: Integer): Double;
  public
  counterCheck : Integer;
  rmin, rmax, umin, umax, vmin,vmax :Double;
  SpeedPS, SpeedSB, LastSpeedPS, LastSpeedSB : Integer;
  constThrottlePS, constThrottleSB : Double;
  CekPS, CekSB : Boolean;
  CekManouver, CekTransit : Boolean;

  SerialPortName : string;
  SerialBuffer   : string;

  LastSendPS, LastSendSB : Integer;
  ComPort: TComPort;
  idServoTest, idLeverTest : Integer;
  LeverValuesPositionManouverPS: array[0..21] of Double;
  LeverValuesPositionManouverSB: array[0..21] of Double;
  LeverValuesPositionTransit   : array[0..12] of Double;

  procedure LeverValuePosition;
  property Listener : TListeners read FListener;
  end;

var
  frmLeverControl: TfrmLeverControl;

implementation

uses uPCSSystem;

{$R *.dfm}

procedure TfrmLeverControl.ComPort1RxChar(Sender: TObject; Count: Integer);
var
  RawValue : Integer;
  Rawline, TempStr, Line: string;
  Lines: TStringList;
  LeverIndexPS, LeverIndexSB, i : Integer;
  Key : string;
  Value: Boolean;
  LeverSpeedPS, LeverSpeedSB : Double;
  LeverTransit : Double;
begin
  SetLength(TempStr, Count);
  ComPort1.ReadStr(TempStr, Count);
  SerialBuffer := SerialBuffer + TempStr;

  Lines := TStringList.Create;
  try
    while Pos(#10, SerialBuffer) > 0 do
    begin
      Line := Trim(Copy(SerialBuffer, 1, Pos(#10, SerialBuffer) - 1));
      Delete(SerialBuffer, 1, Pos(#10, SerialBuffer));
      Lines.Add(Line);
    end;

    for i := 0 to Lines.Count - 1 do
    begin
      Rawline := Lines[i];
//      Memo1.Lines.Add('Rawline: ' + Rawline);

      // === ThrottlePS ===
      if Rawline.StartsWith('ThrottlePS :') then
      begin
        if TryStrToInt(Copy(Rawline, 13, MaxInt), RawValue) then
        begin
          LeverIndexPS := EnsureRange(RawValue, 0, 21);

          if LastLeverIndexPS <> LeverIndexPS then
          begin
            LastLeverIndexPS := LeverIndexPS;
            LeverSpeedPS     := LeverValuesPositionManouverPS[LeverIndexPS];
            LeverTransit     := LeverValuesPositionTransit[LeverIndexPS];
          end;

//          if PCSSystem.RemoteAutoPS = True then
//          begin
            if LeverIndexPS >= 11 then
              ComPort1.WriteStr('AheadPS:1' + #10)
            else if LeverIndexPS < 11 then
              ComPort1.WriteStr('AsternPS:1' + #10);
//          end;

//          if PCSSystem.Manouver then
//          begin
            lbl9.Caption := FloatToStr(LeverSpeedPS);
            PCSSystem.LeverSpeed(C_PCS_ME_PORTS, LeverSpeedPS, True);
            PCSSystem.LeverPitch(C_PCS_CPP_PORTS, LeverSpeedPS, True);
            PCSSystem.LeverShaft(C_PCS_GB_PORTS, LeverSpeedPS, True);
//          end
//          else if PCSSystem.Transit then
//          begin
//            lbl9.Caption := FloatToStr(LeverTransit);
//            PCSSystem.LeverSpeed(C_PCS_ME_PORTS, LeverTransit, False);
//            PCSSystem.LeverPitch(C_PCS_CPP_PORTS, LeverTransit, False);
//            PCSSystem.LeverShaft(C_PCS_GB_PORTS, LeverTransit, False);
//          end;
        end;
      end

      // === ThrottleSB ===
      else if Rawline.StartsWith('ThrottleSB :') then
      begin
        if TryStrToInt(Copy(Rawline, 13, MaxInt), RawValue) then
        begin
          LeverIndexSB := EnsureRange(RawValue, 0, 21);

          if LastLeverIndexSB <> LeverIndexSB then
          begin
            LastLeverIndexSB := LeverIndexSB;
            LeverSpeedSB     := LeverValuesPositionManouverSB[LeverIndexSB];
            LeverTransit     := LeverValuesPositionTransit[LeverIndexSB];
          end;

//          if PCSSystem.RemoteAutoSB = True then
//          begin
            if (LeverIndexSB <= 7) or (LeverIndexSB = 21) then
              ComPort1.WriteStr('AheadSB:1' + #10)
            else if (LeverIndexSB > 7) and (LeverIndexSB < 21) then
              ComPort1.WriteStr('AsternSB:1' + #10);
//          end;


//          if PCSSystem.Manouver then
//          begin
            lbl10.Caption := FloatToStr(LeverSpeedSB);
            PCSSystem.LeverSpeed(C_PCS_ME_STARBOARD, LeverSpeedSB, True);
            PCSSystem.LeverPitch(C_PCS_CPP_STARBOARD, LeverSpeedSB, True);
            PCSSystem.LeverShaft(C_PCS_GB_STARBOARD, LeverSpeedSB, True);
//          end
//          else if PCSSystem.Transit then
//          begin
//            lbl10.Caption := FloatToStr(LeverTransit);
//            PCSSystem.LeverSpeed(C_PCS_ME_STARBOARD, LeverTransit, False);
//            PCSSystem.LeverPitch(C_PCS_CPP_STARBOARD, LeverTransit, False);
//            PCSSystem.LeverShaft(C_PCS_GB_STARBOARD, LeverTransit, False);
//          end;
        end;
      end

      // === Button ===
      else if Pos(':', Rawline) > 0 then
      begin
        Key   := Copy(Rawline, 1, Pos(':', Rawline) - 1);
        Value := Copy(Rawline, Pos(':', Rawline) + 1, 1) = '1';

        if Key = 'ShaftDrivenPS' then
          PCSSystem.ShaftDriven(C_PCS_GB_PORTS, Value)
        else if Key = 'EmergencyStopPS' then
          PCSSystem.EmergencyStop(C_PCS_ME_PORTS, Value)
        else if Key = 'LeverInServicePS' then
          PCSSystem.LeverInService(C_PCS_ME_PORTS, Value)
        else if Key = 'ShaftStopPS' then
          PCSSystem.ShaftDriven(C_PCS_GB_PORTS, False)
        else if Key = 'ShaftTrailingPS' then
          PCSSystem.ShaftTrailing(C_PCS_GB_PORTS, 40, Value)
        else if Key = 'TransferOverridePS' then
          PCSSystem.TransferOverride(C_PCS_ME_PORTS, Value)

        else if Key = 'ShaftDrivenSB' then
          PCSSystem.ShaftDriven(C_PCS_GB_STARBOARD, Value)
        else if Key = 'EmergencyStopSB' then
          PCSSystem.EmergencyStop(C_PCS_ME_STARBOARD, Value)
        else if Key = 'LeverInServiceSB' then
          PCSSystem.LeverInService(C_PCS_ME_STARBOARD, Value)
        else if Key = 'ShaftStopSB' then
          PCSSystem.ShaftDriven(C_PCS_GB_STARBOARD, False)
        else if Key = 'ShaftTrailingSB' then
          PCSSystem.ShaftTrailing(C_PCS_GB_STARBOARD, 40, Value)
        else if Key = 'TransferOverrideSB' then
          PCSSystem.TransferOverride(C_PCS_ME_STARBOARD, Value);
      end;
    end;

  finally
    Lines.Free;
  end;
end;

function TfrmLeverControl.ThrottleValue(Position: Integer): Double;
begin
  Result := EnsureRange(Round(Position / 1023 * 21), 0, 21);
end;

procedure TfrmLeverControl.LeverValuePosition;
begin
  // Mode Manouver PS
  LeverValuesPositionManouverPS[0]  := -0.5;
  LeverValuesPositionManouverPS[1]  := -1;
  LeverValuesPositionManouverPS[2]  := -2;
  LeverValuesPositionManouverPS[3]  := -4;
  LeverValuesPositionManouverPS[4]  := -6;
  LeverValuesPositionManouverPS[5]  := -8;
  LeverValuesPositionManouverPS[6]  := -9;
  LeverValuesPositionManouverPS[7]  := -10;
  LeverValuesPositionManouverPS[8]  := -10;
  LeverValuesPositionManouverPS[9]  := -10;
  LeverValuesPositionManouverPS[10] := -10;
  LeverValuesPositionManouverPS[11] := 10;
  LeverValuesPositionManouverPS[12] := 10;
  LeverValuesPositionManouverPS[13] := 10;
  LeverValuesPositionManouverPS[14] := 10;
  LeverValuesPositionManouverPS[15] := 9;
  LeverValuesPositionManouverPS[16] := 8;
  LeverValuesPositionManouverPS[17] := 6;
  LeverValuesPositionManouverPS[18] := 4;
  LeverValuesPositionManouverPS[19] := 2;
  LeverValuesPositionManouverPS[20] := 1;
  LeverValuesPositionManouverPS[21] := 0;

  // Manouver SB
  LeverValuesPositionManouverSB[0]  := 10;
  LeverValuesPositionManouverSB[1]  := 9;
  LeverValuesPositionManouverSB[2]  := 8;
  LeverValuesPositionManouverSB[3]  := 6;
  LeverValuesPositionManouverSB[4]  := 4;
  LeverValuesPositionManouverSB[5]  := 2;
  LeverValuesPositionManouverSB[6]  := 1;
  LeverValuesPositionManouverSB[7]  := 0;
  LeverValuesPositionManouverSB[8]  := -0.5;
  LeverValuesPositionManouverSB[9]  := -1;
  LeverValuesPositionManouverSB[10] := -2;
  LeverValuesPositionManouverSB[11] := -4;
  LeverValuesPositionManouverSB[12] := -6;
  LeverValuesPositionManouverSB[13] := -8;
  LeverValuesPositionManouverSB[14] := -9;
  LeverValuesPositionManouverSB[15] := -10;
  LeverValuesPositionManouverSB[16] := -10;
  LeverValuesPositionManouverSB[17] := -10;
  LeverValuesPositionManouverSB[18] := -10;
  LeverValuesPositionManouverSB[19] := -10;
  LeverValuesPositionManouverSB[20] := -10;
  LeverValuesPositionManouverSB[21] := 10;

  // Mode Transit PS
  LeverValuesPositionTransit[0]  := 6;
  LeverValuesPositionTransit[1]  := 5;
  LeverValuesPositionTransit[2]  := 4;
  LeverValuesPositionTransit[3]  := 3;
  LeverValuesPositionTransit[4]  := 2;
  LeverValuesPositionTransit[5]  := 1;
  LeverValuesPositionTransit[6]  := 0.5;
  LeverValuesPositionTransit[7]  := 0;
  LeverValuesPositionTransit[8]  := 3;
  LeverValuesPositionTransit[9]  := 2;
  LeverValuesPositionTransit[10] := 1;
  LeverValuesPositionTransit[11] := 0.5;
  LeverValuesPositionTransit[12] := 0;
end;

procedure TfrmLeverControl.FormCreate(Sender: TObject);
begin
//lbl1.Caption:=FloatToStr(nldjystck1.AbsMin.R);
  with PCSSystem.Listener.Add('LEVER') as TPropertyEventListener do begin
      OnPropertyBoolChange := PCSSystemEvent;
  end;
  counterCheck := 0;

  LoadSettingForm('..\bin\setting.ini');

  // Untuk Throttle
  LeverValuePosition;
  LastLeverIndexPS := -1;
  LastLeverIndexSB := -1;

  LastSentLeverInServicePS := False;
  LastSentLeverInServiceSB := False;

//  ComPort1.Port := 'COM4';
//  ComPort1.BaudRate := br9600;
  ComPort1.Open;
end;

procedure TfrmLeverControl.FormShow(Sender: TObject);
begin
  Top  := 1945;
  Left := 0;
  FormStyle := fsStayOnTop;
  BringToFront;
//  ShowMessage('');
end;

procedure TfrmLeverControl.LoadSettingForm(filepath: string);
var
  inifile : TIniFile;
  tempstring : TStringList;
begin
  inifile := TIniFile.Create(filepath);
  tempstring := TStringList.Create;

  inifile.ReadSection('Kalibrasi Throttle', tempstring);

  constThrottlePS := StrToFloat(inifile.ReadString('Kalibrasi Throttle', 'constThrottlePS','0'));
  constThrottleSB := StrToFloat(inifile.ReadString('Kalibrasi Throttle', 'constThrottleSB','0'));

  SerialPortName := inifile.ReadString('Serial', 'COMPort', 'COM4');

  inifile.Free;
  tempstring.Free;

end;

procedure TfrmLeverControl.nldjystck1Move(Sender: TNLDJoystick; const JoyPos: TJoyRelPos;
  const Buttons: TJoyButtons);
begin
//  if ((10*JoyPos.U)-constThrottlePS-0.5) > -1) then

  if (((10*JoyPos.U)-constThrottlePS) > -1) and (((10*JoyPos.U)-constThrottlePS) <= 4) then
  begin
    lbl9.Caption:=FloatToStr(Round((10*JoyPos.U)-constThrottlePS));
    SpeedPS := Round((10*JoyPos.U)-constThrottlePS);
    lbl5.Caption := FloatToStr(JoyPos.U);
  end
  else if (((10*JoyPos.U)-constThrottlePS) > 4) and ((10*JoyPos.U) < 8) then
  begin
    lbl9.Caption := FloatToStr(Ceil((10*JoyPos.U)-constThrottlePS));
    lbl5.Caption := FloatToStr(JoyPos.U);
    SpeedPS := Ceil((10*JoyPos.U)-constThrottlePS);
  end
  else if (10*JoyPos.U) > 8 then
  begin
    lbl9.Caption:= FloatToStr(Ceil(10*JoyPos.U));
    SpeedPS := Ceil(10*JoyPos.U);
    lbl5.Caption := FloatToStr(JoyPos.U);
  end
  else if (((10*JoyPos.U)-constThrottlePS) < -1) and (((10*JoyPos.U)-constThrottlePS) > -10)  then
  begin
    lbl9.Caption := FloatToStr(Floor((10*JoyPos.U)-constThrottlePS));
    lbl5.Caption := FloatToStr(JoyPos.U);
    SpeedPS := Floor((10*JoyPos.U)-constThrottlePS);
  end
  else if ((10*JoyPos.U)-constThrottlePS) < -10 then
  begin
    lbl9.Caption:= FloatToStr(Ceil((10*JoyPos.U)-constThrottlePS));
    SpeedPS := -10;
    lbl5.Caption := FloatToStr(JoyPos.U);
  end;

  if (((10*JoyPos.R)-constThrottleSB) > -1) and (((10*JoyPos.R)-constThrottleSB) <= 1) then
  begin
    lbl10.Caption:=FloatToStr(Round((10*JoyPos.R)-(constThrottleSB+0.3)));
    SpeedSB := Round((10*JoyPos.R)-(constThrottleSB+0.3));
    lbl6.Caption := FloatToStr(JoyPos.R);
  end;
  if (((10*JoyPos.R)-constThrottleSB) > 1) and (((10*JoyPos.R)-constThrottleSB) <= 4) then
  begin
    lbl10.Caption:=FloatToStr(Round((10*JoyPos.R)-constThrottleSB));
    SpeedSB := Round((10*JoyPos.R)-constThrottleSB);
    lbl6.Caption := FloatToStr(JoyPos.R);
  end
  else if (((10*JoyPos.R)-constThrottleSB) > 4) and ((10*JoyPos.R) < 8) then
  begin
    lbl10.Caption := FloatToStr(Ceil((10*JoyPos.R)-constThrottleSB));
    lbl6.Caption := FloatToStr(JoyPos.R);
    SpeedSB := Ceil((10*JoyPos.R)-constThrottleSB);
  end
  else if (10*JoyPos.R) > 8 then
  begin
    lbl10.Caption:= FloatToStr(Ceil(10*JoyPos.R));
    SpeedSB := Ceil(10*JoyPos.R);
    lbl6.Caption := FloatToStr(JoyPos.R);
  end
  else if (((10*JoyPos.R)-constThrottleSB) < -1) and (((10*JoyPos.R)-constThrottleSB) > -10)  then
  begin
    lbl10.Caption := FloatToStr(Floor((10*JoyPos.R)-constThrottleSB));
    lbl6.Caption := FloatToStr(JoyPos.R);
    SpeedSB := Floor((10*JoyPos.R)-constThrottleSB);
  end
  else if ((10*JoyPos.R)-constThrottleSB) < -10 then
  begin
    lbl10.Caption:= FloatToStr(Ceil((10*JoyPos.R)-constThrottleSB));
    SpeedSB := -10;
    lbl6.Caption := FloatToStr(JoyPos.R);
  end;
end;

procedure TfrmLeverControl.PCSSystemEvent(Sender: TObject; PropsID: E_PropsID;
  Value: Boolean);
begin
  case PropsID of
    epPCSMEPSRemoteAuto:
      if Value then
      begin
        CekPS := Value;
        ComPort1.WriteStr('LeverInServicePS:1' + #10);
      end
      else
      begin
        CekPS := not Value;
        ComPort1.WriteStr('LeverInServicePS:0' + #10);
      end;

    epPCSMESBRemoteAuto:
      if Value then
      begin
        CekSB := Value;
        ComPort1.WriteStr('LeverInServiceSB:1' + #10);
      end
      else
      begin
        CekSB := not Value;
        ComPort1.WriteStr('LeverInServiceSB:0' + #10);
      end;

//    epPCSMEManouveringMode:
//      if Value then
//      begin
//        CekManouver := Value;
//        ComPort1.WriteStr('ModeManouverPS:1' + #10);
//        ComPort1.WriteStr('ModeManouverSB:1' + #10);
//        PCSSystem.Manouver := True;
//        PCSSystem.Transit  := False;
//      end
//      else
//      begin
//        CekManouver := not Value;
//        ComPort1.WriteStr('ModeManouverPS:0' + #10);
//        ComPort1.WriteStr('ModeManouverSB:0' + #10);
//      end;
//
//    epPCSMETransitMode:
//      if Value then
//      begin
//        CekTransit := Value;
//        ComPort1.WriteStr('ModeTransitPS:1' + #10);
//        ComPort1.WriteStr('ModeTransitSB:1' + #10);
//      end
//      else
//      begin
//        CekTransit := not Value;
//        ComPort1.WriteStr('ModeTransitPS:0' + #10);
//        ComPort1.WriteStr('ModeTransitSB:0' + #10);
//      end;
  end;
end;

procedure TfrmLeverControl.tmrLeverTimer(Sender: TObject);
begin
  counterCheck := counterCheck + 1;
  if counterCheck > 2 then
  begin
    counterCheck := 0;
    lbl1.Caption := FloatToStr(SpeedPS);
    lbl2.Caption := FloatToStr(SpeedSB);
//    PCSSystem.SpeedLeverPS := SpeedPS;
//    PCSSystem.SpeedLeverSB := SpeedSB;

    if (not PCSSystem.throttleTest) then
      PCSSystem.LeverControl(C_PCS_ME_PORTS,SpeedPS);
    if (not PCSSystem.throttleTest) then
      PCSSystem.LeverControl(C_PCS_ME_STARBOARD,SpeedSB);
  end;
end;

end.

