unit ufrmFunctionAllocation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMimics, uBaseComponent, uAnalogSensor, ExtCtrls, jpeg, StdCtrls,
  Menus;

type
  E_BlinkState = (bsBright, bsDark);

  TOnAlarmSoundChange = procedure (aIndex: Byte; aEnabled: Boolean) of object;

  TAlarmAssignButton = class
  private
    FChange : Boolean;
    FCheck : Boolean;
    FColumnId : Integer;
    FImage : TImage;
    FPanel : TPanel;
    FRowId : Integer;
    FSilent : Boolean;

    function GetRoleID(aRole: string): Integer;

    procedure SetChange(aChange: Boolean);
    procedure SetCheck(aCheck: Boolean);
    procedure SetColumnId(aColId: Integer);
    procedure SetImage(aImage: TImage);
    procedure SetPanel(aPanel: TPanel);
    procedure SetRowId(aRowId: Integer);
    procedure SetSilent(aSilent: Boolean);
  public
    constructor Create;

    property Change : Boolean read FChange write SetChange;
    property Check : Boolean read FCheck write SetCheck;
    property ColumnID : Integer read FColumnId write SetColumnId;
    property Image : TImage read FImage write SetImage;
    property Panel : TPanel read FPanel write SetPanel;
    property RowID : Integer read FRowId write SetRowId;
    property Silent : Boolean read FSilent write SetSilent;
  end;

  TfrmFuncAllocation = class(TfrmMimics)
    imgAllocation: TImage;
    pnlIPMS_DG: TPanel;
    pnlIPMS_DISTR: TPanel;
    pnlIPMS_PROP: TPanel;
    pnlIPMS_AUX: TPanel;
    pnlIPMS_FUEL: TPanel;
    pnlIPMS_DMST: TPanel;
    pnlIPMS_HVAC: TPanel;
    pnlIPMS_FFDC: TPanel;
    pnlIPMS_NAV: TPanel;
    pnlIPMS_BALL: TPanel;
    pnlIPMS_IPMS: TPanel;
    pnlIPMS_IAS: TPanel;
    pnlAUX_AUX: TPanel;
    pnlAUX_BALL: TPanel;
    pnlAUX_DG: TPanel;
    pnlAUX_DISTR: TPanel;
    pnlAUX_DMST: TPanel;
    pnlAUX_FFDC: TPanel;
    pnlAUX_FUEL: TPanel;
    pnlAUX_HVAC: TPanel;
    pnlAUX_IAS: TPanel;
    pnlAUX_IPMS: TPanel;
    pnlAUX_NAV: TPanel;
    pnlAUX_PROP: TPanel;
    pnlE_AUX: TPanel;
    pnlE_BALL: TPanel;
    pnlE_DG: TPanel;
    pnlE_DISTR: TPanel;
    pnlE_DMST: TPanel;
    pnlE_FFDC: TPanel;
    pnlE_FUEL: TPanel;
    pnlE_HVAC: TPanel;
    pnlE_IAS: TPanel;
    pnlE_IPMS: TPanel;
    pnlE_NAV: TPanel;
    pnlE_PROP: TPanel;
    pnlPCS_AUX: TPanel;
    pnlPCS_BALL: TPanel;
    pnlPCS_DG: TPanel;
    pnlPCS_DISTR: TPanel;
    pnlPCS_DMST: TPanel;
    pnlPCS_FFDC: TPanel;
    pnlPCS_FUEL: TPanel;
    pnlPCS_HVAC: TPanel;
    pnlPCS_IAS: TPanel;
    pnlPCS_IPMS: TPanel;
    pnlPCS_NAV: TPanel;
    pnlPCS_PROP: TPanel;
    pnlTop_IPMS: TPanel;
    pnlTop_AUX: TPanel;
    pnlTop_PCS: TPanel;
    pnlTop_E: TPanel;
    pnlTop_BRG: TPanel;
    pnlTop_MCR: TPanel;
    pnlAlarm_AUX: TPanel;
    pnlAlarm_BALL: TPanel;
    pnlAlarm_DG: TPanel;
    pnlAlarm_DISTR: TPanel;
    pnlAlarm_DMST: TPanel;
    pnlAlarm_FFDC: TPanel;
    pnlAlarm_FUEL: TPanel;
    pnlAlarm_HVAC: TPanel;
    pnlAlarm_IAS: TPanel;
    pnlAlarm_IPMS: TPanel;
    pnlAlarm_NAV: TPanel;
    pnlAlarm_PROP: TPanel;
    pnlLeft_AUX: TPanel;
    pnlLeft_BALL: TPanel;
    pnlLeft_DG: TPanel;
    pnlLeft_DISTR: TPanel;
    pnlLeft_DMST: TPanel;
    pnlLeft_FFDC: TPanel;
    pnlLeft_FUEL: TPanel;
    pnlLeft_HVAC: TPanel;
    pnlLeft_IAS: TPanel;
    pnlLeft_IPMS: TPanel;
    pnlLeft_NAV: TPanel;
    pnlLeft_PROP: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    pnlAuthExec: TPanel;
    pnlReport: TPanel;
    Label13: TLabel;
    pnlMake: TPanel;
    pnlShow: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    Panel25: TPanel;
    Panel26: TPanel;
    Panel27: TPanel;
    Panel28: TPanel;
    Panel29: TPanel;
    Panel30: TPanel;
    Panel31: TPanel;
    Panel32: TPanel;
    Panel33: TPanel;
    Panel34: TPanel;
    Panel35: TPanel;
    Panel36: TPanel;
    Panel37: TPanel;
    Panel38: TPanel;
    Panel39: TPanel;
    Panel40: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel41: TPanel;
    Panel42: TPanel;
    Panel43: TPanel;
    Panel44: TPanel;
    Panel45: TPanel;
    Panel46: TPanel;
    Panel47: TPanel;
    Panel48: TPanel;
    pnlGenerateReport: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    procedure AssignAlarm(Sender: TObject);
    procedure AssignSound(Sender: TObject);
    procedure pnlAuthExecClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pnlShowClick(Sender: TObject);
    procedure pnlMakeClick(Sender: TObject);
  private
    FAlarmAssignButtonList : TList;
    FAlarmAssignTimer : TTimer;
    FBlinkState : E_BlinkState;
    FGenerateReportTimer : TTimer;
    FGenerateTimerCount : Integer;
    FIsAuthorized : Boolean;
