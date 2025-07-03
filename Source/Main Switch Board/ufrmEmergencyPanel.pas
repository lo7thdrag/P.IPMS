unit ufrmEmergencyPanel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, VrControls,
  VrRotarySwitch, VrAngularMeter, Vcl.ExtCtrls,

  uGenerator, uDataType, uMainForm, Vcl.ComCtrls;

type
  TfrmEmergencyPanel = class(TForm)
    pnlEmergency: TPanel;
    Image2: TImage;
    Image4: TImage;
    Image5: TImage;
    Image1: TImage;
    Image3: TImage;
    Image6: TImage;
    Image7: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    Image8: TImage;
    pnlGensys: TPanel;
    imgGensys: TImage;
    pnlA: TPanel;
    Label9: TLabel;
    VraAmpere1: TVrAngularMeter;
    Label15: TLabel;
    Label18: TLabel;
    Label16: TLabel;
    VraAmpere2: TVrAngularMeter;
    pnlkW: TPanel;
    VraPower: TVrAngularMeter;
    Label2: TLabel;
    Label20: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    pnlV: TPanel;
    VraV: TVrAngularMeter;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    pnlHz: TPanel;
    VrAngularMeter2: TVrAngularMeter;
    Label6: TLabel;
    Label13: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    VrAngularMeter6: TVrAngularMeter;
    VrAmpere2: TVrRotarySwitch;
    VrAmpere1: TVrRotarySwitch;
    VrRotarySwitch3: TVrRotarySwitch;
    VrVoltage: TVrRotarySwitch;
    Label17: TLabel;
    VrCBClosed: TVrRotarySwitch;
    ImgEsc: TImage;
    ImgRaise: TImage;
    ImgLower: TImage;
    ImgShift: TImage;
    ImgEnter: TImage;
    ImgLT: TImage;
    ImgIP: TImage;
    ImgAP: TImage;
    ImgFP: TImage;
    ImgHO: TImage;
    ImgF5: TImage;
    ImgF4: TImage;
    ImgF3: TImage;
    ImgF2: TImage;
    ImgF1: TImage;
    ImgAUTO: TImage;
    ImgSA: TImage;
    ImgMAN: TImage;
    ImgStart: TImage;
    ImgStop: TImage;
    ImgOI: TImage;
    ImgCBClosed: TImage;
    ImgIndicatorBS: TImage;
    ImgIndicatorMsbCB: TImage;
    ImgIndicatorCBC: TImage;
    ImgIndicatorGS: TImage;
    ImgIndicatorER: TImage;
    IMGIndicatorAuto: TImage;
    ImgIndicatorSA: TImage;
    ImgIndicatorMan: TImage;
    ImgIndicatorAP: TImage;
    ImgIndicatorFP: TImage;
    ImgIndicatorHO: TImage;
    tmrAmpere: TTimer;
    imgMenu: TImage;
    lblDate: TLabel;
    lblTime: TLabel;
    pnlPassword: TPanel;
    Label34: TLabel;
    lblPass: TLabel;
    lstAlarmPage: TListBox;
    lstFaultPage: TListBox;
    lstInfoPage: TListBox;
    lstMenu: TListBox;
    pnlBlack1: TPanel;
    Image14: TImage;
    pnlBlack2: TPanel;
    Image15: TImage;
    pnlBlack3: TPanel;
    Image16: TImage;
    pnlDown1: TPanel;
    Image13: TImage;
    pnlDown2: TPanel;
    Image17: TImage;
    pnlEngineMeters1: TPanel;
    Label19: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    ProgressBar1: TProgressBar;
    ProgressBar2: TProgressBar;
    ProgressBar3: TProgressBar;
    ProgressBar4: TProgressBar;
    Panel1: TPanel;
    Image18: TImage;
    Panel2: TPanel;
    Image19: TImage;
    Panel3: TPanel;
    Image20: TImage;
    Panel4: TPanel;
    Image21: TImage;
    Panel5: TPanel;
    Image22: TImage;
    pnlEngineMeters2: TPanel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    ProgressBar5: TProgressBar;
    ProgressBar6: TProgressBar;
    Panel6: TPanel;
    Image23: TImage;
    Panel7: TPanel;
    Image24: TImage;
    Panel8: TPanel;
    Image25: TImage;
    Panel9: TPanel;
    Image26: TImage;
    Panel10: TPanel;
    Image27: TImage;
    pnlLeft: TPanel;
    Image28: TImage;
    pnlRefresh: TPanel;
    Image29: TImage;
    pnlReset: TPanel;
    Image30: TImage;
    pnlRight: TPanel;
    Image31: TImage;
    pnlUp1: TPanel;
    Image32: TImage;
    pnlUp2: TPanel;
    Image33: TImage;
    Image34: TImage;
    Image35: TImage;
    Image36: TImage;
    Image37: TImage;
    Image38: TImage;
    pnlPage: TPanel;
    lblPage: TLabel;
    procedure ImgStartClick(Sender: TObject);
    procedure ImgStopClick(Sender: TObject);
    procedure ImgOIClick(Sender: TObject);
    procedure ImgCBClosedClick(Sender: TObject);
    procedure DoLedTest(OnOff : Boolean);
    procedure ImgLTMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImgLTMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure ImgAUTOClick(Sender: TObject);
    procedure ImgSAClick(Sender: TObject);
    procedure ImgMANClick(Sender: TObject);
//    procedure tmrAmpereTimer(Sender: TObject);
    procedure VrCBClosedChange(Sender: TObject);
    procedure ImgEscClick(Sender: TObject);
    procedure ImgF1Click(Sender: TObject);
    procedure ImgF2Click(Sender: TObject);
    procedure ImgF3Click(Sender: TObject);
    procedure ImgF4Click(Sender: TObject);
    procedure ImgF5Click(Sender: TObject);
    procedure ImgEnterClick(Sender: TObject);
    procedure ImgRaiseClick(Sender: TObject);
    procedure ImgLowerClick(Sender: TObject);
    procedure lstMenuDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState);
    procedure ImgFPClick(Sender: TObject);
    procedure ImgAPClick(Sender: TObject);
    procedure ImgIPClick(Sender: TObject);
    procedure ImgHOClick(Sender: TObject);
  private
    Led  : array of TImage;
    LedStatus  : array of Boolean;

    MainMenu, SubMenu : array of TStringList;
    SubSubMenu1, SubSubMenu2, SubSubMenu3 : array of array of TStringList;
    CurrentMenuIndex, SubMenuIndex, SubSubMenuPage: Integer;
    InSubMenu, InSubSubMenu : Boolean;

    labels : array[0..62] of TLabel;
    currentIndex : Integer;

    procedure InitMenu;
    procedure LoadMainMenu(MainIndex : Integer);
    procedure LoadSubMenu(SubIndex : Integer);
    procedure LoadSubSubMenu(page : Integer);

    procedure MenuFaultPage;
    procedure MenuAlarmPage;
    procedure MenuInfoPage;

    procedure createlabels;
    procedure ClearKeyboardLabel;
    procedure HighlightLabel(index : Integer);
    procedure UnhighlightLabel(index : Integer);
    procedure ClearAllHighlight;


    function CekGeneratorCondition : Boolean;

  public
    OrderAmpere : Double;
    Generator : TGenerator;

    procedure UpdateForm(Generator : TGenerator);
    procedure AddAlarmToLog(const AText: string);
    procedure AddFaultToLog(const AText: string);
  end;

var
  frmEmergencyPanel: TfrmEmergencyPanel;

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

procedure TfrmEmergencyPanel.FormCreate(Sender: TObject);
begin
  EnableComposited(pnlEmergency);
  EnableComposited(pnlGensys);
  EnableComposited(pnlA);
  EnableComposited(pnlHz);
  EnableComposited(pnlkW);
  EnableComposited(pnlV);

  Led := [IMGIndicatorAuto, ImgIndicatorSA, ImgIndicatorMan,
          ImgIndicatorER, ImgIndicatorGS, ImgIndicatorCBC, ImgIndicatorMsbCB, ImgIndicatorBS,
          ImgIndicatorHO, ImgIndicatorFP, ImgIndicatorAP];
  SetLength(LedStatus, Length(Led));

  imgMenu.BringToFront;
  lblTime.BringToFront;
  lblDate.BringToFront;
  lblTime.Caption := FormatDateTime('hh:nn:ss', Now);
  lblDate.Caption := FormatDateTime('dd"/"mm"/"yy', Now);

  lstMenu.Visible := False;
  lstMenu.Style := lbOwnerDrawFixed;
end;

{$ENDREGION}

{$REGION ' Button Handle Procedure '}

procedure TfrmEmergencyPanel.ImgMANClick(Sender: TObject);
begin
  if frmMainForm.GeneratorTemp.NotStandby then
    Exit;

  MainSwitchBoardSystem.GeneratorMode(1);
end;

procedure TfrmEmergencyPanel.ImgSAClick(Sender: TObject);
begin
  if frmMainForm.GeneratorTemp.NotStandby then
    Exit;

  MainSwitchBoardSystem.GeneratorMode(2);
