unit ufrmGeneratorPanel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VrControls, VrRotarySwitch, RzBmpBtn,
  Vcl.StdCtrls, VrAngularMeter, Vcl.ExtCtrls,

  uDataType, uGenerator, uMainForm;

type
  TfrmGeneratorPanel = class(TForm)
    pnlMainBackground: TPanel;
    img1: TImage;
    img2: TImage;
    img3: TImage;
    img4: TImage;
    img5: TImage;
    img6: TImage;
    pnlkW: TPanel;
    VraPower: TVrAngularMeter;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    pnlHz: TPanel;
    VraFrequency: TVrAngularMeter;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    pnlV: TPanel;
    VraV: TVrAngularMeter;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    pnlA: TPanel;
    vraAmpere1: TVrAngularMeter;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl18: TLabel;
    lbl19: TLabel;
    lbl20: TLabel;
    vraAmpere2: TVrAngularMeter;
    pnlGensys: TPanel;
    imgGensys: TImage;
    vrAmpere: TVrRotarySwitch;
    vrVoltage: TVrRotarySwitch;
    lbl21: TLabel;
    ImgIndicatorHO: TImage;
    ImgIndicatorFP: TImage;
    ImgIndicatorAP: TImage;
    ImgIndicatorBS: TImage;
    ImgIndicatorPreference: TImage;
    ImgIndicatorCBC: TImage;
    ImgIndicatorGS: TImage;
    ImgIndicatorER: TImage;
    ImgIndicatorAuto: TImage;
    ImgIndicatorSA: TImage;
    ImgIndicatorMan: TImage;
    ImgF1: TImage;
    ImgF2: TImage;
    ImgF3: TImage;
    ImgF4: TImage;
    ImgF5: TImage;
    ImgEnter: TImage;
    ImgShift: TImage;
    ImgLower: TImage;
    ImgRaise: TImage;
    ImgEsc: TImage;
    ImgHO: TImage;
    ImgFP: TImage;
    ImgAP: TImage;
    ImgIP: TImage;
    ImgLT: TImage;
    ImgAUTO: TImage;
    ImgSA: TImage;
    ImgMAN: TImage;
    ImgStart: TImage;
    ImgStop: TImage;
    ImgOI: TImage;
    ImgPref: TImage;
    lstMenu: TListBox;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    lstFaultPage: TListBox;
    lstAlarmPage: TListBox;
    lstInfoPage: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ImgStartClick(Sender: TObject);
    procedure ImgStopClick(Sender: TObject);
    procedure ImgPrefClick(Sender: TObject);
    procedure ImgOIClick(Sender: TObject);
    procedure DoLedTest(OnOff : Boolean);
    procedure ImgLTMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImgLTMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImgAUTOClick(Sender: TObject);
    procedure ImgSAClick(Sender: TObject);
    procedure ImgMANClick(Sender: TObject);
    procedure ImgHOClick(Sender: TObject);
    procedure ImgFPClick(Sender: TObject);
    procedure ImgAPClick(Sender: TObject);
    procedure ImgIPClick(Sender: TObject);
//    procedure tmrFrequencyTimer(Sender: TObject);
//    procedure tmrAmpereTimer(Sender: TObject);
    procedure ImgRaiseClick(Sender: TObject);
    procedure ImgEscClick(Sender: TObject);
    procedure ImgLowerClick(Sender: TObject);
    procedure ImgEnterClick(Sender: TObject);
    procedure ImgF2Click(Sender: TObject);
    procedure ImgF1Click(Sender: TObject);
    procedure ImgF3Click(Sender: TObject);
    procedure ImgF4Click(Sender: TObject);
  private
    Led  : array of TImage;
    LedStatus  : array of Boolean;
    ShiftMode : Boolean;

    MainMenu, SubMenu, SubSubMenu : array of TStringList;
//    SubSubMenu : array of array of TStringList;
    CurrentMenuIndex, SubMenuIndex, SubSubMenuPage : Integer;
    InSubMenu : Boolean;
    InSubSubMenu : Boolean;
    procedure InitMenu;
    procedure LoadMainMenu;
    procedure LoadSubMenu(Index : Integer);
    procedure LoadSubSubMenu(Index : Integer);

    procedure MenuFaultPage;
    procedure MenuAlarmPage;
    procedure MenuInfoPage;
    
    function CekGeneratorCondition : Boolean;


  public
    OrderFrequency : Double;
    OrderAmpere : Double;

    procedure UpdateForm(Generator : TGenerator);
  end;

