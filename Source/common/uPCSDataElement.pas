unit uPCSDataElement;

interface

uses uDataType, SysUtils;

type
  TSearchPCSElementID = Class

  private

  public
    Constructor Create; overload;
    destructor Destroy; override;

    function getSWEElementID(PortStaboardID : string; var value: string; Order: E_PropsID): Boolean;
    function getAAEElementID(PortStaboardID : string; var value: string; valueDouble : Double; Order: E_PropsID): Boolean;
    function getMCEElementID(PortStaboardID : string; var value: string; Order: E_PropsID): Boolean;
    function getMCDElementID(PortStaboardID : string; var value: string; Order: E_PropsID): Boolean;
    function getSSEElementID(PortStaboardID : string; var value: string; valueInt : Double; Order : E_PropsID): Boolean;
    function getRHEElementID(PortStaboardID : string; var value: string; valueInt : Integer; Order: E_PropsID): Boolean;
    function getVCEElementID(PortStaboardID : string; var value: string; Order: E_PropsID): Boolean;
    function getSAEElementID(PortStaboardID : string; var value: string; valueDouble : Double; Order : E_PropsID): Boolean;
  end;

var
  SearchPCSElementID : TSearchPCSElementID;

implementation


{ TSearchPCSElementID }

constructor TSearchPCSElementID.Create;
begin
  inherited;
end;

destructor TSearchPCSElementID.Destroy;
begin
  inherited;
end;



function TSearchPCSElementID.getSAEElementID(PortStaboardID: string;
  var value: string; valueDouble: Double; Order: E_PropsID): Boolean;
begin
  Result := True;
  if PortStaboardID = C_PCS_ME_PORTS then
  begin
    if Order = epPCSMEStartingAir then
      value := '2331E0011198'
    else
    if Order = epPCSMEControlAir then
      value := '2331E0011195'
    else
    if Order = epPCSMETCAirSeal then
      value := '2331E0011197'
    else
    if Order = epPCSMEPressFOInlet then
      value := '2331E0011190'
    else
    if Order = epPCSMEPressFWHTInlet then
      value := '2331E0011180'
    else
    if Order = epPCSMEPressSeaWaterOutlet then
      value := '2331E0011186'
    else
    if Order = epPCSMELOPressInlet then
      value := '2331E0011138';
  end
  else
  if PortStaboardID = C_PCS_ME_STARBOARD then
  begin
    if Order = epPCSMEStartingAir then
      value := '2331E0012198'
    else
    if Order = epPCSMEControlAir then
      value := '2331E0012195'
    else
    if Order = epPCSMETCAirSeal then
      value := '2331E0012197'
    else
    if Order = epPCSMEPressFOInlet then
      value := '2331E0012190'
    else
    if Order = epPCSMEPressFWHTInlet then
      value := '2331E0012180'
    else
    if Order = epPCSMEPressSeaWaterOutlet then
      value := '2331E0012186'
    else
    if Order = epPCSMELOPressInlet then
      value := '2331E0012138';
  end;
end;

function TSearchPCSElementID.getSSEElementID(PortStaboardID: string; var value: string; valueInt: Double;
  Order: E_PropsID): Boolean;
begin
  Result := True;
  if PortStaboardID = C_PCS_ME_PORTS then
  begin
    if Order = epPCSMEDelayActualSpeed then
      value := '2331E0011003'
    else
    if Order = epPCSMEFuelRack then
      value := '2331E0011001'
    else
    if Order = epPCSMEFuelMargin then
      value := '2331E0011002'
    else
    if Order = epRudderValuePS then
      value := '5610E0024A';

  end
  else
  if PortStaboardID = C_PCS_ME_STARBOARD then
  begin
    if Order = epPCSMEDelayActualSpeed then
      value := '2331E0012003'
    else
    if Order = epPCSMEFuelRack then
      value := '2331E0012001'
    else
    if Order = epPCSMEFuelMargin then
      value := '2331E0012002'
    else
    if Order = epRudderValueSB then
      value := '5610E0025A';
  end
  else
  if PortStaboardID = C_PCS_GB_PORTS then
  begin
    if Order = epPCSGBDelayShaftSpeed then
      value := '2410A0001C'
    else
    if Order = epPCSGBPLB1 then
      value := '2410A0001G'
    else
    if Order = epPCSGBPLB2 then
      value := '2410A0001H'
    else
    if Order = epPCSGBThrAH then
      value := '2410A0001J'
    else
    if Order = epPCSGBTHrAS then
      value := '2410A0001K'
    else
    if Order = epPCSGBCtrlOilPressIn then
      value := '2410A0001D'
    else
    if Order = epPCSGBCtrlOilPressOut then
      value := '2410A0001E'
    else
    if Order = epPCSGBLOPressInlet then
      value := '2410A0001A'
    else
    if Order = epPCSGBLOTempInlet then
      value := '2410A0001F'
    else
    if Order = epPCSGBShaftTemp then
      value := '2440A0006A';
  end
  else
  if PortStaboardID = C_PCS_GB_STARBOARD then
  begin
    if Order = epPCSGBDelayShaftSpeed then
      value := '2410A0002C'
    else
    if Order = epPCSGBPLB1 then
      value := '2410A0002G'
    else
    if Order = epPCSGBPLB2 then
      value := '2410A0002H'
    else
    if Order = epPCSGBThrAH then
      value := '2410A0002J'
    else
    if Order = epPCSGBTHrAS then
      value := '2410A0002K'
     else
    if Order = epPCSGBCtrlOilPressIn then
      value := '2410A0002D'
    else
    if Order = epPCSGBCtrlOilPressOut then
      value := '2410A0002E'
    else
    if Order = epPCSGBLOPressInlet then
      value := '2410A0002A'
    else
    if Order = epPCSGBLOTempInlet then
      value := '2410A0002F'
    else
    if Order = epPCSGBShaftTemp then
      value := '2440A0005A'
  end
  else
  if PortStaboardID = C_PCS_CPP_PORTS then
  begin
    if Order = epPCSCPPDelayActualPitch then
      value := '2436A0007E'
    else
    if order = epPCSCPPServoOil then
      value := '2431A0006D'
    else
    if order = epPCSCPPStaticHub then
      value := '2431A0006E'
    else
    if order = epPCSCPPHydrOil then
      value := '2431A0006A';
  end
  else
  if PortStaboardID = C_PCS_CPP_STARBOARD then
  begin
    if Order = epPCSCPPDelayActualPitch then
      value := '2436A0008E'
    else
    if order = epPCSCPPServoOil then
      value := '2431A0005D'
    else
    if order = epPCSCPPStaticHub then
      value := '2431A0005E'
    else
    if order = epPCSCPPHydrOil then
      value := '2431A0005A';
  end;

