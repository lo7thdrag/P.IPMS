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
    VrAngularMeter4: TVrAngularMeter;
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
    VrRotarySwitch1: TVrRotarySwitch;
    VrRotarySwitch2: TVrRotarySwitch;
    VrRotarySwitch3: TVrRotarySwitch;
    VrRotarySwitch4: TVrRotarySwitch;
    VrRotarySwitch5: TVrRotarySwitch;
    VrRotarySwitch6: TVrRotarySwitch;
    pnlartboard1: TPanel;
    Image2: TImage;
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
    procedure FormCreate(Sender: TObject);

  private
    FListener : TListeners;

    procedure MCRMachineLeftSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Integer);overload;
    procedure MCRMachineLeftSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Boolean);overload;

  public
    FAlarmIndicator : array[0..14] of Boolean;
    FTelegrapIndicator : array [1..11] of Boolean;
    FTempTelegrap : array [1..11] of Boolean;
    iterasi : array [1..11] of Integer;
    isI : array [1..11] of Boolean;
    FPsPump1 : array[1..3] of Boolean;
    FPsPump2 : array[1..3] of Boolean;
    FPsPump3 : array[1..3] of Boolean;
    FSbPump1 : array[1..3] of Boolean;
    FSbPump2 : array[1..3] of Boolean;
    FSbPump3 : array[1..3] of Boolean;

    procedure SetAlarmIndicator;
    procedure SetHidroulicPump;
    procedure SetPumpIndicator;
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

  for I := 0 to 14 do
  begin
    FAlarmIndicator[i] := false;
  end;

  for i := 1 to 11 do
  begin
    FTelegrapIndicator[i] := false;
    FTempTelegrap[i] := false;
    isI[i] := False;
    iterasi[i] := 0;
  end;

  for i := 1 to 3 do
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
    imgOP1.Visible        := not FAlarmIndicator[0];
    ImgPFP1.Visible       := not FAlarmIndicator[1];
    ImgPFS.Visible        := not FAlarmIndicator[2];
    ImgLOLP1.Visible      := not FAlarmIndicator[3];
    ImgLOLP2.Visible      := not FAlarmIndicator[4];
    ImgST.Visible         := not FAlarmIndicator[5];
    imgOP2.Visible        := not FAlarmIndicator[6];
    ImgPFP2.Visible       := not FAlarmIndicator[7];
    ImgPFC1.Visible       := not FAlarmIndicator[8];
    ImgHLP1.Visible       := not FAlarmIndicator[9];
    ImgHLP2.Visible       := not FAlarmIndicator[10];
    ImgPFC2.Visible       := not FAlarmIndicator[11];
    ImgCFP1.Visible       := not FAlarmIndicator[12];
    ImgPowerFP1.Visible   := not FAlarmIndicator[13];
    ImgAuxdible.Visible   := not FAlarmIndicator[14];
    ImgCFP2.Visible       := not FAlarmIndicator[15];
    ImgPowerFP2.Visible   := not FAlarmIndicator[16];
end;

procedure TMainForm.SetHidroulicPump;
begin
    ImgStandbyPS1.Visible := not FAlarmIndicator[0];
    ImgStandbyPS2.Visible := not FAlarmIndicator[1];
    ImgStandbyPS3.Visible := not FAlarmIndicator[2];
    ImgStartPS1.Visible   := not FAlarmIndicator[3];
    ImgStartPS2.Visible   := not FAlarmIndicator[4];
    ImgStartPS3.Visible   := not FAlarmIndicator[5];
    ImgStandbySB1.Visible := not FAlarmIndicator[6];
    ImgStandbySB2.Visible := not FAlarmIndicator[7];
    ImgStandbySB3.Visible := not FAlarmIndicator[8];
    ImgStartSB1.Visible   := not FAlarmIndicator[9];
    ImgStartSB2.Visible   := not FAlarmIndicator[10];
    ImgStartSB3.Visible   := not FAlarmIndicator[11];
end;

procedure TMainForm.SetPumpIndicator;
begin
    ImgRP1.Visible    := not FAlarmIndicator[0];
    ImgSTOP1.Visible  := not FAlarmIndicator[1];
    ImgASP1.Visible   := not FAlarmIndicator[2];
    ImgRP2.Visible    := not FAlarmIndicator[3];
    ImgSTOP2.Visible  := not FAlarmIndicator[4];
    ImgASP2.Visible   := not FAlarmIndicator[5];
    ImgRP3.Visible    := not FAlarmIndicator[6];
    ImgSTOP3.Visible  := not FAlarmIndicator[7];
    ImgASP3.Visible   := not FAlarmIndicator[8];
    ImgRP4.Visible    := not FAlarmIndicator[9];
    ImgSTOP4.Visible  := not FAlarmIndicator[10];
    ImgASP4.Visible   := not FAlarmIndicator[11];
end;

procedure TMainForm.SetTelegrap;
begin
  //
end;

procedure TMainForm.MCRMachineLeftSystemEvent(Sender: TObject; PropsID: E_PropsID; Value: Integer);
begin
  case PropsID of
    epPMSFreezed:
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

//    epPCSCtrlBackgroundLamp:
//      BackgroundLampIndicator(Value);
//
//    epPCSCtrlLamptTest:
//      LampTestIndicator(Value);
  end;
end;

end.
