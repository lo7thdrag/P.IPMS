unit uCCTV;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.jpeg, Vcl.Imaging.pngimage;

type
  TuMainForm = class(TForm)
    pnlVid1: TPanel;
    Image1: TImage;
    pnlVid3: TPanel;
    pnlVid2: TPanel;
    Image2: TImage;
    Image3: TImage;
    pnlVid4: TPanel;
    Image4: TImage;
    lblVid2: TLabel;
    lblVid1: TLabel;
    lblVid3: TLabel;
    lblVid4: TLabel;
    tmr1: TTimer;
    pnlVid5: TPanel;
    lblCam2: TLabel;
    pnlRec2: TPanel;
    Image12: TImage;
    pnlLonceng2: TPanel;
    Image11: TImage;
    pnlLonceng1: TPanel;
    Image6: TImage;
    pnlRec1: TPanel;
    Image7: TImage;
    pnlLonceng3: TPanel;
    Image8: TImage;
    pnlRec3: TPanel;
    Image10: TImage;
    pnlLonceng4: TPanel;
    Image13: TImage;
    pnlRec4: TPanel;
    Image14: TImage;
    lblCam3: TLabel;
    lblCam1: TLabel;
    lblCam4: TLabel;
    lblNoVideo: TLabel;
    lblVid5: TLabel;
    lblCam5: TLabel;
    pnlLonceng5: TPanel;
    Image5: TImage;
    pnlRec5: TPanel;
    Image9: TImage;
    procedure tmr1Timer(Sender: TObject);
    procedure ZoomCam2Click(Sender: TObject);
    procedure ZoomCam1Click(Sender: TObject);
    procedure ZoomCam3Click(Sender: TObject);
    procedure ZoomCam4Click(Sender: TObject);
    procedure ZoomCam5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  uMainForm: TuMainForm;

implementation

{$R *.dfm}

procedure TuMainForm.ZoomCam1Click(Sender: TObject);
begin
  {$REGION ' Camera 1 ' }
  pnlVid1.Top     := 8;
  pnlVid1.Left    := 168;
  pnlVid1.Height  := 521;
  pnlVid1.Width   := 744;
  {$ENDREGION}

  {$REGION ' Camera 2 ' }
  pnlVid2.Top     := 8;
  pnlVid2.Left    := 8;
  pnlVid2.Height  := 125;
  pnlVid2.Width   := 154;

  lblCam2.Left    := 61;
  lblCam2.Top     := 104;

  pnlLonceng2.Height  := 20;
  pnlLonceng2.Width   := 20;
  pnlLonceng2.Left    := 108;
  pnlLonceng2.Top     := 101;

  pnlRec2.Height  := 20;
  pnlRec2.Width   := 20;
  pnlRec2.Left    := 130;
  pnlRec2.Top     := 101;
  {$ENDREGION}

  {$REGION ' Camera 3 ' }
  pnlVid3.Top     := 139;
  pnlVid3.Left    := 8;
  pnlVid3.Height  := 125;
  pnlVid3.Width   := 154;

  lblCam3.Left    := 61;
  lblCam3.Top     := 104;

  pnlLonceng3.Height  := 20;
  pnlLonceng3.Width   := 20;
  pnlLonceng3.Left    := 108;
  pnlLonceng3.Top     := 101;

  pnlRec3.Height  := 20;
  pnlRec3.Width   := 20;
  pnlRec3.Left    := 130;
  pnlRec3.Top     := 101;
  {$ENDREGION}

  {$REGION ' Camera 4 ' }
  pnlVid4.Top     := 270;
  pnlVid4.Left    := 8;
  pnlVid4.Height  := 125;
  pnlVid4.Width   := 154;

  lblCam4.Left    := 61;
  lblCam4.Top     := 104;

  pnlLonceng4.Height  := 20;
  pnlLonceng4.Width   := 20;
  pnlLonceng4.Left    := 108;
  pnlLonceng4.Top     := 101;

  pnlRec4.Height  := 20;
  pnlRec4.Width   := 20;
  pnlRec4.Left    := 130;
  pnlRec4.Top     := 101;
  {$ENDREGION}

  {$REGION ' Camera 5 ' }
  pnlVid5.Top     := 404;
  pnlVid5.Left    := 8;
  pnlVid5.Height  := 125;
  pnlVid5.Width   := 154;

  lblNoVideo.Font.Size := 10;
  lblNoVideo.Left := 43;
  lblNoVideo.Top := 55;
  {$ENDREGION}