var
  frmGeneratorPanel: TfrmGeneratorPanel;

implementation

uses
  uMainSwitchBoardSystem;

{$R *.dfm}

procedure EnableComposited(WinControl:TWinControl);
var
  i:Integer;
  NewExStyle:DWORD;
begin
  NewExStyle := GetWindowLong(WinControl.Handle, GWL_EXSTYLE) or WS_EX_COMPOSITED;
  SetWindowLong(WinControl.Handle, GWL_EXSTYLE, NewExStyle);

  for I := 0 to WinControl.ControlCount - 1 do
    if WinControl.Controls[i] is TWinControl then
      EnableComposited(TWinControl(WinControl.Controls[i]));
end;

{$REGION ' Form Procedure '}

procedure TfrmGeneratorPanel.FormCreate(Sender: TObject);
begin
  EnableComposited(pnlMainBackground);
  EnableComposited(pnlGensys);
  EnableComposited(pnlA);
  EnableComposited(pnlHz);
  EnableComposited(pnlkW);
  EnableComposited(pnlV);

  {Test Led}
  Led := [ImgIndicatorAuto, ImgIndicatorSA, ImgIndicatorMan,
          ImgIndicatorER, ImgIndicatorGS, ImgIndicatorCBC, ImgIndicatorPreference, ImgIndicatorBS,
          ImgIndicatorHO, ImgIndicatorFP, ImgIndicatorAP];
  SetLength(LedStatus, Length(Led));

  {Menu}
  InitMenu;

  CurrentMenuIndex := 0;
//  SubMenuIndex := -1;
//  SubSubMenuPage := 0;
  InSubMenu := False;
  InSubSubMenu := False;
  LoadMainMenu;
end;

procedure TfrmGeneratorPanel.FormDestroy(Sender: TObject);
begin
// FListener.Free;
end;

{$ENDREGION}

{$REGION ' Button Handle Procedure '}

procedure TfrmGeneratorPanel.ImgMANClick(Sender: TObject);
begin
  if frmMainForm.GeneratorTemp.NotStandby then
    Exit;

  MainSwitchBoardSystem.GeneratorMode(1);
end;

procedure TfrmGeneratorPanel.ImgSAClick(Sender: TObject);
begin
  if frmMainForm.GeneratorTemp.NotStandby then
    Exit;

  MainSwitchBoardSystem.GeneratorMode(2);
end;

procedure TfrmGeneratorPanel.ImgAUTOClick(Sender: TObject);
begin
  if frmMainForm.GeneratorTemp.NotStandby then
    Exit;

  MainSwitchBoardSystem.GeneratorMode(3);
end;

procedure TfrmGeneratorPanel.ImgEnterClick(Sender: TObject);
begin
  if not InSubMenu then
  begin
    CurrentMenuIndex := lstMenu.ItemIndex;
    LoadSubMenu(CurrentMenuIndex);
  end
  else if not InSubSubMenu then
  begin
    InSubSubMenu := True;
    LoadSubSubMenu(CurrentMenuIndex);
  end;
end;

procedure TfrmGeneratorPanel.ImgEscClick(Sender: TObject);
begin
  if InSubSubMenu then
  begin
    InSubSubMenu := False;
    LoadSubMenu(CurrentMenuIndex);
  end
  else if InSubMenu then
  begin
    InSubMenu := False;
    LoadMainMenu;
  end;
end;

procedure TfrmGeneratorPanel.ImgF1Click(Sender: TObject);
begin
  if (CurrentMenuIndex = 0) and (SubMenuIndex = 0) and (SubSubMenuPage > 0) then
  begin
    Dec(SubSubMenuPage);
    LoadSubSubMenu(SubSubMenuPage);;
  end;
end;

