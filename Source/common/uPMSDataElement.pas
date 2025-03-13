unit uPMSDataElement;

interface

uses uDataType, SysUtils, StrUtils;

type
  TSearchPMSElementID = class
  private
  public
    constructor Create; overload;
    destructor Destroy; override;

    function getGenModeElementID(GenSwitchID: string; valueInt: Integer;
      var value: string): Boolean;
    function getAAEElementID(GenSwitchID: string; var value: string;
      konstanta: Integer): Boolean;
    function getSSEElementID(GenSwitchID: string; var value: string;
      konstanta: Integer): Boolean;
    function getSWEElementID(GenSwitchID: string; var value: string;
      konstanta: Integer): Boolean;
    function getCTRElementID(GenSwitchID: string; var value: string;
      konstanta: Integer): Boolean;
    function getMTRElementID(GenSwitchID: string; var value: string;
      konstanta: Integer): Boolean;
    function getRHEElementID(GenSwitchID: string; var value: string;
      konstanta: Integer): Boolean;
    function getCBEElementID(GenSwitchID: string; var value: string;
      konstanta: Integer): Boolean;
    function getCBEElementIDInt(GenSwitchID: string; var value: string;
      valueint, konstanta: Integer): Boolean;

    procedure getCTREngineID(ElementName: string; var val1: string;
      var val2: E_PropsID; var val3: Integer);
    procedure getCBEEngineID(ElementName: string; var val1: string;
      var val2: E_PropsID; var val3: Integer; konstanta : Integer);
  end;

var
  SearchPMSElementID : TSearchPMSElementID;

implementation

{ TSearchPMSElementID }

constructor TSearchPMSElementID.Create;
begin
  inherited;
end;

destructor TSearchPMSElementID.Destroy;
begin
//
end;

function TSearchPMSElementID.getGenModeElementID(GenSwitchID: string;
  valueInt: Integer; var value: string): Boolean;
begin
  Result := True;

  if GenSwitchID = 'Generator 1' then
  begin
    if valueInt = 1 then
      value := '3241E50024S'
    else if valueInt = 2 then
      value := '3241E50024P'
    else if valueInt = 3 then
      value := '3241E50024I'
    else
      Result := False;
  end
  else if GenSwitchID = 'Generator 2' then
  begin
    if valueInt = 1 then
      value := '3241E50023S'
    else if valueInt = 2 then
      value := '3241E50023P'
    else if valueInt = 3 then
      value := '3241E50023I'
    else
      Result := False;
  end
  else if GenSwitchID = 'Generator 3' then
  begin
    if valueInt = 1 then
      value := '3241E50014S'
    else if valueInt = 2 then
      value := '3241E50014P'
    else if valueInt = 3 then
      value := '3241E50014I'
    else
      Result := False;
  end
  else if GenSwitchID = 'Generator 4' then
  begin
    if valueInt = 1 then
      value := '3241E50013S'
    else if valueInt = 2 then
      value := '3241E50013P'
    else if valueInt = 3 then
      value := '3241E50013I'
    else
      Result := False;
  end
  else if GenSwitchID = 'Emergency Generator' then
  begin
    if valueInt = 1 then
      value := '3241E50031S'
    else if valueInt = 2 then
      value := '3241E50031P'
    else if valueInt = 3 then
      value := '3241E50031I'
    else
      Result := False;
  end
  else
    Result := False;
end;

function TSearchPMSElementID.getMTRElementID(GenSwitchID: string;
  var value: string; konstanta: Integer): Boolean;
begin
  Result := True;

  if GenSwitchID = 'Generator 1' then
  begin
    if konstanta = C_MTR_GEN then
      value := '3241E50024H'
    else
      Result := False;
  end
  else if GenSwitchID = 'Generator 2' then
  begin
    if konstanta = C_MTR_GEN then
      value := '3241E50023H'
    else
      Result := False;
  end
  else if GenSwitchID = 'Generator 3' then
  begin
    if konstanta = C_MTR_GEN then
      value := '3241E50014H'
    else
      Result := False;
  end
  else if GenSwitchID = 'Generator 4' then
  begin
    if konstanta = C_MTR_GEN then
      value := '3241E50013H'
    else
      Result := False;
  end
  else if GenSwitchID = 'Emergency Generator' then
  begin
    if konstanta = C_MTR_GEN then
      value := '3241E50031J'
    else
      Result := False;
  end
  else
    Result := False;
end;

function TSearchPMSElementID.getRHEElementID(GenSwitchID: string;
  var value: string; konstanta: Integer): Boolean;