end;

procedure TuMainForm.ZoomCam2Click(Sender: TObject);
begin
  {$REGION ' Camera 2 ' }
  pnlVid2.Top     := 8;
  pnlVid2.Left    := 168;
  pnlVid2.Height  := 521;
  pnlVid2.Width   := 744;
  {$ENDREGION}

  {$REGION ' Camera 1 ' }
  pnlVid1.Top     := 8;
  pnlVid1.Left    := 8;
  pnlVid1.Height  := 125;
  pnlVid1.Width   := 154;

  lblCam1.Left    := 61;
  lblCam1.Top     := 104;

  pnlLonceng1.Height  := 20;
  pnlLonceng1.Width   := 20;
  pnlLonceng1.Left    := 108;
  pnlLonceng1.Top     := 101;

  pnlRec1.Height  := 20;
  pnlRec1.Width   := 20;
  pnlRec1.Left    := 130;
  pnlRec1.Top     := 101;
  {$ENDREGION}

  {$REGION ' Camera 3 ' }
  pnlVid3.Top     := 139;
  pnlVid3.Left    := 8;
  pnlVid3.Height  := 125;
  pnlVid3.Width   := 154;

  lblCam3.Left    := 61;
  lblCam3.Top     := 104;

  pnlLonceng3.Height  := 20;
  pnlLonceng3.Width   := 20;
  pnlLonceng3.Left    := 108;
  pnlLonceng3.Top     := 101;

  pnlRec3.Height  := 20;
  pnlRec3.Width   := 20;
  pnlRec3.Left    := 130;
  pnlRec3.Top     := 101;
  {$ENDREGION}

  {$REGION ' Camera 4 ' }
  pnlVid4.Top     := 270;
  pnlVid4.Left    := 8;
  pnlVid4.Height  := 125;
  pnlVid4.Width   := 154;

  lblCam4.Left    := 61;
  lblCam4.Top     := 104;

  pnlLonceng4.Height  := 20;
  pnlLonceng4.Width   := 20;
  pnlLonceng4.Left    := 108;
  pnlLonceng4.Top     := 101;

  pnlRec4.Height  := 20;
  pnlRec4.Width   := 20;
  pnlRec4.Left    := 130;
  pnlRec4.Top     := 101;
  {$ENDREGION}

  {$REGION ' Camera 5 ' }
  pnlVid5.Top     := 404;
  pnlVid5.Left    := 8;
  pnlVid5.Height  := 125;
  pnlVid5.Width   := 154;

  lblNoVideo.Font.Size := 10;
  lblNoVideo.Left := 43;
  lblNoVideo.Top := 55;
  {$ENDREGION}
end;

