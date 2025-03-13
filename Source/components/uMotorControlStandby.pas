unit uMotorControlStandby;

interface

uses
    Classes, Dialogs, Graphics, SysUtils, uBaseComponent, uIPMS_Data, Windows;
Type

  TMotorControlStandby = class (TIPMSBaseComponent)
  private
    FFileName: string;
    FPath : string;
    FPic : TPicture;
    FStatus : TStatus_MS;

    procedure SetStatus(aPump: TStatus_MS);
  protected
    procedure Paint; override;
  public
    constructor Create(aOwner : TComponent); override;
    destructor Destroy; override;
  published
    property StatusPump : TStatus_MS read FStatus write SetStatus;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('IPMS', [TMotorControlStandby]);
end;

{ TMotorControlStandby }

constructor TMotorControlStandby.Create(aOwner: TComponent);
begin
  inherited;

  Height := 55;
  Width  := 55;

  FPic := TPicture.Create;
  StatusPump := MStaStoppedNotStandby;
end;

destructor TMotorControlStandby.Destroy;
begin

  inherited;
end;

procedure TMotorControlStandby.Paint;
begin
  if FindResource(HInstance, PChar(FPath + FFileName), RT_BITMAP) <> 0 then
  begin
    FPic.Bitmap.LoadFromResourceName(HInstance, FPath +
      FFileName);

    Canvas.Draw(0, 0, FPic.Bitmap);
  end;

  inherited;
end;

procedure TMotorControlStandby.SetStatus(aPump: TStatus_MS);
begin
  FStatus := aPump;

  case FStatus of
    MStaStoppedNotStandby : FFileName := '1';
    MStaRunningFailStandby : FFileName := '2';
    MStaStoppedFailStandby : FFileName := '3';
  end;

  Invalidate;
end;

end.
