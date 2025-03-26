unit uScenLoader;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, Buttons, uDataType, uControllerSystem, ExtCtrls,
  ComCtrls, RzDTP,uDBSupportClasses, RzBmpBtn, Vcl.Imaging.pngimage,
  Vcl.Imaging.jpeg;

type
  TfrmScenarioLoader = class(TForm)
    pnlMenu: TPanel;
    btnScenario: TRzBmpButton;
    pnlScenarioLoader: TPanel;
    lblTime: TLabel;
    lblDate: TLabel;
    lblInitial: TLabel;
    lblNames: TLabel;
    lblScenarioDesc: TLabel;
    Label1: TLabel;
    mmoDesc: TMemo;
    lstScenario: TListBox;
    mmoInitial: TMemo;
    btn1: TBitBtn;
    btn2: TBitBtn;
    btnLoad: TBitBtn;
    btnRefreshScen: TBitBtn;
    chkOverrideDate: TCheckBox;
    rzDatePick: TRzDateTimePicker;
    rzTimePick: TRzDateTimePicker;
    pnlSessionScenarioLoader: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    btnRefreshSession: TBitBtn;
    btnResumeSession: TBitBtn;
    mmoSessionDesc: TMemo;
    lstAvailSession: TListBox;
    pnlHeader: TPanel;
    lblHeader: TLabel;
    btnSession: TRzBmpButton;
    Panel3: TPanel;
    Image1: TImage;
    procedure btnRefreshScenClick(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure lstScenarioMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure chkOverrideDateClick(Sender: TObject);
    procedure btnRefreshSessionClick(Sender: TObject);
    procedure lstAvailSessionMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure btnResumeSessionClick(Sender: TObject);
    procedure btnScenarioClick(Sender: TObject);
    procedure btnSessionClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmScenarioLoader: TfrmScenarioLoader;

implementation

uses uInstructorSystem, uMimicsSystem;

{$R *.dfm}

procedure TfrmScenarioLoader.btnLoadClick(Sender: TObject);
var
  dtTime : TDateTime;
  d,m,y,h,n,s,nn : Word;
begin
  if (InstructorSys.Scenario.RunState = esrRun) or
     (InstructorSys.Scenario.RunState = esrPause)  then
  begin
    MessageDlg('Running Scenario must be stopped!',mtError,[mbok],0);
    Exit;
  end;

  if lstScenario.ItemIndex >= 0 then begin

    if MessageDlg('Are you sure to start new session?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      Exit;

    Screen.Cursor := crHourGlass;

    { Avoid controller triggering element network listener }
    CtrlSystem.SilentListener('NetworkListener', True);

    { checking overrided datetime}
    if chkOverrideDate.Checked then
    begin
      DecodeDate(rzDatePick.Date,y,m,d);
      DecodeTime(rzTimePick.Time,h,n,s,nn);
      dtTime := EncodeDate(y,m,d) + EncodeTime(h,n,s,nn);
    end else
      dtTime := Now;

    if InstructorSys.Scenario.PrepareRunningScenario(lstScenario.
          Items[lstScenario.ItemIndex],dtTime) then
    begin
      CtrlSystem.Controller.SetRunningScenario(InstructorSys.Scenario.CurrentRunningScenario);
      InstructorSys.Scenario.loadScenario(InstructorSys.Scenario.CurrentRunningScenario);
    end else
    begin
      CtrlSystem.Controller.SetRunningScenario(0);
    end;

    { Activate listener again }
    CtrlSystem.SilentListener('NetworkListener', False);
    CtrlSystem.Controller.AllElementCalcd;

    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmScenarioLoader.btnRefreshScenClick(Sender: TObject);
var
  scenarios : TStrings;
begin

  lstScenario.Clear;
  scenarios := nil;

  InstructorSys.Scenario.getScenarios(scenarios);
  lstScenario.Items.AddStrings(scenarios);

  scenarios.Free;

end;

procedure TfrmScenarioLoader.btnRefreshSessionClick(Sender: TObject);
var
  scenarios : TStrings;
begin

  lstAvailSession.Clear;
  scenarios := nil;

  InstructorSys.Scenario.getSessions(scenarios);
  lstAvailSession.Items.AddStrings(scenarios);

  scenarios.Free;
end;

procedure TfrmScenarioLoader.btnResumeSessionClick(Sender: TObject);
var
  scenData : TSession_Data;
begin
  if (InstructorSys.Scenario.RunState = esrRun) or
     (InstructorSys.Scenario.RunState = esrPause)  then
  begin
    MessageDlg('Running Scenario must be stopped!',mtError,[mbok],0);
    Exit;
  end;

  if lstAvailSession.ItemIndex >= 0 then begin
     scenData := InstructorSys.Scenario.getSession(lstAvailSession.Items[lstAvailSession.ItemIndex]);

    if not Assigned(scenData) then
      Exit;

    if MessageDlg('Are you sure to continue session?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      Exit;

    Screen.Cursor := crHourGlass;

    { Avoid controller triggering element network listener }
    CtrlSystem.SilentListener('NetworkListener', True);

//    CtrlSystem.Controller.AllDefaultValue;

    InstructorSys.Scenario.CurrentRunningScenario := scenData.SessionID;
    InstructorSys.Scenario.CurrentRunningScenarioTime := scenData.SessionStop;
    InstructorSys.Scenario.CurrentRunningScenarioStart := scenData.SessionStart;

    CtrlSystem.Controller.SetRunningScenario(scenData.SessionID);
    CtrlSystem.Controller.AllDefaultValue;
    CtrlSystem.Controller.AllElementCalcd;

    InstructorSys.Scenario.loadScenario(InstructorSys.Scenario.CurrentRunningScenario);

    { Activate listener again }
    CtrlSystem.SilentListener('NetworkListener', False);
    CtrlSystem.Controller.AllElementCalcd;

    Screen.Cursor := crDefault;

    scenData.Free;
  end;
end;

procedure TfrmScenarioLoader.btnScenarioClick(Sender: TObject);
begin
  pnlScenarioLoader.BringToFront;
  lblHeader.Caption := 'SCENARIO'
end;

procedure TfrmScenarioLoader.btnSessionClick(Sender: TObject);
begin
  pnlSessionScenarioLoader.BringToFront;
  lblHeader.Caption := 'SESSION'
end;

procedure TfrmScenarioLoader.chkOverrideDateClick(Sender: TObject);
begin
  if TCheckBox(Sender).Checked then
  begin
    rzDatePick.Enabled := True;
    rzTimePick.Enabled := True;
  end else
  begin
    rzDatePick.Enabled := False;
    rzTimePick.Enabled := False;

    rzDatePick.DateTime := Now;
    rzTimePick.DateTime := Now;
  end;
end;

procedure TfrmScenarioLoader.FormCreate(Sender: TObject);
begin
  rzDatePick.DateTime := Now;
  rzTimePick.DateTime := Now;
end;

procedure TfrmScenarioLoader.lstAvailSessionMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  scenData : TSession_Data;
begin
  mmoSessionDesc.Lines.Clear;

  if lstAvailSession.ItemIndex >= 0 then begin
    scenData := InstructorSys.Scenario.getSession(lstAvailSession.Items[lstAvailSession.ItemIndex]);

    if not Assigned(scenData) then
      Exit;

    mmoSessionDesc.Lines.Add('Session ' + IntToStr(scenData.SessionID) + ' from ' + scenData.OriginalScenario +
        ' scenario');
    mmoSessionDesc.Lines.Add('Started at ' + DateTimeToStr(scenData.SessionStart));
    mmoSessionDesc.Lines.Add('Stopped at ' + DateTimeToStr(scenData.SessionStop));
  end;
end;

procedure TfrmScenarioLoader.lstScenarioMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  s : TStrings;
begin

  mmoDesc.Lines.Clear;
  mmoInitial.Lines.Clear;

  if lstScenario.ItemIndex >= 0 then begin
    mmoDesc.Lines.Add(InstructorSys.Scenario.getScenarioDesc(lstScenario.Items[lstScenario.ItemIndex]));

    s := InstructorSys.Scenario.getScenarioConditions(lstScenario.Items[lstScenario.ItemIndex]);
    mmoInitial.Lines.AddStrings(s);

    s.Free;
  end;
end;

end.
