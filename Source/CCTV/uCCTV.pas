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
    lblVid5: TLabel;
    lblCam5: TLabel;
    pnlLonceng5: TPanel;
    Image5: TImage;
    pnlRec5: TPanel;
    Image9: TImage;
    pnlVid6: TPanel;
    lblVid6: TLabel;
    lblCam6: TLabel;
    pnlLonceng6: TPanel;
    Image15: TImage;
    pnlRec6: TPanel;
    Image16: TImage;
    pnlVid7: TPanel;
    lblNoVideo7: TLabel;
    lblVid7: TLabel;
    lblCam7: TLabel;
    pnlLonceng7: TPanel;
    Image17: TImage;
    pnlRec7: TPanel;
    Image18: TImage;
    pnlVid8: TPanel;
    lblNoVideo8: TLabel;
    lblVid8: TLabel;
    lblCam8: TLabel;
    pnlLonceng8: TPanel;
    Image19: TImage;
    pnlRec8: TPanel;
    Image20: TImage;
    Image21: TImage;
    Image22: TImage;
    procedure tmr1Timer(Sender: TObject);
    procedure ZoomCam2Click(Sender: TObject);
    procedure ZoomCam1Click(Sender: TObject);
    procedure ZoomCam3Click(Sender: TObject);
    procedure ZoomCam4Click(Sender: TObject);
    procedure ZoomCam5Click(Sender: TObject);

    procedure ZoomCam6Click(Sender: TObject);
    procedure ZoomCam7Click(Sender: TObject);
    procedure ZoomCam8Click(Sender: TObject);

     procedure Button1Click(Sender: TObject);
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
  {$REGION ' Camera 1 Besar ' }
  pnlVid1.Top     := 8;
  pnlVid1.Left    := 168;
  pnlVid1.Height  := 753;
  pnlVid1.Width   := 848;

  lblCam1.Left    := 725;
  lblCam1.Top     := 724;

  pnlLonceng1.Height  := 30;
  pnlLonceng1.Width   := 30;
  pnlLonceng1.Left    := 779;
  pnlLonceng1.Top     := 717;

  pnlRec1.Height  := 30;
  pnlRec1.Width   := 30;
  pnlRec1.Left    := 811;
  pnlRec1.Top     := 717;

  {$ENDREGION}

  {$REGION ' Camera 2 ' }
  pnlVid2.Top     := 8;
  pnlVid2.Left    := 8;
  pnlVid2.Height  := 100;
  pnlVid2.Width   := 154;

  lblCam2.Left    := 56;
  lblCam2.Top     := 78;

  pnlLonceng2.Height  := 20;
  pnlLonceng2.Width   := 20;
  pnlLonceng2.Left    := 108;
  pnlLonceng2.Top     := 76;

  pnlRec2.Height  := 20;
  pnlRec2.Width   := 20;
  pnlRec2.Left    := 130;
  pnlRec2.Top     := 76;
  {$ENDREGION}

  {$REGION ' Camera 3 ' }
  pnlVid3.Top     := 117;
  pnlVid3.Left    := 8;
  pnlVid3.Height  := 100;
  pnlVid3.Width   := 154;

  lblCam3.Left    := 56;
  lblCam3.Top     := 78;

  pnlLonceng3.Height  := 20;
  pnlLonceng3.Width   := 20;
  pnlLonceng3.Left    := 108;
  pnlLonceng3.Top     := 76;

  pnlRec3.Height  := 20;
  pnlRec3.Width   := 20;
  pnlRec3.Left    := 130;
  pnlRec3.Top     := 76;
  {$ENDREGION}

  {$REGION ' Camera 4 ' }
  pnlVid4.Top     := 225;
  pnlVid4.Left    := 8;
  pnlVid4.Height  := 100;
  pnlVid4.Width   := 154;

  lblCam4.Left    := 56;
  lblCam4.Top     := 78;

  pnlLonceng4.Height  := 20;
  pnlLonceng4.Width   := 20;
  pnlLonceng4.Left    := 108;
  pnlLonceng4.Top     := 76;

  pnlRec4.Height  := 20;
  pnlRec4.Width   := 20;
  pnlRec4.Left    := 130;
  pnlRec4.Top     := 76;
  {$ENDREGION}

  {$REGION ' Camera 5 ' }
  pnlVid5.Top     := 334;
  pnlVid5.Left    := 8;
  pnlVid5.Height  := 100;
  pnlVid5.Width   := 154;

  lblCam5.Left    := 56;
  lblCam5.Top     := 78;

  pnlLonceng5.Height  := 20;
  pnlLonceng5.Width   := 20;
  pnlLonceng5.Left    := 108;
  pnlLonceng5.Top     := 76;

  pnlRec5.Height  := 20;
  pnlRec5.Width   := 20;
  pnlRec5.Left    := 130;
  pnlRec5.Top     := 76;

  {$ENDREGION}

  {$REGION ' Camera 6 ' }
  pnlVid6.Top     := 443;
  pnlVid6.Left    := 8;
  pnlVid6.Height  := 100;
  pnlVid6.Width   := 154;

  lblCam6.Left    := 56;
  lblCam6.Top     := 78;

  pnlLonceng6.Height  := 20;
  pnlLonceng6.Width   := 20;
  pnlLonceng6.Left    := 108;
  pnlLonceng6.Top     := 76;

  pnlRec6.Height  := 20;
  pnlRec6.Width   := 20;
  pnlRec6.Left    := 130;
  pnlRec6.Top     := 76;

  {$ENDREGION}

  {$REGION ' Camera 7 ' }
  pnlVid7.Top     := 551;
  pnlVid7.Left    := 8;
  pnlVid7.Height  := 100;
  pnlVid7.Width   := 154;

  lblCam7.Left    := 56;
  lblCam7.Top     := 78;

  pnlLonceng7.Height  := 20;
  pnlLonceng7.Width   := 20;
  pnlLonceng7.Left    := 108;
  pnlLonceng7.Top     := 76;

  pnlRec7.Height  := 20;
  pnlRec7.Width   := 20;
  pnlRec7.Left    := 130;
  pnlRec7.Top     := 76;

  lblNoVideo7.Font.Size := 10;
  lblNoVideo7.Left := 43;
  lblNoVideo7.Top := 42;
  {$ENDREGION}

  {$REGION ' Camera 8 ' }
  pnlVid8.Top     := 660;
  pnlVid8.Left    := 8;
  pnlVid8.Height  := 100;
  pnlVid8.Width   := 154;

  lblCam8.Left    := 56;
  lblCam8.Top     := 78;

  pnlLonceng8.Height  := 20;
  pnlLonceng8.Width   := 20;
  pnlLonceng8.Left    := 108;
  pnlLonceng8.Top     := 76;

  pnlRec8.Height  := 20;
  pnlRec8.Width   := 20;
  pnlRec8.Left    := 130;
  pnlRec8.Top     := 76;

  lblNoVideo8.Font.Size := 10;
  lblNoVideo8.Left := 43;
  lblNoVideo8.Top := 42;
  {$ENDREGION}

