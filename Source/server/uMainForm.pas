unit uMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uListener, uDataType, ComCtrls;

type
  TMainForm = class (TForm)
    btnElementTest: TButton;
    btnNetStart: TButton;
    pgcLog: TPageControl;
    tsNetwork: TTabSheet;
    mmoLogger: TMemo;
    tsElements: TTabSheet;
    mmoElementLog: TMemo;
    lblAsSimClient: TLabel;
    procedure btnElementTestClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnNetStartClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure OntNotifyEvent(Sender : TObject;Props_ID:E_PropsID;Value :String);overload;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses
  uElementTesterForm, uControllerSystem, uElementController,
  uElement, uTCPClient;

{$R *.dfm}

procedure TMainForm.btnElementTestClick(Sender: TObject);
begin

  if not Assigned(frmTester) then
    frmTester := TfrmTester.Create(Self);

  frmTester.Show;
end;

procedure TMainForm.btnNetStartClick(Sender: TObject);
begin
  if CtrlSystem.Network.Started then
  begin
    btnNetStart.Caption := 'Network Start';
    CtrlSystem.Network.StopNetwork ;
  end else
  begin
    btnNetStart.Caption := 'Network Stop';
    CtrlSystem.Network.StartNetwork ;
  end ;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
  lCtrl, lElmt : TStrings;
  elmCtrl : TElementController;
  elmt : TElement;
  i,j : Integer;
begin
  with CtrlSystem.Network.Listeners.Add('Logger') as TPropertyEventListener do
  begin
    OnPropertyStringChange := OntNotifyEvent;
    OnPropertyObjectChange := nil;
  end;

  with CtrlSystem.Controller.Listeners.Add('Logger') as TPropertyEventListener do
  begin
    OnPropertyStringChange := OntNotifyEvent;
  end;

  with CtrlSystem.Database.Listeners.Add('Logger') as TPropertyEventListener do
  begin
    OnPropertyStringChange := OntNotifyEvent;
  end;

  { log elements }
  lCtrl := CtrlSystem.Controller.getControllers;
  for I := 0 to lCtrl.Count - 1 do begin
    elmCtrl := CtrlSystem.Controller.getController(lCtrl[i]);

    if Assigned(elmCtrl) then
    begin

      lElmt := elmCtrl.getElements;

      for j := 0 to lElmt.Count - 1 do begin

        elmt := elmCtrl.getElement(lElmt[j]);

        if Assigned(elmt) then
          (elmt.Listeners.Add('Logger') as TPropertyEventListener).
            OnPropertyStringChange := OntNotifyEvent;

      end;
    end;
  end;

end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin

  if Assigned(frmTester) then
    frmTester.Free;
end;

procedure TMainForm.OntNotifyEvent(Sender: TObject; Props_ID: E_PropsID;
  Value: String);
begin
  case Props_ID of

    { just debugging }
    epNetworkDebugInfo        : {mmoLogger.Lines.Add(Value)};
    epControllerDebugInfo     : mmoLogger.Lines.Add(Value);
    epElementDebugInfo        : mmoElementLog.Lines.Add(TElement(Sender).ElementID +
      ' --> ' +  Value);

  end;
end;

end.
