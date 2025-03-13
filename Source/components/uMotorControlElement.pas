unit uMotorControlElement;

interface

uses
  Classes, Dialogs, Graphics, SysUtils, uBaseComponent, uIPMS_Data, Windows;

type

  TMotorControlElement = class(TIPMSBaseComponent)
  private
    FFace : TFace_MC;
    FFaceStr : string;
    FFileName : string;
    FGenType : TGenType_MC;
    FGenStr : string;
    FIsShowAutoHandle : Boolean;
    FIsShowManHandle : Boolean;
    FPath : string;
    FPic : TPicture;
    FShapeCol : TColor;
    FStatus : TStatus_MC;
    FType : TType_MC;

    procedure DrawHandle(aCanvas: TCanvas; aManX, aManY, aAutoX, aAutoY: Integer);

    procedure SetFace(aFace: TFace_MC);
    procedure SetShowAutoHandle(aIsShow: Boolean);
    procedure SetShowManHandle(aIsShow: Boolean);
    procedure SetStatus(aStatus : TStatus_MC);
    procedure SetType(aType : TType_MC);
    procedure SetGenType(aGenType : TGenType_MC);
  protected
    procedure Paint; override;
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Face : TFace_MC read FFace write SetFace;
    property GenType : TGenType_MC read FGenType write SetGenType;
    property SensorType : TType_MC read FType write SetType;
    property ShowAutoHandle : Boolean read FIsShowAutoHandle write SetShowAutoHandle;
    property ShowManHandle : Boolean read FIsShowManHandle write SetShowManHandle;
    property Status : TStatus_MC read FStatus write SetStatus;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('IPMS', [TMotorControlElement]);
end;

{ TMotorControlElement }

constructor TMotorControlElement.Create(aOwner: TComponent);
begin
  inherited;

  Height := 55;
  Width := 55;

  FPic := TPicture.Create;
  Face := MCfcRight;
  GenType := MCgtG1;
  SensorType := stCentrfgl_pump;
  Status := MCtaDisableUnavailable;
end;

destructor TMotorControlElement.Destroy;
begin

  inherited;
end;

procedure TMotorControlElement.DrawHandle(aCanvas: TCanvas; aManX, aManY,
  aAutoX, aAutoY: Integer);
begin
  with aCanvas do
  begin
    Pen.Color := FShapeCol;

    if FIsShowManHandle then
    begin
      MoveTo(aManX + 3, aManY + 0);
      LineTo(aManX + 10, aManY + 7);
      MoveTo(aManX + 0, aManY + 9);
      LineTo(aManX + 6, aManY + 3);
    end;

    if FIsShowAutoHandle then
    begin
      MoveTo(aAutoX + 3, aAutoY + 1);
      LineTo(aAutoX + 12, aAutoY + 10);
      MoveTo(aAutoX + 12, aAutoY + 10);
      LineTo(aAutoX + 9, aAutoY + 13);
      MoveTo(aAutoX + 9, aAutoY + 13);
      LineTo(aAutoX + 0, aAutoY + 4);
      MoveTo(aAutoX + 0, aAutoY + 4);
      LineTo(aAutoX + 3, aAutoY + 1);

      MoveTo(aAutoX + 8, aAutoY + 5);
      LineTo(aAutoX + 13, aAutoY + 0);
    end;
  end;
end;

procedure TMotorControlElement.Paint;
begin
  case FType of
    stCentrfgl_pump,
    stPston_pump:
    begin
      if FindResource(HInstance, PChar(FPath + FFileName + FFaceStr),
         RT_BITMAP) <> 0 then
      begin
        FPic.Bitmap.LoadFromResourceName(HInstance, FPath + FFileName + FFaceStr);

        Canvas.Draw(0, 0, FPic.Bitmap);
        DrawHandle(Canvas, 41, 4, 2, 41);
      end;
    end;
    stGenerator:
    begin
      if FindResource(HInstance, PChar(FPath + FGenStr + FFileName),
         RT_BITMAP) <> 0 then
      begin
        FPic.Bitmap.LoadFromResourceName(HInstance, FPath + FGenStr + FFileName);

        Canvas.Draw(0, 0, FPic.Bitmap);
        DrawHandle(Canvas, 41, 4, 2, 41);
      end;
    end
  else
    begin
      if FindResource(HInstance, PChar(FPath + FFileName), RT_BITMAP) <> 0 then
      begin
        FPic.Bitmap.LoadFromResourceName(HInstance, FPath + FFileName);

        with Canvas do
        begin
          Draw(0, 0, FPic.Bitmap);
          DrawHandle(Canvas, 41, 4, 2, 41);
        end;
      end;
    end;
  end;

  inherited;
end;

procedure TMotorControlElement.SetFace(aFace: TFace_MC);
begin
  FFace := aFace;

  case FFace of
    MCfcRight: FFaceStr := '_Right';
    MCfcBottom: FFaceStr := '_Bottom';
    MCfcLeft: FFaceStr := '_Left';
    MCfcTop: FFaceStr := '_Top';
  end;

  Invalidate;
end;

procedure TMotorControlElement.SetGenType(aGenType: TGenType_MC);
begin
  FGenType := aGenType;

  case FGenType of
    MCgtG1: FGenStr := 'G1_';
    MCgtG2: FGenStr := 'G2_';
    MCgtG3: FGenStr := 'G3_';
    MCgtG4: FGenStr := 'G4_';
    MCgtEG: FGenStr := 'EG_';
  end;

  Invalidate;
end;

procedure TMotorControlElement.SetShowAutoHandle(aIsShow: Boolean);
begin
  FIsShowAutoHandle := aIsShow;
  Invalidate;
end;

procedure TMotorControlElement.SetShowManHandle(aIsShow: Boolean);
begin
  FIsShowManHandle := aIsShow;
  Invalidate;
end;

procedure TMotorControlElement.SetStatus(aStatus: TStatus_MC);
begin
  FStatus := aStatus;

  case FStatus of
    MCtaDisableUnavailable :
    begin
      FFileName := 'DisableUnavailable';
      FShapeCol := colPink;
    end;
    MCtaStopped :
    begin
      FFileName := 'Stopped';
      FShapeCol := colGrey;
    end;
    MCtaRunning :
    begin
      FFileName := 'Running';
      FShapeCol := colGreen;
    end;
    MCtaNotReadyForUse :
    begin
      FFileName := 'NotReadyToUse';
      FShapeCol := colYellow;
    end;
    MCtaFailedToStart :
    begin
      FFileName := 'FailedToStart';
      FShapeCol := colRed;
    end;
    MCtaRunningFailStop_Faulted_Undetermined :
    begin
      FFileName := 'FailedToStop';
      FShapeCol := colRed;
    end;
  end;

  Invalidate;
end;

procedure TMotorControlElement.SetType(aType: TType_MC);
begin
  FType := aType;

  case FType of
    stCentrfgl_pump   : FPath := 'MC_CentrifugalPump_';
    stPston_pump      : FPath := 'MC_PistonPump_';
    stFan_sngleSpeed  : FPath := 'MC_SingleSpeedFan_';
    stGenerator       : FPath := 'MC_Generator_';
    stSparator        : FPath := 'MC_Separator_';
    stFilter          : FPath := 'MC_Filter_';
  end;

  Invalidate;
end;

end.
