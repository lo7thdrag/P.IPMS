unit uPMSSystem;

interface

uses uSwitchboard, uGenerator, uEntity, uLIstener, uCommonSystem, Classes, uDataType;

type

  E_ModeID = (emFwd, emAft, emFull);

  TPMSSystem = class(TCommonSystem)
  private

    FConsumer : TList;

    FStateRunFull : Byte; {1: u/ normal 2: u/ emergency 3: u/ ups}
    FStateRunFwd : Byte; {1: u/ normal 2: u/ emergency 3: u/ ups}
    FStateRunAft : Byte; {1: u/ normal 2: u/ emergency 3: u/ ups}

    FIsFirstLoad : Boolean;

    FDelay : Integer;
    FFwdBusbarDelay : Integer;
    FAftBusbarDelay : Integer;
    FEsbBusbarDelay : Integer;

    FBebanTotal : Double;

    FPreAlarm : array [0..3] of integer;
    FGenOn : array [0..3] of integer;

    {prosedur singkron msb}
    procedure setConnection();
    procedure calcLoadConsumer(IdMode : E_ModeID); {k pake}
    procedure calcEmergencyConsumer(IdMode : E_ModeID); {k pake}
    procedure calcUPSConsumer(IdMode : E_ModeID); {k pake}
    procedure setBlackOut(IdMode : E_ModeID; DGUpLimit, DGLowLimit, MSBUpLimit, MSBLowLimit: Integer); {k pake}
    procedure SetUpperLowerLimit(IdMode: E_ModeID; var DGUpLimit, DGLowLimit, MSBUpLimit, MSBLowLimit: Integer); {k pake}
    procedure SetPreAlarmActive(IdMode: E_ModeID; var SumDGOn: Integer; DGUpLimit, DGLowLimit: Integer); {k pake}

    procedure SetDGOff(IdGen: Integer); {k pake}
    procedure SetMSBOff(IdMsb: Integer); {k pake}
    procedure SetStateRun(IdMode: E_ModeID; IdState: Integer); {k pake}
    procedure SetFreqVoltValue(IdMsb: Integer; ValBus : Boolean; Valfreq, Valvolt: Double);
    procedure SetSwitchFreqValue(IdMsb, IdGen1, IdGen2: Integer; ValBus : Boolean);

    function SetDGStartHandle(DGUpLimit, DGLowLimit: Integer): Boolean; {k pake}
    function CekBusKoplerHandle(IdBusKopler, IdIntrMode: Integer): Boolean; {k pake}
    function GetPreAlarmStop(var IdGenStop: Integer; DGUpLimit, DGLowLimit: Integer): Boolean; {k pake}
    function GetPreAlarmStart(var IdGenStart: Integer; DGUpLimit, DGLowLimit: Integer): Boolean; {k pake}
    function GetCanBusFailureHandle(SumLoad: Double; SumDGOn: Integer; var IdDGPref: Integer; var SisaBeban: Double): Boolean; {k pake}
    function SetDGStopHandle(SumDGOn, DGUpLimit, DGLowLimit: Integer): Boolean; {k pake}
    function CekIsFirstLoadFromScenario(): Boolean;
    function SetDelayConnection(IdBuskopler: integer):Boolean;


  public
    Gen : array [0..4] of TGenerator;
    Msb : array [0..2] of TSwitchboard;
    Pwr : array [0..1] of TPower;

    constructor Create;override;
    destructor Destroy;override;

    procedure Run(const aDt : Double); override;

    { procedur for adding power consumer }
    procedure SetVariablePMS (aFirstLoad : Boolean; aStateRunFull, aStateRunFwd, aStateRunAft : Integer);
    procedure GetVariablePMS (var aStateRunFull, aStateRunFwd, aStateRunAft : Integer);
    procedure AddConsumer(aConsumer : TEntity);

    function getGenerator(aIdent : string) : TGenerator;
    function getSwitchboard(aIdent : string) : TSwitchboard;
    function GetPower(aIdent : string) : TPower;
  end;

var
  PMSSystem : TPMSSystem;

implementation
{ TPMSSystem }

procedure TPMSSystem.AddConsumer(aConsumer: TEntity);
begin

end;

