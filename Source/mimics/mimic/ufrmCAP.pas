unit ufrmCAP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMimics, StdCtrls, ExtCtrls, uDatabase, {uChart,} VCLTee.TeEngine, VCLTee.Series,
  VCLTee.TeeProcs, VCLTee.Chart, uDBSupportClasses, VclTee.TeeGDIPlus;

type
  TfrmCAP = class(TfrmMimics)
    pnlMain: TPanel;
    pnlCAPTitle: TPanel;
    pnlElementInfo1: TPanel;
    pnlElementInfo2: TPanel;
    pnlHardwareData: TPanel;
    pnlIOInfo: TPanel;
    pnlParameter: TPanel;
    pnlTank: TPanel;
    lblElementID: TLabel;
    lblElementType: TLabel;
    lblDescription: TLabel;
    lblSystem: TLabel;
    lblPLCID: TLabel;
    lblMimicNr: TLabel;
    lblInstallGroup: TLabel;
    lblHardwareDataHeader: TLabel;
    lblHwIO: TLabel;
    lblHwFunction: TLabel;
    lblHwLoc: TLabel;
    lblHwBrd: TLabel;
    lblHwCh: TLabel;
    lblHwRefid: TLabel;
    lblHwRemark: TLabel;
    lblHwState: TLabel;
    lblDescriptionVal: TLabel;
    lblElementIDVal: TLabel;
    lblElementTypeVal: TLabel;
    lblSystemVal: TLabel;
    lblPLCIDVal: TLabel;
    lblMimicNrVal: TLabel;
    lblInstallGroupVal: TLabel;
    lblHwBrd1: TLabel;
    lblHwCh1: TLabel;
    lblHwFunction1: TLabel;
    lblHwIO1: TLabel;
    lblHwLoc1: TLabel;
    lblHwRefid1: TLabel;
    lblHwRemark1: TLabel;
    lblHwState1: TLabel;
    lblHwBrd2: TLabel;
    lblHwCh2: TLabel;
    lblHwFunction2: TLabel;
    lblHwIO2: TLabel;
    lblHwLoc2: TLabel;
    lblHwRefid2: TLabel;
    lblHwRemark2: TLabel;
    lblHwState2: TLabel;
    lblHwBrd3: TLabel;
    lblHwCh4: TLabel;
    lblHwFunction4: TLabel;
    lblHwIO4: TLabel;
    lblHwLoc4: TLabel;
    lblHwRefid4: TLabel;
    lblHwRemark4: TLabel;
    lblHwState4: TLabel;
    lblHwCh3: TLabel;
    lblHwFunction3: TLabel;
    lblHwIO3: TLabel;
    lblHwLoc3: TLabel;
    lblHwRefid3: TLabel;
    lblHwRemark3: TLabel;
    lblHwState3: TLabel;
    lblHwBrd4: TLabel;
    lblHwBrd5: TLabel;
    lblHwCh6: TLabel;
    lblHwFunction6: TLabel;
    lblHwIO6: TLabel;
    lblHwLoc6: TLabel;
    lblHwRefid6: TLabel;
    lblHwRemark6: TLabel;
    lblHwState6: TLabel;
    lblHwBrd7: TLabel;
    lblHwCh8: TLabel;
    lblHwFunction8: TLabel;
    lblHwCh5: TLabel;
    lblHwIO8: TLabel;
    lblHwLoc8: TLabel;
    lblHwRefid8: TLabel;
    lblHwRemark8: TLabel;
    lblHwState8: TLabel;
    lblHwCh7: TLabel;
    lblHwFunction7: TLabel;
    lblHwIO7: TLabel;
    lblHwLoc7: TLabel;
    lblHwRefid7: TLabel;
    lblHwFunction5: TLabel;
    lblHwRemark7: TLabel;
    lblHwState7: TLabel;
    lblHwBrd8: TLabel;
    lblHwIO5: TLabel;
    lblHwLoc5: TLabel;
    lblHwRefid5: TLabel;
    lblHwRemark5: TLabel;
    lblHwState5: TLabel;
    lblHwBrd6: TLabel;
    lblHwIO9: TLabel;
    lblHwFunction9: TLabel;
    lblHwLoc9: TLabel;
    lblHwBrd9: TLabel;
    lblHwCh9: TLabel;
    lblHwRefid9: TLabel;
    lblHwRemark9: TLabel;
    lblHwState9: TLabel;
    lblHwState10: TLabel;
    lblHwRemark10: TLabel;
    lblHwRefid10: TLabel;
    lblHwCh10: TLabel;
    lblHwBrd10: TLabel;
    lblHwLoc10: TLabel;
    lblHwFunction10: TLabel;
    lblHwIO10: TLabel;
    scrlbxIOInfo: TScrollBox;
    lblIOInfoHeader: TLabel;
    lblAPValue: TLabel;
    lblAPValue0: TLabel;
    lblAPValue9: TLabel;
    lblAPValue1: TLabel;
    lblAPValue2: TLabel;
    lblAPValue3: TLabel;
    lblAPValue4: TLabel;
    lblAPValue5: TLabel;
    lblAPValue6: TLabel;
    lblAPValue7: TLabel;
    lblAPValue8: TLabel;
    lblAPParam: TLabel;
    lblAPParam0: TLabel;
    lblAPParam9: TLabel;
    lblAPParam1: TLabel;
    lblAPParam2: TLabel;
    lblAPParam3: TLabel;
    lblAPParam4: TLabel;
    lblAPParam5: TLabel;
    lblAPParam6: TLabel;
    lblAPParam7: TLabel;
    lblAPParam8: TLabel;
    lblAPUnit: TLabel;
    lblAPUnit0: TLabel;
    lblAPUnit9: TLabel;
    lblAPUnit1: TLabel;
    lblAPUnit2: TLabel;
    lblAPUnit3: TLabel;
    lblAPUnit4: TLabel;
    lblAPUnit5: TLabel;
    lblAPUnit6: TLabel;
    lblAPUnit7: TLabel;
    lblAPUnit8: TLabel;
    lblAlterableParams: TLabel;
    lblTankTableCurveHeader: TLabel;
    lblTank1m0: TLabel;
    lblTank1m9: TLabel;
    lblTank1m1: TLabel;
    lblTank1m2: TLabel;
    lblTank1m3: TLabel;
    lblTank1m4: TLabel;
    lblTank1m5: TLabel;
    lblTank1m6: TLabel;
    lblTank1m7: TLabel;
    lblTank1m8: TLabel;
    lblTank3m0: TLabel;
    lblTank3m9: TLabel;
    lblTank3m1: TLabel;
    lblTank3m2: TLabel;
    lblTank3m3: TLabel;
    lblTank3m4: TLabel;
    lblTank3m5: TLabel;
    lblTank3m6: TLabel;
    lblTank3m7: TLabel;
    lblTank3m8: TLabel;
    lblTank2m0: TLabel;
    lblTank2m9: TLabel;
    lblTank2m1: TLabel;
    lblTank2m2: TLabel;
    lblTank2m3: TLabel;
    lblTank2m4: TLabel;
    lblTank2m5: TLabel;
    lblTank2m6: TLabel;
    lblTank2m7: TLabel;
    lblTank2m8: TLabel;
    lblTankLev0: TLabel;
    lblTankLev9: TLabel;
    lblTankLev1: TLabel;
    lblTankLev2: TLabel;
    lblTankLev3: TLabel;
    lblTankLev4: TLabel;
    lblTankLev5: TLabel;
    lblTankLev6: TLabel;
    lblTankLev7: TLabel;
    lblTankLev8: TLabel;
    lblTank0m0: TLabel;
    lblTank0m9: TLabel;
    lblTank0m1: TLabel;
    lblTank0m2: TLabel;
    lblTank0m3: TLabel;
    lblTank0m4: TLabel;
    lblTank0m5: TLabel;
    lblTank0m6: TLabel;
    lblTank0m7: TLabel;
    lblTank0m8: TLabel;
    lblTank6m0: TLabel;
    lblTank6m9: TLabel;
    lblTank6m1: TLabel;
    lblTank6m2: TLabel;
    lblTank6m3: TLabel;
    lblTank6m4: TLabel;
    lblTank6m5: TLabel;
    lblTank6m6: TLabel;
    lblTank6m7: TLabel;
    lblTank6m8: TLabel;
    pnlTankLev: TPanel;
    pnlTank2m: TPanel;
    pnlTank0m: TPanel;
    pnlTank1m: TPanel;
    pnlTank3m: TPanel;
    pnlTank6m: TPanel;
    lblTankLev10: TLabel;
    lblTankLev11: TLabel;
    lblTankLev12: TLabel;
    lblTankLev13: TLabel;
    lblTankLev14: TLabel;
    lblTankLev15: TLabel;
    lblTank2m10: TLabel;
    lblTank2m11: TLabel;
    lblTank2m12: TLabel;
    lblTank2m13: TLabel;
    lblTank2m14: TLabel;
    lblTank2m15: TLabel;
    lblTank0m10: TLabel;
    lblTank0m11: TLabel;
    lblTank0m12: TLabel;
    lblTank0m13: TLabel;
    lblTank0m14: TLabel;
    lblTank0m15: TLabel;
    lblTank1m10: TLabel;
    lblTank1m11: TLabel;
    lblTank1m12: TLabel;
    lblTank1m13: TLabel;
    lblTank1m14: TLabel;
    lblTank1m15: TLabel;
    lblTank3m10: TLabel;
    lblTank3m11: TLabel;
    lblTank3m12: TLabel;
    lblTank3m13: TLabel;
    lblTank3m14: TLabel;
    lblTank3m15: TLabel;
    lblTank6m10: TLabel;
    lblTank6m11: TLabel;
    lblTank6m12: TLabel;
    lblTank6m13: TLabel;
    lblTank6m14: TLabel;
    lblTank6m15: TLabel;
    pnlSeparator: TPanel;
    btnSwitchView: TButton;
    pnlTankTable: TPanel;
    pnlTankCurve: TPanel;
    chtCurve: TChart;
    fstlnsrsSeries1: TFastLineSeries;
    procedure btnSwitchViewClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FCAPData : TCAP_Data;
    FAlterParamTimer : TTimer;
    FAlterParamTimeout : Integer;

    procedure SetCustomEvent;

    procedure SetCAPData(aCAPData: TCAP_Data);
    procedure OnAlterParameterClick(Sender: TObject);
    procedure RefreshParameterData(aParamList: TList);
    procedure LoginResult(aResult: Boolean);
    procedure AlterParamExpiration(Sender: TObject);
  public
    property CAPData : TCAP_Data read FCAPData write SetCAPData;
  end;

