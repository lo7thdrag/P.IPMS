object Form1: TForm1
  Left = 251
  Top = 137
  Caption = 'PCS'
  ClientHeight = 286
  ClientWidth = 277
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnGeneralPanelStart: TButton
    Left = 8
    Top = 120
    Width = 82
    Height = 25
    Caption = 'General Panel'
    TabOrder = 0
    OnClick = btnGeneralPanelStartClick
  end
  object btnPSPanelStart: TButton
    Left = 96
    Top = 120
    Width = 82
    Height = 25
    Caption = 'PS Panel'
    TabOrder = 1
    OnClick = btnPSPanelStartClick
  end
  object btnSBPanelStart: TButton
    Left = 184
    Top = 120
    Width = 86
    Height = 25
    Caption = 'SB Panel'
    TabOrder = 2
    OnClick = btnSBPanelStartClick
  end
  object btnLogger: TButton
    Left = 199
    Top = 72
    Width = 71
    Height = 25
    Caption = 'Logger'
    TabOrder = 3
    OnClick = btnLoggerClick
  end
  object mmo1: TMemo
    Left = 8
    Top = 8
    Width = 185
    Height = 89
    Lines.Strings = (
      'mmo1')
    TabOrder = 4
  end
  object btnControlLever: TButton
    Left = 150
    Top = 158
    Width = 120
    Height = 120
    Caption = 'Lever Test'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = btnControlLeverClick
  end
  object btnServo: TButton
    Left = 8
    Top = 158
    Width = 120
    Height = 120
    Caption = 'Servo Test'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = btnServoClick
  end
  object pnlLeverControl: TPanel
    Left = 284
    Top = 8
    Width = 261
    Height = 323
    TabOrder = 7
    object lblAheadPS: TLabel
      Left = 30
      Top = 16
      Width = 3
      Height = 13
      Color = clWindow
      ParentColor = False
    end
    object lblAheadSB: TLabel
      Left = 211
      Top = 16
      Width = 3
      Height = 13
      Color = clWindow
      ParentColor = False
    end
    object lblAsternPS: TLabel
      Left = 30
      Top = 256
      Width = 3
      Height = 13
      Color = clWindow
      ParentColor = False
    end
    object lblAsternSB: TLabel
      Left = 211
      Top = 256
      Width = 3
      Height = 13
      Color = clWindow
      ParentColor = False
    end
    object lblLeverPS: TLabel
      Left = 96
      Top = 271
      Width = 3
      Height = 13
    end
    object lblLeverSB: TLabel
      Left = 147
      Top = 271
      Width = 3
      Height = 13
    end
    object btnEmergencyStopPS: TButton
      Left = 11
      Top = 212
      Width = 62
      Height = 25
      Caption = 'Emergency'
      TabOrder = 0
      OnClick = btnEmergencyStopPSClick
    end
    object btnEmergencyStopSB: TButton
      Left = 190
      Top = 212
      Width = 62
      Height = 25
      Caption = 'Emergency'
      TabOrder = 1
      OnClick = btnEmergencyStopSBClick
    end
    object btnShaftDrivenPS: TButton
      Left = 11
      Top = 56
      Width = 62
      Height = 25
      Caption = 'Driven'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnShaftDrivenPSClick
    end
    object btnShaftDrivenSB: TButton
      Left = 190
      Top = 56
      Width = 62
      Height = 25
      Caption = 'Driven'
      TabOrder = 3
      OnClick = btnShaftDrivenSBClick
    end
    object btnShaftStopPS: TButton
      Left = 11
      Top = 95
      Width = 62
      Height = 25
      Caption = 'Stop'
      TabOrder = 4
      OnClick = btnShaftStopPSClick
    end
    object btnShaftStopSB: TButton
      Left = 190
      Top = 95
      Width = 62
      Height = 25
      Caption = 'Stop'
      TabOrder = 5
      OnClick = btnShaftStopSBClick
    end
    object btnShaftTrailingPS: TButton
      Left = 11
      Top = 134
      Width = 62
      Height = 25
      Caption = 'Trail'
      TabOrder = 6
      OnClick = btnShaftTrailingPSClick
    end
    object btnShaftTrailingSB: TButton
      Left = 190
      Top = 134
      Width = 62
      Height = 25
      Caption = 'Trail'
      TabOrder = 7
      OnClick = btnShaftTrailingSBClick
    end
    object btnTransferOverridePS: TButton
      Left = 11
      Top = 173
      Width = 62
      Height = 25
      Caption = 'Transfer'
      TabOrder = 8
      OnClick = btnTransferOverridePSClick
    end
    object btnTransferOverrideSB: TButton
      Left = 190
      Top = 173
      Width = 62
      Height = 25
      Caption = 'Transfer'
      TabOrder = 9
      OnClick = btnTransferOverrideSBClick
    end
    object trckbrPS: TTrackBar
      Left = 96
      Top = 32
      Width = 45
      Height = 241
      Min = -10
      Orientation = trVertical
      TabOrder = 10
      OnChange = trckbrPSChange
    end
    object trckbrSB: TTrackBar
      Left = 139
      Top = 32
      Width = 45
      Height = 241
      Min = -10
      Orientation = trVertical
      TabOrder = 11
      OnChange = trckbrSBChange
    end
  end
  object btnThottlePanelTest: TButton
    Left = 284
    Top = 306
    Width = 82
    Height = 25
    Caption = 'Thottle Test ON'
    TabOrder = 8
    OnClick = btnThottlePanelTestClick
  end
  object btnThrottlePanelTestOff: TButton
    Left = 454
    Top = 306
    Width = 86
    Height = 25
    Caption = 'Throttle Test OFF'
    TabOrder = 9
    OnClick = btnThrottlePanelTestOffClick
  end
  object btnPCSAlarmSound: TButton
    Left = 16
    Top = 305
    Width = 75
    Height = 25
    Caption = 'Alarm Sound'
    TabOrder = 10
    Visible = False
    OnClick = btnPCSAlarmSoundClick
  end
  object btn1: TButton
    Left = 109
    Top = 306
    Width = 75
    Height = 25
    Caption = 'Show Cursor'
    TabOrder = 11
    Visible = False
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 202
    Top = 306
    Width = 75
    Height = 25
    Caption = 'Hide Cursor'
    TabOrder = 12
    Visible = False
    OnClick = btn2Click
  end
  object tmr1: TTimer
    OnTimer = tmr1Timer
    Left = 208
    Top = 8
  end
end