function TPMSSystem.CekBusKoplerHandle(IdBusKopler, IdIntrMode: Integer): Boolean;
{Fungsi ini dipake bersama, proses pengecekannya tergantung parameter yg dikirim}
begin
  Result := False;

  case IdBusKopler of
    1: {U/ mengecek koneksi antar MSB}
    begin
      if (Msb[0].MsbCBIntr and (Msb[1].MsbCBIntr)) or (Msb[0].MSBIntrMode = 3) and (Msb[1].MSBIntrMode = 3) then
        Result := True
    end;
    2: {kiriman dari Emergency n blackout}
    begin
      {di false kan dulu semua}
      Msb[2].EsbCBIntr  := False;

      {mode 4 : smua EsbCB tertutup}
      if IdIntrMode = 0 then
        Msb[2].ESBIntrMode := 1
      else if IdIntrMode = 4 then
        Msb[2].ESBIntrMode := 4
      else
        Msb[2].ESBIntrMode := 3;

      Msb[2].EsbCBIntr := True;
    end;
    3: {U/ mengecek koneksi MSB dgn ESB}
    begin
      if (Msb[2].EsbCBIntr) and (Msb[2].ESBIntrMode = IdIntrMode) then
        Result := True
    end;
  end;
end;

function TPMSSystem.CekIsFirstLoadFromScenario: Boolean;
var
  i : Integer;
begin
  Result := False;

  for i := 0 to Length(C_GENERATOR_ID) - 1 do
  begin
    if (Gen[i].GeneratorSupplied) and (Gen[i].CBClosed) then
    begin
      Result := True;
      FIsFirstLoad := False;
    end;
  end;
end;

constructor TPMSSystem.Create;
var
  generator : TGenerator;
  switchboard : TSwitchboard;
  loadpow : TPower;
  i : integer;
begin
  inherited;

  FConsumer := TList.Create;
  FIsFirstLoad := True;
  FStateRunFull := 1;
  FStateRunFwd := 1;
  FStateRunAft := 1;
  FDelay := 0;

  { create generator }
  for I := 0 to Length(C_GENERATOR_ID) - 1 do
  begin
    generator := TGenerator.Create;
    generator.Identifier := C_GENERATOR_ID[i];
    generator.GeneratorState := 9;
    addEntity(generator);
  end;

  { create switchboard }
  for I := 0 to Length(C_SWITCHBOARD_ID) - 1 do
  begin
    switchboard := TSwitchboard.Create;
    switchboard.Identifier := C_SWITCHBOARD_ID[i];
    addEntity(switchboard);
  end;

  { create load power }
  for I := 0 to Length(C_POWER_ID) - 1 do
  begin
    loadpow := TPower.Create;
    loadpow.Identifier := C_POWER_ID[i];
    addEntity(loadpow);
  end;

  {Ryu : pindahan dr procedure run}
  for i := 0 to Length(C_GENERATOR_ID) - 1 do
    Gen[i] := getGenerator(C_GENERATOR_ID[i]);
  for i := 0 to Length(C_SWITCHBOARD_ID) - 1 do
    Msb[i] := getSwitchboard(C_SWITCHBOARD_ID[i]);
  for i := 0 to Length(C_POWER_ID) - 1 do
    Pwr[i] := GetPower(C_POWER_ID[i]);
end;

destructor TPMSSystem.Destroy;
begin
  FConsumer.Free;

  inherited;
end;

function TPMSSystem.GetCanBusFailureHandle(SumLoad: Double; SumDGOn: Integer; var IdDGPref: Integer; var SisaBeban: Double): Boolean;
var
  i, j : Integer;
  SumPow : Double;

begin
  Result := False;
  SumPow := 0;

  {Cek total daya yg dihasilkan}
  for i := 0 to SumDGOn - 1 do
  begin
    SumPow := SumPow + Gen[FGenOn[i]].Power;
  end;

  for j := 0 to SumDGOn - 1 do
  begin
    {Cek DG preference dan belum mencapai kemampuan maksimum}
    if (Gen[FGenOn[j]].Preference) and (Gen[FGenOn[j]].Power < 285) then
    begin
      IdDGPref := FGenOn[j];
      Break;
    end
    else
      IdDGPref := FGenOn[0];
  end;

  SumPow := SumPow - Gen[IdDGPref].Power;
  SisaBeban := SumLoad - SumPow;

  {jk sisa beban masih bs di handle DG pref/ pertama}
  if (SisaBeban) < 285 then
  begin
    Result := True;

    if SisaBeban < 15 then
      SisaBeban := 35;
  end;
end;

function TPMSSystem.SetDGStartHandle(DGUpLimit, DGLowLimit: Integer): Boolean ;
var
  i : Integer;
begin
  Result:= False;
  {Menyalakan DG}
  for i := DGLowLimit to DGUpLimit  do
  begin
    {Syarat DG Om dset standby, emergency stop normal, dlm mode auto, belum menyala/ load skenario awal, tdk failure}
    if (not Gen[i].NotStandby) and (not Gen[i].EmergencyStop) and (Gen[i].GeneratorMode = 3) and (not Gen[i].EngineAlarm) and
       (not Gen[i].CanBusFailure) and (not Gen[i].MeasPowFailure) and (not Gen[i].DCPowFailure) and (not Gen[i].ShutDown) and
       (not Gen[i].FuelRunsOut) and ((Gen[i].GeneratorState = 1) or (Gen[i].GeneratorState = 9)) then
    begin
      Gen[i].EmergencyStart := True;
      Gen[i].EngineRun := True;
      Result := True;
    end;
  end;
