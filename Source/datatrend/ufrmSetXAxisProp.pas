unit ufrmSetXAxisProp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ufrmSetAxisProp, uTrendDataType;

type
  TfrmSetXAxisProp = class(TfrmSetAxisProp)
    lbl1: TLabel;
    lbl4: TLabel;
    edtLabelAxis: TEdit;
    edtTicks: TEdit;
    chkNumbered: TCheckBox;
    lbl5: TLabel;
    medtDuration: TMaskEdit;
    chkNoScroll: TCheckBox;
    grp2: TGroupBox;
    cbbStartDay: TComboBox;
    cbbStartTime: TComboBox;
    medtStartTime: TMaskEdit;
    medtStartDay: TMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure cbbStartDayChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetXAxisProp: TfrmSetXAxisProp;

implementation

{$R *.dfm}

procedure TfrmSetXAxisProp.cbbStartDayChange(Sender: TObject);
  function IntTo2DgtStr(aValue : Word) : string;
  var
    s : String;
  begin
    s := IntToStr(aValue);
    if Length(s) = 1 then
      s := '0' + s;

    Result := s;
  end;
var
  d,m,y : word;
begin
  inherited;

  DecodeDate(Now,y,m,d);

  case cbbStartDay.ItemIndex of

    { most recent }
    0 :
    begin
      cbbStartTime.Visible := False;
      medtStartDay.Visible := False;
      medtStartTime.Visible := False;
    end;

    1 :
    begin
      cbbStartTime.Visible := True;
      medtStartDay.Visible := True;
      medtStartTime.Visible := True;

      medtStartDay.EditMask := '!99/99/0000;1;_';
      medtStartDay.Text := IntTo2DgtStr(d) + '/' + IntTo2DgtStr(m) + '/' + IntToStr(y);
    end;

    2 :
    begin
      cbbStartTime.Visible := True;
      medtStartDay.Visible := True;
      medtStartTime.Visible := True;

      medtStartDay.EditMask := '';
      medtStartDay.Text := '0';
    end;

  end;
end;

procedure TfrmSetXAxisProp.FormCreate(Sender: TObject);
begin
  inherited;
  AxisType := eatXTime;
end;

end.
