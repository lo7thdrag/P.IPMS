object frmPowerManagementSyst: TfrmPowerManagementSyst
  Left = -1385
  Top = -15
  BorderStyle = bsNone
  Caption = 'Power Management System'
  ClientHeight = 856
  ClientWidth = 1687
  Color = clGray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 1687
    Height = 856
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -24
    Font.Name = 'Georgia'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    object Panel1: TPanel
      Left = 30
      Top = 30
      Width = 243
      Height = 32
      BevelOuter = bvNone
      Color = 3749426
      ParentBackground = False
      TabOrder = 1
      object Label1: TLabel
        Left = 89
        Top = 4
        Width = 60
        Height = 19
        Caption = 'DCU 01'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object pnlDCU1: TPanel
      Left = 30
      Top = 75
      Width = 243
      Height = 405
      BevelOuter = bvNone
      Color = 3749426
      ParentBackground = False
      TabOrder = 0
      object lbl17: TLabel
        Left = 45
        Top = 309
        Width = 83
        Height = 13
        Caption = 'Lub Oil Press Low'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbl19: TLabel
        Left = 45
        Top = 353
        Width = 121
        Height = 13
        Caption = 'Cooling Water Temp High'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbl20: TLabel
        Left = 45
        Top = 331
        Width = 78
        Height = 13
        Caption = 'Emergency Stop'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbl30: TLabel
        Left = 45
        Top = 287
        Width = 57
        Height = 13
        Caption = 'Over Speed'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lblLampCWTH01: TLabel
        Left = 27
        Top = 350
        Width = 12
        Height = 18
        Alignment = taCenter
        Caption = '   '
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Georgia'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object lblLampES01: TLabel
        Left = 27
        Top = 328
        Width = 12
        Height = 18
        Alignment = taCenter
        Caption = '   '
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Georgia'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object lblLampLOPL01: TLabel
        Left = 27
        Top = 306
        Width = 12
        Height = 18
        Alignment = taCenter
        Caption = '   '
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Georgia'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object lblLampOS01: TLabel
        Left = 27
        Top = 284
        Width = 12
        Height = 18
        Alignment = taCenter
        Caption = '   '
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Georgia'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label2: TLabel
        Left = 41
        Top = 32
        Width = 40
        Height = 13
        Caption = 'Standby'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 130
        Top = 32
        Width = 34
        Height = 13
        Caption = 'Manual'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 43
        Top = 74
        Width = 93
        Height = 13
        Caption = 'Supply Voltage Low'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label24: TLabel
        Left = 43
        Top = 95
        Width = 106
        Height = 13
        Caption = 'Automatic Start Failed'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label26: TLabel
        Left = 43
        Top = 116
        Width = 101
        Height = 13
        Caption = 'Speed Sensor Failure'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label27: TLabel
        Left = 43
        Top = 139
        Width = 83
        Height = 13
        Caption = 'Lub Oil Press Low'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label31: TLabel
        Left = 43
        Top = 158
        Width = 85
        Height = 13
        Caption = 'Lub Oil Temp High'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label32: TLabel
        Left = 43
        Top = 179
        Width = 121
        Height = 13
        Caption = 'Cooling Water Temp High'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label33: TLabel
        Left = 43
        Top = 200
        Width = 118
        Height = 13
        Caption = 'Cooling Water Level Low'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label34: TLabel
        Left = 43
        Top = 221
        Width = 78
        Height = 13
        Caption = 'Fuel Oil Leakage'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label35: TLabel
        Left = 43
        Top = 242
        Width = 88
        Height = 13
        Caption = 'FU/ WA Separator'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object rbStandby01: TRadioButton
        Left = 27
        Top = 32
        Width = 12
        Height = 17
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TabStop = True
        OnClick = NotStandbyMode
      end
      object chkAutomaticStartFailed01: TCheckBox
        Left = 27
        Top = 93
        Width = 14
        Height = 17
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = EngineAlarmMode
      end
      object chkCoolingWaterLevelLow01: TCheckBox
        Left = 27
        Top = 198
        Width = 14
        Height = 17
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnClick = EngineAlarmMode
      end
      object chkCoolingWaterTempHigh01: TCheckBox
        Left = 27
        Top = 177
        Width = 14
        Height = 17
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnClick = EngineAlarmMode
      end
      object chkFuelOilLeakage01: TCheckBox
        Left = 27
        Top = 219
        Width = 14
        Height = 17
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        OnClick = EngineAlarmMode
      end
      object chkFUWASeparator01: TCheckBox
        Left = 27
        Top = 242
        Width = 14
        Height = 17
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        OnClick = EngineAlarmMode
      end
      object chkLubOilPressLow01: TCheckBox
        Left = 27
        Top = 137
        Width = 14
        Height = 17
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = ShutdownMode
      end
      object chkLubOilTempHigh01: TCheckBox
        Left = 27
        Top = 156
        Width = 14
        Height = 17
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnClick = EngineAlarmMode
      end
      object chkSpeedSensorFailure01: TCheckBox
        Left = 27
        Top = 114
        Width = 14
        Height = 17
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = ShutdownMode
      end
      object chkSupplyVoltageLow01: TCheckBox
        Left = 27
        Top = 72
        Width = 14
        Height = 17
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = MeasVoltMode
      end
      object rbManual01: TRadioButton
        Left = 116
        Top = 32
        Width = 12
        Height = 17
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
        OnClick = NotStandbyMode
      end
    end
    object pnlDCU2: TPanel
      Left = 292
      Top = 75
      Width = 243
      Height = 405
      BevelOuter = bvNone
      Color = 3749426
      ParentBackground = False
      TabOrder = 2
      object Label3: TLabel
        Left = 45
        Top = 287
        Width = 57
        Height = 13
        Caption = 'Over Speed'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label6: TLabel
        Left = 45
        Top = 309
        Width = 83
        Height = 13
        Caption = 'Lub Oil Press Low'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label8: TLabel
        Left = 45
        Top = 331
        Width = 78
        Height = 13
        Caption = 'Emergency Stop'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label7: TLabel
        Left = 45
        Top = 353
        Width = 121
        Height = 13
        Caption = 'Cooling Water Temp High'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lblLampCWTH02: TLabel
        Left = 27
        Top = 350
        Width = 12
        Height = 18
        Alignment = taCenter
        Caption = '   '
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Georgia'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object lblLampES02: TLabel
        Left = 27
        Top = 328
        Width = 12
        Height = 18
        Alignment = taCenter
        Caption = '   '
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Georgia'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object lblLampLOPL02: TLabel
        Left = 27
        Top = 306
        Width = 12
        Height = 18
        Alignment = taCenter
        Caption = '   '
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Georgia'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object lblLampOS02: TLabel
        Left = 27
        Top = 284
        Width = 12
        Height = 18
        Alignment = taCenter
        Caption = '   '
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Georgia'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label37: TLabel
        Left = 43
        Top = 32
        Width = 40
        Height = 13
        Caption = 'Standby'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label38: TLabel
        Left = 131
        Top = 32
        Width = 34
        Height = 13
        Caption = 'Manual'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label41: TLabel
        Left = 43
        Top = 74
        Width = 93
        Height = 13
        Caption = 'Supply Voltage Low'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label42: TLabel
        Left = 43
        Top = 95
        Width = 106
        Height = 13
        Caption = 'Automatic Start Failed'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label43: TLabel
        Left = 43
        Top = 116
        Width = 101
        Height = 13
        Caption = 'Speed Sensor Failure'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label44: TLabel
        Left = 43
        Top = 137
        Width = 83
        Height = 13
        Caption = 'Lub Oil Press Low'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label45: TLabel
        Left = 43
        Top = 158
        Width = 85
        Height = 13
        Caption = 'Lub Oil Temp High'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label46: TLabel
        Left = 43
        Top = 179
        Width = 121
        Height = 13
        Caption = 'Cooling Water Temp High'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label47: TLabel
        Left = 43
        Top = 200
        Width = 118
        Height = 13
        Caption = 'Cooling Water Level Low'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label48: TLabel
        Left = 43
        Top = 221
        Width = 78
        Height = 13
        Caption = 'Fuel Oil Leakage'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label49: TLabel
        Left = 43
        Top = 242
        Width = 88
        Height = 13
        Caption = 'FU/ WA Separator'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object rbStandby02: TRadioButton
        Tag = 1
        Left = 27
        Top = 32
        Width = 14
        Height = 17
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TabStop = True
        OnClick = NotStandbyMode
      end
      object rbManual02: TRadioButton
        Tag = 1
        Left = 116
        Top = 32
        Width = 14
        Height = 17
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
        OnClick = NotStandbyMode
      end
      object chkSupplyVoltageLow02: TCheckBox
        Tag = 1
        Left = 27
        Top = 72
        Width = 14
        Height = 17
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = MeasVoltMode
      end
      object chkAutomaticStartFailed02: TCheckBox
        Tag = 1
        Left = 27
        Top = 93
        Width = 14
        Height = 17
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = EngineAlarmMode
      end
      object chkSpeedSensorFailure02: TCheckBox
        Tag = 1
        Left = 27
        Top = 115
        Width = 14
        Height = 17
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = ShutdownMode
      end
      object chkLubOilPressLow02: TCheckBox
        Tag = 1
        Left = 27
        Top = 136
        Width = 14
        Height = 17
        Caption = 'Lub Oil Press Low'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = ShutdownMode
      end
      object chkLubOilTempHigh02: TCheckBox
        Tag = 1
        Left = 27
        Top = 157
        Width = 14
        Height = 17
        Caption = 'Lub Oil Temp High'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnClick = EngineAlarmMode
      end
      object chkCoolingWaterTempHigh02: TCheckBox
        Tag = 1
        Left = 27
        Top = 178
        Width = 14
        Height = 17
        Caption = 'Cooling Water Temp High'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnClick = EngineAlarmMode
      end
      object chkCoolingWaterLevelLow02: TCheckBox
        Tag = 1
        Left = 27
        Top = 199
        Width = 14
        Height = 17
        Caption = 'Cooling Water Level Low'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnClick = EngineAlarmMode
      end
      object chkFuelOilLeakage02: TCheckBox
        Tag = 1
        Left = 27
        Top = 221
        Width = 14
        Height = 17
        Caption = 'Fuel Oil Leakage'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        OnClick = EngineAlarmMode
      end
      object chkFUWASeparator02: TCheckBox
        Tag = 1
        Left = 27
        Top = 242
        Width = 14
        Height = 17
        Caption = 'FU/ WA Separator'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        OnClick = EngineAlarmMode
      end
    end
    object Panel2: TPanel
      Left = 292
      Top = 30
      Width = 243
      Height = 32
      BevelOuter = bvNone
      Color = 3749426
      ParentBackground = False
      TabOrder = 3
      object Label4: TLabel
        Left = 89
        Top = 4
        Width = 60
        Height = 19
        Caption = 'DCU 02'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object pnlDCU3: TPanel
      Left = 554
      Top = 75
      Width = 243
      Height = 405
      BevelOuter = bvNone
      Color = 3749426
      ParentBackground = False
      TabOrder = 4
      object Label14: TLabel
        Left = 46
        Top = 287
        Width = 57
        Height = 13
        Caption = 'Over Speed'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label17: TLabel
        Left = 46
        Top = 309
        Width = 83
        Height = 13
        Caption = 'Lub Oil Press Low'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label19: TLabel
        Left = 46
        Top = 331
        Width = 78
        Height = 13
        Caption = 'Emergency Stop'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label18: TLabel
        Left = 46
        Top = 353
        Width = 121
        Height = 13
        Caption = 'Cooling Water Temp High'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lblLampCWTH03: TLabel
        Left = 28
        Top = 350
        Width = 12
        Height = 18
        Alignment = taCenter
        Caption = '   '
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Georgia'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object lblLampES03: TLabel
        Left = 28
        Top = 328
        Width = 12
        Height = 18
        Alignment = taCenter
        Caption = '   '
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Georgia'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object lblLampLOPL03: TLabel
        Left = 28
        Top = 306
        Width = 12
        Height = 18
        Alignment = taCenter
        Caption = '   '
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Georgia'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object lblLampOS03: TLabel
        Left = 28
        Top = 284
        Width = 12
        Height = 18
        Alignment = taCenter
        Caption = '   '
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Georgia'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label50: TLabel
        Left = 44
        Top = 74
        Width = 93
        Height = 13
        Caption = 'Supply Voltage Low'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label51: TLabel
        Left = 44
        Top = 95
        Width = 106
        Height = 13
        Caption = 'Automatic Start Failed'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label52: TLabel
        Left = 44
        Top = 116
        Width = 101
        Height = 13
        Caption = 'Speed Sensor Failure'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label53: TLabel
        Left = 44
        Top = 137
        Width = 83
        Height = 13
        Caption = 'Lub Oil Press Low'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label54: TLabel
        Left = 44
        Top = 158
        Width = 85
        Height = 13
        Caption = 'Lub Oil Temp High'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label55: TLabel
        Left = 44
        Top = 179
        Width = 121
        Height = 13
        Caption = 'Cooling Water Temp High'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label56: TLabel
        Left = 44
        Top = 200
        Width = 118
        Height = 13
        Caption = 'Cooling Water Level Low'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label57: TLabel
        Left = 44
        Top = 221
        Width = 78
        Height = 13
        Caption = 'Fuel Oil Leakage'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label58: TLabel
        Left = 44
        Top = 242
        Width = 88
        Height = 13
        Caption = 'FU/ WA Separator'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label79: TLabel
        Left = 44
        Top = 32
        Width = 40
        Height = 13
        Caption = 'Standby'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label80: TLabel
        Left = 133
        Top = 32
        Width = 34
        Height = 13
        Caption = 'Manual'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object rbStandby03: TRadioButton
        Tag = 2
        Left = 28
        Top = 32
        Width = 14
        Height = 17
        Caption = 'Standby'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TabStop = True
        OnClick = NotStandbyMode
      end
      object rbManual03: TRadioButton
        Tag = 2
        Left = 117
        Top = 32
        Width = 14
        Height = 17
        Caption = 'Manual'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
        OnClick = NotStandbyMode
      end
      object chkSupplyVoltageLow03: TCheckBox
        Tag = 2
        Left = 28
        Top = 72
        Width = 14
        Height = 17
        Caption = 'Supply Voltage Low'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = MeasVoltMode
      end
      object chkAutomaticStartFailed03: TCheckBox
        Tag = 2
        Left = 28
        Top = 93
        Width = 14
        Height = 17
        Caption = 'Automatic Start Failed'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = EngineAlarmMode
      end
      object chkSpeedSensorFailure03: TCheckBox
        Tag = 2
        Left = 28
        Top = 115
        Width = 14
        Height = 17
        Caption = 'Speed Sensor Failure'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = ShutdownMode
      end
      object chkLubOilPressLow03: TCheckBox
        Tag = 2
        Left = 28
        Top = 136
        Width = 14
        Height = 17
        Caption = 'Lub Oil Press Low'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = ShutdownMode
      end
      object chkLubOilTempHigh03: TCheckBox
        Tag = 2
        Left = 28
        Top = 157
        Width = 14
        Height = 17
        Caption = 'Lub Oil Temp High'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnClick = EngineAlarmMode
      end
      object chkCoolingWaterTempHigh03: TCheckBox
        Tag = 2
        Left = 28
        Top = 178
        Width = 14
        Height = 17
        Caption = 'Cooling Water Temp High'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnClick = EngineAlarmMode
      end
      object chkCoolingWaterLevelLow03: TCheckBox
        Tag = 2
        Left = 28
        Top = 199
        Width = 14
        Height = 17
        Caption = 'Cooling Water Level Low'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnClick = EngineAlarmMode
      end
      object chkFuelOilLeakage03: TCheckBox
        Tag = 2
        Left = 28
        Top = 221
        Width = 14
        Height = 17
        Caption = 'Fuel Oil Leakage'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        OnClick = EngineAlarmMode
      end
      object chkFUWASeparator03: TCheckBox
        Tag = 2
        Left = 28
        Top = 242
        Width = 14
        Height = 17
        Caption = 'FU/ WA Separator'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        OnClick = EngineAlarmMode
      end
    end
    object Panel3: TPanel
      Left = 554
      Top = 30
      Width = 243
      Height = 32
      BevelOuter = bvNone
      Color = 3749426
      ParentBackground = False
      TabOrder = 5
      object Label5: TLabel
        Left = 89
        Top = 4
        Width = 60
        Height = 19
        Caption = 'DCU 03'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object pnlDCU4: TPanel
      Left = 815
      Top = 75
      Width = 243
      Height = 405
      BevelOuter = bvNone
      Color = 3749426
      ParentBackground = False
      TabOrder = 6
      object lblLampOS04: TLabel
        Left = 26
        Top = 284
        Width = 12
        Height = 18
        Alignment = taCenter
        Caption = '   '
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Georgia'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object lblLampLOPL04: TLabel
        Left = 26
        Top = 306
        Width = 12
        Height = 18
        Alignment = taCenter
        Caption = '   '
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Georgia'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object lblLampES04: TLabel
        Left = 26
        Top = 328
        Width = 12
        Height = 18
        Alignment = taCenter
        Caption = '   '
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Georgia'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object lblLampCWTH04: TLabel
        Left = 26
        Top = 350
        Width = 12
        Height = 18
        Alignment = taCenter
        Caption = '   '
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Georgia'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label30: TLabel
        Left = 44
        Top = 331
        Width = 78
        Height = 13
        Caption = 'Emergency Stop'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label29: TLabel
        Left = 44
        Top = 353
        Width = 121
        Height = 13
        Caption = 'Cooling Water Temp High'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label28: TLabel
        Left = 44
        Top = 309
        Width = 83
        Height = 13
        Caption = 'Lub Oil Press Low'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label25: TLabel
        Left = 44
        Top = 287
        Width = 57
        Height = 13
        Caption = 'Over Speed'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label59: TLabel
        Left = 42
        Top = 74
        Width = 93
        Height = 13
        Caption = 'Supply Voltage Low'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label60: TLabel
        Left = 42
        Top = 95
        Width = 106
        Height = 13
        Caption = 'Automatic Start Failed'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label61: TLabel
        Left = 42
        Top = 116
        Width = 101
        Height = 13
        Caption = 'Speed Sensor Failure'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label62: TLabel
        Left = 42
        Top = 137
        Width = 83
        Height = 13
        Caption = 'Lub Oil Press Low'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label63: TLabel
        Left = 42
        Top = 158
        Width = 85
        Height = 13
        Caption = 'Lub Oil Temp High'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label64: TLabel
        Left = 42
        Top = 179
        Width = 121
        Height = 13
        Caption = 'Cooling Water Temp High'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label65: TLabel
        Left = 42
        Top = 200
        Width = 118
        Height = 13
        Caption = 'Cooling Water Level Low'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label66: TLabel
        Left = 42
        Top = 221
        Width = 78
        Height = 13
        Caption = 'Fuel Oil Leakage'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label67: TLabel
        Left = 42
        Top = 242
        Width = 88
        Height = 13
        Caption = 'FU/ WA Separator'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label81: TLabel
        Left = 42
        Top = 32
        Width = 40
        Height = 13
        Caption = 'Standby'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label82: TLabel
        Left = 131
        Top = 32
        Width = 34
        Height = 13
        Caption = 'Manual'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object rbStandby04: TRadioButton
        Tag = 3
        Left = 26
        Top = 32
        Width = 14
        Height = 17
        Caption = 'Standby'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TabStop = True
        OnClick = NotStandbyMode
      end
      object rbManual04: TRadioButton
        Tag = 3
        Left = 115
        Top = 32
        Width = 14
        Height = 17
        Caption = 'Manual'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
        OnClick = NotStandbyMode
      end
      object chkSupplyVoltageLow04: TCheckBox
        Tag = 3
        Left = 26
        Top = 72
        Width = 14
        Height = 17
        Caption = 'Supply Voltage Low'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = MeasVoltMode
      end
      object chkAutomaticStartFailed04: TCheckBox
        Tag = 3
        Left = 26
        Top = 93
        Width = 14
        Height = 17
        Caption = 'Automatic Start Failed'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = EngineAlarmMode
      end
      object chkSpeedSensorFailure04: TCheckBox
        Tag = 3
        Left = 26
        Top = 115
        Width = 14
        Height = 17
        Caption = 'Speed Sensor Failure'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = ShutdownMode
      end
      object chkLubOilPressLow04: TCheckBox
        Tag = 3
        Left = 26
        Top = 136
        Width = 14
        Height = 17
        Caption = 'Lub Oil Press Low'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = ShutdownMode
      end
      object chkLubOilTempHigh04: TCheckBox
        Tag = 3
        Left = 26
        Top = 157
        Width = 14
        Height = 17
        Caption = 'Lub Oil Temp High'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnClick = EngineAlarmMode
      end
      object chkCoolingWaterTempHigh04: TCheckBox
        Tag = 3
        Left = 26
        Top = 178
        Width = 14
        Height = 17
        Caption = 'Cooling Water Temp High'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnClick = EngineAlarmMode
      end
      object chkCoolingWaterLevelLow04: TCheckBox
        Tag = 3
        Left = 26
        Top = 199
        Width = 14
        Height = 17
        Caption = 'Cooling Water Level Low'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnClick = EngineAlarmMode
      end
      object chkFuelOilLeakage04: TCheckBox
        Tag = 3
        Left = 26
        Top = 242
        Width = 14
        Height = 17
        Caption = 'Fuel Oil Leakage'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        OnClick = EngineAlarmMode
      end
      object chkFUWASeparator04: TCheckBox
        Tag = 3
        Left = 26
        Top = 221
        Width = 14
        Height = 17
        Caption = 'FU/ WA Separator'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        OnClick = EngineAlarmMode
      end
    end
    object Panel4: TPanel
      Left = 815
      Top = 30
      Width = 243
      Height = 32
      BevelOuter = bvNone
      Color = 3749426
      ParentBackground = False
      TabOrder = 7
      object Label9: TLabel
        Left = 89
        Top = 4
        Width = 60
        Height = 19
        Caption = 'DCU 04'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object pnlEMERGENCY: TPanel
      Left = 1077
      Top = 75
      Width = 243
      Height = 405
      BevelOuter = bvNone
      Color = 3749426
      ParentBackground = False
      TabOrder = 8
      object Label36: TLabel
        Left = 44
        Top = 309
        Width = 57
        Height = 13
        Caption = 'Over Speed'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label39: TLabel
        Left = 44
        Top = 329
        Width = 83
        Height = 13
        Caption = 'Lub Oil Press Low'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label40: TLabel
        Left = 44
        Top = 349
        Width = 121
        Height = 13
        Caption = 'Cooling Water Temp High'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lblLampCWTH05: TLabel
        Left = 26
        Top = 346
        Width = 12
        Height = 18
        Alignment = taCenter
        Caption = '   '
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Georgia'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object lblLampLOPL05: TLabel
        Left = 26
        Top = 306
        Width = 12
        Height = 18
        Alignment = taCenter
        Caption = '   '
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Georgia'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object lblLampOS05: TLabel
        Left = 26
        Top = 326
        Width = 12
        Height = 18
        Alignment = taCenter
        Caption = '   '
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Georgia'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label68: TLabel
        Left = 42
        Top = 74
        Width = 93
        Height = 13
        Caption = 'Supply Voltage Low'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label69: TLabel
        Left = 42
        Top = 95
        Width = 106
        Height = 13
        Caption = 'Automatic Start Failed'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label70: TLabel
        Left = 42
        Top = 116
        Width = 101
        Height = 13
        Caption = 'Speed Sensor Failure'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label71: TLabel
        Left = 42
        Top = 137
        Width = 83
        Height = 13
        Caption = 'Lub Oil Press Low'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label72: TLabel
        Left = 42
        Top = 158
        Width = 85
        Height = 13
        Caption = 'Lub Oil Temp High'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label73: TLabel
        Left = 42
        Top = 179
        Width = 121
        Height = 13
        Caption = 'Cooling Water Temp High'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label74: TLabel
        Left = 42
        Top = 200
        Width = 118
        Height = 13
        Caption = 'Cooling Water Level Low'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label75: TLabel
        Left = 42
        Top = 221
        Width = 78
        Height = 13
        Caption = 'Fuel Oil Leakage'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label76: TLabel
        Left = 42
        Top = 242
        Width = 88
        Height = 13
        Caption = 'FU/ WA Separator'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label77: TLabel
        Left = 42
        Top = 262
        Width = 71
        Height = 13
        Caption = 'Fault Page Led'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label78: TLabel
        Left = 42
        Top = 281
        Width = 131
        Height = 13
        Caption = '24V DC Int Pow Sup Failure'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label83: TLabel
        Left = 42
        Top = 32
        Width = 40
        Height = 13
        Caption = 'Standby'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label84: TLabel
        Left = 131
        Top = 32
        Width = 34
        Height = 13
        Caption = 'Manual'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object rbStandby05: TRadioButton
        Tag = 4
        Left = 26
        Top = 32
        Width = 14
        Height = 17
        Caption = 'Standby'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TabStop = True
        OnClick = NotStandbyMode
      end
      object rbManual05: TRadioButton
        Tag = 4
        Left = 115
        Top = 32
        Width = 14
        Height = 17
        Caption = 'Manual'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 12
        OnClick = NotStandbyMode
      end
      object chkSupplyVoltageLow05: TCheckBox
        Tag = 4
        Left = 26
        Top = 72
        Width = 14
        Height = 17
        Caption = 'Supply Voltage Low'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = MeasVoltMode
      end
      object chkAutomaticStartFailed05: TCheckBox
        Tag = 4
        Left = 26
        Top = 93
        Width = 14
        Height = 17
        Caption = 'Automatic Start Failed'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = DCPowMode
      end
      object chkSpeedSensorFailure05: TCheckBox
        Tag = 4
        Left = 26
        Top = 115
        Width = 14
        Height = 17
        Caption = 'Speed Sensor Failure'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = ShutdownMode
      end
      object chkLubOilPressLow05: TCheckBox
        Tag = 4
        Left = 26
        Top = 136
        Width = 14
        Height = 17
        Caption = 'Lub Oil Press Low'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = ShutdownMode
      end
      object chkLubOilTempHigh05: TCheckBox
        Tag = 4
        Left = 26
        Top = 157
        Width = 14
        Height = 17
        Caption = 'Lub Oil Temp High'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnClick = EngineAlarmMode
      end
      object chkCoolingWaterTempHigh05: TCheckBox
        Tag = 4
        Left = 26
        Top = 178
        Width = 14
        Height = 17
        Caption = 'Cooling Water Temp High'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnClick = EngineAlarmMode
      end
      object chkCoolingWaterLevelLow05: TCheckBox
        Tag = 4
        Left = 26
        Top = 199
        Width = 14
        Height = 17
        Caption = 'Cooling Water Level Low'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnClick = EngineAlarmMode
      end
      object chkFuelOilLeakage05: TCheckBox
        Tag = 4
        Left = 26
        Top = 221
        Width = 14
        Height = 17
        Caption = 'Fuel Oil Leakage'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        OnClick = EngineAlarmMode
      end
      object chkFUWASeparator05: TCheckBox
        Tag = 4
        Left = 26
        Top = 242
        Width = 14
        Height = 17
        Caption = 'FU/ WA Separator'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        OnClick = EngineAlarmMode
      end
      object CheckBox11: TCheckBox
        Tag = 3
        Left = 26
        Top = 260
        Width = 14
        Height = 17
        Caption = 'Fault Page Led'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
      end
      object CheckBox10: TCheckBox
        Left = 26
        Top = 279
        Width = 14
        Height = 17
        Caption = '24V DC Int Pow Sup Failure'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
        OnClick = DCPowMode
      end
    end
    object Panel5: TPanel
      Left = 1077
      Top = 30
      Width = 243
      Height = 32
      BevelOuter = bvNone
      Color = 3749426
      ParentBackground = False
      TabOrder = 9
      object Label11: TLabel
        Left = 68
        Top = 4
        Width = 102
        Height = 19
        Caption = 'EMERGENCY'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object pnl24V: TPanel
      Left = 1374
      Top = 266
      Width = 268
      Height = 350
      BevelOuter = bvNone
      Color = 3749426
      ParentBackground = False
      TabOrder = 10
      object Label15: TLabel
        Left = 37
        Top = 11
        Width = 190
        Height = 38
        Alignment = taCenter
        Caption = '24V DC'#13#10'POWER DISTRIBUTION'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn3242E5001A: TVrDemoButton
        Tag = 3
        Left = 23
        Top = 60
        Width = 219
        Height = 34
        Hint = '3242E5001A'
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
        Caption = 'MCR AFT FAILURE'
        TabOrder = 0
        OnMouseDown = OnPmsConditionMouseDown
      end
      object btn3120E5002A: TVrDemoButton
        Tag = 3
        Left = 23
        Top = 99
        Width = 219
        Height = 34
        Hint = '3120E5002A'
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
        Caption = 'BAT CHARG 1 FAILURE'
        TabOrder = 1
        OnMouseDown = OnPmsConditionMouseDown
      end
      object btn3120E5004A: TVrDemoButton
        Tag = 3
        Left = 23
        Top = 138
        Width = 219
        Height = 34
        Hint = '3120E5004A'
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
        Caption = 'BAT CHARG 2 FAILURE'
        TabOrder = 2
        OnMouseDown = OnPmsConditionMouseDown
      end
      object btn3242E5011A: TVrDemoButton
        Tag = 3
        Left = 23
        Top = 177
        Width = 219
        Height = 34
        Hint = '3242E5011A'
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
        Caption = 'MCR FWD'
        TabOrder = 3
        OnMouseDown = OnPmsConditionMouseDown
      end
      object btn3242E5021A: TVrDemoButton
        Tag = 3
        Left = 23
        Top = 217
        Width = 219
        Height = 34
        Hint = '3242E5021A'
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
        Caption = 'BRIDGE LOBBY FAILURE'
        TabOrder = 4
        OnMouseDown = OnPmsConditionMouseDown
      end
      object btn3242E5025A: TVrDemoButton
        Tag = 3
        Left = 23
        Top = 256
        Width = 219
        Height = 34
        Hint = '3242E5025A'
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
        Caption = 'BRIDGE LOBBY FAILURE'
        TabOrder = 5
        OnMouseDown = OnPmsConditionMouseDown
      end
      object btn3242E5024B: TVrDemoButton
        Tag = 3
        Left = 23
        Top = 295
        Width = 219
        Height = 34
        Hint = '3242E5024B'
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
        Caption = 'TIMER 24VDC PA'
        TabOrder = 6
        OnMouseDown = OnPmsConditionMouseDown
      end
    end
    object pnl230v: TPanel
      Left = 1374
      Top = 30
      Width = 268
      Height = 231
      BevelOuter = bvNone
      Caption = '4'
      Color = 3749426
      ParentBackground = False
      TabOrder = 11
      object Label12: TLabel
        Left = 37
        Top = 11
        Width = 190
        Height = 38
        Alignment = taCenter
        Caption = '230V 115V'#13#10'POWER DISTRIBUTION'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn3245E5004A: TVrDemoButton
        Tag = 2
        Left = 23
        Top = 59
        Width = 219
        Height = 34
        Hint = '3245E5004A'
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
        Caption = 'Synchro Conv 400Hz FAILURE'
        TabOrder = 0
        OnMouseDown = OnPmsConditionMouseDown
      end
      object btn3245E5001A: TVrDemoButton
        Tag = 2
        Left = 23
        Top = 98
        Width = 219
        Height = 34
        Hint = '3245E5001A'
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
        Caption = 'Conv 400Hz FAILURE'
        TabOrder = 1
        OnMouseDown = OnPmsConditionMouseDown
      end
      object btn3243E5005A: TVrDemoButton
        Tag = 2
        Left = 23
        Top = 137
        Width = 219
        Height = 34
        Hint = '3243E5005A'
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
        Caption = 'MDP 230V FWD NORMAL SUPPLY'
        TabOrder = 2
        OnMouseDown = OnPmsConditionMouseDown
      end
      object btn3245E5005A: TVrDemoButton
        Tag = 2
        Left = 23
        Top = 176
        Width = 219
        Height = 34
        Hint = '3245E5005A'
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
        Caption = 'Synchro Conv 400Hz'
        TabOrder = 3
        OnMouseDown = OnPmsConditionMouseDown
      end
    end
    object pnlUPS: TPanel
      Left = 1374
      Top = 621
      Width = 268
      Height = 192
      BevelOuter = bvNone
      Color = 3749426
      ParentBackground = False
      TabOrder = 12
      object Label16: TLabel
        Left = 56
        Top = 11
        Width = 152
        Height = 38
        Alignment = taCenter
        Caption = 'UNINTERUPTIBLE '#13#10'POWER SUPPLY'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn3133E5001A: TVrDemoButton
        Tag = 4
        Left = 23
        Top = 61
        Width = 219
        Height = 34
        Hint = '3133E5001A'
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
        Caption = 'DP 230V UPS AFT FAILURE'
        TabOrder = 0
        OnMouseDown = OnPmsConditionMouseDown
      end
      object btn3133E5011A: TVrDemoButton
        Tag = 4
        Left = 23
        Top = 100
        Width = 219
        Height = 34
        Hint = '3133E5011A'
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
        Caption = 'DP 230V UPS FWD FAILURE'
        TabOrder = 1
        OnMouseDown = OnPmsConditionMouseDown
      end
      object btn3133E5021A: TVrDemoButton
        Tag = 4
        Left = 23
        Top = 139
        Width = 219
        Height = 34
        Hint = '3133E5021A'
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
        Caption = 'DP 230V UPS BRIDGE'
        TabOrder = 2
        OnMouseDown = OnPmsConditionMouseDown
      end
    end
    object pnlGENSYS1: TPanel
      Left = 30
      Top = 563
      Width = 259
      Height = 124
      BevelOuter = bvNone
      Color = 3749426
      ParentBackground = False
      TabOrder = 13
      object Label20: TLabel
        Left = 82
        Top = 11
        Width = 90
        Height = 19
        Caption = 'GENSYS 01'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label85: TLabel
        Left = 50
        Top = 50
        Width = 74
        Height = 13
        Caption = 'Can Bus Failure'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label86: TLabel
        Left = 50
        Top = 82
        Width = 145
        Height = 13
        Caption = '24V DC Int Pow Supply Failure'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object chkCanBusFailure01: TCheckBox
        Left = 34
        Top = 48
        Width = 14
        Height = 17
        Caption = 'Can Bus Failure'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = CanBusMode
      end
      object CheckBox2: TCheckBox
        Left = 34
        Top = 80
        Width = 14
        Height = 17
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = DCPowMode
      end
    end
    object pnlGENSYS2: TPanel
      Left = 292
      Top = 563
      Width = 259
      Height = 124
      BevelOuter = bvNone
      Color = 3749426
      ParentBackground = False
      TabOrder = 14
      object Label21: TLabel
        Left = 82
        Top = 11
        Width = 90
        Height = 19
        Caption = 'GENSYS 02'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label87: TLabel
        Left = 50
        Top = 50
        Width = 74
        Height = 13
        Caption = 'Can Bus Failure'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label88: TLabel
        Left = 50
        Top = 82
        Width = 145
        Height = 13
        Caption = '24V DC Int Pow Supply Failure'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object chkCanBusFailure02: TCheckBox
        Tag = 1
        Left = 34
        Top = 48
        Width = 14
        Height = 17
        Caption = 'Can Bus Failure'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = CanBusMode
      end
      object CheckBox4: TCheckBox
        Tag = 1
        Left = 34
        Top = 80
        Width = 14
        Height = 17
        Caption = '24V DC Int Pow Supply Failure'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = DCPowMode
      end
    end
    object pnlGENSYS3: TPanel
      Left = 30
      Top = 689
      Width = 259
      Height = 124
      BevelOuter = bvNone
      Color = 3749426
      ParentBackground = False
      TabOrder = 15
      object Label22: TLabel
        Left = 66
        Top = 11
        Width = 90
        Height = 19
        Caption = 'GENSYS 03'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label89: TLabel
        Left = 50
        Top = 50
        Width = 74
        Height = 13
        Caption = 'Can Bus Failure'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label90: TLabel
        Left = 50
        Top = 82
        Width = 145
        Height = 13
        Caption = '24V DC Int Pow Supply Failure'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object chkCanBusFailure03: TCheckBox
        Tag = 2
        Left = 34
        Top = 48
        Width = 14
        Height = 17
        Caption = 'Can Bus Failure'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = CanBusMode
      end
      object CheckBox6: TCheckBox
        Tag = 2
        Left = 34
        Top = 80
        Width = 14
        Height = 17
        Caption = '24V DC Int Pow Supply Failure'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = DCPowMode
      end
    end
    object pnlGENSYS4: TPanel
      Left = 292
      Top = 689
      Width = 259
      Height = 124
      BevelOuter = bvNone
      Color = 3749426
      ParentBackground = False
      TabOrder = 16
      object Label23: TLabel
        Left = 82
        Top = 11
        Width = 90
        Height = 19
        Caption = 'GENSYS 04'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label91: TLabel
        Left = 50
        Top = 50
        Width = 74
        Height = 13
        Caption = 'Can Bus Failure'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label92: TLabel
        Left = 50
        Top = 82
        Width = 145
        Height = 13
        Caption = '24V DC Int Pow Supply Failure'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object chkCanBusFailure04: TCheckBox
        Tag = 3
        Left = 34
        Top = 48
        Width = 14
        Height = 17
        Caption = 'Can Bus Failure'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = CanBusMode
      end
      object CheckBox8: TCheckBox
        Tag = 3
        Left = 34
        Top = 80
        Width = 14
        Height = 17
        Caption = '24V DC Int Pow Supply Failure'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = DCPowMode
      end
    end
    object Panel6: TPanel
      Left = 625
      Top = 563
      Width = 300
      Height = 250
      BevelOuter = bvNone
      Color = 3749426
      ParentBackground = False
      TabOrder = 17
      object btnCbReset01: TVrDemoButton
        Left = 38
        Top = 22
        Width = 219
        Height = 34
        Hint = 'Circuit Breaker Reset Gensys 1'
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
        Caption = 'Circuit Breaker Reset'
        TabOrder = 0
        OnClick = btnResetClick
      end
      object btnCbReset02: TVrDemoButton
        Tag = 1
        Left = 38
        Top = 64
        Width = 219
        Height = 34
        Hint = 'Circuit Breaker Reset Gensys 2'
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
        Caption = 'Circuit Breaker Reset'
        TabOrder = 1
        OnClick = btnResetClick
      end
      object btnCbReset03: TVrDemoButton
        Tag = 2
        Left = 38
        Top = 148
        Width = 219
        Height = 34
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
        Caption = 'Circuit Breaker Reset'
        TabOrder = 2
        OnClick = btnResetClick
      end
      object btnCbReset04: TVrDemoButton
        Tag = 3
        Left = 38
        Top = 106
        Width = 219
        Height = 34
        Hint = 'Circuit Breaker Reset Gensys 4'
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
        Caption = 'Circuit Breaker Reset'
        TabOrder = 3
        OnClick = btnResetClick
      end
      object btnCbReset05: TVrDemoButton
        Tag = 4
        Left = 38
        Top = 190
        Width = 219
        Height = 34
        Hint = 'Circuit Breaker Reset Gensys 4'
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
        Caption = 'Circuit Breaker Reset'
        TabOrder = 4
        OnClick = btnResetClick
      end
    end
    object Panel7: TPanel
      Left = 928
      Top = 564
      Width = 392
      Height = 249
      BevelOuter = bvNone
      Color = 3749426
      ParentBackground = False
      TabOrder = 18
      object btnforwardNonEssent: TVrDemoButton
        Tag = 5
        Left = 30
        Top = 53
        Width = 329
        Height = 40
        Hint = 'Switchboard FWD'
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
        Caption = 'NON ESSENT LOAD TRIP/REDUCT FORWARD RESET'
        TabOrder = 0
        OnClick = btnResetClick
      end
      object btnEmergencyNonEssent: TVrDemoButton
        Tag = 7
        Left = 30
        Top = 153
        Width = 329
        Height = 40
        Hint = 'Switchboard Emergency'
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
        Caption = 'NON ESSENT LOAD TRIP/REDUCT EMERGENCY'
        TabOrder = 1
        OnClick = btnResetClick
      end
      object btnAfterNonEssent: TVrDemoButton
        Tag = 6
        Left = 30
        Top = 103
        Width = 329
        Height = 40
        Hint = 'Switchboard AFT'
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
        Caption = 'NON ESSENT LOAD TRIP/REDUCT AFTER RESET'
        TabOrder = 2
        OnClick = btnResetClick
      end
    end
  end
  object pm1: TPopupMenu
    TrackButton = tbLeftButton
    Left = 1401
    Top = 819
    object AlarmOn1: TMenuItem
      Tag = 1
      Caption = 'Alarm On'
      OnClick = AlarmOn1Click
    end
    object AlarmOff1: TMenuItem
      Tag = 2
      Caption = 'Alarm Off'
      OnClick = AlarmOn1Click
    end
  end
  object tmrDCU01: TTimer
    OnTimer = tmrDCU01Timer
    Left = 1440
    Top = 818
  end
end
