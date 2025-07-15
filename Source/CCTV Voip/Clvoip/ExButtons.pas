unit ExButtons;
// (c)2006 by Paul TOTH <tothpaul@free.fr>
// http://tothpaul.free.fr

{
This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
}

interface

uses
 Windows, Messages,
 Classes, StdCtrls, SysUtils,
 Graphics, Controls;

type
 TButton=class(StdCtrls.TButton)
 private
  procedure CNMeasureItem(var Message: TWMMeasureItem); message CN_MEASUREITEM;
  procedure CNDrawItem(var Msg:TWMDrawItem); message CN_DRAWITEM;
 protected
  procedure CreateParams(var Params: TCreateParams); override;
  procedure SetButtonStyle(ADefault: Boolean); override;
 end;

implementation

var
 WhitePen:THandle;
 RedBrush:THandle;
 BlueBrush:THandle;

procedure TButton.CreateParams(var Params: TCreateParams);
begin
 inherited CreateParams(Params);
 Params.Style := Params.Style or BS_OWNERDRAW; // see CreateWindow
 Cursor:=crHandPoint;
end;

procedure TButton.SetButtonStyle(ADefault: Boolean);
const
 BS_MASK = $000F;
var
  Style: Word;
begin
  if HandleAllocated then
  begin
    if ADefault then Style := BS_DEFPUSHBUTTON else Style := BS_PUSHBUTTON;
    Style:=Style or BS_OWNERDRAW;
    if GetWindowLong(Handle, GWL_STYLE) and BS_MASK <> Style then
      SendMessage(Handle, BM_SETSTYLE, Style, 1);
  end;
end;

procedure TButton.CNMeasureItem(var Message: TWMMeasureItem);
begin
 with Message.MeasureItemStruct^ do begin
  itemWidth  := Width;
  itemHeight := Height;
 end;
end;

procedure TButton.CNDrawItem(var Msg:TWMDrawItem);
var
 p:pchar;
 l:integer;
 s:TSize;
begin
 with Msg.DrawItemStruct^ do begin
  SelectObject(hDC,WhitePen);
  if Caption='<' then
   SelectObject(hDC,BlueBrush)
  else
   SelectObject(hDC,RedBrush);
  with rcItem do Rectangle(hDC,Left,Top,Right,Bottom);
  SelectObject(hDC,Font.Handle);
  SetTextColor(hDC,$ffffff);
  SetBkMode(hDC,TRANSPARENT);
  p:=pchar(Caption);
  l:=Length(Caption);
  GetTextExtentPoint(hDC,p,l,s);
  Windows.TextOut(
   hDC,
   rcItem.Left+(rcItem.Right-rcItem.Left-s.cx) div 2,
   rcItem.Top +(rcItem.Bottom-rcItem.Top-s.cy) div 2,
   p,l
  );
  if (ItemState and ODS_FOCUS)<>0  then DrawFocusRect(hDC,rcItem);
 end;
 Msg.Result:=1;
end;

initialization
 WhitePen:=GetStockObject(WHITE_PEN);
 RedBrush:=CreateSolidBrush($1600DB);
 BlueBrush:=CreateSolidBrush($BBA967);
finalization
 DeleteObject(RedBrush);
 DeleteObject(BlueBrush);
end.