end;

procedure TfrmEmergencyPanel.ImgAUTOClick(Sender: TObject);
begin
  if frmMainForm.GeneratorTemp.NotStandby then
    Exit;

  MainSwitchBoardSystem.GeneratorMode(3);
end;

procedure TfrmEmergencyPanel.ImgOIClick(Sender: TObject);
begin
  if (frmMainForm.GeneratorTemp.GeneratorMode = 3) or (frmMainForm.GeneratorTemp.FailureCBClosed) then
    exit;

  MainSwitchBoardSystem.CBClosed(True);
end;

procedure TfrmEmergencyPanel.ImgCBClosedClick(Sender: TObject);
begin
  if not CekGeneratorCondition then
    Exit;

  if (VrCBClosed.SwitchPosition = 1) and (VrCBClosed.SwitchPosition = 2) then
    MainSwitchBoardSystem.CBClosed(True)
  else if (VrCBClosed.SwitchPosition = 0) then
    MainSwitchBoardSystem.CBClosed(False)
end;

procedure TfrmEmergencyPanel.ImgRaiseClick(Sender: TObject);
begin
  if lstMenu.ItemIndex > 0 then
    lstMenu.ItemIndex := lstMenu.ItemIndex - 1;
end;

procedure TfrmEmergencyPanel.ImgLowerClick(Sender: TObject);
begin
  if lstMenu.ItemIndex < lstMenu.Items.Count -1 then
    lstMenu.ItemIndex := lstMenu.ItemIndex + 1;
end;

procedure TfrmEmergencyPanel.ImgEnterClick(Sender: TObject);
var
  enteredPass : string;
begin
  if pnlPassword.Visible then
  begin
    enteredPass := lblPass.Caption;
    if enteredPass = '123' then
    begin
      pnlPassword.Visible := False;
      lstMenu.Visible := True;
//      SetLCDLook;
      InitMenu;
      CurrentMenuIndex := 0;
      LoadMainMenu(CurrentMenuIndex);

      pnlUp1.Visible := True;
      pnlDown1.Visible := True;
      pnlBlack1.Visible := True;
      pnlBlack2.Visible := True;
      pnlBlack3.Visible := True;

      InSubMenu := False;
      InSubSubMenu := False;
    end
    else
    begin
      ShowMessage('Password salah!');
      lblPass.Caption := '';
    end;
    Exit;
  end;


  if lstMenu.ItemIndex = -1 then
      Exit;

  if not InSubMenu then
  begin
    if lstMenu.ItemIndex >= 0 then
    begin
      CurrentMenuIndex := lstMenu.ItemIndex;
      InSubMenu := True;
      LoadSubMenu(CurrentMenuIndex);

      lstMenu.Refresh;
    end;
  end
  else if not InSubSubMenu then
  begin
    SubMenuIndex := lstMenu.ItemIndex;

    if InSubMenu then
    begin
      if (CurrentMenuIndex = 0) and (SubMenuIndex = 2) then
      begin
        pnlEngineMeters1.Visible := True;
        pnlEngineMeters1.BringToFront;
      end;
    end;

    // Cek apakah submenu ini punya SubSubMenu
    if (CurrentMenuIndex = 0) and (SubMenuIndex < Length(SubSubMenu1)) and (Length(SubSubMenu1[SubMenuIndex]) > 0) then
    begin
      SubSubMenuPage := 0;
      InSubSubMenu := True;
      LoadSubSubMenu(SubSubMenuPage);

    end
    else if (CurrentMenuIndex = 1) and (SubMenuIndex < Length(SubSubMenu2)) and (Length(SubSubMenu2[SubMenuIndex]) > 0) then
    begin
      SubSubMenuPage := 0;
      InSubSubMenu := True;
      LoadSubSubMenu(SubSubMenuPage);
    end
    else if (CurrentMenuIndex = 2) and (SubMenuIndex < Length(SubSubMenu3)) and (Length(SubSubMenu3[SubMenuIndex]) > 0) then
    begin
      SubSubMenuPage := 0;
      InSubSubMenu := True;
      LoadSubSubMenu(SubSubMenuPage);
    end;

  end;
end;

procedure TfrmEmergencyPanel.ImgEscClick(Sender: TObject);
begin
  if pnlPassword.Visible then
  begin
    pnlPassword.Visible := False;
    imgMenu.Visible := True;
    Exit;
  end;

  if InSubSubMenu then
  begin
    InSubSubMenu := False;
    LoadSubMenu(CurrentMenuIndex);
    Exit;
  end;

  if InSubMenu then
  begin
    InSubMenu := False;
    LoadMainMenu(CurrentMenuIndex);

    if (CurrentMenuIndex = 0) and (SubMenuIndex = 2) then
    begin
      pnlEngineMeters1.Visible := False;
      pnlEngineMeters2.Visible := False;

      LoadSubMenu(CurrentMenuIndex);
    end;

    Exit;
  end;

  if lstFaultPage.Visible or lstAlarmPage.Visible or lstInfoPage.Visible then
  begin
    lstFaultPage.Visible := False;
    lstAlarmPage.Visible := False;
    lstInfoPage.Visible := False;

    lstMenu.Visible := True;
    pnlPage.Visible := False;

    InitMenu;
    CurrentMenuIndex := 0;
    LoadMainMenu(CurrentMenuIndex);
    Exit;
  end;


  pnlPassword.Visible := True;
  ClearKeyboardLabel;
  createlabels;
  lstMenu.Visible := False;

  pnlUp1.Visible := False;
  pnlDown1.Visible := False;
  pnlUp2.Visible := False;
  pnlDown2.Visible := False;
  pnlLeft.Visible := False;
  pnlRight.Visible := False;
  pnlRefresh.Visible := False;
  pnlReset.Visible := False;
  pnlBlack1.Visible := False;
  pnlBlack2.Visible := False;
  pnlBlack3.Visible := False;
end;

procedure TfrmEmergencyPanel.ImgF1Click(Sender: TObject);
var
  colsPerRow: Integer;
begin
  colsPerRow := 26;
  if CurrentIndex >= colsPerRow then
  begin
    UnhighlightLabel(CurrentIndex);
    Dec(CurrentIndex, colsPerRow);
    ClearAllHighlight;
    HighlightLabel(CurrentIndex);
  end;

  {up}
  if lstMenu.ItemIndex > 0 then
    lstMenu.ItemIndex := lstMenu.ItemIndex - 1;

  if not InSubMenu and not InSubSubMenu then
  begin
    if lstInfoPage.Visible then
    begin
      if CurrentMenuIndex > 0 then
      begin
        Dec(CurrentMenuIndex);
        LoadMainMenu(CurrentMenuIndex);
      end;
    end;
  end;

  {previous page}
  if InSubSubMenu and (SubSubMenuPage > 0) then
  begin
    Dec(SubSubMenuPage);
    LoadSubSubMenu(SubSubMenuPage);
  end;

  if InSubMenu then
  begin
    if (CurrentMenuIndex = 0) and (SubMenuIndex = 2) then
    begin
      pnlEngineMeters1.Visible := True;
      pnlEngineMeters1.BringToFront;
    end;
  end;
end;

procedure TfrmEmergencyPanel.ImgF2Click(Sender: TObject);
var
  colsPerRow: Integer;
begin
  colsPerRow := 26;
  if CurrentIndex + colsPerRow <= High(Labels) then
  begin
    UnhighlightLabel(CurrentIndex);
    Inc(CurrentIndex, colsPerRow);
    ClearAllHighlight;
    HighlightLabel(CurrentIndex);
  end;

  {Down}
  if lstMenu.ItemIndex < lstMenu.Count -1 then
      lstMenu.ItemIndex := lstMenu.ItemIndex +1;

  {next page}
  if not InSubMenu and not InSubSubMenu then
  begin
    if lstInfoPage.Visible then
    begin
      if CurrentMenuIndex < High(MainMenu) then
      begin
        Inc(CurrentMenuIndex);
        lstInfoPage.Items.Assign(MainMenu[CurrentMenuIndex]);
      end;
    end;

  end
  else if InSubSubMenu and (SubSubMenuPage + 1 < Length(SubSubMenu1[SubMenuIndex])) then
  begin
    Inc(SubSubMenuPage);
    LoadSubSubMenu(SubSubMenuPage);
  end
  else if InSubSubMenu and (SubSubMenuPage + 1 < Length(SubSubMenu2[SubMenuIndex])) then
  begin
    Inc(SubSubMenuPage);
    LoadSubSubMenu(SubSubMenuPage);
  end
  else if InSubSubMenu and (SubSubMenuPage + 1 < Length(SubSubMenu3[SubMenuIndex])) then
  begin
    Inc(SubSubMenuPage);
    LoadSubSubMenu(SubSubMenuPage);
  end;

  if InSubMenu then
  begin
    if (CurrentMenuIndex = 0) and (SubMenuIndex = 2) then
    begin
      pnlEngineMeters2.Visible := True;
      pnlEngineMeters2.BringToFront;
    end;
  end;
