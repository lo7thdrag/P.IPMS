unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,

  uListener, uFreezeFrom, uDataType;

//const
//  LAMP_COUNT = 15;    //total Lamp

type
  TMainForm = class(TForm)
    procedure FormCreate(Sender: TObject);

  private
    FListener : TListeners;

    procedure MCRMachineLeftSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Integer);overload;
    procedure MCRMachineLeftSystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Boolean);overload;

  public
    FAlarmIndicator : array[0..15] of Boolean;
    FTelegrapIndicator : array [1..11] of Boolean;
    FTempTelegrap : array [1..11] of Boolean;
    iterasi : array [1..11] of Integer;
    isI : array [1..11] of Boolean;
    FPsPump1 : array[1..3] of Boolean;
    FPsPump2 : array[1..3] of Boolean;
    FPsPump3 : array[1..3] of Boolean;
    FSbPump1 : array[1..3] of Boolean;
    FSbPump2 : array[1..3] of Boolean;
    FSbPump3 : array[1..3] of Boolean;
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses
  uMCRMachineLeftSystem;

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
var
  i : Integer;

begin
  FListener := TListeners.Create;
  with MCRMachineLeftSystem.Listener.Add('MCRMACHINELEFT') as TPropertyEventListener do
  begin
    OnPropertyIntChange := MCRMachineLeftSystemEvent;
    OnPropertyBoolChange := MCRMachineLeftSystemEvent;
  end;

  for I := 0 to 14 do
  begin
    FAlarmIndicator[i] := false;
  end;

  for i := 1 to 11 do
  begin
    FTelegrapIndicator[i] := false;
    FTempTelegrap[i] := false;
    isI[i] := False;
    iterasi[i] := 0;
  end;

  for i := 1 to 3 do
  begin
    FPsPump1[i] := false;
    FPsPump2[i] := false;
    FPsPump3[i] := false;
    FSbPump1[i] := false;
    FSbPump2[i] := false;
    FSbPump3[i] := false;
  end;
end;

procedure TMainForm.MCRMachineLeftSystemEvent(Sender: TObject; PropsID: E_PropsID; Value: Boolean);
begin

end;

procedure TMainForm.MCRMachineLeftSystemEvent(Sender: TObject; PropsID: E_PropsID; Value: Integer);
begin

end;

end.
