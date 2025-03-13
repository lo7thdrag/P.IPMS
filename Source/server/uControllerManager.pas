{*------------------------------------------------------------------------------
  This class has capability of controller for all local processing unit
  All controllers and elements processing managed by this class

  ********              ********     ********
  |       | ==> out ==> *  LPUs* ==> * MIMIC*
  | PLC   | <== in  <== *      * <== *------*
  | HMI   |             *      *     *  DB  *
  *********             ********     ********

  @author  ryu
  @version 2013/07/23 1.0 Initial revision.
  @todo
  @comment
-------------------------------------------------------------------------------}
unit uControllerManager;

interface

uses uDatabase, Sysutils, Classes, uElementController, uListener, uDataType, uElement,
  uElementTables, uCBA,uSWE, uCTR, uDAE, uCBE, uAAE, uSSE, uMCE, uMCD, uMCS, uRHE,
  uSAE,uSEE,uSPE,uSS1,uSS2,uSSL,uSWB,uSWN,uVCE,uVCH,uVCP, uDBSupportClasses,
  uThreadTimer, uSteppers;


type
  TControllerManager = class
  private
    FControllers : TList;
    FDatabase    : TIPMSDatabase;
    FListeners   : TListeners;
    FLoggedElementTable : TElementTables;
    FRunningScenario    : integer;
    FRunningScenarioTime : TDateTime;
    FPropulsionAlarmCheck : Boolean;
    procedure OnDatabasePropStrChange(Sender : TObject;Props : E_PropsID; Value : String);
    procedure ElementPropChange(Sender : TObject; PropsID : E_PropsID;Value : Double);
    function ConvertToValueSensor(aElement : TElement; aValue : Double) : double;

    {Procedure for PMS & PCS}
    procedure MappingPMSStatetoElement(aElement : TElement; KONSTANTA : Integer; aValue : boolean);overload;
    procedure MappingPMSStatetoElement(aElement : TElement; KONSTANTA : Integer; aValue : Integer);overload;
    procedure MappingPMSStatetoElement(aElement : TElement; KONSTANTA : Integer; aValue : Double);overload;
    procedure MappingPCSStateToElement(aElement : TElement; Order : E_PropsID; aValue : Boolean);overload;
    procedure MappingPCSStateToElement(aElement : TElement; Order : E_PropsID; aValue : Double);overload;
    procedure MappingPCSStateToElement(aElement : TElement; Order : E_PropsID; aValue : Integer);overload;


    procedure setPMSGenMode(GenSwitchID: string; ValueInt : Integer; konstanta: Integer);
    procedure setPMSCTRElementID(aGenSwitchID: string; aValue : Boolean; konstanta : Integer);
    procedure setPMSSWEElementID(aGenSwitchID: string; aValue : Boolean; konstanta : Integer);
    procedure setPMSSWEElementIDInt(aGenSwitchID: string; aValue : Integer; konstanta : Integer);
    procedure setPMSMTRElementID(aGenSwitchID: string;aValue : Boolean; konstanta : Integer);
    procedure setPMSCBEElementID(aGenSwitchID: string;aValue : Boolean; konstanta : Integer);
    procedure setPMSCBEElementIDInt(aGenSwitchID: string;aValue1 : Integer;aValue2 : Boolean; konstanta : Integer);
    procedure setPMSCBEEmergency(aValue2 : Boolean; konstanta : Integer);
    procedure setPMSAAEElementID(aGenSwitchID: string; aValue : Double; konstanta : Integer);
    procedure setPMSSSEElementID(aGenSwitchID: string; aValue : Double; konstanta : Integer);
    procedure setPMSRHEElementID(aGenSwitchID: string; aValue : Boolean; konstanta : Integer);

    procedure setPCSSWEElementID(aPortStaboardID : string; aValue : Boolean; Order : E_PropsID);
    procedure setPCSAAEElementID(aPortStaboardID : string; aValue: Double; Order : E_PropsID);
    procedure setPCSMCEElementID(aPortStaboardID : string; aValue : Boolean; Order : E_PropsID);
    procedure setPCSMCDElementID(aPortStaboardID : string; aValue : Boolean; Order : E_PropsID);
    procedure setPCSSSEElementID(aPortStaboardID : string; aValue: Double; Order : E_PropsID);
    procedure setPCSRHEElementID(aPortStaboardID : string; aValue : Integer; Order : E_PropsID);
    procedure setPCSVCEElementID(aPortStaboardID : string; aValue : Boolean; Order : E_PropsID);
    procedure setPCSSAEElementID(aPortStaboardID : string; aValue : Double; Order : E_PropsID);

    procedure getElementCondition(aElement : TAAEElement;aCondition : TElementCondition);overload;
    procedure getElementCondition(aElement : TCBAElement;aCondition : TElementCondition);overload;
    procedure getElementCondition(aElement : TCBEElement;aCondition : TElementCondition);overload;
    procedure getElementCondition(aElement : TCTRElement;aCondition : TElementCondition);overload;
    procedure getElementCondition(aElement : TDAEElement;aCondition : TElementCondition);overload;
    procedure getElementCondition(aElement : TMCDElement;aCondition : TElementCondition);overload;
    procedure getElementCondition(aElement : TMCEElement;aCondition : TElementCondition);overload;
    procedure getElementCondition(aElement : TMCSElement;aCondition : TElementCondition);overload;
    procedure getElementCondition(aElement : TRHEElement;aCondition : TElementCondition);overload;
    procedure getElementCondition(aElement : TSAEElement;aCondition : TElementCondition);overload;
    procedure getElementCondition(aElement : TSEEElement;aCondition : TElementCondition);overload;
    procedure getElementCondition(aElement : TSPEElement;aCondition : TElementCondition);overload;
    procedure getElementCondition(aElement : TSS1Element;aCondition : TElementCondition);overload;
    procedure getElementCondition(aElement : TSS2Element;aCondition : TElementCondition);overload;
    procedure getElementCondition(aElement : TSSEElement;aCondition : TElementCondition);overload;
    procedure getElementCondition(aElement : TSSLElement;aCondition : TElementCondition);overload;
    procedure getElementCondition(aElement : TSWBElement;aCondition : TElementCondition);overload;
    procedure getElementCondition(aElement : TSWEElement;aCondition : TElementCondition);overload;
    procedure getElementCondition(aElement : TSWNElement;aCondition : TElementCondition);overload;
    procedure getElementCondition(aElement : TVCEElement;aCondition : TElementCondition);overload;
    procedure getElementCondition(aElement : TVCHElement;aCondition : TElementCondition);overload;
    procedure getElementCondition(aElement : TVCPElement;aCondition : TElementCondition);overload;

    procedure setElementCondition(aElement : TAAEElement;aCondition : TElementCondition);overload;
    procedure setElementCondition(aElement : TCBAElement;aCondition : TElementCondition);overload;
    procedure setElementCondition(aElement : TCBEElement;aCondition : TElementCondition);overload;
    procedure setElementCondition(aElement : TCTRElement;aCondition : TElementCondition);overload;
    procedure setElementCondition(aElement : TDAEElement;aCondition : TElementCondition);overload;
    procedure setElementCondition(aElement : TMCDElement;aCondition : TElementCondition);overload;
    procedure setElementCondition(aElement : TMCEElement;aCondition : TElementCondition);overload;
    procedure setElementCondition(aElement : TMCSElement;aCondition : TElementCondition);overload;
    procedure setElementCondition(aElement : TRHEElement;aCondition : TElementCondition);overload;
    procedure setElementCondition(aElement : TSAEElement;aCondition : TElementCondition);overload;
    procedure setElementCondition(aElement : TSEEElement;aCondition : TElementCondition);overload;
    procedure setElementCondition(aElement : TSPEElement;aCondition : TElementCondition);overload;
    procedure setElementCondition(aElement : TSS1Element;aCondition : TElementCondition);overload;
    procedure setElementCondition(aElement : TSS2Element;aCondition : TElementCondition);overload;
    procedure setElementCondition(aElement : TSSEElement;aCondition : TElementCondition);overload;
    procedure setElementCondition(aElement : TSSLElement;aCondition : TElementCondition);overload;
    procedure setElementCondition(aElement : TSWBElement;aCondition : TElementCondition);overload;
    procedure setElementCondition(aElement : TSWEElement;aCondition : TElementCondition);overload;
    procedure setElementCondition(aElement : TSWNElement;aCondition : TElementCondition);overload;
    procedure setElementCondition(aElement : TVCEElement;aCondition : TElementCondition);overload;
    procedure setElementCondition(aElement : TVCHElement;aCondition : TElementCondition);overload;
    procedure setElementCondition(aElement : TVCPElement;aCondition : TElementCondition);overload;
  protected

  public
    constructor Create(Database : TIPMSDatabase);
    destructor Destroy;override;

    function getController(ControllerID : string) : TElementController;
    function getControllers: TStrings;

    function getElement(ElementID : string) : TElement;
    procedure getElementConditions(var aList : TList);

//    procedure NetEvent_PMSElmtCommonCmd(apRec: PAnsiChar; aSize: Word);
//    procedure NetEvent_PCSElmtCommonCmd(apRec: PAnsiChar; aSize: Word);

    procedure NetEvent_PMSElmtCommonCmd(rCmd : R_Common_PMS_Command);
    procedure NetEvent_PCSElmtCommonCmd(rCmd : R_Common_PCS_Command);

    procedure setElementCondition(aElement : TElement;aCondition : TElementCondition);overload;

    procedure SetRunningScenario(aRunningID : integer);
    procedure SetRunningScenarioTime(aRunningTime : TDateTime);
    procedure RunElement(Sender : TObject);
    procedure RunLoggedElement(Sender : TObject);

    property Listeners : TListeners read FListeners;

    procedure ERCommand(rCmd : R_Common_PCS_Command); overload;
    procedure ERCommand(rCmd : R_Common_PMS_Command); overload;
    procedure ERCommand(rCmd: R_Common_TANK_Command); overload;

    procedure AllElementCalcd;
    procedure AllDefaultValue;

  end;

implementation

uses
  Dialogs, uPMSDataElement, uPCSDataElement,
  uControllerSystem; // contoh yg gampang

{ TControllerManager }

procedure TControllerManager.AllElementCalcd;
var
  lCtrl, lElmt : TStrings;
  i,j : integer;
  elmCtrl : TElementController;
  elmt : TElement;
begin
  lCtrl := getControllers;

  for i := 0 to lCtrl.Count - 1 do
  begin
    elmCtrl := getController(lCtrl[i]);

    if Assigned(elmCtrl) then
    begin
      lElmt := elmCtrl.getElements;

      for j := 0 to lElmt.Count - 1 do
      begin
        elmt := elmCtrl.getElement(lElmt[j]);

        if Assigned(elmt) then
           elmt.AlarmElementStateCalc;
      end;
    end;
  end;
end;

procedure TControllerManager.AllDefaultValue;
var
  lCtrl, lElmt : TStrings;
  i,j : integer;
  elmCtrl : TElementController;
  elmt : TElement;
begin
  lCtrl := getControllers;
  for I := 0 to lCtrl.Count - 1 do begin
    elmCtrl := getController(lCtrl[i]);

    if Assigned(elmCtrl) then
    begin

      lElmt := elmCtrl.getElements;

      for j := 0 to lElmt.Count - 1 do begin

        elmt := elmCtrl.getElement(lElmt[j]);

        if Assigned(elmt) then
           elmt.DefaultValue;

      end;
    end;
  end
end;


function TControllerManager.ConvertToValueSensor(aElement: TElement;
  aValue: Double): double;
var
  v4, v20 : double;
begin
  Result := aValue;

  case aElement.ElementType of
    eltSS1, eltSSE:
    begin
      v4  := aElement.Parameters.GetParameter(epV4).ParamDoubleValue;
      v20 := aElement.Parameters.GetParameter(epV20).ParamDoubleValue;
      { reverse perhitungan value element untuk mendapatkan value sensor : mA }
      try
        Result := ( ( (aValue - v4)  * 16) / (v20-v4) ) + 4;
      except
        Result := aValue;
      end;

    end;
  end;

end;

constructor TControllerManager.Create(Database : TIPMSDatabase);
var
  lCtrl, lElmt : TStrings;
  elmCtrl : TElementController;
  elmt : TElement;
  i,j,k : Integer;
  ListParameter : Tlist;
  afieldParameter : TIPMS_Record_Parameter;
  field : TFieldValue;
  aList : TList;
