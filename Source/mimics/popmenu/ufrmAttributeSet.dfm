object frmNewAttribute: TfrmNewAttribute
  Left = 0
  Top = 0
  Caption = 'New Attribute Set'
  ClientHeight = 342
  ClientWidth = 384
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mm1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 16
    Top = 18
    Width = 92
    Height = 13
    Caption = 'Attribute Set Name'
  end
  object lbl2: TLabel
    Left = 16
    Top = 46
    Width = 53
    Height = 13
    Caption = 'Description'
  end
  object lbl7: TLabel
    Left = 16
    Top = 286
    Width = 99
    Height = 13
    Caption = 'Records Retrieved : '
  end
  object lblRecord: TLabel
    Left = 124
    Top = 286
    Width = 6
    Height = 13
    Caption = '0'
  end
  object edt1: TEdit
    Left = 128
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edt2: TEdit
    Left = 128
    Top = 43
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object btn1: TButton
    Left = 280
    Top = 13
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 2
  end
  object btn2: TButton
    Left = 280
    Top = 44
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 3
  end
  object btn3: TButton
    Left = 280
    Top = 75
    Width = 75
    Height = 25
    Caption = 'Browse'
    TabOrder = 4
  end
  object dbgrd1: TDBGrid
    Left = 16
    Top = 109
    Width = 344
    Height = 169
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Attribute Set Name'
        Width = 182
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Description'
        Width = 327
        Visible = True
      end>
  end
  object mm1: TMainMenu
    Left = 336
    Top = 288
    object File1: TMenuItem
      Caption = 'File'
      object Exit1: TMenuItem
        Caption = 'Exit'
      end
    end
    object View1: TMenuItem
      Caption = 'View'
      object FieldChooser1: TMenuItem
        Caption = 'Field Chooser'
      end
      object AutoBrowse1: TMenuItem
        Caption = 'Auto Browse'
      end
      object LargeIcons1: TMenuItem
        Caption = 'Large Icons'
      end
      object List1: TMenuItem
        Caption = 'List'
      end
      object Details1: TMenuItem
        Caption = 'Details'
      end
      object ree1: TMenuItem
        Caption = 'Tree'
      end
    end
  end
end
