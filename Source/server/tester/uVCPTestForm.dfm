object frmVCPTest: TfrmVCPTest
  Left = 0
  Top = 0
  Caption = 'VCP TEST'
  ClientHeight = 258
  ClientWidth = 678
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
    Height = 190
    Caption = 'Platform Interface'
    TabOrder = 0
    object grpInput: TGroupBox
      Left = 16
      Top = 16
      Width = 297
      Height = 81
      Caption = 'grpInput'
      TabOrder = 0
      object lbl1: TLabel
        Left = 67
        Top = 24
        Width = 55
        Height = 13
        Caption = 'Value Valve'
      end
      object lbl2: TLabel
        Left = 22
        Top = 51
        Width = 100
        Height = 13
        Caption = 'State Switch Remote'
      end
      object edtValueValve: TEdit
        Tag = 1
        Left = 138
        Top = 21
        Width = 145
        Height = 21
        TabOrder = 0
        OnKeyPress = edtTtransKeyPress
      end
      object cbbStateSwitchRemote: TComboBox
        Left = 138
        Top = 48
        Width = 145
        Height = 21
        TabOrder = 1
        Text = 'Local'
        OnSelect = cbbStateSwitchRemoteSelect
        Items.Strings = (
          'Local'
          'Remote')
      end
    end
    object grpOutput: TGroupBox
      Left = 16
      Top = 103
      Width = 297
      Height = 74
      Caption = 'grpOutput'
      TabOrder = 1
      object lbl3: TLabel
        Left = 58
        Top = 19
        Width = 64
        Height = 13
        Caption = 'Control Close'
      end
      object lbl4: TLabel
        Left = 58
        Top = 46
        Width = 64
        Height = 13
        Caption = 'Control Open'
      end
      object cbbControlClose: TComboBox
        Left = 138
        Top = 16
        Width = 145
        Height = 21
        TabOrder = 0
        Text = 'Not activated'
        Items.Strings = (
          'Not activated'
          'Activated'
          '')
      end
      object cbbControlOpen: TComboBox
        Left = 138
        Top = 43
        Width = 145
        Height = 21
        TabOrder = 1
        Text = 'Not activated'
        Items.Strings = (
          'Not activated'
          'Activated')
      end
    end
  end
  object grpIPMSInterface: TGroupBox
    Left = 343
    Top = 8
    Width = 329
    Height = 244
    Caption = 'IPMS Interface'
    TabOrder = 1
    object grpInput2: TGroupBox
      Left = 16
      Top = 16
      Width = 297
      Height = 57
      Caption = 'Input'
      TabOrder = 0
      object lbl5: TLabel
        Left = 12
        Top = 24
        Width = 110
        Height = 13
        Caption = 'State Element Disabled'
      end
      object cbbStateElementDisabled: TComboBox
        Left = 138
        Top = 24
        Width = 145
        Height = 21
        TabOrder = 0
        Text = 'Disabled'
        OnSelect = cbbStateElementDisabledSelect
        Items.Strings = (
          'Disabled'
          'Enabled')
      end
    end
    object grpOutput2: TGroupBox
      Left = 16
      Top = 99
      Width = 297
      Height = 129
      Caption = 'Output'
      TabOrder = 1
      object lbl6: TLabel
        Left = 66
        Top = 20
        Width = 56
        Height = 13
        Caption = 'State Alarm'
      end
      object lbl7: TLabel
        Left = 18
        Top = 47
        Width = 104
        Height = 13
        Caption = 'State Control Position'
      end
      object lbl8: TLabel
        Left = 55
        Top = 74
        Width = 67
        Height = 13
        Caption = 'State Element'
      end
      object lbl9: TLabel
        Left = 55
        Top = 101
        Width = 67
        Height = 13
        Caption = 'Value Element'
      end
      object cbbStateAlarm: TComboBox
        Left = 138
        Top = 17
        Width = 145
        Height = 21
        TabOrder = 0
        Text = 'None'
        Items.Strings = (
          'None'
          'ControlOpenFailure'
          'ControlCloseFailure'
          'OORL'
          'OORH')
      end
      object cbbStateControlPosition: TComboBox
        Left = 138
        Top = 44
        Width = 145
        Height = 21
        TabOrder = 1
        Text = 'None'
        Items.Strings = (
          'None'
          'Local'
          'Remote')
      end
      object cbbStateElement: TComboBox
        Left = 138
        Top = 71
        Width = 145
        Height = 21
        TabOrder = 2
        Text = 'Disabled'
        Items.Strings = (
          'Disabled'
          'Closed'
          'Open'
          'Transition'
          'NotRFO'
          'NotRFC'
          'ControlOpenFailure'
          'ControlCloseFailure'
          'OORL'
          'OORH')
      end
      object edtValueElement: TEdit
        Left = 138
        Top = 98
        Width = 145
        Height = 21
        TabOrder = 3
      end
    end
  end
  object grp1: TGroupBox
    Left = 8
    Top = 204
    Width = 329
    Height = 48
    Caption = 'grp1'
    TabOrder = 2
    object lbl10: TLabel
      Left = 107
      Top = 20
      Width = 31
      Height = 13
      Caption = 'Ttrans'
    end
    object edtTtrans: TEdit
      Tag = 2
      Left = 154
      Top = 17
      Width = 145
      Height = 21
      TabOrder = 0
      OnKeyPress = edtTtransKeyPress
    end
  end
end
