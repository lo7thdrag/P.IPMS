unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RzBmpBtn, Vcl.StdCtrls, VrControls,
  VrAngularMeter, Vcl.ExtCtrls;

type
  TfrmMachineRight = class(TForm)
    Panel1: TPanel;
    imgpsimgtelegrapps: TImage;
    PanelSpedometer: TPanel;
    Image3: TImage;
    VrAngularMeter4: TVrAngularMeter;
    pnlCPPpersen: TPanel;
    VrAngularMeter3: TVrAngularMeter;
    Label15: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label21: TLabel;
    pnlRPMMESPEED: TPanel;
    VrAngularMeter1: TVrAngularMeter;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label20: TLabel;
    pnlRPMSHAFTSPEED: TPanel;
    VrAngularMeter2: TVrAngularMeter;
    Label9: TLabel;
    Label10: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label19: TLabel;
    pnlartboard1: TPanel;
    Image2: TImage;
    imgOP1: TImage;
    ImgOP2: TImage;
    ImgCFP2: TImage;
    ImgHLP1: TImage;
    ImgCFP1: TImage;
    ImgPFP1: TImage;
    ImgPFP2: TImage;
    ImgHLP2: TImage;
    ImgPowerFP1: TImage;
    ImgPowerFP2: TImage;
    ImgPFS: TImage;
    ImgPFC1: TImage;
    ImgPFC2: TImage;
    ImgLOLP1: TImage;
    ImgLOLP2: TImage;
    ImgST: TImage;
    ImgAuxdible: TImage;
  private
    { Private declarations }
  public
  FAlarmIndicator : array[0..16] of Boolean;

  procedure SetAlarmIndicator;
    { Public declarations }
  end;

var
  frmMachineRight: TfrmMachineRight;

implementation

{$R *.dfm}

{ TfrmMachineRight }

procedure TfrmMachineRight.SetAlarmIndicator;
begin
    imgOP1.Visible        := not FAlarmIndicator[0];
    ImgPFP1.Visible       := not FAlarmIndicator[1];
    ImgPFS.Visible        := not FAlarmIndicator[2];
    ImgLOLP1.Visible      := not FAlarmIndicator[3];
    ImgLOLP2.Visible      := not FAlarmIndicator[4];
    ImgST.Visible         := not FAlarmIndicator[5];
    imgOP2.Visible        := not FAlarmIndicator[6];
    ImgPFP2.Visible       := not FAlarmIndicator[7];
    ImgPFC1.Visible       := not FAlarmIndicator[8];
    ImgHLP1.Visible       := not FAlarmIndicator[9];
    ImgHLP2.Visible       := not FAlarmIndicator[10];
    ImgPFC2.Visible       := not FAlarmIndicator[11];
    ImgCFP1.Visible       := not FAlarmIndicator[12];
    ImgPowerFP1.Visible   := not FAlarmIndicator[13];
    ImgAuxdible.Visible   := not FAlarmIndicator[14];
    ImgCFP2.Visible       := not FAlarmIndicator[15];
    ImgPowerFP2.Visible   := not FAlarmIndicator[16];
end;

end.
