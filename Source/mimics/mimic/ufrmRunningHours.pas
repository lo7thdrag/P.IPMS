unit ufrmRunningHours;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMimics, ExtCtrls, jpeg, uBaseComponent, uRunningHour, Menus;

type
  TfrmRunningHours = class(TfrmMimics)
    Image1: TImage;
    RunningHour1: TRunningHour;
    RunningHour2: TRunningHour;
    RunningHour3: TRunningHour;
    RunningHour4: TRunningHour;
    RunningHour5: TRunningHour;
    RunningHour6: TRunningHour;
    RunningHour7: TRunningHour;
    RunningHour8: TRunningHour;
    RunningHour9: TRunningHour;
    RunningHour10: TRunningHour;
    RunningHour11: TRunningHour;
    RunningHour12: TRunningHour;
    RunningHour13: TRunningHour;
    RunningHour14: TRunningHour;
    RunningHour15: TRunningHour;
    RunningHour16: TRunningHour;
    RunningHour17: TRunningHour;
    RunningHour18: TRunningHour;
    RunningHour19: TRunningHour;
    RunningHour20: TRunningHour;
    RunningHour21: TRunningHour;
    RunningHour22: TRunningHour;
    RunningHour23: TRunningHour;
    RunningHour24: TRunningHour;
    RunningHour25: TRunningHour;
    RunningHour26: TRunningHour;
    RunningHour27: TRunningHour;
    RunningHour28: TRunningHour;
    RunningHour29: TRunningHour;
    RunningHour30: TRunningHour;
    RunningHour31: TRunningHour;
    RunningHour32: TRunningHour;
    RunningHour33: TRunningHour;
    RunningHour34: TRunningHour;
    RunningHour35: TRunningHour;
    RunningHour36: TRunningHour;
    RunningHour37: TRunningHour;
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRunningHours: TfrmRunningHours;

implementation

{$R *.dfm}

procedure TfrmRunningHours.FormResize(Sender: TObject);
begin
  inherited;

  Image1.Left := 0;
  Image1.Top := 0;
  Image1.Height := Height;
  Image1.Width := Width;
end;

end.
