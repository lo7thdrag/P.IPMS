unit uPMSSystemPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uDataType, uGenerator, uSwitchboard, ComCtrls,
  VrControls, VrButtons;

type
  TfrmPMSSystemPanel = class(TForm)
    btnabc: TButton;
    Edit1: TEdit;
    Button1: TButton;
    GroupBox1: TGroupBox;
    grp3: TGroupBox;
    lbl26: TLabel;
    lbl3: TLabel;
    lblEngineRunGen3: TLabel;
    lblGeneratorSuppliedGen3: TLabel;
    lblPrefGen3: TLabel;
    btnStartGen3: TButton;
    btnStopGen3: TButton;
    btnPrefGen3: TButton;
    lbl13: TLabel;
    rbManGen3: TRadioButton;
    rbSemGen3: TRadioButton;
    rbAutGen3: TRadioButton;
    Label1: TLabel;
    lblBusbarGen3: TLabel;
    Label3: TLabel;
    grp9: TGroupBox;
    lblCBOpenInn2: TLabel;
    lblCBCloseInn2: TLabel;
    btnCBOpenInn2: TButton;
    btnCBCloseInn2: TButton;
    grp1: TGroupBox;
    lblCBOpenShore: TLabel;
    lblCBCloseShore: TLabel;
    btnCBOpenShore: TButton;
    btnCBCloseShore: TButton;
    grp2: TGroupBox;
    lbl34: TLabel;
    lbl37: TLabel;
    lbl38: TLabel;
    lblEngineRunGen1: TLabel;
    lblGeneratorSuppliedGen1: TLabel;
    lblPrefGen1: TLabel;
    lblBusbarGen1: TLabel;
    btnStartGen1: TButton;
    btnStopGen1: TButton;
    btnPrefGen1: TButton;
    grp13: TGroupBox;
    lbl44: TLabel;
    lbl47: TLabel;
    lbl48: TLabel;
    lblEngineRunGen2: TLabel;
    lblGeneratorSuppliedGen2: TLabel;
    lblPrefGen2: TLabel;
    lblBusbarGen2: TLabel;
    btnStartGen2: TButton;
    btnStopGen2: TButton;
    btnPrefGen2: TButton;
    grp17: TGroupBox;
    lblCBOpenInn1: TLabel;
    lblCBCloseInn1: TLabel;
    grp7: TGroupBox;
    lbl15: TLabel;
    lbl18: TLabel;
    lbl19: TLabel;
    lblEngineRunGen4: TLabel;
    lblGeneratorSuppliedGen4: TLabel;
    lblPrefGen4: TLabel;
    lblBusbarGen4: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btnStartGen4: TButton;
    btnStopGen4: TButton;
    btnPrefGen4: TButton;
    rbManGen4: TRadioButton;
    rbSemGen4: TRadioButton;
    rbAutGen4: TRadioButton;
    trckbrBebanAft: TTrackBar;
    trckbrBebanFwd: TTrackBar;
    rbManGen1: TRadioButton;
    rbSemGen1: TRadioButton;
    rbAutGen1: TRadioButton;
    rbManGen2: TRadioButton;
    rbSemGen2: TRadioButton;
    rbAutGen2: TRadioButton;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    rbManGenE: TRadioButton;
    rbSemGenE: TRadioButton;
    rbAutGenE: TRadioButton;
    lblEngineRunGenE: TLabel;
    lbl10: TLabel;
    lblGeneratorSuppliedGenE: TLabel;
    lblBusbarGenE: TLabel;
    lbl66: TLabel;
    btnStartGenE: TButton;
    btnStopGenE: TButton;
    grp19: TGroupBox;
    rbAftDistrE: TRadioButton;
    rbOffDistrE: TRadioButton;
    rbFwdDistrE: TRadioButton;
    lblCBOpenClosedE: TLabel;
    btnCBOpenClosedEmergency: TButton;
    Label17: TLabel;
    Label18: TLabel;
    btnCBClosedGen1: TVrDemoButton;
    rbManInn1: TRadioButton;
    rbOffInn1: TRadioButton;
    rbAutInn1: TRadioButton;
    Label20: TLabel;
    Label22: TLabel;
    rbManInn2: TRadioButton;
    rbOffInn2: TRadioButton;
    rbAutInn2: TRadioButton;
    Label23: TLabel;
    Label24: TLabel;
    btnCBClosedGen2: TVrDemoButton;
    btnCBClosedGenE: TVrDemoButton;
    btnCBClosedGen3: TVrDemoButton;
    btnCBClosedGen4: TVrDemoButton;
    Label2: TLabel;
    Label7: TLabel;
    btnCBOpenInn1: TButton;
    btnCBCloseInn1: TButton;
    Label13: TLabel;
    Label16: TLabel;
    rbAutShore: TRadioButton;
    rbOffShore: TRadioButton;
    rbManShore: TRadioButton;
    Label27: TLabel;
    Label28: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    btnApply: TButton;
    lblBesarbeban: TLabel;
    lblBesarbebann: TLabel;
    lblBeban2: TLabel;
    lblBeban2n: TLabel;
    lblBeban1: TLabel;
    lblBeban1n: TLabel;
    lblEmergencyStop1: TLabel;
    lblEmergencyStop2: TLabel;
    lblEmergencyStop3: TLabel;
    lblEmergencyStop4: TLabel;
    lblEmergencyStop5: TLabel;
    Label26: TLabel;
    Label32: TLabel;
    Label6: TLabel;
    Label12: TLabel;
    Label15: TLabel;
    Label19: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label8: TLabel;
    Label21: TLabel;
    Label25: TLabel;
    Label29: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;

    procedure Gen1ModeClick(Sender: TObject);
    procedure Gen2ModeClick(Sender: TObject);
    procedure Gen3ModeClick(Sender: TObject);
    procedure Gen4ModeClick(Sender: TObject);
    procedure GenEModeClick(Sender: TObject);

    procedure InterCon1ModeClick(Sender: TObject);
    procedure InterCon2ModeClick(Sender: TObject);
    procedure InterShoreModeClick(Sender: TObject);
    procedure InterEmergencyModeClick(Sender: TObject);

    procedure btnStartClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure btnCBClosedClick(Sender: TObject);
    procedure btnPrefClick(Sender: TObject);

    procedure btnInnCBCloseOpenClick(Sender: TObject);

    procedure FormCreate(Sender: TObject);
    procedure trckbrBebanChange(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);

    procedure emergency(Sender: TObject);

  private
    FwdPosition, AftPosition : Integer;
    PwrFlagMode : Integer;

    procedure EnginePropertyIntChange(Sender : TObject; PropsID : E_PropsID;Value : Integer);overload;
    procedure EnginePropertyBoolChange(Sender : TObject; PropsID : E_PropsID;Value : Boolean);overload;
    procedure EnginePropertyDouChange(Sender : TObject; PropsID : E_PropsID;Value : Double);overload;

    procedure SetValueBool(KonObj, IdObj : Integer; value : Boolean; PropsID : E_PropsID);
    procedure SetValueInt(KonObj, IdObj, value  : Integer; PropsID : E_PropsID);
    procedure SetPowerConnection(val1, val2 : Integer);

    function tovalidatebtn(val : string): Boolean;
    function toLblWarna(val : boolean): Integer;
    function toBtnWarna(val : boolean): Integer;
    function toCheck(val1, val2 : Integer): boolean;
    function toCheckCB(IdGen, IdMsb : Integer): boolean;


  public

  end;

