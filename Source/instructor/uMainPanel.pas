unit uMainPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Buttons, ExtCtrls, ComCtrls, Mask, uDatabase, uDataType;

type
  TfrmMainPanel = class(TForm)
    StatusBar1: TStatusBar;
    mmMain: TMainMenu;
    Window1: TMenuItem;
    ControlPanel1: TMenuItem;
    N1: TMenuItem;
    Close1: TMenuItem;
    About1: TMenuItem;
    pgcPanel: TPageControl;
    tsScenarioLoader: TTabSheet;
    tsScenarioBuilder: TTabSheet;
    tsRunEvent: TTabSheet;
    tsSystemState: TTabSheet;
    grpNetwork: TGroupBox;
    lblControllerState: TLabel;
    lblMimicState: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lblPCSSystem: TLabel;
    lbl4: TLabel;
    lblERSystem: TLabel;
    btnNetwork: TButton;
    mmo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure ControlPanel1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnNetworkClick(Sender: TObject);
  private
    { Private declarations }
    NetworkStarted : Boolean;
    FDatabase : TIPMSDatabase;

    procedure EventLoggerStr(Sender : Tobject; Props_ID :E_PropsID;Value : String);
  public
    { Public declarations }
  end;

var
  frmMainPanel: TfrmMainPanel;

implementation

uses uScenLoader,uScenBuilder, uControlPanel,
  uStarter, uERSystem, uMimicsSystem, uPCSSystem,uControllerSystem,
  uListener, uLogLoader, uScenario;

{$R *.dfm}

procedure TfrmMainPanel.btnNetworkClick(Sender: TObject);
begin
  if NetworkStarted then begin
    StopNetwork;
    btnNetwork.Caption := 'Start Network'
  end
  else begin
    StartNetwork;
    btnNetwork.Caption := 'Stop Network'
  end;

  NetworkStarted := not NetworkStarted;
end;

procedure TfrmMainPanel.ControlPanel1Click(Sender: TObject);
begin
  if not Assigned(frmControlPanel) then
    frmControlPanel := TfrmControlPanel.Create(Self);

//  if Screen.MonitorCount > 1 then
//  begin
    frmControlPanel.Left := Screen.Monitors[0].Left;
    frmControlPanel.Top  := Screen.Monitors[0].Top;
    frmControlPanel.Width := Screen.Monitors[0].Width;
    frmControlPanel.Height:= Screen.Monitors[0].Height;

//  end else
    frmControlPanel.WindowState := wsMaximized;

  frmControlPanel.Show;

end;

procedure TfrmMainPanel.EventLoggerStr(Sender: Tobject; Props_ID: E_PropsID;
  Value: String);
begin
  case Props_ID of
    epNetworkDebugInfo : mmo1.Lines.Add(Value);
  end;
end;

procedure TfrmMainPanel.FormCreate(Sender: TObject);
begin
  FDatabase := TIPMSDatabase.Create;
  FDatabase.ConnectDB;

  Scenario := TScenario.Create(FDatabase);

  frmScenBuilder := TfrmScenBuilder.Create(Self);
  with frmScenBuilder do begin
    Parent := tsScenarioBuilder;
    Align := alClient;
    BorderStyle := bsNone;
    ParentColor := True;
    Show;
  end;

  frmScenarioLoader := TfrmScenarioLoader.Create(Self);
  with frmScenarioLoader do begin
    Parent := tsScenarioLoader;
    Align := alClient;
    BorderStyle := bsNone;
    ParentColor := True;
    Show;
  end;

  frmLogLoader := TfrmLogLoader.Create(Self);
  with frmLogLoader do begin
    Parent := tsRunEvent;
    Align := alClient;
    BorderStyle := bsNone;
    ParentColor := True;
    SetDatabase(FDatabase);
    Show;
  end;

  with ERSystem.Network.Listeners.Add('Logger') as TPropertyEventListener do begin
    OnPropertyStringChange := EventLoggerStr;
  end;

  with CtrlSystem.Network.Listeners.Add('Logger') as TPropertyEventListener do begin
    OnPropertyStringChange := EventLoggerStr;
  end;

  with SysMimics.Network.Listeners.Add('Logger') as TPropertyEventListener do begin
    OnPropertyStringChange := EventLoggerStr;
  end;

  with PCSSystem.Network.Listeners.Add('Logger') as TPropertyEventListener do begin
    OnPropertyStringChange := EventLoggerStr;
  end;
end;

procedure TfrmMainPanel.FormShow(Sender: TObject);
begin
  top := screen.Monitors[0].Top;
  Left := Screen.Monitors[0].Left;
end;

end.