end;

function TPMSSystem.SetDGStopHandle(SumDGOn, DGUpLimit, DGLowLimit: Integer): Boolean;
var
  i, incDG : Integer;
begin
  Result := False;
  incDG := 0;

  for i := DGLowLimit to DGUpLimit do
  begin
    if (Gen[i].GeneratorState = 5) and (Gen[i].CBClosed) then
      incDG := incDG + 1;
  end;

  {untuk penanda DG yg sudah dimatikan pakah sdh mati}
  if incDG = SumDGOn then
    Result := True;
end;

procedure TPMSSystem.SetFreqVoltValue(IdMsb: Integer; ValBus: Boolean; Valfreq,
  Valvolt: Double);
begin
  Msb[IdMsb].Busbar := ValBus;
  Msb[IdMsb].Frequency := Valfreq;
  Msb[IdMsb].Voltage := Valvolt;

  case IdMsb of
    0:
    begin
      if CekBusKoplerHandle(3,3) then
        SetFreqVoltValue(2, ValBus, Valfreq, Valvolt);
    end;
    1:
    begin
      if CekBusKoplerHandle(3,1) then
        SetFreqVoltValue(2, ValBus, Valfreq, Valvolt);
    end;
  end;
end;

function TPMSSystem.getSwitchboard(aIdent: string): TSwitchboard;
begin
  result := Entities.Get(aIdent) as TSwitchboard;
end;

procedure TPMSSystem.GetVariablePMS(var aStateRunFull,
  aStateRunFwd, aStateRunAft: Integer);
begin
  aStateRunFull := FStateRunFull;
  aStateRunFwd := FStateRunFwd;
  aStateRunAft := FStateRunAft;
end;

function TPMSSystem.getGenerator(aIdent: string): TGenerator;
begin
  result := Entities.Get(aIdent) as TGenerator;
end;

function TPMSSystem.GetPower(aIdent: string): TPower;
begin
  result := Entities.Get(aIdent) as TPower;
end;

procedure TPMSSystem.Run(const aDt: Double);
begin
  inherited;

  {Skenario PMS akan mulai dijalankan ketika salah satu busbar tersupply}
  if (not CekIsFirstLoadFromScenario()) and (FIsFirstLoad) then
    Exit;

  {Mengeset aliran power dari msb}
  setConnection;

  {Jk Bus Kopler tertutup}
  if CekBusKoplerHandle(1, 0) then
  begin
    case FStateRunFull of
      1: calcLoadConsumer(emFull);{Normal State}
      2: calcEmergencyConsumer(emFull);{Emergency state}
      3: calcUpsConsumer(emFull){UPS state}
    end;
  end
  {Jk Bus Kopler terbuka}
  else
  begin
    case FStateRunFwd of
      1: calcLoadConsumer(emFwd);{Normal State}
      2: calcEmergencyConsumer(emFwd);{Emergency state}
      3: calcUpsConsumer(emFwd){UPS state}
    end;

    case FStateRunAft of
      1: calcLoadConsumer(emAft);{Normal State}
      2: calcEmergencyConsumer(emAft);{Emergency state}
      3: calcUpsConsumer(emAft){UPS state}
    end;
  end;
end;

procedure TPMSSystem.calcEmergencyConsumer(IdMode: E_ModeID);
var
  i : Integer;                        {digunakan u/ iterasi}
  SumDGOn : Integer;                  {digunakan u/ penampung}
  DGUpLimit, DGLowLimit,
  MSBUpLimit, MSBLowLimit : Integer;  {digunakan u/ batas iterasi}
  Pemakaian : Double;                 {digunakan u/ perhitungan}

