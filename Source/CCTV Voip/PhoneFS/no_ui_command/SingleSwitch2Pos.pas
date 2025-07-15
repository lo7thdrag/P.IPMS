unit SingleSwitch2Pos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CPort, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.Generics.Collections,

  uNetUDPnode,
  //uUDPDatatype, uNetwork_Data_TCMS,

  UBinaryPacketizer;

const
  HIGH_STATE: Byte = $01;
  LOW_STATE: Byte = $00;

  LED_ON: Byte = $01;
  LED_OFF: Byte = $00;

  BUTTON_PRESSED: Byte = $00;
  BUTTON_NOT_PRESSED: Byte = $01;

  ON_BUTTON_DOWN: Byte = $00;
  ON_BUTTON_UP: Byte = $01;

  NumberOfButton = 32;
  BufferSize = 256;

  LCN_CODE: Byte = 200;
  LSN_CODE: Byte = 201;
  LCA_CODE: Byte = 202;
  LSA_CODE: Byte = 203;

  BSN_CODE: Byte = 204;

  TComExceptionsString: array [0 .. 24] of string = ('CE_OpenFailed',
    'CE_WriteFailed', 'CE_ReadFailed', 'CE_InvalidAsync', 'CE_PurgeFailed',
    'CE_AsyncCheck', 'CE_SetStateFailed', 'CE_TimeoutsFailed',
    'CE_SetupComFailed', 'CE_ClearComFailed', 'CE_ModemStatFailed',
    'CE_EscapeComFailed', 'CE_TransmitFailed', 'CE_ConnChangeProp',
    'CE_EnumPortsFailed', 'CE_StoreFailed', 'CE_LoadFailed', 'CE_RegFailed',
    'CE_LedStateFailed', 'CE_ThreadCreated', 'CE_WaitFailed', 'CE_HasLink',
    'CE_RegError', 'CEPortNotOpen', 'CE_PortDisconnected');

