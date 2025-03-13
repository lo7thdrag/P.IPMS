unit ufrmAlarmSummaryBALL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, jpeg, ExtCtrls, ufrmMimics, StdCtrls, ComCtrls,
  uDBSupportClasses, uDataType, uIPMS_Data, uMimicsSystem;

type
  TfrmAlarmSummaryBALL = class(TfrmMimics)
    lblAlmStr: TLabel;
    lblAckStr: TLabel;
    lvAlarmSummary: TListView;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure lvAlarmSummaryCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
  private
    { Private declarations }
    FTimer      : TTimer;
    FAckList    : Tlist;
    FFinalState : string;
    FElementID  : string;
    FMimicID    : E_MimicType;
    FWait       : Boolean;
  public
    { Public declarations }
    element_id : TElementData;

    procedure SetAlarmList(aAlarmList: TList; aMimicID: E_MimicType); overload;
    procedure CountDuration(Sender: TObject);

    property FinalState: string read FFinalState write FFinalState;
    property ElementID : string read FElementID write FElementID;
    property MimicID: E_MimicType read FMimicID write FMimicID;
  end;

var
  frmAlarmSummaryBALL: TfrmAlarmSummaryBALL;

implementation

{$R *.dfm}

{ TfrmAlarmSummaryBALL }

procedure TfrmAlarmSummaryBALL.CountDuration(Sender: TObject);
var
  i : Integer;
  li : TListItem;
  elemData : TElementData;
begin
  if FWait then
    Exit;

  if lvAlarmSummary.Items.Count > 0 then
  begin
    for i := 0 to lvAlarmSummary.Items.Count - 1 do
    begin
      li := lvAlarmSummary.Items[i];

      if Assigned(li.Data) then
      begin
        elemData := TElementData(li.Data);

        if Assigned(li) then
        try
          lvAlarmSummary.Items.BeginUpdate;
          //Do your updates
          li.SubItems[6] := FormatFloat('0.0', elemData.aDuration) + ' h';
        finally
          lvAlarmSummary.Items.EndUpdate;
        end;
      end;
    end;
  end;
end;

procedure TfrmAlarmSummaryBALL.FormCreate(Sender: TObject);
begin
  inherited;

  FAckList := TList.Create;

  FTimer := TTimer.Create(nil);
  FTimer.Interval := 1000;
  FTimer.Enabled  := True;
  FTimer.OnTimer  := CountDuration;

  FWait := False;
end;

procedure TfrmAlarmSummaryBALL.FormDestroy(Sender: TObject);
begin
  inherited;

  FAckList.Free;
  FTimer.Free;
end;

procedure TfrmAlarmSummaryBALL.FormResize(Sender: TObject);
begin
  inherited;

  lvAlarmSummary.Left := (Width - lvAlarmSummary.Width) div 2;
end;

procedure TfrmAlarmSummaryBALL.lvAlarmSummaryCustomDrawItem(
  Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
  var DefaultDraw: Boolean);
var
  i: Integer;
  li: TListItem;
  elemData : TElementData;
begin
  inherited;

  for i := 0 to lvAlarmSummary.Items.Count - 1 do
  begin
    li := lvAlarmSummary.Items[i];

    if Assigned(li.Data) then
    begin
      elemData := TElementData(li.Data);
      if Item.Index = i then
      begin
        if (elemData.aAck = 'N')then
        begin
          lvAlarmSummary.Canvas.Brush.Color := clRed;
          lvAlarmSummary.Canvas.Font.Color  := clWhite;

          if elemData.FinalState = 'R'  then
          begin
            lvAlarmSummary.Canvas.Brush.Color := clSilver;
            lvAlarmSummary.Canvas.Font.Color  := clWhite;
          end
          else if elemData.FinalState = 'D' then
          begin
            lvAlarmSummary.Canvas.Brush.Color := colPink;
            lvAlarmSummary.Canvas.Font.Color  := clWhite;
          end;
        end
        else if elemData.aAck = 'Y' then
        begin
          lvAlarmSummary.Canvas.Brush.Color := clBlack;
          lvAlarmSummary.Canvas.Font.Color  := clRed;
        end;
      end;
    end;
  end;
end;

procedure TfrmAlarmSummaryBALL.SetAlarmList(aAlarmList: TList;
  aMimicID: E_MimicType);
function GetAlarmGroupID(aMimicID: E_MimicType):Integer;
begin
  case aMimicID of
    mtDGALRM: Result := 1;
    mtDISTRALRM: Result := 2;
    mtPROPALRM: Result := 3;
    mtAUXALRM: Result := 4;
    mtFUELALRM: Result := 5;
    mtDMSTALRM: Result := 6;
    mtHVACALRM: Result := 7;
    mtFFDCALRM: Result := 8;
    mtNAVALRM: Result := 9;
    mtBALLALRM: Result := 10;
    mtIPMSALRM: Result := 11;
    mtIASALRM: Result := 12;
    mtAlarm: Result := 13
  else
    Result := 1
  end;
end;
var
  i: Integer;
  li : TListItem;
  elemData: TElementData;
begin
  lvAlarmSummary.Clear;
  lblAlmStr.Caption := IntToStr(aAlarmList.Count);
  lblAckStr.Caption := IntToStr(FAckList.Count);

  FWait := True;

  for i := 0 to aAlarmList.Count - 1 do
  begin
    elemData := aAlarmList.Items[i];

    if (elemData.AlarmgroupID = GetAlarmGroupID(aMimicID)) or
      (GetAlarmGroupID(aMimicID) = 13) then
    begin
      li := lvAlarmSummary.Items.Add;

      with li do
      begin
        Caption := DateToStr(elemData.aTime);
        li.Data := elemData;

        SubItems.Add(TimeToStr(elemData.aTime));
        SubItems.Add(Inttostr(elemData.MainMimic_IDfk));
        SubItems.Add(elemData.AlarmgroupAbbreviation);
        SubItems.Add(elemData.ElementID);
        SubItems.Add(elemData.Elementname);
        SubItems.Add(elemData.Text_0);
        SubItems.Add(FormatFloat('0.0', elemData.aDuration) + ' h');
        SubItems.Add(elemData.aAck);
      end;
    end;

    if elemData.aAck = 'Y' then
      FackList.Add(elemData);
  end;

  FWait := False;
end;

end.
