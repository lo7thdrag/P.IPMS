unit uControlLeverPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, SpeedButtonImage, VrControls,
  VrRotarySwitch, NLDJoystick, math, uDataType, uListener;

type
  TfrmControlLever = class(TForm)
    pnl1: TPanel;
    imgBackgroundCtrlLever: TImage;
    imgControlLever: TImage;
    btnShaftDrivenLeft: TSpeedButtonImage;
    btnShaftDrivenRight: TSpeedButtonImage;
    btnShaftStopRight: TSpeedButtonImage;
    btnShaftTrailingRight: TSpeedButtonImage;
    btnEmergencyStopRight: TSpeedButtonImage;
    btnLeverInServiceRight: TSpeedButtonImage;
    btnTransferOverrideRight: TSpeedButtonImage;
    btnShaftStopLeft: TSpeedButtonImage;
    btnShaftTrailingLeft: TSpeedButtonImage;
    btnEmergencyStopLeft: TSpeedButtonImage;
    btnLeverInServiceLeft: TSpeedButtonImage;
    btnTransferOverrideLeft: TSpeedButtonImage;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lblPS: TLabel;
    lblSB: TLabel;
    nldjystck1: TNLDJoystick;
    procedure FormShow(Sender: TObject);
    procedure btnShaftDrivenLeftClick(Sender: TObject);
    procedure btnEmergencyStopLeftClick(Sender: TObject);

    procedure FormCreate(Sender: TObject);
    procedure nldjystck1Move(Sender: TNLDJoystick; const JoyPos: TJoyRelPos;
      const Buttons: TJoyButtons);

  private
    { Private declarations }
public
    { Public declarations }
    cekShaftDrivenLeft, CekEmergencyStopLeft, CekShaftTrailingLeft, CekLeverInSrviceLeft, CekTransferOverrideLeft,
    cekShaftDrivenRight, CekEmergencyStopRight, CekShaftTrailingRight, CekLeverInServiceRight, CekTransferOverrideRight : Boolean;
  end;

var
  frmControlLever: TfrmControlLever;

implementation
  uses uPCSSystem;

{$R *.dfm}

procedure TfrmControlLever.btnEmergencyStopLeftClick(Sender: TObject);
begin
  if CekEmergencyStopLeft = False then
  begin
    btnEmergencyStopLeft.Color := clRed;
    CekEmergencyStopLeft := True;
  end
  else if CekEmergencyStopLeft = True then
  begin
    btnEmergencyStopLeft.Color := clMaroon;
    CekEmergencyStopLeft := False;
  end;
end;

procedure TfrmControlLever.btnShaftDrivenLeftClick(Sender: TObject);
begin
  if cekShaftDrivenLeft = False then
  begin
    btnShaftDrivenLeft.Color := clLime;
    cekShaftDrivenLeft := True;
  end
  else if cekShaftDrivenLeft = True then
  begin
    btnShaftDrivenLeft.Color := clGreen;
    cekShaftDrivenLeft := False;
  end;



end;

procedure TfrmControlLever.FormCreate(Sender: TObject);
begin
//with PCSSystem.Listener.Add('LEVER') as TPropertyEventListener do
//  begin
//      OnPropertyIntChange := PCSSystemEvent;
//      OnPropertyByteChange := PCSSystemEvent;
//  end;
end;

procedure TfrmControlLever.FormShow(Sender: TObject);

begin
//  DefaultMonitor := dmDesktop;
//  if Screen.MonitorCount > 1 then i := 0
//  else i := 0;
//
//  Top := Screen.Monitors[i].Top + 820;
//  Left := Screen.Monitors[i].Left;
end;





procedure TfrmControlLever.nldjystck1Move(Sender: TNLDJoystick;
  const JoyPos: TJoyRelPos; const Buttons: TJoyButtons);
begin
 if ((10*JoyPos.R)-0.3) > 0 then
   lblPS.Caption:=FloatToStr(round((10*JoyPos.R)-0.3))
 else
 begin
   if ((10*JoyPos.R)-0.3) < -10 then
     lblPS.Caption := '-10'
   else
   lblPS.Caption:=FloatToStr(floor((10*JoyPos.R)-0.3));
 end;


 if ((10*JoyPos.U)) > 0 then
   lblSB.Caption:=FloatToStr(round((10*JoyPos.U)))
 else
   lblSB.Caption:=FloatToStr(floor((10*JoyPos.U)));


 if ((10*JoyPos.V)-0.3) > 0 then
   lbl3.Caption:=FloatToStr(round((10*JoyPos.V)-0.3))
 else
 begin
   if ((10*JoyPos.V)-0.3) < -10 then
     lbl3.Caption := '-10'
   else
     lbl3.Caption:=FloatToStr(floor((10*JoyPos.V)-0.3));
 end;


   if JoyBtn1 in Buttons then
    lbl4.Caption:=' button 1 '
end;

end.