//    FRole : string;
    FOnAlarmSoundChange: TOnAlarmSoundChange;

    function GetRoleID(aRole: string): Integer;
    procedure LoginResult(aResult: Boolean);
    procedure OnGenerateReport(Sender: TObject);
    procedure OnTimerRunning(Sender: TObject);
    procedure SetAlarmAssignButtonList;
    procedure SetAuthorization(aAuthorized: Boolean);
    procedure SetCustomEvent(Sender : TObject);
    procedure SetOnAlarmSoundChange(aValue: TOnAlarmSoundChange);
  public
    procedure UpdateCheckState(aList: TList);

    property Authorization : Boolean read FIsAuthorized write SetAuthorization;

    property OnAlarmSoundChange : TOnAlarmSoundChange read FOnAlarmSoundChange
      write SetOnAlarmSoundChange;
  end;

var
  frmFuncAllocation: TfrmFuncAllocation;

implementation

uses
  ufrmAuthorization, uDBSupportClasses, uMimicsSystem, uSetting, uDataType,
  ufrmReport, pngimage;

{$R *.dfm}

procedure TfrmFuncAllocation.AssignAlarm(Sender: TObject);
var
  i : Integer;
  aab : TAlarmAssignButton;
begin
  if not FIsAuthorized then
    Exit;

  for i := 0 to FAlarmAssignButtonList.Count - 1 do
  begin
    aab := FAlarmAssignButtonList.Items[i];

    if (aab.Panel.Tag = TPanel(Sender).Tag) and
      not aab.Check then
    begin
      aab.Change := not aab.Change;

      if not aab.Change then
        aab.Panel.Color := clMedGray;
    end;
  end;
