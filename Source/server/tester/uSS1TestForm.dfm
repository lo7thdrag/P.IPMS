object frmSS1Test: TfrmSS1Test
  Left = 0
  Top = 0
  Caption = 'SS1 TEST'
  ClientHeight = 390
  ClientWidth = 589
  Color = clBtnShadow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object grpPlatformInterface: TGroupBox
    Left = 9
    Top = 8
    Width = 354
    Height = 87
    Caption = 'Platform Interface'
    TabOrder = 0
    object grpInput: TGroupBox
      Left = 12
      Top = 16
      Width = 326
      Height = 60
      Caption = 'Input'
      TabOrder = 0
      object lbl1: TLabel
        Left = 92
        Top = 23
        Width = 62
        Height = 13
        Caption = 'Value Sensor'
      end
      object edtValueSensor: TEdit
        Tag = 11
        Left = 173
        Top = 20
        Width = 145
        Height = 21
        TabOrder = 0
        OnKeyPress = edtHAVKeyPress
      end
    end
  end
  object grpIPMSInterface: TGroupBox
    Left = 8
    Top = 101
    Width = 355
    Height = 276
    Caption = 'IPMS Interface'
    TabOrder = 1
    object grpInput2: TGroupBox
      Left = 13
      Top = 16
      Width = 326
      Height = 105
      Caption = 'Input'
      TabOrder = 0
      object lbl2: TLabel
        Left = 44
        Top = 16
        Width = 110
        Height = 13
        Caption = 'State Element Disabled'
      end
      object lbl3: TLabel
        Left = 53
        Top = 43
        Width = 101
        Height = 13
        Caption = 'State Alarm Inhibited'
      end
      object lbl4: TLabel
        Left = 9
        Top = 70
        Width = 145
        Height = 13
        Caption = 'State Display Stationary value'
      end
      object cbbStateElementDisabled: TComboBox
        Left = 173
        Top = 13
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 0
        OnSelect = cbbStateElementDisabledSelect
        Items.Strings = (
          'Disabled'
          'Enabled')
      end
      object cbbStateAlarmInhibited: TComboBox
        Left = 173
        Top = 40
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 1
        OnSelect = cbbStateAlarmInhibitedSelect
        Items.Strings = (
          'Inhibited'
          'Not inhibited')
      end
      object cbbStateDisplayStationary: TComboBox
        Left = 173
        Top = 67
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 2
        OnSelect = cbbStateDisplayStationarySelect
        Items.Strings = (
          'Display stationary value'
          'Display sensor value (scaled)')
      end
    end
    object grpOutput2: TGroupBox
      Left = 13
      Top = 127
      Width = 326
      Height = 128
      Caption = 'Output'
      TabOrder = 1
      object lbl5: TLabel
        Left = 92
        Top = 21
        Width = 56
        Height = 13
        Caption = 'State Alarm'
      end
      object lbl6: TLabel
        Left = 81
        Top = 48
        Width = 67
        Height = 13
        Caption = 'State Element'
      end
      object lbl7: TLabel
        Left = 81
        Top = 75
        Width = 67
        Height = 13
        Caption = 'Value Element'
      end
      object lbl8: TLabel
        Left = 67
        Top = 102
        Width = 81
        Height = 13
        Caption = 'Value Application'
      end
      object edtValueElement: TEdit
        Left = 173
        Top = 72
        Width = 145
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object edtvalueApplication: TEdit
        Left = 173
        Top = 99
        Width = 145
        Height = 21
        ReadOnly = True
        TabOrder = 1
      end
      object edtStateElement: TEdit
        Left = 173
        Top = 45
        Width = 145
        Height = 21
        ReadOnly = True
        TabOrder = 2
      end
      object edtStateAlarm: TEdit
        Left = 173
        Top = 19
        Width = 145
        Height = 21
        ReadOnly = True
        TabOrder = 3
      end
    end
  end
  object grpParameters: TGroupBox
    Left = 369
    Top = 8
    Width = 208
    Height = 369
    Caption = 'Parameters'
    TabOrder = 2
    object lbl9: TLabel
      Left = 25
      Top = 159
      Width = 20
      Height = 13
      Caption = 'HAV'
    end
    object lbl10: TLabel
      Left = 18
      Top = 186
      Width = 27
      Height = 13
      Caption = 'HHAV'
    end
    object lbl11: TLabel
      Left = 19
      Top = 213
      Width = 26
      Height = 13
      Caption = 'XHAV'
    end
    object lbl12: TLabel
      Left = 32
      Top = 240
      Width = 13
      Height = 13
      Caption = 'HY'
    end
    object lbl13: TLabel
      Left = 32
      Top = 267
      Width = 13
      Height = 13
      Caption = 'TA'
    end
    object lbl14: TLabel
      Left = 20
      Top = 34
      Width = 34
      Height = 13
      Caption = 'TOORL'
    end
    object lbl15: TLabel
      Left = 18
      Top = 61
      Width = 36
      Height = 13
      Caption = 'TOORH'
    end
    object lbl16: TLabel
      Left = 27
      Top = 302
      Width = 18
      Height = 13
      Caption = 'V20'
    end
    object lbl17: TLabel
      Left = 33
      Top = 321
      Width = 12
      Height = 13
      Caption = 'V4'
    end
    object lbl18: TLabel
      Left = 35
      Top = 88
      Width = 19
      Height = 13
      Caption = 'STA'
    end
    object lbl19: TLabel
      Left = 19
      Top = 117
      Width = 170
      Height = 18
      Caption = '_________________'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtHAV: TEdit
      Tag = 1
      Left = 72
      Top = 156
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 0
      OnKeyPress = edtHAVKeyPress
    end
    object edtHHAV: TEdit
      Tag = 2
      Left = 72
      Top = 183
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 1
      OnKeyPress = edtHAVKeyPress
    end
    object edtXHAV: TEdit
      Tag = 3
      Left = 72
      Top = 210
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 2
      OnKeyPress = edtHAVKeyPress
    end
    object edtHY: TEdit
      Tag = 4
      Left = 72
      Top = 237
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 3
      OnKeyPress = edtHAVKeyPress
    end
    object edtTA: TEdit
      Tag = 5
      Left = 72
      Top = 264
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 4
      OnKeyPress = edtHAVKeyPress
    end
    object edtTOORL: TEdit
      Tag = 6
      Left = 73
      Top = 31
      Width = 121
      Height = 21
      TabOrder = 5
      OnKeyPress = edtHAVKeyPress
    end
    object edtTOORH: TEdit
      Tag = 7
      Left = 73
      Top = 58
      Width = 121
      Height = 21
      TabOrder = 6
    end
    object edtV20: TEdit
      Tag = 8
      Left = 72
      Top = 291
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 7
      OnKeyPress = edtHAVKeyPress
    end
    object edtV4: TEdit
      Tag = 9
      Left = 72
      Top = 318
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 8
      OnKeyPress = edtHAVKeyPress
    end
    object edtSTA: TEdit
      Tag = 10
      Left = 73
      Top = 85
      Width = 121
      Height = 21
      TabOrder = 9
      OnKeyPress = edtHAVKeyPress
    end
  end
end
