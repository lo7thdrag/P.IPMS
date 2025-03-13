unit uPanelThrottleManager;
interface

uses uDataType;

type
  TShipAlarmManager = class
  private


  public
    procedure NetEventInstructorCommonCmd(apRec: PAnsiChar; aSize: Word);
    procedure NetEventStatusThrottleCommand2(apRec: PAnsiChar; aSize: Word);

  end;


implementation

uses uPanelThrottle;

{ TShipAlarmManager }

procedure TShipAlarmManager.NetEventInstructorCommonCmd(apRec: PAnsiChar;
  aSize: Word);
var
  rec : ^R_Common_Instr_Command;
  i : integer;
begin
  rec := @apRec^;

  case rec.CommandID of
    C_ORD_FREEZE_APP :
    begin
      if not frmPanelThrottle.CheckBox1.Checked then
      begin
        if frmPanelThrottle.btnload.Caption = 'Disconnect' then
          frmPanelThrottle.btnload.OnClick(frmPanelThrottle.btnload);
      end;
    end;

    C_ORD_UNFREEZE_APP :
    begin
      if frmPanelThrottle.CheckBox1.Checked then
      begin
        {app mode di ubah k alarm rudder}
        frmPanelThrottle.CheckBox1.Checked := False;
        frmPanelThrottle.CheckBox1Click(nil);
      end;

      if frmPanelThrottle.btnload.Caption = 'Connect' then
          frmPanelThrottle.btnload.OnClick(frmPanelThrottle.btnload);
    end;

    C_ORD_CLOSE_APP :
    begin
      frmPanelThrottle.CheckBox1.Checked := True;
      frmPanelThrottle.btnload.Caption := 'Disconnect';
      frmPanelThrottle.btnload.OnClick(frmPanelThrottle.btnload);
    end;
  end;

  case E_PropsID(rec^.aProps) of
    epBoardAlarmLampKanan:
    begin
      {setAlarmLamp}
      frmPanelThrottle.FLamp[rec.ID - 1] := rec.Value;
      if rec.Value then
       frmPanelThrottle.AlarmStop := false;
    end;

    epBoardTelegramKanan :
    begin

      for I := 1 to 11 do
      begin
        if rec.ID = (i) then
        begin
          frmPanelThrottle.FTelegrm[i] := rec.Value;
          frmPanelThrottle.tempIn := i;
          frmPanelThrottle.isInput := True;
          frmPanelThrottle.isFirst := False;
          frmPanelThrottle.ProsId := epBoardTelegramKanan;

          if rec.ValueByte = 1 then {Terima Pesan, status telegrap hrs membalas}
            frmPanelThrottle.Status  := 2

          else if rec.ValueByte = 2 then {Terima Balasan, status telegrap siap mengirim lagi}
            frmPanelThrottle.Status  := 1;
            frmPanelThrottle.setIndikator(i);
        end
        else
          frmPanelThrottle.FTelegrm[i] := False;
        frmPanelThrottle.FTempTelegrm[i] := False;
      end;
    end;

  end;
end;

procedure TShipAlarmManager.NetEventStatusThrottleCommand2(apRec: PAnsiChar;
  aSize: Word);
var
  rec: ^R_Common_PanelThrottle_Command;
begin
   rec := @apRec^;
  {nerima dari controller dari PCS}

  frmPanelThrottle.FPanel[rec.aID] := rec.aValue;
end;


end.