begin
  {Cek batas tiap IdMode}
  SetUpperLowerLimit(IdMode, DGUpLimit, DGLowLimit, MSBUpLimit, MSBLowLimit);

  {Set beban total yg hrs dihandle EG}
  FBebanTotal := 0;
  for i := MSBLowLimit to MSBUpLimit do
    FBebanTotal := FBebanTotal + Pwr[i].PowerConsmr;

  {Cek DG yg nyala dan Set pre alarm DG ke dalam list}
  SetPreAlarmActive(IdMode, SumDGOn, DGUpLimit, DGLowLimit);

  Pemakaian := (FBebanTotal/ 115) * 100;

  if SumDGOn = 0 then
  begin
    {EG mati jk persentase pemakaian diatas 85% kemampuan}
    if (Pemakaian > 85) then
    begin
      Gen[4].GeneratorState := 6;

      {state diubah k normal}
      SetStateRun(IdMode, 3);
    end

    {Power EG menyesuaikan jk persentase beban didalam range stabil}
    else if (Pemakaian <= 85) then
    begin
      if Gen[4].GeneratorState <> 5 then
        setBlackOut(IdMode, DGUpLimit, DGLowLimit, MSBUpLimit, MSBLowLimit)
      else
        Gen[4].PowerState := FBebanTotal
    end;
  end
  else
  begin
    {EG mati jk DG sdh menyala normal}
    Gen[4].GeneratorState := 6;

    {state diubah k normal}
    Msb[2].EmergencyCon := False;
    SetStateRun(IdMode, 1);
  end;

  {DG dinyalakan ketika power EG sdh stabil}
  if (Gen[4].Power > 40) then
  begin
    if SetDGStartHandle(DGUpLimit, DGLowLimit) then
    begin
      CekBusKoplerHandle(2,MSBLowLimit)
    end;
  end;

end;

procedure TPMSSystem.calcLoadConsumer(IdMode : E_ModeID);
var
  i, j, k, l : Integer;                                     {digunakan u/ iterasi}
  IdGenStart, IdGenStop, SumDGOn, IdDGPref : Integer;       {digunakan u/ penampung}
  DGUpLimit, DGLowLimit, MSBUpLimit, MSBLowLimit : Integer; {digunakan u/ batas iterasi}
  Pemakaian, SisaBeban : Double;                            {digunakan u/ perhitungan}


begin
  {Cek batas tiap IdMode}
  SetUpperLowerLimit(IdMode, DGUpLimit, DGLowLimit, MSBUpLimit, MSBLowLimit);

  {Set beban total yg hrs dihandle DG}
  FBebanTotal := 0;
  for i := MSBLowLimit to MSBUpLimit do
    FBebanTotal := FBebanTotal + Pwr[i].PowerConsmr;

  {Cek DG yg nyala dan Set pre alarm DG ke dalam list}
  SetPreAlarmActive(IdMode, SumDGOn, DGUpLimit, DGLowLimit);

  {Set persentase total pemakaian, jk tdk ada DG yg nyala pemakaian dianggap > 90%}
  if (FBebanTotal = 0) then
    Exit
  else if (SumDGOn = 0) and (FBebanTotal > 0) then
  begin
    if (Msb[0].Voltage > 0) or (Msb[1].Voltage > 0) then
    begin
      case IdMode  of
        emFwd: Pwr[0].PowerConsmr := 0;
        emAft: Pwr[1].PowerConsmr := 0;
      end;
      Exit
    end
    else
    begin
      setBlackOut(IdMode, DGUpLimit, DGLowLimit, MSBUpLimit, MSBLowLimit);
      Exit;
    end;
  end
  else
    Pemakaian := (FBebanTotal/ (SumDGOn * 320)) * 100;

  {Meminta bantuan DG lain. Syarat jk persentase pemakaian diatas 85% kemampuan total Dg yg nyala}
  if (Pemakaian > 85) then
  begin
    {DG yg sdh nyala dset over maksimum dulu}
    for j := 0 to SumDGOn - 1 do
      Gen[FGenOn[j]].PowerState := 300;

    {cek apakah ada DG dalam pre alarm, jk masih ada nyalakan}
    if GetPreAlarmStart(IdGenStart, DGUpLimit, DGLowLimit) then
    begin
      for k := 0 to SumDGOn - 1 do
      begin
        if Gen[FGenOn[k]].Power < 285 then
          Exit
      end;

      {menyalakan engine dgn state emergency}
      Gen[IdGenStart].EmergencyStart := True;
      Gen[IdGenStart].EngineRun := True;
    end
    {jk tdk ada DG pre alaram maka blackout}
    else
    begin
      if (Msb[0].Voltage > 0) or (Msb[1].Voltage > 0) then
      begin
        for i := DGLowLimit to DGUpLimit do
        begin
          SetDGOff(i);
        end;
        Exit;
      end;

      setBlackOut(IdMode, DGUpLimit, DGLowLimit, MSBUpLimit, MSBLowLimit);
    end;
  end

  {Mematikan DG lain. Syarat jk persentase pemakaian dibawah 38%, 50%, 56% kemampuan total Dg yg nyala}
  else if (SumDGOn = 2) and (Pemakaian < 38) and (GetPreAlarmStop(IdGenStop, DGUpLimit, DGLowLimit)) then
  begin
    {menghindari proses looping agar tidak mematikan semua DG}
    if SetDGStopHandle(SumDGOn, DGUpLimit, DGLowLimit) then
    begin
      {Sebelum mematikan DG yg tdk diperlukan, DG yg menyala diset maksimal dulu}
      for j := 0 to SumDGOn - 1 do
      begin
        if j <> IdGenStop then
        begin
          if FBebanTotal > 285 then
            Gen[FGenOn[j]].PowerState := 285
          else
            Gen[FGenOn[j]].PowerState := FBebanTotal;
        end;
      end;

      if Gen[FGenOn[0]].Power >= (FBebanTotal/2) then
        Gen[IdGenStop].GeneratorState := 6
    end;
  end
  else if (SumDGOn = 3) and (Pemakaian < 50) and (GetPreAlarmStop(IdGenStop, DGUpLimit, DGLowLimit)) then
  begin
    if SetDGStopHandle(SumDGOn, DGUpLimit, DGLowLimit) then
    begin
      for j := 0 to SumDGOn - 1 do
      begin
        if j <> IdGenStop then
        begin
          if FBebanTotal > 300 then
            Gen[FGenOn[j]].PowerState := 285
          else
            Gen[FGenOn[j]].PowerState := FBebanTotal/2;
        end;
      end;

      if Gen[FGenOn[0]].Power >= (FBebanTotal/2) then
        Gen[IdGenStop].GeneratorState := 6
    end;
  end
  else if (SumDGOn = 4) and (Pemakaian < 56) and (GetPreAlarmStop(IdGenStop, DGUpLimit, DGLowLimit)) then
  begin
    if SetDGStopHandle(SumDGOn, DGUpLimit, DGLowLimit) then
    begin
      for j := 0 to SumDGOn - 1 do
      begin
        if j <> IdGenStop then
        begin
          if FBebanTotal > 300 then
            Gen[FGenOn[j]].PowerState := 285
          else
            Gen[FGenOn[j]].PowerState := FBebanTotal/3;
        end;
      end;

      if Gen[FGenOn[0]].Power >= (FBebanTotal/3) then
        Gen[IdGenStop].GeneratorState := 6
    end;
  end

  {Jk persentase didalam range stabil kemampuan total Dg yg nyala}
  else if (Pemakaian <= 85) then
  begin
    {jk Can Bus Failure, DG sequen pertama diset maks }
    if Gen[FGenOn[0]].CanBusFailure then
    begin
      {Total Beban, jml DG nyala, IdDG yg disiapkan, sisa beban utk DG yg disiapkan  }
      if GetCanBusFailureHandle(FBebanTotal, SumDGOn, IdDGPref, SisaBeban)then
        Gen[IdDGPref].PowerState := SisaBeban
      else
        setBlackOut(IdMode, DGUpLimit, DGLowLimit, MSBUpLimit, MSBLowLimit);
    end
    else
    begin
      for l := 0 to SumDGOn-1 do
      begin
        if Round(FBebanTotal/SumDGOn) < 30 then
          Gen[FGenOn[l]].PowerState := 30
        else
          Gen[FGenOn[l]].PowerState := Round(FBebanTotal/SumDGOn);
      end;
    end;
  end;

