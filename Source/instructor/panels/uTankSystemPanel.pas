unit uTankSystemPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, uDatatype;

type
  TfrmTankSystemPanel = class(TForm)
    grpBallastTank: TGroupBox;
    btnStart: TBitBtn;
    btnStop: TBitBtn;
    btnSet: TBitBtn;
    Edit1: TEdit;
    lblCapacity: TLabel;
    lblTransRate: TLabel;
    Label35: TLabel;
    Edit20: TEdit;
    Edit21: TEdit;
    BitBtn73: TBitBtn;
    BitBtn74: TBitBtn;
    BitBtn75: TBitBtn;
    BitBtn76: TBitBtn;
    ComboBox1: TComboBox;
    Label44: TLabel;
    GroupBox19: TGroupBox;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    BitBtn77: TBitBtn;
    BitBtn78: TBitBtn;
    BitBtn79: TBitBtn;
    Edit22: TEdit;
    Edit23: TEdit;
    Edit24: TEdit;
    BitBtn80: TBitBtn;
    BitBtn81: TBitBtn;
    BitBtn82: TBitBtn;
    BitBtn83: TBitBtn;
    ComboBox2: TComboBox;
    GroupBox20: TGroupBox;
    Label42: TLabel;
    Label43: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    BitBtn84: TBitBtn;
    BitBtn85: TBitBtn;
    BitBtn86: TBitBtn;
    Edit25: TEdit;
    Edit26: TEdit;
    Edit27: TEdit;
    BitBtn87: TBitBtn;
    BitBtn88: TBitBtn;
    BitBtn89: TBitBtn;
    BitBtn90: TBitBtn;
    ComboBox3: TComboBox;
    GroupBox21: TGroupBox;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    BitBtn91: TBitBtn;
    BitBtn92: TBitBtn;
    BitBtn93: TBitBtn;
    Edit28: TEdit;
    Edit29: TEdit;
    Edit30: TEdit;
    BitBtn94: TBitBtn;
    BitBtn95: TBitBtn;
    BitBtn96: TBitBtn;
    BitBtn97: TBitBtn;
    ComboBox4: TComboBox;
    GroupBox22: TGroupBox;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    BitBtn98: TBitBtn;
    BitBtn99: TBitBtn;
    BitBtn100: TBitBtn;
    Edit31: TEdit;
    Edit32: TEdit;
    Edit33: TEdit;
    BitBtn101: TBitBtn;
    BitBtn102: TBitBtn;
    BitBtn103: TBitBtn;
    BitBtn104: TBitBtn;
    ComboBox5: TComboBox;
    GroupBox23: TGroupBox;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    BitBtn105: TBitBtn;
    BitBtn106: TBitBtn;
    BitBtn107: TBitBtn;
    Edit34: TEdit;
    Edit35: TEdit;
    Edit36: TEdit;
    BitBtn108: TBitBtn;
    BitBtn109: TBitBtn;
    BitBtn110: TBitBtn;
    BitBtn111: TBitBtn;
    ComboBox6: TComboBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    ComboBox7: TComboBox;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit19: TEdit;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    ComboBox8: TComboBox;
    GroupBox3: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    Edit37: TEdit;
    Edit38: TEdit;
    Edit39: TEdit;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    BitBtn20: TBitBtn;
    BitBtn69: TBitBtn;
    ComboBox9: TComboBox;
    GroupBox4: TGroupBox;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    BitBtn70: TBitBtn;
    BitBtn71: TBitBtn;
    BitBtn72: TBitBtn;
    Edit40: TEdit;
    Edit41: TEdit;
    Edit42: TEdit;
    BitBtn112: TBitBtn;
    BitBtn113: TBitBtn;
    BitBtn114: TBitBtn;
    BitBtn115: TBitBtn;
    ComboBox10: TComboBox;
    GroupBox5: TGroupBox;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    BitBtn116: TBitBtn;
    BitBtn117: TBitBtn;
    BitBtn118: TBitBtn;
    Edit43: TEdit;
    Edit44: TEdit;
    Edit45: TEdit;
    BitBtn119: TBitBtn;
    BitBtn120: TBitBtn;
    BitBtn121: TBitBtn;
    BitBtn122: TBitBtn;
    ComboBox11: TComboBox;
    GroupBox18: TGroupBox;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    BitBtn123: TBitBtn;
    BitBtn124: TBitBtn;
    BitBtn125: TBitBtn;
    Edit46: TEdit;
    Edit47: TEdit;
    Edit48: TEdit;
    BitBtn126: TBitBtn;
    BitBtn127: TBitBtn;
    BitBtn128: TBitBtn;
    BitBtn129: TBitBtn;
    ComboBox12: TComboBox;
    GroupBox24: TGroupBox;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    BitBtn130: TBitBtn;
    BitBtn131: TBitBtn;
    BitBtn132: TBitBtn;
    Edit49: TEdit;
    Edit50: TEdit;
    Edit51: TEdit;
    BitBtn133: TBitBtn;
    BitBtn134: TBitBtn;
    BitBtn135: TBitBtn;
    BitBtn136: TBitBtn;
    ComboBox13: TComboBox;
    GroupBox25: TGroupBox;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    BitBtn137: TBitBtn;
    BitBtn138: TBitBtn;
    BitBtn139: TBitBtn;
    Edit52: TEdit;
    Edit53: TEdit;
    Edit54: TEdit;
    BitBtn140: TBitBtn;
    BitBtn141: TBitBtn;
    BitBtn142: TBitBtn;
    BitBtn143: TBitBtn;
    ComboBox14: TComboBox;
    GroupBox6: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    BitBtn21: TBitBtn;
    BitBtn22: TBitBtn;
    BitBtn23: TBitBtn;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    BitBtn24: TBitBtn;
    BitBtn25: TBitBtn;
    BitBtn26: TBitBtn;
    BitBtn27: TBitBtn;
    ComboBox15: TComboBox;
    GroupBox7: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    BitBtn28: TBitBtn;
    BitBtn29: TBitBtn;
    BitBtn30: TBitBtn;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    BitBtn31: TBitBtn;
    BitBtn32: TBitBtn;
    BitBtn33: TBitBtn;
    BitBtn34: TBitBtn;
    ComboBox16: TComboBox;
    GroupBox8: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    BitBtn35: TBitBtn;
    BitBtn36: TBitBtn;
    BitBtn37: TBitBtn;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit55: TEdit;
    BitBtn38: TBitBtn;
    BitBtn39: TBitBtn;
    BitBtn40: TBitBtn;
    BitBtn41: TBitBtn;
    ComboBox17: TComboBox;
    GroupBox9: TGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    BitBtn42: TBitBtn;
    BitBtn43: TBitBtn;
    BitBtn44: TBitBtn;
    Edit56: TEdit;
    Edit57: TEdit;
    Edit58: TEdit;
    BitBtn45: TBitBtn;
    BitBtn46: TBitBtn;
    BitBtn47: TBitBtn;
    BitBtn48: TBitBtn;
    ComboBox18: TComboBox;
    procedure ButtonAction(Sender: TObject);
    procedure A(Sender: TObject);
    procedure ValueSensorChange(Sender: TObject);
  private
    function GetTankIndex(aIdentifier: string): Integer;
  public
    { Public declarations }
  end;

  E_BitButtonMean = (bbmSetContent, bbmSetFillRate, bbmSetTransferRate,
    bbmFillStart, bbmFillStop, bbmTransferStart, bbmTransferStop);

