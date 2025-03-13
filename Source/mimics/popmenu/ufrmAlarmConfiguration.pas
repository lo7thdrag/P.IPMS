unit ufrmAlarmConfiguration;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls;

type
  TfrmAlarmConfiguration = class(TForm)
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    pnl1: TPanel;
    pnl2: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAlarmConfiguration: TfrmAlarmConfiguration;

implementation

{$R *.dfm}

end.