end;

procedure TfrmEmergencyPanel.ImgF3Click(Sender: TObject);
begin
  if CurrentIndex > 0 then
  begin
    UnhighlightLabel(CurrentIndex);
    Dec(CurrentIndex);
    ClearAllHighlight;
    HighlightLabel(CurrentIndex);
  end;

  if lstMenu.ItemIndex > 0 then
    lstMenu.ItemIndex := lstMenu.ItemIndex - 1;
end;

procedure TfrmEmergencyPanel.ImgF4Click(Sender: TObject);
var
  i : Integer;
begin
  if CurrentIndex < High(Labels) then
  begin
    UnhighlightLabel(CurrentIndex);
    Inc(CurrentIndex);
    ClearAllHighlight;
    HighlightLabel(CurrentIndex);
  end;

  if lstMenu.ItemIndex < lstMenu.Items.Count -1 then
    lstMenu.ItemIndex := lstMenu.ItemIndex + 1;

  if lstAlarmPage.Visible then
  begin
    if Assigned(MainMenu[0]) then
    begin
      // Mulai dari index terakhir sampai index 1
      for i := MainMenu[0].Count - 1 downto 1 do
        MainMenu[0].Delete(i);
    end;
    Exit;
  end
  else if lstFaultPage.Visible then
  begin
    lstFaultPage.Clear;
    lstFaultPage.ItemIndex := -1;
    Exit;
  end;
end;

procedure TfrmEmergencyPanel.ImgF5Click(Sender: TObject);
var
  currentText, tempText : string;
begin
  currentText := labels[currentIndex].Caption;

  if currentText = '←' then
  begin
    tempText := lblPass.Caption;
    if Length(lblPass.Caption)>0 then
      Delete(tempText, Length(tempText), 1);
    lblPass.Caption := tempText;
  end
  else
  begin
    lblPass.Caption := lblPass.Caption + currentText;
  end;
end;

procedure TfrmEmergencyPanel.ImgAPClick(Sender: TObject);
begin
  pnlPassword.Visible := False;
  lstMenu.Visible := False;
  lstFaultPage.Visible := False;
  lstAlarmPage.Visible := True;
  lstInfoPage.Visible := False;

  pnlPage.Visible:= True;
  lblPage.Caption := 'Alarms 1/2';

  pnlLeft.Visible := True;
  pnlRight.Visible := True;
  pnlRefresh.Visible := True;
  pnlReset.Visible := True;
  pnlBlack3.Visible := True;

  pnlLeft.BringToFront;
  pnlRight.BringToFront;
  pnlRefresh.BringToFront;
  pnlReset.BringToFront;
  pnlBlack3.BringToFront;
end;

procedure TfrmEmergencyPanel.ImgFPClick(Sender: TObject);
begin
  pnlPassword.Visible := False;
  lstMenu.Visible := False;
  lstFaultPage.Visible := True;
  lstAlarmPage.Visible := False;
  lstInfoPage.Visible := False;

  pnlPage.Visible:= True;
  lblPage.Caption := 'Faults 1/2';

  pnlLeft.Visible := True;
  pnlRight.Visible := True;
  pnlRefresh.Visible := True;
  pnlReset.Visible := True;
  pnlBlack3.Visible := True;

  pnlLeft.BringToFront;
  pnlRight.BringToFront;
  pnlRefresh.BringToFront;
  pnlReset.BringToFront;
  pnlBlack3.BringToFront;
end;

procedure TfrmEmergencyPanel.ImgHOClick(Sender: TObject);
begin
  ImgIndicatorHO.Visible := False;
  ImgIndicatorFP.Visible := False;
  ImgIndicatorAP.Visible := False;
end;

procedure TfrmEmergencyPanel.ImgIPClick(Sender: TObject);
begin
  pnlPage.Visible := False;
  MenuInfoPage;

  pnlPassword.Visible := False;
  lstMenu.Visible := False;
  lstFaultPage.Visible := False;
  lstAlarmPage.Visible := False;
  lstInfoPage.Visible := True;

  pnlLeft.Visible := True;
  pnlRight.Visible := True;
  pnlUp2.Visible := True;
  pnlDown2.Visible := True;
  pnlBlack3.Visible := True;

  pnlLeft.BringToFront;
  pnlRight.BringToFront;
  pnlUp2.BringToFront;
  pnlDown2.BringToFront;
  pnlBlack3.BringToFront;

  CurrentMenuIndex := 0;

  LoadMainMenu(CurrentMenuIndex);
end;

procedure TfrmEmergencyPanel.ImgStartClick(Sender: TObject);
begin
  if not CekGeneratorCondition then
    Exit;

  if frmMainForm.GeneratorTemp.GeneratorMode = 3 then
    exit;

  if frmMainForm.GeneratorTemp.GeneratorState <> Ord(gsWaiting){1} then
    exit;

  MainSwitchBoardSystem.EngineRun(True);
end;

procedure TfrmEmergencyPanel.ImgStopClick(Sender: TObject);
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

procedure TfrmEmergencyPanel.ImgLTMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DoLedTest(True);
end;

procedure TfrmEmergencyPanel.ImgLTMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DoLedTest(False);
end;

procedure TfrmEmergencyPanel.lstMenuDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  with lstMenu.Canvas do
  begin
    if odSelected in State then
    begin
      Brush.Color := clBlack;
      Font.Color := clLime;
    end
    else
    begin
      Brush.Color := clLime;
      Font.Color := clBlack;
    end;

    FillRect(Rect);
    TextOut(Rect.Left + 2, Rect.Top, lstMenu.Items[Index]);
  end;
end;

{$ENDREGION}

{$REGION ' Additional Procedure '}

procedure TfrmEmergencyPanel.AddAlarmToLog(const AText: string);
var
  LogEntry : String;
begin
  LogEntry:= FormatDateTime('dd"/"mm"/"yyyy', Now) + ' ' +
             FormatDateTime('hh:nn:ss AM/PM', Now) + ' ' +
             AText;

  if lstAlarmPage.Items.Count = 0 then
    lstAlarmPage.Items.Add(' ');

  lstAlarmPage.Items.Insert(1, LogEntry)
end;

procedure TfrmEmergencyPanel.AddFaultToLog(const AText: string);
var
  LogEntry : String;
begin
  LogEntry:= FormatDateTime('dd"/"mm"/"yyyy', Now) + ' ' +
             FormatDateTime('hh:nn:ss AM/PM', Now) + ' ' +
             AText;

  if lstFaultPage.Items.Count = 0 then
    lstFaultPage.Items.Add(' ');


  lstFaultPage.Items.Insert(1, LogEntry)
end;

function TfrmEmergencyPanel.CekGeneratorCondition: Boolean;
begin
  Result := False;

  if frmMainForm.GeneratorTemp.NotStandby or frmMainForm.GeneratorTemp.FuelRunsOut then
    Exit;

  if frmMainForm.GeneratorTemp.EmergencyStop or frmMainForm.GeneratorTemp.ShutDown then
    exit;

  Result := True;
end;

procedure TfrmEmergencyPanel.createlabels;
var
  i: Integer;
  x, y: Integer;
  chars: string;
  labelWidth, labelHeight, spaceX, spaceY: Integer;
begin
  chars := 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789←';

  labelWidth := 15;    // Lebar setiap label
  labelHeight := 15;   // Tinggi setiap label
  spaceX := -3;         // Jarak horizontal antar label
  spaceY := 6;         // Jarak vertikal antar baris

  x := 7;
  y := 100;

  for i := 0 to Length(chars) - 1 do
  begin
    Labels[i] := TLabel.Create(Self);
    Labels[i].Parent := pnlPassword;  // Semua label di panel
    Labels[i].Caption := chars[i + 1];
    Labels[i].Left := x;
    Labels[i].Top := y;
    Labels[i].Width := labelWidth;
    Labels[i].Height := labelHeight;
    Labels[i].Alignment := taCenter;
    Labels[i].Layout := tlCenter;
    labels[i].Font.Name := 'Courier New';
    Labels[i].Font.Size := 10;
    Labels[i].AutoSize := False;

    Inc(x, labelWidth + spaceX);

    // Pindah baris setelah huruf besar, huruf kecil
    if (i = 25) then
    begin
      x := 7;
      Inc(y, labelHeight + spaceY);
    end;

    if (i = 51) then
    begin
      x := 100;
      Inc(y, labelHeight + spaceY);
    end;
  end;

  CurrentIndex := 0;
  HighlightLabel(CurrentIndex);
  ClearAllHighlight;
end;

procedure TfrmEmergencyPanel.DoLedTest(OnOff: Boolean);
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

procedure TfrmEmergencyPanel.HighlightLabel(index: Integer);
begin
  Labels[Index].Color := clBlack;
  Labels[Index].Font.Color := clLime;
  Labels[index].Transparent := False;
end;

procedure TfrmEmergencyPanel.UnhighlightLabel(index: Integer);
begin
  Labels[Index].Color := pnlPassword.Color;
  Labels[Index].Font.Color := clBlack;
  Labels[index].Transparent := True;
