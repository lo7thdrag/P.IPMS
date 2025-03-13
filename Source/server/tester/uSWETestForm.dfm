object frmSWETest: TfrmSWETest
  Left = 0
  Top = 0
  Caption = 'SWE TEST'
  ClientHeight = 240
  ClientWidth = 576
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
    Left = 4
    Top = 58
    Width = 313
    Height = 87
    Caption = 'Input'
    TabOrder = 0
    object lbl1: TLabel
      Left = 18
      Top = 23
      Width = 110
      Height = 13
      Caption = 'State Element Disabled'
    end
    object lbl2: TLabel
      Left = 57
      Top = 50
      Width = 71
      Height = 13
      Caption = 'State Inhibited'
    end
    object cbbStateElementDisabled: TComboBox
      Left = 144
      Top = 20
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 0
      OnSelect = cbbStateElementDisabledSelect
      Items.Strings = (
        'Disabled'
        'Enabled')
    end
    object cbbStateAlarmInhibited: TComboBox
      Left = 144
      Top = 47
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 1
      OnSelect = cbbStateAlarmInhibitedSelect
      Items.Strings = (
        'Inhibited'
        'Not inhibited')
    end
  end
  object grpOutput: TGroupBox
    Left = 4
    Top = 151
    Width = 313
    Height = 81
    Caption = 'Output'
    TabOrder = 1
    object lbl3: TLabel
      Left = 72
      Top = 20
      Width = 56
      Height = 13
      Caption = 'State Alarm'
    end
    object lbl4: TLabel
      Left = 61
      Top = 47
      Width = 67
      Height = 13
      Caption = 'State Element'
    end
    object edtStateAlarm: TEdit
      Left = 144
      Top = 17
      Width = 145
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object edtStateElement: TEdit
      Left = 144
      Top = 44
      Width = 145
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
  end
  object grpParameters: TGroupBox
    Left = 323
    Top = 4
    Width = 242
    Height = 228
    Caption = 'Parameters'
    TabOrder = 2
    object lbl5: TLabel
      Left = 24
      Top = 20
      Width = 33
      Height = 13
      Caption = 'NO/NC'
    end
    object lbl6: TLabel
      Left = 28
      Top = 47
      Width = 29
      Height = 13
      Caption = 'MODE'
    end
    object lbl7: TLabel
      Left = 20
      Top = 74
      Width = 37
      Height = 13
      Caption = 'TDELAY'
    end
    object edtTDELAY: TEdit
      Tag = 1
      Left = 80
      Top = 71
      Width = 145
      Height = 21
      ReadOnly = True
      TabOrder = 0
      OnKeyPress = edtNONCKeyPress
    end
    object cbbMode: TComboBox
      Left = 80
      Top = 44
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 1
      OnSelect = cbbModeSelect
      Items.Strings = (
        'Alarm'
        'No Alarm')
    end
    object cbbNONC: TComboBox
      Left = 80
      Top = 17
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 2
      OnSelect = cbbNONCSelect
      Items.Strings = (
        'NO'
        'NC')
    end
  end
  object grp1: TGroupBox
    Left = 4
    Top = 4
    Width = 313
    Height = 52
    Caption = 'Platform'
    TabOrder = 3
    object lbl9: TLabel
      Left = 89
      Top = 20
      Width = 39
      Height = 13
      Caption = 'In State'
    end
    object cbbInStatePlatform: TComboBox
      Left = 144
      Top = 17
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 0
      OnSelect = cbbInStatePlatformSelect
      Items.Strings = (
        'False'
        'True')
    end
  end
end
