unit ufrmSetYAxisProp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ufrmSetAxisProp, uTrendDataType;

type
  TfrmSetYAxisProp = class(TfrmSetAxisProp)
    grp1: TGroupBox;
    lbl2: TLabel;
    lbl3: TLabel;
    chkAutoscale: TCheckBox;
    chkUsePoint: TCheckBox;
    edtLowerLimit: TEdit;
    edtUpperLimit: TEdit;
    chkNumbered: TCheckBox;
    edtTicks: TEdit;
    lbl4: TLabel;
    lbl1: TLabel;
    edtLabelAxis: TEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetYAxisProp: TfrmSetYAxisProp;

implementation

{$R *.dfm}

procedure TfrmSetYAxisProp.FormCreate(Sender: TObject);
begin
  inherited;
  AxisType := eatY;
end;

end.

