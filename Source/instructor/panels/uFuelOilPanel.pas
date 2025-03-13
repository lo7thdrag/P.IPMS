unit uFuelOilPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseComponent, uTankSensor, Buttons, StdCtrls, jpeg, ExtCtrls,
  uDataType;

type
  TfrmFuelOilPanel = class(TForm)
    img1: TImage;
    edt1: TEdit;
    btn1: TSpeedButton;
    btn2: TSpeedButton;
    edt2: TEdit;
    edt3: TEdit;
    edt4: TEdit;
    edt5: TEdit;
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
    btnFillDaily: TBitBtn;
    btnFillTK: TBitBtn;
    btnDailyPS: TSpeedButton;
    btnDailySB: TSpeedButton;
    btnTrans: TSpeedButton;
    btnService: TSpeedButton;
    btnKlepTK4: TSpeedButton;
    btnKlepTK3: TSpeedButton;
    btnKlepTk2: TSpeedButton;
    btnKlepTK1: TSpeedButton;
    btn5: TBitBtn;
    btn6: TBitBtn;
    btn3: TBitBtn;
    btn4: TBitBtn;
    btn7: TBitBtn;
    btn8: TBitBtn;
    btn9: TBitBtn;
    btn10: TBitBtn;
    btn14: TSpeedButton;
    btn13: TSpeedButton;
    btn12: TSpeedButton;
    btnFillOver: TSpeedButton;
    btnOvTK: TSpeedButton;
    btn11: TSpeedButton;
    btn15: TSpeedButton;
    btn16: TSpeedButton;
    btn17: TSpeedButton;

    procedure btn1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btn1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btn2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btn2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnFillDailyMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnFillDailyMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnFillTKMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnFillOverMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btn17MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btn17MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    FNewValue : Double;
    AsButton  : Byte;

    procedure FillDailyTank;
    procedure FillFOTank;
    procedure FillOverLoadTank;
    procedure ConfirmNewVAlue(tag : Integer);
    procedure CheckReal(EdtText : string);

    function GetTankIndex(aIdentifier: string): Integer;
    function GetCaption(tag: Integer) : string;
  public
    { Public declarations }
  end;

  E_BitButtonMean = (bbmSetContent, bbmFlowStart, bbmFlowStop);

var
  frmFuelOilPanel: TfrmFuelOilPanel;

implementation

uses
  uERSystem;

{$R *.dfm}

procedure TfrmFuelOilPanel.btn17MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
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

procedure TfrmFuelOilPanel.btn17MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  i, tankIndex : Integer;
begin
  tankIndex := GetTankIndex(GetCaption(TSpeedButton(Sender).Tag));

  with ERSystem.ERManager.EngineRoom.getFuelOilSystem do
  begin
    GetTank(C_TankIdentifier[tankIndex]).Transferring := False;
  end;
end;

procedure TfrmFuelOilPanel.btn1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
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

procedure TfrmFuelOilPanel.btn1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  i, tankIndex : Integer;
begin
  tankIndex := GetTankIndex(GetCaption(TSpeedButton(Sender).Tag));

  with ERSystem.ERManager.EngineRoom.getFuelOilSystem do
  begin
    GetTank(C_TankIdentifier[tankIndex]).Filling := False;
  end;
end;

procedure TfrmFuelOilPanel.btn2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  i, tankIndex : Integer;
begin
  tankIndex := TSpeedButton(Sender).Tag;

  ConfirmNewVAlue(TSpeedButton(Sender).Tag);

  case TSpeedButton(Sender).Tag of
    14,15,16:
    begin
      with ERSystem.ERManager.EngineRoom.getFuelOilSystem do
      begin
        GetTank(C_TankIdentifier[tankIndex]).Transferring := True;
        GetTank(C_TankIdentifier[tankIndex]).TransferPerSec := 0.9;
      end;
    end;
  end;
end;

procedure TfrmFuelOilPanel.btn2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  i, tankIndex : Integer;
begin
  tankIndex := TSpeedButton(Sender).Tag;

  with ERSystem.ERManager.EngineRoom.getFuelOilSystem do
  begin
    GetTank(C_TankIdentifier[tankIndex]).Transferring := False;
  end;