end;

procedure TfrmEmergencyPanel.ClearAllHighlight;
var
  i: Integer;
begin
  for i := 0 to High(Labels) do
  begin
    Labels[i].Color := pnlPassword.Color;
    Labels[i].Font.Color := clBlack;
    Labels[i].Transparent := True;
  end;
end;

procedure TfrmEmergencyPanel.ClearKeyboardLabel;
var
  i : Integer;
begin
  for i := pnlPassword.ControlCount - 1 downto 2 do
  begin
    if pnlPassword.Controls[i] is TLabel then
      pnlPassword.Controls[i].Free;
  end;
end;

procedure TfrmEmergencyPanel.UpdateForm(Generator: TGenerator);
begin
  ImgIndicatorMan.Visible := Generator.GeneratorMode = 1;
  ImgIndicatorSA.Visible := Generator.GeneratorMode = 2;
  ImgIndicatorAuto.Visible := Generator.GeneratorMode = 3;

  ImgIndicatorER.Visible := Generator.EngineRun;
  ImgIndicatorGS.Visible := Generator.GeneratorSupplied;

  ImgIndicatorCBC.Visible := Generator.CBClosed;
  ImgIndicatorMsbCB.Visible := Generator.CBClosed;
  ImgIndicatorBS.Visible := Generator.Busbar;

end;

procedure TfrmEmergencyPanel.VrCBClosedChange(Sender: TObject);
begin
  if VrCBClosed.SwitchPosition = 0 then
  begin
    MainSwitchBoardSystem.CBClosed(False);
  end
  else if (VrCBClosed.SwitchPosition = 1) or (VrCBClosed.SwitchPosition = 2) then
    MainSwitchBoardSystem.CBClosed(True);
end;


procedure TfrmEmergencyPanel.InitMenu;
var
  Generator : TGenerator;
begin
  SetLength(MainMenu, 3);

  MainMenu[0] := TStringList.Create;
  MainMenu[0].Add('> Display');
  MainMenu[0].Add('> Configuration');
  MainMenu[0].Add('> System');

  SetLength(SubMenu, 3);
  SetLength(SubSubMenu1, 6);
  SetLength(SubSubMenu2, 7);
  SetLength(SubSubMenu3, 6);

  // SubMenu Display
  SubMenu[0] := TStringList.Create;
  SubMenu[0].Add('> Generator electrical meter');
  SubMenu[0].Add('> Mains/bus electrical meter');
  SubMenu[0].Add('> Engine meters');
  SubMenu[0].Add('> Digital inputs/outputs');
  SubMenu[0].Add('> Power plant overview');
  SubMenu[0].Add('> Synchronization');

  {$REGION 'SubSubMenu1'}

  // SubSubMenu Generator electrical meter (index = 0)
  SetLength(SubSubMenu1[0], 9);
  SubSubMenu1[0][0] := TStringList.Create;
  SubSubMenu1[0][0].Add('Generator Phase-Neutral Volt');
  SubSubMenu1[0][0].Add('V1 = ' + FormatFloat('0.0', Generator.V) +' V');
  SubSubMenu1[0][0].Add('V2 = 00000 V');
  SubSubMenu1[0][0].Add('V3 = 00000 V');

  SubSubMenu1[0][1] := TStringList.Create;
  SubSubMenu1[0][1].Add('Generator Phase-Phase Volt');
  SubSubMenu1[0][1].Add('U31 = ' + FormatFloat('0.0', Generator.Voltage) +' V');
  SubSubMenu1[0][1].Add('U23 = 00000 V');
  SubSubMenu1[0][1].Add('U12 = 00000 V');

  SubSubMenu1[0][2] := TStringList.Create;
  SubSubMenu1[0][2].Add('Generator amps');
  SubSubMenu1[0][2].Add('I1 = 00000 A');
  SubSubMenu1[0][2].Add('I2 = 00000 A');
  SubSubMenu1[0][2].Add('I3 = 00000 A');

  SubSubMenu1[0][3] := TStringList.Create;
  SubSubMenu1[0][3].Add('Generator kW');
  SubSubMenu1[0][3].Add('P1 = 00000 kW');
  SubSubMenu1[0][3].Add('P2 = 00000 kW');
  SubSubMenu1[0][3].Add('P3 = 00000 kW');

  SubSubMenu1[0][4] := TStringList.Create;
  SubSubMenu1[0][4].Add('Generator kVAR');
  SubSubMenu1[0][4].Add('Q1 = 00000 kVAR');
  SubSubMenu1[0][4].Add('Q2 = 00000 kVAR');
  SubSubMenu1[0][4].Add('Q3 = 00000 kVAR');

  SubSubMenu1[0][5] := TStringList.Create;
  SubSubMenu1[0][5].Add('Generator PF');
  SubSubMenu1[0][5].Add('cos(1) = 1.00I');
  SubSubMenu1[0][5].Add('cos(2) = 1.00I');
  SubSubMenu1[0][5].Add('cos(3) = 1.00I');

  SubSubMenu1[0][6] := TStringList.Create;
  SubSubMenu1[0][6].Add('Generator parameters');
  SubSubMenu1[0][6].Add('P = 00000 kW');
  SubSubMenu1[0][6].Add('Q = 00000 kVAR');
  SubSubMenu1[0][6].Add('F = 00. 00 Hz');
  SubSubMenu1[0][6].Add('cos() = 0. 00I');

  SubSubMenu1[0][7] := TStringList.Create;
  SubSubMenu1[0][7].Add('KW meter');
  SubSubMenu1[0][7].Add('0005339192kWh');
  SubSubMenu1[0][7].Add('kVAR meter');
  SubSubMenu1[0][7].Add('0003989214kVARh');

  SubSubMenu1[0][8] := TStringList.Create;
  SubSubMenu1[0][8].Add('Global view');
  SubSubMenu1[0][8].Add('V1 = 00000 V   U31 = 00000 V   I1 = 00000 A');
  SubSubMenu1[0][8].Add('V2 = 00000 V   U23 = 00000 V   I2 = 00000 A');
  SubSubMenu1[0][8].Add('V3 = 00000 V   U12 = 00000 V   I3 = 00000 A');
  SubSubMenu1[0][8].Add('P1 = 00000 kW  Q1 = 00000 kVAR  cos(1) = 1.00I');
  SubSubMenu1[0][8].Add('P2 = 00000 kW  Q2 = 00000 kVAR  cos(2) = 1.00I');
  SubSubMenu1[0][8].Add('P3 = 00000 kW  Q3 = 00000 kVAR  cos(3) = 1.00I');
  SubSubMenu1[0][8].Add('P = 00000 kW     F = 50.09 Hz');
  SubSubMenu1[0][8].Add('Q = 00000 kVAR   cos(1) = 0.791');

  // SubSubMenu Mains/bus electrical meter (index = 1)
  SetLength(SubSubMenu1[1], 1);
  SubSubMenu1[1][0] := TStringList.Create;
  SubSubMenu1[1][0].Add('Mains/bus parameters');
  SubSubMenu1[1][0].Add('U13 = 00439 V');
  SubSubMenu1[1][0].Add('F = 60.06 Hz');

  // SubSubMenu Engine meters (index = 2)