end;

function TSearchPCSElementID.getMCDElementID(PortStaboardID: string;
  var value: string; Order: E_PropsID): Boolean;
begin
  Result := True;
  if PortStaboardID = C_PCS_ME_PORTS then
  begin
    if Order = epPCSMEFanExhSupply then
      value := '5131A1003A'
    else
    if Order = epPCSMEFanSupply2 then
      value := '5131A1006A'
  end
  else
  if PortStaboardID = C_PCS_ME_STARBOARD then
  begin
    if Order = epPCSMEFanExhSupply then
      value := '5131A1001A'
    else
    if Order = epPCSMEFanSupply2 then
      value := '5131A1005A';
  end;

end;

function TSearchPCSElementID.getMCEElementID(PortStaboardID: string;
  var value: string; Order: E_PropsID): Boolean;
begin
  Result := True;
  if PortStaboardID = C_PCS_ME_PORTS then
  begin
    if Order = epPCSMEPrimLOPump then
      value := '2331E0011159'
    else
    if Order = epPCSMEPreHeatingPump then
      value := '2331E0011237'
    else
    if Order = epPCSMEFanSupply1 then
      value := '5131A1004A';
  end
  else
  if PortStaboardID = C_PCS_ME_STARBOARD then
  begin
    if Order = epPCSMEPrimLOPump then
      value := '2331E0012159'
    else
    if Order = epPCSMEPreHeatingPump then
      value := '2331E0012237'
    else
    if Order = epPCSMEFanSupply1 then
      value := '5131A1002A';
  end
  else
  if PortStaboardID = C_PCS_CPP_PORTS then
  begin
    if Order = epPCSCPPPumpStart1 then
      value := '2436A0001A'
    else
    if Order = epPCSCPPPumpStart2 then
      value := '2436A0010A'
    else
    if Order = epPCSCPPPumpStart3 then
      value := '2436A0005A';

  end
  else
  if PortStaboardID = C_PCS_CPP_STARBOARD then
  begin
    if Order = epPCSCPPPumpStart1 then
      value := '2436A0002A'
    else
    if Order = epPCSCPPPumpStart2 then
      value := '2436A0011A'
    else
    if Order = epPCSCPPPumpStart3 then
      value := '2436A0006A';

  end
  else
  if PortStaboardID = C_PCS_GB_PORTS then
  begin
    if Order = epPCSGBStandbyPump then
      value := '2410A0001';
  end
  else
  if PortStaboardID = C_PCS_GB_STARBOARD then
  begin
     if Order = epPCSGBStandbyPump then
      value := '2410A0002';
  end;
end;

function TSearchPCSElementID.getRHEElementID(PortStaboardID: string;
  var value: string; valueInt: Integer; Order: E_PropsID): Boolean;
begin
  Result := True;
  if PortStaboardID = C_PCS_ME_PORTS then
  begin
    if Order = epPCSMERunningHour then
      value := '2331E0011R'
    else
    if Order = epPCSMELOPumpHour then
      value := '2331E001115R'
    else
    if Order = epPCSMEFanExhSupplyHour then
      value := '5131A1003AR'
    else
    if Order = epPCSMEFanSupply1Hour then
      value := '5131A1004AR'
    else
    if Order = epPCSMEFanSupply2Hour then
      value := '5131A1006AR';
  end
  else
  if PortStaboardID = C_PCS_ME_STARBOARD then
  begin
    if Order = epPCSMERunningHour then
      value := '2331E0012R'
    else
    if Order = epPCSMELOPumpHour then
      value := '2331E001215R'
    else
    if Order = epPCSMEFanExhSupplyHour then
      value := '5131A1001AR'
    else
    if Order = epPCSMEFanSupply1Hour then
      value := '5131A1002AR'
    else
    if Order = epPCSMEFanSupply2Hour then
      value := '5131A1005AR';
  end
  else
  if PortStaboardID = C_PCS_CPP_PORTS then
  begin
    if Order = epPCSCPPHydraulicPumpHour1 then
      value := '2436A0001R'
    else
    if Order = epPCSCPPHydraulicPumpHour2 then
      value := '2436A0010R'
    else
    if Order = epPCSCPPHydraulicPumpHour3 then
      value := '2436A0005R';

  end
  else
  if PortStaboardID = C_PCS_CPP_STARBOARD then
  begin
    if Order = epPCSCPPHydraulicPumpHour1 then
      value := '2436A0002R'
    else
    if Order = epPCSCPPHydraulicPumpHour2 then
      value := '2436A0011R'
    else
    if Order = epPCSCPPHydraulicPumpHour3 then
      value := '2436A0006R';
  end
  else
  if PortStaboardID = C_PCS_GB_PORTS then
  begin
    if Order = epPCSGBLOPumpHour then
      value := '2410A0001AR';
  end
  else
  if PortStaboardID = C_PCS_GB_STARBOARD then
  begin
    if Order = epPCSGBLOPumpHour then
      value := '2410A0002AR';
  end;

end;

function TSearchPCSElementID.getAAEElementID(PortStaboardID: string;
  var value: string; valueDouble : Double; Order: E_PropsID): Boolean;
