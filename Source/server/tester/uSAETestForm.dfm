object frmSAETest: TfrmSAETest
  Left = 0
  Top = 0
  Caption = 'SAE TEST'
  ClientHeight = 271
  ClientWidth = 594
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
    Left = 8
    Top = 0
    Width = 337
    Height = 265
    Caption = 'Input'
    TabOrder = 0
    object lbl1: TLabel
      Left = 73
      Top = 18
      Width = 81
      Height = 13
      Caption = 'Value Application'
    end
    object lbl2: TLabel
      Left = 44
      Top = 45
      Width = 110
      Height = 13
      Caption = 'State Element Disabled'
    end
    object lbl3: TLabel
      Left = 9
      Top = 72
      Width = 145
      Height = 13
      Caption = 'State Display Stationary Value'
    end
    object lbl4: TLabel
      Left = 53
      Top = 99
      Width = 101
      Height = 13
      Caption = 'State Alarm Inhibited'
    end
    object lbl5: TLabel
      Left = 74
      Top = 126
      Width = 80
      Height = 13
      Caption = 'State Value Valid'
    end
    object lbl6: TLabel
      Left = 73
      Top = 153
      Width = 81
      Height = 13
      Caption = 'State Wire break'
    end
    object lbl7: TLabel
      Left = 76
      Top = 180
      Width = 78
      Height = 13
      Caption = 'State Low Alarm'
    end
    object lbl8: TLabel
      Left = 74
      Top = 207
      Width = 80
      Height = 13
      Caption = 'State High Alarm'
    end
    object lbl9: TLabel
      Left = 54
      Top = 234
      Width = 100
      Height = 13
      Caption = 'State Highhigh Alarm'
    end
    object cbbStateElementDisabled: TComboBox
      Left = 176
      Top = 42
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 0
      OnSelect = cbbStateElementDisabledSelect
      Items.Strings = (
        'Disabled'
        'Enabled')
    end
    object cbbStateDisplayStationary: TComboBox
      Left = 176
      Top = 69
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 1
      OnSelect = cbbStateDisplayStationarySelect
      Items.Strings = (
        'Display stationary value'
        'Display value element')
    end
    object cbbStateAlarmInhibited: TComboBox
      Left = 176
      Top = 96
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 2
      OnSelect = cbbStateAlarmInhibitedSelect
      Items.Strings = (
        'Inhibited'
        'Not inhibited')
    end
    object cbbStateValueValid: TComboBox
      Left = 176
      Top = 123
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 3
      OnSelect = cbbStateValueValidSelect
      Items.Strings = (
        'Valid'
        'Invalid')
    end
    object cbbStateWireBreak: TComboBox
      Left = 176
      Top = 150
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 4
      OnSelect = cbbStateWireBreakSelect
      Items.Strings = (
        'Wire break'
        'No wire break')
    end
    object cbbStateLowAlarm: TComboBox
      Left = 176
      Top = 177
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 5
      OnSelect = cbbStateLowAlarmSelect
      Items.Strings = (
        'Low alarm'
        'No alarm')
    end
    object cbbStateHighAlarm: TComboBox
      Left = 176
      Top = 204
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 6
      OnSelect = cbbStateHighAlarmSelect
      Items.Strings = (
        'High alarm'
        'No alarm')
    end
    object cbbStateHighHighAlarm: TComboBox
      Left = 176
      Top = 231
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 7
      OnSelect = cbbStateHighhighAlarmSelect
      Items.Strings = (
        'Highhigh alarm'
        'No alarm')
    end
    object edtValueApplication: TEdit
      Tag = 1
      Left = 176
      Top = 15
      Width = 145
      Height = 21
      TabOrder = 8
      OnKeyPress = edtValueApplicationKeyPress
    end
  end
  object grpOutput: TGroupBox
    Left = 351
    Top = 86
    Width = 241
    Height = 177
    Caption = 'Output'
    TabOrder = 1
    object lbl10: TLabel
      Left = 18
      Top = 19
      Width = 56
      Height = 13
      Caption = 'State Alarm'
    end
    object lbl11: TLabel
      Left = 7
      Top = 46
      Width = 67
      Height = 13
      Caption = 'State Element'
    end
    object lbl12: TLabel
      Left = 7
      Top = 73
      Width = 67
      Height = 13
      Caption = 'Value Element'
    end
    object edtValueElement: TEdit
      Left = 88
      Top = 70
      Width = 145
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object edtStateAlarm: TEdit
      Left = 88
      Top = 16
      Width = 145
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object edtStateElement: TEdit
      Left = 88
      Top = 43
      Width = 145
      Height = 21
      ReadOnly = True
      TabOrder = 2
    end
  end
  object grpParameters: TGroupBox
    Left = 351
    Top = 0
    Width = 241
    Height = 80
    Caption = 'Parameters'
    TabOrder = 2
    object lbl13: TLabel
      Left = 62
      Top = 19
      Width = 12
      Height = 13
      Caption = 'SF'
    end
    object lbl14: TLabel
      Left = 55
      Top = 46
      Width = 19
      Height = 13
      Caption = 'STA'
    end
    object edtSF: TEdit
      Tag = 2
      Left = 88
      Top = 16
      Width = 145
      Height = 21
      ReadOnly = True
      TabOrder = 0
      OnKeyPress = edtValueApplicationKeyPress
    end
    object edtSTA: TEdit
      Tag = 3
      Left = 88
      Top = 43
      Width = 145
      Height = 21
      ReadOnly = True
      TabOrder = 1
      OnKeyPress = edtValueApplicationKeyPress
    end
  end
end