end;

procedure TfrmFuncAllocation.AssignSound(Sender: TObject);
var
  i : Integer;
  aab : TAlarmAssignButton;
begin
  for i := 0 to FAlarmAssignButtonList.Count - 1 do
  begin
    aab := FAlarmAssignButtonList.Items[i];

    if Assigned(aab.Image) and (aab.Image.Tag = TImage(Sender).Tag) then
    begin
      if aab.Check then
        MessageDlg('Since you are the owner of this installation group alarm' +
          'sounds cannot be disabled !', mtWarning, [mbOK], 0)
      else
      begin
        FOnAlarmSoundChange(aab.RowID, aab.Silent);

        aab.Silent := not aab.Silent;
      end;
    end;
  end;
end;

procedure TfrmFuncAllocation.FormCreate(Sender: TObject);
begin
  inherited;

  FAlarmAssignTimer := TTimer.Create(Self);
  FAlarmAssignTimer.Enabled := False;
  FAlarmAssignTimer.Interval := 1000;
  FAlarmAssignTimer.OnTimer := OnTimerRunning;

  FGenerateReportTimer := TTimer.Create(Self);
  FGenerateReportTimer.Enabled := False;
  FGenerateReportTimer.Interval := 1000;
  FGenerateReportTimer.OnTimer := OnGenerateReport;

  SetAlarmAssignButtonList;

  SetCustomEvent(frmAuthorization);
end;

function TfrmFuncAllocation.GetRoleID(aRole: string): Integer;
begin
  if aRole = 'IPMS' then
    Result := 0
  else if aRole = 'AUX' then
    Result := 1
  else if aRole = 'PCS' then
    Result := 2
  else if aRole = 'E' then
    Result := 3
  else
    Result := 0;
end;

procedure TfrmFuncAllocation.LoginResult(aResult: Boolean);
begin
  FIsAuthorized := aResult;

  if FIsAuthorized then
  begin
    pnlAuthExec.Caption := 'EXECUTE';
    FAlarmAssignTimer.Enabled := True;
  end;
end;

procedure TfrmFuncAllocation.OnGenerateReport(Sender: TObject);
begin
  if FGenerateTimerCount > 1 then
  begin
    pnlGenerateReport.Visible := False;
    FGenerateReportTimer.Enabled := False;
  end;

  Inc(FGenerateTimerCount);
end;

procedure TfrmFuncAllocation.OnTimerRunning(Sender: TObject);
var
  i, changeCount : Integer;
  aab : TAlarmAssignButton;
begin
  changeCount := 0;

  for i := 0 to FAlarmAssignButtonList.Count - 1 do
  begin
    aab := FAlarmAssignButtonList.Items[i];

    with aab do
    begin
      if Change then
      begin
        case FBlinkState of
          bsBright: Panel.Color := clGreen;
          bsDark: Panel.Color := clMedGray;
        end;

        Inc(changeCount);
      end;
    end;
  end;

  if (changeCount > 0) and (FBlinkState = bsBright) then
    pnlAuthExec.Color := clGreen
  else
    pnlAuthExec.Color := clGray;

  case FBlinkState of
    bsBright: FBlinkState := bsDark;
    bsDark: FBlinkState := bsBright;
  end;
end;

procedure TfrmFuncAllocation.pnlAuthExecClick(Sender: TObject);
var
  rFAData : R_Common_FuncAlloc_Command;
  i : Integer;
  aab : TAlarmAssignButton;
