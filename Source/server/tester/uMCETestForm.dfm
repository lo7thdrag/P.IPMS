object frmMCETest: TfrmMCETest
  Left = 0
  Top = 0
  Caption = 'MCE TEST'
  ClientHeight = 510
  ClientWidth = 710
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
    Width = 697
    Height = 153
    Caption = 'Platform Interface'
    TabOrder = 0
    object grpInput: TGroupBox
      Left = 12
      Top = 12
      Width = 333
      Height = 133
      Caption = 'Input'
      TabOrder = 0
      object lbl1: TLabel
        Left = 17
        Top = 20
        Width = 100
        Height = 13
        Caption = 'State Switch Remote'
      end
      object lbl2: TLabel
        Left = 17
        Top = 60
        Width = 102
        Height = 13
        Caption = 'State Switch Running'
      end
      object lbl3: TLabel
        Left = 15
        Top = 101
        Width = 102
        Height = 13
        Caption = 'State Switch no Fault'
      end
      object cbbStateSwitchRemote: TComboBox
        Left = 152
        Top = 20
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 0
        OnSelect = cbbStateSwitchRemoteSelect
        Items.Strings = (
          'Local'
          'Remote')
      end
      object cbbStateSwitchRunning: TComboBox
        Left = 152
        Top = 60
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 1
        OnSelect = cbbStateSwitchRunningSelect
        Items.Strings = (
          'Not running'
          'Running')
      end
      object cbbStateSwitchNoFault: TComboBox
        Left = 152
        Top = 98
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 2
        OnSelect = cbbStateSwitchNoFault1Select
        Items.Strings = (
          'No fault'
          'Fault')
      end
    end
    object grpOutput: TGroupBox
      Left = 351
      Top = 12
      Width = 334
      Height = 133
      Caption = 'Parameter'
      TabOrder = 1
      object lbl25: TLabel
        Left = 114
        Top = 20
        Width = 31
        Height = 13
        Caption = 'Ttrans'
      end
      object lbl26: TLabel
        Left = 124
        Top = 53
        Width = 21
        Height = 13
        Caption = 'Tctrl'
      end
      object edtTtrans: TEdit
        Tag = 1
        Left = 168
        Top = 17
        Width = 145
        Height = 21
        ReadOnly = True
        TabOrder = 0
        OnKeyPress = edtTtransKeyPress
      end
      object edtTctrl: TEdit
        Tag = 2
        Left = 168
        Top = 52
        Width = 145
        Height = 21
        ReadOnly = True
        TabOrder = 1
      end
    end
  end
  object grpIPMSInterface: TGroupBox
    Left = 8
    Top = 159
    Width = 697
    Height = 350
    Caption = 'IPMS Interface'
    TabOrder = 1
    object grpInput2: TGroupBox
      Left = 11
      Top = 12
      Width = 334
      Height = 325
      Caption = 'Input'
      TabOrder = 0
      object lbl4: TLabel
        Left = 8
        Top = 21
        Width = 137
        Height = 13
        Caption = 'Command Start (Application)'
      end
      object lbl5: TLabel
        Left = 10
        Top = 46
        Width = 135
        Height = 13
        Caption = 'Command Stop (Application)'
      end
      object lbl6: TLabel
        Left = 125
        Top = 289
        Width = 20
        Height = 13
        Caption = 'RFU'
      end
      object lbl7: TLabel
        Left = 41
        Top = 73
        Width = 104
        Height = 13
        Caption = 'Command Start (HMI)'
      end
      object lbl8: TLabel
        Left = 43
        Top = 101
        Width = 102
        Height = 13
        Caption = 'Command Stop (HMI)'
      end
      object lbl9: TLabel
        Left = 55
        Top = 128
        Width = 90
        Height = 13
        Caption = 'State Manual/Auto'
      end
      object lbl10: TLabel
        Left = 35
        Top = 156
        Width = 110
        Height = 13
        BiDiMode = bdRightToLeft
        Caption = 'State Element Disabled'
        ParentBiDiMode = False
      end
      object lbl11: TLabel
        Left = 76
        Top = 182
        Width = 69
        Height = 13
        Caption = 'State Blackout'
      end
      object lbl12: TLabel
        Left = 80
        Top = 209
        Width = 65
        Height = 13
        Caption = 'State Restart'
      end
      object lbl13: TLabel
        Left = 65
        Top = 236
        Width = 80
        Height = 13
        Caption = 'State Value Valid'
      end
      object lbl14: TLabel
        Left = 73
        Top = 263
        Width = 72
        Height = 13
        Caption = 'Run Conditions'
      end
      object cbbCommandStartApp: TComboBox
        Left = 173
        Top = 18
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 0
        OnSelect = cbbCommandStartAppSelect
        Items.Strings = (
          'Activated'
          'Not activated')
      end
      object cbbCommandStopApp: TComboBox
        Left = 173
        Top = 45
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 1
        OnSelect = cbbCommandStopAppSelect
        Items.Strings = (
          'Activated'
          'Not activated')
      end
      object cbbCommandStartHMI: TComboBox
        Left = 173
        Top = 72
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 2
        OnSelect = cbbCommandStartHMISelect
        Items.Strings = (
          'Activated'
          'Not activated')
      end
      object cbbCommandStopHMI: TComboBox
        Left = 173
        Top = 99
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 3
        OnSelect = cbbCommandStopHMISelect
        Items.Strings = (
          'Activated'
          'Not activated')
      end
      object cbbStateManualAuto: TComboBox
        Left = 173
        Top = 126
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 4
        OnSelect = cbbStateManualAutoSelect
        Items.Strings = (
          'Manual'
          'Auto')
      end
      object cbbStateElementDisabled: TComboBox
        Left = 173
        Top = 153
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 5
        OnSelect = cbbStateElementDisabledSelect
        Items.Strings = (
          'Disabled'
          'Enabled')
      end
      object cbbStateBlockOut: TComboBox
        Left = 173
        Top = 180
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 6
        OnSelect = cbbStateBlockOutSelect
        Items.Strings = (
          'Activated'
          'Not activated')
      end
      object cbbStateRestart: TComboBox
        Left = 173
        Top = 207
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 7
        OnSelect = cbbStateRestartSelect
        Items.Strings = (
          'Activated'
          'Not activated')
      end
      object cbbStateValueValid: TComboBox
        Left = 173
        Top = 234
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 8
        OnSelect = cbbStateValueValidSelect
        Items.Strings = (
          'Valid'
          'Not valid')
      end
      object cbbRunCondition: TComboBox
        Left = 173
        Top = 261
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 9
        OnSelect = cbbRunConditionSelect
        Items.Strings = (
          'OK'
          'NOK')
      end
      object cbbRFU: TComboBox
        Left = 173
        Top = 288
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 10
        OnSelect = cbbRFUSelect
        Items.Strings = (
          'RFU'
          'Not RFU')
      end
    end
    object grpOutput2: TGroupBox
      Left = 351
      Top = 13
      Width = 334
      Height = 146
      Caption = 'Output'
      TabOrder = 1
      object lbl15: TLabel
        Left = 88
        Top = 18
        Width = 56
        Height = 13
        Caption = 'State Alarm'
      end
      object lbl16: TLabel
        Left = 69
        Top = 72
        Width = 76
        Height = 13
        Caption = 'State Command'
      end
      object lbl17: TLabel
        Left = 41
        Top = 99
        Width = 104
        Height = 13
        Caption = 'State Control Position'
      end
      object lbl18: TLabel
        Left = 78
        Top = 45
        Width = 67
        Height = 13
        Caption = 'State Element'
      end
      object edtStateAlarm: TEdit
        Left = 168
        Top = 15
        Width = 145
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object edtStateCommand: TEdit
        Left = 168
        Top = 69
        Width = 145
        Height = 21
        ReadOnly = True
        TabOrder = 1
      end
      object edtStateControl: TEdit
        Left = 168
        Top = 96
        Width = 145
        Height = 21
        ReadOnly = True
        TabOrder = 2
      end
      object edtStateElement: TEdit
        Left = 168
        Top = 42
        Width = 145
        Height = 21
        ReadOnly = True
        TabOrder = 3
      end
    end
  end
end