begin
  Result := True;

  if GenSwitchID = 'Generator 1' then
    value := '3241E50024R'
  else if GenSwitchID = 'Generator 2' then
    value := '3241E50023R'
  else if GenSwitchID = 'Generator 3' then
    value := '3241E50014AR'
  else if GenSwitchID = 'Generator 4' then
    value := '3241E50013R'
  else
    Result := False;
end;

function TSearchPMSElementID.getAAEElementID(GenSwitchID: string;
  var value: string; konstanta: Integer): Boolean;
begin
  Result := True;

  if GenSwitchID = 'Generator 1' then
  begin
    if konstanta = C_POW_GEN then
      value := '3241E50024M'
    else if konstanta = C_FREQ_GEN then
      value := '3241E50024L'
    else if konstanta = C_CUR_GEN then
      value := '3241E50024K'
    else if konstanta = C_VOLT_GEN then
      value := '3241E50024N'
    else if konstanta = C_COS_GEN then
      value := '3241E50024O'
    else if konstanta = C_U_GEN then
      value := '3110A0001C'
    else if konstanta = C_V_GEN then
      value := '3110A0001D'
    else if konstanta = C_W_GEN then
      value := '3110A0001E'
    else
      Result := False;
  end
  else if GenSwitchID = 'Generator 2' then
  begin
    if konstanta = C_POW_GEN then
      value := '3241E50023M'
    else if konstanta = C_FREQ_GEN then
      value := '3241E50023L'
    else if konstanta = C_CUR_GEN then
      value := '3241E50023K'
    else if konstanta = C_VOLT_GEN then
      value := '3241E50023N'
    else if konstanta = C_COS_GEN then
      value := '3241E50023O'
    else if konstanta = C_U_GEN then
      value := '3110A0002C'
    else if konstanta = C_V_GEN then
      value := '3110A0002D'
    else if konstanta = C_W_GEN then
      value := '3110A0002E'
    else
      Result := False;
  end
  else if GenSwitchID = 'Generator 3' then
  begin
    if konstanta = C_POW_GEN then
      value := '3241E50014M'
    else if konstanta = C_FREQ_GEN then
      value := '3241E50014L'
    else if konstanta = C_CUR_GEN then
      value := '3241E50014K'
    else if konstanta = C_VOLT_GEN then
      value := '3241E50014N'
    else if konstanta = C_COS_GEN then
      value := '3241E50014O'
    else if konstanta = C_U_GEN then
      value := '3110A0003C'
    else if konstanta = C_V_GEN then
      value := '3110A0003D'
    else if konstanta = C_W_GEN then
      value := '3110A0003E'
    else
      Result := False;
  end
  else if GenSwitchID = 'Generator 4' then
  begin
    if konstanta = C_POW_GEN then
      value := '3241E50013M'
    else if konstanta = C_FREQ_GEN then
      value := '3241E50013L'
    else if konstanta = C_CUR_GEN then
      value := '3241E50013K'
    else if konstanta = C_VOLT_GEN then
      value := '3241E50013N'
    else if konstanta = C_COS_GEN then
      value := '3241E50013O'
    else if konstanta = C_U_GEN then
      value := '3110A0004C'
    else if konstanta = C_V_GEN then
      value := '3110A0004D'
    else if konstanta = C_W_GEN then
      value := '3110A0004E'
    else
      Result := False;
  end
  else if GenSwitchID = 'Emergency Generator' then
  begin
    if konstanta = C_POW_GEN then
      value := '3241E50031C'
    else if konstanta = C_FREQ_GEN then
      value := '3241E50031B'
    else if konstanta = C_CUR_GEN then
      value := '3241E50031A'
    else if konstanta = C_VOLT_GEN then
      value := '3241E50031D'
    else if konstanta = C_COS_GEN then
      value := '3241E50031E'
    else
      Result := False;
  end
  else if GenSwitchID = 'Switchboard FWD' then
  begin
    if konstanta = C_FREQ_GEN then
      value := '3241E5002L'
    else if konstanta = C_VOLT_GEN then
      value := '3241E5002N'
    else
      Result := False;
  end
  else if GenSwitchID = 'Switchboard AFT' then
  begin
    if konstanta = C_FREQ_GEN then
      value := '3241E5001L'
    else if konstanta = C_VOLT_GEN then
      value := '3241E5001N'
    else
      Result := False;
  end
  else
    Result := False;
end;

function TSearchPMSElementID.getCBEElementID(GenSwitchID: string;
  var value: string; konstanta: Integer): Boolean;
