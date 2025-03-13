unit uStartScenario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TFlatEditUnit, ExtCtrls, TFlatPanelUnit, SLStreamTypes,
  SLComponentCollection, LPDrawLayers, LPTransparentControl, ULBasicControl,
  ILGlassPanel, AdvSmoothPanel, AdvSmoothLabel, CurvyControls, AdvSmoothListBox,
  AdvSmoothComboBox;

type
  TfrmStartScenario = class(TForm)
    AdvSmoothPanel3: TAdvSmoothPanel;
    AdvSmoothLabel1: TAdvSmoothLabel;
    AdvSmoothLabel2: TAdvSmoothLabel;
    AdvSmoothLabel3: TAdvSmoothLabel;
    AdvSmoothLabel4: TAdvSmoothLabel;
    AdvSmoothLabel5: TAdvSmoothLabel;
    AdvSmoothLabel6: TAdvSmoothLabel;
    AdvSmoothLabel7: TAdvSmoothLabel;
    AdvSmoothLabel8: TAdvSmoothLabel;
    crvyScenarioFilter1: TCurvyEdit;
    crvyScenarioFilter2: TCurvyEdit;
    crvyScenarioFilter3: TCurvyEdit;
    CurvyMemo1: TCurvyMemo;
    CurvyMemo2: TCurvyMemo;
    CurvyMemo3: TCurvyMemo;
    CurvyMemo4: TCurvyMemo;
    cbb1: TComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmStartScenario: TfrmStartScenario;

implementation

{$R *.dfm}

end.
