unit uHMIMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uDataType, Buttons;

type
  TOnShowForm = procedure (aFormId : Integer) of object;
  TfrmHMIMenu = class(TForm)
    btnAirGas: TSpeedButton;
    btnClutchAssist: TSpeedButton;
    btnCrankOil: TSpeedButton;
    btnSeaWater: TSpeedButton;
    btnGearBox: TSpeedButton;
    btnGeneralScreen: TSpeedButton;
    btnGasTemperature: TSpeedButton;
    btnLubOil: TSpeedButton;
    btnSaftiesStop: TSpeedButton;
    btnDieselGearTemp: TSpeedButton;
    procedure btn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FOnShowForm : TOnShowForm;
  public
    property OnShowForm : TOnShowForm read FOnShowForm write FOnShowForm;
  protected
  end;

var
  frmHMIMenu: TfrmHMIMenu;

implementation

{$R *.dfm}

procedure TfrmHMIMenu.btn1Click(Sender: TObject);
begin
//  frmHMILCP.FormFactory(E_HMIFormType(TComponent(sender).Tag), True);
  if Assigned(FOnShowForm) then
    FOnShowForm(TComponent(sender).Tag);
end;

procedure TfrmHMIMenu.FormCreate(Sender: TObject);
begin
  //btnAirGas.Glyph.LoadFromFile('..\..\resources\LCP\Air and Gas.bmp');
end;

end.
