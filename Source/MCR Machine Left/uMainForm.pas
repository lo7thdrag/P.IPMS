unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,

  uListener, uFreezeFrom, uDataType, RzBmpBtn, VrControls, VrRotarySwitch,
  Vcl.StdCtrls, VrAngularMeter, Vcl.ExtCtrls;

//const
//  LAMP_COUNT = 15;    //total Lamp

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    Image7: TImage;
    imgpsimgtelegrapps: TImage;
    pnlRPMMESPEED: TPanel;
    VrAngularMeter1: TVrAngularMeter;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label20: TLabel;
    pnlRPMSHAFTSPEED: TPanel;
    VrAngularMeter2: TVrAngularMeter;
    Label9: TLabel;
    Label10: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label19: TLabel;
    pnlCPPpersen: TPanel;
    VrAngularMeter3: TVrAngularMeter;
    Label15: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label21: TLabel;
    PanelSpedometer: TPanel;
    Image3: TImage;
    vraRudderServo: TVrAngularMeter;
    btnEmergency: TButton;
    pnlCPP: TPanel;
    Image51: TImage;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label32: TLabel;
    Label26: TLabel;
    Label33: TLabel;
    Label31: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    vrPsPump1: TVrRotarySwitch;
    vrSbPump1: TVrRotarySwitch;
    vrPsPump2: TVrRotarySwitch;
    vrSbPump2: TVrRotarySwitch;
    vrPsPump3: TVrRotarySwitch;
    vrSbPump3: TVrRotarySwitch;
    lblAlarmIndicator: TPanel;
    imgBackgroundAlarmIndicator: TImage;
    pnlartboard2: TPanel;
    Image5: TImage;
    pnlartboard3: TPanel;
    Image1: TImage;
    imgOP1: TImage;
    ImgOP2: TImage;
    ImgCFP2: TImage;
    ImgHLP1: TImage;
    ImgCFP1: TImage;
    ImgPFP1: TImage;
    ImgPFP2: TImage;
    ImgHLP2: TImage;
    ImgPowerFP1: TImage;
    ImgPowerFP2: TImage;
    ImgPFS: TImage;
    ImgPFC1: TImage;
    ImgPFC2: TImage;
    ImgLOLP1: TImage;
    ImgLOLP2: TImage;
    ImgST: TImage;
    ImgAuxdible: TImage;
    ImgStandbyPS1: TImage;
    ImgStartPS1: TImage;
    ImgStandbyPS2: TImage;
    ImgStartPS2: TImage;
    ImgStandbyPS3: TImage;
    ImgStartPS3: TImage;
    ImgStandbySB1: TImage;
    ImgStartSB1: TImage;
    ImgStandbySB2: TImage;
    ImgStartSB2: TImage;
    ImgStandbySB3: TImage;
    ImgStartSB3: TImage;
    ImgRP1: TImage;
    ImgRP2: TImage;
    ImgRP3: TImage;
    ImgRP4: TImage;
    ImgSTOP1: TImage;
    ImgSTOP2: TImage;
    ImgASP1: TImage;
    ImgASP2: TImage;
    ImgSTOP3: TImage;
    ImgSTOP4: TImage;
    ImgASP3: TImage;
    ImgASP4: TImage;
    imgSTShadow: TImage;
    imgps1: TImage;
    imgps2: TImage;
    imgps3: TImage;
    imgps4: TImage;
    imgps5: TImage;
    imgps6: TImage;
    imgps7: TImage;
    imgps8: TImage;
    imgps9: TImage;
    imgps10: TImage;
    imgps11: TImage;
    vrRotarySwitchPS: TVrRotarySwitch;
    procedure FormCreate(Sender: TObject);
    procedure imgSTShadowMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgSTShadowMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure vrPsPumpChange(Sender: TObject);
    procedure vrSbPumpChange(Sender: TObject);

  private
    FListener : TListeners;

    procedure MCRMachineLeftSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Integer);overload;
    procedure MCRMachineLeftSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Boolean);overload;

  public
    FAlarmIndicator : array[0..14] of Boolean;
    FPumpRudderIndicator : array[0..11] of Boolean;

    FTelegrapIndicator : array [1..11] of Boolean;
    FTempTelegrap : array [1..11] of Boolean;
    iterasi : array [1..11] of Integer;
    isI : array [1..11] of Boolean;
    FPsPump1 : array[0..2] of Boolean;
    FPsPump2 : array[0..2] of Boolean;
    FPsPump3 : array[0..2] of Boolean;
    FSbPump1 : array[0..2] of Boolean;
    FSbPump2 : array[0..2] of Boolean;
    FSbPump3 : array[0..2] of Boolean;

    procedure SetAlarmIndicator;
    procedure SetPumpRudderIndicator;

    procedure SetHidroulicPump;
    procedure SetTelegrap;
  end;

