object frmMCSTest: TfrmMCSTest
  Left = 0
  Top = 0
  Caption = 'MCS TEST'
  ClientHeight = 552
  ClientWidth = 674
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
    Top = 16
    Width = 307
    Height = 257
    Caption = 'Platform Interface'
    TabOrder = 0
    object grpInput: TGroupBox
      Left = 12
      Top = 12
      Width = 281
      Height = 129
      Caption = 'Input'
      TabOrder = 0
      object lbl1: TLabel
        Left = 8
        Top = 19
        Width = 100
        Height = 13
        Caption = 'State Switch Remote'
      end
      object lbl2: TLabel
        Left = 6
        Top = 46
        Width = 102
        Height = 13
        Caption = 'State Switch Running'
      end
      object lbl3: TLabel
        Left = 5
        Top = 74
        Width = 103
        Height = 13
        Caption = 'State Switch Standby'
      end
      object lbl4: TLabel
        Left = 6
        Top = 102
        Width = 102
        Height = 13
        Caption = 'State Switch no Fault'
      end
      object cbbStateSwitchRemote: TComboBox
        Left = 128
        Top = 17
        Width = 145
        Height = 21
        TabOrder = 0
        Text = 'Local'
        OnSelect = cbbStateSwitchRemoteSelect
        Items.Strings = (
          'Local'
          'Remote')
      end
      object cbbStateSwitchRunning: TComboBox
        Left = 128
        Top = 44
        Width = 145
        Height = 21
        TabOrder = 1
        Text = 'Running'
        OnSelect = cbbStateSwitchRunningSelect
        Items.Strings = (
          'Running'
          'Not running')
      end
      object cbbStateSwitchStandby: TComboBox
        Left = 128
        Top = 71
        Width = 145
        Height = 21
        TabOrder = 2
        Text = 'Standby'
        OnSelect = cbbStateSwitchStandbySelect
        Items.Strings = (
          'Standby'
          'Not standby')
      end
      object cbbStateSwitchNoFault: TComboBox
        Left = 128
        Top = 100
        Width = 145
        Height = 21
        TabOrder = 3
        Text = 'Fault'
        OnSelect = cbbStateSwitchNoFaultSelect
        Items.Strings = (
          'Fault'
          'No fault')
      end
    end
    object grpOutput: TGroupBox
      Left = 12
      Top = 147
      Width = 281
      Height = 98
      Caption = 'Output'
      TabOrder = 1
      object lbl5: TLabel
        Left = 30
        Top = 18
        Width = 78
        Height = 13
        Caption = 'Control Standby'
      end
      object lbl6: TLabel
        Left = 46
        Top = 44
        Width = 62
        Height = 13
        Caption = 'Control Start'
      end
      object lbl7: TLabel
        Left = 48
        Top = 70
        Width = 60
        Height = 13
        Caption = 'Control Stop'
      end
      object cbbControlStandby: TComboBox
        Left = 128
        Top = 13
        Width = 145
        Height = 21
        TabOrder = 0
        Text = 'Not activated'
        Items.Strings = (
          'Not activated'
          'Activated')
      end
      object cbb3ControlStart: TComboBox
        Left = 128
        Top = 40
        Width = 145
        Height = 21
        TabOrder = 1
        Text = 'Not activated'
        Items.Strings = (
          'Not activated'
          'Activated')
      end
      object cbbControlStop: TComboBox
        Left = 128
        Top = 67
        Width = 145
        Height = 21
        TabOrder = 2
        Text = 'Not activated'
        Items.Strings = (
          'Not activated'
          'Activated')
      end
    end
  end
  object grpIPMSInterface: TGroupBox
    Left = 321
    Top = 16
    Width = 348
    Height = 526
    Caption = 'IPMS Interface'
    TabOrder = 1
    object grpInput2: TGroupBox
      Left = 13
      Top = 12
      Width = 321
      Height = 373
      Caption = 'Input'
      TabOrder = 0
      object lbl8: TLabel
        Left = 14
        Top = 19
        Width = 122
        Height = 13
        Caption = 'Command Standby (Appl)'
      end
      object lbl9: TLabel
        Left = 30
        Top = 46
        Width = 106
        Height = 13
        Caption = 'Command Start (Appl)'
      end
      object lbl10: TLabel
        Left = 32
        Top = 73
        Width = 104
        Height = 13
        Caption = 'Command Stop (Appl)'
      end
      object lbl11: TLabel
        Left = 16
        Top = 99
        Width = 120
        Height = 13
        Caption = 'Command Standby (HMI)'
      end
      object lbl12: TLabel
        Left = 32
        Top = 125
        Width = 104
        Height = 13
        Caption = 'Command Start (HMI)'
      end
      object lbl13: TLabel
        Left = 34
        Top = 153
        Width = 102
        Height = 13
        Caption = 'Command Stop (HMI)'
      end
      object lbl14: TLabel
        Left = 67
        Top = 180
        Width = 69
        Height = 13
        Caption = 'State Blackout'
      end
      object lbl15: TLabel
        Left = 71
        Top = 206
        Width = 65
        Height = 13
        Caption = 'State Restart'
      end
      object lbl16: TLabel
        Left = 56
        Top = 233
        Width = 80
        Height = 13
        Caption = 'State Value Valid'
      end
      object lbl17: TLabel
        Left = 46
        Top = 259
        Width = 90
        Height = 13
        Caption = 'State Manual/Auto'
      end
      object lbl18: TLabel
        Left = 26
        Top = 286
        Width = 110
        Height = 13
        Caption = 'State Element Disabled'
      end
      object lbl19: TLabel
        Left = 53
        Top = 312
        Width = 83
        Height = 13
        Caption = 'State Switch RFU'
      end
      object lbl20: TLabel
        Left = 64
        Top = 340
        Width = 72
        Height = 13
        Caption = 'Run Conditions'
      end
      object cbbCommandStandbyApp: TComboBox
        Left = 162
        Top = 16
        Width = 145
        Height = 21
        TabOrder = 0
        Text = 'Not activated'
        OnSelect = cbbCommandStandbyAppSelect
        Items.Strings = (
          'Not activated'
          'Activated')
      end
      object cbbCommandStartApp: TComboBox
        Left = 162
        Top = 43
        Width = 145
        Height = 21
        TabOrder = 1
        Text = 'Not activated'
        OnSelect = cbbCommandStartAppSelect
        Items.Strings = (
          'Not activated'
          'Activated')
      end
      object cbbCommandStopApp: TComboBox
        Left = 162
        Top = 70
        Width = 145
        Height = 21
        TabOrder = 2
        Text = 'Not activated'
        OnSelect = cbbCommandStopAppSelect
        Items.Strings = (
          'Not activated'
          'Activated')
      end
      object cbbCommandStandbyHMI: TComboBox
        Left = 162
        Top = 96
        Width = 145
        Height = 21
        TabOrder = 3
        Text = 'Not activated'
        OnSelect = cbbCommandStandbyHMISelect
        Items.Strings = (
          'Not activated'
          'Activated')
      end
      object cbbCommandStartHMI: TComboBox
        Left = 162
        Top = 123
        Width = 145
        Height = 21
        TabOrder = 4
        Text = 'Not activated'
        OnSelect = cbbCommandStartHMISelect
        Items.Strings = (
          'Not activated'
          'Activated')
      end
      object cbbCommandStopHMI: TComboBox
        Left = 162
        Top = 150
        Width = 145
        Height = 21
        TabOrder = 5
        Text = 'Not activated'
        OnSelect = cbbCommandStopHMISelect
        Items.Strings = (
          'Not activated'
          'Activated')
      end
      object cbbStateBlockOut: TComboBox
        Left = 162
        Top = 177
        Width = 145
        Height = 21
        TabOrder = 6
        Text = 'Activated'
        OnSelect = cbbStateBlockOutSelect
        Items.Strings = (
          'Activated'
          'Not activated')
      end
      object cbbStateRestart: TComboBox
        Left = 162
        Top = 204
        Width = 145
        Height = 21
        TabOrder = 7
        Text = 'Activated'
        OnSelect = cbbStateRestartSelect
        Items.Strings = (
          'Activated'
          'Not activated')
      end
      object cbbStateValueValid: TComboBox
        Left = 162
        Top = 231
        Width = 145
        Height = 21
        TabOrder = 8
        Text = 'Valid'
        OnSelect = cbbStateValueValidSelect
        Items.Strings = (
          'Valid'
          'Not valid')
      end
      object cbbStateManualAuto: TComboBox
        Left = 162
        Top = 258
        Width = 145
        Height = 21
        TabOrder = 9
        Text = 'Manual'
        OnSelect = cbbStateManualAutoSelect
        Items.Strings = (
          'Manual'
          'Auto')
      end
      object cbbStateElementDisabled: TComboBox
        Left = 162
        Top = 285
        Width = 145
        Height = 21
        TabOrder = 10
        Text = 'Disabled'
        OnSelect = cbbStateElementDisabledSelect
        Items.Strings = (
          'Disabled'
          'Enabled')
      end
      object cbbStateSwitchRFU: TComboBox
        Left = 162
        Top = 312
        Width = 145
        Height = 21
        TabOrder = 11
        Text = 'RFU'
        OnSelect = cbbStateSwitchRFUSelect
        Items.Strings = (
          'RFU'
          'Not RFU')
      end
      object cbbStateRunCondition: TComboBox
        Left = 162
        Top = 339
        Width = 145
        Height = 21
        TabOrder = 12
        Text = 'OK'
        OnSelect = cbbStateRunConditionSelect
        Items.Strings = (
          'OK'
          'NOK')
      end
    end
    object grpOutput2: TGroupBox
      Left = 13
      Top = 386
      Width = 321
      Height = 126
      Caption = 'output'
      TabOrder = 1
      object lbl21: TLabel
        Left = 80
        Top = 17
        Width = 56
        Height = 13
        Caption = 'State Alarm'
      end
      object lbl22: TLabel
        Left = 60
        Top = 44
        Width = 76
        Height = 13
        Caption = 'State Command'
      end
      object lbl23: TLabel
        Left = 32
        Top = 71
        Width = 104
        Height = 13
        Caption = 'State Control Position'
      end
      object lbl24: TLabel
        Left = 69
        Top = 98
        Width = 67
        Height = 13
        Caption = 'State Element'
      end
      object cbbStateAlarm: TComboBox
        Left = 162
        Top = 14
        Width = 145
        Height = 21
        TabOrder = 0
        Text = 'None'
        Items.Strings = (
          'None'
          'Fault'
          'Running - Failed to Standby'
          'Standby - Failed to Start'
          'Standby - Failed to Stop'
          'Stopped - Failed to Standby'
          'Stopped - Failed to Start'
          'Running - Failed to Stop'
          'Unknown')
      end
      object cbbStateCommand: TComboBox
        Left = 162
        Top = 41
        Width = 145
        Height = 21
        TabOrder = 1
        Text = 'None'
        Items.Strings = (
          'None'
          'Command standby'
          'Command start'
          'Command stop')
      end
      object cbbStateElement: TComboBox
        Left = 162
        Top = 95
        Width = 145
        Height = 21
        TabOrder = 2
        Text = 'Disabled'
        Items.Strings = (
          'Disabled'
          'Stopped'
          'Running'
          'Standby'
          'Transition'
          'Not valid'
          'Not RFU'
          'Running - Failed to Standby'
          'Standby - Failed to Start'
          'Standby - Failed to Stop'
          'Stopped - Failed to Standby'
          'Stopped - Failed to Start'
          'Running - Failed to Stop'
          'Unknown'
          'Fault')
      end
      object cbbControlPosition: TComboBox
        Left = 162
        Top = 68
        Width = 145
        Height = 21
        TabOrder = 3
        Text = 'None'
        Items.Strings = (
          'None'
          'Local'
          'Manual'
          'Auto')
      end
    end
  end
  object grpParameters: TGroupBox
    Left = 8
    Top = 279
    Width = 307
    Height = 82
    Caption = 'Parameters'
    TabOrder = 2
    object lbl25: TLabel
      Left = 89
      Top = 15
      Width = 31
      Height = 13
      Caption = 'Ttrans'
    end
    object lbl26: TLabel
      Left = 99
      Top = 47
      Width = 21
      Height = 13
      Caption = 'Tctrl'
    end
    object edtTtrans: TEdit
      Tag = 1
      Left = 140
      Top = 15
      Width = 145
      Height = 21
      TabOrder = 0
      OnKeyPress = edtTtransKeyPress
    end
    object edtTctrl: TEdit
      Tag = 2
      Left = 140
      Top = 42
      Width = 145
      Height = 21
      TabOrder = 1
      OnKeyPress = edtTtransKeyPress
    end
  end
end
