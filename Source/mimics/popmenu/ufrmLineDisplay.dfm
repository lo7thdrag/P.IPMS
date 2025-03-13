object frmLineDisplay: TfrmLineDisplay
  Left = 0
  Top = 0
  Caption = 'Line Display'
  ClientHeight = 372
  ClientWidth = 289
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
    Left = 11
    Top = 32
    Width = 28
    Height = 13
    Caption = 'Style:'
  end
  object lbl2: TLabel
    Left = 11
    Top = 59
    Width = 32
    Height = 13
    Caption = 'Width:'
  end
  object lbl3: TLabel
    Left = 11
    Top = 88
    Width = 53
    Height = 13
    Caption = 'Expansion:'
  end
  object lbl4: TLabel
    Left = 11
    Top = 113
    Width = 65
    Height = 13
    Caption = 'Compression:'
  end
  object cbb1: TComboBox
    Left = 131
    Top = 110
    Width = 145
    Height = 21
    TabOrder = 0
  end
  object cbb2: TComboBox
    Left = 131
    Top = 83
    Width = 145
    Height = 21
    TabOrder = 1
  end
  object cbb3: TComboBox
    Left = 131
    Top = 56
    Width = 145
    Height = 21
    TabOrder = 2
  end
  object cbb4: TComboBox
    Left = 131
    Top = 29
    Width = 145
    Height = 21
    TabOrder = 3
  end
  object pnl1: TPanel
    Left = 11
    Top = 161
    Width = 265
    Height = 160
    BorderStyle = bsSingle
    TabOrder = 4
  end
  object btn1: TButton
    Left = 11
    Top = 331
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 5
  end
  object btn2: TButton
    Left = 201
    Top = 331
    Width = 75
    Height = 25
    Caption = 'Help'
    TabOrder = 6
  end
  object btn3: TButton
    Left = 107
    Top = 331
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 7
  end
  object chk1: TCheckBox
    Left = 131
    Top = 138
    Width = 100
    Height = 17
    Caption = 'Hidden'
    TabOrder = 8
  end
end
