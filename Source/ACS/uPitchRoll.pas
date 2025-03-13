unit uPitchRoll;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, VrLights, Menus, VrControls, VrMatrixLabel;

type
  TfrmPitchRoll = class(TForm)
    PanelTop: TPanel;
    PanelSounder: TPanel;
    Panel3: TPanel;
    roll: TVrMatrixLabel;
    lblDepthKoma: TVrMatrixLabel;
    VrMatrixLabel1: TVrMatrixLabel;
    PanelSpeedLog: TPanel;
    Panel1: TPanel;
    lblSpeedLog: TVrMatrixLabel;
    SpeedWT: TVrMatrixLabel;
    PopupMenu1: TPopupMenu;
    Close1: TMenuItem;
    Timer1: TTimer;
    panahKiri: TVrMatrixLabel;
    panahKanan: TVrMatrixLabel;
    pnlButton: TPanel;
    VrLights1: TVrLights;
    lblDepth: TVrMatrixLabel;
    VrLights2: TVrLights;
    Shape1: TShape;
    Shape2: TShape;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPitchRoll: TfrmPitchRoll;

implementation

{$R *.dfm}

end.
