unit uACSControl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uDBSupportClasses, ExtCtrls, ComCtrls;

type
  TfrmACSControl = class(TForm)
    btnApply: TButton;
    btnReset: TButton;
    grp2: TGroupBox;
    lbl4: TLabel;
    cbbAlarmSet: TComboBox;
    lbl5: TLabel;
    grp3: TGroupBox;
    lbl7: TLabel;
    lbl8: TLabel;
    cbbFaultSet: TComboBox;
    grp1: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lblDeck: TLabel;
    lblRoomID: TLabel;
    cbbLocations: TComboBox;
    pnlAlarm: TPanel;
    pnlFault: TPanel;
    mmoAlarm: TMemo;
    mmoFault: TMemo;
    lvAlarmStatus: TListView;
    btnAck: TButton;
    procedure cbbLocationsSelect(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbbAlarmSetSelect(Sender: TObject);
    procedure cbbFaultSetSelect(Sender: TObject);
    procedure pnlAlarmClick(Sender: TObject);
    procedure pnlFaultClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAckClick(Sender: TObject);
    procedure lvAlarmStatusCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
  private
    { Private declarations }
    FTempData  : TACSData;
    FTimer : TTimer;

    FLocList : TList;
    FAlarmList : TList;
    FFaultList : TList;
    FStateAlarm : TList;

    procedure setDefault;
    procedure CountDuration(Sender: TObject);
  public
    { Public declarations }
    FFaultStatus : Byte;

    procedure SetAlarmStatus;
    procedure RefreshAlarmStatus;

    property faultStatus: Byte read FFaultStatus write FFaultStatus;
  end;

var
  frmACSControl: TfrmACSControl;

implementation

uses
  uInstructorSystem, uDataType, uInstructorPanel;

{$R *.dfm}

procedure TfrmACSControl.pnlAlarmClick(Sender: TObject);
begin
  if pnlAlarm.Color = clBlack then
  begin
    pnlAlarm.Color := clRed;

    cbbAlarmSet.Enabled := True;
    mmoAlarm.Enabled := True;

    cbbLocations.Enabled := True;
    lblDeck.Enabled := True;
    lblRoomID.Enabled := True;
  end
  else
  begin
    pnlAlarm.Color := clBlack;

    cbbAlarmSet.Enabled := False;
    mmoAlarm.Enabled := False;

    cbbLocations.Enabled := False;
    lblDeck.Enabled := False;
    lblRoomID.Enabled := False;
  end;
end;

procedure TfrmACSControl.pnlFaultClick(Sender: TObject);
begin
  if pnlFault.Color = clBlack then
  begin
    pnlFault.Color := clRed;

    cbbFaultSet.Enabled := True;
    mmoFault.Enabled := True;
  end
  else
  begin
    pnlFault.Color := clBlack;

    cbbFaultSet.Enabled := False;
    mmoFault.Enabled := False;
  end;
end;

procedure TfrmACSControl.RefreshAlarmStatus;
var
  i : Integer;
  li : TListItem;
begin
  for i := 0 to FStateAlarm.Count - 1 do
  begin
    li := lvAlarmStatus.Items[i];

    if Assigned(li.Data) then
    begin
      FTempData := TACSData(li.Data);

      if Assigned(li) then
      begin
        try
          lvAlarmStatus.Items.BeginUpdate;

          //Do your updates
          li.Caption := FTempData.deck+'  '+FTempData.lokasi+'  '+FTempData.sandiRuangan;
          li.SubItems[0] := FTempData.alarmMessage;
          li.SubItems[1] := FTempData.faultMessage;
          li.SubItems[2] := FTempData.statusRec;
        finally
          lvAlarmStatus.Items.EndUpdate;
        end;
      end;
    end;
  end;
end;

procedure TfrmACSControl.SetAlarmStatus;
var
  i  : Integer;
  li : TListItem;
begin
  lvAlarmStatus.Clear;

  for i := 0 to FStateAlarm.Count - 1 do
  begin
    FTempData := FStateAlarm.Items[i];

    li := lvAlarmStatus.Items.Add;

    with li do
    begin
      Caption := FTempData.deck+'  '+FTempData.lokasi+'  '+FTempData.sandiRuangan;
      Data := FTempData;

      SubItems.Add(FTempData.alarmMessage);
      SubItems.Add(FTempData.faultMessage);
      SubItems.Add(FTempData.statusRec);
    end;
  end;

  if (pnlAlarm.Color = clRed) or (pnlFault.Color = clRed) then
  begin
    setDefault;
  end;
end;

procedure TfrmACSControl.setDefault;
begin
  pnlAlarm.Color := clBlack;
  pnlFault.Color := clBlack;

  cbbLocations.Enabled := False;
  cbbLocations.ItemIndex := 0;
  lblRoomID.Enabled := False;
  lblDeck.Enabled := False;

  cbbAlarmSet.Enabled := False;
  cbbAlarmSet.ItemIndex := 0;
  mmoAlarm.Enabled := False;

  cbbFaultSet.Enabled := False;
  cbbFaultSet.ItemIndex := 0;
  mmoFault.Enabled := False;
end;

procedure TfrmACSControl.btnAckClick(Sender: TObject);
var
  rec : R_Common_ACS_Command;
  i, isUnack : Integer;
begin
  if lvAlarmStatus.Selected = nil then
    Exit;

  FTempData := lvAlarmStatus.Selected.Data;

  if FTempData.statusRec = 'Alarm' then
  begin
    FTempData.statusRec := 'Ack';
  end;

  isUnack := 0;

  for i := 0 to FStateAlarm.Count - 1 do
  begin
    FTempData := FStateAlarm.Items[i];

    if FTempData.statusRec = 'Alarm' then
      Inc(isUnack);
  end;

  if isUnack = 0 then
    rec.Status := 1;

  rec.SimTime := frmInstructorPanel.tempTimeSim;

  InstructorSys.Network.AsServer.SendData(C_FIRE_ACS_COMMAND, @rec);

  RefreshAlarmStatus;
end;

procedure TfrmACSControl.btnApplyClick(Sender: TObject);
var
  rec : R_Common_ACS_Command;
  time : TDateTime;
begin
  FTempData := TACSData.Create;

  if (pnlAlarm.Color = clBlack) and (pnlFault.Color = clBlack) then
    Exit;

  if (pnlAlarm.Color = clRed) and (pnlFault.Color = clBlack) then
  begin
    FTempData.alarmMessage := cbbAlarmSet.Text;
    FTempData.lokasi := cbbLocations.Text;
    FTempData.deck := lblDeck.Caption;
    FTempData.sandiRuangan := lblRoomID.Caption;

    case cbbAlarmSet.ItemIndex of
      0: rec.AlarmID := 1;
      1: rec.AlarmID := 2;
      2: rec.AlarmID := 3;
    end;

    rec.RoomID := lblRoomID.Caption;
    rec.Status := 0;
    rec.SimTime := frmInstructorPanel.tempTimeSim;

    InstructorSys.Network.AsServer.SendData(C_FIRE_ACS_COMMAND, @rec);
  end
  else if (pnlAlarm.Color = clBlack) and (pnlFault.Color = clRed) then
  begin
    case cbbFaultSet.ItemIndex of
      0: rec.FaultID := 1;
      1: rec.FaultID := 2;
      2: rec.FaultID := 3;
      3: rec.FaultID := 4;
      4: rec.FaultID := 5;
      5: rec.FaultID := 6;
      6: rec.FaultID := 7;
      7: rec.FaultID := 8;
      8: rec.FaultID := 9;
      9: rec.FaultID := 10;
      10: rec.FaultID := 11;
    end;

    case cbbFaultSet.ItemIndex of
      3, 9, 10:
      begin
        rec.RoomID := lblRoomID.Caption;

        FTempData.lokasi := cbbLocations.Text;
        FTempData.deck := lblDeck.Caption;
        FTempData.sandiRuangan := lblRoomID.Caption;
      end;
    end;

    FTempData.faultMessage := cbbFaultSet.Text;

    rec.Status := 0;
    rec.SimTime := frmInstructorPanel.tempTimeSim;

    InstructorSys.Network.AsServer.SendData(C_FIRE_ACS_COMMAND, @rec);
  end
  else if (pnlAlarm.Color = clRed) and (pnlFault.Color = clRed) then
  begin
    FTempData.alarmMessage := cbbAlarmSet.Text;
    FTempData.faultMessage := cbbFaultSet.Text;
    FTempData.lokasi := cbbLocations.Text;
    FTempData.deck := lblDeck.Caption;
    FTempData.sandiRuangan := lblRoomID.Caption;

    case cbbAlarmSet.ItemIndex of
      0: rec.AlarmID := 1;
      1: rec.AlarmID := 2;
      2: rec.AlarmID := 3;
    end;

    case cbbFaultSet.ItemIndex of
      0: rec.FaultID := 1;
      1: rec.FaultID := 2;
      2: rec.FaultID := 3;
      3: rec.FaultID := 4;
      4: rec.FaultID := 5;
      5: rec.FaultID := 6;
      6: rec.FaultID := 7;
      7: rec.FaultID := 8;
      8: rec.FaultID := 9;
      9: rec.FaultID := 10;
      10: rec.FaultID := 11;
    end;

    rec.RoomID := lblRoomID.Caption;
    rec.Status := 0;
    rec.SimTime := frmInstructorPanel.tempTimeSim;

    InstructorSys.Network.AsServer.SendData(C_FIRE_ACS_COMMAND, @rec);
  end;

  FTempData.statusRec := 'Alarm';

  FStateAlarm.Add(FTempData);
  SetAlarmStatus;
end;

procedure TfrmACSControl.btnResetClick(Sender: TObject);
begin
  setDefault;
end;

procedure TfrmACSControl.cbbAlarmSetSelect(Sender: TObject);
var
  FAlarmData : TACSData;
begin
  if cbbAlarmSet.Text <> '' then
  begin
    FAlarmData := InstructorSys.Database.GetAlarmComment(cbbAlarmSet.Text);

    mmoAlarm.Lines.Clear;
    mmoAlarm.Lines.Add(FAlarmData.alarmComment);
  end;
end;

procedure TfrmACSControl.cbbFaultSetSelect(Sender: TObject);
var
  FFaultData : TACSData;
begin
  if cbbFaultSet.Text <> '' then
  begin
    FFaultData := InstructorSys.Database.GetFaultComment(cbbFaultSet.Text);

    mmoFault.Lines.Clear;
    mmoFault.Lines.Add(FFaultData.faultComment);
  end;

  case cbbFaultSet.ItemIndex of
    3, 9, 10:
    begin
      cbbLocations.Enabled := True;
      lblDeck.Enabled := True;
      lblRoomID.Enabled := True;
    end
    else
    begin
      cbbLocations.Enabled := False;
      lblDeck.Enabled := False;
      lblRoomID.Enabled := False;
    end;
  end;
end;

procedure TfrmACSControl.cbbLocationsSelect(Sender: TObject);
begin
  if cbbLocations.Text <> '' then
  begin
    FTempData := InstructorSys.Database.GetLocationDetail(cbbLocations.Text);

    lblDeck.Caption := FTempData.deck;
    lblRoomID.Caption := FTempData.sandiRuangan;
  end;
end;

procedure TfrmACSControl.CountDuration(Sender: TObject);
var
  i : Integer;
  li : TListItem;
begin
  for i := 0 to FStateAlarm.Count - 1 do
  begin
    li := lvAlarmStatus.Items[i];

    if Assigned(li.Data) then
    begin
      FTempData := TACSData(li.Data);

      if Assigned(li) then
      begin
        try
          lvAlarmStatus.Items.BeginUpdate;

          //Do your updates
          li.Caption := FTempData.deck+'  '+FTempData.lokasi+'  '+FTempData.sandiRuangan;
          li.SubItems[0] := FTempData.alarmMessage;
          li.SubItems[1] := FTempData.faultMessage;
          li.SubItems[2] := FTempData.statusRec;
        finally
          lvAlarmStatus.Items.EndUpdate;
        end;
      end;
    end;
  end;
end;

procedure TfrmACSControl.FormCreate(Sender: TObject);
var
  i : Integer;
begin
  if not Assigned(FLocList) then
    FLocList := TList.Create;

  if not Assigned(FAlarmList) then
    FAlarmList := TList.Create;

  if not Assigned(FFaultList) then
    FFaultList := TList.Create;

  if not Assigned(FStateAlarm) then
    FStateAlarm := TList.Create;

  InstructorSys.Database.GetAllLocation(FLocList);
  InstructorSys.Database.GetAllAlarm(FAlarmList);
  InstructorSys.Database.GetAllFault(FFaultList);

  { location }
  for i := 0 to FLocList.Count - 1 do
  begin
    FTempData := FLocList.Items[i];

    cbbLocations.Items.Add(FTempData.lokasi);
  end;

  if cbbLocations.Items.Count > 0 then
  begin
    cbbLocations.ItemIndex := 0;
    cbbLocationsSelect(cbbLocations);
  end;

  { alarm msg }
  for i := 0 to FAlarmList.Count - 1 do
  begin
    FTempData := FAlarmList.Items[i];

    cbbAlarmSet.Items.Add(FTempData.alarmMessage);
  end;

  if cbbAlarmSet.Items.Count > 0 then
  begin
    cbbAlarmSet.ItemIndex := 0;
    cbbAlarmSetSelect(cbbAlarmSet);
  end;

  { fault msg }
  for i := 0 to FFaultList.Count - 1 do
  begin
    FTempData := FFaultList.Items[i];

    cbbFaultSet.Items.Add(FTempData.faultMessage);
  end;

  if cbbFaultSet.Items.Count > 0 then
  begin
    cbbFaultSet.ItemIndex := 0;
    cbbFaultSetSelect(cbbFaultSet);
  end;

  FTimer := TTimer.Create(nil);
  FTimer.Interval := 1000;
  FTimer.Enabled := True;
  FTimer.OnTimer := CountDuration;
end;

procedure TfrmACSControl.FormDestroy(Sender: TObject);
begin
  FLocList.Free;
  FAlarmList.Free;
  FFaultList.Free;
  FStateAlarm.Free
end;

procedure TfrmACSControl.lvAlarmStatusCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
var
  i : Integer;
  li: TListItem;
  FTempData : TACSData;
begin
  if lvAlarmStatus.Items.Count > 0 then
  begin
    for i := 0 to lvAlarmStatus.Items.Count - 1 do
    begin
      li := lvAlarmStatus.Items[i];

      if Assigned(li.Data) then
      begin
        FTempData := TACSData(li.Data);

        if Item.Index = i then
        begin
          if FTempData.statusRec = 'Alarm' then
          begin
            lvAlarmStatus.Canvas.Brush.Color := clRed;
            lvAlarmStatus.Canvas.Font.Color := clWhite;

            if FFaultStatus = 1 then
            begin
              lvAlarmStatus.Canvas.Brush.Color := clSilver;
              lvAlarmStatus.Canvas.Font.Color := clWhite;

              FTempData.statusRec := 'Delete'
            end
            else if FFaultStatus = 2 then
            begin
              lvAlarmStatus.Canvas.Brush.Color := clBlack;
              lvAlarmStatus.Canvas.Font.Color := clRed;

              FTempData.statusRec := 'Ack'
            end;
          end
          else if FTempData.statusRec = 'Ack' then
          begin
            lvAlarmStatus.Canvas.Brush.Color := clBlack;
            lvAlarmStatus.Canvas.Font.Color := clRed;
          end;
        end;
      end;
    end;
  end;
end;

end.
