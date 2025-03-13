object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'New Point'
  ClientHeight = 192
  ClientWidth = 441
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
    Top = 17
    Width = 42
    Height = 13
    Caption = 'Point ID:'
  end
  object edt1: TEdit
    Left = 80
    Top = 14
    Width = 265
    Height = 21
    TabOrder = 0
  end
  object btn1: TButton
    Left = 351
    Top = 12
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 1
  end
  object pnl1: TPanel
    Left = 16
    Top = 49
    Width = 329
    Height = 73
    BorderStyle = bsSingle
    TabOrder = 2
    object rb1: TRadioButton
      Left = 16
      Top = 16
      Width = 113
      Height = 17
      Caption = 'Device'
      TabOrder = 0
    end
    object rb2: TRadioButton
      Left = 16
      Top = 39
      Width = 113
      Height = 17
      Caption = 'Virtual'
      TabOrder = 1
    end
    object edt2: TEdit
      Left = 85
      Top = 14
      Width = 172
      Height = 21
      TabOrder = 2
    end
    object btn2: TButton
      Left = 268
      Top = 14
      Width = 21
      Height = 21
      TabOrder = 3
    end
    object btn3: TButton
      Left = 295
      Top = 14
      Width = 21
      Height = 21
      Caption = '>'
      TabOrder = 4
    end
  end
  object pnl2: TPanel
    Left = 16
    Top = 136
    Width = 209
    Height = 41
    BorderStyle = bsSingle
    TabOrder = 3
    object rb3: TRadioButton
      Left = 10
      Top = 8
      Width = 115
      Height = 17
      Caption = 'Analog'
      TabOrder = 0
    end
    object rb4: TRadioButton
      Left = 77
      Top = 8
      Width = 113
      Height = 17
      Caption = 'Boolean'
      TabOrder = 1
    end
    object rb5: TRadioButton
      Left = 149
      Top = 8
      Width = 41
      Height = 17
      Caption = 'text'
      TabOrder = 2
    end
  end
  object btn4: TButton
    Left = 351
    Top = 43
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 4
  end
  object pnl13: TPanel
    Left = 26
    Top = 43
    Width = 32
    Height = 13
    BevelOuter = bvNone
    Caption = 'Type'
    ParentBackground = False
    TabOrder = 5
  end
  object pnl3: TPanel
    Left = 26
    Top = 129
    Width = 32
    Height = 13
    BevelOuter = bvNone
    Caption = 'Class'
    ParentBackground = False
    TabOrder = 6
  end
end
