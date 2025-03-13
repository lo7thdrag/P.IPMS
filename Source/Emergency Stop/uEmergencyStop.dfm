object frmEmergencyStop: TfrmEmergencyStop
  Left = 60
  Top = 66
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Emergency Stop Connection'
  ClientHeight = 279
  ClientWidth = 512
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
    Height = 262
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Berlin Sans FB'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label26: TLabel
      Left = 0
      Top = 0
      Width = 194
      Height = 262
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
      Height = 256
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
      Top = 141
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
    object GroupBox5: TGroupBox
      Left = 19
      Top = 36
      Width = 157
      Height = 85
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object btn_Settings: TVrDemoButton
        Tag = 2
        Left = 19
        Top = 15
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
        OnClick = btnSettingClick
      end
      object btnload: TVrDemoButton
        Tag = 2
        Left = 19
        Top = 49
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
    end
    object edt1: TEdit
      Left = 12
      Top = 160
      Width = 170
      Height = 21
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = 'edt1'
    end
    object mmo1: TMemo
      Left = 12
      Top = 183
      Width = 170
      Height = 21
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Lines.Strings = (
        'Memo1')
      ParentFont = False
      TabOrder = 2
    end
    object edtRxBin: TEdit
      Left = 12
      Top = 206
      Width = 170
      Height = 21
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Text = 'edtRxBin'
    end
    object CheckBox1: TCheckBox
      Left = 102
      Top = 233
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
    end
  end
  object grpTester: TGroupBox
    Left = 217
    Top = 8
    Width = 287
    Height = 262
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Berlin Sans FB'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Label30: TLabel
      Left = 0
      Top = 0
      Width = 287
      Height = 262
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
      Width = 281
      Height = 256
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
      Width = 264
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
    object grpgen1: TGroupBox
      Left = 11
      Top = 36
      Width = 129
      Height = 104
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label2: TLabel
        Left = 0
        Top = 3
        Width = 129
        Height = 104
        Alignment = taCenter
        AutoSize = False
        Caption = 'Generator 1'
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
        Width = 123
        Height = 81
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
      object shpInputK4: TShape
        Left = 18
        Top = 35
        Width = 37
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object shpInputK3: TShape
        Left = 75
        Top = 35
        Width = 37
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object Label10: TLabel
        Left = 10
        Top = 77
        Width = 53
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Normal'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label11: TLabel
        Left = 67
        Top = 77
        Width = 53
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Stop'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
    end
    object grpgen2: TGroupBox
      Left = 146
      Top = 36
      Width = 129
      Height = 104
      Caption = 'DG 2 '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Label1: TLabel
        Left = 0
        Top = 3
        Width = 129
        Height = 104
        Alignment = taCenter
        AutoSize = False
        Caption = 'Generator 2'
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
        Width = 123
        Height = 81
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
      object shpInputK6: TShape
        Left = 18
        Top = 35
        Width = 37
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object shpInputK5: TShape
        Left = 75
        Top = 35
        Width = 37
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object Label12: TLabel
        Left = 10
        Top = 77
        Width = 53
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Normal'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label13: TLabel
        Left = 67
        Top = 77
        Width = 53
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Stop'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
    end
    object grpgen3: TGroupBox
      Left = 11
      Top = 143
      Width = 129
      Height = 104
      Caption = 'DG 3 '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object Label5: TLabel
        Left = 0
        Top = 3
        Width = 129
        Height = 104
        Alignment = taCenter
        AutoSize = False
        Caption = 'Generator 3'
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
        Width = 123
        Height = 81
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
      object shpInputK8: TShape
        Left = 18
        Top = 30
        Width = 37
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object shpInputK7: TShape
        Left = 75
        Top = 30
        Width = 37
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object Label14: TLabel
        Left = 10
        Top = 77
        Width = 53
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Normal'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label15: TLabel
        Left = 67
        Top = 77
        Width = 53
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Stop'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
    end
    object grpgen4: TGroupBox
      Left = 146
      Top = 143
      Width = 129
      Height = 104
      Caption = 'DG 4 '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object Label7: TLabel
        Left = 0
        Top = 3
        Width = 129
        Height = 104
        Alignment = taCenter
        AutoSize = False
        Caption = 'Generator 4'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label9: TLabel
        Left = 3
        Top = 20
        Width = 123
        Height = 81
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
      object shpInputK10: TShape
        Left = 18
        Top = 30
        Width = 37
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object shpInputK9: TShape
        Left = 75
        Top = 30
        Width = 37
        Height = 30
        Brush.Color = clGray
        Shape = stRoundRect
      end
      object Label16: TLabel
        Left = 10
        Top = 77
        Width = 53
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Normal'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label17: TLabel
        Left = 67
        Top = 77
        Width = 53
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Stop'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
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
    Left = 166
    Top = 276
  end
  object tmrComport: TTimer
    Interval = 250
    OnTimer = tmrComportTimer
    Left = 121
    Top = 276
  end
end