begin
  inherited;

  with TPanel(Sender) do
  begin
    if (Caption = 'AUTHORIZE') and not FIsAuthorized then
    begin
      frmAuthorization.Show;
    end
    else if Caption = 'EXECUTE' then
    begin
      Caption := 'AUTHORIZE';
      Color := clMedGray;
      FIsAuthorized := False;
      FAlarmAssignTimer.Enabled := False;

      with rFAData do
      begin
        role := 'MCR_' + Setting.Role;

        for i := 0 to FAlarmAssignButtonList.Count - 1 do
        begin
          aab := FAlarmAssignButtonList.Items[i];

          if aab.ColumnID = GetRoleID(Setting.Role) then
          begin
            case aab.RowID of
              1: changeAlarm1 := aab.Change;
              2: changeAlarm2 := aab.Change;
              3: changeAlarm3 := aab.Change;
              4: changeAlarm4 := aab.Change;
              5: changeAlarm5 := aab.Change;
              6: changeAlarm6 := aab.Change;
              7: changeAlarm7 := aab.Change;
              8: changeAlarm8 := aab.Change;
              9: changeAlarm9 := aab.Change;
              10: changeAlarm10 := aab.Change;
              11: changeAlarm11 := aab.Change;
              12: changeAlarm12 := aab.Change;
            end;

            aab.Change := False;
          end;
        end;
      end;
      SysMimics.Network.ControllerSocket.SendData(C_FUNCTIONALLOCATION_COMMAND, @rFAData);
    end;
  end;
end;

procedure TfrmFuncAllocation.pnlMakeClick(Sender: TObject);
begin
  inherited;

  frmReport.CreateReport;
  FGenerateTimerCount := 0;
  pnlGenerateReport.Visible := True;
  FGenerateReportTimer.Enabled := True;
end;

procedure TfrmFuncAllocation.pnlShowClick(Sender: TObject);
begin
  inherited;

  frmReport.ShowModal;
end;

procedure TfrmFuncAllocation.SetAlarmAssignButtonList;
var
  i, space : Integer;
  c : TComponent;
  aab : TAlarmAssignButton;
begin
  FAlarmAssignButtonList := TList.Create;

  for i := 0 to ComponentCount - 1 do
  begin
    c := Components[i];

    if (c is TPanel) and (TPanel(c).Parent is TPanel) then
    begin
      aab := TAlarmAssignButton.Create;

      aab.Panel := TPanel(c);

      aab.ColumnID := (TPanel(c).Tag - 1) div 12;
      aab.RowID := TPanel(c).Tag - (aab.ColumnID  * 12);

      if aab.ColumnID = GetRoleID(Setting.Role) then
      begin
        aab.Panel.Cursor := crUpArrow;
        aab.Panel.Enabled := True;

        case aab.RowID of
          1: aab.Image := Image1;
          2: aab.Image := Image2;
          3: aab.Image := Image3;
          4: aab.Image := Image4;
          5: aab.Image := Image5;
          6: aab.Image := Image6;
          7: aab.Image := Image7;
          8: aab.Image := Image8;
          9: aab.Image := Image9;
          10: aab.Image := Image10;
          11: aab.Image := Image11;
          12: aab.Image := Image12;
        end;
      end
      else
      begin
        aab.Panel.Cursor := crDefault;
        aab.Panel.Enabled := False;
      end;

      FAlarmAssignButtonList.Add(aab);
    end;
  end;

  space := (GetRoleID(Setting.Role) * 55) + (GetRoleID(Setting.Role) * 8);

  with imgAllocation.Canvas do
  begin
    Brush.Color := clBlack;
    Pen.Color := clBlack;
    Rectangle(0, 0, Width, Height);

    Pen.Color := clYellow;
    Pen.Width := 3;

    MoveTo(space + 30, 1); LineTo(space + 90, 1);
    MoveTo(space + 90, 1); LineTo(space + 90, 490);
    MoveTo(space + 90, 490); LineTo(space + 120, 503);
    MoveTo(space + 120, 503); LineTo(space + 120, 538);
    MoveTo(space + 120, 538); LineTo(space + 1, 538);
    MoveTo(space + 1, 538); LineTo(space + 1, 503);
    MoveTo(space + 1, 503); LineTo(space + 30, 490);
    MoveTo(space + 30, 490); LineTo(space + 30, 1);
  end;

  pnlAuthExec.Left := space + 601;
end;

procedure TfrmFuncAllocation.SetAuthorization(aAuthorized: Boolean);
begin
  FIsAuthorized := aAuthorized;
end;

