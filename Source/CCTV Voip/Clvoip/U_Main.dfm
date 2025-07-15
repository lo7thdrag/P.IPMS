object MainFrm: TMainFrm
  Left = 517
  Top = 271
  Width = 338
  Height = 168
  Caption = 'MainFrm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    330
    141)
  PixelsPerInch = 96
  TextHeight = 13
  object btnDial: TButton
    Left = 5
    Top = 48
    Width = 88
    Height = 33
    Caption = 'Dial'
    TabOrder = 0
    OnClick = btnDialClick
  end
  object btnHangup: TButton
    Left = 99
    Top = 48
    Width = 95
    Height = 33
    Caption = 'Hang up'
    TabOrder = 1
    OnClick = btnHangupClick
  end
  object edtAddr: TEdit
    Left = 346
    Top = 10
    Width = 68
    Height = 20
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
    BorderStyle = bsNone
    Font.Charset = ANSI_CHARSET
    Font.Color = 1442011
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentColor = True
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object btnCancel: TButton
    Left = 204
    Top = 8
    Width = 101
    Height = 33
    Caption = 'Cancel'
    Font.Charset = ANSI_CHARSET
    Font.Color = 4076326
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btnCancelClick
  end
  object btnConnect: TButton
    Left = 4
    Top = 8
    Width = 89
    Height = 33
    Caption = 'Connect'
    Font.Charset = ANSI_CHARSET
    Font.Color = 4076326
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = btnConnectClick
  end
  object btnDisconnect: TButton
    Left = 99
    Top = 8
    Width = 94
    Height = 33
    Caption = 'Disconnect'
    Font.Charset = ANSI_CHARSET
    Font.Color = 4076326
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = btnDisconnectClick
  end
  object btnOptions: TButton
    Left = 5
    Top = 88
    Width = 189
    Height = 35
    Caption = 'OPTIONS'
    Font.Charset = ANSI_CHARSET
    Font.Color = 4076326
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = btnOptionsClick
  end
  object IPCServer: TIPCServer
    OnClientData = IPCServerClientData
    Left = 208
    Top = 48
  end
end