var
  MainForm: TMainForm;

implementation

uses
  uMCRMachineLeftSystem;

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
var
  i : Integer;

begin
  FListener := TListeners.Create;
  with MCRMachineLeftSystem.Listener.Add('MCRMACHINELEFT') as TPropertyEventListener do
  begin
    OnPropertyIntChange := MCRMachineLeftSystemEvent;
    OnPropertyBoolChange := MCRMachineLeftSystemEvent;
  end;

  {$REGION ' Set Alarm Indicator '}
  for I := 0 to 14 do
  begin
    FAlarmIndicator[i] := false;
  end;
  SetAlarmIndicator;
  {$ENDREGION}

  {$REGION ' Set Pump Rudder Indicator '}
  for I := 0 to 11 do
  begin
    if (i = 2) or (i = 5) or (i = 8) or (i = 11) then
      FPumpRudderIndicator[i] := true
    else
      FPumpRudderIndicator[i] := false;
  end;
  SetPumpRudderIndicator;
  {$ENDREGION}

  for i := 1 to 11 do
  begin
    FTelegrapIndicator[i] := false;
    FTempTelegrap[i] := false;
    isI[i] := False;
    iterasi[i] := 0;
  end;

  for i := 0 to 2 do
  begin
    FPsPump1[i] := false;
    FPsPump2[i] := false;
    FPsPump3[i] := false;
    FSbPump1[i] := false;
    FSbPump2[i] := false;
    FSbPump3[i] := false;
  end;
end;

procedure TMainForm.MCRMachineLeftSystemEvent(Sender: TObject; PropsID: E_PropsID; Value: Boolean);
begin

end;

procedure TMainForm.SetAlarmIndicator;
begin
  imgOP1.Visible        := FAlarmIndicator[0];
  ImgPFP1.Visible       := FAlarmIndicator[1];
  ImgPFS.Visible        := FAlarmIndicator[2];
  ImgLOLP1.Visible      := FAlarmIndicator[3];
  ImgLOLP2.Visible      := FAlarmIndicator[4];

  imgOP2.Visible        := FAlarmIndicator[5];
  ImgPFP2.Visible       := FAlarmIndicator[6];
  ImgPFC1.Visible       := FAlarmIndicator[7];

  ImgHLP1.Visible       := FAlarmIndicator[8];
  ImgHLP2.Visible       := FAlarmIndicator[9];
  ImgPFC2.Visible       := FAlarmIndicator[10];

  ImgCFP1.Visible       := FAlarmIndicator[11];
  ImgPowerFP1.Visible   := FAlarmIndicator[12];

  ImgCFP2.Visible       := FAlarmIndicator[13];
  ImgPowerFP2.Visible   := FAlarmIndicator[14];
end;

procedure TMainForm.SetHidroulicPump;
begin
  ImgStandbyPS1.Visible := FPsPump1[0];
  ImgStartPS1.Visible   := FPsPump1[2];

  ImgStandbyPS2.Visible := FPsPump2[0];
  ImgStartPS2.Visible   := FPsPump2[2];

  ImgStandbyPS3.Visible := FPsPump3[0];
  ImgStartPS3.Visible   := FPsPump3[2];

  ImgStandbySB1.Visible := FSbPump1[0];
  ImgStartSB1.Visible   := FSbPump1[2];

  ImgStandbySB2.Visible := FSbPump2[0];
  ImgStartSB2.Visible   := FSbPump2[2];

  ImgStandbySB3.Visible := FSbPump3[0];
  ImgStartSB3.Visible   := FSbPump3[2];
end;

procedure TMainForm.SetPumpRudderIndicator;
begin
  ImgRP1.Visible    := FPumpRudderIndicator[0];
  ImgSTOP1.Visible  := FPumpRudderIndicator[1];
  ImgASP1.Visible   := FPumpRudderIndicator[2];

  ImgRP2.Visible    := FPumpRudderIndicator[3];
  ImgSTOP2.Visible  := FPumpRudderIndicator[4];
  ImgASP2.Visible   := FPumpRudderIndicator[5];

  ImgRP3.Visible    := FPumpRudderIndicator[6];
  ImgSTOP3.Visible  := FPumpRudderIndicator[7];
  ImgASP3.Visible   := FPumpRudderIndicator[8];

  ImgRP4.Visible    := FPumpRudderIndicator[9];
  ImgSTOP4.Visible  := FPumpRudderIndicator[10];
  ImgASP4.Visible   := FPumpRudderIndicator[11];
