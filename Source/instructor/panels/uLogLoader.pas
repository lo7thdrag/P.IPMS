unit uLogLoader;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, Buttons, uDatabase, DateUtils, ZConnection,
  DB, ZAbstractRODataset, ZAbstractDataset, ZStoredProcedure;

type
  TfrmLogLoader = class(TForm)
    pnlTop: TPanel;
    chkEnd: TCheckBox;
    lblStart: TLabel;
    medtStartDate: TMaskEdit;
    medtStartTime: TMaskEdit;
    medtStopDate: TMaskEdit;
    medtStopTime: TMaskEdit;
    btnStartSim: TBitBtn;
    btnPauseSim: TBitBtn;
    btnStop: TBitBtn;
    btnInit: TButton;
    procedure btnAvailStartClick(Sender: TObject);
    procedure btnAvailStopClick(Sender: TObject);
    procedure btnInitClick(Sender: TObject);
  private
    { Private declarations }
    FDatabase : TIPMSDatabase;
  public
    { Public declarations }
    procedure SetDatabase(aDbase: TIPMSDatabase);

  end;

var
  frmLogLoader: TfrmLogLoader;

implementation

uses uAvailableTimes;

{$R *.dfm}

{ TfrmLogLoader }

procedure TfrmLogLoader.btnAvailStartClick(Sender: TObject);
var
  aList : TStrings;
begin
  FDatabase.GetAvailableLogTimeStamp('START',alist);

  if Assigned(aList) then begin
    frmAvailTimes := TfrmAvailTimes.Create(Self);
    frmAvailTimes.SetAvailableTimes(aList);
    frmAvailTimes.ShowModal;

    alist.Free;
  end;
end;

procedure TfrmLogLoader.btnAvailStopClick(Sender: TObject);
var
  aList : TStrings;
begin
  FDatabase.GetAvailableLogTimeStamp('STOP',alist);

  if Assigned(aList) then begin
    frmAvailTimes := TfrmAvailTimes.Create(Self);
    frmAvailTimes.SetAvailableTimes(aList);
    frmAvailTimes.ShowModal;

    alist.Free;
  end;
end;

procedure TfrmLogLoader.btnInitClick(Sender: TObject);
var
  s,e : TDateTime;
  y,m,d,h,n : Integer;
  l : TStrings;
begin


  l := TStringList.Create;

  try
    l.Clear;
    l.Delimiter := '/';
    l.DelimitedText := medtStartDate.Text;

    y := StrToInt(l[2]);
    m := StrToInt(l[1]);
    d := StrToInt(l[0]);

    l.Clear;
    l.Delimiter := ':';
    l.DelimitedText := medtStartTime.Text;

    n := StrToInt(l[1]);
    h := StrToInt(l[0]);
  except
    MessageDlg('Invalid Date!!',mtError,[mbok],0);
    Exit;
  end;

  s := EncodeDateTime(y,m,d,h,n,0,0);

  try
    l.Clear;
    l.Delimiter := '/';
    l.DelimitedText := medtStopDate.Text;

    y := StrToInt(l[2]);
    m := StrToInt(l[1]);
    d := StrToInt(l[0]);

    l.Clear;
    l.Delimiter := ':';
    l.DelimitedText := medtStopTime.Text;

    n := StrToInt(l[1]);
    h := StrToInt(l[0]);
  except
    MessageDlg('Invalid Date!!',mtError,[mbok],0);
    Exit;
  end;

  e := EncodeDateTime(y,m,d,h,n,0,0);

  l.Free;

//  FDatabase.LogTimeScenario(s,e) ;

end;

procedure TfrmLogLoader.SetDatabase(aDbase: TIPMSDatabase);
begin
  FDatabase := aDbase;
end;

end.
