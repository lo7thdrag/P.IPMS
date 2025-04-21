object frmACSControl: TfrmACSControl
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Fire Alarm & Control System'
  ClientHeight = 842
  ClientWidth = 1687
  Color = clGray
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
    Left = 1338
    Top = 799
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
    Left = 1448
    Top = 799
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
  object pnlAlarm: TPanel
    Left = 30
    Top = 186
    Width = 120
    Height = 25
    Caption = 'ALARM'
    Color = 3749426
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
    OnClick = pnlAlarmClick
  end
  object pnlFault: TPanel
    Left = 434
    Top = 186
    Width = 120
    Height = 25
    Caption = 'FAULT'
    Color = 3749426
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 3
    OnClick = pnlFaultClick
  end
  object lvAlarmStatus: TListView
    Left = 888
    Top = 30
    Width = 770
    Height = 749
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
    TabOrder = 4
    ViewStyle = vsReport
    OnCustomDrawItem = lvAlarmStatusCustomDrawItem
  end
  object btnAck: TButton
    Left = 1558
    Top = 799
    Width = 100
    Height = 25
    Caption = 'RESET'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = btnAckClick
  end
  object pmlLocation: TPanel
    Left = 30
    Top = 30
    Width = 802
    Height = 131
    BevelOuter = bvNone
    Color = 3749426
    ParentBackground = False
    TabOrder = 6
    object Label1: TLabel
      Left = 33
      Top = 19
      Width = 53
      Height = 18
      Caption = 'Location'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl1: TLabel
      Left = 33
      Top = 72
      Width = 54
      Height = 14
      Caption = 'Location :'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lbl2: TLabel
      Left = 489
      Top = 71
      Width = 35
      Height = 14
      Caption = 'Deck :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblDeck: TLabel
      Left = 531
      Top = 65
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
    object lbl3: TLabel
      Left = 611
      Top = 71
      Width = 55
      Height = 14
      Caption = 'Room ID :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblRoomID: TLabel
      Left = 673
      Top = 65
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
    object Panel2: TPanel
      Left = 33
      Top = 48
      Width = 702
      Height = 1
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
    end
    object cbbLocations: TComboBox
      Left = 106
      Top = 69
      Width = 357
      Height = 21
      Enabled = False
      TabOrder = 1
      OnSelect = cbbLocationsSelect
    end
  end
  object pnlAlarmControl: TPanel
    Left = 30
    Top = 217
    Width = 398
    Height = 568
    BevelOuter = bvNone
    Color = 3749426
    ParentBackground = False
    TabOrder = 7
    object Label4: TLabel
      Left = 32
      Top = 19
      Width = 87
      Height = 18
      Caption = 'Alarm Control'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl4: TLabel
      Left = 33
      Top = 69
      Width = 80
      Height = 14
      Caption = 'Alarm Message'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl5: TLabel
      Left = 32
      Top = 134
      Width = 60
      Height = 14
      Caption = 'Description'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Panel1: TPanel
      Left = 32
      Top = 48
      Width = 334
      Height = 1
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
    end
    object cbbAlarmSet: TComboBox
      Left = 33
      Top = 93
      Width = 333
      Height = 21
      Enabled = False
      TabOrder = 1
      OnSelect = cbbAlarmSetSelect
    end
    object mmoAlarm: TMemo
      Left = 33
      Top = 154
      Width = 335
      Height = 379
      Enabled = False
      TabOrder = 2
    end
  end
  object Panel3: TPanel
    Left = 434
    Top = 217
    Width = 398
    Height = 568
    BevelOuter = bvNone
    Color = 3749426
    ParentBackground = False
    TabOrder = 8
    object lbl7: TLabel
      Left = 32
      Top = 69
      Width = 76
      Height = 14
      Caption = 'Fault Message'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl8: TLabel
      Left = 32
      Top = 134
      Width = 60
      Height = 14
      Caption = 'Description'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 32
      Top = 19
      Width = 67
      Height = 18
      Caption = 'Fault Fault'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object cbbFaultSet: TComboBox
      Left = 32
      Top = 93
      Width = 333
      Height = 21
      Enabled = False
      TabOrder = 0
      OnSelect = cbbFaultSetSelect
    end
    object mmoFault: TMemo
      Left = 32
      Top = 154
      Width = 335
      Height = 379
      Enabled = False
      TabOrder = 1
    end
    object Panel4: TPanel
      Left = 32
      Top = 48
      Width = 334
      Height = 1
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
    end
  end
end