end;

procedure TMainForm.SetTelegrap;
begin
  //
end;

procedure TMainForm.vrPsPumpChange(Sender: TObject);
begin
  case TVrRotarySwitch(Sender).Tag of
    1:
    begin
      FPsPump1[0] := vrPsPump1.SwitchPosition = 0;
      FPsPump1[1] := vrPsPump1.SwitchPosition = 1;
      FPsPump1[2] := vrPsPump1.SwitchPosition = 2;
    end;
    2:
    begin
      FPsPump2[0] := vrPsPump2.SwitchPosition = 0;
      FPsPump2[1] := vrPsPump2.SwitchPosition = 1;
      FPsPump2[2] := vrPsPump2.SwitchPosition = 2;
    end;
    3:
    begin
      FPsPump3[0] := vrPsPump3.SwitchPosition = 0;
      FPsPump3[1] := vrPsPump3.SwitchPosition = 1;
      FPsPump3[2] := vrPsPump3.SwitchPosition = 2;
    end;
  end;

  SetHidroulicPump;
end;

procedure TMainForm.vrSbPumpChange(Sender: TObject);
begin
  case TVrRotarySwitch(Sender).Tag of
    1:
    begin
      FSbPump1[0] := vrSbPump1.SwitchPosition = 0;
      FSbPump1[1] := vrSbPump1.SwitchPosition = 1;
      FSbPump1[2] := vrSbPump1.SwitchPosition = 2;
    end;
    2:
    begin
      FSbPump2[0] := vrSbPump2.SwitchPosition = 0;
      FSbPump2[1] := vrSbPump2.SwitchPosition = 1;
      FSbPump2[2] := vrSbPump2.SwitchPosition = 2;
    end;
    3:
    begin
      FSbPump3[0] := vrSbPump3.SwitchPosition = 0;
      FSbPump3[1] := vrSbPump3.SwitchPosition = 1;
      FSbPump3[2] := vrSbPump3.SwitchPosition = 2;
    end;
  end;

  SetHidroulicPump;
end;

procedure TMainForm.imgSTShadowMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ImgST.Visible         := True;
  imgOP1.Visible        := True;
  ImgPFP1.Visible       := True;
  ImgPFS.Visible        := True;
  ImgLOLP1.Visible      := True;
  ImgLOLP2.Visible      := True;

  imgOP2.Visible        := True;
  ImgPFP2.Visible       := True;
  ImgPFC1.Visible       := True;

  ImgHLP1.Visible       := True;
  ImgHLP2.Visible       := True;
  ImgPFC2.Visible       := True;

  ImgCFP1.Visible       := True;
  ImgPowerFP1.Visible   := True;

  ImgCFP2.Visible       := True;
  ImgPowerFP2.Visible   := True;
end;

procedure TMainForm.imgSTShadowMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ImgST.Visible := False;
  SetAlarmIndicator;
end;

procedure TMainForm.MCRMachineLeftSystemEvent(Sender: TObject; PropsID: E_PropsID; Value: Integer);
begin
  case PropsID of
    epPMSFreezed:
    begin
      if Value = 1 then
      begin
        MainForm.Enabled := False;
        MCRMachineLeftSystem.FFormFreezed[1] := TfrmFreeze.Create(MainForm);
        with MCRMachineLeftSystem.FFormFreezed[1] do
        begin
          Parent := MainForm;
          Position := poOwnerFormCenter;
          BringToFront;
          Show;
        end;
      end
      else if Value = 0 then
      begin
        MainForm.Enabled := True;
        if Assigned(MCRMachineLeftSystem.FFormFreezed[1]) then
          FreeAndNil(MCRMachineLeftSystem.FFormFreezed[1]);
      end;
    end;
    epRudderValuePS:
    begin
      vraRudderServo.Position := abs(Value);
    end;

    epRudderValueSB:
    begin

    end;

//    epPCSCtrlBackgroundLamp:
//      BackgroundLampIndicator(Value);
//
//    epPCSCtrlLamptTest:
//      LampTestIndicator(Value);
  end;
end;

end.