begin
  FDatabase    := Database;
  FControllers := TList.Create;
  FListeners   := TListeners.Create;

  with FDatabase.Listeners.Add('ControllerMgrLstr') as TPropertyEventListener do
  begin
    OnPropertyStringChange := OnDatabasePropStrChange;
  end;

  FDatabase.PopulateLoggedElement(FLoggedElementTable);
  FDatabase.PopulateController;


  lCtrl := getControllers;
  for I := 0 to lCtrl.Count - 1 do begin
    elmCtrl := getController(lCtrl[i]);

    if Assigned(elmCtrl) then
    begin

      lElmt := elmCtrl.getElements;

      for j := 0 to lElmt.Count - 1 do begin

        elmt := elmCtrl.getElement(lElmt[j]);

        if Assigned(elmt) then
        begin
          with (elmt.Listeners.Add('ElementLog') as TPropertyEventListener) do
          begin
            OnPropertyDblChange     := ElementPropChange;
          end;

          { assign logged element }
          aList := nil;
          FLoggedElementTable.GetFields(elmt.ElementID,aList);
          if Assigned(aList) then
          begin

            for k := 0 to aList.Count - 1 do
            begin
              field := aList.Items[k];

              if field.FieldType = 'VALLEV_VAL0' then
                elmt.OnValueLevelChangeSaved := field.OnValueChange
              else
              if field.FieldType = 'VALM3_VAL0' then
                elmt.OnValueM3ChangeSaved := field.OnValueChange
              else
              if field.FieldType = 'VALMAS_VAL0' then
                elmt.OnValueMassChangeSaved := field.OnValueChange
              else
              if field.FieldType = 'VALVAL_VAL0'  then
                elmt.OnValueChangeSaved := field.OnValueChange
              else
              if field.FieldType = 'VAL_VAL0'  then
                elmt.OnValueChangeSaved := field.OnValueChange;
            end;

            aList.Free;
          end;

          { parameter setting }
          ListParameter := nil;
          FDatabase.getValueParameter(elmt.ElementID, ListParameter);
          if ListParameter.Count > 0 then
          begin
            for k := 0 to ListParameter.Count - 1 do
            begin
              afieldParameter := ListParameter.Items[k];
              if afieldParameter.FParameterName ='HAV' then
                elmt.Parameters.GetParameter(epHAV).ParamDoubleValue := StrToFloat(afieldParameter.FParameterValue)
              else if afieldParameter.FParameterName = 'LAV' then
                elmt.Parameters.GetParameter(epLAV).ParamDoubleValue := StrToFloat(afieldParameter.FParameterValue)
              else if afieldParameter.FParameterName = 'HYHA' then
                elmt.Parameters.GetParameter(epHYHA).ParamDoubleValue := StrToFloat(afieldParameter.FParameterValue)
              else if afieldParameter.FParameterName =  'HYLA' then
                elmt.Parameters.GetParameter(epHYLA).ParamDoubleValue := StrToFloat(afieldParameter.FParameterValue)
              else if afieldParameter.FParameterName =  'THA' then
                elmt.Parameters.GetParameter(epTHA).ParamDoubleValue := StrToFloat(afieldParameter.FParameterValue)
              else if afieldParameter.FParameterName =  'TLA' then
                elmt.Parameters.GetParameter(epTLA).ParamDoubleValue := StrToFloat(afieldParameter.FParameterValue)
              else if afieldParameter.FParameterName =  'SF' then
                elmt.Parameters.GetParameter(epSF).ParamDoubleValue := StrToFloat(afieldParameter.FParameterValue)
              else if afieldParameter.FParameterName =  'STA' then
                elmt.Parameters.GetParameter(epSTA).ParamDoubleValue := StrToFloat(afieldParameter.FParameterValue)
              else if afieldParameter.FParameterName =  'TTRANS' then
                elmt.Parameters.GetParameter(epTTRANS).ParamDoubleValue := StrToFloat(afieldParameter.FParameterValue)
              else if afieldParameter.FParameterName =  'TCTRL' then
                elmt.Parameters.GetParameter(epTCTRL).ParamDoubleValue := StrToFloat(afieldParameter.FParameterValue)
              else if afieldParameter.FParameterName = 'TTRO' then
                elmt.Parameters.GetParameter(epTRO).ParamDoubleValue := StrToFloat(afieldParameter.FParameterValue)
              else if afieldParameter.FParameterName = 'offset'then
                elmt.Parameters.GetParameter(epOFFSET).ParamDoubleValue := StrToFloat(afieldParameter.FParameterValue)
              else if afieldParameter.FParameterName = 'SG' then
               elmt.Parameters.GetParameter(epSG).ParamDoubleValue := StrToFloat(afieldParameter.FParameterValue)
              else if afieldParameter.FParameterName = 'Tau' then
               elmt.Parameters.GetParameter(epTAU).ParamDoubleValue := StrToFloat(afieldParameter.FParameterValue)
              else if afieldParameter.FParameterName = 'TOORL' then
               elmt.Parameters.GetParameter(epTOORL).ParamDoubleValue := StrToFloat(afieldParameter.FParameterValue)
              else if afieldParameter.FParameterName = 'TOORH' then
               elmt.Parameters.GetParameter(epTOORH).ParamDoubleValue := StrToFloat(afieldParameter.FParameterValue)
              else if afieldParameter.FParameterName = 'V4' then
                elmt.Parameters.GetParameter(epV4).ParamDoubleValue := StrToFloat(afieldParameter.FParameterValue)
//                elmt.Parameters.GetParameter(epV4).ParamDoubleValue := 4  // min default value
              else if afieldParameter.FParameterName = 'V20' then
                elmt.Parameters.GetParameter(epV20).ParamDoubleValue := StrToFloat(afieldParameter.FParameterValue)
//                elmt.Parameters.GetParameter(epV20).ParamDoubleValue := 20  // max default value
              else if afieldParameter.FParameterName = 'HA' then
               elmt.Parameters.GetParameter(epHA).ParamDoubleValue := StrToFloat(afieldParameter.FParameterValue)
              else if afieldParameter.FParameterName = 'LA' then
               elmt.Parameters.GetParameter(epLA).ParamDoubleValue := StrToFloat(afieldParameter.FParameterValue)
              else if afieldParameter.FParameterName = 'TCDD' then
               elmt.Parameters.GetParameter(epTCDD).ParamDoubleValue := StrToFloat(afieldParameter.FParameterValue)
              else if afieldParameter.FParameterName = 'TDLY' then
               elmt.Parameters.GetParameter(epTDELAY).ParamDoubleValue := StrToFloat(afieldParameter.FParameterValue)
              else if afieldParameter.FParameterName = 'MODE' then
               elmt.Parameters.GetParameter(epMODE).ParamDoubleValue := StrToFloat(afieldParameter.FParameterValue)
              else if afieldParameter.FParameterName =   'NONC' then
               elmt.Parameters.GetParameter(epNONC).ParamDoubleValue := StrToFloat(afieldParameter.FParameterValue)
              else if afieldParameter.FParameterName = 'HHAV' then
                elmt.Parameters.GetParameter(epHHAV).ParamDoubleValue := StrToFloat(afieldParameter.FParameterValue)
              else if afieldParameter.FParameterName =  'XHAV' then
               elmt.Parameters.GetParameter(epXHAV).ParamDoubleValue := StrToFloat(afieldParameter.FParameterValue)
              else if afieldParameter.FParameterName =  'HY' then
               elmt.Parameters.GetParameter(epHY).ParamDoubleValue := StrToFloat(afieldParameter.FParameterValue)
              else if afieldParameter.FParameterName =  'TA' then
               elmt.Parameters.GetParameter(epTA).ParamDoubleValue := StrToFloat(afieldParameter.FParameterValue)
              else if afieldParameter.FParameterName = 'SENOFF' then
               elmt.Parameters.GetParameter(epSENOFF).ParamDoubleValue := StrToFloat(afieldParameter.FParameterValue)
              else if afieldParameter.FParameterName = 'TnkCntMax' then
               elmt.Parameters.GetParameter(epTnkCntMax).ParamDoubleValue := StrToFloat(afieldParameter.FParameterValue);
            end;
          end;
        end;

      end;
    end;
  end;
  FPropulsionAlarmCheck := False;
  FDatabase.Listeners.Remove('ControllerMgrLstr');

end;

destructor TControllerManager.Destroy;
var
  i : integer;
  Controller : TElementController;
begin

  FListeners.Free;

  for I := FControllers.Count - 1 downto 0 do begin
    Controller := TElementController(FControllers.Items[i]);
    Controller.Free;

    FControllers.Delete(i);
  end;

  FLoggedElementTable.Free;
  FControllers.Free;

  inherited;
end;

procedure TControllerManager.ElementPropChange(Sender: TObject;
  PropsID: E_PropsID; Value: Double);
begin
end;

procedure TControllerManager.ERCommand(rCmd: R_Common_PCS_Command);
begin
  NetEvent_PCSElmtCommonCmd(rCmd);


end;

procedure TControllerManager.ERCommand(rCmd: R_Common_PMS_Command);
var
  rec : R_Common_EmergencyStop_Command;
begin
  NetEvent_PMSElmtCommonCmd(rCmd);

  if rCmd.CommandID = epPMSGeneratorEmergencyStop then
  begin
    rec.GenId := rCmd.GenSwitchID;
    rec.CommandID := rCmd.CommandID;
    rec.ValueBool := rCmd.ValueBool;
    CtrlSystem.Network.AsServer.SendData(C_PMS_COMMAND,@rec);
  end;
end;

function TControllerManager.getController(
  ControllerID: string): TElementController;
var
  i : integer;
  Controller : TElementController;
begin
  Result := nil;

  for I := 0 to FControllers.Count - 1 do
  begin
    Controller := TElementController(FControllers.Items[i]);
    if Controller.ControllerID = ControllerID then
    begin

      result := Controller;
      Break;
    end;

  end;
end;

procedure TControllerManager.OnDatabasePropStrChange(Sender: TObject; Props: E_PropsID; Value: String);
var
  Controller : TElementController;
begin

  case Props of
    epQueryControllerIDStr :
    begin
      Controller := TElementController.Create(FDatabase,Value);
      FControllers.Add(Controller);
    end;
  end;

end;

procedure TControllerManager.RunElement(Sender: TObject);
var
  i : integer;
  Controller : TElementController;
begin
  { triggering running time }
  Listeners.TriggerEvents(Self,epScenarioRunningTime, Byte(1));

  for i := 0 to FControllers.Count - 1 do
  begin
    Controller := TElementController(FControllers.Items[i]);
    Controller.RunEverySecond;
  end;
end;

procedure TControllerManager.RunLoggedElement(Sender: TObject);
begin
  { TODO : comment dulu, error : batch queries }
  if FRunningScenario > 0 then
    FLoggedElementTable.SaveFieldsToDB(FRunningScenario,FDatabase,FRunningScenarioTime);
end;

function TControllerManager.getControllers: TStrings;
var
  i : integer;
  Controller : TElementController;
begin

  Result := TStringList.Create;

  for I := 0 to FControllers.Count - 1 do
  begin
    Controller := TElementController(FControllers.Items[i]);
    Result.Add(Controller.ControllerID);
  end;
end;

function TControllerManager.getElement(ElementID: string): TElement;
var
  i : integer;
  Controller : TElementController;
begin

  Result := nil;

  for I := 0 to FControllers.Count - 1 do
  begin
    Controller := TElementController(FControllers.Items[i]);
    result := Controller.getElement(ElementID);

    if Assigned(Result) then
      Break;
  end;

end;

procedure TControllerManager.getElementCondition(
  aElement: TAAEElement;aCondition : TElementCondition);
begin

  with aElement do begin
    aCondition.ValueApplication   := ValueApplication;
    aCondition.StateValid         := Byte(StateValid);
    aCondition.StateWireBreak     := Byte(StateWireBreak);
    aCondition.StateDisplayStationary := Byte(StateDisplayStationary);
    aCondition.StateAlarmInhibited := Byte(StateAlarmInhibited);
  end;

end;

procedure TControllerManager.getElementCondition(
  aElement: TCBAElement;aCondition : TElementCondition);
begin
  with aElement do begin
    aCondition.StateStatus        := Byte(StateStatus);
    aCondition.StateCommandClose  := Byte(StateCommandClose);
    aCondition.StateCommandOpen   := Byte(StateCommandOpen);
    aCondition.StateManualAuto    := Byte(StateManualAuto);
  end;
end;

procedure TControllerManager.getElementCondition(
  aElement: TRHEElement;aCondition : TElementCondition);
begin
  with aElement do begin
    aCondition.CommandReset    := Byte(CommandReset);
    aCondition.EnableCounting  := Byte(EnableCounting);
  end;
end;

procedure TControllerManager.getElementCondition(
  aElement: TMCSElement;aCondition : TElementCondition);
begin
  with aElement do begin
    aCondition.StateSwitchRemote  := Byte(StateSwitchRemote);
    aCondition.StateSwitchRunning := Byte(StateSwitchRunning);
    aCondition.StateSwitchStandby := Byte(StateSwitchStandby);
    aCondition.StateSwitchNoFault := Byte(StateSwitchNoFault);

    aCondition.CommandStandbyApp  := Byte(CommandStandbyApp);
    aCondition.CommandStartApp    := Byte(CommandStartApp);
    aCondition.CommandStopApp     := Byte(CommandStopApp);
    aCondition.CommandStandbyHMI  := Byte(CommandStandbyHMI);

    aCondition.CommandStartHMI    := Byte(CommandStartHMI);
    aCondition.CommandStopHMI     := Byte(CommandStopHMI);
    aCondition.StateBlockOut      := Byte(StateBlockOut);
    aCondition.StateRestart       := Byte(StateRestart);

    aCondition.StateValueValid    := Byte(StateValueValid);
    aCondition.StateManualAuto    := Byte(StateManualAuto);
    aCondition.StateSwitchRFU     := Byte(StateSwitchRFU);
    aCondition.StateRunCondition  := Byte(StateRunCondition);
  end;
end;

procedure TControllerManager.getElementCondition(
  aElement: TSAEElement;aCondition : TElementCondition);
