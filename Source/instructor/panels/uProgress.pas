unit uProgress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls;

type
  TfrmProgress = class(TForm)
    pbProgress: TProgressBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure OnProgressStep(aStep : Integer);
  end;

var
  frmProgress: TfrmProgress;

implementation

{$R *.dfm}

{ TfrmProgress }

procedure TfrmProgress.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmProgress := nil;
end;

procedure TfrmProgress.OnProgressStep(aStep: Integer);
begin
  pbProgress.Position := aStep;
  Application.ProcessMessages;
end;

end.
