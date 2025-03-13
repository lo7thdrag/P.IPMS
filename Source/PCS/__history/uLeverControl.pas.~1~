unit uLeverControl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NLDJoystick, ExtCtrls, StdCtrls, math, uDataType, uListener, IniFiles;

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
    procedure nldjystck1Move(Sender: TNLDJoystick; const JoyPos: TJoyRelPos;
      const Buttons: TJoyButtons);
    procedure FormCreate(Sender: TObject);
    procedure tmrLeverTimer(Sender: TObject);
    procedure LoadSettingForm(filepath : string);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
    procedure PCSSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Boolean);overload;

  public
  counterCheck : Integer;
  rmin, rmax, umin, umax, vmin,vmax :Double;
  SpeedPS, SpeedSB, LastSpeedPS, LastSpeedSB : Integer;
  constThrottlePS, constThrottleSB : Double;
  CekPS, CekSB : Boolean;
    { Public declarations }
  end;

var
  frmLeverControl: TfrmLeverControl;

implementation

uses uPCSSystem;

{$R *.dfm}

procedure TfrmLeverControl.FormCreate(Sender: TObject);
begin
//lbl1.Caption:=FloatToStr(nldjystck1.AbsMin.R);
  with PCSSystem.Listener.Add('LEVER') as TPropertyEventListener do begin
      OnPropertyBoolChange := PCSSystemEvent;
  end;
  counterCheck := 0;

  LoadSettingForm('..\bin\setting.ini');
end;

procedure TfrmLeverControl.FormShow(Sender: TObject);
begin
  Top := 200;
  Left := 200;
end;

procedure TfrmLeverControl.LoadSettingForm(filepath: string);
var
  inifile : TIniFile;
  tempstring : TStringList;
begin
  inifile := TIniFile.Create(filepath);
  tempstring := TStringList.Create;

  inifile.ReadSection('Kalibrasi Throttle', tempstring);

  constThrottlePS := StrToFloat(inifile.ReadString('Kalibrasi Throttle', tempstring[0],'Default'));
  constThrottleSB := StrToFloat(inifile.ReadString('Kalibrasi Throttle', tempstring[1],'Default'));

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
        CekPS := Value
      else
        CekPS := not Value;

    epPCSMESBRemoteAuto:
      if Value then
        CekSB := Value
      else
        CekSB := not Value;
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