begin
  Result := True;

  if GenSwitchID = 'Generator 1' then
  begin
    if (konstanta = C_CBE_GEN) or (konstanta = C_CBE_GEN_FAILURE) then
      value := '3241E50024F'
    else
      Result := False;
  end
  else if GenSwitchID = 'Generator 2' then
  begin
    if (konstanta = C_CBE_GEN) or (konstanta = C_CBE_GEN_FAILURE) then
      value := '3241E50023F'
    else
      Result := False;
  end
  else if GenSwitchID = 'Generator 3' then
  begin
    if (konstanta = C_CBE_GEN) or (konstanta = C_CBE_GEN_FAILURE) then
      value := '3241E50014F'
    else
      Result := False;
  end
  else if GenSwitchID = 'Generator 4' then
  begin
    if (konstanta = C_CBE_GEN) or (konstanta = C_CBE_GEN_FAILURE) then
      value := '3241E50013F'
    else
      Result := False;
  end
  else if GenSwitchID = 'Emergency Generator' then
  begin
    if (konstanta = C_CBE_GEN) or (konstanta = C_CBE_GEN_FAILURE) then
      value := '3241E50031F'
    else
      Result := False;
  end
  else if GenSwitchID = 'Switchboard FWD' then
  begin
    if konstanta = C_CBE_INT then
      value := '3241E50024Z'
    else if konstanta = C_CBNAVNAUT then
      value := '3243E5005C'
    else
      Result := False;
  end
  else if GenSwitchID = 'Switchboard AFT' then
  begin
    if konstanta = C_CBE_INT then
      value := '3241E50013Z'
    else
      Result := False;
  end
  else if GenSwitchID = 'Switchboard Emergency' then
  begin
    if konstanta = C_CBNAVNAUT then
      value := '3243E5005B'
    else
      Result := False;
  end
  else
    Result := False;
end;

function TSearchPMSElementID.getCBEElementIDInt(GenSwitchID: string;
  var value: string; valueint, konstanta: Integer): Boolean;
begin
  Result := False;
  if GenSwitchID = 'Switchboard Emergency' then
  begin
    if konstanta = C_CBE_ESB then
    begin
      {valueint 1:aft; valueint 2:fwd }
      if valueint = 1 then
      begin
        value := '3241E50031G';
        Result := True;
      end
      else if valueint = 3 then
      begin
        value := '3241E50031H';
        Result := True;
      end
    end
  end
end;

function TSearchPMSElementID.getCTRElementID(GenSwitchID: string;
  var value: string; konstanta: Integer): Boolean;
begin
  Result := True;
  if GenSwitchID = 'Generator 1' then
  begin
    if konstanta = C_BTN_START then
      value := '3241E50024A'
    else if konstanta = C_BTN_STOP then
      value := '3241E50024B'
    else if konstanta = C_BTN_AUTO then
      value := '3241E50024C'
    else if konstanta = C_BTN_SEMIAUTO then
      value := '3241E50024D'
    else if konstanta = C_BTN_PREF  then
      value := '3241E50024E'
    else
      Result := False;
  end
  else if GenSwitchID = 'Generator 2' then
  begin
    if konstanta = C_BTN_START then
      value := '3241E50023A'
    else if konstanta = C_BTN_STOP then
      value := '3241E50023B'
    else if konstanta = C_BTN_AUTO then
      value := '3241E50023C'
    else if konstanta = C_BTN_SEMIAUTO then
      value := '3241E50023D'
    else if konstanta = C_BTN_PREF  then
      value := '3241E50023E'
    else
      Result := False;
  end
  else if GenSwitchID = 'Generator 3' then
  begin
    if konstanta = C_BTN_START then
      value := '3241E50014A'
    else if konstanta = C_BTN_STOP then
      value := '3241E50014B'
    else if konstanta = C_BTN_AUTO then
      value := '3241E50014C'
    else if konstanta = C_BTN_SEMIAUTO then
      value := '3241E50014D'
    else if konstanta = C_BTN_PREF  then
      value := '3241E50014E'
    else
      Result := False;
  end
  else if GenSwitchID = 'Generator 4' then
  begin
    if konstanta = C_BTN_START then
      value := '3241E50013A'
    else if konstanta = C_BTN_STOP then
      value := '3241E50013B'
    else if konstanta = C_BTN_AUTO then
      value := '3241E50013C'
    else if konstanta = C_BTN_SEMIAUTO then
      value := '3241E50013D'
    else if konstanta = C_BTN_PREF  then
      value := '3241E50013E'
    else
      Result := False;
  end
  else
    Result := False;
end;

function TSearchPMSElementID.getSSEElementID(GenSwitchID: string;
  var value: string; konstanta: Integer): Boolean;
