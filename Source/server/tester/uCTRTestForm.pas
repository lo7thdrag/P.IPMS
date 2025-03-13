unit uCTRTestForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uElementTestForm, uDataType;

type
  TfrmCTRTest = class(TfrmElementTest)
    grpInput: TGroupBox;
    cbbStateNoFault: TComboBox;
    cbbStateNoRFU: TComboBox;
    cbbStateTransition: TComboBox;
    cbbProcesStatus: TComboBox;
    cbbCommandHMI: TComboBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    grpOutput: TGroupBox;
    lbl6: TLabel;
    edtStateElement: TEdit;
    grpParameter: TGroupBox;
    lbl7: TLabel;
    edtTCtrl: TEdit;
    procedure cbbStateNoFaultSelect(Sender: TObject);
    procedure cbbStateNoRFUSelect(Sender: TObject);
    procedure cbbStateTransitionSelect(Sender: TObject);
    procedure cbbProcesStatusSelect(Sender: TObject);
    procedure cbbCommandHMISelect(Sender: TObject);
    procedure edtTCtrlKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  protected
    procedure ApplyElement;override;
    procedure ElementPropertyChange(Sender : TObject;PropsID : E_PropsID;Value : Byte);overload;override;
  public
    { Public declarations }
  end;

var
  frmCTRTest: TfrmCTRTest;

implementation

uses uCTR, uListener, uFunction;

{$R *.dfm}

procedure TfrmCTRTest.ApplyElement;
begin
  inherited;
  if FElement is TCTRElement then
  begin
    with TCTRElement(FElement) do
    begin

      case StateNoFault of
        snfNotFault : cbbStateNoFault.ItemIndex := 0;
        snfFault : cbbStateNoFault.ItemIndex := 1;
      end;

      case StateNoRFU of
        snrRFU: cbbStateNoRFU.ItemIndex := 0;
        snrNotRFU: cbbStateNoRFU.ItemIndex := 1;
      end;

      case StateTransition of
        stInTransition: cbbStateTransition.ItemIndex := 0;
        stNotInTransition: cbbStateTransition.ItemIndex := 1;
      end;

      case ProcesStatus of
        spsNormal : cbbProcesStatus.ItemIndex := 0;
        spsActive : cbbProcesStatus.ItemIndex := 1;
      end;

      case CommandHMI of
        sacActivated: cbbCommandHMI.ItemIndex := 0;
        sacNotActivated: cbbCommandHMI.ItemIndex := 1;
      end;

      edtStateElement.Text := ElementStateToStr(StateElement);
      edtTCtrl.Text := FloatToStr(Parameters.GetParameter(epTCTRL).ParamDoubleValue);
    end;
  end;

end;

procedure TfrmCTRTest.cbbCommandHMISelect(Sender: TObject);
begin
  inherited;
  if cbbCommandHMI.Text = 'Activated' then
    TCTRElement(FElement).CommandHMI := sacActivated
  else if cbbCommandHMI.Text = 'Not activated' then
    TCTRElement(FElement).CommandHMI := sacNotActivated;
end;

procedure TfrmCTRTest.cbbProcesStatusSelect(Sender: TObject);
begin
  inherited;
  if cbbProcesStatus.Text = 'Normal' then
    TCTRElement(FElement).ProcesStatus := spsNormal
  else if cbbProcesStatus.Text = 'Active' then
    TCTRElement(FElement).ProcesStatus := spsActive;
end;

procedure TfrmCTRTest.cbbStateNoFaultSelect(Sender: TObject);
begin
  inherited;
  if cbbStateNoFault.Text = 'Not fault' then
    TCTRElement(FElement).StateNoFault := snfNotFault
  else if cbbStateNoFault.Text = 'Fault' then
    TCTRElement(FElement).StateNoFault := snfFault;
end;

procedure TfrmCTRTest.cbbStateNoRFUSelect(Sender: TObject);
begin
  inherited;
  if cbbStateNoRFU.Text = 'RFU' then
    TCTRElement(FElement).StateNoRFU := snrRFU
  else if cbbStateNoRFU.Text = 'Not RFU' then
    TCTRElement(FElement).StateNoRFU := snrNotRFU;
end;

procedure TfrmCTRTest.cbbStateTransitionSelect(Sender: TObject);
begin
  inherited;
  if cbbStateTransition.Text = 'In transition' then
    TCTRElement(FElement).StateTransition := stInTransition
  else if cbbStateTransition.Text = 'Not in transition' then
    TCTRElement(FElement).StateTransition := stNotInTransition;
end;

procedure TfrmCTRTest.edtTCtrlKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

  if not (key in['0'..'9', #8, #13, #46]) then
    key := #0;

  if key = #13 then
    TCTRElement(FElement).Parameters.GetParameter(epTCTRL).ParamDoubleValue := strtoint(edtTCtrl.Text);
end;

procedure TfrmCTRTest.ElementPropertyChange(Sender: TObject; PropsID: E_PropsID;
  Value: Byte);
begin
  inherited;

  case PropsID of
    epElementStateChange    : edtStateElement.Text := ElementStateToStr(E_StateElement(Value));
    epStateNoFaultChange : cbbStateNoFault.ItemIndex := value;
    epStateNoRFUChange : cbbStateNoRFU.ItemIndex := value;
    epStateTransitionChange : cbbStateTransition.ItemIndex := value;
    epProcesStatusChange : cbbProcesStatus.ItemIndex := value;
    epCommandHMIChange : cbbCommandHMI.ItemIndex := value;

  end;
end;

end.
