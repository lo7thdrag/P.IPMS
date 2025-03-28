

unit uAlarmRudder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, uAlarmRudderClass, StdCtrls, VrControls, VrWheel, Buttons,
  SpeedButtonImage;

type
  TfrmAlarmRudder = class(TForm)
    pnlRudderAlarm: TPanel;
    pnlRudderAlarmPort: TPanel;
    lbl1: TLabel;
    pnl16: TPanel;
    lbl2: TLabel;
    lbl3: TLabel;
    pnlRudderIndicator: TPanel;
    pnlRudderIndPort: TPanel;
    lbl4: TLabel;
    pnl17: TPanel;
    lbl6: TLabel;
    lbl5: TLabel;
    btnInpRudderLeft: TButton;
    edtRudderLeftInp: TEdit;
    edtRudderLeft: TEdit;
    edtRudderValue: TEdit;
    pnlRudderMainPos: TPanel;
    pnl18: TPanel;
    vrwhlRudderPanelRight: TVrWheel;
    pnlRudderPosition: TPanel;
    vrwhlRudderLeft: TVrWheel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lblStarBoardValue: TLabel;
    btnLampKanan15: TSpeedButtonImage;
    btnLampKanan14: TSpeedButtonImage;
    btnLampKanan12: TSpeedButtonImage;
    btnLampKanan13: TSpeedButtonImage;
    btnLampKanan10: TSpeedButtonImage;
    btnLampKanan9: TSpeedButtonImage;
    btnLampKanan6: TSpeedButtonImage;
    btnLampKanan7: TSpeedButtonImage;
    btnLampKanan8: TSpeedButtonImage;
    btnLampKanan5: TSpeedButtonImage;
    btnLampKanan4: TSpeedButtonImage;
    btnLampKanan3: TSpeedButtonImage;
    btnLampKanan2: TSpeedButtonImage;
    btnLampKanan1: TSpeedButtonImage;
    btnLampKanan11: TSpeedButtonImage;
    btnPumpKiri1: TSpeedButtonImage;
    btnPumpKiri2: TSpeedButtonImage;
    btnPumpKiri3: TSpeedButtonImage;
    btnPumpKiri4: TSpeedButtonImage;
    btnPumpKiri5: TSpeedButtonImage;
    btnPumpKiri6: TSpeedButtonImage;
    btnPumpKanan1: TSpeedButtonImage;
    btnPumpKanan2: TSpeedButtonImage;
    btnPumpKanan3: TSpeedButtonImage;
    btnPumpKanan4: TSpeedButtonImage;
    btnPumpKanan5: TSpeedButtonImage;
    btnPumpKanan6: TSpeedButtonImage;
    lblPortValue: TLabel;
    tmr1: TTimer;
    Image1: TImage;
    btnLampKiri1: TSpeedButtonImage;
    btnLampKiri6: TSpeedButtonImage;
    btnLampKiri9: TSpeedButtonImage;
    btnLampKiri12: TSpeedButtonImage;
    btnLampKiri14: TSpeedButtonImage;
    btnLampKiri2: TSpeedButtonImage;
    btnLampKiri7: TSpeedButtonImage;
    btnLampKiri10: TSpeedButtonImage;
    btnLampKiri13: TSpeedButtonImage;
    btnLampKiri15: TSpeedButtonImage;
    btnLampKiri3: TSpeedButtonImage;
    btnLampKiri8: TSpeedButtonImage;
    btnLampKiri11: TSpeedButtonImage;
    btnLampKiri4: TSpeedButtonImage;
    btnLampKiri5: TSpeedButtonImage;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnInpRudderLeftClick(Sender: TObject);
    procedure vrwhlRudderLeftMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure vrwhlRudderPanelRightMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure btnLampKiri1Click(Sender: TObject);
    procedure btnPumpKiri1Click(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
  private
    { Private declarations }
    Alarm : TAlarmObj;
    rudderSent_SB, rudderSent_PS, counter : Integer;
  public
    { Public declarations }
  end;

var
  frmAlarmRudder: TfrmAlarmRudder;

implementation

uses uInstructorSystem, uDataType, uERSystem;

{$R *.dfm}

procedure TfrmAlarmRudder.btnPumpKiri1Click(Sender: TObject);
begin
  with Alarm do
  begin
    props := epRudderIndicator;
    Value := true;
    aID   := TSpeedButtonImage(sender).tag;
  end;
  InstructorSys.ClassAlarm.setLamp(Alarm);

  if (TSpeedButtonImage(Sender).Tag = 1) or
    (TSpeedButtonImage(Sender).Tag = 4) or
    (TSpeedButtonImage(Sender).Tag = 7) or
    (TSpeedButtonImage(Sender).Tag = 10) then
  begin
    TSpeedButtonImage(sender).Color := clLime;
  end
  else if (TSpeedButtonImage(Sender).Tag = 2) or
    (TSpeedButtonImage(Sender).Tag = 5) or
    (TSpeedButtonImage(Sender).Tag = 8) or
    (TSpeedButtonImage(Sender).Tag = 11) then
  begin
    TSpeedButtonImage(sender).Color := clRed;
  end
  else if (TSpeedButtonImage(Sender).Tag = 3) or
    (TSpeedButtonImage(Sender).Tag = 6) or
    (TSpeedButtonImage(Sender).Tag = 9) or
    (TSpeedButtonImage(Sender).Tag = 12) then
  begin
    TSpeedButtonImage(sender).Color := clWhite;
  end;

  if TSpeedButtonImage(Sender).Tag < 4 then
  begin
    if TSpeedButtonImage(Sender).Tag = 1 then
    begin
      with Alarm do
      begin
        props := epRudderIndicator;
        Value := false;
        aID   := 2;
      end;
      InstructorSys.ClassAlarm.setLamp(Alarm);

      with Alarm do
      begin
        props := epRudderIndicator;
        Value := false;
        aID   := 3;
      end;
      InstructorSys.ClassAlarm.setLamp(Alarm);

      btnPumpKiri2.Color := clGray;
      btnPumpKiri3.Color := clGray;
    end
    else if TSpeedButtonImage(Sender).Tag = 2 then
    begin
      with Alarm do
      begin
        props := epRudderIndicator;
        Value := false;
        aID   := 1;
      end;
      InstructorSys.ClassAlarm.setLamp(Alarm);

      with Alarm do
      begin
        props := epRudderIndicator;
        Value := false;
        aID   := 3;
      end;
      InstructorSys.ClassAlarm.setLamp(Alarm);

      btnPumpKiri1.Color := clGray;
      btnPumpKiri3.Color := clGray;
    end
    else if TSpeedButtonImage(Sender).Tag = 3 then
    begin
      with Alarm do
      begin
        props := epRudderIndicator;
        Value := false;
        aID   := 1;
      end;
      InstructorSys.ClassAlarm.setLamp(Alarm);

      with Alarm do
      begin
        props := epRudderIndicator;
        Value := false;
        aID   := 2;
      end;
      InstructorSys.ClassAlarm.setLamp(Alarm);

      btnPumpKiri1.Color := clGray;
      btnPumpKiri2.Color := clGray;
    end;
  end
  else if (TSpeedButtonImage(Sender).Tag > 3) and
    (TSpeedButtonImage(Sender).Tag < 7) then
  begin
    if TSpeedButtonImage(Sender).Tag = 4 then
    begin
      with Alarm do
      begin
        props := epRudderIndicator;
        Value := false;
        aID   := 5;
      end;
      InstructorSys.ClassAlarm.setLamp(Alarm);

      with Alarm do
      begin
        props := epRudderIndicator;
        Value := false;
        aID   := 6;
      end;
      InstructorSys.ClassAlarm.setLamp(Alarm);

      btnPumpKiri5.Color := clGray;
      btnPumpKiri6.Color := clGray;
    end
    else if TSpeedButtonImage(Sender).Tag = 5 then
    begin
      with Alarm do
      begin
        props := epRudderIndicator;
        Value := false;
        aID   := 4;
      end;
      InstructorSys.ClassAlarm.setLamp(Alarm);

      with Alarm do
      begin
        props := epRudderIndicator;
        Value := false;
        aID   := 6;
      end;
      InstructorSys.ClassAlarm.setLamp(Alarm);

      btnPumpKiri4.Color := clGray;
      btnPumpKiri6.Color := clGray;
    end
    else if TSpeedButtonImage(Sender).Tag = 6 then
    begin
      with Alarm do
      begin
        props := epRudderIndicator;
        Value := false;
        aID   := 4;
      end;
      InstructorSys.ClassAlarm.setLamp(Alarm);

      with Alarm do
      begin
        props := epRudderIndicator;
        Value := false;
        aID   := 5;
      end;
      InstructorSys.ClassAlarm.setLamp(Alarm);

      btnPumpKiri4.Color := clGray;
      btnPumpKiri5.Color := clGray;
    end;
  end
  else if (TSpeedButtonImage(Sender).Tag > 6) and
    (TSpeedButtonImage(Sender).Tag < 10) then
  begin
    if TSpeedButtonImage(Sender).Tag = 7 then
    begin
      with Alarm do
      begin
        props := epRudderIndicator;
        Value := false;
        aID   := 8;
      end;
      InstructorSys.ClassAlarm.setLamp(Alarm);

      with Alarm do
      begin
        props := epRudderIndicator;
        Value := false;
        aID   := 9;
      end;
      InstructorSys.ClassAlarm.setLamp(Alarm);

      btnPumpKanan2.Color := clGray;
      btnPumpKanan3.Color := clGray;
    end
    else if TSpeedButtonImage(Sender).Tag = 8 then
    begin
      with Alarm do
      begin
        props := epRudderIndicator;
        Value := false;
        aID   := 7;
      end;
      InstructorSys.ClassAlarm.setLamp(Alarm);

      with Alarm do
      begin
        props := epRudderIndicator;
        Value := false;
        aID   := 9;
      end;
      InstructorSys.ClassAlarm.setLamp(Alarm);

      btnPumpKanan1.Color := clGray;
      btnPumpKanan3.Color := clGray;
    end
    else if TSpeedButtonImage(Sender).Tag = 9 then
    begin
      with Alarm do
      begin
        props := epRudderIndicator;
        Value := false;
        aID   := 7;
      end;
      InstructorSys.ClassAlarm.setLamp(Alarm);

      with Alarm do
      begin
        props := epRudderIndicator;
        Value := false;
        aID   := 8;
      end;
      InstructorSys.ClassAlarm.setLamp(Alarm);

      btnPumpKanan1.Color := clGray;
      btnPumpKanan2.Color := clGray;
    end;
  end
  else if (TSpeedButtonImage(Sender).Tag > 9) and
    (TSpeedButtonImage(Sender).Tag < 13) then
  begin
    if TSpeedButtonImage(Sender).Tag = 10 then
    begin
      with Alarm do
      begin
        props := epRudderIndicator;
        Value := false;
        aID   := 11;
      end;
      InstructorSys.ClassAlarm.setLamp(Alarm);

      with Alarm do
      begin
        props := epRudderIndicator;
        Value := false;
        aID   := 12;
      end;
      InstructorSys.ClassAlarm.setLamp(Alarm);

      btnPumpKanan5.Color := clGray;
      btnPumpKanan6.Color := clGray;
    end
    else if TSpeedButtonImage(Sender).Tag = 11 then
    begin
      with Alarm do
      begin
        props := epRudderIndicator;
        Value := false;
        aID   := 10;
      end;
      InstructorSys.ClassAlarm.setLamp(Alarm);

      with Alarm do
      begin
        props := epRudderIndicator;
        Value := false;
        aID   := 12;
      end;
      InstructorSys.ClassAlarm.setLamp(Alarm);

      btnPumpKanan4.Color := clGray;
      btnPumpKanan6.Color := clGray;
    end
    else if TSpeedButtonImage(Sender).Tag = 12 then
    begin
      with Alarm do
      begin
        props := epRudderIndicator;
        Value := false;
        aID   := 10;
      end;
      InstructorSys.ClassAlarm.setLamp(Alarm);

      with Alarm do
      begin
        props := epRudderIndicator;
        Value := false;
        aID   := 11;
      end;
      InstructorSys.ClassAlarm.setLamp(Alarm);

      btnPumpKanan4.Color := clGray;
      btnPumpKanan5.Color := clGray;
    end;
  end;
end;

procedure TfrmAlarmRudder.btnInpRudderLeftClick(Sender: TObject);
var
  rudderValue : Integer;
begin
  vrwhlRudderLeft.Position := StrToInt(edtRudderLeftInp.Text);
  rudderValue := Round((vrwhlRudderLeft.Position - 30)/1.4);

  if rudderValue > 80 then
    rudderValue := rudderValue - 1;

  edtRudderValue.Text := IntToStr(rudderValue);
end;

procedure TfrmAlarmRudder.btnLampKiri1Click(Sender: TObject);
begin
  if TSpeedButtonImage(sender).Tag <= 15 then
  begin
    if TSpeedButtonImage(sender).Color = clGray then
    begin
      with Alarm do
      begin
        props := epBoardAlarmLamp;
        Value := true;
        aID   := TSpeedButtonImage(sender).Tag;
      end;

      InstructorSys.ClassAlarm.setLamp(Alarm);
      TSpeedButtonImage(sender).Color := clRed;
    end
    else
    begin
      with Alarm do
      begin
        props := epBoardAlarmLamp;
        Value := false;
        aID   := TSpeedButtonImage(sender).Tag;
      end;

      InstructorSys.ClassAlarm.setLamp(Alarm);
      TSpeedButtonImage(sender).Color := clGray;
    end;
  end
  else
  begin
    if TSpeedButtonImage(sender).Color = clGray then
    begin
      with Alarm do
      begin
        props := epBoardAlarmLampKanan;
        Value := true;
        aID   := TSpeedButtonImage(sender).Tag - 20;
      end;

      InstructorSys.ClassAlarm.setLamp(Alarm);
      TSpeedButtonImage(sender).Color := clRed;
    end
    else
    begin
      with Alarm do
      begin
        props := epBoardAlarmLampKanan;
        Value := false;
        aID   := TSpeedButtonImage(sender).Tag - 20;
      end;

      InstructorSys.ClassAlarm.setLamp(Alarm);
      TSpeedButtonImage(sender).Color := clGray;
    end;
  end;
end;

procedure TfrmAlarmRudder.FormCreate(Sender: TObject);
begin
  btnLampKiri1.Tag := 1;        //kiri
  btnLampKiri2.Tag := 2;
  btnLampKiri3.Tag := 3;
  btnLampKiri4.Tag := 4;
  btnLampKiri5.Tag := 5;
  btnLampKiri6.Tag := 6;
  btnLampKiri7.Tag := 7;
  btnLampKiri8.Tag := 8;
  btnLampKiri9.Tag := 9;
  btnLampKiri10.Tag := 10;
  btnLampKiri11.Tag := 11;
  btnLampKiri12.Tag := 12;
  btnLampKiri13.Tag := 13;
  btnLampKiri14.Tag := 14;
  btnLampKiri15.Tag := 15;

  btnLampKanan1.Tag := 21;    //kanan +20
  btnLampKanan2.Tag := 22;
  btnLampKanan3.Tag := 23;
  btnLampKanan4.Tag := 24;
  btnLampKanan5.Tag := 25;
  btnLampKanan6.Tag := 26;
  btnLampKanan7.Tag := 27;
  btnLampKanan8.Tag := 28;
  btnLampKanan9.Tag := 29;
  btnLampKanan10.Tag := 30;
  btnLampKanan11.Tag := 31;
  btnLampKanan12.Tag := 32;
  btnLampKanan13.Tag := 33;
  btnLampKanan14.Tag := 34;
  btnLampKanan15.Tag := 35;

  btnLampKiri1.Caption := 'OVERLOAD' + #13#10 + 'PUMP 1';        //kiri
  btnLampKiri2.Caption := 'OVERLOAD' + #13#10 + 'PUMP 2';
  btnLampKiri3.Caption := 'HYDRAULIC' + #13#10 + 'LOCK'+ #13#10 + 'PUMP 1';
  btnLampKiri4.Caption := 'CLOGGED' + #13#10 + 'FILTER'+ #13#10 + 'PUMP 1';
  btnLampKiri5.Caption := 'CLOGGED' + #13#10 + 'FILTER'+ #13#10 + 'PUMP 2';
  btnLampKiri6.Caption := 'PHASE' + #13#10 + 'FAILURE'+ #13#10 + 'PUMP 1';
  btnLampKiri7.Caption := 'PHASE' + #13#10 + 'FAILURE'+ #13#10 + 'PUMP 2';
  btnLampKiri8.Caption := 'HYDRAULIC' + #13#10 + 'LOCK'+ #13#10 + 'PUMP 2';
  btnLampKiri9.Caption := 'POWER' + #13#10 + 'FAILURE'+ #13#10 + 'PUMP 1';
  btnLampKiri10.Caption := 'POWER' + #13#10 + 'FAILURE'+ #13#10 + 'PUMP 2';
  btnLampKiri11.Caption := 'POWER' + #13#10 + 'FAIL. AUX.'+ #13#10 + 'STEERING';
  btnLampKiri12.Caption := 'POWER' + #13#10 + 'FAILURE'+ #13#10 + 'CONTROL 1';
  btnLampKiri13.Caption := 'POWER' + #13#10 + 'FAILURE'+ #13#10 + 'CONTROL 2';
  btnLampKiri14.Caption := 'LOW OIL' + #13#10 + 'LEVEL'+ #13#10 + 'PUMP 1';
  btnLampKiri15.Caption := 'LOW OIL' + #13#10 + 'LEVEL'+ #13#10 + 'PUMP 2';

  btnLampKanan1.Caption := 'OVERLOAD' + #13#10 + 'PUMP 3';    //kanan +20
  btnLampKanan2.Caption := 'OVERLOAD' + #13#10 + 'PUMP 4';
  btnLampKanan3.Caption := 'HYDRAULIC' + #13#10 + 'LOCK'+ #13#10 + 'PUMP 3';
  btnLampKanan4.Caption := 'CLOGGED' + #13#10 + 'FILTER'+ #13#10 + 'PUMP 3';
  btnLampKanan5.Caption := 'CLOGGED' + #13#10 + 'FILTER'+ #13#10 + 'PUMP 4';
  btnLampKanan6.Caption := 'PHASE' + #13#10 + 'FAILURE'+ #13#10 + 'PUMP 3';
  btnLampKanan7.Caption := 'PHASE' + #13#10 + 'FAILURE'+ #13#10 + 'PUMP 4';
  btnLampKanan8.Caption := 'HYDRAULIC' + #13#10 + 'LOCK'+ #13#10 + 'PUMP 4';
  btnLampKanan9.Caption := 'POWER' + #13#10 + 'FAILURE'+ #13#10 + 'PUMP 3';
  btnLampKanan10.Caption := 'POWER' + #13#10 + 'FAILURE'+ #13#10 + 'PUMP 4';
  btnLampKanan11.Caption := 'POWER' + #13#10 + 'FAIL. AUX.'+ #13#10 + 'STEERING';
  btnLampKanan12.Caption := 'POWER' + #13#10 + 'FAILURE'+ #13#10 + 'CONTROL 3';
  btnLampKanan13.Caption := 'POWER' + #13#10 + 'FAILURE'+ #13#10 + 'CONTROL 4';
  btnLampKanan14.Caption := 'LOW OIL' + #13#10 + 'LEVEL'+ #13#10 + 'PUMP 3';
  btnLampKanan15.Caption := 'LOW OIL' + #13#10 + 'LEVEL'+ #13#10 + 'PUMP 4';

  //Panel Rudder Indicator
  btnPumpKiri1.Tag := 1;
  btnPumpKiri2.Tag := 2;
  btnPumpKiri3.Tag := 3;
  btnPumpKiri4.Tag := 4;
  btnPumpKiri5.Tag := 5;
  btnPumpKiri6.Tag := 6;
  btnPumpKanan1.Tag := 7;
  btnPumpKanan2.Tag := 8;
  btnPumpKanan3.Tag := 9;
  btnPumpKanan4.Tag := 10;
  btnPumpKanan5.Tag := 11;
  btnPumpKanan6.Tag := 12;

  btnPumpKiri1.Caption := 'RUN' + #13#10 + 'PUMP 1';
  btnPumpKiri2.Caption := 'STOP';
  btnPumpKiri3.Caption := 'AUTO' + #13#10 + 'START'+ #13#10 + 'PUMP 1';
  btnPumpKiri4.Caption := 'RUN' + #13#10 + 'PUMP 2';
  btnPumpKiri5.Caption := 'STOP';
  btnPumpKiri6.Caption :=  'AUTO' + #13#10 + 'START'+ #13#10 + 'PUMP 2';
  btnPumpKanan1.Caption := 'RUN' + #13#10 + 'PUMP 3';
  btnPumpKanan2.Caption := 'STOP';
  btnPumpKanan3.Caption := 'AUTO' + #13#10 + 'START'+ #13#10 + 'PUMP 3';
  btnPumpKanan4.Caption := 'RUN' + #13#10 + 'PUMP 4';
  btnPumpKanan5.Caption := 'STOP';
  btnPumpKanan6.Caption := 'AUTO' + #13#10 + 'START'+ #13#10 + 'PUMP 4';

  Alarm := TAlarmObj.Create;

  //inisialisasi >> keadaan awal di set Auto Start
  btnPumpKiri3.Color := clWhite;
  btnPumpKiri6.Color := clWhite;
  btnPumpKanan3.Color := clWhite;
  btnPumpKanan6.Color := clWhite;

  counter := 0;
end;

procedure TfrmAlarmRudder.FormDestroy(Sender: TObject);
begin
  Alarm.Free;
end;

procedure TfrmAlarmRudder.tmr1Timer(Sender: TObject);
begin
  {counter := counter + 1;
  if counter = 2 then
  begin
    ERSystem.ERManager.EngineRoom.getPCSSystem.SetRudder('Main Engine PS',rudderSent_PS);
    ERSystem.ERManager.EngineRoom.getPCSSystem.SetRudder('Main Engine SB',rudderSent_SB);
    counter := 0;
  end;}
end;

procedure TfrmAlarmRudder.vrwhlRudderLeftMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
  var
    rudderValue : Integer;
begin
  edtRudderLeft.Text := IntToStr(vrwhlRudderLeft.Position);

  if (vrwhlRudderLeft.Position >= 72) and (vrwhlRudderLeft.Position <= 100) then
  begin
    vrwhlRudderLeft.Position := 72;
  end;

  if (vrwhlRudderLeft.Position > 100) and (vrwhlRudderLeft.Position <= 128)  then
  begin
    vrwhlRudderLeft.Position := 128;
  end;

  if (vrwhlRudderLeft.Position >= 0) and (vrwhlRudderLeft.Position <= 72) then
    rudderValue := Round(vrwhlRudderLeft.Position / 1.44);

  if (vrwhlRudderLeft.Position >= 128) and (vrwhlRudderLeft.Position <200) then
    rudderValue := Round(((200/1.44) - (vrwhlRudderLeft.Position / 1.44))*(-1));

  if rudderValue < 0 then
  begin
    lblPortValue.Caption := IntToStr(Abs(rudderValue));
    edtRudderValue.Text := IntToStr(Abs(rudderValue));
  end
  else
  begin
    lblPortValue.Caption := IntToStr(-Abs(rudderValue));
    edtRudderValue.Text := IntToStr(-Abs(rudderValue));
  end;

  rudderSent_PS := rudderValue;

  ERSystem.ERManager.EngineRoom.getPCSSystem.SetRudder('Main Engine PS',
    rudderSent_PS);
end;

procedure TfrmAlarmRudder.vrwhlRudderPanelRightMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
  var
    rudderValue: Integer;
begin
  edtRudderLeft.Text := IntToStr(vrwhlRudderPanelRight.Position);

  if (vrwhlRudderPanelRight.Position >= 72) and (vrwhlRudderPanelRight.Position <= 100) then
  begin
    vrwhlRudderPanelRight.Position := 72;
  end;

  if (vrwhlRudderPanelRight.Position > 100) and (vrwhlRudderPanelRight.Position <= 128)  then
  begin
    vrwhlRudderPanelRight.Position := 128;
  end;

  if (vrwhlRudderPanelRight.Position >= 0) and (vrwhlRudderPanelRight.Position <= 72) then
    rudderValue := Round(vrwhlRudderPanelRight.Position / 1.44);

  if (vrwhlRudderPanelRight.Position >= 128) and (vrwhlRudderPanelRight.Position <200) then
    rudderValue := Round(((200/1.44) - (vrwhlRudderPanelRight.Position / 1.44))*(-1));

  if rudderValue < 0 then
  begin
    edtRudderValue.Text := IntToStr(Abs(rudderValue));
    lblStarBoardValue.Caption := IntToStr(Abs(rudderValue));
  end
  else
  begin
    edtRudderValue.Text := IntToStr(-Abs(rudderValue));
    lblStarBoardValue.Caption := IntToStr(-Abs(rudderValue));
  end;

  rudderSent_SB := rudderValue;

  ERSystem.ERManager.EngineRoom.getPCSSystem.SetRudder('Main Engine SB',
    rudderSent_SB);
end;

end.
