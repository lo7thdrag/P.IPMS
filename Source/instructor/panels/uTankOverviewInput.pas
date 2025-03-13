unit uTankOverviewInput;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmTankOverInput = class(TForm)
    pnl1: TPanel;
    edtTankOvInput: TEdit;
    lbl1: TLabel;
    pnl2: TPanel;
    lbl2: TLabel;
    cbbStateTankOvEle: TComboBox;
    btnTankOvInput: TButton;
    btnCancel: TButton;
    procedure btnTankOvInputClick(Sender: TObject);
    procedure setTankIdentifier(val : string);
    function getElementID : string;
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    FValueElementID : string;
    FTankIdentifier : string;
  public
    { Public declarations }
    //property elementID Integer read
  end;

var
  frmTankOverInput: TfrmTankOverInput;

implementation
uses uSSL, uControllerSystem, uDataType, uERSystem;
{$R *.dfm}

procedure TfrmTankOverInput.btnCancelClick(Sender: TObject);
begin
  frmTankOverInput.Close;
end;

procedure TfrmTankOverInput.btnTankOvInputClick(Sender: TObject);
  function GetTankID(aTankID: string): Integer;
  begin
    if aTankID = '2621S0001A' then Result := 0;
    if aTankID = '2621S0002A' then Result := 1;
    if aTankID = '2622S0001A' then Result := 2;
    if aTankID = '5292S0001A' then Result := 3;
    if aTankID = '5292S0002A' then Result := 4;
    if aTankID = '5292S0003A' then Result := 5;
    if aTankID = '5321S0001A' then Result := 6;
    if aTankID = '5321S0002A' then Result := 7;
    if aTankID = '5321S0003A' then Result := 8;
    if aTankID = '5411S0001A' then Result := 9;
    if aTankID = '5411S0002A' then Result := 10;
    if aTankID = '5411S0003A' then Result := 11;
    if aTankID = '5411S0004A' then Result := 12;
    if aTankID = '5411S0006A' then Result := 13;
    if aTankID = '5412S0001A' then Result := 14;
    if aTankID = '5412S0004A' then Result := 15;
    if aTankID = '5412S0010A' then Result := 16;
    if aTankID = '5932S0001A' then Result := 17;
  end;
var
  aStateElement : E_StateDisabled ;
  validValue : Boolean;
  tankIndex : Integer;
