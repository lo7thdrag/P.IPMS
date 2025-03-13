unit ufrmConfDateTime;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DateUtils, ufrmMimics, uDataType;

type
  TOnSpanChange = procedure(aDTMin, aDTMax: TDateTime) of object;

  TfrmConfDateTime = class(TForm)
    grpStartDate: TGroupBox;
    lbl1: TLabel;
    edtDateS: TEdit;
    edtMonthS: TEdit;
    edtYearS: TEdit;
    grpEndDate: TGroupBox;
    lbl2: TLabel;
    edtDateE: TEdit;
    edtMonthE: TEdit;
    edtYearE: TEdit;
    grp1: TGroupBox;
    lbl3: TLabel;
    edtHourS: TEdit;
    edtMinS: TEdit;
    edtSecS: TEdit;
    grp2: TGroupBox;
    lbl4: TLabel;
    edtHourE: TEdit;
    edtMinE: TEdit;
    edtSecE: TEdit;
    btnOK: TButton;
    btnCancel: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    FOnSpanChange: TOnSpanChange;

    procedure SetOnSpanChange(aEvent: TOnSpanChange);
  public
    procedure SetCurrentDateTime(aDTMin, aDTMax: TDateTime);

    property OnSpanChange : TOnSpanChange read FOnSpanChange write SetOnSpanChange;
  end;

var
  frmConfDateTime: TfrmConfDateTime;

implementation

{$R *.dfm}

procedure TfrmConfDateTime.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConfDateTime.btnOKClick(Sender: TObject);
var
  dtMin, dtMax : TDateTime;
begin
  dtMin := StrToDateTime(edtYearS.Text + '-' + edtMonthS.Text + '-' +
    edtDateS.Text + ' ' + edtHourS.Text + ':' + edtMinS.Text + ':' +
    edtSecS.Text);

  dtMax := StrToDateTime(edtYearE.Text + '-' + edtMonthE.Text + '-' +
    edtDateE.Text + ' ' + edtHourE.Text + ':' + edtMinE.Text + ':' +
    edtSecE.Text);

  if Assigned(FOnSpanChange) then
    FOnSpanChange(dtMin, dtMax);

  Close;
end;

procedure TfrmConfDateTime.FormCreate(Sender: TObject);
begin
//
end;

procedure TfrmConfDateTime.FormShow(Sender: TObject);
begin
  Left := (Screen.Width - Width)  div 2;
  Top := (Screen.Height - Height) div 2;
end;

procedure TfrmConfDateTime.SetCurrentDateTime(aDTMin, aDTMax: TDateTime);
begin
  {start}
  edtDateS.Text := FormatDateTime('dd', aDTMin);
  edtMonthS.Text := FormatDateTime('MM', aDTMin);
  edtYearS.Text := FormatDateTime('yyyy', aDTMin);
  edtHourS.Text := FormatDateTime('hh', aDTMin);
  edtMinS.Text := FormatDateTime('nn', aDTMin);
  edtSecS.Text := FormatDateTime('ss', aDTMin);

  {end}
  edtDateE.Text := FormatDateTime('dd', aDTMax);
  edtMonthE.Text := FormatDateTime('MM', aDTMax);
  edtYearE.Text := FormatDateTime('yyyy', aDTMax);
  edtHourE.Text := FormatDateTime('hh', aDTMax);
  edtMinE.Text := FormatDateTime('nn', aDTMax);
  edtSecE.Text := FormatDateTime('ss', aDTMax);
end;

procedure TfrmConfDateTime.SetOnSpanChange(aEvent: TOnSpanChange);
begin
  FOnSpanChange := aEvent;
end;

end.
