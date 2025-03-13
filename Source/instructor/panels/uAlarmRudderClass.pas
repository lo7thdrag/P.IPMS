unit uAlarmRudderClass;

interface

uses uEntity, uDataType, uListener;

type

  TAlarmObj = class
   Props : E_PropsID;
   Value : Boolean;
   aID : Byte;
   Status : Byte; {Prince : khusus telegrap}
  end;

  TClassAlarm = class
  private

//    FLamp : array of boolean;
    FListener: TListeners;
    FAlarmObj: TAlarmObj;

  public

    constructor Create;
    destructor Destroy;override;

    procedure setLamp(aObj : TAlarmObj);

    property Listener :TListeners read FListener;
    property AlarmObj : TAlarmObj read FAlarmObj write FAlarmObj;
  end;


implementation

constructor TClassAlarm.Create;
//var
//  i : integer;
begin
//  SetLength(FLamp, LAMP_COUNT);
//  for I := 0 to LAMP_COUNT - 1 do
//  begin
//    FLamp[i] := false;
//  end;

  FListener := TListeners.Create;
end;

destructor TClassAlarm.Destroy;
begin
  FListener.Destroy;
  inherited;
end;

procedure TClassAlarm.setLamp(aObj : TAlarmObj);
begin
  Listener.TriggerEvents(self,aObj.Props, aObj);
end;

end.
