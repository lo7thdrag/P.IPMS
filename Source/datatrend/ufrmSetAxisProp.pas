unit ufrmSetAxisProp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uTrendDataType;

type
  TfrmSetAxisProp = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    FAxisColor: TColor;
    FAxisID: String;
    FAxisVisible: boolean;
    FAxisData: TObject;
    FAxisType: E_AxisType;
    FAxisDefault: Boolean;
    procedure SetAxisColor(const Value: TColor);
    procedure SetAxisData(const Value: TObject);
    procedure SetAxisID(const Value: String);
    procedure SetAxisVisible(const Value: boolean);
    procedure SetAxisType(const Value: E_AxisType);
    procedure SetAxisDefault(const Value: Boolean);
    { Private declarations }
  public
    { Public declarations }
    property AxisColor : TColor  read FAxisColor write SetAxisColor;
    property AxisVisible : boolean   read FAxisVisible write SetAxisVisible;
    property AxisData : TObject   read FAxisData write SetAxisData;
    property AxisID : String   read FAxisID write SetAxisID;
    property AxisType : E_AxisType read FAxisType write SetAxisType;
    property AxisDefault : Boolean read FAxisDefault write SetAxisDefault;
  end;

var
  frmSetAxisProp: TfrmSetAxisProp;

implementation

{$R *.dfm}

{ TfrmSetAxisProp }

procedure TfrmSetAxisProp.FormCreate(Sender: TObject);
begin
  Align := alClient;
  BorderStyle := bsNone;
end;

procedure TfrmSetAxisProp.SetAxisColor(const Value: TColor);
begin
  FAxisColor := Value;
end;

procedure TfrmSetAxisProp.SetAxisData(const Value: TObject);
begin
  FAxisData := Value;
end;

procedure TfrmSetAxisProp.SetAxisDefault(const Value: Boolean);
begin
  FAxisDefault := Value;
end;

procedure TfrmSetAxisProp.SetAxisID(const Value: String);
begin
  FAxisID := Value;
end;

procedure TfrmSetAxisProp.SetAxisType(const Value: E_AxisType);
begin
  FAxisType := Value;
end;

procedure TfrmSetAxisProp.SetAxisVisible(const Value: boolean);
begin
  FAxisVisible := Value;
end;

end.
