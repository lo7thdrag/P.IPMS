object frmShipAlarm: TfrmShipAlarm
  Left = 180
  Top = 131
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Ship Alarm'
  ClientHeight = 462
  ClientWidth = 859
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  WindowState = wsMinimized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grpTester: TGroupBox
    Left = 217
    Top = 8
    Width = 635
    Height = 444
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Berlin Sans FB'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label30: TLabel
      Left = 0
      Top = 0
      Width = 641
      Height = 450
      Alignment = taCenter
      AutoSize = False
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label31: TLabel
      Left = 3
      Top = 3
      Width = 629
      Height = 438
      Alignment = taCenter
      AutoSize = False
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label8: TLabel
      Left = 11
      Top = 12
      Width = 612
      Height = 18
      Alignment = taCenter
      AutoSize = False
      Caption = '.:  TESTER INDIKATOR  :.'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object grpPumpPs: TGroupBox
      Left = 11
      Top = 36
      Width = 92
      Height = 161
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label2: TLabel
        Left = -26
        Top = 0
        Width = 144
        Height = 199
        Alignment = taCenter
        AutoSize = False
        Caption = 'Pump PS'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label3: TLabel
        Left = 3
        Top = 20
        Width = 86
        Height = 137
        Alignment = taCenter
        AutoSize = False
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object InputB3: TShape
        Left = 7
        Top = 33
        Width = 25
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object InputB4: TShape
        Left = 34
        Top = 33
        Width = 25
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object InputB5: TShape
        Left = 61
        Top = 33
        Width = 25
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object InputB6: TShape
        Left = 7
        Top = 74
        Width = 25
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object InputB7: TShape
        Left = 34
        Top = 74
        Width = 25
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object InputB8: TShape
        Left = 61
        Top = 74
        Width = 25
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object InputC3: TShape
        Left = 7
        Top = 115
        Width = 25
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object InputC4: TShape
        Left = 34
        Top = 115
        Width = 25
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object InputC5: TShape
        Left = 61
        Top = 115
        Width = 25
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
    end
    object grpPumpSb: TGroupBox
      Left = 109
      Top = 36
      Width = 92
      Height = 161
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Label1: TLabel
        Left = -26
        Top = 0
        Width = 144
        Height = 199
        Alignment = taCenter
        AutoSize = False
        Caption = 'Pump SB'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label4: TLabel
        Left = 3
        Top = 20
        Width = 86
        Height = 137
        Alignment = taCenter
        AutoSize = False
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object InputC6: TShape
        Left = 7
        Top = 33
        Width = 25
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object InputC7: TShape
        Left = 34
        Top = 33
        Width = 25
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object InputC8: TShape
        Left = 61
        Top = 33
        Width = 25
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object InputD3: TShape
        Left = 7
        Top = 74
        Width = 25
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object InputD4: TShape
        Left = 34
        Top = 74
        Width = 25
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object InputD5: TShape
        Left = 61
        Top = 74
        Width = 25
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object InputD6: TShape
        Left = 7
        Top = 115
        Width = 25
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object InputD7: TShape
        Left = 34
        Top = 115
        Width = 25
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object InputD8: TShape
        Left = 61
        Top = 115
        Width = 25
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
    end
    object grpTelegraph: TGroupBox
      Left = 9
      Top = 203
      Width = 194
      Height = 173
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object Label5: TLabel
        Left = 0
        Top = 0
        Width = 194
        Height = 175
        Alignment = taCenter
        AutoSize = False
        Caption = 'Telegraph'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label6: TLabel
        Left = 3
        Top = 20
        Width = 188
        Height = 150
        Alignment = taCenter
        AutoSize = False
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object InputF3: TShape
        Left = 48
        Top = 129
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object InputF4: TShape
        Left = 15
        Top = 116
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object InputF5: TShape
        Left = 15
        Top = 82
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object InputF6: TShape
        Left = 15
        Top = 48
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object InputF7: TShape
        Left = 48
        Top = 30
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object InputF8: TShape
        Left = 82
        Top = 30
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object InputF9: TShape
        Left = 116
        Top = 30
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object InputF10: TShape
        Left = 150
        Top = 48
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object InputH3: TShape
        Left = 150
        Top = 82
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object InputH4: TShape
        Left = 150
        Top = 116
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object InputH5: TShape
        Left = 116
        Top = 129
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
    end
    object grpAlarm: TGroupBox
      Left = 432
      Top = 203
      Width = 190
      Height = 229
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object Label9: TLabel
        Left = 0
        Top = 0
        Width = 190
        Height = 229
        Alignment = taCenter
        AutoSize = False
        Caption = 'Alarm Failure'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label10: TLabel
        Left = 3
        Top = 20
        Width = 184
        Height = 206
        Alignment = taCenter
        AutoSize = False
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object PanelOutD3: TPanel
        Left = 11
        Top = 27
        Width = 30
        Height = 27
        Caption = '*'
        Color = clGray
        TabOrder = 0
        OnClick = PanelOutClick
      end
      object PanelOutD4: TPanel
        Left = 11
        Top = 60
        Width = 30
        Height = 27
        Caption = '*'
        Color = clGray
        TabOrder = 1
        OnClick = PanelOutClick
      end
      object PanelOutD5: TPanel
        Left = 11
        Top = 93
        Width = 30
        Height = 27
        Caption = '*'
        Color = clGray
        TabOrder = 2
        OnClick = PanelOutClick
      end
      object PanelOutD6: TPanel
        Left = 11
        Top = 126
        Width = 30
        Height = 27
        Caption = '*'
        Color = clGray
        TabOrder = 3
        OnClick = PanelOutClick
      end
      object PanelOutD7: TPanel
        Left = 11
        Top = 159
        Width = 30
        Height = 27
        Caption = '*'
        Color = clGray
        TabOrder = 4
        OnClick = PanelOutClick
      end
      object PanelOutD8: TPanel
        Left = 46
        Top = 27
        Width = 30
        Height = 27
        Caption = '*'
        Color = clGray
        TabOrder = 5
        OnClick = PanelOutClick
      end
      object PanelOutD9: TPanel
        Left = 46
        Top = 60
        Width = 30
        Height = 27
        Caption = '*'
        Color = clGray
        TabOrder = 6
        OnClick = PanelOutClick
      end
      object PanelOutD10: TPanel
        Left = 46
        Top = 93
        Width = 30
        Height = 27
        Caption = '*'
        Color = clGray
        TabOrder = 7
        OnClick = PanelOutClick
      end
      object PanelOutF3: TPanel
        Left = 81
        Top = 27
        Width = 30
        Height = 27
        Caption = '*'
        Color = clGray
        TabOrder = 8
        OnClick = PanelOutClick
      end
      object PanelOutF4: TPanel
        Left = 81
        Top = 60
        Width = 30
        Height = 27
        Caption = '*'
        Color = clGray
        TabOrder = 9
        OnClick = PanelOutClick
      end
      object PanelOutF5: TPanel
        Left = 81
        Top = 93
        Width = 30
        Height = 27
        Caption = '*'
        Color = clGray
        TabOrder = 10
        OnClick = PanelOutClick
      end
      object PanelOutF6: TPanel
        Left = 116
        Top = 27
        Width = 30
        Height = 27
        Caption = '*'
        Color = clGray
        TabOrder = 11
        OnClick = PanelOutClick
      end
      object PanelOutF7: TPanel
        Left = 116
        Top = 60
        Width = 30
        Height = 27
        Caption = '*'
        Color = clGray
        TabOrder = 12
        OnClick = PanelOutClick
      end
      object PanelOutF8: TPanel
        Left = 151
        Top = 27
        Width = 30
        Height = 27
        Caption = '*'
        Color = clGray
        TabOrder = 13
        OnClick = PanelOutClick
      end
      object PanelOutF9: TPanel
        Left = 151
        Top = 60
        Width = 30
        Height = 27
        Caption = '*'
        Color = clGray
        TabOrder = 14
        OnClick = PanelOutClick
      end
      object PanelOutB7: TPanel
        Tag = 3
        Left = 11
        Top = 192
        Width = 30
        Height = 27
        Caption = '*'
        Color = clGray
        TabOrder = 15
        OnClick = PanelOutClick
      end
      object PanelOutB8: TPanel
        Tag = 3
        Left = 115
        Top = 192
        Width = 30
        Height = 27
        Caption = '*'
        Color = clGray
        TabOrder = 16
        OnClick = PanelOutClick
      end
      object PanelOutF10: TPanel
        Tag = 3
        Left = 151
        Top = 192
        Width = 30
        Height = 27
        Caption = '*'
        Color = clGray
        TabOrder = 17
        OnClick = PanelOutClick
      end
    end
    object grpPumpSbLamp: TGroupBox
      Left = 231
      Top = 36
      Width = 92
      Height = 161
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      object Label11: TLabel
        Left = -2
        Top = 0
        Width = 95
        Height = 161
        Alignment = taCenter
        AutoSize = False
        Caption = 'Pump PS'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label12: TLabel
        Left = 3
        Top = 20
        Width = 86
        Height = 137
        Alignment = taCenter
        AutoSize = False
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object PanelOutA3: TPanel
        Tag = 1
        Left = 11
        Top = 35
        Width = 30
        Height = 30
        Caption = '*'
        Color = clGray
        ParentBackground = False
        TabOrder = 0
        OnClick = PanelOutClick
      end
      object PanelOutA4: TPanel
        Tag = 1
        Left = 51
        Top = 35
        Width = 30
        Height = 30
        Caption = '*'
        Color = clGray
        ParentBackground = False
        TabOrder = 1
        OnClick = PanelOutClick
      end
      object PanelOutA5: TPanel
        Tag = 1
        Left = 11
        Top = 75
        Width = 30
        Height = 30
        Caption = '*'
        Color = clGray
        TabOrder = 2
        OnClick = PanelOutClick
      end
      object PanelOutA6: TPanel
        Tag = 1
        Left = 51
        Top = 75
        Width = 30
        Height = 30
        Caption = '*'
        Color = clGray
        TabOrder = 3
        OnClick = PanelOutClick
      end
      object PanelOutA7: TPanel
        Tag = 1
        Left = 11
        Top = 115
        Width = 30
        Height = 30
        Caption = '*'
        Color = clGray
        TabOrder = 4
        OnClick = PanelOutClick
      end
      object PanelOutA8: TPanel
        Tag = 1
        Left = 51
        Top = 115
        Width = 30
        Height = 30
        Caption = '*'
        Color = clGray
        TabOrder = 5
        OnClick = PanelOutClick
      end
    end
    object grpPumpPsLamp: TGroupBox
      Left = 333
      Top = 36
      Width = 92
      Height = 161
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      object Label13: TLabel
        Left = -1
        Top = 0
        Width = 95
        Height = 161
        Alignment = taCenter
        AutoSize = False
        Caption = 'Pump SB'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label14: TLabel
        Left = 3
        Top = 20
        Width = 86
        Height = 137
        Alignment = taCenter
        AutoSize = False
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object PanelOutC3: TPanel
        Tag = 1
        Left = 11
        Top = 35
        Width = 30
        Height = 30
        Caption = '*'
        Color = clGray
        TabOrder = 0
        OnClick = PanelOutClick
      end
      object PanelOutC4: TPanel
        Tag = 1
        Left = 51
        Top = 35
        Width = 30
        Height = 30
        Caption = '*'
        Color = clGray
        TabOrder = 1
        OnClick = PanelOutClick
      end
      object PanelOutC5: TPanel
        Tag = 1
        Left = 11
        Top = 75
        Width = 30
        Height = 30
        Caption = '*'
        Color = clGray
        TabOrder = 2
        OnClick = PanelOutClick
      end
      object PanelOutC6: TPanel
        Tag = 1
        Left = 51
        Top = 75
        Width = 30
        Height = 30
        Caption = '*'
        Color = clGray
        TabOrder = 3
        OnClick = PanelOutClick
      end
      object PanelOutC7: TPanel
        Tag = 1
        Left = 11
        Top = 115
        Width = 30
        Height = 30
        Caption = '*'
        Color = clGray
        TabOrder = 4
        OnClick = PanelOutClick
      end
      object PanelOutC8: TPanel
        Tag = 1
        Left = 51
        Top = 115
        Width = 30
        Height = 30
        Caption = '*'
        Color = clGray
        TabOrder = 5
        OnClick = PanelOutClick
      end
    end
    object grpTelegraphLamp: TGroupBox
      Left = 231
      Top = 203
      Width = 194
      Height = 173
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      object Label15: TLabel
        Left = 0
        Top = 0
        Width = 194
        Height = 175
        Alignment = taCenter
        AutoSize = False
        Caption = 'Telegraph'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label16: TLabel
        Left = 3
        Top = 20
        Width = 187
        Height = 150
        Alignment = taCenter
        AutoSize = False
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object PanelOutK3: TPanel
        Left = 49
        Top = 129
        Width = 30
        Height = 30
        Caption = '1'
        Color = clGray
        Locked = True
        TabOrder = 0
        OnClick = PanelOutClick
      end
      object PanelOutK4: TPanel
        Left = 17
        Top = 116
        Width = 30
        Height = 30
        Caption = '2'
        Color = clGray
        TabOrder = 1
        OnClick = PanelOutClick
      end
      object PanelOutK5: TPanel
        Left = 17
        Top = 82
        Width = 30
        Height = 30
        Caption = '3'
        Color = clGray
        TabOrder = 2
        OnClick = PanelOutClick
      end
      object PanelOutK6: TPanel
        Left = 17
        Top = 48
        Width = 30
        Height = 30
        Caption = '4'
        Color = clGray
        TabOrder = 3
        OnClick = PanelOutClick
      end
      object PanelOutK7: TPanel
        Tag = 2
        Left = 49
        Top = 30
        Width = 30
        Height = 30
        Caption = '5'
        Color = clGray
        TabOrder = 4
        OnClick = PanelOutClick
      end
      object PanelOutK8: TPanel
        Tag = 2
        Left = 82
        Top = 30
        Width = 30
        Height = 30
        Caption = '6'
        Color = clGray
        TabOrder = 5
        OnClick = PanelOutClick
      end
      object PanelOutK9: TPanel
        Tag = 2
        Left = 115
        Top = 30
        Width = 30
        Height = 30
        Caption = '7'
        Color = clGray
        TabOrder = 6
        OnClick = PanelOutClick
      end
      object PanelOutK10: TPanel
        Tag = 1
        Left = 147
        Top = 48
        Width = 30
        Height = 30
        Caption = '8'
        Color = clGray
        TabOrder = 7
        OnClick = PanelOutClick
      end
      object PanelOutB3: TPanel
        Tag = 1
        Left = 147
        Top = 82
        Width = 30
        Height = 30
        Caption = '9'
        Color = clGray
        TabOrder = 8
        OnClick = PanelOutClick
      end
      object PanelOutB4: TPanel
        Tag = 1
        Left = 147
        Top = 116
        Width = 30
        Height = 30
        Caption = '10'
        Color = clGray
        TabOrder = 9
        OnClick = PanelOutClick
      end
      object PanelOutB5: TPanel
        Tag = 1
        Left = 115
        Top = 129
        Width = 30
        Height = 30
        Caption = '11'
        Color = clGray
        TabOrder = 10
        OnClick = PanelOutClick
      end
    end
    object grpSteeringGear: TGroupBox
      Left = 432
      Top = 36
      Width = 190
      Height = 161
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      object Label19: TLabel
        Left = -1
        Top = 0
        Width = 198
        Height = 161
        Alignment = taCenter
        AutoSize = False
        Caption = 'Steering Gear'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label20: TLabel
        Left = 3
        Top = 20
        Width = 44
        Height = 137
        Alignment = taCenter
        AutoSize = False
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label17: TLabel
        Left = 50
        Top = 20
        Width = 44
        Height = 137
        Alignment = taCenter
        AutoSize = False
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label18: TLabel
        Left = 96
        Top = 20
        Width = 44
        Height = 137
        Alignment = taCenter
        AutoSize = False
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label23: TLabel
        Left = 143
        Top = 20
        Width = 44
        Height = 137
        Alignment = taCenter
        AutoSize = False
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object PanelOutH3: TPanel
        Tag = 1
        Left = 10
        Top = 34
        Width = 30
        Height = 30
        Caption = '*'
        Color = clGray
        TabOrder = 0
        OnClick = PanelOutClick
      end
      object PanelOutH4: TPanel
        Left = 10
        Top = 74
        Width = 30
        Height = 30
        Caption = '*'
        Color = clGray
        TabOrder = 1
        OnClick = PanelOutClick
      end
      object PanelOutH5: TPanel
        Tag = 2
        Left = 10
        Top = 114
        Width = 30
        Height = 30
        Caption = '*'
        Color = clGray
        TabOrder = 2
        OnClick = PanelOutClick
      end
      object PanelOutH6: TPanel
        Tag = 1
        Left = 57
        Top = 34
        Width = 30
        Height = 30
        Caption = '*'
        Color = clGray
        TabOrder = 3
        OnClick = PanelOutClick
      end
      object PanelOutH7: TPanel
        Left = 57
        Top = 74
        Width = 30
        Height = 30
        Caption = '*'
        Color = clGray
        TabOrder = 4
        OnClick = PanelOutClick
      end
      object PanelOutH8: TPanel
        Tag = 2
        Left = 57
        Top = 114
        Width = 30
        Height = 30
        Caption = '*'
        Color = clGray
        TabOrder = 5
        OnClick = PanelOutClick
      end
      object PanelOutJ3: TPanel
        Tag = 1
        Left = 103
        Top = 34
        Width = 30
        Height = 30
        Caption = '*'
        Color = clGray
        TabOrder = 6
        OnClick = PanelOutClick
      end
      object PanelOutJ4: TPanel
        Left = 103
        Top = 74
        Width = 30
        Height = 30
        Caption = '*'
        Color = clGray
        TabOrder = 7
        OnClick = PanelOutClick
      end
      object PanelOutJ5: TPanel
        Tag = 2
        Left = 103
        Top = 114
        Width = 30
        Height = 30
        Caption = '*'
        Color = clGray
        TabOrder = 8
        OnClick = PanelOutClick
      end
      object PanelOutJ6: TPanel
        Tag = 1
        Left = 150
        Top = 34
        Width = 30
        Height = 30
        Caption = '*'
        Color = clGray
        TabOrder = 9
        OnClick = PanelOutClick
      end
      object PanelOutJ7: TPanel
        Left = 150
        Top = 74
        Width = 30
        Height = 30
        Caption = '*'
        Color = clGray
        TabOrder = 10
        OnClick = PanelOutClick
      end
      object PanelOutJ8: TPanel
        Tag = 2
        Left = 150
        Top = 114
        Width = 30
        Height = 30
        Caption = '*'
        Color = clGray
        TabOrder = 11
        OnClick = PanelOutClick
      end
    end
    object GroupBox5: TGroupBox
      Left = 9
      Top = 382
      Width = 194
      Height = 50
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      object Label24: TLabel
        Left = 0
        Top = 0
        Width = 194
        Height = 50
        Alignment = taCenter
        AutoSize = False
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label25: TLabel
        Left = 3
        Top = 3
        Width = 188
        Height = 44
        Alignment = taCenter
        AutoSize = False
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object InputH10: TShape
        Left = 37
        Top = 10
        Width = 47
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object InputH9: TShape
        Left = 109
        Top = 10
        Width = 47
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
    end
  end
  object GroupBox6: TGroupBox
    Left = 8
    Top = 8
    Width = 194
    Height = 444
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Berlin Sans FB'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Label26: TLabel
      Left = -41
      Top = 0
      Width = 276
      Height = 450
      Alignment = taCenter
      AutoSize = False
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label27: TLabel
      Left = 3
      Top = 3
      Width = 188
      Height = 438
      Alignment = taCenter
      AutoSize = False
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label38: TLabel
      Left = 7
      Top = 12
      Width = 179
      Height = 18
      Alignment = taCenter
      AutoSize = False
      Caption = '.:  SETTING CONNECTION  :.'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label39: TLabel
      Left = 12
      Top = 305
      Width = 96
      Height = 13
      Alignment = taCenter
      Caption = 'Status Progress :'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object GroupBox2: TGroupBox
      Left = 19
      Top = 69
      Width = 157
      Height = 196
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object btn_Settings: TVrDemoButton
        Tag = 2
        Left = 19
        Top = 38
        Width = 119
        Height = 27
        Hint = 'Circuit Breaker Reset Gensys 3'
        FontEnter.Charset = ANSI_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = ANSI_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        FocusColor = clBlack
        Font3D.ShadowColor = clGray
        Caption = 'Setting'
        TabOrder = 0
        OnClick = SettingClick
      end
      object btnload: TVrDemoButton
        Tag = 2
        Left = 19
        Top = 85
        Width = 119
        Height = 27
        Hint = 'Circuit Breaker Reset Gensys 3'
        FontEnter.Charset = ANSI_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = ANSI_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        FocusColor = clBlack
        Font3D.ShadowColor = clGray
        Caption = 'Disconnect'
        TabOrder = 1
        OnClick = ConnectClick
      end
      object btnSetAll: TVrDemoButton
        Tag = 2
        Left = 19
        Top = 132
        Width = 119
        Height = 27
        Hint = 'Circuit Breaker Reset Gensys 3'
        FontEnter.Charset = ANSI_CHARSET
        FontEnter.Color = clBlack
        FontEnter.Height = -13
        FontEnter.Name = 'Arial'
        FontEnter.Style = [fsBold]
        FontLeave.Charset = ANSI_CHARSET
        FontLeave.Color = clBlack
        FontLeave.Height = -11
        FontLeave.Name = 'Arial'
        FontLeave.Style = [fsBold]
        FocusColor = clBlack
        Font3D.ShadowColor = clGray
        Caption = 'Unset All'
        TabOrder = 2
        OnClick = SetAllClick
      end
    end
    object mmo1: TMemo
      Left = 12
      Top = 347
      Width = 170
      Height = 21
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Lines.Strings = (
        'mmo1')
      ParentFont = False
      TabOrder = 1
    end
    object edtRxBin: TEdit
      Left = 12
      Top = 371
      Width = 170
      Height = 21
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Text = 'edtRxBin'
    end
    object edt1: TEdit
      Left = 12
      Top = 324
      Width = 170
      Height = 21
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'edt1'
    end
    object CheckBox1: TCheckBox
      Left = 102
      Top = 405
      Width = 80
      Height = 17
      Caption = 'Test Mode'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      State = cbChecked
      TabOrder = 4
      OnClick = CheckBox1Click
    end
  end
  object grpComApp: TGroupBox
    Left = 864
    Top = 8
    Width = 335
    Height = 444
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Berlin Sans FB'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object Label32: TLabel
      Left = -2
      Top = 0
      Width = 340
      Height = 450
      Alignment = taCenter
      AutoSize = False
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label33: TLabel
      Left = 3
      Top = 3
      Width = 329
      Height = 438
      Alignment = taCenter
      AutoSize = False
      Caption = '`'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label7: TLabel
      Left = 11
      Top = 12
      Width = 312
      Height = 18
      Alignment = taCenter
      AutoSize = False
      Caption = '.:  ALARM RUDDER INDIKATOR  :.'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object GroupBox7: TGroupBox
      Left = 11
      Top = 36
      Width = 153
      Height = 161
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label21: TLabel
        Left = 0
        Top = 0
        Width = 153
        Height = 199
        Alignment = taCenter
        AutoSize = False
        Caption = 'Pump PS'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label22: TLabel
        Left = 3
        Top = 20
        Width = 147
        Height = 137
        Alignment = taCenter
        AutoSize = False
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object shpInputB3: TShape
        Left = 22
        Top = 33
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object shpInputB4: TShape
        Left = 62
        Top = 33
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object shpInputB5: TShape
        Left = 102
        Top = 33
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object shpInputB6: TShape
        Left = 22
        Top = 73
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object shpInputB7: TShape
        Left = 62
        Top = 73
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object shpInputB8: TShape
        Left = 102
        Top = 73
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object shpInputC3: TShape
        Left = 22
        Top = 113
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object shpInputC4: TShape
        Left = 62
        Top = 113
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object shpInputC5: TShape
        Left = 102
        Top = 113
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
    end
    object GroupBox8: TGroupBox
      Left = 171
      Top = 36
      Width = 153
      Height = 161
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Label28: TLabel
        Left = 0
        Top = 0
        Width = 153
        Height = 199
        Alignment = taCenter
        AutoSize = False
        Caption = 'Pump SB'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label29: TLabel
        Left = 3
        Top = 20
        Width = 147
        Height = 137
        Alignment = taCenter
        AutoSize = False
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object shpInputC6: TShape
        Left = 21
        Top = 33
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object shpInputC7: TShape
        Left = 61
        Top = 33
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object shpInputC8: TShape
        Left = 101
        Top = 33
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object shpInputD3: TShape
        Left = 21
        Top = 73
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object shpInputD4: TShape
        Left = 61
        Top = 73
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object shpInputD5: TShape
        Left = 101
        Top = 73
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object shpInputD7: TShape
        Left = 61
        Top = 113
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object shpInputD8: TShape
        Left = 101
        Top = 113
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object shpInputD6: TShape
        Left = 21
        Top = 113
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
    end
    object GroupBox3: TGroupBox
      Left = 11
      Top = 203
      Width = 153
      Height = 229
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object Label34: TLabel
        Left = 0
        Top = 0
        Width = 154
        Height = 229
        Alignment = taCenter
        AutoSize = False
        Caption = 'From Hardware Indikator'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label35: TLabel
        Left = 3
        Top = 20
        Width = 147
        Height = 206
        Alignment = taCenter
        AutoSize = False
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Hdwr1: TShape
        Left = 28
        Top = 175
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object Hdwr2: TShape
        Left = 12
        Top = 141
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object Hdwr3: TShape
        Left = 12
        Top = 106
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object Hdwr4: TShape
        Left = 12
        Top = 72
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object Hdwr5: TShape
        Left = 28
        Top = 38
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object Hdwr6: TShape
        Left = 62
        Top = 38
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object Hdwr7: TShape
        Left = 96
        Top = 38
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object Hdwr8: TShape
        Left = 112
        Top = 72
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object Hdwr9: TShape
        Left = 112
        Top = 106
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object Hdwr10: TShape
        Left = 112
        Top = 141
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object Hdwr11: TShape
        Left = 96
        Top = 175
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
    end
    object GroupBox1: TGroupBox
      Left = 170
      Top = 203
      Width = 153
      Height = 229
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object Label36: TLabel
        Left = 0
        Top = 0
        Width = 154
        Height = 229
        Alignment = taCenter
        AutoSize = False
        Caption = 'From Instruktur Indikator'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label37: TLabel
        Left = 3
        Top = 20
        Width = 147
        Height = 206
        Alignment = taCenter
        AutoSize = False
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Instr1: TShape
        Left = 28
        Top = 175
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object Instr2: TShape
        Left = 15
        Top = 141
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object Instr3: TShape
        Left = 15
        Top = 106
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object Instr4: TShape
        Left = 15
        Top = 72
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object Instr5: TShape
        Left = 28
        Top = 38
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object Instr6: TShape
        Left = 62
        Top = 38
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object Instr7: TShape
        Left = 96
        Top = 38
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object Instr8: TShape
        Left = 112
        Top = 72
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object Instr9: TShape
        Left = 112
        Top = 106
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object Instr10: TShape
        Left = 112
        Top = 141
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object Instr11: TShape
        Left = 96
        Top = 175
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
    end
  end
  object ComPort: TComPort
    BaudRate = br9600
    Port = 'COM1'
    Parity.Bits = prNone
    StopBits = sbOneStopBit
    DataBits = dbEight
    DiscardNull = True
    Events = [evRxChar, evTxEmpty, evRxFlag, evRing, evBreak, evCTS, evDSR, evError, evRLSD, evRx80Full]
    FlowControl.OutCTSFlow = False
    FlowControl.OutDSRFlow = False
    FlowControl.ControlDTR = dtrEnable
    FlowControl.ControlRTS = rtsDisable
    FlowControl.XonXoffOut = False
    FlowControl.XonXoffIn = False
    StoredProps = [spBasic]
    TriggersOnRxChar = True
    OnRxChar = ComPortRxChar
    Left = 19
    Top = 404
  end
  object tmrComport: TTimer
    Interval = 250
    OnTimer = tmrComportTimer
    Left = 48
    Top = 405
  end
  object tmrBzr: TTimer
    Interval = 2000
    OnTimer = tmrBzrTimer
    Left = 694
    Top = 402
  end
end
