unit uTrendDataType;

interface

type
  TPointData = class
    ETimeStamp : TDateTime;
    EValue : Double;
  end;

  { enumeration }
  E_LinesType = (eltPoint = 0, eltExpression, eltLogged, eltLoggedExpression,
                 eltCSVFile, eltReferenceFile);

  E_LineDispStyle = (eldsNone, eldsSolid, eldsDash, eldSmallDash, eldsDashDot, eldsDashDotDot);

  E_LineDispExpansion = (eldeStep, eldeSmooth);

  E_LineDispCompression = (eldcNone, eldcAverage, eldcFirst, eldcLast, eldcMin, eldcMax);

  E_DataSource = (edsIOInformation, edsPrimLogAlarms, edsPrimLogPoints,
                  edsSecLogAlarms, edsSecLogPoints,edsUniMACS, edsUniMACSLog,
                  edsUserDefined);

  E_AxisType = (eatXTime, eatY);
  E_XAxisTime = (exaMostRecent, exaStartDate, exaNowMinDays, exaStartTime, exaNowMinTime);

  E_GridTicks = (egtFixed, egdCustom);

const
  C_LINE_ATTR : array [0..14] of string =
      (
        'Line ID',
        'Slider Value',
        'Engineering Units',
        'Point Description',
        'Current Value',
        'Slider Value Time',
        'Slider Value Date',
        'Y axis limits',
        'Array status',
        'Autoupdate status',
        '2nd Slider Value',
        '2nd Slider Value Time',
        '2nd Slider Value Date',
        'Slider Value Time Delta',
        'Slider Value Delta'
      );

  C_LINE_TITILE : array [0..14] of string =
      (
        'Line ID',
        'Slider Value',
        'Units',
        'Description',
        'Current Value',
        'Slider Value Time',
        'Slider Value Date',
        'Lower Limit/Upper Limit',
        'Is Array',
        'Is Autoupdate',
        '2nd Slider Value',
        '2nd Slider Value Time',
        '2nd Slider Value Date',
        'Slider Value Time Delta',
        'Slider Value Delta'
      );
implementation


end.