end;

procedure TPMSSystem.calcUPSConsumer(IdMode: E_ModeID);
var
  i,j,k : Integer;
begin
  case IdMode of
    emFwd :
    begin
      for i := 0 to 1 do
      begin
        if Gen[i].GeneratorSupplied and Gen[i].CBClosed then
          FStateRunFwd := 1;
      end;
    end;
    emAft :
    begin
      for j := 2 to 3 do
      begin
        if Gen[j].GeneratorSupplied and Gen[j].CBClosed then
          FStateRunAft := 1;
      end;
    end;
    emFull:
    begin
      for k := 0 to 3 do
      begin
        if Gen[k].GeneratorSupplied and Gen[k].CBClosed then
          FStateRunFull := 1;
      end;
    end;
  end;

end;

procedure TPMSSystem.setBlackOut(IdMode : E_ModeID; DGUpLimit, DGLowLimit, MSBUpLimit, MSBLowLimit: Integer);
var
  i, j : Integer;
begin
  {Mematikan semua DG yg terhubung ke MSB}
  for i := DGLowLimit to DGUpLimit do
  begin
    SetDGOff(i);
  end;

  {Memutus power yg masuk ke MSB}
  for j := MSBLowLimit to MSBUpLimit do
  begin
    SetMSBOff(j);
  end;

  {Menyalakan Emergency Generator}
  if (Gen[4].GeneratorMode = 3) and (not Gen[4].NotStandby) and (not Gen[4].EngineAlarm) and (not Gen[4].CanBusFailure) and
     (not Gen[4].MeasPowFailure) and (not Gen[4].DCPowFailure) and (not Gen[4].ShutDown) then
  begin
    CekBusKoplerHandle(2, 4);

    {jk generator msh dlm keadaan mati, nyalakan}
    if Gen[4].GeneratorState = 1 then
    begin
      Gen[4].EmergencyStart := True;
      Gen[4].EngineRun := True;
    end;

    {state diubah k emergency}
    Msb[2].EmergencyCon := True;
    SetStateRun(IdMode, 2)
  end

  {disini tempat untuk mengkondisikan UPS state}

