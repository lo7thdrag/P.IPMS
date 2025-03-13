unit uDataLogger;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uDataType, TypInfo;

type
  TfrmLogger = class(TForm)
    mmoNetLogger: TMemo;
    lbl1: TLabel;
    mmoEvntLog: TMemo;
    lbl2: TLabel;
    lbl3: TLabel;
    mmoErrorLog: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure EventLogger(Sender: Tobject; Props_ID: E_PropsID;
      Value: String); overload;
    //procedure EventLogger(const Value : string);overload;
    //procedure AddNetLogger(const Value : string);

    procedure OnExceptionMessage(const aException : string);
  public
    { Public declarations }
  end;

var
  frmLogger: TfrmLogger;

implementation

uses
  uSetting, uNetworkManager, uInstructorSystem, uERSystem, uListener,
    uControllerSystem, uMimicsSystem, uPCSSystem, uElementController,
    uElement, uCommonSystem;

{$R *.dfm}

procedure TfrmLogger.EventLogger(Sender: Tobject; Props_ID: E_PropsID;
  Value: String);
var
  str : String;
begin

  str := GetEnumName(TypeInfo(E_PropsID),integer(Props_ID)) + ' -> ' + Value;
  str := FormatDateTime('hh:nn:ss:zzz',Now) + ' ' + str;

  mmoEvntLog.Lines.Insert(0,str);

end;

//procedure TfrmLogger.AddNetLogger(const Value: string);
//var
//  str : String;
//begin
//  if mmoNetLogger.Lines.Count > 200 then
//    mmoNetLogger.Lines.Delete(0);

//  str := FormatDateTime('hh:nn:ss:zzz',Now) + ' ' + Value;
//  mmoNetLogger.Lines.Insert(0,str);
//end;

//procedure TfrmLogger.EventLogger(const Value: string);
//begin
//  AddNetLogger(Value);
//end;

procedure TfrmLogger.FormCreate(Sender: TObject);
var
  lCtrl, lElmt : TStrings;
  elmCtrl : TElementController;
  elmt : TElement;
  i,j : Integer;
  system : TCommonSystem;
begin
  { engine room exception }
  ERSystem.Network.Listeners.OnExceptionMessage := OnExceptionMessage;
  ERSystem.Database.Listeners.OnExceptionMessage := OnExceptionMessage;

  for i := 0 to ERSystem.ERManager.EngineRoom.getSystemCount - 1 do
  begin
    system := ERSystem.ERManager.EngineRoom.getSystem(i);
    system.Listener.OnExceptionMessage := OnExceptionMessage;

    for j := 0 to system.Entities.getCount - 1 do
      system.Entities.Get(j).Listener.OnExceptionMessage := OnExceptionMessage;
  end;

  //ERSystem.Network.AsServer.OnlogRecv := EventLogger;
  //ERSystem.Network.AsClients.Get('AsInstructorClient').OnlogRecv := EventLogger;

  { controller exception }
  CtrlSystem.Network.Listeners.OnExceptionMessage := OnExceptionMessage;
  CtrlSystem.Database.Listeners.OnExceptionMessage := OnExceptionMessage;
  CtrlSystem.Controller.Listeners.OnExceptionMessage := OnExceptionMessage;

//  CtrlSystem.Network.AsClients.Get('AsSimEngineClient').OnlogRecv := EventLogger;
//  CtrlSystem.Network.AsServer.OnlogRecv := EventLogger;

  lCtrl := CtrlSystem.Controller.getControllers;

  for i := 0 to lCtrl.Count - 1 do
  begin
    elmCtrl := CtrlSystem.Controller.getController(lCtrl[i]);

    if Assigned(elmCtrl) then
    begin

      lElmt := elmCtrl.getElements;

      for j := 0 to lElmt.Count - 1 do begin

        elmt := elmCtrl.getElement(lElmt[j]);
        elmt.Listeners.OnExceptionMessage := OnExceptionMessage;

      end;

      lElmt.Free;
    end;
  end;
  lCtrl.Free;

  { mimic exception }
  SysMimics.Network.Listeners.OnExceptionMessage := OnExceptionMessage;
  SysMimics.Database.Listeners.OnExceptionMessage := OnExceptionMessage;

  { instructor exception }
  InstructorSys.Network.Listeners.OnExceptionMessage := OnExceptionMessage;
  InstructorSys.Database.Listeners.OnExceptionMessage := OnExceptionMessage;
  InstructorSys.ClassAlarm.Listener.OnExceptionMessage := OnExceptionMessage;


  with ERSystem.Network.Listeners.Add('DataLogger') as TPropertyEventListener do begin
    OnPropertyStringChange := EventLogger;
    OnPropertyIntChange    := nil;
    OnPropertyDblChange    := nil;
    OnPropertyBoolChange   := nil;
    OnPropertyByteChange   := nil;
    OnPropertyObjectChange := nil;
  end;

  with CtrlSystem.Network.Listeners.Add('DataLogger') as TPropertyEventListener do begin
    OnPropertyStringChange := EventLogger;
    OnPropertyIntChange    := nil;
    OnPropertyDblChange    := nil;
    OnPropertyBoolChange   := nil;
    OnPropertyByteChange   := nil;
    OnPropertyObjectChange := nil;
  end;

  with SysMimics.Network.Listeners.Add('DataLogger') as TPropertyEventListener do begin
    OnPropertyStringChange := EventLogger;
    OnPropertyIntChange    := nil;
    OnPropertyDblChange    := nil;
    OnPropertyBoolChange   := nil;
    OnPropertyByteChange   := nil;
    OnPropertyObjectChange := nil;
  end;

  with PCSSystem.Network.Listeners.Add('DataLogger') as TPropertyEventListener do begin
    OnPropertyStringChange := EventLogger;
    OnPropertyIntChange    := nil;
    OnPropertyDblChange    := nil;
    OnPropertyBoolChange   := nil;
    OnPropertyByteChange   := nil;
    OnPropertyObjectChange := nil;
  end;

  with PCSSystem.Listener.Add('DataLogger') as TPropertyEventListener do begin
    OnPropertyStringChange := EventLogger;
    OnPropertyIntChange    := nil;
    OnPropertyDblChange    := nil;
    OnPropertyBoolChange   := nil;
    OnPropertyByteChange   := nil;
    OnPropertyObjectChange := nil;
  end;

  { elements listener }
  lCtrl := CtrlSystem.Controller.getControllers;
  for I := 0 to lCtrl.Count - 1 do begin
    elmCtrl := CtrlSystem.Controller.getController(lCtrl[i]);

    if Assigned(elmCtrl) then
    begin

      lElmt := elmCtrl.getElements;

      for j := 0 to lElmt.Count - 1 do begin

        elmt := elmCtrl.getElement(lElmt[j]);

        if Assigned(elmt) then
          with (elmt.Listeners.Add('DataLogger') as TPropertyEventListener) do
          begin
            OnPropertyDblChange     := nil;
            OnPropertyIntChange     := nil;
            OnPropertyStringChange  := EventLogger;
            OnPropertyBoolChange    := nil;
            OnPropertyByteChange    := nil;
            OnPropertyObjectChange  := nil;
          end;
      end;

      lElmt.Free;
    end;
  end;
  lCtrl.Free;
end;

procedure TfrmLogger.OnExceptionMessage(const aException: string);
begin
  mmoErrorLog.Lines.Add(aException)
end;

end.