begin
  with aElement do begin
    aCondition.ValueApplication   := ValueApplication;
    aCondition.StateDisplayStationary := Byte(StateDisplayStationary);
    aCondition.StateAlarmInhibited := Byte(StateAlarmInhibited);
    aCondition.StateValueValid    := Byte(StateValueValid);

    aCondition.StateWireBreak   := Byte(StateWireBreak);
    aCondition.StateLA          := Byte(StateLA);
    aCondition.StateHHA         := Byte(StateHHA);
    aCondition.StateHA          := Byte(StateHA);
  end;
end;

procedure TControllerManager.getElementCondition(
  aElement: TSPEElement;aCondition : TElementCondition);
begin
  with aElement do begin
    aCondition.SensorValue   := SensorValue;
    aCondition.CommandEnableDisable := Byte(CommandEnableDisable);
    aCondition.HMISetPoint := HMISetPoint;
  end;
end;

procedure TControllerManager.getElementCondition(
  aElement: TSEEElement;aCondition : TElementCondition);
begin
  with aElement do begin
    aCondition.CommandReset   := Byte(CommandReset);
    aCondition.EventInput     := Byte(EventInput);
    aCondition.StateElementDisabled    := Byte(StateElementDisabled);
  end;
end;

procedure TControllerManager.getElementCondition(
  aElement: TCTRElement;aCondition : TElementCondition);
begin
  with aElement do begin
    aCondition.StateNoFault   := Byte(StateNoFault);
    aCondition.StateNoRFU     := Byte(StateNoRFU);
    aCondition.StateTransition := Byte(StateTransition);
    aCondition.ProcesStatus   := Byte(ProcesStatus);
    aCondition.CommandHMI     := Byte(CommandHMI);
  end;
end;

procedure TControllerManager.getElementCondition(
  aElement: TCBEElement;aCondition : TElementCondition);
begin
  with aElement do begin
    aCondition.StateCommandCloseApp := Byte(StateCommandCloseApp);
    aCondition.StateCommandOpenApp  := Byte(StateCommandOpenApp);
    aCondition.StateCommandCloseHMI := Byte(StateCommandCloseHMI);
    aCondition.StateCommandOpenHMI  := Byte(StateCommandOpenHMI);
    aCondition.StateAlarmInhibited  := Byte(StateAlarmInhibited);
    aCondition.StateManualAuto      := Byte(StateManualAuto);
    aCondition.StateRFC             := Byte(StateRFC);
    aCondition.StateRFO             := Byte(StateRFO);
    aCondition.StateSwitchClosed    := Byte(StateSwitchClosed);
    aCondition.StateSwitchOpen      := Byte(StateSwitchOpen);
    aCondition.StateSwitchRemote    := Byte(StateSwitchRemote);
    aCondition.StateSwitchTripped   := Byte(StateSwitchTripped);
    aCondition.StatePMSSwitchClosedOpen    := Byte(StatePMSSwitchClosedOpen);
    aCondition.StateNoFault         := Byte(StateSwitchNoFault);
  end;
end;

procedure TControllerManager.getElementCondition(
  aElement: TDAEElement;aCondition : TElementCondition);
begin
  with aElement do begin
    aCondition.Command   := Byte(Command);
    aCondition.State     := Byte(State);
    aCondition.StateElementCaption := Byte(StateElementCaption);
  end;
end;

procedure TControllerManager.getElementCondition(
  aElement: TMCEElement;aCondition : TElementCondition);
begin
  with aElement do begin
    aCondition.StateSwitchRemote := Byte(StateSwitchRemote);
    aCondition.StateSwitchRunning  := Byte(StateSwitchRunning);
    aCondition.StateSwitchNoFault := Byte(StateSwitchNoFault);
    aCondition.CommandStartApp  := Byte(CommandStartApp);
    aCondition.CommandStartHMI  := Byte(CommandStartHMI);
    aCondition.CommandStopApp   := Byte(CommandStopApp);
    aCondition.CommandStopHMI   := Byte(CommandStopHMI);
    aCondition.StateManualAuto  := Byte(StateManualAuto);
    aCondition.StateBlockOut    := Byte(StateBlockOut);
    aCondition.StateRestart     := Byte(StateRestart);
    aCondition.StateValueValid  := Byte(StateValueValid);
    aCondition.RunCondition     := Byte(RunCondition);
    aCondition.StateRFU         := Byte(StateRFU);
  end;
end;

procedure TControllerManager.getElementCondition(
  aElement: TMCDElement;aCondition : TElementCondition);
begin
  with aElement do begin
    aCondition.StateSwitchSpeed1  := Byte(StateSwitchSpeed1);
    aCondition.StateSwitchSpeed2 := Byte(StateSwitchSpeed2);
    aCondition.StateSwitchRemote := Byte(StateSwitchRemote);
    aCondition.StateSwitchNoFault := Byte(StateSwitchNoFault);

    aCondition.CommandStartSpeed1App  := Byte(CommandStartSpeed1App);
    aCondition.CommandStartSpeed2App    := Byte(CommandStartSpeed2App);
    aCondition.CommandStopApp     := Byte(CommandStopApp);
    aCondition.CommandStartSpeed1HMI  := Byte(CommandStartSpeed1HMI);

    aCondition.CommandStartSpeed2HMI  := Byte(CommandStartSpeed2HMI);
    aCondition.CommandStopHMI     := Byte(CommandStopHMI);
    aCondition.StateBlockOut      := Byte(StateBlokOut);
    aCondition.StateRestart       := Byte(StateRestart);

    aCondition.StateValueValid    := Byte(StateValueValid);
    aCondition.StateManualAuto    := Byte(StateManualAuto);
    aCondition.RFU                := Byte(RFU);
    aCondition.RunCondition       := Byte(RunCondition);
  end;
end;

procedure TControllerManager.getElementCondition(
  aElement: TSWNElement;aCondition : TElementCondition);
begin
  with aElement do begin
    aCondition.StateAlarmInhibited  := Byte(StateAlarmInhibited);
    aCondition.Mode       := Byte(Mode);
    aCondition.Evaluate   := Byte(Evaluate);
    aCondition.StateSwitch := Byte(StateSwitch);
  end;
end;

procedure TControllerManager.getElementCondition(
  aElement: TSWEElement;aCondition : TElementCondition);
begin
  with aElement do begin
    aCondition.StateAlarmInhibited  := Byte(StateAlarmInhibited);
    aCondition.InState := Byte(StateInState);
    aCondition.Mode := Byte(Mode); {MODE dari element diikutkan Mode spy tidak nambah kolom pd db}
    aCondition.Evaluate := Byte(NONC); {NONC dari element diikutkan NONC spy tidak nambah kolom pd db}
  end;
end;

procedure TControllerManager.getElementCondition(
  aElement: TVCEElement;aCondition : TElementCondition);
begin
  with aElement do begin
    aCondition.StateRFU  := Byte(StateRFU);
    aCondition.StateSwitchRemote := Byte(StateSwitchRemote);
    aCondition.StateSwitchClosed := Byte(StateSwitchClosed);
    aCondition.StateSwitchOpen := Byte(StateSwitchOpen);
    aCondition.CommandClose := Byte(CommandClose);
    aCondition.CommandOpen := Byte(CommandOpen);
    aCondition.StateAutoManual := Byte(StateAutoManual);
    aCondition.DesireState := Byte(DesireState);
  end;
end;

procedure TControllerManager.getElementCondition(
  aElement: TVCPElement;aCondition : TElementCondition);
begin
  with aElement do begin
    aCondition.StateSwitchRemote  := Byte(StateSwitchRemote);
    aCondition.SetPoint := SetPoint;
    aCondition.ValueValve  := ValueValve;
  end;
end;

procedure TControllerManager.getElementCondition(
  aElement: TVCHElement;aCondition : TElementCondition);
begin
  with aElement do begin
    aCondition.StateRFU := Byte(StateRFU);
    aCondition.StateSwitchRemote  := Byte(StateSwitchRemote);
    aCondition.DesireState := Byte(DesireState);
    aCondition.StateSwitchClosed  := Byte(StateSwitchClosed);
    aCondition.StateSwitchOpen  := Byte(StateSwitchOpen);
    aCondition.CommandOpen   := Byte(CommandOpen);
    aCondition.CommandClose   := Byte(CommandClose);
    aCondition.StateAutoManual  := Byte(StateAutoManual);
  end;
end;

procedure TControllerManager.getElementCondition(
  aElement: TSS2Element;aCondition : TElementCondition);
begin
  with aElement do begin
    aCondition.ValueApplication := ValueApplication;
    aCondition.StateAlarmInhibited  := Byte(StateAlarmInhibited);
    aCondition.StateDisplayStationary := Byte(StateDisplayStationary);
    aCondition.StateWireBreak := Byte(StateWireBreak);
  end;
end;

procedure TControllerManager.getElementCondition(
  aElement: TSS1Element;aCondition : TElementCondition);
begin
  with aElement do begin
    aCondition.ValueSensor := ValueSensor;
    aCondition.StateAlarmInhibited  := Byte(StateAlarmInhibited);
    aCondition.StateDisplayStationary := Byte(StateDisplayStationary);
  end;
end;

procedure TControllerManager.getElementCondition(
  aElement: TSSEElement;aCondition : TElementCondition);
begin
  with aElement do begin
    aCondition.ValueSensor := ValueSensor;
    aCondition.StateAlarmInhibited  := Byte(StateInhibited);
    aCondition.StateDisplayStationary := Byte(StateDisplayStationary);
    aCondition.ValueElement  := ValueElement;
  end;
end;

procedure TControllerManager.getElementCondition(
  aElement: TSWBElement;aCondition : TElementCondition);
begin
  with aElement do begin
    aCondition.InState := Byte(InState);
  end;
end;

procedure TControllerManager.getElementCondition(
  aElement: TSSLElement;aCondition : TElementCondition);
begin
  with aElement do begin
    aCondition.StateInhibited := Byte(StateInhibited);
    aCondition.ValueSensor  := ValueSensor;
    aCondition.TrimValue    := TrimValue;
    aCondition.CompensationSensor  := CompensationSensor;
  end;
end;

procedure TControllerManager.getElementConditions(var aList: TList);
var
  elmtCondition : TElementCondition;
  lCtrl, lElmt : TStrings;
  elmCtrl : TElementController;
  elmt : TElement;
  i,j : Integer;
begin
  aList := TList.Create;

  lCtrl := getControllers;
  for I := 0 to lCtrl.Count - 1 do begin
    elmCtrl := getController(lCtrl[i]);

    if Assigned(elmCtrl) then
    begin

      lElmt := elmCtrl.getElements;

      for j := 0 to lElmt.Count - 1 do begin

        elmt := elmCtrl.getElement(lElmt[j]);

        if Assigned(elmt) then
        begin
          elmtCondition := TElementCondition.Create;
          InitConditionElement(elmtCondition);

          elmtCondition.Element_ID := elmt.ElementID;
          elmtCondition.StateElementDisabled := Byte(elmt.StateElementDisabled);

          case elmt.ElementType of
            eltAAE: getElementCondition(TAAEElement(elmt), elmtCondition);
            eltCBA: getElementCondition(TCBAElement(elmt), elmtCondition);
            eltCBE: getElementCondition(TCBEElement(elmt), elmtCondition);
            eltCTR: getElementCondition(TCTRElement(elmt), elmtCondition);
            eltDAE: getElementCondition(TDAEElement(elmt), elmtCondition);
            eltMCD: getElementCondition(TMCDElement(elmt), elmtCondition);
            eltMCE: getElementCondition(TMCEElement(elmt), elmtCondition);
            eltMCS: getElementCondition(TMCSElement(elmt), elmtCondition);
            eltRHE: getElementCondition(TRHEElement(elmt), elmtCondition);
            eltSAE: getElementCondition(TSAEElement(elmt), elmtCondition);
            eltSEE: getElementCondition(TSEEElement(elmt), elmtCondition);
            eltSPE: getElementCondition(TSPEElement(elmt), elmtCondition);
            eltSSE: getElementCondition(TSSEElement(elmt), elmtCondition);
            eltSS1: getElementCondition(TSS1Element(elmt), elmtCondition);
            eltSS2: getElementCondition(TSS2Element(elmt), elmtCondition);
            eltSSL: getElementCondition(TSSLElement(elmt), elmtCondition);
            eltSWB: getElementCondition(TSWBElement(elmt), elmtCondition);
            eltSWE: getElementCondition(TSWEElement(elmt), elmtCondition);
            eltSWN: getElementCondition(TSWNElement(elmt), elmtCondition);
            eltVCE: getElementCondition(TVCEElement(elmt), elmtCondition);
            eltVCH: getElementCondition(TVCHElement(elmt), elmtCondition);
            eltVCP: getElementCondition(TVCPElement(elmt), elmtCondition);
          end;

          aList.Add(elmtCondition);
        end;

      end;
    end;
  end;


end;

procedure TControllerManager.MappingPMSStatetoElement(aElement: TElement;
  KONSTANTA: Integer; aValue: Double);
begin
  case KONSTANTA of
    C_POW_GEN, C_FREQ_GEN, C_CUR_GEN, C_VOLT_GEN, C_COS_GEN,
    C_U_GEN, C_V_GEN, C_W_GEN, C_TRAFO115V, C_TRAFO230V :
    begin
      if aElement.ElementType = eltAAE then
      begin
        TAAEElement(aElement).ValueApplication := aValue;
      end
      else if aElement.ElementType = eltSS1 then
      begin
        TSS1Element(aElement).StateAlarmInhibited  := siInhibited;
        TSS1Element(aElement).StateElementDisabled  := sdEnabled;
        TSS1Element(aElement).ValueSensor := ConvertToValueSensor(aElement,aValue);
      end
      else if aElement.ElementType = eltSSE then
      begin
        TSSEElement(aElement).StateElementDisabled  := sdEnabled;
        TSSEElement(aElement).ValueSensor := ConvertToValueSensor(aElement,aValue);
      end;
    end;
  end;
