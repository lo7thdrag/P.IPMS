object frmHMILubOilCircuit: TfrmHMILubOilCircuit
  Left = 513
  Top = 365
  Caption = 'frmHMILubOilCircuit'
  ClientHeight = 698
  ClientWidth = 1072
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btn16: TSpeedButtonImage
    Left = 633
    Top = 345
    Width = 129
    Height = 50
    Caption = 'PUMP OFF'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clSilver
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Color = clGray
  end
  object grpRemote: TGroupBox
    Left = 633
    Top = 178
    Width = 129
    Height = 167
    Color = clSilver
    Ctl3D = False
    ParentBackground = False
    ParentColor = False
    ParentCtl3D = False
    TabOrder = 0
    object lbl11: TLabel
      Left = 50
      Top = 74
      Width = 31
      Height = 13
      Caption = 'AUTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl12: TLabel
      Left = 101
      Top = 74
      Width = 15
      Height = 13
      Caption = 'ON'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl13: TLabel
      Left = 14
      Top = 74
      Width = 20
      Height = 13
      Caption = 'OFF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnLub6: TSpeedButtonImage
      Left = 14
      Top = 14
      Width = 105
      Height = 50
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Color = clSkyBlue
    end
    object vrtryswtchRemote: TVrRotarySwitch
      Left = 35
      Top = 93
      Width = 60
      Height = 73
      Radius = 30
      SwitchPositions.Strings = (
        ''
        '')
      SwitchAngleStart = 135
      SwitchAngleEnd = 225
      SwitchColor = clBlack
      ButtonColor = clBlack
      WinchOffset = 8
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
    end
  end
  object pnl1: TPanel
    Left = 8
    Top = 6
    Width = 265
    Height = 116
    Color = clTeal
    ParentBackground = False
    TabOrder = 1
    object btn1: TSpeedButtonImage
      Left = 109
      Top = 6
      Width = 149
      Height = 22
      Caption = 'PT119 bar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Color = clInfoBk
    end
    object btn2: TSpeedButtonImage
      Left = 109
      Top = 28
      Width = 149
      Height = 29
      Caption = '0.0'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Color = clTeal
    end
    object btnLub1: TSpeedButtonImage
      Left = 109
      Top = 57
      Width = 149
      Height = 50
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Color = clSkyBlue
    end
    object spdEngInPres: TSpeedo
      Left = 6
      Top = 7
      Width = 100
      Height = 100
      LoadImage = 'D:\IPMS\resources\LCP\LCP_HMI meter 02a.bmp'
      ZeroPosition = 223.000000000000000000
      Kalibrasi = 27.500000000000000000
      PanjangJarum = 50
    end
  end
  object pnl2: TPanel
    Left = 281
    Top = 6
    Width = 265
    Height = 116
    Color = clTeal
    ParentBackground = False
    TabOrder = 2
    object btn3: TSpeedButtonImage
      Left = 109
      Top = 6
      Width = 149
      Height = 22
      Caption = 'PT119 bar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Color = clInfoBk
    end
    object btn4: TSpeedButtonImage
      Left = 109
      Top = 28
      Width = 149
      Height = 29
      Caption = '0.0'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Color = clTeal
    end
    object btnLub2: TSpeedButtonImage
      Left = 109
      Top = 57
      Width = 149
      Height = 50
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Color = clSkyBlue
    end
    object spdLATC: TSpeedo
      Left = 6
      Top = 7
      Width = 100
      Height = 100
      LoadImage = 'D:\IPMS\resources\LCP\LCP_HMI meter 02b.bmp'
      ZeroPosition = 223.000000000000000000
      Kalibrasi = 2.750000000000000000
      PanjangJarum = 50
    end
  end
  object pnl3: TPanel
    Left = 552
    Top = 6
    Width = 265
    Height = 116
    Color = clTeal
    ParentBackground = False
    TabOrder = 3
    object btn6: TSpeedButtonImage
      Left = 109
      Top = 6
      Width = 149
      Height = 22
      Caption = 'PT119 bar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Color = clInfoBk
    end
    object btn7: TSpeedButtonImage
      Left = 109
      Top = 28
      Width = 149
      Height = 29
      Caption = '0.0'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Color = clTeal
    end
    object btnLub3: TSpeedButtonImage
      Left = 109
      Top = 57
      Width = 149
      Height = 50
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Color = clSkyBlue
    end
    object spdTurboChar: TSpeedo
      Left = 6
      Top = 7
      Width = 100
      Height = 100
      LoadImage = 'D:\IPMS\resources\LCP\LCP_HMI meter 02c.bmp'
      ZeroPosition = 216.000000000000000000
      Kalibrasi = 72.000000000000000000
      PanjangJarum = 50
    end
  end
  object pnl4: TPanel
    Left = 8
    Top = 127
    Width = 265
    Height = 116
    Color = clTeal
    ParentBackground = False
    TabOrder = 4
    object btn9: TSpeedButtonImage
      Left = 109
      Top = 6
      Width = 149
      Height = 22
      Caption = 'PT119 bar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Color = clInfoBk
    end
    object btn10: TSpeedButtonImage
      Left = 109
      Top = 28
      Width = 149
      Height = 29
      Caption = '0.0'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Color = clTeal
    end
    object btnLub4: TSpeedButtonImage
      Left = 109
      Top = 57
      Width = 149
      Height = 50
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Color = clSkyBlue
    end
    object spdEngInTemp: TSpeedo
      Left = 6
      Top = 7
      Width = 100
      Height = 100
      LoadImage = 'D:\IPMS\resources\LCP\LCP_HMI meter 02d.bmp'
      ZeroPosition = 223.000000000000000000
      Kalibrasi = 2.750000000000000000
      PanjangJarum = 50
    end
  end
  object pnl5: TPanel
    Left = 281
    Top = 127
    Width = 265
    Height = 116
    Color = clTeal
    ParentBackground = False
    TabOrder = 5
    object btn12: TSpeedButtonImage
      Left = 109
      Top = 6
      Width = 149
      Height = 22
      Caption = 'PT119 bar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Color = clInfoBk
    end
    object btn13: TSpeedButtonImage
      Left = 109
      Top = 28
      Width = 149
      Height = 29
      Caption = '0.0'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Color = clTeal
    end
    object btnLub5: TSpeedButtonImage
      Left = 109
      Top = 57
      Width = 149
      Height = 50
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Color = clSkyBlue
    end
    object spdLBTC: TSpeedo
      Left = 6
      Top = 7
      Width = 100
      Height = 100
      LoadImage = 'D:\IPMS\resources\LCP\LCP_HMI meter 02e.bmp'
      ZeroPosition = 223.000000000000000000
      Kalibrasi = 2.750000000000000000
      PanjangJarum = 50
    end
  end
  object pnl6: TPanel
    Left = 325
    Top = 420
    Width = 311
    Height = 26
    Alignment = taLeftJustify
    Caption = 'PRELUBRICATING FAULT'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 6
  end
  object pnl7: TPanel
    Left = 325
    Top = 452
    Width = 311
    Height = 26
    Alignment = taLeftJustify
    Caption = 'PRELUBRICATING SEQUENCE IN PROGRESS'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 7
  end
  object pnl8: TPanel
    Left = 8
    Top = 452
    Width = 311
    Height = 26
    Alignment = taLeftJustify
    Caption = 'ENGINE INLET LUB OIL VERY HIGH TEMPERATURE'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 8
  end
  object pnl9: TPanel
    Left = 8
    Top = 420
    Width = 311
    Height = 26
    Alignment = taLeftJustify
    Caption = 'ENGINE INLET VERY LOW LUB OIL PRESSURE'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 9
  end
  object pnl10: TPanel
    Left = 8
    Top = 391
    Width = 311
    Height = 26
    Alignment = taLeftJustify
    Caption = 'TC LB OUTLET LUB OIL HIGH TEMPERATURE'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 10
  end
  object pnl11: TPanel
    Left = 8
    Top = 363
    Width = 311
    Height = 26
    Alignment = taLeftJustify
    Caption = 'TC LA OUTLET LUB OIL HIGH TEMPERATURE'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 11
  end
  object pnl12: TPanel
    Left = 8
    Top = 335
    Width = 311
    Height = 26
    Alignment = taLeftJustify
    Caption = 'ENGINE INLET LUB OIL HIGH TEMPERATURE'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 12
  end
  object pnl13: TPanel
    Left = 8
    Top = 306
    Width = 311
    Height = 26
    Alignment = taLeftJustify
    Caption = 'ENGINE INLET LUB OIL LOW PRESSURE'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 13
  end
  object pnl14: TPanel
    Left = 8
    Top = 277
    Width = 311
    Height = 26
    Alignment = taLeftJustify
    Caption = 'ENGINE OIL SUMP TANK LOW LEVEL'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 14
  end
  object pnl15: TPanel
    Left = 8
    Top = 247
    Width = 311
    Height = 26
    Alignment = taLeftJustify
    Caption = 'CLOGGING LUB OIL FILTER'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 15
  end
end
