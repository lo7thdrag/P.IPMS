object frmMCDTest: TfrmMCDTest
  Left = 0
  Top = 0
  Caption = 'MCD TEST'
  ClientHeight = 512
  ClientWidth = 759
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
    Left = 15
    Top = 0
    Width = 346
    Height = 321
    Caption = 'Platform Interface'
    TabOrder = 0
    object grpInput: TGroupBox
      Left = 12
      Top = 13
      Width = 321
      Height = 161
      Caption = 'Input'
      TabOrder = 0
      object lbl1: TLabel
        Left = 16
        Top = 28
        Width = 102
        Height = 13
        Caption = 'State Switch Speed 1'
      end
      object lbl2: TLabel
        Left = 16
        Top = 53
        Width = 102
        Height = 13
        Caption = 'State Switch Speed 2'
      end
      object lbl3: TLabel
        Left = 18
        Top = 79
        Width = 100
        Height = 13
        Caption = 'State Switch Remote'
      end
      object lbl4: TLabel
        Left = 16
        Top = 108
        Width = 102
        Height = 13
        Caption = 'State Switch no Fault'
      end
      object cbbStateSwitchSpeed1: TComboBox
        Left = 144
        Top = 25
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 0
        OnSelect = cbbStateSwitchSpeed1Select
        Items.Strings = (
          'Running speed 1'
          'Not running speed 1')
      end
      object cbbStateSwitchSpeed2: TComboBox
        Left = 144
        Top = 52
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 1
        OnSelect = cbbStateSwitchSpeed2Select
        Items.Strings = (
          'Running speed 2'
          'Not running speed 2')
      end
      object cbbStateSwitchRemote: TComboBox
        Left = 144
        Top = 78
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 2
        OnSelect = cbbStateSwitchRemoteSelect
        Items.Strings = (
          'Local'
          'Remote')
      end
      object cbbStateSwitchNoFault: TComboBox
        Left = 144
        Top = 105
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 3
        OnSelect = cbbStateSwitchNoFaultSelect
        Items.Strings = (
          'Fault'
          'No fault')
      end
    end
    object grpOutput: TGroupBox
      Left = 12
      Top = 180
      Width = 321
      Height = 130
      Caption = 'Output'
      TabOrder = 1
      object lbl5: TLabel
        Left = 14
        Top = 23
        Width = 104
        Height = 13
        Caption = 'Control Start Speed 1'
      end
      object lbl6: TLabel
        Left = 14
        Top = 48
        Width = 104
        Height = 13
        Caption = 'Control Start Speed 2'
      end
      object lbl7: TLabel
        Left = 58
        Top = 75
        Width = 60
        Height = 13
        Caption = 'Control Stop'
      end
      object edtControlStartSpeed1: TEdit
        Left = 144
        Top = 16
        Width = 145
        Height = 21
        TabOrder = 0
      end
      object edtControlStartSpeed2: TEdit
        Left = 144
        Top = 43
        Width = 145
        Height = 21
        TabOrder = 1
      end
      object edtControlStop: TEdit
        Left = 144
        Top = 70
        Width = 145
        Height = 21
        TabOrder = 2
      end
    end
  end
  object grpIPMSInterface: TGroupBox
    Left = 367
    Top = 0
    Width = 386
    Height = 505
    Caption = 'IPMS Interface'
    TabOrder = 1
    object grpInput2: TGroupBox
      Left = 15
      Top = 13
      Width = 346
      Height = 380
      Caption = 'Input'
      TabOrder = 0
      object lbl8: TLabel
        Left = 9
        Top = 21
        Width = 148
        Height = 13
        Caption = 'Command Start Speed 1 (Appl)'
      end
      object lbl9: TLabel
        Left = 9
        Top = 47
        Width = 148
        Height = 13
        Caption = 'Command Start Speed 2 (Appl)'
      end
      object lbl10: TLabel
        Left = 53
        Top = 76
        Width = 104
        Height = 13
        Caption = 'Command Stop (Appl)'
      end
      object lbl11: TLabel
        Left = 11
        Top = 102
        Width = 146
        Height = 13
        Caption = 'Command Start Speed 1 (HMI)'
      end
      object lbl12: TLabel
        Left = 11
        Top = 130
        Width = 146
        Height = 13
        Caption = 'Command Start Speed 2 (HMI)'
      end
      object lbl13: TLabel
        Left = 55
        Top = 158
        Width = 102
        Height = 13
        Caption = 'Command Stop (HMI)'
      end
      object lbl14: TLabel
        Left = 88
        Top = 185
        Width = 69
        Height = 13
        Caption = 'State Blackout'
      end
      object lbl15: TLabel
        Left = 92
        Top = 212
        Width = 65
        Height = 13
        Caption = 'State Restart'
      end
      object lbl16: TLabel
        Left = 61
        Top = 238
        Width = 96
        Height = 13
        Caption = 'State Manual / Auto'
      end
      object lbl17: TLabel
        Left = 47
        Top = 266
        Width = 110
        Height = 13
        Caption = 'State Element Disabled'
      end
      object lbl18: TLabel
        Left = 77
        Top = 293
        Width = 80
        Height = 13
        Caption = 'State Value valid'
      end
      object lbl19: TLabel
        Left = 137
        Top = 318
        Width = 20
        Height = 13
        Caption = 'RFU'
      end
      object lbl20: TLabel
        Left = 65
        Top = 345
        Width = 92
        Height = 13
        Caption = 'Running Conditions'
      end
      object cbbCommandStartSpeed1App: TComboBox
        Left = 184
        Top = 20
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 0
        OnSelect = cbbCommandStartSpeed1AppSelect
        Items.Strings = (
          'Activated'
          'Not activated')
      end
      object cbbCommandStartSpeed2App: TComboBox
        Left = 184
        Top = 47
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 1
        OnSelect = cbbCommandStartSpeed2AppSelect
        Items.Strings = (
          'Activated'
          'Not activated')
      end
      object cbbCommandStopApp: TComboBox
        Left = 184
        Top = 74
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 2
        OnSelect = cbbCommandStopAppSelect
        Items.Strings = (
          'Activated'
          'Not activated')
      end
      object cbbCommandStartSpeed1HMI: TComboBox
        Left = 184
        Top = 101
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 3
        OnSelect = cbbCommandStartSpeed1HMISelect
        Items.Strings = (
          'Activated'
          'Not activated')
      end
      object cbbCommandStartSpeed2HMI: TComboBox
        Left = 184
        Top = 128
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 4
        OnSelect = cbbCommandStartSpeed2HMISelect
        Items.Strings = (
          'Activated'
          'Not activated')
      end
      object cbbCommandStopHMI: TComboBox
        Left = 184
        Top = 155
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 5
        OnSelect = cbbCommandStopHMISelect
        Items.Strings = (
          'Activated'
          'Not activated')
      end
      object cbbStateBlokOut: TComboBox
        Left = 184
        Top = 182
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 6
        OnSelect = cbbStateBlokOutSelect
        Items.Strings = (
          'Activated'
          'Not activated')
      end
      object cbbStateRestart: TComboBox
        Left = 184
        Top = 209
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 7
        OnSelect = cbbStateRestartSelect
        Items.Strings = (
          'Activated'
          'Not activated')
      end
      object cbbStateManualAuto: TComboBox
        Left = 184
        Top = 236
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 8
        OnSelect = cbbStateManualAutoSelect
        Items.Strings = (
          'Manual'
          'Auto')
      end
      object cbbStateElementDisabled: TComboBox
        Left = 184
        Top = 263
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 9
        OnSelect = cbbStateElementDisabledSelect
        Items.Strings = (
          'Disabled'
          'Enabled')
      end
      object cbbStateValueValid: TComboBox
        Left = 184
        Top = 290
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 10
        OnSelect = cbbStateValueValidSelect
        Items.Strings = (
          'Valid'
          'Not valid')
      end
      object cbbRFU: TComboBox
        Left = 184
        Top = 317
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 11
        OnSelect = cbbRFUSelect
        Items.Strings = (
          'RFU'
          'Not RFU')
      end
      object cbbRunCondition: TComboBox
        Left = 184
        Top = 344
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 12
        OnSelect = cbbRunConditionSelect
        Items.Strings = (
          'Activated'
          'Not activated')
      end
    end
    object grpParameter: TGroupBox
      Left = 15
      Top = 399
      Width = 346
      Height = 98
      Caption = 'Parameter'
      TabOrder = 1
      object lbl25: TLabel
        Left = 126
        Top = 17
        Width = 31
        Height = 13
        Caption = 'Ttrans'
      end
      object lbl26: TLabel
        Left = 136
        Top = 44
        Width = 21
        Height = 13
        Caption = 'Tctrl'
      end
      object lbl27: TLabel
        Left = 141
        Top = 72
        Width = 16
        Height = 13
        Caption = 'Tro'
      end
      object edtTtrans: TEdit
        Tag = 1
        Left = 184
        Top = 14
        Width = 145
        Height = 21
        ReadOnly = True
        TabOrder = 0
        OnKeyPress = edtTtransKeyPress
      end
      object edtTctrl: TEdit
        Tag = 2
        Left = 184
        Top = 41
        Width = 145
        Height = 21
        ReadOnly = True
        TabOrder = 1
        OnKeyPress = edtTtransKeyPress
      end
      object edtTro: TEdit
        Tag = 3
        Left = 184
        Top = 68
        Width = 145
        Height = 21
        ReadOnly = True
        TabOrder = 2
        OnKeyPress = edtTtransKeyPress
      end
    end
  end
  object grpOutput2: TGroupBox
    Left = 15
    Top = 327
    Width = 346
    Height = 178
    Caption = 'Output'
    TabOrder = 2
    object lbl21: TLabel
      Left = 74
      Top = 25
      Width = 56
      Height = 13
      Caption = 'State Alarm'
    end
    object lbl22: TLabel
      Left = 54
      Top = 50
      Width = 76
      Height = 13
      Caption = 'State Command'
    end
    object lbl23: TLabel
      Left = 26
      Top = 75
      Width = 104
      Height = 13
      Caption = 'State Control Position'
    end
    object lbl24: TLabel
      Left = 63
      Top = 101
      Width = 67
      Height = 13
      Caption = 'State Element'
    end
    object edtStateAlarm: TEdit
      Left = 156
      Top = 22
      Width = 145
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object edtStateCommand: TEdit
      Left = 156
      Top = 49
      Width = 145
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object edtStateControl: TEdit
      Left = 156
      Top = 72
      Width = 145
      Height = 21
      ReadOnly = True
      TabOrder = 2
    end
    object edtStateElement: TEdit
      Left = 157
      Top = 98
      Width = 145
      Height = 21
      ReadOnly = True
      TabOrder = 3
    end
  end
end
