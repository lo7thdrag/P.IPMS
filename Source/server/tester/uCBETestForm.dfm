object frmCBETest: TfrmCBETest
  Left = 0
  Top = 0
  Caption = 'CBE TES'
  ClientHeight = 443
  ClientWidth = 726
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
    Width = 340
    Height = 289
    Caption = 'Platform Interface'
    TabOrder = 0
    object grpInput: TGroupBox
      Left = 13
      Top = 20
      Width = 316
      Height = 173
      Caption = 'INPUT'
      TabOrder = 0
      object lbl1: TLabel
        Left = 35
        Top = 22
        Width = 86
        Height = 13
        Caption = 'State switch close'
      end
      object lbl2: TLabel
        Left = 35
        Top = 49
        Width = 86
        Height = 13
        Caption = 'State switch open'
      end
      object lbl3: TLabel
        Left = 25
        Top = 76
        Width = 96
        Height = 13
        Caption = 'State switch remote'
      end
      object lbl4: TLabel
        Left = 25
        Top = 104
        Width = 96
        Height = 13
        Caption = 'State switch tripped'
      end
      object lbl5: TLabel
        Left = 22
        Top = 130
        Width = 99
        Height = 13
        Caption = 'State switch no fault'
      end
      object cbbStateSwitchClose: TComboBox
        Left = 147
        Top = 19
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 0
        OnSelect = cbbStateSwitchCloseSelect
        Items.Strings = (
          'Closed'
          'Not closed')
      end
      object cbbStateSwitchOpen: TComboBox
        Left = 147
        Top = 46
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 1
        OnSelect = cbbStateSwitchOpenSelect
        Items.Strings = (
          'Open'
          'Not open')
      end
      object cbbStateSwitchRemote: TComboBox
        Left = 147
        Top = 73
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 2
        OnSelect = cbbStateSwitchRemoteSelect
        Items.Strings = (
          'Local'
          'Remote')
      end
      object cbbStateSwitchTripped: TComboBox
        Left = 147
        Top = 100
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 3
        OnSelect = cbbStateSwitchTrippedSelect
        Items.Strings = (
          'Tripped'
          'Not tripped')
      end
      object cbbStateSwitchNoFault: TComboBox
        Left = 147
        Top = 127
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 4
        OnSelect = cbbStateSwitchNoFaultSelect
        Items.Strings = (
          'Fault'
          'No fault')
      end
    end
    object grpOutput: TGroupBox
      Left = 13
      Top = 199
      Width = 316
      Height = 75
      Caption = 'OUTPUT'
      TabOrder = 1
      object lbl6: TLabel
        Left = 58
        Top = 19
        Width = 62
        Height = 13
        Caption = 'Control close'
      end
      object lbl7: TLabel
        Left = 59
        Top = 46
        Width = 62
        Height = 13
        Caption = 'Control open'
      end
      object edtControlClose: TEdit
        Left = 147
        Top = 16
        Width = 145
        Height = 21
        TabOrder = 0
      end
      object edtControlOpen: TEdit
        Left = 147
        Top = 43
        Width = 145
        Height = 21
        TabOrder = 1
      end
    end
  end
  object grpIPMSInterface: TGroupBox
    Left = 354
    Top = 8
    Width = 367
    Height = 431
    Caption = 'IPMS Interface'
    TabOrder = 1
    object grpInputIPMS: TGroupBox
      Left = 11
      Top = 20
      Width = 342
      Height = 269
      Caption = 'INPUT'
      TabOrder = 0
      object lbl10: TLabel
        Left = 50
        Top = 75
        Width = 104
        Height = 13
        Caption = 'Command close (HMI)'
      end
      object lbl11: TLabel
        Left = 50
        Top = 103
        Width = 104
        Height = 13
        Caption = 'Command open (HMI)'
      end
      object lbl13: TLabel
        Left = 48
        Top = 132
        Width = 109
        Height = 13
        Caption = 'State element disabled'
      end
      object lbl14: TLabel
        Left = 58
        Top = 159
        Width = 98
        Height = 13
        Caption = 'State alarm inhibited'
      end
      object lbl15: TLabel
        Left = 66
        Top = 186
        Width = 89
        Height = 13
        Caption = 'State auto/manual'
      end
      object lbl16: TLabel
        Left = 106
        Top = 213
        Width = 49
        Height = 13
        Caption = 'State RFC'
      end
      object lbl17: TLabel
        Left = 106
        Top = 239
        Width = 50
        Height = 13
        Caption = 'State RFO'
      end
      object lbl8: TLabel
        Left = 18
        Top = 23
        Width = 136
        Height = 13
        Caption = 'Command close (application)'
      end
      object lbl9: TLabel
        Left = 18
        Top = 49
        Width = 136
        Height = 13
        Caption = 'Command open (application)'
      end
      object cbbCommandCloseApp: TComboBox
        Left = 184
        Top = 19
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 0
        OnSelect = cbbCommandCloseAppSelect
        Items.Strings = (
          'Not activated'
          'Activated')
      end
      object cbbCommandOpenApp: TComboBox
        Left = 184
        Top = 46
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 1
        OnSelect = cbbCommandOpenAppSelect
        Items.Strings = (
          'Not activated'
          'Activated')
      end
      object cbbCommandCloseHMI: TComboBox
        Left = 184
        Top = 73
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 2
        OnSelect = cbbCommandCloseHMISelect
        Items.Strings = (
          'Not activated'
          'Activated')
      end
      object cbbCommandOpenHMI: TComboBox
        Left = 184
        Top = 100
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 3
        OnSelect = cbbCommandOpenHMISelect
        Items.Strings = (
          'Not activated'
          'Activated')
      end
      object cbbStateElementDisabled: TComboBox
        Left = 184
        Top = 129
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 4
        OnSelect = cbbStateElementDisabledSelect
        Items.Strings = (
          'Disabled'
          'Enabled')
      end
      object cbbStateAlarmInhibited: TComboBox
        Left = 184
        Top = 156
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 5
        OnSelect = cbbStateAlarmInhibitedSelect
        Items.Strings = (
          'Inhibited'
          'Not inhibited')
      end
      object cbbStateAutoManual: TComboBox
        Left = 184
        Top = 183
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 6
        OnSelect = cbbStateAutoManualSelect
        Items.Strings = (
          'Manual'
          'Auto')
      end
      object cbbStateRFC: TComboBox
        Left = 184
        Top = 210
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 7
        OnSelect = cbbStateRFCSelect
        Items.Strings = (
          'Ready for Closing'
          'Not Ready for Closing')
      end
      object cbbStateRFO: TComboBox
        Left = 184
        Top = 237
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 8
        OnSelect = cbbStateRFOSelect
        Items.Strings = (
          'Ready for Opening'
          'Not Ready for Opening')
      end
    end
    object grpOutputIPMS: TGroupBox
      Left = 11
      Top = 295
      Width = 342
      Height = 122
      Caption = 'OUTPUT'
      TabOrder = 1
      object lbl18: TLabel
        Left = 101
        Top = 17
        Width = 55
        Height = 13
        Caption = 'State alarm'
      end
      object lbl19: TLabel
        Left = 78
        Top = 44
        Width = 76
        Height = 13
        Caption = 'State Command'
      end
      object lbl20: TLabel
        Left = 56
        Top = 71
        Width = 102
        Height = 13
        Caption = 'State control position'
      end
      object lbl21: TLabel
        Left = 87
        Top = 98
        Width = 67
        Height = 13
        Caption = 'State element'
      end
      object edtStateAlarm: TEdit
        Left = 184
        Top = 13
        Width = 145
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object edtStateCommand: TEdit
        Left = 184
        Top = 40
        Width = 145
        Height = 21
        ReadOnly = True
        TabOrder = 1
      end
      object edtStateControlPosition: TEdit
        Left = 184
        Top = 67
        Width = 145
        Height = 21
        ReadOnly = True
        TabOrder = 2
      end
      object edtStateElement: TEdit
        Left = 184
        Top = 98
        Width = 145
        Height = 21
        ReadOnly = True
        TabOrder = 3
      end
    end
  end
  object grpParameters: TGroupBox
    Left = 8
    Top = 303
    Width = 340
    Height = 136
    Caption = 'Parameters'
    TabOrder = 2
    object lbl12: TLabel
      Left = 107
      Top = 40
      Width = 27
      Height = 13
      Caption = 'Trans'
    end
    object lbl23: TLabel
      Left = 113
      Top = 80
      Width = 21
      Height = 13
      Caption = 'Tctrl'
    end
    object edtTrans: TEdit
      Tag = 1
      Left = 160
      Top = 32
      Width = 145
      Height = 21
      ReadOnly = True
      TabOrder = 0
      Text = '0'
      OnKeyPress = edtTransKeyPress
    end
    object edtTctrl: TEdit
      Tag = 2
      Left = 160
      Top = 80
      Width = 145
      Height = 21
      ReadOnly = True
      TabOrder = 1
      Text = '0'
      OnKeyPress = edtTransKeyPress
    end
  end
end
