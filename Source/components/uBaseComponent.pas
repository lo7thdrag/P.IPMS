unit uBaseComponent;

interface

uses
  Classes, Controls, Dialogs, Graphics, Messages, SysUtils, Windows,
  uIPMS_Data;

type

  TIPMSBaseComponent = class(TCustomControl)
  private
    FAlarmgroupDesc : string;
    FClicked : Boolean;
    FElementID : string;
    FElementType : Byte;
    FElementVisible : Boolean;
    FMouseEnter : Boolean;
    FShape : TRect;
    FStatusStr : string;
    FData: TObject;
    FEnbAlmInhibited: Byte;

    procedure SetAlarmgroupDesc(aStr: string);
    procedure SetClicked(aBool: Boolean);
    procedure SetElementID(aStr: string);
    procedure SetElementType(aType: Byte);
    procedure SetElementVisible(aVisible: Boolean);
    procedure SetStatusStr(aStr: string);
    procedure MouseEnterAction(var Msg: TMessage); message CM_MOUSEENTER;
    procedure MouseLeaveAction(var Msg: TMessage); message CM_MOUSELEAVE;
    procedure SetData(const Value: TObject);
  protected
    procedure Paint; override;
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;
    procedure OnKeyboardPress(aKey: Word; aShift: TShiftState);
    { linked to element object }
    property Data : TObject read FData write SetData;
  published
    property AlarmgroupDesc : string read FAlarmgroupDesc write SetAlarmgroupDesc;
    property Clicked : Boolean read FClicked write SetClicked;
    property ElementID : string read FElementID write SetElementID;
    property ElementType : Byte read FElementType write SetElementType;
    property ElementVisible : Boolean read FElementVisible write SetElementVisible;
    property StatusStr : string read FStatusStr write SetStatusStr;
    property EnbAlmInhibited : Byte read FEnbAlmInhibited write FEnbAlmInhibited;

    property OnClick;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
  end;

implementation

{ TIPMSBaseComponent }

constructor TIPMSBaseComponent.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  Cursor := crUpArrow;
  ElementID := 'ABCDEFGH';

  FClicked := False;
  FMouseEnter := False;

//  FEnbAlmInhibited := 1;
end;

destructor TIPMSBaseComponent.Destroy;
begin

  inherited;
end;

procedure TIPMSBaseComponent.MouseEnterAction(var Msg: TMessage);
begin
  FMouseEnter := True;
  Invalidate;
end;

procedure TIPMSBaseComponent.MouseLeaveAction(var Msg: TMessage);
begin
  FMouseEnter := False;
  Invalidate;
end;

procedure TIPMSBaseComponent.OnKeyboardPress(aKey: Word; aShift: TShiftState);
begin
  if not (aKey = 83) and not (ssAlt in aShift) then //alt+s
    Exit;

  if ssAlt in aShift then
  begin
    if aKey = 83 then
      ElementVisible := True
    else
      ElementVisible := False;
  end;
end;

procedure TIPMSBaseComponent.Paint;
var
  centerX, centerY : Integer;
  drawFlags: Cardinal;
  tempRect : TRect;
begin
  inherited;

  with Canvas do
  begin
    if FClicked then
    begin
      Pen.Color := clBlue;
      Pen.Width := 2;

      MoveTo(0, 0);
      LineTo(0, Height-1);
      MoveTo(0, Height-1);
      LineTo(Width-1, Height-1);
      MoveTo(Width-1, Height-1);
      LineTo(Width-1, 0);
      MoveTo(Width-1, 0);
      LineTo(0, 0);
    end;

    if FMouseEnter then
    begin
      Pen.Color := colWhite;
      Pen.Width := 1;

      MoveTo(0, 0);
      LineTo(0, Height-1);
      MoveTo(0, Height-1);
      LineTo(Width-1, Height-1);
      MoveTo(Width-1, Height-1);
      LineTo(Width-1, 0);
      MoveTo(Width-1, 0);
      LineTo(0, 0);
    end;

    if FElementVisible then
    begin
      Brush.Color := clCream;
      Font.Color := colBlack;
      Font.Name := 'Arial';
      Font.Size := 8;
      Pen.Color := colBlack;

      centerX := Width div 2;
      centerY := Height div 2;

      if Width >= 100 then
      begin
        FShape.TopLeft := Point(centerX - 50, centerY - 9);
        FShape.BottomRight := Point(centerX + 50, centerY + 9);
      end
      else
      begin
        FShape.TopLeft := Point(0, centerY - 18);
        FShape.BottomRight := Point(Width, centerY + 18);
      end;

      Rectangle(FShape);

      tempRect := FShape;

      with tempRect do
      begin
        Top := Top + 2;
        Bottom := Bottom + 2;
      end;

      drawFlags := DT_END_ELLIPSIS or DT_NOPREFIX or DT_WORDBREAK or
        DT_EDITCONTROL or DT_CENTER;

      DrawText(Canvas.Handle, PChar(FElementID), -1, tempRect, drawFlags);
    end;
  end;
end;

procedure TIPMSBaseComponent.SetAlarmgroupDesc(aStr: string);
begin
  FAlarmgroupDesc := aStr;
end;

procedure TIPMSBaseComponent.SetClicked(aBool: Boolean);
begin
  FClicked := aBool;
  Invalidate;
end;

procedure TIPMSBaseComponent.SetData(const Value: TObject);
begin
  FData := Value;
end;

procedure TIPMSBaseComponent.SetElementID(aStr: string);
begin
  FElementID := aStr;
  Invalidate;
end;

procedure TIPMSBaseComponent.SetElementType(aType: Byte);
begin
  FElementType := aType;
end;

procedure TIPMSBaseComponent.SetElementVisible(aVisible: Boolean);
begin
  FElementVisible := aVisible;
  Invalidate;
end;

procedure TIPMSBaseComponent.SetStatusStr(aStr: string);
begin
  FStatusStr := aStr;
end;

end.