end;

procedure TControllerManager.MappingPMSStatetoElement(aElement: TElement; KONSTANTA : Integer; aValue: boolean);
begin
  case KONSTANTA of
    C_BTN_START, C_BTN_STOP, C_BTN_AUTO, C_BTN_SEMIAUTO, C_BTN_MANUAL, C_BTN_PREF,
    C_IND_ENGINERUNNING, C_IND_MANSEMAUT, C_IND_PREF,
    C_MTR_GEN,
    C_CBE_GEN,C_CBE_ESB,
    C_CBE_INT, C_CBE_SHR, C_CBNAVNAUT:
    begin
      if aElement.ElementType = eltSWE then
      begin
        if aValue then
        begin
          TSWEElement(aElement).StateInState := True;
          TSWEElement(aElement).NONC := 1; //NC
          TSWEElement(aElement).Mode := 1; // Mode No Alarm
          TSWEElement(aElement).Parameters.GetParameter(epTDELAY).ParamDoubleValue := 0;
          TSWEElement(aElement).StateElementDisabled := sdEnabled;
        end
        else
          TSWEElement(aElement).StateElementDisabled := sdUnavailable;
      end
      else if aElement.ElementType = eltCTR then
      begin
        if aValue then
        begin
          TCTRElement(aElement).StateNoFault := snfNotFault;
          TCTRElement(aElement).StateNoRFU := snrRFU;
          TCTRElement(aElement).StateTransition := stNotInTransition;
          TCTRElement(aElement).ProcesStatus := spsNormal;
        end
        else
        begin
          TCTRElement(aElement).StateNoFault := snfNotFault;
          TCTRElement(aElement).StateNoRFU := snrNotRFU;

        end;
      end
      else if aElement.ElementType = eltDAE then
      begin
        if aValue then
        begin
          TDAEElement(aElement).StateElementDisabled := sdEnabled;
          TDAEElement(aElement).Command := sdEnabled;
        end
        else
        begin
          TDAEElement(aElement).StateElementDisabled := sdDisabled;
          TDAEElement(aElement).Command := sdDisabled;
        end;
      end
      else if aElement.ElementType = eltCBE then
      begin
        TCBEElement(aElement).StateElementDisabled := sdEnabled;
        TCBEElement(aElement).StateSwitchTripped := esNotTripped;
        TCBEElement(aElement).StateSwitchNoFault := esNoFault;

        if (aElement.ElementID =  '3241E50031H') or (aElement.ElementID =  '3241E50031G') or
           (aElement.ElementID =  '3241E50031F') or (aElement.ElementID =  '3243E5005B') or
           (aElement.ElementID =  '3243E5005C')then
        begin
          TCBEElement(aElement).StateRFC := srfReadyForClose;
          TCBEElement(aElement).StateRFO := sroReadyForOpen;
          TCBEElement(aElement).StateSwitchRemote := esLocal;
          if aValue then
          begin
            TCBEElement(aElement).StateSwitchOpen := esNotOpen;
            TCBEElement(aElement).StateSwitchClosed := esClosed;
          end
          else
          begin
            TCBEElement(aElement).StateSwitchClosed := esNotClosed;
            TCBEElement(aElement).StateSwitchOpen := esOpen;
          end;
        end
        else
        begin
          if aValue then
          begin
            TCBEElement(aElement).StateRFC := srfReadyForClose;
            TCBEElement(aElement).StateRFO := sroReadyForOpen;
            TCBEElement(aElement).StateSwitchRemote := esLocal;
            TCBEElement(aElement).StateSwitchClosed := esClosed;
            TCBEElement(aElement).StateSwitchOpen := esNotOpen;
          end
          else
          begin
            TCBEElement(aElement).StateRFC := srfNotReadyForClose
          end;
        end;
      end
      else if aElement.ElementType = eltRHE then
      begin
        if aValue then
        begin
          TRHEElement(aElement).StateElementDisabled  := sdEnabled;
          TRHEElement(aElement).CommandReset  := sacNotActivated;
          TRHEElement(aElement).EnableCounting := secEnabled;
        end
        else
        begin
          TRHEElement(aElement).StateElementDisabled  := sdEnabled;
          TRHEElement(aElement).CommandReset  := sacNotActivated;
          TRHEElement(aElement).EnableCounting := secNotEnabled;
        end;
      end;
    end;
    C_ALRM_NOTSTANDBY, C_ALRM_TRIP, C_ALRM_CANBUS, C_ALRM_CTRLPOW, C_ALRM_POWSUP, C_ALRM_ENGINE, C_ALRM_SHUTDOWN, C_ALRM_FAULTPAGELED,
    C_CBE_GEN_FAILURE :
    begin
      if aElement.ElementType = eltSWE then
      begin
        if aValue then
        begin
          TSWEElement(aElement).Mode := 0;
          TSWEElement(aElement).NONC := 1;
          TSWEElement(aElement).StateAlarmInhibited  := siNotInhibited;
          TSWEElement(aElement).StateElementDisabled := sdEnabled;
        end
        else
          TSWEElement(aElement).StateElementDisabled := sdUnavailable;
      end
      else if aElement.ElementType = eltCBE then
      begin
        TCBEElement(aElement).StateElementDisabled := sdEnabled;

        if aValue then
          TCBEElement(aElement).StateSwitchTripped := esTripped
        else
          TCBEElement(aElement).StateSwitchTripped := esNotTripped;

        TCBEElement(aElement).StateSwitchNoFault := esNoFault;

        if aValue then
        begin
          TCBEElement(aElement).StateRFC := srfReadyForClose;
          TCBEElement(aElement).StateRFO := sroReadyForOpen;
          TCBEElement(aElement).StateSwitchRemote := esLocal;
          TCBEElement(aElement).StateSwitchClosed := esClosed;
          TCBEElement(aElement).StateSwitchOpen := esNotOpen;
        end
        else
        begin
          if aElement.ElementID <> '3241E50031F' then
            TCBEElement(aElement).StateRFC := srfNotReadyForClose
          else
          begin
            TCBEElement(aElement).StateSwitchClosed := esNotClosed;
            TCBEElement(aElement).StateSwitchOpen := esOpen;
          end;
        end;
      end
    end;
  end;
end;

procedure TControllerManager.MappingPMSStatetoElement(aElement : TElement; KONSTANTA : Integer; aValue : Integer);
begin
  case KONSTANTA of
    C_IND_GENSUP:
    begin
      if aElement.ElementType = eltDAE then
      begin
        case aValue of
          1 : TDAEElement(aElement).State := sState1;
          2 : TDAEElement(aElement).State := sState2;
          3 : TDAEElement(aElement).State := sState3;
          4 : TDAEElement(aElement).State := sState4;
          5 : TDAEElement(aElement).State := sState5;
          6 : TDAEElement(aElement).State := sState6;
          7 : TDAEElement(aElement).State := sState7;
          8 : TDAEElement(aElement).State := sState8;
//          9 : sState9   : ;
//          10 : sState10  : ;
//          11 : sState11  : ;
//          12 : sState12  : ;
//          13 : sState13  : ;
//          14 : sState14  : ;
          15 : TDAEElement(aElement).State := sState15;
        end;
        TDAEElement(aElement).AlarmElementStateCalc;
      end;
    end;
  end;
end;

procedure TControllerManager.MappingPCSStateToElement(aElement: TElement;
  Order: E_PropsID; aValue: Boolean);
begin
  case Order of
    epPCSMERemoteAuto, epPCSMERemoteManual, epPCSMERunning,
    epPCSMESafetyShutdown, epPCSMERemoteCtrl, epPCSMELowLoad, epPCSMEVeryLowLoad,
    epPCSMEFsrTimerExpired, epPCSMEMaxFsrKeySwitch, epPCSMEStopIncrease, epPCSMEStopDecrease,
    epPCSMEOverspeed, epPCSMEConRodBearingTempHigh, epPCSMEConRodBearingTempVeryHigh, epPCSMEBearingTempHigh,
    epPCSMEBearingTempVeryHigh, epPCSMEOilMistDetSafety, epPCSMEOilMistDetFailure, epPCSMEOilMistDetAlarm,
    epPCSMEPrelubeInProgress, epPCSMEPrelubeFailure, epPCSMEOilSumpLevel, epPCSMEHeater,
    epPCSMELOPressClogg, epPCSMEPressFOClogg, epPCSMEInjPipeALeakFO,
    epPCSMEInjPipeBLeakFO,
    epPCSCPPRemote,
    epPCSCPPRemoteAuto, epPCSCPPRemoteManual, epPCSCPPPumpStandby1, epPCSCPPPumpStandby2, epPCSCPPPumpAuto3,
    epPCSCPPOilFilterClogged, epPCSCPPPitchNotZero, epPCSCPPHPPOilLevel, epPCSCPPOilLevel, epPCSCPPLocal,
    epPCSGBRemoteAuto, epPCSGBRemoteManual, epPCSGBClutchAllowed, epPCSGBClutchEngaged,
    epPCSGBSWFlowBearing, epPCSGBPumpNotAuto,
    epPCSGBPumpStandbyStart, epPCSGBOilLevel, epPCSGBFilter11, epPCSGBFilter12,
    epPCSGBLOPressInletLow,

    epPCSMEPrimLOPump, epPCSMEPreHeatingPump,
    epPCSCPPPumpStart1, epPCSCPPPumpStart2, epPCSCPPPumpStart3,
    epPCSGBStandbyPump, epPCSGBClutchEngagedVCE,

    epPCSMEAirValve, epPCSMEGasValve, epPCSMEBypassP2P4,

    epPCSCtrlLocal, epPCSCtrlMCR, epPCSCtrlBridge,

    epPCSMERemoteControlProposed, epPCSMEStartingInProgress, epPCSME2TCMode, epPCSGBClutched,
    epPCSGBDeclutched, epPCSGBSafetyDeclutch,

    epPCSMEFanExhSupply, epPCSMEFanSupply1, epPCSMEFanSupply2:
    begin
      if aElement.ElementType = eltSWE then
      begin
        if aValue then
        begin
          TSWEElement(aElement).StateInState := True;
          TSWEElement(aElement).NONC := 1; //NC
          TSWEElement(aElement).Mode := 1; // Mode No Alarm
          TSWEElement(aElement).Parameters.GetParameter(epTDELAY).ParamDoubleValue := 0;
          TSWEElement(aElement).StateElementDisabled := sdEnabled;
//          TSWEElement(aElement).StateElement := seValueOk
        end
        else
          TSWEElement(aElement).StateElementDisabled := sdUnavailable;
//          TSWEElement(aElement).StateElement := seFalse;
      end
      else if aElement.ElementType = eltMCE then
      begin
        if aValue then
        begin
//          TMCEElement(aElement).StateElement := seValueOK;
          TMCEElement(aElement).StateValueValid := svValid;
          TMCEElement(aElement).StateSwitchNoFault := esNoFault;
          TMCEElement(aElement).StateSwitchRemote := esLocal;
          TMCEElement(aElement).StateSwitchRunning := esRunning;
          TMCEElement(aElement).StateElementDisabled := sdEnabled;
        end
        else
        begin
          TMCEElement(aElement).StateValueValid := svValid;
          TMCEElement(aElement).StateSwitchNoFault := esNoFault;
          TMCEElement(aElement).StateSwitchRemote := esLocal;
          TMCEElement(aElement).StateSwitchRunning := esNotRunning;
          TMCEElement(aElement).StateElementDisabled := sdEnabled;
        end
      end
      else if aElement.ElementType = eltMCD then
      begin
        if aValue then
        begin
          TMCDElement(aElement).StateValueValid := svValid;
          TMCDElement(aElement).StateSwitchNoFault := esNoFault;
          TMCDElement(aElement).StateSwitchRemote := esLocal;
          TMCDElement(aElement).StateSwitchSpeed2 := esNotSpeed2;
          TMCDElement(aElement).StateSwitchSpeed1 := esSpeed1;
          TMCDElement(aElement).StateElementDisabled := sdEnabled;
        end
        else
        begin
          TMCDElement(aElement).StateValueValid := svValid;
          TMCDElement(aElement).StateSwitchNoFault := esNoFault;
          TMCDElement(aElement).StateSwitchRemote := esLocal;
          TMCDElement(aElement).StateSwitchSpeed2 := esNotSpeed2;
          TMCDElement(aElement).StateSwitchSpeed1 := esNotSpeed1;
          TMCDElement(aElement).StateElementDisabled := sdEnabled;
        end;
      end
      else if aElement.ElementType = eltVCE then
      begin
        if aValue then
        begin
          TVCEElement(aElement).StateElementDisabled := sdEnabled;
          TVCEElement(aElement).StateRFU := snrRFU;
          TVCEElement(aElement).StateSwitchRemote := esLocal;
          TVCEElement(aElement).StateSwitchClosed := esNotClosed;
          TVCEElement(aElement).StateSwitchOpen := esOpen;
          TVCEElement(aElement).AlarmElementStateCalc;
        end
        else
        begin
