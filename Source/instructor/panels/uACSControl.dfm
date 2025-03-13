object frmACSControl: TfrmACSControl
  Left = 0
  Top = 0
  Caption = 'Fire Alarm & Control System'
  ClientHeight = 615
  ClientWidth = 1367
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object btnApply: TButton
    Left = 227
    Top = 25
    Width = 100
    Height = 25
    Caption = 'APPLY'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btnApplyClick
  end
  object btnReset: TButton
    Left = 341
    Top = 25
    Width = 100
    Height = 25
    Caption = 'CANCEL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnResetClick
  end
  object grp2: TGroupBox
    Left = 11
    Top = 189
    Width = 534
    Height = 170
    Caption = 'Alarm Control'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object lbl4: TLabel
      Left = 32
      Top = 48
      Width = 80
      Height = 14
      Caption = 'Alarm Message'
    end
    object lbl5: TLabel
      Left = 32
      Top = 88
      Width = 60
      Height = 14
      Caption = 'Description'
    end
    object cbbAlarmSet: TComboBox
      Left = 128
      Top = 45
      Width = 332
      Height = 22
      Enabled = False
      TabOrder = 0
      OnSelect = cbbAlarmSetSelect
    end
    object mmoAlarm: TMemo
      Left = 127
      Top = 85
      Width = 336
      Height = 68
      Enabled = False
      TabOrder = 1
    end
  end
  object grp3: TGroupBox
    Left = 8
    Top = 365
    Width = 537
    Height = 167
    Caption = 'Fault Fault'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object lbl7: TLabel
      Left = 32
      Top = 48
      Width = 76
      Height = 14
      Caption = 'Fault Message'
    end
    object lbl8: TLabel
      Left = 32
      Top = 88
      Width = 60
      Height = 14
      Caption = 'Description'
    end
    object cbbFaultSet: TComboBox
      Left = 128
      Top = 45
      Width = 335
      Height = 22
      Enabled = False
      TabOrder = 0
      OnSelect = cbbFaultSetSelect
    end
    object mmoFault: TMemo
      Left = 127
      Top = 85
      Width = 336
      Height = 68
      Enabled = False
      TabOrder = 1
    end
  end
  object grp1: TGroupBox
    Left = 8
    Top = 63
    Width = 537
    Height = 118
    Caption = 'Location'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object lbl1: TLabel
      Left = 32
      Top = 32
      Width = 54
      Height = 14
      Caption = 'Location :'
    end
    object lbl2: TLabel
      Left = 128
      Top = 79
      Width = 35
      Height = 14
      Caption = 'Deck :'
    end
    object lbl3: TLabel
      Left = 264
      Top = 79
      Width = 55
      Height = 14
      Caption = 'Room ID :'
    end
    object lblDeck: TLabel
      Left = 171
      Top = 73
      Width = 8
      Height = 25
      Caption = '-'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblRoomID: TLabel
      Left = 324
      Top = 73
      Width = 8
      Height = 25
      Caption = '-'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object cbbLocations: TComboBox
      Left = 128
      Top = 29
      Width = 335
      Height = 22
      Enabled = False
      TabOrder = 0
      OnSelect = cbbLocationsSelect
    end
  end
  object pnlAlarm: TPanel
    Left = 11
    Top = 25
    Width = 100
    Height = 25
    Caption = 'ALARM'
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 5
    OnClick = pnlAlarmClick
  end
  object pnlFault: TPanel
    Left = 117
    Top = 25
    Width = 100
    Height = 25
    Caption = 'FAULT'
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 6
    OnClick = pnlFaultClick
  end
  object lvAlarmStatus: TListView
    Left = 564
    Top = 63
    Width = 781
    Height = 469
    Columns = <
      item
        Caption = 'Location'
        Width = 200
      end
      item
        Caption = 'Alarm Message'
        Width = 250
      end
      item
        Caption = 'Fault Message'
        Width = 250
      end
      item
        Caption = 'Status'
        Width = 70
      end>
    GridLines = True
    ReadOnly = True
    RowSelect = True
    TabOrder = 7
    ViewStyle = vsReport
    OnCustomDrawItem = lvAlarmStatusCustomDrawItem
  end
  object btnAck: TButton
    Left = 447
    Top = 25
    Width = 100
    Height = 25
    Caption = 'RESET'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = btnAckClick
  end
end
