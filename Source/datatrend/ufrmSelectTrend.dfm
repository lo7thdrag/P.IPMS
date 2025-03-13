object frmSelectTrend: TfrmSelectTrend
  Left = 0
  Top = 0
  Align = alCustom
  BorderStyle = bsToolWindow
  Caption = 'Select Trend Signal'
  ClientHeight = 284
  ClientWidth = 249
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
    Top = 16
    Width = 60
    Height = 13
    Caption = 'Signal Class:'
  end
  object cbbSignal: TComboBox
    Left = 16
    Top = 35
    Width = 201
    Height = 21
    ItemIndex = 0
    TabOrder = 0
    Text = 'Analoge'
    Items.Strings = (
      'Analoge'
      'Digital')
  end
  object lst1: TListBox
    Left = 16
    Top = 62
    Width = 201
    Height = 155
    ItemHeight = 13
    TabOrder = 1
  end
  object btnCancel: TButton
    Left = 36
    Top = 230
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 2
  end
  object btnOk: TButton
    Left = 124
    Top = 230
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 3
  end
end
