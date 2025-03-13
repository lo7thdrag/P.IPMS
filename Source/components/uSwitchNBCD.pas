unit uSwitchNBCD;

interface

uses
  Classes, Graphics, SysUtils, uBaseComponent, uIPMS_Data, Windows;

type
  TSwitchNBCD = class(TIPMSBaseComponent)
  private
    FStatus : TStatus_SN;

    FShape : TRect;
    FShapeCol : TColor;

    procedure SetStatus(aStatus : TStatus_SN);
  protected
    procedure Paint; override;
    procedure Resize; override;
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Status : TStatus_SN read FStatus write SetStatus;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('IPMS', [TSwitchNBCD]);
end;

{ TSwitchNBCD }

constructor TSwitchNBCD.Create(aOwner: TComponent);
begin
  inherited;

  Height := 20;
  Width := 20;

  Status := SNtaDisabled;
end;

destructor TSwitchNBCD.Destroy;
begin

  inherited;
end;

procedure TSwitchNBCD.Paint;
begin
  with Canvas do
  begin
    Brush.Color := FShapeCol;
    Pen.Color := FShapeCol;
    Rectangle(FShape);
  end;

  inherited;
end;

procedure TSwitchNBCD.Resize;
begin
  inherited;

  FShape.TopLeft := Point(0, 0);
  FShape.BottomRight := Point(Width, Height);
end;

procedure TSwitchNBCD.SetStatus(aStatus: TStatus_SN);
begin
  FStatus := aStatus;

  case FStatus of
    SNtaDisabled: FShapeCol := colPink;
    SNtaClosed: FShapeCol := colGrey;
    SNtaOpen: FShapeCol := colGreen;
    SNtaAttention: FShapeCol := colYellow;
    SNtaAlarm: FShapeCol := colRed;
  end;

  Invalidate;
end;

end.