begin
  validValue := False;
  aStateElement := sdDisabled;

  if (FTankIdentifier = '5292S0002A') or (FTankIdentifier = '5292S0003A') then
  begin
    if (StrToFloat(edtTankOvInput.Text) < 21.96) and (StrToFloat(edtTankOvInput.Text) > 0) then
    begin
      validValue := True;
    end
    else
    begin
      validValue := False;
      ShowMessage('min value = 0, max value = 21.96');
    end;
  end
  else if FTankIdentifier = '5292S0001A' then
  begin
    if (StrToFloat(edtTankOvInput.Text) < 37.02) and (StrToFloat(edtTankOvInput.Text) > 0) then
    begin
      validValue := True;
    end
    else
    begin
      validValue := False;
      ShowMessage('min value = 0, max value = 37.02');
    end;
  end
  else if (FTankIdentifier = '5321S0002A') or (FTankIdentifier = '5321S0001A') then
  begin
    if (StrToFloat(edtTankOvInput.Text) < 15.29) and (StrToFloat(edtTankOvInput.Text) > 0) then
    begin
      validValue := True;
    end
    else
    begin
      validValue := False;
      ShowMessage('min value = 0, max value = 15.29');
    end;
  end
  else if FTankIdentifier = '5321S0003A' then
  begin
    if (StrToFloat(edtTankOvInput.Text) < 120.64) and (StrToFloat(edtTankOvInput.Text) > 0) then
    begin
      validValue := True;
    end
    else
    begin
      validValue := False;
      ShowMessage('min value = 0, max value = 120.64');
    end;
  end
  else if FTankIdentifier = '5411S0001A' then
  begin
    if (StrToFloat(edtTankOvInput.Text) < 80.35) and (StrToFloat(edtTankOvInput.Text) > 0) then
    begin
      validValue := True;
    end
    else
    begin
      validValue := False;
      ShowMessage('min value = 0, max value = 80.35');
    end;
  end
  else if FTankIdentifier = '5411S0002A' then
  begin
    if (StrToFloat(edtTankOvInput.Text) < 35.17) and (StrToFloat(edtTankOvInput.Text) > 0) then
    begin
      validValue := True;
    end
    else
    begin
      validValue := False;
      ShowMessage('min value = 0, max value = 35.17');
    end;
  end
  else if FTankIdentifier = '5411S0003A' then
  begin
    if (StrToFloat(edtTankOvInput.Text) < 45.43) and (StrToFloat(edtTankOvInput.Text) > 0) then
    begin
      validValue := True;
    end
    else
    begin
      validValue := False;
      ShowMessage('min value = 0, max value = 45.43');
    end;
  end
  else if FTankIdentifier = '5411S0004A' then
  begin
    if (StrToFloat(edtTankOvInput.Text) < 41.76) and (StrToFloat(edtTankOvInput.Text) > 0) then
    begin
      validValue := True;
    end
    else
    begin
      validValue := False;
      ShowMessage('min value = 0, max value = 41.76');
    end;
  end
  else if FTankIdentifier = '5412S0010A' then
  begin
    if (StrToFloat(edtTankOvInput.Text) < 9.42) and (StrToFloat(edtTankOvInput.Text) > 0) then
    begin
      validValue := True;
    end
    else
    begin
      validValue := False;
      ShowMessage('min value = 0, max value = 9.42');
    end;
  end
  else if FTankIdentifier = '5411S0006A' then
  begin
    if (StrToFloat(edtTankOvInput.Text) < 9) and (StrToFloat(edtTankOvInput.Text) > 0) then
    begin
      validValue := True;
    end
    else
    begin
      validValue := False;
      ShowMessage('min value = 0, max value = 9');
    end;
  end
  else if (FTankIdentifier = '5412S0004A') or (FTankIdentifier = '5412S0001A') then
  begin
    if (StrToFloat(edtTankOvInput.Text) < 7.59) and (StrToFloat(edtTankOvInput.Text) > 0) then
    begin
      validValue := True;
    end
    else
    begin
      validValue := False;
      ShowMessage('min value = 0, max value = 7.59');
    end;
  end
  else if FTankIdentifier = '2621S0002A' then
  begin
    if (StrToFloat(edtTankOvInput.Text) < 5.69) and (StrToFloat(edtTankOvInput.Text) > 0) then
    begin
      validValue := True;
    end
    else
    begin
      validValue := False;
      ShowMessage('min value = 0, max value = 5.69');
    end;
  end
  else if FTankIdentifier = '2621S0001A' then
  begin
    if (StrToFloat(edtTankOvInput.Text) < 1.50) and (StrToFloat(edtTankOvInput.Text) > 0) then
    begin
      validValue := True;
    end
    else
    begin
      validValue := False;
      ShowMessage('min value = 0, max value = 1.50');
    end;
  end
  else if (FTankIdentifier = '5932S0001A') or (FTankIdentifier = '2622S0001A') then
  begin
    if (StrToFloat(edtTankOvInput.Text) < 4.49) and (StrToFloat(edtTankOvInput.Text) > 0) then
    begin
      validValue := True;
    end
    else
    begin
      validValue := False;
      ShowMessage('min value = 0, max value = 4.49');
    end;
  end;

  if validValue = True then
  begin
    if cbbStateTankOvEle.Text = 'Enabled' then
      aStateElement := sdEnabled
    else if cbbStateTankOvEle.Text = 'Disabled' then
      aStateElement := sdDisabled;

    CtrlSystem.Controller.getElement(FTankIdentifier).StateElementDisabled := aStateElement;

    with ERSystem.ERManager.EngineRoom.getFuelOilSystem do
    begin
      GetTank(C_TankIdentifier[GetTankID(FTankIdentifier)]).Content := StrToFloat(edtTankOvInput.Text);
    end;

    frmTankOverInput.Close;
    edtTankOvInput.Text := '0';
  end;
end;

function TfrmTankOverInput.getElementID: string;
begin
  Result := FValueElementID;
end;

procedure TfrmTankOverInput.setTankIdentifier(val: string);
begin
  FTankIdentifier := val;
end;

end.
