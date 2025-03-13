unit uHMILCP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, SpeedButtonImage, uDataType;

type
  TfrmHMILCP = class(TForm)
    btn1: TSpeedButtonImage;
    btn2: TSpeedButtonImage;
    btnHMIMenuName: TSpeedButtonImage;
    btn4: TSpeedButtonImage;
    btn5: TSpeedButtonImage;
    scrlbx1: TScrollBox;
    procedure btn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FMenuString : string;
    procedure SetCustomEvent(aObj: TObject);
    function menuString(menuName : string) : string;

    procedure FormOnClose(Sender: TObject; var Action: TCloseAction);
    procedure DockForm(aForm : TForm);

    procedure OnFormShow(aFormId: Integer);
  public
    { Public declarations }
    FDockedForm : TForm;
    procedure FormFactory(aHMIFormType : E_HMIFormType; aDocked : Boolean = False);

  protected

  end;

var
  frmHMILCP: TfrmHMILCP;

implementation
uses uHMIMenu, uHMIAirAndGas, uHMILineExhaustGasTemp, uHMICrankcaseOilTemp, uHMIGenScreen, uHMIGearBox,
    uHMILubOilCircuit, uHMIDieselGearTemp, uHMISafeStopAndStartInter, uHMIFWAndSeaWater, uHMIClutchAssist;

{$R *.dfm}

procedure TfrmHMILCP.btn5Click(Sender: TObject);
begin
  FormFactory(E_HMIFormType(TComponent(sender).Tag), True);
end;

procedure TfrmHMILCP.DockForm(aForm: TForm);
begin

  if Assigned(FDockedForm) and (FDockedForm <> aForm) then
    FDockedForm.Hide;

  FDockedForm := aForm;
  with FDockedForm do begin
    Hide;
    Left := 0;
    Top := 0;
    Position := poDefault;
    BorderStyle := bsNone;
    ParentColor := True;
    Parent := scrlbx1;
    //lblTitle.Caption := Caption;
    OnClose := FormOnClose;
    Show;
  end;
end;

procedure TfrmHMILCP.FormCreate(Sender: TObject);
begin
  FMenuString := '';
  btnHMIMenuName.Caption := FormatDateTime('dd/mm/yyyy',Now) +
  ' ' + FormatDateTime('hh:nn:ss',Now);

  if not Assigned(frmHMIMenu) then
  begin
    frmHMIMenu := TfrmHMIMenu.Create(Self);
    SetCustomEvent(frmHMIMenu);
  end;
end;

procedure TfrmHMILCP.FormFactory(aHMIFormType: E_HMIFormType; aDocked: Boolean = False);
var
  aForm : TForm;
begin
  aForm := nil;

  case aHMIFormType of
    ftMenu :
    begin
     if not Assigned(frmHMIMenu) then
        frmHMIMenu := TfrmHMIMenu.Create(Self);

      aForm := frmHMIMenu;
    end;

    ftAirAndGas :
    begin
      if not Assigned(frmHMIAIrAndGas) then
        frmHMIAIrAndGas := TfrmHMIAIrAndGas.Create(Self);

      FMenuString := 'AIR AND GAS CIRCUIT';
      aForm := frmHMIAIrAndGas;
    end;

    ftGasTemperature :
    begin
      if not Assigned(frmLineGasTemp) then
        frmLineGasTemp := TfrmLineGasTemp.Create(Self);

      FMenuString := 'LINE EXHAUST GAS TEMPERATURE';
      aForm := frmLineGasTemp;
    end;

    ftCrankOil :
    begin
      if not Assigned(frmCrankOilTemp) then
        frmCrankOilTemp := TfrmCrankOilTemp.Create(Self);

      FMenuString := 'CRANKCASE OIL TEMPERATURE';
      aForm := frmCrankOilTemp;
    end;

    ftGenScreen :
    begin
      if not Assigned(frmHMIGenScreen) then
        frmHMIGenScreen := TfrmHMIGenScreen.Create(Self);

      FMenuString := 'GENERAL SCREEN';
      aForm := frmHMIGenScreen;
    end;

    ftLubOil :
    begin
      if not Assigned(frmHMILubOilCircuit) then
        frmHMILubOilCircuit := TfrmHMILubOilCircuit.Create(Self);

      FMenuString := 'LUB OIL CIRCUIT';
      aForm := frmHMILubOilCircuit;
    end;

    ftGearDiesel :
    begin
      if not Assigned(frmHMIDieselGear) then
        frmHMIDieselGear := TfrmHMIDieselGear.Create(Self);

      FMenuString := '<';
      aForm := frmHMIDieselGear;
    end;

    ftStartingInterlocks :
    begin
      if not Assigned(frmHMISafeStopAndStartingInter) then
        frmHMISafeStopAndStartingInter := TfrmHMISafeStopAndStartingInter.Create(Self);

      FMenuString := 'SAFETIES STOP & STARTING INTERLOCKS';
      aForm := frmHMISafeStopAndStartingInter;
    end;

    ftSeaWater :
    begin
      if not Assigned(frmHMISeaWater) then
        frmHMISeaWater := TfrmHMISeaWater.Create(Self);

        FMenuString := 'FW AND SEA WATER CIRCUIT';
      aForm := frmHMISeaWater;
    end;

    ftClutch :
    begin
      if not Assigned(frmHMIClutchingAssist) then
        frmHMIClutchingAssist := TfrmHMIClutchingAssist.Create(Self);

      FMenuString := 'CLUTCHING ASSISTANCE';
      aForm := frmHMIClutchingAssist;
    end;

    ftGearBox :
    begin
      if not Assigned(frmHMIGearBox) then
        frmHMIGearBox := TfrmHMIGearBox.Create(Self);

      FMenuString := 'GEARBOX';
      aForm := frmHMIGearBox;
    end;
  end;
  btnHMIMenuName.Caption := menuString(FMenuString);
  if Assigned(aForm) and aDocked then
    DockForm(aForm);
end;

procedure TfrmHMILCP.FormOnClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caHide;
end;

function TfrmHMILCP.menuString(menuName: string) : string;
begin
  Result:= menuName + #10#13 + #10#13 +
  FormatDateTime('dd/mm/yyyy',Now) + ' ' + FormatDateTime('hh:nn:ss',Now);
end;

procedure TfrmHMILCP.OnFormShow(aFormId: Integer);
begin
  FormFactory(E_HMIFormType(aFormId), True);
end;

procedure TfrmHMILCP.SetCustomEvent(aObj: TObject);
begin
  if aObj is TfrmHMIMenu then
    TfrmHMIMenu(aObj).OnShowForm := OnFormShow;
end;

end.
