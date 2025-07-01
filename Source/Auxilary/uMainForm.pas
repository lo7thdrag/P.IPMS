unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VrControls, VrRotarySwitch, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls,

  uSetting, uListener, uFreezeFrom, uDataType, uPump ;

type
  TfrmMainForm = class(TForm)
    mmoNetLogger: TMemo;
    mmoLogReceive: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
//    FListener : TListeners;

    procedure AuxiliarySystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Integer);overload;
    procedure AuxiliarySystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Boolean);overload;
    procedure AuxiliarySystemEvent(Sender : TObject;PropsID : E_PropsID;Value : Double);overload;
    procedure AuxiliarySystemEvent(Sender : TObject;PropsID : E_PropsID;Value : string);overload;
    procedure AuxiliarySystemEvent(Sender : TObject;PropsID : E_PropsID;Value : TObject);overload;

  public
    pumpTemp : array [0..5] of TPump;

    function GetPumpID(identifier : string) : Integer;

  end;

var
  frmMainForm: TfrmMainForm;

implementation

uses
  uTCPClient, uAuxiliarySystem, ufrmBallastnBilgePump, ufrmSWPumpProvRefrig1, ufrmSWCoolingPumpChiller1,
  ufrmFireFightingPump2, ufrmSWPumpProvRefrig2, ufrmSludge ;

{$R *.dfm}

{$REGION ' Form Procedure '}

procedure TfrmMainForm.FormCreate(Sender: TObject);
var
  i : Integer;

begin

  Setting   := TSetting.Create;
  AuxiliarySystem := TAuxiliarySystem.Create;

//  FListener := TListeners.Create;
  with AuxiliarySystem.Listener.Add('AUXILIARY') as TPropertyEventListener do
  begin
    OnPropertyIntChange := AuxiliarySystemEvent;
    OnPropertyBoolChange := AuxiliarySystemEvent;
    OnPropertyDblChange := AuxiliarySystemEvent;
  end;

  with AuxiliarySystem.Network.Listeners.Add('AUXILIARYNETWORK') as TPropertyEventListener do
  begin
    OnPropertyStringChange:= AuxiliarySystemEvent;
    OnPropertyObjectChange:= AuxiliarySystemEvent;
  end;

  for I := 0 to Length(C_PUMP_ID) - 1 do
  begin
    pumpTemp[i] := TPump.Create;
    pumpTemp[i].Identifier := C_PUMP_ID[i];
    pumpTemp[i].PowerSupply := True;
  end;

end;

procedure TfrmMainForm.FormDestroy(Sender: TObject);
begin
//  FListener.Free;
  AuxiliarySystem.Free;
  Setting.Free;
end;

procedure TfrmMainForm.FormShow(Sender: TObject);
begin
  if AuxiliarySystem.IdConsole = 'AUXILIARY 1' then
  begin
    if not Assigned(frmBallastnBilgePump) then
      frmBallastnBilgePump := TfrmBallastnBilgePump.Create(Self);

    if not Assigned(frmFireFightingPump2) then
      frmFireFightingPump2 := TfrmFireFightingPump2.Create(Self);

    frmBallastnBilgePump.Show;
    frmFireFightingPump2.Show;
  end
  else
  if AuxiliarySystem.IdConsole = 'AUXILIARY 2' then
  begin
    if not Assigned(frmSWPumpProvRefrig1) then
      frmSWPumpProvRefrig1 := TfrmSWPumpProvRefrig1.Create(Self);

    if not Assigned(frmSWPumpProvRefrig2) then
      frmSWPumpProvRefrig2 := TfrmSWPumpProvRefrig2.Create(Self);

    frmSWPumpProvRefrig1.Show;
    frmSWPumpProvRefrig2.Show;
  end
  else
  if AuxiliarySystem.IdConsole = 'AUXILIARY 3' then
  begin
    if not Assigned(frmSWCoolingPumpChiller1) then
      frmSWCoolingPumpChiller1 := TfrmSWCoolingPumpChiller1.Create(Self);

    if not Assigned(frmSludge) then
      frmSludge := TfrmSludge.Create(Self);

    frmSWCoolingPumpChiller1.Show;
    frmSludge.Show;

  end;
