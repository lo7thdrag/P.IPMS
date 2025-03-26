unit uElementTesterForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, uElementTestForm, uElement, uDatabase,
  uDBSupportClasses, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TfrmTester = class(TForm)
    Panel3: TPanel;
    Image1: TImage;
    pnlHeader: TPanel;
    pnlElementTesterBackground: TPanel;
    pgcElement: TPageControl;
    tsElement: TTabSheet;
    grpElementInput: TGroupBox;
    lblController: TLabel;
    cbbController: TComboBox;
    lblElement: TLabel;
    cbbElement: TComboBox;
    mmoFollower: TMemo;
    btnEnableElment: TButton;
    btnDisableElement: TButton;
    grpInfo: TGroupBox;
    lblName: TLabel;
    lblElementType: TLabel;
    lblSysDec: TLabel;
    lblAlarmGroup: TLabel;
    lblMimicID: TLabel;
    Label1: TLabel;
    edtElementName: TEdit;
    edtElementType: TEdit;
    edtSysDesc: TEdit;
    edtAlarmGroup: TEdit;
    edtMimicID: TEdit;
    btnGoto: TButton;
    btnFollwer: TButton;
    procedure FormCreate(Sender: TObject);
    procedure cbbControllerSelect(Sender: TObject);
    procedure cbbElementSelect(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFollwerClick(Sender: TObject);
    procedure btnGotoClick(Sender: TObject);
    procedure btnEnableElmentClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    FTestForm : TfrmElementTest;
    FOnGotoElement: TGetStrProc;
    procedure ShowTestForm(Element : TElement);
    procedure SetOnGotoElement(const Value: TGetStrProc);
  public
    { Public declarations }
    property OnGotoElement : TGetStrProc read FOnGotoElement write SetOnGotoElement;
  end;

var
  frmTester: TfrmTester;

implementation

uses uControllerSystem, uElementController,
  uFunction, uAAETestForm, uDataType, uCBATestForm, uCBETestForm, uCTRTestForm,
  uDAETestForm, uMCDTestForm, uMCETestForm, uMCSTestForm, uRHEtestForm,
  uSAETestForm, uSEETestForm, uSPETestForm, uSS1TestForm, uSS2TestForm,
  uSSETestForm, uSSLTestForm, uSWBTestForm, uSWETestForm, uSWNTestForm,
  uVCETestForm, uVCHTestform, uVCPTestForm,
  uSWE;

{$R *.dfm}

procedure TfrmTester.btnOKClick(Sender: TObject);
var
  aElement : TElement;
begin
  aElement := CtrlSystem.Controller.getController(cbbController.Text).getElement(cbbElement.Text);

  aElement.AlarmElementStateCalc;
end;

procedure TfrmTester.btnEnableElmentClick(Sender: TObject);
var
  Controller : TElementController;
  Element : TElement;
  l,e : TStrings;
  i,j : integer;
begin
    l := CtrlSystem.Controller.getControllers;

    Screen.Cursor := crHourGlass;


    for i := 0 to l.Count - 1 do
    begin
      Controller := CtrlSystem.Controller.getController(l[i]);
      e := Controller.getElements;

      for j := 0 to e.Count - 1 do
      begin
        Element := Controller.getElement(e[j]);

        if TComponent(Sender).Tag = 1 then
          Element.StateElementDisabled := sdEnabled
        else
          Element.StateElementDisabled := sdDisabled;

        //Application.ProcessMessages;
        Sleep(10);
      end;

      e.Free;
    end;
    Screen.Cursor := crDefault;

    l.Free;
end;

procedure TfrmTester.btnFollwerClick(Sender: TObject);
var
  elmnt : TElement;
  i : integer;
begin
  if cbbElement.Text = '' then Exit;

  elmnt := CtrlSystem.Controller.getElement(cbbElement.Text);
  if Assigned(elmnt) then
  begin
    for i := 0 to elmnt.Listeners.Count - 1 do
    begin
      mmoFollower.Lines.Add(elmnt.Listeners.Get(i).ListenerID);
    end;

  end;

end;

procedure TfrmTester.btnGotoClick(Sender: TObject);
begin
  if Assigned(FOnGotoElement) then
    FOnGotoElement(cbbElement.Text);
end;

procedure TfrmTester.cbbControllerSelect(Sender: TObject);
var
  Controller : TElementController;
  l : TStrings;
begin

  if cbbController.Text <> '' then begin

    Controller := CtrlSystem.Controller.getController(cbbController.Text);
    l := Controller.getElements;

    cbbElement.Items.Clear;
    cbbElement.Items.AddStrings(l);
    if cbbElement.Items.Count > 0 then begin
      cbbElement.ItemIndex := 0;
      cbbElementSelect(cbbElement);
    end;

    l.Free;

  end;

end;

procedure TfrmTester.cbbElementSelect(Sender: TObject);
var
  Element : TElement;
begin

  edtElementName.Text := '';
  edtElementType.Text := '';
  edtSysDesc.Text := '';
  edtAlarmGroup.Text := '';

  Element := nil;

  if cbbElement.Text <> '' then begin

    Element := CtrlSystem.Controller.getController(cbbController.Text).getElement(cbbElement.Text);

    edtElementName.Text := Element.ElementName;
    edtElementType.Text := ElementTypeAbbreviate(Element.ElementType);
    edtSysDesc.Text := Element.SystemDesc;
    edtAlarmGroup.Text := Element.AlarmGroupDesc;
    edtMimicID.Text := IntToStr(Element.ElementMimic);

  end;

  ShowTestForm(Element);
end;

procedure TfrmTester.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(FTestForm) then
    FreeAndNil(FTestForm);

  Action := caFree;
  frmTester := nil;
end;

procedure TfrmTester.FormCreate(Sender: TObject);
var
  l : TStrings;
begin

  l := CtrlSystem.Controller.getControllers;

  cbbController.Items.AddStrings(l);
  if cbbController.Items.Count > 0 then
  begin
    cbbController.ItemIndex := 0;
    cbbControllerSelect(cbbController);
  end;

  l.Free;

end;

procedure TfrmTester.SetOnGotoElement(const Value: TGetStrProc);
begin
  FOnGotoElement := Value;
end;

procedure TfrmTester.ShowTestForm;
var
  i : integer;
begin
  if Assigned(FTestForm) then
    FreeAndNil(FTestForm);

  pgcElement.ActivePage := tsElement;

  if Assigned(Element) then
  begin

    case Element.ElementType of
      eltAAE: FTestForm := TfrmAAETest.Create(Self);
      eltCBA: FTestForm := TfrmCBATest.Create(Self);
      eltCBE: FTestForm := TfrmCBETest.Create(Self);
      eltCTR: FTestForm := TfrmCTRTest.Create(Self);
      eltDAE: FTestForm := TfrmDAETest.Create(Self);
      eltMCD: FTestForm := TfrmMCDTest.Create(Self);
      eltMCE: FTestForm := TfrmMCETest.Create(Self);
      eltMCS: FTestForm := TfrmMCSTest.Create(Self);
      eltRHE: FTestForm := TfrmRHETest.Create(Self);
      eltSAE: FTestForm := TfrmSAETest.Create(Self);
      eltSEE: FTestForm := TfrmSEETest.Create(Self);
      eltSPE: FTestForm := TfrmSPETest.Create(Self);
      eltSSE: FTestForm := TfrmSSETest.Create(Self);
      eltSS1: FTestForm := TfrmSS1Test.Create(Self);
      eltSS2: FTestForm := TfrmSS2Test.Create(Self);
      eltSSL: FTestForm := TfrmSSLTest.Create(Self);
      eltSWB: FTestForm := TfrmSWBTest.Create(Self);
      eltSWE: FTestForm := TfrmSWETest.Create(Self);
      eltSWN: FTestForm := TfrmSWNTest.Create(Self);
      eltVCE: FTestForm := TfrmVCETest.Create(Self);
      eltVCH: FTestForm := TfrmVCHTest.Create(Self);
      eltVCP: FTestForm := TfrmVCPTest.Create(Self);
      eltUNDEF: ;
    end;

    if Assigned(FTestForm) then
    begin
      { -- move to create element }

      FTestForm.SetElement(Element);

      FTestForm.BorderStyle := bsNone;
      FTestForm.Parent := grpElementInput;
      FTestForm.Align := alClient;
      FTestForm.Color := clBtnFace;

      for I := 0 to FTestForm.ComponentCount - 1 do
      begin

        if FTestForm.Components[i].ClassType = TEdit then
//          TEdit(FTestForm.Components[i]).ReadOnly := True
        else
        if FTestForm.Components[i].ClassType = TComboBox then
        begin
          TComboBox(FTestForm.Components[i]).Style := csDropDownList;
        end;

      end;

      FTestForm.Show;
    end;

  end;

end;

end.
