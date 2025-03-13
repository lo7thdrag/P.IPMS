unit uControlPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, jpeg, ExtCtrls, StdCtrls;

type
  TfrmControlPanel = class(TForm)
    pgc1: TPageControl;
    tsERSim: TTabSheet;
    tsNetArchitecture: TTabSheet;
    tsTester: TTabSheet;
    lbl11: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    cbbTNI001L: TComboBox;
    cbbTNI001R: TComboBox;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl18: TLabel;
    lbl19: TLabel;
    lbl20: TLabel;
    lbl21: TLabel;
    lbl22: TLabel;
    lbl23: TLabel;
    lbl24: TLabel;
    lbl25: TLabel;
    lbl26: TLabel;
    lbl27: TLabel;
    lbl28: TLabel;
    lbl29: TLabel;
    lbl30: TLabel;
    lbl31: TLabel;
    lbl32: TLabel;
    lbl33: TLabel;
    grpMCRConsole: TGroupBox;
    cbbTNI003L: TComboBox;
    cbbTNI004L: TComboBox;
    cbbTNI003R: TComboBox;
    cbbTNI004R: TComboBox;
    grpCT_PLANNING: TGroupBox;
    cbbTNI012L: TComboBox;
    cbbTNI010L: TComboBox;
    cbbTNI016L: TComboBox;
    cbbTNI010R: TComboBox;
    cbbTNI012R: TComboBox;
    cbbTNI016R: TComboBox;
    grpBridge: TGroupBox;
    cbbTNI011L: TComboBox;
    cbbTNI011R: TComboBox;
    cbbTNI014L: TComboBox;
    cbbTNI013L: TComboBox;
    cbbTNI002L: TComboBox;
    cbbTNI014R: TComboBox;
    cbbTNI013R: TComboBox;
    cbbTNI002R: TComboBox;
    grpCIC: TGroupBox;
    cbbTNI015L: TComboBox;
    cbbTNI015R: TComboBox;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmControlPanel: TfrmControlPanel;

implementation

uses uERPanel, uMimicPanel, uElementTesterForm;

{$R *.dfm}

procedure TfrmControlPanel.FormCreate(Sender: TObject);
begin

//  frmERPanel := TfrmERPanel.Create(tsERSim);
//  frmERPanel.Parent := tsERSim;
//  frmERPanel.Align := alClient;
//  frmERPanel.BorderStyle := bsNone;
//  frmERPanel.Show;

//  frmMimicPanel := TfrmMimicPanel.Create(tsMimicSystem);
//  frmMimicPanel.Parent := tsMimicSystem;
//  frmMimicPanel.Align := alClient;
//  frmMimicPanel.BorderStyle := bsNone;
//  frmMimicPanel.Show;


//  frmTester := TfrmTester.Create(Self);
//  frmTester.Parent := tsTester;
//  frmTester.Align := alClient;
//  frmTester.BorderStyle := bsNone;
//  frmTester.Show;
end;

end.
