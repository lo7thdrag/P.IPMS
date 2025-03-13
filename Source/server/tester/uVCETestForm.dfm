object frmVCETest: TfrmVCETest
  Left = 0
  Top = 0
  Caption = 'VCE TEST'
  ClientHeight = 392
  ClientWidth = 758
  Color = clBtnShadow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object grpIPMSInterface: TGroupBox
    Left = 383
    Top = 6
    Width = 369
    Height = 378
    BiDiMode = bdLeftToRight
    Caption = 'IPMS Interface'
    ParentBiDiMode = False
    TabOrder = 0
    object grpInput2: TGroupBox
      Left = 10
      Top = 13
      Width = 343
      Height = 220
      Caption = 'Input'
      TabOrder = 0
      object lbl6: TLabel
        Left = 18
        Top = 24
        Width = 137
        Height = 13
        Caption = 'Command Close (Applicaton)'
      end
      object lbl7: TLabel
        Left = 22
        Top = 51
        Width = 133
        Height = 13
        Caption = 'Command Open (Appliction)'
      end
      object lbl8: TLabel
        Left = 51
        Top = 78
        Width = 106
        Height = 13
        Caption = 'Command Close (HMI)'
      end
      object lbl9: TLabel
        Left = 49
        Top = 106
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
        Left = 106
        Top = 187
        Width = 49
        Height = 13
        Caption = 'State RFU'
      end
      object cbbCommandCloseApp: TComboBox
        Tag = 1
        Left = 184
        Top = 21
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
        Tag = 2
        Left = 184
        Top = 48
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 1
        OnSelect = cbbCommandCloseAppSelect
        Items.Strings = (
          'Not activated'
          'Activated')
      end
      object cbbCommandCloseHMI: TComboBox
        Tag = 3
        Left = 184
        Top = 75
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 2
        OnSelect = cbbCommandCloseAppSelect
        Items.Strings = (
          'Not activated'
          'Activated')
      end
      object cbbCommandOpenHMI: TComboBox
        Tag = 4
        Left = 184
        Top = 103
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 3
        OnSelect = cbbCommandCloseAppSelect
        Items.Strings = (
          'Not activated'
          'Activated')
      end
      object cbbStateElementDisabled: TComboBox
        Left = 184
        Top = 130
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 4
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
        Style = csDropDownList
        TabOrder = 5
        OnSelect = cbbStateManualAutoSelect
        Items.Strings = (
          'Manual'
          'Auto')
      end
      object cbbStateRFU: TComboBox
        Left = 184
        Top = 184
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 6
        OnSelect = cbbStateRFUSelect
        Items.Strings = (
          'Ready for use'
          'Not ready for use')
      end
    end
    object grpOutput2: TGroupBox
      Left = 10
      Top = 239
      Width = 343
      Height = 130
      Caption = 'Output'
      TabOrder = 1
      object lbl13: TLabel
        Left = 106
        Top = 20
        Width = 56
        Height = 13
        Caption = 'State Alarm'
      end
      object lbl14: TLabel
        Left = 86
        Top = 47
        Width = 76
        Height = 13
        Caption = 'State Command'
      end
      object lbl15: TLabel
        Left = 58
        Top = 74
        Width = 104
        Height = 13
        Caption = 'State Control Position'
      end
      object lbl16: TLabel
        Left = 95
        Top = 101
        Width = 67
        Height = 13
        Caption = 'State Element'
      end
      object edtStateAlarm: TEdit
        Left = 184
        Top = 17
        Width = 145
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object edtStateCommand: TEdit
        Left = 184
        Top = 44
        Width = 145
        Height = 21
        ReadOnly = True
        TabOrder = 1
      end
      object edtControlPosition: TEdit
        Left = 184
        Top = 71
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
  object grpParameter: TGroupBox
    Left = 8
    Top = 232
    Width = 369
    Height = 152
    Caption = 'Parameter'
    TabOrder = 1
    object lbl17: TLabel
      Left = 134
      Top = 29
      Width = 31
      Height = 13
      Caption = 'Ttrans'
    end
    object lbl18: TLabel
      Left = 144
      Top = 56
      Width = 21
      Height = 13
      Caption = 'Tctrl'
    end
    object edtTtrans: TEdit
      Tag = 1
      Left = 194
      Top = 26
      Width = 145
      Height = 21
      ReadOnly = True
      TabOrder = 0
      OnKeyPress = edtTtransKeyPress
    end
    object edtTctrl: TEdit
      Tag = 2
      Left = 194
      Top = 53
      Width = 145
      Height = 21
      ReadOnly = True
      TabOrder = 1
      OnKeyPress = edtTtransKeyPress
    end
  end
  object grpInput: TGroupBox
    Left = 8
    Top = 8
    Width = 369
    Height = 218
    Caption = 'Input'
    TabOrder = 2
    object lbl1: TLabel
      Left = 66
      Top = 35
      Width = 89
      Height = 13
      Caption = 'State Switch Close'
    end
    object lbl2: TLabel
      Left = 66
      Top = 62
      Width = 89
      Height = 13
      Caption = 'State Switch Open'
    end
    object lbl3: TLabel
      Left = 55
      Top = 87
      Width = 100
      Height = 13
      Caption = 'State Switch Remote'
    end
    object cbbStateSwitchClose: TComboBox
      Left = 184
      Top = 32
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
      Left = 184
      Top = 59
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
      Left = 184
      Top = 86
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 2
      OnSelect = cbbStateSwitchRemoteSelect
      Items.Strings = (
        'Local'
        'Remote')
    end
  end
end