end;

procedure TuMainForm.ZoomCam2Click(Sender: TObject);
begin
  {$REGION ' Camera 2 Besar ' }
  pnlVid2.Top     := 8;
  pnlVid2.Left    := 168;
  pnlVid2.Height  := 753;
  pnlVid2.Width   := 848;

  lblCam2.Left    := 725;
  lblCam2.Top     := 724;

  pnlLonceng2.Height  := 30;
  pnlLonceng2.Width   := 30;
  pnlLonceng2.Left    := 779;
  pnlLonceng2.Top     := 717;

  pnlRec2.Height  := 30;
  pnlRec2.Width   := 30;
  pnlRec2.Left    := 811;
  pnlRec2.Top     := 717;

  {$ENDREGION}

  {$REGION ' Camera 1 ' }
  pnlVid1.Top     := 8;
  pnlVid1.Left    := 8;
  pnlVid1.Height  := 100;
  pnlVid1.Width   := 154;

  lblCam1.Left    := 56;
  lblCam1.Top     := 78;

  pnlLonceng1.Height  := 20;
  pnlLonceng1.Width   := 20;
  pnlLonceng1.Left    := 108;
  pnlLonceng1.Top     := 76;

  pnlRec1.Height  := 20;
  pnlRec1.Width   := 20;
  pnlRec1.Left    := 130;
  pnlRec1.Top     := 76;
  {$ENDREGION}

  {$REGION ' Camera 3 ' }
  pnlVid3.Top     := 117;
  pnlVid3.Left    := 8;
  pnlVid3.Height  := 100;
  pnlVid3.Width   := 154;

  lblCam3.Left    := 56;
  lblCam3.Top     := 78;

  pnlLonceng3.Height  := 20;
  pnlLonceng3.Width   := 20;
  pnlLonceng3.Left    := 108;
  pnlLonceng3.Top     := 76;

  pnlRec3.Height  := 20;
  pnlRec3.Width   := 20;
  pnlRec3.Left    := 130;
  pnlRec3.Top     := 76;
  {$ENDREGION}

  {$REGION ' Camera 4 ' }
  pnlVid4.Top     := 225;
  pnlVid4.Left    := 8;
  pnlVid4.Height  := 100;
  pnlVid4.Width   := 154;

  lblCam4.Left    := 56;
  lblCam4.Top     := 78;

  pnlLonceng4.Height  := 20;
  pnlLonceng4.Width   := 20;
  pnlLonceng4.Left    := 108;
  pnlLonceng4.Top     := 76;

  pnlRec4.Height  := 20;
  pnlRec4.Width   := 20;
  pnlRec4.Left    := 130;
  pnlRec4.Top     := 76;
  {$ENDREGION}

  {$REGION ' Camera 5 ' }
  pnlVid5.Top     := 334;
  pnlVid5.Left    := 8;
  pnlVid5.Height  := 100;
  pnlVid5.Width   := 154;

  lblCam5.Left    := 56;
  lblCam5.Top     := 78;

  pnlLonceng5.Height  := 20;
  pnlLonceng5.Width   := 20;
  pnlLonceng5.Left    := 108;
  pnlLonceng5.Top     := 76;

  pnlRec5.Height  := 20;
  pnlRec5.Width   := 20;
  pnlRec5.Left    := 130;
  pnlRec5.Top     := 76;

  {$ENDREGION}

  {$REGION ' Camera 6 ' }
  pnlVid6.Top     := 443;
  pnlVid6.Left    := 8;
  pnlVid6.Height  := 100;
  pnlVid6.Width   := 154;

  lblCam6.Left    := 56;
  lblCam6.Top     := 78;

  pnlLonceng6.Height  := 20;
  pnlLonceng6.Width   := 20;
  pnlLonceng6.Left    := 108;
  pnlLonceng6.Top     := 76;

  pnlRec6.Height  := 20;
  pnlRec6.Width   := 20;
  pnlRec6.Left    := 130;
  pnlRec6.Top     := 76;

  {$ENDREGION}

  {$REGION ' Camera 7 ' }
  pnlVid7.Top     := 551;
  pnlVid7.Left    := 8;
  pnlVid7.Height  := 100;
  pnlVid7.Width   := 154;

  lblCam7.Left    := 56;
  lblCam7.Top     := 78;

  pnlLonceng7.Height  := 20;
  pnlLonceng7.Width   := 20;
  pnlLonceng7.Left    := 108;
  pnlLonceng7.Top     := 76;

  pnlRec7.Height  := 20;
  pnlRec7.Width   := 20;
  pnlRec7.Left    := 130;
  pnlRec7.Top     := 76;

  lblNoVideo7.Font.Size := 10;
  lblNoVideo7.Left := 43;
  lblNoVideo7.Top := 42;
  {$ENDREGION}

  {$REGION ' Camera 8 ' }
  pnlVid8.Top     := 660;
  pnlVid8.Left    := 8;
  pnlVid8.Height  := 100;
  pnlVid8.Width   := 154;

  lblCam8.Left    := 56;
  lblCam8.Top     := 78;

  pnlLonceng8.Height  := 20;
  pnlLonceng8.Width   := 20;
  pnlLonceng8.Left    := 108;
  pnlLonceng8.Top     := 76;

  pnlRec8.Height  := 20;
  pnlRec8.Width   := 20;
  pnlRec8.Left    := 130;
  pnlRec8.Top     := 76;

  lblNoVideo8.Font.Size := 10;
  lblNoVideo8.Left := 43;
  lblNoVideo8.Top := 42;
  {$ENDREGION}

