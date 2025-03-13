object frmSEETest: TfrmSEETest
  Left = 0
  Top = 0
  Caption = 'SEE TEST'
  ClientHeight = 265
  ClientWidth = 325
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
    Width = 305
    Height = 113
    Caption = 'Input'
    TabOrder = 0
    object lbl1: TLabel
      Left = 44
      Top = 23
      Width = 78
      Height = 13
      Caption = 'Command Reset'
    end
    object lbl2: TLabel
      Left = 65
      Top = 52
      Width = 57
      Height = 13
      Caption = 'Event Input'
    end
    object lbl3: TLabel
      Left = 12
      Top = 79
      Width = 110
      Height = 13
      Caption = 'State Element Disabled'
    end
    object cbbCommandReset: TComboBox
      Left = 144
      Top = 20
      Width = 145
      Height = 21
      TabOrder = 0
      Text = 'Not activated'
      OnSelect = cbbCommandResetSelect
      Items.Strings = (
        'Not activated'
        'Activated')
    end
    object cbbEventInput: TComboBox
      Left = 144
      Top = 49
      Width = 145
      Height = 21
      TabOrder = 1
      Text = 'Not activated'
      OnSelect = cbbEventInputSelect
      Items.Strings = (
        'Not activated'
        'Activated')
    end
    object cbbStateElementDisabled: TComboBox
      Left = 144
      Top = 76
      Width = 145
      Height = 21
      TabOrder = 2
      Text = 'Disabled'
      OnSelect = cbbStateElementDisabledSelect
      Items.Strings = (
        'Disabled'
        'Enabled')
    end
  end
  object grpOutput: TGroupBox
    Left = 8
    Top = 170
    Width = 305
    Height = 87
    Caption = 'Output'
    TabOrder = 1
    object lbl4: TLabel
      Left = 53
      Top = 28
      Width = 67
      Height = 13
      Caption = 'State Element'
    end
    object lbl5: TLabel
      Left = 53
      Top = 55
      Width = 67
      Height = 13
      Caption = 'Value Element'
    end
    object edtValueElement: TEdit
      Left = 144
      Top = 52
      Width = 144
      Height = 21
      TabOrder = 0
    end
    object edtStateElement: TEdit
      Left = 144
      Top = 25
      Width = 144
      Height = 21
      TabOrder = 1
    end
  end
  object grpParameters: TGroupBox
    Left = 8
    Top = 119
    Width = 305
    Height = 45
    Caption = 'Parameters'
    TabOrder = 2
    object lbl6: TLabel
      Left = 82
      Top = 18
      Width = 38
      Height = 13
      Caption = 'OFFSET'
    end
    object edtOFFSET: TEdit
      Left = 144
      Top = 15
      Width = 144
      Height = 21
      TabOrder = 0
      OnKeyPress = edtOFFSETKeyPress
    end
  end
end
