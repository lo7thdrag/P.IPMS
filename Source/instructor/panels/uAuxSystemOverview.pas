unit uAuxSystemOverview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus, VrControls, VrButtons, Buttons;

type
  TfrmAuxSystemOverview = class(TForm)
    pnlAuxOverview: TPanel;
    pnl1: TPanel;
    lbl1: TLabel;
    btnStartAirComp1T: TButton;
    btnStartAirComp2T: TButton;
    pnl7: TPanel;
    lbl7: TLabel;
    lbl8: TLabel;
    btn8: TButton;
    btn9: TButton;
    pnl8: TPanel;
    lbl9: TLabel;
    btnRudderPST: TButton;
    pnl2: TPanel;
    lbl2: TLabel;
    btnChillUnit1T: TButton;
    pnl3: TPanel;
    lbl3: TLabel;
    btnChillUnit2T: TButton;
    pnl9: TPanel;
    lbl10: TLabel;
    btnRUDDERSBT: TButton;
    pnl11: TPanel;
    lbl12: TLabel;
    lbl13: TLabel;
    btnAlarmColumnAudioT: TButton;
    pnl4: TPanel;
    lbl4: TLabel;
    btn5T: TButton;
    pnl5: TPanel;
    lbl5: TLabel;
    btnICCPT: TButton;
    pnl10: TPanel;
    lbl11: TLabel;
    btnAccomodLadderT: TButton;
    pnl15: TPanel;
    lbl17: TLabel;
    btnPilyBilgeppmT: TButton;
    btnOilyBilgeFailT: TButton;
    pnl6: TPanel;
    lbl6: TLabel;
    btn7T: TButton;
    pnlFreshSeaWater: TPanel;
    pnl12: TPanel;
    lbl14: TLabel;
    btnFWGen1RunTT: TButton;
    btnFWGen1FailT: TButton;
    pnl13: TPanel;
    lbl15: TLabel;
    btnFWGen2RunT: TButton;
    btnFWGen2FailT: TButton;
    pnl14: TPanel;
    lbl16: TLabel;
    btnHotColdP12T: TButton;
    btnHotColdFailT: TButton;
    GroupBox1: TGroupBox;
    btnStartAirComp1: TVrDemoButton;
    Label31: TLabel;
    Label30: TLabel;
    btnStartAirComp2: TVrDemoButton;
    Label1: TLabel;
    Label2: TLabel;
    btnChillUnit1: TVrDemoButton;
    Label3: TLabel;
    Label4: TLabel;
    btnChillUnit2: TVrDemoButton;
    Label5: TLabel;
    Label6: TLabel;
    btnSewage: TVrDemoButton;
    Label7: TLabel;
    Label8: TLabel;
    btnICCP: TVrDemoButton;
    Label9: TLabel;
    Label10: TLabel;
    btnMed: TVrDemoButton;
    Label11: TLabel;
    Label12: TLabel;
    btnRudderPS: TVrDemoButton;
    Label13: TLabel;
    Label14: TLabel;
    btnRUDDERSB: TVrDemoButton;
    Label15: TLabel;
    Label16: TLabel;
    btnAlarmColumnAudio: TVrDemoButton;
    Label17: TLabel;
    Label18: TLabel;
    btnAccomodLadder: TVrDemoButton;
    btnPilyBilgeppm: TVrDemoButton;
    Label19: TLabel;
    Label20: TLabel;
    btnOilyBilgeFail: TVrDemoButton;
    btnProvis: TVrDemoButton;
    Label21: TLabel;
    Label22: TLabel;
    btnCold: TVrDemoButton;
    Label23: TLabel;
    Label24: TLabel;
    btnFWGen1Run: TVrDemoButton;
    Label25: TLabel;
    Label26: TLabel;
    btnFWGen1Fail: TVrDemoButton;
    btnFWGen2Run: TVrDemoButton;
    Label27: TLabel;
    Label28: TLabel;
    btnFWGen2Fail: TVrDemoButton;
    btnHotColdP12: TVrDemoButton;
    Label29: TLabel;
    Label32: TLabel;
    btnHotColdFail: TVrDemoButton;
    Label33: TLabel;
    pm1: TPopupMenu;
    mniAlarm1: TMenuItem;
    mniEnable1: TMenuItem;
    mniDisable1: TMenuItem;
    mniFalse1: TMenuItem;
    btn1: TSpeedButton;
    btn2: TSpeedButton;
    edt1: TEdit;
    procedure btnStartAirComp1TMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mniAlarm1Click(Sender: TObject);
    procedure mniEnable1Click(Sender: TObject);
    procedure mniDisable1Click(Sender: TObject);
    procedure mniFalse1Click(Sender: TObject);
    procedure btn1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btn1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btn2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btn2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

  private
    { Private declarations }
    aElementID : String;
    FNewValue : Double;

    procedure ConfirmNewVAlue(tag : Integer);
    procedure CheckReal(EdtText : string);

    function GetCaption(tag: Integer) : string;
    function GetTankIndex(aIdentifier: string): Integer;

    procedure SetBtnColor(Id : string; warna: integer);
  public
    { Public declarations }
  end;