end;

procedure TuMainForm.ZoomCam3Click(Sender: TObject);
begin
  {$REGION ' Camera 3 Besar ' }
  pnlVid3.Top     := 8;
  pnlVid3.Left    := 168;
  pnlVid3.Height  := 753;
  pnlVid3.Width   := 848;

  lblCam3.Left    := 725;
  lblCam3.Top     := 724;

  pnlLonceng3.Height  := 30;
  pnlLonceng3.Width   := 30;
  pnlLonceng3.Left    := 779;
  pnlLonceng3.Top     := 717;

  pnlRec3.Height  := 30;
  pnlRec3.Width   := 30;
  pnlRec3.Left    := 811;
  pnlRec3.Top     := 717;
  {$ENDREGION}

  {$REGION ' Camera 1 ' }
  pnlVid1.Top     := 8;
  pnlVid1.Left    := 8;
  pnlVid1.Height  := 100;
  pnlVid1.Width   := 154;

  lblCam1.Left    := 56;
  lblCam1.Top     := 78;

  pnlLonceng1.Height  := 20;
  pnlLonceng1.Width   := 20;
  pnlLonceng1.Left    := 108;
  pnlLonceng1.Top     := 76;

  pnlRec1.Height  := 20;
  pnlRec1.Width   := 20;
  pnlRec1.Left    := 130;
  pnlRec1.Top     := 76;
  {$ENDREGION}

  {$REGION ' Camera 2 ' }
  pnlVid2.Top     := 117;
  pnlVid2.Left    := 8;
  pnlVid2.Height  := 100;
  pnlVid2.Width   := 154;

  lblCam2.Left    := 56;
  lblCam2.Top     := 78;

  pnlLonceng2.Height  := 20;
  pnlLonceng2.Width   := 20;
  pnlLonceng2.Left    := 108;
  pnlLonceng2.Top     := 76;

  pnlRec2.Height  := 20;
  pnlRec2.Width   := 20;
  pnlRec2.Left    := 130;
  pnlRec2.Top     := 76;
  {$ENDREGION}

  {$REGION ' Camera 4 ' }
  pnlVid4.Top     := 225;
  pnlVid4.Left    := 8;
  pnlVid4.Height  := 100;
  pnlVid4.Width   := 154;

  lblCam4.Left    := 56;
  lblCam4.Top     := 78;

  pnlLonceng4.Height  := 20;
  pnlLonceng4.Width   := 20;
  pnlLonceng4.Left    := 108;
  pnlLonceng4.Top     := 76;

  pnlRec4.Height  := 20;
  pnlRec4.Width   := 20;
  pnlRec4.Left    := 130;
  pnlRec4.Top     := 76;
  {$ENDREGION}

  {$REGION ' Camera 5 ' }
  pnlVid5.Top     := 334;
  pnlVid5.Left    := 8;
  pnlVid5.Height  := 100;
  pnlVid5.Width   := 154;

  lblCam5.Left    := 56;
  lblCam5.Top     := 78;

  pnlLonceng5.Height  := 20;
  pnlLonceng5.Width   := 20;
  pnlLonceng5.Left    := 108;
  pnlLonceng5.Top     := 76;

  pnlRec5.Height  := 20;
  pnlRec5.Width   := 20;
  pnlRec5.Left    := 130;
  pnlRec5.Top     := 76;

  {$ENDREGION}

  {$REGION ' Camera 6 ' }
  pnlVid6.Top     := 443;
  pnlVid6.Left    := 8;
  pnlVid6.Height  := 100;
  pnlVid6.Width   := 154;

  lblCam6.Left    := 56;
  lblCam6.Top     := 78;

  pnlLonceng6.Height  := 20;
  pnlLonceng6.Width   := 20;
  pnlLonceng6.Left    := 108;
  pnlLonceng6.Top     := 76;

  pnlRec6.Height  := 20;
  pnlRec6.Width   := 20;
  pnlRec6.Left    := 130;
  pnlRec6.Top     := 76;

  {$ENDREGION}

  {$REGION ' Camera 7 ' }
  pnlVid7.Top     := 551;
  pnlVid7.Left    := 8;
  pnlVid7.Height  := 100;
  pnlVid7.Width   := 154;

  lblCam7.Left    := 56;
  lblCam7.Top     := 78;

  pnlLonceng7.Height  := 20;
  pnlLonceng7.Width   := 20;
  pnlLonceng7.Left    := 108;
  pnlLonceng7.Top     := 76;

  pnlRec7.Height  := 20;
  pnlRec7.Width   := 20;
  pnlRec7.Left    := 130;
  pnlRec7.Top     := 76;

  lblNoVideo7.Font.Size := 10;
  lblNoVideo7.Left := 43;
  lblNoVideo7.Top := 42;
  {$ENDREGION}

  {$REGION ' Camera 8 ' }
  pnlVid8.Top     := 660;
  pnlVid8.Left    := 8;
  pnlVid8.Height  := 100;
  pnlVid8.Width   := 154;

  lblCam8.Left    := 56;
  lblCam8.Top     := 78;

  pnlLonceng8.Height  := 20;
  pnlLonceng8.Width   := 20;
  pnlLonceng8.Left    := 108;
  pnlLonceng8.Top     := 76;

  pnlRec8.Height  := 20;
  pnlRec8.Width   := 20;
  pnlRec8.Left    := 130;
  pnlRec8.Top     := 76;

  lblNoVideo8.Font.Size := 10;
  lblNoVideo8.Left := 43;
  lblNoVideo8.Top := 42;
  {$ENDREGION}

