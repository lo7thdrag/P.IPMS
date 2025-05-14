unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,

  uListener, uFreezeFrom, uDataType;

type
  TfrmMainForm = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    FListener : TListeners;

    procedure AuxiliarySystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Integer);overload;
    procedure AuxiliarySystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Boolean);overload;
    procedure AuxiliarySystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Double);overload;

  public
    { Public declarations }
  end;

var
  frmMainForm: TfrmMainForm;

implementation

uses
  uAuxiliarySystem, ufrmBallastnBilgePump, ufrmSWPumpProvRefrig1, ufrmSWCoolingPumpChiller1,
  ufrmFireFightingPump2, ufrmSWPumpProvRefrig2, ufrmSludge ;

{$R *.dfm}

procedure TfrmMainForm.AuxiliarySystemEvent(Sender: TObject; PropsID: E_PropsID; Value: Integer);
begin
//  case PropsID of
//    epPMSGeneratorEngineRun :
//    begin
//
//    end;
//  end;
end;

procedure TfrmMainForm.AuxiliarySystemEvent(Sender: TObject; PropsID: E_PropsID; Value: Boolean);
begin
//  case PropsID of
//    epPMSGeneratorEngineRun :
//    begin
//
//    end;
//  end;
end;

procedure TfrmMainForm.AuxiliarySystemEvent(Sender: TObject; PropsID: E_PropsID; Value: Double);
begin
//  case PropsID of
//    epPMSGeneratorEngineRun :
//    begin
//
//    end;
//  end;
end;

procedure TfrmMainForm.FormCreate(Sender: TObject);
begin
  FListener := TListeners.Create;
  with AuxiliarySystem.Listener.Add('AUXILIARY') as TPropertyEventListener do
  begin
    OnPropertyIntChange := AuxiliarySystemEvent;
    OnPropertyBoolChange := AuxiliarySystemEvent;
    OnPropertyDblChange := AuxiliarySystemEvent;
  end;
end;

procedure TfrmMainForm.FormDestroy(Sender: TObject);
begin
  FListener.Free;
end;

procedure TfrmMainForm.FormShow(Sender: TObject);
begin
  if AuxiliarySystem.IdConsole = 'AUXILIARY 1' then
  begin
    if not Assigned(frmBallastnBilgePump) then
      frmBallastnBilgePump := TfrmBallastnBilgePump.Create(Self);

    if not Assigned(frmFireFightingPump2) then
      frmFireFightingPump2 := TfrmFireFightingPump2.Create(Self);

    frmBallastnBilgePump.Show;
    frmFireFightingPump2.Show;
  end
  else
  if AuxiliarySystem.IdConsole = 'AUXILIARY 2' then
  begin
    if not Assigned(frmSWPumpProvRefrig1) then
      frmSWPumpProvRefrig1 := TfrmSWPumpProvRefrig1.Create(Self);

    if not Assigned(frmSWPumpProvRefrig2) then
      frmSWPumpProvRefrig2 := TfrmSWPumpProvRefrig2.Create(Self);

    frmSWPumpProvRefrig1.Show;
    frmSWPumpProvRefrig2.Show;
  end
  else
  if AuxiliarySystem.IdConsole = 'AUXILIARY 3' then
  begin
    if not Assigned(frmSWCoolingPumpChiller1) then
      frmSWCoolingPumpChiller1 := TfrmSWCoolingPumpChiller1.Create(Self);

    if not Assigned(frmSludge) then
      frmSludge := TfrmSludge.Create(Self);

    frmSWCoolingPumpChiller1.Show;
    frmSludge.Show;

  end;
end;

end.