end;

procedure TfrmFuelOilPanel.btnFillDailyMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  i, tankIndex : Integer;
begin
  tankIndex := GetTankIndex(GetCaption(TBitBtn(Sender).Tag));

  ConfirmNewVAlue(TBitBtn(Sender).Tag);

  with ERSystem.ERManager.EngineRoom.getFuelOilSystem do
  begin
    GetTank(C_TankIdentifier[tankIndex]).Transferring := True;
    GetTank(C_TankIdentifier[tankIndex]).TransferPerSec := FNewValue;
  end;

  FillDailyTank;

  AsButton := 0;
end;

procedure TfrmFuelOilPanel.btnFillDailyMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  i, tankIndex : Integer;
begin
  tankIndex := GetTankIndex(GetCaption(TBitBtn(Sender).Tag));

  with ERSystem.ERManager.EngineRoom.getFuelOilSystem do
  begin
    GetTank(C_TankIdentifier[tankIndex]).Transferring := False;

    if AsButton = 0 then
    begin
      if (btnTrans.Down and not btnService.Down) or
       (not btnTrans.Down and btnService.Down)  then
      begin

        if (btnDailyPS.Down and not btnDailySB.Down) then
        begin
          GetTank(C_TankIdentifier[btnDailyPS.Tag]).Filling := False;
        end
        else if (not btnDailyPS.Down and btnDailySB.Down) then
        begin
          GetTank(C_TankIdentifier[btnDailySB.Tag]).Filling := False;
        end;
      end;
    end;

    if AsButton = 1 then
    begin
      if btnKlepTK1.Down and
        not btnKlepTK2.Down and
        not btnKlepTK3.Down and
        not btnKlepTK4.Down then
      begin
        GetTank(C_TankIdentifier[btnKlepTK1.Tag]).Filling := False;
      end
      else if btnKlepTK2.Down and
        not btnKlepTK1.Down and
        not btnKlepTK3.Down and
        not btnKlepTK4.Down then
      begin
        GetTank(C_TankIdentifier[btnKlepTK2.Tag]).Filling := False;
      end
      else if btnKlepTK3.Down and
        not btnKlepTK1.Down and
        not btnKlepTK2.Down and
        not btnKlepTK4.Down then
      begin
        GetTank(C_TankIdentifier[btnKlepTK3.Tag]).Filling := False;
      end
      else if btnKlepTK4.Down and
        not btnKlepTK1.Down and
        not btnKlepTK2.Down and
        not btnKlepTK3.Down then
      begin
        GetTank(C_TankIdentifier[btnKlepTK4.Tag]).Filling := False;
      end
    end;

    if AsButton = 2 then
    begin
      if btnOvTK.Down then
        GetTank(C_TankIdentifier[btnOvTK.Tag]).Filling := False;
    end;
  end;
end;

procedure TfrmFuelOilPanel.btnFillOverMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  i, tankIndex : Integer;
begin
  tankIndex := GetTankIndex(GetCaption((TSpeedButton(Sender)).Tag));

  ConfirmNewVAlue(TSpeedButton(Sender).Tag);

  with ERSystem.ERManager.EngineRoom.getFuelOilSystem do
  begin
    GetTank(C_TankIdentifier[tankIndex]).Transferring := True;
    GetTank(C_TankIdentifier[tankIndex]).TransferPerSec := FNewValue;
  end;

  FillOverLoadTank;

  AsButton := 2;
end;

procedure TfrmFuelOilPanel.btnFillTKMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  i, tankIndex : Integer;
begin
  tankIndex := GetTankIndex(GetCaption(TBitBtn(Sender).Tag));;

  ConfirmNewVAlue(TBitBtn(Sender).Tag);

  with ERSystem.ERManager.EngineRoom.getFuelOilSystem do
  begin
    GetTank(C_TankIdentifier[tankIndex]).Transferring := True;
    GetTank(C_TankIdentifier[tankIndex]).TransferPerSec := FNewValue;
  end;

  FillFOTank;

  AsButton := 1;
