unit ufrmLogger;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uDataType, ExtCtrls;

type
  TfrmLogs = class(TForm)
    mmoLogs: TMemo;
    tmr1: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
  private
    { Private declarations }

    //FLoggerFileName : String;
    //FFile : TextFile;
    FNum  : Int64;

    procedure LoggerEventStr(Sender : TObject;aPropID : E_PropsID;Value : string);
    procedure OnExceptionMessage(const aException : string);
    procedure OnLogReceive(const Value : String);
  public
    { Public declarations }
  end;

var
  frmLogs: TfrmLogs;

implementation

uses uMimicsSystem, uListener, TypInfo, uMimicsManager;

{$R *.dfm}

procedure TfrmLogs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caHide;
end;

procedure TfrmLogs.FormCreate(Sender: TObject);
var
  enum : E_MimicType;
begin
  { mimic exception }
  SysMimics.Network.Listeners.OnExceptionMessage := OnExceptionMessage;
  SysMimics.Database.Listeners.OnExceptionMessage := OnExceptionMessage;
  //SysMimics.Network.AsClients.Get('AsControllerClient').OnlogRecv := OnLogReceive;
  SysMimics.Network.AsClients.Get('AsControllerClient').OnGetRecvLog := OnLogReceive;
  //SysMimics.Mimic.OnLogEvent := OnLogReceive;

  { assign log mimics }
  for enum := mtNavCom to mtRunHours do
  begin
    //if Assigned(SysMimics.Mimic.SearchMimic(enum)) then
    //  SysMimics.Mimic.SearchMimic(enum).OnLogInfo := OnLogReceive;
  end;

  with SysMimics.Network.Listeners.Add('Logger') as TPropertyEventListener do begin
    //OnPropertyStringChange := LoggerEventStr;
  end;

  with SysMimics.Mimic.Listeners.Add('Logger') as TPropertyEventListener do begin
    OnPropertyStringChange := LoggerEventStr;
  end;

  //FLoggerFileName := ExtractFilePath(Application.ExeName) + 'LOG_' + FormatDateTime('ddmmyyy_hhnnss',Now) + '_MIMIC.log';

  //AssignFile(FFile, FLoggerFileName);
  //Rewrite(FFile);
  FNum := 0;

  SysMimics.Mimic.OnLogEvent :=  OnLogReceive;

end;

procedure TfrmLogs.FormDestroy(Sender: TObject);
begin
  //CloseFile(FFile);
end;

procedure TfrmLogs.LoggerEventStr(Sender: TObject; aPropID: E_PropsID;
  Value: string);
var
  s : String;
begin

  s := GetEnumName(TypeInfo(E_PropsID),integer(aPropID)) ;
  s := Sender.ClassName + ':' + s + '->' + Value;

  Inc(FNum);
  value := IntToStr(FNum) + ' ' + FormatDateTime('hh:nn:ss:zzz',Now) + ' ' + Value;

//  try
//    Writeln(FFile,value);
//  finally
//  end;

  if mmoLogs.Lines.Count > 1000 then
    mmoLogs.Lines.Clear;

  //mmoLogs.Lines.Insert(0,value);

end;

procedure TfrmLogs.OnExceptionMessage(const aException: string);
begin
  mmoLogs.Lines.Add(aException);
end;

procedure TfrmLogs.OnLogReceive(const Value: String);
var
  val : string;
begin
  Inc(FNum);
  val := IntToStr(FNum) + ' ' + Value;

//  try
//    Writeln(FFile,val);
//  finally
//  end;

  if mmoLogs.Lines.Count > 1000 then
    mmoLogs.Lines.Clear;

  mmoLogs.Lines.Insert(0,Value);
end;

procedure TfrmLogs.tmr1Timer(Sender: TObject);
var
  i : integer;
begin

  //i := SysMimics.Network.AsClients.Get('AsControllerClient').GetBufferCount;
  //mmoLogs.Lines.Insert(0,'Buffer Controller : ' + IntToStr(i));

end;

end.
