unit uMotorControlDoubleSpeed;

interface

uses
   Classes, Dialogs, Graphics, pngimage, SysUtils, uBaseComponent, uIPMS_Data, Windows;

Type

  TMotorControlDoubleSpeed  = class(TIPMSBaseComponent)
  private
    FFileName : string;
    FPic : TPicture;
    FPath : string;
    FStatus : TStatus_MD;
    FType : TType_MD;

    procedure SetStatus(aStatus: TStatus_MD);
    procedure SetType(aType: TType_MD);
  protected
    procedure Paint; override;
  public
    constructor Create (aOwner : TComponent); override;
    destructor  Destroy ; override;
  published
    property MotorType : TType_MD read FType write SetType;
    property Status : TStatus_MD read FStatus write SetStatus ;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('IPMS', [TMotorControlDoubleSpeed]);
end;

{ TMotorControlElementDualSpeed }

constructor TMotorControlDoubleSpeed.Create(aOwner: TComponent);
begin
  inherited;

  FPic := TPicture.Create;
  MotorType := mtBidirectional_fan;
  Status  := MDtaDisableUnavailable;

  Height := 55;
  Width  := 78;
end;

destructor TMotorControlDoubleSpeed.Destroy;
begin

  inherited;
end;

procedure TMotorControlDoubleSpeed.Paint;
begin
  if FindResource(HInstance, PChar(FPath + FFileName), RT_BITMAP) <> 0 then
  begin
    FPic.Bitmap.LoadFromResourceName(HInstance, FPath +
      FFileName);

    Canvas.Draw(0, 0, FPic.Bitmap);
  end;

  inherited;
end;

procedure TMotorControlDoubleSpeed.SetStatus(aStatus: TStatus_MD);
begin
  FStatus := aStatus;

  case FStatus of
    MDtaDisableUnavailable : FFileName := '1';
    MDtaStopped : FFileName := '2';
    MDtaRemoteSupplyLow : FFileName := '3';
    MDtaRemoteExhaustHigh : FFileName := '4';
    MDtaStop_FanNotReady : FFileName := '5';
    MDtaStop_FailSupplyLow : FFileName := '6';
    MDtaStop_FailExhaustHigh : FFileName := '7';
    MDtaRunSupplyLow_FailStop : FFileName := '8';
    MDtaRunSupplyLow_FailExhaustHigh : FFileName := '9';
    MDtaRunExhaustHigh_FailSupplyLow1 : FFileName := '10';
    MDtaRunExhaustHigh_FailSupplyLow2 : FFileName := '11';
    MDtaUndeterminedFaulted : FFileName := '12';
  end;

  Invalidate;
end;

procedure TMotorControlDoubleSpeed.SetType(aType: TType_MD);
begin
  FType := aType;

  case FType of
    mtBidirectional_fan : FPath := 'MC_BiDirectionalFan_';
    mtDoubleSpeed_fan : FPath := 'MC_DoubleSpeedFan_';
  end;

  Invalidate;
end;

end.