var
  generator : TGenerator;
  switchboard : TSwitchboard;
  power : TPower;
  frmPMSSystemPanel : TfrmPMSSystemPanel;

implementation

uses uERSystem, uPMSSystem;

const
  C_GENERATOR = 1;
  C_SWITCHBOARD = 2;
{$R *.dfm}

procedure TfrmPMSSystemPanel.FormCreate(Sender: TObject);
begin
  ERSystem.ERManager.EngineRoom.getPMSSystem.addEntityListener('PMS Panel',EnginePropertyBoolChange);
  ERSystem.ERManager.EngineRoom.getPMSSystem.addEntityListener('PMS Panel',EnginePropertyIntChange);
  ERSystem.ERManager.EngineRoom.getPMSSystem.addEntityListener('PMS Panel',EnginePropertyDouChange);
end;

{----------Generator Panel----------}
procedure TfrmPMSSystemPanel.Gen1ModeClick(Sender: TObject);
begin
  {GenMode Circuit Breaker 1: Manual; 2: SemiAuto(manual); 3: Auto; 4: SemiAuto(auto);}
  if rbManGen1.Checked = true then
  begin
    SetValueInt(C_GENERATOR, 0, 1, epPMSGeneratorMode);
    btnPrefGen1.Enabled := False;
  end
  else if rbSemGen1.Checked = true then
  begin
    SetValueInt(C_GENERATOR, 0, 2, epPMSGeneratorMode);
    btnPrefGen1.Enabled := False;
  end
  else if rbAutGen1.Checked = true then
  begin
    SetValueInt(C_GENERATOR, 0, 3, epPMSGeneratorMode);
    btnPrefGen1.Enabled := True;
  end;
end;

procedure TfrmPMSSystemPanel.Gen2ModeClick(Sender: TObject);
begin
  if rbManGen2.Checked = true then
  begin
    SetValueInt(C_GENERATOR, 1, 1, epPMSGeneratorMode);
    btnPrefGen2.Enabled := False;
  end
  else if rbSemGen2.Checked = true then
  begin
    SetValueInt(C_GENERATOR, 1, 2, epPMSGeneratorMode);
    btnPrefGen2.Enabled := False;
  end
  else if rbAutGen2.Checked = true then
  begin
    SetValueInt(C_GENERATOR, 1, 3, epPMSGeneratorMode);
    btnPrefGen2.Enabled := True;
  end;