begin
  Result := True;
  if PortStaboardID = C_PCS_ME_PORTS then
  begin
    if Order = epPCSMELeverSpeed then
      value := '2331E0011045'
    else
    if Order = epPCSMESetPointSpeed then
      value := '2331E0011021'
    else
    if Order = epPCSMESpeed then
      value := '2331E0011199'
    else
    if Order = epPCSMETCLOPressInlet then
      value := '2331E0011143'
    else
    if Order = epPCSMEPressAirInlet then
      value := '2331E0011126'
    else
    if Order = epPCSMETurboChargerSpeedA then
      value := '2331E0011134'
    else
    if Order = epPCSMETurboChargerSpeedB then
      value := '2331E0011133'
    else
    if Order = epPCSMETCOutlLOTempA then
      value := '2331E0011157'
    else
    if Order = epPCSMETCOutlLOTempB then
      value := '2331E0011158'
    else
    if Order = epPCSMETempTCInletA then
      value := '2331E0011122'
    else
    if Order = epPCSMETempTCInletB then
      value := '2331E0011123'
    else
    if Order = epPCSMETempTCOutletA then
      value := '2331E0011124'
    else
    if Order = epPCSMETempTCOutletB then
      value := '2331E0011125'
    else
    if Order = epPCSMETempSuperChargAir then
      value := '2331E0011135'
    else
    if Order = epPCSMETempFWHTOutlet then
      value := '2331E0011185'
    else
    if Order = epPCSMETempFWHTInlet then
      value := '2331E0011179'
    else
    if Order = epPCSMELOTempInlet then
      value := '2331E0011141'
    else
    if Order = epPCSMEAvgTempA then
      value := '2331E0011239'
    else
    if Order = epPCSMEAvgTempB then
      value := '2331E0011240'
    else
    if Order = epPCSMECompProbA then
      value := '2331E0011120'
    else
    if Order = epPCSMECompProbB then
      value := '2331E0011121'
    else
    if Order = epPCSMETempExhCylA1 then
      value := '2331E0011100'
    else
    if Order = epPCSMETempExhCylA2 then
      value := '2331E0011101'
    else
    if Order = epPCSMETempExhCylA3 then
      value := '2331E0011102'
    else
    if Order = epPCSMETempExhCylA4 then
      value := '2331E0011103'
    else
    if Order = epPCSMETempExhCylA5 then
      value := '2331E0011104'
    else
    if Order = epPCSMETempExhCylA6 then
      value := '2331E0011105'
    else
    if Order = epPCSMETempExhCylA7 then
      value := '2331E0011106'
    else
    if Order = epPCSMETempExhCylA8 then
      value := '2331E0011107'
    else
    if Order = epPCSMETempExhCylA9 then
      value := '2331E0011108'
    else
    if Order = epPCSMETempExhCylA10 then
      value := '2331E0011109'
    else
    if Order = epPCSMETempExhCylB1 then
      value := '2331E0011110'
    else
    if Order = epPCSMETempExhCylB2 then
      value := '2331E0011111'
    else
    if Order = epPCSMETempExhCylB3 then
      value := '2331E0011112'
    else
    if Order = epPCSMETempExhCylB4 then
      value := '2331E0011113'
    else
    if Order = epPCSMETempExhCylB5 then
      value := '2331E0011114'
    else
    if Order = epPCSMETempExhCylB6 then
      value := '2331E0011115'
    else
    if Order = epPCSMETempExhCylB7 then
      value := '2331E0011116'
    else
    if Order = epPCSMETempExhCylB8 then
      value := '2331E0011117'
    else
    if Order = epPCSMETempExhCylB9 then
      value := '2331E0011118'
    else
    if Order = epPCSMETempExhCylB10 then
      value := '2331E0011119'
    else
    if Order = epPCSMEDevTempExhCylA1 then
      value := '2331E0011241'
    else
    if Order = epPCSMEDevTempExhCylA2 then
      value := '2331E0011242'
    else
    if Order = epPCSMEDevTempExhCylA3 then
      value := '2331E0011243'
    else
    if Order = epPCSMEDevTempExhCylA4 then
      value := '2331E0011244'
    else
    if Order = epPCSMEDevTempExhCylA5 then
      value := '2331E0011245'
    else
    if Order = epPCSMEDevTempExhCylA6 then
      value := '2331E0011246'
    else
    if Order = epPCSMEDevTempExhCylA7 then
      value := '2331E0011247'
    else
    if Order = epPCSMEDevTempExhCylA8 then
      value := '2331E0011248'
    else
    if Order = epPCSMEDevTempExhCylA9 then
      value := '2331E0011249'
    else
    if Order = epPCSMEDevTempExhCylA10 then
      value := '2331E0011250'
    else
    if Order = epPCSMEDevTempExhCylB1 then
      value := '2331E0011251'
    else
    if Order = epPCSMEDevTempExhCylB2 then
      value := '2331E0011252'
    else
    if Order = epPCSMEDevTempExhCylB3 then
      value := '2331E0011253'
    else
    if Order = epPCSMEDevTempExhCylB4 then
      value := '2331E0011254'
    else
    if Order = epPCSMEDevTempExhCylB5 then
      value := '2331E0011255'
    else
    if Order = epPCSMEDevTempExhCylB6 then
      value := '2331E0011256'
    else
    if Order = epPCSMEDevTempExhCylB7 then
      value := '2331E0011257'
    else
    if Order = epPCSMEDevTempExhCylB8 then
      value := '2331E0011258'
    else
    if Order = epPCSMEDevTempExhCylB9 then
      value := '2331E0011259'
    else
    if Order = epPCSMEDevTempExhCylB10 then
      value := '2331E0011260'
    else
    if Order = epPCSMETempConRodBear1 then
      value := '2331E0011166'
    else
    if Order = epPCSMETempConRodBear2 then
      value := '2331E0011167'
    else
    if Order = epPCSMETempConRodBear3 then
      value := '2331E0011168'
    else
    if Order = epPCSMETempConRodBear4 then
      value := '2331E0011169'
    else
    if Order = epPCSMETempConRodBear5 then
      value := '2331E0011170'
    else
    if Order = epPCSMETempConRodBear6 then
      value := '2331E0011171'
    else
    if Order = epPCSMETempConRodBear7 then
      value := '2331E0011172'
    else
    if Order = epPCSMETempConRodBear8 then
      value := '2331E0011173'
    else
    if Order = epPCSMETempConRodBear9 then
      value := '2331E0011174'
    else
    if Order = epPCSMETempConRodBear10 then
      value := '2331E0011175'
    else
    if Order = epPCSMETempBear1 then
      value := '2331E0011144'
    else
    if Order = epPCSMETempBear2 then
      value := '2331E0011145'
    else
    if Order = epPCSMETempBear3 then
      value := '2331E0011146'
    else
    if Order = epPCSMETempBear4 then
      value := '2331E0011147'
    else
    if Order = epPCSMETempBear5 then
      value := '2331E0011148'
    else
    if Order = epPCSMETempBear6 then
      value := '2331E0011149'
    else
    if Order = epPCSMETempBear7 then
      value := '2331E0011150'
    else
    if Order = epPCSMETempBear8 then
      value := '2331E0011151'
    else
    if Order = epPCSMETempBear9 then
      value := '2331E0011152'
    else
    if Order = epPCSMETempBear10 then
      value := '2331E0011153'
    else
    if Order = epPCSMETempBear11 then
      value := '2331E0011154'
    else
    if Order = epPCSMEAlarmPropulsionCheck then
      value := '';
  end
  else
  if PortStaboardID = C_PCS_ME_STARBOARD then
  begin
    if Order = epPCSMELeverSpeed then
      value := '2331E0012045'
    else
    if Order = epPCSMESetPointSpeed then
      value :='2331E0012021'
    else
    if Order = epPCSMESpeed then
      value := '2331E0012199'
    else
    if Order = epPCSMETCLOPressInlet then
      value := '2331E0012143'
    else
    if Order = epPCSMEPressAirInlet then
      value := '2331E0012126'
    else
    if Order = epPCSMETurboChargerSpeedA then
      value := '2331E0012134'
    else
    if Order = epPCSMETurboChargerSpeedB then
      value := '2331E0012133'
    else
    if Order = epPCSMETCOutlLOTempA then
      value := '2331E0012157'
    else
    if Order = epPCSMETCOutlLOTempB then
      value := '2331E0012158'
    else
    if Order = epPCSMETempTCInletA then
      value := '2331E0012122'
    else
    if Order = epPCSMETempTCInletB then
      value := '2331E0012123'
    else
    if Order = epPCSMETempTCOutletA then
      value := '2331E0012124'
    else
    if Order = epPCSMETempTCOutletB then
      value := '2331E0012125'
    else
    if Order = epPCSMETempSuperChargAir then
      value := '2331E0012135'
    else
    if Order = epPCSMETempFWHTOutlet then
      value := '2331E0012185'
    else
    if Order = epPCSMETempFWHTInlet then
      value := '2331E0012179'
    else
    if Order = epPCSMELOTempInlet then
      value := '2331E0012141'
    else
    if Order = epPCSMEAvgTempA then
      value := '2331E0012239'
    else
    if Order = epPCSMEAvgTempB then
      value := '2331E0012240'
    else
    if Order = epPCSMECompProbA then
      value := '2331E0012120'
    else
    if Order = epPCSMECompProbB then
      value := '2331E0012121'
    else
    if Order = epPCSMETempExhCylA1 then
      value := '2331E0012100'
    else
    if Order = epPCSMETempExhCylA2 then
      value := '2331E0012101'
    else
    if Order = epPCSMETempExhCylA3 then
      value := '2331E0012102'
    else
    if Order = epPCSMETempExhCylA4 then
      value := '2331E0012103'
    else
    if Order = epPCSMETempExhCylA5 then
      value := '2331E0012104'
    else
    if Order = epPCSMETempExhCylA6 then
      value := '2331E0012105'
    else
    if Order = epPCSMETempExhCylA7 then
      value := '2331E0012106'
    else
    if Order = epPCSMETempExhCylA8 then
      value := '2331E0012107'
    else
    if Order = epPCSMETempExhCylA9 then
      value := '2331E0012108'
    else
    if Order = epPCSMETempExhCylA10 then
      value := '2331E0012109'
    else
    if Order = epPCSMETempExhCylB1 then
      value := '2331E0012110'
    else
    if Order = epPCSMETempExhCylB2 then
      value := '2331E0012111'
    else
    if Order = epPCSMETempExhCylB3 then
      value := '2331E0012112'
    else
    if Order = epPCSMETempExhCylB4 then
      value := '2331E0012113'
    else
    if Order = epPCSMETempExhCylB5 then
      value := '2331E0012114'
    else
    if Order = epPCSMETempExhCylB6 then
      value := '2331E0012115'
    else
    if Order = epPCSMETempExhCylB7 then
      value := '2331E0012116'
    else
    if Order = epPCSMETempExhCylB8 then
      value := '2331E0012117'
    else
    if Order = epPCSMETempExhCylB9 then
      value := '2331E0012118'
    else
    if Order = epPCSMETempExhCylB10 then
      value := '2331E0012119'
    else
    if Order = epPCSMEDevTempExhCylA1 then
      value := '2331E0012241'
    else
    if Order = epPCSMEDevTempExhCylA2 then
      value := '2331E0012242'
    else
    if Order = epPCSMEDevTempExhCylA3 then
      value := '2331E0012243'
    else
    if Order = epPCSMEDevTempExhCylA4 then
      value := '2331E0012244'
    else
    if Order = epPCSMEDevTempExhCylA5 then
      value := '2331E0012245'
    else
    if Order = epPCSMEDevTempExhCylA6 then
      value := '2331E0012246'
    else
    if Order = epPCSMEDevTempExhCylA7 then
      value := '2331E0012247'
    else
    if Order = epPCSMEDevTempExhCylA8 then
      value := '2331E0012248'
    else
    if Order = epPCSMEDevTempExhCylA9 then
      value := '2331E0012249'
    else
    if Order = epPCSMEDevTempExhCylA10 then
      value := '2331E0012250'
    else
    if Order = epPCSMEDevTempExhCylB1 then
      value := '2331E0012251'
    else
    if Order = epPCSMEDevTempExhCylB2 then
      value := '2331E0012252'
    else
    if Order = epPCSMEDevTempExhCylB3 then
      value := '2331E0012253'
    else
    if Order = epPCSMEDevTempExhCylB4 then
      value := '2331E0012254'
    else
    if Order = epPCSMEDevTempExhCylB5 then
      value := '2331E0012255'
    else
    if Order = epPCSMEDevTempExhCylB6 then
      value := '2331E0012256'
    else
    if Order = epPCSMEDevTempExhCylB7 then
      value := '2331E0012257'
    else
    if Order = epPCSMEDevTempExhCylB8 then
      value := '2331E0012258'
    else
    if Order = epPCSMEDevTempExhCylB9 then
      value := '2331E0012259'
    else
    if Order = epPCSMEDevTempExhCylB10 then
      value := '2331E0012260'
    else
    if Order = epPCSMETempConRodBear1 then
      value := '2331E0012166'
    else
    if Order = epPCSMETempConRodBear2 then
      value := '2331E0012167'
    else
    if Order = epPCSMETempConRodBear3 then
      value := '2331E0012168'
    else
    if Order = epPCSMETempConRodBear4 then
      value := '2331E0012169'
    else
    if Order = epPCSMETempConRodBear5 then
      value := '2331E0012170'
    else
    if Order = epPCSMETempConRodBear6 then
      value := '2331E0012171'
    else
    if Order = epPCSMETempConRodBear7 then
      value := '2331E0012172'
    else
    if Order = epPCSMETempConRodBear8 then
      value := '2331E0012173'
    else
    if Order = epPCSMETempConRodBear9 then
      value := '2331E0012174'
    else
    if Order = epPCSMETempConRodBear10 then
      value := '2331E0012175'
    else
    if Order = epPCSMETempBear1 then
      value := '2331E0012144'
    else
    if Order = epPCSMETempBear2 then
      value := '2331E0012145'
    else
    if Order = epPCSMETempBear3 then
      value := '2331E0012146'
    else
    if Order = epPCSMETempBear4 then
      value := '2331E0012147'
    else
    if Order = epPCSMETempBear5 then
      value := '2331E0012148'
    else
    if Order = epPCSMETempBear6 then
      value := '2331E0012149'
    else
    if Order = epPCSMETempBear7 then
      value := '2331E0012150'
    else
    if Order = epPCSMETempBear8 then
      value := '2331E0012151'
    else
    if Order = epPCSMETempBear9 then
      value := '2331E0012152'
    else
    if Order = epPCSMETempBear10 then
      value := '2331E0012153'
    else
    if Order = epPCSMETempBear11 then
      value := '2331E0012154'
    else
    if Order = epPCSMEAlarmPropulsionCheck then
      value := '';
  end
  else
  if PortStaboardID = C_PCS_CPP_PORTS then
  begin
    if Order = epPCSCPPLeverPitch then
      value := '2436A0007I'
    else
    if Order = epPCSCPPSetPointPitch then
      value := '2436A0007H';
  end
  else
  if PortStaboardID = C_PCS_CPP_STARBOARD then
  begin
    if Order = epPCSCPPLeverPitch then
      value := '2436A0008I'
    else
    if Order = epPCSCPPSetPointPitch then
      value := '2436A0008H';

  end
  else
  if PortStaboardID = C_PCS_GB_PORTS then
  begin

  end
  else
  if PortStaboardID = C_PCS_GB_STARBOARD then
  begin

  end;

