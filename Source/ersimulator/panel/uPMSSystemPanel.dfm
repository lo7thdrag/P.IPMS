object frmPMSSystemPanel: TfrmPMSSystemPanel
  Left = -485
  Top = 237
  BorderStyle = bsNone
  Caption = 'PMS System'
  ClientHeight = 856
  ClientWidth = 1687
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPMSSystem: TPanel
    Left = 0
    Top = 0
    Width = 1687
    Height = 856
    Align = alClient
    BevelOuter = bvNone
    Color = clGray
    ParentBackground = False
    TabOrder = 0
    object Panel26: TPanel
      Left = 555
      Top = 561
      Width = 307
      Height = 210
      BevelOuter = bvNone
      Color = 3749426
      ParentBackground = False
      TabOrder = 18
      object Label8: TLabel
        Left = 48
        Top = 57
        Width = 41
        Height = 16
        Caption = 'Manual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 143
        Top = 57
        Width = 59
        Height = 16
        Caption = 'Semi Auto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label16: TLabel
        Left = 256
        Top = 57
        Width = 26
        Height = 16
        Caption = 'Auto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblEngineRunGenE: TLabel
        Left = 28
        Top = 95
        Width = 9
        Height = 13
        Alignment = taCenter
        Caption = '   '
        Color = clRed
        ParentColor = False
        Transparent = False
      end
      object lbl10: TLabel
        Left = 47
        Top = 95
        Width = 88
        Height = 16
        Alignment = taCenter
        Caption = 'Engine Running'
        Color = clInactiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lblBusbarGenE: TLabel
        Left = 28
        Top = 117
        Width = 9
        Height = 13
        Alignment = taCenter
        Caption = '   '
        Color = clSilver
        ParentColor = False
        Transparent = False
      end
      object lbl66: TLabel
        Left = 47
        Top = 117
        Width = 81
        Height = 16
        Caption = 'Busbar Supply'
        Color = clInactiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lblGeneratorSuppliedGene: TLabel
        Left = 103
        Top = 18
        Width = 102
        Height = 19
        Alignment = taCenter
        Caption = 'EMERGENCY'
        Color = clRed
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        WordWrap = True
      end
      object rbSemGenE: TRadioButton
        Left = 123
        Top = 57
        Width = 15
        Height = 17
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = GenEModeClick
      end
      object rbManGenE: TRadioButton
        Left = 28
        Top = 57
        Width = 15
        Height = 17
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = GenEModeClick
      end
      object rbAutGenE: TRadioButton
        Left = 236
        Top = 57
        Width = 15
        Height = 17
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = GenEModeClick
      end
      object Panel27: TPanel
        Left = 27
        Top = 82
        Width = 254
        Height = 1
        BevelOuter = bvNone
        Color = clBtnHighlight
        ParentBackground = False
        TabOrder = 3
      end
      object btnStartGenE: TButton
        Tag = 10
        Left = 60
        Top = 168
        Width = 83
        Height = 28
        Caption = 'START'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = btnStartClick
      end
      object btnStopGenE: TButton
        Tag = 10
        Left = 164
        Top = 168
        Width = 83
        Height = 28
        Caption = 'STOP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        OnClick = btnStopClick
      end
      object lbl2: TPanel
        Left = 27
        Top = 149
        Width = 254
        Height = 1
        BevelOuter = bvNone
        Color = clBtnHighlight
        ParentBackground = False
        TabOrder = 6
      end
    end
    object Panel1: TPanel
      Left = 1023
      Top = 30
      Width = 634
      Height = 32
      BevelOuter = bvNone
      Color = 3749426
      ParentBackground = False
      TabOrder = 0
      object Label2: TLabel
        Left = 184
        Top = 6
        Width = 266
        Height = 19
        Align = alCustom
        Alignment = taCenter
        Caption = 'FORWARD MAIN SWITCHBOARD'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
    end
    object pnlGensys1: TPanel
      Left = 1023
      Top = 67
      Width = 307
      Height = 242
      BevelOuter = bvNone
      Color = 3749426
      ParentBackground = False
      TabOrder = 1
      object lblGeneratorSuppliedGen1: TLabel
        Left = 108
        Top = 15
        Width = 90
        Height = 19
        Alignment = taCenter
        Caption = 'GENSYS 01'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object lblEngineRunGen1: TLabel
        Left = 28
        Top = 104
        Width = 9
        Height = 13
        Alignment = taCenter
        Caption = '   '
        Color = clRed
        ParentColor = False
        Transparent = False
      end
      object lbl34: TLabel
        Left = 47
        Top = 102
        Width = 88
        Height = 16
        Caption = 'Engine Running'
        Color = clInactiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lblPrefGen1: TLabel
        Left = 28
        Top = 128
        Width = 9
        Height = 13
        Alignment = taCenter
        Caption = '   '
        Color = clSilver
        ParentColor = False
        Transparent = False
      end
      object lbl37: TLabel
        Left = 47
        Top = 126
        Width = 62
        Height = 16
        Alignment = taCenter
        Caption = 'Preference'
        Color = clInactiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lblBusbarGen1: TLabel
        Left = 28
        Top = 152
        Width = 9
        Height = 13
        Alignment = taCenter
        Caption = '   '
        Color = clSilver
        ParentColor = False
        Transparent = False
      end
      object lbl38: TLabel
        Left = 46
        Top = 150
        Width = 81
        Height = 16
        Alignment = taCenter
        Caption = 'Busbar Supply'
        Color = clInactiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label15: TLabel
        Left = 46
        Top = 60
        Width = 41
        Height = 16
        Caption = 'Manual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label19: TLabel
        Left = 143
        Top = 60
        Width = 59
        Height = 16
        Caption = 'Semi Auto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label42: TLabel
        Left = 253
        Top = 60
        Width = 26
        Height = 16
        Caption = 'Auto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object rbManGen1: TRadioButton
        Left = 26
        Top = 60
        Width = 15
        Height = 17
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = Gen1ModeClick
      end
      object rbSemGen1: TRadioButton
        Left = 123
        Top = 60
        Width = 15
        Height = 17
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = Gen1ModeClick
      end
      object rbAutGen1: TRadioButton
        Left = 233
        Top = 60
        Width = 15
        Height = 17
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = Gen1ModeClick
      end
      object btnStartGen1: TButton
        Tag = 10
        Left = 26
        Top = 197
        Width = 83
        Height = 28
        Caption = 'START'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = btnStartClick
      end
      object btnStopGen1: TButton
        Tag = 10
        Left = 112
        Top = 197
        Width = 83
        Height = 28
        Caption = 'STOP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = btnStopClick
      end
      object btnPrefGen1: TButton
        Tag = 10
        Left = 197
        Top = 197
        Width = 83
        Height = 28
        Caption = 'PREF'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Berlin Sans FB'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnClick = btnPrefClick
      end
      object Panel6: TPanel
        Left = 26
        Top = 183
        Width = 254
        Height = 1
        BevelOuter = bvNone
        Color = clBtnHighlight
        ParentBackground = False
        TabOrder = 6
      end
      object Panel7: TPanel
        Left = 26
        Top = 87
        Width = 254
        Height = 1
        BevelOuter = bvNone
        Color = clBtnHighlight
        ParentBackground = False
        TabOrder = 7
      end
    end
    object pnlGensys2: TPanel
      Left = 1350
      Top = 67
      Width = 307
      Height = 242
      BevelOuter = bvNone
      Color = 3749426
      ParentBackground = False
      TabOrder = 2
      object lblGeneratorSuppliedGen2: TLabel
        Left = 108
        Top = 15
        Width = 90
        Height = 19
        Alignment = taCenter
        Caption = 'GENSYS 02'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label9: TLabel
        Left = 48
        Top = 61
        Width = 41
        Height = 16
        Caption = 'Manual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 143
        Top = 61
        Width = 59
        Height = 16
        Caption = 'Semi Auto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label31: TLabel
        Left = 256
        Top = 61
        Width = 26
        Height = 16
        Caption = 'Auto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblEngineRunGen2: TLabel
        Left = 28
        Top = 104
        Width = 9
        Height = 13
        Alignment = taCenter
        Caption = '   '
        Color = clRed
        ParentColor = False
        Transparent = False
      end
      object lbl44: TLabel
        Left = 47
        Top = 102
        Width = 88
        Height = 16
        Caption = 'Engine Running'
        Color = clInactiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lblPrefGen2: TLabel
        Left = 28
        Top = 128
        Width = 9
        Height = 13
        Alignment = taCenter
        Caption = '   '
        Color = clSilver
        ParentColor = False
        Transparent = False
      end
      object lbl47: TLabel
        Left = 47
        Top = 126
        Width = 62
        Height = 16
        Alignment = taCenter
        Caption = 'Preference'
        Color = clInactiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lblBusbarGen2: TLabel
        Left = 28
        Top = 152
        Width = 9
        Height = 13
        Alignment = taCenter
        Caption = '   '
        Color = clSilver
        ParentColor = False
        Transparent = False
      end
      object lbl48: TLabel
        Left = 47
        Top = 150
        Width = 81
        Height = 16
        Alignment = taCenter
        Caption = 'Busbar Supply'
        Color = clInactiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object rbManGen2: TRadioButton
        Left = 28
        Top = 60
        Width = 15
        Height = 17
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = Gen2ModeClick
      end
      object rbSemGen2: TRadioButton
        Left = 123
        Top = 60
        Width = 15
        Height = 17
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = Gen2ModeClick
      end
      object rbAutGen2: TRadioButton
        Left = 236
        Top = 60
        Width = 15
        Height = 17
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = Gen2ModeClick
      end
      object btnStartGen2: TButton
        Tag = 10
        Left = 26
        Top = 197
        Width = 83
        Height = 28
        Caption = 'START'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = btnStartClick
      end
      object btnStopGen2: TButton
        Tag = 10
        Left = 112
        Top = 197
        Width = 83
        Height = 28
        Caption = 'STOP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = btnStopClick
      end
      object btnPrefGen2: TButton
        Tag = 10
        Left = 197
        Top = 197
        Width = 83
        Height = 28
        Caption = 'PREF'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        OnClick = btnPrefClick
      end
      object Panel12: TPanel
        Left = 27
        Top = 87
        Width = 254
        Height = 1
        BevelOuter = bvNone
        Color = clBtnHighlight
        ParentBackground = False
        TabOrder = 6
      end
      object Panel13: TPanel
        Left = 27
        Top = 183
        Width = 254
        Height = 1
        BevelOuter = bvNone
        Color = clBtnHighlight
        ParentBackground = False
        TabOrder = 7
      end
    end
    object Panel2: TPanel
      Left = 694
      Top = 30
      Width = 300
      Height = 32
      BevelOuter = bvNone
      Color = 3749426
      ParentBackground = False
      TabOrder = 3
      object Label30: TLabel
        Left = 79
        Top = 7
        Width = 142
        Height = 19
        Align = alCustom
        Alignment = taCenter
        Caption = 'SIMULASI BEBAN'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
    end
    object pnlSimulasiBeban: TPanel
      Left = 694
      Top = 67
      Width = 300
      Height = 433
      BevelOuter = bvNone
      Color = 3749426
      ParentBackground = False
      TabOrder = 4
      object lblBeban2: TLabel
        Left = 60
        Top = 21
        Width = 81
        Height = 44
        Alignment = taCenter
        AutoSize = False
        Caption = '45'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -32
        Font.Name = 'Agency FB'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object lblBeban1: TLabel
        Left = 160
        Top = 21
        Width = 81
        Height = 44
        Alignment = taCenter
        AutoSize = False
        Caption = '45'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -32
        Font.Name = 'Agency FB'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object lblBeban2n: TLabel
        Left = 69
        Top = 64
        Width = 64
        Height = 13
        Caption = 'Beban (Kw)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblBeban1n: TLabel
        Left = 169
        Top = 64
        Width = 64
        Height = 13
        Caption = 'Beban (Kw)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblBesarbeban: TLabel
        Left = 92
        Top = 270
        Width = 116
        Height = 77
        Alignment = taCenter
        AutoSize = False
        Caption = '0'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -64
        Font.Name = 'Agency FB'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Visible = False
      end
      object lblBesarbebann: TLabel
        Left = 100
        Top = 344
        Width = 99
        Height = 13
        Caption = 'Besar Beban (Kw)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object TGroupBox
        Left = 10
        Top = 21
        Width = 45
        Height = 384
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        TabOrder = 1
        object trckbrBebanAft: TTrackBar
          Left = 2
          Top = 15
          Width = 41
          Height = 367
          Align = alClient
          Max = 0
          Min = -450
          Orientation = trVertical
          Frequency = 45
          Position = -72
          TabOrder = 0
          ThumbLength = 15
          TickMarks = tmBoth
          OnChange = trckbrBebanChange
        end
      end
      object TGroupBox
        Left = 246
        Top = 21
        Width = 45
        Height = 382
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        object trckbrBebanFwd: TTrackBar
          Left = 2
          Top = 15
          Width = 41
          Height = 365
          Align = alClient
          Max = 0
          Min = -450
          Orientation = trVertical
          Frequency = 45
          Position = -45
          TabOrder = 0
          ThumbLength = 15
          TickMarks = tmBoth
          OnChange = trckbrBebanChange
        end
      end
      object btnApply: TButton
        Tag = 10
        Left = 79
        Top = 380
        Width = 141
        Height = 25
        Caption = 'Apply'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = btnApplyClick
      end
    end
    object Panel3: TPanel
      Left = 30
      Top = 30
      Width = 634
      Height = 32
      BevelOuter = bvNone
      Color = 3749426
      ParentBackground = False
      TabOrder = 5
      object Label10: TLabel
        Left = 199
        Top = 6
        Width = 235
        Height = 19
        Align = alCustom
        Alignment = taCenter
        Caption = 'AFTER MAIN SWITCHBOARD'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
    end
    object pnlGengsys3: TPanel
      Left = 30
      Top = 67
      Width = 307
      Height = 242
      BevelOuter = bvNone
      Color = 3749426
      ParentBackground = False
      TabOrder = 6
      object lblGeneratorSuppliedGen3: TLabel
        Left = 108
        Top = 15
        Width = 90
        Height = 19
        Alignment = taCenter
        Caption = 'GENSYS 03'
        Color = clRed
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        WordWrap = True
      end
      object lblEngineRunGen3: TLabel
        Left = 28
        Top = 104
        Width = 9
        Height = 13
        Alignment = taCenter
        Caption = '   '
        Color = clRed
        ParentColor = False
        Transparent = False
      end
      object lbl26: TLabel
        Left = 47
        Top = 102
        Width = 88
        Height = 16
        Caption = 'Engine Running'
        Color = clInactiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lblPrefGen3: TLabel
        Left = 28
        Top = 128
        Width = 9
        Height = 13
        Alignment = taCenter
        Caption = '   '
        Color = clSilver
        ParentColor = False
        Transparent = False
      end
      object lbl3: TLabel
        Left = 47
        Top = 126
        Width = 62
        Height = 16
        Alignment = taCenter
        Caption = 'Preference'
        Color = clInactiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lblBusbarGen3: TLabel
        Left = 28
        Top = 152
        Width = 9
        Height = 13
        Alignment = taCenter
        Caption = '   '
        Color = clSilver
        ParentColor = False
        Transparent = False
      end
      object Label3: TLabel
        Left = 47
        Top = 150
        Width = 81
        Height = 16
        Alignment = taCenter
        Caption = 'Busbar Supply'
        Color = clInactiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label14: TLabel
        Left = 48
        Top = 61
        Width = 41
        Height = 16
        Caption = 'Manual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label33: TLabel
        Left = 143
        Top = 61
        Width = 59
        Height = 16
        Caption = 'Semi Auto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label34: TLabel
        Left = 256
        Top = 61
        Width = 26
        Height = 16
        Caption = 'Auto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object rbManGen3: TRadioButton
        Left = 28
        Top = 60
        Width = 15
        Height = 17
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = Gen3ModeClick
      end
      object rbSemGen3: TRadioButton
        Left = 123
        Top = 60
        Width = 15
        Height = 17
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = Gen3ModeClick
      end
      object rbAutGen3: TRadioButton
        Left = 236
        Top = 60
        Width = 15
        Height = 17
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = Gen3ModeClick
      end
      object btnStartGen3: TButton
        Tag = 3
        Left = 26
        Top = 197
        Width = 83
        Height = 28
        Caption = 'START'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = btnStartClick
      end
      object btnStopGen3: TButton
        Tag = 10
        Left = 112
        Top = 197
        Width = 83
        Height = 28
        Caption = 'STOP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = btnStopClick
      end
      object btnPrefGen3: TButton
        Tag = 10
        Left = 197
        Top = 197
        Width = 83
        Height = 28
        Caption = 'PREF'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        OnClick = btnPrefClick
      end
      object Panel14: TPanel
        Left = 27
        Top = 87
        Width = 254
        Height = 1
        BevelOuter = bvNone
        Color = clBtnHighlight
        ParentBackground = False
        TabOrder = 6
      end
      object Panel15: TPanel
        Left = 27
        Top = 183
        Width = 254
        Height = 1
        BevelOuter = bvNone
        Color = clBtnHighlight
        ParentBackground = False
        TabOrder = 7
      end
    end
    object pnlGengsys4: TPanel
      Left = 357
      Top = 67
      Width = 307
      Height = 242
      BevelOuter = bvNone
      Color = 3749426
      ParentBackground = False
      TabOrder = 7
      object lblGeneratorSuppliedGen4: TLabel
        Left = 108
        Top = 15
        Width = 90
        Height = 19
        Alignment = taCenter
        Caption = 'GENSYS 04'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label1: TLabel
        Left = 47
        Top = 61
        Width = 41
        Height = 16
        Caption = 'Manual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 143
        Top = 61
        Width = 59
        Height = 16
        Caption = 'Semi Auto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label26: TLabel
        Left = 256
        Top = 61
        Width = 26
        Height = 16
        Caption = 'Auto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblEngineRunGen4: TLabel
        Left = 28
        Top = 104
        Width = 9
        Height = 13
        Alignment = taCenter
        Caption = '   '
        Color = clRed
        ParentColor = False
        Transparent = False
      end
      object lblPrefGen4: TLabel
        Left = 28
        Top = 128
        Width = 9
        Height = 13
        Alignment = taCenter
        Caption = '   '
        Color = clSilver
        ParentColor = False
        Transparent = False
      end
      object lblBusbarGen4: TLabel
        Left = 28
        Top = 152
        Width = 9
        Height = 13
        Alignment = taCenter
        Caption = '   '
        Color = clSilver
        ParentColor = False
        Transparent = False
      end
      object lbl19: TLabel
        Left = 47
        Top = 150
        Width = 81
        Height = 16
        Alignment = taCenter
        Caption = 'Busbar Supply'
        Color = clInactiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbl18: TLabel
        Left = 47
        Top = 126
        Width = 62
        Height = 16
        Alignment = taCenter
        Caption = 'Preference'
        Color = clInactiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbl15: TLabel
        Left = 47
        Top = 102
        Width = 88
        Height = 16
        Caption = 'Engine Running'
        Color = clInactiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object rbManGen4: TRadioButton
        Left = 28
        Top = 60
        Width = 15
        Height = 17
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = Gen4ModeClick
      end
      object rbSemGen4: TRadioButton
        Left = 123
        Top = 60
        Width = 15
        Height = 17
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = Gen4ModeClick
      end
      object rbAutGen4: TRadioButton
        Left = 236
        Top = 60
        Width = 15
        Height = 17
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = Gen4ModeClick
      end
      object btnStartGen4: TButton
        Tag = 4
        Left = 26
        Top = 197
        Width = 83
        Height = 28
        Caption = 'START'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = btnStartClick
      end
      object btnStopGen4: TButton
        Tag = 10
        Left = 112
        Top = 197
        Width = 83
        Height = 28
        Caption = 'STOP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = btnStopClick
      end
      object btnPrefGen4: TButton
        Tag = 10
        Left = 197
        Top = 197
        Width = 83
        Height = 28
        Caption = 'PREF'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        OnClick = btnPrefClick
      end
      object Panel16: TPanel
        Left = 27
        Top = 87
        Width = 254
        Height = 1
        BevelOuter = bvNone
        Color = clBtnHighlight
        ParentBackground = False
        TabOrder = 6
      end
      object Panel17: TPanel
        Left = 27
        Top = 183
        Width = 254
        Height = 1
        BevelOuter = bvNone
        Color = clBtnHighlight
        ParentBackground = False
        TabOrder = 7
      end
    end
    object pnlShoreInter: TPanel
      Left = 30
      Top = 663
      Width = 265
      Height = 162
      BevelOuter = bvNone
      Color = 3749426
      ParentBackground = False
      TabOrder = 8
      object Label32: TLabel
        Left = 33
        Top = 33
        Width = 41
        Height = 16
        Caption = 'Manual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label39: TLabel
        Left = 106
        Top = 33
        Width = 17
        Height = 16
        Caption = 'Off'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label40: TLabel
        Left = 157
        Top = 33
        Width = 89
        Height = 16
        Caption = 'Auto Take Over'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblCBCloseShore: TLabel
        Left = 246
        Top = -7
        Width = 9
        Height = 13
        Alignment = taCenter
        Caption = '   '
        Color = clWindow
        ParentColor = False
      end
      object lblCBOpenShore: TLabel
        Left = 117
        Top = 5
        Width = 9
        Height = 13
        Alignment = taCenter
        Caption = '   '
        Color = clWindow
        ParentColor = False
      end
      object rbManShore: TRadioButton
        Left = 15
        Top = 33
        Width = 15
        Height = 17
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = InterShoreModeClick
      end
      object rbOffShore: TRadioButton
        Left = 87
        Top = 33
        Width = 15
        Height = 17
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        TabStop = True
        OnClick = InterShoreModeClick
      end
      object rbAutShore: TRadioButton
        Left = 138
        Top = 33
        Width = 15
        Height = 17
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = InterShoreModeClick
      end
      object btnCBOpenShore: TButton
        Tag = 10
        Left = 26
        Top = 101
        Width = 95
        Height = 31
        Caption = 'OPEN'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = btnInnCBCloseOpenClick
      end
      object btnCBCloseShore: TButton
        Tag = 10
        Left = 145
        Top = 101
        Width = 95
        Height = 31
        Caption = 'CLOSE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = btnInnCBCloseOpenClick
      end
      object Panel18: TPanel
        Left = 17
        Top = 78
        Width = 230
        Height = 1
        BevelOuter = bvNone
        Color = clBtnHighlight
        ParentBackground = False
        TabOrder = 5
      end
    end
    object Panel8: TPanel
      Left = 1023
      Top = 311
      Width = 307
      Height = 50
      BevelOuter = bvNone
      Color = 3749426
      ParentBackground = False
      TabOrder = 9
      object btnCBClosedGen1: TVrDemoButton
        Tag = 2
        Left = 8
        Top = 9
        Width = 291
        Height = 33
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
        Font3D.ShadowColor = clGray
        Caption = 'CIRCUIT BREAKER'
        TabOrder = 0
        OnClick = btnCBClosedClick
      end
    end
    object Panel9: TPanel
      Left = 1350
      Top = 311
      Width = 307
      Height = 50
      BevelOuter = bvNone
      Color = 3749426
      ParentBackground = False
      TabOrder = 10
      object btnCBClosedGen2: TVrDemoButton
        Tag = 2
        Left = 8
        Top = 9
        Width = 291
        Height = 33
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
        Font3D.ShadowColor = clGray
        Caption = 'CIRCUIT BREAKER'
        TabOrder = 0
        OnClick = btnCBClosedClick
      end
    end
    object Panel10: TPanel
      Left = 357
      Top = 311
      Width = 307
      Height = 50
      BevelOuter = bvNone
      Color = 3749426
      ParentBackground = False
      TabOrder = 11
      object btnCBClosedGen4: TVrDemoButton
        Tag = 2
        Left = 8
        Top = 9
        Width = 291
        Height = 33
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
        Font3D.ShadowColor = clGray
        Caption = 'CIRCUIT BREAKER'
        TabOrder = 0
        OnClick = btnCBClosedClick
      end
    end
    object Panel11: TPanel
      Left = 30
      Top = 311
      Width = 307
      Height = 50
      BevelOuter = bvNone
      Color = 3749426
      ParentBackground = False
      TabOrder = 12
      object btnCBClosedGen3: TVrDemoButton
        Tag = 2
        Left = 8
        Top = 9
        Width = 291
        Height = 33
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
        Font3D.ShadowColor = clGray
        Caption = 'CIRCUIT BREAKER'
        TabOrder = 0
        OnClick = btnCBClosedClick
      end
    end
    object pnlForwardInter: TPanel
      Left = 1023
      Top = 414
      Width = 634
      Height = 86
      BevelOuter = bvNone
      Color = 3749426
      ParentBackground = False
      TabOrder = 13
      object Label28: TLabel
        Left = 51
        Top = 29
        Width = 41
        Height = 16
        Caption = 'Manual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label43: TLabel
        Left = 157
        Top = 29
        Width = 17
        Height = 16
        Caption = 'Off'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label44: TLabel
        Left = 244
        Top = 29
        Width = 89
        Height = 16
        Caption = 'Auto Take Over'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblCBCloseInn1: TLabel
        Left = 185
        Top = 125
        Width = 9
        Height = 13
        Alignment = taCenter
        Caption = '   '
        Color = clWindow
        ParentColor = False
      end
      object lblCBOpenInn1: TLabel
        Left = 113
        Top = 125
        Width = 9
        Height = 13
        Alignment = taCenter
        Caption = '   '
        Color = clWindow
        ParentColor = False
      end
      object rbManInn1: TRadioButton
        Left = 33
        Top = 29
        Width = 15
        Height = 17
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = InterCon1ModeClick
      end
      object rbOffInn1: TRadioButton
        Left = 136
        Top = 29
        Width = 15
        Height = 17
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = InterCon1ModeClick
      end
      object rbAutInn1: TRadioButton
        Left = 223
        Top = 29
        Width = 15
        Height = 17
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        TabStop = True
        OnClick = InterCon1ModeClick
      end
      object btnCBCloseInn1: TButton
        Tag = 10
        Left = 414
        Top = 31
        Width = 95
        Height = 31
        Caption = 'CLOSE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = btnInnCBCloseOpenClick
      end
      object btnCBOpenInn1: TButton
        Tag = 10
        Left = 514
        Top = 31
        Width = 95
        Height = 31
        Caption = 'OPEN'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = btnInnCBCloseOpenClick
      end
      object pnl2: TPanel
        Left = 26
        Top = 59
        Width = 313
        Height = 1
        BevelOuter = bvNone
        Color = clBtnHighlight
        ParentBackground = False
        TabOrder = 5
      end
    end
    object Panel19: TPanel
      Left = 30
      Top = 414
      Width = 634
      Height = 86
      BevelOuter = bvNone
      Color = 3749426
      ParentBackground = False
      TabOrder = 14
      object Label22: TLabel
        Left = 51
        Top = 29
        Width = 41
        Height = 16
        Caption = 'Manual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label25: TLabel
        Left = 157
        Top = 29
        Width = 17
        Height = 16
        Caption = 'Off'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label29: TLabel
        Left = 244
        Top = 29
        Width = 89
        Height = 16
        Caption = 'Auto Take Over'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblCBCloseInn2: TLabel
        Left = 168
        Top = 124
        Width = 9
        Height = 13
        Alignment = taCenter
        Caption = '   '
        Color = clWindow
        ParentColor = False
      end
      object lblCBOpenInn2: TLabel
        Left = 129
        Top = 124
        Width = 9
        Height = 13
        Alignment = taCenter
        Caption = '   '
        Color = clWindow
        ParentColor = False
      end
      object rbManInn2: TRadioButton
        Left = 33
        Top = 29
        Width = 15
        Height = 17
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = InterCon2ModeClick
      end
      object rbOffInn2: TRadioButton
        Left = 136
        Top = 29
        Width = 15
        Height = 17
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = InterCon2ModeClick
      end
      object rbAutInn2: TRadioButton
        Left = 223
        Top = 29
        Width = 15
        Height = 17
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        TabStop = True
        OnClick = InterCon2ModeClick
      end
      object btnCBOpenInn2: TButton
        Tag = 10
        Left = 514
        Top = 31
        Width = 95
        Height = 31
        Caption = 'OPEN'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = btnInnCBCloseOpenClick
      end
      object btnCBCloseInn2: TButton
        Tag = 10
        Left = 414
        Top = 31
        Width = 95
        Height = 31
        Caption = 'CLOSE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = btnInnCBCloseOpenClick
      end
      object pnl1: TPanel
        Left = 27
        Top = 59
        Width = 313
        Height = 1
        BevelOuter = bvNone
        Color = clBtnHighlight
        ParentBackground = False
        TabOrder = 5
      end
    end
    object Panel20: TPanel
      Left = 1023
      Top = 377
      Width = 634
      Height = 32
      BevelOuter = bvNone
      Color = 3749426
      ParentBackground = False
      TabOrder = 15
      object Label20: TLabel
        Left = 191
        Top = 7
        Width = 252
        Height = 19
        Align = alCustom
        Alignment = taCenter
        Caption = 'FORWARD INTERCONNECTION'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
    end
    object Panel22: TPanel
      Left = 30
      Top = 377
      Width = 634
      Height = 32
      BevelOuter = bvNone
      Color = 3749426
      ParentBackground = False
      TabOrder = 16
      object Label23: TLabel
        Left = 206
        Top = 6
        Width = 221
        Height = 19
        Align = alCustom
        Alignment = taCenter
        Caption = 'AFTER INTERCONNECTION'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
    end
    object Panel23: TPanel
      Left = 888
      Top = 561
      Width = 244
      Height = 108
      BevelOuter = bvNone
      Color = 3749426
      ParentBackground = False
      TabOrder = 17
      object Label4: TLabel
        Left = 44
        Top = 56
        Width = 28
        Height = 16
        Caption = 'After'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 113
        Top = 56
        Width = 17
        Height = 16
        Caption = 'Off'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 166
        Top = 56
        Width = 48
        Height = 16
        Caption = 'Forward'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblCBOpenClosedE: TLabel
        Left = 149
        Top = 80
        Width = 9
        Height = 13
        Alignment = taCenter
        Caption = '   '
        Color = clWindow
        ParentColor = False
      end
      object lbl6: TLabel
        Left = 41
        Top = 14
        Width = 162
        Height = 19
        Align = alCustom
        Alignment = taCenter
        Caption = 'INTERCONNECTION'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object rbAftDistrE: TRadioButton
        Left = 25
        Top = 56
        Width = 15
        Height = 17
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = InterEmergencyModeClick
      end
      object rbOffDistrE: TRadioButton
        Left = 94
        Top = 56
        Width = 15
        Height = 17
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = InterEmergencyModeClick
      end
      object rbFwdDistrE: TRadioButton
        Left = 147
        Top = 56
        Width = 15
        Height = 17
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = InterEmergencyModeClick
      end
      object Panel24: TPanel
        Left = 23
        Top = 78
        Width = 197
        Height = 1
        BevelOuter = bvNone
        Color = clBtnHighlight
        ParentBackground = False
        TabOrder = 3
      end
    end
    object Panel5: TPanel
      Left = 30
      Top = 616
      Width = 403
      Height = 32
      BevelOuter = bvNone
      Color = 3749426
      ParentBackground = False
      TabOrder = 19
      object Label27: TLabel
        Left = 90
        Top = 7
        Width = 223
        Height = 19
        Align = alCustom
        Alignment = taCenter
        Caption = 'SHORE INTERCONNECTION'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
    end
    object Panel21: TPanel
      Left = 554
      Top = 524
      Width = 578
      Height = 32
      BevelOuter = bvNone
      Color = 3749426
      ParentBackground = False
      TabOrder = 20
      object Label13: TLabel
        Left = 155
        Top = 7
        Width = 233
        Height = 19
        Align = alCustom
        Alignment = taCenter
        Caption = 'EMERGENCY SWITCHBOARD'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
    end
    object lbl1: TPanel
      Left = 555
      Top = 775
      Width = 307
      Height = 50
      BevelOuter = bvNone
      Color = 3749426
      ParentBackground = False
      TabOrder = 21
      object btnCBClosedGenE: TVrDemoButton
        Tag = 2
        Left = 8
        Top = 9
        Width = 291
        Height = 33
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
        Font3D.ShadowColor = clGray
        Caption = 'CIRCUIT BREAKER'
        TabOrder = 0
        OnClick = btnCBClosedClick
      end
    end
    object grp1: TGroupBox
      Left = 1023
      Top = 720
      Width = 226
      Height = 105
      Caption = 'grp1'
      TabOrder = 22
      Visible = False
      object btn1: TButton
        Tag = 10
        Left = 120
        Top = 55
        Width = 95
        Height = 31
        Caption = 'False'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        Visible = False
        OnClick = emergency
      end
      object edt1: TEdit
        Left = 20
        Top = 28
        Width = 193
        Height = 21
        TabOrder = 1
        Visible = False
      end
      object btnabc: TButton
        Tag = 10
        Left = 19
        Top = 55
        Width = 95
        Height = 31
        Caption = 'True'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        Visible = False
        OnClick = emergency
      end
    end
    object pnl3: TPanel
      Left = 301
      Top = 663
      Width = 132
      Height = 162
      BevelOuter = bvNone
      Color = 3749426
      ParentBackground = False
      TabOrder = 23
      object lbl8: TLabel
        Left = 246
        Top = -7
        Width = 9
        Height = 13
        Alignment = taCenter
        Caption = '   '
        Color = clWindow
        ParentColor = False
      end
      object lblEngineRunGenShore: TLabel
        Left = 18
        Top = 35
        Width = 9
        Height = 13
        Alignment = taCenter
        Caption = '   '
        Color = clSilver
        ParentColor = False
        Transparent = False
      end
      object lbl9: TLabel
        Left = 33
        Top = 33
        Width = 81
        Height = 16
        Caption = 'Busbar Supply'
        Color = clInactiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object btnStartGenShore: TButton
        Tag = 10
        Left = 9
        Top = 103
        Width = 53
        Height = 31
        Caption = 'START'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnStartClick
      end
      object btnStopGenShore: TButton
        Tag = 10
        Left = 68
        Top = 103
        Width = 53
        Height = 31
        Caption = 'STOP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnStopClick
      end
      object pnl4: TPanel
        Left = 16
        Top = 78
        Width = 100
        Height = 1
        BevelOuter = bvNone
        Color = clBtnHighlight
        ParentBackground = False
        TabOrder = 2
      end
    end
  end
end