end;

procedure TfrmPMSSystemPanel.Gen3ModeClick(Sender: TObject);
begin
  if rbManGen3.Checked = true then
  begin
    SetValueInt(C_GENERATOR, 2, 1, epPMSGeneratorMode);
    btnPrefGen3.Enabled := False;
  end
  else if rbSemGen3.Checked = true then
  begin
    SetValueInt(C_GENERATOR, 2, 2, epPMSGeneratorMode);
    btnPrefGen3.Enabled := False;
  end
  else if rbAutGen3.Checked = true then
  begin
    SetValueInt(C_GENERATOR, 2, 3, epPMSGeneratorMode);
    btnPrefGen3.Enabled := True;
  end;
end;

procedure TfrmPMSSystemPanel.Gen4ModeClick(Sender: TObject);
begin
  if rbManGen4.Checked = true then
  begin
    SetValueInt(C_GENERATOR, 3, 1, epPMSGeneratorMode);
    btnPrefGen4.Enabled := False;
  end
  else if rbSemGen4.Checked = true then
  begin
    SetValueInt(C_GENERATOR, 3, 2, epPMSGeneratorMode);
    btnPrefGen4.Enabled := False;
  end
  else if rbAutGen4.Checked = true then
  begin
    SetValueInt(C_GENERATOR, 3, 3, epPMSGeneratorMode);
    btnPrefGen4.Enabled := True;
  end;
end;

procedure TfrmPMSSystemPanel.GenEModeClick(Sender: TObject);
begin
  if rbManGenE.Checked = true then
  begin
    SetValueInt(C_GENERATOR, 4, 1, epPMSGeneratorMode);
  end
  else if rbSemGenE.Checked = true then
  begin
    SetValueInt(C_GENERATOR, 4, 2, epPMSGeneratorMode);
  end
  else if rbAutGenE.Checked = true then
  begin
    SetValueInt(C_GENERATOR, 4, 3, epPMSGeneratorMode);
  end;
end;

procedure TfrmPMSSystemPanel.btnStartClick(Sender: TObject);
begin
  if Sender is TButton then
  begin
    if not (tovalidatebtn(TButton(Sender).Name)) then
      exit;

    if TButton(Sender).Name = 'btnStartGen1' then
      SetValueBool(C_GENERATOR, 0, True, epPMSGeneratorEngineRun)
    else if TButton(Sender).Name = 'btnStartGen2' then
      SetValueBool(C_GENERATOR, 1, True, epPMSGeneratorEngineRun)
    else if TButton(Sender).Name = 'btnStartGen3' then
      SetValueBool(C_GENERATOR, 2, True, epPMSGeneratorEngineRun)
    else if TButton(Sender).Name = 'btnStartGen4' then
      SetValueBool(C_GENERATOR, 3, True, epPMSGeneratorEngineRun)
    else if TButton(Sender).Name = 'btnStartGenE' then
      SetValueBool(C_GENERATOR, 4, True, epPMSGeneratorEngineRun)
  end;
end;

procedure TfrmPMSSystemPanel.btnStopClick(Sender: TObject);
begin
  if Sender is TButton then
  begin
    if not (tovalidatebtn(TButton(Sender).Name)) then
      exit;

    if TButton(Sender).Name = 'btnStopGen1' then
      SetValueBool(C_GENERATOR, 0, False, epPMSGeneratorStop)
    else if TButton(Sender).Name = 'btnStopGen2' then
      SetValueBool(C_GENERATOR, 1, False, epPMSGeneratorStop)
    else if TButton(Sender).Name = 'btnStopGen3' then
      SetValueBool(C_GENERATOR, 2, False, epPMSGeneratorStop)
    else if TButton(Sender).Name = 'btnStopGen4' then
      SetValueBool(C_GENERATOR, 3, False, epPMSGeneratorStop)
    else if TButton(Sender).Name = 'btnStopGenE' then
      SetValueBool(C_GENERATOR, 4, False, epPMSGeneratorStop)
  end;
end;

procedure TfrmPMSSystemPanel.emergency(Sender: TObject);
begin
  generator := ERSystem.ERManager.EngineRoom.getPMSSystem.getGenerator(C_GENERATOR_ID[StrToInt(Edit1.Text)]);

  if TButton(Sender).Caption = 'True' then
    generator.EmergencyStop := True
  else if TButton(Sender).Caption = 'False' then
    generator.EmergencyStop := False

end;

