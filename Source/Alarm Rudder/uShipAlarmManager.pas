unit uShipAlarmManager;

interface

uses uDataType;

type
  TShipAlarmManager = class
  private

  public
    procedure NetEventInstructorCommonCmd(apRec: PAnsiChar; aSize: Word);
  end;


implementation

uses uShipAlarm;

{ TShipAlarmManager }

procedure TShipAlarmManager.NetEventInstructorCommonCmd(apRec: PAnsiChar;
  aSize: Word);
var
  rec : ^R_Common_Instr_Command;
  i,aCount : integer;
begin
  rec := @apRec^;

  case rec.CommandID of
    C_ORD_FREEZE_APP :
    begin
      if not frmShipAlarm.CheckBox1.Checked then
      begin
        if frmShipAlarm.btnload.Caption = 'Disconnect' then
          frmShipAlarm.btnload.OnClick(frmShipAlarm.btnload);
      end;
    end;

    C_ORD_UNFREEZE_APP :
    begin
      if frmShipAlarm.CheckBox1.Checked then
      begin
        {app mode di ubah k alarm rudder}
        frmShipAlarm.CheckBox1.Checked := False;
        frmShipAlarm.CheckBox1Click(nil);
      end;

      if frmShipAlarm.btnload.Caption = 'Connect' then
          frmShipAlarm.btnload.OnClick(frmShipAlarm.btnload);
    end;

    C_ORD_CLOSE_APP :
    begin
      frmShipAlarm.CheckBox1.Checked := True;
      frmShipAlarm.btnload.Caption := 'Disconnect';
      frmShipAlarm.btnload.OnClick(frmShipAlarm.btnload);
    end;
  end;

  case E_PropsID(rec^.aProps) of
    epBoardAlarmLamp:
    begin
      {setAlarmLamp}

      for I := 0 to  Length(frmShipAlarm.FLamp)- 1 do
      begin
        if rec.ID = (i+1) then  //penyesuaian arraynya>> mulai dari 0 sedangkan ID mulai dari 1
        begin
          frmShipAlarm.FLamp[i] := rec.Value;
          if rec.Value then
           frmShipAlarm.AlarmStop := false;
        end;
      end;

    end;

    epBoardTelegramKiri :
    begin

      for I := 1 to 11 do
      begin
        if rec.ID = (i) then
        begin
          frmShipAlarm.FTelegrm[i] := rec.Value;
          frmShipAlarm.tempIn := i;
          frmShipAlarm.isInput := True;
          frmShipAlarm.isFirst := False;

          if rec.ValueByte = 1 then {Terima Pesan, status telegrap hrs membalas}
            frmShipAlarm.Status  := 2

          else if rec.ValueByte = 2 then {Terima Balasan, status telegrap siap mengirim lagi}
            frmShipAlarm.Status  := 1;

          frmShipAlarm.ProsId := epBoardTelegramKiri;
          frmShipAlarm.setIndikator(i);
        end
        else
          frmShipAlarm.FTelegrm[i] := False;
        frmShipAlarm.FTempTelegrm[i] := False;
      end;
    end;

    epRudderIndicator :
    begin
      for I := 0 to  Length(frmShipAlarm.FRudderIndicator)- 1 do
      begin
        if rec.ID = (i+1) then  //penyesuaian arraynya>> mulai dari 0 sedangkan ID mulai dari 1
        begin
          frmShipAlarm.FRudderIndicator[i] := rec.Value;
          break;
        end;
      end;
    end;

  end;
end;
end.
