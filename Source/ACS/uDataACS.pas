unit uDataACS;

interface

type

  TAlarmState = class
    sandiRuangan : string;
    deck : string;
    lokasi : string;
    lokasiGRM : string;
    alarmID : Byte;
    alarmMessage : string;
    alarmMessageGRM : string;
    alarmComment : string;
    alarmCommentGRM : string;
    faultID : Byte;
    faultMessage : string;
    faultMessageGRM : string;
    faultComment : string;
    faultCommentGRM : string;
    statusRec : Byte;
    scenTime : TDateTime;
  end;

implementation

end.