procedure TfrmPMSSystemPanel.btnCBClosedClick(Sender: TObject);
begin
  if not (tovalidatebtn(TButton(Sender).Name)) then
      exit;

  if TButton(Sender).Name = 'btnCBClosedGen1' then
    SetValueBool(C_GENERATOR, 0, False, epPMSGeneratorCBClosed)
  else if TButton(Sender).Name = 'btnCBClosedGen2' then
    SetValueBool(C_GENERATOR, 1, False, epPMSGeneratorCBClosed)
  else if TButton(Sender).Name = 'btnCBClosedGen3' then
    SetValueBool(C_GENERATOR, 2, False, epPMSGeneratorCBClosed)
  else if TButton(Sender).Name = 'btnCBClosedGen4' then
    SetValueBool(C_GENERATOR, 3, False, epPMSGeneratorCBClosed)
  else if TButton(Sender).Name = 'btnCBClosedGenE' then
    SetValueBool(C_GENERATOR, 4, False, epPMSGeneratorCBClosed)
end;

procedure TfrmPMSSystemPanel.btnPrefClick(Sender: TObject);
begin
  if Sender is TButton then
  begin
    if not (tovalidatebtn(TButton(Sender).Name)) then
      exit;

    if TButton(Sender).Name = 'btnPrefGen1' then
      SetValueBool(C_GENERATOR, 0, False, epPMSGeneratorPreference)
    else if TButton(Sender).Name = 'btnPrefGen2' then
      SetValueBool(C_GENERATOR, 1, False, epPMSGeneratorPreference)
    else if TButton(Sender).Name = 'btnPrefGen3' then
      SetValueBool(C_GENERATOR, 2, False, epPMSGeneratorPreference)
    else if TButton(Sender).Name = 'btnPrefGen4' then
      SetValueBool(C_GENERATOR, 3, False, epPMSGeneratorPreference)
    else
      SetValueBool(C_GENERATOR, 4, False, epPMSGeneratorPreference);
  end;
end;

{----------Switchboard Panel----------}

procedure TfrmPMSSystemPanel.InterCon1ModeClick(Sender: TObject);
begin
  if Sender is TRadioButton then
  begin
    {C_SWITCHBOARD: Objk Switchboard; 0:Fwd; value: Mode Switchboard; epPMSMsbIntrMode: ProsID}
    if TRadioButton(Sender).Name = 'rbManInn1' then
      SetValueInt(C_SWITCHBOARD, 0, 1, epPMSMsbIntrMode)
    else if TRadioButton(Sender).Name = 'rbOffInn1' then
      SetValueInt(C_SWITCHBOARD, 0, 2, epPMSMsbIntrMode)
    else if TRadioButton(Sender).Name = 'rbAutInn1' then
      SetValueInt(C_SWITCHBOARD, 0, 3, epPMSMsbIntrMode)
  end;
end;

procedure TfrmPMSSystemPanel.InterCon2ModeClick(Sender: TObject);
begin
  if Sender is TRadioButton then
  begin
    {C_SWITCHBOARD: Objk Switchboard; 1:Aft; value: Mode Switchboard; epPMSMsbIntrMode: ProsID}
    if TRadioButton(Sender).Name = 'rbManInn2' then
      SetValueInt(C_SWITCHBOARD, 1, 1, epPMSMsbIntrMode)
    else if TRadioButton(Sender).Name = 'rbOffInn2' then
      SetValueInt(C_SWITCHBOARD, 1, 2, epPMSMsbIntrMode)
    else if TRadioButton(Sender).Name = 'rbAutInn2' then
      SetValueInt(C_SWITCHBOARD, 1, 3, epPMSMsbIntrMode)
  end;
end;

procedure TfrmPMSSystemPanel.InterShoreModeClick(Sender: TObject);
begin
  if Sender is TRadioButton then
  begin
    {C_SWITCHBOARD: Objk Switchboard; 1:Aft; value: Mode Switchboard; epPMSMsbShoreMode: ProsID}
    if TRadioButton(Sender).Name = 'rbManShore' then
      SetValueInt(C_SWITCHBOARD, 1, 1, epPMSMsbShoreMode)
    else if TRadioButton(Sender).Name = 'rbOffShore' then
      SetValueInt(C_SWITCHBOARD, 1, 2, epPMSMsbShoreMode)
    else if TRadioButton(Sender).Name = 'rbAutShore' then
      SetValueInt(C_SWITCHBOARD, 1, 3, epPMSMsbShoreMode)
  end;
end;

procedure TfrmPMSSystemPanel.InterEmergencyModeClick(Sender: TObject);
begin
  if Sender is TRadioButton then
  begin
    {C_SWITCHBOARD: Objk Switchboard; 2:Esb; value: Mode Switchboard; epPMSEsbIntrMode: ProsID}
    if TRadioButton(Sender).Name = 'rbAftDistrE' then
      SetValueInt(C_SWITCHBOARD, 2, 1, epPMSEsbIntrMode)
    else if TRadioButton(Sender).Name = 'rbOffDistrE' then
      SetValueInt(C_SWITCHBOARD, 2, 2, epPMSEsbIntrMode)
    else if TRadioButton(Sender).Name = 'rbFwdDistrE' then
      SetValueInt(C_SWITCHBOARD, 2, 3, epPMSEsbIntrMode)
  end;
end;