end;

procedure TfrmFuelOilPanel.CheckReal(EdtText: string);
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
    EdtText:= Format('%f', [R]);
end;

procedure TfrmFuelOilPanel.ConfirmNewVAlue(tag : Integer);
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

procedure TfrmFuelOilPanel.FillDailyTank;
begin

  if (btnTrans.Down and not btnService.Down) or
     (not btnTrans.Down and btnService.Down)  then
  begin

    with ERSystem.ERManager.EngineRoom.getFuelOilSystem do
    begin

      if (btnDailyPS.Down and not btnDailySB.Down) then
      begin
        GetTank(C_TankIdentifier[btnDailyPS.Tag]).Filling := True;
        GetTank(C_TankIdentifier[btnDailyPS.Tag]).FillPerSec := FNewValue
      end
      else if (not btnDailyPS.Down and btnDailySB.Down) then
      begin
        GetTank(C_TankIdentifier[btnDailySB.Tag]).Filling := True;
        GetTank(C_TankIdentifier[btnDailySB.Tag]).FillPerSec := FNewValue
      end
      else if (btnDailyPS.Down and btnDailySB.Down) or
        (not btnDailyPS.Down and not btnDailySB.Down) then
      begin
        Exit;
      end;
    end;
  end
  else if (btnTrans.Down and btnService.Down) or
    (not btnTrans.Down and not btnService.Down) then
  begin
    Exit;
  end;
end;

procedure TfrmFuelOilPanel.FillFOTank;
begin
  with ERSystem.ERManager.EngineRoom.getFuelOilSystem do
  begin

    if btnKlepTK1.Down and
      not btnKlepTK2.Down and
      not btnKlepTK3.Down and
      not btnKlepTK4.Down then
    begin
      GetTank(C_TankIdentifier[btnKlepTK1.Tag]).Filling := True;
      GetTank(C_TankIdentifier[btnKlepTK1.Tag]).FillPerSec := FNewValue
    end
    else if btnKlepTK2.Down and
      not btnKlepTK1.Down and
      not btnKlepTK3.Down and
      not btnKlepTK4.Down then
    begin
      GetTank(C_TankIdentifier[btnKlepTK2.Tag]).Filling := True;
      GetTank(C_TankIdentifier[btnKlepTK2.Tag]).FillPerSec := FNewValue
    end
    else if btnKlepTK3.Down and
      not btnKlepTK1.Down and
      not btnKlepTK2.Down and
      not btnKlepTK4.Down then
    begin
      GetTank(C_TankIdentifier[btnKlepTK3.Tag]).Filling := True;
      GetTank(C_TankIdentifier[btnKlepTK3.Tag]).FillPerSec := FNewValue
    end
    else if btnKlepTK4.Down and
      not btnKlepTK1.Down and
      not btnKlepTK2.Down and
      not btnKlepTK3.Down then
    begin
      GetTank(C_TankIdentifier[btnKlepTK4.Tag]).Filling := True;
      GetTank(C_TankIdentifier[btnKlepTK4.Tag]).FillPerSec := FNewValue
    end
    else if (btnKlepTK1.Down and
      btnKlepTK2.Down and
      btnKlepTK3.Down and
      btnKlepTK4.Down)
      or
      (not btnKlepTK1.Down and
      not btnKlepTK2.Down and
      not btnKlepTK3.Down and
      not btnKlepTK4.Down) then
    begin
      Exit;
    end;
  end;
end;

procedure TfrmFuelOilPanel.FillOverLoadTank;
begin
  with ERSystem.ERManager.EngineRoom.getFuelOilSystem do
  begin
    if btnOvTK.Down then
    begin
      GetTank(C_TankIdentifier[btnOvTK.Tag]).Filling := True;
      GetTank(C_TankIdentifier[btnOvTK.Tag]).FillPerSec := FNewValue;
    end
    else
      Exit;
  end;
end;

function TfrmFuelOilPanel.GetCaption(tag: Integer): string;
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

function TfrmFuelOilPanel.GetTankIndex(aIdentifier: string): Integer;
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

end.