//          TVCEElement(aElement).StateElementDisabled := sdDisabled;
          TVCEElement(aElement).StateElementDisabled := sdEnabled;
          TVCEElement(aElement).StateRFU := snrRFU;
          TVCEElement(aElement).StateSwitchRemote := esLocal;
          TVCEElement(aElement).StateSwitchClosed := esClosed;
          TVCEElement(aElement).StateSwitchOpen := esNotOpen;
        end;

      end

    end;

    //Alarm Propulsion
    epPCSMERemoteStartInterlock, epPCSMETurningGearEngaged, epPCSMEManHandleAtStop, epPCSMEFuelRackAtStop,
    epPCSMEClutched, epPCSMEStartingFault, epPCSMESlowTurningFault, epPCSMESTCSequenceFail, epPCSMESafetyStopSysFail,
    epPCSMESafetyStop, epPCSMEPrelubricationFailure, epPCSMEPrelubInProgress, epPCSMESafetyStopsOverriden,
    epPCSMELOPressVeryLow, epPCSMEOverspeedAlarm,
    epPCSMELOPressureVeryLow, epPCSMEBearTempVeryHigh, epPCSMEFwHtExpTkLevelVeryLow, epPCSMEFwTempVeryHigh,
    epPCSMEConRodBearTempVeryHigh, epPCSMERedGearSafetyStop, epPCSMEOilMistDetHigh, epPCSMEEmergencyShutdown,
    epPCSMELocalEmergencyStop, epPCSMEEngInletLubOilVeryHigh, epPCSMEEngineControllerWatchdog, epPCSMECtrlPowerSupplyOn,
    epPCSMESafetyPowerSuppOn, epPCSMESTCSequenceAlarm, epPCSMEGovernorMinorFail, epPCSMESTCInManualMode, epPCSMELocalCtrlFail,
    epPCSMEClutchFail, epPCSMEDeclutchFail, epPCSMECommFailEC_PLC, epPCSMEPLCMonitoringFail, epPCSMEClutchFailure,
    epPCSMEBridgeLeverOORFailure, epPCSMEMCRLeverOORFailure, epPCSMEGeneralSensorFailure, epPCSMETrailAlarm,
    epPCSMEResetSafetyStopPossible,

    epPCSCPPFailure, epPCSCPPCLSControl, epPCSCPPBackupSupplyFail, epPCSCPPFollowUpError,

    epPCSGBPitchNotZero, epPCSGBPCSClutchInterlock, epPCSGBClutchAllowedLOP, epPCSGBShaftLocked:
    begin
      if aElement.ElementType = eltSWE then
      begin
        if aValue then
        begin
          TSWEElement(aElement).StateInState := True;
          TSWEElement(aElement).StateAlarmInhibited := siNotInhibited;
          TSWEElement(aElement).NONC := 0; //NO
          TSWEElement(aElement).Mode := 0; // Mode Alarm
          TSWEElement(aElement).Parameters.GetParameter(epTDELAY).ParamDoubleValue := 0;
          TSWEElement(aElement).StateElementDisabled := sdEnabled;

//          TSWEElement(aElement).StateElement := seValueOK
        end
        else
        begin
          TSWEElement(aElement).StateElementDisabled := sdUnavailable;

//          TSWEElement(aElement).StateElement := seFalse;
        end;

      end
    end;

  end;
end;

procedure TControllerManager.MappingPCSStateToElement(aElement: TElement; Order: E_PropsID;
  aValue: Integer);
begin
  case Order of
    epPCSMERunningHour, epPCSMELOPumpHour, epPCSCPPHydraulicPumpHour1,
    epPCSCPPHydraulicPumpHour2, epPCSCPPHydraulicPumpHour3, epPCSGBLOPumpHour,
    epPCSMEFanExhSupplyHour , epPCSMEFanSupply1Hour, epPCSMEFanSupply2Hour:
    begin
      if aElement.ElementType = eltRHE then
      begin
        if aValue = 0 then
        begin
          TRHEElement(aElement).StateElementDisabled := sdEnabled;
          TRHEElement(aElement).EnableCounting       := secNotEnabled;
          TRHEElement(aElement).CommandReset         := sacNotActivated;
        end
        else
        if aValue = 1 then
        begin
          TRHEElement(aElement).StateElementDisabled := sdEnabled;
          TRHEElement(aElement).EnableCounting       := secEnabled;
          TRHEElement(aElement).CommandReset         := sacNotActivated;
        end;
      end;
    end;
  end;
end;

procedure TControllerManager.MappingPCSStateToElement(aElement: TElement; Order: E_PropsID;
  aValue: Double);
begin
  case Order of
    epPCSMEDelayActualSpeed, epPCSMEFuelRack, epPCSMEFuelMargin,
    epPCSCPPDelayActualPitch, epPCSCPPServoOil, epPCSCPPStaticHub, epPCSCPPHydrOil,
    epPCSGBDelayShaftSpeed, epPCSGBPLB1, epPCSGBPLB2, epPCSGBThrAH, epPCSGBTHrAS,
    epPCSGBCtrlOilPressIn, epPCSGBCtrlOilPressOut, epPCSGBLOPressInlet, epPCSGBLOTempInlet,
    epPCSGBShaftTemp,
    epRudderValuePS, epRudderValueSB:
    begin
      if aElement.ElementType = eltSSE then
      begin
//        TSS1Element(aElement).StateAlarmInhibited  := siInhibited;
//        TSS1Element(aElement).StateElementDisabled  := sdEnabled;
        TSSEElement(aElement).ValueSensor := ConvertToValueSensor(aElement,aValue);
      end;
    end;

    epPCSMELeverSpeed, epPCSMESetPointSpeed, epPCSMESpeed, epPCSMETCLOPressInlet,
    epPCSMEPressAirInlet, epPCSMETurboChargerSpeedA, epPCSMETurboChargerSpeedB, epPCSMETCOutlLOTempA,
    epPCSMETCOutlLOTempB, epPCSMETempTCInletA, epPCSMETempTCInletB, epPCSMETempTCOutletA,
    epPCSMETempTCOutletB, epPCSMETempSuperChargAir,  epPCSMETempFWHTOutlet, epPCSMETempFWHTInlet,
    epPCSMELOTempInlet, epPCSMEAlarmPropulsionCheck,
    epPCSMEAvgTempA, epPCSMEAvgTempB, epPCSMECompProbA, epPCSMECompProbB,
    epPCSMETempExhCylA1, epPCSMETempExhCylA2, epPCSMETempExhCylA3, epPCSMETempExhCylA4, epPCSMETempExhCylA5,
    epPCSMETempExhCylA6, epPCSMETempExhCylA7, epPCSMETempExhCylA8, epPCSMETempExhCylA9, epPCSMETempExhCylA10,
    epPCSMETempExhCylB1, epPCSMETempExhCylB2, epPCSMETempExhCylB3, epPCSMETempExhCylB4, epPCSMETempExhCylB5,
    epPCSMETempExhCylB6, epPCSMETempExhCylB7, epPCSMETempExhCylB8, epPCSMETempExhCylB9, epPCSMETempExhCylB10,
    epPCSMEDevTempExhCylA1, epPCSMEDevTempExhCylA2, epPCSMEDevTempExhCylA3, epPCSMEDevTempExhCylA4, epPCSMEDevTempExhCylA5,
    epPCSMEDevTempExhCylA6, epPCSMEDevTempExhCylA7, epPCSMEDevTempExhCylA8, epPCSMEDevTempExhCylA9, epPCSMEDevTempExhCylA10,
    epPCSMEDevTempExhCylB1, epPCSMEDevTempExhCylB2, epPCSMEDevTempExhCylB3, epPCSMEDevTempExhCylB4, epPCSMEDevTempExhCylB5,
    epPCSMEDevTempExhCylB6, epPCSMEDevTempExhCylB7, epPCSMEDevTempExhCylB8, epPCSMEDevTempExhCylB9, epPCSMEDevTempExhCylB10,
    epPCSMETempConRodBear1, epPCSMETempConRodBear2, epPCSMETempConRodBear3, epPCSMETempConRodBear4, epPCSMETempConRodBear5,
    epPCSMETempConRodBear6, epPCSMETempConRodBear7, epPCSMETempConRodBear8, epPCSMETempConRodBear9, epPCSMETempConRodBear10,
    epPCSMETempBear1, epPCSMETempBear2, epPCSMETempBear3, epPCSMETempBear4, epPCSMETempBear5,
    epPCSMETempBear6, epPCSMETempBear7, epPCSMETempBear8, epPCSMETempBear9, epPCSMETempBear10, epPCSMETempBear11,
    epPCSCPPLeverPitch,  epPCSCPPSetPointPitch:
    begin
      if Order = epPCSMEAlarmPropulsionCheck then
      begin
        if aValue = 1 then
          FPropulsionAlarmCheck := True
        else
          FPropulsionAlarmCheck := False;
      end;

      if aElement.ElementType = eltAAE then
      begin
        TAAEElement(aElement).StateElementDisabled := sdEnabled;
        TAAEElement(aElement).StateValid := svValid;
        TAAEElement(aElement).ValueApplication := aValue;
//        TAAEElement(aElement).StateAlarmInhibited := siNotInhibited
        if FPropulsionAlarmCheck then
          TAAEElement(aElement).StateAlarmInhibited := siNotInhibited
        else
          TAAEElement(aElement).StateAlarmInhibited := siInhibited;
      end;
    end;

    epPCSMEStartingAir, epPCSMEControlAir, epPCSMETCAirSeal, epPCSMEPressFOInlet,
    epPCSMEPressFWHTInlet, epPCSMEPressSeaWaterOutlet, epPCSMELOPressInlet:
    begin
      if aElement.ElementType = eltSAE then
      begin
        TSAEElement(aElement).StateElementDisabled := sdEnabled;
        TSAEElement(aElement).StateValueValid := svValid;
        TSAEElement(aElement).StateAlarmInhibited := siInhibited;
        TSAEElement(aElement).StateLA := slaLowAlarm;
        TSAEElement(aElement).ValueApplication := aValue;
      end;
    end;
  end;
end;

//procedure TControllerManager.NetEvent_PCSElmtCommonCmd(apRec: PAnsiChar;
//  aSize: Word);
procedure TControllerManager.NetEvent_PCSElmtCommonCmd(rCmd : R_Common_PCS_Command);
var
  recCmd : R_Common_PCS_Command;