var
  frmTankSystemPanel: TfrmTankSystemPanel;

implementation

uses
  uERSystem;

{$R *.dfm}

procedure TfrmTankSystemPanel.A(Sender: TObject);
begin
//
end;

procedure TfrmTankSystemPanel.ButtonAction(Sender: TObject);
var
  i, {tag,} tankIndex : Integer;
  newValue : Double;
  c : TComponent;
begin
//  tag := TBitBtn(Sender).Tag;
  tankIndex := GetTankIndex(TGroupBox(TBitBtn(Sender).Parent).Caption);
  newValue := 0; // init

  with ERSystem.ERManager.EngineRoom.getFuelOilSystem do
  begin
    case E_BitButtonMean(TBitBtn(Sender).Tag) of
      bbmSetContent:
      begin
        for i := 0 to ComponentCount - 1 do
        begin
          c := Components[i];

          if (c is TEdit) and
            (TEdit(c).Parent = TBitBtn(Sender).Parent) and
            (TEdit(c).Tag = 0) then
          begin
            newValue := StrToFloat(TEdit(c).Text);
            Break;
          end;
        end;

        GetTank(C_TankIdentifier[tankIndex]).Content := newValue;
      end;
      bbmSetFillRate:
      begin
        for i := 0 to ComponentCount - 1 do
        begin
          c := Components[i];

          if (c is TEdit) and
            (TEdit(c).Parent = TBitBtn(Sender).Parent) and
            (TEdit(c).Tag = 1) then
          begin
            newValue := StrToFloat(TEdit(c).Text);
            Break;
          end;
        end;

        GetTank(C_TankIdentifier[tankIndex]).FillPerSec := newValue;
      end;
      bbmSetTransferRate:
      begin
        for i := 0 to ComponentCount - 1 do
        begin
          c := Components[i];

          if (c is TEdit) and
            (TEdit(c).Parent = TBitBtn(Sender).Parent) and
            (TEdit(c).Tag = 2) then
          begin
            newValue := StrToFloat(TEdit(c).Text);
            Break;
          end;
        end;

        GetTank(C_TankIdentifier[tankIndex]).TransferPerSec := newValue;
      end;
      bbmFillStart:
        GetTank(C_TankIdentifier[tankIndex]).Filling := True;
      bbmFillStop:
        GetTank(C_TankIdentifier[tankIndex]).Filling := False;
      bbmTransferStart:
        GetTank(C_TankIdentifier[tankIndex]).Transferring := True;
      bbmTransferStop:
        GetTank(C_TankIdentifier[tankIndex]).Transferring := False;
    end;
  end;
end;

function TfrmTankSystemPanel.GetTankIndex(aIdentifier: string): Integer;
var
  i : Integer;
begin
  Result := 0;
  for i := 0 to Length(C_TankIdentifier) - 1 do
  begin
    if aIdentifier = C_TankIdentifier[i] then
    begin
      Result := i;
      Break;
    end;
  end;
end;

procedure TfrmTankSystemPanel.ValueSensorChange(Sender: TObject);
var
  tankIndex : Integer;
begin
  tankIndex := GetTankIndex(TGroupBox(TBitBtn(Sender).Parent).Caption);

  with ERSystem.ERManager.EngineRoom.getFuelOilSystem do
  begin
    case TComboBox(Sender).ItemIndex of
      0: GetTank(C_TankIdentifier[tankIndex]).ValueSensor := Random(21);
      1: GetTank(C_TankIdentifier[tankIndex]).ValueSensor := 21;
      2: GetTank(C_TankIdentifier[tankIndex]).ValueSensor := -1;
    end;
  end;
end;

end.
