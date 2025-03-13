unit ufrmMimics;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, uDataType, StdCtrls, uDatabase, uBaseComponent, Menus,
  uDBSupportClasses, ufrmDataTrend, math;

type
  TOnMimicsShowCIPData = procedure (aElementID: string; aControlMode: Byte;
    aElemStatus: Byte; aEnbAlmInhibited: Byte; aValApp: Double) of object;

  TOnShortcutClick = procedure (aPage: Byte) of object;
  TOnAlarmChange = procedure (aElemID: string; Value : Byte) of object;
  TOnListAlarm = procedure (aElementID: string; aAlmStatus: Byte) of object;

  TOnRemoveAlarm = procedure (aElementID: string) of object;
  TOnDisableAlarm = procedure (aElementID: string) of object;
  TOnStatusControlIns = procedure (aMimicID, aStatus: Byte;
    aElementID: string) of object;

  TfrmMimics = class(TForm)
    pnlTitle: TPanel;
    lblDate: TLabel;
    lblTime: TLabel;
    pnlDateTime: TPanel;
    pmScreen: TPopupMenu;
    PVScreen: TMenuItem;
    HlpScreen: TMenuItem;
    PropScreen: TMenuItem;
    Datatrend1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PVScreenClick(Sender: TObject);
    procedure PropScreenClick(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Datatrend1Click(Sender: TObject);
    procedure mniDebug1Click(Sender: TObject);
  private
    { note : keep attribut private }
    FControlMode : Byte;
    FElementStatus : Byte;
//    FEnbAlmInhibited : Byte;
    FTempDisable : Byte;
    FSessionID : Integer;

    FShowTitle : Boolean;
    FMimicID : E_MimicType;
    FDatabase : TIPMSDatabase;
    FSelectedElement : TIPMSBaseComponent;
    FOnLogInfo: TGetStrProc;
    FRightClickedElement : TIPMSBaseComponent;

    procedure SetShowTitle(const Value: boolean);
    procedure SetMimicID(const Value: E_MimicType);

    { set state element procedure }
    procedure SetDisableUnavalable(ipmsComp: TIPMSBaseComponent);
    procedure SetUnavailable(ipmsComp: TIPMSBaseComponent);
    procedure SetEnableValueOK(ipmsComp: TIPMSBaseComponent);
    //Prince
    procedure SetFalse(ipmsComp: TIPMSBaseComponent);
    procedure SetTripped(ipmsComp: TIPMSBaseComponent);
    procedure SetHighAlarm(ipmsComp: TIPMSBaseComponent);
    procedure SetLowAlarm(ipmsComp: TIPMSBaseComponent);
    procedure SetWireBreak(ipmsComp: TIPMSBaseComponent);
    procedure SetClosed(ipmsComp: TIPMSBaseComponent);
    procedure SetOpen(ipmsComp: TIPMSBaseComponent);
    procedure SetTransition(ipmsComp: TIPMSBaseComponent);
    procedure SetNotRFO(ipmsComp: TIPMSBaseComponent);
    procedure SetNotRFC(ipmsComp: TIPMSBaseComponent);
    procedure SetNotRFU(ipmsComp: TIPMSBaseComponent);
    procedure SetOpenFailure(ipmsComp: TIPMSBaseComponent);
    procedure SetFault(ipmsComp: TIPMSBaseComponent);
    procedure SetUnknown(ipmsComp: TIPMSBaseComponent);
    procedure SetNormal(ipmsComp: TIPMSBaseComponent);
    procedure SetActive(ipmsComp: TIPMSBaseComponent);
    procedure SetStopped(ipmsComp: TIPMSBaseComponent);
    procedure SetRunning(ipmsComp: TIPMSBaseComponent);
    procedure SetStopFailure(ipmsComp: TIPMSBaseComponent);
    procedure SetRunFailure(ipmsComp: TIPMSBaseComponent);
    procedure SetSpeed1(ipmsComp: TIPMSBaseComponent);
    procedure SetSpeed2(ipmsComp: TIPMSBaseComponent);
    procedure SetSpeed1Failure(ipmsComp: TIPMSBaseComponent);
    procedure SetSpeed2Failure(ipmsComp: TIPMSBaseComponent);
    procedure SetSpeed1FailedToStop(ipmsComp: TIPMSBaseComponent);
    procedure SetSpeed2FailedToStop(ipmsComp: TIPMSBaseComponent);
    procedure SetFailedToStop(ipmsComp: TIPMSBaseComponent);{belum ketemu elementnya}
    procedure SetFailureToStop(ipmsComp: TIPMSBaseComponent);{belum ketemu elementnya}
    procedure SetStandby(ipmsComp: TIPMSBaseComponent);
    procedure SetStandbyFailure(ipmsComp: TIPMSBaseComponent);
    procedure SetStartFailure(ipmsComp: TIPMSBaseComponent);
    procedure SetStandbyFailedToStop(ipmsComp: TIPMSBaseComponent);
    procedure SetCounting(ipmsComp: TIPMSBaseComponent);
    procedure SetState(ipmsComp: TIPMSBaseComponent);
    procedure SetHHA(ipmsComp: TIPMSBaseComponent);
    procedure SetOORL(ipmsComp: TIPMSBaseComponent);
    procedure SetOORH(ipmsComp: TIPMSBaseComponent);
    procedure SetXHA(ipmsComp: TIPMSBaseComponent);
    procedure SetState0(ipmsComp: TIPMSBaseComponent);
    procedure SetState1(ipmsComp: TIPMSBaseComponent);
    procedure SetAlarm(ipmsComp: TIPMSBaseComponent);
    procedure SetWarning(ipmsComp: TIPMSBaseComponent);
    procedure SetControlFailure(ipmsComp: TIPMSBaseComponent);
    procedure SetValueElement(ipmsComp: TIPMSBaseComponent; aValue : Double);

    //Prince 'belum nemu fungsi yg sesuai jd buat sendiri dulu'
    procedure SetElementCaption(ipmsComp: TIPMSBaseComponent; Value: E_State);
    procedure SetOnLogInfo(const Value: TGetStrProc);
  protected
    FOnMimicsShowCIPData : TOnMimicsShowCIPData;
    FOnShortcutClick : TOnShortcutClick;
    FOnAlarmChange : TOnAlarmChange;
    FOnListAlarm : TOnListAlarm;
    FOnRemoveAlarm : TOnRemoveAlarm;
    FOnDisableAlarm : TOnDisableAlarm;
    FOnStatusControlIns  : TOnStatusControlIns;

    procedure SetOnMimicsShowCIPData(aValue: TOnMimicsShowCIPData);
    procedure SetOnShortcutClick(aValue: TOnShortcutClick);
    procedure GotoMimic(Sender: TObject);
  public
    procedure SetCIPData(Sender: TObject);
    procedure SetControlMode(aVal: Byte);
    procedure SetElementStatus(aVal: Byte);
    procedure SetEnbAlmInhibited(ipmsComp: TIPMSBaseComponent; aElemID: string;
      aVal: Byte);
    procedure SetMouseDownPopupMenu;

    procedure SetTitle(aTitle: string);
    procedure SetDatabase(aDatabase: TIPMSDatabase);
    procedure SetSession(aSessionID: Integer);

    procedure UpdateElementData(aElementID: string;
      aComponent: TIPMSBaseComponent; aState: Integer; aValue: Byte);
    procedure ReceivedElementValue(aElementID:string;
      aComponent: TIPMSBaseComponent; aState: Integer; aValue:Double);
    procedure SetServerTime(aTime: TDateTime);

    procedure SetStatusControlInstruktur(aMimicID, aStatus: Byte;
      aElementID : string);

    { call this to release event }
    procedure ReleaseEvents; virtual;

    { call this if mimic need update }
    procedure NeedReload; virtual;

    { mimic title }
    property ShowTitle : boolean read FShowTitle write SetShowTitle default True;

    { mimic ID }
    property MimicID : E_MimicType read FMimicID write SetMimicID;

    { search element }
    function GetElement(aElementID: string): TIPMSBaseComponent;
    function GetElements(aElementID: string; var al: TList): Integer;
    function ElementExist(aElementID: string): Boolean;

    property OnMimicsShowCIPData : TOnMimicsShowCIPData
      read FOnMimicsShowCIPData write SetOnMimicsShowCIPData;
    property OnShortcutClick : TOnShortcutClick read FOnShortcutClick
      write SetOnShortcutClick;
    property OnAlarmChange : TOnAlarmChange read FOnAlarmChange
      write FOnAlarmChange;
    property OnListAlarm : TOnListAlarm read FOnListAlarm write FOnListAlarm;
    property OnRemoveAlarm : TOnRemoveAlarm read FOnRemoveAlarm
      write FOnRemoveAlarm;
    property OnDisableAlarm: TOnDisableAlarm read FOnDisableAlarm
      write FOnDisableAlarm;
    property OnStatusControlIns : TOnStatusControlIns read FOnStatusControlIns
      write FOnStatusControlIns;

    property SelectedElement : TIPMSBaseComponent read FSelectedElement;
    property OnLogInfo : TGetStrProc read FOnLogInfo write SetOnLogInfo;
    property TempDisable : Byte read FTempDisable write FTempDisable;
  end;

var
  frmMimics: TfrmMimics;

implementation

uses
  uListener, ufrmPointView, ufrmPropertiesScreen, uAnalogSensor,
  uCircuitBreakerElement, uControlElement, uMotorControlElement,
  uMotorControlDoubleSpeed, uMotorControlStandby, uRunningHour, uSetpoint,
  uSwitchElement, uSwitchEvent, uSwitchNBCD, uSwitchTriangle, uTankSensor,
  uValveControl, uValveProportionally, uIPMS_Data, uHorizontalBar, uVerticalBar,
  uFunction, uShortcut, uComputer, ufrmLogger;

{$R *.dfm}

procedure TfrmMimics.Datatrend1Click(Sender: TObject);
begin
  if not Assigned(frmTrending) then
    frmTrending := TfrmTrending.Create(Self);

  frmTrending.Database := FDatabase;
  frmTrending.SessionID := FSessionID;

  {Sementara cendol dulu, kalo element yg dklik g ada, bisa bikin eror}
  if Assigned(FRightClickedElement) then
    frmTrending.AddDataTrend(FRightClickedElement.ElementID);

  frmTrending.Show;
end;

function TfrmMimics.ElementExist(aElementID: string): Boolean;
var
  i : Integer;
begin
  Result := False;

  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TIPMSBaseComponent then
    begin
      if TIPMSBaseComponent(Components[i]).ElementID = aElementID then
      begin
        Result := True;
        Break;
      end;
    end;
  end;

end;

procedure TfrmMimics.FormCreate(Sender: TObject);
var
  i : Integer;
begin
  inherited;

  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TIPMSBaseComponent then
    begin
      if Components[i] is TShortcut then
        TIPMSBaseComponent(Components[i]).OnClick := GotoMimic
      else if (TIPMSBaseComponent(Components[i]).ElementID <> '') then
        TIPMSBaseComponent(Components[i]).OnClick := SetCIPData;
    end;
  end;

  lblDate.Caption := FormatDateTime('dd/mm/yyyy', Now);
  lblTime.Caption := FormatDateTime('hh:nn:ss', Now);

  FSessionID := 0;
end;

procedure TfrmMimics.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
   ctrl : TWinControl;
   lPoint : TPoint;
begin
  if Button = mbRight then
  begin
    ctrl := FindVCLWindow(Mouse.CursorPos) ;

    if ctrl <> nil then
    begin
      Caption := ctrl.Name;

      if ctrl is TAnalogSensor then
      begin
        N2.Visible := True;
        Datatrend1.Visible := True;
        FRightClickedElement := TIPMSBaseComponent(ctrl);
      end
      else
      begin
        N2.Visible := False;
        Datatrend1.Visible := False;
        FRightClickedElement := nil;
      end;

      lPoint := ctrl.ClientToScreen(Point(X,Y));
      pmScreen.Popup(lPoint.X,lPoint.Y);
    end;
  end;

  if Assigned(frmTrending) and frmTrending.Showing then
    frmTrending.Close;
end;

procedure TfrmMimics.FormResize(Sender: TObject);
begin
  pnlTitle.Left := (Width - pnlTitle.Width) div 2;
  pnlDateTime.Left := (Width - pnlDateTime.Width) - 5;
end;

function TfrmMimics.GetElement(aElementID: string): TIPMSBaseComponent;
var
  i : Integer;
begin
  Result := nil;

  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TIPMSBaseComponent then
    begin
      if TIPMSBaseComponent(Components[i]).ElementID = aElementID then
      begin
        Result := TIPMSBaseComponent(Components[i]);

        Break;
      end;
    end;
  end;
end;

function TfrmMimics.GetElements(aElementID: string; var al: TList): Integer;
var
  i : Integer;
begin
  Result := 0;

  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TIPMSBaseComponent then
    begin
      if TIPMSBaseComponent(Components[i]).ElementID = aElementID then
      begin
        Inc(Result);
        al.Add(TIPMSBaseComponent(Components[i]));
      end;
    end;
  end;
end;

procedure TfrmMimics.GotoMimic(Sender: TObject);
begin
  if Assigned(FOnShortcutClick) then
    FOnShortcutClick(TShortcut(Sender).Page);
end;

procedure TfrmMimics.mniDebug1Click(Sender: TObject);
begin

  if not Assigned(frmLogs) then
    frmLogs := TfrmLogs.Create(nil);

  frmLogs.Show;

end;

procedure TfrmMimics.NeedReload;
begin

end;

procedure TfrmMimics.PropScreenClick(Sender: TObject);
begin
  frmScreen.Show;
end;

procedure TfrmMimics.PVScreenClick(Sender: TObject);
begin
  if not Assigned(frmPointView) then
    frmPointView := TfrmPointView.Create(Self);

  frmPointView.Show;
  frmPointView.Caption := 'Point View - Screen';
end;

procedure TfrmMimics.ReceivedElementValue(aElementID: string;
  aComponent: TIPMSBaseComponent; aState: Integer; aValue: Double);
begin

  if Assigned(aComponent) and (aComponent.ElementID = aElementID)then
  case aState of
    C_ORD_STATEVALUEELEMENT_CHANGE,
    C_ORD_STATEVALUEAPP_CHANGE,
    C_ORD_STATEVALUESENSOR_CHANGE :
    begin
      if (not (aComponent.Hint = '%')) and (not (aComponent.Hint = 'm')) then
      begin
        SetValueElement(aComponent, aValue);
      end;
    end;
    C_ORD_STATEVALUEM3_CHANGE :
    begin
      if aComponent.Hint = 'm3' then
      begin
//        FValueApp := aValue;
        SetValueElement(aComponent, aValue);
      end;
    end;
    C_ORD_STATEVALUELEVEL_CHANGE :
    begin
      if aComponent.Tag = 1 then
      begin
//        FValueApp := aValue;
        SetValueElement(aComponent, aValue);
      end;
    end;
    C_ORD_STATEVALUEELEMENT_CHANGE_IN_PERCENT :
    begin
      if aComponent.Hint = '%' then
      begin
//        FValueApp := aValue;
        SetValueElement(aComponent, aValue);
      end;
    end;
    C_ORD_STATEVALUEELEMENT_CHANGE_IN_METER :
    begin
      if aComponent.Hint = 'm' then
      begin
//        FValueApp := aValue;
        SetValueElement(aComponent, aValue);
      end;
    end;
  end;

//  if Assigned(FOnLogInfo) then
//    FOnLogInfo('  Mimic : ' + IntToStr(Byte(FMimicID)) + ' Update OK..');
end;

procedure TfrmMimics.ReleaseEvents;
begin

end;

procedure TfrmMimics.SetActive(ipmsComp: TIPMSBaseComponent);
begin
  if ipmsComp.ClassType = TControlElement then
    TControlElement(ipmsComp).Status := CTtaON;
end;

procedure TfrmMimics.SetAlarm(ipmsComp: TIPMSBaseComponent);
begin
  if ipmsComp.ClassType = TAnalogSensor then

  else if ipmsComp.ClassType = TCircuitBreakerElement then

  else if ipmsComp.ClassType = TControlElement then

  else if ipmsComp.ClassType = THorizontalBar then

  else if ipmsComp.ClassType = TMotorControlDoubleSpeed then

  else if ipmsComp.ClassType = TMotorControlElement then

  else if ipmsComp.ClassType = TMotorControlStandby then

  else if ipmsComp.ClassType = TRunningHour then

  else if ipmsComp.ClassType = TSetpoint then

  else if ipmsComp.ClassType = TSwitchElement then
    TSwitchElement(ipmsComp).Status := SWtaAlarm
  else if ipmsComp.ClassType = TSwitchEvent then

  else if ipmsComp.ClassType = TSwitchNBCD then
    TSwitchNBCD(ipmsComp).Status := SNtaAlarm
  else if ipmsComp.ClassType = TSwitchTriangle then
    TSwitchTriangle(ipmsComp).Status := SWtaAlarm
  else if ipmsComp.ClassType = TTankSensor then

  else if ipmsComp.ClassType = TValveControl then

  else if ipmsComp.ClassType = TValveProportionally then

  else if ipmsComp.ClassType = TVerticalBar then
end;

procedure TfrmMimics.SetCIPData(Sender: TObject);
var
  aValue : Double;
  lengthStr : Integer;
  tmpString : string;
  ipmsComp : TIPMSBaseComponent;
begin
  if Assigned(FSelectedElement) then
    FSelectedElement.Clicked := False;

  FSelectedElement := TIPMSBaseComponent(Sender);
  FSelectedElement.Clicked := True;

  aValue := 0;
  ipmsComp := TIPMSBaseComponent(sender);
  if ipmsComp.ClassType = TAnalogSensor then
    aValue := TAnalogSensor(ipmsComp).SensorValue
  else if ipmsComp.ClassType = TCircuitBreakerElement then
    aValue := 0
  else if ipmsComp.ClassType = TControlElement then
  begin
    if ipmsComp.Hint = '%' then
    begin
      lengthStr := length(TControlElement(ipmsComp).Caption);
      tmpString := Copy(TControlElement(ipmsComp).Caption,1,lengthStr-2);

      aValue := StrToFloat(tmpString);
    end
    else
     aValue := 0;
  end
  else if ipmsComp.ClassType = THorizontalBar then
    aValue := 0
  else if ipmsComp.ClassType = TMotorControlDoubleSpeed then
    aValue := 0
  else if ipmsComp.ClassType = TMotorControlElement then
    aValue := 0
  else if ipmsComp.ClassType = TMotorControlStandby then
    aValue := 0
  else if ipmsComp.ClassType = TRunningHour then
    aValue := TRunningHour(ipmsComp).SensorValue
  else if ipmsComp.ClassType = TSetpoint then
    aValue := TSetpoint(ipmsComp).SensorValue
  else if ipmsComp.ClassType = TSwitchElement then
  begin
    if ipmsComp.Hint = '%' then
    begin
      lengthStr := length(TSwitchElement(ipmsComp).Caption);
      tmpString := Copy(TSwitchElement(ipmsComp).Caption,1,lengthStr-2);

      aValue := StrToFloat(tmpString);
    end
    else
      aValue := 0;
  end
  else if ipmsComp.ClassType = TSwitchEvent then
  begin
    aValue := TSwitchEvent(ipmsComp).SensorValue
  end
  else if ipmsComp.ClassType = TSwitchNBCD then
    aValue := 0
  else if ipmsComp.ClassType = TSwitchTriangle then
    aValue := 0
  else if ipmsComp.ClassType = TTankSensor then
    aValue := TTankSensor(ipmsComp).TankValue
  else if ipmsComp.ClassType = TValveControl then
    aValue := 0
  else if ipmsComp.ClassType = TValveProportionally then
    aValue := TValveProportionally(ipmsComp).SensorValue
  else if ipmsComp.ClassType = TVerticalBar then
    aValue := 0;

  if Assigned(FOnMimicsShowCIPData) then
    FOnMimicsShowCIPData(TIPMSBaseComponent(Sender).ElementID, FControlMode,
      FElementStatus, ipmsComp.EnbAlmInhibited, {FValueApp}aValue);
end;

procedure TfrmMimics.SetClosed(ipmsComp: TIPMSBaseComponent);
begin
  if ipmsComp.ClassType = TAnalogSensor then
    {nothing}
  else if ipmsComp.ClassType = TCircuitBreakerElement then
    TCircuitBreakerElement(ipmsComp).Status := CBtaClosed
  else if ipmsComp.ClassType = TControlElement then
    {nothing}
  else if ipmsComp.ClassType = THorizontalBar then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlDoubleSpeed then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlElement then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlStandby then
    {nothing}
  else if ipmsComp.ClassType = TRunningHour then
    {nothing}
  else if ipmsComp.ClassType = TSetpoint then
    {nothing}
  else if ipmsComp.ClassType = TSwitchElement then
    {nothing}
  else if ipmsComp.ClassType = TSwitchEvent then
    {nothing}
  else if ipmsComp.ClassType = TSwitchNBCD then
    {nothing}
  else if ipmsComp.ClassType = TSwitchTriangle then
    {nothing}
  else if ipmsComp.ClassType = TTankSensor then
    {nothing}
  else if ipmsComp.ClassType = TValveControl then
    TValveControl(ipmsComp).Status := VCtaClosed
  else if ipmsComp.ClassType = TValveProportionally then
    TValveProportionally(ipmsComp).Status := VPtaAlmostClosed
  else if ipmsComp.ClassType = TVerticalBar then
    {nothing}
end;

procedure TfrmMimics.SetControlFailure(ipmsComp: TIPMSBaseComponent);
begin
  if ipmsComp.ClassType = TAnalogSensor then

  else if ipmsComp.ClassType = TCircuitBreakerElement then

  else if ipmsComp.ClassType = TControlElement then

  else if ipmsComp.ClassType = THorizontalBar then

  else if ipmsComp.ClassType = TMotorControlDoubleSpeed then

  else if ipmsComp.ClassType = TMotorControlElement then

  else if ipmsComp.ClassType = TMotorControlStandby then

  else if ipmsComp.ClassType = TRunningHour then

  else if ipmsComp.ClassType = TSetpoint then

  else if ipmsComp.ClassType = TSwitchElement then

  else if ipmsComp.ClassType = TSwitchEvent then

  else if ipmsComp.ClassType = TSwitchNBCD then

  else if ipmsComp.ClassType = TSwitchTriangle then

  else if ipmsComp.ClassType = TTankSensor then

  else if ipmsComp.ClassType = TValveControl then

  else if ipmsComp.ClassType = TValveProportionally then
    TValveProportionally(ipmsComp).Status := VPtaFailed
  else if ipmsComp.ClassType = TVerticalBar then
end;

procedure TfrmMimics.SetControlMode(aVal: Byte);
begin
  case aVal of
    0: FControlMode := 0;
    1: FControlMode := 1;
    2: FControlMode := 2;
    3: FControlMode := 3;
    4: FControlMode := 4;
  end;
end;

procedure TfrmMimics.SetCounting(ipmsComp: TIPMSBaseComponent);
begin
  if ipmsComp.ClassType = TAnalogSensor then

  else if ipmsComp.ClassType = TCircuitBreakerElement then

  else if ipmsComp.ClassType = TControlElement then

  else if ipmsComp.ClassType = THorizontalBar then

  else if ipmsComp.ClassType = TMotorControlDoubleSpeed then

  else if ipmsComp.ClassType = TMotorControlElement then

  else if ipmsComp.ClassType = TMotorControlStandby then

  else if ipmsComp.ClassType = TRunningHour then
    TRunningHour(ipmsComp).Status := RHtaCounting
  else if ipmsComp.ClassType = TSetpoint then

  else if ipmsComp.ClassType = TSwitchElement then

  else if ipmsComp.ClassType = TSwitchEvent then

  else if ipmsComp.ClassType = TSwitchNBCD then

  else if ipmsComp.ClassType = TSwitchTriangle then

  else if ipmsComp.ClassType = TTankSensor then

  else if ipmsComp.ClassType = TValveControl then

  else if ipmsComp.ClassType = TValveProportionally then

  else if ipmsComp.ClassType = TVerticalBar then
end;

procedure TfrmMimics.SetDatabase(aDatabase: TIPMSDatabase);
begin
  FDatabase := aDatabase;
end;

procedure TfrmMimics.SetDisableUnavalable;
begin
  if ipmsComp.ClassType = TAnalogSensor then
    TAnalogSensor(ipmsComp).Status := AStaDisableUnavailable
  else if ipmsComp.ClassType = TCircuitBreakerElement then
    TCircuitBreakerElement(ipmsComp).Status := CBtaDisabledUnavailable
  else if ipmsComp.ClassType = TControlElement then
    TControlElement(ipmsComp).Status := CTtaNotReadyToUse
  else if ipmsComp.ClassType = THorizontalBar then
    THorizontalBar(ipmsComp).Status := AStaDisableUnavailable
  else if ipmsComp.ClassType = TMotorControlDoubleSpeed then
    TMotorControlDoubleSpeed(ipmsComp).Status := MDtaDisableUnavailable
  else if ipmsComp.ClassType = TMotorControlElement then
    TMotorControlElement(ipmsComp).Status := MCtaDisableUnavailable
  else if ipmsComp.ClassType = TMotorControlStandby then
    {disabled->stopped,not in standby}
    TMotorControlStandby(ipmsComp).StatusPump := MStaStoppedNotStandby
  else if ipmsComp.ClassType = TRunningHour then
    TRunningHour(ipmsComp).Status := RHtaDisableUnavailable
  else if ipmsComp.ClassType = TSetpoint then
    TSetpoint(ipmsComp).Status := SPtaDisableUnavailable
  else if ipmsComp.ClassType = TSwitchElement then
    TSwitchElement(ipmsComp).Status := SWtaDisabled
  else if ipmsComp.ClassType = TSwitchEvent then
    TSwitchEvent(ipmsComp).Status := SEtaDisableUnavailable
  else if ipmsComp.ClassType = TSwitchNBCD then
    TSwitchNBCD(ipmsComp).Status := SNtaDisabled
  else if ipmsComp.ClassType = TSwitchTriangle then
    TSwitchTriangle(ipmsComp).Status := SWtaDisabled
  else if ipmsComp.ClassType = TTankSensor then
    TTankSensor(ipmsComp).Status := TStaDisableUnavailable
  else if ipmsComp.ClassType = TValveControl then
    TValveControl(ipmsComp).Status := VCtaDisableUnavailable
  else if ipmsComp.ClassType = TValveProportionally then
    TValveProportionally(ipmsComp).Status := VPtaDisableUnavailable
  else if ipmsComp.ClassType = TVerticalBar then
    TVerticalBar(ipmsComp).Status := AStaDisableUnavailable
  else if ipmsComp.ClassType = TComputer then
    TComputer(ipmsComp).Status := SWtaDisabled;
end;

procedure TfrmMimics.SetElementStatus(aVal: Byte);
begin
  case aVal of
    0 : FElementStatus := 4;
    2 : FElementStatus := 1;
    3 : FElementStatus := 13;
    4 : FElementStatus := 12;
    5 : FElementStatus := 1;
    6 : FElementStatus := 11;
    7 : FElementStatus := 1;
    8 : FElementStatus := 2;
    9 : FElementStatus := 5;
    10: FElementStatus := 13;
    11: FElementStatus := 12;
    12: FElementStatus := 13;
    13: FElementStatus := 14;
    14: FElementStatus := 15;
    15: FElementStatus := 11;
    16: FElementStatus := 14;
    17: FElementStatus := 12;
    18: FElementStatus := 13;
    19: FElementStatus := 10;
    20: FElementStatus := 5;
    21: FElementStatus := 2;
    22: FElementStatus := 3;
    23: FElementStatus := 7;
    24: FElementStatus := 1;
    25: FElementStatus := 2;
    26: FElementStatus := 13;
    27: FElementStatus := 12;
    28: FElementStatus := 2;
    29: FElementStatus := 2;
    30: FElementStatus := 13;
    31: FElementStatus := 13;
    32: FElementStatus := 13;
    33: FElementStatus := 13;
    34: FElementStatus := 13;
    35: FElementStatus := 13;
    36: FElementStatus := 13;
    37: FElementStatus := 3;
    38: FElementStatus := 11;
    39: FElementStatus := 4;
    40: FElementStatus := 1;
    41: FElementStatus := 4;
    42: FElementStatus := 1;
    43: FElementStatus := 12;
    44: FElementStatus := 2;
    45: FElementStatus := 14;
    46: FElementStatus := 15;
    47: FElementStatus := 13;
    48: FElementStatus := 1;
    49: FElementStatus := 1;
    50: FElementStatus := 15;
    51: FElementStatus := 15;
    52: FElementStatus := 1;
    53: FElementStatus := 1;
  end;
end;

procedure TfrmMimics.SetElementCaption(ipmsComp: TIPMSBaseComponent; Value: E_State);
begin
  if ipmsComp.ClassType = TSwitchElement then
  begin
    if Value = sState15 then
    begin
      TSwitchElement(ipmsComp).Status := SWtaFalse;
      TSwitchElement(ipmsComp).Caption := '***************';
    end
    else
    begin
      TSwitchElement(ipmsComp).Status := SWtaOk;
      TSwitchElement(ipmsComp).Caption := ElementStateToCaption(Value)
    end;
  end;
end;

procedure TfrmMimics.SetEnableValueOK;
begin
  if ipmsComp.ClassType = TAnalogSensor then
    TAnalogSensor(ipmsComp).Status := AStaValOK
  else if ipmsComp.ClassType = TCircuitBreakerElement then
    TCircuitBreakerElement(ipmsComp).Status := CBtaClosed
  else if ipmsComp.ClassType = TControlElement then
     TControlElement(ipmsComp).Status := CTtaOFF
  else if ipmsComp.ClassType = THorizontalBar then
    THorizontalBar(ipmsComp).Status := AStaValOK
  else
  if ipmsComp.ClassType = TMotorControlDoubleSpeed then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlElement then
    TMotorControlElement(ipmsComp).Status := MCtaRunning
  else if ipmsComp.ClassType = TMotorControlStandby then
    {nothing}
  else if ipmsComp.ClassType = TRunningHour then
    {nothing}
  else if ipmsComp.ClassType = TSetpoint then
    {nothing}
  else
  if ipmsComp.ClassType = TSwitchElement then
    TSwitchElement(ipmsComp).Status := SWtaOk
  else
  if ipmsComp.ClassType = TSwitchEvent then
    {nothing}
  else if ipmsComp.ClassType = TSwitchNBCD then
    {nothing}
  else if ipmsComp.ClassType = TSwitchTriangle then
    TSwitchTriangle(ipmsComp).Status := SWtaOk
  else if ipmsComp.ClassType = TTankSensor then
    TTankSensor(ipmsComp).Status := TStaValOK
  else if ipmsComp.ClassType = TValveControl then
    TValveControl(ipmsComp).Status := VCtaOpen
  else if ipmsComp.ClassType = TValveProportionally then
    {nothing}
  else if ipmsComp.ClassType = TVerticalBar then
    TVerticalBar(ipmsComp).Status := AStaValOK;
end;

procedure TfrmMimics.SetEnbAlmInhibited(ipmsComp : TIPMSBaseComponent; aElemID: string; aVal: Byte);
begin
  case E_StateAlarm(aVal) of
    { if alarm status xxx set enable/alarm inhibited status : enable }
    saNone, saHA, saLA, saWireBreak, saUnknown,
    saFault, saTripped, saOpenFailure,saCLoseFailure,
    saStopFailure, saStartFailure, saSpeed1, saSpeed1Failure,
    saSpeed2, saSpeed2Failure, saFailedToStop, saFailureToStop,
    saSpeed1FailedToStop, saSpeed2FailedToStop, saNotStandby,
    saRunningFailedToStop, saStandbyFailedToStop,
    saStandbyFailure, saHHA, saOORL, saOORH, saXHA, saAlarm,
    saControlFailure, saNoneDisable : ipmsComp.EnbAlmInhibited := 1;

    { if alarm status saInhibited set enable/alarm inhibited
      status : alarm inhibited }
    saInhibited : ipmsComp.EnbAlmInhibited := 2;
  end;

  if (E_StateAlarm(aVal) = saNone) or (E_StateAlarm(aVal) = saInhibited) then
  begin
    { remove alarm from list }
    if Assigned(FOnRemoveAlarm) then
      FOnRemoveAlarm(aElemID);
  end
  else if (E_StateAlarm(aVal) = saNoneDisable) then
  begin
    { set disable alarm status }
    if Assigned(FOnDisableAlarm) then
      FOnDisableAlarm(aElemID);
  end
  else
  begin
    { write alarm list }
    if Assigned(FOnListAlarm) then
      FOnListAlarm(aElemID, aVal);
  end;

  { change alarm sound authorization }
  if Assigned(FOnAlarmChange) then
    FOnAlarmChange(aElemID, aVal);
end;

procedure TfrmMimics.SetStatusControlInstruktur(aMimicID, aStatus: Byte;
  aElementID: string);
begin
  if Assigned(FOnStatusControlIns) then
    OnStatusControlIns(aMimicID, aStatus, aElementID);
end;

procedure TfrmMimics.SetFailedToStop(ipmsComp: TIPMSBaseComponent);
begin
  if ipmsComp.ClassType = TAnalogSensor then

  else if ipmsComp.ClassType = TCircuitBreakerElement then

  else if ipmsComp.ClassType = TControlElement then

  else if ipmsComp.ClassType = THorizontalBar then

  else if ipmsComp.ClassType = TMotorControlDoubleSpeed then

  else if ipmsComp.ClassType = TMotorControlElement then

  else if ipmsComp.ClassType = TMotorControlStandby then

  else if ipmsComp.ClassType = TRunningHour then

  else if ipmsComp.ClassType = TSetpoint then

  else if ipmsComp.ClassType = TSwitchElement then

  else if ipmsComp.ClassType = TSwitchEvent then

  else if ipmsComp.ClassType = TSwitchNBCD then

  else if ipmsComp.ClassType = TSwitchTriangle then

  else if ipmsComp.ClassType = TTankSensor then

  else if ipmsComp.ClassType = TValveControl then

  else if ipmsComp.ClassType = TValveProportionally then

  else if ipmsComp.ClassType = TVerticalBar then
end;

procedure TfrmMimics.SetFailureToStop(ipmsComp: TIPMSBaseComponent);
begin
  if ipmsComp.ClassType = TAnalogSensor then

  else if ipmsComp.ClassType = TCircuitBreakerElement then

  else if ipmsComp.ClassType = TControlElement then

  else if ipmsComp.ClassType = THorizontalBar then

  else if ipmsComp.ClassType = TMotorControlDoubleSpeed then

  else if ipmsComp.ClassType = TMotorControlElement then

  else if ipmsComp.ClassType = TMotorControlStandby then

  else if ipmsComp.ClassType = TRunningHour then

  else if ipmsComp.ClassType = TSetpoint then

  else if ipmsComp.ClassType = TSwitchElement then

  else if ipmsComp.ClassType = TSwitchEvent then

  else if ipmsComp.ClassType = TSwitchNBCD then

  else if ipmsComp.ClassType = TSwitchTriangle then

  else if ipmsComp.ClassType = TTankSensor then

  else if ipmsComp.ClassType = TValveControl then

  else if ipmsComp.ClassType = TValveProportionally then

  else if ipmsComp.ClassType = TVerticalBar then
end;

procedure TfrmMimics.SetFalse(ipmsComp: TIPMSBaseComponent);
begin
  if ipmsComp.ClassType = TAnalogSensor then
    {nothing}
  else if ipmsComp.ClassType = TCircuitBreakerElement then
    TCircuitBreakerElement(ipmsComp).Status := CBtaOpen
  else if ipmsComp.ClassType = TControlElement then
     {nothing}
  else if ipmsComp.ClassType = THorizontalBar then
//    THorizontalBar(ipmsComp).Status := AStaValOK
  else if ipmsComp.ClassType = TMotorControlDoubleSpeed then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlElement then
    TMotorControlElement(ipmsComp).Status := MCtaStopped
  else if ipmsComp.ClassType = TMotorControlStandby then
    {nothing}
  else if ipmsComp.ClassType = TRunningHour then
    {nothing}
  else if ipmsComp.ClassType = TSetpoint then
    {nothing}
  else if ipmsComp.ClassType = TSwitchElement then
    TSwitchElement(ipmsComp).Status := SWtaFalse
  else if ipmsComp.ClassType = TSwitchEvent then
    {nothing}
  else if ipmsComp.ClassType = TSwitchNBCD then
    {nothing}
  else if ipmsComp.ClassType = TSwitchTriangle then
    {nothing}
  else if ipmsComp.ClassType = TTankSensor then
    {nothing}
  else if ipmsComp.ClassType = TValveControl then
    {nothing}
  else if ipmsComp.ClassType = TValveProportionally then
    {nothing}
  else if ipmsComp.ClassType = TVerticalBar then
    {nothing}
end;

procedure TfrmMimics.SetFault(ipmsComp: TIPMSBaseComponent);
begin
  if ipmsComp.ClassType = TAnalogSensor then
    {nothing}
  else if ipmsComp.ClassType = TCircuitBreakerElement then
    {fault->undetermined}
    TCircuitBreakerElement(ipmsComp).Status := CBtaUndertermined
  else if ipmsComp.ClassType = TControlElement then
    {fault->disableunavailable}
    TControlElement(ipmsComp).Status := CTtaDisableUnavailable
  else if ipmsComp.ClassType = THorizontalBar then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlDoubleSpeed then
    TMotorControlDoubleSpeed(ipmsComp).Status := MDtaUndeterminedFaulted
  else if ipmsComp.ClassType = TMotorControlElement then
    TMotorControlElement(ipmsComp).Status := MCtaRunningFailStop_Faulted_Undetermined
  else if ipmsComp.ClassType = TMotorControlStandby then
    {fault->stopped, failed to stanby}
    TMotorControlStandby(ipmsComp).StatusPump := MStaStoppedFailStandby
  else if ipmsComp.ClassType = TRunningHour then
    {nothing}
  else if ipmsComp.ClassType = TSetpoint then
    {nothing}
  else if ipmsComp.ClassType = TSwitchElement then
    {nothing}
  else if ipmsComp.ClassType = TSwitchEvent then
    {nothing}
  else if ipmsComp.ClassType = TSwitchNBCD then
    {nothing}
  else if ipmsComp.ClassType = TSwitchTriangle then
    {nothing}
  else if ipmsComp.ClassType = TTankSensor then
    {nothing}
  else if ipmsComp.ClassType = TValveControl then
    {nothing}
  else if ipmsComp.ClassType = TValveProportionally then
    {nothing}
  else if ipmsComp.ClassType = TVerticalBar then
    {nothing}
end;

procedure TfrmMimics.SetHHA(ipmsComp: TIPMSBaseComponent);
begin
  if ipmsComp.ClassType = TAnalogSensor then
    {HHA->high or low}
    TAnalogSensor(ipmsComp).Status := AStaValHighLow
  else if ipmsComp.ClassType = TCircuitBreakerElement then

  else if ipmsComp.ClassType = TControlElement then

  else if ipmsComp.ClassType = THorizontalBar then
    {HHA->high or low}
    THorizontalBar(ipmsComp).Status := AStaValHighLow
  else if ipmsComp.ClassType = TMotorControlDoubleSpeed then

  else if ipmsComp.ClassType = TMotorControlElement then

  else if ipmsComp.ClassType = TMotorControlStandby then

  else if ipmsComp.ClassType = TRunningHour then

  else if ipmsComp.ClassType = TSetpoint then

  else if ipmsComp.ClassType = TSwitchElement then

  else if ipmsComp.ClassType = TSwitchEvent then

  else if ipmsComp.ClassType = TSwitchNBCD then

  else if ipmsComp.ClassType = TSwitchTriangle then

  else if ipmsComp.ClassType = TTankSensor then

  else if ipmsComp.ClassType = TValveControl then

  else if ipmsComp.ClassType = TValveProportionally then

  else if ipmsComp.ClassType = TVerticalBar then
    {HHA->high or low}
    TVerticalBar(ipmsComp).Status := AStaValHighLow
end;

procedure TfrmMimics.SetHighAlarm(ipmsComp: TIPMSBaseComponent);
begin
  if ipmsComp.ClassType = TAnalogSensor then
    TAnalogSensor(ipmsComp).Status := AStaValHighLow
  else if ipmsComp.ClassType = TCircuitBreakerElement then
    {nothing}
  else if ipmsComp.ClassType = TControlElement then
    {nothing}
  else if ipmsComp.ClassType = THorizontalBar then
    THorizontalBar(ipmsComp).Status := AStaValHighLow
  else if ipmsComp.ClassType = TMotorControlDoubleSpeed then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlElement then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlStandby then
    {nothing}
  else if ipmsComp.ClassType = TRunningHour then
    {nothing}
  else if ipmsComp.ClassType = TSetpoint then
    {nothing}
  else if ipmsComp.ClassType = TSwitchElement then
    TSwitchElement(ipmsComp).Status := SWtaAlarm
  else if ipmsComp.ClassType = TSwitchEvent then
    {nothing}
  else if ipmsComp.ClassType = TSwitchNBCD then
    {nothing}
  else if ipmsComp.ClassType = TSwitchTriangle then
    {nothing}
  else if ipmsComp.ClassType = TTankSensor then
    TTankSensor(ipmsComp).Status := TStaValHighLow
  else if ipmsComp.ClassType = TValveControl then
    {nothing}
  else if ipmsComp.ClassType = TValveProportionally then
    {nothing}
  else if ipmsComp.ClassType = TVerticalBar then
    TVerticalBar(ipmsComp).Status := AStaValHighLow
end;

procedure TfrmMimics.SetLowAlarm(ipmsComp: TIPMSBaseComponent);
begin
  if ipmsComp.ClassType = TAnalogSensor then
    TAnalogSensor(ipmsComp).Status := AStaValHighLow
  else if ipmsComp.ClassType = TCircuitBreakerElement then
    {nothing}
  else if ipmsComp.ClassType = TControlElement then
    {nothing}
  else if ipmsComp.ClassType = THorizontalBar then
    THorizontalBar(ipmsComp).Status := AStaValHighLow
  else if ipmsComp.ClassType = TMotorControlDoubleSpeed then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlElement then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlStandby then
    {nothing}
  else if ipmsComp.ClassType = TRunningHour then
    {nothing}
  else if ipmsComp.ClassType = TSetpoint then
    {nothing}
  else if ipmsComp.ClassType = TSwitchElement then
    TSwitchElement(ipmsComp).Status := SWtaAlarm
  else if ipmsComp.ClassType = TSwitchEvent then
    {nothing}
  else if ipmsComp.ClassType = TSwitchNBCD then
    {nothing}
  else if ipmsComp.ClassType = TSwitchTriangle then
    {nothing}
  else if ipmsComp.ClassType = TTankSensor then
    TTankSensor(ipmsComp).Status := TStaValHighLow
  else if ipmsComp.ClassType = TValveControl then
    {nothing}
  else if ipmsComp.ClassType = TValveProportionally then
    {nothing}
  else if ipmsComp.ClassType = TVerticalBar then
    TVerticalBar(ipmsComp).Status := AStaValHighLow
  else if ipmsComp.ClassType = TSwitchTriangle then
end;

procedure TfrmMimics.SetMimicID(const Value: E_MimicType);
begin
  FMimicID := Value;
end;

procedure TfrmMimics.SetMouseDownPopupMenu;
var
  i : Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TIPMSBaseComponent then
      TIPMSBaseComponent(Components[i]).OnMouseDown := OnMouseDown;

    if Components[i] is TImage then
      TIPMSBaseComponent(Components[i]).OnMouseDown := OnMouseDown;
  end;
end;

procedure TfrmMimics.SetNormal(ipmsComp: TIPMSBaseComponent);
begin
  if ipmsComp.ClassType = TAnalogSensor then
    {nothing}
  else if ipmsComp.ClassType = TCircuitBreakerElement then
    {nothing}
  else if ipmsComp.ClassType = TControlElement then
    TControlElement(ipmsComp).Status := CTtaOFF   // normal >> OFF,  active ON
    //TControlElement(ipmsComp).Status := CTtaON
  else if ipmsComp.ClassType = THorizontalBar then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlDoubleSpeed then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlElement then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlStandby then
    {nothing}
  else if ipmsComp.ClassType = TRunningHour then
    {nothing}
  else if ipmsComp.ClassType = TSetpoint then
    TSetpoint(ipmsComp).Status := SPtaNormal
  else if ipmsComp.ClassType = TSwitchElement then
    {nothing}
  else if ipmsComp.ClassType = TSwitchEvent then
    TSwitchEvent(ipmsComp).Status := SEtaNormal
  else if ipmsComp.ClassType = TSwitchNBCD then
    {nothing}
  else if ipmsComp.ClassType = TSwitchTriangle then
    {nothing}
  else if ipmsComp.ClassType = TTankSensor then
    {nothing}
  else if ipmsComp.ClassType = TValveControl then
    {nothing}
  else if ipmsComp.ClassType = TValveProportionally then
    {nothing}
  else if ipmsComp.ClassType = TVerticalBar then
    {nothing}
end;

procedure TfrmMimics.SetNotRFC(ipmsComp: TIPMSBaseComponent);
begin
  if ipmsComp.ClassType = TAnalogSensor then
    {nothing}
  else if ipmsComp.ClassType = TCircuitBreakerElement then
    TCircuitBreakerElement(ipmsComp).Status := CBtaNotReadyClose
  else if ipmsComp.ClassType = TControlElement then
    {nothing}
  else if ipmsComp.ClassType = THorizontalBar then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlDoubleSpeed then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlElement then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlStandby then
    {nothing}
  else if ipmsComp.ClassType = TRunningHour then
    {nothing}
  else if ipmsComp.ClassType = TSetpoint then
    {nothing}
  else if ipmsComp.ClassType = TSwitchElement then
    {nothing}
  else if ipmsComp.ClassType = TSwitchEvent then
    {nothing}
  else if ipmsComp.ClassType = TSwitchNBCD then
    {nothing}
  else if ipmsComp.ClassType = TSwitchTriangle then
    {nothing}
  else if ipmsComp.ClassType = TTankSensor then
    {nothing}
  else if ipmsComp.ClassType = TValveControl then
    {nothing but available}
  else if ipmsComp.ClassType = TValveProportionally then
    {nothing}
  else if ipmsComp.ClassType = TVerticalBar then
    {nothing}
end;

procedure TfrmMimics.SetNotRFO(ipmsComp: TIPMSBaseComponent);
begin
  if ipmsComp.ClassType = TAnalogSensor then
    {nothing}
  else if ipmsComp.ClassType = TCircuitBreakerElement then
    TCircuitBreakerElement(ipmsComp).Status := CBtaNotReadyOpen
  else if ipmsComp.ClassType = TControlElement then
    {nothing}
  else if ipmsComp.ClassType = THorizontalBar then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlDoubleSpeed then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlElement then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlStandby then
    {nothing}
  else if ipmsComp.ClassType = TRunningHour then
    {nothing}
  else if ipmsComp.ClassType = TSetpoint then
    {nothing}
  else if ipmsComp.ClassType = TSwitchElement then
    {nothing}
  else if ipmsComp.ClassType = TSwitchEvent then
    {nothing}
  else if ipmsComp.ClassType = TSwitchNBCD then
    {nothing}
  else if ipmsComp.ClassType = TSwitchTriangle then
    {nothing}
  else if ipmsComp.ClassType = TTankSensor then
    {nothing}
  else if ipmsComp.ClassType = TValveControl then
    {nothing but available}
  else if ipmsComp.ClassType = TValveProportionally then
    {nothing}
  else if ipmsComp.ClassType = TVerticalBar then
    {nothing}
end;

procedure TfrmMimics.SetNotRFU(ipmsComp: TIPMSBaseComponent);
begin
  if ipmsComp.ClassType = TAnalogSensor then
    {nothing}
  else if ipmsComp.ClassType = TCircuitBreakerElement then
    {nothing}
  else if ipmsComp.ClassType = TControlElement then
    TControlElement(ipmsComp).Status := CTtaNotReadyToUse
  else if ipmsComp.ClassType = THorizontalBar then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlDoubleSpeed then
    TMotorControlDoubleSpeed(ipmsComp).Status := MDtaStop_FanNotReady
  else if ipmsComp.ClassType = TMotorControlElement then
    TMotorControlElement(ipmsComp).Status := MCtaNotReadyForUse
  else if ipmsComp.ClassType = TMotorControlStandby then
    {RFU->stopped, not in stanby}
    TMotorControlStandby(ipmsComp).StatusPump := MStaStoppedNotStandby
  else if ipmsComp.ClassType = TRunningHour then
    {nothing}
  else if ipmsComp.ClassType = TSetpoint then
    {nothing}
  else if ipmsComp.ClassType = TSwitchElement then
    {nothing}
  else if ipmsComp.ClassType = TSwitchEvent then
    {nothing}
  else if ipmsComp.ClassType = TSwitchNBCD then
    {nothing}
  else if ipmsComp.ClassType = TSwitchTriangle then
    {nothing}
  else if ipmsComp.ClassType = TTankSensor then
    {nothing}
  else if ipmsComp.ClassType = TValveControl then
    {RFU->RFO}
    TValveControl(ipmsComp).Status := VCtaNotReadyToOpen
  else if ipmsComp.ClassType = TValveProportionally then
    TValveProportionally(ipmsComp).Status := VPtaNotReadyToUse
  else if ipmsComp.ClassType = TVerticalBar then
    {nothing}
end;

procedure TfrmMimics.SetOnLogInfo(const Value: TGetStrProc);
begin
  FOnLogInfo := Value;
end;

procedure TfrmMimics.SetOnMimicsShowCIPData(aValue: TOnMimicsShowCIPData);
begin
  FOnMimicsShowCIPData := aValue;
end;

procedure TfrmMimics.SetOnShortcutClick(aValue: TOnShortcutClick);
begin
  FOnShortcutClick := aValue;
end;

procedure TfrmMimics.SetOORH(ipmsComp: TIPMSBaseComponent);
begin
  if ipmsComp.ClassType = TAnalogSensor then
    TAnalogSensor(ipmsComp).Status := AStaTooHigh
  else if ipmsComp.ClassType = TCircuitBreakerElement then

  else if ipmsComp.ClassType = TControlElement then

  else if ipmsComp.ClassType = THorizontalBar then
    THorizontalBar(ipmsComp).Status := AStaTooHigh
  else if ipmsComp.ClassType = TMotorControlDoubleSpeed then

  else if ipmsComp.ClassType = TMotorControlElement then

  else if ipmsComp.ClassType = TMotorControlStandby then

  else if ipmsComp.ClassType = TRunningHour then

  else if ipmsComp.ClassType = TSetpoint then

  else if ipmsComp.ClassType = TSwitchElement then
    TSwitchElement(ipmsComp).Status := SWtaAlarm
  else if ipmsComp.ClassType = TSwitchEvent then

  else if ipmsComp.ClassType = TSwitchNBCD then

  else if ipmsComp.ClassType = TSwitchTriangle then

  else if ipmsComp.ClassType = TTankSensor then
    TTankSensor(ipmsComp).Status := TStaTooLowTooHigh
  else if ipmsComp.ClassType = TValveControl then

  else if ipmsComp.ClassType = TValveProportionally then
    TValveProportionally(ipmsComp).Status := VPtaTooHigh
  else if ipmsComp.ClassType = TVerticalBar then
    TVerticalBar(ipmsComp).Status := AStaTooHigh;
end;

procedure TfrmMimics.SetOORL(ipmsComp: TIPMSBaseComponent);
begin
  if ipmsComp.ClassType = TAnalogSensor then
    TAnalogSensor(ipmsComp).Status := AStaTooLow
  else if ipmsComp.ClassType = TCircuitBreakerElement then

  else if ipmsComp.ClassType = TControlElement then

  else if ipmsComp.ClassType = THorizontalBar then
    THorizontalBar(ipmsComp).Status := AStaTooLow
  else if ipmsComp.ClassType = TMotorControlDoubleSpeed then

  else if ipmsComp.ClassType = TMotorControlElement then

  else if ipmsComp.ClassType = TMotorControlStandby then

  else if ipmsComp.ClassType = TRunningHour then

  else if ipmsComp.ClassType = TSetpoint then

  else if ipmsComp.ClassType = TSwitchElement then
    TSwitchElement(ipmsComp).Status := SWtaAlarm
  else if ipmsComp.ClassType = TSwitchEvent then

  else if ipmsComp.ClassType = TSwitchNBCD then

  else if ipmsComp.ClassType = TSwitchTriangle then

  else if ipmsComp.ClassType = TTankSensor then
    TTankSensor(ipmsComp).Status := TStaTooLowTooHigh
  else if ipmsComp.ClassType = TValveControl then

  else if ipmsComp.ClassType = TValveProportionally then
    TValveProportionally(ipmsComp).Status := VPtaTooLow
  else if ipmsComp.ClassType = TVerticalBar then
    TVerticalBar(ipmsComp).Status := AStaTooLow;
end;

procedure TfrmMimics.SetOpen(ipmsComp: TIPMSBaseComponent);
begin
  if ipmsComp.ClassType = TAnalogSensor then
    {nothing}
  else if ipmsComp.ClassType = TCircuitBreakerElement then
    TCircuitBreakerElement(ipmsComp).Status := CBtaOpen
  else if ipmsComp.ClassType = TControlElement then
    {nothing}
  else if ipmsComp.ClassType = THorizontalBar then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlDoubleSpeed then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlElement then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlStandby then
    {nothing}
  else if ipmsComp.ClassType = TRunningHour then
    {nothing}
  else if ipmsComp.ClassType = TSetpoint then
    {nothing}
  else if ipmsComp.ClassType = TSwitchElement then
    {nothing}
  else if ipmsComp.ClassType = TSwitchEvent then
    {nothing}
  else if ipmsComp.ClassType = TSwitchNBCD then
    {nothing}
  else if ipmsComp.ClassType = TSwitchTriangle then
    {nothing}
  else if ipmsComp.ClassType = TTankSensor then
    {nothing}
  else if ipmsComp.ClassType = TValveControl then
    TValveControl(ipmsComp).Status := VCtaOpen
  else if ipmsComp.ClassType = TValveProportionally then
    TValveProportionally(ipmsComp).Status := VPtaNotClosed
  else if ipmsComp.ClassType = TVerticalBar then
    {nothing}
end;

procedure TfrmMimics.SetOpenFailure(ipmsComp: TIPMSBaseComponent);
begin
  if ipmsComp.ClassType = TAnalogSensor then
    {nothing}
  else if ipmsComp.ClassType = TCircuitBreakerElement then
    TCircuitBreakerElement(ipmsComp).Status := CBtaFailedOpen
  else if ipmsComp.ClassType = TControlElement then
    {nothing}
  else if ipmsComp.ClassType = THorizontalBar then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlDoubleSpeed then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlElement then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlStandby then
    {nothing}
  else if ipmsComp.ClassType = TRunningHour then
    {nothing}
  else if ipmsComp.ClassType = TSetpoint then
    {nothing}
  else if ipmsComp.ClassType = TSwitchElement then
    {nothing}
  else if ipmsComp.ClassType = TSwitchEvent then
    {nothing}
  else if ipmsComp.ClassType = TSwitchNBCD then
    {nothing}
  else if ipmsComp.ClassType = TSwitchTriangle then
    {nothing}
  else if ipmsComp.ClassType = TTankSensor then
    {nothing}
  else if ipmsComp.ClassType = TValveControl then
    TValveControl(ipmsComp).Status := VCtaOpenFailed
  else if ipmsComp.ClassType = TValveProportionally then
    {nothing}
  else if ipmsComp.ClassType = TVerticalBar then
    {nothing}
end;

procedure TfrmMimics.SetRunFailure(ipmsComp: TIPMSBaseComponent);
begin
  if ipmsComp.ClassType = TAnalogSensor then
    {nothing}
  else if ipmsComp.ClassType = TCircuitBreakerElement then
    {nothing}
  else if ipmsComp.ClassType = TControlElement then
    {nothing}
  else if ipmsComp.ClassType = THorizontalBar then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlDoubleSpeed then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlElement then
    {run failure->running failed to stop}
    TMotorControlElement(ipmsComp).Status := MCtaFailedToStart
  else if ipmsComp.ClassType = TMotorControlStandby then
    {nothing}
  else if ipmsComp.ClassType = TRunningHour then
    {nothing}
  else if ipmsComp.ClassType = TSetpoint then
    {nothing}
  else if ipmsComp.ClassType = TSwitchElement then
    {nothing}
  else if ipmsComp.ClassType = TSwitchEvent then
    {nothing}
  else if ipmsComp.ClassType = TSwitchNBCD then
    {nothing}
  else if ipmsComp.ClassType = TSwitchTriangle then
    {nothing}
  else if ipmsComp.ClassType = TTankSensor then
    {nothing}
  else if ipmsComp.ClassType = TValveControl then
    {nothing}
  else if ipmsComp.ClassType = TValveProportionally then
    {nothing}
  else if ipmsComp.ClassType = TVerticalBar then
    {nothing}
end;

procedure TfrmMimics.SetRunning(ipmsComp: TIPMSBaseComponent);
begin
  if ipmsComp.ClassType = TAnalogSensor then
    {nothing}
  else if ipmsComp.ClassType = TCircuitBreakerElement then
    {nothing}
  else if ipmsComp.ClassType = TControlElement then
    {nothing}
  else if ipmsComp.ClassType = THorizontalBar then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlDoubleSpeed then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlElement then
    TMotorControlElement(ipmsComp).Status := MCtaRunning
  else if ipmsComp.ClassType = TMotorControlStandby then
    TMotorControlStandby(ipmsComp).StatusPump := MStaRunningFailStandby
  else if ipmsComp.ClassType = TRunningHour then
    {nothing}
  else if ipmsComp.ClassType = TSetpoint then
    {nothing}
  else if ipmsComp.ClassType = TSwitchElement then
    {nothing}
  else if ipmsComp.ClassType = TSwitchEvent then
    {nothing}
  else if ipmsComp.ClassType = TSwitchNBCD then
    {nothing}
  else if ipmsComp.ClassType = TSwitchTriangle then
    {nothing}
  else if ipmsComp.ClassType = TTankSensor then
    {nothing}
  else if ipmsComp.ClassType = TValveControl then
    {nothing}
  else if ipmsComp.ClassType = TValveProportionally then
    {nothing}
  else if ipmsComp.ClassType = TVerticalBar then
    {nothing}
end;

procedure TfrmMimics.SetServerTime(aTime: TDateTime);
begin
  lblDate.Caption := FormatDateTime('dd-mm-yyy', aTime);
  lblTime.Caption := FormatDateTime('hh:nn:ss', aTime);
end;

procedure TfrmMimics.SetSession(aSessionID: integer);
begin
  FSessionID := aSessionID;
end;

procedure TfrmMimics.SetShowTitle(const Value: Boolean);
begin
  FShowTitle := Value;

  if Value then
  begin
    pnlTitle.Visible := True;
    lblDate.Visible := True;
    lblTime.Visible := True;
  end
  else
  begin
    pnlTitle.Visible := False;
    lblDate.Visible := False;
    lblTime.Visible := False;
  end;
end;

procedure TfrmMimics.SetSpeed1(ipmsComp: TIPMSBaseComponent);
begin
  if ipmsComp.ClassType = TAnalogSensor then
    {nothing}
  else if ipmsComp.ClassType = TCircuitBreakerElement then
    {nothing}
  else if ipmsComp.ClassType = TControlElement then
    {nothing}
  else if ipmsComp.ClassType = THorizontalBar then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlDoubleSpeed then
    TMotorControlDoubleSpeed(ipmsComp).Status := MDtaRemoteSupplyLow
  else if ipmsComp.ClassType = TMotorControlElement then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlStandby then
    {nothing}
  else if ipmsComp.ClassType = TRunningHour then
    {nothing}
  else if ipmsComp.ClassType = TSetpoint then
    {nothing}
  else if ipmsComp.ClassType = TSwitchElement then
    {nothing}
  else if ipmsComp.ClassType = TSwitchEvent then
    {nothing}
  else if ipmsComp.ClassType = TSwitchNBCD then
    {nothing}
  else if ipmsComp.ClassType = TSwitchTriangle then
    {nothing}
  else if ipmsComp.ClassType = TTankSensor then
    {nothing}
  else if ipmsComp.ClassType = TValveControl then
    {nothing}
  else if ipmsComp.ClassType = TValveProportionally then
    {nothing}
  else if ipmsComp.ClassType = TVerticalBar then
    {nothing}
end;

procedure TfrmMimics.SetSpeed1FailedToStop(ipmsComp: TIPMSBaseComponent);
begin
  if ipmsComp.ClassType = TAnalogSensor then
    {nothing}
  else if ipmsComp.ClassType = TCircuitBreakerElement then
    {nothing}
  else if ipmsComp.ClassType = TControlElement then
    {nothing}
  else if ipmsComp.ClassType = THorizontalBar then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlDoubleSpeed then
    TMotorControlDoubleSpeed(ipmsComp).Status := MDtaRunSupplyLow_FailStop
  else if ipmsComp.ClassType = TMotorControlElement then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlStandby then
    {nothing}
  else if ipmsComp.ClassType = TRunningHour then
    {nothing}
  else if ipmsComp.ClassType = TSetpoint then
    {nothing}
  else if ipmsComp.ClassType = TSwitchElement then
    {nothing}
  else if ipmsComp.ClassType = TSwitchEvent then
    {nothing}
  else if ipmsComp.ClassType = TSwitchNBCD then
    {nothing}
  else if ipmsComp.ClassType = TSwitchTriangle then
    {nothing}
  else if ipmsComp.ClassType = TTankSensor then
    {nothing}
  else if ipmsComp.ClassType = TValveControl then
    {nothing}
  else if ipmsComp.ClassType = TValveProportionally then
    {nothing}
  else if ipmsComp.ClassType = TVerticalBar then
    {nothing}
end;

procedure TfrmMimics.SetSpeed1Failure(ipmsComp: TIPMSBaseComponent);
begin
  if ipmsComp.ClassType = TAnalogSensor then
    {nothing}
  else if ipmsComp.ClassType = TCircuitBreakerElement then
    {nothing}
  else if ipmsComp.ClassType = TControlElement then
    {nothing}
  else if ipmsComp.ClassType = THorizontalBar then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlDoubleSpeed then
    TMotorControlDoubleSpeed(ipmsComp).Status := MDtaStop_FailSupplyLow
  else if ipmsComp.ClassType = TMotorControlElement then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlStandby then
    {nothing}
  else if ipmsComp.ClassType = TRunningHour then
    {nothing}
  else if ipmsComp.ClassType = TSetpoint then
    {nothing}
  else if ipmsComp.ClassType = TSwitchElement then
    {nothing}
  else if ipmsComp.ClassType = TSwitchEvent then
    {nothing}
  else if ipmsComp.ClassType = TSwitchNBCD then
    {nothing}
  else if ipmsComp.ClassType = TSwitchTriangle then
    {nothing}
  else if ipmsComp.ClassType = TTankSensor then
    {nothing}
  else if ipmsComp.ClassType = TValveControl then
    {nothing}
  else if ipmsComp.ClassType = TValveProportionally then
    {nothing}
  else if ipmsComp.ClassType = TVerticalBar then
    {nothing}
end;

procedure TfrmMimics.SetSpeed2(ipmsComp: TIPMSBaseComponent);
begin
  if ipmsComp.ClassType = TAnalogSensor then
    {nothing}
  else if ipmsComp.ClassType = TCircuitBreakerElement then
    {nothing}
  else if ipmsComp.ClassType = TControlElement then
    {nothing}
  else if ipmsComp.ClassType = THorizontalBar then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlDoubleSpeed then
    TMotorControlDoubleSpeed(ipmsComp).Status := MDtaRemoteExhaustHigh
  else if ipmsComp.ClassType = TMotorControlElement then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlStandby then
    {nothing}
  else if ipmsComp.ClassType = TRunningHour then
    {nothing}
  else if ipmsComp.ClassType = TSetpoint then
    {nothing}
  else if ipmsComp.ClassType = TSwitchElement then
    {nothing}
  else if ipmsComp.ClassType = TSwitchEvent then
    {nothing}
  else if ipmsComp.ClassType = TSwitchNBCD then
    {nothing}
  else if ipmsComp.ClassType = TSwitchTriangle then
    {nothing}
  else if ipmsComp.ClassType = TTankSensor then
    {nothing}
  else if ipmsComp.ClassType = TValveControl then
    {nothing}
  else if ipmsComp.ClassType = TValveProportionally then
    {nothing}
  else if ipmsComp.ClassType = TVerticalBar then
    {nothing}
end;

procedure TfrmMimics.SetSpeed2FailedToStop(ipmsComp: TIPMSBaseComponent);
begin
  if ipmsComp.ClassType = TAnalogSensor then
    {nothing}
  else if ipmsComp.ClassType = TCircuitBreakerElement then
    {nothing}
  else if ipmsComp.ClassType = TControlElement then
    {nothing}
  else if ipmsComp.ClassType = THorizontalBar then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlDoubleSpeed then
    {speed 2 failed to stop->running exhaust/high but failed to start supply/low}
    TMotorControlDoubleSpeed(ipmsComp).Status := MDtaRunExhaustHigh_FailSupplyLow2
  else if ipmsComp.ClassType = TMotorControlElement then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlStandby then
    {nothing}
  else if ipmsComp.ClassType = TRunningHour then
    {nothing}
  else if ipmsComp.ClassType = TSetpoint then
    {nothing}
  else if ipmsComp.ClassType = TSwitchElement then
    {nothing}
  else if ipmsComp.ClassType = TSwitchEvent then
    {nothing}
  else if ipmsComp.ClassType = TSwitchNBCD then
    {nothing}
  else if ipmsComp.ClassType = TSwitchTriangle then
    {nothing}
  else if ipmsComp.ClassType = TTankSensor then
    {nothing}
  else if ipmsComp.ClassType = TValveControl then
    {nothing}
  else if ipmsComp.ClassType = TValveProportionally then
    {nothing}
  else if ipmsComp.ClassType = TVerticalBar then
    {nothing}
end;

procedure TfrmMimics.SetSpeed2Failure(ipmsComp: TIPMSBaseComponent);
begin
  if ipmsComp.ClassType = TAnalogSensor then
    {nothing}
  else if ipmsComp.ClassType = TCircuitBreakerElement then
    {nothing}
  else if ipmsComp.ClassType = TControlElement then
    {nothing}
  else if ipmsComp.ClassType = THorizontalBar then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlDoubleSpeed then
    TMotorControlDoubleSpeed(ipmsComp).Status := MDtaStop_FailExhaustHigh
  else if ipmsComp.ClassType = TMotorControlElement then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlStandby then
    {nothing}
  else if ipmsComp.ClassType = TRunningHour then
    {nothing}
  else if ipmsComp.ClassType = TSetpoint then
    {nothing}
  else if ipmsComp.ClassType = TSwitchElement then
    {nothing}
  else if ipmsComp.ClassType = TSwitchEvent then
    {nothing}
  else if ipmsComp.ClassType = TSwitchNBCD then
    {nothing}
  else if ipmsComp.ClassType = TSwitchTriangle then
    {nothing}
  else if ipmsComp.ClassType = TTankSensor then
    {nothing}
  else if ipmsComp.ClassType = TValveControl then
    {nothing}
  else if ipmsComp.ClassType = TValveProportionally then
    {nothing}
  else if ipmsComp.ClassType = TVerticalBar then
    {nothing}
end;

procedure TfrmMimics.SetStandby(ipmsComp: TIPMSBaseComponent);
begin
  if ipmsComp.ClassType = TAnalogSensor then

  else if ipmsComp.ClassType = TCircuitBreakerElement then

  else if ipmsComp.ClassType = TControlElement then

  else if ipmsComp.ClassType = THorizontalBar then

  else if ipmsComp.ClassType = TMotorControlDoubleSpeed then

  else if ipmsComp.ClassType = TMotorControlElement then

  else if ipmsComp.ClassType = TMotorControlStandby then
    {standby->stopped, failed to standby}
    TMotorControlStandby(ipmsComp).StatusPump := MStaStoppedFailStandby
  else if ipmsComp.ClassType = TRunningHour then

  else if ipmsComp.ClassType = TSetpoint then

  else if ipmsComp.ClassType = TSwitchElement then

  else if ipmsComp.ClassType = TSwitchEvent then

  else if ipmsComp.ClassType = TSwitchNBCD then

  else if ipmsComp.ClassType = TSwitchTriangle then

  else if ipmsComp.ClassType = TTankSensor then

  else if ipmsComp.ClassType = TValveControl then

  else if ipmsComp.ClassType = TValveProportionally then

  else if ipmsComp.ClassType = TVerticalBar then

end;

procedure TfrmMimics.SetStandbyFailedToStop(ipmsComp: TIPMSBaseComponent);
begin
  if ipmsComp.ClassType = TAnalogSensor then

  else if ipmsComp.ClassType = TCircuitBreakerElement then

  else if ipmsComp.ClassType = TControlElement then

  else if ipmsComp.ClassType = THorizontalBar then

  else if ipmsComp.ClassType = TMotorControlDoubleSpeed then

  else if ipmsComp.ClassType = TMotorControlElement then

  else if ipmsComp.ClassType = TMotorControlStandby then
    {standby failed to stop->stopped, failed to stanby}
    TMotorControlStandby(ipmsComp).StatusPump := MStaStoppedFailStandby
  else if ipmsComp.ClassType = TRunningHour then

  else if ipmsComp.ClassType = TSetpoint then

  else if ipmsComp.ClassType = TSwitchElement then

  else if ipmsComp.ClassType = TSwitchEvent then

  else if ipmsComp.ClassType = TSwitchNBCD then

  else if ipmsComp.ClassType = TSwitchTriangle then

  else if ipmsComp.ClassType = TTankSensor then

  else if ipmsComp.ClassType = TValveControl then

  else if ipmsComp.ClassType = TValveProportionally then

  else if ipmsComp.ClassType = TVerticalBar then

end;

procedure TfrmMimics.SetStandbyFailure(ipmsComp: TIPMSBaseComponent);
begin
  if ipmsComp.ClassType = TAnalogSensor then

  else if ipmsComp.ClassType = TCircuitBreakerElement then

  else if ipmsComp.ClassType = TControlElement then

  else if ipmsComp.ClassType = THorizontalBar then

  else if ipmsComp.ClassType = TMotorControlDoubleSpeed then

  else if ipmsComp.ClassType = TMotorControlElement then

  else if ipmsComp.ClassType = TMotorControlStandby then
    {StandbyFailure >> pake yang MStaStoppedFailStandby}
    TMotorControlStandby(ipmsComp).StatusPump := MStaStoppedFailStandby
  else if ipmsComp.ClassType = TRunningHour then

  else if ipmsComp.ClassType = TSetpoint then

  else if ipmsComp.ClassType = TSwitchElement then

  else if ipmsComp.ClassType = TSwitchEvent then

  else if ipmsComp.ClassType = TSwitchNBCD then

  else if ipmsComp.ClassType = TSwitchTriangle then

  else if ipmsComp.ClassType = TTankSensor then

  else if ipmsComp.ClassType = TValveControl then

  else if ipmsComp.ClassType = TValveProportionally then

  else if ipmsComp.ClassType = TVerticalBar then

end;

procedure TfrmMimics.SetStartFailure(ipmsComp: TIPMSBaseComponent);
begin
  if ipmsComp.ClassType = TAnalogSensor then

  else if ipmsComp.ClassType = TCircuitBreakerElement then

  else if ipmsComp.ClassType = TControlElement then

  else if ipmsComp.ClassType = THorizontalBar then

  else if ipmsComp.ClassType = TMotorControlDoubleSpeed then

  else if ipmsComp.ClassType = TMotorControlElement then

  else if ipmsComp.ClassType = TMotorControlStandby then
    {start failure->stop not in standby}
    TMotorControlStandby(ipmsComp).StatusPump := MStaStoppedNotStandby
  else if ipmsComp.ClassType = TRunningHour then

  else if ipmsComp.ClassType = TSetpoint then

  else if ipmsComp.ClassType = TSwitchElement then

  else if ipmsComp.ClassType = TSwitchEvent then

  else if ipmsComp.ClassType = TSwitchNBCD then

  else if ipmsComp.ClassType = TSwitchTriangle then

  else if ipmsComp.ClassType = TTankSensor then

  else if ipmsComp.ClassType = TValveControl then

  else if ipmsComp.ClassType = TValveProportionally then

  else if ipmsComp.ClassType = TVerticalBar then

end;

procedure TfrmMimics.SetState(ipmsComp: TIPMSBaseComponent);
begin
  if ipmsComp.ClassType = TAnalogSensor then

  else if ipmsComp.ClassType = TCircuitBreakerElement then

  else if ipmsComp.ClassType = TControlElement then

  else if ipmsComp.ClassType = THorizontalBar then

  else if ipmsComp.ClassType = TMotorControlDoubleSpeed then

  else if ipmsComp.ClassType = TMotorControlElement then

  else if ipmsComp.ClassType = TMotorControlStandby then

  else if ipmsComp.ClassType = TRunningHour then

  else if ipmsComp.ClassType = TSetpoint then

  else if ipmsComp.ClassType = TSwitchElement then
    TSwitchElement(ipmsComp).Status := SWtaDisabled
  else if ipmsComp.ClassType = TSwitchEvent then

  else if ipmsComp.ClassType = TSwitchNBCD then

  else if ipmsComp.ClassType = TSwitchTriangle then

  else if ipmsComp.ClassType = TTankSensor then

  else if ipmsComp.ClassType = TValveControl then

  else if ipmsComp.ClassType = TValveProportionally then

  else if ipmsComp.ClassType = TVerticalBar then

end;

procedure TfrmMimics.SetState0(ipmsComp: TIPMSBaseComponent);
begin
  if ipmsComp.ClassType = TAnalogSensor then

  else if ipmsComp.ClassType = TCircuitBreakerElement then
    {Prince}
    TCircuitBreakerElement(ipmsComp).Status := CBtaOpen
  else if ipmsComp.ClassType = TControlElement then

  else if ipmsComp.ClassType = THorizontalBar then

  else if ipmsComp.ClassType = TMotorControlDoubleSpeed then

  else if ipmsComp.ClassType = TMotorControlElement then

  else if ipmsComp.ClassType = TMotorControlStandby then

  else if ipmsComp.ClassType = TRunningHour then

  else if ipmsComp.ClassType = TSetpoint then

  else if ipmsComp.ClassType = TSwitchElement then
    {state 0-> true, normally, indicate alarm, inhibited}
    TSwitchElement(ipmsComp).Status := SWtaIndicateAlarm
  else if ipmsComp.ClassType = TSwitchEvent then

  else if ipmsComp.ClassType = TSwitchNBCD then
    {state 0-> open but alarm inhibited}
    TSwitchNBCD(ipmsComp).Status := SNtaOpen
  else if ipmsComp.ClassType = TSwitchTriangle then
    TSwitchTriangle(ipmsComp).Status := SWtaIndicateAlarm
  else if ipmsComp.ClassType = TTankSensor then

  else if ipmsComp.ClassType = TValveControl then

  else if ipmsComp.ClassType = TValveProportionally then

  else if ipmsComp.ClassType = TVerticalBar then

end;

procedure TfrmMimics.SetState1(ipmsComp: TIPMSBaseComponent);
begin
  if ipmsComp.ClassType = TAnalogSensor then

  else if ipmsComp.ClassType = TCircuitBreakerElement then
    {Prince}
    TCircuitBreakerElement(ipmsComp).Status := CBtaClosed
  else if ipmsComp.ClassType = TControlElement then

  else if ipmsComp.ClassType = THorizontalBar then

  else if ipmsComp.ClassType = TMotorControlDoubleSpeed then

  else if ipmsComp.ClassType = TMotorControlElement then
    TMotorControlElement(ipmsComp).Status := MCtaRunning
  else if ipmsComp.ClassType = TMotorControlStandby then

  else if ipmsComp.ClassType = TRunningHour then

  else if ipmsComp.ClassType = TSetpoint then

  else if ipmsComp.ClassType = TSwitchElement then
  begin
    if TSwitchElement(ipmsComp).ElementID = '2436A0007G' then
    begin
      if TSwitchElement(ipmsComp).Tag = 1 then
        TSwitchElement(ipmsComp).Status := SWtaOk
      else
        TSwitchElement(ipmsComp).Status := SWtaFalse;
    end
    else
    if TSwitchElement(ipmsComp).ElementID = '2436A0008G' then
    begin
      if TSwitchElement(ipmsComp).Tag = 1 then
        TSwitchElement(ipmsComp).Status := SWtaOk
      else
        TSwitchElement(ipmsComp).Status := SWtaFalse;
    end
    else
      TSwitchElement(ipmsComp).Status := SWtaOk;
  end
    {state 1-> true, status OK}
  else if ipmsComp.ClassType = TSwitchEvent then

  else if ipmsComp.ClassType = TSwitchNBCD then
    {state 1-> closed or not actived}
    TSwitchNBCD(ipmsComp).Status := SNtaClosed
  else if ipmsComp.ClassType = TSwitchTriangle then
    TSwitchTriangle(ipmsComp).Status := SWtaOk
  else if ipmsComp.ClassType = TTankSensor then

  else if ipmsComp.ClassType = TValveControl then

  else if ipmsComp.ClassType = TValveProportionally then

  else if ipmsComp.ClassType = TVerticalBar then
  else if ipmsComp.ClassType = TComputer then
    TComputer(ipmsComp).Status := SWtaOk;
end;

procedure TfrmMimics.SetStopFailure(ipmsComp: TIPMSBaseComponent);
begin
  if ipmsComp.ClassType = TAnalogSensor then
    {nothing}
  else if ipmsComp.ClassType = TCircuitBreakerElement then
    {nothing}
  else if ipmsComp.ClassType = TControlElement then
    {nothing}
  else if ipmsComp.ClassType = THorizontalBar then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlDoubleSpeed then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlElement then
    TMotorControlElement(ipmsComp).Status := MCtaRunningFailStop_Faulted_Undetermined
  else if ipmsComp.ClassType = TMotorControlStandby then
    TMotorControlStandby(ipmsComp).StatusPump := MStaStoppedNotStandby
  else if ipmsComp.ClassType = TRunningHour then
    {nothing}
  else if ipmsComp.ClassType = TSetpoint then
    {nothing}
  else if ipmsComp.ClassType = TSwitchElement then
    {nothing}
  else if ipmsComp.ClassType = TSwitchEvent then
    {nothing}
  else if ipmsComp.ClassType = TSwitchNBCD then
    {nothing}
  else if ipmsComp.ClassType = TSwitchTriangle then
    {nothing}
  else if ipmsComp.ClassType = TTankSensor then
    {nothing}
  else if ipmsComp.ClassType = TValveControl then
    {nothing}
  else if ipmsComp.ClassType = TValveProportionally then
    {nothing}
  else if ipmsComp.ClassType = TVerticalBar then
    {nothing}
end;

procedure TfrmMimics.SetStopped(ipmsComp: TIPMSBaseComponent);
begin
  if ipmsComp.ClassType = TAnalogSensor then
    {nothing}
  else if ipmsComp.ClassType = TCircuitBreakerElement then
    {nothing}
  else if ipmsComp.ClassType = TControlElement then
    {nothing}
  else if ipmsComp.ClassType = THorizontalBar then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlDoubleSpeed then
    TMotorControlDoubleSpeed(ipmsComp).Status := MDtaStopped
  else if ipmsComp.ClassType = TMotorControlElement then
    TMotorControlElement(ipmsComp).Status := MCtaStopped
  else if ipmsComp.ClassType = TMotorControlStandby then
    TMotorControlStandby(ipmsComp).StatusPump := MStaStoppedNotStandby
  else if ipmsComp.ClassType = TRunningHour then
    TRunningHour(ipmsComp).Status := RHtaNotCounting
  else if ipmsComp.ClassType = TSetpoint then
    {nothing}
  else if ipmsComp.ClassType = TSwitchElement then
    {nothing}
  else if ipmsComp.ClassType = TSwitchEvent then
    {nothing}
  else if ipmsComp.ClassType = TSwitchNBCD then
    {nothing}
  else if ipmsComp.ClassType = TSwitchTriangle then
    {nothing}
  else if ipmsComp.ClassType = TTankSensor then
    {nothing}
  else if ipmsComp.ClassType = TValveControl then
    {nothing}
  else if ipmsComp.ClassType = TValveProportionally then
    {nothing}
  else if ipmsComp.ClassType = TVerticalBar then
    {nothing}
end;

procedure TfrmMimics.SetTitle(aTitle: string);
begin
  pnlTitle.Caption := aTitle;
end;

procedure TfrmMimics.SetTransition(ipmsComp: TIPMSBaseComponent);
begin
  if ipmsComp.ClassType = TAnalogSensor then
    {invalid->disabled,unavalaible}
    TAnalogSensor(ipmsComp).Status := AStaDisableUnavailable
  else if ipmsComp.ClassType = TCircuitBreakerElement then
    {transition->undetermined}
    TCircuitBreakerElement(ipmsComp).Status := CBtaUndertermined
  else if ipmsComp.ClassType = TControlElement then
    {in transition->alarm}
    TControlElement(ipmsComp).Status := CTtaAlarm
  else if ipmsComp.ClassType = THorizontalBar then
    {invalid->disabled,unavalaible}
    THorizontalBar(ipmsComp).Status := AStaDisableUnavailable
  else if ipmsComp.ClassType = TMotorControlDoubleSpeed then
    {transition->undetermined} {invalid->undetermined}
    TMotorControlDoubleSpeed(ipmsComp).Status := MDtaUndeterminedFaulted
  else if ipmsComp.ClassType = TMotorControlElement then
    {transition->undetermined} {invalid->undetermined}
    TMotorControlElement(ipmsComp).Status := MCtaRunningFailStop_Faulted_Undetermined
  else if ipmsComp.ClassType = TMotorControlStandby then
    {transition->running,failed to standby}
    TMotorControlStandby(ipmsComp).StatusPump := MStaRunningFailStandby
  else if ipmsComp.ClassType = TRunningHour then
    {nothing}
  else if ipmsComp.ClassType = TSetpoint then
    {nothing}
  else if ipmsComp.ClassType = TSwitchElement then
    {nothing}
  else if ipmsComp.ClassType = TSwitchEvent then
    {nothing}
  else if ipmsComp.ClassType = TSwitchNBCD then
    {nothing}
  else if ipmsComp.ClassType = TSwitchTriangle then
    {nothing}
  else if ipmsComp.ClassType = TTankSensor then
    {nothing}
  else if ipmsComp.ClassType = TValveControl then
    {transition->failed to closed or undetermined}
    TValveControl(ipmsComp).Status := VCtaCloseFailed
  else if ipmsComp.ClassType = TValveProportionally then
    {transition->not closed}
    TValveProportionally(ipmsComp).Status := VPtaNotClosed
  else if ipmsComp.ClassType = TVerticalBar then
    {invalid->disabled,unavalaible}
    TVerticalBar(ipmsComp).Status := AStaDisableUnavailable
end;

procedure TfrmMimics.SetTripped(ipmsComp: TIPMSBaseComponent);
begin
  if ipmsComp.ClassType = TAnalogSensor then
    {nothing}
  else if ipmsComp.ClassType = TCircuitBreakerElement then
    TCircuitBreakerElement(ipmsComp).Status := CBtaFailedCloseTripped
  else if ipmsComp.ClassType = TControlElement then
    {nothing}
  else if ipmsComp.ClassType = THorizontalBar then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlDoubleSpeed then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlElement then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlStandby then
    {nothing}
  else if ipmsComp.ClassType = TRunningHour then
    {nothing}
  else if ipmsComp.ClassType = TSetpoint then
    {nothing}
  else if ipmsComp.ClassType = TSwitchElement then
    {nothing}
  else if ipmsComp.ClassType = TSwitchEvent then
    {nothing}
  else if ipmsComp.ClassType = TSwitchNBCD then
    {nothing}
  else if ipmsComp.ClassType = TSwitchTriangle then
    {nothing}
  else if ipmsComp.ClassType = TTankSensor then
    {nothing}
  else if ipmsComp.ClassType = TValveControl then
    TValveControl(ipmsComp).Status := VCtaCloseFailed
  else if ipmsComp.ClassType = TValveProportionally then
    {nothing}
  else if ipmsComp.ClassType = TVerticalBar then
    {nothing}
end;

procedure TfrmMimics.SetUnavailable(ipmsComp: TIPMSBaseComponent);
begin
  if ipmsComp.ClassType = TSwitchTriangle then
    TSwitchTriangle(ipmsComp).Status := SWtaFalse
  else if ipmsComp.ClassType = TSwitchElement then
  begin
    if TSwitchElement(ipmsComp).ElementID = '2436A0007G' then
    begin
      if TSwitchElement(ipmsComp).Tag = 0 then
        TSwitchElement(ipmsComp).Status := SWtaOk
      else
        TSwitchElement(ipmsComp).Status := SWtaFalse;
    end
    else
    if TSwitchElement(ipmsComp).ElementID = '2436A0008G' then
    begin
      if TSwitchElement(ipmsComp).Tag = 0 then
        TSwitchElement(ipmsComp).Status := SWtaOk
      else
        TSwitchElement(ipmsComp).Status := SWtaFalse;
    end
    else
      TSwitchElement(ipmsComp).Status := SWtaFalse;
  end
  else if ipmsComp.ClassType = TMotorControlElement then
    TMotorControlElement(ipmsComp).Status := MCtaStopped
end;

procedure TfrmMimics.SetUnknown(ipmsComp: TIPMSBaseComponent);
begin
  if ipmsComp.ClassType = TAnalogSensor then
    {nothing}
  else if ipmsComp.ClassType = TCircuitBreakerElement then
    {unknown->undetermined}
    TCircuitBreakerElement(ipmsComp).Status := CBtaUndertermined
  else if ipmsComp.ClassType = TControlElement then
    {nothing}
  else if ipmsComp.ClassType = THorizontalBar then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlDoubleSpeed then
    {unknown->undetermined}
    TMotorControlDoubleSpeed(ipmsComp).Status := MDtaUndeterminedFaulted
  else if ipmsComp.ClassType = TMotorControlElement then
    {unknown->undetermined}
    TMotorControlElement(ipmsComp).Status := MCtaRunningFailStop_Faulted_Undetermined
  else if ipmsComp.ClassType = TMotorControlStandby then
    {unknown->running, failed to stanby}
    TMotorControlStandby(ipmsComp).StatusPump := MStaRunningFailStandby
  else if ipmsComp.ClassType = TRunningHour then
    {nothing}
  else if ipmsComp.ClassType = TSetpoint then
    {nothing}
  else if ipmsComp.ClassType = TSwitchElement then
    {nothing}
  else if ipmsComp.ClassType = TSwitchEvent then
    {nothing}
  else if ipmsComp.ClassType = TSwitchNBCD then
    {nothing}
  else if ipmsComp.ClassType = TSwitchTriangle then
    {nothing}
  else if ipmsComp.ClassType = TTankSensor then
    {nothing}
  else if ipmsComp.ClassType = TValveControl then
    {unknown->undetermined}
    TValveControl(ipmsComp).Status := VCtaCloseFailed
  else if ipmsComp.ClassType = TValveProportionally then
    {nothing}
  else if ipmsComp.ClassType = TVerticalBar then
    {nothing}
end;

procedure TfrmMimics.SetValueElement(ipmsComp: TIPMSBaseComponent;
  aValue: Double);
  var
    stringValue : string;
begin
  if ipmsComp.ClassType = TAnalogSensor then
    TAnalogSensor(ipmsComp).SensorValue := aValue
  else if ipmsComp.ClassType = TCircuitBreakerElement then

  else if ipmsComp.ClassType = TControlElement then
  begin
    stringValue := FormatFloat('0.00', aValue);
    TControlElement(ipmsComp).Caption := stringValue;
  end
  else if ipmsComp.ClassType = THorizontalBar then

  else if ipmsComp.ClassType = TMotorControlDoubleSpeed then

  else if ipmsComp.ClassType = TMotorControlElement then

  else if ipmsComp.ClassType = TMotorControlStandby then

  else if ipmsComp.ClassType = TRunningHour then
    TRunningHour(ipmsComp).SensorValue := aValue
  else if ipmsComp.ClassType = TSetpoint then
    TSetpoint(ipmsComp).SensorValue := aValue
  else
  if ipmsComp.ClassType = TSwitchElement then
  begin
    stringValue := FormatFloat('0.00', aValue);
    TSwitchElement(ipmsComp).Caption := stringValue;
  end
  else
  if ipmsComp.ClassType = TSwitchEvent then
    TSwitchEvent(ipmsComp).SensorValue := aValue
  else if ipmsComp.ClassType = TSwitchNBCD then

  else if ipmsComp.ClassType = TSwitchTriangle then

  else if ipmsComp.ClassType = TTankSensor then
    TTankSensor(ipmsComp).TankValue := aValue
  else if ipmsComp.ClassType = TValveControl then

  else if ipmsComp.ClassType = TValveProportionally then
    TValveProportionally(ipmsComp).SensorValue := aValue
  else if ipmsComp.ClassType = TVerticalBar then
    TVerticalBar(ipmsComp).Temperature := Round(aValue);
end;

procedure TfrmMimics.SetWarning(ipmsComp: TIPMSBaseComponent);
begin
  if ipmsComp.ClassType = TAnalogSensor then

  else if ipmsComp.ClassType = TCircuitBreakerElement then

  else if ipmsComp.ClassType = TControlElement then

  else if ipmsComp.ClassType = THorizontalBar then

  else if ipmsComp.ClassType = TMotorControlDoubleSpeed then

  else if ipmsComp.ClassType = TMotorControlElement then

  else if ipmsComp.ClassType = TMotorControlStandby then

  else if ipmsComp.ClassType = TRunningHour then

  else if ipmsComp.ClassType = TSetpoint then

  else if ipmsComp.ClassType = TSwitchElement then

  else if ipmsComp.ClassType = TSwitchEvent then

  else if ipmsComp.ClassType = TSwitchNBCD then
    TSwitchNBCD(ipmsComp).Status := SNtaAttention
  else if ipmsComp.ClassType = TSwitchTriangle then

  else if ipmsComp.ClassType = TTankSensor then

  else if ipmsComp.ClassType = TValveControl then

  else if ipmsComp.ClassType = TValveProportionally then

  else if ipmsComp.ClassType = TVerticalBar then

end;

procedure TfrmMimics.SetWireBreak(ipmsComp: TIPMSBaseComponent);
begin
  if ipmsComp.ClassType = TAnalogSensor then
    TAnalogSensor(ipmsComp).Status := AStaWireBreak
  else if ipmsComp.ClassType = TCircuitBreakerElement then
    {nothing}
  else if ipmsComp.ClassType = TControlElement then
    {nothing}
  else if ipmsComp.ClassType = THorizontalBar then
    THorizontalBar(ipmsComp).Status := AStaWireBreak
  else if ipmsComp.ClassType = TMotorControlDoubleSpeed then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlElement then
    {nothing}
  else if ipmsComp.ClassType = TMotorControlStandby then
    {nothing}
  else if ipmsComp.ClassType = TRunningHour then
    {nothing}
  else if ipmsComp.ClassType = TSetpoint then
    {nothing}
  else if ipmsComp.ClassType = TSwitchElement then
    {nothing}
  else if ipmsComp.ClassType = TSwitchEvent then
    {nothing}
  else if ipmsComp.ClassType = TSwitchNBCD then
    {nothing}
  else if ipmsComp.ClassType = TSwitchTriangle then
    {nothing}
  else if ipmsComp.ClassType = TTankSensor then
    {nothing}
  else if ipmsComp.ClassType = TValveControl then
    {nothing}
  else if ipmsComp.ClassType = TValveProportionally then
    {nothing}
  else if ipmsComp.ClassType = TVerticalBar then
    TVerticalBar(ipmsComp).Status := AStaWireBreak

end;

procedure TfrmMimics.SetXHA(ipmsComp: TIPMSBaseComponent);
begin
  if ipmsComp.ClassType = TAnalogSensor then
    {XHA->OORH, too high}
    TAnalogSensor(ipmsComp).Status := AStaTooHigh
  else if ipmsComp.ClassType = TCircuitBreakerElement then

  else if ipmsComp.ClassType = TControlElement then

  else if ipmsComp.ClassType = THorizontalBar then
    THorizontalBar(ipmsComp).Status := AStaTooHigh
  else if ipmsComp.ClassType = TMotorControlDoubleSpeed then

  else if ipmsComp.ClassType = TMotorControlElement then

  else if ipmsComp.ClassType = TMotorControlStandby then

  else if ipmsComp.ClassType = TRunningHour then

  else if ipmsComp.ClassType = TSetpoint then

  else if ipmsComp.ClassType = TSwitchElement then

  else if ipmsComp.ClassType = TSwitchEvent then

  else if ipmsComp.ClassType = TSwitchNBCD then

  else if ipmsComp.ClassType = TSwitchTriangle then

  else if ipmsComp.ClassType = TTankSensor then

  else if ipmsComp.ClassType = TValveControl then

  else if ipmsComp.ClassType = TValveProportionally then

  else if ipmsComp.ClassType = TVerticalBar then
    TVerticalBar(ipmsComp).Status := AStaTooHigh

end;

procedure TfrmMimics.UpdateElementData(aElementID: string;
  aComponent: TIPMSBaseComponent; aState: integer; aValue: Byte);
begin
  { update state element here }
  case aState of
    C_ORD_STATEALARM_CHANGE :
      case E_StateAlarm(aValue) of
        saNone,
        saHA,
        saLA,
        saWireBreak,
        saInhibited,
        saUnknown,
        saFault,
        saTripped,
        saOpenFailure,
        saCLoseFailure,
        saStopFailure,
        saStartFailure,
        saSpeed1,
        saSpeed1Failure,
        saSpeed2,
        saSpeed2Failure,
        saFailedToStop,
        saFailureToStop,
        saSpeed1FailedToStop,
        saSpeed2FailedToStop,
        saNotStandby,
        saRunningFailedToStop,
        saStandbyFailedToStop,
        saStandbyFailure,
        saHHA,
        saOORL,
        saOORH,
        saXHA,
        saAlarm,
        saControlFailure,
        saNoneDisable {special for state element disable}      :
        begin
          setEnbAlmInhibited(aComponent, aElementID, aValue);
        end;
      end;

    C_ORD_STATEELEMENT_CHANGE :
      case E_StateElement(aValue) of
        seValueOK, seEnabled :
        begin
          SetEnableValueOK(aComponent);  {AAE,SAE,SSE,SSL,SS1,SS2}
          SetElementStatus(aValue);
        end;
        //Prince
        seFalse :
        begin
          SetFalse(aComponent);
        end;
        seDisabled, seNone {RHE, VCH} :
        begin
          if (MimicID = mtNavCom) or (MimicID = mtFireDet1) or
             (MimicID = mtFireDet2) or (MimicID = mtMachineVent) then
          begin
            SetStatusControlInstruktur(Byte(mimicID), Byte(seDisabled), aElementID);
          end;

          SetDisableUnavalable(aComponent); {All}
          SetElementStatus(aValue);
        end;
        {khusus swe}
        seUnavailable:
        begin
          if (MimicID = mtNavCom) or (MimicID = mtFireDet1) or
             (MimicID = mtFireDet2) then
          begin
            SetStatusControlInstruktur(Byte(mimicID), Byte(seUnavailable), aElementID);
          end;

          SetUnavailable(aComponent);
        end;
        seHA :
        begin
          SetHighAlarm(aComponent);  {AAE,SAE,SSE,SSL,SS1,SS2}
          SetElementStatus(aValue);
        end;
        seLA :
        begin
          SetLowAlarm(aComponent);    {AAE,SAE,SSE,SSL}
          SetElementStatus(aValue);
        end;
        seWireBreak :
        begin
          SetWireBreak(aComponent);  {AAE,SAE,SS2}
          SetElementStatus(aValue);
        end;
        seClosed :
        begin
          SetClosed(aComponent);      {CBA,CBE,VCE,VCH,VCP}
          SetElementStatus(aValue);
        end;
        seOpen :
        begin
          SetOpen(aComponent);        {CBA,CBE,VCE,VCH,VCP}
          SetElementStatus(aValue);
        end;
        seTransition, seInTransition, seInvalid :
        begin
          if (MimicID = mtMachineVent) then
          begin
            SetStatusControlInstruktur(Byte(mimicID), Byte(seInvalid), aElementID);
          end;

          SetTransition(aComponent);  {CBA,CBE,CTR,MCE,MCD,MCS,SAE,VCE,VCH,VCP}
          SetElementStatus(aValue);
        end;
        seNotRFO :
        begin
          SetNotRFO(aComponent);      {CBA,CBE}
          SetElementStatus(aValue);
        end;
        seNotRFC :
        begin
          SetNotRFC(aComponent);      {CBA,CBE}
          SetElementStatus(aValue);
        end;
        seNotRFU :
        begin
          if (MimicID = mtMachineVent) then
          begin
            SetStatusControlInstruktur(Byte(mimicID), Byte(seNotRFU), aElementID);
          end;

          SetNotRFU(aComponent);      {CTR,MCD,MCE,MCS,VCE,VCH}
          SetElementStatus(aValue);
        end;
        seTripped, seFailedToClose, seUndetermined, seCloseFailure :
        begin
          SetTripped(aComponent);     {CBA,CBE,VCE,VCH}
          SetElementStatus(aValue);
        end;
        seOpenFailure, seFailedToOpen :
        begin
          SetOpenFailure(aComponent); {CBA,CBE,VCE}
          SetElementStatus(aValue);
        end;
        seFault :
        begin
          SetFault(aComponent);       {CBA,CBE,CTR,MCE,MCD,MCS}
          SetElementStatus(aValue);
        end;
        seUnknown :
        begin
          SetUnknown(aComponent);    {CBA,CBE,MCE,MCD,MCS,VCE,VCH}
          SetElementStatus(aValue);
        end;
        seNormal :
        begin
          SetNormal(aComponent);     {CTR,SEE}
          SetElementStatus(aValue);
        end;
        seActive :
        begin
           SetActive(aComponent);
           SetElementStatus(aValue);
        end;
        seStopped :
        begin
          if (MimicID = mtMachineVent) then
          begin
            SetStatusControlInstruktur(Byte(mimicID), Byte(seStopped), aElementID);
          end;

          SetStopped(aComponent);     {MCE,MCD,MCS,RHE}
          SetElementStatus(aValue);
        end;
        seRunning :
        begin
          if (MimicID = mtMachineVent) then
          begin
            SetStatusControlInstruktur(Byte(mimicID), Byte(seRunning), aElementID);
          end;

          SetRunning(aComponent);    {MCE,MCS}
          SetElementStatus(aValue);
        end;
        seStopFailure :
        begin
          SetStopFailure(aComponent); {MCE,MCS}
          SetElementStatus(aValue);
        end;
        seRunFailure :
        begin
          if (MimicID = mtMachineVent) then
          begin
            SetStatusControlInstruktur(Byte(mimicID), Byte(seRunFailure), aElementID);
          end;

          SetRunFailure(aComponent); {MCE}
          SetElementStatus(aValue);
        end;
        seSpeed1 :
        begin
          if (MimicID = mtMachineVent) then
          begin
            SetStatusControlInstruktur(Byte(mimicID), Byte(seSpeed1), aElementID);
          end;

          SetSpeed1(aComponent);     {MCD}
          SetElementStatus(aValue);
        end;
        seSpeed2 :
        begin
          if (MimicID = mtMachineVent) then
          begin
            SetStatusControlInstruktur(Byte(mimicID), Byte(seSpeed2), aElementID);
          end;

          SetSpeed2(aComponent);      {MCD}
          SetElementStatus(aValue);
        end;
        seSpeed1Failure :
        begin
          if (MimicID = mtMachineVent) then
          begin
            SetStatusControlInstruktur(Byte(mimicID), Byte(seSpeed1Failure), aElementID);
          end;

          SetSpeed1Failure(aComponent); {MCD}
          SetElementStatus(aValue);
        end;
        seSpeed2Failure :
        begin
          if (MimicID = mtMachineVent) then
          begin
            SetStatusControlInstruktur(Byte(mimicID), Byte(seSpeed2Failure), aElementID);
          end;

          SetSpeed2Failure(aComponent); {MCD}
          SetElementStatus(aValue);
        end;
        seSpeed1FailedToStop :
        begin
          if (MimicID = mtMachineVent) then
          begin
            SetStatusControlInstruktur(Byte(mimicID), Byte(seSpeed1FailedToStop), aElementID);
          end;

          SetSpeed1FailedToStop(aComponent); {MCD}
          SetElementStatus(aValue);
        end;
        seSpeed2FailedToStop :
        begin
          if (MimicID = mtMachineVent) then
          begin
            SetStatusControlInstruktur(Byte(mimicID), Byte(seSpeed2FailedToStop), aElementID);
          end;

          SetSpeed2FailedToStop(aComponent); {MCD}
          SetElementStatus(aValue);
        end;
        seFailedToStop :
        begin
          SetFailedToStop(aComponent);{belum ketemu elementnya}
          SetElementStatus(aValue);
        end;
        seFailureToStop :
        begin
          SetFailureToStop(aComponent);{belum ketemu elementnya}
          SetElementStatus(aValue);
        end;
        seStandby :
        begin
          SetStandby(aComponent);     {MCS}
          SetElementStatus(aValue);
        end;
        seStandbyFailure :
        begin
          SetStandbyFailure(aComponent); {MCS}
          SetElementStatus(aValue);
        end;
        seStartFailure :
        begin
          SetStartFailure(aComponent); {MCS}
          SetElementStatus(aValue);
        end;
        seStandbyFailedToStop :
        begin
          SetStandbyFailedToStop(aComponent);{MCS}
          SetElementStatus(aValue);
        end;
        seCounting :
        begin
          SetCounting(aComponent);    {RHE}
          SetElementStatus(aValue);
        end;
        seState :
        begin
          SetState(aComponent);       {DAE}
          SetElementStatus(aValue);
        end;
        seHHA :
        begin
          SetHHA(aComponent);         {SAE,SS1,SS2}
          SetElementStatus(aValue);
        end;
        seOORL :
        begin
          SetOORL(aComponent);        {SS1,SSE,SSL,VCP}
          SetElementStatus(aValue);
        end;
        seOORH :
        begin
          SetOORH(aComponent);        {SS1,SSE,SSL,VCP}
          SetElementStatus(aValue);
        end;
        seXHA :
        begin
          SetXHA(aComponent);         {SS1,SS2}
          SetElementStatus(aValue);
        end;
        seState0 :
        begin
          SetState0(aComponent);      {SWB,SWE,SWN}
          SetElementStatus(aValue);
        end;
        seState1 :
        begin
          if (MimicID = mtNavCom) then
          begin
            SetStatusControlInstruktur(Byte(mimicID), Byte(seState1), aElementID);
          end;

          SetState1(aComponent);      {SWB,SWE,SWN}
          SetElementStatus(aValue);
        end;
        seAlarm :
        begin
          if (MimicID = mtNavCom) or (MimicID = mtFireDet1) or
             (MimicID = mtFireDet2) then
          begin
            SetStatusControlInstruktur(Byte(mimicID), Byte(seAlarm), aElementID);
          end;

          SetAlarm(aComponent);       {SWE,SWN}
          SetElementStatus(aValue);
        end;
        seWarning :
        begin
          SetWarning(aComponent);     {SWN}
          SetElementStatus(aValue);
        end;
        seControlFailure :
        begin
          SetControlFailure(aComponent);  {VCP}
          SetElementStatus(aValue);
        end;
      end;
    C_ORD_CONTROLMODE_CHANGE :
      case E_ControlMode(aValue) of
        cmNone, cmLocal, cmManual, cmAuto, cmRemote : SetControlMode(aValue);
      end;
    C_ORD_STATEDISABLEENABLE_CHANGE :
      case E_StateDisabled(aValue) of
        sdDisabled : SetDisableUnavalable(aComponent);
        sdEnabled : SetEnableValueOK(aComponent) ;
      end;
    C_ORD_ELEMENTCAPTION_CHANGE :
      case  E_State(aValue) of
        sState1, sState2, sState3, sState4, sState5, sState6, sState7,
        sState8, sState9, sState10, sState11, sState12, sState13, sState14,
        sState15 : SetElementCaption(aComponent, E_State(aValue));
      end;
  end;
end;

end.
