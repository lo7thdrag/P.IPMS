unit uGaugeLCP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, VrControls, VrWheel, Unit6;

type
  TfrmGaugeLCP = class(TForm)
    vrwhl1: TVrWheel;
    vrwhl3: TVrWheel;
    vrwhl4: TVrWheel;
    vrwhl5: TVrWheel;
    vrwhl2: TVrWheel;
    pnlAlarmFlash: TPanel;
    btnHooter: TSpeedButton;
    pnl5: TPanel;
    pnl4: TPanel;
    pnl3: TPanel;
    pnl2: TPanel;
    pnl1: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGaugeLCP: TfrmGaugeLCP;

implementation

{$R *.dfm}

end.