procedure TfrmPMSSystemPanel.btnInnCBCloseOpenClick(Sender: TObject);
begin
  if Sender is TButton then
  begin
    {C_SWITCHBOARD: Objk Switchboard; 0/1/2:fwd/aft/Esb; value: Mode Switchboard; epPMSEsbIntrMode: ProsID}

    if TButton(Sender).Name = 'btnCBOpenInn1' then
      SetValueBool(C_SWITCHBOARD, 0, False, epPMSMsbCBIntr)
    else if TButton(Sender).Name = 'btnCBCloseInn1' then
      SetValueBool(C_SWITCHBOARD, 0, True, epPMSMsbCBIntr)
    else if TButton(Sender).Name = 'btnCBOpenInn2' then
      SetValueBool(C_SWITCHBOARD, 1, False, epPMSMsbCBIntr)

    else if TButton(Sender).Name = 'btnCBCloseInn2' then
      SetValueBool(C_SWITCHBOARD, 1, True, epPMSMsbCBIntr)
    else if TButton(Sender).Name = 'btnCBOpenShore' then
      SetValueBool(C_SWITCHBOARD, 1, False, epPMSMsbCBShore)
    else if TButton(Sender).Name = 'btnCBCloseShore' then
      SetValueBool(C_SWITCHBOARD, 1, True, epPMSMsbCBShore)
    else if TButton(Sender).Name = 'btnCBOpenClosedEmergency' then
      SetValueBool(C_SWITCHBOARD, 2, False, epPMSEsbCBIntr)
  end;
end;

procedure TfrmPMSSystemPanel.SetPowerConnection(val1, val2: Integer);
begin
  if (val1 = clLime) and (val2 = clLime) then
  begin
    PwrFlagMode := 1;
    lblBesarbeban.Visible := True;
    lblBesarbebann.Visible := True;
    lblBeban1.Visible := False;
    lblBeban2.Visible := False;
    lblBeban1n.Visible := False;
    lblBeban2n.Visible := False;
  end
  else
  begin
    PwrFlagMode := 0;
    lblBesarbeban.Visible := False;
    lblBesarbebann.Visible := False;
    lblBeban1.Visible := True;
    lblBeban2.Visible := True;
    lblBeban1n.Visible := True;
    lblBeban2n.Visible := True;
  end;
end;

procedure TfrmPMSSystemPanel.SetValueBool(KonObj, IdObj : Integer; value : Boolean; PropsID : E_PropsID);
begin
  if KonObj = C_GENERATOR then
  begin
    generator := ERSystem.ERManager.EngineRoom.getPMSSystem.getGenerator(C_GENERATOR_ID[IdObj]);

    if generator.NotStandby or generator.FuelRunsOut then
      Exit;

    if (generator.EmergencyStop or generator.ShutDown) and (PropsID <> epPMSGeneratorCBClosed)then
      exit;

    case PropsID of
      epPMSGeneratorEngineRun:
      begin
        if (generator.GeneratorMode = 3) then
          exit;

        if generator.GeneratorState = 1 then
          generator.EngineRun := value;

      end;
      epPMSGeneratorStop:
      begin
        if (generator.GeneratorMode = 3) or (generator.Preference) or (generator.GeneratorState <> 5) then
          exit;

        if (generator.GeneratorMode = 2) then
          generator.CBClosed := False;

        {utk mematikan generator state dirubah ke cool down dulu}
        generator.GeneratorState := 6;

      end;
      epPMSGeneratorCBClosed:
      begin
        if (generator.GeneratorMode = 3) or (generator.FailureCBClosed) then
          exit;

        if generator.CbClosed then
          generator.CbClosed := False
        else
        begin
          if toCheckCB(IdObj, 0)then
            generator.FailureCBClosed := True
          else
            generator.CbClosed := True;
        end;

      end;
      epPMSGeneratorPreference:
      begin
        if generator.Preference then
          generator.Preference  := False
        else
        begin
          if (generator.GeneratorState = 1) or (generator.GeneratorState = 5) then
          begin
            if (generator.GeneratorMode = 3) then
              generator.EngineRun := True;
            generator.Preference  := True;
          end;
        end;
      end;
    end;
  end
  else if KonObj = C_SWITCHBOARD then
  begin
    switchboard := ERSystem.ERManager.EngineRoom.getPMSSystem.getSwitchboard(C_SWITCHBOARD_ID[IdObj]);
    case PropsID of
      epPMSMsbCBShore: switchboard.MsbCBShore  := value;
      epPMSMsbCBIntr: switchboard.MsbCBIntr  := value;
