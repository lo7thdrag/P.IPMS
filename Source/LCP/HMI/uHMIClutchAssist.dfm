object frmHMIClutchingAssist: TfrmHMIClutchingAssist
  Left = -1252
  Top = 434
  Caption = 'frmHMIClutchingAssist'
  ClientHeight = 596
  ClientWidth = 1041
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
    object btnClutch1: TSpeedButtonImage
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
    object spdCLutch1: TSpeedo
      Left = 6
      Top = 7
      Width = 100
      Height = 100
      LoadImage = 'D:\IPMS\resources\LCP\LCP_HMI meter 05a.bmp'
      ZeroPosition = 225.000000000000000000
      Kalibrasi = 0.225000000000000000
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
    object btnClutch2: TSpeedButtonImage
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
    object spdClutch2: TSpeedo
      Left = 4
      Top = 7
      Width = 100
      Height = 100
      LoadImage = 'D:\IPMS\resources\LCP\LCP_HMI meter 05b.bmp'
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
    object btnClutch3: TSpeedButtonImage
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
    object spdClutch3: TSpeedo
      Left = 6
      Top = 7
      Width = 100
      Height = 100
      LoadImage = 'D:\IPMS\resources\LCP\LCP_HMI meter 05c.bmp'
      ZeroPosition = 215.000000000000000000
      Kalibrasi = 1.800000000000000000
      PanjangJarum = 50
    end
  end
  object pnl6: TPanel
    Left = 258
    Top = 151
    Width = 307
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
    TabOrder = 3
  end
  object pnl4: TPanel
    Left = 258
    Top = 223
    Width = 307
    Height = 26
    Alignment = taLeftJustify
    Caption = 'SHAFT BRAKE ENGAGED'
    Color = 4092397
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 4
  end
  object pnl5: TPanel
    Left = 258
    Top = 251
    Width = 307
    Height = 26
    Alignment = taLeftJustify
    Caption = 'CTRL OIL LOW PRESS MULTI-DISC CLUTCH'
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
  object pnl7: TPanel
    Left = 258
    Top = 279
    Width = 307
    Height = 26
    Alignment = taLeftJustify
    Caption = 'CLUTCHING AHEAD SEQUENCE OK'
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
  object pnl8: TPanel
    Left = 258
    Top = 308
    Width = 307
    Height = 26
    Alignment = taLeftJustify
    Caption = 'CLUTCHING ASTERN SEQUENCE OK'
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
  object pnl9: TPanel
    Left = 258
    Top = 337
    Width = 307
    Height = 26
    Alignment = taLeftJustify
    Caption = 'DECLUTCHING SEQUENCE OK'
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
  object pnl10: TPanel
    Left = 281
    Top = 394
    Width = 265
    Height = 116
    Color = clTeal
    ParentBackground = False
    TabOrder = 9
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
    object btnClutch4: TSpeedButtonImage
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
    object spdClutch4: TSpeedo
      Left = 6
      Top = 7
      Width = 100
      Height = 100
      LoadImage = 'D:\IPMS\resources\LCP\LCP_HMI meter 05d.bmp'
      Kalibrasi = 0.700000000000000000
      PanjangJarum = 50
    end
  end
end