end;

procedure TPMSSystem.SetPreAlarmActive(IdMode: E_ModeID; var SumDGOn: Integer; DGUpLimit, DGLowLimit : Integer);
var
  a, b, i, j, k : Byte;
begin
  a := 0;
  b := 0;

  {List dr Generator yg nyala dan yg pre alarm active di reset dulu}
  for i := DGLowLimit to DGUpLimit do
  begin
    FGenOn[i] := 9; {g tau cara ngeset nilai array kosong}
    FPreAlarm[i] := 9;
  end;

  {Set list generator yg nyala}
  for j := DGLowLimit to DGUpLimit do
  begin
    if (Gen[j].GeneratorSupplied) and (Gen[j].CBClosed) then
    begin
      FGenOn[a]:= j;
      a:= a+1;

      {sebaiknya disini dikasih coding untuk menghitung jumlah power di msb}
//      SetMSBConnection(IdMode, j)
    end
  end;

  {Set list generator yg pre alarm}
  for k := DGLowLimit to DGUpLimit do
  begin
    {Syarat pre alarm active: dset standby, emergency stop normal, dlm mode auto, belum menyala/ load skenario awal, tdk failure}
    if (not Gen[k].NotStandby) and (not Gen[k].EmergencyStop) and (Gen[k].GeneratorMode = 3) and (not Gen[k].EngineAlarm) and
       (not Gen[k].CanBusFailure) and (not Gen[k].MeasPowFailure) and (not Gen[k].DCPowFailure) and (not Gen[k].ShutDown) and
       (not Gen[k].FuelRunsOut) and ((Gen[k].GeneratorState = 1) or (Gen[k].GeneratorState = 9)) then
    begin
      FPreAlarm[b]:= k;
      b:= b+1;
    end;
  end;

  SumDGOn := a;
end;

procedure TPMSSystem.SetStateRun(IdMode: E_ModeID; IdState: Integer);
begin
  case IdMode of
    emFwd:
    FStateRunFwd := IdState;

    emAft:
    FStateRunAft := IdState;

    emFull:
    FStateRunFull := IdState;
  end;
end;

procedure TPMSSystem.SetSwitchFreqValue(IdMsb, IdGen1, IdGen2: Integer; ValBus : Boolean);
var
  SwitchFreq : Double;
begin
  if ValBus then
    SwitchFreq := Msb[IdMsb].Frequency
  else
    SwitchFreq := 0;

  Gen[IdGen1].Busbar := ValBus;
  Gen[IdGen2].Busbar := ValBus;
  Gen[IdGen1].SwitchFrequency := SwitchFreq;
  Gen[IdGen2].SwitchFrequency := SwitchFreq;

  {Kalo fwd msb sekalian ngeset NavNaut CB}
  if IdMsb = 0 then
  begin
    if ValBus then
    begin
      Msb[0].MsbCBNavNaut := True;
      Msb[2].MsbCBNavNaut := False;
    end
    else
    begin
      Msb[0].MsbCBNavNaut := False;
      Msb[2].MsbCBNavNaut := True
    end;
  end;
end;

procedure TPMSSystem.SetUpperLowerLimit(IdMode: E_ModeID; var DGUpLimit, DGLowLimit, MSBUpLimit, MSBLowLimit: Integer);
begin
  {u/ fwd}
  if IdMode = emFwd then
  begin
    DGUpLimit := 1;
    DGLowLimit := 0;
    MSBUpLimit := 0;
    MSBLowLimit := 0;
  end
  {u/ aft}
  else if IdMode = emAft then
  begin
    DGUpLimit := 3;
    DGLowLimit := 2;
    MSBUpLimit := 1;
    MSBLowLimit := 1;
  end
  {u/ full}
  else if IdMode = emFull then
  begin
    DGUpLimit := 3;
    DGLowLimit := 0;
    MSBUpLimit := 1;
    MSBLowLimit := 0;
  end;
end;

procedure TPMSSystem.SetVariablePMS(aFirstLoad: Boolean; aStateRunFull,
  aStateRunFwd, aStateRunAft: Integer);
begin
  FIsFirstLoad := aFirstLoad;
  FStateRunFull := aStateRunFull;
  FStateRunFwd := aStateRunFwd;
  FStateRunAft := aStateRunAft;
