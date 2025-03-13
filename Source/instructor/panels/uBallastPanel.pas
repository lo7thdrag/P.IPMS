unit uBallastPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls, uDataType;

type
  TfrmBallastPanel = class(TForm)
    img1: TImage;
    btn1: TSpeedButton;
    btn2: TSpeedButton;
    edt1: TEdit;
    btn3: TSpeedButton;
    btn4: TSpeedButton;
    edt2: TEdit;
    btn6: TSpeedButton;
    btn7: TSpeedButton;
    edt3: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
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

    FNewValue : Double;

    procedure ConfirmNewVAlue(tag : Integer);
    procedure CheckReal(EdtText : string);

    function GetCaption(tag: Integer) : string;
    function GetTankIndex(aIdentifier: string): Integer;
  public
    { Public declarations }
  end;

var
  frmBallastPanel: TfrmBallastPanel;

implementation

uses
  uERSystem;

{$R *.dfm}

procedure TfrmBallastPanel.btn1MouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TfrmBallastPanel.btn1MouseUp(Sender: TObject; Button: TMouseButton;
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

procedure TfrmBallastPanel.btn2MouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TfrmBallastPanel.btn2MouseUp(Sender: TObject; Button: TMouseButton;
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

procedure TfrmBallastPanel.CheckReal(EdtText: string);
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

procedure TfrmBallastPanel.ConfirmNewVAlue(tag: Integer);
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

function TfrmBallastPanel.GetCaption(tag: Integer): string;
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

function TfrmBallastPanel.GetTankIndex(aIdentifier: string): Integer;
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
