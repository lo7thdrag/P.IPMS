unit InfoDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ShellAPI;

type

  TInfoClick=(icNone,icShow,icWebSite);
  TInfoDlg = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Timer: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    fDelay:integer;
    fClick:TInfoClick;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  public
    { Public declarations }
    procedure Say(const s1,s2:string; Delay:integer=3000; Click:TInfoClick=icNone);
  end;

var
  InfoDlg: TInfoDlg;

implementation

uses U_Main;

{$R *.dfm}

procedure TInfoDlg.CreateParams(var Params:TCreateParams);
begin
 inherited;
 Params.ExStyle:=Params.ExStyle or WS_EX_TOPMOST or WS_EX_TOOLWINDOW;
 Params.WndParent:=GetDesktopwindow;
end;

procedure TInfoDlg.FormCreate(Sender: TObject);
begin
 Top:=Screen.WorkAreaHeight;
 Left:=Screen.WorkAreaWidth-Width;
end;

procedure TInfoDlg.FormPaint(Sender: TObject);
begin
 Canvas.Rectangle(0,0,Width,Height);
 Canvas.Draw(6,6,application.Icon);
end;

procedure TInfoDlg.Say(const s1,s2:string; Delay:integer=3000; Click:TInfoClick=icNone);
begin
 Height:=0;
 fDelay:=Delay;
 fClick:=Click;
 Visible:=True;
 SetWindowPos(Handle,HWND_TOPMOST,0,0,0,0,SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
 Timer.Tag:=0;
 Timer.Interval:=10;
 Timer.Enabled:=True;
 Label1.Caption:=s1;
 Label2.Caption:=s2;
end;

procedure TInfoDlg.TimerTimer(Sender: TObject);
begin
 case Timer.Tag of
  0: begin
   Height:=Height+2;
   Top:=Screen.WorkAreaHeight-Height;
  // AlphaBlendValue:=(Height*255) div 60;
   if ClientHeight>=52 then begin
    Timer.Tag:=1;
    if fDelay<0 then Timer.Enabled:=False else Timer.Interval:=fDelay;
   end;
   Invalidate;
  end;
  1: begin
   Timer.Tag:=2;
   Timer.Interval:=10;
  end;
  2: begin
   Height:=Height-2;
   Top:=Screen.WorkAreaHeight-Height;
  // AlphaBlendValue:=(Height*255) div 60;
   if ClientHeight<=0 then Timer.Enabled:=False;
   Invalidate;
  end;
 end;
end;

procedure TInfoDlg.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 {if (Button=mbLeft) then
  case fClick of
   icShow   : if MainForm.miShow.Tag=1 then MainForm.miShowClick(Self) else MainForm.BringToFront;
   icWebSite: ShellExecute(0,nil,'http://tothpaul.free.fr/SIPInside.php',nil,nil,SW_SHOW);
  end;
 Timer.Tag:=2;
 Timer.Interval:=10;
 Timer.Enabled:=True;}
end;

end.