var
  frmCAP: TfrmCAP;

implementation

uses
  Math, ufrmSetPoint, ufrmAuthorization;

{$R *.dfm}

procedure TfrmCAP.AlterParamExpiration(Sender: TObject);
begin
  Inc(FAlterParamTimeout);

  if FAlterParamTimeout = 9 then
  begin
    FAlterParamTimeout := 0;
    LoginResult(False);
  end;
end;

procedure TfrmCAP.btnSwitchViewClick(Sender: TObject);
begin
  inherited;

  case Tag of
    0:
    begin
      lblTankTableCurveHeader.Caption := 'Tank Curve';
      btnSwitchView.Caption := 'Table';
      Tag := 1;
      pnlTankCurve.BringToFront;
    end;
    1:
    begin
      lblTankTableCurveHeader.Caption := 'Tank Table';
      btnSwitchView.Caption := 'Curve';
      Tag := 0;
      pnlTankTable.BringToFront;
    end;
  end;
end;

procedure TfrmCAP.FormCreate(Sender: TObject);
begin
  inherited;

  FAlterParamTimer := TTimer.Create(nil);
  FAlterParamTimer.Enabled := False;
  FAlterParamTimer.Interval := 1000;
  FAlterParamTimer.OnTimer := AlterParamExpiration;

  SetCustomEvent;