procedure TfrmGeneratorPanel.ImgF2Click(Sender: TObject);
begin
  if (CurrentMenuIndex = 0) and (SubMenuIndex = 0) and (SubSubMenuPage < High(SubSubMenu)) then
  begin
    Inc(SubSubMenuPage);
    LoadSubSubMenu(SubSubMenuPage);
  end;
end;

procedure TfrmGeneratorPanel.ImgF3Click(Sender: TObject);
begin
  if lstMenu.ItemIndex > 0 then
    lstMenu.ItemIndex := lstMenu.ItemIndex - 1;
end;

procedure TfrmGeneratorPanel.ImgF4Click(Sender: TObject);
begin
  if lstMenu.ItemIndex < lstMenu.Items.Count -1 then
    lstMenu.ItemIndex := lstMenu.ItemIndex + 1;
end;

procedure TfrmGeneratorPanel.ImgFPClick(Sender: TObject);
begin
  MenuFaultPage;

  lstMenu.Visible := False;
  lstFaultPage.Visible := True;
  lstAlarmPage.Visible := False;
  lstInfoPage.Visible := False;

  CurrentMenuIndex := 0;

  LoadMainMenu;
end;

procedure TfrmGeneratorPanel.ImgAPClick(Sender: TObject);
begin
  MenuAlarmPage;

  lstMenu.Visible := False;
  lstFaultPage.Visible := False;
  lstAlarmPage.Visible := True;
  lstInfoPage.Visible := False;

  CurrentMenuIndex := 0;

  LoadMainMenu;
end;

procedure TfrmGeneratorPanel.ImgIPClick(Sender: TObject);
begin
  MenuInfoPage;

  lstMenu.Visible := False;
  lstFaultPage.Visible := False;
  lstAlarmPage.Visible := True;
  lstInfoPage.Visible := False;

  CurrentMenuIndex := 0;

  LoadMainMenu;
end;

procedure TfrmGeneratorPanel.ImgHOClick(Sender: TObject);
begin
//
end;

procedure TfrmGeneratorPanel.ImgOIClick(Sender: TObject);
begin
  if (frmMainForm.GeneratorTemp.GeneratorMode = 3) or (frmMainForm.GeneratorTemp.FailureCBClosed) then
    exit;

  MainSwitchBoardSystem.CBClosed(True);
end;

procedure TfrmGeneratorPanel.ImgPrefClick(Sender: TObject);
begin
  if not CekGeneratorCondition then
    Exit;

  MainSwitchBoardSystem.GeneratorPreference(True);
end;

procedure TfrmGeneratorPanel.ImgRaiseClick(Sender: TObject);
begin
  if lstMenu.ItemIndex > 0 then
    lstMenu.ItemIndex := lstMenu.ItemIndex - 1;
end;

procedure TfrmGeneratorPanel.ImgLowerClick(Sender: TObject);
begin
  if lstMenu.ItemIndex < lstMenu.Items.Count -1 then
    lstMenu.ItemIndex := lstMenu.ItemIndex + 1;
end;

procedure TfrmGeneratorPanel.ImgStartClick(Sender: TObject);
begin
  if not CekGeneratorCondition then
    Exit;

  if frmMainForm.GeneratorTemp.GeneratorMode = 3 then
    exit;

  if frmMainForm.GeneratorTemp.GeneratorState <> Ord(gsWaiting){1} then
    exit;

  MainSwitchBoardSystem.EngineRun(True);
end;

procedure TfrmGeneratorPanel.ImgStopClick(Sender: TObject);
begin
  if not CekGeneratorCondition then
    Exit;

  if (frmMainForm.GeneratorTemp.GeneratorMode = 3) or (frmMainForm.GeneratorTemp.Preference) or (frmMainForm.GeneratorTemp.GeneratorState <> ord(gsGenReady){5}) then
    exit;

  if (frmMainForm.GeneratorTemp.GeneratorMode = 2) then
  begin
    if frmMainForm.GeneratorTemp.CBClosed <> False then
      Exit;
  end;

  MainSwitchBoardSystem.EngineStop(True);
end;

procedure TfrmGeneratorPanel.ImgLTMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DoLedTest(True);
end;

procedure TfrmGeneratorPanel.ImgLTMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DoLedTest(False);
end;

{$ENDREGION}

