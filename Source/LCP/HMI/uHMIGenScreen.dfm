object frmHMIGenScreen: TfrmHMIGenScreen
  Left = 179
  Top = 147
  Caption = 'frmHMIGenScreen'
  ClientHeight = 660
  ClientWidth = 1014
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
  object pnl1: TPanel
    Left = 6
    Top = 5
    Width = 265
    Height = 116
    Color = clTeal
    ParentBackground = False
    TabOrder = 0
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
    object btnGen1: TSpeedButtonImage
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
    object spdEngAir: TSpeedo
      Left = 6
      Top = 7
      Width = 100
      Height = 100
      LoadImage = 'D:\IPMS\source\LCP\Images\HMI_0to4.bmp'
      ZeroPosition = 216.000000000000000000
      Kalibrasi = 72.000000000000000000
      PanjangJarum = 50
    end
  end
  object pnl2: TPanel
    Left = 277
    Top = 5
    Width = 265
    Height = 116
    Color = clTeal
    ParentBackground = False
    TabOrder = 1
    object btn4: TSpeedButtonImage
      Left = 109
      Top = 6
      Width = 149
      Height = 22
      Caption = 'ST002 RPM'
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
    object btnGen2: TSpeedButtonImage
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
    object spdENgSpeed: TSpeedo
      Left = 6
      Top = 7
      Width = 100
      Height = 100
      LoadImage = 'D:\IPMS\source\LCP\Images\HMI_0to1200.bmp'
      ZeroPosition = 225.000000000000000000
      Kalibrasi = 0.225000000000000000
      PanjangJarum = 50
    end
  end
  object pnl3: TPanel
    Left = 546
    Top = 5
    Width = 265
    Height = 116
    Color = clTeal
    ParentBackground = False
    TabOrder = 2
    object btn7: TSpeedButtonImage
      Left = 109
      Top = 6
      Width = 149
      Height = 22
      Caption = 'ZT006 mm'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Color = clInfoBk
    end
    object btn8: TSpeedButtonImage
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
    object btnGen3: TSpeedButtonImage
      Left = 109
      Top = 56
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
    object spdFuelRack: TSpeedo
      Left = 6
      Top = 7
      Width = 100
      Height = 100
      LoadImage = 'D:\IPMS\source\LCP\Images\HMI_0to35.bmp'
      ZeroPosition = 221.000000000000000000
      Kalibrasi = 8.000000000000000000
      PanjangJarum = 50
    end
  end
  object pnl4: TPanel
    Left = 6
    Top = 125
    Width = 265
    Height = 116
    Color = clTeal
    ParentBackground = False
    TabOrder = 3
    object btn10: TSpeedButtonImage
      Left = 109
      Top = 6
      Width = 149
      Height = 22
      Caption = 'ST116 RPM'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Color = clInfoBk
    end
    object btn11: TSpeedButtonImage
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
    object btnGen4: TSpeedButtonImage
      Left = 109
      Top = 56
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
    object spdTurboN1: TSpeedo
      Left = 6
      Top = 7
      Width = 100
      Height = 100
      LoadImage = 'D:\IPMS\resources\LCP\LCP_HMI meter 01d.bmp'
      ZeroPosition = 235.000000000000000000
      Kalibrasi = 0.071500000000000000
      PanjangJarum = 50
    end
  end
  object pnl5: TPanel
    Left = 277
    Top = 125
    Width = 265
    Height = 116
    Color = clTeal
    ParentBackground = False
    TabOrder = 4
    object btn13: TSpeedButtonImage
      Left = 109
      Top = 6
      Width = 149
      Height = 22
      Caption = 'RPM'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Color = clInfoBk
    end
    object btn14: TSpeedButtonImage
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
    object btnGen5: TSpeedButtonImage
      Left = 109
      Top = 56
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
    object spdDigSpeed: TSpeedo
      Left = 6
      Top = 7
      Width = 100
      Height = 100
      LoadImage = 'D:\IPMS\resources\LCP\LCP_HMI meter 01e.bmp'
      ZeroPosition = 226.000000000000000000
      Kalibrasi = 0.224000000000000000
      PanjangJarum = 50
    end
  end
  object pnl6: TPanel
    Left = 546
    Top = 125
    Width = 265
    Height = 116
    Color = clTeal
    ParentBackground = False
    TabOrder = 5
    object btn16: TSpeedButtonImage
      Left = 109
      Top = 6
      Width = 149
      Height = 22
      Caption = 'ST117 RPM'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Color = clInfoBk
    end
    object btn17: TSpeedButtonImage
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
    object btnGen6: TSpeedButtonImage
      Left = 109
      Top = 56
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
    object spdTurboSpeedN2: TSpeedo
      Left = 6
      Top = 7
      Width = 100
      Height = 100
      LoadImage = 'D:\IPMS\resources\LCP\LCP_HMI meter 01d.bmp'
      ZeroPosition = 235.000000000000000000
      Kalibrasi = 0.071500000000000000
      PanjangJarum = 50
    end
  end
  object pnl7: TPanel
    Left = 277
    Top = 395
    Width = 265
    Height = 116
    Color = clTeal
    ParentBackground = False
    TabOrder = 6
    object btn19: TSpeedButtonImage
      Left = 109
      Top = 6
      Width = 149
      Height = 22
      Caption = 'RPM'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Color = clInfoBk
    end
    object btn20: TSpeedButtonImage
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
    object btnGen7: TSpeedButtonImage
      Left = 109
      Top = 56
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
    object spdShaft: TSpeedo
      Left = 6
      Top = 7
      Width = 100
      Height = 100
      LoadImage = 'D:\IPMS\resources\LCP\LCP_HMI meter 01g.bmp'
      Kalibrasi = 0.720000000000000000
      PanjangJarum = 50
    end
  end
  object pnl15: TPanel
    Left = 23
    Top = 244
    Width = 155
    Height = 26
    Alignment = taLeftJustify
    Caption = 'ENGINE STOPPED'
    Color = clGray
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clYellow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 7
  end
  object pnl8: TPanel
    Left = 23
    Top = 276
    Width = 155
    Height = 26
    Alignment = taLeftJustify
    Caption = 'STARTING INTERLOCKS'
    Color = 4092397
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 8
  end
  object pnl9: TPanel
    Left = 178
    Top = 276
    Width = 155
    Height = 26
    Alignment = taLeftJustify
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 9
  end
  object pnl10: TPanel
    Left = 178
    Top = 303
    Width = 155
    Height = 26
    Alignment = taLeftJustify
    Caption = 'CONTROL SYSTEM FAIL'
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
    Left = 23
    Top = 332
    Width = 155
    Height = 26
    Alignment = taLeftJustify
    Caption = 'CLUTCH INTERLOCKS'
    Color = 4092397
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 11
  end
  object pnl12: TPanel
    Left = 178
    Top = 332
    Width = 155
    Height = 26
    Alignment = taLeftJustify
    Caption = 'STC IN AUTOMATIC MODE'
    Color = clLime
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 12
  end
  object pnl13: TPanel
    Left = 23
    Top = 359
    Width = 155
    Height = 26
    Alignment = taLeftJustify
    Caption = 'FUEL RACK LIMITATION'
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
    Left = 178
    Top = 359
    Width = 155
    Height = 26
    Alignment = taLeftJustify
    Caption = 'SPEED NORMAL RAMP'
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
  object pnl16: TPanel
    Left = 333
    Top = 244
    Width = 311
    Height = 26
    Alignment = taLeftJustify
    Caption = 'ENGINE CONTROLLER MINOR FAULT'
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
  object pnl17: TPanel
    Left = 333
    Top = 276
    Width = 311
    Height = 26
    Alignment = taLeftJustify
    Caption = 'ENGINE CONTROLLER IN OPERATION'
    Color = clLime
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 16
  end
  object pnl18: TPanel
    Left = 333
    Top = 303
    Width = 155
    Height = 26
    Alignment = taLeftJustify
    Caption = 'STARTING FAILURE'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 17
  end
  object pnl19: TPanel
    Left = 489
    Top = 303
    Width = 155
    Height = 26
    Alignment = taLeftJustify
    Caption = 'SLOW TURNING FAILURE'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 18
  end
  object pnl20: TPanel
    Left = 333
    Top = 332
    Width = 155
    Height = 26
    Alignment = taLeftJustify
    Caption = 'STC ALARM'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 19
  end
  object pnl21: TPanel
    Left = 489
    Top = 332
    Width = 155
    Height = 26
    Alignment = taLeftJustify
    Caption = 'STC FAILURE'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 20
  end
  object pnl22: TPanel
    Left = 333
    Top = 359
    Width = 155
    Height = 26
    Alignment = taLeftJustify
    Caption = 'CRASH STOP IN PROGRESS'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 21
  end
  object pnl23: TPanel
    Left = 489
    Top = 359
    Width = 155
    Height = 26
    Alignment = taLeftJustify
    Caption = 'CRASH STOP FAILURE'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 22
  end
end