//      begin
////        switchboard.Busbar := value;
//      end;
      epPMSEsbCBIntr:
      begin
        if (rbFwdDistrE.Checked)then
        begin
          if switchboard.EsbCBIntr and (switchboard.ESBIntrMode = 1) then
            switchboard.EsbCBIntr  := False
          else
          begin
            switchboard.EsbCBIntr  := False;
            switchboard.ESBIntrMode := 3;
            switchboard.EsbCBIntr   := True;
          end;
        end
        else if (rbAftDistrE.Checked)then
        begin
          if switchboard.EsbCBIntr and (switchboard.ESBIntrMode = 3) then
            switchboard.EsbCBIntr  := False
          else
          begin
            switchboard.EsbCBIntr  := False;
            switchboard.ESBIntrMode := 1;
            switchboard.EsbCBIntr   := True;
          end;
        end
      end;
    end;
  end;
end;

procedure TfrmPMSSystemPanel.SetValueInt(KonObj, IdObj, value: Integer; PropsID: E_PropsID);
begin
  if KonObj = C_GENERATOR then
  begin
    generator := ERSystem.ERManager.EngineRoom.getPMSSystem.getGenerator(C_GENERATOR_ID[IdObj]);
    if generator.NotStandby then
      Exit;
    case PropsID of
      epPMSGeneratorMode :
      begin
        generator.GeneratorMode := value;
        if not generator.EngineRun then
        begin
          generator.GeneratorState := 1;{waiting}
        end;
      end;
    end;
  end
  else if KonObj = C_SWITCHBOARD then
  begin
    switchboard := ERSystem.ERManager.EngineRoom.getPMSSystem.getSwitchboard(C_SWITCHBOARD_ID[IdObj]);
    case PropsID of
      epPMSMsbIntrMode:
      begin
        switchboard.MSBIntrMode := value;
      end;
      epPMSMsbShoreMode:
      begin
        switchboard.ShoreIntrMode := value;
      end;
      epPMSEsbIntrMode:
      begin
        if (rbOffDistrE.Checked)then
        begin
          switchboard.EsbCBIntr  := False;
          switchboard.ESBIntrMode := 2;
        end
      end;
    end;
  end;
end;

procedure TfrmPMSSystemPanel.EnginePropertyIntChange(Sender: TObject;
  PropsID: E_PropsID; Value: Integer);
begin
  if Sender is TGenerator then
  begin
    case PropsID of
      epPMSGeneratorMode :
      begin
        if Value = 4 then
          value := 2;

        if TGenerator(Sender).Identifier = C_GENERATOR_ID[0] then
        begin
          rbManGen1.Checked := toCheck(1, Value);
          rbSemGen1.Checked := toCheck(2, Value);
          rbAutGen1.Checked := toCheck(3, Value);
        end
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[1] then
        begin
          rbManGen2.Checked := toCheck(1, Value);
          rbSemGen2.Checked := toCheck(2, Value);
          rbAutGen2.Checked := toCheck(3, Value);
        end
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[2] then
        begin
          rbManGen3.Checked := toCheck(1, Value);
          rbSemGen3.Checked := toCheck(2, Value);
          rbAutGen3.Checked := toCheck(3, Value);
        end
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[3] then
        begin
          rbManGen4.Checked := toCheck(1, Value);
          rbSemGen4.Checked := toCheck(2, Value);
          rbAutGen4.Checked := toCheck(3, Value);
        end
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[4] then
        begin
          rbManGenE.Checked := toCheck(1, Value);
          rbSemGenE.Checked := toCheck(2, Value);
          rbAutGenE.Checked := toCheck(3, Value);
        end;
      end;
    end;
  end
  else if Sender is TSwitchboard then
  begin
    case PropsID of
      epPMSMsbIntrMode :
      begin
        if TSwitchboard(Sender).Identifier = C_SWITCHBOARD_ID[0] then
        begin
          rbManInn1.Checked := toCheck(1, Value);
          rbOffInn1.Checked := toCheck(2, Value);
          rbAutInn1.Checked := toCheck(3, Value);
          if value = 2  then
          begin
            lblCBOpenInn1.Color := toLblWarna(False);
            lblCBCloseInn1.Color := toLblWarna(False)
          end;
        end
        else if TSwitchboard(Sender).Identifier = C_SWITCHBOARD_ID[1] then
        begin
          rbManInn2.Checked := toCheck(1, Value);
          rbOffInn2.Checked := toCheck(2, Value);
          rbAutInn2.Checked := toCheck(3, Value);
          if value = 2  then
          begin
            lblCBOpenInn2.Color := toLblWarna(False);
            lblCBCloseInn2.Color := toLblWarna(False)
          end;
        end;
      end;
      epPMSMsbShoreMode :
      begin
        if TSwitchboard(Sender).Identifier = C_SWITCHBOARD_ID[1] then
        begin
          rbManShore.Checked := toCheck(1, Value);
          rbOffShore.Checked := toCheck(2, Value);
          rbAutShore.Checked := toCheck(3, Value);
          if value = 2  then
          begin
            lblCBOpenShore.Color := toLblWarna(False);
            lblCBCloseShore.Color := toLblWarna(False)
          end;
        end;
      end;
      epPMSEsbIntrMode :
      begin
        if TSwitchboard(Sender).Identifier = C_SWITCHBOARD_ID[2] then
        begin
          rbAftDistrE.Checked := toCheck(1, Value);
          rbOffDistrE.Checked := toCheck(2, Value);
          rbFwdDistrE.Checked := toCheck(3, Value);
        end;
      end;
    end;
  end
