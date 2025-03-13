object frmSS2Test: TfrmSS2Test
  Left = 0
  Top = 0
  Caption = 'SS2 TEST'
  ClientHeight = 276
  ClientWidth = 562
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
    Height = 137
    Caption = 'Input'
    TabOrder = 0
    object lbl1: TLabel
      Left = 77
      Top = 26
      Width = 81
      Height = 13
      Caption = 'Value Application'
    end
    object lbl2: TLabel
      Left = 49
      Top = 53
      Width = 110
      Height = 13
      Caption = 'State Element Disabled'
    end
    object lbl3: TLabel
      Left = 57
      Top = 80
      Width = 101
      Height = 13
      Caption = 'State Alarm Inhibited'
    end
    object lbl4: TLabel
      Left = 13
      Top = 107
      Width = 145
      Height = 13
      Caption = 'State Display Stationary Value'
    end
    object cbbStateElementDisabled: TComboBox
      Left = 176
      Top = 50
      Width = 145
      Height = 21
      TabOrder = 0
      Text = 'Disabled'
      OnSelect = cbbStateElementDisabledSelect
      Items.Strings = (
        'Disabled'
        'Enabled')
    end
    object edtValueApplication: TEdit
      Left = 176
      Top = 23
      Width = 145
      Height = 21
      TabOrder = 1
      OnKeyPress = edtValueApplicationKeyPress
    end
    object cbbStateAlarmInhibited: TComboBox
      Left = 176
      Top = 77
      Width = 145
      Height = 21
      TabOrder = 2
      Text = 'Not inhibited'
      OnSelect = cbbStateAlarmInhibitedSelect
      Items.Strings = (
        'Not inhibited'
        'Inhibited')
    end
    object cbbStateDisplayStationary: TComboBox
      Left = 176
      Top = 104
      Width = 145
      Height = 21
      TabOrder = 3
      Text = 'Display stationary value'
      OnSelect = cbbStateDisplayStationarySelect
      Items.Strings = (
        'Display stationary value'
        'Display sensor value (scaled)')
    end
  end
  object grpOutput: TGroupBox
    Left = 8
    Top = 143
    Width = 337
    Height = 130
    Caption = 'Output'
    TabOrder = 1
    object lbl5: TLabel
      Left = 102
      Top = 18
      Width = 56
      Height = 13
      Caption = 'State Alarm'
    end
    object lbl6: TLabel
      Left = 92
      Top = 45
      Width = 67
      Height = 13
      Caption = 'State Element'
    end
    object lbl7: TLabel
      Left = 91
      Top = 72
      Width = 67
      Height = 13
      Caption = 'Value Element'
    end
    object lbl8: TLabel
      Left = 77
      Top = 99
      Width = 81
      Height = 13
      Caption = 'Value Application'
    end
    object edtValueElement: TEdit
      Left = 176
      Top = 69
      Width = 145
      Height = 21
      TabOrder = 0
    end
    object edtValueApplicationOutput: TEdit
      Left = 176
      Top = 96
      Width = 145
      Height = 21
      TabOrder = 1
    end
    object edtStateAlarm: TEdit
      Left = 176
      Top = 15
      Width = 145
      Height = 21
      TabOrder = 2
    end
    object edtStateElement: TEdit
      Left = 176
      Top = 42
      Width = 145
      Height = 21
      TabOrder = 3
    end
  end
  object grpParameters: TGroupBox
    Left = 351
    Top = 0
    Width = 209
    Height = 273
    Caption = 'Parameters'
    TabOrder = 2
    object lbl9: TLabel
      Left = 24
      Top = 26
      Width = 20
      Height = 13
      Caption = 'HAV'
    end
    object lbl10: TLabel
      Left = 17
      Top = 53
      Width = 27
      Height = 13
      Caption = 'HHAV'
    end
    object lbl11: TLabel
      Left = 18
      Top = 80
      Width = 26
      Height = 13
      Caption = 'XHAV'
    end
    object lbl12: TLabel
      Left = 31
      Top = 107
      Width = 13
      Height = 13
      Caption = 'HY'
    end
    object lbl13: TLabel
      Left = 31
      Top = 134
      Width = 13
      Height = 13
      Caption = 'TA'
    end
    object lbl14: TLabel
      Left = 25
      Top = 161
      Width = 19
      Height = 13
      Caption = 'STA'
    end
    object edtHAV: TEdit
      Tag = 1
      Left = 64
      Top = 23
      Width = 121
      Height = 21
      TabOrder = 0
      OnKeyPress = edtHAVKeyPress
    end
    object edtHHAV: TEdit
      Tag = 2
      Left = 64
      Top = 50
      Width = 121
      Height = 21
      TabOrder = 1
      OnKeyPress = edtHAVKeyPress
    end
    object edtXHAV: TEdit
      Tag = 3
      Left = 64
      Top = 77
      Width = 121
      Height = 21
      TabOrder = 2
      OnKeyPress = edtHAVKeyPress
    end
    object edtHY: TEdit
      Tag = 4
      Left = 64
      Top = 104
      Width = 121
      Height = 21
      TabOrder = 3
      OnKeyPress = edtHAVKeyPress
    end
    object edtTA: TEdit
      Tag = 5
      Left = 64
      Top = 131
      Width = 121
      Height = 21
      TabOrder = 4
      OnKeyPress = edtHAVKeyPress
    end
    object edtSTA: TEdit
      Tag = 6
      Left = 64
      Top = 158
      Width = 121
      Height = 21
      TabOrder = 5
      OnKeyPress = edtHAVKeyPress
    end
  end
end
