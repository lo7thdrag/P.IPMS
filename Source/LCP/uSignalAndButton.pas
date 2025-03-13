unit uSignalAndButton;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, SpeedButtonImage, VrControls, VrButtons;

type
  TfrmSignalAndButton = class(TForm)
    btn1: TSpeedButtonImage;
    btn2: TSpeedButtonImage;
    btn3: TSpeedButtonImage;
    btn4: TSpeedButtonImage;
    btn5: TSpeedButtonImage;
    btn6: TSpeedButtonImage;
    btn7: TSpeedButtonImage;
    btn8: TSpeedButtonImage;
    btn9: TSpeedButtonImage;
    btn10: TSpeedButtonImage;
    btn11: TSpeedButtonImage;
    btn12: TSpeedButtonImage;
    btn13: TSpeedButtonImage;
    btn14: TSpeedButtonImage;
    btn15: TSpeedButtonImage;
    btn16: TSpeedButtonImage;
    btn17: TSpeedButtonImage;
    btn18: TSpeedButtonImage;
    btn19: TSpeedButtonImage;
    btn20: TSpeedButtonImage;
    btn21: TSpeedButtonImage;
    btn22: TSpeedButtonImage;
    btn23: TSpeedButtonImage;
    btn24: TSpeedButtonImage;
    btn25: TSpeedButtonImage;
    btn26: TSpeedButtonImage;
    btn27: TSpeedButtonImage;
    btn28: TSpeedButtonImage;
    btn29: TSpeedButtonImage;
    btn30: TSpeedButtonImage;
    procedure FormCreate(Sender: TObject);
    procedure signalName;
    procedure buttonName;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSignalAndButton: TfrmSignalAndButton;

implementation

{$R *.dfm}

procedure TfrmSignalAndButton.buttonName;
begin
  btn22.Caption := 'STOP';
  btn23.Caption := 'START';
  btn24.Caption := 'SAFETIES EG' + #13#10 + 'EC RESET';
  btn25.Caption := 'CLUTCH';
  btn26.Caption := 'DECLUTCH';
  btn27.Caption := 'SAFETIES' + #13#10 + 'STOP' + #13#10 + 'OVERRIDEN';
  btn28.Caption := 'EMERGENCY' + #13#10 + 'STOP';
  btn29.Caption := 'BY PASS' + #13#10 + 'P2-P4' + #13#10 + 'OPEN';
  btn30.Caption := 'BY PASS' + #13#10 + 'P2-P4' + 'CLOSED';

end;

procedure TfrmSignalAndButton.FormCreate(Sender: TObject);
begin
  signalName;
  buttonName;
end;

procedure TfrmSignalAndButton.signalName;
begin
  btn1.Caption := 'AIR VALVE' + #13#10 + 'OPEN';
  btn2.Caption := 'AIR VALVW' + #13#10 + 'CLOSED';
  btn3.Caption := 'WATCH DOG' + #13#10 + 'OR MAJOR' + #13#10 + 'FAULT';
  btn4.Caption := 'SAFETY' + #13#10 + 'STOP';
  btn5.Caption := 'CLUTH /' + #13#10 + 'GEARBOX' + #13#10 + 'FAULT';
  btn6.Caption := 'MINOR' + #13#10 + 'FAULT';
  btn7.Caption := 'GOVERNOR' + #13#10 + 'LIMITATOR';
  btn8.Caption := 'GAZ VALVE' + #13#10 + 'OPEN';
  btn9.Caption := 'GAZ VALVE' + #13#10 + 'CLOSED';
  btn10.Caption := 'SAFETIES' + #13#10 + 'CIRCUIT' + #13#10 + 'FAILURE';
  btn11.Caption := 'OVERSPEED' + #13#10 + 'AIR LOW' + #13#10 + 'PRESSURE';
  btn12.Caption := 'TURNING' + #13#10 + 'GEAR' + #13#10 + 'ENGAGED';
  btn13.Caption := 'LOCAL' + #13#10 + 'POSITION';
  btn14.Caption := 'REMOTE' + #13#10 + 'POSITION';
  btn15.Caption := '24 VDC' + #13#10 + 'SAFETIES';
  btn16.Caption := '24 VDC' + #13#10 + 'CONTROL';
  btn17.Caption := 'MANUAL' + #13#10 + 'HANDLE' + #13#10 + 'TO STOP';
  btn18.Caption := 'STARTING' + #13#10 + 'SEQUENCE' + #13#10 + 'FAILURE';
  btn19.Caption := 'SPARE';
  btn20.Caption := 'STARTED' + #13#10 + 'ALLOWED';
  btn21.Caption := 'CLUTCH' + #13#10 + 'ALLOWED';
end;

end.
