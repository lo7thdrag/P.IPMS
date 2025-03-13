object frmEdtAttribute: TfrmEdtAttribute
  Left = 0
  Top = 0
  Caption = 'Attribute Set - sesuai dengan pilihan'
  ClientHeight = 379
  ClientWidth = 427
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
    Top = 18
    Width = 57
    Height = 13
    Caption = 'Description:'
  end
  object edt1: TEdit
    Left = 79
    Top = 15
    Width = 306
    Height = 21
    TabOrder = 0
  end
  object dbgrd1: TDBGrid
    Left = 16
    Top = 49
    Width = 399
    Height = 280
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Field Name'
        Width = 146
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Field Start'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Field Size'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        Visible = True
      end>
  end
  object btn1: TButton
    Left = 16
    Top = 346
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 2
  end
  object btn2: TButton
    Left = 97
    Top = 346
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 3
  end
  object btn3: TButton
    Left = 178
    Top = 346
    Width = 75
    Height = 25
    Caption = 'Add'
    TabOrder = 4
  end
  object btn4: TButton
    Left = 259
    Top = 346
    Width = 75
    Height = 25
    Caption = 'Delete'
    TabOrder = 5
  end
  object btn5: TButton
    Left = 340
    Top = 346
    Width = 75
    Height = 25
    Caption = 'Properties'
    TabOrder = 6
  end
end
