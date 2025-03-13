unit uEmergencyStopManager;

interface

uses
  uDataType;

type
  TEmergencyStopManager = class
  private


  public
    procedure NetEventControllerCommonCmd(apRec: PAnsiChar; aSize: Word);
    procedure NetEventInstructorCommonCmd(apRec: PAnsiChar; aSize: Word);

  end;

implementation

uses uEmergencyStop;

{ TEmergencyStopManager }

procedure TEmergencyStopManager.NetEventControllerCommonCmd(apRec: PAnsiChar;
  aSize: Word);
var
  rec : ^R_Common_EmergencyStop_Command;
begin
  rec := @apRec^;

  if rec.CommandID = epPMSGeneratorEmergencyStop then
  begin
    if rec.GenId = 'Generator 1' then
      frmEmergencyStop.Gen[0] := rec.ValueBool
    else if rec.GenId = 'Generator 2' then
      frmEmergencyStop.Gen[1] := rec.ValueBool
    else if rec.GenId = 'Generator 3' then
      frmEmergencyStop.Gen[2] := rec.ValueBool
    else if rec.GenId = 'Generator 4' then
      frmEmergencyStop.Gen[3] := rec.ValueBool;
  end;
end;

procedure TEmergencyStopManager.NetEventInstructorCommonCmd(apRec: PAnsiChar;
  aSize: Word);
var
  rec : ^R_Common_Instr_Command;
  i,aCount : integer;
begin
  rec := @apRec^;

  case rec.CommandID of
    C_ORD_FREEZE_APP :
    begin
      if not frmEmergencyStop.CheckBox1.Checked then
      begin
        if frmEmergencyStop.btnload.Caption = 'Disconnect' then
          frmEmergencyStop.btnload.OnClick(frmEmergencyStop.btnload);
      end;
    end;

    C_ORD_UNFREEZE_APP :
    begin
      if frmEmergencyStop.CheckBox1.Checked then
        frmEmergencyStop.CheckBox1.Checked := False;

      if frmEmergencyStop.btnload.Caption = 'Connect' then
          frmEmergencyStop.btnload.OnClick(frmEmergencyStop.btnload);
    end;

    C_ORD_CLOSE_APP :
    begin
      frmEmergencyStop.CheckBox1.Checked := True;
      frmEmergencyStop.btnload.Caption := 'Disconnect';
      frmEmergencyStop.btnload.OnClick(frmEmergencyStop.btnload);
    end;
  end;
end;

end.