end;

procedure TfrmCAP.FormResize(Sender: TObject);
const
  C_SPACE = 6;
begin
  inherited;

  pnlCAPTitle.Width := Width - (2 * C_SPACE);
  pnlCAPTitle.Left := C_SPACE;
  pnlCAPTitle.Top := C_SPACE;

  pnlElementInfo1.Width := (Width - (3 * C_SPACE)) div 2;
  pnlElementInfo1.Left := C_SPACE;
  pnlElementInfo1.Top := (2 * C_SPACE) + pnlCAPTitle.Height;
  pnlElementInfo2.Width := (Width - (3 * C_SPACE)) div 2;
  pnlElementInfo2.Left := Width - C_SPACE - pnlElementInfo2.Width;
  pnlElementInfo2.Top := (2 * C_SPACE) + pnlCAPTitle.Height;

  pnlHardwareData.Width := (Width - (3 * C_SPACE)) div 2;
  pnlHardwareData.Left := C_SPACE;
  pnlHardwareData.Top := (3 * C_SPACE) + pnlCAPTitle.Height +
    pnlElementInfo1.Height;
  pnlIOInfo.Width := (Width - (3 * C_SPACE)) div 2;
  pnlIOInfo.Left := Width - C_SPACE - pnlIOInfo.Width;
  pnlIOInfo.Top := (3 * C_SPACE) + pnlCAPTitle.Height + pnlElementInfo1.Height;

  pnlParameter.Width := (Width - (3 * C_SPACE)) div 2;
  pnlParameter.Left := C_SPACE;
  pnlParameter.Top := (4 * C_SPACE) + pnlCAPTitle.Height +
    pnlElementInfo1.Height + pnlHardwareData.Height;
  pnlTank.Width := (Width - (3 * C_SPACE)) div 2;
  pnlTank.Left := Width - C_SPACE - pnlTank.Width;
  pnlTank.Top := (4 * C_SPACE) + pnlCAPTitle.Height + pnlElementInfo1.Height +
    pnlHardwareData.Height;
end;

procedure TfrmCAP.LoginResult(aResult: Boolean);
var
  i : Integer;
begin
  if aResult then
  begin
    for i := 0 to ComponentCount - 1 do
    begin
      if (Components[i].ClassType = TLabel) and (Components[i].Tag > 0) then
      begin
        TLabel(Components[i]).Cursor := crHandPoint;
        TLabel(Components[i]).OnClick := OnAlterParameterClick;
      end;
    end;

    FAlterParamTimer.Enabled := True;
  end
  else
  begin
    for i := 0 to ComponentCount - 1 do
    begin
      if (Components[i].ClassType = TLabel) and (Components[i].Tag > 0) then
      begin
        TLabel(Components[i]).Cursor := crDefault;
        TLabel(Components[i]).OnClick := nil;
      end;
    end;

    FAlterParamTimer.Enabled := False;
  end;