procedure TuMainForm.ZoomCam3Click(Sender: TObject);
begin
  {$REGION ' Camera 3 ' }
  pnlVid3.Top     := 8;
  pnlVid3.Left    := 168;
  pnlVid3.Height  := 521;
  pnlVid3.Width   := 744;
  {$ENDREGION}

  {$REGION ' Camera 1 ' }
  pnlVid1.Top     := 8;
  pnlVid1.Left    := 8;
  pnlVid1.Height  := 125;
  pnlVid1.Width   := 154;

  lblCam1.Left    := 61;
  lblCam1.Top     := 104;

  pnlLonceng1.Height  := 20;
  pnlLonceng1.Width   := 20;
  pnlLonceng1.Left    := 108;
  pnlLonceng1.Top     := 101;

  pnlRec1.Height  := 20;
  pnlRec1.Width   := 20;
  pnlRec1.Left    := 130;
  pnlRec1.Top     := 101;
  {$ENDREGION}

  {$REGION ' Camera 2 ' }
  pnlVid2.Top     := 139;
  pnlVid2.Left    := 8;
  pnlVid2.Height  := 125;
  pnlVid2.Width   := 154;

  lblCam2.Left    := 61;
  lblCam2.Top     := 104;

  pnlLonceng2.Height  := 20;
  pnlLonceng2.Width   := 20;
  pnlLonceng2.Left    := 108;
  pnlLonceng2.Top     := 101;

  pnlRec2.Height  := 20;
  pnlRec2.Width   := 20;
  pnlRec2.Left    := 130;
  pnlRec2.Top     := 101;
  {$ENDREGION}

  {$REGION ' Camera 4 ' }
  pnlVid4.Top     := 270;
  pnlVid4.Left    := 8;
  pnlVid4.Height  := 125;
  pnlVid4.Width   := 154;

  lblCam4.Left    := 61;
  lblCam4.Top     := 104;

  pnlLonceng4.Height  := 20;
  pnlLonceng4.Width   := 20;
  pnlLonceng4.Left    := 108;
  pnlLonceng4.Top     := 101;

  pnlRec4.Height  := 20;
  pnlRec4.Width   := 20;
  pnlRec4.Left    := 130;
  pnlRec4.Top     := 101;
  {$ENDREGION}

  {$REGION ' Camera 5 ' }
  pnlVid5.Top     := 404;
  pnlVid5.Left    := 8;
  pnlVid5.Height  := 125;
  pnlVid5.Width   := 154;

  lblNoVideo.Font.Size := 10;
  lblNoVideo.Left := 43;
  lblNoVideo.Top := 55;
  {$ENDREGION}
end;

procedure TuMainForm.ZoomCam4Click(Sender: TObject);
begin
  {$REGION ' Camera 4 ' }
  pnlVid4.Top     := 8;
  pnlVid4.Left    := 168;
  pnlVid4.Height  := 521;
  pnlVid4.Width   := 744;
  {$ENDREGION}

  {$REGION ' Camera 1 ' }
  pnlVid1.Top     := 8;
  pnlVid1.Left    := 8;
  pnlVid1.Height  := 125;
  pnlVid1.Width   := 154;

  lblCam1.Left    := 61;
  lblCam1.Top     := 104;

  pnlLonceng1.Height  := 20;
  pnlLonceng1.Width   := 20;
  pnlLonceng1.Left    := 108;
  pnlLonceng1.Top     := 101;

  pnlRec1.Height  := 20;
  pnlRec1.Width   := 20;
  pnlRec1.Left    := 130;
  pnlRec1.Top     := 101;
  {$ENDREGION}

  {$REGION ' Camera 2 ' }
  pnlVid2.Top     := 139;
  pnlVid2.Left    := 8;
  pnlVid2.Height  := 125;
  pnlVid2.Width   := 154;

  lblCam2.Left    := 61;
  lblCam2.Top     := 104;

  pnlLonceng2.Height  := 20;
  pnlLonceng2.Width   := 20;
  pnlLonceng2.Left    := 108;
  pnlLonceng2.Top     := 101;

  pnlRec2.Height  := 20;
  pnlRec2.Width   := 20;
  pnlRec2.Left    := 130;
  pnlRec2.Top     := 101;
  {$ENDREGION}

  {$REGION ' Camera 3 ' }
  pnlVid3.Top     := 270;
  pnlVid3.Left    := 8;
  pnlVid3.Height  := 125;
  pnlVid3.Width   := 154;

  lblCam3.Left    := 61;
  lblCam3.Top     := 104;

  pnlLonceng3.Height  := 20;
  pnlLonceng3.Width   := 20;
  pnlLonceng3.Left    := 108;
  pnlLonceng3.Top     := 101;

  pnlRec3.Height  := 20;
  pnlRec3.Width   := 20;
  pnlRec3.Left    := 130;
  pnlRec3.Top     := 101;
  {$ENDREGION}

  {$REGION ' Camera 5 ' }
  pnlVid5.Top     := 404;
  pnlVid5.Left    := 8;
  pnlVid5.Height  := 125;
  pnlVid5.Width   := 154;

  lblNoVideo.Font.Size := 10;
  lblNoVideo.Left := 43;
  lblNoVideo.Top := 55;
  {$ENDREGION}

