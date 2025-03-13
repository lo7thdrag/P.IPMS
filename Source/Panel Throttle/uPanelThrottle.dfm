object frmPanelThrottle: TfrmPanelThrottle
  Left = 240
  Top = 197
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'PanelThrottle'
  ClientHeight = 462
  ClientWidth = 864
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
    TabOrder = 0
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
    object GroupBox3: TGroupBox
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
    Width = 217
    Height = 444
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Berlin Sans FB'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object lbl1: TLabel
      Left = 0
      Top = 0
      Width = 217
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
    object lbl2: TLabel
      Left = 3
      Top = 3
      Width = 211
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
    object lbl3: TLabel
      Left = 12
      Top = 12
      Width = 193
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
    object grp3: TGroupBox
      Left = 11
      Top = 240
      Width = 194
      Height = 173
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object lbl8: TLabel
        Left = 0
        Top = 0
        Width = 194
        Height = 175
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
      object lbl9: TLabel
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
      object Hdwr1: TShape
        Left = 48
        Top = 129
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object Hdwr2: TShape
        Left = 13
        Top = 116
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object Hdwr3: TShape
        Left = 13
        Top = 82
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object Hdwr4: TShape
        Left = 13
        Top = 48
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object Hdwr5: TShape
        Left = 48
        Top = 30
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object Hdwr6: TShape
        Left = 82
        Top = 30
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object Hdwr7: TShape
        Left = 116
        Top = 30
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object Hdwr8: TShape
        Left = 151
        Top = 48
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object Hdwr9: TShape
        Left = 151
        Top = 82
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object Hdwr10: TShape
        Left = 151
        Top = 116
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object Hdwr11: TShape
        Left = 116
        Top = 129
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
    end
    object grp4: TGroupBox
      Left = 11
      Top = 55
      Width = 194
      Height = 173
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object lbl10: TLabel
        Left = 0
        Top = 0
        Width = 194
        Height = 175
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
      object lbl11: TLabel
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
      object Instr1: TShape
        Left = 48
        Top = 129
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object Instr2: TShape
        Left = 13
        Top = 116
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object Instr3: TShape
        Left = 13
        Top = 82
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object Instr4: TShape
        Left = 13
        Top = 48
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object Instr5: TShape
        Left = 48
        Top = 30
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object Instr6: TShape
        Left = 82
        Top = 30
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object Instr7: TShape
        Left = 116
        Top = 30
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object Instr8: TShape
        Left = 151
        Top = 48
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object Instr9: TShape
        Left = 151
        Top = 82
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object Instr10: TShape
        Left = 151
        Top = 116
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object Instr11: TShape
        Left = 116
        Top = 129
        Width = 30
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
    end
  end
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
    TabOrder = 2
    object lbl12: TLabel
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
    object lbl13: TLabel
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
    object lbl14: TLabel
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
      object lbl15: TLabel
        Left = -26
        Top = 0
        Width = 144
        Height = 199
        Alignment = taCenter
        AutoSize = False
        Caption = 'Panel Throtel'#13#10'PS'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object lbl16: TLabel
        Left = 3
        Top = 30
        Width = 86
        Height = 128
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
      object InputD3: TShape
        Left = 14
        Top = 40
        Width = 25
        Height = 25
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object InputD4: TShape
        Left = 14
        Top = 67
        Width = 25
        Height = 25
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object InputD6: TShape
        Left = 53
        Top = 67
        Width = 25
        Height = 25
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object InputD5: TShape
        Left = 14
        Top = 94
        Width = 25
        Height = 25
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object InputD7: TShape
        Left = 53
        Top = 121
        Width = 25
        Height = 25
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
      object lbl17: TLabel
        Left = -26
        Top = 0
        Width = 144
        Height = 199
        Alignment = taCenter
        AutoSize = False
        Caption = 'Panel Throtel'#13#10'SB'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object lbl18: TLabel
        Left = 3
        Top = 30
        Width = 86
        Height = 128
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
      object InputC3: TShape
        Left = 53
        Top = 40
        Width = 25
        Height = 25
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object InputC4: TShape
        Left = 53
        Top = 67
        Width = 25
        Height = 25
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object InputC5: TShape
        Left = 53
        Top = 94
        Width = 25
        Height = 25
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object InputC7: TShape
        Left = 14
        Top = 121
        Width = 25
        Height = 25
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object InputC6: TShape
        Left = 14
        Top = 67
        Width = 25
        Height = 25
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
      object lbl19: TLabel
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
      object lbl20: TLabel
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
      object lbl21: TLabel
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
      object lbl22: TLabel
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
      object PanelOutB7: TPanel
        Tag = 3
        Left = 11
        Top = 192
        Width = 30
        Height = 27
        Caption = '*'
        Color = clGray
        TabOrder = 0
        OnClick = PanelOutClick
      end
      object PanelOutD7: TPanel
        Left = 11
        Top = 159
        Width = 30
        Height = 27
        Caption = '*'
        Color = clGray
        TabOrder = 1
        OnClick = PanelOutClick
      end
      object PanelOutD6: TPanel
        Left = 11
        Top = 126
        Width = 30
        Height = 27
        Caption = '*'
        Color = clGray
        TabOrder = 2
        OnClick = PanelOutClick
      end
      object PanelOutD5: TPanel
        Left = 11
        Top = 93
        Width = 30
        Height = 27
        Caption = '*'
        Color = clGray
        TabOrder = 3
        OnClick = PanelOutClick
      end
      object PanelOutD4: TPanel
        Left = 11
        Top = 60
        Width = 30
        Height = 27
        Caption = '*'
        Color = clGray
        TabOrder = 4
        OnClick = PanelOutClick
      end
      object PanelOutD3: TPanel
        Left = 11
        Top = 27
        Width = 30
        Height = 27
        Caption = '*'
        Color = clGray
        TabOrder = 5
        OnClick = PanelOutClick
      end
      object PanelOutD8: TPanel
        Left = 46
        Top = 27
        Width = 30
        Height = 27
        Caption = '*'
        Color = clGray
        TabOrder = 6
        OnClick = PanelOutClick
      end
      object PanelOutD9: TPanel
        Left = 46
        Top = 60
        Width = 30
        Height = 27
        Caption = '*'
        Color = clGray
        TabOrder = 7
        OnClick = PanelOutClick
      end
      object PanelOutD10: TPanel
        Left = 46
        Top = 93
        Width = 30
        Height = 27
        Caption = '*'
        Color = clGray
        TabOrder = 8
        OnClick = PanelOutClick
      end
      object PanelOutF5: TPanel
        Left = 81
        Top = 93
        Width = 30
        Height = 27
        Caption = '*'
        Color = clGray
        TabOrder = 9
        OnClick = PanelOutClick
      end
      object PanelOutF4: TPanel
        Left = 81
        Top = 60
        Width = 30
        Height = 27
        Caption = '*'
        Color = clGray
        TabOrder = 10
        OnClick = PanelOutClick
      end
      object PanelOutF3: TPanel
        Left = 81
        Top = 27
        Width = 30
        Height = 27
        Caption = '*'
        Color = clGray
        TabOrder = 11
        OnClick = PanelOutClick
      end
      object PanelOutF6: TPanel
        Left = 116
        Top = 27
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
      object PanelOutF7: TPanel
        Left = 116
        Top = 60
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
      object lbl23: TLabel
        Left = -2
        Top = 0
        Width = 95
        Height = 161
        Alignment = taCenter
        AutoSize = False
        Caption = 'Panel Throtel'#13#10'PS'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object lbl24: TLabel
        Left = 3
        Top = 30
        Width = 86
        Height = 128
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
        Top = 53
        Width = 30
        Height = 20
        Caption = '*'
        Color = clGray
        TabOrder = 0
        OnClick = PanelOutClick
      end
      object PanelOutA4: TPanel
        Left = 11
        Top = 75
        Width = 30
        Height = 20
        Caption = '*'
        Color = clGray
        TabOrder = 1
        OnClick = PanelOutClick
      end
      object PanelOutA5: TPanel
        Tag = 1
        Left = 11
        Top = 97
        Width = 30
        Height = 20
        Caption = '*'
        Color = clGray
        TabOrder = 2
        OnClick = PanelOutClick
      end
      object PanelOutA6: TPanel
        Left = 51
        Top = 70
        Width = 30
        Height = 20
        Caption = '*'
        Color = clGray
        TabOrder = 3
        OnClick = PanelOutClick
      end
      object PanelOutA7: TPanel
        Tag = 1
        Left = 51
        Top = 92
        Width = 30
        Height = 20
        Caption = '*'
        Color = clGray
        ParentBackground = False
        TabOrder = 4
        OnClick = PanelOutClick
      end
      object PanelOutA8: TPanel
        Tag = 4
        Left = 51
        Top = 114
        Width = 30
        Height = 20
        Caption = '*'
        Color = clGray
        TabOrder = 5
        OnClick = PanelOutClick
      end
      object PanelOutA9: TPanel
        Tag = 1
        Left = 11
        Top = 36
        Width = 70
        Height = 15
        Caption = '*'
        Color = clGray
        TabOrder = 6
        OnClick = PanelOutClick
      end
      object PanelOutA10: TPanel
        Tag = 1
        Left = 11
        Top = 136
        Width = 70
        Height = 15
        Caption = '*'
        Color = clGray
        TabOrder = 7
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
      object lbl25: TLabel
        Left = -1
        Top = 0
        Width = 95
        Height = 161
        Alignment = taCenter
        AutoSize = False
        Caption = 'Panel Throtel'#13#10'SB'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object lbl26: TLabel
        Left = 3
        Top = 30
        Width = 86
        Height = 128
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
        Left = 51
        Top = 53
        Width = 30
        Height = 20
        Caption = '*'
        Color = clGray
        TabOrder = 0
        OnClick = PanelOutClick
      end
      object PanelOutC4: TPanel
        Left = 51
        Top = 75
        Width = 30
        Height = 20
        Caption = '*'
        Color = clGray
        TabOrder = 1
        OnClick = PanelOutClick
      end
      object PanelOutC5: TPanel
        Tag = 1
        Left = 51
        Top = 97
        Width = 30
        Height = 20
        Caption = '*'
        Color = clGray
        TabOrder = 2
        OnClick = PanelOutClick
      end
      object PanelOutC6: TPanel
        Left = 11
        Top = 70
        Width = 30
        Height = 20
        Caption = '*'
        Color = clGray
        TabOrder = 3
        OnClick = PanelOutClick
      end
      object PanelOutC7: TPanel
        Tag = 1
        Left = 11
        Top = 92
        Width = 30
        Height = 20
        Caption = '*'
        Color = clGray
        ParentBackground = False
        TabOrder = 4
        OnClick = PanelOutClick
      end
      object PanelOutC8: TPanel
        Tag = 4
        Left = 11
        Top = 114
        Width = 30
        Height = 20
        Caption = '*'
        Color = clGray
        TabOrder = 5
        OnClick = PanelOutClick
      end
      object PanelOutC9: TPanel
        Tag = 1
        Left = 11
        Top = 36
        Width = 70
        Height = 15
        Caption = '*'
        Color = clGray
        TabOrder = 6
        OnClick = PanelOutClick
      end
      object PanelOutC10: TPanel
        Tag = 1
        Left = 11
        Top = 136
        Width = 70
        Height = 15
        Caption = '*'
        Color = clGray
        TabOrder = 7
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
      object lbl27: TLabel
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
      object lbl28: TLabel
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
      object PanelOutB4: TPanel
        Tag = 1
        Left = 147
        Top = 116
        Width = 30
        Height = 30
        Caption = '10'
        Color = clGray
        TabOrder = 8
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
    object grp5: TGroupBox
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
      TabOrder = 7
      object lbl34: TLabel
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
      object lbl35: TLabel
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
    Left = 55
    Top = 407
  end
  object tmrComport: TTimer
    Interval = 250
    OnTimer = tmrComportTimer
    Left = 21
    Top = 406
  end
  object tmrBzr: TTimer
    Interval = 2000
    OnTimer = tmrBzrTimer
    Left = 694
    Top = 402
  end
end