end;

{$ENDREGION}

{$REGION ' Event Procedure '}

procedure TfrmMainForm.AuxiliarySystemEvent(Sender: TObject; PropsID: E_PropsID; Value: Integer);
begin
//  case PropsID of
//    epPMSGeneratorEngineRun :
//    begin
//
//    end;
//  end;
end;

procedure TfrmMainForm.AuxiliarySystemEvent(Sender: TObject; PropsID: E_PropsID; Value: Boolean);
begin
  case PropsID of
    epAuxEngineRun :
    begin
      if AuxiliarySystem.IdConsole = 'AUXILIARY 1' then
      begin
        if Assigned(frmBallastnBilgePump) then
        begin
          frmBallastnBilgePump.imgStart.Visible := pumpTemp[0].EngineRun;
          frmBallastnBilgePump.imgStop.Visible := not pumpTemp[0].EngineRun;
        end;

        if Assigned(frmFireFightingPump2) then
        begin
          frmFireFightingPump2.imgStart.Visible := pumpTemp[3].EngineRun;
          frmFireFightingPump2.imgStop.Visible := not pumpTemp[3].EngineRun;
        end;
      end
      else
      if AuxiliarySystem.IdConsole = 'AUXILIARY 2' then
      begin
        if Assigned(frmSWPumpProvRefrig1) then
        begin
          frmSWPumpProvRefrig1.imgStart.Visible := pumpTemp[1].EngineRun;
          frmSWPumpProvRefrig1.imgStop.Visible := not pumpTemp[1].EngineRun;
        end;

        if Assigned(frmSWPumpProvRefrig2) then
        begin
          frmSWPumpProvRefrig2.imgStart.Visible := pumpTemp[4].EngineRun;
          frmSWPumpProvRefrig2.imgStop.Visible := not pumpTemp[4].EngineRun;
        end;
      end
      else
      if AuxiliarySystem.IdConsole = 'AUXILIARY 3' then
      begin
        if Assigned(frmSWCoolingPumpChiller1) then
        begin
          frmSWCoolingPumpChiller1.imgStart.Visible := pumpTemp[2].EngineRun;
          frmSWCoolingPumpChiller1.imgStop.Visible := not pumpTemp[2].EngineRun;
        end;

        if Assigned(frmSludge) then
        begin
          frmSludge.imgStart.Visible := pumpTemp[5].EngineRun;
          frmSludge.imgStop.Visible := not pumpTemp[5].EngineRun;
        end;
      end;
    end;
    epAuxPowerSupply :
    begin
      if AuxiliarySystem.IdConsole = 'AUXILIARY 1' then
      begin
        if Assigned(frmBallastnBilgePump) then
        begin
          if pumpTemp[0].PowerSupply then
          begin
            frmBallastnBilgePump.imgStart.Visible := pumpTemp[0].EngineRun;
            frmBallastnBilgePump.imgStop.Visible := not pumpTemp[0].EngineRun;
          end
          else
          begin
            frmBallastnBilgePump.imgStart.Visible := False;
            frmBallastnBilgePump.imgStop.Visible := False;
          end;
        end;

        if Assigned(frmFireFightingPump2) then
        begin
          if pumpTemp[3].PowerSupply then
          begin
            frmFireFightingPump2.imgStart.Visible := pumpTemp[3].EngineRun;
            frmFireFightingPump2.imgStop.Visible := not pumpTemp[3].EngineRun;
          end
          else
          begin
            frmFireFightingPump2.imgStart.Visible := False;
            frmFireFightingPump2.imgStop.Visible := False;
          end;
        end;
      end
      else
      if AuxiliarySystem.IdConsole = 'AUXILIARY 2' then
      begin
        if Assigned(frmSWPumpProvRefrig1) then
        begin
          if pumpTemp[1].PowerSupply then
          begin
            frmSWPumpProvRefrig1.imgStart.Visible := pumpTemp[1].EngineRun;
            frmSWPumpProvRefrig1.imgStop.Visible := not pumpTemp[1].EngineRun;
          end
          else
          begin
            frmSWPumpProvRefrig1.imgStart.Visible := False;
            frmSWPumpProvRefrig1.imgStop.Visible := False;
          end;
        end;

        if Assigned(frmSWPumpProvRefrig2) then
        begin
          if pumpTemp[4].PowerSupply then
          begin
            frmSWPumpProvRefrig2.imgStart.Visible := pumpTemp[4].EngineRun;
            frmSWPumpProvRefrig2.imgStop.Visible := not pumpTemp[4].EngineRun;
          end
          else
          begin
            frmSWPumpProvRefrig2.imgStart.Visible := False;
            frmSWPumpProvRefrig2.imgStop.Visible := False;
          end;
        end;
      end
      else
      if AuxiliarySystem.IdConsole = 'AUXILIARY 3' then
      begin
        if Assigned(frmSWCoolingPumpChiller1) then
        begin
          if pumpTemp[2].PowerSupply then
          begin
            frmSWCoolingPumpChiller1.imgStart.Visible := pumpTemp[2].EngineRun;
            frmSWCoolingPumpChiller1.imgStop.Visible := not pumpTemp[2].EngineRun;
          end
          else
          begin
            frmSWCoolingPumpChiller1.imgStart.Visible := False;
            frmSWCoolingPumpChiller1.imgStop.Visible := False;
          end;
        end;

        if Assigned(frmSludge) then
        begin
          if pumpTemp[5].PowerSupply then
          begin
            frmSludge.imgStart.Visible := pumpTemp[5].EngineRun;
            frmSludge.imgStop.Visible := not pumpTemp[5].EngineRun;
          end
          else
          begin
            frmSludge.imgStart.Visible := False;
            frmSludge.imgStop.Visible := False;
          end;
        end;
      end;
    end;
  end;