procedure TfrmFuncAllocation.SetCustomEvent(Sender: TObject);
begin
  if Sender is TfrmAuthorization then
    TfrmAuthorization(Sender).OnLoginResult := LoginResult;
end;

procedure TfrmFuncAllocation.SetOnAlarmSoundChange(aValue: TOnAlarmSoundChange);
begin
  FOnAlarmSoundChange := aValue;
end;

procedure TfrmFuncAllocation.UpdateCheckState(aList: TList);
var
  i : Integer;
  aab : TAlarmAssignButton;
  faData : TFACond_Data;
begin
  for i := 0 to FAlarmAssignButtonList.Count - 1 do
  begin
    aab := FAlarmAssignButtonList.Items[i];

    if aab.ColumnID < aList.Count then
    begin
      faData := aList.Items[aab.ColumnID];

      case aab.RowID of
        1: aab.Check := (faData.FA_DGSETS_State = 1);
        2: aab.Check := (faData.FA_Distribution_State = 1);
        3: aab.Check := (faData.FA_Propultion_State = 1);
        4: aab.Check := (faData.FA_Auxiliary_State = 1);
        5: aab.Check := (faData.FA_Fuel_State = 1);
        6: aab.Check := (faData.FA_Domest_State = 1);
        7: aab.Check := (faData.FA_HVAC_State = 1);
        8: aab.Check := (faData.FA_FFDC_State = 1);
        9: aab.Check := (faData.FA_Navigation_State = 1);
        10: aab.Check := (faData.FA_Ballast_State = 1);
        11: aab.Check := (faData.FA_IPMS_State = 1);
        12: aab.Check := (faData.FA_IAS_State = 1);
      end;
    end;
  end;
end;

{ TAlarmAssignButton }

constructor TAlarmAssignButton.Create;
begin
  FChange := False;
  FCheck := False;
  FImage := nil;
  FPanel := nil;
  FSilent := False;
end;

function TAlarmAssignButton.GetRoleID(aRole: string): Integer;
begin
  if aRole = 'IPMS' then
    Result := 0
  else if aRole = 'AUX' then
    Result := 1
  else if aRole = 'PCS' then
    Result := 2
  else if aRole = 'E' then
    Result := 3
  else
    Result := 0; // nilai default
end;

procedure TAlarmAssignButton.SetChange(aChange: Boolean);
begin
  FChange := aChange;
end;

procedure TAlarmAssignButton.SetCheck(aCheck: Boolean);
begin
  FCheck := aCheck;

  if FCheck then
  begin
    Panel.Caption := '5';
    Panel.Color := clGreen;
  end
  else
  begin
    Panel.Caption := '';
    Panel.Color := clMedGray;
  end;

  if ColumnID = GetRoleID(Setting.Role) then
    SetSilent(not FCheck);
end;

procedure TAlarmAssignButton.SetColumnId(aColId: Integer);
begin
  FColumnId := aColId;
end;

procedure TAlarmAssignButton.SetImage(aImage: TImage);
begin
  FImage := aImage;
end;

procedure TAlarmAssignButton.SetPanel(aPanel: TPanel);
begin
  FPanel := aPanel;
end;

procedure TAlarmAssignButton.SetRowId(aRowId: Integer);
begin
  FRowId := aRowId;
end;

procedure TAlarmAssignButton.SetSilent(aSilent: Boolean);
var
  png : TPngImage;
begin
  FSilent := aSilent;

  png := TPngImage.Create;

  try
    if FSilent then
    begin
      if FindResource(HInstance, PChar('Sound_Off'), RT_RCDATA) <> 0 then
      begin
        png.LoadFromResourceName(HInstance, 'Sound_Off');
        Image.Picture.Graphic := png;
      end;
    end
    else
    begin
      if FindResource(HInstance, PChar('Sound_On'), RT_RCDATA) <> 0 then
      begin
        png.LoadFromResourceName(HInstance, 'Sound_On');
        Image.Picture.Graphic := png;
      end;
    end;
  finally
    png.Free;
  end;
end;

end.
