unit uTimerAndSwitch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, VrControls, VrRotarySwitch, StdCtrls, VrLcd, ExtCtrls, VrThreads;

type
  TfrmTimerAndSwitch = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    vrclck1: TVrClock;
    grpRemote: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    vrtryswtchRemote: TVrRotarySwitch;
    grp1: TGroupBox;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    vrtryswtch1: TVrRotarySwitch;
    grp2: TGroupBox;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    vrtryswtch2: TVrRotarySwitch;
    grp3: TGroupBox;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    vrtryswtch3: TVrRotarySwitch;
    tmr1: TTimer;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTimerAndSwitch: TfrmTimerAndSwitch;

implementation

{$R *.dfm}

procedure TfrmTimerAndSwitch.FormCreate(Sender: TObject);
begin
  vrclck1.ShowSeconds := True;

end;

end.
