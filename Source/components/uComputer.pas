unit uComputer;

interface

uses
  Classes, Graphics, Windows, uBaseComponent, uIPMS_Data;

type

  TComputer = class(TIPMSBaseComponent)
  private
    FCompName : string;
    FPic : TPicture;
    FResName : string;
    FShapeCol : TColor;
    FStatus : TStatus_SW;
    FType : TType_PC;

    procedure SetCompName(aName: string);
    procedure SetStatus(aStatus: TStatus_SW);
    procedure SetType(aType: TType_PC);
  protected
    procedure Paint; override;
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;
  published
    property ComputerName : string read FCompName write SetCompName;
    property ComputerType : TType_PC read FType write SetType;
    property Status : TStatus_SW read FStatus write SetStatus;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('IPMS', [TComputer]);
end;

{ TComputer }

constructor TComputer.Create(aOwner: TComponent);
begin
  inherited;

  FPic := TPicture.Create;

  ComputerName := 'TNI 000';
  ComputerType := PCtpServer;
  Status := SWtaDisabled;
end;

destructor TComputer.Destroy;
begin

  inherited;
end;

procedure TComputer.Paint;
const
  ScrHeight = 29;
  ScrWidth = 38;
var
  ctr : Integer;
  tempRect : TRect;
begin
  if FindResource(HInstance, PChar(FResName), RT_BITMAP) <> 0 then
  begin
    FPic.Bitmap.LoadFromResourceName(HInstance, FResName);

    with Canvas do
    begin
      Draw(0, 0, FPic.Bitmap);

      Brush.Color := FShapeCol;
      Pen.Color := FShapeCol;

      ctr := (Width - ScrWidth) div 2;
      Rectangle(ctr - 1, 3, ctr + ScrWidth, 33);

      Font.Style := [fsBold];

      tempRect.TopLeft := Point(ctr - 1, 3);
      tempRect.BottomRight := Point(ctr + ScrWidth, 18);
      DrawText(Canvas.Handle, PChar(Copy(FCompName, 1, 3)), -1, tempRect, DT_CENTER);

      tempRect.TopLeft := Point(ctr - 1, 18);
      tempRect.BottomRight := Point(ctr + ScrWidth, 33);
      DrawText(Canvas.Handle, PChar(Copy(FCompName, 5, 3)), -1, tempRect, DT_CENTER);
    end;
  end;

  inherited;
end;

procedure TComputer.SetCompName(aName: string);
begin
  FCompName := aName;
  Invalidate;
end;

procedure TComputer.SetStatus(aStatus: TStatus_SW);
begin
  FStatus := aStatus;

  case FStatus of
    SWtaDisabled: FShapeCol := colPink;
    SWtaFalse: FShapeCol := colGrey;
    SWtaOk: FShapeCol := colBrightGreen;
    SWtaIndicateAlarm: FShapeCol := colDarkGreen;
    SWtaWarning: FShapeCol := colYellow;
    SWtaAlarm: FShapeCol := colRed;
  end;

  Invalidate;
end;

procedure TComputer.SetType(aType: TType_PC);
begin
  FType := aType;

  case FType of
    PCtpServer:
    begin
      FResName := 'PC_Server';
      Height := 63;
      Width := 46;
    end;
    PCtpClient:
    begin
      FResName := 'PC_Client';
      Height := 67;
      Width := 58;
    end;
  end;

  Invalidate;
end;

end.