end;

function TPMSSystem.GetPreAlarmStop(var IdGenStop: Integer; DGUpLimit, DGLowLimit: Integer): Boolean;
var
  i : Integer;
begin
  result := False;
  for i := DGUpLimit downto DGLowLimit do
  begin
    {Syarat pre alarm stop: dset standby, dlm mode auto, menyala, tdk preference, tdk failure}
    if (not Gen[i].NotStandby) and (Gen[i].GeneratorMode = 3) and (Gen[i].GeneratorState = 5) and (not Gen[i].Preference) and
       (not Gen[i].CanBusFailure) then
    begin
      IdGenStop := i;
      result := True;
      exit;
    end;
  end;
end;

function TPMSSystem.GetPreAlarmStart(var IdGenStart: Integer; DGUpLimit, DGLowLimit: Integer): Boolean;
var
  flag, i, j, DGOn, DGSiap, genKe : Integer;
begin
  result := False;
  flag := 0;

  if FPreAlarm[0] = 9 then
    exit;

  {jk tdk ada DG yg On}
  if FGenOn[0] = 9 then
    DGOn := DGLowLimit
  else
    DGOn := FGenOn[0];

  for i := DGLowLimit to DGUpLimit do
  begin
    DGSiap := DGOn + flag;

    if DGSiap > DGUpLimit then
      genKe := DGLowLimit
    else
      genKe := DGSiap;

    for j := 0 to 3 do
    begin
      if FPreAlarm[j] = genKe then
      begin
        IdGenStart := FPreAlarm[j];
        result := True;
        exit
      end;
    end;

    flag := flag + 1;
  end;
end;

procedure TPMSSystem.SetMSBOff(IdMsb: Integer);
begin
  if Pwr[IdMsb].PowerConsmr > 0 then
     Pwr[IdMsb].PowerConsmr := 45;

  Msb[IdMsb].Power := 0;
  Msb[IdMsb].MsbCBIntr := False;
  Msb[IdMsb].TripReduct := True;
  Msb[2].TripReduct := True;
end;

procedure TPMSSystem.setConnection;
var
  i : Integer;
  {CbBuskopler, }FwdBusbar, AftBusbar, EsbBusbar,
  AftToEsb, FwdToEsb : Boolean;
  FwdFreq, FwdVolt, AftFreq, AftVolt, EsbFreq, EsbVolt: Double;