end;

function TSearchPCSElementID.getSWEElementID(PortStaboardID: string;
  var value: string; Order: E_PropsID): Boolean;
begin
  Result := True;
  if PortStaboardID = C_PCS_ME_PORTS then
  begin
    if Order = epPCSMERemoteManual then
      value := '2331E0011325'
    else
    if Order = epPCSMERemoteAuto then
      value := '2331E0011225'
    else
    if Order = epPCSMERunning then
      value := '2331E0011013'
    else
    if Order = epPCSMERemoteCtrl then
      value := '2331E0011006'
    else
    if Order = epPCSMESafetyShutdown then
      value := '2331E0011018'
    else
    if Order = epPCSMELowLoad then
      value := '2331E0011042'
    else
    if Order = epPCSMEVeryLowLoad then
      value := '2331E0011043'
    else
    if Order = epPCSMEFsrTimerExpired then
      value := '2331E0011044'
    else
    if Order = epPCSMEMaxFsrKeySwitch then
      value := '2331E0011046'
    else
    if Order = epPCSMEStopIncrease then
      value := '2331E0011009'
    else
    if order = epPCSMEStopDecrease then
      value := '2331E0011008'
    else
    if Order = epPCSMEOverspeed then
      value := '2331E0011193'
    else
    if Order = epPCSMEConRodBearingTempHigh then
      value := '2331E0011177'
    else
    if Order = epPCSMEConRodBearingTempVeryHigh then
      value := '2331E0011176'
    else
    if Order = epPCSMEBearingTempHigh then
      value := '2331E0011155'
    else
    if Order = epPCSMEBearingTempVeryHigh then
      value := '2331E0011156'
    else
    if Order = epPCSMEOilMistDetSafety then
      value := '2331E0011163'
    else
    if Order = epPCSMEOilMistDetFailure then
      value := '2331E0011164'
    else
    if Order = epPCSMEOilMistDetAlarm then
      value := '2331E0011165'
    else
    if Order = epPCSMEPrelubeInProgress then
      value := '2331E0011040'
    else
    if Order = epPCSMEPrelubeFailure then
      value := '2331E0011039'
    else
    if Order = epPCSMEOilSumpLevel then
      value := '2331E0011140'
    else
    if Order = epPCSMEHeater then
      value := '2331E0011238'
    else
    if Order = epPCSMELOPressVeryLow then
      value := '2331E0011137'
    else
    if Order = epPCSMELOPressClogg then
      value := '2331E0011139'
    else
    if Order = epPCSMEPressFOClogg then
      value := '2331E0011187'
    else
    if Order = epPCSMEInjPipeALeakFO then
      value := '2331E0011188'
    else
    if Order = epPCSMEInjPipeBLeakFO then
      value := '2331E0011189'
    else
    if Order = epPCSMERemoteStartInterlock then
      value := '2331E0011236'
    else
    if Order = epPCSMETurningGearEngaged then
      value := '2331E0011203'
    else
    if Order = epPCSMEManHandleAtStop then
      value := '2331E0011011'
    else
    if Order = epPCSMEFuelRackAtStop then
      value := '2331E0011201'
    else
    if Order = epPCSMEClutched then
      value := '2331E0011004'
    else
    if Order = epPCSMEStartingFault then
      value := '2331E0011019'
    else
    if Order = epPCSMESlowTurningFault then
      value := '2331E0011206'
    else
    if Order = epPCSMESTCSequenceFail then
      value := '2331E0011207'
    else
    if Order = epPCSMESafetyStopSysFail then
      value := '2331E0011213'
    else
    if Order = epPCSMESafetyStop then
      value := '2331E0011018'
    else
    if Order = epPCSMEPrelubricationFailure then
      value := '2331E0011161'
    else
    if Order = epPCSMEPrelubInProgress then
      value := '2331E0011162'
    else
    if Order = epPCSMESafetyStopsOverriden then
      value := '2331E0011017'
    else
    if Order = epPCSMEOverspeedAlarm then
      value := '2331E0011012'
    else
    if Order = epPCSMELOPressVeryLow then
      value := '2331E0011137'
    else
    if Order = epPCSMEBearTempVeryHigh then
      value := '2331E0011156'
    else
    if Order = epPCSMEFwHtExpTkLevelVeryLow then
      value := '2331E0011182'
    else
    if Order = epPCSMEFwTempVeryHigh then
      value := '2331E0011184'
    else
    if Order = epPCSMEConRodBearTempVeryHigh then
      value := '2331E0011176'
    else
    if Order = epPCSMERedGearSafetyStop then
      value := '2331E0011223'
    else
    if Order = epPCSMEOilMistDetHigh then
      value := '2331E0011163'
    else
    if Order = epPCSMEEmergencyShutdown then
      value := '2331E0011215'
    else
    if Order = epPCSMELocalEmergencyStop then
      value := '2331E0011010'
    else
    if Order = epPCSMEEngInletLubOilVeryHigh then
      value := '2331E0011142'
    else
    if Order = epPCSMEEngineControllerWatchdog then
      value := '2331E0011210'
    else
    if Order = epPCSMECtrlPowerSupplyOn then
      value := '2331E0011226'
    else
    if Order = epPCSMESafetyPowerSuppOn then
      value := '2331E0011227'
    else
    if Order = epPCSMESTCSequenceAlarm then
      value := '2331E0011208'
    else
    if order = epPCSMEGovernorMinorFail then
      value := '2331E0011209'
    else
    if Order = epPCSMESTCInManualMode then
      value := '2331E0011221'
    else
    if Order = epPCSMELocalCtrlFail then
      value := '2331E0011222'
    else
    if Order = epPCSMEClutchFail then
      value := '2331E0011231'
    else
    if Order = epPCSMEDeclutchFail then
      value := '2331E0011232'
    else
    if Order = epPCSMECommFailEC_PLC then
      value := '2331E0011235'
    else
    if Order = epPCSMEPLCMonitoringFail then
      value := '2331E0011228'
    else
    if Order = epPCSMEClutchFailure then
      value := '2331E0011050'
    else
    if Order = epPCSMEBridgeLeverOORFailure then
      value := '2331E0011051'
    else
    if Order = epPCSMEMCRLeverOORFailure then
      value := '2331E0011053'
    else
    if Order = epPCSMEGeneralSensorFailure then
      value := '2331E0011052'
    else
    if Order = epPCSMETrailAlarm then
      value := '2331E0011061'
    else
    if Order = epPCSMEResetSafetyStopPossible then
      value := '2331E0011211'
    else
    if Order = epPCSCtrlLocal then
      value := ''
    else
    if Order = epPCSCtrlMCR then
      value := '2331E0011006'
    else
    if Order = epPCSCtrlBridge then
      value := ''
    else
    if Order = epPCSMERemoteControlProposed then
      value := '2331E0011007'
    else
    if Order = epPCSMEStartingInProgress then
      value := '2331E0011217'
    else
    if Order = epPCSME2TCMode then
      value := '2331E0011220';
  end
  else
  if PortStaboardID = C_PCS_ME_STARBOARD then
  begin
    if Order = epPCSMERemoteManual then
      value := '2331E0012325'
    else
    if Order = epPCSMERemoteAuto then
      value := '2331E0012225'
    else
    if Order = epPCSMERunning then
      value := '2331E0012013'
    else
    if Order = epPCSMERemoteCtrl then
      value := '2331E0012006'
    else
    if Order = epPCSMESafetyShutdown then
      value := '2331E0012018'
    else
    if Order = epPCSMELowLoad then
      value := '2331E0012042'
    else
    if Order = epPCSMEVeryLowLoad then
      value := '2331E0012043'
    else
    if Order = epPCSMEFsrTimerExpired then
      value := '2331E0012044'
    else
    if Order = epPCSMEMaxFsrKeySwitch then
      value := '2331E0012046'
    else
    if Order = epPCSMEStopIncrease then
      value := '2331E0012009'
    else
    if order = epPCSMEStopDecrease then
      value := '2331E0012008'
    else
    if Order = epPCSMEOverspeed then
      value := '2331E0012193'
    else
    if Order = epPCSMEConRodBearingTempHigh then
      value := '2331E0012177'
    else
    if Order = epPCSMEConRodBearingTempVeryHigh then
      value := '2331E0012176'
    else
    if Order = epPCSMEBearingTempHigh then
      value := '2331E0012155'
    else
    if Order = epPCSMEBearingTempVeryHigh then
      value := '2331E0012156'
    else
    if Order = epPCSMEOilMistDetSafety then
      value := '2331E0012163'
    else
    if Order = epPCSMEOilMistDetFailure then
      value := '2331E0012164'
    else
    if Order = epPCSMEOilMistDetAlarm then
      value := '2331E0012165'
    else
    if Order = epPCSMEPrelubeInProgress then
      value := '2331E0012040'
    else
    if Order = epPCSMEPrelubeFailure then
      value := '2331E0012039'
    else
    if Order = epPCSMEOilSumpLevel then
      value := '2331E0012140'
    else
    if Order = epPCSMEHeater then
      value := '2331E0012238'
    else
    if Order = epPCSMELOPressVeryLow then
      value := '2331E0012137'
    else
    if Order = epPCSMELOPressClogg then
      value := '2331E0012139'
    else
    if Order = epPCSMEPressFOClogg then
      value := '2331E0012187'
    else
    if Order = epPCSMEInjPipeALeakFO then
      value := '2331E0012188'
    else
    if Order = epPCSMEInjPipeBLeakFO then
      value := '2331E0012189'
    else
    if Order = epPCSMERemoteStartInterlock then
      value := '2331E0012236'
    else
    if Order = epPCSMETurningGearEngaged then
      value := '2331E0012203'
    else
    if Order = epPCSMEManHandleAtStop then
      value := '2331E0012011'
    else
    if Order = epPCSMEFuelRackAtStop then
      value := '2331E0012201'
    else
    if Order = epPCSMEClutched then
      value := '2331E0012004'
    else
    if Order = epPCSMEStartingFault then
      value := '2331E0012019'
    else
    if Order = epPCSMESlowTurningFault then
      value := '2331E0012206'
    else
    if Order = epPCSMESTCSequenceFail then
      value := '2331E0012207'
    else
    if Order = epPCSMESafetyStopSysFail then
      value := '2331E0012213'
    else
    if Order = epPCSMESafetyStop then
      value := '2331E0012018'
    else
    if Order = epPCSMEPrelubricationFailure then
      value := '2331E0012161'
    else
    if Order = epPCSMEPrelubInProgress then
      value := '2331E0012162'
    else
    if Order = epPCSMESafetyStopsOverriden then
      value := '2331E0012017'
    else
    if Order = epPCSMEOverspeedAlarm then
      value := '2331E0012012'
    else
    if Order = epPCSMELOPressVeryLow then
      value := '2331E0012137'
    else
    if Order = epPCSMEBearTempVeryHigh then
      value := '2331E0012156'
    else
    if Order = epPCSMEFwHtExpTkLevelVeryLow then
      value := '2331E0012182'
    else
    if Order = epPCSMEFwTempVeryHigh then
      value := '2331E0012184'
    else
    if Order = epPCSMEConRodBearTempVeryHigh then
      value := '2331E0012176'
    else
    if Order = epPCSMERedGearSafetyStop then
      value := '2331E0012223'
    else
    if Order = epPCSMEOilMistDetHigh then
      value := '2331E0012163'
    else
    if Order = epPCSMEEmergencyShutdown then
      value := '2331E0012215'
    else
    if Order = epPCSMELocalEmergencyStop then
      value := '2331E0012010'
    else
    if Order = epPCSMEEngInletLubOilVeryHigh then
      value := '2331E0012142'
    else
    if Order = epPCSMEEngineControllerWatchdog then
      value := '2331E0012210'
    else
    if Order = epPCSMECtrlPowerSupplyOn then
      value := '2331E0012226'
    else
    if Order = epPCSMESafetyPowerSuppOn then
      value := '2331E0012227'
    else
    if Order = epPCSMESTCSequenceAlarm then
      value := '2331E0012208'
    else
    if order = epPCSMEGovernorMinorFail then
      value := '2331E0012209'
    else
    if Order = epPCSMESTCInManualMode then
      value := '2331E0012221'
    else
    if Order = epPCSMELocalCtrlFail then
      value := '2331E0012222'
    else
    if Order = epPCSMEClutchFail then
      value := '2331E0012231'
    else
    if Order = epPCSMEDeclutchFail then
      value := '2331E0012232'
    else
    if Order = epPCSMECommFailEC_PLC then
      value := '2331E0012235'
    else
    if Order = epPCSMEPLCMonitoringFail then
      value := '2331E0012228'
    else
    if Order = epPCSMEClutchFailure then
      value := '2331E0012050'
    else
    if Order = epPCSMEBridgeLeverOORFailure then
      value := '2331E0012051'
    else
    if Order = epPCSMEMCRLeverOORFailure then
      value := '2331E0012053'
    else
    if Order = epPCSMEGeneralSensorFailure then
      value := '2331E0012052'
    else
    if Order = epPCSMETrailAlarm then
      value := '2331E0012061'
    else
    if Order = epPCSMEResetSafetyStopPossible then
      value := '2331E0012211'
    else
    if Order = epPCSCtrlLocal then
      value := ''
    else
    if Order = epPCSCtrlMCR then
      value := '2331E0012006'
    else
    if Order = epPCSCtrlBridge then
      value := ''
    else
    if Order = epPCSMERemoteControlProposed then
      value := '2331E0012007'
    else
    if Order = epPCSMEStartingInProgress then
      value := '2331E0012217'
    else
    if Order = epPCSME2TCMode then
      value := '2331E0012220';

  end
  else
  if PortStaboardID = C_PCS_GB_PORTS then
  begin
    if Order = epPCSGBClutchAllowed then
      value := '2331E0011041'
    else
    if Order = epPCSGBClutchEngaged then      //Clutch Engaged Lamp Indicator
      value := '2410A0001U'
    else
    if Order = epPCSGBOilLevel then
      value := '2410A0001R'
    else
    if Order = epPCSGBPumpNotAuto then
      value := '2410A0001X'
    else
    if Order = epPCSGBPumpStandbyStart then
      value := '2410A0001Y'
    else
    if Order = epPCSGBFilter11 then
      value := '2410A0001O'
    else
    if Order = epPCSGBFilter12 then
      value := '2410A0001P'
    else
    if Order = epPCSGBLOPressInletLow then
      value := '2410A0001Z'
    else
    if Order = epPCSGBShaftLocked then
      value := '2434A0002A'
    else
    if Order = epPCSGBSWFlowBearing then
      value := '5210S0001A'
    else
    if Order = epPCSGBPitchNotZero then
      value := '2436A0007F'
    else
    if Order = epPCSGBPCSClutchInterlock then
      value := '2331E001122'
    else
    if Order = epPCSGBClutchAllowedLOP then
      value := '2331E0011041'
    else
    if Order = epPCSGBClutched then
      value := '2331E0011004'
    else
    if Order = epPCSGBDeclutched then
      value := '2331E0011005'
    else
    if Order = epPCSGBSafetyDeclutch then
      value := '2331E0011224';
  end
  else
  if PortStaboardID = C_PCS_GB_STARBOARD then
  begin
    if Order = epPCSGBClutchAllowed then
      value := '2331E0012041'
    else
    if Order = epPCSGBClutchEngaged then
      value := '2410A0002U'
    else
    if Order = epPCSGBOilLevel then
      value := '2410A0002R'
    else
    if Order = epPCSGBPumpNotAuto then
      value := '2410A0002X'
    else
    if Order = epPCSGBPumpStandbyStart then
      value := '2410A0002Y'
    else
    if Order = epPCSGBFilter11 then
      value := '2410A0002O'
    else
    if Order = epPCSGBFilter12 then
      value := '2410A0002P'
    else
    if Order = epPCSGBLOPressInletLow then
      value := '2410A0002Z'
    else
    if Order = epPCSGBShaftLocked then
      value := '2434A0001A'
    else
    if Order = epPCSGBSWFlowBearing then
      value := '5210S0002A'
    else
    if Order = epPCSGBPitchNotZero then
      value := '2436A0008F'
    else
    if Order = epPCSGBPCSClutchInterlock then
      value := '2331E001222'
    else
    if Order = epPCSGBClutchAllowedLOP then
      value := '2331E0012041'
    else
    if Order = epPCSGBClutched then
      value := '2331E0012004'
    else
    if Order = epPCSGBDeclutched then
      value := '2331E0012005'
    else
    if Order = epPCSGBSafetyDeclutch then
      value := '2331E0012224';
  end
  else
  if PortStaboardID = C_PCS_CPP_PORTS then
  begin
    if Order = epPCSCPPRemote then
      value := '2436A0007G'
    else
