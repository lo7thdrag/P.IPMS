object frmLineMap: TfrmLineMap
  Left = 0
  Top = 0
  Caption = 'Line-Axis Mapping'
  ClientHeight = 221
  ClientWidth = 345
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 16
    Top = 24
    Width = 96
    Height = 13
    Caption = 'Show  lines for axis:'
  end
  object lbl2: TLabel
    Left = 16
    Top = 42
    Width = 28
    Height = 15
    Caption = 'Lines:'
  end
  object lbl3: TLabel
    Left = 199
    Top = 63
    Width = 88
    Height = 13
    Caption = 'Configured X axis:'
  end
  object lbl4: TLabel
    Left = 199
    Top = 117
    Width = 97
    Height = 13
    Caption = 'Configured Y axis:'
  end
  object cbbShowLine: TComboBox
    Left = 136
    Top = 21
    Width = 201
    Height = 21
    TabOrder = 0
  end
  object mmoLine: TMemo
    Left = 16
    Top = 63
    Width = 169
    Height = 114
    Lines.Strings = (
      '')
    TabOrder = 1
  end
  object cbbXaxis: TComboBox
    Left = 199
    Top = 82
    Width = 138
    Height = 21
    TabOrder = 2
  end
  object cbbYaxis: TComboBox
    Left = 199
    Top = 136
    Width = 138
    Height = 21
    TabOrder = 3
  end
  object btnOk: TButton
    Left = 29
    Top = 188
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 4
  end
  object btnCancel: TButton
    Left = 141
    Top = 188
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 5
  end
  object btnHelp: TButton
    Left = 248
    Top = 188
    Width = 75
    Height = 25
    Caption = 'Help'
    TabOrder = 6
  end
end
