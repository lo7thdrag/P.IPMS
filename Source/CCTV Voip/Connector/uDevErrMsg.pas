unit uDevErrMsg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uMain;

type
  TfrmDeviceFailedMsg = class(TForm)
    chkShowAgain: TCheckBox;
    grp1: TGroupBox;
    lblDevErrMsg: TLabel;
    btnClose: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure chkShowAgainClick(Sender: TObject);
  private
    { Private declarations }
    myArray: array of Integer;
    minMonitor, maxMonitor, secondMonitor: Integer;
    procedure SetMonitor;
  public
    { Public declarations }
    anErrMsg: string;
  end;

var
  frmDeviceFailedMsg: TfrmDeviceFailedMsg;

implementation

{$R *.dfm}

procedure TfrmDeviceFailedMsg.btnCloseClick(Sender: TObject);
begin

  if chkShowAgain.Checked then
    fConnectorFrm.ShowDeviceFailMsgStat := dfShow;

  frmDeviceFailedMsg.Close;

end;

procedure TfrmDeviceFailedMsg.chkShowAgainClick(Sender: TObject);
begin
  if not chkShowAgain.Checked then
    fConnectorFrm.ShowDeviceFailMsgStat := dfDoNotShow;
end;

procedure TfrmDeviceFailedMsg.FormShow(Sender: TObject);
begin
  lblDevErrMsg.Caption := anErrMsg;
  SetMonitor;
end;

procedure TfrmDeviceFailedMsg.SetMonitor;
  function GetMaxValue: Integer;
  var
    Idx: Integer;
  begin
    Result := myArray[ Low(myArray)];
    for Idx := Low(myArray) + 1 to High(myArray) do
    begin
      if myArray[Idx] > Result then
        Result := myArray[Idx];
    end;
  end;

  function GetMinValue: Integer;
  var
    Idx: Integer;
  begin
    Result := myArray[ Low(myArray)];
    for Idx := Low(myArray) + 1 to High(myArray) do
    begin
      if myArray[Idx] < Result then
        Result := myArray[Idx];
    end;
  end;

var
  i, left1, left2, mainMonitor: Integer;
  aTopOffset, aLeftOffset: Integer;
begin

  left1 := 0;
  minMonitor := 0;
  maxMonitor := 0;
  secondMonitor := 0;

  SetLength(myArray, Screen.MonitorCount);
  for i := 0 to Screen.MonitorCount - 1 do
  begin
    left2 := Screen.Monitors[i].Left;
    myArray[i] := left2;
  end;

  maxMonitor := GetMaxValue;
  minMonitor := GetMinValue;

  for i := Low(myArray) to High(myArray) do
//    if myArray[i] = maxMonitor then
    if myArray[i] = minMonitor then
    begin
      mainMonitor := i;
      Break;
    end;

  aLeftOffset := (Screen.Monitors[mainMonitor].Width div 2) - (frmDeviceFailedMsg.Width div 2);
  aTopOffset := (Screen.Monitors[mainMonitor].Height div 2) - (frmDeviceFailedMsg.Height div 2);

  Left := Screen.Monitors[mainMonitor].Left + aLeftOffset;
  Top := Screen.Monitors[mainMonitor].Top + aTopOffset;

end;

end.
