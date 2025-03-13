object frmPointView: TfrmPointView
  Left = 0
  Top = 0
  Align = alCustom
  BorderStyle = bsToolWindow
  ClientHeight = 411
  ClientWidth = 319
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object tv1: TTreeView
    Left = 8
    Top = 41
    Width = 293
    Height = 312
    Indent = 19
    TabOrder = 0
  end
  object btnClose: TButton
    Left = 64
    Top = 372
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 1
    OnClick = btnCloseClick
  end
  object btnHelp: TButton
    Left = 160
    Top = 372
    Width = 75
    Height = 25
    Align = alCustom
    Caption = 'Help'
    Enabled = False
    TabOrder = 2
    OnClick = btnHelpClick
  end
  object btn1: TButton
    Left = 8
    Top = 10
    Width = 25
    Height = 25
    TabOrder = 3
  end
  object btn2: TButton
    Left = 39
    Top = 10
    Width = 25
    Height = 25
    TabOrder = 4
  end
  object btn3: TButton
    Left = 70
    Top = 10
    Width = 25
    Height = 25
    TabOrder = 5
  end
  object btn4: TButton
    Left = 101
    Top = 10
    Width = 25
    Height = 25
    TabOrder = 6
  end
  object btn5: TButton
    Left = 132
    Top = 10
    Width = 25
    Height = 25
    TabOrder = 7
  end
end