begin
  Result := True;
  if GenSwitchID = 'Switchboard FWD' then
  begin
    if konstanta = C_TRAFO115V then
      value := '3244E5003A'
    else if konstanta = C_TRAFO230V then
      value := '3243E5003A'
    else
      Result := False;
  end
  else if GenSwitchID = 'Switchboard AFT' then
  begin
    if konstanta = C_TRAFO115V then
      value := '3244E5001A'
    else if konstanta = C_TRAFO230V then
      value := '3243E5001A'
    else
      Result := False;
  end
  else if GenSwitchID = 'Switchboard Emergency' then
  begin
    if konstanta = C_TRAFO230V then
      value := '3243E5031A'
    else
      Result := False;
  end
  else
    Result := False;
end;

function TSearchPMSElementID.getSWEElementID(GenSwitchID: string;
  var value: string; konstanta: Integer): Boolean;
begin
  Result := True;
  if GenSwitchID = 'Generator 1' then
  begin
    if konstanta = C_IND_ENGINERUNNING then
      value := '3241E50024G'
    else if konstanta = C_IND_GENSUP then
      value := '3241E50024T'
    else if konstanta = C_IND_PREF then
      value := '3241E50024J'
    else if konstanta = C_ALRM_CANBUS then
      value := '3241E50024Q'
    else if konstanta = C_ALRM_CTRLPOW then
      value := '3241E50024U'
    else if konstanta = C_ALRM_POWSUP then
      value := '3241E50024V'
    else if konstanta = C_ALRM_NOTSTANDBY then
      value := '3241E50024X'
    else if konstanta = C_ALRM_ENGINE then
      value := '3110A0001B'
    else if konstanta = C_ALRM_SHUTDOWN then
      value := '3110A0001A'
    else
      Result := False;
  end
  else if GenSwitchID = 'Generator 2' then
  begin
    if konstanta = C_IND_ENGINERUNNING then
      value := '3241E50023G'
    else if konstanta = C_IND_GENSUP then
      value := '3241E50023T'
    else if konstanta = C_IND_PREF then
      value := '3241E50023J'
    else if konstanta = C_ALRM_CANBUS then
      value := '3241E50023Q'
    else if konstanta = C_ALRM_CTRLPOW then
      value := '3241E50023U'
    else if konstanta = C_ALRM_POWSUP then
      value := '3241E50023V'
    else if konstanta = C_ALRM_NOTSTANDBY then
      value := '3241E50023X'
    else if konstanta = C_ALRM_ENGINE then
      value := '3110A0002B'
    else if konstanta = C_ALRM_SHUTDOWN then
      value := '3110A0002A'
    else
      Result := False;
  end
  else if GenSwitchID = 'Generator 3' then
  begin
    if konstanta = C_IND_ENGINERUNNING then
      value := '3241E50014G'
    else if konstanta = C_IND_GENSUP then
      value := '3241E50014T'
    else if konstanta = C_IND_PREF then
      value := '3241E50014J'
    else if konstanta = C_ALRM_CANBUS then
      value := '3241E50014Q'
    else if konstanta = C_ALRM_CTRLPOW then
      value := '3241E50014U'
    else if konstanta = C_ALRM_POWSUP then
      value := '3241E50014V'
    else if konstanta = C_ALRM_NOTSTANDBY then
      value := '3241E50014X'
    else if konstanta = C_ALRM_ENGINE then
      value := '3110A0003B'
    else if konstanta = C_ALRM_SHUTDOWN then
      value := '3110A0003A'
    else
      Result := False;
  end
  else if GenSwitchID = 'Generator 4' then
  begin
    if konstanta = C_IND_ENGINERUNNING then
      value := '3241E50013G'
    else if konstanta = C_IND_GENSUP then
      value := '3241E50013T'
    else if konstanta = C_IND_PREF then
      value := '3241E50013J'
    else if konstanta = C_ALRM_CANBUS then
      value := '3241E50013Q'
    else if konstanta = C_ALRM_CTRLPOW then
      value := '3241E50013U'
    else if konstanta = C_ALRM_POWSUP then
      value := '3241E50013V'
    else if konstanta = C_ALRM_NOTSTANDBY then
      value := '3241E50013X'
    else if konstanta = C_ALRM_ENGINE then
      value := '3110A0004B'
    else if konstanta = C_ALRM_SHUTDOWN then
      value := '3110A0004A'
    else
      Result := False;
  end
  else if GenSwitchID = 'Emergency Generator' then
  begin
    if konstanta = C_IND_ENGINERUNNING then
      value := '3241E50031K'
    else if konstanta = C_IND_GENSUP then
      value := '3241E50031T'
    else if konstanta = C_ALRM_CTRLPOW then
      value := '3241E50031U'
    else if konstanta = C_ALRM_POWSUP then
      value := '3241E50031V'
    else if konstanta = C_ALRM_NOTSTANDBY then
      value := '3241E50031X'
    else if konstanta = C_ALRM_ENGINE then
      value := '3120A0005B'
    else if konstanta = C_ALRM_SHUTDOWN then
      value := '3120A0005A'
    else if konstanta = C_ALRM_FAULTPAGELED then
      value := '3241E50031Z'
    else
      Result := False;
  end
  else if GenSwitchID = 'Switchboard FWD' then
  begin
    if konstanta = C_ALRM_TRIP then
      value := '3241E50024W'
    else
      Result := False;
  end
  else if GenSwitchID = 'Switchboard AFT' then
  begin
    if konstanta = C_ALRM_TRIP then
      value := '3241E50014W'
    else
      Result := False;
  end
  else if GenSwitchID = 'Switchboard Emergency' then
  begin
    if konstanta = C_ALRM_TRIP then
      value := '3241E50031W'
    else
      Result := False;
  end
  else
    Result := False;