end;

procedure TfrmMainForm.AuxiliarySystemEvent(Sender: TObject; PropsID: E_PropsID; Value: Double);
begin
//  case PropsID of
//    epPMSGeneratorEngineRun :
//    begin
//
//    end;
//  end;
end;

procedure TfrmMainForm.AuxiliarySystemEvent(Sender: TObject; PropsID: E_PropsID; Value: TObject);
begin
  case PropsID of
    epNetworkConnectedToServer: begin
      if mmoNetLogger.Lines.Count>100 then
        mmoNetLogger.Lines.Delete(0);
      mmoNetLogger.Lines.Add('[' + TTCPClient(Value).SocketIdentifier + '] Connected to : ' + TTCPClient(Value).ServerAddress);
    end;
    epNetworkDisconnectedFromServer: begin
      if mmoNetLogger.Lines.Count>100 then
        mmoNetLogger.Lines.Delete(0);
      mmoNetLogger.Lines.Add('[' + TTCPClient(Value).SocketIdentifier + ']Disconnected from : ' + TTCPClient(Value).ServerAddress);
    end;
  end;
end;

procedure TfrmMainForm.AuxiliarySystemEvent(Sender: TObject; PropsID: E_PropsID; Value: string);
begin
  case PropsID of
	  epNetworkLogRcv: begin
	    if mmoLogReceive.Lines.Count>100 then
	      mmoLogReceive.Lines.Delete(0);
	    mmoLogReceive.Lines.Add(Value);
	  end;
	end;
end;

{$ENDREGION}

{$REGION ' Additonal Procedure '}

function TfrmMainForm.GetPumpID(identifier : string): Integer;
var
  i : Integer;

begin
  Result := -1;

  for i := 0 to Length(C_PUMP_ID) - 1 do
  begin
    if pumpTemp[i].Identifier = identifier then
      Result := i;
  end;
end;

{$ENDREGION}

end.