begin
//  recCmd := @apRec^;
  recCmd.PortStaboardID := rCmd.PortStaboardID;
  recCmd.CommandID := rCmd.CommandID;
  recCmd.CommandPropsID := rCmd.CommandPropsID;
  recCmd.Number := rCmd.Number;
  recCmd.ValueDouble := rCmd.ValueDouble;
  recCmd.ValueInt := rCmd.ValueInt;
  recCmd.ValueBool := rCmd.ValueBool;

  case recCmd.CommandPropsID of
    epPCSMERemoteAuto, epPCSMERemoteManual, epPCSMERunning,
    epPCSMESafetyShutdown, epPCSMERemoteCtrl, epPCSMELowLoad, epPCSMEVeryLowLoad,
    epPCSMEFsrTimerExpired, epPCSMEMaxFsrKeySwitch, epPCSMEStopIncrease, epPCSMEStopDecrease,
    epPCSMEOverspeed, epPCSMEConRodBearingTempHigh, epPCSMEConRodBearingTempVeryHigh, epPCSMEBearingTempHigh,
    epPCSMEBearingTempVeryHigh, epPCSMEOilMistDetSafety, epPCSMEOilMistDetFailure, epPCSMEOilMistDetAlarm,
    epPCSMEPrelubeInProgress, epPCSMEPrelubeFailure, epPCSMEOilSumpLevel, epPCSMEHeater,
    epPCSMELOPressVeryLow, epPCSMELOPressClogg, epPCSMEPressFOClogg, epPCSMEInjPipeALeakFO,
    epPCSMEInjPipeBLeakFO,

    epPCSMERemoteStartInterlock, epPCSMETurningGearEngaged, epPCSMEManHandleAtStop, epPCSMEFuelRackAtStop,
    epPCSMEClutched, epPCSMEStartingFault, epPCSMESlowTurningFault, epPCSMESTCSequenceFail, epPCSMESafetyStopSysFail,
    epPCSMESafetyStop, epPCSMEPrelubricationFailure, epPCSMEPrelubInProgress, epPCSMESafetyStopsOverriden, epPCSMEOverspeedAlarm,
    epPCSMELOPressureVeryLow, epPCSMEBearTempVeryHigh, epPCSMEFwHtExpTkLevelVeryLow, epPCSMEFwTempVeryHigh,
    epPCSMEConRodBearTempVeryHigh, epPCSMERedGearSafetyStop, epPCSMEOilMistDetHigh, epPCSMEEmergencyShutdown,
    epPCSMELocalEmergencyStop, epPCSMEEngInletLubOilVeryHigh, epPCSMEEngineControllerWatchdog, epPCSMECtrlPowerSupplyOn,
    epPCSMESafetyPowerSuppOn, epPCSMESTCSequenceAlarm, epPCSMEGovernorMinorFail, epPCSMESTCInManualMode, epPCSMELocalCtrlFail,
    epPCSMEClutchFail, epPCSMEDeclutchFail, epPCSMECommFailEC_PLC, epPCSMEPLCMonitoringFail, epPCSMEClutchFailure,
    epPCSMEBridgeLeverOORFailure, epPCSMEMCRLeverOORFailure, epPCSMEGeneralSensorFailure, epPCSMETrailAlarm,
    epPCSMEResetSafetyStopPossible,

    epPCSCPPRemote, epPCSCPPRemoteAuto, epPCSCPPRemoteManual, epPCSCPPPumpStandby1, epPCSCPPPumpStandby2, epPCSCPPPumpAuto3,
    epPCSCPPOilFilterClogged, epPCSCPPPitchNotZero, epPCSCPPCLSControl, epPCSCPPBackupSupplyFail,
    epPCSCPPFollowUpError, epPCSCPPHPPOilLevel, epPCSCPPOilLevel, epPCSCPPLocal,
    epPCSGBRemoteAuto, epPCSGBRemoteManual, epPCSGBClutchAllowed, epPCSGBClutchEngaged,
    epPCSGBShaftLocked, epPCSGBSWFlowBearing, epPCSGBPumpNotAuto,
    epPCSGBPumpStandbyStart, epPCSGBOilLevel, epPCSGBFilter11, epPCSGBFilter12,
    epPCSGBLOPressInletLow,
    epPCSGBPitchNotZero, epPCSGBPCSClutchInterlock, epPCSGBClutchAllowedLOP,

    epPCSCtrlLocal, epPCSCtrlMCR, epPCSCtrlBridge,

    epPCSMERemoteControlProposed, epPCSMEStartingInProgress, epPCSME2TCMode, epPCSGBClutched,
    epPCSGBDeclutched, epPCSGBSafetyDeclutch:
    begin
      setPCSSWEElementID(recCmd.PortStaboardID, recCmd.ValueBool, recCmd.CommandPropsID);
    end;

    epPCSMEDelayActualSpeed, epPCSMEFuelRack, epPCSMEFuelMargin,
    epPCSCPPDelayActualPitch, epPCSCPPServoOil, epPCSCPPStaticHub, epPCSCPPHydrOil,
    epPCSGBDelayShaftSpeed, epPCSGBPLB1, epPCSGBPLB2, epPCSGBThrAH, epPCSGBTHrAS,
    epPCSGBCtrlOilPressIn, epPCSGBCtrlOilPressOut, epPCSGBLOPressInlet, epPCSGBLOTempInlet,
    epPCSGBShaftTemp,
    epRudderValuePS, epRudderValueSB:
    begin
      setPCSSSEElementID(recCmd.PortStaboardID, recCmd.ValueDouble, recCmd.CommandPropsID);
    end;

    epPCSMELeverSpeed, epPCSMESetPointSpeed, epPCSMESpeed, epPCSMETCLOPressInlet,
    epPCSMEPressAirInlet, epPCSMETurboChargerSpeedA, epPCSMETurboChargerSpeedB, epPCSMETCOutlLOTempA,
    epPCSMETCOutlLOTempB, epPCSMETempTCInletA, epPCSMETempTCInletB, epPCSMETempTCOutletA,
    epPCSMETempTCOutletB, epPCSMETempSuperChargAir,  epPCSMETempFWHTOutlet, epPCSMETempFWHTInlet,
    epPCSMELOTempInlet, epPCSMEAlarmPropulsionCheck,
    epPCSMEAvgTempA, epPCSMEAvgTempB, epPCSMECompProbA, epPCSMECompProbB,
    epPCSMETempExhCylA1, epPCSMETempExhCylA2, epPCSMETempExhCylA3, epPCSMETempExhCylA4, epPCSMETempExhCylA5,
    epPCSMETempExhCylA6, epPCSMETempExhCylA7, epPCSMETempExhCylA8, epPCSMETempExhCylA9, epPCSMETempExhCylA10,
    epPCSMETempExhCylB1, epPCSMETempExhCylB2, epPCSMETempExhCylB3, epPCSMETempExhCylB4, epPCSMETempExhCylB5,
    epPCSMETempExhCylB6, epPCSMETempExhCylB7, epPCSMETempExhCylB8, epPCSMETempExhCylB9, epPCSMETempExhCylB10,
    epPCSMEDevTempExhCylA1, epPCSMEDevTempExhCylA2, epPCSMEDevTempExhCylA3, epPCSMEDevTempExhCylA4, epPCSMEDevTempExhCylA5,
    epPCSMEDevTempExhCylA6, epPCSMEDevTempExhCylA7, epPCSMEDevTempExhCylA8, epPCSMEDevTempExhCylA9, epPCSMEDevTempExhCylA10,
    epPCSMEDevTempExhCylB1, epPCSMEDevTempExhCylB2, epPCSMEDevTempExhCylB3, epPCSMEDevTempExhCylB4, epPCSMEDevTempExhCylB5,
    epPCSMEDevTempExhCylB6, epPCSMEDevTempExhCylB7, epPCSMEDevTempExhCylB8, epPCSMEDevTempExhCylB9, epPCSMEDevTempExhCylB10,
    epPCSMETempConRodBear1, epPCSMETempConRodBear2, epPCSMETempConRodBear3, epPCSMETempConRodBear4, epPCSMETempConRodBear5,
    epPCSMETempConRodBear6, epPCSMETempConRodBear7, epPCSMETempConRodBear8, epPCSMETempConRodBear9, epPCSMETempConRodBear10,
    epPCSMETempBear1, epPCSMETempBear2, epPCSMETempBear3, epPCSMETempBear4, epPCSMETempBear5,
    epPCSMETempBear6, epPCSMETempBear7, epPCSMETempBear8, epPCSMETempBear9, epPCSMETempBear10, epPCSMETempBear11,
    epPCSCPPLeverPitch,  epPCSCPPSetPointPitch:
    begin
      setPCSAAEElementID(recCmd.PortStaboardID, recCmd.ValueDouble, recCmd.CommandPropsID);
    end;

    epPCSMERunningHour, epPCSMELOPumpHour,
    epPCSCPPHydraulicPumpHour1, epPCSCPPHydraulicPumpHour2, epPCSCPPHydraulicPumpHour3,
    epPCSGBLOPumpHour, epPCSMEFanExhSupplyHour, epPCSMEFanSupply1Hour, epPCSMEFanSupply2Hour:
    begin
      setPCSRHEElementID(recCmd.PortStaboardID, recCmd.ValueInt, recCmd.CommandPropsID);
    end;

    epPCSMEPrimLOPump, epPCSMEPreHeatingPump,
    epPCSCPPPumpStart1, epPCSCPPPumpStart2, epPCSCPPPumpStart3,
    epPCSGBStandbyPump,
    epPCSMEFanSupply1:
    begin
      setPCSMCEElementID(recCmd.PortStaboardID, recCmd.ValueBool, recCmd.CommandPropsID);
    end;

    epPCSMEFanExhSupply, epPCSMEFanSupply2:
    begin
      setPCSMCDElementID(recCmd.PortStaboardID, recCmd.ValueBool, recCmd.CommandPropsID);
    end;

    epPCSMEStartingAir, epPCSMEControlAir, epPCSMETCAirSeal, epPCSMEPressFOInlet,
    epPCSMEPressFWHTInlet, epPCSMEPressSeaWaterOutlet, epPCSMELOPressInlet:
    begin
      setPCSSAEElementID(recCmd.PortStaboardID, recCmd.ValueDouble, recCmd.CommandPropsID);
    end;

    epPCSMEAirValve, epPCSMEGasValve, epPCSMEBypassP2P4, epPCSGBClutchEngagedVCE:
    begin
      setPCSVCEElementID(reccmd.PortStaboardID, recCmd.ValueBool, recCmd.CommandPropsID);
    end;

  end;
end;

procedure TControllerManager.NetEvent_PMSElmtCommonCmd(rCmd : R_Common_PMS_Command);
var
  rec       : R_Common_PMS_Command;
begin
  rec.GenSwitchID := rCmd.GenSwitchID;
  rec.CommandID := rCmd.CommandID;
  rec.ValueDob := rCmd.ValueDob;
  rec.ValueInt := rCmd.ValueInt;
  rec.ValueBool := rCmd.ValueBool;
  rec.ValueKind := rCmd.ValueKind;

  if rec.ValueKind = 'boolean' then
  begin
    case rec.CommandID of
      epPMSGeneratorRunHour :
        setPMSRHEElementID(rec.GenSwitchID, rec.ValueBool, C_IND_ENGINERUNNING);

      epPMSGeneratorEngineRun :
      begin
        setPMSSWEElementID(rec.GenSwitchID, rec.ValueBool, C_IND_ENGINERUNNING);
        setPMSMTRElementID(rec.GenSwitchID, rec.ValueBool, C_MTR_GEN);
      end;
      epPMSGeneratorCBClosed :
        setPMSCBEElementID(rec.GenSwitchID, rec.ValueBool, C_CBE_GEN);

      epPMSGeneratorPreference :
        setPMSSWEElementID(rec.GenSwitchID, rec.ValueBool, C_IND_PREF);

      epPMSEsbCBIntr :
      begin
        if rec.ValueInt = 4 then
          setPMSCBEEmergency(rec.ValueBool, C_CBE_ESB)
        else
          setPMSCBEElementIDInt(rec.GenSwitchID, rec.ValueInt, rec.ValueBool, C_CBE_ESB);
      end;

      epPMSMsbCBShore:
      begin

      end;

      epPMSMsbCBNavNaut:
        setPMSCBEElementID(rec.GenSwitchID, rec.ValueBool, C_CBNAVNAUT);

      epPMSMsbCBIntr:
        setPMSCBEElementID(rec.GenSwitchID, rec.ValueBool, C_CBE_INT);

      epPMSNotStandby :
        setPMSSWEElementID(rec.GenSwitchID, rec.ValueBool, C_ALRM_NOTSTANDBY);

      epPMSCanBusFailure :
        setPMSSWEElementID(rec.GenSwitchID, rec.ValueBool, C_ALRM_CANBUS);

      epPMSMeasPowFailure :
        setPMSSWEElementID(rec.GenSwitchID, rec.ValueBool, C_ALRM_CTRLPOW);

      epPMSDCPowFailure :
        setPMSSWEElementID(rec.GenSwitchID, rec.ValueBool, C_ALRM_POWSUP);

      epPMSEngineAlarm :
        setPMSSWEElementID(rec.GenSwitchID, rec.ValueBool, C_ALRM_ENGINE);

      epPMSShutdown :
        setPMSSWEElementID(rec.GenSwitchID, rec.ValueBool, C_ALRM_SHUTDOWN);

      epPMSFaultPageLed :
        setPMSSWEElementID(rec.GenSwitchID, rec.ValueBool, C_ALRM_FAULTPAGELED);

      epPMSFailureCBClosed:
        setPMSCBEElementID(rec.GenSwitchID, rec.ValueBool, C_CBE_GEN_FAILURE);

      epPMSMsbTripReduct:
        setPMSSWEElementID(rec.GenSwitchID, rec.ValueBool, C_ALRM_TRIP);
    end;
  end
  else if rec.ValueKind = 'integer' then
  begin
    case rec.CommandID of
      epPMSGeneratorMode      : setPMSGenMode(rec.GenSwitchID, rec.ValueInt, C_IND_MANSEMAUT);
      epPMSGeneratorState     : setPMSSWEElementIDInt(rec.GenSwitchID, rec.ValueInt, C_IND_GENSUP);
    end;
  end
  else if rec.ValueKind = 'double' then
  begin
    case rec.CommandID of
      epPMSPower      : setPMSAAEElementID(rec.GenSwitchID, rec.ValueDob, C_POW_GEN);
      epPMSFrequency  : setPMSAAEElementID(rec.GenSwitchID, rec.ValueDob, C_FREQ_GEN);
      epPMSCurrent    : setPMSAAEElementID(rec.GenSwitchID, rec.ValueDob, C_CUR_GEN);
      epPMSCosPhi     : setPMSAAEElementID(rec.GenSwitchID, rec.ValueDob, C_COS_GEN);
      epPMSVoltage    : setPMSAAEElementID(rec.GenSwitchID, rec.ValueDob, C_VOLT_GEN);
      epPMSU          : setPMSAAEElementID(rec.GenSwitchID, rec.ValueDob, C_U_GEN);
      epPMSV          : setPMSAAEElementID(rec.GenSwitchID, rec.ValueDob, C_V_GEN);
      epPMSW          : setPMSAAEElementID(rec.GenSwitchID, rec.ValueDob, C_W_GEN);
      epPMSTrafo115Volt : setPMSSSEElementID(rec.GenSwitchID, rec.ValueDob, C_TRAFO115V);
      epPMSTrafo230Volt : setPMSSSEElementID(rec.GenSwitchID, rec.ValueDob, C_TRAFO230V);
    end;
  end;
end;

procedure TControllerManager.setPMSGenMode(GenSwitchID: string; ValueInt : Integer; konstanta: Integer);
var
  I         : Integer;
  ElementID : string;
  elmnt     : TElement;