end;

procedure TSearchPMSElementID.getCTREngineID(ElementName: string;
  var val1: string; var val2: E_PropsID; var val3: Integer);
var
  hrf1, hrf2 : string;
begin
  hrf1 := midstr(ElementName,8,1);
  hrf2 := midstr(ElementName,10,4);

  if hrf1 = '1' then
    val1 := 'Generator 1'
  else if hrf1 = '2' then
    val1 := 'Generator 2'
  else if hrf1 = '3' then
    val1 := 'Generator 3'
  else if hrf1 = '4' then
    val1 := 'Generator 4';

  if hrf2 = 'STAR' then
    val2 := epPMSGeneratorEngineRun
  else if hrf2 = 'STOP' then
    val2 := epPMSGeneratorStop
  else if hrf2 = 'AUTO' then
  begin
    val2 := epPMSGeneratorMode;
    val3 := 3;
  end
  else if hrf2 = 'SEMI' then
  begin
    val2 := epPMSGeneratorMode;
    val3 := 2;
  end
  else if hrf2 = 'PREF' then
    val2 := epPMSGeneratorPreference;
end;

procedure TSearchPMSElementID.getCBEEngineID(ElementName: string;
  var val1: string; var val2: E_PropsID; var val3: Integer; konstanta: Integer);
begin
  if ElementName = 'GEN 1 CB'then
  begin
    val1 := 'Generator 1';

    if (konstanta = 1) or (konstanta = 2) then
      val2 := epPMSGeneratorCBClosed
    else
      val2 := epPMSGeneratorMode;
  end
  else if ElementName = 'GEN 2 CB' then
  begin
    val1 := 'Generator 2';

    if (konstanta = 1) or (konstanta = 2) then
      val2 := epPMSGeneratorCBClosed
    else
      val2 := epPMSGeneratorMode;
  end
  else if ElementName = 'GEN 3 CB' then
  begin
    val1 := 'Generator 3';

    if (konstanta = 1) or (konstanta = 2) then
      val2 := epPMSGeneratorCBClosed
    else
      val2 := epPMSGeneratorMode;
  end
  else if ElementName = 'GEN 4 CB' then
  begin
    val1 := 'Generator 4';

    if (konstanta = 1) or (konstanta = 2) then
      val2 := epPMSGeneratorCBClosed
    else
      val2 := epPMSGeneratorMode;
  end
  else if ElementName = 'EM GEN CB' then
  begin
    val1 := 'Emergency Generator';

    if (konstanta = 1) or (konstanta = 2) then
      val2 := epPMSGeneratorCBClosed
    else
      val2 := epPMSGeneratorMode;
  end
  else if ElementName = 'MSB AFT INTERCON CB' then
  begin
    val1 := 'Switchboard AFT';
    val2 := epPMSMsbCBIntr
  end
  else if ElementName = 'MSB FWD INTERCON CB' then
  begin
    val1 := 'Switchboard FWD';
    val2 := epPMSMsbCBIntr
  end
  else if ElementName = 'ESB MSB AFT CB' then
  begin
    val1 := 'Switchboard Emergency';
    val2 := epPMSEsbIntrMode;
    val3 := 1;
  end
  else if ElementName = 'ESB MSB FWD CB' then
  begin
    val1 := 'Switchboard Emergency';;
    val2 := epPMSEsbIntrMode;
    val3 := 3;
  end;
end;

end.
