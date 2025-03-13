object frmSSETest: TfrmSSETest
  Left = 0
  Top = 0
  Caption = 'SSE TEST'
  ClientHeight = 348
  ClientWidth = 579
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
    Left = 8
    Top = 0
    Width = 359
    Height = 57
    Caption = 'Platform Interface'
    TabOrder = 0
    object lbl1: TLabel
      Left = 117
      Top = 20
      Width = 62
      Height = 13
      Caption = 'Value Sensor'
    end
    object lbl20: TLabel
      Left = 199
      Top = 39
      Width = 124
      Height = 13
      Caption = '(Input Range : 4 - 20 mA)'
    end
    object edtValueSensor: TEdit
      Tag = 1
      Left = 189
      Top = 17
      Width = 145
      Height = 21
      TabOrder = 0
      OnKeyPress = edtValueSensorKeyPress
    end
  end
  object grpIPMSInterface: TGroupBox
    Left = 8
    Top = 63
    Width = 359
    Height = 278
    Caption = 'IPMS Interface'
    TabOrder = 1
    object grpOutput: TGroupBox
      Left = 16
      Top = 135
      Width = 329
      Height = 130
      Caption = 'Output'
      TabOrder = 0
      object lbl5: TLabel
        Left = 97
        Top = 18
        Width = 56
        Height = 13
        Caption = 'State Alarm'
      end
      object lbl6: TLabel
        Left = 86
        Top = 45
        Width = 67
        Height = 13
        Caption = 'State Element'
      end
      object lbl7: TLabel
        Left = 86
        Top = 72
        Width = 67
        Height = 13
        Caption = 'Value Element'
      end
      object lbl8: TLabel
        Left = 72
        Top = 99
        Width = 81
        Height = 13
        Caption = 'Value Application'
      end
      object edtValueElement: TEdit
        Left = 173
        Top = 69
        Width = 145
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object edtValueApplication: TEdit
        Left = 173
        Top = 96
        Width = 145
        Height = 21
        ReadOnly = True
        TabOrder = 1
      end
      object edtStateElement: TEdit
        Left = 173
        Top = 42
        Width = 145
        Height = 21
        ReadOnly = True
        TabOrder = 2
      end
      object edtStateAlarm: TEdit
        Left = 173
        Top = 15
        Width = 145
        Height = 21
        ReadOnly = True
        TabOrder = 3
      end
    end
    object grpInput: TGroupBox
      Left = 16
      Top = 16
      Width = 329
      Height = 105
      Caption = 'Input'
      TabOrder = 1
      object lbl2: TLabel
        Left = 43
        Top = 20
        Width = 110
        Height = 13
        Caption = 'State Element Disabled'
      end
      object lbl3: TLabel
        Left = 85
        Top = 47
        Width = 69
        Height = 13
        Caption = 'State inhibited'
      end
      object lbl4: TLabel
        Left = 11
        Top = 74
        Width = 143
        Height = 13
        Caption = 'State Display Stationart Value'
      end
      object cbbStateElementDisabled: TComboBox
        Left = 173
        Top = 17
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 0
        OnSelect = cbbStateElementDisabledSelect
        Items.Strings = (
          'Disabled'
          'Enabled')
      end
      object cbbStateInhibited: TComboBox
        Left = 173
        Top = 44
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 1
        OnSelect = cbbStateInhibitedSelect
        Items.Strings = (
          'Inhibited'
          'Not inhibited')
      end
      object cbbStateDisplayStationary: TComboBox
        Left = 173
        Top = 71
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
  end
  object grpParameters: TGroupBox
    Left = 373
    Top = 0
    Width = 197
    Height = 341
    Caption = 'Parameters'
    TabOrder = 2
    object lbl9: TLabel
      Left = 21
      Top = 29
      Width = 20
      Height = 13
      Caption = 'HAV'
    end
    object lbl10: TLabel
      Left = 23
      Top = 56
      Width = 18
      Height = 13
      Caption = 'LAV'
    end
    object lbl11: TLabel
      Left = 14
      Top = 83
      Width = 27
      Height = 13
      Caption = 'HYHA'
    end
    object lbl12: TLabel
      Left = 16
      Top = 110
      Width = 25
      Height = 13
      Caption = 'HYLA'
    end
    object lbl13: TLabel
      Left = 21
      Top = 137
      Width = 20
      Height = 13
      Caption = 'THA'
    end
    object lbl14: TLabel
      Left = 23
      Top = 164
      Width = 18
      Height = 13
      Caption = 'TLA'
    end
    object lbl15: TLabel
      Left = 7
      Top = 191
      Width = 34
      Height = 13
      Caption = 'TOORL'
    end
    object lbl16: TLabel
      Left = 5
      Top = 218
      Width = 36
      Height = 13
      Caption = 'TOORH'
    end
    object lbl17: TLabel
      Left = 23
      Top = 245
      Width = 18
      Height = 13
      Caption = 'V20'
    end
    object lbl18: TLabel
      Left = 29
      Top = 272
      Width = 12
      Height = 13
      Caption = 'V4'
    end
    object lbl19: TLabel
      Left = 22
      Top = 299
      Width = 19
      Height = 13
      Caption = 'STA'
    end
    object edtHAV: TEdit
      Tag = 2
      Left = 62
      Top = 26
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 0
      OnKeyPress = edtValueSensorKeyPress
    end
    object edtLAV: TEdit
      Tag = 3
      Left = 62
      Top = 53
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 1
      OnKeyPress = edtValueSensorKeyPress
    end
    object edtHYHA: TEdit
      Tag = 4
      Left = 62
      Top = 80
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 2
      OnKeyPress = edtValueSensorKeyPress
    end
    object edtHYLA: TEdit
      Tag = 5
      Left = 62
      Top = 107
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 3
      OnKeyPress = edtValueSensorKeyPress
    end
    object edtTHA: TEdit
      Tag = 6
      Left = 62
      Top = 134
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 4
      OnKeyPress = edtValueSensorKeyPress
    end
    object edtTLA: TEdit
      Tag = 7
      Left = 62
      Top = 161
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 5
      OnKeyPress = edtValueSensorKeyPress
    end
    object edtTOORL: TEdit
      Tag = 8
      Left = 62
      Top = 188
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 6
      OnKeyPress = edtValueSensorKeyPress
    end
    object edtTOORH: TEdit
      Tag = 9
      Left = 62
      Top = 215
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 7
      OnKeyPress = edtValueSensorKeyPress
    end
    object edtV20: TEdit
      Tag = 10
      Left = 62
      Top = 242
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 8
      OnKeyPress = edtValueSensorKeyPress
    end
    object edtV4: TEdit
      Tag = 11
      Left = 62
      Top = 269
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 9
      OnKeyPress = edtValueSensorKeyPress
    end
    object edtSTA: TEdit
      Tag = 12
      Left = 62
      Top = 296
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 10
      OnKeyPress = edtValueSensorKeyPress
    end
  end
end