end;

procedure TfrmPMSSystemPanel.EnginePropertyBoolChange(Sender: TObject;
  PropsID: E_PropsID; Value: Boolean);
begin
  if Sender is TGenerator then
  begin
    case PropsID of
      epPMSGeneratorEngineRun:
      begin
        if TGenerator(Sender).Identifier = C_GENERATOR_ID[0] then
          lblEngineRunGen1.Color := toLblWarna(Value)
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[1] then
          lblEngineRunGen2.Color := toLblWarna(Value)
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[2] then
          lblEngineRunGen3.Color := toLblWarna(Value)
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[3] then
          lblEngineRunGen4.Color := toLblWarna(Value)
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[4] then
          lblEngineRunGene.Color := toLblWarna(Value);
      end;

      epPMSGeneratorSupplied :
      begin
        if TGenerator(Sender).Identifier = C_GENERATOR_ID[0] then
          lblGeneratorSuppliedGen1.Color := toLblWarna(Value)
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[1] then
          lblGeneratorSuppliedGen2.Color := toLblWarna(Value)
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[2] then
          lblGeneratorSuppliedGen3.Color := toLblWarna(Value)
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[3] then
          lblGeneratorSuppliedGen4.Color := toLblWarna(Value)
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[4] then
          lblGeneratorSuppliedGene.Color := toLblWarna(Value);
      end;

      epPMSGeneratorCBClosed :
      begin
        if TGenerator(Sender).Identifier = C_GENERATOR_ID[0] then
          btnCBClosedGen1.Color := toBtnWarna(Value)
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[1] then
          btnCBClosedGen2.Color := toBtnWarna(Value)
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[2] then
          btnCBClosedGen3.Color := toBtnWarna(Value)
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[3] then
          btnCBClosedGen4.Color := toBtnWarna(Value)
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[4] then
          btnCBClosedGenE.Color := toBtnWarna(Value);
      end;

      epPMSGeneratorPreference :
      begin
        if TGenerator(Sender).Identifier = C_GENERATOR_ID[0] then
          lblPrefGen1.Color := toLblWarna(Value)
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[1] then
          lblPrefGen2.Color := toLblWarna(Value)
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[2] then
          lblPrefGen3.Color := toLblWarna(Value)
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[3] then
          lblPrefGen4.Color := toLblWarna(Value);
      end;

      epPMSGeneratorBusbar :
      begin
        if TGenerator(Sender).Identifier = C_GENERATOR_ID[0] then
          lblBusbarGen1.Color := toLblWarna(Value)
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[1] then
          lblBusbarGen2.Color := toLblWarna(Value)
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[2] then
          lblBusbarGen3.Color := toLblWarna(Value)
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[3] then
          lblBusbarGen4.Color := toLblWarna(Value)
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[4] then
          lblBusbarGenE.Color := toLblWarna(Value);
      end;

      epPMSShutdown :
      begin
        if TGenerator(Sender).Identifier = C_GENERATOR_ID[0] then
          lblEmergencyStop1.Visible := Value
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[1] then
          lblEmergencyStop2.Visible := Value
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[2] then
          lblEmergencyStop3.Visible := Value
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[3] then
          lblEmergencyStop4.Visible := Value
        else if TGenerator(Sender).Identifier = C_GENERATOR_ID[4] then
          lblEmergencyStop5.Visible := Value;
      end;
    end;
  end
  else if Sender is TSwitchboard then
  begin
    case PropsID of
      epPMSMsbCBIntr:
      begin
        if TSwitchboard(Sender).Identifier = C_SWITCHBOARD_ID[0] then
        begin
          if TSwitchboard(Sender).MSBIntrMode = 2 then
            exit;

          lblCBCloseInn1.Color := toLblWarna(Value);
          lblCBOpenInn1.Color := toLblWarna(not Value);
        end
        else if TSwitchboard(Sender).Identifier = C_SWITCHBOARD_ID[1] then
        begin
          if TSwitchboard(Sender).MSBIntrMode = 2 then
            exit;

          lblCBCloseInn2.Color := toLblWarna(Value);
          lblCBOpenInn2.Color := toLblWarna(not Value);
        end;

        {untuk ngeset tampilan data power}
        SetPowerConnection(lblCBCloseInn1.Color, lblCBCloseInn2.Color)

      end;
      epPMSEsbCBIntr :
      begin
        if TSwitchboard(Sender).Identifier = C_SWITCHBOARD_ID[2] then
          lblCBOpenClosedE.Color := toLblWarna(Value);
      end;
      epPMSMsbCBShore:
      begin
        if TSwitchboard(Sender).Identifier = C_SWITCHBOARD_ID[1] then
        begin
          if TSwitchboard(Sender).ShoreIntrMode = 2 then
            exit;

          lblCBCloseShore.Color := toLblWarna(Value);
          lblCBOpenShore.Color := toLblWarna(not Value);
        end;
      end;
    end;
  end;