var
  frmAuxSystemOverview: TfrmAuxSystemOverview;

implementation

uses
  uSWEInput, uMimicsSystem, uDataType, uControllerSystem, uSWE, uIPMS_Data,
  uERSystem;

{$R *.dfm}

procedure TfrmAuxSystemOverview.btn1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  i, tankIndex : Integer;
begin
  tankIndex := GetTankIndex(GetCaption(TSpeedButton(Sender).Tag));

  ConfirmNewVAlue(TSpeedButton(Sender).Tag);

  with ERSystem.ERManager.EngineRoom.getFuelOilSystem do
  begin
    GetTank(C_TankIdentifier[tankIndex]).Filling := True;
    GetTank(C_TankIdentifier[tankIndex]).FillPerSec := FNewValue;
  end;
end;

procedure TfrmAuxSystemOverview.btn1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  i, tankIndex : Integer;
begin
  tankIndex := GetTankIndex(GetCaption(TSpeedButton(Sender).Tag));

  with ERSystem.ERManager.EngineRoom.getFuelOilSystem do
  begin
    GetTank(C_TankIdentifier[tankIndex]).Filling := False;
  end;
end;

procedure TfrmAuxSystemOverview.btn2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  i, tankIndex : Integer;
begin
  tankIndex := GetTankIndex(GetCaption(TSpeedButton(Sender).Tag));

  ConfirmNewVAlue(TSpeedButton(Sender).Tag);

  with ERSystem.ERManager.EngineRoom.getFuelOilSystem do
  begin
    GetTank(C_TankIdentifier[tankIndex]).Transferring := True;
    GetTank(C_TankIdentifier[tankIndex]).TransferPerSec := FNewValue;
  end;
end;

procedure TfrmAuxSystemOverview.btn2MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  i, tankIndex : Integer;
begin
  tankIndex := GetTankIndex(GetCaption(TSpeedButton(Sender).Tag));

  with ERSystem.ERManager.EngineRoom.getFuelOilSystem do
  begin
    GetTank(C_TankIdentifier[tankIndex]).Transferring := False;
  end;
end;

procedure TfrmAuxSystemOverview.btnStartAirComp1TMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  pt : TPoint;
begin
  if Button = mbRight then
  begin
    if not Assigned(frmSWEInput) then
      frmSWEInput := TfrmSWEInput.Create(Self);

    if TButton(Sender).Tag = 0 then
    begin
      SysMimics.Mimic.ShowMimic(mtAux);
      SysMimics.Mimic.AddMimicHistory(Ord(mtAux));
    end
    else if TButton(Sender).Tag = 1 then
    begin
      SysMimics.Mimic.ShowMimic(mtSeaWater);
      SysMimics.Mimic.AddMimicHistory(Ord(mtSeaWater));
    end;

    GetCursorPos(pt);
    pm1.Popup(pt.X, pt.Y);

    aElementID := TButton(Sender).Hint;
  end;

//  frmSWEInput.setElementID(TButton(Sender).Hint);
//  frmSWEInput.Top := pt.Y;
//  frmSWEInput.Left := pt.X;
//  frmSWEInput.Show;
end;

procedure TfrmAuxSystemOverview.CheckReal(EdtText: string);
var
  R : Real;
  Code : Integer;
begin
  Val(EdtText, R, Code);

  if Code <> 0 then
  begin
    R := 0;

    MessageDlg('Please check your input..', mtError, [mbOK], 0);
  end
  else
    EdtText := Format('%f', [R]);
end;

procedure TfrmAuxSystemOverview.ConfirmNewVAlue(tag: Integer);
var
  i, tankIndex : Integer;
  newValue : Double;
begin
  newValue := 0; // init

  with ERSystem.ERManager.EngineRoom.getFuelOilSystem do
  begin
    for i := 0 to ComponentCount - 1 do
    begin
      if Components[i] is TEdit then
      begin
        if  TEdit(Components[i]).Tag = tag then
        begin
          if TEdit(Components[i]).Text = '' then
            Exit;

          CheckReal(TEdit(Components[i]).Text);

          newValue := StrToFloat(TEdit(Components[i]).Text);
          Break;
        end;
      end;
    end;

    FNewValue := newValue;
  end;
end;

function TfrmAuxSystemOverview.GetCaption(tag: Integer): string;
var
  tankCaption : string;
  i :  Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TLabel then
    begin
      if TLabel(Components[i]).Tag = tag then
      begin
        tankCaption := TLabel(Components[i]).Caption;

        Result := tankCaption;
        Break;
      end;
    end;
  end;