{$REGION ' Additional Procedure '}

function TfrmGeneratorPanel.CekGeneratorCondition: Boolean;
begin
  Result := False;

  if frmMainForm.GeneratorTemp.NotStandby or frmMainForm.GeneratorTemp.FuelRunsOut then
    Exit;

  if frmMainForm.GeneratorTemp.EmergencyStop or frmMainForm.GeneratorTemp.ShutDown then
    exit;

  Result := True;
end;

procedure TfrmGeneratorPanel.DoLedTest(OnOff: Boolean);
var
  i : Integer;
begin
  if OnOff then
  begin
    for i := 0 to High(Led) do
    begin
      LedStatus[i] := Led[i].Visible;
      Led[i].Visible := True;
    end;
  end
  else
  begin
     for i := 0 to High(Led) do
    begin
      Led[i].Visible := LedStatus[i];
    end;
  end;
end;

procedure TfrmGeneratorPanel.InitMenu;
begin
  SetLength(MainMenu, 4);
  SetLength(SubMenu, 3);
  SetLength(SubSubMenu, 9);

  MainMenu[0]:= TStringList.Create;
  MainMenu[0].AddStrings(['> Display', '> Configuration', '> System']);

  SubMenu[0] := TStringList.Create;
  SubMenu[0].AddStrings([
    '> Generator electrical meter',
    '> Mains/bus electrical meter',
    '> Engine meters',
    '> Digital inputs/outputs',
    '> Power plant overview',
    '> Synchronization'
  ]);

  SubMenu[1] := TStringList.Create;
  SubMenu[1].AddStrings([
    '> Power Plant Overview',
    '> Start / Stop Sequence',
    '> Gen. Electrical Settings',
    '> Mains Electrical Settings',
    '> Engine / battery Settings',
    '> Active Power Regulation'
  ]);

  SubMenu[2] := TStringList.Create;
  SubMenu[2].AddStrings([
    '> Date / Time / Meters',
    '> Passwords / Options',
    '> Gensys Screen Saver',
    '> Back Light Timer / Languages',
    '> Serial Ports Configuration',
    '> Serial Number / Soft Version'
  ]);

  {SubSubMenu Display -> Generator electrical meter}
  SubSubMenu[0] := TStringList.Create;
  SubSubMenu[0].Add('Generator Phase-Neutral Volt');
  SubSubMenu[0].Add('V1 = 00000 V');
  SubSubMenu[0].Add('V2 = 00000 V');
  SubSubMenu[0].Add('V3 = 00000 V');

  SubSubMenu[1] := TStringList.Create;
  SubSubMenu[1].Add('Generator Phase-Phase Volt');
  SubSubMenu[1].Add('U31 = 00000 V');
  SubSubMenu[1].Add('U23 = 00000 V');
  SubSubMenu[1].Add('U12 = 00000 V');

  SubSubMenu[2] := TStringList.Create;
  SubSubMenu[2].Add('Generator amps');
  SubSubMenu[2].Add('I1 = 00000 A');
  SubSubMenu[2].Add('I2 = 00000 A');
  SubSubMenu[2].Add('I3 = 00000 A');

  SubSubMenu[3] := TStringList.Create;
  SubSubMenu[3].Add('Generator kW');
  SubSubMenu[3].Add('P1 = 00000 kW');
  SubSubMenu[3].Add('P2 = 00000 kW');
  SubSubMenu[3].Add('P3 = 00000 kW');

  SubSubMenu[4] := TStringList.Create;
  SubSubMenu[4].Add('Generator kVAR');
  SubSubMenu[4].Add('Q1 = 00000 kVAR');
  SubSubMenu[4].Add('Q2 = 00000 kVAR');
  SubSubMenu[4].Add('Q3 = 00000 kVAR');

  SubSubMenu[5] := TStringList.Create;
  SubSubMenu[5].Add('Generator PF');
  SubSubMenu[5].Add('cos(1) = 1.00I');
  SubSubMenu[5].Add('cos(2) = 1.00I');
  SubSubMenu[5].Add('cos(3) = 1.00I');

  SubSubMenu[6] := TStringList.Create;
  SubSubMenu[6].Add('Generator parameters');
  SubSubMenu[6].Add('P = 00000 kW');
  SubSubMenu[6].Add('Q = 00000 kVAR');
  SubSubMenu[6].Add('F = 00. 00 Hz');
  SubSubMenu[6].Add('cos() = 0. 00I');

  SubSubMenu[7] := TStringList.Create;
  SubSubMenu[7].Add('KW meter');
  SubSubMenu[7].Add('0005339192kWh');
  SubSubMenu[7].Add('kVAR meter');
  SubSubMenu[7].Add('0003989214kVARh');