end;

procedure TfrmPMSSystemPanel.EnginePropertyDouChange(Sender: TObject;
  PropsID: E_PropsID; Value: Double);
begin
  if Sender is TPower then
  begin
    case PropsID of
      epPMSPowerConsmr:
      begin
        if TPower(Sender).Identifier = C_POWER_ID[0] then
          trckbrBebanfwd.Position := -1*(Round(Value))
        else if TPower(Sender).Identifier = C_POWER_ID[1] then
          trckbrBebanaft.Position := -1*(Round(Value));
      end;
    end;
  end
end;

function TfrmPMSSystemPanel.toBtnWarna(val: boolean): Integer;
begin
  if val then
    result := clLime
  else
    result := clBtnFace;
end;

function TfrmPMSSystemPanel.toCheck(val1, val2: Integer): boolean;
begin
  if val1 = val2 then
    result := True
  else
    result := False;
end;

function TfrmPMSSystemPanel.toCheckCB(IdGen, IdMsb : Integer): boolean;
begin
  Result := False;

  if (IdGen = 0) or (IdGen = 1) then
    IdMsb := 0
  else if (IdGen = 2) or (IdGen = 3) then
    IdMsb := 1
  else
    IdMsb := 2;

  switchboard := ERSystem.ERManager.EngineRoom.getPMSSystem.getSwitchboard(C_SWITCHBOARD_ID[IdMsb]);

  if (Abs(generator.Frequency - generator.SwitchFrequency) >= 100) and (switchboard.Frequency <> 0)then
    Result := True;
end;

function TfrmPMSSystemPanel.tovalidatebtn(val: string): Boolean;
begin
  result := False;
  if (val = 'btnStartGen1') or (val = 'btnStopGen1') or (val = 'btnCBClosedGen1') or (val = 'btnPrefGen1')then
  begin
    if rbManGen1.Checked or rbSemGen1.Checked or rbAutGen1.Checked then
      result := True;
  end
  else if (val = 'btnStartGen2') or (val = 'btnStopGen2') or (val = 'btnCBClosedGen2') or (val = 'btnPrefGen2')then
  begin
    if rbManGen2.Checked or rbSemGen2.Checked or rbAutGen2.Checked then
      result := True;
  end
  else if (val = 'btnStartGen3') or (val = 'btnStopGen3') or (val = 'btnCBClosedGen3') or (val = 'btnPrefGen3')then
  begin
    if rbManGen3.Checked or rbSemGen3.Checked or rbAutGen3.Checked then
      result := True;
  end
  else if (val = 'btnStartGen4') or (val = 'btnStopGen4') or (val = 'btnCBClosedGen4') or (val = 'btnPrefGen4')then
  begin
    if rbManGen4.Checked or rbSemGen4.Checked or rbAutGen4.Checked then
      result := True;
  end
  else if (val = 'btnStartGenE') or (val = 'btnStopGenE') or (val = 'btnCBClosedGenE') or (val = 'btnCBClosedGenEE')then
  begin
    if rbManGenE.Checked or rbSemGenE.Checked or rbAutGenE.Checked then
      result := True;
  end
end;

function TfrmPMSSystemPanel.toLblWarna(val: boolean): Integer;
begin
  if val then
    result := clLime
  else
    result := clBlack;
end;

procedure TfrmPMSSystemPanel.trckbrBebanChange(Sender: TObject);
begin
  FwdPosition := -1 * (trckbrBebanFwd.Position);
  AftPosition := -1 * (trckbrBebanAft.Position);

  trckbrBebanFwd.Position := -1 * FwdPosition;
  trckbrBebanAft.Position := -1 * AftPosition;

  lblBeban1.Caption := IntToStr(FwdPosition);
  lblBeban2.Caption := IntToStr(AftPosition);
  lblBesarbeban.Caption := IntToStr(FwdPosition + AftPosition);

  SetPowerConnection(lblCBCloseInn1.Color, lblCBCloseInn2.Color)
end;

procedure TfrmPMSSystemPanel.btn1Click(Sender: TObject);
begin
  SetValueInt(C_SWITCHBOARD, 2, 5, epPMSEsbIntrMode)
end;

procedure TfrmPMSSystemPanel.btnApplyClick(Sender: TObject);
begin
  Power := ERSystem.ERManager.EngineRoom.getPMSSystem.GetPower('Power FWD');
  power.PowerMode := PwrFlagMode;
  Power.PowerConsmr := FwdPosition;

  Power := ERSystem.ERManager.EngineRoom.getPMSSystem.GetPower('Power AFT');
  power.PowerMode := PwrFlagMode;
  Power.PowerConsmr := AftPosition;
end;

end.
