object frmHMIAIrAndGas: TfrmHMIAIrAndGas
  Left = -1307
  Top = 662
  Caption = 'frmHMIAirAndGas'
  ClientHeight = 635
  ClientWidth = 990
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
  object pnl3: TPanel
    Left = 6
    Top = 5
    Width = 265
    Height = 116
    Color = clTeal
    ParentBackground = False
    TabOrder = 0
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
    object btnAirGas1: TSpeedButtonImage
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
    object spdN1: TSpeedo
      Left = 6
      Top = 7
      Width = 100
      Height = 100
      LoadImage = 'D:\IPMS\resources\LCP\LCP_HMI meter 04a.bmp'
      ZeroPosition = 235.000000000000000000
      Kalibrasi = 0.071500000000000000
      PanjangJarum = 50
    end
  end
  object pnl1: TPanel
    Left = 278
    Top = 5
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
    object btnAirGas2: TSpeedButtonImage
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
    object spdInlet: TSpeedo
      Left = 6
      Top = 7
      Width = 100
      Height = 100
      LoadImage = 'D:\IPMS\resources\LCP\LCP_HMI meter 04b.bmp'
      ZeroPosition = 216.000000000000000000
      Kalibrasi = 72.000000000000000000
      PanjangJarum = 50
    end
  end
  object pnl2: TPanel
    Left = 6
    Top = 128
    Width = 265
    Height = 116
    Color = clTeal
    ParentBackground = False
    TabOrder = 2
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
    object btnAirGas3: TSpeedButtonImage
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
    object spdN2: TSpeedo
      Left = 6
      Top = 7
      Width = 100
      Height = 100
      LoadImage = 'D:\IPMS\resources\LCP\LCP_HMI meter 04c.bmp'
      ZeroPosition = 235.000000000000000000
      Kalibrasi = 0.071500000000000000
      PanjangJarum = 50
    end
  end
  object pnl15: TPanel
    Left = 573
    Top = 23
    Width = 233
    Height = 26
    Alignment = taLeftJustify
    Caption = 'AIR VALVE OPEN'
    Color = clGray
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clYellow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 3
  end
  object pnl4: TPanel
    Left = 573
    Top = 54
    Width = 233
    Height = 26
    Alignment = taLeftJustify
    Caption = 'GAZ VALVE OPEN'
    Color = clGray
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clYellow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 4
  end
  object pnl5: TPanel
    Left = 573
    Top = 84
    Width = 233
    Height = 26
    Alignment = taLeftJustify
    Caption = 'BYPASS P2/P4 OPEN'
    Color = clGray
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clYellow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 5
  end
  object pnl6: TPanel
    Left = 573
    Top = 115
    Width = 233
    Height = 26
    Alignment = taLeftJustify
    Caption = '1 TC RUNNING'
    Color = clGray
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clYellow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 6
  end
  object pnl7: TPanel
    Left = 573
    Top = 146
    Width = 233
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
    TabOrder = 7
  end
  object pnl8: TPanel
    Left = 573
    Top = 177
    Width = 233
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
    TabOrder = 8
  end
  object pnl9: TPanel
    Left = 573
    Top = 208
    Width = 233
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
    TabOrder = 9
  end
end
