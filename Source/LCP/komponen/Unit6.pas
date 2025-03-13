unit Unit6;

interface

uses
  Classes, Controls, Graphics, Windows;

type
  //==============================================================================

  t2DPoint = record
    X,
    Y: double;
  end;

  TTriLeaderVisual = class
    private
      {
             A
            /\
           /__\
          B   C
      }
      FPointA, FPointB, FPointC : TPoint;
      FArcLPt, FArcRPt : TPoint; // Point lengkung pie kiri & kanan
    public
      Radius : Integer;
      PointLength : Integer;
      IsPointLeader : boolean;
      Heading : Double;
      PointWidth : integer;
      Accent : TPoint; // Titik Berat
      Center : TPoint;
    public
      constructor Create;
      destructor Destroy; override;
      procedure Draw(aCanvas: TCanvas);
      procedure ConvertCoord;
  end;
//==============================================================================
  TSpeedo = class(TCustomControl)
  private
    FPic : TPicture;
    FLoadImage : string;
    FImageName: string;
    FJarum : TTriLeaderVisual;
    FZeroPosition : Double;
    FKalibrasi : Double;
    FNilai : Double;
    FPanjangJarum : Integer;

    procedure setLoadImage(aValue : string);
    procedure setZeroPosition(aValue : Double);
    procedure setKalibrasi(aValue : Double);
    procedure setNilai (aValue : Double);
    procedure setPanjangJarum (aValue : Integer);
  protected
    procedure Paint; override;
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;
  published

    property LoadImage : string read FLoadImage write setLoadImage;
    property ZeroPosition : Double read FZeroPosition  write setZeroPosition;
    property Kalibrasi : Double read FKalibrasi write setKalibrasi;
    property Nilai : Double read FNilai write setNilai;
    property PanjangJarum : Integer read FPanjangJarum write setPanjangJarum;

  end;
procedure Register;

implementation
  uses Math;

procedure Register;
begin
  RegisterComponents('Speedo Komponent', [TSpeedo]);
end;

//==============================================================================
{Logika Jarum}
function ValidateDegree(const aDegree: double): double;
begin
  result := aDegree - (Floor(aDegree / 360.0) * 360.0);
end;

function ConvCartesian_To_Compass(const degree: double): double;
begin
  result := ValidateDegree(90.0 - degree);
end;

function ConvCompass_To_Cartesian(const degree: double): double;
begin
  result := ValidateDegree(90.0 - degree);
end;

function ConvCoordPolar_To_Cartesian(const aAngleRadian, aRadius: Double)
  : t2DPoint;
begin
  result.X := aRadius * Cos(aAngleRadian);
  result.Y := aRadius * Sin(aAngleRadian);
end;


function RoundPoint(const d: t2DPoint): TPoint;
begin
  result.X := Round(d.X);
  result.Y := Round(d.Y);
end;

procedure TranslatePoint(const ct: TPoint; var pt: TPoint);
begin
  pt.X := ct.X + pt.X;
  pt.Y := ct.Y - pt.Y;
end;


{ TTriLeaderVisual }

procedure TTriLeaderVisual.ConvertCoord;
var
  hRad : double;
  ptBerat : TPoint;
begin
  inherited;
  hRad := DegToRad(ConvCompass_To_Cartesian(Heading));

  FPointA := RoundPoint(ConvCoordPolar_To_Cartesian(hRad, Radius));
  TranslatePoint(Center, FPointA);
end;

constructor TTriLeaderVisual.Create;
begin

end;

destructor TTriLeaderVisual.Destroy;
begin

  inherited;
end;

procedure TTriLeaderVisual.Draw(aCanvas: TCanvas);
begin
  with aCanvas do
  begin
    //Brush.Style := bsClear;
    Brush.Style := bsSolid;
    Pen.Width := 2;
    MoveTo(Center.X, Center.y);
    LineTo(Round(FPointA.X), Round(FPointA.Y));

    //Pen.Width := 1;
    //LineTo(FPointA.X, FPointA.Y);

    Pen.Width := 0;
    Brush.Color := clWhite;
    Pie(53, 53, 48, 48, 0,0,0,0);

  end;
end;
//==============================================================================

{ TIPMSBaseComponent }

constructor TSpeedo.Create(aOwner: TComponent);
begin
  inherited;

  FPic := TPicture.Create;
  FLoadImage := 'D:\IPMS\source\LCP\Images\HMI_0to4.bmp';

  Height := 100;
  Width := 100;

  FZeroPosition := 0;
  FKalibrasi := 0;
  FNilai := 0;
  FPanjangJarum := 35;

  FJarum := TTriLeaderVisual.Create;
  FJarum.Radius := FPanjangJarum;
  FJarum.Center := Point(50, 50);
  FJarum.Heading := FZeroPosition;
end;

destructor TSpeedo.Destroy;
begin
  inherited;
  FJarum.Destroy;
end;

procedure TSpeedo.Paint;
var
  aRect : TRect;
begin
  inherited;

  if FLoadImage <> '' then
  begin
    FPic.Bitmap.LoadFromFile(FLoadImage);
    Canvas.Draw(0,0,FPic.Bitmap);
  end;

  FJarum.ConvertCoord;
  FJarum.Draw(Canvas);
end;

procedure TSpeedo.setZeroPosition(aValue: Double);
begin
  FZeroPosition := aValue;
  FJarum.Heading := aValue;
  Invalidate;
end;

procedure TSpeedo.setKalibrasi(aValue: Double);
begin
  FKalibrasi := aValue;
  Invalidate;
end;

procedure TSpeedo.setLoadImage(aValue: string);
begin
   FLoadImage := aValue;
   Invalidate;
end;
procedure TSpeedo.setNilai(aValue: Double);
begin
  FNilai := aValue;
  FJarum.Heading := FZeroPosition + (FNilai * FKalibrasi);
  Invalidate;
end;

procedure TSpeedo.setPanjangJarum(aValue: Integer);
begin
  FPanjangJarum := aValue;
  FJarum.Radius := FPanjangJarum;
  Invalidate;
end;

end.
