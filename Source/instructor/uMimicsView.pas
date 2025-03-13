unit uMimicsView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TfrmMimicsView = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetFormLayout;
  end;

var
  frmMimicsView: TfrmMimicsView;

implementation

uses uMimicPanel;

{$R *.dfm}

{ TfrmMimicsView }

  procedure TfrmMimicsView.FormCreate(Sender: TObject);
begin
  frmMimicPanel := TfrmMimicPanel.Create(self);
  frmMimicPanel.Parent := frmMimicsView;
  frmMimicPanel.Align := alClient;
  frmMimicPanel.BorderStyle := bsNone;
  frmMimicPanel.Show;

  // aplicable to app events
  Tag := 290;
end;

procedure TfrmMimicsView.SetFormLayout;
var
  i : integer;
begin
   { Set frmMimicsView }
   DefaultMonitor := dmDesktop;
   if Screen.MonitorCount > 1 then
     i := 1
   else
     i := 0;

   Height := Screen.Monitors[i].Height;
   Top    := Screen.Monitors[i].Top;
   Left   := Screen.Monitors[i].Left;
   width  := Screen.Monitors[i].Width;

   Show;
end;

end.
