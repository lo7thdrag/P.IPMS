unit ufrmShorePanel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RzBmpBtn, VrControls, VrRotarySwitch,
  Vcl.StdCtrls, VrAngularMeter, Vcl.ExtCtrls, Vcl.Imaging.pngimage,

  uGenerator, uSwitchboard;

type
  TfrmShorePanel = class(TForm)
    pnlShoreConnection: TPanel;
    Image2: TImage;
    Image1: TImage;
    Image6: TImage;
    Image4: TImage;
    pnlA: TPanel;
    VraAmpere1: TVrAngularMeter;
    Label9: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label16: TLabel;
    VraAmpere2: TVrAngularMeter;
    pnlkW: TPanel;
    VraPower: TVrAngularMeter;
    Label20: TLabel;
    Label19: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    VrShoreMode: TVrRotarySwitch;
    VrRotarySwitch3: TVrRotarySwitch;
    Image8: TImage;
    ImgIndicatorCBOpen: TImage;
    ImgIndicatorCBClose: TImage;
    tmrAmpere: TTimer;
    imgSync: TImage;
    img24: TImage;
    imgUbb: TImage;
    imgU: TImage;
    imgUGen: TImage;
    Panel1: TPanel;
    lblVoltageBusbar: TLabel;
    lblFrequency: TLabel;
    lblVoltage: TLabel;
    lblCosphi: TLabel;
    img1: TImage;
    img2: TImage;
    img3: TImage;
    img4: TImage;
    img5: TImage;
    img6: TImage;
    img7: TImage;
    img8: TImage;
    img9: TImage;
    img10: TImage;
    img11: TImage;
    img12: TImage;
    img13: TImage;
    img14: TImage;
    img15: TImage;
    img16: TImage;
    img17: TImage;
    img18: TImage;
    img19: TImage;
    img20: TImage;
    img21: TImage;
    img22: TImage;
    img23: TImage;
    tmrSync: TTimer;
    Label5: TLabel;
    Label6: TLabel;
    procedure ImgIndicatorCBOpenClick(Sender: TObject);
    procedure ImgIndicatorCBCloseClick(Sender: TObject);
    procedure tmrAmpereTimer(Sender: TObject);
    procedure VrShoreModeChange(Sender: TObject);
    procedure tmrSyncTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    IndSync : array of TImage;
    CurrentIndex : Integer;
    StopIndex : Integer;
    Loop : Integer;

    procedure IndicatorSync;
  public
    OrderAmpere : Double;
    Generator : TGenerator;
    Switchboard : TSwitchboard;

    procedure UpdateForm(Switchboard : TSwitchboard);
  end;

var
  frmShorePanel: TfrmShorePanel;

implementation

uses
  uMainSwitchBoardSystem;

{$R *.dfm}

procedure TfrmShorePanel.FormCreate(Sender: TObject);
begin
  if not MainSwitchBoardSystem.Freezed then
  begin
    IndicatorSync;
  end;

  {Create Generator Temporary}
  Generator := TGenerator.Create;
  Generator.Identifier := MainSwitchBoardSystem.IdGenerator;
  Generator.GeneratorState := 1;
end;

procedure TfrmShorePanel.ImgIndicatorCBCloseClick(Sender: TObject);
begin
  MainSwitchBoardSystem.CBShore(True);

  tmrSync.Enabled:= True;
  CurrentIndex := 0;
  Loop := 0;
  StopIndex := 24;

end;

procedure TfrmShorePanel.ImgIndicatorCBOpenClick(Sender: TObject);
begin
  MainSwitchBoardSystem.CBShore(False);
end;

procedure TfrmShorePanel.IndicatorSync;
begin
  if MainSwitchBoardSystem.Freezed then
    Exit;

  IndSync := [img1, img2, img3, img4, img5, img6, img7, img8, img9, img10,
              img11, img12, img13, img14, img15, img16, img17, img18, img19, img20,
              img21, img22, img23, img24, imgSync];

  CurrentIndex := 0;
  StopIndex := 25;
  Loop := 0;
  tmrSync.Enabled := True;

end;

procedure TfrmShorePanel.tmrAmpereTimer(Sender: TObject);
begin
  if vraAmpere1.Position > OrderAmpere then
  begin
    vraAmpere1.Position := vraAmpere1.Position - 1;
  end
  else if vraAmpere1.Position < OrderAmpere then
  begin
    vraAmpere1.Position := vraAmpere1.Position + 1;
  end
  else
  begin
    tmrAmpere.Enabled := False;
  end;
end;

procedure TfrmShorePanel.tmrSyncTimer(Sender: TObject);
var
  i : Integer;
begin
  if MainSwitchBoardSystem.Freezed then
    Exit;

  IndSync[CurrentIndex].Visible := True;

  if (CurrentIndex = StopIndex) and (Loop >= 1) then
  begin
    tmrSync.Enabled := False;
    for i := 0 to 23 do
      IndSync[i].Visible := False;

    img24.Visible := True;
    imgSync.Visible := True;
    imgUbb.Visible := True;
    imgUGen.Visible := True;
  end
  else
  begin
    imgSync.Visible := False;
    imgUbb.Visible := False;
    imgUGen.Visible := False;

    Inc(currentIndex);
    if CurrentIndex > High(IndSync) then
    begin
      for i := 0 to High(IndSync) do
        IndSync[i].Visible := False;

      CurrentIndex := 0;
      inc(Loop);
    end;
  end;
end;

procedure TfrmShorePanel.UpdateForm(Switchboard : TSwitchboard);
begin
  if Switchboard.ShoreInterconnectionMode = 1 then
  begin
    VrShoreMode.SwitchPosition := 0;
  end
  else if Switchboard.ShoreInterconnectionMode = 2 then
  begin
    VrShoreMode.SwitchPosition := 1;
  end
  else
  begin
    VrShoreMode.SwitchPosition := 2;

    CurrentIndex := 0;
    Loop := 0;
    StopIndex := 24;
  end;

  if Switchboard.ShoresbCircuitBreaker = True then
  begin
    ImgIndicatorCBClose.Visible := False;
    ImgIndicatorCBOpen.Visible := True;
  end
  else
  begin
    ImgIndicatorCBClose.Visible := True;
    ImgIndicatorCBOpen.Visible := False;
  end;

end;

procedure TfrmShorePanel.VrShoreModeChange(Sender: TObject);
begin
  if VrShoreMode.SwitchPosition = 0 then
  begin
    MainSwitchBoardSystem.ShoreMode(1);
  end
  else if VrShoreMode.SwitchPosition = 1 then
  begin
    MainSwitchBoardSystem.ShoreMode(2);
  end
  else
  begin
    MainSwitchBoardSystem.ShoreMode(3);
  end;
end;

end.
