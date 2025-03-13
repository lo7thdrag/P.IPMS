unit uTankOverview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls;

type
  TfrmTanksOverview = class(TForm)
    imgTankOverview: TImage;
    imgFoLoadTrunk: TImage;
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
    procedure imgFoLoadTrunkMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTanksOverview: TfrmTanksOverview;

implementation
uses uTankOverviewInput, uControllerSystem, uDataType;

{$R *.dfm}

procedure TfrmTanksOverview.imgFoLoadTrunkMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  pt : TPoint;
begin
  if not Assigned(frmTankOverInput) then
    frmTankOverInput := TfrmTankOverInput.Create(Self);

  GetCursorPos(pt);

  frmTankOverInput.setTankIdentifier((TImage(Sender).Hint));
  frmTankOverInput.Top := pt.Y;
  frmTankOverInput.Left := pt.X;
  frmTankOverInput.Show;
end;

end.