end;

procedure TfrmCAP.OnAlterParameterClick(Sender: TObject);
var
  valFloat : Extended;
begin
  if Sender is TLabel then
  begin
    valFloat := StrToFloat(TLabel(Sender).Caption);

    frmSetpoint.ShowWithValue(TLabel(Sender).Tag, valFloat);
  end;
end;

procedure TfrmCAP.RefreshParameterData(aParamList: TList);
var
  i : Integer;
  paramData : TParameter_Data;
begin
  if Assigned(aParamList) then
  begin
    // Refresh Alterable Parameter
    for i := 0 to 10 - 1 do
    begin
      if i < aParamList.Count then
        paramData := aParamList.Items[i]
      else
        paramData := TParameter_Data.Create;

      case i of
        0:
        begin
          lblAPParam0.Caption := paramData.FParamName;
          lblAPValue0.Caption := paramData.FParamValue;
          lblAPUnit0.Caption := paramData.FParamUnit;
        end;
        1:
        begin
          lblAPParam1.Caption := paramData.FParamName;
          lblAPValue1.Caption := paramData.FParamValue;
          lblAPUnit1.Caption := paramData.FParamUnit;
        end;
        2:
        begin
          lblAPParam2.Caption := paramData.FParamName;
          lblAPValue2.Caption := paramData.FParamValue;
          lblAPUnit2.Caption := paramData.FParamUnit;
        end;
        3:
        begin
          lblAPParam3.Caption := paramData.FParamName;
          lblAPValue3.Caption := paramData.FParamValue;
          lblAPUnit3.Caption := paramData.FParamUnit;
        end;
        4:
        begin
          lblAPParam4.Caption := paramData.FParamName;
          lblAPValue4.Caption := paramData.FParamValue;
          lblAPUnit4.Caption := paramData.FParamUnit;
        end;
        5:
        begin
          lblAPParam5.Caption := paramData.FParamName;
          lblAPValue5.Caption := paramData.FParamValue;
          lblAPUnit5.Caption := paramData.FParamUnit;
        end;
        6:
        begin
          lblAPParam6.Caption := paramData.FParamName;
          lblAPValue6.Caption := paramData.FParamValue;
          lblAPUnit6.Caption := paramData.FParamUnit;
        end;
        7:
        begin
          lblAPParam7.Caption := paramData.FParamName;
          lblAPValue7.Caption := paramData.FParamValue;
          lblAPUnit7.Caption := paramData.FParamUnit;
        end;
        8:
        begin
          lblAPParam8.Caption := paramData.FParamName;
          lblAPValue8.Caption := paramData.FParamValue;
          lblAPUnit8.Caption := paramData.FParamUnit;
        end;
        9:
        begin
          lblAPParam9.Caption := paramData.FParamName;
          lblAPValue9.Caption := paramData.FParamValue;
          lblAPUnit9.Caption := paramData.FParamUnit;
        end;
      end;
    end;
  end;
end;

procedure TfrmCAP.SetCAPData(aCAPData: TCAP_Data);
  function AdjustAxisValue(aValue: Double) : Double;
  var
    count : Integer;
  begin
    if aValue >= 1000 then
    begin
      count := Floor(aValue) div 1000;
      Result := (count + 1) * 1000;
    end
    else if aValue >= 100 then
    begin
      count := Floor(aValue) div 100;
      Result := (count + 1) * 100;
    end
    else if aValue >= 10 then
    begin
      count := Floor(aValue) div 10;
      Result := (count + 1) * 10;
    end
    else
      Result := Floor(aValue) + 1;
  end;
var
  i : Integer;
  iopointData : TIOPOint_Data;
  equationData : TEquation_Data;
  paramData : TParameter_Data;
  tankData : TTank_Data;
  newLabel : TLabel;
  control : TControl;
  font : TFont;
  fastline : TFastLineSeries;
  chartValX, chartValY : Double;