//  SetLength(SubSubMenu1[2], 2);
//  SubSubMenu1[2][0] := TStringList.Create;
//  SubSubMenu1[2][0].Add('Engine meters');
//  SubSubMenu1[2][0].Add('AI oil press.  : 0029-001000 mBa');
//  SubSubMenu1[2][0].Add('AI water temp. : 0030-000046 C');
//  SubSubMenu1[2][0].Add('Batt voltage   : 0041-024.1 V');
//  SubSubMenu1[2][0].Add('Engine speed   : 0033-00000 rpm');
//
//  SubSubMenu1[2][1] := TStringList.Create;
//  SubSubMenu1[2][1].Add('Engine meters');
//  SubSubMenu1[2][1].Add('AI spare 1     : 0031-00601');
//  SubSubMenu1[2][1].Add('AI spare 2     : 0032-00602');
//  SubSubMenu1[2][1].Add('Nb of starts   : 2787');
//  SubSubMenu1[2][1].Add('Hours run      : 0000038087h');
//  SubSubMenu1[2][1].Add('User meter 1  : 0000000000');
//  SubSubMenu1[2][1].Add('User meter 2  : 0000000000');

  // SubSubMenu Digital Inputs
  SetLength(SubSubMenu1[3], 3);
  SubSubMenu1[3][0] := TStringList.Create;
  SubSubMenu1[3][0].Add('Digital inputs');
  SubSubMenu1[3][0].Add('Emergency stop : 2005=0');
  SubSubMenu1[3][0].Add('Mains break in : 2000=0');
  SubSubMenu1[3][0].Add('Gen breaker in : 2001=0');
  SubSubMenu1[3][0].Add('Rem start/stop : 2002=0');
  SubSubMenu1[3][0].Add('Oil pressure   : 2003=1');
  SubSubMenu1[3][0].Add('Water temp     : 2004=0');
  SubSubMenu1[3][0].Add('Input I        : 2006=0');
  SubSubMenu1[3][0].Add('DG standby     : 2007=0');
  SubSubMenu1[3][0].Add('Measure fail   : 2008=1');
  SubSubMenu1[3][0].Add('Supply failure : 2009=1');
  SubSubMenu1[3][0].Add('CB trip gen    : 2010=1');
  SubSubMenu1[3][0].Add('Input 6        : 2011=0');
  SubSubMenu1[3][0].Add('Input 7        : 2012=1');

  SubSubMenu1[3][1] := TStringList.Create;
  SubSubMenu1[3][1].Add('Digital inputs');
  SubSubMenu1[3][1].Add('Input 8        : 2013=0');
  SubSubMenu1[3][1].Add('CB trip IC fwd : 2014=1');
  SubSubMenu1[3][1].Add('Input 10       : 2015=0');

  SubSubMenu1[3][2] := TStringList.Create;
  SubSubMenu1[3][2].Add('Relay outputs');
  SubSubMenu1[3][2].Add('Crank rel. out : 2018=0');
  SubSubMenu1[3][2].Add('Fuel relay out : 2019=0');
  SubSubMenu1[3][2].Add('Mains breaker  : 2017=1');
  SubSubMenu1[3][2].Add('Gen breaker    : 2016=0');
  SubSubMenu1[3][2].Add('Digital transistor outputs');
  SubSubMenu1[3][2].Add('Output 1       : 2020=0');
  SubSubMenu1[3][2].Add('Output 2       : 2021=0');
  SubSubMenu1[3][2].Add('Output 3       : 2022=0');
  SubSubMenu1[3][2].Add('Output 4       : 2023=0');
  SubSubMenu1[3][2].Add('Output 5       : 2024=0');

  {SubSubMenu Power Plant Overview}
  SetLength(SubSubMenu1[4], 4);
  SubSubMenu1[4][0] := TStringList.Create;
  SubSubMenu1[4][0].Add('Generator 1 to 16 - kW');
  SubSubMenu1[4][0].Add('01 : 0000.0 %              09 : 0000.0 %');
  SubSubMenu1[4][0].Add('02 : 0047.1 %              10 : 0000.0 %');
  SubSubMenu1[4][0].Add('03 : 0000.0 %              11 : 0000.0 %');
  SubSubMenu1[4][0].Add('04 : 0000.0 %              12 : 0000.0 %');
  SubSubMenu1[4][0].Add('05 : 0000.0 %              13 : 0000.0 %');
  SubSubMenu1[4][0].Add('06 : 0000.0 %              14 : 0000.0 %');
  SubSubMenu1[4][0].Add('07 : 0000.0 %              15 : 0000.0 %');
  SubSubMenu1[4][0].Add('08 : 0000.0 %              16 : 0000.0 %');

  SubSubMenu1[4][1] := TStringList.Create;
  SubSubMenu1[4][1].Add('Generator 1 to 16 - kVAR');
  SubSubMenu1[4][1].Add('01 : 0000.0 %              09 : 0000.0 %');
  SubSubMenu1[4][1].Add('02 : 0047.1 %              10 : 0000.0 %');
  SubSubMenu1[4][1].Add('03 : 0000.0 %              11 : 0000.0 %');
  SubSubMenu1[4][1].Add('04 : 0000.0 %              12 : 0000.0 %');
  SubSubMenu1[4][1].Add('05 : 0000.0 %              13 : 0000.0 %');
  SubSubMenu1[4][1].Add('06 : 0000.0 %              14 : 0000.0 %');
  SubSubMenu1[4][1].Add('07 : 0000.0 %              15 : 0000.0 %');
  SubSubMenu1[4][1].Add('08 : 0000.0 %              16 : 0000.0 %');

  SubSubMenu1[4][2] := TStringList.Create;
  SubSubMenu1[4][2].Add('Gen 1 to 16 - nominal kW');
  SubSubMenu1[4][2].Add('01 : 000320 kW             09 : 000000 kW');
  SubSubMenu1[4][2].Add('02 : 000320 kW             10 : 000000 kW');
  SubSubMenu1[4][2].Add('03 : 000320 kW             11 : 000000 kW');
  SubSubMenu1[4][2].Add('04 : 000320 kW             12 : 000000 kW');
  SubSubMenu1[4][2].Add('05 : 000000 kW             13 : 000000 kW');
  SubSubMenu1[4][2].Add('06 : 000000 kW             14 : 000000 kW');
  SubSubMenu1[4][2].Add('07 : 000000 kW             15 : 000000 kW');
  SubSubMenu1[4][2].Add('08 : 000000 kW             16 : 000000 kW');

  SubSubMenu1[4][3] := TStringList.Create;
  SubSubMenu1[4][3].Add('Gen 1 to 16 - nominal kVAR');
  SubSubMenu1[4][3].Add('01 : 000240 kVAR             09 : 000000 kVAR');
  SubSubMenu1[4][3].Add('02 : 000240 kVAR             10 : 000000 kVAR');
  SubSubMenu1[4][3].Add('03 : 000240 kVAR             11 : 000000 kVAR');
  SubSubMenu1[4][3].Add('04 : 000240 kVAR             12 : 000000 kVAR');
  SubSubMenu1[4][3].Add('05 : 000000 kVAR             13 : 000000 kVAR');
  SubSubMenu1[4][3].Add('06 : 000000 kVAR             14 : 000000 kVAR');
  SubSubMenu1[4][3].Add('07 : 000000 kVAR             15 : 000000 kVAR');
  SubSubMenu1[4][3].Add('08 : 000000 kVAR             16 : 000000 kVAR');

  {$ENDREGION}

  {SubMenu Cofiguration}
  SubMenu[1] := TStringList.Create;
  SubMenu[1].AddStrings([
    '> Power Plant Overview',
    '> Start / Stop Sequence',
    '> Gen. Electrical Settings',
    '> Mains Electrical Settings',
    '> Speed Control Settings',
    '> Engine / battery Settings',
    '> Active Power Regulation'
  ]);

  {$REGION 'SubSubMenu2'}

  SetLength(SubSubMenu2[0], 2);
  SubSubMenu2[0][0] := TStringList.Create;
  SubSubMenu2[0][0].Add('Power Plant');
  SubSubMenu2[0][0].Add('Gen. number    >1179=1');
  SubSubMenu2[0][0].Add('Nb of gen.     >1147=4');
  SubSubMenu2[0][0].Add('Mains parallel >1148=ChangeOver');
  SubSubMenu2[0][0].Add('ILS compatible >1158=No');
  SubSubMenu2[0][0].Add('Synchro mode   >1177=Dynamic');
  SubSubMenu2[0][0].Add('DeadBus manag. >1515=Yes');

  SubSubMenu2[0][1] := TStringList.Create;
  SubSubMenu2[0][1].Add('Mains electrical fault');
  SubSubMenu2[0][1].Add('Open breaker   >1846=Mains');
  SubSubMenu2[0][1].Add('Start on fault >1841=Yes');
  SubSubMenu2[0][1].Add('Start delay    >1840=0.0 s');
  SubSubMenu2[0][1].Add('No load delay  >1842=60.0 s');
  SubSubMenu2[0][1].Add('Generator electrical fault');
  SubSubMenu2[0][1].Add('TM re-synch.   >1843=30.0 s');
  SubSubMenu2[0][1].Add('Nb re-synch.   >1844=3');

  SetLength(SubSubMenu2[1], 2);
  SubSubMenu2[1][0] := TStringList.Create;
  SubSubMenu2[1][0].Add('Timers');
  SubSubMenu2[1][0].Add('Prelub time    >1145=1.0 s');
  SubSubMenu2[1][0].Add('Preglow time   >1157=0.0 s');
  SubSubMenu2[1][0].Add('Crank time     >1135=50.0 s');
  SubSubMenu2[1][0].Add('Crank RestTime >1136=0.0 s');
  SubSubMenu2[1][0].Add('Warm up time   >1139=0.0 s');
  SubSubMenu2[1][0].Add('RPM stab. time >1140=3.0 s');
  SubSubMenu2[1][0].Add('Volt stab time >1141=3.0 s');
  SubSubMenu2[1][0].Add('Safety ON time >1514=10.0 s');
  SubSubMenu2[1][0].Add('Cooling time   >1142=180.0 s');
  SubSubMenu2[1][0].Add('Rest time      >1144=10.0 s');
  SubSubMenu2[1][0].Add('Eng. stop time >1143=60.0 s');

  SubSubMenu2[1][1] := TStringList.Create;
  SubSubMenu2[1][1].Add('Crank setting');
  SubSubMenu2[1][1].Add('Starts attempt >1134=1');
  SubSubMenu2[1][1].Add('Nb. of starter >1138=1');
  SubSubMenu2[1][1].Add('Cra.1 drop out >1325=400 rpm');
  SubSubMenu2[1][1].Add('Cra.2 drop out >1326=380 rpm');
  SubSubMenu2[1][1].Add('Cra.3 drop out >1327=380 rpm');
  SubSubMenu2[1][1].Add('Checking before starting');
  SubSubMenu2[1][1].Add('Water temp.    >1154=0 C');
  SubSubMenu2[1][1].Add('Oil prelub.    >1155=0 mBar');
  SubSubMenu2[1][1].Add('Max time       >1146=60.0 s');
  SubSubMenu2[1][1].Add('Cooling thresh >1178=0 C');

  SetLength(SubSubMenu2[2], 7);
  SubSubMenu2[2][0] := TStringList.Create;
  SubSubMenu2[2][0].Add('Generator');
  SubSubMenu2[2][0].Add('Gen nominal kW >1006=320 kW');
  SubSubMenu2[2][0].Add('kW nominal 2   >1607=320 kW');
  SubSubMenu2[2][0].Add('Gen PT ratio   >1007=1.01');
  SubSubMenu2[2][0].Add('Gen CT1 ratio  >1008=150.0');
  SubSubMenu2[2][0].Add('Gen CT2 ratio  >1009=150.0');
  SubSubMenu2[2][0].Add('Gen CT3 ratio  >1010=150.0');
  SubSubMenu2[2][0].Add('Gen 1/3 phase  >1013=Triphase');
  SubSubMenu2[2][0].Add('Gen nom kVAR   >1015=240 kVAR');
  SubSubMenu2[2][0].Add('kVAR nominal 2 >1636=240 kVAR');

  SubSubMenu2[2][1] := TStringList.Create;
  SubSubMenu2[2][1].Add('Gen. under freq. protection');
  SubSubMenu2[2][1].Add('LV under freq. >1025=95.0 %');
  SubSubMenu2[2][1].Add('TM under freq. >1026=10.0 s');
  SubSubMenu2[2][1].Add('CT under freq. :1027=');
  SubSubMenu2[2][1].Add('>Fault (Soft shut down)');
  SubSubMenu2[2][1].Add('Gen. over freq protection');
  SubSubMenu2[2][1].Add('LV over freq. >1022=105.0 %');
  SubSubMenu2[2][1].Add('TM over freq. >1023=10.0 s');
  SubSubMenu2[2][1].Add('CT over freq. :1024=');
  SubSubMenu2[2][1].Add('>Fault (Soft shut down)');

  SubSubMenu2[2][2] := TStringList.Create;
  SubSubMenu2[2][2].Add('Gen. under volt protection');
  SubSubMenu2[2][2].Add('LV under volt >1028=93.0 %');
  SubSubMenu2[2][2].Add('TM under volt >1028=10.0 s');
  SubSubMenu2[2][2].Add('CT under volt :1030=');
  SubSubMenu2[2][2].Add('>Fault (Soft shut down)');
  SubSubMenu2[2][2].Add('Gen. over volt protection');
  SubSubMenu2[2][2].Add('LV over volt >1031=107.0 %');
  SubSubMenu2[2][2].Add('TM over volt >1032=10.0 s');
  SubSubMenu2[2][2].Add('CT over volt :1033= ');
  SubSubMenu2[2][2].Add('>Fault (Soft shut down)');

  SubSubMenu2[2][3] := TStringList.Create;
  SubSubMenu2[2][3].Add('Gen. mini kVAR protection');
  SubSubMenu2[2][3].Add('LV min kVAR >1034=20.0 %');
  SubSubMenu2[2][3].Add('TM min kVAR >1035=120.0 s');
  SubSubMenu2[2][3].Add('CT min kVAR :1036=');
  SubSubMenu2[2][3].Add('>Disable');
  SubSubMenu2[2][3].Add('Gen. maxi kVAR protection');
  SubSubMenu2[2][3].Add('LV max kVAR >1037=125.0 %');
  SubSubMenu2[2][3].Add('TM max KVAR >1038=30.0 s');
  SubSubMenu2[2][3].Add('CT max kVAR :1039= ');
  SubSubMenu2[2][3].Add('>Disable');

  SubSubMenu2[2][4] := TStringList.Create;
  SubSubMenu2[2][4].Add('Gen. reverse kW protection');
  SubSubMenu2[2][4].Add('LV Gen. -kW >1040=8.0 %');
  SubSubMenu2[2][4].Add('TM Gen. -kW >1041=15.0 s');
  SubSubMenu2[2][4].Add('CT Gen. -kW :1042=');
  SubSubMenu2[2][4].Add('>Fault (Soft shut down)');
  SubSubMenu2[2][4].Add('Gen. reverse kVAR protection');
  SubSubMenu2[2][4].Add('LV Gen. -kVAR >1043=6.0 %');
  SubSubMenu2[2][4].Add('TM Gen. -kVAR >1044=15.0 s');
  SubSubMenu2[2][4].Add('CT Gen. -kVAR :1045=');
  SubSubMenu2[2][4].Add('>Fault (Soft shut down)');

  SubSubMenu2[2][5] := TStringList.Create;
  SubSubMenu2[2][5].Add('Generator mini kW protection');
  SubSubMenu2[2][5].Add('LV min kW >1046=10.0 %');
  SubSubMenu2[2][5].Add('TM min kW >1047=120.0 s');
  SubSubMenu2[2][5].Add('CT min kW :1048=');
  SubSubMenu2[2][5].Add('>Disable');
  SubSubMenu2[2][5].Add('Generator maxi kW protection');
  SubSubMenu2[2][5].Add('LV max kW >1049=110.0 %');
  SubSubMenu2[2][5].Add('TM max kW >1050=60.0 s');
  SubSubMenu2[2][5].Add('CT max kW :1051=');
  SubSubMenu2[2][5].Add('>Disable');

  SubSubMenu2[2][6] := TStringList.Create;
  SubSubMenu2[2][6].Add('Gen. max current protection');
  SubSubMenu2[2][6].Add('LV max amps >1052=500 A');
  SubSubMenu2[2][6].Add('TM max amps >1053=30.0 s');
  SubSubMenu2[2][6].Add('CT max amps :1054=');
  SubSubMenu2[2][6].Add('>Disable');
  SubSubMenu2[2][6].Add('Gen. max neutral I protection');
  SubSubMenu2[2][6].Add('LV max In >1055=300 A');
  SubSubMenu2[2][6].Add('TM max In >1056=120.0 s');
  SubSubMenu2[2][6].Add('CT max In :1057=');
  SubSubMenu2[2][6].Add('>Disable');

  SetLength(SubSubMenu2[3], 3);
  SubSubMenu2[3][0] := TStringList.Create;
  SubSubMenu2[3][0].Add('Mains/Bus');
  SubSubMenu2[3][0].Add('MA kW <-> 20mA >1020=20000 kW');
  SubSubMenu2[3][0].Add('MA 0kW setting >1021=0 mA');
  SubSubMenu2[3][0].Add('MA PT ratio    >1016=1.00');
  SubSubMenu2[3][0].Add('MA back timer  >1085=30.0 s');
  SubSubMenu2[3][0].Add('Mains KW Meas. >1464=Internal');
  SubSubMenu2[3][0].Add('Ext kW measure >1461=+/- 20 mA');

  SubSubMenu2[3][1] := TStringList.Create;
  SubSubMenu2[3][1].Add('Mains under freq. protection');
  SubSubMenu2[3][1].Add('LV min Hz >1058=97.0 %');
  SubSubMenu2[3][1].Add('TM min Hz >1059=10.0 s');
  SubSubMenu2[3][1].Add('CT min Hz :1060=');
  SubSubMenu2[3][1].Add('>Alarm');
  SubSubMenu2[3][1].Add('Mains over freq. protection');
  SubSubMenu2[3][1].Add('LV max Hz >1061=103.0 %');
  SubSubMenu2[3][1].Add('TM max Hz >1062=10.0 s');
  SubSubMenu2[3][1].Add('CT max Hz :1063=');
  SubSubMenu2[3][1].Add('>Alarm');

  SubSubMenu2[3][2] := TStringList.Create;
  SubSubMenu2[3][2].Add('Mains under volt protection');
  SubSubMenu2[3][2].Add('LV min volt >1064=97.0 %');
  SubSubMenu2[3][2].Add('TM min volt >1065=10.0 s');
  SubSubMenu2[3][2].Add('CT min volt :1066=');
  SubSubMenu2[3][2].Add('>Alarm');
  SubSubMenu2[3][2].Add('Mains over volt protection');
  SubSubMenu2[3][2].Add('LV max volt >1067=103.0 %');
  SubSubMenu2[3][2].Add('TM max volt >1068=10.0 s');
  SubSubMenu2[3][2].Add('CT max volt :1069=');
  SubSubMenu2[3][2].Add('>Alarm');

  SetLength(SubSubMenu2[4], 5);
  SubSubMenu2[4][0] := TStringList.Create;
  SubSubMenu2[4][0].Add('Under speed protection');
  SubSubMenu2[4][0].Add('LV under speed >1163=93.0 %');
  SubSubMenu2[4][0].Add('TM under speed >1164=60.0 s');
  SubSubMenu2[4][0].Add('CT under speed :1165=');
  SubSubMenu2[4][0].Add('>Disable');
  SubSubMenu2[4][0].Add('Over speed protection');
  SubSubMenu2[4][0].Add('LV over speed >1160=107.0 %');
  SubSubMenu2[4][0].Add('TM over speed >1161=5.0 s');
  SubSubMenu2[4][0].Add('CT over speed :1162=');
  SubSubMenu2[4][0].Add('>Security (Hard shut down)');

  SubSubMenu2[4][1] := TStringList.Create;
  SubSubMenu2[4][1].Add('Min. oil pressure protection');
  SubSubMenu2[4][1].Add('LV min oil >1166=1000 mBar');
  SubSubMenu2[4][1].Add('TM min oil >1167=30.0 s');
  SubSubMenu2[4][1].Add('CT min oil :1168=');
  SubSubMenu2[4][1].Add('>Disable');
  SubSubMenu2[4][1].Add('Max. water temp. protection');
  SubSubMenu2[4][1].Add('LV max wat. to >1169=100 C');
  SubSubMenu2[4][1].Add('TM max wat. to >1170=30.0 s');
  SubSubMenu2[4][1].Add('CT max wat. to :1171=');
  SubSubMenu2[4][1].Add('>Disable');

  SubSubMenu2[4][2] := TStringList.Create;
  SubSubMenu2[4][2].Add('Engine measure 1 protection');
  SubSubMenu2[4][2].Add('LV measure 1 >1180=0');
  SubSubMenu2[4][2].Add('TM measure 1 >1181=0.0 s');
  SubSubMenu2[4][2].Add('CT measure 1 :1182=');
  SubSubMenu2[4][2].Add('>Disable');
  SubSubMenu2[4][2].Add('SS measure 1 >1183=Max thresh');
  SubSubMenu2[4][2].Add('Engine measure 2 protection');
  SubSubMenu2[4][2].Add('LV measure 2 >1184=0');
  SubSubMenu2[4][2].Add('TM measure 2 >1185=0.0 s');
  SubSubMenu2[4][2].Add('CT measure 2 :1186=');
  SubSubMenu2[4][2].Add('>Disable');
  SubSubMenu2[4][2].Add('SS measure 2 >1187=max thresh');

  SubSubMenu2[4][3] := TStringList.Create;
  SubSubMenu2[4][3].Add('battery min Voltage');
  SubSubMenu2[4][3].Add('LV min V batt >1172=20.0 V');
  SubSubMenu2[4][3].Add('TM min V batt >1173=60.0 s');
  SubSubMenu2[4][3].Add('CT min V batt :1174=');
  SubSubMenu2[4][3].Add('>Disable');
  SubSubMenu2[4][3].Add('Battery max voltage');
  SubSubMenu2[4][3].Add('LV max V batt >1186=32.0 V');
  SubSubMenu2[4][3].Add('TM max V batt >1195=60.0 s');
  SubSubMenu2[4][3].Add('CT max V batt :1198=');
  SubSubMenu2[4][3].Add('>Disable');

  SubSubMenu2[4][4] := TStringList.Create;
  SubSubMenu2[4][4].Add('Measure 1 to 4 thresholds');
  SubSubMenu2[4][4].Add('Oil threshold   >1175=0 mBar');
  SubSubMenu2[4][4].Add('Oil hysteresis  >1176=0 mBar');
  SubSubMenu2[4][4].Add('Wat temp thresh >1426=0 C');
  SubSubMenu2[4][4].Add('Wat temp hyst.  >1427=0 C');
  SubSubMenu2[4][4].Add('Meas 1 thresh.  >1428=0');
  SubSubMenu2[4][4].Add('Meas 1 hyst.    >1429=0');
  SubSubMenu2[4][4].Add('Meas 2 thresh.  >1430=0');
  SubSubMenu2[4][4].Add('Meas 2 hyst.    >1431=0');

  SetLength(SubSubMenu2[5], 2);
  SubSubMenu2[5][0] := TStringList.Create;
  SubSubMenu2[5][0].Add('Speed common settings');
  SubSubMenu2[5][0].Add('Speed measure  >1078=Alternator');
  SubSubMenu2[5][0].Add('Nb of teeth    >1106=76');
  SubSubMenu2[5][0].Add('Pole pair nb   >1109=2');
  SubSubMenu2[5][0].Add('Load pulse     >1074=0 %');
  SubSubMenu2[5][0].Add('Speed droop    >1075=0 %');
  SubSubMenu2[5][0].Add('Idle speed     >1079=1800 rpm');
  SubSubMenu2[5][0].Add('Speed 1        >1080=1800 rpm');
  SubSubMenu2[5][0].Add('Speed 2        >1081=1800 rpm');
  SubSubMenu2[5][0].Add('TM sensor lost >1458=15.0 s');

  SubSubMenu2[5][1] := TStringList.Create;
  SubSubMenu2[5][1].Add('External speed governor');
  SubSubMenu2[5][1].Add('ESG amplitude >1076=99.0 %');
  SubSubMenu2[5][1].Add('ESG offset    >1077=2.00 %');

  SetLength(SubSubMenu2[6], 3);
  SubSubMenu2[6][0] := TStringList.Create;
  SubSubMenu2[6][0].Add('Generator kW settings');
  SubSubMenu2[6][0].Add('Gen low lim    >1091=16 kW');
  SubSubMenu2[6][0].Add('Gen high lim   >1092=320 kW');
  SubSubMenu2[6][0].Add('Ge kWsetpoint1 >1093=300 kW');
  SubSubMenu2[6][0].Add('Ge kWsetpoint2 >1094=100 kW');
  SubSubMenu2[6][0].Add('Load ramp      >1151=50.0 s');
  SubSubMenu2[6][0].Add('Unload ramp    >1152=40.0 s');

  {$ENDREGION}

  {SubMenu System}
  SubMenu[2] := TStringList.Create;
  SubMenu[2].AddStrings([
    '> Date / Time / Meters',
    '> Passwords / Options',
    '> Gensys Screen Saver',
    '> Back Light Timer / Languages',
    '> Serial Ports Configuration',
    '> Serial Number / Soft Version'
  ]);

  {$REGION 'SubSubMenu3'}

  SetLength(SubSubMenu3[0], 2);
  SubSubMenu3[0][0] := TStringList.Create;
  SubSubMenu3[0][0].Add('Date / Time');
  SubSubMenu3[0][0].Add('Date format >day/month/year');
  SubSubMenu3[0][0].Add('Date        : >'+ FormatDateTime('dd/mm/yyyy', Now));
  SubSubMenu3[0][0].Add('Time (hh:mm): >'+ FormatDateTime('hh:nn:ss', Now));
  SubSubMenu3[0][0].Add('Meters reset');
  SubSubMenu3[0][0].Add('Gen. kW sum      : 0025>Reset');
  SubSubMenu3[0][0].Add('Gen. kVAR sum    : 0125>Reset');
  SubSubMenu3[0][0].Add('Mains kW sum     : 0061>Reset');
  SubSubMenu3[0][0].Add('Mains kVAR sum   : 0063>Reset');
  SubSubMenu3[0][0].Add('Hours run        : 0065>Reset');
  SubSubMenu3[0][0].Add('Nb of starts     : 0027>Reset');
  SubSubMenu3[0][0].Add('User meter 1     : 2657>Reset');
  SubSubMenu3[0][0].Add('User meter 2     : 2659>Reset');

  SubSubMenu3[0][1] := TStringList.Create;
  SubSubMenu3[0][1].Add('Dedicate meters setting');
  SubSubMenu3[0][1].Add('>User meter 1  :2657=');
  SubSubMenu3[0][1].Add('0000000000 >No Unit * >1');
  SubSubMenu3[0][1].Add('>User meter 2  :2659=');
  SubSubMenu3[0][1].Add('0000000000 >No Unit * >1');

  SetLength(SubSubMenu3[1], 1);
  SubSubMenu3[1][0] := TStringList.Create;
  SubSubMenu3[1][0].Add('Password');
  SubSubMenu3[1][0].Add('(8 characters max)');
  SubSubMenu3[1][0].Add('Level 0');
  SubSubMenu3[1][0].Add('Level 1');
  SubSubMenu3[1][0].Add('Options');
  SubSubMenu3[1][0].Add('Speed governor       : Off');
  SubSubMenu3[1][0].Add('Mains paralleling    : Off');
  SubSubMenu3[1][0].Add('Internet connection  : Off');
  SubSubMenu3[1][0].Add('CAN connection       : Off');
  SubSubMenu3[1][0].Add('Paralleling          : On');

  SetLength(SubSubMenu3[2], 1);
  SubSubMenu3[2][0] := TStringList.Create;
  SubSubMenu3[2][0].Add('Gensys screen saver');
  SubSubMenu3[2][0].Add('TM scr. saver >1266=10 mn');
  SubSubMenu3[2][0].Add('Screen saver text: ');
  SubSubMenu3[2][0].Add('Line 1 : (28 character max)');
  SubSubMenu3[2][0].Add('>Rotterdam');
  SubSubMenu3[2][0].Add('Line 2 : (28 character max)');
  SubSubMenu3[2][0].Add('>Neteherlands');
  SubSubMenu3[2][0].Add('Line 3 : (28 character max)');
  SubSubMenu3[2][0].Add('>Tel. +31 (0)10 487 19 11');
  SubSubMenu3[2][0].Add('Line 4 : (28 character max)');
  SubSubMenu3[2][0].Add('www.imtechmarine.nl');

  SetLength(SubSubMenu3[3], 1);
  SubSubMenu3[3][0] := TStringList.Create;
  SubSubMenu3[3][0].Add('Back light timer / Languages');
  SubSubMenu3[3][0].Add('TM back light  >1014=5 mn');
  SubSubMenu3[3][0].Add('PC language    >English');
  SubSubMenu3[3][0].Add('Local language >English');

  SetLength(SubSubMenu3[4], 2);
  SubSubMenu3[4][0] := TStringList.Create;
  SubSubMenu3[4][0].Add('COM 1');
  SubSubMenu3[4][0].Add('RS232  : TCP/IP protocol.');
  SubSubMenu3[4][0].Add('Speed  : 19200 bps');
  SubSubMenu3[4][0].Add('8 data bits.');
  SubSubMenu3[4][0].Add('No parity.');
  SubSubMenu3[4][0].Add('1 stop bits.');
  SubSubMenu3[4][0].Add('Flow control : ');
  SubSubMenu3[4][0].Add('     Hardware (RTS/CTS).');
  SubSubMenu3[4][0].Add('Not isolated');
  SubSubMenu3[4][0].Add('COM 2 ');
  SubSubMenu3[4][0].Add('CAN1 V2.0 A');
  SubSubMenu3[4][0].Add('Speed : 125 kbps');
  SubSubMenu3[4][0].Add('CRE owner protocol.');
  SubSubMenu3[4][0].Add('Not isolated');

  SubSubMenu3[4][1] := TStringList.Create;
  SubSubMenu3[4][1].Add('COM 3');
  SubSubMenu3[4][1].Add('COM 4');
  SubSubMenu3[4][1].Add('RS285 : MODBUS RTU');
  SubSubMenu3[4][1].Add('Modbus address >1634=1');
  SubSubMenu3[4][1].Add('MODBUS speed   >1441=19200');
  SubSubMenu3[4][1].Add('8 data bits.');
  SubSubMenu3[4][1].Add('No parity. ');
  SubSubMenu3[4][1].Add('1 stop bits.');
  SubSubMenu3[4][1].Add('Not isolated');
  SubSubMenu3[4][1].Add('2 wires');

  SetLength(SubSubMenu3[5], 1);
  SubSubMenu3[5][0] := TStringList.Create;
  SubSubMenu3[5][0].Add('Serial number : 2907C093');
  SubSubMenu3[5][0].Add('Soft version  : v2.10f');

  {$ENDREGION}