end;

procedure TuMainForm.ZoomCam4Click(Sender: TObject);
begin
  {$REGION ' Camera 4 Besar ' }
  pnlVid4.Top     := 8;
  pnlVid4.Left    := 168;
  pnlVid4.Height  := 753;
  pnlVid4.Width   := 848;

  lblCam4.Left    := 725;
  lblCam4.Top     := 724;

  pnlLonceng4.Height  := 30;
  pnlLonceng4.Width   := 30;
  pnlLonceng4.Left    := 779;
  pnlLonceng4.Top     := 717;

  pnlRec4.Height  := 30;
  pnlRec4.Width   := 30;
  pnlRec4.Left    := 811;
  pnlRec4.Top     := 717;
  {$ENDREGION}

  {$REGION ' Camera 1 ' }
  pnlVid1.Top     := 8;
  pnlVid1.Left    := 8;
  pnlVid1.Height  := 100;
  pnlVid1.Width   := 154;

  lblCam1.Left    := 56;
  lblCam1.Top     := 78;

  pnlLonceng1.Height  := 20;
  pnlLonceng1.Width   := 20;
  pnlLonceng1.Left    := 108;
  pnlLonceng1.Top     := 76;

  pnlRec1.Height  := 20;
  pnlRec1.Width   := 20;
  pnlRec1.Left    := 130;
  pnlRec1.Top     := 76;
  {$ENDREGION}

  {$REGION ' Camera 2 ' }
  pnlVid2.Top     := 117;
  pnlVid2.Left    := 8;
  pnlVid2.Height  := 100;
  pnlVid2.Width   := 154;

  lblCam2.Left    := 56;
  lblCam2.Top     := 78;

  pnlLonceng2.Height  := 20;
  pnlLonceng2.Width   := 20;
  pnlLonceng2.Left    := 108;
  pnlLonceng2.Top     := 76;

  pnlRec2.Height  := 20;
  pnlRec2.Width   := 20;
  pnlRec2.Left    := 130;
  pnlRec2.Top     := 76;
  {$ENDREGION}

  {$REGION ' Camera 3 ' }
  pnlVid3.Top     := 225;
  pnlVid3.Left    := 8;
  pnlVid3.Height  := 100;
  pnlVid3.Width   := 154;

  lblCam3.Left    := 56;
  lblCam3.Top     := 78;

  pnlLonceng3.Height  := 20;
  pnlLonceng3.Width   := 20;
  pnlLonceng3.Left    := 108;
  pnlLonceng3.Top     := 76;

  pnlRec3.Height  := 20;
  pnlRec3.Width   := 20;
  pnlRec3.Left    := 130;
  pnlRec3.Top     := 76;
  {$ENDREGION}

  {$REGION ' Camera 5 ' }
  pnlVid5.Top     := 334;
  pnlVid5.Left    := 8;
  pnlVid5.Height  := 100;
  pnlVid5.Width   := 154;

  lblCam5.Left    := 56;
  lblCam5.Top     := 78;

  pnlLonceng5.Height  := 20;
  pnlLonceng5.Width   := 20;
  pnlLonceng5.Left    := 108;
  pnlLonceng5.Top     := 76;

  pnlRec5.Height  := 20;
  pnlRec5.Width   := 20;
  pnlRec5.Left    := 130;
  pnlRec5.Top     := 76;

  {$ENDREGION}

  {$REGION ' Camera 6 ' }
  pnlVid6.Top     := 443;
  pnlVid6.Left    := 8;
  pnlVid6.Height  := 100;
  pnlVid6.Width   := 154;

  lblCam6.Left    := 56;
  lblCam6.Top     := 78;

  pnlLonceng6.Height  := 20;
  pnlLonceng6.Width   := 20;
  pnlLonceng6.Left    := 108;
  pnlLonceng6.Top     := 76;

  pnlRec6.Height  := 20;
  pnlRec6.Width   := 20;
  pnlRec6.Left    := 130;
  pnlRec6.Top     := 76;

  {$ENDREGION}

  {$REGION ' Camera 7 ' }
  pnlVid7.Top     := 551;
  pnlVid7.Left    := 8;
  pnlVid7.Height  := 100;
  pnlVid7.Width   := 154;

  lblCam7.Left    := 56;
  lblCam7.Top     := 78;

  pnlLonceng7.Height  := 20;
  pnlLonceng7.Width   := 20;
  pnlLonceng7.Left    := 108;
  pnlLonceng7.Top     := 76;

  pnlRec7.Height  := 20;
  pnlRec7.Width   := 20;
  pnlRec7.Left    := 130;
  pnlRec7.Top     := 76;

  lblNoVideo7.Font.Size := 10;
  lblNoVideo7.Left := 43;
  lblNoVideo7.Top := 42;
  {$ENDREGION}

  {$REGION ' Camera 8 ' }
  pnlVid8.Top     := 660;
  pnlVid8.Left    := 8;
  pnlVid8.Height  := 100;
  pnlVid8.Width   := 154;

  lblCam8.Left    := 56;
  lblCam8.Top     := 78;

  pnlLonceng8.Height  := 20;
  pnlLonceng8.Width   := 20;
  pnlLonceng8.Left    := 108;
  pnlLonceng8.Top     := 76;

  pnlRec8.Height  := 20;
  pnlRec8.Width   := 20;
  pnlRec8.Left    := 130;
  pnlRec8.Top     := 76;

  lblNoVideo8.Font.Size := 10;
  lblNoVideo8.Left := 43;
  lblNoVideo8.Top := 42;
  {$ENDREGION}