end;

procedure TuMainForm.ZoomCam5Click(Sender: TObject);
begin
  {$REGION ' Camera 5 ' }
  pnlVid5.Top     := 8;
  pnlVid5.Left    := 168;
  pnlVid5.Height  := 521;
  pnlVid5.Width   := 744;

  lblNoVideo.Font.Size := 48;
  lblNoVideo.Left := 190;
  lblNoVideo.Top := 222;
  {$ENDREGION}

  {$REGION ' Camera 1 ' }
  pnlVid1.Top     := 8;
  pnlVid1.Left    := 8;
  pnlVid1.Height  := 125;
  pnlVid1.Width   := 154;

  lblCam1.Left    := 61;
  lblCam1.Top     := 104;

  pnlLonceng1.Height  := 20;
  pnlLonceng1.Width   := 20;
  pnlLonceng1.Left    := 108;
  pnlLonceng1.Top     := 101;

  pnlRec1.Height  := 20;
  pnlRec1.Width   := 20;
  pnlRec1.Left    := 130;
  pnlRec1.Top     := 101;
  {$ENDREGION}

  {$REGION ' Camera 2 ' }
  pnlVid2.Top     := 139;
  pnlVid2.Left    := 8;
  pnlVid2.Height  := 125;
  pnlVid2.Width   := 154;

  lblCam2.Left    := 61;
  lblCam2.Top     := 104;

  pnlLonceng2.Height  := 20;
  pnlLonceng2.Width   := 20;
  pnlLonceng2.Left    := 108;
  pnlLonceng2.Top     := 101;

  pnlRec2.Height  := 20;
  pnlRec2.Width   := 20;
  pnlRec2.Left    := 130;
  pnlRec2.Top     := 101;
  {$ENDREGION}

  {$REGION ' Camera 3 ' }
  pnlVid3.Top     := 270;
  pnlVid3.Left    := 8;
  pnlVid3.Height  := 125;
  pnlVid3.Width   := 154;

  lblCam3.Left    := 61;
  lblCam3.Top     := 104;

  pnlLonceng3.Height  := 20;
  pnlLonceng3.Width   := 20;
  pnlLonceng3.Left    := 108;
  pnlLonceng3.Top     := 101;

  pnlRec3.Height  := 20;
  pnlRec3.Width   := 20;
  pnlRec3.Left    := 130;
  pnlRec3.Top     := 101;
  {$ENDREGION}

  {$REGION ' Camera 4 ' }
  pnlVid4.Top     := 404;
  pnlVid4.Left    := 8;
  pnlVid4.Height  := 125;
  pnlVid4.Width   := 154;

  lblCam4.Left    := 61;
  lblCam4.Top     := 104;

  pnlLonceng4.Height  := 20;
  pnlLonceng4.Width   := 20;
  pnlLonceng4.Left    := 108;
  pnlLonceng4.Top     := 101;

  pnlRec4.Height  := 20;
  pnlRec4.Width   := 20;
  pnlRec4.Left    := 130;
  pnlRec4.Top     := 101;
  {$ENDREGION}
end;

procedure TuMainForm.tmr1Timer(Sender: TObject);
begin
  lblVid1.Caption := FormatDateTime('dddd, dd/mm/yyyy hh:nn:ss',now);
  lblVid2.Caption := FormatDateTime('dddd, dd/mm/yyyy hh:nn:ss',now);
  lblVid3.Caption := FormatDateTime('dddd, dd/mm/yyyy hh:nn:ss',now);
  lblVid4.Caption := FormatDateTime('dddd, dd/mm/yyyy hh:nn:ss',now);
  lblVid5.Caption := FormatDateTime('dddd, dd/mm/yyyy hh:nn:ss',now);
end;

end.
