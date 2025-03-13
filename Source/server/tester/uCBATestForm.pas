unit uCBATestForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,uElementTestForm, StdCtrls, uDataType;

type
  TfrmCBATest = class(TfrmElementTest)
    grpExtInterface: TGroupBox;
    cbbInputStatus: TComboBox;
    lblInputStatus: TLabel;
    grpIPMSInterface: TGroupBox;
    grpInput: TGroupBox;
    grpOutput: TGroupBox;
    lblCommandOpen: TLabel;
    lblCommandClose: TLabel;
    lblManualAuto: TLabel;
    lblDisableElement: TLabel;
    cbbCommandOpen: TComboBox;
    cbbCommandClose: TComboBox;
    cbbManualAuto: TComboBox;
    cbbDisableElement: TComboBox;
    lblStateAlarm: TLabel;
    lblStateElement: TLabel;
    edtStateAlarm: TEdit;
    edtStateElement: TEdit;
    procedure cbbInputStatusSelect(Sender: TObject);
    procedure cbbCommandOpenSelect(Sender: TObject);
    procedure cbbCommandCloseSelect(Sender: TObject);
    procedure cbbManualAutoSelect(Sender: TObject);
    procedure cbbDisableElementSelect(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure ApplyElement;override;
    procedure ElementPropertyChange(Sender : TObject;PropsID : E_PropsID;Value : Byte);overload;override;
  public
    { Public declarations }
  end;

var
  frmCBATest: TfrmCBATest;

implementation

uses uCBA, uListener, uFunction;
{$R *.dfm}

procedure TfrmCBATest.ApplyElement;
begin
  inherited;
  if FElement is TCBAElement then
  begin
    with TCBAElement(FElement) do begin

      case StateStatus of
        esElementDisabled   : cbbInputStatus.ItemIndex := 0;
        esClosed            : cbbInputStatus.ItemIndex := 1;
        esOpen              : cbbInputStatus.ItemIndex := 2;
        esTransition        : cbbInputStatus.ItemIndex := 3;
        esNotRFO            : cbbInputStatus.ItemIndex := 4;
        esNotRFC            : cbbInputStatus.ItemIndex := 5;
        esFailure           : cbbInputStatus.ItemIndex := 6;
        esLocal             : cbbInputStatus.ItemIndex := 7;
        esRemote            : cbbInputStatus.ItemIndex := 8;
        esManual            : cbbInputStatus.ItemIndex := 9;
        esAuto              : cbbInputStatus.ItemIndex := 10;
        esUnknown           : cbbInputStatus.ItemIndex := 11;
        esFault             : cbbInputStatus.ItemIndex := 12;
        esTripped           : cbbInputStatus.ItemIndex := 13;
        esFailedToOpen      : cbbInputStatus.ItemIndex := 14;
        esFailedToClose     : cbbInputStatus.ItemIndex := 15;
      end;

      case StateCommandClose of
        sacNotActivated     : cbbCommandClose.ItemIndex := 0;
        sacActivated        : cbbCommandClose.ItemIndex := 1;
      end;

      case StateCommandOpen of
        sacNotActivated    : cbbCommandOpen.ItemIndex := 0;
        sacActivated       : cbbCommandOpen.ItemIndex := 1;
      end;

      case StateManualAuto of
        smaManual         : cbbManualAuto.ItemIndex := 0;
        smaAuto           : cbbManualAuto.ItemIndex := 1;
      end;

      case StateElementDisabled of
        sdDisabled        : cbbDisableElement.ItemIndex := 0;
        sdEnabled         : cbbDisableElement.ItemIndex := 1;
      end;

      edtStateAlarm.Text := ElementAlarmStateToStr(StateAlarm);
      edtStateElement.Text := ElementStateToStr(StateElement);
    end;

  end;
end;

procedure TfrmCBATest.cbbCommandCloseSelect(Sender: TObject);
begin
  if cbbCommandClose.Text = 'Not Activated' then
    TCBAElement(FElement).StateCommandClose := sacNotActivated
  else if cbbCommandClose.Text = 'Activated' then
    TCBAElement(FElement).StateCommandClose := sacActivated;

end;

procedure TfrmCBATest.cbbCommandOpenSelect(Sender: TObject);
begin
  if cbbCommandOpen.Text = 'Not Activated' then
    TCBAElement(FElement).StateCommandOpen := sacNotActivated
  else if cbbCommandOpen.Text = 'Activated' then
    TCBAElement(FElement).StateCommandOpen := sacActivated;

end;

procedure TfrmCBATest.cbbDisableElementSelect(Sender: TObject);
begin
  if cbbDisableElement.Text = 'Disabled' then
    TCBAElement(FElement).StateElementDisabled := sdDisabled
  else if cbbDisableElement.Text = 'Enabled' then
    TCBAElement(FElement).StateElementDisabled := sdEnabled;
end;

procedure TfrmCBATest.cbbInputStatusSelect(Sender: TObject);
begin
  if cbbInputStatus.Text = 'Element disable' then
    TCBAElement(FElement).StateStatus := esElementDisabled
  else if cbbInputStatus.Text = 'Closed' then
    TCBAElement(FElement).StateStatus := esClosed
  else if cbbInputStatus.Text = 'Open' then
    TCBAElement(FElement).StateStatus := esOpen
  else if cbbInputStatus.Text = 'Transition' then
    TCBAElement(FElement).StateStatus := esTransition
  else if cbbInputStatus.Text = 'Not RFO' then
    TCBAElement(FElement).StateStatus := esNotRFO
  else if cbbInputStatus.Text = 'Not RFC' then
    TCBAElement(FElement).StateStatus := esNotRFC
  else if cbbInputStatus.Text = 'Failure' then
    TCBAElement(FElement).StateStatus := esFailure
  else if cbbInputStatus.Text = 'Local' then
    TCBAElement(FElement).StateStatus := esLocal
  else if cbbInputStatus.Text = 'Remote' then
    TCBAElement(FElement).StateStatus := esRemote
  else if cbbInputStatus.Text = 'Manual' then
    TCBAElement(FElement).StateStatus := esManual
  else if cbbInputStatus.Text = 'Auto' then
    TCBAElement(FElement).StateStatus := esAuto
  else if cbbInputStatus.Text = 'Unknown' then
    TCBAElement(FElement).StateStatus := esUnknown
  else if cbbInputStatus.Text = 'Fault' then
    TCBAElement(FElement).StateStatus := esFault
  else if cbbInputStatus.Text = 'Tripped' then
    TCBAElement(FElement).StateStatus := esTripped
  else if cbbInputStatus.Text = 'Failed to open' then
    TCBAElement(FElement).StateStatus := esFailedToOpen
  else if cbbInputStatus.Text = 'Failed to close' then
    TCBAElement(FElement).StateStatus := esFailedToClose;

end;

procedure TfrmCBATest.cbbManualAutoSelect(Sender: TObject);
begin
  if cbbManualAuto.Text = 'Manual' then
    TCBAElement(FElement).StateManualAuto := smaManual
  else if cbbManualAuto.Text = 'Auto' then
    TCBAElement(FElement).StateManualAuto := smaAuto;
end;

procedure TfrmCBATest.ElementPropertyChange(Sender: TObject; PropsID: E_PropsID;
  Value: Byte);
begin
  inherited;

  case PropsID of
    epElementAlarmChange          : edtStateAlarm.Text := ElementAlarmStateToStr(E_StateAlarm(Value));
    epElementStateChange          : edtStateElement.Text := ElementStateToStr(E_StateElement(Value));
    epElementCommandOpenChange    : cbbCommandOpen.ItemIndex := Value;
    epElementCommandCloseChange   : cbbCommandClose.ItemIndex := Value;
    epElementManualAutoChange     : cbbManualAuto.ItemIndex := value;
    epElementDisabledChange       : cbbDisableElement.ItemIndex := Value;
  end;

end;


end.