end;

procedure TuMainForm.ZoomCam5Click(Sender: TObject);
begin
  {$REGION ' Camera 5 Besar ' }
  pnlVid5.Top     := 8;
  pnlVid5.Left    := 168;
  pnlVid5.Height  := 753;
  pnlVid5.Width   := 848;

  lblCam5.Left    := 725;
  lblCam5.Top     := 724;

  pnlLonceng5.Height  := 30;
  pnlLonceng5.Width   := 30;
  pnlLonceng5.Left    := 779;
  pnlLonceng5.Top     := 717;

  pnlRec5.Height  := 30;
  pnlRec5.Width   := 30;
  pnlRec5.Left    := 811;
  pnlRec5.Top     := 717;
  {$ENDREGION}

  {$REGION ' Camera 1 ' }
  pnlVid1.Top     := 8;
  pnlVid1.Left    := 8;
  pnlVid1.Height  := 100;
  pnlVid1.Width   := 154;

  lblCam1.Left    := 56;
  lblCam1.Top     := 78;

  pnlLonceng1.Height  := 20;
  pnlLonceng1.Width   := 20;
  pnlLonceng1.Left    := 108;
  pnlLonceng1.Top     := 76;

  pnlRec1.Height  := 20;
  pnlRec1.Width   := 20;
  pnlRec1.Left    := 130;
  pnlRec1.Top     := 76;
  {$ENDREGION}

  {$REGION ' Camera 2 ' }
  pnlVid2.Top     := 117;
  pnlVid2.Left    := 8;
  pnlVid2.Height  := 100;
  pnlVid2.Width   := 154;

  lblCam2.Left    := 56;
  lblCam2.Top     := 78;

  pnlLonceng2.Height  := 20;
  pnlLonceng2.Width   := 20;
  pnlLonceng2.Left    := 108;
  pnlLonceng2.Top     := 76;

  pnlRec2.Height  := 20;
  pnlRec2.Width   := 20;
  pnlRec2.Left    := 130;
  pnlRec2.Top     := 76;
  {$ENDREGION}

  {$REGION ' Camera 3 ' }
  pnlVid3.Top     := 225;
  pnlVid3.Left    := 8;
  pnlVid3.Height  := 100;
  pnlVid3.Width   := 154;

  lblCam3.Left    := 56;
  lblCam3.Top     := 78;

  pnlLonceng3.Height  := 20;
  pnlLonceng3.Width   := 20;
  pnlLonceng3.Left    := 108;
  pnlLonceng3.Top     := 76;

  pnlRec3.Height  := 20;
  pnlRec3.Width   := 20;
  pnlRec3.Left    := 130;
  pnlRec3.Top     := 76;
  {$ENDREGION}

  {$REGION ' Camera 4 ' }
  pnlVid4.Top     := 334;
  pnlVid4.Left    := 8;
  pnlVid4.Height  := 100;
  pnlVid4.Width   := 154;

  lblCam4.Left    := 56;
  lblCam4.Top     := 78;

  pnlLonceng4.Height  := 20;
  pnlLonceng4.Width   := 20;
  pnlLonceng4.Left    := 108;
  pnlLonceng4.Top     := 76;

  pnlRec4.Height  := 20;
  pnlRec4.Width   := 20;
  pnlRec4.Left    := 130;
  pnlRec4.Top     := 76;
  {$ENDREGION}

  {$REGION ' Camera 6 ' }
  pnlVid6.Top     := 443;
  pnlVid6.Left    := 8;
  pnlVid6.Height  := 100;
  pnlVid6.Width   := 154;

  lblCam6.Left    := 56;
  lblCam6.Top     := 78;

  pnlLonceng6.Height  := 20;
  pnlLonceng6.Width   := 20;
  pnlLonceng6.Left    := 108;
  pnlLonceng6.Top     := 76;

  pnlRec6.Height  := 20;
  pnlRec6.Width   := 20;
  pnlRec6.Left    := 130;
  pnlRec6.Top     := 76;

  {$ENDREGION}

  {$REGION ' Camera 7 ' }
  pnlVid7.Top     := 551;
  pnlVid7.Left    := 8;
  pnlVid7.Height  := 100;
  pnlVid7.Width   := 154;

  lblCam7.Left    := 56;
  lblCam7.Top     := 78;

  pnlLonceng7.Height  := 20;
  pnlLonceng7.Width   := 20;
  pnlLonceng7.Left    := 108;
  pnlLonceng7.Top     := 76;

  pnlRec7.Height  := 20;
  pnlRec7.Width   := 20;
  pnlRec7.Left    := 130;
  pnlRec7.Top     := 76;

  lblNoVideo7.Font.Size := 10;
  lblNoVideo7.Left := 43;
  lblNoVideo7.Top := 42;
  {$ENDREGION}

  {$REGION ' Camera 8 ' }
  pnlVid8.Top     := 660;
  pnlVid8.Left    := 8;
  pnlVid8.Height  := 100;
  pnlVid8.Width   := 154;

  lblCam8.Left    := 56;
  lblCam8.Top     := 78;

  pnlLonceng8.Height  := 20;
  pnlLonceng8.Width   := 20;
  pnlLonceng8.Left    := 108;
  pnlLonceng8.Top     := 76;

  pnlRec8.Height  := 20;
  pnlRec8.Width   := 20;
  pnlRec8.Left    := 130;
  pnlRec8.Top     := 76;

  lblNoVideo8.Font.Size := 10;
  lblNoVideo8.Left := 43;
  lblNoVideo8.Top := 42;
  {$ENDREGION}

end;

