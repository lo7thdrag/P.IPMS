object frmHMISafeStopAndStartingInter: TfrmHMISafeStopAndStartingInter
  Left = -1139
  Top = 67
  Caption = 'frmHMISafeStopAndStartingInter'
  ClientHeight = 658
  ClientWidth = 955
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 464
    Top = 600
    Width = 207
    Height = 19
    Caption = 'ENGINE SPEED SVAE(RPM): '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clYellow
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 666
    Top = 600
    Width = 9
    Height = 19
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clYellow
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object pnl9: TPanel
    Left = 69
    Top = 8
    Width = 268
    Height = 49
    Caption = 'SAFETIES STOP'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
  end
  object pnl14: TPanel
    Left = 26
    Top = 63
    Width = 359
    Height = 26
    Alignment = taLeftJustify
    Caption = 'EMERGENCY SHUTDOWN'
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
  object pnl1: TPanel
    Left = 26
    Top = 93
    Width = 359
    Height = 26
    Alignment = taLeftJustify
    Caption = 'OVERSPEED 112%'
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
  object pnl2: TPanel
    Left = 26
    Top = 124
    Width = 359
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
    TabOrder = 3
  end
  object pnl3: TPanel
    Left = 26
    Top = 155
    Width = 359
    Height = 26
    Alignment = taLeftJustify
    Caption = 'GEAR BOX LUB OIL VERY LOW PRESSURE'
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
  object pnl4: TPanel
    Left = 494
    Top = 8
    Width = 357
    Height = 49
    Caption = 'STARTING INTERLOCKS'
    Color = 4092397
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 5
  end
  object pnl5: TPanel
    Left = 464
    Top = 63
    Width = 430
    Height = 26
    Alignment = taLeftJustify
    Caption = 'OVERSPEED AIR RECEIVER LOW PRESSURE'
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
  object pnl6: TPanel
    Left = 464
    Top = 93
    Width = 430
    Height = 26
    Alignment = taLeftJustify
    Caption = 'ENGINE SPEED < Rpm'
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
  object pnl7: TPanel
    Left = 464
    Top = 124
    Width = 430
    Height = 26
    Alignment = taLeftJustify
    Caption = 'TURNING GEAR DISENGAGED'
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
  object pnl8: TPanel
    Left = 464
    Top = 155
    Width = 430
    Height = 26
    Alignment = taLeftJustify
    Caption = 'MANUAL HANDLE TO STOP POSITION'
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
    Left = 464
    Top = 186
    Width = 430
    Height = 26
    Alignment = taLeftJustify
    Caption = 'LUB OIL LOW PRESSURE GEAR BOX UNIT INLET'
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
    Left = 464
    Top = 217
    Width = 430
    Height = 26
    Alignment = taLeftJustify
    Caption = 'SAFETY CIRCUIT FAILURE'
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
    Left = 464
    Top = 248
    Width = 430
    Height = 26
    Alignment = taLeftJustify
    Caption = 'SAFETY CIRCUIT FAILURE'
    Color = 4092397
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
    Left = 26
    Top = 203
    Width = 359
    Height = 174
    Color = clSkyBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 13
    object btn1: TSpeedButtonImage
      Left = 15
      Top = 8
      Width = 169
      Height = 22
      Caption = 'SAFETIES CAN BE OVERRIDEN'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Color = clSkyBlue
    end
    object pnl15: TPanel
      Left = 6
      Top = 34
      Width = 344
      Height = 26
      Alignment = taLeftJustify
      Caption = 'FRESH WATER EXPANSION TANK VERY LOW LEVEL'
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
    object pnl16: TPanel
      Left = 6
      Top = 58
      Width = 344
      Height = 26
      Alignment = taLeftJustify
      Caption = 'ENGINE OUTLET FRESH WATER VERY HIGH TEMPERATURE'
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
    object pnl17: TPanel
      Left = 6
      Top = 85
      Width = 344
      Height = 26
      Alignment = taLeftJustify
      Caption = 'ENGINE BEARING VERY HIGH TEMPERATURE'
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
    object pnl18: TPanel
      Left = 6
      Top = 111
      Width = 344
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
      TabOrder = 3
    end
    object pnl19: TPanel
      Left = 6
      Top = 136
      Width = 344
      Height = 26
      Alignment = taLeftJustify
      Caption = 'CONNECTING ROD STOP TEMPERATURE'
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
  end
  object pnl20: TPanel
    Left = 464
    Top = 299
    Width = 430
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
    TabOrder = 14
  end
  object pnl21: TPanel
    Left = 464
    Top = 326
    Width = 430
    Height = 26
    Alignment = taLeftJustify
    Caption = '7 BAR CONTROL AIR LOW PRESSURE'
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
  object pnl22: TPanel
    Left = 464
    Top = 353
    Width = 430
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
    TabOrder = 16
  end
  object pnl23: TPanel
    Left = 464
    Top = 382
    Width = 216
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
    TabOrder = 17
  end
  object pnl24: TPanel
    Left = 679
    Top = 382
    Width = 215
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
    TabOrder = 18
  end
  object pnl25: TPanel
    Left = 464
    Top = 410
    Width = 216
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
    TabOrder = 19
  end
  object pnl26: TPanel
    Left = 679
    Top = 410
    Width = 215
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
  object pnl27: TPanel
    Left = 464
    Top = 438
    Width = 430
    Height = 26
    Alignment = taLeftJustify
    Caption = 'SAFETIES STOP NOT RESET'
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
end
