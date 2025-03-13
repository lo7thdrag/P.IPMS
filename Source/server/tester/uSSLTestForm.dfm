object frmSSLTest: TfrmSSLTest
  Left = -897
  Top = 50
  Caption = 'SSL TEST'
  ClientHeight = 465
  ClientWidth = 613
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
    Top = 8
    Width = 329
    Height = 134
    Caption = 'Platform Interface'
    TabOrder = 0
    object grpInput: TGroupBox
      Left = 16
      Top = 16
      Width = 297
      Height = 103
      Caption = 'Input'
      TabOrder = 0
      object lbl1: TLabel
        Left = 57
        Top = 20
        Width = 62
        Height = 13
        Caption = 'Value Sensor'
      end
      object lbl2: TLabel
        Left = 70
        Top = 47
        Width = 49
        Height = 13
        Caption = 'Trim Value'
      end
      object lbl3: TLabel
        Left = 15
        Top = 74
        Width = 104
        Height = 13
        Caption = 'Compensation Sensor'
      end
      object edtValueSensor: TEdit
        Tag = 31
        Left = 136
        Top = 17
        Width = 145
        Height = 21
        TabOrder = 0
        OnKeyPress = edtSGKeyPress
      end
      object edtTrimValue: TEdit
        Tag = 32
        Left = 136
        Top = 44
        Width = 145
        Height = 21
        TabOrder = 1
        OnKeyPress = edtSGKeyPress
      end
      object edtCompensationSensor: TEdit
        Tag = 33
        Left = 136
        Top = 71
        Width = 145
        Height = 21
        TabOrder = 2
        OnKeyPress = edtSGKeyPress
      end
    end
  end
  object grpIPMSInterface: TGroupBox
    Left = 8
    Top = 148
    Width = 329
    Height = 309
    Caption = 'IPMS Interface'
    TabOrder = 1
    object grpInput2: TGroupBox
      Left = 16
      Top = 17
      Width = 297
      Height = 80
      Caption = 'Input'
      TabOrder = 0
      object lbl4: TLabel
        Left = 13
        Top = 19
        Width = 110
        Height = 13
        Caption = 'State Element Disabled'
      end
      object lbl5: TLabel
        Left = 52
        Top = 46
        Width = 71
        Height = 13
        Caption = 'State Inhibited'
      end
      object cbbStateElementDisabled: TComboBox
        Left = 136
        Top = 16
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
        Left = 136
        Top = 43
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 1
        OnSelect = cbbStateInhibitedSelect
        Items.Strings = (
          'Inhibited'
          'Not inhibited')
      end
    end
    object grpOutput2: TGroupBox
      Left = 16
      Top = 103
      Width = 297
      Height = 194
      Caption = 'Output'
      TabOrder = 1
      object lbl6: TLabel
        Left = 67
        Top = 27
        Width = 56
        Height = 13
        Caption = 'State Alarm'
      end
      object lbl7: TLabel
        Left = 56
        Top = 54
        Width = 67
        Height = 13
        Caption = 'State Element'
      end
      object lbl8: TLabel
        Left = 42
        Top = 81
        Width = 81
        Height = 13
        Caption = 'Value Element %'
      end
      object lbl9: TLabel
        Left = 28
        Top = 107
        Width = 95
        Height = 13
        Caption = 'Value Element Level'
      end
      object lbl10: TLabel
        Left = 39
        Top = 134
        Width = 84
        Height = 13
        Caption = 'Value Element M3'
      end
      object lbl11: TLabel
        Left = 29
        Top = 161
        Width = 94
        Height = 13
        Caption = 'Value Element Mass'
      end
      object edtValueElement: TEdit
        Left = 136
        Top = 78
        Width = 145
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object edtValueElementLevel: TEdit
        Left = 136
        Top = 104
        Width = 145
        Height = 21
        ReadOnly = True
        TabOrder = 1
      end
      object edtValueElementM3: TEdit
        Left = 136
        Top = 131
        Width = 145
        Height = 21
        ReadOnly = True
        TabOrder = 2
      end
      object edtValueElementMass: TEdit
        Left = 136
        Top = 158
        Width = 145
        Height = 21
        ReadOnly = True
        TabOrder = 3
      end
      object edtStateAlarm: TEdit
        Left = 136
        Top = 24
        Width = 145
        Height = 21
        ReadOnly = True
        TabOrder = 4
      end
      object edtStateElement: TEdit
        Left = 136
        Top = 51
        Width = 145
        Height = 21
        ReadOnly = True
        TabOrder = 5
      end
    end
  end
  object grpParameters: TGroupBox
    Left = 346
    Top = 8
    Width = 255
    Height = 449
    Caption = 'Parameters'
    TabOrder = 2
    object lbl12: TLabel
      Left = 77
      Top = 97
      Width = 13
      Height = 13
      Caption = 'SG'
    end
    object lbl13: TLabel
      Left = 72
      Top = 124
      Width = 18
      Height = 13
      Caption = 'Tau'
    end
    object lbl14: TLabel
      Left = 70
      Top = 151
      Width = 20
      Height = 13
      Caption = 'HAV'
    end
    object lbl15: TLabel
      Left = 63
      Top = 178
      Width = 27
      Height = 13
      Caption = 'HYHA'
    end
    object lbl16: TLabel
      Left = 65
      Top = 203
      Width = 25
      Height = 13
      Caption = 'HYLA'
    end
    object lbl17: TLabel
      Left = 72
      Top = 230
      Width = 18
      Height = 13
      Caption = 'LAV'
    end
    object lbl18: TLabel
      Left = 70
      Top = 257
      Width = 20
      Height = 13
      Caption = 'THA'
    end
    object lbl19: TLabel
      Left = 72
      Top = 284
      Width = 18
      Height = 13
      Caption = 'TLA'
    end
    object lbl20: TLabel
      Left = 56
      Top = 21
      Width = 34
      Height = 13
      Caption = 'TOORL'
    end
    object lbl21: TLabel
      Left = 54
      Top = 50
      Width = 36
      Height = 13
      Caption = 'TOORH'
    end
    object lbl22: TLabel
      Left = 78
      Top = 311
      Width = 12
      Height = 13
      Caption = 'V4'
    end
    object lbl23: TLabel
      Left = 72
      Top = 338
      Width = 18
      Height = 13
      Caption = 'V20'
    end
    object lbl24: TLabel
      Left = 37
      Top = 391
      Width = 53
      Height = 13
      Caption = 'SenOff (m)'
    end
    object lbl25: TLabel
      Left = 11
      Top = 418
      Width = 79
      Height = 13
      Caption = 'TnkCntMax (M3)'
    end
    object lbl26: TLabel
      Left = 16
      Top = 69
      Width = 222
      Height = 13
      Caption = '_____________________________________'
    end
    object lbl27: TLabel
      Left = 16
      Top = 360
      Width = 222
      Height = 13
      Caption = '_____________________________________'
    end
    object edtSG: TEdit
      Tag = 1
      Left = 114
      Top = 94
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 0
      OnKeyPress = edtSGKeyPress
    end
    object edtTau: TEdit
      Tag = 2
      Left = 114
      Top = 121
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 1
      OnKeyPress = edtSGKeyPress
    end
    object edtHAV: TEdit
      Tag = 3
      Left = 114
      Top = 148
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 2
      OnKeyPress = edtSGKeyPress
    end
    object edtHYHA: TEdit
      Tag = 4
      Left = 114
      Top = 175
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 3
      OnKeyPress = edtSGKeyPress
    end
    object edtHYLA: TEdit
      Tag = 5
      Left = 114
      Top = 200
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 4
      OnKeyPress = edtSGKeyPress
    end
    object edtLAV: TEdit
      Tag = 6
      Left = 114
      Top = 227
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 5
      OnKeyPress = edtSGKeyPress
    end
    object edtTHA: TEdit
      Tag = 7
      Left = 114
      Top = 254
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 6
      OnKeyPress = edtSGKeyPress
    end
    object edtTLA: TEdit
      Tag = 8
      Left = 114
      Top = 281
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 7
      OnKeyPress = edtSGKeyPress
    end
    object edtTOORL: TEdit
      Tag = 9
      Left = 114
      Top = 18
      Width = 121
      Height = 21
      TabOrder = 8
      OnKeyPress = edtSGKeyPress
    end
    object edtTOORH: TEdit
      Tag = 10
      Left = 114
      Top = 47
      Width = 121
      Height = 21
      TabOrder = 9
      OnKeyPress = edtSGKeyPress
    end
    object edtV4: TEdit
      Tag = 11
      Left = 114
      Top = 308
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 10
      OnKeyPress = edtSGKeyPress
    end
    object edtV20: TEdit
      Tag = 12
      Left = 114
      Top = 335
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 11
      OnKeyPress = edtSGKeyPress
    end
    object edtSenOff: TEdit
      Tag = 13
      Left = 114
      Top = 388
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 12
      OnKeyPress = edtSGKeyPress
    end
    object edtTnkCntMax: TEdit
      Tag = 14
      Left = 114
      Top = 415
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 13
      OnKeyPress = edtSGKeyPress
    end
  end
end