begin
  for I := 1 to 3 do
  begin
    if SearchPMSElementID.getGenModeElementID(GenSwitchID, I, ElementID) then
    begin
      elmnt := getElement(ElementID);
      if ValueInt = 4 then
        ValueInt := 2;

      if Assigned(elmnt) then
        MappingPMSStatetoElement(elmnt,konstanta,(i = ValueInt));
    end;
  end;

  case ValueInt of
    1 : begin
      setPMSCTRElementID(GenSwitchID, False, C_BTN_START);
      setPMSCTRElementID(GenSwitchID, False, C_BTN_STOP);
      setPMSCTRElementID(GenSwitchID, False, C_BTN_AUTO);
      setPMSCTRElementID(GenSwitchID, False, C_BTN_SEMIAUTO);
      setPMSCTRElementID(GenSwitchID, False, C_BTN_PREF);
    end;
    2 : begin
      setPMSCTRElementID(GenSwitchID, True, C_BTN_START);
      setPMSCTRElementID(GenSwitchID, True, C_BTN_STOP);
      setPMSCTRElementID(GenSwitchID, True, C_BTN_AUTO);
      setPMSCTRElementID(GenSwitchID, True, C_BTN_SEMIAUTO);
      setPMSCTRElementID(GenSwitchID, False, C_BTN_PREF);
    end;
    3 : begin
      setPMSCTRElementID(GenSwitchID, False, C_BTN_START);
      setPMSCTRElementID(GenSwitchID, False, C_BTN_STOP);
      setPMSCTRElementID(GenSwitchID, True, C_BTN_AUTO);
      setPMSCTRElementID(GenSwitchID, True, C_BTN_SEMIAUTO);
      setPMSCTRElementID(GenSwitchID, True, C_BTN_PREF);
    end;
  end;
end;

procedure TControllerManager.setPMSMTRElementID(aGenSwitchID: string; aValue: Boolean; konstanta: Integer);
var
  ElementID : string;
  elmnt     : TElement;
begin
  if SearchPMSElementID.getMTRElementID(aGenSwitchID, ElementID, konstanta) then
  begin
    elmnt := getElement(ElementID);

    if Assigned(elmnt) then
      MappingPMSStatetoElement(elmnt,konstanta, aValue);
  end;
end;

procedure TControllerManager.setPMSRHEElementID(aGenSwitchID: string;
  aValue: Boolean; konstanta: Integer);
var
  ElementID : string;
  elmnt     : TElement;
begin
  if SearchPMSElementID.getRHEElementID(aGenSwitchID, ElementID, konstanta) then
  begin
    elmnt := getElement(ElementID);

    if Assigned(elmnt) then
      MappingPMSStatetoElement(elmnt,konstanta, aValue);
  end;
end;

procedure TControllerManager.setElementCondition(aElement: TMCSElement;
  aCondition: TElementCondition);
begin
  with aElement do begin
    StateSwitchRemote  := E_ExtStatus(aCondition.StateSwitchRemote);
    StateSwitchRunning := E_ExtStatus(aCondition.StateSwitchRunning);
    StateSwitchStandby := E_ExtStatus(aCondition.StateSwitchStandby);
    StateSwitchNoFault := E_ExtStatus(aCondition.StateSwitchNoFault);

    CommandStandbyApp  := E_StateActivated(aCondition.CommandStandbyApp);
    CommandStartApp    := E_StateActivated(aCondition.CommandStartApp);
    CommandStopApp     := E_StateActivated(aCondition.CommandStopApp);
    CommandStandbyHMI  := E_StateActivated(aCondition.CommandStandbyHMI);

    CommandStartHMI    := E_StateActivated(aCondition.CommandStartHMI);
    CommandStopHMI     := E_StateActivated(aCondition.CommandStopHMI);
    StateBlockOut      := E_StateActivated(aCondition.StateBlockOut);
    StateRestart       := E_StateActivated(aCondition.StateRestart);

    StateValueValid    := E_StateValid(aCondition.StateValueValid);
    StateManualAuto    := E_StateManualAuto(aCondition.StateManualAuto);
    StateSwitchRFU     := E_StateNotRFU(aCondition.StateSwitchRFU);
    StateRunCondition  := E_StateRunCondition(aCondition.StateRunCondition);
  end;
end;

procedure TControllerManager.setElementCondition(aElement: TMCEElement;
  aCondition: TElementCondition);
begin
  with aElement do begin
    StateSwitchRemote := E_ExtStatus(aCondition.StateSwitchRemote);
    StateSwitchRunning  := E_ExtStatus(aCondition.StateSwitchRunning);
    StateSwitchNoFault := E_ExtStatus(aCondition.StateSwitchNoFault);
    CommandStartApp  := E_StateActivated(aCondition.CommandStartApp);
    CommandStartHMI  := E_StateActivated(aCondition.CommandStartHMI);
    CommandStopApp   := E_StateActivated(aCondition.CommandStopApp);
    CommandStopHMI   := E_StateActivated(aCondition.CommandStopHMI);
    StateManualAuto  := E_StateManualAuto(aCondition.StateManualAuto);
    StateBlockOut    := E_StateActivated(aCondition.StateBlockOut);
    StateRestart     := E_StateActivated(aCondition.StateRestart);
    StateValueValid  := E_StateValid(aCondition.StateValueValid);
    RunCondition     := E_StateRunCondition(aCondition.RunCondition);
    StateRFU         := E_StateNotRFU(aCondition.StateRFU);
  end;
end;

procedure TControllerManager.setElementCondition(aElement: TRHEElement;
  aCondition: TElementCondition);
begin
  with aElement do begin
    CommandReset    := E_StateActivated(aCondition.CommandReset);
    EnableCounting  := E_StateEnableCount(aCondition.EnableCounting);
  end;
end;

procedure TControllerManager.setElementCondition(aElement: TSEEElement;
  aCondition: TElementCondition);
begin
  with aElement do begin
    CommandReset   := E_StateActivated(aCondition.CommandReset);
    EventInput     := E_StateActivated(aCondition.EventInput);
    StateElementDisabled    := E_StateDisabled(aCondition.StateElementDisabled);
  end;
end;

procedure TControllerManager.setElementCondition(aElement: TSAEElement;
  aCondition: TElementCondition);
begin
  with aElement do begin
    ValueApplication   := aCondition.ValueApplication;
    StateDisplayStationary := E_StateDisplayStationery(aCondition.StateDisplayStationary);
    StateAlarmInhibited := E_StateInhibit(aCondition.StateAlarmInhibited);
    StateValueValid    := E_StateValid(aCondition.StateValueValid);

    StateWireBreak   := E_StateWireBreak(aCondition.StateWireBreak);
    StateLA          := E_StateLowAlarm(aCondition.StateLA);
    StateHHA         := E_StateHighHigh(aCondition.StateHHA);
    StateHA          := E_StateHighAlarm(aCondition.StateHA);
  end;
end;

procedure TControllerManager.setElementCondition(aElement: TMCDElement;
  aCondition: TElementCondition);
begin
  with aElement do begin
    StateSwitchSpeed1  := E_ExtStatus(aCondition.StateSwitchSpeed1);
    StateSwitchSpeed2  := E_ExtStatus(aCondition.StateSwitchSpeed2);
    StateSwitchRemote  := E_ExtStatus(aCondition.StateSwitchRemote);
    StateSwitchNoFault := E_ExtStatus(aCondition.StateSwitchNoFault);

    CommandStartSpeed1App  := E_StateActivated(aCondition.CommandStartSpeed1App);
    CommandStartSpeed2App  := E_StateActivated(aCondition.CommandStartSpeed2App);
    CommandStopApp     := E_StateActivated(aCondition.CommandStopApp);
    CommandStartSpeed1HMI  := E_StateActivated(aCondition.CommandStartSpeed1HMI);

    CommandStartSpeed2HMI  := E_StateActivated(aCondition.CommandStartSpeed2HMI);
    CommandStopHMI     := E_StateActivated(aCondition.CommandStopHMI);
    StateBlokOut       := E_StateActivated(aCondition.StateBlockOut);
    StateRestart       := E_StateActivated(aCondition.StateRestart);

    StateValueValid    := E_StateValid(aCondition.StateValueValid);
    StateManualAuto    := E_StateManualAuto(aCondition.StateManualAuto);
    RFU                := E_StateNotRFU(aCondition.RFU);
    RunCondition       := E_StateRunCondition(aCondition.RunCondition);
  end;
end;

procedure TControllerManager.setElementCondition(aElement: TCBAElement;
  aCondition: TElementCondition);
begin
  with aElement do begin
    StateStatus         := E_ExtStatus(aCondition.StateStatus);
    StateCommandClose   := E_StateActivated(aCondition.StateCommandClose);
    StateCommandOpen    := E_StateActivated(aCondition.StateCommandOpen);
    StateManualAuto     := E_StateManualAuto(aCondition.StateManualAuto);
  end;
end;

procedure TControllerManager.setElementCondition(aElement: TAAEElement;
  aCondition: TElementCondition);
begin
  with aElement do begin
    ValueApplication  := aCondition.ValueApplication;
    StateValid        := E_Statevalid(aCondition.StateValid);
    StateWireBreak    := E_StateWireBreak(aCondition.StateWireBreak);
    StateDisplayStationary := E_StateDisplayStationery(aCondition.StateDisplayStationary);
    StateAlarmInhibited := E_StateInhibit(aCondition.StateAlarmInhibited);
  end;
end;

procedure TControllerManager.setElementCondition(aElement: TCBEElement;
  aCondition: TElementCondition);
begin
  with aElement do begin
    StateCommandCloseApp  := E_StateActivated(aCondition.StateCommandCloseApp);
    StateCommandOpenApp   := E_StateActivated(aCondition.StateCommandOpenApp);
    StateCommandCloseHMI  := E_StateActivated(aCondition.StateCommandCloseHMI);
    StateCommandOpenHMI   := E_StateActivated(aCondition.StateCommandOpenHMI) ;
    StateAlarmInhibited   := E_StateInhibit(aCondition.StateAlarmInhibited);
    StateManualAuto       := E_StateManualAuto(aCondition.StateManualAuto);
    StateRFC              := E_StateRFC(aCondition.StateRFC);
    StateRFO              := E_StateRFO(aCondition.StateRFO);
    StateSwitchClosed     := E_ExtStatus(aCondition.StateSwitchClosed);
    StateSwitchOpen       := E_ExtStatus(aCondition.StateSwitchOpen);
    StateSwitchRemote     := E_ExtStatus(aCondition.StateSwitchRemote);
    StateSwitchTripped    := E_ExtStatus(aCondition.StateSwitchTripped);
    StatePMSSwitchClosedOpen:= E_StateElement(aCondition.StatePMSSwitchClosedOpen);
    StateSwitchNoFault    := E_ExtStatus(aCondition.StateNoFault);
  end;
end;

procedure TControllerManager.setElementCondition(aElement: TDAEElement;
  aCondition: TElementCondition);
begin
  with aElement do begin
    Command   := E_StateDisabled(aCondition.Command);
    State     := E_State(aCondition.State);
    StateElementCaption := E_State(aCondition.StateElementCaption);
  end;
end;

procedure TControllerManager.setElementCondition(aElement: TCTRElement;
  aCondition: TElementCondition);
begin
  with aElement do begin
    StateNoFault   := E_StateNotFault(aCondition.StateNoFault);
    StateNoRFU     := E_StateNotRFU(aCondition.StateNoRFU);
    StateTransition := E_StateTransition(aCondition.StateTransition);
    ProcesStatus   := E_StateProcesStatus(aCondition.ProcesStatus);
    CommandHMI     := E_StateActivated(aCondition.CommandHMI);
  end;
end;

procedure TControllerManager.setElementCondition(aElement: TSWNElement;
  aCondition: TElementCondition);
begin
  with aElement do begin
    StateAlarmInhibited  := E_StateInhibit(aCondition.StateAlarmInhibited);
    Mode       := Boolean(aCondition.Mode);
    Evaluate   := Boolean( aCondition.Evaluate);
    StateSwitch := Boolean(aCondition.StateSwitch);
  end;
end;

procedure TControllerManager.setElementCondition(aElement: TSWEElement;
  aCondition: TElementCondition);
begin
  with aElement do begin
    StateAlarmInhibited  := E_StateInhibit(aCondition.StateAlarmInhibited);
    StateInState := Boolean(aCondition.InState);
    Mode := aCondition.Mode; {MODE(PrmMODE) dari element diikutkan Mode spy tidak nambah kolom pd db}
    NONC := aCondition.Evaluate; {NONC(PrmNONC) dari element diikutkan NONC spy tidak nambah kolom pd db}
  end;
end;

procedure TControllerManager.setElementCondition(aElement: TVCEElement;
  aCondition: TElementCondition);
begin
  with aElement do begin
    StateRFU  := E_StateNotRFU(aCondition.StateRFU);
    StateSwitchRemote := E_ExtStatus(aCondition.StateSwitchRemote);
    StateSwitchClosed := E_ExtStatus(aCondition.StateSwitchClosed);
    StateSwitchOpen := E_ExtStatus(aCondition.StateSwitchOpen);
    CommandClose := E_StateActivated(aCondition.CommandClose);
    CommandOpen := E_StateActivated(aCondition.CommandOpen);
    StateAutoManual := E_StateManualAuto(aCondition.StateAutoManual);
    DesireState := E_DesiredState(aCondition.DesireState);
  end;
end;

procedure TControllerManager.setElementCondition(aElement: TVCPElement;
  aCondition: TElementCondition);
begin
  with aElement do begin
    StateSwitchRemote  := E_StateSwitchRemote(aCondition.StateSwitchRemote);
    SetPoint := aCondition.SetPoint;
    ValueValve  := aCondition.ValueValve;
  end;
end;

