object frmRHETest: TfrmRHETest
  Left = 0
  Top = 0
  Caption = 'RHE TEST'
  ClientHeight = 264
  ClientWidth = 310
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
    Width = 289
    Height = 105
    Caption = 'Input'
    TabOrder = 0
    object lbl1: TLabel
      Left = 39
      Top = 15
      Width = 78
      Height = 13
      Caption = 'Command Reset'
    end
    object lbl2: TLabel
      Left = 39
      Top = 44
      Width = 78
      Height = 13
      Caption = 'Enable Counting'
    end
    object lbl3: TLabel
      Left = 7
      Top = 71
      Width = 110
      Height = 13
      Caption = 'State Element Disabled'
    end
    object cbbCommandReset: TComboBox
      Left = 133
      Top = 12
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 0
      OnSelect = cbbCommandResetSelect
      Items.Strings = (
        'Activated'
        'Not activated')
    end
    object cbbEnableCounting: TComboBox
      Left = 133
      Top = 41
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 1
      OnSelect = cbbEnableCountingSelect
      Items.Strings = (
        'Not enabled'
        'Enabled')
    end
    object cbbStateElementDisabled: TComboBox
      Left = 133
      Top = 68
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 2
      OnSelect = cbbStateElementDisabledSelect
      Items.Strings = (
        'Disabled'
        'Enabled')
    end
  end
  object grpOutput: TGroupBox
    Left = 8
    Top = 175
    Width = 289
    Height = 82
    Caption = 'Output'
    TabOrder = 1
    object lbl4: TLabel
      Left = 50
      Top = 20
      Width = 67
      Height = 13
      Caption = 'State Element'
    end
    object lbl5: TLabel
      Left = 50
      Top = 47
      Width = 67
      Height = 13
      Caption = 'Value Element'
    end
    object edtValueElement: TEdit
      Left = 133
      Top = 44
      Width = 145
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object edtStateElement: TEdit
      Left = 133
      Top = 17
      Width = 145
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
  end
  object grp1: TGroupBox
    Left = 8
    Top = 111
    Width = 289
    Height = 58
    Caption = 'Parameter'
    TabOrder = 2
    object lbl6: TLabel
      Left = 50
      Top = 20
      Width = 38
      Height = 13
      Caption = 'OFFSET'
    end
    object edtOFFSET: TEdit
      Tag = 1
      Left = 133
      Top = 17
      Width = 145
      Height = 21
      Alignment = taRightJustify
      NumbersOnly = True
      ReadOnly = True
      TabOrder = 0
      Text = '0'
      OnKeyPress = edtOFFSETKeyPress
    end
  end
end
