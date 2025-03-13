unit ufrmReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  E_ReportType = (rtEngineroom, rtRunningHours);

  TfrmReport = class(TForm)
    cbbReportType: TComboBox;
    lstReportFile: TListBox;
    btnOK: TButton;
    btnCancel: TButton;
    procedure FormShow(Sender: TObject);
    procedure cbbReportTypeChange(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure lstReportFileMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    FSelectedFileName : string;

    function GetElementValue(aElementID: string): string;
  public
    procedure CreateReport;
  end;

var
  frmReport: TfrmReport;

const
  C_ReportDir = 'ReportDir';

implementation

uses
  ShellApi, IOUtils, StrUtils, uMimicsSystem, uDBSupportClasses, ufrmMimics,
  uDataType, uBaseComponent, uAnalogSensor, uRunningHour, uIPMS_Data;

{$R *.dfm}

procedure TfrmReport.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmReport.btnOKClick(Sender: TObject);
var
  tempStr : string;
begin
  if FSelectedFileName = '' then
    Exit;

  tempStr := ExtractFilePath(Application.ExeName) + C_ReportDir + '\' +
    FSelectedFileName;

  ShellExecute(Handle, 'Open', 'C:\Windows\notepad.exe', PChar(tempStr), nil,
    SW_SHOWNORMAL);

  Close;
end;

procedure TfrmReport.cbbReportTypeChange(Sender: TObject);
var
  SR : TSearchRec;
  files : TStrings;
  i : Integer;
begin
  lstReportFile.Clear;

  files := TStringList.Create;

  try
    if FindFirst(ExtractFilePath(Application.ExeName) + C_ReportDir + '\*.log',
      faArchive, SR) = 0 then
    begin
      repeat
        files.Add(SR.Name); //Fill the list
      until FindNext(SR) <> 0;
      FindClose(SR);
    end;  

    case E_ReportType(cbbReportType.ItemIndex) of
      rtEngineroom:
      begin
        for i := 0 to files.Count - 1 do
        begin          
          if LeftStr(files[i], 18) = 'Engineroom_Report_' then
            lstReportFile.AddItem(files[i], nil);
        end;
      end;
      rtRunningHours:
      begin
        for i := 0 to files.Count - 1 do
        begin       
          if LeftStr(files[i], 14) = 'Running_Hours_' then
            lstReportFile.AddItem(files[i], nil);
        end;
      end;    
    end;
  finally
    files.Free;
  end;
end;

procedure TfrmReport.CreateReport;
var
  logFile : TextFile;
  fileName : string;
  dt : TDateTime;
begin
  dt := Now;

  ForceDirectories(ExtractFilePath(Application.ExeName) + C_ReportDir);

  fileName := ExtractFilePath(Application.ExeName) + C_ReportDir +
    '\Engineroom_Report_' + FormatDateTime('ddmmyy', dt) + '_' +
    FormatDateTime('hhnnss', dt) + '.log';
  AssignFile(logFile, fileName);
  Rewrite(logFile);

  Writeln(logFile, '');
  Writeln(logFile, 'REPORT MADE BY   : TNI-001');
  Writeln(logFile, 'UTC DATE         : ' + FormatDateTime('d/m/yyyy', dt));
  Writeln(logFile, 'UTC TIME         : ' + FormatDateTime('h:nn:ss AM/PM', dt));
  Writeln(logFile, 'PRIMARY SERVER   : TNI-001 IS MASTER AND ONLINE.');
  Writeln(logFile, 'SECONDARY SERVER : TNI-002 IS SLAVE  AND OFFLINE.');
  Writeln(logFile, '');
  Writeln(logFile, '****************************************************************************************************************');
  Writeln(logFile, '*                                                                                                              *');
  Writeln(logFile, '*                                               ENGINE ROOM REPORT                                             *');
  Writeln(logFile, '*                                  (template Version 1.0 / date 25 th Jan. 2007)                               *');
  Writeln(logFile, '*                                                                                                              *');
  Writeln(logFile, '*                                             Imtech Marine & Offshore                                         *');
  Writeln(logFile, '*                                                                                                              *');
  Writeln(logFile, '****************************************************************************************************************');
  Writeln(logFile, 'DIESEL GENERATOR SETS:                                                                                         |');
  Writeln(logFile, '---------------------------------------------------------------------------------------------------------------|');
  Writeln(logFile, '                       |  PORT AFT (GEN 3)   |  PORT FWD (GEN 1)   |  STBD AFT (GEN 4)   |  STBD FWD (GEN 2)   |');
  Writeln(logFile, '-----------------------|---------------------|---------------------|---------------------|---------------------|');
  Writeln(logFile, 'GENERATOR STATUS       | UNAVAILABLE         | UNAVAILABLE         | UNAVAILABLE         | UNAVAILABLE         |');
  Writeln(logFile, '-----------------------|---------------------|---------------------|---------------------|---------------------|');
  Writeln(logFile, 'GENERATOR:             |                     |                     |                     |                     |');
  Writeln(logFile, '   VOLTAGE             | ' + GetElementValue('3241E50014N') + ' V             | ' + GetElementValue('3241E50024N') + ' V             | ' + GetElementValue('3241E50013N') + ' V             | ' + GetElementValue('3241E50023N') + ' V             |');
  Writeln(logFile, '   CURRENT             | ' + GetElementValue('3241E50014K') + ' A             | ' + GetElementValue('3241E50024K') + ' A             | ' + GetElementValue('3241E50013K') + ' A             | ' + GetElementValue('3241E50023K') + ' A             |');
  Writeln(logFile, '   FREQUENCY           | ' + GetElementValue('3241E50014L') + ' Hz            | ' + GetElementValue('3241E50024L') + ' Hz            | ' + GetElementValue('3241E50013L') + ' Hz            | ' + GetElementValue('3241E50023L') + ' Hz            |');
  Writeln(logFile, '   COS PHI             | ' + GetElementValue('3241E50014O') + '               | ' + GetElementValue('3241E50024O') + '               | ' + GetElementValue('3241E50013O') + '               | ' + GetElementValue('3241E50023O') + '               |');
  Writeln(logFile, '   POWER               | ' + GetElementValue('3241E50014M') + ' Kw            | ' + GetElementValue('3241E50024M') + ' Kw            | ' + GetElementValue('3241E50013M') + ' Kw            | ' + GetElementValue('3241E50023M') + ' Kw            |');
  Writeln(logFile, '   CIRCUIT BREAKER     | UNAVAILABLE         | UNAVAILABLE         | UNAVAILABLE         | UNAVAILABLE         |');
  Writeln(logFile, '-----------------------|---------------------|---------------------|---------------------|---------------------|');
  Writeln(logFile, 'GENERATOR:             |                     |                     |                     |                     |');
  Writeln(logFile, '   WNDNG TEMP U        | ' + GetElementValue('3110A0003C') + ' ºC            | ' + GetElementValue('3110A0001C') + ' ºC            | ' + GetElementValue('3110A0004C') + ' ºC            | ' + GetElementValue('3110A0002C') + ' ºC            |');
  Writeln(logFile, '              V        | ' + GetElementValue('3110A0003D') + ' ºC            | ' + GetElementValue('3110A0001C') + ' ºC            | ' + GetElementValue('3110A0004C') + ' ºC            | ' + GetElementValue('3110A0002C') + ' ºC            |');
  Writeln(logFile, '              W        | ' + GetElementValue('3110A0003E') + ' ºC            | ' + GetElementValue('3110A0001C') + ' ºC            | ' + GetElementValue('3110A0004C') + ' ºC            | ' + GetElementValue('3110A0002C') + ' ºC            |');
  Writeln(logFile, '-----------------------|---------------------|---------------------|---------------------|---------------------|');
  Writeln(logFile, '');
  Writeln(logFile, ' CPP MAIN ENGINES:                                                                                             |');
  Writeln(logFile, '---------------------------------------------------------------------------------------------------------------|');
  Writeln(logFile, '                       |        PORT  MAIN BEARINGS  STBD          |        PORT  CONNECTING ROD  STBD         |');
  Writeln(logFile, '-----------------------|-------------------------------------------|-------------------------------------------|');
  Writeln(logFile, 'BEARING TEMP 1         | ' + GetElementValue('2331E0011144') + ' ºC            | ' + GetElementValue('2331E0012144') + ' ºC            | ' + GetElementValue('2331E0011166') + ' ºC            | ' + GetElementValue('2331E0012166') + ' ºC            |');
  Writeln(logFile, 'BEARING TEMP 2         | ' + GetElementValue('2331E0011145') + ' ºC            | ' + GetElementValue('2331E0012145') + ' ºC            | ' + GetElementValue('2331E0011167') + ' ºC            | ' + GetElementValue('2331E0012167') + ' ºC            |');
  Writeln(logFile, 'BEARING TEMP 3         | ' + GetElementValue('2331E0011146') + ' ºC            | ' + GetElementValue('2331E0012146') + ' ºC            | ' + GetElementValue('2331E0011168') + ' ºC            | ' + GetElementValue('2331E0012168') + ' ºC            |');
  Writeln(logFile, 'BEARING TEMP 4         | ' + GetElementValue('2331E0011147') + ' ºC            | ' + GetElementValue('2331E0012147') + ' ºC            | ' + GetElementValue('2331E0011169') + ' ºC            | ' + GetElementValue('2331E0012169') + ' ºC            |');
  Writeln(logFile, 'BEARING TEMP 5         | ' + GetElementValue('2331E0011148') + ' ºC            | ' + GetElementValue('2331E0012148') + ' ºC            | ' + GetElementValue('2331E0011170') + ' ºC            | ' + GetElementValue('2331E0012170') + ' ºC            |');
  Writeln(logFile, 'BEARING TEMP 6         | ' + GetElementValue('2331E0011149') + ' ºC            | ' + GetElementValue('2331E0012149') + ' ºC            | ' + GetElementValue('2331E0011171') + ' ºC            | ' + GetElementValue('2331E0012171') + ' ºC            |');
  Writeln(logFile, 'BEARING TEMP 7         | ' + GetElementValue('2331E0011150') + ' ºC            | ' + GetElementValue('2331E0012150') + ' ºC            | ' + GetElementValue('2331E0011172') + ' ºC            | ' + GetElementValue('2331E0012172') + ' ºC            |');
  Writeln(logFile, 'BEARING TEMP 8         | ' + GetElementValue('2331E0011151') + ' ºC            | ' + GetElementValue('2331E0012151') + ' ºC            | ' + GetElementValue('2331E0011173') + ' ºC            | ' + GetElementValue('2331E0012173') + ' ºC            |');
  Writeln(logFile, 'BEARING TEMP 9         | ' + GetElementValue('2331E0011152') + ' ºC            | ' + GetElementValue('2331E0012152') + ' ºC            | ' + GetElementValue('2331E0011174') + ' ºC            | ' + GetElementValue('2331E0012174') + ' ºC            |');
  Writeln(logFile, 'BEARING TEMP 10        | ' + GetElementValue('2331E0011153') + ' ºC            | ' + GetElementValue('2331E0012153') + ' ºC            | ' + GetElementValue('2331E0011175') + ' ºC            | ' + GetElementValue('2331E0012175') + ' ºC            |');
  Writeln(logFile, 'BEARING TEMP 11        | ' + GetElementValue('2331E0011154') + ' ºC            | ' + GetElementValue('2331E0012154') + ' ºC            |                     |                     |');
  Writeln(logFile, '-----------------------|-------------------------------------------|-------------------------------------------|');
  Writeln(logFile, '                       |        PORT       BANK A    STBD          |       PORT        BANK B     STBD         |');
  Writeln(logFile, '-----------------------|-------------------------------------------|-------------------------------------------|');
  Writeln(logFile, 'EXHAUST GAS:           |                     |                     |                     |                     |');
  Writeln(logFile, '   TEMP AVG            | ' + GetElementValue('2331E0011239') + ' ºC            | ' + GetElementValue('2331E0012239') + ' ºC            | ' + GetElementValue('2331E0011240') + ' ºC            | ' + GetElementValue('2331E0012240') + ' ºC            |');
  Writeln(logFile, '-----------------------|-------------------------------------------|-------------------------------------------|');
  Writeln(logFile, 'EXH GAS TEMP DEV:      |                     |                     |                     |                     |');
  Writeln(logFile, '   CYL 1               | ' + GetElementValue('2331E0011100') + ' ºC            | ' + GetElementValue('2331E0012100') + ' ºC            | ' + GetElementValue('2331E0011110') + ' ºC            | ' + GetElementValue('2331E0012110') + ' ºC            |');
  Writeln(logFile, '   CYL 2               | ' + GetElementValue('2331E0011101') + ' ºC            | ' + GetElementValue('2331E0012101') + ' ºC            | ' + GetElementValue('2331E0011111') + ' ºC            | ' + GetElementValue('2331E0012111') + ' ºC            |');
  Writeln(logFile, '   CYL 3               | ' + GetElementValue('2331E0011102') + ' ºC            | ' + GetElementValue('2331E0012102') + ' ºC            | ' + GetElementValue('2331E0011112') + ' ºC            | ' + GetElementValue('2331E0012112') + ' ºC            |');
  Writeln(logFile, '   CYL 4               | ' + GetElementValue('2331E0011103') + ' ºC            | ' + GetElementValue('2331E0012103') + ' ºC            | ' + GetElementValue('2331E0011113') + ' ºC            | ' + GetElementValue('2331E0012113') + ' ºC            |');
  Writeln(logFile, '   CYL 5               | ' + GetElementValue('2331E0011104') + ' ºC            | ' + GetElementValue('2331E0012104') + ' ºC            | ' + GetElementValue('2331E0011114') + ' ºC            | ' + GetElementValue('2331E0012114') + ' ºC            |');
  Writeln(logFile, '   CYL 6               | ' + GetElementValue('2331E0011105') + ' ºC            | ' + GetElementValue('2331E0012105') + ' ºC            | ' + GetElementValue('2331E0011115') + ' ºC            | ' + GetElementValue('2331E0012115') + ' ºC            |');
  Writeln(logFile, '   CYL 7               | ' + GetElementValue('2331E0011106') + ' ºC            | ' + GetElementValue('2331E0012106') + ' ºC            | ' + GetElementValue('2331E0011116') + ' ºC            | ' + GetElementValue('2331E0012116') + ' ºC            |');
  Writeln(logFile, '   CYL 8               | ' + GetElementValue('2331E0011107') + ' ºC            | ' + GetElementValue('2331E0012107') + ' ºC            | ' + GetElementValue('2331E0011117') + ' ºC            | ' + GetElementValue('2331E0012117') + ' ºC            |');
  Writeln(logFile, '   CYL 9               | ' + GetElementValue('2331E0011108') + ' ºC            | ' + GetElementValue('2331E0012108') + ' ºC            | ' + GetElementValue('2331E0011118') + ' ºC            | ' + GetElementValue('2331E0012118') + ' ºC            |');
  Writeln(logFile, '   CYL 10              | ' + GetElementValue('2331E0011109') + ' ºC            | ' + GetElementValue('2331E0012109') + ' ºC            | ' + GetElementValue('2331E0011119') + ' ºC            | ' + GetElementValue('2331E0012119') + ' ºC            |');
  Writeln(logFile, '-----------------------|-------------------------------------------|-------------------------------------------|');
  Writeln(logFile, 'TURBO                  |                     |                     |                     |                     |');
  Writeln(logFile, '   SPEED               | ' + GetElementValue('2331E0011134') + ' rpm           | ' + GetElementValue('2331E0012134') + ' rpm           | ' + GetElementValue('2331E0011133') + ' rpm           | ' + GetElementValue('2331E0012133') + ' rpm           |');
  Writeln(logFile, '   INLET TEMP          | ' + GetElementValue('2331E0011122') + ' ºC            | ' + GetElementValue('2331E0012122') + ' ºC            | ' + GetElementValue('2331E0011123') + ' ºC            | ' + GetElementValue('2331E0012123') + ' ºC            |');
  Writeln(logFile, '   OUTLET TEMP         | ' + GetElementValue('2331E0011124') + ' ºC            | ' + GetElementValue('2331E0012124') + ' ºC            | ' + GetElementValue('2331E0011125') + ' ºC            | ' + GetElementValue('2331E0012125') + ' ºC            |');
  Writeln(logFile, '-----------------------|-------------------------------------------|-------------------------------------------|');
  Writeln(logFile, '                       |                   PORT                    |                    STBD                   |');
  Writeln(logFile, '-----------------------|-------------------------------------------|-------------------------------------------|');
  Writeln(logFile, 'TURBO                  |                                           |                                           |');
  Writeln(logFile, '   AIR PRESS @ ME INLET|                ' + GetElementValue('2331E0011126') + ' bar                  |               ' + GetElementValue('2331E0012126') + ' bar                   |');
  Writeln(logFile, '   AIR TEMP  @ ME INLET|                ' + GetElementValue('2331E0011135') + ' ºC                   |               ' + GetElementValue('2331E0012135') + ' ºC                    |');
  Writeln(logFile, '   LO  PRESS @ TC INLET|                ' + GetElementValue('2331E0011143') + ' bar                  |               ' + GetElementValue('2331E0012143') + ' bar                   |');
  Writeln(logFile, '-----------------------|-------------------------------------------|-------------------------------------------|');
  Writeln(logFile, 'FUEL RACK POSITION     |                ' + GetElementValue('2331E0011001') + ' mm                   |               ' + GetElementValue('2331E0012001') + ' mm                    |');
  Writeln(logFile, '-----------------------|-------------------------------------------|-------------------------------------------|');
  Writeln(logFile, 'SPEED                  |                ' + GetElementValue('2331E0011199') + ' rpm                  |               ' + GetElementValue('2331E0012199') + ' rpm                   |');
  Writeln(logFile, '-----------------------|-------------------------------------------|-------------------------------------------|');
  Writeln(logFile, 'HT WATER:              |                                           |                                           |');
  Writeln(logFile, '   PRESSURE IN         |                ' + GetElementValue('2331E0011180') + ' bar                  |               ' + GetElementValue('2331E0012180') + ' bar                   |');
  Writeln(logFile, '   TEMP IN             |                ' + GetElementValue('2331E0011179') + ' ºC                   |               ' + GetElementValue('2331E0012179') + ' ºC                    |');
  Writeln(logFile, '   TEMP OUT            |                ' + GetElementValue('2331E0011185') + ' ºC                   |               ' + GetElementValue('2331E0012185') + ' ºC                    |');
  Writeln(logFile, '                       |                                           |                                           |');
  Writeln(logFile, '-----------------------|-------------------------------------------|-------------------------------------------|');
  Writeln(logFile, 'SEA WATER:             |                                           |                                           |');
  Writeln(logFile, '   PRESSURE @ OUTLET   |                ' + GetElementValue('2331E0011186') + ' bar                  |               ' + GetElementValue('2331E0012186') + ' bar                   |');
  Writeln(logFile, '                       |                                           |                                           |');
  Writeln(logFile, '-----------------------|-------------------------------------------|-------------------------------------------|');
  Writeln(logFile, 'FUEL OIL:              |                                           |                                           |');
  Writeln(logFile, '   PRESSURE @ INLET    |                ' + GetElementValue('2331E0011190') + ' bar                  |               ' + GetElementValue('2331E0012190') + ' bar                   |');
  Writeln(logFile, '                       |                                           |                                           |');
  Writeln(logFile, '-----------------------|-------------------------------------------|-------------------------------------------|');
  Writeln(logFile, 'LUB OIL:               |                                           |                                           |');
  Writeln(logFile, '   PRESSURE @ INLET    |                ' + GetElementValue('2410A0001A') + ' bar                  |               ' + GetElementValue('2410A0002A') + ' bar                   |');
  Writeln(logFile, '                       |                                           |                                           |');
  Writeln(logFile, '-----------------------|-------------------------------------------|-------------------------------------------|');
  Writeln(logFile, '');

  CloseFile(logFile);

  fileName := ExtractFilePath(Application.ExeName) + C_ReportDir +
    '\Running_Hours_' + FormatDateTime('ddmmyy', dt) + '_' +
    FormatDateTime('hhnnss', dt) + '.log';
  AssignFile(logFile, fileName);
  Rewrite(logFile);

  Writeln(logFile, '');
  Writeln(logFile, 'REPORT MADE BY   : TNI-001');
  Writeln(logFile, 'UTC DATE         : ' + FormatDateTime('d/m/yyyy', dt));
  Writeln(logFile, 'UTC TIME         : ' + FormatDateTime('h:nn:ss AM/PM', dt));
  Writeln(logFile, 'PRIMARY SERVER   : TNI-001 IS MASTER AND ONLINE.');
  Writeln(logFile, 'SECONDARY SERVER : TNI-002 IS SLAVE  AND OFFLINE.');
  Writeln(logFile, '');
  Writeln(logFile, '****************************************************************************************************************');
  Writeln(logFile, '*                                                                                                              *');
  Writeln(logFile, '*                                               RUNNING HOURS REPORT                                           *');
  Writeln(logFile, '*                                  (template Version 1.0 / date 25 th Jan. 2007)                               *');
  Writeln(logFile, '*                                                                                                              *');
  Writeln(logFile, '*                                             Imtech Marine & Offshore                                         *');
  Writeln(logFile, '*                                                                                                              *');
  Writeln(logFile, '****************************************************************************************************************');
  Writeln(logFile, '                       |---------------------|---------------------|-------------------------------------------|');
  Writeln(logFile, '                       |         PORT        |         STBD        |                                           |');
  Writeln(logFile, '-----------------------|---------------------|---------------------|-------------------------------------------|');
  Writeln(logFile, 'MAIN ENGINE            | ' + GetElementValue('2331E0011R') + ' h             | ' + GetElementValue('2331E0012R') + ' h             |                                           |');
  Writeln(logFile, '-----------------------|---------------------|---------------------|-------------------------------------------|');
  Writeln(logFile, '');
  Writeln(logFile, '                       |---------------------|---------------------|-------------------------------------------|');
  Writeln(logFile, '                       |         PORT        |         STBD        |                                           |');
  Writeln(logFile, '-----------------------|---------------------|---------------------|-------------------------------------------|');
  Writeln(logFile, 'MAIN ENGINE LO PUMP    | ' + GetElementValue('2331E001115R') + ' h             | ' + GetElementValue('2331E001215R') + ' h             |                                           |');
  Writeln(logFile, '-----------------------|---------------------|---------------------|-------------------------------------------|');
  Writeln(logFile, 'PROP GBX LO PUMP       | ' + GetElementValue('2410A0001AR') + ' h             | ' + GetElementValue('2410A0002AR') + ' h             |                                           |');
  Writeln(logFile, '-----------------------|---------------------|---------------------|-------------------------------------------|');
  Writeln(logFile, '');
  Writeln(logFile, '                       |---------------------|---------------------|---------------------|---------------------|');
  Writeln(logFile, '                       |       PUMP 1        |       PUMP 2        |       PUMP 3        |                     |');
  Writeln(logFile, '-----------------------|---------------------|---------------------|---------------------|---------------------|');
  Writeln(logFile, 'CPP HPP PUMP PORT      | ' + GetElementValue('2436A0001R') + ' h             | ' + GetElementValue('2436A0010R') + ' h             | ' + GetElementValue('2436A0005R') + ' h             |                     |');
  Writeln(logFile, '-----------------------|---------------------|---------------------|---------------------|---------------------|');
  Writeln(logFile, 'CPP HPP PUMP STBD      | ' + GetElementValue('2436A0002R') + ' h             | ' + GetElementValue('2436A0011R') + ' h             | ' + GetElementValue('2436A0006R') + ' h             |                     |');
  Writeln(logFile, '-----------------------|---------------------|---------------------|---------------------|---------------------|');
  Writeln(logFile, '');
  Writeln(logFile, '                       |---------------------|---------------------|---------------------|---------------------|');
  Writeln(logFile, '                       |     GENERATOR 1     |     GENERATOR 2     |     GENERATOR 3     |     GENERATOR 4     |');
  Writeln(logFile, '-----------------------|---------------------|---------------------|---------------------|---------------------|');
  Writeln(logFile, 'DIESEL ENGINES         | ' + GetElementValue('3241E50024R') + ' h             | ' + GetElementValue('3241E50023R') + ' h             | ' + GetElementValue('3241E50014AR') + ' h             | ' + GetElementValue('3241E50013R') + ' h             |');
  Writeln(logFile, '-----------------------|---------------------|---------------------|---------------------|---------------------|');
  Writeln(logFile, '');
  Writeln(logFile, '                       |---------------------|---------------------|---------------------|---------------------|');
  Writeln(logFile, '                       |      CHILLER 1      |      CHILLER 2      |    PROV REFRIG 1    |    PROV REFRIG 2    |');
  Writeln(logFile, '-----------------------|---------------------|---------------------|---------------------|---------------------|');
  Writeln(logFile, 'SEA WATER PUMPS        | ' + GetElementValue('5210A0001AR') + ' h             | ' + GetElementValue('5210A0002AR') + ' h             | ' + GetElementValue('5210A0003AR') + ' h             | ' + GetElementValue('5210A0008AR') + ' h             |');
  Writeln(logFile, '-----------------------|---------------------|---------------------|---------------------|---------------------|');
  Writeln(logFile, '');
  Writeln(logFile, '');
  Writeln(logFile, '-----------------------|---------------------|-----------------------------------------------------------------|');
  Writeln(logFile, 'BILGE PUMP             | ' + GetElementValue('5291A0001AR') + ' h             |                                                                 |');
  Writeln(logFile, '-----------------------|---------------------|-----------------------------------------------------------------|');
  Writeln(logFile, 'BALLAST PUMP           | ' + GetElementValue('5292A0001AR') + ' h             |                                                                 |');
  Writeln(logFile, '-----------------------|---------------------|-----------------------------------------------------------------|');
  Writeln(logFile, 'FUEL OIL TRANSFER PUMP | ' + GetElementValue('5411A0001AR') + ' h             |                                                                 |');
  Writeln(logFile, '-----------------------|---------------------|-----------------------------------------------------------------|');
  Writeln(logFile, 'SLUDGE DIRTY OIL PUMP  | ' + GetElementValue('5932A0004AR') + ' h             |                                                                 |');
  Writeln(logFile, '-----------------------|---------------------|-----------------------------------------------------------------|');
  Writeln(logFile, '');
  Writeln(logFile, '                       |-------------------------------------------|-------------------------------------------|');
  Writeln(logFile, '                       |                   PORT                    |                   STBD                    |');
  Writeln(logFile, '-----------------------|-------------------------------------------|-------------------------------------------|');
  Writeln(logFile, '                       | ' + GetElementValue('5131A1003AR') + ' h      (MS-3) | ' + GetElementValue('5131A1001AR') + ' h      (MS-1) | ' + GetElementValue('5131A1004AR') + ' h      (MS-4) | ' + GetElementValue('5131A1002AR') + ' h      (MS-2) |');
  Writeln(logFile, 'FANS MAIN ENGINE ROOM  |---------------------|---------------------|---------------------|---------------------|');
  Writeln(logFile, '                       | ' + GetElementValue('5131A1006AR') + ' h      (MS-6) |                     | ' + GetElementValue('5131A1005AR') + ' h      (MS-5) |                     |');
  Writeln(logFile, '-----------------------|---------------------|---------------------|---------------------|---------------------|');
  Writeln(logFile, 'FAN DIESEL GEN. ROOM   |                     | ' + GetElementValue('5131A1013AR') + ' h      (DGPS) |                     | ' + GetElementValue('5131A1014AR') + ' h      (DGSB) |');
  Writeln(logFile, '-----------------------|---------------------|---------------------|---------------------|---------------------|');
  Writeln(logFile, '');
  Writeln(logFile, '                       |---------------------|---------------------|---------------------|---------------------|');
  Writeln(logFile, '                       |       PUMP 1        |       PUMP 2        |       PUMP 3        |    JOCKING PUMP     |');
  Writeln(logFile, '-----------------------|---------------------|---------------------|---------------------|---------------------|');
  Writeln(logFile, 'FIRE FIGHTING          | ' + GetElementValue('5551A0001AR') + ' h             | ' + GetElementValue('5551A0002AR') + ' h             | ' + GetElementValue('5551A0003AR') + ' h             | ' + GetElementValue('5551A0004AR') + ' h             |');
  Writeln(logFile, '-----------------------|---------------------|---------------------|---------------------|---------------------|');
  Writeln(logFile, '');

  CloseFile(logFile);
end;

procedure TfrmReport.FormShow(Sender: TObject);
var
  l : DWORD;
begin
  l := GetWindowLong(Self.Handle, GWL_STYLE);
  l := l and not (WS_MINIMIZEBOX);
  l := l and not (WS_MAXIMIZEBOX);
  SetWindowLong(Self.Handle, GWL_STYLE, l);

  Left := (Screen.Width - Width)  div 2;
  Top := (Screen.Height - Height) div 2;

  cbbReportType.ItemIndex := 0;
  cbbReportTypeChange(cbbReportType);
  FSelectedFileName := '';
end;

function TfrmReport.GetElementValue(aElementID: string): string;
var
  elementData : TElementData;
  mimic : TfrmMimics;
  i, j : Integer;
  c : TComponent;
  valueStr : string;
begin
  elementData := SysMimics.Database.GetElement(aElementID);
  mimic := SysMimics.Mimic.FormFactory(E_MimicType(elementData.MainMimic_IDfk));
  valueStr := '';

  for i := 0 to mimic.ComponentCount do
  begin
    c := mimic.Components[i];

    if (c is TIPMSBaseComponent) and
      (TIPMSBaseComponent(c).ElementID = aElementID) then
    begin
      if c is TAnalogSensor then
      begin
        if (TAnalogSensor(c).Status = AStaDisableUnavailable) or
         (TAnalogSensor(c).Status = AStaWireBreak) then
          valueStr := '*****'
        else
          valueStr := FormatFloat('#0.#', TAnalogSensor(c).SensorValue);
      end
      else if c is TRunningHour then
      begin
        if TRunningHour(c).Status = RHtaDisableUnavailable then
          valueStr := '*****'
        else
          valueStr := FormatFloat('#0.#', TRunningHour(c).SensorValue);
      end;

      for j := 1 to 5 - Length(valueStr) do
        valueStr := ' ' + valueStr;

      Result := valueStr;
      Break;
    end;
  end;

  elementData.Free;
end;

procedure TfrmReport.lstReportFileMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  lb : TListBox;
begin
  lb := TListBox(Sender);

  if lb.ItemIndex < 0 then
    Exit;

  FSelectedFileName := lb.Items[lb.ItemIndex];
end;

end.
