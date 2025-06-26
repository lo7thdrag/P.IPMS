unit ufrmEmergencyPanel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, VrControls,
  VrRotarySwitch, VrAngularMeter, Vcl.ExtCtrls,

  uGenerator, uDataType, uMainForm;

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
    ImgShift: TImage;
    ImgLower: TImage;
    ImgRaise: TImage;
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
  private
    Led  : array of TImage;
    LedStatus  : array of Boolean;

    labels : array[0..62] of TLabel;
    currentIndex : Integer;

    procedure createlabels;
    procedure HighlightLabel(index : Integer);
    procedure UnhighlightLabel(index : Integer);
    procedure ClearAllHighlight;


    function CekGeneratorCondition : Boolean;

  public
    OrderAmpere : Double;

    procedure UpdateForm(Generator : TGenerator);
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

  createlabels;
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

procedure TfrmEmergencyPanel.ImgEscClick(Sender: TObject);
begin
  createlabels;
  pnlPassword.Visible := True;
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
end;

procedure TfrmEmergencyPanel.ImgF4Click(Sender: TObject);
begin
  if CurrentIndex < High(Labels) then
  begin
    UnhighlightLabel(CurrentIndex);
    Inc(CurrentIndex);
    ClearAllHighlight;
    HighlightLabel(CurrentIndex);
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

{$ENDREGION}

{$REGION ' Additional Procedure '}

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
    if (i = 25) or (i = 51) then
    begin
      x := 7;
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