end;

procedure TfrmEmergencyPanel.LoadMainMenu(MainIndex: Integer);
var
  ActiveListBox : TListBox;
begin
  if lstMenu.Visible then
  begin
    ActiveListBox := lstMenu;

    pnlUp1.Visible := True;
    pnlDown1.Visible := True;
    pnlBlack1.Visible := True;
    pnlBlack2.Visible := True;
    pnlBlack3.Visible := True;

    pnlUp1.BringToFront;
    pnlDown1.BringToFront;
    pnlBlack1.BringToFront;
    pnlBlack2.BringToFront;
    pnlBlack3.BringToFront;
  end
  else if lstFaultPage.Visible then
  begin
    ActiveListBox := lstFaultPage;
  end
  else if lstAlarmPage.Visible then
  begin
    ActiveListBox := lstAlarmPage;
  end
  else if lstInfoPage.Visible then
  begin
    ActiveListBox := lstInfoPage;
  end;

  CurrentMenuIndex := 0;
  ActiveListBox.Items.Assign(MainMenu[CurrentMenuIndex]);
  InSubMenu := False;
  InSubSubMenu := False;
end;

procedure TfrmEmergencyPanel.LoadSubMenu(SubIndex: Integer);
begin
  if (SubIndex >= 0) and (SubIndex < Length(SubMenu)) and Assigned(SubMenu[SubIndex]) then
  begin
    lstMenu.Items.Assign(SubMenu[SubIndex]);
    InSubMenu := True;
    SubMenuIndex := SubIndex;
    InSubSubMenu := False;

    pnlLeft.Visible := True;
    pnlRight.Visible := True;
    pnlUp2.Visible := True;
    pnlDown2.Visible := True;
    pnlBlack3.Visible := True;

    pnlLeft.BringToFront;
    pnlRight.BringToFront;
    pnlUp2.BringToFront;
    pnlDown2.BringToFront;
    pnlBlack3.BringToFront;
  end;
