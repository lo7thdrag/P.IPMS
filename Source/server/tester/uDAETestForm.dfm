object frmDAETest: TfrmDAETest
  Left = 0
  Top = 0
  Caption = 'DAE TEST'
  ClientHeight = 167
  ClientWidth = 271
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
    Top = 8
    Width = 257
    Height = 97
    Caption = 'Input'
    TabOrder = 0
    object lbl1: TLabel
      Left = 33
      Top = 31
      Width = 47
      Height = 13
      Caption = 'Command'
    end
    object lbl2: TLabel
      Left = 54
      Top = 55
      Width = 26
      Height = 13
      Caption = 'State'
    end
    object cbbCommand: TComboBox
      Left = 104
      Top = 25
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 0
      OnSelect = cbbCommandSelect
      Items.Strings = (
        'Disabled'
        'Enabled')
    end
    object cbbState: TComboBox
      Left = 103
      Top = 52
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 1
      OnSelect = cbbStateSelect
      Items.Strings = (
        'State 1'
        'State 2'
        'State 3'
        'State 4'
        'State 5'
        'State 6'
        'State 7'
        'State 8'
        'State 9'
        'State 10'
        'State 11'
        'State 12'
        'State 13'
        'State 14'
        'State 15')
    end
  end
  object grpOutput: TGroupBox
    Left = 8
    Top = 111
    Width = 257
    Height = 50
    Caption = 'OUTPUT'
    TabOrder = 1
    object lbl3: TLabel
      Left = 13
      Top = 19
      Width = 67
      Height = 13
      Caption = 'State Element'
    end
    object edtStateElement: TEdit
      Left = 103
      Top = 16
      Width = 145
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
  end
end