end;

procedure TfrmGeneratorPanel.LoadMainMenu;
var
  ActiveListBox : TListBox;
begin
  if lstMenu.Visible then
    ActiveListBox := lstMenu
  else if lstFaultPage.Visible then
    ActiveListBox := lstFaultPage
  else if lstAlarmPage.Visible then
    ActiveListBox := lstAlarmPage
  else if lstInfoPage.Visible then
    ActiveListBox := lstInfoPage;

  ActiveListBox.Items.Assign(MainMenu[0]);
  ActiveListBox.ItemIndex := CurrentMenuIndex;
  InSubMenu := False;

//  lstMenu.Items.Assign(MainMenu[0]);
//  lstMenu.ItemIndex := CurrentMenuIndex;
//  InSubMenu := False;
end;

procedure TfrmGeneratorPanel.LoadSubMenu(index : Integer);
begin
  if (Index >= 0) and (index < Length(SubMenu)) then
  begin
    lstMenu.Items.Assign(SubMenu[index]);
    lstMenu.ItemIndex := 0;
    InSubMenu := True;
  end;

//  if Assigned(SubMenus[CurrentMenuIndex]) then
//    lstMenu.Items.AddStrings(SubMenus[CurrentMenuIndex]);

end;

procedure TfrmGeneratorPanel.LoadSubSubMenu(Index : Integer);
begin
  lstMenu.Clear;

  if Assigned(SubSubMenu[CurrentMenuIndex]) then
  begin
    if (Index >= 0) and (index < Length(SubSubMenu)) then
    begin
      lstMenu.Items.Assign(SubSubMenu[index]);
      lstMenu.ItemIndex := 0;
      InSubSubMenu := True;
    end;
  end;

//  if Assigned(SubSubMenu[CurrentMenuIndex]) then
//    lstMenu.Items.AddStrings(SubSubMenu[CurrentMenuIndex]);

end;

procedure TfrmGeneratorPanel.MenuAlarmPage;
begin
  MainMenu[0]:= TStringList.Create;
  MainMenu[0].AddStrings([
    'Alarm 1/2',
    '01/06/25 15:55:02 DG common alr 2298=Off',
    '01/06/25 15:55:01 Emergency sto 2005=Off']);
end;

procedure TfrmGeneratorPanel.MenuFaultPage;
begin
  MainMenu[0]:= TStringList.Create;
  MainMenu[0].AddStrings([
    'Faults 1/2',
    '01/06/25 15:55:02 DG common alr 2298=Off',
    '01/06/25 15:55:01 Emergency sto 2005=Off']);
end;

procedure TfrmGeneratorPanel.MenuInfoPage;
begin
  MainMenu[0]:= TStringList.Create;
  MainMenu[0].AddStrings([
    'Information 1/2',
    '01/06/25 15:55:02 DG common alr 2298=Off',
    '01/06/25 15:55:01 Emergency sto 2005=Off']);
end;

procedure TfrmGeneratorPanel.updateForm(Generator : TGenerator);
begin
  ImgIndicatorMan.Visible := Generator.GeneratorMode = 1;
  ImgIndicatorSA.Visible := Generator.GeneratorMode = 2;
  ImgIndicatorAuto.Visible := Generator.GeneratorMode = 3;

  ImgIndicatorER.Visible := Generator.EngineRun;
  ImgIndicatorGS.Visible := Generator.GeneratorSupplied;

  ImgIndicatorCBC.Visible := Generator.CBClosed;
  ImgIndicatorPreference.Visible := Generator.Preference;
  ImgIndicatorBS.Visible := Generator.Busbar;
end;

{$ENDREGION}

end.
