object frmSWNTest: TfrmSWNTest
  Left = 0
  Top = 0
  Caption = 'SWN TEST'
  ClientHeight = 166
  ClientWidth = 565
  Color = clBtnShadow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object grpInput: TGroupBox
    Left = 2
    Top = 0
    Width = 305
    Height = 161
    Caption = 'Input'
    TabOrder = 0
    object lbl1: TLabel
      Left = 59
      Top = 25
      Width = 60
      Height = 13
      Caption = 'State Switch'
    end
    object lbl2: TLabel
      Left = 18
      Top = 52
      Width = 101
      Height = 13
      Caption = 'State Alarm Inhibited'
    end
    object lbl3: TLabel
      Left = 48
      Top = 79
      Width = 71
      Height = 13
      Caption = 'Evaluate State'
    end
    object lbl4: TLabel
      Left = 9
      Top = 106
      Width = 110
      Height = 13
      Caption = 'State Element Disabled'
    end
    object cbbEvaluateState: TComboBox
      Left = 136
      Top = 76
      Width = 145
      Height = 21
      TabOrder = 0
      Text = 'False'
      OnSelect = cbbEvaluateStateSelect
      Items.Strings = (
        'False'
        'True')
    end
    object cbbStateAlarmInhibited: TComboBox
      Left = 136
      Top = 49
      Width = 145
      Height = 21
      TabOrder = 1
      Text = 'Not inhibited'
      OnSelect = cbbStateAlarmInhibitedSelect
      Items.Strings = (
        'Not inhibited'
        'Inhibited')
    end
    object cbbStateElementDisabled: TComboBox
      Left = 136
      Top = 103
      Width = 145
      Height = 21
      TabOrder = 2
      Text = 'Disabled'
      OnSelect = cbbStateElementDisabledSelect
      Items.Strings = (
        'Disabled'
        'Enabled')
    end
    object cbbStateSwitch: TComboBox
      Left = 136
      Top = 22
      Width = 145
      Height = 21
      TabOrder = 3
      Text = 'False'
      OnSelect = cbbStateSwitchSelect
      Items.Strings = (
        'False'
        'True')
    end
  end
  object grpOutput: TGroupBox
    Left = 313
    Top = 0
    Width = 250
    Height = 82
    Caption = 'Output'
    TabOrder = 1
    object lbl5: TLabel
      Left = 23
      Top = 25
      Width = 56
      Height = 13
      Caption = 'State Alarm'
    end
    object lbl6: TLabel
      Left = 12
      Top = 52
      Width = 67
      Height = 13
      Caption = 'State Element'
    end
    object cbbStateAlarm: TComboBox
      Left = 96
      Top = 22
      Width = 145
      Height = 21
      TabOrder = 0
      Text = 'None'
      Items.Strings = (
        'None'
        'Alarm'
        'Inhibited')
    end
    object cbbStateElement: TComboBox
      Left = 96
      Top = 49
      Width = 145
      Height = 21
      TabOrder = 1
      Text = 'Disabled'
      Items.Strings = (
        'Disabled'
        'State 0'
        'State 1'
        'Warning'
        'Alarm')
    end
  end
  object grpParameters: TGroupBox
    Left = 313
    Top = 88
    Width = 250
    Height = 73
    Caption = 'Parameters'
    TabOrder = 2
    object lbl7: TLabel
      Left = 50
      Top = 19
      Width = 29
      Height = 13
      Caption = 'MODE'
    end
    object lbl8: TLabel
      Left = 42
      Top = 46
      Width = 37
      Height = 13
      Caption = 'TDELAY'
    end
    object edtTdelay: TEdit
      Left = 96
      Top = 43
      Width = 145
      Height = 21
      TabOrder = 0
      OnKeyPress = edtTdelayKeyPress
    end
    object cbbMode: TComboBox
      Left = 96
      Top = 16
      Width = 145
      Height = 21
      TabOrder = 1
      Text = 'Alarm'
      OnSelect = cbbModeSelect
      Items.Strings = (
        'Alarm'
        'No alarm')
    end
  end
end