begin
  if Assigned(aCAPData) then
  begin
    FCAPData := aCAPData;

    with aCAPData do
    begin
      // set Element Info
      lblElementIDVal.Caption := FElementID;
      lblElementTypeVal.Caption := FElementtype_IDfk;
      lblDescriptionVal.Caption := FElementname;
      lblSystemVal.Caption := FSystemIDfk + ' ' + FSystemDescription;
      lblPLCIDVal.Caption := FController_ID;
      lblMimicNrVal.Caption := FMainMimic_IDfk;
      lblInstallGroupVal.Caption := FAlarmGroupAbbreviation;

      // set Hardware Data
      if Assigned(FIOPointList) then
      begin
        lblHardwareDataHeader.Visible := FIOPointList.Count > 0;
        lblHwIO.Visible := FIOPointList.Count > 0;
        lblHwFunction.Visible := FIOPointList.Count > 0;
        lblHwLoc.Visible := FIOPointList.Count > 0;
        lblHwBrd.Visible := FIOPointList.Count > 0;
        lblHwCh.Visible := FIOPointList.Count > 0;
        lblHwRefid.Visible := FIOPointList.Count > 0;
        lblHwRemark.Visible := FIOPointList.Count > 0;
        lblHwState.Visible := FIOPointList.Count > 0;
        lblIOInfoHeader.Visible := FIOPointList.Count > 0;

        for i := 0 to 10 - 1 do
        begin
          if i < FIOPointList.Count then
            iopointData := FIOPointList.Items[i]
          else
            iopointData := TIOPOint_Data.Create;

          case i of
            0:
            begin
              lblHwIO1.Caption := iopointData.FIO_type;
              lblHwFunction1.Caption := iopointData.FIO_function_IDfk;
              lblHwLoc1.Caption := iopointData.FIO_Rack;
              lblHwBrd1.Caption := iopointData.FIO_Slot;
              lblHwCh1.Caption := iopointData.FIO_Channel;
              lblHwRefid1.Caption := iopointData.FCM_IDfk;
              lblHwRemark1.Caption := iopointData.FS_Address_desk;
              lblHwState1.Caption := '';

              if iopointData.F_Serial = 'No' then
              begin
                lblHwState1.Color := clLime;
                lblHwState1.Visible := True;
              end
              else
              begin
                lblHwState1.Color := clLime;
                lblHwState1.Visible := False;
              end
            end;
            1:
            begin
              lblHwIO2.Caption := iopointData.FIO_type;
              lblHwFunction2.Caption := iopointData.FIO_function_IDfk;
              lblHwLoc2.Caption := iopointData.FIO_Rack;
              lblHwBrd2.Caption := iopointData.FIO_Slot;
              lblHwCh2.Caption := iopointData.FIO_Channel;
              lblHwRefid2.Caption := iopointData.FCM_IDfk;
              lblHwRemark2.Caption := iopointData.FS_Address_desk;
              lblHwState2.Caption := '';
              if iopointData.F_Serial = 'No' then
              begin
                lblHwState2.Color := clLime;
                lblHwState2.Visible := True;
              end
              else
              begin
                lblHwState2.Color := clLime;
                lblHwState2.Visible := False;
              end
            end;
            2:
            begin
              lblHwIO3.Caption := iopointData.FIO_type;
              lblHwFunction3.Caption := iopointData.FIO_function_IDfk;
              lblHwLoc3.Caption := iopointData.FIO_Rack;
              lblHwBrd3.Caption := iopointData.FIO_Slot;
              lblHwCh3.Caption := iopointData.FIO_Channel;
              lblHwRefid3.Caption := iopointData.FCM_IDfk;
              lblHwRemark3.Caption := iopointData.FS_Address_desk;
              lblHwState3.Caption := '';
              if iopointData.F_Serial = 'No' then
              begin
                lblHwState3.Color := clLime;
                lblHwState3.Visible := True;
              end
              else
              begin
                lblHwState3.Color := clLime;
                lblHwState3.Visible := False;
              end
            end;
            3:
            begin
              lblHwIO4.Caption := iopointData.FIO_type;
              lblHwFunction4.Caption := iopointData.FIO_function_IDfk;
              lblHwLoc4.Caption := iopointData.FIO_Rack;
              lblHwBrd4.Caption := iopointData.FIO_Slot;
              lblHwCh4.Caption := iopointData.FIO_Channel;
              lblHwRefid4.Caption := iopointData.FCM_IDfk;
              lblHwRemark4.Caption := iopointData.FS_Address_desk;
              lblHwState4.Caption := '';
              if iopointData.F_Serial = 'No' then
              begin
                lblHwState4.Color := clLime;
                lblHwState4.Visible := True;
              end
              else
              begin
                lblHwState4.Color := clLime;
                lblHwState4.Visible := False;
              end
            end;
            4:
            begin
              lblHwIO5.Caption := iopointData.FIO_type;
              lblHwFunction5.Caption := iopointData.FIO_function_IDfk;
              lblHwLoc5.Caption := iopointData.FIO_Rack;
              lblHwBrd5.Caption := iopointData.FIO_Slot;
              lblHwCh5.Caption := iopointData.FIO_Channel;
              lblHwRefid5.Caption := iopointData.FCM_IDfk;
              lblHwRemark5.Caption := iopointData.FS_Address_desk;
              lblHwState5.Caption := '';
              if iopointData.F_Serial = 'No' then
              begin
                lblHwState5.Color := clLime;
                lblHwState5.Visible := True;
              end
              else
              begin
                lblHwState5.Color := clLime;
                lblHwState5.Visible := False;
              end
            end;
            5:
            begin
              lblHwIO6.Caption := iopointData.FIO_type;
              lblHwFunction6.Caption := iopointData.FIO_function_IDfk;
              lblHwLoc6.Caption := iopointData.FIO_Rack;
              lblHwBrd6.Caption := iopointData.FIO_Slot;
              lblHwCh6.Caption := iopointData.FIO_Channel;
              lblHwRefid6.Caption := iopointData.FCM_IDfk;
              lblHwRemark6.Caption := iopointData.FS_Address_desk;
              lblHwState6.Caption := '';
            end;
            6:
            begin
              lblHwIO7.Caption := iopointData.FIO_type;
              lblHwFunction7.Caption := iopointData.FIO_function_IDfk;
              lblHwLoc7.Caption := iopointData.FIO_Rack;
              lblHwBrd7.Caption := iopointData.FIO_Slot;
              lblHwCh7.Caption := iopointData.FIO_Channel;
              lblHwRefid7.Caption := iopointData.FCM_IDfk;
              lblHwRemark7.Caption := iopointData.FS_Address_desk;
              lblHwState7.Caption := '';
            end;
            7:
            begin
              lblHwIO8.Caption := iopointData.FIO_type;
              lblHwFunction8.Caption := iopointData.FIO_function_IDfk;
              lblHwLoc8.Caption := iopointData.FIO_Rack;
              lblHwBrd8.Caption := iopointData.FIO_Slot;
              lblHwCh8.Caption := iopointData.FIO_Channel;
              lblHwRefid8.Caption := iopointData.FCM_IDfk;
              lblHwRemark8.Caption := iopointData.FS_Address_desk;
              lblHwState8.Caption := '';
            end;
            8:
            begin
              lblHwIO9.Caption := iopointData.FIO_type;
              lblHwFunction9.Caption := iopointData.FIO_function_IDfk;
              lblHwLoc9.Caption := iopointData.FIO_Rack;
              lblHwBrd9.Caption := iopointData.FIO_Slot;
              lblHwCh9.Caption := iopointData.FIO_Channel;
              lblHwRefid9.Caption := iopointData.FCM_IDfk;
              lblHwRemark9.Caption := iopointData.FS_Address_desk;
              lblHwState9.Caption := '';
            end;
            9:
            begin
              lblHwIO10.Caption := iopointData.FIO_type;
              lblHwFunction10.Caption := iopointData.FIO_function_IDfk;
              lblHwLoc10.Caption := iopointData.FIO_Rack;
              lblHwBrd10.Caption := iopointData.FIO_Slot;
              lblHwCh10.Caption := iopointData.FIO_Channel;
              lblHwRefid10.Caption := iopointData.FCM_IDfk;
              lblHwRemark10.Caption := iopointData.FS_Address_desk;
              lblHwState10.Caption := '';
            end;
          end;
        end;
      end;

      // set IO Information
      for i := scrlbxIOInfo.ControlCount - 1 downto 0 do
      begin
        control := scrlbxIOInfo.Controls[i];
        FreeAndNil(control);
      end;

      font := TFont.Create;
      font.Color := clBlack;
      font.Name := 'Arial';
      font.Size := 12;
      font.Style := [fsBold];

      if Assigned(FEquationList) then
      begin
        for i := 0 to FEquationList.Count - 1 do
        begin
          equationData := FEquationList.Items[i];

          newLabel := TLabel.Create(Self);
          newLabel.Caption := equationData.FEquation_IDfk;
          newLabel.Font := font;
          newLabel.Left := 12;
          newLabel.Top := 7 + (i * 125);
          newLabel.Parent := scrlbxIOInfo;

          newLabel := TLabel.Create(Self);
          newLabel.Caption := equationData.FEquationName;
          newLabel.Font := font;
          newLabel.Left := 209;
          newLabel.Top := 7 + (i * 125);
          newLabel.Parent := scrlbxIOInfo;

          newLabel := TLabel.Create(Self);
          newLabel.Caption := equationData.FEquationDesc;
          newLabel.Font := font;
          newLabel.Left := 12;
          newLabel.Top := 51 + (i * 125);
          newLabel.Parent := scrlbxIOInfo;

          if FEquationList.Count > 1 then
          begin
            newLabel := TLabel.Create(Self);
            newLabel.Caption := '---------------------------------------------' +
              '--------------------------------------------------';
            newLabel.Font := font;
            newLabel.Left := 12;
            newLabel.Top := 107 + (i * 125);
            newLabel.Parent := scrlbxIOInfo;
          end;
        end;
      end;

      if Assigned(FParamList) then
      begin
        // set Alterable Parameter
        for i := 0 to 10 - 1 do
        begin
          if i < FParamList.Count then
            paramData := FParamList.Items[i]
          else
            paramData := TParameter_Data.Create;

          case i of
            0:
            begin
              lblAPParam0.Caption := paramData.FParamName;
              lblAPValue0.Caption := paramData.FParamValue;
              lblAPUnit0.Caption := paramData.FParamUnit;
            end;
            1:
            begin
              lblAPParam1.Caption := paramData.FParamName;
              lblAPValue1.Caption := paramData.FParamValue;
              lblAPUnit1.Caption := paramData.FParamUnit;
            end;
            2:
            begin
              lblAPParam2.Caption := paramData.FParamName;
              lblAPValue2.Caption := paramData.FParamValue;
              lblAPUnit2.Caption := paramData.FParamUnit;
            end;
            3:
            begin
              lblAPParam3.Caption := paramData.FParamName;
              lblAPValue3.Caption := paramData.FParamValue;
              lblAPUnit3.Caption := paramData.FParamUnit;
            end;
            4:
            begin
              lblAPParam4.Caption := paramData.FParamName;
              lblAPValue4.Caption := paramData.FParamValue;
              lblAPUnit4.Caption := paramData.FParamUnit;
            end;
            5:
            begin
              lblAPParam5.Caption := paramData.FParamName;
              lblAPValue5.Caption := paramData.FParamValue;
              lblAPUnit5.Caption := paramData.FParamUnit;
            end;
            6:
            begin
              lblAPParam6.Caption := paramData.FParamName;
              lblAPValue6.Caption := paramData.FParamValue;
              lblAPUnit6.Caption := paramData.FParamUnit;
            end;
            7:
            begin
              lblAPParam7.Caption := paramData.FParamName;
              lblAPValue7.Caption := paramData.FParamValue;
              lblAPUnit7.Caption := paramData.FParamUnit;
            end;
            8:
            begin
              lblAPParam8.Caption := paramData.FParamName;
              lblAPValue8.Caption := paramData.FParamValue;
              lblAPUnit8.Caption := paramData.FParamUnit;
            end;
            9:
            begin
              lblAPParam9.Caption := paramData.FParamName;
              lblAPValue9.Caption := paramData.FParamValue;
              lblAPUnit9.Caption := paramData.FParamUnit;
            end;
          end;
        end;
      end;

      // set Tank Table / Tank Curve
      if aCAPData.FElementtype_IDfk = 'SSL' then
      begin
        lblTankTableCurveHeader.Visible := True;
        pnlTankTable.Visible := True;
        pnlTankCurve.Visible := True;
        btnSwitchView.Visible := True;

        fastline := TFastLineSeries(chtCurve.Series[0]);
        fastline.Clear;
        if Assigned(FTankList) then
        begin
          for i := 0 to FTankList.Count - 1 do
          begin
            tankData := FTankList.Items[i];

            if (tankData.FSoundLength <> '-') or (tankData.FTrim0m <> '-') then
            begin
              chartValX := StrToFloat(tankData.FTrim0m);
              chartValY := StrToFloat(tankData.FSoundLength);

              fastline.GetHorizAxis.SetMinMax(-1, AdjustAxisValue(chartValX));
              fastline.GetVertAxis.SetMinMax(0, AdjustAxisValue(chartValY));
              fastline.AddXY(chartValX, chartValY, '', clRed);
            end;

            case i of
              0:
              begin
                lblTankLev0.Caption := tankData.FSoundLength;
                lblTank2m0.Caption := tankData.FTrim2m;
                lblTank0m0.Caption := tankData.FTrim0m;
                lblTank1m0.Caption := tankData.FTrim1m;
                lblTank3m0.Caption := tankData.FTrim3m;
                lblTank6m0.Caption := tankData.FTrim6m;
              end;
              1:
              begin
                lblTankLev1.Caption := tankData.FSoundLength;
                lblTank2m1.Caption := tankData.FTrim2m;
                lblTank0m1.Caption := tankData.FTrim0m;
                lblTank1m1.Caption := tankData.FTrim1m;
                lblTank3m1.Caption := tankData.FTrim3m;
                lblTank6m1.Caption := tankData.FTrim6m;
              end;
              2:
              begin
                lblTankLev2.Caption := tankData.FSoundLength;
                lblTank2m2.Caption := tankData.FTrim2m;
                lblTank0m2.Caption := tankData.FTrim0m;
                lblTank1m2.Caption := tankData.FTrim1m;
                lblTank3m2.Caption := tankData.FTrim3m;
                lblTank6m2.Caption := tankData.FTrim6m;
              end;
              3:
              begin
                lblTankLev3.Caption := tankData.FSoundLength;
                lblTank2m3.Caption := tankData.FTrim2m;
                lblTank0m3.Caption := tankData.FTrim0m;
                lblTank1m3.Caption := tankData.FTrim1m;
                lblTank3m3.Caption := tankData.FTrim3m;
                lblTank6m3.Caption := tankData.FTrim6m;
              end;
              4:
              begin
                lblTankLev4.Caption := tankData.FSoundLength;
                lblTank2m4.Caption := tankData.FTrim2m;
                lblTank0m4.Caption := tankData.FTrim0m;
                lblTank1m4.Caption := tankData.FTrim1m;
                lblTank3m4.Caption := tankData.FTrim3m;
                lblTank6m4.Caption := tankData.FTrim6m;
              end;
              5:
              begin
                lblTankLev5.Caption := tankData.FSoundLength;
                lblTank2m5.Caption := tankData.FTrim2m;
                lblTank0m5.Caption := tankData.FTrim0m;
                lblTank1m5.Caption := tankData.FTrim1m;
                lblTank3m5.Caption := tankData.FTrim3m;
                lblTank6m5.Caption := tankData.FTrim6m;
              end;
              6:
              begin
                lblTankLev6.Caption := tankData.FSoundLength;
                lblTank2m6.Caption := tankData.FTrim2m;
                lblTank0m6.Caption := tankData.FTrim0m;
                lblTank1m6.Caption := tankData.FTrim1m;
                lblTank3m6.Caption := tankData.FTrim3m;
                lblTank6m6.Caption := tankData.FTrim6m;
              end;
              7:
              begin
                lblTankLev7.Caption := tankData.FSoundLength;
                lblTank2m7.Caption := tankData.FTrim2m;
                lblTank0m7.Caption := tankData.FTrim0m;
                lblTank1m7.Caption := tankData.FTrim1m;
                lblTank3m7.Caption := tankData.FTrim3m;
                lblTank6m7.Caption := tankData.FTrim6m;
              end;
              8:
              begin
                lblTankLev8.Caption := tankData.FSoundLength;
                lblTank2m8.Caption := tankData.FTrim2m;
                lblTank0m8.Caption := tankData.FTrim0m;
                lblTank1m8.Caption := tankData.FTrim1m;
                lblTank3m8.Caption := tankData.FTrim3m;
                lblTank6m8.Caption := tankData.FTrim6m;
              end;
              9:
              begin
                lblTankLev9.Caption := tankData.FSoundLength;
                lblTank2m9.Caption := tankData.FTrim2m;
                lblTank0m9.Caption := tankData.FTrim0m;
                lblTank1m9.Caption := tankData.FTrim1m;
                lblTank3m9.Caption := tankData.FTrim3m;
                lblTank6m9.Caption := tankData.FTrim6m;
              end;
              10:
              begin
                lblTankLev10.Caption := tankData.FSoundLength;
                lblTank2m10.Caption := tankData.FTrim2m;
                lblTank0m10.Caption := tankData.FTrim0m;
                lblTank1m10.Caption := tankData.FTrim1m;
                lblTank3m10.Caption := tankData.FTrim3m;
                lblTank6m10.Caption := tankData.FTrim6m;
              end;
              11:
              begin
                lblTankLev11.Caption := tankData.FSoundLength;
                lblTank2m11.Caption := tankData.FTrim2m;
                lblTank0m11.Caption := tankData.FTrim0m;
                lblTank1m11.Caption := tankData.FTrim1m;
                lblTank3m11.Caption := tankData.FTrim3m;
                lblTank6m11.Caption := tankData.FTrim6m;
              end;
              12:
              begin
                lblTankLev12.Caption := tankData.FSoundLength;
                lblTank2m12.Caption := tankData.FTrim2m;
                lblTank0m12.Caption := tankData.FTrim0m;
                lblTank1m12.Caption := tankData.FTrim1m;
                lblTank3m12.Caption := tankData.FTrim3m;
                lblTank6m12.Caption := tankData.FTrim6m;
              end;
              13:
              begin
                lblTankLev13.Caption := tankData.FSoundLength;
                lblTank2m13.Caption := tankData.FTrim2m;
                lblTank0m13.Caption := tankData.FTrim0m;
                lblTank1m13.Caption := tankData.FTrim1m;
                lblTank3m13.Caption := tankData.FTrim3m;
                lblTank6m13.Caption := tankData.FTrim6m;
              end;
              14:
              begin
                lblTankLev14.Caption := tankData.FSoundLength;
                lblTank2m14.Caption := tankData.FTrim2m;
                lblTank0m14.Caption := tankData.FTrim0m;
                lblTank1m14.Caption := tankData.FTrim1m;
                lblTank3m14.Caption := tankData.FTrim3m;
                lblTank6m14.Caption := tankData.FTrim6m;
              end;
              15:
              begin
                lblTankLev15.Caption := tankData.FSoundLength;
                lblTank2m15.Caption := tankData.FTrim2m;
                lblTank0m15.Caption := tankData.FTrim0m;
                lblTank1m15.Caption := tankData.FTrim1m;
                lblTank3m15.Caption := tankData.FTrim3m;
                lblTank6m15.Caption := tankData.FTrim6m;
              end;
            end;
          end;
        end;
      end
      else
      begin
        lblTankTableCurveHeader.Visible := False;
        pnlTankTable.Visible := False;
        pnlTankCurve.Visible := False;
        btnSwitchView.Visible := False;
      end;
    end;
  end;
end;

procedure TfrmCAP.SetCustomEvent;
begin
  if not Assigned(frmAuthorization) then
    frmAuthorization := TfrmAuthorization.Create(Self);

  if not Assigned(frmSetpoint) then
    frmSetpoint := TfrmSetpoint.Create(Self);

  frmAuthorization.OnLoginAlterParameter := LoginResult;
  frmSetpoint.OnAlterParameter := RefreshParameterData;
end;

end.