procedure TuMainForm.ZoomCam6Click(Sender: TObject);
begin
  {$REGION ' Camera 6 Besar' }
  pnlVid6.Top     := 8;
  pnlVid6.Left    := 168;
  pnlVid6.Height  := 753;
  pnlVid6.Width   := 848;

  lblCam6.Left    := 725;
  lblCam6.Top     := 724;

  pnlLonceng6.Height  := 30;
  pnlLonceng6.Width   := 30;
  pnlLonceng6.Left    := 779;
  pnlLonceng6.Top     := 717;

  pnlRec6.Height  := 30;
  pnlRec6.Width   := 30;
  pnlRec6.Left    := 811;
  pnlRec6.Top     := 717;
  {$ENDREGION}

  {$REGION ' Camera 1 ' }
  pnlVid1.Top     := 8;
  pnlVid1.Left    := 8;
  pnlVid1.Height  := 100;
  pnlVid1.Width   := 154;

  lblCam1.Left    := 56;
  lblCam1.Top     := 78;

  pnlLonceng1.Height  := 20;
  pnlLonceng1.Width   := 20;
  pnlLonceng1.Left    := 108;
  pnlLonceng1.Top     := 76;

  pnlRec1.Height  := 20;
  pnlRec1.Width   := 20;
  pnlRec1.Left    := 130;
  pnlRec1.Top     := 76;
  {$ENDREGION}

  {$REGION ' Camera 2 ' }
  pnlVid2.Top     := 117;
  pnlVid2.Left    := 8;
  pnlVid2.Height  := 100;
  pnlVid2.Width   := 154;

  lblCam2.Left    := 56;
  lblCam2.Top     := 78;

  pnlLonceng2.Height  := 20;
  pnlLonceng2.Width   := 20;
  pnlLonceng2.Left    := 108;
  pnlLonceng2.Top     := 76;

  pnlRec2.Height  := 20;
  pnlRec2.Width   := 20;
  pnlRec2.Left    := 130;
  pnlRec2.Top     := 76;
  {$ENDREGION}

  {$REGION ' Camera 3 ' }
  pnlVid3.Top     := 225;
  pnlVid3.Left    := 8;
  pnlVid3.Height  := 100;
  pnlVid3.Width   := 154;

  lblCam3.Left    := 56;
  lblCam3.Top     := 78;

  pnlLonceng3.Height  := 20;
  pnlLonceng3.Width   := 20;
  pnlLonceng3.Left    := 108;
  pnlLonceng3.Top     := 76;

  pnlRec3.Height  := 20;
  pnlRec3.Width   := 20;
  pnlRec3.Left    := 130;
  pnlRec3.Top     := 76;
  {$ENDREGION}

  {$REGION ' Camera 4 ' }
  pnlVid4.Top     := 334;
  pnlVid4.Left    := 8;
  pnlVid4.Height  := 100;
  pnlVid4.Width   := 154;

  lblCam4.Left    := 56;
  lblCam4.Top     := 78;

  pnlLonceng4.Height  := 20;
  pnlLonceng4.Width   := 20;
  pnlLonceng4.Left    := 108;
  pnlLonceng4.Top     := 76;

  pnlRec4.Height  := 20;
  pnlRec4.Width   := 20;
  pnlRec4.Left    := 130;
  pnlRec4.Top     := 76;
  {$ENDREGION}

  {$REGION ' Camera 5 ' }
  pnlVid5.Top     := 443;
  pnlVid5.Left    := 8;
  pnlVid5.Height  := 100;
  pnlVid5.Width   := 154;

  lblCam5.Left    := 56;
  lblCam5.Top     := 78;

  pnlLonceng5.Height  := 20;
  pnlLonceng5.Width   := 20;
  pnlLonceng5.Left    := 108;
  pnlLonceng5.Top     := 76;

  pnlRec5.Height  := 20;
  pnlRec5.Width   := 20;
  pnlRec5.Left    := 130;
  pnlRec5.Top     := 76;

  {$ENDREGION}

  {$REGION ' Camera 7 ' }
  pnlVid7.Top     := 551;
  pnlVid7.Left    := 8;
  pnlVid7.Height  := 100;
  pnlVid7.Width   := 154;

  lblCam7.Left    := 56;
  lblCam7.Top     := 78;

  pnlLonceng7.Height  := 20;
  pnlLonceng7.Width   := 20;
  pnlLonceng7.Left    := 108;
  pnlLonceng7.Top     := 76;

  pnlRec7.Height  := 20;
  pnlRec7.Width   := 20;
  pnlRec7.Left    := 130;
  pnlRec7.Top     := 76;

  lblNoVideo7.Font.Size := 10;
  lblNoVideo7.Left := 43;
  lblNoVideo7.Top := 42;
  {$ENDREGION}

  {$REGION ' Camera 8 ' }
  pnlVid8.Top     := 660;
  pnlVid8.Left    := 8;
  pnlVid8.Height  := 100;
  pnlVid8.Width   := 154;

  lblCam8.Left    := 56;
  lblCam8.Top     := 78;

  pnlLonceng8.Height  := 20;
  pnlLonceng8.Width   := 20;
  pnlLonceng8.Left    := 108;
  pnlLonceng8.Top     := 76;

  pnlRec8.Height  := 20;
  pnlRec8.Width   := 20;
  pnlRec8.Left    := 130;
  pnlRec8.Top     := 76;

  lblNoVideo8.Font.Size := 10;
  lblNoVideo8.Left := 43;
  lblNoVideo8.Top := 42;
  {$ENDREGION}

end;

