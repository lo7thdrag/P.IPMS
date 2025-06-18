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
  object pnlAlarm: TPanel
    Left = 30
    Top = 30
    Width = 120
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
    TabOrder = 0
    OnClick = pnlAlarmClick
  end
  object pnlFault: TPanel
    Left = 156
    Top = 30
    Width = 120
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
    TabOrder = 1
    OnClick = pnlFaultClick
  end
  object pmlLocation: TPanel
    Left = 30
    Top = 65
    Width = 380
    Height = 208
    BevelOuter = bvNone
    Color = 3749426
    ParentBackground = False
    TabOrder = 2
    object Label1: TLabel
      Left = 18
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
      Left = 18
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
      Left = 18
      Top = 111
      Width = 55
      Height = 14
      Caption = 'Deck      :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblDeck: TLabel
      Left = 91
      Top = 105
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
      Left = 18
      Top = 150
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
      Left = 91
      Top = 144
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
      Left = 18
      Top = 48
      Width = 345
      Height = 1
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
    end
    object cbbLocations: TComboBox
      Left = 91
      Top = 69
      Width = 272
      Height = 21
      Enabled = False
      TabOrder = 1
      OnSelect = cbbLocationsSelect
    end
  end
  object pnlAlarmControl: TPanel
    Left = 30
    Top = 279
    Width = 380
    Height = 471
    BevelOuter = bvNone
    Color = 3749426
    ParentBackground = False
    TabOrder = 3
    object Label4: TLabel
      Left = 18
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
      Left = 18
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
      Left = 18
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
      Left = 18
      Top = 48
      Width = 345
      Height = 1
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
    end
    object cbbAlarmSet: TComboBox
      Left = 18
      Top = 93
      Width = 345
      Height = 21
      Enabled = False
      TabOrder = 1
      OnSelect = cbbAlarmSetSelect
    end
    object mmoAlarm: TMemo
      Left = 18
      Top = 154
      Width = 345
      Height = 299
      Enabled = False
      TabOrder = 2
    end
  end
  object Panel3: TPanel
    Left = 417
    Top = 65
    Width = 380
    Height = 685
    BevelOuter = bvNone
    Color = 3749426
    ParentBackground = False
    TabOrder = 4
    object lbl7: TLabel
      Left = 18
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
      Left = 18
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
      Left = 18
      Top = 24
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
      Left = 18
      Top = 93
      Width = 345
      Height = 21
      Enabled = False
      TabOrder = 0
      OnSelect = cbbFaultSetSelect
    end
    object mmoFault: TMemo
      Left = 18
      Top = 154
      Width = 345
      Height = 513
      Enabled = False
      TabOrder = 1
    end
    object Panel4: TPanel
      Left = 18
      Top = 48
      Width = 345
      Height = 1
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
    end
  end
  object pnl1: TPanel
    Left = 30
    Top = 755
    Width = 767
    Height = 65
    BevelOuter = bvNone
    Color = 3749426
    ParentBackground = False
    TabOrder = 5
    object btnApply: TButton
      Left = 541
      Top = 22
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
      Left = 651
      Top = 22
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
  end
  object pnl2: TPanel
    Left = 825
    Top = 755
    Width = 817
    Height = 65
    BevelOuter = bvNone
    Color = 3749426
    ParentBackground = False
    TabOrder = 6
    object btnAck: TButton
      Left = 700
      Top = 22
      Width = 100
      Height = 25
      Caption = 'RESET'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnAckClick
    end
  end
  object pnl3: TPanel
    Left = 825
    Top = 65
    Width = 817
    Height = 685
    BevelOuter = bvNone
    BorderWidth = 17
    Color = 3749426
    ParentBackground = False
    TabOrder = 7
    object lvAlarmStatus: TListView
      Left = 17
      Top = 17
      Width = 783
      Height = 651
      Align = alClient
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
          Width = 76
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      GridLines = True
      ReadOnly = True
      RowSelect = True
      ParentFont = False
      TabOrder = 0
      ViewStyle = vsReport
      OnCustomDrawItem = lvAlarmStatusCustomDrawItem
    end
  end
end