end;

procedure TfrmEmergencyPanel.LoadSubSubMenu(page: Integer);
begin
  lstMenu.Clear;

  pnlLeft.Visible := True;
  pnlRight.Visible := True;
  pnlBlack1.Visible := True;
  pnlBlack2.Visible := True;
  pnlBlack3.Visible := True;

  pnlLeft.BringToFront;
  pnlRight.BringToFront;
  pnlBlack1.BringToFront;
  pnlBlack2.BringToFront;
  pnlBlack3.BringToFront;

  if (CurrentMenuIndex = 0) and
     (SubMenuIndex < Length(SubSubMenu1)) and
     (Page < Length(SubSubMenu1[SubMenuIndex])) then
  begin
    lstMenu.Items.Assign(SubSubMenu1[SubMenuIndex][Page]);
    InSubSubMenu := True;
    SubSubMenuPage := Page;
  end
  else if (CurrentMenuIndex = 1) and
      (SubMenuIndex < Length(SubSubMenu2)) and
     (Page < Length(SubSubMenu2[SubMenuIndex])) then
  begin
    lstMenu.Items.Assign(SubSubMenu2[SubMenuIndex][Page]);
    InSubSubMenu := True;
    SubSubMenuPage := Page;
  end
  else if (CurrentMenuIndex = 2) and
      (SubMenuIndex < Length(SubSubMenu3)) and
     (Page < Length(SubSubMenu3[SubMenuIndex])) then
  begin
    lstMenu.Items.Assign(SubSubMenu3[SubMenuIndex][Page]);
    InSubSubMenu := True;
    SubSubMenuPage := Page;
  end;