procedure TuMainForm.ZoomCam7Click(Sender: TObject);
begin
  {$REGION ' Camera 7 Besar' }
  pnlVid7.Top     := 8;
  pnlVid7.Left    := 168;
  pnlVid7.Height  := 753;
  pnlVid7.Width   := 848;

  lblCam7.Left    := 725;
  lblCam7.Top     := 724;

  pnlLonceng7.Height  := 30;
  pnlLonceng7.Width   := 30;
  pnlLonceng7.Left    := 779;
  pnlLonceng7.Top     := 717;

  pnlRec7.Height  := 30;
  pnlRec7.Width   := 30;
  pnlRec7.Left    := 811;
  pnlRec7.Top     := 717;

  lblNoVideo7.Font.Size := 48;
  lblNoVideo7.Left := 241;
  lblNoVideo7.Top := 338;
  {$ENDREGION}

  {$REGION ' Camera 1 ' }
  pnlVid1.Top     := 8;
  pnlVid1.Left    := 8;
  pnlVid1.Height  := 100;
  pnlVid1.Width   := 154;

  lblCam1.Left    := 56;
  lblCam1.Top     := 78;

  pnlLonceng1.Height  := 20;
  pnlLonceng1.Width   := 20;
  pnlLonceng1.Left    := 108;
  pnlLonceng1.Top     := 76;

  pnlRec1.Height  := 20;
  pnlRec1.Width   := 20;
  pnlRec1.Left    := 130;
  pnlRec1.Top     := 76;
  {$ENDREGION}

  {$REGION ' Camera 2 ' }
  pnlVid2.Top     := 117;
  pnlVid2.Left    := 8;
  pnlVid2.Height  := 100;
  pnlVid2.Width   := 154;

  lblCam2.Left    := 56;
  lblCam2.Top     := 78;

  pnlLonceng2.Height  := 20;
  pnlLonceng2.Width   := 20;
  pnlLonceng2.Left    := 108;
  pnlLonceng2.Top     := 76;

  pnlRec2.Height  := 20;
  pnlRec2.Width   := 20;
  pnlRec2.Left    := 130;
  pnlRec2.Top     := 76;
  {$ENDREGION}

  {$REGION ' Camera 3 ' }
  pnlVid3.Top     := 225;
  pnlVid3.Left    := 8;
  pnlVid3.Height  := 100;
  pnlVid3.Width   := 154;

  lblCam3.Left    := 56;
  lblCam3.Top     := 78;

  pnlLonceng3.Height  := 20;
  pnlLonceng3.Width   := 20;
  pnlLonceng3.Left    := 108;
  pnlLonceng3.Top     := 76;

  pnlRec3.Height  := 20;
  pnlRec3.Width   := 20;
  pnlRec3.Left    := 130;
  pnlRec3.Top     := 76;
  {$ENDREGION}

  {$REGION ' Camera 4 ' }
  pnlVid4.Top     := 334;
  pnlVid4.Left    := 8;
  pnlVid4.Height  := 100;
  pnlVid4.Width   := 154;

  lblCam4.Left    := 56;
  lblCam4.Top     := 78;

  pnlLonceng4.Height  := 20;
  pnlLonceng4.Width   := 20;
  pnlLonceng4.Left    := 108;
  pnlLonceng4.Top     := 76;

  pnlRec4.Height  := 20;
  pnlRec4.Width   := 20;
  pnlRec4.Left    := 130;
  pnlRec4.Top     := 76;
  {$ENDREGION}

  {$REGION ' Camera 5 ' }
  pnlVid5.Top     := 443;
  pnlVid5.Left    := 8;
  pnlVid5.Height  := 100;
  pnlVid5.Width   := 154;

  lblCam5.Left    := 56;
  lblCam5.Top     := 78;

  pnlLonceng5.Height  := 20;
  pnlLonceng5.Width   := 20;
  pnlLonceng5.Left    := 108;
  pnlLonceng5.Top     := 76;

  pnlRec5.Height  := 20;
  pnlRec5.Width   := 20;
  pnlRec5.Left    := 130;
  pnlRec5.Top     := 76;

  {$ENDREGION}

  {$REGION ' Camera 6 ' }
  pnlVid6.Top     := 551;
  pnlVid6.Left    := 8;
  pnlVid6.Height  := 100;
  pnlVid6.Width   := 154;

  lblCam6.Left    := 56;
  lblCam6.Top     := 78;

  pnlLonceng6.Height  := 20;
  pnlLonceng6.Width   := 20;
  pnlLonceng6.Left    := 108;
  pnlLonceng6.Top     := 76;

  pnlRec6.Height  := 20;
  pnlRec6.Width   := 20;
  pnlRec6.Left    := 130;
  pnlRec6.Top     := 76;

  {$ENDREGION}

  {$REGION ' Camera 8 ' }
  pnlVid8.Top     := 660;
  pnlVid8.Left    := 8;
  pnlVid8.Height  := 100;
  pnlVid8.Width   := 154;

  lblCam8.Left    := 56;
  lblCam8.Top     := 78;

  pnlLonceng8.Height  := 20;
  pnlLonceng8.Width   := 20;
  pnlLonceng8.Left    := 108;
  pnlLonceng8.Top     := 76;

  pnlRec8.Height  := 20;
  pnlRec8.Width   := 20;
  pnlRec8.Left    := 130;
  pnlRec8.Top     := 76;

  lblNoVideo8.Font.Size := 10;
  lblNoVideo8.Left := 43;
  lblNoVideo8.Top := 42;
  {$ENDREGION}

end;

