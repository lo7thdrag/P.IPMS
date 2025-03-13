unit ufrmCPPHydraulicPump;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uListener, uDataType;

type
  TfrmCPPHydraulicPump = class(TForm)
    grpPS_CPP1: TGroupBox;
    rbPS_Standby1: TRadioButton;
    rbPS_Stop1: TRadioButton;
    rbPS_Start1: TRadioButton;
    grpPS_CPP2: TGroupBox;
    rbPS_Standby2: TRadioButton;
    rbPS_Stop2: TRadioButton;
    rbPS_Start2: TRadioButton;
    grpPS_CPP3: TGroupBox;
    rbPS_Auto3: TRadioButton;
    rbPS_Stop3: TRadioButton;
    rbPS_Start3: TRadioButton;
    grpPS: TGroupBox;
    lblPS_Standby1: TLabel;
    lblPS_Stop1: TLabel;
    lblPS_Start1: TLabel;
    lblPS_Standby2: TLabel;
    lblPS_Stop2: TLabel;
    lblPS_Start2: TLabel;
    lblPS_Auto3: TLabel;
    lblPS_Stop3: TLabel;
    lblPS_Start3: TLabel;
    grpSB: TGroupBox;
    grpSB_CPP1: TGroupBox;
    lblSB_Standby1: TLabel;
    lblSB_Stop1: TLabel;
    lblSB_Start1: TLabel;
    rbSB_Standby1: TRadioButton;
    rbSB_Stop1: TRadioButton;
    rbSB_Start1: TRadioButton;
    grpSB_CPP2: TGroupBox;
    lblSB_Standby2: TLabel;
    lblSB_Stop2: TLabel;
    lblSB_Start2: TLabel;
    rbSB_Standby2: TRadioButton;
    rbSB_Stop2: TRadioButton;
    rbSB_Start2: TRadioButton;
    grpSB_CPP3: TGroupBox;
    lblSB_Auto3: TLabel;
    lblSB_Stop3: TLabel;
    lblSB_Start3: TLabel;
    rbSB_Auto3: TRadioButton;
    rbSB_Stop3: TRadioButton;
    rbSB_Start3: TRadioButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FListener : TListeners;
    procedure PCSSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Boolean);overload;
  public
    { Public declarations }
    property Listener : TListeners read FListener;
  end;

var
  frmCPPHydraulicPump: TfrmCPPHydraulicPump;

implementation

uses uPCSSystem;

{$R *.dfm}

procedure TfrmCPPHydraulicPump.FormCreate(Sender: TObject);
begin
  FListener := TListeners.Create;
  with PCSSystem.Listener.Add('PUMP') as TPropertyEventListener do begin
    OnPropertyBoolChange := PCSSystemEvent;
  end;
end;

procedure TfrmCPPHydraulicPump.PCSSystemEvent(Sender: TObject; PropsID: E_PropsID;
  Value: Boolean);
begin
  case PropsID of
    epPCSCPPPumpStart1: ;
    epPCSCPPPumpStart2: ;
    epPCSCPPPumpStart3: ;
    epPCSCPPPumpStandby1: ;
    epPCSCPPPumpStandby2: ;
  end;
end;

end.