end;

function TfrmAuxSystemOverview.GetTankIndex(aIdentifier: string): Integer;
var
  i : Integer;
begin
  Result := 0;
  for i := 0 to Length(C_TankIdentifier) - 1 do
  begin
    if aIdentifier = C_TankIdentifier[i] then
    begin
      Result := i;
      Break;
    end;
  end;
end;

procedure TfrmAuxSystemOverview.mniAlarm1Click(Sender: TObject);
begin
  TSWEElement(CtrlSystem.Controller.getElement(aElementID)).StateElementDisabled := sdEnabled;
  TSWEElement(CtrlSystem.Controller.getElement(aElementID)).StateAlarmInhibited := siNotInhibited;
  TSWEElement(CtrlSystem.Controller.getElement(aElementID)).Mode := 0;

  if TSWEElement(CtrlSystem.Controller.getElement(aElementID)).NONC = 0 then
    TSWEElement(CtrlSystem.Controller.getElement(aElementID)).StateInState := True
  else if TSWEElement(CtrlSystem.Controller.getElement(aElementID)).NONC = 1 then
    TSWEElement(CtrlSystem.Controller.getElement(aElementID)).StateInState := False;

  {Prince : Ngeset warna button jadi merah}
  SetBtnColor(aElementID, clRed);
end;

procedure TfrmAuxSystemOverview.mniDisable1Click(Sender: TObject);
begin
  TSWEElement(CtrlSystem.Controller.getElement(aElementID)).StateElementDisabled := sdDisabled;

  {Prince : Ngeset warna button jadi pink}
  SetBtnColor(aElementID, clFuchsia);
end;

procedure TfrmAuxSystemOverview.mniEnable1Click(Sender: TObject);
begin
  TSWEElement(CtrlSystem.Controller.getElement(aElementID)).StateElementDisabled := sdEnabled;
  TSWEElement(CtrlSystem.Controller.getElement(aElementID)).StateAlarmInhibited := siInhibited;
  TSWEElement(CtrlSystem.Controller.getElement(aElementID)).Mode := 1;

  if TSWEElement(CtrlSystem.Controller.getElement(aElementID)).NONC = 0 then
    TSWEElement(CtrlSystem.Controller.getElement(aElementID)).StateInState := False
  else if TSWEElement(CtrlSystem.Controller.getElement(aElementID)).NONC = 1 then
    TSWEElement(CtrlSystem.Controller.getElement(aElementID)).StateInState := True;

  {Prince : Ngeset warna button jadi hijau}
  SetBtnColor(aElementID, clLime);
end;

procedure TfrmAuxSystemOverview.mniFalse1Click(Sender: TObject);
begin
  TSWEElement(CtrlSystem.Controller.getElement(aElementID)).StateElementDisabled := sdUnavailable;

  {Prince : Ngeset warna button jadi normal}
  SetBtnColor(aElementID, clBtnFace);
end;

procedure TfrmAuxSystemOverview.SetBtnColor(Id: string; warna: integer);
begin
  if Id = '5511A0001A'  then
    btnStartAirComp1.Color := warna
  else if Id = '5511A0002A'  then
    btnStartAirComp2.Color := warna
  else if Id = '5161A0001A' then
    btnChillUnit1.Color := warna
  else if Id = '5161A0002A' then
    btnChillUnit2.Color := warna
  else if Id = '5281A0001A' then
    btnSewage.Color := warna
  else if Id = '6331E0001A' then
    btnICCP.Color := warna
  else if Id = '4364E5001A' then
    btnMed.Color := warna
  else if Id = '5610E0005A'  then
    btnRudderPS.Color := warna
  else if Id = '5610E0005B'  then
    btnRUDDERSB.Color := warna
  else if Id = '4365E5011B' then
    btnAlarmColumnAudio.Color := warna
  else if Id = '6234E0004A' then
    btnAccomodLadder.Color := warna
  else if Id = '5932A0001A' then
    btnPilyBilgeppm.Color := warna
  else if Id = '5932A0001B' then
    btnOilyBilgeFail.Color := warna
  else if Id = '5162A0001A' then
    btnProvis.Color := warna
  else if Id = '4363E5001A' then
    btnCold.Color := warna
    else if Id = '5310A0001B' then
    btnFWGen1Run.Color := warna
  else if Id = '5310A0001A' then
    btnFWGen1Fail.Color := warna
  else if Id = '5310A0002B' then
    btnFWGen2Run.Color := warna
  else if Id = '5310A0002A' then
    btnFWGen2Fail.Color := warna
  else if Id = '5322A0001B' then
    btnHotColdP12.Color := warna
  else if Id = '5322A0001A' then
    btnHotColdFail.Color := warna

end;

end.
