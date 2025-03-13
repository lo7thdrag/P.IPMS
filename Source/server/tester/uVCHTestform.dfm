object frmVCHTest: TfrmVCHTest
  Left = 0
  Top = 0
  Caption = 'VCH TEST'
  ClientHeight = 397
  ClientWidth = 703
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
    Width = 313
    Height = 225
    Caption = 'Platform Interface'
    TabOrder = 0
    object grpInput: TGroupBox
      Left = 16
      Top = 16
      Width = 281
      Height = 113
      Caption = 'Input'
      TabOrder = 0
      object lbl1: TLabel
        Left = 15
        Top = 19
        Width = 95
        Height = 13
        Caption = 'State Switch Closed'
      end
      object lbl2: TLabel
        Left = 21
        Top = 46
        Width = 89
        Height = 13
        Caption = 'State Switch Open'
      end
      object lbl3: TLabel
        Left = 10
        Top = 78
        Width = 100
        Height = 13
        Caption = 'State Switch Remote'
      end
      object cbbStateSwitchClosed: TComboBox
        Left = 125
        Top = 16
        Width = 145
        Height = 21
        TabOrder = 0
        Text = 'Closed'
        OnSelect = cbbStateSwitchClosedSelect
        Items.Strings = (
          'Closed'
          'Not closed')
      end
      object cbbStateSwitchOpen: TComboBox
        Left = 125
        Top = 43
        Width = 145
        Height = 21
        TabOrder = 1
        Text = 'Open'
        OnSelect = cbbStateSwitchOpenSelect
        Items.Strings = (
          'Open'
          'No open')
      end
      object cbbStateSwitchRemote: TComboBox
        Left = 125
        Top = 75
        Width = 145
        Height = 21
        TabOrder = 2
        Text = 'Local'
        OnSelect = cbbStateSwitchRemoteSelect
        Items.Strings = (
          'Local'
          'Remote')
      end
    end
    object grpOutput: TGroupBox
      Left = 16
      Top = 135
      Width = 281
      Height = 74
      Caption = 'Output'
      TabOrder = 1
      object lbl4: TLabel
        Left = 53
        Top = 17
        Width = 57
        Height = 13
        Caption = 'Control Run'
      end
      object lbl5: TLabel
        Left = 30
        Top = 44
        Width = 80
        Height = 13
        Caption = 'Control Direction'
      end
      object cbbControlRun: TComboBox
        Left = 125
        Top = 14
        Width = 145
        Height = 21
        TabOrder = 0
        Text = 'Run'
        Items.Strings = (
          'Run'
          'Stop')
      end
      object cbbControlDirection: TComboBox
        Left = 125
        Top = 41
        Width = 145
        Height = 21
        TabOrder = 1
        Text = 'Open'
        Items.Strings = (
          'Open'
          'Close')
      end
    end
  end
  object grpIPMSInterface: TGroupBox
    Left = 327
    Top = 8
    Width = 370
    Height = 385
    Caption = 'IPMS Interface'
    TabOrder = 1
    object grpInput2: TGroupBox
      Left = 15
      Top = 16
      Width = 343
      Height = 220
      Caption = 'Input'
      TabOrder = 0
      object lbl6: TLabel
        Left = 18
        Top = 51
        Width = 137
        Height = 13
        Caption = 'Command Close (Applicaton)'
      end
      object lbl7: TLabel
        Left = 24
        Top = 24
        Width = 133
        Height = 13
        Caption = 'Command Open (Appliction)'
      end
      object lbl8: TLabel
        Left = 51
        Top = 106
        Width = 106
        Height = 13
        Caption = 'Command Close (HMI)'
      end
      object lbl9: TLabel
        Left = 51
        Top = 78
        Width = 106
        Height = 13
        Caption = 'Command Open (HMI)'
      end
      object lbl10: TLabel
        Left = 45
        Top = 133
        Width = 110
        Height = 13
        Caption = 'State Element Disabled'
      end
      object lbl11: TLabel
        Left = 65
        Top = 160
        Width = 90
        Height = 13
        Caption = 'State Auto/Manual'
      end
      object lbl12: TLabel
        Left = 135
        Top = 187
        Width = 20
        Height = 13
        Caption = 'RFU'
      end
      object cbbCommandCloseApp: TComboBox
        Tag = 2
        Left = 184
        Top = 48
        Width = 145
        Height = 21
        TabOrder = 0
        Text = 'Not activated'
        OnSelect = cbbCommandOpenAppSelect
        Items.Strings = (
          'Not activated'
          'Activated')
      end
      object cbbCommandOpenApp: TComboBox
        Tag = 1
        Left = 184
        Top = 21
        Width = 145
        Height = 21
        TabOrder = 1
        Text = 'Not activated'
        OnSelect = cbbCommandOpenAppSelect
        Items.Strings = (
          'Not activated'
          'Activated')
      end
      object cbbCommandCloseHMI: TComboBox
        Tag = 4
        Left = 184
        Top = 103
        Width = 145
        Height = 21
        TabOrder = 2
        Text = 'Not activated'
        OnSelect = cbbCommandOpenAppSelect
        Items.Strings = (
          'Not activated'
          'Activated')
      end
      object cbbCommandOpenHMI: TComboBox
        Tag = 3
        Left = 184
        Top = 75
        Width = 145
        Height = 21
        TabOrder = 3
        Text = 'Not activated'
        OnSelect = cbbCommandOpenAppSelect
        Items.Strings = (
          'Not activated'
          'Activated')
      end
      object cbbStateElementDisabled: TComboBox
        Left = 184
        Top = 130
        Width = 145
        Height = 21
        TabOrder = 4
        Text = 'Disabled'
        OnSelect = cbbStateElementDisabledSelect
        Items.Strings = (
          'Disabled'
          'Enabled')
      end
      object cbbStateManualAuto: TComboBox
        Left = 184
        Top = 157
        Width = 145
        Height = 21
        TabOrder = 5
        Text = 'Manual'
        OnSelect = cbbStateManualAutoSelect
        Items.Strings = (
          'Manual'
          'Auto')
      end
      object cbbRFU: TComboBox
        Left = 184
        Top = 184
        Width = 145
        Height = 21
        TabOrder = 6
        Text = 'RFU'
        OnSelect = cbbRFUSelect
        Items.Strings = (
          'RFU'
          'Not RFU')
      end
    end
    object grpOutput2: TGroupBox
      Left = 15
      Top = 242
      Width = 343
      Height = 130
      Caption = 'Output'
      TabOrder = 1
      object lbl13: TLabel
        Left = 99
        Top = 20
        Width = 56
        Height = 13
        Caption = 'State Alarm'
      end
      object lbl14: TLabel
        Left = 79
        Top = 47
        Width = 76
        Height = 13
        Caption = 'State Command'
      end
      object lbl15: TLabel
        Left = 51
        Top = 74
        Width = 104
        Height = 13
        Caption = 'State Control Position'
      end
      object lbl16: TLabel
        Left = 88
        Top = 101
        Width = 67
        Height = 13
        Caption = 'State Element'
      end
      object cbbStateAlarm: TComboBox
        Left = 184
        Top = 17
        Width = 145
        Height = 21
        TabOrder = 0
        Text = 'None'
        Items.Strings = (
          'None'
          'OpenFailure'
          'CloseFailure'
          'Unknown')
      end
      object cbbStateCommand: TComboBox
        Left = 184
        Top = 44
        Width = 145
        Height = 21
        TabOrder = 1
        Text = 'None'
        Items.Strings = (
          'None'
          'Command close'
          'Command open')
      end
      object cbbStateControlPosition: TComboBox
        Left = 184
        Top = 71
        Width = 145
        Height = 21
        TabOrder = 2
        Text = 'None'
        Items.Strings = (
          'None'
          'Local'
          'Manual'
          'Auto')
      end
      object cbbStateElement: TComboBox
        Left = 184
        Top = 98
        Width = 145
        Height = 21
        TabOrder = 3
        Text = 'Disabled'
        Items.Strings = (
          'Disabled'
          'Closed'
          'Open'
          'Transition'
          'NotRFU'
          'CloseFailure'
          'OpenFailure'
          'Unknown')
      end
    end
  end
  object grpParameters: TGroupBox
    Left = 8
    Top = 239
    Width = 313
    Height = 154
    Caption = 'Parameters'
    TabOrder = 2
    object lbl17: TLabel
      Left = 95
      Top = 21
      Width = 31
      Height = 13
      Caption = 'Ttrans'
    end
    object lbl18: TLabel
      Left = 101
      Top = 48
      Width = 25
      Height = 13
      Caption = 'TCdd'
    end
    object lbl19: TLabel
      Left = 103
      Top = 75
      Width = 23
      Height = 13
      Caption = 'TCtrl'
    end
    object edtTrans: TEdit
      Tag = 1
      Left = 141
      Top = 18
      Width = 145
      Height = 21
      TabOrder = 0
      OnKeyPress = edtTransKeyPress
    end
    object edtCtrl: TEdit
      Tag = 3
      Left = 141
      Top = 72
      Width = 145
      Height = 21
      TabOrder = 1
      OnKeyPress = edtTransKeyPress
    end
    object edtCdd: TEdit
      Tag = 2
      Left = 141
      Top = 45
      Width = 145
      Height = 21
      TabOrder = 2
      OnKeyPress = edtTransKeyPress
    end
  end
end