//    if Order = epPCSCPPRemoteAuto then
//      value := '2436A0007G'
//    else
//    if Order = epPCSCPPRemoteManual then
//      value := '2436A0007G'
//    else
    if Order = epPCSCPPPumpStandby1 then
      value := '2436A0001B'
    else
    if Order = epPCSCPPPumpStandby2 then
      value := '2436A0010B'
    else
    if Order = epPCSCPPCLSControl then
      value := '2436A0007A'
    else
    if Order = epPCSCPPBackupSupplyFail then
      value := '2436A0007C'
    else
    if Order = epPCSCPPFollowUpError then
      value := '2436A0007B'
    else
    if Order = epPCSCPPHPPOilLevel then
      value := '2431A0006C'
    else
    if Order = epPCSCPPOilLevel then
      value := '2431A0008A'
    else
    if Order = epPCSCPPPitchNotZero then
      value := '2436A0007F'
    else
    if Order = epPCSCPPOilFilterClogged then
      value := '2431A0006B'
    else
    if Order = epPCSCPPLocal then
      value := '2436A0007D';

  end
  else
  if PortStaboardID = C_PCS_CPP_STARBOARD then
  begin
    if Order = epPCSCPPRemote then
      value := '2436A0008G'
    else
//    if Order = epPCSCPPRemoteAuto then
//      value := '2436A0008G'
//    else
//    if Order = epPCSCPPRemoteManual then
//      value := '2436A0008G'
//    else
    if Order = epPCSCPPPumpStandby1 then
      value := '2436A0002B'
    else
    if Order = epPCSCPPPumpStandby2 then
      value := '2436A0011B'
    else
    if Order = epPCSCPPCLSControl then
      value := '2436A0008A'
    else
    if Order = epPCSCPPBackupSupplyFail then
      value := '2436A0008C'
    else
    if Order = epPCSCPPFollowUpError then
      value := '2436A0008B'
    else
    if Order = epPCSCPPHPPOilLevel then
      value := '2431A0005C'
    else
    if Order = epPCSCPPOilLevel then
      value := '2431A0007A'
    else
    if Order = epPCSCPPPitchNotZero then
      value := '2436A0008F'
    else
    if Order = epPCSCPPOilFilterClogged then
      value := '2431A0005B'
    else
    if Order = epPCSCPPLocal then
      value := '2436A0008D';


  end;

end;

function TSearchPCSElementID.getVCEElementID(PortStaboardID: string;
  var value: string; Order: E_PropsID): Boolean;
begin
  Result := True;
  if PortStaboardID = C_PCS_ME_PORTS then
  begin
    if Order = epPCSMEAirValve then
      value := '2331E0011129'
    else
    if Order = epPCSMEGasValve then
      value := '2331E0011131'
    else
    if Order = epPCSMEBypassP2P4 then
      value := '2331E0011127';
  end
  else
  if PortStaboardID = C_PCS_ME_STARBOARD then
  begin
    if Order = epPCSMEAirValve then
      value := '2331E0012129'
    else
    if Order = epPCSMEGasValve then
      value := '2331E0012131'
    else
    if Order = epPCSMEBypassP2P4 then
      value := '2331E0012127';
  end
  else
  if PortStaboardID = C_PCS_GB_PORTS then
  begin
    if Order = epPCSGBClutchEngagedVCE then       //Clutch Engaged Indicator (Blinking)
      value := '2410A0001M';
  end
  else
  if PortStaboardID = C_PCS_GB_STARBOARD then
  begin
    if Order = epPCSGBClutchEngagedVCE then
      value := '2410A0002M';
  end;

end;

end.
