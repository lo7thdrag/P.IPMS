unit ufrmAlarmPresentation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, jpeg, ExtCtrls, ufrmMimics,
  uDBSupportClasses, ComCtrls, uFunction, uDataType, Math, uIPMS_Data,
  uMimicsSystem;

type
  TfrmAlarmPresentation = class(TfrmMimics)
    lbl1: TLabel;
    lbl2: TLabel;
    lvAlarmPresentation: TListView;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure lvAlarmPresentationCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvAlarmPresentationClick(Sender: TObject);
    procedure lvAlarmPresentationKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FTimer : TTimer;
    FFinalState : string;
    FElementID : string;
    FMimicID : E_MimicType;
    FChangeColor : Boolean;
  public
    procedure SetListAlarm(aAlarmList: TList; aMimicID: E_MimicType); overload;
    procedure CountDuration(Sender: TObject);

    property FinalState : string read FFinalState write FFinalState;
    property ElementID : string read FElementID write FElementID;
    property MimicID : E_MimicType read FMimicID write FMimicID;
    property ChangeColor: Boolean  read FChangeColor write FChangeColor;
  end;

var
  frmAlarmPresentation: TfrmAlarmPresentation;

implementation

{$R *.dfm}

{ TfrmAlarmPresentation }

procedure TfrmAlarmPresentation.CountDuration(Sender: TObject);
var
  i : Integer;
  aElement : TElementData;
  li : TListItem;
begin
  for i := 0 to lvAlarmPresentation.Items.Count - 1 do
  begin
    li := lvAlarmPresentation.Items[i];

    if Assigned(li.Data) then
    begin
      aElement := TElementData(li.Data);

      if Assigned(li) then
      try
        lvAlarmPresentation.Items.BeginUpdate;
        {Do your updates}
        li.SubItems[6] := FormatFloat('0.0', aElement.aDuration) + ' h';
      finally
        lvAlarmPresentation.Items.EndUpdate;
      end;
    end;
  end;
end;

procedure TfrmAlarmPresentation.FormCreate(Sender: TObject);
begin
  inherited;

  FTimer := TTimer.Create(nil);
  FTimer.Interval := 1000;
  FTimer.Enabled := True;
  FTimer.OnTimer := CountDuration;
end;

procedure TfrmAlarmPresentation.FormResize(Sender: TObject);
begin
  inherited;

  lvAlarmPresentation.Left := (Width - lvAlarmPresentation.Width) div 2;
end;

procedure TfrmAlarmPresentation.lvAlarmPresentationClick(Sender: TObject);
begin
  inherited;

  FChangeColor := False;;
end;

procedure TfrmAlarmPresentation.lvAlarmPresentationCustomDrawItem(
  Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
  var DefaultDraw: Boolean);
var
  i : Integer;
  elmData : TElementData;
  li : TListItem;
begin
  inherited;

  for i := 0 to lvAlarmPresentation.Items.Count - 1 do
  begin
    li := lvAlarmPresentation.Items[i];

    if Assigned(li.Data) then
    begin
      elmData := TElementData(li.Data);
      if Item.Index = i then
      begin
        if (elmData.aAck = 'N')then
        begin
          lvAlarmPresentation.Canvas.Brush.Color := clRed;
          lvAlarmPresentation.Canvas.Font.Color  := clWhite;

          if elmData.FinalState = 'R'  then
          begin
            lvAlarmPresentation.Canvas.Brush.Color := clSilver;
            lvAlarmPresentation.Canvas.Font.Color  := clWhite;
          end
          else if elmData.FinalState = 'D' then
          begin
            lvAlarmPresentation.Canvas.Brush.Color := colPink;
            lvAlarmPresentation.Canvas.Font.Color  := clWhite;
          end;
        end
        else if elmData.aAck = 'Y' then
        begin
//          if FChangeColor then
//          begin
//            lvAlarmPresentation.Canvas.Brush.Color := clMenuHighlight;
//            lvAlarmPresentation.Canvas.Font.Color := clWhite;
//          end
//          else
//          begin
            lvAlarmPresentation.Canvas.Brush.Color := clBlack;
            lvAlarmPresentation.Canvas.Font.Color  := clRed;
//          end;
        end;
      end;
    end;
  end;
end;

procedure TfrmAlarmPresentation.lvAlarmPresentationKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;

 FChangeColor := False;
end;

procedure TfrmAlarmPresentation.SetListAlarm(aAlarmList: TList;
  aMimicID: E_MimicType);
  function GetAlarmGroupID(aMimicID: E_MimicType): Integer;
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
  lbl2.Caption := IntToStr(aAlarmList.Count);
  lvAlarmPresentation.Clear;

  for i := 0 to aAlarmList.Count - 1 do
  begin
    elemData := aAlarmList.Items[i];

    if (elemData.AlarmgroupID = GetAlarmGroupID(aMimicID)) or
      (GetAlarmGroupID(aMimicID) = 13) then
    begin
      li := lvAlarmPresentation.Items.Add;

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
  end;
end;

end.
