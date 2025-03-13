object frmHMIGearBox: TfrmHMIGearBox
  Left = -1133
  Top = 100
  Caption = 'frmHMIGearBox'
  ClientHeight = 692
  ClientWidth = 1039
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
  object lbl7: TLabel
    Left = 79
    Top = 671
    Width = 250
    Height = 17
    AutoSize = False
    Caption = 'OIL TANK LOW LEVEL 99'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object pnl2: TPanel
    Left = 8
    Top = 8
    Width = 265
    Height = 116
    Color = clTeal
    ParentBackground = False
    TabOrder = 0
    object btn4: TSpeedButtonImage
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
    object btn5: TSpeedButtonImage
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
    object btnGear1: TSpeedButtonImage
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
    object spdGear1: TSpeedo
      Left = 6
      Top = 7
      Width = 100
      Height = 100
      LoadImage = 'D:\IPMS\resources\LCP\LCP_HMI meter 06a.bmp'
      Kalibrasi = 0.700000000000000000
      PanjangJarum = 50
    end
  end
  object pnl1: TPanel
    Left = 279
    Top = 8
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
    object btnGear2: TSpeedButtonImage
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
    object spdGear2: TSpeedo
      Left = 6
      Top = 7
      Width = 100
      Height = 100
      LoadImage = 'D:\IPMS\resources\LCP\LCP_HMI meter 06b.bmp'
      ZeroPosition = 221.000000000000000000
      Kalibrasi = 2.780000000000000000
      PanjangJarum = 50
    end
  end
  object pnl3: TPanel
    Left = 550
    Top = 8
    Width = 265
    Height = 116
    Color = clTeal
    ParentBackground = False
    TabOrder = 2
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
    object btnGear3: TSpeedButtonImage
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
    object spdGear3: TSpeedo
      Left = 6
      Top = 7
      Width = 100
      Height = 100
      LoadImage = 'D:\IPMS\resources\LCP\LCP_HMI meter 06c.bmp'
      ZeroPosition = 225.000000000000000000
      Kalibrasi = 0.225000000000000000
      PanjangJarum = 50
    end
  end
  object pnl4: TPanel
    Left = 8
    Top = 130
    Width = 265
    Height = 116
    Color = clTeal
    ParentBackground = False
    TabOrder = 3
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
    object btnGear4: TSpeedButtonImage
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
    object spdGear4: TSpeedo
      Left = 6
      Top = 7
      Width = 100
      Height = 100
      LoadImage = 'D:\IPMS\resources\LCP\LCP_HMI meter 06d.bmp'
      ZeroPosition = 231.000000000000000000
      Kalibrasi = 10.300000000000000000
      PanjangJarum = 50
    end
  end
  object pnl5: TPanel
    Left = 279
    Top = 130
    Width = 265
    Height = 116
    Color = clTeal
    ParentBackground = False
    TabOrder = 4
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
    object btnGear5: TSpeedButtonImage
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
    object spdGear5: TSpeedo
      Left = 6
      Top = 7
      Width = 100
      Height = 100
      LoadImage = 'D:\IPMS\resources\LCP\LCP_HMI meter 06e.bmp'
      ZeroPosition = 224.000000000000000000
      Kalibrasi = 27.300000000000000000
      PanjangJarum = 50
    end
  end
  object pnl6: TPanel
    Left = 550
    Top = 130
    Width = 265
    Height = 116
    Color = clTeal
    ParentBackground = False
    TabOrder = 5
    object btn15: TSpeedButtonImage
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
    object btn16: TSpeedButtonImage
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
    object btnGear6: TSpeedButtonImage
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
    object spdGear6: TSpeedo
      Left = 6
      Top = 7
      Width = 100
      Height = 100
      LoadImage = 'D:\IPMS\resources\LCP\LCP_HMI meter 06f.bmp'
      ZeroPosition = 231.000000000000000000
      Kalibrasi = 10.300000000000000000
      PanjangJarum = 50
    end
  end
  object pnl7: TPanel
    Left = 8
    Top = 252
    Width = 449
    Height = 245
    BorderWidth = 3
    BorderStyle = bsSingle
    Color = clTeal
    ParentBackground = False
    TabOrder = 6
    object lbl1: TLabel
      Left = 16
      Top = 45
      Width = 48
      Height = 16
      Caption = 'LUB OIL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl2: TLabel
      Left = 16
      Top = 154
      Width = 82
      Height = 16
      Caption = 'CONTROL OIL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object pnl9: TPanel
      Left = 46
      Top = 15
      Width = 367
      Height = 26
      Alignment = taLeftJustify
      Caption = 'ENGINE OUTLET FRESH WATER HIGH TEMPERATURE'
      Color = clTeal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object pnl10: TPanel
      Left = 178
      Top = 55
      Width = 235
      Height = 26
      Alignment = taLeftJustify
      Caption = 'ALARM LOW PRESSURE 163'
      Color = clTeal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
    end
    object pnl11: TPanel
      Left = 178
      Top = 83
      Width = 235
      Height = 26
      Alignment = taLeftJustify
      Caption = 'LOW PRESSURE START INTERLOCK 145'
      Color = clTeal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
    end
    object pnl12: TPanel
      Left = 178
      Top = 110
      Width = 235
      Height = 26
      Alignment = taLeftJustify
      Caption = 'LUB OIL FILTER CLOGGING 98'
      Color = clTeal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 3
    end
    object pnl13: TPanel
      Left = 178
      Top = 154
      Width = 235
      Height = 26
      Alignment = taLeftJustify
      Caption = 'CONTROL OIL FILTER CLOGGING 97'
      Color = clTeal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 4
    end
    object pnl14: TPanel
      Left = 178
      Top = 183
      Width = 235
      Height = 26
      Alignment = taLeftJustify
      Caption = 'LOW PRESSURE START PUMP 146'
      Color = clTeal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 5
    end
    object pnl15: TPanel
      Left = 178
      Top = 211
      Width = 235
      Height = 26
      Alignment = taLeftJustify
      Caption = 'LOW PRESSURE CLUTCH OUT 147'
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
    object pnl16: TPanel
      Left = 16
      Top = 66
      Width = 97
      Height = 40
      Caption = 'PP3 ON'
      Color = clLime
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 7
    end
    object pnl17: TPanel
      Left = 16
      Top = 108
      Width = 97
      Height = 22
      Caption = 'REMOTE'
      Color = clLime
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 8
    end
    object pnl18: TPanel
      Left = 16
      Top = 172
      Width = 97
      Height = 40
      Caption = 'PP4 OFF'
      Color = clRed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 9
    end
    object pnl19: TPanel
      Left = 16
      Top = 214
      Width = 97
      Height = 22
      Caption = 'LOCAL'
      Color = 4092397
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 10
    end
  end
  object pnl8: TPanel
    Left = 487
    Top = 252
    Width = 314
    Height = 205
    BorderWidth = 3
    BorderStyle = bsSingle
    Color = clTeal
    ParentBackground = False
    TabOrder = 7
    object lbl3: TLabel
      Left = 106
      Top = 13
      Width = 86
      Height = 16
      Caption = 'SHAFT BRAKE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object pnl20: TPanel
      Left = 23
      Top = 55
      Width = 106
      Height = 26
      Caption = 'DISENGAGED'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object pnl21: TPanel
      Left = 23
      Top = 83
      Width = 235
      Height = 26
      Caption = 'STARTER BOX READY FOR OPERATION'
      Color = clTeal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
    end
    object pnl22: TPanel
      Left = 23
      Top = 110
      Width = 235
      Height = 26
      Caption = 'BRAKE PUMP OFF'
      Color = clTeal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
    end
  end
  object pnl23: TPanel
    Left = 87
    Top = 509
    Width = 235
    Height = 26
    Alignment = taLeftJustify
    Caption = 'OIL TANK LOW LEVEL 99'
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
end