type
  {
  TRec_Change_CAP_State = record
    pid : TPacketID;
    SessionID : Integer;
    OrderId: Integer;
    Eff_Id : Byte;
    Eff_State: Byte;
  end;
  }
  TLEDStateArray = array [0 .. NumberOfButton - 1] of Boolean;
  TLEDArray = array [0 .. NumberOfButton - 1] of TShape;
  TButtonArray = array [0 .. NumberOfButton - 1] of TShape;
  TTimerArray = array [0 .. NumberOfButton - 1] of TTimer;

  TfrmComBtn = class(TForm)
    btnConnect: TButton;
    Log: TMemo;
    btno01Off: TButton;
    ComPort1: TComPort;
    btn01On: TButton;
    Panel1: TPanel;
    GroupBox9: TGroupBox;
    TmrGetMessage: TTimer;
    edtCOMPort: TEdit;
    lblPort: TLabel;
    btn01: TGroupBox;
    btn02: TGroupBox;
    ShapeButton01: TShape;
    ShapeButton02: TShape;
    shapeLed02: TShape;
    shapeLed01: TShape;
    Timer1: TTimer;
    Timer2: TTimer;
    procedure btnConnectClick(Sender: TObject);
    procedure btno01OffClick(Sender: TObject);
    procedure btn01OnClick(Sender: TObject);
    procedure ComPort1RxChar(Sender: TObject; Count: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TmrGetMessageTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TimerTimer(Sender: TObject);
  private

    { Private declarations }
    Packetizer: TBinaryPacketizer;

    MessageQueue: TQueue<TBytes>;

    ReceivedBuffer: TBytes;

    isComPortConnected: Boolean;

    LEDStateArray: TLEDStateArray;
    LEDArray: TLEDArray;
    ButtonArray: TButtonArray;

    TimerArray: TTimerArray;

    procedure Build_Send_Command(var Buff: TBytes; Code: Byte; Number: Byte;
      State: Cardinal);

    procedure DecodeArray(Input: Cardinal; var arr: TLEDStateArray; Len: Byte);

    procedure OnPacketReceivedHandler(Packet: TBytes);

    procedure ToggleComConnection;
    function OpenComPort(APort: string): Boolean;
    function CloseComPort: Boolean;

    procedure MapVisual;
    procedure SetLEDState(Number: Byte; State: Cardinal);
    procedure SetLEDDisplay(Number: Byte; State: Boolean);
    procedure UpdateLEDDisplay;
    procedure SetButtonState(Number: Byte; State: Byte);

    procedure InitVisual;

    procedure shapeLedMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

  public
    { Public declarations }
    procedure Init;

  end;

var
  frmComBtn: TfrmComBtn;

implementation

uses
  uIpmsHandledPhone, uSocketHandle;

{$R *.dfm}

function EncodeByte(b0: Byte; b1: Byte; b2: Byte; b3: Byte): Cardinal;
begin
  Result := Cardinal((b3 shl 24) or (b2 shl 16) or (b1 shl 8) or b0);
end;

procedure ExtractByte(State: Cardinal; var b0: Byte; var b1: Byte; var b2: Byte;
  var b3: Byte);
begin
  b0 := (State and $FF);
  b1 := (State and $FF00) shr 8;
  b2 := (State and $FF0000) shr 16;
  b3 := (State and $FF000000) shr 24;
end;

procedure TfrmComBtn.Build_Send_Command(var Buff: TBytes; Code: Byte;
  Number: Byte; State: Cardinal);
var
  Abytes: TBytes;
  b0, b1, b2, b3: Byte;
begin
  SetLength(Abytes, 6);

  ExtractByte(State, b0, b1, b2, b3);

  Abytes[0] := Code;
  Abytes[1] := Number;
  Abytes[2] := b3;
  Abytes[3] := b2;
  Abytes[4] := b1;
  Abytes[5] := b0;
  Packetizer.WrapData(Abytes, Buff);
end;

procedure TfrmComBtn.btnConnectClick(Sender: TObject);
begin
  ToggleComConnection;
end;

procedure TfrmComBtn.btno01OffClick(Sender: TObject);
var
  Abytes: TBytes;
begin
  try
    Build_Send_Command(Abytes, LCA_CODE, 255, LED_OFF);
    ComPort1.Write(Abytes[0], Length(Abytes));
  except
    on E: Exception do
    begin
      Log.Lines.Add(E.Message);
      CloseComPort
    end;
  end;
end;

procedure TfrmComBtn.btn01OnClick(Sender: TObject);
var
  Abytes: TBytes;
begin
  try
    Build_Send_Command(Abytes, LCA_CODE, 255, LED_ON);
    ComPort1.Write(Abytes[0], Length(Abytes));
  except
    on E: Exception do
    begin
      Log.Lines.Add(E.Message);
      CloseComPort
    end;
  end;
end;

procedure TfrmComBtn.ToggleComConnection;
begin
  if not isComPortConnected then
    OpenComPort(edtCOMPort.Text)
  else
    CloseComPort;
end;

function TfrmComBtn.OpenComPort(APort: string): Boolean;
begin
  if not isComPortConnected then
    try
      ComPort1.Port := APort;
      ComPort1.Open;

      isComPortConnected := True;
      btnConnect.Caption := 'Close';
      Log.Lines.Add('Serial connected');
    except
      on E: Exception do
        Log.Lines.Add(E.Message)
    end;
end;

function TfrmComBtn.CloseComPort: Boolean;
begin
  if isComPortConnected then
    try
      isComPortConnected := False;
      btnConnect.Caption := 'Open';
      Log.Lines.Add('Serial disconnected');

      ComPort1.Close;
    except
      on E: Exception do
        Log.Lines.Add(E.Message)
    end;
end;

procedure TfrmComBtn.UpdateLEDDisplay;
var
  i: Integer;
begin
  for i := 0 to NumberOfButton - 1 do
    SetLEDDisplay(i, LEDStateArray[i]);
end;

procedure TfrmComBtn.ComPort1RxChar(Sender: TObject; Count: Integer);
begin
  ComPort1.Read(ReceivedBuffer[0], Count);
  Packetizer.DataReceived(ReceivedBuffer, Count);
end;

procedure TfrmComBtn.DecodeArray(Input: Cardinal; var arr: TLEDStateArray;
  Len: Byte);
var
  i: Integer;
begin
  for i := 0 to Len - 1 do
    if Input and (1 shl i) = 0 then
      arr[i] := False
    else
      arr[i] := True
end;

procedure TfrmComBtn.TimerTimer(Sender: TObject);
begin
  TTimer(Sender).Enabled := False;
  ButtonArray[TTimer(Sender).Tag].Brush.Color := clGray;
end;

procedure TfrmComBtn.TmrGetMessageTimer(Sender: TObject);
var
  Packet: TBytes;
  Code: Byte;
  Number: Byte;
  State0, State1, State2, State3: Byte;
  State: Cardinal;
  //aRec: TRec_Change_CAP_State;
begin
  TmrGetMessage.Enabled := False;

  if MessageQueue.Count > 0 then
  begin
    Packet := MessageQueue.Dequeue;

    Code := Packet[0];
    Number := Packet[1];
    State3 := Packet[2];
    State2 := Packet[3];
    State1 := Packet[4];
    State0 := Packet[5];

    State := EncodeByte(State0, State1, State2, State3);

    Log.Lines.Add('Code: ' + Code.ToString + ', No.: ' + Number.ToString +
      ', State: ' + State.ToString);

    if Code = LSN_CODE then
      SetLEDState(Number, State)
    else if Code = BSN_CODE then
      SetButtonState(Number, State)
    else if Code = LSA_CODE then
    begin
      if Number = 255 then
      begin
        DecodeArray(State, LEDStateArray, NumberOfButton);
        UpdateLEDDisplay;
      end;
    end;

    if Assigned(frmIpmsHandledPhone) then
      frmIpmsHandledPhone.StationCallButtonSel(0);

    {
    // Send to TCMS    inhibit=0, Free=1
    aRec.SessionID := 1111;
    aRec.Eff_Id := 8; // TCapDeviceID(tcdFisOps)
    aRec.Eff_State := State + 1;

    case State of
      0: begin
        aRec.OrderId := CORD_CAP_CHANGE_ALL;
        Log.Lines.Add('Sending CORD_CAP_CHANGE_ALL');
      end;

      1: begin
        aRec.OrderId := CORD_CAP_CHANGE_SINGLE;
        Log.Lines.Add('Sending CORD_CAP_CHANGE_SINGLE');
      end;
    end;

    FTCMS_PKR_3D.SendDataTo('192.168.1.255', CPID_SEND_CHANGE_CAP_STATE, @aRec);
    }
  end;

  TmrGetMessage.Enabled := True;
end;

procedure TfrmComBtn.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if isComPortConnected then
    CloseComPort;
end;

procedure TfrmComBtn.FormCreate(Sender: TObject);
begin

  MapVisual;
  InitVisual;

  isComPortConnected := False;

  Packetizer := TBinaryPacketizer.Create(2048);
  Packetizer.OnPacketReceived := OnPacketReceivedHandler;
  MessageQueue := TQueue<TBytes>.Create;
  SetLength(ReceivedBuffer, BufferSize);

  TmrGetMessage.Interval := 30;
  TmrGetMessage.Enabled := True;

//  edtCOMPort.Text := 'COM5';
//  ComPort1.Port := edtCOMPort.Text;
//  ComPort1.BaudRate := br115200;
//  ComPort1.DataBits := dbEight;
//  ComPort1.StopBits := sbOneStopBit;
//  ComPort1.Parity.Bits := prNone;
//  ComPort1.FlowControl.FlowControl := fcNone;

  {
  FTCMS_PKR_3D := TNetUDPNode.Create;
  FTCMS_PKR_3D.RegisterProcedure(CPID_SEND_CHANGE_CAP_STATE, nil, SizeOf(TRec_Change_CAP_State));
  FTCMS_PKR_3D.Listen('9876');

  Log.Lines.Add('Listening to port ' + FTCMS_PKR_3D.Port.ToString);
  }
end;

procedure TfrmComBtn.FormDestroy(Sender: TObject);
begin
//  FTCMS_PKR_3D.UnregisterAllProcedure;
//  FTCMS_PKR_3D.Free;
  ReceivedBuffer := nil;
  FreeAndNil(MessageQueue);
  FreeAndNil(Packetizer);
end;

procedure TfrmComBtn.Init;
begin

  edtCOMPort.Text := VoipManager.SetConfig.ComPortNr;
  ComPort1.Port := VoipManager.SetConfig.ComPortNr;
  ComPort1.BaudRate := TBaudRate(VoipManager.SetConfig.BaudRate); //13
  ComPort1.DataBits := TDataBits(VoipManager.SetConfig.DataBits); //3
  ComPort1.StopBits := TStopBits(VoipManager.SetConfig.StopBits);//0
  ComPort1.Parity.Bits := TParityBits(VoipManager.SetConfig.ParityBits); //0
  ComPort1.FlowControl.FlowControl := TFlowControl(VoipManager.SetConfig.FlowControl); //2

  if (VoipManager.SetConfig.ComBtnEnabled = 1) then
    ComPort1.Open;

//  ComPort1.BaudRate := br115200;
//  ComPort1.DataBits := dbEight;
//  ComPort1.StopBits := sbOneStopBit;
//  ComPort1.Parity.Bits := prNone;
//  ComPort1.FlowControl.FlowControl := fcNone;
//
//  OpenComPort(ComPort1.Port);
end;

procedure TfrmComBtn.InitVisual;
var
  i: Integer;
begin
  for i := 0 to NumberOfButton - 1 do
  begin
    SetLEDState(i, LED_OFF);
    SetButtonState(i, BUTTON_NOT_PRESSED);
    if (LEDArray[i] <> nil) then
      LEDArray[i].OnMouseUp := shapeLedMouseUp;
  end;
end;

procedure TfrmComBtn.MapVisual;
var
  i: Integer;
begin
  for i := 0 to NumberOfButton - 1 do
  begin
    LEDArray[i] := nil;
    ButtonArray[i] := nil;
    TimerArray[i] := nil;
  end;

  shapeLed01.Tag := 0;
  shapeLed02.Tag := 1;


  LEDArray[0] := shapeLed01;
  LEDArray[1] := shapeLed02;

  ButtonArray[0] := ShapeButton01;
  ButtonArray[1] := ShapeButton02;

  TimerArray[0] := Timer1;
  TimerArray[1] := Timer2;

  Timer1.OnTimer := TimerTimer;
  Timer2.OnTimer := TimerTimer;
end;

procedure TfrmComBtn.OnPacketReceivedHandler(Packet: TBytes);
begin
  MessageQueue.Enqueue(Packet);
end;

procedure TfrmComBtn.SetButtonState(Number, State: Byte);
begin
  if ButtonArray[Number] = nil then
    Exit;

  if State = ON_BUTTON_DOWN then
    ButtonArray[Number].Brush.Color := clRed
  else if State = ON_BUTTON_UP then
    ButtonArray[Number].Brush.Color := clGray;

  if Number = 1 then
  else if Number = 2 then

end;

procedure TfrmComBtn.SetLEDState(Number: Byte; State: Cardinal);
begin
  if LEDArray[Number] = nil then
    Exit;

  if Byte(State) = LED_OFF then
  begin
    LEDArray[Number].Brush.Color := clGray;
    LEDStateArray[Number] := False;
  end
  else if Byte(State) = LED_ON then
  begin
    LEDArray[Number].Brush.Color := clRed;
    LEDStateArray[Number] := True;
  end
end;

procedure TfrmComBtn.SetLEDDisplay(Number: Byte; State: Boolean);
begin
  if LEDArray[Number] = nil then
    Exit;

  if State then
    LEDArray[Number].Brush.Color := clRed
  else
    LEDArray[Number].Brush.Color := clGray
end;

procedure TfrmComBtn.shapeLedMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Abytes: TBytes;
  Idx: Integer;
  State: Byte;
begin
  Idx := TShape(Sender).Tag;
  try
    if LEDStateArray[Idx] then
      State := LED_OFF
    else
      State := LED_ON;
    Build_Send_Command(Abytes, LCN_CODE, Idx, State);
    ComPort1.Write(Abytes[0], Length(Abytes));
  except
    on E: Exception do
    begin
      Log.Lines.Add(E.Message);
      CloseComPort;
    end;
  end;
end;

end.