begin
  FwdFreq := 0; FwdVolt := 0; AftFreq := 0; AftVolt := 0;
  EsbFreq := 0; EsbVolt := 0;
  FwdBusbar := False; AftBusbar := False; EsbBusbar := False;
  AftToEsb := False;  FwdToEsb:= False;

  for i := 0 to 4 do
  begin
    {DG yg terhubung dianggap menambah daya ke Msb}
    if Gen[i].GeneratorSupplied and Gen[i].CBClosed then
    begin
      case i of
        0,1 :
        begin
          FwdBusbar := True;
          FwdFreq := Gen[i].Frequency;
          FwdVolt := Gen[i].Voltage;

        end;
        2,3 :
        begin
          AftBusbar := True;
          AftFreq := Gen[i].Frequency;
          AftVolt := Gen[i].Voltage;

        end;
        4 :
        begin
          EsbBusbar := True;
          EsbFreq := Gen[i].Frequency;
          EsbVolt := Gen[i].Voltage;
        end;
      end;
    end
  end;

  {Saat Emergency Switchboard yang menyuply listrik}
  if EsbBusbar then
  begin
    Msb[2].MsbCBNavNaut := True;
    Msb[0].MsbCBNavNaut := False;

    if CekBusKoplerHandle(3,3) then {nyambung ke forward}
    begin
      SetFreqVoltValue(0, True, EsbFreq, EsbVolt);
      SetFreqVoltValue(1, False, 0, 0);
    end
    else if CekBusKoplerHandle(3,1) then {nyambung ke after}
    begin
      SetFreqVoltValue(1, True, EsbFreq, EsbVolt);
      SetFreqVoltValue(0, False, 0, 0);
    end
    else if CekBusKoplerHandle(3,4) then {nyambung ke dua Msb}
    begin
      SetFreqVoltValue(0, True, EsbFreq, EsbVolt);
      SetFreqVoltValue(1, True, EsbFreq, EsbVolt)
    end
    else {mati}
    begin
      SetFreqVoltValue(0, False, 0, 0);
      SetFreqVoltValue(1, False, 0, 0);
    end;
  end
  else
  begin
    {BusKopler tertutup}
    if CekBusKoplerHandle(1,0) then
    begin
      {yg nyala 2}
      if (FwdBusbar and AftBusbar) then
      begin
        SetFreqVoltValue(0, True, (FwdFreq + AftFreq)/ 2, (FwdVolt + AftVolt)/ 2);
        SetFreqVoltValue(1, True, (FwdFreq + AftFreq)/ 2, (FwdVolt + AftVolt)/ 2);
      end
      {yg nyala fwd}
      else if FwdBusbar then
      begin
        SetFreqVoltValue(0, True, FwdFreq, FwdVolt);

        if (Msb[0].Busbar) and (Msb[0].MsbCBIntr) then
        begin
          SetDelayConnection(2);
          if (Msb[1].MsbCBIntr) then
          begin
            SetFreqVoltValue(1, True, FwdFreq, FwdVolt);
          end;
        end;
      end
      {yg nyala aft}
      else if AftBusbar then
      begin
        SetFreqVoltValue(1, True, AftFreq, AftVolt);

        if (Msb[1].Busbar) and (Msb[1].MsbCBIntr) then
        begin
          SetDelayConnection(1);
          if (Msb[0].MsbCBIntr) then
          begin
            SetFreqVoltValue(0, True, AftFreq, AftVolt);
          end;
        end;
      end
      {mati}
      else
      begin
        SetFreqVoltValue(0, False, 0, 0);
        SetFreqVoltValue(1, False, 0, 0);
      end;
    end
    {BusKopler terbuka}
    else
    begin
      if FwdBusbar then
        SetFreqVoltValue(0, True, FwdFreq, FwdVolt)
      else
        SetFreqVoltValue(0, False, 0, 0);

      if AftBusbar then
        SetFreqVoltValue(1, True, AftFreq, AftVolt)
      else
        SetFreqVoltValue(1, False, 0, 0);
    end;
  end;

  if Msb[0].Busbar then
  begin
    SetSwitchFreqValue(0, 0, 1, True);
    if CekBusKoplerHandle(3,3) then
      FwdToEsb := True;
  end
  else
    SetSwitchFreqValue(0, 0, 1, False);

  if Msb[1].Busbar then
  begin
    SetSwitchFreqValue(1, 2, 3, True);
    if CekBusKoplerHandle(3,1) then
      AftToEsb := True;
  end
  else
    SetSwitchFreqValue(1, 2, 3, False);

  if EsbBusbar then
  begin
    SetFreqVoltValue(2, True, EsbFreq, EsbVolt);
    SetSwitchFreqValue(2, 4, 4, True);
  end
  else if FwdToEsb then
  begin
    SetFreqVoltValue(2, True, FwdFreq, FwdVolt);
    SetSwitchFreqValue(2, 4, 4, True);
  end
  else if AftToEsb then
  begin
    SetFreqVoltValue(2, True, AftFreq, AftVolt);
    SetSwitchFreqValue(2, 4, 4, True);
  end
  else
  begin
    SetFreqVoltValue(2, False, 0, 0);
    SetSwitchFreqValue(2, 4, 4, False);
  end;
end;

function TPMSSystem.SetDelayConnection(IdBuskopler: integer): Boolean;
begin
  Result := False;

  if IdBuskopler = 1 then
  begin
    if FFwdBusbarDelay < 500 then
      FFwdBusbarDelay := FFwdBusbarDelay +1
    else
    begin
      Msb[0].MsbCBIntr := True;
      FFwdBusbarDelay := 0;
      Result := True;
    end;
  end
  else if IdBuskopler = 2 then
  begin
    if FAftBusbarDelay < 500 then
        FAftBusbarDelay := FAftBusbarDelay +1
    else
    begin
      Msb[1].MsbCBIntr := True;
      FAftBusbarDelay := 0;
      Result := True;
    end;
  end
  else if IdBuskopler = 3 then
  begin
    if FEsbBusbarDelay < 500 then
        FEsbBusbarDelay := FEsbBusbarDelay +1
    else
    begin
      Msb[2].MsbCBIntr := True;
      FEsbBusbarDelay := 0;
      Result := True;
    end;
  end;

end;

procedure TPMSSystem.SetDGOff(IdGen: Integer);
begin
  if (Gen[IdGen].GeneratorSupplied and Gen[IdGen].CBClosed) then
  begin
    Gen[IdGen].EngineRun := False;
    Gen[IdGen].CBClosed := False;
    Gen[IdGen].GeneratorSupplied := False;
    Gen[IdGen].Preference := False;
    Gen[IdGen].GeneratorState := 1;
    Gen[IdGen].Busbar := False;
    Gen[IdGen].Power := 0;
    Gen[IdGen].Voltage := 0;
    Gen[IdGen].Frequency := 0;
    Gen[IdGen].Current := 0;
    Gen[IdGen].CosPhi  := 0;
  end;
end;

end.
