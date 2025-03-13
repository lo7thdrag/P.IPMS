unit uBallastSystemPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uDataType, Buttons;

type
  TfrmBallastSystemPanel = class(TForm)
    grpTanks1: TGroupBox;
    lblCapacity: TLabel;
    btnStart: TBitBtn;
    btnStop: TBitBtn;
    btnReset: TBitBtn;
    edtCapacityT1: TEdit;
    btnSet: TBitBtn;
    grpTank2: TGroupBox;
    lblCapacity2: TLabel;
    btnStart2: TBitBtn;
    btnStop2: TBitBtn;
    btnReset2: TBitBtn;
    edtCapacity2: TEdit;
    btnSet2: TBitBtn;
    grpTank3: TGroupBox;
    lblCapacity3: TLabel;
    btnStar3: TBitBtn;
    btnStop3: TBitBtn;
    btnReset3: TBitBtn;
    edtCapacity3: TEdit;
    btnSet3: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnTank1Click(Sender: TObject);
    procedure btnTank2Click(Sender: TObject);
    procedure btnTank3Click(Sender: TObject);
  private
    { Private declarations }
    procedure EnginePropertyDblChange(Sender : TObject; PropsID : E_PropsID;Value : Double);overload;
  public
    { Public declarations }
  end;

var
  frmBallastSystemPanel: TfrmBallastSystemPanel;

implementation

uses
  uERSystem, uTank;

{$R *.dfm}

{ TForm5 }

procedure TfrmBallastSystemPanel.btnTank1Click(Sender: TObject);
var
  Value : integer;
begin
  with ERSystem.ERManager.EngineRoom.getBallastSystem do
    case TComponent(Sender).Tag of
      1 : Tank(C_WB_TK_PS).Filling := True;
      2 : Tank(C_WB_TK_PS).Filling := False;
//      3 : Tank(C_WB_TK_PS).SetCurrentVolume(0);
      4 :
        begin
          TryStrToInt(edtCapacityT1.Text,Value);
//          Tank(C_WB_TK_PS).SetCurrentVolume(Value);
        end;
    end;
end;

procedure TfrmBallastSystemPanel.btnTank2Click(Sender: TObject);
var
  Value : integer;
begin
  with ERSystem.ERManager.EngineRoom.getBallastSystem do
    case TComponent(Sender).Tag of
      1 : Tank(C_WB_TK_SB).Filling := True;
      2 : Tank(C_WB_TK_SB).Filling := False;
//      3 : Tank(C_WB_TK_SB).SetCurrentVolume(0);
      4 :
        begin
          TryStrToInt(edtCapacity2.Text,Value);
//          Tank(C_WB_TK_SB).SetCurrentVolume(Value);
        end;
    end;
end;

procedure TfrmBallastSystemPanel.btnTank3Click(Sender: TObject);
var
  Value : integer;
begin
  with ERSystem.ERManager.EngineRoom.getBallastSystem do
    case TComponent(Sender).Tag of
      1 : Tank(C_WB_TK_FWD).Filling := True;
      2 : Tank(C_WB_TK_FWD).Filling := False;
//      3 : Tank(C_WB_TK_FWD).SetCurrentVolume(0);
      4 :
        begin
          TryStrToInt(edtCapacity3.Text,Value);
//          Tank(C_WB_TK_FWD).SetCurrentVolume(Value);
        end;
    end;
end;

procedure TfrmBallastSystemPanel.FormCreate(Sender: TObject);
begin
  with ERSystem.ERManager.EngineRoom.getBallastSystem do begin
    addEntityListener('ControlPanel',EnginePropertyDblChange);
  end;
end;

procedure TfrmBallastSystemPanel.EnginePropertyDblChange(Sender: TObject; PropsID: E_PropsID;
  Value: Double);
begin
  case PropsID of
    epERTankCapacity:
    begin
//      if Sender is TTank then
//      begin
//        if TTank(Sender).Identifier = C_WB_TK_PS then
//          lblCapacity.Caption := FormatFloat('0.00',Value) + ' of ' +
//                FormatFloat('0.00',TTank(Sender).Volume) + ' m3'
//        else
//        if TTank(Sender).Identifier = C_WB_TK_SB then
//          lblCapacity2.Caption := FormatFloat('0.00',Value) + ' of ' +
//                FormatFloat('0.00',TTank(Sender).Volume) + ' m3'
//        else
//        if TTank(Sender).Identifier = C_WB_TK_FWD then
//          lblCapacity3.Caption := FormatFloat('0.00',Value) + ' of ' +
//                FormatFloat('0.00',TTank(Sender).Volume) + ' m3';
//      end;

    end;
  end;
end;

end.
