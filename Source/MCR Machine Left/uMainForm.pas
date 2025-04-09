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
    RzBmpStandbyPS1: TRzBmpButton;
    RzBmpStartPS1: TRzBmpButton;
    RzBmpStanbySB1: TRzBmpButton;
    RzBmpStartSB1: TRzBmpButton;
    VrRotarySwitch2: TVrRotarySwitch;
    RzBmpStanbyPS2: TRzBmpButton;
    RzBmpStartPS2: TRzBmpButton;
    RzBmpStanbySB2: TRzBmpButton;
    RzBmpStartSB2: TRzBmpButton;
    VrRotarySwitch3: TVrRotarySwitch;
    VrRotarySwitch4: TVrRotarySwitch;
    RzBmpStanbyPS3: TRzBmpButton;
    RzBmpStartPS3: TRzBmpButton;
    RzBmpStanbySB3: TRzBmpButton;
    RzBmpStartSB3: TRzBmpButton;
    VrRotarySwitch5: TVrRotarySwitch;
    VrRotarySwitch6: TVrRotarySwitch;
    pnlartboard1: TPanel;
    Image2: TImage;
    RzBmpOP1: TRzBmpButton;
    RzBmpOP2: TRzBmpButton;
    RzBmpHLP1: TRzBmpButton;
    RzBmpCFP1: TRzBmpButton;
    RzBmpCFP2: TRzBmpButton;
    RzBmpPFP1: TRzBmpButton;
    RzBmpPFP2: TRzBmpButton;
    RzBmpHLP2: TRzBmpButton;
    RzBmpPowerFP1: TRzBmpButton;
    RzBmpPowerFP2: TRzBmpButton;
    RzBmpPFS: TRzBmpButton;
    RzBmpPFC1: TRzBmpButton;
    RzBmpPFC2: TRzBmpButton;
    RzBmpLOLP1: TRzBmpButton;
    RzBmpST: TRzBmpButton;
    RzBmpAuxdible: TRzBmpButton;
    RzBmpButton1: TRzBmpButton;
    RzBmpLOLP2: TRzBmpButton;
    pnlartboard2: TPanel;
    Image5: TImage;
    RzBmpRP1: TRzBmpButton;
    RzBmpRP2: TRzBmpButton;
    RzBmpSTOP2: TRzBmpButton;
    RzBmpSTOP1: TRzBmpButton;
    RzBmpASP2: TRzBmpButton;
    RzBmpASP1: TRzBmpButton;
    pnlartboard3: TPanel;
    Image1: TImage;
    RzBmpRP3: TRzBmpButton;
    RzBmpRP4: TRzBmpButton;
    RzBmpSTOP3: TRzBmpButton;
    RzBmpSTOP4: TRzBmpButton;
    RzBmpASN3: TRzBmpButton;
    RzBmpASN4: TRzBmpButton;
    Image4: TImage;
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
var
  i : Integer;

begin
    RzBmpOP1.Visible := not FAlarmIndicator[0];


//  for j := 1 to 11 do
//        begin
//          if FTelegrm[j] then
//            tempOut := j;
//
//          FTelegrm[j] := False;
//          FTempTelegrm[j] := False;
//        end;
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