end;

procedure TfrmEmergencyPanel.MenuAlarmPage;
begin
//  MainMenu[0]:= TStringList.Create;
//  MainMenu[0].AddStrings([
//    'Alarm 1/2',
//    FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + ' ' ]);
end;

procedure TfrmEmergencyPanel.MenuFaultPage;
begin
//  MainMenu[0]:= TStringList.Create;
//  MainMenu[0].AddStrings([
//    'Faults 1/2',
//    FormatDateTime('dd/mm/yyyy hh:nn:ss', Now)+ '  ']);
end;

procedure TfrmEmergencyPanel.MenuInfoPage;
begin
  MainMenu[0]:= TStringList.Create;
  MainMenu[0].AddStrings([
    'Information 1/2',
    'Power : Waiting',
    'Engine : Waiting',
    'Generator freq >20     = 000.00 Hz',
    'Bus frequency >23      = 059.99 Hz',
    'Engine speed >33       = 000000 rpm',
    'Speed sign sum > 2058  = 000000',
    'Gen. number >1179      = 000002',
    'Bus CAN fault >1259    = 000006',
    'Load sharing I >1901   = 000005',
    'User pram 091 >1728    = 000000',
    'Master gen. Nb >2739   = 000000',
    'Priority gen. > 2241   = 000000'
    ]);

  MainMenu[1]:= TStringList.Create;
  MainMenu[1].AddStrings([
    'Information 2/2',
    'Power : Waiting',
    'Engine : Waiting',
    'Generator freq >20     = 000.00 Hz',
    'Freq G >1111           = 000020%',
    'Freq P >1112           = 000080%',
    'Freq I >1113           = 000020%',
    'Nb of gen. >1147       = 000004',
    'Hz center gain >1902   = 000025%',
    'Inhibit GE04 >2694     = 000000',
    'Load sharing P >1900   = 000005%',
    'Power mode >2088       = 000000',
    'Fault >1332            = 000005'
    ]);
end;


//procedure TfrmEmergencyPanel.tmrAmpereTimer(Sender: TObject);
//begin
//  if vraAmpere1.Position > OrderAmpere then
//  begin
//    vraAmpere1.Position := vraAmpere1.Position - 1;
//  end
//  else if vraAmpere1.Position < OrderAmpere then
//  begin
//    vraAmpere1.Position := vraAmpere1.Position + 1;
//  end
//  else
//  begin
//    tmrAmpere.Enabled := False;
//  end;
//end;

{$ENDREGION}

end.