procedure TControllerManager.setElementCondition(aElement: TVCHElement;
  aCondition: TElementCondition);
begin
  with aElement do begin
    StateRFU := E_StateNotRFU(aCondition.StateRFU);
    StateSwitchRemote  := E_StateSwitchRemote(aCondition.StateSwitchRemote);
    DesireState := E_DesiredState(aCondition.DesireState);
    StateSwitchClosed  := E_StateSwitchClosed(aCondition.StateSwitchClosed);
    StateSwitchOpen  := E_StateSwitchOpen(aCondition.StateSwitchOpen);
    CommandOpen   := E_StateActivated(aCondition.CommandOpen);
    CommandClose   := E_StateActivated(aCondition.CommandClose);
    StateAutoManual  := E_StateManualAuto(aCondition.StateAutoManual);
  end;
end;

procedure TControllerManager.setElementCondition(aElement: TSWBElement;
  aCondition: TElementCondition);
begin
  with aElement do begin
    InState := Boolean(aCondition.InState);
  end;
end;

procedure TControllerManager.setElementCondition(aElement: TSS1Element;
  aCondition: TElementCondition);
begin
  with aElement do begin
    ValueSensor := aCondition.ValueSensor;
    StateAlarmInhibited  := E_StateInhibit(aCondition.StateAlarmInhibited);
    StateDisplayStationary := E_StateDisplayStationery(aCondition.StateDisplayStationary);
  end;
end;

procedure TControllerManager.setElementCondition(aElement: TSPEElement;
  aCondition: TElementCondition);
begin
  with aElement do begin
    SensorValue   := aCondition.SensorValue;
    CommandEnableDisable := E_StateDisabled(aCondition.CommandEnableDisable);
    HMISetPoint := aCondition.HMISetPoint;
  end;
end;

procedure TControllerManager.setElementCondition(aElement: TSS2Element;
  aCondition: TElementCondition);
begin
  with aElement do begin
    ValueApplication := Round(aCondition.ValueApplication);
    StateAlarmInhibited  := E_StateInhibit(aCondition.StateAlarmInhibited);
    StateDisplayStationary := E_StateDisplayStationery(aCondition.StateDisplayStationary);
    StateWireBreak := E_StateWireBreak(aCondition.StateWireBreak);
  end;
end;

procedure TControllerManager.setElementCondition(aElement: TSSLElement;
  aCondition: TElementCondition);
begin
  with aElement do begin
    StateInhibited := E_StateInhibit(aCondition.StateInhibited);
    ValueSensor  := aCondition.ValueSensor;
    TrimValue    := aCondition.TrimValue;
    CompensationSensor  := aCondition.CompensationSensor;
  end;
end;

procedure TControllerManager.setElementCondition(aElement: TSSEElement;
  aCondition: TElementCondition);
begin
  with aElement do begin
    ValueSensor := aCondition.ValueSensor;
    StateInhibited  := E_StateInhibit(aCondition.StateAlarmInhibited);
    StateDisplayStationary := E_StateDisplayStationery(aCondition.StateDisplayStationary);
//    ValueElement  := aCondition.ValueElement;
  end;
end;

procedure TControllerManager.setPCSAAEElementID(aPortStaboardID: string; aValue: Double;
  Order: E_PropsID);
var
  ElementID : string;
  elmnt     : TElement;
begin
  SearchPCSElementID.getAAEElementID(aPortStaboardID, ElementID, aValue, Order);
  elmnt := getElement(ElementID);

  if Assigned(elmnt) then
    MappingPCSStateToElement(elmnt, Order, aValue);

  if Order = epPCSMEAlarmPropulsionCheck then
    MappingPCSStateToElement(elmnt, Order, aValue);


end;

procedure TControllerManager.setPCSMCDElementID(aPortStaboardID: string;
  aValue: Boolean; Order: E_PropsID);
var
  ElementID : string;
  elmnt     : TElement;
begin
  elmnt := nil;
  if SearchPCSElementID.getMCDElementID(aPortStaboardID, ElementID, Order) then
    elmnt := getElement(ElementID);

  if Assigned(elmnt) then
    MappingPCSStateToElement(elmnt, Order, aValue);
end;

procedure TControllerManager.setPCSMCEElementID(aPortStaboardID: string;
  aValue: Boolean; Order: E_PropsID);
var
  ElementID : string;
  elmnt     : TElement;
begin
  elmnt := nil;
  if SearchPCSElementID.getMCEElementID(aPortStaboardID, ElementID, Order) then
    elmnt := getElement(ElementID);

  if Assigned(elmnt) then
    MappingPCSStateToElement(elmnt, Order, aValue);
end;

procedure TControllerManager.setPCSRHEElementID(aPortStaboardID: string; aValue: Integer;
  Order: E_PropsID);
var
  ElementID : string;
  elmnt     : TElement;
begin
  searchPCSElementID.getRHEElementID(aPortStaboardID, ElementID, aValue, Order);
  elmnt := getElement(ElementID);

  if Assigned(elmnt) then
    MappingPCSStateToElement(elmnt, Order, aValue);
end;

procedure TControllerManager.setPCSSAEElementID(aPortStaboardID: string;
  aValue: Double; Order: E_PropsID);
var
  ElementID : string;
  elmnt     : TElement;
begin
  SearchPCSElementID.getSAEElementID(aPortStaboardID, ElementID, aValue, Order);
  elmnt := getElement(ElementID);

  if Assigned(elmnt) then
    MappingPCSStateToElement(elmnt, Order, aValue);
end;

procedure TControllerManager.setPCSSSEElementID(aPortStaboardID: string; aValue: Double;
  Order: E_PropsID);
var
  ElementID : string;
  elmnt     : TElement;
begin
  SearchPCSElementID.getSSEElementID(aPortStaboardID, ElementID, aValue, Order);
  elmnt := getElement(ElementID);

  if Assigned(elmnt) then
    MappingPCSStateToElement(elmnt, Order, aValue);

end;

procedure TControllerManager.setPCSSWEElementID(aPortStaboardID: string;
  aValue: Boolean; Order: E_PropsID);
var
  ElementID : string;
  elmnt     : TElement;
begin
  elmnt := nil;
  if SearchPCSElementID.getSWEElementID(aPortStaboardID, ElementID, Order) then
    elmnt := getElement(ElementID);

  if Assigned(elmnt) then
    MappingPCSStateToElement(elmnt, Order, aValue);

end;

procedure TControllerManager.setPCSVCEElementID(aPortStaboardID: string;
  aValue: Boolean; Order: E_PropsID);
var
  ElementID : string;
  elmnt     : TElement;
begin
  elmnt := nil;
  if SearchPCSElementID.getVCEElementID(aPortStaboardID, ElementID, Order) then
    elmnt := getElement(ElementID);

  if Assigned(elmnt) then
    MappingPCSStateToElement(elmnt, Order, aValue);

end;

procedure TControllerManager.setPMSAAEElementID(aGenSwitchID: string; aValue : Double;
  konstanta: Integer);
var
  ElementID : string;
  elmnt     : TElement;
begin
  if SearchPMSElementID.getAAEElementID(aGenSwitchID, ElementID, konstanta) then
  begin
    elmnt := getElement(ElementID);

    if Assigned(elmnt) then
      MappingPMSStatetoElement(elmnt,konstanta, aValue);
  end;
end;

procedure TControllerManager.setPMSCBEElementID(aGenSwitchID: string; aValue: Boolean; konstanta: Integer);
var
  ElementID : string;
  elmnt     : TElement;
begin
  if SearchPMSElementID.getCBEElementID(aGenSwitchID, ElementID, konstanta) then
  begin
    elmnt := getElement(ElementID);

    if Assigned(elmnt) then
      MappingPMSStatetoElement(elmnt,konstanta, aValue);
  end;
end;

procedure TControllerManager.setPMSCBEElementIDInt(aGenSwitchID: string; aValue1: Integer; aValue2: Boolean; konstanta: Integer);
var
  ElementID : string;
  elmnt     : TElement;
begin
  if SearchPMSElementID.getCBEElementIDInt(aGenSwitchID, ElementID, aValue1, konstanta) then
  begin
    elmnt := getElement(ElementID);

    if Assigned(elmnt) then
      MappingPMSStatetoElement(elmnt,konstanta, aValue2);
  end;
end;

procedure TControllerManager.setPMSCBEEmergency(aValue2: Boolean; konstanta: Integer);
var
  elmnt1, elmnt2 : TElement;
begin
  elmnt1 := getElement('3241E50031H');
  elmnt2 := getElement('3241E50031G');

  if Assigned(elmnt1) then
    MappingPMSStatetoElement(elmnt1,konstanta, aValue2);
  if Assigned(elmnt2) then
    MappingPMSStatetoElement(elmnt2,konstanta, aValue2);
end;

procedure TControllerManager.setPMSCTRElementID(aGenSwitchID: string; aValue : Boolean; konstanta : Integer);
var
  ElementID : string;
  elmnt     : TElement;
begin
  if SearchPMSElementID.getCTRElementID(aGenSwitchID, ElementID, konstanta) then
  begin
    elmnt := getElement(ElementID);

    if Assigned(elmnt) then
      MappingPMSStatetoElement(elmnt,konstanta, aValue);
  end;
end;

procedure TControllerManager.setPMSSSEElementID(aGenSwitchID: string;
  aValue: Double; konstanta: Integer);
var
  ElementID : string;
  elmnt     : TElement;
begin
  if SearchPMSElementID.getSSEElementID(aGenSwitchID, ElementID, konstanta) then
  begin
    elmnt := getElement(ElementID);

    if Assigned(elmnt) then
      MappingPMSStatetoElement(elmnt,konstanta, aValue);
  end;
end;

procedure TControllerManager.setPMSSWEElementID(aGenSwitchID: string; aValue: Boolean; konstanta: Integer);
var
  ElementID : string;
  elmnt     : TElement;
begin
  if SearchPMSElementID.getSWEElementID(aGenSwitchID, ElementID, konstanta) then
  begin
    elmnt := getElement(ElementID);

    if Assigned(elmnt) then
      MappingPMSStatetoElement(elmnt,konstanta, aValue);
  end;
end;

procedure TControllerManager.setPMSSWEElementIDInt(aGenSwitchID: string; aValue, konstanta: Integer);
var
  ElementID : string;
  elmnt     : TElement;
begin
  if SearchPMSElementID.getSWEElementID(aGenSwitchID, ElementID, konstanta) then
  begin
    elmnt := getElement(ElementID);

    if Assigned(elmnt) then
      MappingPMSStatetoElement(elmnt,konstanta, aValue);
  end;
end;

procedure TControllerManager.setElementCondition(aElement: TElement;
  aCondition: TElementCondition);
begin
  aElement.StateElementDisabled := E_StateDisabled(aCondition.StateElementDisabled);
  case aElement.ElementType of
    eltAAE: setElementCondition(TAAEElement(aElement),aCondition) ;
    eltCBA: setElementCondition(TCBAElement(aElement),aCondition);
    eltCBE: setElementCondition(TCBEElement(aElement),aCondition);
    eltCTR: setElementCondition(TCTRElement(aElement),aCondition);
    eltDAE: setElementCondition(TDAEElement(aElement),aCondition);
    eltMCD: setElementCondition(TMCDElement(aElement),aCondition);
    eltMCE: setElementCondition(TMCEElement(aElement),aCondition);
    eltMCS: setElementCondition(TMCSElement(aElement),aCondition);
    eltRHE: setElementCondition(TRHEElement(aElement),aCondition);
    eltSAE: setElementCondition(TSAEElement(aElement),aCondition);
    eltSEE: setElementCondition(TSEEElement(aElement),aCondition);
    eltSPE: setElementCondition(TSPEElement(aElement),aCondition);
    eltSSE: setElementCondition(TSSEElement(aElement),aCondition);
    eltSS1: setElementCondition(TSS1Element(aElement),aCondition);
    eltSS2: setElementCondition(TSS2Element(aElement),aCondition);
    eltSSL: setElementCondition(TSSLElement(aElement),aCondition);
    eltSWB: setElementCondition(TSWBElement(aElement),aCondition);
    eltSWE: setElementCondition(TSWEElement(aElement),aCondition);
    eltSWN: setElementCondition(TSWNElement(aElement),aCondition);
    eltVCE: setElementCondition(TVCEElement(aElement),aCondition);
    eltVCH: setElementCondition(TVCHElement(aElement),aCondition);
    eltVCP: setElementCondition(TVCPElement(aElement),aCondition);
    eltUNDEF: ;
  end;
end;

procedure TControllerManager.SetRunningScenario(aRunningID : integer);
begin
  FRunningScenario := aRunningID;
end;


procedure TControllerManager.SetRunningScenarioTime(aRunningTime: TDateTime);
begin
  FRunningScenarioTime := aRunningTime;
end;

procedure TControllerManager.ERCommand(rCmd: R_Common_TANK_Command);
var
  element : TElement;
begin
  element := getElement(rCmd.ElementID);

  case rCmd.CommandID of
    epTankLevel:
    begin
      if Assigned(element) then
        TSSLElement(element).ValueElementLevel := rCmd.ValueDouble;
    end;
    epTankValueSensor:
    begin
      if Assigned(element) then
        TSSLElement(element).ValueSensor := rCmd.ValueDouble;
    end;
    epElementParamChange:
    begin
//      if Assigned(element) then
//        TSSLElement(element).Parameters.
    end;
  end;
end;

end.