procedure TuMainForm.ZoomCam8Click(Sender: TObject);
begin
  {$REGION ' Camera 8 Besar' }
  pnlVid8.Top     := 8;
  pnlVid8.Left    := 168;
  pnlVid8.Height  := 753;
  pnlVid8.Width   := 848;

  lblCam8.Left    := 725;
  lblCam8.Top     := 724;

  pnlLonceng8.Height  := 30;
  pnlLonceng8.Width   := 30;
  pnlLonceng8.Left    := 779;
  pnlLonceng8.Top     := 717;

  pnlRec8.Height  := 30;
  pnlRec8.Width   := 30;
  pnlRec8.Left    := 811;
  pnlRec8.Top     := 717;

  lblNoVideo8.Font.Size := 48;
  lblNoVideo8.Left := 241;
  lblNoVideo8.Top := 338;
  {$ENDREGION}

  {$REGION ' Camera 1 ' }
  pnlVid1.Top     := 8;
  pnlVid1.Left    := 8;
  pnlVid1.Height  := 100;
  pnlVid1.Width   := 154;

  lblCam1.Left    := 56;
  lblCam1.Top     := 78;

  pnlLonceng1.Height  := 20;
  pnlLonceng1.Width   := 20;
  pnlLonceng1.Left    := 108;
  pnlLonceng1.Top     := 76;

  pnlRec1.Height  := 20;
  pnlRec1.Width   := 20;
  pnlRec1.Left    := 130;
  pnlRec1.Top     := 76;
  {$ENDREGION}

  {$REGION ' Camera 2 ' }
  pnlVid2.Top     := 117;
  pnlVid2.Left    := 8;
  pnlVid2.Height  := 100;
  pnlVid2.Width   := 154;

  lblCam2.Left    := 56;
  lblCam2.Top     := 78;

  pnlLonceng2.Height  := 20;
  pnlLonceng2.Width   := 20;
  pnlLonceng2.Left    := 108;
  pnlLonceng2.Top     := 76;

  pnlRec2.Height  := 20;
  pnlRec2.Width   := 20;
  pnlRec2.Left    := 130;
  pnlRec2.Top     := 76;
  {$ENDREGION}

  {$REGION ' Camera 3 ' }
  pnlVid3.Top     := 225;
  pnlVid3.Left    := 8;
  pnlVid3.Height  := 100;
  pnlVid3.Width   := 154;

  lblCam3.Left    := 56;
  lblCam3.Top     := 78;

  pnlLonceng3.Height  := 20;
  pnlLonceng3.Width   := 20;
  pnlLonceng3.Left    := 108;
  pnlLonceng3.Top     := 76;

  pnlRec3.Height  := 20;
  pnlRec3.Width   := 20;
  pnlRec3.Left    := 130;
  pnlRec3.Top     := 76;
  {$ENDREGION}

  {$REGION ' Camera 4 ' }
  pnlVid4.Top     := 334;
  pnlVid4.Left    := 8;
  pnlVid4.Height  := 100;
  pnlVid4.Width   := 154;

  lblCam4.Left    := 56;
  lblCam4.Top     := 78;

  pnlLonceng4.Height  := 20;
  pnlLonceng4.Width   := 20;
  pnlLonceng4.Left    := 108;
  pnlLonceng4.Top     := 76;

  pnlRec4.Height  := 20;
  pnlRec4.Width   := 20;
  pnlRec4.Left    := 130;
  pnlRec4.Top     := 76;
  {$ENDREGION}

  {$REGION ' Camera 5 ' }
  pnlVid5.Top     := 443;
  pnlVid5.Left    := 8;
  pnlVid5.Height  := 100;
  pnlVid5.Width   := 154;

  lblCam5.Left    := 56;
  lblCam5.Top     := 78;

  pnlLonceng5.Height  := 20;
  pnlLonceng5.Width   := 20;
  pnlLonceng5.Left    := 108;
  pnlLonceng5.Top     := 76;

  pnlRec5.Height  := 20;
  pnlRec5.Width   := 20;
  pnlRec5.Left    := 130;
  pnlRec5.Top     := 76;

  {$ENDREGION}

  {$REGION ' Camera 6 ' }
  pnlVid6.Top     := 551;
  pnlVid6.Left    := 8;
  pnlVid6.Height  := 100;
  pnlVid6.Width   := 154;

  lblCam6.Left    := 56;
  lblCam6.Top     := 78;

  pnlLonceng6.Height  := 20;
  pnlLonceng6.Width   := 20;
  pnlLonceng6.Left    := 108;
  pnlLonceng6.Top     := 76;

  pnlRec6.Height  := 20;
  pnlRec6.Width   := 20;
  pnlRec6.Left    := 130;
  pnlRec6.Top     := 76;

  {$ENDREGION}

  {$REGION ' Camera 7 ' }
  pnlVid7.Top     := 660;
  pnlVid7.Left    := 8;
  pnlVid7.Height  := 100;
  pnlVid7.Width   := 154;

  lblCam7.Left    := 56;
  lblCam7.Top     := 78;

  pnlLonceng7.Height  := 20;
  pnlLonceng7.Width   := 20;
  pnlLonceng7.Left    := 108;
  pnlLonceng7.Top     := 76;

  pnlRec7.Height  := 20;
  pnlRec7.Width   := 20;
  pnlRec7.Left    := 130;
  pnlRec7.Top     := 76;

  lblNoVideo7.Font.Size := 10;
  lblNoVideo7.Left := 43;
  lblNoVideo7.Top := 42;
  {$ENDREGION}

 end;

procedure TuMainForm.Button1Click(Sender: TObject);
begin
  ShowMessage('lebar : '+FloatToStr(uMainForm.Width)+ '' + 'Tinggi : '+Floattostr(uMainForm.Height));
end;

procedure TuMainForm.tmr1Timer(Sender: TObject);
begin
  lblVid1.Caption := FormatDateTime('dddd, dd/mm/yyyy hh:nn:ss',now);
  lblVid2.Caption := FormatDateTime('dddd, dd/mm/yyyy hh:nn:ss',now);
  lblVid3.Caption := FormatDateTime('dddd, dd/mm/yyyy hh:nn:ss',now);
  lblVid4.Caption := FormatDateTime('dddd, dd/mm/yyyy hh:nn:ss',now);
  lblVid5.Caption := FormatDateTime('dddd, dd/mm/yyyy hh:nn:ss',now);
  lblVid6.Caption := FormatDateTime('dddd, dd/mm/yyyy hh:nn:ss',now);
  lblVid7.Caption := FormatDateTime('dddd, dd/mm/yyyy hh:nn:ss',now);
  lblVid8.Caption := FormatDateTime('dddd, dd/mm/yyyy hh:nn:ss',now);
end;

end.
